# Arithmetic Dirichlet series and Tauberian methods, Part II: analytic number theory and zeta functions

This part develops `AnalyticNumberTheory:AN.8` and `AnalyticNumberTheory:AN.9`. It extends [ArithmeticDirichletSeries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries): arithmetic coefficient carriers, ideal norms and ordinary Dirichlet-series theory are inputs. The two layers connect those inputs to several-variable continuation, binary-cubic zeta functions, scalar spectral determinants and the Bost–Connes system. Their declaration catalog gives the mathematical specification, direct prerequisites, proof routes, definition APIs and discriminating tests. The [suggested file](../suggested/AnalyticNumberTheory--AN.8.lean) proposes native signatures; the [packet](../packets/AnalyticNumberTheory--AN.8.json) records the dependency graph.

Both layers have planned coverage. Their targets and proof chains are specified, but the source and supplier obligations listed below prevent closed coverage. All declarations have unchecked implementation status. A native prototype on genuine parameter data does not construct its canonical arithmetic or geometric adapter.

## Inputs and ownership

The historical baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib already supplies Dirichlet characters and their continued L-functions, Jacobi reciprocity, Gamma functions, Mellin transforms, measures and probability products, finite adeles, bounded Hilbert operators and C*-GNS. Tau Ceti already supplies the Hecke ring and its single-product multiplicities. These are imported under their existing names.

The current upstream roadmaps supply further interfaces. ProfiniteArithmetic owns the profinite integer ring, its p-adic product, units and compatible finite-character lifting. RestrictedProducts owns the general restricted-product topology and integral compact-open subsets. GlobalNumberFields Layer 4 supplies finite-adele arithmetic; Layer 10 supplies finite cyclotomic Galois identifications and their restrictions. OperatorTheory owns operator ideals, Hilbert projections, functional calculus and self-adjoint spectral theory. Current Tau Ceti also has character-space representation of positive functionals and compactness of integral finite adeles. These current inputs have separate source receipts; using them with the historical baseline requires the explicit integration reconciliation below.

General crossed products, algebraic bounded-generator GNS, KMS completion and nonsingular factor classification extend the current operator-theory direction. Their six exact contracts belong to **Operator theory, Part II: C*-dynamics and nonsingular factors**. This part owns the Bost–Connes specialization, its arithmetic measures, witnesses and symmetry comparisons. It imports the general contracts and does not attribute them to an existing upstream layer that lacks them.

The upstream order puts AnalyticNumberTheory and ArithmeticStatistics in the tier-14 bundle. AdelicAlgebraicGroups, AutomorphicLFunctionsAndLocalFactors and AutomorphicSpectralTheory are lower suppliers. The primitive quadratic large sieve moves from the higher sieve direction to `ArithmeticStatistics:ST.2`; the double-series moment uses that supplier. The PNT input in `AnalyticNumberTheory:AN.2` instead serves prime-progression divergence and the ratio witnesses. Dropped AN.0, AN.1 and AN.6, retired LI.2 and a general global Artin theorem are outside these proof chains.

## AN.8: quadratic double Dirichlet series

Use the four real characters modulo eight in the order ψ₁, ψ₋₁, ψ₂, ψ₋₂. Their rows on 1,3,5,7 are

| Character | 1 | 3 | 5 | 7 |
|---|---:|---:|---:|---:|
| ψ₁ | 1 | 1 | 1 | 1 |
| ψ₋₁ | 1 | −1 | 1 | −1 |
| ψ₂ | 1 | −1 | −1 | 1 |
| ψ₋₂ | 1 | 1 | −1 | −1 |

All four vanish on even integers. For odd positive d, let χ_d(n) be the Jacobi symbol and remove the Euler factor at two from every L-function. The initial series is

\[
 Z_{i,j}(s,w)=\zeta_2(2s+2w-1)
 \sum_{d>0\;\mathrm{odd}} L_2(s,\chi_d\psi_i)\psi_j(d)d^{-w}.
\]

Its initial double sum is absolutely and compact-normally convergent for Re s>1 and Re w>1. The odd squarefree decomposition d=d₀k² is unique; deleting primes dividing k gives the exact imprimitive Euler factors. Summing k first produces the squarefree expression and its L₂(s+2w) denominator. Nonvanishing and a reciprocal bound come from the absolutely convergent Euler product.

The analytic estimates use Mathlib's continued `DirichletCharacter.LFunction`. Its `LSeries` is the defining convergent series and is totalized outside that convergence region. Substituting that totalized series into a critical-line moment would give the wrong mathematical object. Define the continued odd twist first and compare it to the initial series on Re s>1. For the principal twist, the analytic function extending (s−1)L₂(s) has the deleted-Euler residue at s=1; its value there is retained. For example, discriminants 1 and 9 give residue values 1/2 and 1/3. Nonprincipal twists give zero in that pole clearance.

The primitive character associated with χ_d₀ψ_i has conductor qᵢ,η d₀, where η=d₀ mod 8. The power-of-two factor q is eight for the last two twists; for the first two it is one or four according to the signed fundamental discriminant. The parities are 0,1,0,1. At conductor factor one the primitive value at two is +1 for η=1,7 and −1 for η=3,5; otherwise that value is zero. The fundamental-discriminant/Gauss-sum adapter proves that the quadratic root number is +1 and connects this table to the pinned primitive functional equation. Conductor one is included.

Heath-Brown's fourth moment for nonprincipal primitive real characters, followed by Hölder and the conductor count, gives the primitive first moment. The deleted square-factor bound transports it to every odd discriminant. The principal contribution uses continued odd zeta separately. A further lemma supplies constants uniform on each compact real strip for the pole-cleared first moment; pointwise constants indexed by the real part do not imply this uniform statement. These estimates give normal convergence of the cleared squarefree series on

\[
 R_1=\{(s,w):\Re w>1,\ \Re(s+w)>3/2\}.
\]

Quadratic reciprocity gives the constant 16×16 swap matrix A. Its entries use the four-character Hadamard transform and the sign (−1)^{ab}; A is symmetric and A²=1. The primitive functional equation gives a block reflection matrix B(s). In residue coordinates each block multiplies by

\[
 r_{i,\eta}(s)=
 (q/\pi)^{1/2-s}
 \frac{\Gamma((1-s+\kappa)/2)}{\Gamma((s+\kappa)/2)}
 \frac{1-e2^{-s}}{1-e2^{s-1}}.
\]

Transport back by H and Hᵀ/4. Fill removable values before evaluating B. On Re s<1 its entries are analytic: reciprocal Gamma removes denominator Gamma poles, and the remaining Euler denominator is nonzero. The principal block vanishes at zero, canceling the candidate reflected pole. The odd block has a nonzero test value 4/(3π), so treating the entire matrix as zero there is incorrect. These conventions follow Blomer §2.1, pp.358–359, and Lemma 2, pp.361–364.

The affine maps α(s,w)=(w,s) and β(s,w)=(1−s,s+w−1/2) are involutions, and αβ has order six. Glue the successive transported tubes by analytic identity on connected overlaps, tracking poles as germs. Starting at R₁, alternately union its current base with the α and β images through R₆. The complement is the closed twelve-gon specified in the catalog. Every vertex has squared radius at most three, so the connected real annulus 4<x²+y²<5 lies in the glued base and its convex hull covers the remaining region. R₄ alone has an unbounded complement.

The polar polynomial is P(s,w)=(s−1)(w−1)(s+w−3/2). Construct an entire Eᵢⱼ agreeing with PZᵢⱼ initially; the continued Z is E/P off P=0, with functional equations interpreted as meromorphic germs. Bochner extends an analytic function on a connected tube to the tube over its convex hull. A bound survives that extension: for each |a|>M extend 1/(f−a), then continue (F−a)G=1. On the annulus divide E by sufficiently high powers of 3+s and 3+w, whose zeros lie outside the real-part ball. This yields the bounded extension and the polynomial vertical growth. DGH Proposition 4.6, p.37 states Bochner but cites its proof externally; obtaining a permitted primary proof remains an explicit source obligation.

## AN.8: binary-cubic local and adelic zeta functions

Let V be binary cubic forms with the twisted GL₂ action g·f=det(g)⁻¹ f((u,v)g). The discriminant transforms by det(g)². The pairing is x₁y₄−x₂y₃/3+x₃y₂/3−x₄y₁. These choices fix the Fourier transform and prevent the determinant or dual-lattice factors from drifting.

For a characteristic-zero nonarchimedean local field, retain residue characteristics two and three. If coordinate self-dual Haar gives the integer ring mass q^{−e/2}, binary-cubic self-dual mass is |3|⁻¹q^{−2e}. Normalizing additive mass of O⁴ to one and GL₂(O) mass to one yields the orbital comparison constant (1−q⁻¹)(1−q⁻²). The covering degree is the actual stabilizer order: 6 for the split algebra, 2 for a quadratic factor, 3 for a cyclic cubic field, and 1 for a non-Galois cubic field. Local Haar mass is compared to arithmetic coefficients through that orbit map; it is not itself a global order count.

The generic local constructor integrates Φ(x)|Disc x|^s against an actual measure. Datskovsky–Wright's orbital convention instead uses exponent s−1. Keep this argument shift explicit. For the standard integral indicator and an unramified quasicharacter with u=ω(π), the five canonical orbital factors have denominator (1−qu³)(1−u²) and numerators

| Etale cubic type | Numerator |
|---|---|
| Split | (1+u)² |
| Unramified quadratic factor | 1+u² |
| Ramified quadratic factor | 1+u |
| Unramified cubic field | 1−u+u² |
| Ramified cubic field | 1 |

The auxiliary integrals have common denominator 1−u. Their proofs split the support into four, two, two, three and three valuation regions respectively. The cubic unramified sum is (1+u²+u⁴)/(1−u³), and the ramified sum is (1+u+u²)/(1−u³); these simplify to the displayed auxiliary forms. The different and wild discriminant stay in the orbital normalization. Datskovsky–Wright Theorem 3.1, pp.42–45 supplies this valuation calculation. Its nonarchimedean distribution functional equation invokes Igusa, and the real Fourier matrix invokes Shintani; those original proofs remain source obligations. The complex-place proof is read and supplies its explicit scalar comparison.

For a number field F, ordinary and trace-divisible dual Shintani series sum cubic O_F-orders with inverse automorphism weights and archimedean signatures. The carrier includes every locally free rank-three module and every ideal-class component. A parametrization over a PID or over free O_F³ alone is insufficient. Coefficient sums must be finite before defining their arithmetic Dirichlet series. ST.1 supplies the ring/form comparison and ST.0/ST.3 the coefficient finiteness and field-count inputs.

The adelic integral uses the **right quotient** GL₂(A_F)/GL₂(F), the determinant exponent 2s and the sum over nonsingular rational forms. Inverting to a left quotient changes the kernel to |det g|^{−2s}Φ(g⁻¹x). Wright's raw parameter is u=2s. The Schwartz lattice bound, Siegel-set majorant and determinant integration prove convergence for Re u>2. Unfold into rational orbits with their finite stabilizers and compare all integral ideal-class components. The generic native constructor accepts an actual quotient measure, determinant norm and theta; canonical unfolding requires their AA.2/AL.0/ST.1 adapters.

The full adelic continuation separates the |det|≥1 entire term and its Fourier-reflected partner. Poisson leaves singular zero, triple-root and double-root orbits. Compact averaging preserves the Schwartz space and intertwines Fourier with the inverse unitary determinant character. The one- and two-variable restrictions T₁Φ(t)=Φ(0,0,0,t) and T₂Φ(t)=∫Φ(0,0,t,u)du feed Tate continuation. Their residue distributions Σ₁ and Σ₂ are evaluated at 2/3 and −1.

Smooth the rank-one GL₂ Eisenstein function using a vertically decreasing entire ψ. Its normalized residue is ρ₀=Res Z_F(1)/Z_F(2). Triple-root unfolding gives the factor 1/3 and the w=2,3 residues; double-root unfolding gives the w=2,3,4 residues. Fourier inversion cancels the w=3 and w=4 terms in the singular difference. Determinant scaling then gives the rational correction I(Φ,u) stated in the catalog. Its raw poles are u=0,1/3,5/3,2, and its functional equation is u↦2−u. Converting a residue from u to s=u/2 divides it by two. Wright §5, pp.520–522 and §6, pp.523–533 provide these global proofs, with the reduction and normalized Eisenstein inputs requested from AA.2 and AS.2.

After local and archimedean comparison, write n=[F:Q] and D=|Disc F|. The ordinary/dual equation is

\[
 \xi_{F,\alpha}(1-s)=
 \left[3^{6s-2}\pi^{-4s}\Gamma(s)^2
 \Gamma(s-1/6)\Gamma(s+1/6)\right]^n
 D^{4s-2}\sum_\beta c_{\alpha\beta}(s)\widehat\xi_{F,\beta}(s).
\]

The arithmetic possible simple poles are 1 and 5/6. The entire clearance C=(s−1)(s−5/6)ξ retains its true pole limits, whose residues are 6C(1) and −6C(5/6). The catalog evaluates these limits in terms of ζ_F, its residue, the signature and discriminant. Establishing entire order at most one is a separate quantitative growth theorem; pole removal alone does not establish it. Datskovsky–Wright Theorem 6.2, pp.71–73 gives the target, while its full quantitative growth argument remains to acquire.

The Fourier matrix has vanishing order at least n at one and the dual series has at most a simple pole there. The Gamma/discriminant prefactor is a unit, hence ξ has vanishing order at least n−1 at zero. In particular the zero assertion requires n≥2. The orders-in-a-fixed-algebra series uses relative index exponent 2s, reflecting discriminant multiplication by index squared. Combining it with the ST uniform field count gives the right bound. Reflection gives D^{5/2−4σ+ε} on σ<−1/2; strip interpolation gives D^{7/2−2σ+ε}. The uniform vertical assertions use |t|≥1 and exclude the two arithmetic poles. These are the LOWW §3.2, pp.12–14 conventions.

## AN.9: compact scalar spectral and Selberg zeta

Select connected, compact, oriented, torsion-free hyperbolic surfaces of curvature −1 and genus g≥2, with area 4π(g−1). AS.4 supplies the scalar Laplacian and a monotone spectrum λ₀=0<λ₁≤λ₂≤⋯, finite multiplicities, a complete orthonormal eigenbasis, Weyl counting and a uniform full small-time heat expansion. Zero is simple. The geometric supplier constructs this data; the generic native heat contract describes it without asserting that an arbitrary sequence is a Laplace spectrum.

For the positive spectral zeta omit λ₀. Weyl counting gives summability for Re z>1. At large time H(t)−1 decays exponentially using λ₁ and monotonicity. At small time subtract N+1 heat terms. The meromorphic rational contribution is Σₖ₌₀ᴺ aₖ/(z+k−1)−1/z; the last term removes the zero mode and changes the constant coefficient to a₁−1. The remainder integral is locally uniformly holomorphic for Re z>−N. Reciprocal Gamma then gives regularity at zero. Define det′Δ=exp(−ζ₊′(0)) using that regularity, rather than differentiating the initial totalized spectral series.

For Re u>0 the shifted spectral function includes λ₀ and uses the principal logarithm of λ_j+u. Its continuation is jointly holomorphic where specified, regular at Mellin parameter zero, and obeys ∂_uζ_u(z)=−zζ_u(z+1). If F(z)=(z−1)ζ₊(z) near one, the canonical entire determinant is

\[
 D(u)=u\exp(-\zeta_+'(0)+F'(1)u)
 \prod_{j\ge1}(1+u/\lambda_j)\exp(-u/\lambda_j).
\]

The inverse-square eigenvalue sum gives compact-normal convergence of this genus-one product. Its zero at −λ has the eigenvalue multiplicity, and D(u)/u tends to det′Δ at zero. A separate finite determinant constructor checks finite products and zero modes; its tests supplement the actual infinite-family tests.

AS.6 supplies the primitive geodesic index, positive systole, exponential counts and its orientation convention, together with the Gaussian trace-test extension. On Re s>1 define Z by the primitive product. Expanding its logarithm and summing the geometric k-series gives the logarithmic derivative. The scalar heat trace has its identity integral and the hyperbolic sum with denominator 2sinh(mℓ/2). Its Laplace transform is initially justified on a cone with Re w>0 and Re(w²) sufficiently large, w=s−1/2. In particular Re s>1 alone is not a valid unrestricted complex Laplace domain. The explicit integral equals 2√π exp(−aw)/a; geometric counting justifies exchanging the sum, integral and parameter derivatives. JSS v2 §5, pp.16–19 and the full proof of Theorem 6.1, pp.20–24 supply the transform arguments.

Normalize Barnes G by G(1)=1, G(s+1)=Γ(s)G(s), its zero divisor and the stated asymptotic. The recurrence alone does not fix the needed function or determinant constant. With C=g−1 the single-valued scalar identity factor is

\[
 I_g(s)=(2\pi)^{2Cs}\exp(2Cs(1-s))
 \frac{\Gamma(s)^{2C}}{G(s+1)^{4C}}.
\]

Integer exponents remove logarithm branch choices. The determinant comparison uses the corrected v2 constant displayed in the catalog. It yields Z(1−s)=Z(s)I_g(s)/I_g(1−s). AN.7 supplies the normalized Barnes theory and its primary asymptotic proof; JSS §2.5, p.9 cites that input externally.

On 0<Re s<1 the identity factor is a holomorphic unit, so the nontrivial zeros of Z are exactly s(1−s)=λ>0. The pullback u=s(s−1) has a simple local root except at s=1/2. An eigenvalue 1/4 of multiplicity m therefore gives order 2m there; every other spectral root has order m. Small positive eigenvalues give real roots in (0,1), while eigenvalues above 1/4 give roots on Re s=1/2. The identity factor has pole order 2g−2 at zero, producing Z order 2g−1 at zero and order one at one. These endpoint zeros are distinguished from the nonzero spectral divisor.

## AN.9: Bost–Connes algebra, completed states and arithmetic

Inside GL₂(Q) use matrices [1 b;0 a] with a>0 and the subgroup of integral translations. Their product is [1,b′+ba′;0,aa′] and inverse is [1,−b/a;0,1/a]. For a=n/m in lowest terms, every double coset has a unique coordinate (n,m,γ) with γ∈Q/Z represented by [1,γ/m;0,n/m]. Its left degree is m and its inverse degree is n. Thus L/R=1/a, fixing the sign of the modular dynamics.

The rational generators x_n, x′_n and e(γ) are the actual Hecke basis functions. Eight separate relations supply the presentation: left inverse, coprime commutation, dilation products and inverse products, torsion products, the two translation commutations, and the finite preimage sum. A general gcd product reduces to coprime normal forms; the fibre nδ=γ has exactly n elements. Those forms are the independent Hecke basis, proving both spanning and the universal algebraic presentation. Over C normalize μ_n=n^{−1/2}x_n. Their range projection is n⁻¹Σ_{nδ=0}e(δ), not one in general. The Hamiltonian/Gibbs representation on l²(N+) uses shifts and torsion-character diagonal operators and has Hε_k=log(k)ε_k, partition function ζ(β) for β>1.

The completion uses a separate Hilbert space l² of **right cosets**. For the kernel K_X(gH,hH)=1_X(g⁻¹h), row and column counts are L(X),R(X), giving operator norm at most √(LR). Applying convolution to the identity vector recovers all inverse-class coefficients, proving faithfulness before taking the norm closure. The closure is a genuine closed star subalgebra of bounded operators. The universal-norm argument bounds all generator representations by their coefficient l¹ sums; its algebraic GNS and completion are OP2-universal inputs.

On C(Ẑ), α_n is pullback by division by n on nẐ and zero elsewhere. Its minimal dilation is the rational action on C₀(A_f). The BC completion is the full corner at p=1_Ẑ of the crossed product; abelian rational dilations give full=reduced. Laca Theorems 2.1.1 and 2.2.1, pp.5–8 provide the dilation/corner proof. The exact general crossed-product and amenability interface is the OP2-dilation-corner contract, beyond the existing OperatorTheory roadmap.

Core evolution is τ_z(f)(g)=a(g)^{iz}f(g). Real time extends to a point-norm continuous star-automorphism group on the completion. Complex time is used on the dense entire core. The convention is the **+iβ** identity φ(aτ_{iβ}(b))=φ(ba). A completed KMS state is a norm-one positive continuous linear functional with bounded analytic correlations on the closed strip 0≤Im z≤β and the two specified boundary values. Dense-core equivalence uses a uniform norm bound on these functions and approximation of both arguments. An algebraic formula without this continuity and strip extension is insufficient.

The coefficient state is the identity-coset vector state and has completed KMS temperature β=1. For β>1 the Gibbs formula extends absolutely to the completion. Its value on the half-torsion generator is 2^{1−β}−1 and on the μ₂ range projection is 2^{−β}. The wrong complex-time sign fails the projection identity. KMS∞ is weak approximation by KMSβ with β arbitrarily large; a ground state instead has bounded upper-half-plane correlations. KMS∞ implies ground by a normal-family argument. The trivial-dynamics vector state on M₂(C) is ground but is not KMS∞: it distinguishes the two matrix-unit products, while KMS states for trivial dynamics are traces. The vector limits of BC Gibbs states have both predicates.

A normalized β-scaling measure is a Radon measure μ on the existing A_f with μ(Ẑ)=1 and μ(qE)=q^{−β}μ(E) for every positive rational q. It has no zero atom. The canonical local density against normalized additive Haar is proportional to |x|_p^{β−1}, with shell mass (1−p^{−β})p^{−kβ} for every integer k. At β=1 it is additive Haar. Mathlib already supplies the probability product; AA.0 connects the local normalized Haar and the restricted-product exhaustion to the actual finite-adele carrier.

For 0<β≤1, finite-prime conditional projections and local character density prove canonical ergodicity. The nontrivial finite character estimate needs divergence of the actual prime-progression reciprocal partial sums, supplied by AN.2; infinitude alone is inadequate. A dominated scaling-measure summand has a bounded invariant Radon–Nikodym density, proving canonical extremality. Averaging an arbitrary normalized scaling measure over compact units gives the canonical one; extremality and continuous cylinder tests force every translate, and then the original measure, to equal it. This proves uniqueness without assuming a general Choquet decomposition.

For β>1, units have mass ζ(β)⁻¹ and their positive rational translates cover almost all finite adeles. Normalize the unit restriction to a probability ν. The corner expectation gives mutually inverse scaling-measure and completed-state maps, and ν gives the unique Gibbs barycentre. The topology is weak measure convergence and pointwise weak evaluation on completed states. Thus the beta>1 parameter space is the compact unit group, the extreme states are the Gibbs states and the simplex is Bauer. The generic native barycentre theorem uses an actual compact parameter W with continuous torsion evaluations; its canonical identification with Ẑ× and its full weak-topology statement are separate adapters. Symmetry acts freely and transitively on the high-beta extreme boundary.

The type III₁ proof separates arithmetic and operator theory. Define the ratio set using ρ_g=d(g_*μ)/dμ **at the target**, with witnesses in A∩gA. For a two-prime valuation swap (0,1)→(1,0), forward cylinder mass ratio is (q/p)^β while the derivative of x↦(p/q)x is (p/q)^β. Its inverse supplies the desired ratio. Select disjoint prime pairs in fixed congruence classes with divergent source masses; independent tail witnesses and unit-residue lifting give every positive ratio. Closure includes zero. Neshveyev's proofs supply this arithmetic argument. OP2-factor supplies the general measured crossed-product, ergodic-center, ratio-set classification and nonzero-corner invariance theorems. Identifying the completed state GNS algebra with that von Neumann compression then proves type III₁ for 0<β≤1.

For the arithmetic form, the first Eisenstein function at Na=0 is the finite rational Fourier sum Σ_{k=1}^{N−1}(k/N−1/2)e(ka). At the degenerate argument it is zero. Define P₀=0, P₁=X and P_{k+1}=(X²−1/4)P′_k/k, then E_{k,a}=P_k(E_{1,a}). In particular E₂,₀=−1/4. Möbius inversion uses f_j(d)=Σ_{a|d}μ(a)(d/a)^j, fixing which factor is raised to j. The division formula gives the prime range projections; prime two uses the doubled-level identity π₂=3+2Σ_{4a=0}E₂,a.

In the e=1−π_p corner at level N=p^b, the power sums of the N−1 elements eE₁(j/N) lie in Qe. Import the pinned Newton identity to obtain their monic degree-N−1 polynomial. Zero and repeated roots remain in it. At an invertible lattice the roots are cot(πj/N)/(2i), all purely imaginary; 1/2 is not a root. The Bezout inverse and Cayley transform recover the complementary corner of e(1/N). Semigroup covariance supplies the other corner from the lower prime-power level, starting at e(0)=1. This recovers every torsion generator, the normalized rational arithmetic form and its complexification. Connes–Marcolli Lemmas 3.27–3.29 and Theorem 3.30, pp.464–470 give the complete chain.

Finally the KMS∞ vector values generate Qcycl. Compatible finite cyclotomic exponents identify the induced field action with the compact-unit symmetry on those values. GlobalNumberFields Layer 10 supplies finite cyclotomic identifications; this part checks their restriction compatibility and the Q/Z comparison. No global Artin existence assertion is required. The two rational forms are compared through τ_{−i/2}, with the normalized form and its involution conventions explicit.

## Declaration catalog

The entries are grouped by target and ordered by their direct dependency graph. Each definition or construction includes the API used by its consumers and tests of its normalization, degenerate inputs or compatibility. Each lemma or theorem has its precise mathematical statement and a proof route. Internal links name declarations of this part; external stage references are supplied by the ownership contracts below.

### AnalyticNumberTheory:AN.8 — Quadratic double Dirichlet series: primitive twists, pole-aware means, functional matrices and bounded tube continuation

<a id="characters-mod-eight"></a>
#### The four real characters modulo eight

**Definition** `TauCeti.SeveralVariableZeta.Characters8` · `AnalyticNumberTheory:AN.8/characters-mod-eight`.

Fix the row order ψ1,ψ−1,ψ2,ψ−2 and unit residues 1,3,5,7. Their value table is ((1,1,1,1),(1,−1,1,−1),(1,−1,−1,1),(1,1,−1,−1)); each is zero on even integers. They are genuine Dirichlet characters, with conductors 1,4,8,8 and parities 0,1,0,1. The two positive-sign descriptions and one conductor row printed on p.358 are corrected in E18–E19.

**Proof route.** Verify multiplicativity on the four-element unit group modulo eight. Extend by zero away from units. Check primitive conductor and parity by restriction to levels 1,4,8.

**Direct inputs.** `mathlib:DirichletCharacter`.

**API.**

- `TauCeti.SeveralVariableZeta.Characters8.value` (projection): Evaluate the above row at n mod8, with zero on even n.
- `TauCeti.SeveralVariableZeta.Characters8.mul` (relation): ψ(nm)=ψ(n)ψ(m).
- `TauCeti.SeveralVariableZeta.Characters8.unit_table` (characterisation): The four rows are exactly the displayed table; conductors and parities have the specified values.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.Characters8.test_one` (degenerate): Every row takes value 1 at 1.
- `TauCeti.SeveralVariableZeta.Characters8.test_signs` (computation): ψ2(3)=−1 and ψ−2(7)=−1.
- `TauCeti.SeveralVariableZeta.Characters8.test_orthogonality` (characterisation): For rows i,j, Ση ψi(η)ψj(η)=4 if i=j and 0 otherwise.

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(11), p.358.

**Atlas planet.** Characters modulo eight.

<a id="quadratic-double-series"></a>
#### The selected quadratic double Dirichlet series

**Construction** `TauCeti.SeveralVariableZeta.DoubleSeries` · `AnalyticNumberTheory:AN.8/quadratic-double-series`.

For odd d>0 put χd(n)=(d/n) on odd n, retaining square factors of d. Let L2(s,χdψ)=Σn positive odd χd(n)ψ(n)n^(−s), ζ2(s)=(1−2^(−s))ζ(s), and Z(s,w;ψ,ψ′)=ζ2(2s+2w−1)Σd positive odd L2(s,χdψ)ψ′(d)d^(−w). These are series on their stated convergence regions; their analytic continuations are separate functions. Row indices are (ψ,ψ′), with ψ′ varying fastest.

**Proof route.** Build odd coefficient sequences with zero at0 and use the pinned LSeries convention. Use the outer odd-d series only after absolute convergence is proved. Keep the factor at2 deleted in both L2 and ζ2; continuation agrees on the convergence tube.

**Direct inputs.** [The four real characters modulo eight](#characters-mod-eight), `mathlib:jacobiSym`, `mathlib:LSeries`, `mathlib:riemannZeta`.

**API.**

- `TauCeti.SeveralVariableZeta.DoubleSeries.oddZeta` (constructor): ζ2(s)=(1−2^(−s))ζ(s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddL` (constructor): The LSeries of the odd Jacobi-symbol coefficients χdψ.
- `TauCeti.SeveralVariableZeta.DoubleSeries.series` (constructor): The displayed double series.
- `TauCeti.SeveralVariableZeta.DoubleSeries.continued` (constructor): The meromorphic continuation selected by Lemma2; agree with series for Res,Rew>1.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.DoubleSeries.test_odd_zeta` (compatibility): For Res>1, ζ2(s)=Σn positive odd n^(−s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_imprimitive` (non-example): χ9(3)=0 although the squarefree-part character χ1(3)=1; square factors must not be erased.
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_first_coefficient` (computation): The d=1 coefficient is L2(s,ψ); the ζ2 correction remains outside the d sum.

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Introduction, equation (1), p.356; §3 equation (29), p.362.

**Atlas planet.** Quadratic double Dirichlet series.

<a id="characters-hadamard-orthogonality"></a>
#### Mod-eight character matrix orthogonality

**Lemma** `TauCeti.SeveralVariableZeta.characters_hadamard_orthogonality` · `AnalyticNumberTheory:AN.8/characters-hadamard-orthogonality`.

For H_i,a=ψi(2a+1), i,a∈{0,1,2,3}, H Hᵀ=HᵀH=4I. Thus Hᵀ/4 gives the exact inverse between twist coordinates and residue coordinates.

**Proof route.** Write the four character rows on the four odd residues. Distinct rows have dot product zero and each squared norm is four. The same calculation on columns proves the inverse matrix formula.

**Direct inputs.** [The four real characters modulo eight](#characters-mod-eight).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Proof of Lemma 2, character projections in (31)–(35), pp.362–363.

<a id="double-functional-system"></a>
#### Quadratic reciprocity matrix

**Construction** `TauCeti.SeveralVariableZeta.FunctionalSystem.A` · `AnalyticNumberTheory:AN.8/double-functional-system`.

Define the 16×16 matrix A indexed by (ψ,ψ′),(ρ,ρ′) by A=1/16 Ση,ν∈{1,3,5,7} ψ(ν)ψ′(η)ρ(η)ρ′(ν)(−1)^(((η−1)/2)((ν−1)/2)). This is the odd Jacobi reciprocity transform. The affine transformations and the Gamma reflection matrix are separate constructions.

**Proof route.** Use the odd Jacobi reciprocity sign to interchange n and d in the absolutely convergent double sum. Insert finite character projections for the two residues modulo 8 to obtain the displayed matrix.

**Direct inputs.** [The four real characters modulo eight](#characters-mod-eight), `mathlib:jacobiSym.quadratic_reciprocity`, [Mod-eight character matrix orthogonality](#characters-hadamard-orthogonality).

**API.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.A_entry` (characterisation): A has the displayed finite 16-term entry sum.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.A_involution` (characterisation): A*A=I16.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.A_symmetric` (compatibility): A.transpose=A.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_square` (characterisation): A²=I16.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_principal` (computation): A[(0,0),(0,0)]=1/2.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_A_signed` (computation): A[(0,0),(1,1)]=−1/2.

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 (31)–(35), pp.362–363; corrected conductor convention E19.

**Atlas planet.** Double-series functional equations.

<a id="double-normal-convergence"></a>
#### Normal convergence in the first tube

**Lemma** `TauCeti.SeveralVariableZeta.double_normal_convergence` · `AnalyticNumberTheory:AN.8/double-normal-convergence`.

On each compact K⊂{Res>1,Rew>1}, the odd (n,d) summands have a summable majorant n^(−σ0)d^(−ν0) with σ0,ν0>1. Consequently their double sum is normally convergent on K.

**Proof route.** Take the minima of the two real parts on the compact set; both exceed one. Bound every character by one and dominate the double sum by the product of two convergent positive Dirichlet series. The bound is independent of the point in the compact set.

**Direct inputs.** [The selected quadratic double Dirichlet series](#quadratic-double-series), `mathlib:zeta_eq_tsum_one_div_nat_cpow`.

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Definition (1), p.356; Lemma 2 proof, p.361.

<a id="odd-double-sum-absolute"></a>
#### Absolute convergence in the initial double tube

**Lemma** `TauCeti.SeveralVariableZeta.odd_double_sum_absolute` · `AnalyticNumberTheory:AN.8/odd-double-sum-absolute`.

For Res>1 and Rew>1 the odd n,d double sum is absolutely convergent, locally uniformly on compact sub-tubes; hence it may be summed in either order.

**Proof route.** Bound both characters by1. Dominate by ζ(Res)ζ(Rew); the correcting ζ2 factor has Re(2s+2w−1)>1. Use compact positive margins for locally uniform domination.

**Direct inputs.** [Normal convergence in the first tube](#double-normal-convergence).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof of Lemma 2, initial expansion (28), pp.361–362.

<a id="odd-squarefree-factorization"></a>
#### Unique odd squarefree factorization

**Lemma** `TauCeti.SeveralVariableZeta.odd_squarefree_factorization` · `AnalyticNumberTheory:AN.8/odd-squarefree-factorization`.

Every positive odd d is uniquely d0k² with d0 positive odd squarefree and k positive odd. The Jacobi symbol χd equals χd0 away from prime divisors of k and vanishes at those prime divisors.

**Proof route.** Split each prime exponent into its parity and an even part. Unique factorization gives the squarefree component and square component, retaining oddness. The Jacobi factors for even exponents are one away from their prime and zero at it.

**Direct inputs.** `mathlib:jacobiSym`.

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, before (7), p.358; (29), p.361.

<a id="double-primitive-twist-data"></a>
#### Primitive quadratic twist data

**Definition** `TauCeti.SeveralVariableZeta.FunctionalSystem.PrimitiveTwistData` · `AnalyticNumberTheory:AN.8/double-primitive-twist-data`.

For i=0,1,2,3 corresponding to ψ1,ψ−1,ψ2,ψ−2 and η=1,3,5,7, define q=8 for i≥2, q=1 for (i=0,η≡1mod4) or (i=1,η≡3mod4), and q=4 otherwise. Define κ=0,1,0,1. The removed Euler value e is zero unless q=1; then e=+1 for η=1,7 and e=−1 for η=3,5. These are the conductor factor, parity and value at 2 of the primitive quadratic character.

**Proof route.** Compute the signed fundamental discriminant for the four twists and each odd residue class. Its power of two gives q, its sign gives parity, and its value at 2 gives the displayed deleted factor. Record the conductor-one cases separately.

**Direct inputs.** [The four real characters modulo eight](#characters-mod-eight), `mathlib:DirichletCharacter`.

**API.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.q` (projection): The factor multiplying odd squarefree d in the primitive conductor.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.parity` (projection): κi=0,1,0,1.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.twoValue` (projection): Value at 2, zero when q≠1.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_conductor_principal` (computation): q(0,η=1)=1; q(0,η=3)=4.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_conductor_eight` (computation): q(2,η)=q(3,η)=8 and their parities are respectively 0 and 1.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_two_values` (computation): e(0,η=1)=1; e(1,η=3)=−1; e(2,η)=0.

**Consumers.** [Quadratic conductor and root number](#quadratic-primitive-adapter): Uses the exact construction, normalization and compatibility API stated here.; [Local quadratic reflection ratio](#double-local-reflection-ratio): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(13), pp.358–359; (32)–(33), p.362.

<a id="quadratic-twist-character"></a>
#### Imprimitive odd quadratic twist

**Construction** `TauCeti.SeveralVariableZeta.quadraticTwist` · `AnalyticNumberTheory:AN.8/quadratic-twist-character`.

For a positive odd integer d and twist i, define the Dirichlet character of modulus 8d with natural-integer coefficient χi,d(n)=(d/n)ψi(n) for odd n and zero for even n. This character retains all deleted square-factor Euler factors. Its primitive conductor is identified by quadratic-primitive-adapter, not assumed to be 8d.

**Proof route.** Use Jacobi periodicity and multiplicativity on units modulo 8d, extend by zero off units, and check its coefficient equals the prescribed odd symbol.

**Direct inputs.** [The four real characters modulo eight](#characters-mod-eight), `mathlib:DirichletCharacter`, `mathlib:jacobiSym`.

**API.**

- `TauCeti.SeveralVariableZeta.quadraticTwist.value` (simp): Evaluation at a natural integer is the displayed odd Jacobi coefficient.
- `TauCeti.SeveralVariableZeta.quadraticTwist.series_agrees` (compatibility): Its Mathlib LFunction agrees with the odd Jacobi LSeries on Re s>1.
- `TauCeti.SeveralVariableZeta.quadraticTwist.real_values` (characterisation): Every value is −1,0 or 1.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.quadraticTwist.test_principal` (computation): For d=1,i=ψ1, every odd coefficient equals 1.
- `TauCeti.SeveralVariableZeta.quadraticTwist.test_square` (non-example): For d=9,i=ψ1, the value at 3 is zero.
- `TauCeti.SeveralVariableZeta.quadraticTwist.test_two_twist` (computation): For d=1,i=ψ2, the value at 3 is −1.

**Consumers.** [Quadratic conductor and root number](#quadratic-primitive-adapter): Supplies the actual imprimitive character whose conductor and removed Euler factors are matched.; [The first-moment input for the wider convergence tube](#quadratic-mean-bound-import): Ensures the estimate concerns Mathlib LFunction rather than a totalized series outside convergence..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, definitions before (7) and formulas (7)–(13), pp.358–359.

<a id="quadratic-L-continuation"></a>
#### Continued odd quadratic L-function

**Construction** `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation` · `AnalyticNumberTheory:AN.8/quadratic-L-continuation`.

For positive odd d, put L2continued(i,d,s)=DirichletCharacter.LFunction(χi,d,s). It agrees with the odd series on Re s>1, is meromorphic on C, and is entire when χi,d is nonprincipal. All mean estimates outside Re s>1 use this continued function.

**Proof route.** Apply the imported LFunction construction to the actual coefficient character; prove the series agreement by coefficient equality.

**Direct inputs.** [Imprimitive odd quadratic twist](#quadratic-twist-character), `mathlib:DirichletCharacter.LFunction`, `mathlib:DirichletCharacter.LFunction_eq_LSeries`.

**API.**

- `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation_agrees` (compatibility): Agreement with oddL in Re s>1.
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation_meromorphic` (structure): Meromorphic continuation on C.
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation_entire` (structure): Nonprincipal χ gives an entire L-function.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.DoubleSeries.test_L_principal` (compatibility): For i=ψ1,d=1 and s≠1, the continuation equals ζ2(s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_L_deleted_three` (computation): For i=ψ1,d=9 and s≠1, it equals (1−3^(−s))ζ2(s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_L_negative_one` (non-example): For i=ψ1,d=1 its value at −1 is 1/12, whereas the naive totalized LSeries there is zero.

**Consumers.** [Pole-aware strip first moment](#quadratic-pole-aware-strip-moment): Supplies the meromorphic scalar function to estimate on arbitrary compact real strips..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(16), pp.358–359.

<a id="quadratic-primitive-adapter"></a>
#### Quadratic conductor and root number

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_primitive_adapter` · `AnalyticNumberTheory:AN.8/quadratic-primitive-adapter`.

For each odd squarefree d0 and twist i identify χd0ψi with its primitive real character of conductor q_i,η d0, parity κ_i and root number +1. Removed prime-2 and square-factor Euler factors agree with L2. Here η=d0 mod8, q and κ are exactly the table defining the reflection block; principal cases use meromorphic germs.

**Proof route.** Identify the signed fundamental-discriminant character with the pinned primitive character. Prove the conductor, parity and positive Gauss-sum root number, then apply the pinned completed functional equation and change-level formula. These arithmetic/Gauss-sum adapters remain the named source gap.

**Direct inputs.** [Primitive quadratic twist data](#double-primitive-twist-data), `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `mathlib:DirichletCharacter.LFunction_changeLevel`, [The four real characters modulo eight](#characters-mod-eight), [Continued odd quadratic L-function](#quadratic-L-continuation), [Imprimitive odd quadratic twist](#quadratic-twist-character).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(13), pp.358–359.

<a id="double-denominator-unit"></a>
#### Nonzero squarefree-series denominator

**Lemma** `TauCeti.SeveralVariableZeta.double_denominator_unit` · `AnalyticNumberTheory:AN.8/double-denominator-unit`.

For Re(s+2w)>1 the Euler product of L2(s+2w,χd0ψi) is nonzero. On any closed sub-half-plane Re(s+2w)≥1+δ, its reciprocal is bounded by ζ(1+δ), uniformly in d0 and the twist.

**Proof route.** Use the absolutely convergent Euler product on the strict right half-plane. Each reciprocal local factor has modulus at most 1+p^(-sigma), whose product is at most zeta(sigma). This proves nonvanishing and the compact sub-half-plane uniform bound.

**Direct inputs.** `mathlib:LSeries`, [Quadratic conductor and root number](#quadratic-primitive-adapter), [Continued odd quadratic L-function](#quadratic-L-continuation).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, (29), p.361.

<a id="squarefree-square-decomposition"></a>
#### Separating square factors of the discriminant index

**Lemma** `TauCeti.SeveralVariableZeta.squarefree_square_decomposition` · `AnalyticNumberTheory:AN.8/squarefree-square-decomposition`.

Each odd d has a unique d=d0 d1² with d0 squarefree. In the initial tube, Z=ζ2(2s+2w−1)ζ2(2w)Σd0 odd squarefree L2(s,χd0ψ)ψ′(d0)/(d0^w L2(s+2w,χd0ψ)).

**Proof route.** Factor d uniquely prime by prime. Removing primes dividing d1 from the inner L-series gives the finite missing Euler factors. Sum each geometric square-factor series absolutely to obtain the quotient in (29).

**Direct inputs.** [Unique odd squarefree factorization](#odd-squarefree-factorization), [Normal convergence in the first tube](#double-normal-convergence), [Nonzero squarefree-series denominator](#double-denominator-unit).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 equation (29), p.362.

<a id="quadratic-fourth-moment"></a>
#### Quadratic fourth moment

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_fourth_moment` · `AnalyticNumberTheory:AN.8/quadratic-fourth-moment`.

For fixed σ∈[1/2,1] and ε>0, Σχ nonprincipal primitive real,condχ≤Q |L(σ+it,χ)|⁴ ≤ Cσ,ε [Q+(Q(1+|t|))^(2−2σ)](Q(1+|t|))^ε, for Q≥1 and t∈R. The conductor-one principal character is treated separately.

**Proof route.** Use the quadratic large sieve on the smoothed Dirichlet polynomial for L². Bound the reflected contour using the primitive functional equation; bootstrap the dyadic fourth moment and treat σ=1/2 by σ=1/2−ε.

**Direct inputs.** `ArithmeticStatistics:ST.2`, `mathlib:DirichletCharacter`.

**Sources.** [D. R. Heath-Brown](https://www.impan.pl/shop/en/publication/transaction/download/product/108575), Theorem 2, p.238; §10, pp.267–269.

<a id="quadratic-holder-first-moment"></a>
#### Primitive quadratic first moment

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_holder_first_moment` · `AnalyticNumberTheory:AN.8/quadratic-holder-first-moment`.

On σ=1/2, Hölder and the O(X) count of primitive real characters of conductor≤8X give Σd0≤X,d0 odd squarefree,χd0ψi nonprincipal |L(1/2+it,χd0ψi)| ≤ Cε X^(1+ε)(1+|t|)^(1/4+ε).

**Proof route.** Apply Holder with fourth power to the primitive family. The character count contributes X^(3/4), and the fourth-moment bound contributes X^(1/4+epsilon)(1+|t|)^(1/4+epsilon), after rescaling epsilon. Remove principal terms before applying the supplied moment.

**Direct inputs.** `mathlib:DirichletCharacter`, [Quadratic fourth moment](#quadratic-fourth-moment), [Continued odd quadratic L-function](#quadratic-L-continuation).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (14)–(16), pp.358–359.

<a id="quadratic-square-factor-sum"></a>
#### Imprimitive square-factor bound

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_square_factor_sum` · `AnalyticNumberTheory:AN.8/quadratic-square-factor-sum`.

For d=d0k² odd, the deleted Euler factors give |L2(s,χdψi)| ≤ |L2(s,χd0ψi)|∏p|k(1+p^(−Res)). On a fixed real strip with Res≥1/2 this product is Oε(k^ε), uniformly in Ims. Summing k≤√(X/d0) transports the primitive first moment to all odd d; the d0=1 principal term uses ζ2(s), off s=1.

**Proof route.** Use the change-level identity to write the omitted prime factors. Bound them by the product of 1+p^(-sigma), absorb that product in k^epsilon on the fixed strip, and sum the primitive estimate over square factors. Treat the sole principal primitive term by the meromorphic odd zeta function.

**Direct inputs.** [Separating square factors of the discriminant index](#squarefree-square-decomposition), `mathlib:DirichletCharacter.LFunction_changeLevel`, [Primitive quadratic first moment](#quadratic-holder-first-moment), [Continued odd quadratic L-function](#quadratic-L-continuation).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (13)–(16), pp.358–359.

<a id="quadratic-mean-bound-import"></a>
#### The first-moment input for the wider convergence tube

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_mean_bound_import` · `AnalyticNumberTheory:AN.8/quadratic-mean-bound-import`.

For every ε>0 and twist i there is Cε>0 such that, for all X≥1 and t∈R, Σ1≤d≤X,d odd |L2(1/2+it,χdψi)| ≤ Cε X^(1+ε)(1+|t|)^(1/4+ε). The principal primitive character is separated before applying the quadratic fourth-moment theorem. A pole-aware strip extension is a separate lemma. Here L2 is oddLContinuation, not the totalized naive LSeries.

**Proof route.** Match (16) with the odd squarefree discriminants and the four twists. Keep its ε-loss and vertical-parameter dependence. Feed partial summation with the selected bound into the d0 series.

**Direct inputs.** [Primitive quadratic first moment](#quadratic-holder-first-moment), [Imprimitive square-factor bound](#quadratic-square-factor-sum), [Continued odd quadratic L-function](#quadratic-L-continuation).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1 equation (16), p.359; application to (29), p.362.

<a id="quadratic-pole-clearance"></a>
#### Pole-cleared quadratic L-function

**Construction** `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL` · `AnalyticNumberTheory:AN.8/quadratic-pole-clearance`.

Define H_i,d(s)=(s−1)L2continued(i,d,s) away from 1 and fill its value at 1 by the residue. If χi,d is principal that value is product_p|8d(1−p^(−1)); otherwise it is zero. The resulting H_i,d is entire. This is the function in the pole-aware strip moment.

**Proof route.** Use the nonprincipal entire continuation; for the principal character, its Euler-deleted ζ function has the stated residue. Fill the removable singularity by that residue.

**Direct inputs.** [Continued odd quadratic L-function](#quadratic-L-continuation), `mathlib:DirichletCharacter.LFunction_changeLevel`.

**API.**

- `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL_off_one` (simp): Off 1, H_i,d(s)=(s−1)L2continued(i,d,s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL_entire` (structure): H_i,d is entire on C.
- `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL_one` (simp): Its value at 1 is the displayed principal residue, or zero for a nonprincipal character.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.DoubleSeries.test_residue_half` (computation): H_ψ1,1(1)=1/2.
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_residue_third` (computation): H_ψ1,9(1)=1/3.
- `TauCeti.SeveralVariableZeta.DoubleSeries.test_nonprincipal_zero` (non-example): H_ψ2,1(1)=0.

**Consumers.** [Pole-aware strip first moment](#quadratic-pole-aware-strip-moment): Retains the residue at s=1, so the uniform estimate covers that point without totalized multiplication..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (13)–(16), pp.358–359; principal ζ2 term in (29), p.361.

<a id="quadratic-pole-aware-strip-moment"></a>
#### Pole-aware strip first moment

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_pole_aware_strip_moment` · `AnalyticNumberTheory:AN.8/quadratic-pole-aware-strip-moment`.

Fix a compact real interval I and ε>0. There exist C,N>0 such that for σ∈I, X≥1 and t∈R, Σd≤X,d odd |(σ+it−1)L2(σ+it,χdψi)| ≤ C X^(max(1,3/2−σ)+ε)(1+|t|)^N. At s=1 the term denotes the analytic extension of (s−1)L2(s), not totalized multiplication. Constants depend on I and ε, not X,t or i. The summands are the absolute values of the entire functions H_i,d=DoubleSeries.poleClearL.

**Proof route.** On compact right strips use the fourth moment, Hölder and square-factor decomposition, separating the principal ζ2 contribution. Reflect strips left of 1/2; the conductor factor d^(1/2−σ) gives the exponent 3/2−σ. Track the gamma and pole-clearing factors as polynomial height bounds. Uniform strip constants must be proved by the same smoothed-sum argument, not inferred from pointwise O constants.

**Direct inputs.** [The first-moment input for the wider convergence tube](#quadratic-mean-bound-import), [Quadratic conductor and root number](#quadratic-primitive-adapter), `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, [Pole-cleared quadratic L-function](#quadratic-pole-clearance).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1 (16), p.359; Lemma 2 proof around (29), p.361.

<a id="double-R1-convergence"></a>
#### Locally uniform convergence in R1

**Lemma** `TauCeti.SeveralVariableZeta.double_R1_convergence` · `AnalyticNumberTheory:AN.8/double-R1-convergence`.

The pole-cleared squarefree expression is holomorphic on R1={Rew>1,Res+Rew>3/2}; its only possible polar line there is s=1, from the trivial inner twist.

**Proof route.** Use the first-moment bound for Res≥1/2. Apply the quadratic functional equation and its conductor growth for Res<1/2. Sum on compact strict sub-tubes and separate the trivial-character pole.

**Direct inputs.** [Separating square factors of the discriminant index](#squarefree-square-decomposition), [Pole-aware strip first moment](#quadratic-pole-aware-strip-moment), [Nonzero squarefree-series denominator](#double-denominator-unit).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof following (29), p.362.

<a id="double-affine-swap"></a>
#### Swap of double-series variables

**Definition** `TauCeti.SeveralVariableZeta.FunctionalSystem.swap` · `AnalyticNumberTheory:AN.8/double-affine-swap`.

Define α(s,w)=(w,s). Its fixed locus is s=w; it is a complex affine involution.

**Proof route.** Exchange the two coordinates twice and solve equality with the original pair. Its linear formula also supplies continuity and analyticity.

**Direct inputs.** .

**API.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap_apply` (characterisation): swap(s,w)=(w,s).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap_involution` (characterisation): swap∘swap=id.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap_fixed` (characterisation): swap z=z iff z.1=z.2.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_swap_origin` (computation): swap(0,0)=(0,0).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_swap_pair` (computation): swap(2,3)=(3,2).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_swap_fixed` (characterisation): swap(s,s)=(s,s).

**Consumers.** [The swap functional equation](#reciprocity-swap-equation): Uses the exact construction, normalization and compatibility API stated here.; [Affine dihedral action](#double-affine-dihedral): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 and (31)–(35), pp.361–363.

<a id="reciprocity-swap-equation"></a>
#### The swap functional equation

**Lemma** `TauCeti.SeveralVariableZeta.reciprocity_swap_equation` · `AnalyticNumberTheory:AN.8/reciprocity-swap-equation`.

The 16-vector continuation satisfies Z(s,w)=A Z(w,s) wherever defined meromorphically.

**Proof route.** Interchange the absolutely convergent odd sums. Expand the quadratic-reciprocity sign using the finite character table. Use identity continuation from the nonempty overlap.

**Direct inputs.** [Absolute convergence in the initial double tube](#odd-double-sum-absolute), [Quadratic reciprocity matrix](#double-functional-system), [Swap of double-series variables](#double-affine-swap).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 equations (31)–(32), p.362.

<a id="double-local-reflection-ratio"></a>
#### Local quadratic reflection ratio

**Definition** `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio` · `AnalyticNumberTheory:AN.8/double-local-reflection-ratio`.

Define the meromorphic ratio r_i,η(s)=(q/π)^(1/2−s)Γ((1−s+κ)/2)/Γ((s+κ)/2)·(1−e2^(−s))/(1−e2^(s−1)). On Res<1 the numerator Gamma function and the Euler denominator have no poles or zeros, and reciprocal Gamma fills its denominator poles with zero. This determines an analytic function on that half-plane; the raw totalized quotient is used only where its factors are defined.

**Proof route.** Use the primitive completed functional equation with its exact conductor and parity. On Re s<1 the numerator Gamma arguments have positive real part and the Euler denominator cannot vanish. Use entire reciprocal Gamma to fill the other singular values.

**Direct inputs.** [Primitive quadratic twist data](#double-primitive-twist-data), `mathlib:Complex.Gamma`, `mathlib:Complex.cpow`.

**API.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio_formula` (characterisation): r_i,η(s)=(q/π)^(1/2−s)Γ((1−s+κ)/2)/Γ((s+κ)/2)·(1−e2^(−s))/(1−e2^(s−1)) off Gamma poles and Euler zeros.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio_analytic` (characterisation): r_i,η is holomorphic on Res<1 after reciprocal-Gamma filling.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio_twist_two` (characterisation): For i=2, r=(π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2), independent of η.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_ratio_even_zero` (degenerate): For i=0 or 2, r_i,η(0)=0.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_ratio_eight_even` (compatibility): The ψ2 ratio has parity κ=0 and conductor factor 8.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_ratio_eight_odd` (compatibility): The ψ−2 ratio has Γ((2−s)/2)/Γ((s+1)/2), retaining κ=1.

**Consumers.** [Quadratic reflection matrix](#double-reflection-matrix): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), (32)–(34), pp.362–363.

<a id="double-reflection-matrix"></a>
#### Quadratic reflection matrix

**Definition** `TauCeti.SeveralVariableZeta.FunctionalSystem.B` · `AnalyticNumberTheory:AN.8/double-reflection-matrix`.

Define B(s) blockwise: B(s)[(i,j),(i,k)]=1/4 Ση ψj(η)r_i,η(s)ψk(η); blocks with different i vanish. The matrix is a meromorphic matrix, with removable values filled. The local ratios use the displayed primitive conductor table, not conductor 8 in every twist.

**Proof route.** Apply the Hadamard character transform, multiply in residue coordinates by the local reflection ratios, and apply the inverse transform. Separate twist blocks and fill removable singularities before evaluating matrix entries.

**Direct inputs.** [Local quadratic reflection ratio](#double-local-reflection-ratio), [Mod-eight character matrix orthogonality](#characters-hadamard-orthogonality).

**API.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.B_off_denominators` (characterisation): The same-i block is H diag(r_i,η)Hᵀ/4 off all raw denominators.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.B_cross_block` (characterisation): B(s)[(i,j),(k,l)]=0 when i≠k.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.B_analytic_left` (characterisation): Every entry of B is holomorphic on Res<1, including filled values.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_twist_two` (compatibility): The ψ2 block is (π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2) times I4.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_B_principal_zero` (degenerate): The ψ1 block at s=0 is zero.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_B_odd_zero` (computation): B(0)[(1,0),(1,0)]=4/(3π), so the odd block does not vanish.

**Consumers.** [The reflection functional equation](#quadratic-reflection-equation): Uses the exact construction, normalization and compatibility API stated here.; [The zero block that removes a false pole](#reflect-holomorphy-and-zero): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), (32)–(35) and following paragraph, pp.362–363.

<a id="double-affine-reflection"></a>
#### Quadratic reflection of double-series variables

**Definition** `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect` · `AnalyticNumberTheory:AN.8/double-affine-reflection`.

Define β(s,w)=(1−s,s+w−1/2). Its fixed locus is s=1/2; it is a complex affine involution.

**Proof route.** Substitute the affine formula into itself, which recovers both coordinates. Equality with the original pair forces s=1/2 and imposes no additional condition on w.

**Direct inputs.** .

**API.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect_apply` (characterisation): reflect(s,w)=(1−s,s+w−1/2).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect_involution` (characterisation): reflect∘reflect=id.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect_fixed` (characterisation): reflect z=z iff z.1=1/2.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_reflect_origin` (computation): reflect(0,0)=(1,−1/2).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_reflect_pair` (computation): reflect(2,3)=(−1,9/2).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.test_reflect_fixed` (characterisation): reflect(1/2,w)=(1/2,w).

**Consumers.** [The reflection functional equation](#quadratic-reflection-equation): Uses the exact construction, normalization and compatibility API stated here.; [Affine dihedral action](#double-affine-dihedral): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 and (31)–(35), pp.361–363.

<a id="quadratic-reflection-equation"></a>
#### The reflection functional equation

**Lemma** `TauCeti.SeveralVariableZeta.quadratic_reflection_equation` · `AnalyticNumberTheory:AN.8/quadratic-reflection-equation`.

The 16-vector continuation satisfies Z(s,w)=B(s)Z(1−s,s+w−1/2) as an equality of meromorphic germs.

**Proof route.** Separate odd squarefree d0 and residue classes. Use the primitive real-character functional equation and the deleted factor at2. Observe that s+2w is invariant and that 2w and 2s+2w−1 are exchanged.

**Direct inputs.** [Separating square factors of the discriminant index](#squarefree-square-decomposition), [Quadratic reciprocity matrix](#double-functional-system), `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `mathlib:DirichletCharacter.LFunction_changeLevel`, [Quadratic reflection matrix](#double-reflection-matrix), [Quadratic reflection of double-series variables](#double-affine-reflection), [Quadratic conductor and root number](#quadratic-primitive-adapter).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 equations (10) and (33)–(35), pp.358,362–363.

<a id="reflect-holomorphy-and-zero"></a>
#### The zero block that removes a false pole

**Lemma** `TauCeti.SeveralVariableZeta.reflect_holomorphy_and_zero` · `AnalyticNumberTheory:AN.8/reflect-holomorphy-and-zero`.

B(s) is holomorphic on Res<1 and its principal-twist block vanishes at s=0. This cancels the reflected principal w=1 pole where its image would otherwise introduce an extra pole; it does not assert that every block vanishes at zero.

**Proof route.** Use the gamma quotient with parity and the Euler factor ratio. Cancel apparent denominators at their removable zeros. At s=0 in the first block, the reciprocal gamma zero cancels the candidate transported pole.

**Direct inputs.** [Quadratic reflection matrix](#double-reflection-matrix).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof after (35), p.363.

<a id="double-overlap-identity"></a>
#### Functional branches agree on overlaps

**Lemma** `TauCeti.SeveralVariableZeta.double_overlap_identity` · `AnalyticNumberTheory:AN.8/double-overlap-identity`.

On every connected nonempty open overlap of the R1,αR1,βR2,αR3 tube components, both branches have the same meromorphic germ: transport to the original absolute-convergence tube and use the identity theorem after clearing all encountered pole factors. Intersections used here are convex real tubes, hence connected.

**Proof route.** Clear the finite polar factors on each overlap. The transported functional equations agree on a nonempty absolute-convergence subdomain. The identity theorem extends agreement to the connected convex tube intersection; perform each successive gluing with that same normalization.

**Direct inputs.** [Locally uniform convergence in R1](#double-R1-convergence), [The swap functional equation](#reciprocity-swap-equation), [The reflection functional equation](#quadratic-reflection-equation), `mathlib:AnalyticOnNhd`.

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.362–363.

<a id="double-reflected-pole-cancellation"></a>
#### Cancellation of spurious reflected poles

**Lemma** `TauCeti.SeveralVariableZeta.double_reflected_pole_cancellation` · `AnalyticNumberTheory:AN.8/double-reflected-pole-cancellation`.

During the R2→R3 gluing, the only candidate new pole beyond s=1,w=1,s+w=3/2 is the reflected principal-twist pole through s=0. The principal block B1(0)=0 cancels it. Track pole orders as germs; multiplying totalized zero values is insufficient.

**Proof route.** Separate the principal residue term in the reflected branch. Its scalar pole has order at most one and the entire principal reflection block vanishes at zero. Multiply as analytic germs, using the order inequality to remove the candidate pole.

**Direct inputs.** [The zero block that removes a false pole](#reflect-holomorphy-and-zero), [Functional branches agree on overlaps](#double-overlap-identity).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, paragraph following (35), p.363.

<a id="tube-overlap-gluing"></a>
#### Gluing the four continued tubes

**Lemma** `TauCeti.SeveralVariableZeta.tube_overlap_gluing` · `AnalyticNumberTheory:AN.8/tube-overlap-gluing`.

R2=α(R1)∪R1; R3=β(R2)∪R2; R4=α(R3)∪R3. The functional equations agree on their nonempty open overlaps and the gluing leaves possible poles only at s=1,w=1,s+w=3/2.

**Proof route.** Check the explicit inequalities defining each tube, as on pp.363–364. Use holomorphic uniqueness on the overlaps after multiplying by the three linear pole factors. Use B1(0)=0 to remove the candidate s=0 hyperplane.

**Direct inputs.** [Locally uniform convergence in R1](#double-R1-convergence), [The swap functional equation](#reciprocity-swap-equation), [The reflection functional equation](#quadratic-reflection-equation), [The zero block that removes a false pole](#reflect-holomorphy-and-zero), [Functional branches agree on overlaps](#double-overlap-identity), [Cancellation of spurious reflected poles](#double-reflected-pole-cancellation).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof of Lemma 2, tube R1 and its images (36), pp.363–364.

<a id="tube-bochner-extension"></a>
#### Bochner tube extension

**Lemma** `TauCeti.SeveralVariableZeta.tube_bochner_extension` · `AnalyticNumberTheory:AN.8/tube-bochner-extension`.

For connected open Ω⊆R² and f holomorphic on TΩ, there is a unique holomorphic F on Tconv(Ω) with F=f on TΩ. The imaginary directions are unrestricted. This is a theorem on tubes, not on arbitrary punctured complex domains.

**Proof route.** The exact connected-tube convex-hull extension is the external Bochner input. DGH Proposition 4.6 states it without its primary proof, so the packet records proof acquisition as a gap. Uniqueness on the convex tube follows from the analytic identity theorem.

**Direct inputs.** `mathlib:AnalyticOnNhd`.

**Sources.** [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), Definition 4.5 and Proposition 4.6, pp.37–38.

<a id="tube-reciprocal-bound"></a>
#### Bound survives tube extension

**Lemma** `TauCeti.SeveralVariableZeta.tube_reciprocal_bound` · `AnalyticNumberTheory:AN.8/tube-reciprocal-bound`.

Under the Bochner hypotheses, if M≥0 and |f(z)|≤M for all z∈TΩ, then its extension F satisfies |F(z)|≤M throughout Tconv(Ω).

**Proof route.** For every |a|>M, extend 1/(f−a) to the convex tube. The holomorphic identity (F−a)G=1 follows from uniqueness. Thus F avoids every value outside the closed radius-M disk.

**Direct inputs.** [Bochner tube extension](#tube-bochner-extension).

**Sources.** [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), Propositions 4.6–4.7, pp.37–38; bounded-shell application pp.43–44.

<a id="double-affine-dihedral"></a>
#### Affine dihedral action

**Lemma** `TauCeti.SeveralVariableZeta.FunctionalSystem.affine_order` · `AnalyticNumberTheory:AN.8/double-affine-dihedral`.

The two maps α,β satisfy α²=β²=id and (αβ)^6=id. At (2,3), the six iterates of αβ are distinct, so its order is exactly six. These transformations act on the real-part tube bases as well as on C².

**Proof route.** Compute alpha beta as an affine map and iterate it six times symbolically. Both generators square to the identity; the six images of (2,3) are distinct and certify exact order six.

**Direct inputs.** [Swap of double-series variables](#double-affine-swap), [Quadratic reflection of double-series variables](#double-affine-reflection).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.362–364.

<a id="double-iterated-tube-bases"></a>
#### Iterated continuation tubes

**Construction** `TauCeti.SeveralVariableZeta.Tubes.base` · `AnalyticNumberTheory:AN.8/double-iterated-tube-bases`.

Define B0={(x,y):y>1,x+y>3/2}. Recursively B(k+1)=Bk∪ak(Bk), where ak(x,y)=(y,x) for even k and ak(x,y)=(1−x,x+y−1/2) for odd k. Thus B0,...,B5 are the real bases R1,...,R6; their complex tubes allow arbitrary imaginary coordinates.

**Proof route.** Use the two affine involutions to transport the preceding open base and take its union with that base.

**Direct inputs.** [Swap of double-series variables](#double-affine-swap), [Quadratic reflection of double-series variables](#double-affine-reflection).

**API.**

- `TauCeti.SeveralVariableZeta.Tubes.base_zero` (simp): Membership in B0 is y>1 and x+y>3/2.
- `TauCeti.SeveralVariableZeta.Tubes.base_step` (relation): Bk+1 is the stated union with the alternating affine image.
- `TauCeti.SeveralVariableZeta.Tubes.base_mono` (relation): Bk is contained in Bk+1; every Bk is open.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.Tubes.test_initial` (computation): (2,2) is in B0.
- `TauCeti.SeveralVariableZeta.Tubes.test_negative` (computation): (−2,−2) is in B4 but not B3.
- `TauCeti.SeveralVariableZeta.Tubes.test_hole` (non-example): (0,0) is not in B5.

**Consumers.** [Real shell convex hull](#double-shell-hull): Determines the final bounded complement after all six continuation tubes; prevents applying the annular argument to R4..

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.363–364.

<a id="double-shell-hull"></a>
#### Real shell convex hull

**Lemma** `TauCeti.SeveralVariableZeta.double_shell_hull` · `AnalyticNumberTheory:AN.8/double-shell-hull`.

After R4=R3∪αR3, set R5=R4∪βR4 and R6=R5∪αR5. The complement of the real-part base of R6 is the closed twelve-gon Ω with successive vertices (1,1),(1/2,1),(0,3/2),(0,1),(−1/2,1),(0,1/2),(0,0),(1/2,0),(1,−1/2),(1,0),(3/2,0),(1,1/2). It lies in x²+y²≤3, so the connected annulus 4<x²+y²<5 lies in the glued base and its convex hull contains Ω. The earlier R4 alone does not have bounded complement.

**Proof route.** Write each transported tube as explicit linear inequalities, using both remaining functional-equation transports R4→R5→R6. Check the complement by its twelve successive boundary segments. Bound every vertex by x²+y²≤3; convexity of the disk gives the polygon bound. The open annulus is connected and its convex hull is the disk of radius sqrt(5); use the bounded normalization on its entire imaginary tube.

**Direct inputs.** [Gluing the four continued tubes](#tube-overlap-gluing), [Affine dihedral action](#double-affine-dihedral), [Iterated continuation tubes](#double-iterated-tube-bases).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof and Fig.1, pp.363–364.

<a id="double-gamma-quotient-growth"></a>
#### Gamma reflection block growth

**Lemma** `TauCeti.SeveralVariableZeta.double_gamma_quotient_growth` · `AnalyticNumberTheory:AN.8/double-gamma-quotient-growth`.

On each closed strip a≤Res≤b<1, the filled r_i,η(s) and hence entries of B(s) are bounded by C(1+|Ims|)^N. Stirling for the Gamma quotient gives a power of height; the Euler denominator has modulus at least 1−2^(b−1)>0 when e≠0. On a bounded height interval use holomorphy and compactness.

**Proof route.** Separate the four conductor factors, whose moduli depend only on Res. Apply the vertical-strip Stirling ratio estimate away from bounded height; reciprocal Gamma fills the bounded-height removable points. Use the stated uniform lower bound for the restored Euler denominator.

**Direct inputs.** [Local quadratic reflection ratio](#double-local-reflection-ratio), `AnalyticNumberTheory:AN.5`.

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, (32)–(35), pp.362–364.

<a id="double-shell-normalizer"></a>
#### Bounded normalization on the shell tube

**Lemma** `TauCeti.SeveralVariableZeta.double_shell_normalizer` · `AnalyticNumberTheory:AN.8/double-shell-normalizer`.

On the annular shell 4<Res²+Rew²<5 used in the last continuation step, the cleared branch F=PZ has a bound C(1+|Ims|)^N(1+|Imw|)^N from the R1 estimate and transported reflection estimates. Choose an integer M≥N. Then F/[(3+s)^M(3+w)^M] is holomorphic and bounded on the shell tube, and its denominator has no zero on the full tube Res²+Rew²<5. Bochner bounded extension of this normalized function fills the hole; multiplying the denominator restores F.

**Proof route.** Cover the compact real shell by finitely many transported convergence regions, using germ agreement on overlaps. Retain polynomial height estimates in both variables under the finitely many affine transformations. Since |Res|,|Rew|<√5<3, |3+s| and |3+w| are bounded below and dominate 1+|Ims| and 1+|Imw| up to a fixed positive scalar.

**Direct inputs.** [Real shell convex hull](#double-shell-hull), [Pole-aware strip first moment](#quadratic-pole-aware-strip-moment), [Gamma reflection block growth](#double-gamma-quotient-growth).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Final part of Lemma 2 proof, pp.363–364.

<a id="tube-hull-extension"></a>
#### Filling the remaining real twelve-gon

**Lemma** `TauCeti.SeveralVariableZeta.tube_hull_extension` · `AnalyticNumberTheory:AN.8/tube-hull-extension`.

Let Ω⊆R² be connected and open and let f be holomorphic on TΩ={z:Re z∈Ω}. It has a unique holomorphic extension to Tconv(Ω) (Bochner). If |f|≤M on TΩ, the extension has the same bound. Apply this to the pole-cleared branch on the annular real shell around the omitted twelve-gon.

**Proof route.** Extend f by Bochner. For each complex a with |a|>M, also extend 1/(f−a). The identity (f−a)/(f−a)=1 extends by uniqueness, so the extended f never takes such an a. Apply the shell hull to each cleared component; only the local shell bound enters.

**Direct inputs.** [Bochner tube extension](#tube-bochner-extension), [Bound survives tube extension](#tube-reciprocal-bound), [Real shell convex hull](#double-shell-hull), [Bounded normalization on the shell tube](#double-shell-normalizer).

**Sources.** [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), §4.3, Proposition 4.6, pp.37–38; application pp.43–44.

<a id="double-series-continuation"></a>
#### Meromorphic continuation and the three polar hyperplanes

**Theorem** `TauCeti.SeveralVariableZeta.DoubleSeries.cleared_entire` · `AnalyticNumberTheory:AN.8/double-series-continuation`.

For each twist pair i,j there is a unique entire function Eij on C² whose value on Res>1, Rew>1 is P(s,w)Zij(s,w), where P=(s−1)(w−1)(s+w−3/2). The meromorphic continuation is represented off P=0 by Eij/P. Values of a totalized quotient on P=0 are not used. Functional equations are germ identities; polynomial vertical growth is a separate lemma.

**Proof route.** Remove the three candidate hyperplanes by multiplication. Fill the tube hole using the preceding extension. Recover the polynomial bound and use uniqueness to transport both equations.

**Direct inputs.** [Filling the remaining real twelve-gon](#tube-hull-extension), [The swap functional equation](#reciprocity-swap-equation), [The reflection functional equation](#quadratic-reflection-equation).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 Lemma 2, equation (27), p.361; proof pp.361–364.

**Atlas planet.** Double-series continuation.

<a id="double-growth"></a>
#### Polynomial growth of cleared double series

**Lemma** `TauCeti.SeveralVariableZeta.double_growth` · `AnalyticNumberTheory:AN.8/double-growth`.

For each compact real rectangle I×J there exist C,N>0 with |Eij(s,w)|≤C(1+|Ims|)^N(1+|Imw|)^N whenever Res∈I,Rew∈J. Here Eij is the entire cleared continuation.

**Proof route.** Obtain polynomial bounds on every component of the R6 shell from the compact-uniform primitive moment and uniform Gamma ratio. Normalize by (3+s)^M(3+w)^M on a real-part ball and use bounded reciprocal tube extension. Translate the ball under the functional system to cover the requested rectangle.

**Direct inputs.** [Meromorphic continuation and the three polar hyperplanes](#double-series-continuation), [Pole-aware strip first moment](#quadratic-pole-aware-strip-moment), [Bound survives tube extension](#tube-reciprocal-bound).

**Sources.** [Valentin Blomer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.363–364.

### AnalyticNumberTheory:AN.8 — Binary-cubic local and adelic zeta, singular terms, ordinary/dual series, orders and uniform bounds

<a id="pvs-local-zeta"></a>
#### Binary-cubic local zeta integrals

**Construction** `TauCeti.SeveralVariableZeta.LocalIntegral` · `AnalyticNumberTheory:AN.8/pvs-local-zeta`.

For a local field F, take V(F)=Sym³(F²) and its twisted GL2 action and discriminant P from ST.1. For a Schwartz–Bruhat test function Φ and fixed additive Haar measure dx, define the local integral over P(x)≠0 by ∫Φ(x)|P(x)|F^s dx on its proven integrability half-plane. For a nonarchimedean place with residue cardinal q and dx(O_F^4)=1, the shell density dk(U) is the measure of {x∈U:ord P(x)=k}; for Φ=1_U with U⊆O_F⁴ the resulting shell series is Σk≥0 dk(U)q^(−ks). For general Φ use Φ-weighted shell integrals, not unweighted masses. Zero-discriminant mass is recorded separately.

**Proof route.** Import the invariant/action and local field normalization rather than redefining them. Restrict away from P=0 before forming complex powers. Decompose an integral test function into disjoint measurable valuation shells and apply dominated summation.

**Direct inputs.** `ArithmeticStatistics:ST.1`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AdelicAlgebraicGroups:AA.2`.

**API.**

- `TauCeti.SeveralVariableZeta.LocalIntegral.integral` (constructor): The displayed Haar integral on the nondegenerate locus.
- `TauCeti.SeveralVariableZeta.LocalIntegral.shellDensity` (constructor): Haar measure of the kth discriminant-valuation shell.
- `TauCeti.SeveralVariableZeta.LocalIntegral.shell_sum` (characterisation): For supported integral Φ with an absolutely integrable shell expansion, its integral equals the weighted shell sum.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.LocalIntegral.test_zero_test_function` (degenerate): The integral of Φ=0 is0.
- `TauCeti.SeveralVariableZeta.LocalIntegral.test_unit_support` (characterisation): When Φ is supported where |P|=1, the integral is ∫Φ dx, independently of s.
- `TauCeti.SeveralVariableZeta.LocalIntegral.test_linear_benchmark` (computation): For the one-variable linear invariant x on O_F, the normalized integral is (1−q^(−1))/(1−q^(−s−1)) for Res>−1; its shells have masses (1−q^(−1))q^(−k).

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

**Atlas planet.** Prehomogeneous local zeta integral.

<a id="cubic-shintani-series"></a>
#### Signature-refined cubic Shintani zeta functions

**Construction** `TauCeti.SeveralVariableZeta.CubicShintani` · `AnalyticNumberTheory:AN.8/cubic-shintani-series`.

For a number field F and each archimedean cubic signature α, let ξF,α(s)=ΣR |Aut R|^(−1)|Disc R|^(−s), over isomorphism classes of locally free rank-three O_F-algebras with nonzero discriminant and signature α. Reducible rings and nonmaximal orders are retained. Define the dual series by the same weights on rings satisfying 3|tr(t) for every t. ST supplies the actual isomorphism classes, discriminants, trace and automorphism groups; AN.8 owns the analytic series.

**Proof route.** Group the ST isomorphism classes by absolute discriminant norm, summing inverse stabilizer orders. Preserve the archimedean signature and the trace-divisible dual subset. Use absolute convergence only on Res>1 and distinguish the analytic continuation.

**Direct inputs.** `ArithmeticStatistics:ST.0`, `ArithmeticStatistics:ST.1`, `AnalyticNumberTheory:AN.4`, `mathlib:LSeries`.

**API.**

- `TauCeti.SeveralVariableZeta.CubicShintani.coefficient` (constructor): The coefficient at m is the sum of reciprocal automorphism orders for signature α and discriminant norm m.
- `TauCeti.SeveralVariableZeta.CubicShintani.series` (constructor): The weighted series ξF,α on Res>1.
- `TauCeti.SeveralVariableZeta.CubicShintani.dual` (constructor): The trace-divisible subseries.
- `TauCeti.SeveralVariableZeta.CubicShintani.dual_le` (relation): For real σ>1, 0≤ξhatF,α(σ)≤ξF,α(σ).

**Unit tests.**

- `TauCeti.SeveralVariableZeta.CubicShintani.test_split_weight` (computation): The contribution of O_F³ is weighted by1/6, not1.
- `TauCeti.SeveralVariableZeta.CubicShintani.test_zero_discriminant` (non-example): O_F[ε]/ε³ has zero discriminant and contributes no term.
- `TauCeti.SeveralVariableZeta.CubicShintani.test_dual_subseries` (compatibility): A ring violating 3|tr(t) is omitted by the dual selector, while its ordinary coefficient is unchanged.

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 definition before Proposition 3.7 and dual definition in (3), p.12.

**Atlas planet.** Cubic Shintani zeta function.

<a id="cubic-archimedean-matrix"></a>
#### The binary-cubic archimedean functional-equation matrix

**Construction** `TauCeti.SeveralVariableZeta.ArchMatrix` · `AnalyticNumberTheory:AN.8/cubic-archimedean-matrix`.

At a real place use row/column signatures F_v³ and F_v×C, with c11=c22=(1/2)sin(2πs), c12=(3/2)sin(πs), c21=(1/2)sin(πs). At a complex place the single coefficient is sin²(πs)sin(πs−π/6)sin(πs+π/6). Define cαβ(s) as the product over archimedean places. The degree is n=r1+2r2, not the number of places.

**Proof route.** Use the real two-by-two table in Proposition3.7. Use its complex scalar and tensor all archimedean local factors. Track the cubic-signature order in each coordinate.

**Direct inputs.** `mathlib:Complex.cpow`, [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series).

**API.**

- `TauCeti.SeveralVariableZeta.ArchMatrix.realEntry` (constructor): The specified real two-by-two sine matrix.
- `TauCeti.SeveralVariableZeta.ArchMatrix.complexEntry` (constructor): The specified complex-place sine product.
- `TauCeti.SeveralVariableZeta.ArchMatrix.entry` (constructor): Product of the archimedean entries for signatures α,β.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.ArchMatrix.test_real_one` (computation): Each real entry vanishes at s=1.
- `TauCeti.SeveralVariableZeta.ArchMatrix.test_complex_order_two` (characterisation): The complex entry vanishes to order2 at s=1.
- `TauCeti.SeveralVariableZeta.ArchMatrix.test_tensor_degree` (compatibility): Every global entry vanishes to order at least r1+2r2 at s=1.

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 equation (3.1) and preceding complex/diagonal cases, p.12.

<a id="cubic-orbit-to-coefficient"></a>
#### From arithmetic cubic orbits to analytic coefficients

**Comparison** `TauCeti.SeveralVariableZeta.cubic_orbit_to_coefficient` · `AnalyticNumberTheory:AN.8/cubic-orbit-to-coefficient`.

ST.1 Delone–Faddeev and stabilizer identifications transport the inverse-automorphism-weighted cubic-ring count to binary-cubic orbit coefficients, preserving discriminant, signature and the trace-divisible dual lattice. Over general O_F, nonprincipal locally free modules are included by the full adelic orbit interface.

**Proof route.** Use the orbit bijection only over the base rings for which ST has proved it. Match the inverse stabilizer factors and discriminants exactly. Request the general-number-field adelic extension rather than treating all rank-three modules as free.

**Direct inputs.** [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series), `ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings`, `ArithmeticStatistics:ST.1/automorphisms-of-cubic-rings-are-stabilizers`.

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

<a id="local-measure-normalization"></a>
#### Self-dual versus integral-normalized measures

**Lemma** `TauCeti.SeveralVariableZeta.local_measure_normalization` · `AnalyticNumberTheory:AN.8/local-measure-normalization`.

For the alternating binary-cubic pairing [x,y]=x1y4−x2y3/3+x3y2/3−x4y1, self-dual dx=|3|^(−1)∏dxj. If each coordinate self-dual measure gives O mass q^(−e/2), then dx(O⁴)=|3|^(−1)q^(−2e). With dg(GL2(O))=1, bF=|3|^(−1)q^(−2e)(1−q^(−1))(1−q^(−2)). Dividing by dx(O⁴) yields the integral-normalized constant; at residue characteristic 3 the |3| factor cannot be discarded before this conversion.

**Proof route.** Compute the determinant of the alternating pairing relative to the coordinate self-dual measure. The two 1/3 entries contribute the factor |3|^(-1). Multiply four coordinate lattice masses and then the normalized GL2 integral factor, retaining the different exponent.

**Direct inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AdelicAlgebraicGroups:AA.2`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), (2.1)–(2.4), pp.37–38.

<a id="local-orbit-jacobian"></a>
#### Binary cubic orbital Jacobian

**Lemma** `TauCeti.SeveralVariableZeta.local_orbit_jacobian` · `AnalyticNumberTheory:AN.8/local-orbit-jacobian`.

For an open orbit α and representative xα, the map g↦g·xα has covering degree oα. Its measure change satisfies dx/|P(x)|=bF dg along each sheet, with bF as in the local measure normalization. Consequently ∫αΦ dx=bF|P(xα)|/oα ∫G|det g|²Φ(g·xα)dg.

**Proof route.** Differentiate the orbit map in four GL2 matrix coordinates and use its discriminant Jacobian. Account for the finite stabilizer covering, then evaluate the remaining Haar scalar on the Iwasawa normalization.

**Direct inputs.** [Self-dual versus integral-normalized measures](#local-measure-normalization), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), (2.4), p.38.

<a id="local-density-coefficient-comparison"></a>
#### Local density and coefficient conventions agree

**Comparison** `TauCeti.SeveralVariableZeta.local_density_coefficient_comparison` · `AnalyticNumberTheory:AN.8/local-density-coefficient-comparison`.

For a nonarchimedean characteristic-zero local field with residue size q, additive dx normalized by dx(O⁴)=1 and dg normalized by dg(GL2(O))=1, an open orbit α with representative xα, Δ=P(xα) and stabilizer order oα satisfies ∫α Φ(x)|P(x)|^(s−1)dx = (1−q^(−1))(1−q^(−2)) |Δ|^s/oα · ∫GL2(F) |det g|^(2s)Φ(g·xα)dg, whenever either integral is absolutely convergent. The stabilizer orders are 6,2,3,1 for split, quadratic, cyclic cubic, and non-Galois cubic types. Local additive mass is not itself a global arithmetic count.

**Proof route.** Match the discriminant invariant before specializing motivic/local functions. Use the measure dx(O_F^4)=1 to identify shell masses. Record the orbit-dependent local normalizing constants and small-residue-characteristic cases as the next original-source leaves.

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), [Self-dual versus integral-normalized measures](#local-measure-normalization), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Proposition 2.2 and (2.4), pp.36–38.

<a id="cubic-adelic-zeta"></a>
#### The selected adelic binary-cubic zeta integral

**Construction** `TauCeti.SeveralVariableZeta.CubicAdelic` · `AnalyticNumberTheory:AN.8/cubic-adelic-zeta`.

With the ST binary-cubic representation and AA.2 quotient Haar measure, define Z(Φ,s)=∫GL2(A_F)/GL2(F) |det g|^(2s) Σx∈V(F),Disc x≠0 Φ(g·x) dg. Use the twisted action (g·f)(u,v)=det(g)^(−1)f((u,v)g), so Disc(g·f)=det(g)² Disc f. Fix local measures and the dual pairing before invoking Poisson. Its decomposition into signature-weighted ξF,α times local zeta factors is a separate comparison with its exact arithmetic adapter request. The theta sum is invariant under g↦gh for h∈GL2(F), by rational reindexing and the product formula. Transport AA.2 left-quotient measure by inversion; a left-quotient formulation instead uses Φ(g⁻¹·x) and |det g|^(−2s).

**Proof route.** Import the twisted action and discriminant covariance from ST. Prove right GL2(F)-invariance of the theta sum; the product formula makes |det h|_A=1. Transport the AA.2 left-quotient measure through inversion before forming the right-quotient integral. Prove convergence and orbit unfolding with exact local factors; those original-source leaves are recorded below.

**Direct inputs.** `ArithmeticStatistics:ST.1`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AdelicAlgebraicGroups:AA.2`.

**API.**

- `TauCeti.SeveralVariableZeta.CubicAdelic.integral` (constructor): The right-quotient integral on GL2(A_F)/GL2(F), with |det g|^(2s) and the nonzero-discriminant theta sum Φ(g·x).
- `TauCeti.SeveralVariableZeta.CubicAdelic.linear` (relation): Z(aΦ+bΨ,s)=aZ(Φ,s)+bZ(Ψ,s) when the summands are integrable.
- `TauCeti.SeveralVariableZeta.CubicAdelic.unfolding` (compatibility): Decompose by signatures and arithmetic orbit weights with the pinned local zeta factors.
- `TauCeti.SeveralVariableZeta.CubicAdelic.theta_right_invariant` (compatibility): A rational right translate reindexes the rational nonsingular theta sum by an equivalence; the sum is unchanged. The product formula makes the determinant factor invariant as well.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.CubicAdelic.test_zero` (degenerate): Z(0,s)=0.
- `TauCeti.SeveralVariableZeta.CubicAdelic.test_scaling` (compatibility): With a unit quotient carrier, Dirac measure, determinant norm 2 and theta value 3, the actual integral is 3·2^(2s). The source adapter separately certifies Disc(gx)=det(g)^2 Disc(x).
- `TauCeti.SeveralVariableZeta.CubicAdelic.test_singular_locus` (non-example): Degenerate binary cubics are excluded from the theta sum and return only as separately analyzed singular terms after Poisson.
- `TauCeti.SeveralVariableZeta.CubicAdelic.test_quotient_side` (compatibility): Right rational translation leaves the theta integrand unchanged; inversion transports it to the left quotient with inverse action and determinant exponent −2s.

**Consumers.** `AnalyticNumberTheory:AN.8`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14; [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), §2, p.511; §3, pp.515–516; definition before Theorem 4.1, p.516.

<a id="cubic-adelic-convergence"></a>
#### Adelic binary cubic convergence

**Lemma** `TauCeti.SeveralVariableZeta.cubic_adelic_convergence` · `AnalyticNumberTheory:AN.8/cubic-adelic-convergence`.

For Res>1, the right-quotient binary-cubic integral converges absolutely and locally uniformly in s and is a tempered distribution in Φ. Wright uses exponent |det|^u with Reu>2; here u=2s.

**Proof route.** Use the compact-times-Siegel-set majorant of Lemma 3.1, p.515. Cover nonsingular rational forms by x1≠0 or x2≠0; apply the Schwartz lattice-sum bound of Lemma 1.1. Integrate its explicit torus majorant for exponent σ>2 with decay parameter α>2nσ.

**Direct inputs.** [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AdelicAlgebraicGroups:AA.2`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Theorem 4.1 and proof, pp.516–517.

<a id="cubic-adelic-unfolding"></a>
#### Adelic orbital unfolding

**Lemma** `TauCeti.SeveralVariableZeta.cubic_adelic_unfolding` · `AnalyticNumberTheory:AN.8/cubic-adelic-unfolding`.

For Res>1 and a Schwartz–Bruhat Φ, Z(Φ,s)=Σ[x]∈GL2(F)\V(F)^ns |Stab(x)|^(−1)∫GL2(A_F)|det g|^(2s)Φ(g·x)dg. All rearrangements are justified by absolute convergence. Integral lattice restrictions require all class-group components, as the S-integral comparison shows.

**Proof route.** Partition nonsingular rational forms by rational GL2 orbits. Absolute convergence permits exchanging the orbit sum and quotient integral. Lift each orbit integral to GL2(A) and divide by its finite stabilizer; the lattice comparison must sum all ideal-class components.

**Direct inputs.** [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta), `ArithmeticStatistics:ST.1`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Theorem 4.1 and Proposition 4.1, pp.516–518.

<a id="cubic-class-group-components"></a>
#### All class-group components in unfolding

**Lemma** `TauCeti.SeveralVariableZeta.cubic_class_group_components` · `AnalyticNumberTheory:AN.8/cubic-class-group-components`.

The S-integral adelic zeta decomposes over the full double quotient G(A_S)\G(A)/G(F), not just the identity lattice. Each component uses its associated rank-two lattice, binary-cubic lattice and arithmetic stabilizer. This is the analytic interface needed for the ST extension to nonprincipal locally free modules.

**Proof route.** Choose double-quotient representatives and transport the rational-orbit sum into each lattice. Unfold each component with its own stabilizer. The missing general-ring parametrization remains an ST request.

**Direct inputs.** [Adelic orbital unfolding](#cubic-adelic-unfolding), `ArithmeticStatistics:ST.1`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 4.2, p.519; DW (6.8), p.73.

<a id="local-split-orbit-factor"></a>
#### Split local factor

**Lemma** `TauCeti.SeveralVariableZeta.local_split_orbit_factor` · `AnalyticNumberTheory:AN.8/local-split-orbit-factor`.

For DW standard Φ1 and u=ω(π), the split auxiliary integral Iα(ω,Φ1)=(1+u)^2/(1−u). Its four disjoint valuation regions have masses 1/(1−u),u²/(1−u),u/(1−u),u/(1−u).

**Proof route.** Divide the support of the auxiliary orbital integral into the four valuation regions of DW. Sum the two linear contributions and the constant and quadratic contributions against the geometric tail. Their numerator is (1+u)^2.

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, pp.43–44.

<a id="local-unramified-quadratic-factor"></a>
#### Unramified quadratic local factor

**Lemma** `TauCeti.SeveralVariableZeta.local_unramified_quadratic_factor` · `AnalyticNumberTheory:AN.8/local-unramified-quadratic-factor`.

The standard quadratic auxiliary integral is (1+u²)/(1−u): its two regions have t unit or valuation one, with integral basis coordinates for the unramified quadratic extension.

**Proof route.** Use an integral basis of the unramified quadratic extension to separate the unit and valuation-one support pieces. Their norm valuations contribute 1 and u^2, with a common geometric tail 1/(1-u).

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.44.

<a id="local-ramified-quadratic-factor"></a>
#### Ramified quadratic local factor

**Lemma** `TauCeti.SeveralVariableZeta.local_ramified_quadratic_factor` · `AnalyticNumberTheory:AN.8/local-ramified-quadratic-factor`.

The ramified quadratic auxiliary integral is (1+u)/(1−u). In an integral basis 1,θ with θ a uniformizer, the field norm valuation gives the two disjoint support regions used in the integral. This formulation does not require residue characteristic odd.

**Proof route.** Choose the uniformizer integral basis and distinguish the two support regions by its norm valuation. Their contributions are 1 and u over the common tail. The discriminant Jacobian stays outside this calculation, so residue characteristic two is retained.

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.44.

<a id="local-unramified-cubic-factor"></a>
#### Unramified cubic local factor

**Lemma** `TauCeti.SeveralVariableZeta.local_unramified_cubic_factor` · `AnalyticNumberTheory:AN.8/local-unramified-cubic-factor`.

The unramified cubic auxiliary integral is (1+u²+u⁴)/(1−u³)=(1−u+u²)/(1−u), from three valuation regions t of orders 0,1,2. The numerator records all three regions rather than an unjustified geometric shell law.

**Proof route.** The integral basis splits support according to three successive uniformizer valuations. Sum the contributions 1,u^2,u^4 against the step-three tail. Multiply the two rational expressions by their denominators to prove the simplification.

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.45.

<a id="local-ramified-cubic-factor"></a>
#### Ramified cubic local factor

**Lemma** `TauCeti.SeveralVariableZeta.local_ramified_cubic_factor` · `AnalyticNumberTheory:AN.8/local-ramified-cubic-factor`.

For a ramified cubic extension with integral generator θ a uniformizer, the three support regions give (1+u+u²)/(1−u³)=1/(1−u). Norm(θ) is a uniformizer in the base field, so this valuation computation retains wild discriminant factors in the separate orbital Jacobian.

**Proof route.** Use the cubic uniformizer integral basis; its field norm has valuation one. The three support pieces contribute 1,u,u^2 against the step-three tail, which simplifies to 1/(1-u). Keep the wild discriminant in the preceding Jacobian.

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), `ArithmeticStatistics:ST.1`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.45.

<a id="local-orbital-euler-factor"></a>
#### Five local orbital Euler factors

**Lemma** `TauCeti.SeveralVariableZeta.local_orbital_euler_factor` · `AnalyticNumberTheory:AN.8/local-orbital-euler-factor`.

For Φ0=1_(O⁴), an unramified quasicharacter ω and a DW standard representative, put u=ω(π). Then Zα(ω,Φ0)=ηα(u)/[(1−qu³)(1−u²)], with η=(1+u)²,1+u²,1+u,1−u+u²,1 for types split, unramified quadratic, ramified quadratic, unramified cubic, ramified cubic respectively. A ramified ω gives zero. Characteristic zero permits residue characteristics 2 and 3; their discriminant and self-dual-measure factors remain in the preceding normalization.

**Proof route.** Use the shell-removal differential identity and its integral evaluation from Propositions 3.1–3.2, pp.39–41: Z(Φ0)=(1−u)/[(1−qu³)(1−u²)] I(Φ1). Insert the five auxiliary factors, one declaration per orbit type. Compact determinant-character integration gives zero for ramified ω.

**Direct inputs.** [Binary cubic orbital Jacobian](#local-orbit-jacobian), `ArithmeticStatistics:ST.1`, [Split local factor](#local-split-orbit-factor), [Unramified quadratic local factor](#local-unramified-quadratic-factor), [Ramified quadratic local factor](#local-ramified-quadratic-factor), [Unramified cubic local factor](#local-unramified-cubic-factor), [Ramified cubic local factor](#local-ramified-cubic-factor).

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1, p.42; Euler-product comparison Theorem 6.1, p.68.

<a id="cubic-absolute-convergence"></a>
#### Absolute convergence of cubic Shintani series

**Lemma** `TauCeti.SeveralVariableZeta.cubic_absolute_convergence` · `AnalyticNumberTheory:AN.8/cubic-absolute-convergence`.

Every ξF,α(s) and dual series converges absolutely on Res>1.

**Proof route.** Use the imported bounded-discriminant coefficient estimates. Apply partial summation with a strict real-part margin. Restrict the positive coefficients for the dual series.

**Direct inputs.** [Adelic binary cubic convergence](#cubic-adelic-convergence), [All class-group components in unfolding](#cubic-class-group-components), [From arithmetic cubic orbits to analytic coefficients](#cubic-orbit-to-coefficient), [Five local orbital Euler factors](#local-orbital-euler-factor).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Proposition 3.7(1), p.12.

<a id="cubic-truncated-entire"></a>
#### Entire truncated cubic integral

**Lemma** `TauCeti.SeveralVariableZeta.cubic_truncated_entire` · `AnalyticNumberTheory:AN.8/cubic-truncated-entire`.

Restrict the right-quotient integral to |det g|≥1. The resulting Z+(Φ,u), with exponent u, is entire and a tempered distribution in Φ. On every compact u set its derivatives are dominated by the Siegel-set Schwartz majorant; u=2s is the arithmetic convention.

**Proof route.** On the truncated determinant range choose a common Schwartz-decay exponent for the compact parameter set. The convergence proof majorant absorbs log powers from u derivatives. Parameter integration gives entireness; its seminorm bound gives continuity in Φ.

**Direct inputs.** [Adelic binary cubic convergence](#cubic-adelic-convergence), `AdelicAlgebraicGroups:AA.2`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.1 and proof, p.523.

<a id="cubic-poisson-decomposition"></a>
#### Poisson decomposition of the global integral

**Lemma** `TauCeti.SeveralVariableZeta.cubic_poisson_decomposition` · `AnalyticNumberTheory:AN.8/cubic-poisson-decomposition`.

On Reu>2, additive Poisson on F^4 gives Z(Φ,u)=Z+(Φ,u)+Z+(Fourier Φ,2−u)+I(Φ,u), where I is the integral over |det|≤1 of the Fourier-transformed singular theta sum minus the original singular theta sum, including the determinant Jacobian |det|^(−2). The singular locus has exactly zero, triple-root and double-root rational orbits.

**Proof route.** Apply Poisson to the full lattice sum, subtract the singular terms, and split at |det|=1. Invert g in the small-determinant integral and use the paired contragredient action. All sums and integrals are absolutely convergent on the initial right domain.

**Direct inputs.** [Entire truncated cubic integral](#cubic-truncated-entire), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `ArithmeticStatistics:ST.1`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.2, p.523.

<a id="cubic-smoothing-residue"></a>
#### Rank-one smoothing extracts the quotient integral

**Lemma** `TauCeti.SeveralVariableZeta.cubic_smoothing_residue` · `AnalyticNumberTheory:AN.8/cubic-smoothing-residue`.

For rapidly vertically decreasing entire ψ with ψ(2)≠0, smooth the rank-one GL2 Eisenstein series by integral_Rez=x0 ψ(z)E(z,g)/(w−z) dz/(2πi). For quotient-integrable F dominated by C t(g)^c with c<2, (w−2) integral F(g)ℰ(ψ,w,g)dg tends as w decreases to 2 to ρ0ψ(2) integral F(g)dg. Here E has constant term t^(z/2)+t^((2−z)/2)φ_F(z), φ_F(z)=Z_F(z−1)/Z_F(z), and ρ0=Res Z_F(1)/Z_F(2).

**Proof route.** The AS rank-one specialization must supply the displayed constant term, residue and nonconstant Fourier bound of Lemma 6.3. Shift the smoothing contour across z=2; the residue is the constant ρ0ψ(2)/(w−2). Use its uniform weighted majorant for dominated convergence.

**Direct inputs.** `AutomorphicSpectralTheory:AS.2/eisenstein-continuation`, `AdelicAlgebraicGroups:AA.2`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Lemmas 6.1, 6.3, 6.5–6.6, pp.524–527.

<a id="cubic-zero-singular-term"></a>
#### Zero-orbit contribution

**Lemma** `TauCeti.SeveralVariableZeta.cubic_zero_singular_term` · `AnalyticNumberTheory:AN.8/cubic-zero-singular-term`.

On the determinant-one quotient the smoothed singular zero contribution is I0(Φ;ψ,w)=ψ(2)Φ(0)/(w−2) for the principal character. For a nontrivial unitary character of determinant-one ideles it vanishes.

**Proof route.** The zero theta term is constant on the quotient. Integrate the smoothed Eisenstein constant term using its residue normalization. A nontrivial unitary determinant character integrates to zero by character orthogonality.

**Direct inputs.** [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue), [Poisson decomposition of the global integral](#cubic-poisson-decomposition).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.3, p.527.

<a id="cubic-compact-average-laws"></a>
#### Compact averaging and Fourier

**Lemma** `TauCeti.SeveralVariableZeta.cubic_compact_average_laws` · `AnalyticNumberTheory:AN.8/cubic-compact-average-laws`.

For normalized Haar on the maximal compact U_A put MωΦ(x)=integral_U ω(det k)Φ(k·x)dk. This is again Schwartz–Bruhat, satisfies Mω²=Mω, transforms under k by ω(det k)^(−1), and Fourier(MωΦ)=M_(ω~ inverse)(Fourier Φ). Here ω~ is the unitary component of ω, not complex conjugation of an arbitrary power.

**Proof route.** Compactness permits the parameter integral in each Schwartz seminorm. Change k to kh in normalized Haar for equivariance and idempotence. The determinant Jacobian is 1 on U_A; the contragredient action and Fourier change of variables give the last identity.

**Direct inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AdelicAlgebraicGroups:AA.2`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Lemma 5.1, p.521.

<a id="cubic-singular-tate-restrictions"></a>
#### Singular distributions from Tate integrals

**Lemma** `TauCeti.SeveralVariableZeta.cubic_singular_tate_restrictions` · `AnalyticNumberTheory:AN.8/cubic-singular-tate-restrictions`.

T1Φ(t)=Φ(0,0,0,t), T2Φ(t)=integral_A Φ(0,0,t,u)du are Schwartz–Bruhat functions. Their Tate zeta integrals converge normally for Re z>1, continue with simple poles at 0,1, and have residues −Φ(0), integral Φ(0,0,0,u)du for T1 and −integral Φ(0,0,0,u)du, integral Φ(0,0,t,u)dtdu for T2. Apply this to MωΦ with twists ω~ inverse and ω~ to obtain Σ1(ω,Φ,z), Σ2(ω,Φ,z). The residue distributions used globally are Σ1 at z=2/3 and Σ2 at z=−1.

**Proof route.** Partial evaluation and partial integration preserve the Schwartz class. Use the Tate continuation/residue supplier, rather than a new one-dimensional zeta theory. Fourier inversion on the alternating pairing supplies the two partial-transform identities of Proposition 5.2.

**Direct inputs.** [Compact averaging and Fourier](#cubic-compact-average-laws), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Propositions 5.1–5.3 and Lemma 5.2, pp.520–522.

<a id="cubic-triple-root-unfolding"></a>
#### Unfold the triple-root orbit

**Lemma** `TauCeti.SeveralVariableZeta.cubic_triple_root_unfolding` · `AnalyticNumberTheory:AN.8/cubic-triple-root-unfolding`.

The nonzero triple-root rational orbit is the GL2(F)/B(F) orbit of (0,0,0,α). On the determinant-one quotient its smoothed integral unfolds to the idele/Tate expression in Σ1(ω,Φ,(z+1)/3) and Σ1(ω,Φ,(3−z)/3), with the factor 1/3 from the cubic torus map. Compact averaging and rational reindexing preserve the chosen measures.

**Proof route.** Parametrize the triple-root stabilizer by the upper triangular Borel. Unfold the rational orbit, telescope the F× sum against the idele quotient and substitute the cubic torus variable. The two Eisenstein constant terms give the two displayed Tate parameters.

**Direct inputs.** [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions), `ArithmeticStatistics:ST.1`, [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.4 proof, pp.527–529.

<a id="cubic-triple-root-residue"></a>
#### Triple-root contour residues

**Lemma** `TauCeti.SeveralVariableZeta.cubic_triple_root_residue` · `AnalyticNumberTheory:AN.8/cubic-triple-root-residue`.

Modulo a function holomorphic for Rew>1, the principal-character triple-root smoothed term is ρ0ψ(2)Σ1(Φ)/[3(w−2)] + φ_F(3)ψ(3) integral(MΦ)(0,0,0,t)dt/(w−3). The Σ1 symbol denotes the continued Tate restriction at 2/3. Vertical contour bounds are those of the Tate and rank-one smoothing inputs.

**Proof route.** Move each Tate-parameter contour into the strip where its only crossed poles are known. Collect the z=2 Eisenstein residue and z=3 Tate residue; retain the cubic Jacobian 1/3.

**Direct inputs.** [Unfold the triple-root orbit](#cubic-triple-root-unfolding), [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.4, pp.527–529.

<a id="cubic-double-root-unfolding"></a>
#### Unfold the double-root orbit

**Lemma** `TauCeti.SeveralVariableZeta.cubic_double_root_unfolding` · `AnalyticNumberTheory:AN.8/cubic-double-root-unfolding`.

The double-root orbit is represented by (0,0,α,0). After unfolding and a Schwartz lattice majorant, the nonconstant Eisenstein contribution is holomorphic for Rew>1. The remaining two contours have Tate parameters −1−z and z−3, exactly as in the last display of p.531.

**Proof route.** Unfold the Borel orbit and its two determinant-one idele variables. Use Lemma 6.3 with decay exponent N>1 and the Schwartz bound with A>N[F:Q] to dominate the nonconstant contribution. Telescope the rational α sum and substitute the remaining additive coordinate.

**Direct inputs.** [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions), [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue), `ArithmeticStatistics:ST.1`.

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.5 proof, pp.529–531.

<a id="cubic-double-root-residue"></a>
#### Double-root contour residues

**Lemma** `TauCeti.SeveralVariableZeta.cubic_double_root_residue` · `AnalyticNumberTheory:AN.8/cubic-double-root-residue`.

Modulo a function holomorphic for Rew>1, the principal double-root term is ρ0ψ(2)Σ2(Φ)/(w−2) − φ_F(3)ψ(3)integral(MΦ)(0,0,0,t)dt/(w−3) + φ_F(4)ψ(4)integral(MΦ)(0,0,t,u)dtdu/(w−4). Here Σ2 is evaluated at −1; these three residues use the same normalized measures as the triple-root term.

**Proof route.** Shift the two unfolded Tate contours and collect the poles at the displayed parameters. The first residue uses Sigma2(-1); the remaining residues are the one- and two-variable restriction integrals. Preserve the signs from opposite contour shifts and the common compact average.

**Direct inputs.** [Unfold the double-root orbit](#cubic-double-root-unfolding), [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.5 conclusion, p.532.

<a id="cubic-singular-cancellation"></a>
#### Cancel the extra smoothing poles

**Lemma** `TauCeti.SeveralVariableZeta.cubic_singular_cancellation` · `AnalyticNumberTheory:AN.8/cubic-singular-cancellation`.

Fourier inversion makes the z=3 and z=4 residues cancel in the Fourier-minus-original singular difference. Its determinant-one quotient integral is [Fourier Φ(0)−Φ(0)]/ρ0 + [Σ1(Fourier Φ)−Σ1(Φ)]/3 + Σ2(Fourier Φ)−Σ2(Φ), for the principal character.

**Proof route.** Combine the three singular-orbit residue expressions and use the partial Fourier-inversion identities. Apply the smoothing residue limit; the cancelled w=3,4 terms cannot enter the global radial integral.

**Direct inputs.** [Zero-orbit contribution](#cubic-zero-singular-term), [Triple-root contour residues](#cubic-triple-root-residue), [Double-root contour residues](#cubic-double-root-residue), [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Propositions 6.6–6.7, p.532.

<a id="cubic-singular-rational-term"></a>
#### Integrate the singular radial powers

**Lemma** `TauCeti.SeveralVariableZeta.cubic_singular_rational_term` · `AnalyticNumberTheory:AN.8/cubic-singular-rational-term`.

For the principal exponent u, I(Φ,u)=−1/2{[Fourier Φ(0)/(2−u)+Φ(0)/u]/ρ0 + [Σ1(Fourier Φ)/(5/3−u)+Σ1(Φ)/(u−1/3)]/3 + Σ2(Fourier Φ)/(2−u)+Σ2(Φ)/u}, as meromorphic germs. The factor 1/2 comes from determinant scaling, and Fourier dilation has the fourth-power Jacobian.

**Proof route.** Apply the two dilation homogeneities of Lemma 5.3 to the three summands. Integrate the resulting real powers on (0,1); use analytic continuation for the rational expression.

**Direct inputs.** [Cancel the extra smoothing poles](#cubic-singular-cancellation), [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Lemma 5.3, p.522; Proposition 6.8, p.532.

<a id="cubic-adelic-meromorphic-equation"></a>
#### Adelic cubic continuation and equation

**Lemma** `TauCeti.SeveralVariableZeta.cubic_adelic_meromorphic_equation` · `AnalyticNumberTheory:AN.8/cubic-adelic-meromorphic-equation`.

The principal adelic Z(Φ,u) continues with only simple possible poles at u=0,1/3,5/3,2 and obeys Z(Φ,u)=Z(Fourier Φ,2−u). Its residue at 2 is [Fourier Φ(0)/ρ0+Σ2(Fourier Φ)]/2 and its residue at 5/3 is Σ1(Fourier Φ)/6. These are adelic residues in variable u; conversion to s=u/2 divides residues by 2.

**Proof route.** The two truncated terms are entire; the rational singular expression lists the poles. Exchange Φ and Fourier Φ and replace u by 2−u; Fourier inversion removes the sign by the rational scalar −1. Read the two rational-term coefficients, including the variable-change Jacobian.

**Direct inputs.** [Poisson decomposition of the global integral](#cubic-poisson-decomposition), [Integrate the singular radial powers](#cubic-singular-rational-term).

**Sources.** [D. J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Theorem 6.1, pp.532–533.

<a id="local-finite-fourier-dual"></a>
#### Fourier transform of the integral lattice

**Lemma** `TauCeti.SeveralVariableZeta.local_finite_fourier_dual` · `AnalyticNumberTheory:AN.8/local-finite-fourier-dual`.

For self-dual binary-cubic pairing at v, Fourier(1_(O_v^4))(x)=|3|_v^(−1)q_v^(−2e_v)·1_(O_v^4)(δ_v(x1,3x2,3x3,x4)), where δ_v generates the local different in the source convention. This identifies the trace-divisible dual selector and retains the factor at v|3.

**Proof route.** Compute the annihilator of the coordinate integral lattice under the alternating pairing and different-normalized additive character. Fourier of its indicator is its self-dual mass times the annihilator indicator. The two middle coordinates acquire 3, yielding the trace-divisible dual.

**Direct inputs.** [Self-dual versus integral-normalized measures](#local-measure-normalization), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Global test-function comparison before (6.4), p.69.

<a id="cubic-archimedean-fourier-comparison"></a>
#### Archimedean Fourier comparison

**Lemma** `TauCeti.SeveralVariableZeta.cubic_archimedean_fourier_comparison` · `AnalyticNumberTheory:AN.8/cubic-archimedean-fourier-comparison`.

After exponent u=2s, the real orbital Fourier matrix is the common factor 3^(6s−3)π^(−4s)Γ(s)^2Γ(s−1/6)Γ(s+1/6) times the real sine matrix; its real off-diagonal split-to-nonsplit entry carries the factor 3. The complex scalar is the squared gamma normalization times the four-sine factor. Transport these self-dual local equations to the integral-normalized arithmetic series before collecting the global D and 3 factors.

**Proof route.** The real matrix is Theorem 4.1, whose original Shintani distribution proof remains the exact local-Fourier gap. The complex proof uses the Gaussian polynomial-differential recurrence, a period-two entire quotient and its finite Fourier support; Theorem 4.2 fixes the scalar. Use reflection and multiplication formulas to express the arithmetic-normalized sine factors.

**Direct inputs.** [The binary-cubic archimedean functional-equation matrix](#cubic-archimedean-matrix), [Self-dual versus integral-normalized measures](#local-measure-normalization), `AnalyticNumberTheory:AN.7`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), DW Theorems 4.1–4.2, pp.48–51; LOWW (3.1) and Proposition 3.7(3), pp.12–13.

<a id="cubic-global-functional-equation"></a>
#### The cubic global matrix functional equation

**Theorem** `TauCeti.SeveralVariableZeta.cubic_global_functional_equation` · `AnalyticNumberTheory:AN.8/cubic-global-functional-equation`.

Write n=[F:Q], D=|Disc F|. Then ξF,α(1−s)=[3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6)]^n D^(4s−2) Σβ cαβ(s) ξhatF,β(s). This is LOWW Proposition 3.7(3), obtained from the original adelic equation and the stated local Fourier comparisons; the unresolved local-distribution supplier is recorded precisely.

**Proof route.** Use the PVS Poisson and local Fourier interfaces, including singular terms. Collect the explicit archimedean coefficients, gamma factors and discriminant normalization. Identify the trace-divisible dual coefficients rather than replacing the dual series by the original.

**Direct inputs.** [Adelic cubic continuation and equation](#cubic-adelic-meromorphic-equation), [Fourier transform of the integral lattice](#local-finite-fourier-dual), [Archimedean Fourier comparison](#cubic-archimedean-fourier-comparison), [All class-group components in unfolding](#cubic-class-group-components), [From arithmetic cubic orbits to analytic coefficients](#cubic-orbit-to-coefficient).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Proposition 3.7(3), pp.12–13.

<a id="cubic-continuation-data"></a>
#### Ordinary cubic continuation data

**Construction** `TauCeti.SeveralVariableZeta.CubicContinuation` · `AnalyticNumberTheory:AN.8/cubic-continuation-data`.

For an ordinary cubic series ξ initially defined on Res>1, continuation data consists of a meromorphic function agreeing with ξ there and an entire function C such that C(s)=(s−1)(s−5/6)ξcontinued(s) off the two poles. C(1) and C(5/6) determine the residues as 6C(1) and −6C(5/6). Existence and the order-one growth bound remain the separate original global theorems; the data constructor does not prove them.

**Proof route.** Use a meromorphic continuation and analytic pole clearance as actual function data with agreement on Re s>1 and off the poles. The values at the two removed poles give the residue limits after division by the other linear factor. The rational two-pole benchmark checks both signs.

**Direct inputs.** `mathlib:MeromorphicOn`, `mathlib:AnalyticOnNhd`.

**API.**

- `TauCeti.SeveralVariableZeta.CubicContinuation.clear_spec` (characterisation): The actual entire clear function agrees with the pole-cleared continued series away from 1 and 5/6.
- `TauCeti.SeveralVariableZeta.CubicContinuation.residue_one` (characterisation): (s−1)ξcontinued(s) tends to 6C(1) at 1.
- `TauCeti.SeveralVariableZeta.CubicContinuation.residue_five_sixths` (characterisation): (s−5/6)ξcontinued(s) tends to −6C(5/6) at 5/6.

**Unit tests.**

- `TauCeti.SeveralVariableZeta.CubicContinuation.test_first_pole` (computation): For ξ=R/(s−1)+T/(s−5/6), its benchmark clearance at 1 is R/6.
- `TauCeti.SeveralVariableZeta.CubicContinuation.test_second_pole` (computation): The benchmark clearance at 5/6 is −T/6.
- `TauCeti.SeveralVariableZeta.CubicContinuation.test_off_poles` (compatibility): Off both poles the benchmark clearance equals (s−1)(s−5/6) times the rational series.

**Consumers.** [The two cubic poles and their residues](#cubic-residues-and-entire-clearance): Uses this construction with its stated normalization and domain.; [Cubic meromorphic continuation](#cubic-meromorphic-continuation): Uses this construction with its stated normalization and domain..

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(i)–(ii), p.71; analytic output interface refined here.

<a id="cubic-meromorphic-continuation"></a>
#### Cubic meromorphic continuation

**Lemma** `TauCeti.SeveralVariableZeta.cubic_meromorphic_continuation` · `AnalyticNumberTheory:AN.8/cubic-meromorphic-continuation`.

Each ordinary ξF,α extends meromorphically to C with at most simple poles at 1 and 5/6. Its continuation agrees with the order-weighted series on Res>1.

**Proof route.** Unfold the adelic continuation into all ideal-class components, apply the five local factors and finite dual-lattice Fourier comparison, and compare archimedean orbital integrals. Cancel the extraneous adelic factors, leaving the two arithmetic simple poles.

**Direct inputs.** [Adelic orbital unfolding](#cubic-adelic-unfolding), [Five local orbital Euler factors](#local-orbital-euler-factor), `AnalyticNumberTheory:AN.4`, [Adelic cubic continuation and equation](#cubic-adelic-meromorphic-equation), [All class-group components in unfolding](#cubic-class-group-components), [Fourier transform of the integral lattice](#local-finite-fourier-dual), [Ordinary cubic continuation data](#cubic-continuation-data).

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(i), pp.71–72; LOWW Proposition 3.7(2), p.12.

<a id="cubic-entire-order-bound"></a>
#### Order-one bound for cubic clearance

**Lemma** `TauCeti.SeveralVariableZeta.cubic_entire_order_bound` · `AnalyticNumberTheory:AN.8/cubic-entire-order-bound`.

For each signature α and ε>0 there is Cε>0 such that the entire cleared cubic function satisfies |CF,α(s)|≤exp(Cε(1+|s|)^(1+ε)) for all s∈C. This is order at most one, independent of the algebraic pole-clearance construction.

**Proof route.** The cited theorem states order one for the exponent-u series; replacing u by 2s preserves that order. A quantitative proof requires the vertical estimates for the truncated adelic distribution and archimedean factors; this exact source-proof input is a recorded gap, not a consequence of merely removing two poles.

**Direct inputs.** [Cubic meromorphic continuation](#cubic-meromorphic-continuation), [Ordinary cubic continuation data](#cubic-continuation-data), `AnalyticNumberTheory:AN.5`.

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(ii), p.71; LOWW Proposition 3.7(5), p.13.

<a id="cubic-residues-and-entire-clearance"></a>
#### The two cubic poles and their residues

**Theorem** `TauCeti.SeveralVariableZeta.cubic_residues_and_entire_clearance` · `AnalyticNumberTheory:AN.8/cubic-residues-and-entire-clearance`.

For each signature α, there is an entire function CF,α agreeing off the poles with (s−1)(s−5/6)ξF,α(s); it is entire of order at most 1. The two residues are specified in separate declarations. An entire cleared function retains nonzero pole limits instead of assigning totalized product values at those points.

**Proof route.** Separate the two singular-orbit contributions in the global zeta argument. Match their normalizations with AF and BF in Proposition3.7. Remove both possible simple poles and retain the order-one growth input from Wright.

**Direct inputs.** [Cubic meromorphic continuation](#cubic-meromorphic-continuation), [Ordinary cubic continuation data](#cubic-continuation-data), [Order-one bound for cubic clearance](#cubic-entire-order-bound).

**Sources.** [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(ii), p.71; LOWW Proposition 3.7(5), p.13.

<a id="arch-entry-vanishing-at-one"></a>
#### Archimedean coefficients vanish to degree order

**Lemma** `TauCeti.SeveralVariableZeta.arch_entry_vanishing_at_one` · `AnalyticNumberTheory:AN.8/arch-entry-vanishing-at-one`.

Every cαβ(s) vanishes to order at least n=r1+2r2 at s=1; each real factor has order≥1 and each complex factor has order2.

**Proof route.** Expand sin(πs) and sin(2πs) at1. At a complex place only the squared sine vanishes; the shifted sine factors are nonzero. Add orders under the finite product.

**Direct inputs.** [The binary-cubic archimedean functional-equation matrix](#cubic-archimedean-matrix).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 equation (3.1), p.12, and proof of Lemma 3.8, p.13.

<a id="gamma-unit-at-one"></a>
#### The global prefactor is a unit at one

**Lemma** `TauCeti.SeveralVariableZeta.gamma_unit_at_one` · `AnalyticNumberTheory:AN.8/gamma-unit-at-one`.

The gamma/discriminant prefactor in the cubic functional equation is holomorphic and nonzero at s=1, since its gamma arguments are1,5/6 and7/6.

**Proof route.** Check all three gamma arguments are positive at1. Use gamma holomorphy and nonvanishing there. Use positive-base exponential powers for the discriminant and3/π factors.

**Direct inputs.** [Absolute convergence of cubic Shintani series](#cubic-absolute-convergence), `mathlib:Complex.Gamma`.

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Proposition 3.7(3), p.12, and proof of Lemma 3.8, p.13.

<a id="cubic-dual-simple-poles"></a>
#### Simple poles of the dual cubic Shintani series

**Lemma** `TauCeti.SeveralVariableZeta.cubic_dual_simple_poles` · `AnalyticNumberTheory:AN.8/cubic-dual-simple-poles`.

For each number field F and archimedean signature α, the dual ξhatF,α has a meromorphic continuation with no poles except possible simple poles at 1 and 5/6. In particular (s−1)ξhatF,α(s) is holomorphic near 1.

**Hypotheses.** Use the trace-divisible dual series of cubic-shintani-series, with the LOWW normalizations.

**Proof route.** Use the original DW Theorem 6.2 decomposition with the trace-divisible finite test function identified by local-finite-fourier-dual. The same truncated-entire and singular-residue argument bounds pole orders by one; coefficient positivity alone does not imply this.

**Direct inputs.** [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series), [Cubic meromorphic continuation](#cubic-meromorphic-continuation), [Fourier transform of the integral lattice](#local-finite-fourier-dual).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7(4), p.13.

<a id="cubic-zero-at-origin"></a>
#### The degree-dependent zero at the origin

**Theorem** `TauCeti.SeveralVariableZeta.cubic_zero_at_origin` · `AnalyticNumberTheory:AN.8/cubic-zero-at-origin`.

For n≥2, ξF,α(0)=0. More precisely the functional equation gives vanishing order at least n−1 at0, since each dual series has at most a simple pole at1.

**Proof route.** Multiply the order-n archimedean zero by the possible order-one dual pole. The global prefactor is a local unit at1. Replace s by1−s; for n=1 no forced zero is claimed.

**Direct inputs.** [Archimedean coefficients vanish to degree order](#arch-entry-vanishing-at-one), [The global prefactor is a unit at one](#gamma-unit-at-one), [The cubic global matrix functional equation](#cubic-global-functional-equation), [The two cubic poles and their residues](#cubic-residues-and-entire-clearance), [Simple poles of the dual cubic Shintani series](#cubic-dual-simple-poles).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.8 and proof, p.13.

<a id="cubic-orders-generating-series"></a>
#### Orders in a fixed étale cubic algebra

**Theorem** `TauCeti.SeveralVariableZeta.cubic_orders_generating_series` · `AnalyticNumberTheory:AN.8/cubic-orders-generating-series`.

For an étale cubic F-algebra A, let an(A) count O_F-orders in O_A of relative index norm n. Then Σn≥1 an(A)n^(−2s)=ζF(4s)ζF(6s−1)ζA(2s)/ζA(4s) in a right half-plane. The exponent2s encodes discriminant multiplication by index².

**Proof route.** Use the local order enumeration supplied by Datskovsky–Wright Theorem6.1. Multiply local factors in their common convergence domain. Retain the index-squared exponent; converting to an index Dirichlet variable requires substituting s/2.

**Direct inputs.** [Five local orbital Euler factors](#local-orbital-euler-factor), `ArithmeticStatistics:ST.1`, `AnalyticNumberTheory:AN.4`.

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.9, p.13; explicitly cites DW86 Theorem 6.1; [Boris Datskovsky and David J. Wright](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.1 and proof, p.68; relation (6.4), p.69.

<a id="cubic-reducible-and-field-coefficient-bound"></a>
#### The weighted cubic-coefficient bound

**Lemma** `TauCeti.SeveralVariableZeta.cubic_reducible_and_field_coefficient_bound` · `AnalyticNumberTheory:AN.8/cubic-reducible-and-field-coefficient-bound`.

For every ε>0 and real σ>3/2, ξF,α(σ)≪[F:Q],σ,ε D^(1/2+ε)h2(F). Prove the separate split/quadratic-factor and cubic-field contributions using LOWW Lemma3.5 and the orders formula; the field-count input remains with ST.

**Proof route.** Decompose cubic étale algebras into split, quadratic-factor and cubic-field types. Use the appropriate discriminant/count bound for each. Sum the order-index factor with σ>3/2 and retain h2(F).

**Direct inputs.** [Orders in a fixed étale cubic algebra](#cubic-orders-generating-series), [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series), `ArithmeticStatistics:ST.3`.

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.10 and proof, pp.13–14.

<a id="cubic-reflected-bound"></a>
#### Reflected vertical bound from the matrix equation

**Lemma** `TauCeti.SeveralVariableZeta.cubic_reflected_bound` · `AnalyticNumberTheory:AN.8/cubic-reflected-bound`.

For σ<−1/2 and |t|≥1, the functional equation gives ξF,α(σ+it)≪ε,n,σ h2(F)D^(5/2−4σ+ε)(1+|t|)^(n(2−4σ)+ε), using the right-half-plane dual bound. Constants depend on the fixed real strip.

**Proof route.** Bound the dual by the ordinary positive-coefficient series at1−σ>3/2. Apply Stirling to the gamma factors and combine with sine growth. Multiply the functional-equation factor D^(2−4σ) by the right-half-plane bound h2(F)D^(1/2+ε). The combined exponent is 5/2−4σ+ε; retain the stated height power.

**Direct inputs.** [The weighted cubic-coefficient bound](#cubic-reducible-and-field-coefficient-bound), [The cubic global matrix functional equation](#cubic-global-functional-equation).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 proof of Lemma 3.11, left-boundary estimate, p.14; combine Proposition 3.7(3) with Lemma 3.10.

<a id="cubic-pole-cleared-convexity"></a>
#### Pole-aware cubic convexity bound

**Theorem** `TauCeti.SeveralVariableZeta.cubic_pole_cleared_convexity` · `AnalyticNumberTheory:AN.8/cubic-pole-cleared-convexity`.

For −1/2≤σ≤3/2, |t|≥1 and ε>0, ξF,α(σ+it)≪ε,n h2(F)D^(7/2−2σ+ε)(1+|t|)^(2n(3/2−σ)+ε). Apply Phragmén–Lindelöf to the pole-cleared function. The displayed inequality without pole exclusion is false at s=1 and5/6; the accepted LOWW erratum route already records that restriction.

**Proof route.** Use the positive-half-plane estimate at σ=3/2+ε and the reflected left estimate. Clear (s−1)(s−5/6) before interpolation and divide only where bounded away from both poles. Retain the same h2 factor on both edges.

**Direct inputs.** [Reflected vertical bound from the matrix equation](#cubic-reflected-bound), [The weighted cubic-coefficient bound](#cubic-reducible-and-field-coefficient-bound), `AnalyticNumberTheory:AN.2`, [The two cubic poles and their residues](#cubic-residues-and-entire-clearance).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.11 and proof, p.14; packet restricted to |t|≥1 to avoid poles.

<a id="cubic-residue-one"></a>
#### Cubic residue at one

**Lemma** `TauCeti.SeveralVariableZeta.cubic_residue_one` · `AnalyticNumberTheory:AN.8/cubic-residue-one`.

With AF=ζF(2)ρF/2^(r1+r2+1), residue at 1 is AF(1+3^(−rα−r2)). Here ρF is the residue of ζF at 1 and rα counts split real cubic factors.

**Proof route.** Compare the ordinary-series normalization with the adelic residue at u=2, including the factor one-half under u=2s and all local lattice masses. Insert the number-field zeta residue and sum the real signature weights, giving AF times the displayed factor.

**Direct inputs.** [Cubic meromorphic continuation](#cubic-meromorphic-continuation).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), Proposition 3.7(2), p.12; DW Theorem 6.2(i), p.71.

<a id="cubic-residue-five-sixths"></a>
#### Cubic secondary residue

**Lemma** `TauCeti.SeveralVariableZeta.cubic_residue_five_sixths` · `AnalyticNumberTheory:AN.8/cubic-residue-five-sixths`.

With BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n, residue at 5/6 is BF·3^(−rα/2). All discriminants are absolute norms.

**Proof route.** Compare the adelic Sigma1 residue at u=5/3 with the arithmetic parameter s=5/6. Evaluate the archimedean orbital integrals and finite discriminant factors in the fixed self-dual normalization; their product is BF and the remaining signature weight is 3^(-r_alpha/2).

**Direct inputs.** [Cubic meromorphic continuation](#cubic-meromorphic-continuation).

**Sources.** [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood](https://arxiv.org/pdf/2110.07712), Definition before Proposition 3.7 and Proposition 3.7(2), p.12.

### AnalyticNumberTheory:AN.9 — Compact scalar spectral and Selberg zeta, shifted determinant, identity factor and zero divisor

<a id="spectral-zeta-series"></a>
#### Positive-spectrum zeta and heat series

**Construction** `TauCeti.SpectralZeta.SpectralData` · `AnalyticNumberTheory:AN.9/spectral-zeta-series`.

For a connected compact hyperbolic surface X=Γ\H with Γ torsion-free and cocompact, genus g≥2, use Δ=−y²(∂x²+∂y²). Import the discrete spectrum0=λ0<λ1≤… with multiplicities. Define ζΔ(s)=Σj≥1 λj^(−s) on Res>1 and H(t)=Σj≥0 exp(−tλj) for t>0. The analytic continuation of ζΔ is distinguished from the totalized infinite sum.

**Proof route.** Import the compact quotient and positive scalar Laplacian. Index the nonzero spectrum with multiplicities and omit the zero eigenvalue in ζΔ. Use Weyl growth to justify the series on their stated domains.

**Direct inputs.** `ArithmeticLocallySymmetricSpaces:ALS.0`, `AutomorphicSpectralTheory:AS.4`, `mathlib:Complex.cpow`.

**API.**

- `TauCeti.SpectralZeta.SpectralData.series` (constructor): The positive-spectrum complex-power series.
- `TauCeti.SpectralZeta.SpectralData.heat` (constructor): Heat series including the single zero eigenvalue.
- `TauCeti.SpectralZeta.SpectralData.continued` (constructor): The meromorphic continuation agreeing with the positive series for Res>1.

**Unit tests.**

- `TauCeti.SpectralZeta.SpectralData.test_single_eigenvalue` (computation): For a finite spectrum consisting of λ>0, the series is λ^(−s).
- `TauCeti.SpectralZeta.SpectralData.test_zero_omitted` (non-example): The zero eigenvalue contributes1 to the heat series and contributes no term to ζΔ.
- `TauCeti.SpectralZeta.SpectralData.test_scaling` (compatibility): Replacing each positive λ by cλ for c>0 multiplies the convergent zeta series by c^(−s).

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Peter Sarnak](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

**Atlas planet.** Spectral zeta function.

<a id="selberg-primitive-product"></a>
#### The scalar Selberg primitive-geodesic product

**Construction** `TauCeti.SpectralZeta.Selberg` · `AnalyticNumberTheory:AN.9/selberg-primitive-product`.

For the same compact torsion-free quotient, let PΓ be primitive hyperbolic conjugacy classes, with the orientation/conjugacy convention of Zagier(2). For each p let ℓp=log N(p)>0. Define ZΓ(s)=∏p∈PΓ ∏k≥0 (1−exp(−(s+k)ℓp)) for Res>1; its entire continuation is separate. Primitive conjugacy classes, their inverses and geometric unoriented geodesics are not interchanged without the multiplicity comparison.

**Proof route.** Import primitive hyperbolic classes and their length normalization. Use a geodesic-count growth bound to prove absolute local product convergence. Define the continuation only after the trace-formula comparison.

**Direct inputs.** [Positive-spectrum zeta and heat series](#spectral-zeta-series), `AutomorphicSpectralTheory:AS.6`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

**API.**

- `TauCeti.SpectralZeta.Selberg.product` (constructor): The displayed double Euler product in Res>1.
- `TauCeti.SpectralZeta.Selberg.continued` (constructor): The entire continuation with the same product on Res>1.
- `TauCeti.SpectralZeta.Selberg.log_derivative` (characterisation): Z′/Z=Σp Σm≥1 ℓp exp(−msℓp)/(1−exp(−mℓp)) in Res>1.

**Unit tests.**

- `TauCeti.SpectralZeta.Selberg.test_primitive_repeat` (computation): One primitive class of lengthℓ contributes ∏k≥0(1−e^(−(s+k)ℓ)); its powers are counted by m in the logarithmic derivative.
- `TauCeti.SpectralZeta.Selberg.test_two_lengths` (compatibility): Disjoint primitive class lists multiply their products in the convergence domain.
- `TauCeti.SpectralZeta.Selberg.test_orientation` (non-example): Replacing the source class list by two copies squares the product; it changes the theorem unless its multiplicities are corrected.

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Don Zagier](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2.

**Atlas planet.** Selberg zeta function.

<a id="compact-spectrum-and-weyl"></a>
#### The compact discrete-spectrum input

**Lemma** `TauCeti.SpectralZeta.compact_spectrum_and_weyl` · `AnalyticNumberTheory:AN.9/compact-spectrum-and-weyl`.

AS.4 supplies a complete orthonormal scalar eigenbasis with finite multiplicities and Weyl counting N(Λ)~area(X)Λ/(4π). Connectedness gives the simple zero eigenvalue.

**Proof route.** Specialize the compact Hilbert-sum decomposition. Identify the scalar positive Laplacian and its kernel. Use the supplied heat/Weyl asymptotics rather than treating compactness alone as a spectrum theorem.

**Direct inputs.** [Positive-spectrum zeta and heat series](#spectral-zeta-series), `AutomorphicSpectralTheory:AS.4`.

**Sources.** [Peter Sarnak](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="spectral-weyl-summability"></a>
#### Weyl bounds imply spectral summability

**Lemma** `TauCeti.SpectralZeta.spectral_weyl_summability` · `AnalyticNumberTheory:AN.9/spectral-weyl-summability`.

For a nonnegative spectrum with one zero mode, finite multiplicities and counting function N(R)≤CR for R≥1, Σλj>0 λj^(−σ) converges for σ>1, locally uniformly in complex σ on Res>1. Also Σexp(−tλj) converges locally uniformly for t>0 and Σλj>0 λj^(−2)<∞.

**Proof route.** Use dyadic blocks 2^k≤λ<2^(k+1), each of size O(2^k). For complex parameters take the real-part infimum on the compact domain. Exponential decay dominates the same dyadic counts for heat sums.

**Direct inputs.** [The compact discrete-spectrum input](#compact-spectrum-and-weyl).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 small-time/discrete-spectrum assumptions, pp.13–15; Sarnak §1 (1.2)–(1.3), p.603.

<a id="heat-mellin-on-right-half-plane"></a>
#### Heat Mellin identity

**Lemma** `TauCeti.SpectralZeta.heat_mellin_on_right_half_plane` · `AnalyticNumberTheory:AN.9/heat-mellin-on-right-half-plane`.

For Res>1, ζΔ(s)=Γ(s)^(−1)∫0∞(H(t)−1)t^(s−1)dt.

**Proof route.** Use positive-spectrum Weyl bounds to dominate the small-t integral. Use the positive spectral gap for exponential decay as t→∞. Apply dominated interchange and the scalar gamma integral term by term.

**Direct inputs.** [The compact discrete-spectrum input](#compact-spectrum-and-weyl), [Positive-spectrum zeta and heat series](#spectral-zeta-series), `mathlib:mellin`, `mathlib:Complex.Gamma`, [Weyl bounds imply spectral summability](#spectral-weyl-summability).

**Sources.** [Peter Sarnak](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="heat-large-time-tail"></a>
#### Exponential heat decay after zero subtraction

**Lemma** `TauCeti.SpectralZeta.heat_large_time_tail` · `AnalyticNumberTheory:AN.9/heat-large-time-tail`.

If λ1>0 and the Weyl bound holds, then for t≥1, |H(t)−1|≤C exp(−λ1 t/2), with C=Σj≥1 exp(−λj/2)<∞. Consequently the Mellin integral from 1 to infinity is entire in its parameter.

**Proof route.** Monotonicity gives lambda_j>=lambda_1 for all positive modes. Split exp(-t lambda_j) into exp(-t lambda_j/2) times itself and bound one factor by exp(-t lambda_1/2). Weyl summability bounds the remaining sum at t>=1; every Mellin derivative is integrable against this exponential tail.

**Direct inputs.** [Weyl bounds imply spectral summability](#spectral-weyl-summability).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 continuation argument, pp.13–15; Sarnak §1, p.603.

<a id="heat-small-time-subtraction"></a>
#### Subtracting small-time heat coefficients

**Lemma** `TauCeti.SpectralZeta.heat_small_time_subtraction` · `AnalyticNumberTheory:AN.9/heat-small-time-subtraction`.

Write H(t)=Σj≥0 exp(−tλj), including its simple zero mode. The positive spectral Mellin integral uses H(t)−1. If H(t)=Σk=0..N ak t^(k−1)+O(t^N), then subtract Σk=0..N ak t^(k−1)−1. Its integral on (0,1) is Σk=0..N ak/(s+k−1)−1/s. The remainder integral is holomorphic for Re s>−N under locally uniform remainder bounds; thus the coefficient at s=0 is a1−1, not a1.

**Proof route.** Obtain uniform heat-remainder bounds from the heat-kernel supplier. Split the Mellin integral of H(t)−1 at 1; subtract the zero mode along with the finite heat expansion. Integrate the polynomial to Σ ak/(s+k−1)−1/s and dominate the remainder locally for Re s>−N.

**Direct inputs.** [Heat Mellin identity](#heat-mellin-on-right-half-plane), [The compact discrete-spectrum input](#compact-spectrum-and-weyl), [Exponential heat decay after zero subtraction](#heat-large-time-tail).

**Sources.** [Peter Sarnak](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="heat-subtracted-holomorphy"></a>
#### Holomorphic remainder after heat subtraction

**Lemma** `TauCeti.SpectralZeta.heat_subtracted_holomorphy` · `AnalyticNumberTheory:AN.9/heat-subtracted-holomorphy`.

If H(t)=Σk=0..N ak t^(k−1)+RN(t), with |RN(t)|≤CN t^N on (0,1], then integral_0^1 t^(z−1)RN(t)dt is holomorphic for Rez>−N, locally uniformly in z. For the positive heat trace H−1 the rational terms are Σk=0..N ak/(z+k−1)−1/z.

**Proof route.** On a compact parameter set use the lower real-part bound −N+δ and integrable majorant t^(δ−1). Parameter derivatives introduce powers of log t, still integrable; the rational terms are separate germ identities.

**Direct inputs.** [Subtracting small-time heat coefficients](#heat-small-time-subtraction).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 (4.5)–(4.6), pp.14–15; positive-spectrum correction from Sarnak (1.3), p.603.

<a id="spectral-regularity-zero"></a>
#### Spectral zeta is regular at zero

**Theorem** `TauCeti.SpectralZeta.spectral_regularity_zero` · `AnalyticNumberTheory:AN.9/spectral-regularity-zero`.

The positive spectral zeta continues meromorphically, and is analytic at0 because Γ(s)^(−1) has a simple zero there, canceling the possible simple Mellin pole. Its derivative at0 is well defined.

**Proof route.** Continue successively using finite heat subtractions. Use Γ(s+1)=sΓ(s) and Γ(1)=1 at0. Differentiate the resulting holomorphic expression, never the divergent original series.

**Direct inputs.** [Subtracting small-time heat coefficients](#heat-small-time-subtraction), `mathlib:Complex.Gamma`, [Holomorphic remainder after heat subtraction](#heat-subtracted-holomorphy).

**Sources.** [Peter Sarnak](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="spectral-regularized-determinant"></a>
#### The regularized scalar Laplace determinant

**Construction** `TauCeti.SpectralZeta.RegularizedDet` · `AnalyticNumberTheory:AN.9/spectral-regularized-determinant`.

If the meromorphic continuation ζΔ is analytic at0, define det′Δ=exp(−ζ′Δ(0)). For real v>0 use all eigenvalues includingλ0 in ζΔ+v(z)=Σj≥0(λj+v)^(−z), continued to z=0, and det(Δ+v)=exp(−∂z ζΔ+v(0)). A prime removes zero modes. No ordinary divergent eigenvalue product is assigned a value.

**Proof route.** Prove regularity at0 via the heat Mellin argument. Take the complex derivative of that continuation and exponentiate its negative. For the shifted determinant, use v>0 to keep all eigenvalues positive.

**Direct inputs.** [Positive-spectrum zeta and heat series](#spectral-zeta-series), `mathlib:mellin`, `mathlib:Complex.Gamma`, [Spectral zeta is regular at zero](#spectral-regularity-zero).

**API.**

- `TauCeti.SpectralZeta.RegularizedDet.ofZeta` (constructor): For the analytic continuation f at0, exp(−f′(0)).
- `TauCeti.SpectralZeta.RegularizedDet.shifted` (constructor): The determinant from the shifted spectral continuation.
- `TauCeti.SpectralZeta.RegularizedDet.scale` (compatibility): det′(cΔ)=c^(ζΔ(0))det′Δ for c>0.

**Unit tests.**

- `TauCeti.SpectralZeta.RegularizedDet.test_one_eigenvalue` (computation): A finite one-eigenvalue spectrum gives determinantλ.
- `TauCeti.SpectralZeta.RegularizedDet.test_empty_positive_spectrum` (degenerate): An empty positive spectrum gives1.
- `TauCeti.SpectralZeta.RegularizedDet.test_two_eigenvalues` (compatibility): A finite two-eigenvalue spectrum gives λ1λ2, including multiplicities.

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Peter Sarnak](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

**Atlas planet.** Regularized determinant.

<a id="selberg-geodesic-majorant"></a>
#### Compact geodesic-series majorant

**Lemma** `TauCeti.SpectralZeta.selberg_geodesic_majorant` · `AnalyticNumberTheory:AN.9/selberg-geodesic-majorant`.

The primitive length spectrum has positive systole ℓ0, finite counts below any height and Nprim(T)≤Cexp(T). These imply compact-normal convergence of Σp,m≥1 exp(−msℓp)/(m(1−exp(−mℓp))) on Res>1, including its s derivatives. Each primitive conjugacy class uses exactly the orientation convention of the Gaussian trace supplier.

**Proof route.** Use the positive systole to bound the geometric denominator away from zero. Sum in unit length intervals using the exponential count; on a compact right half-plane the surplus real exponent absorbs the polynomial factors produced by derivatives.

**Direct inputs.** `AutomorphicSpectralTheory:AS.6`, [The scalar Selberg primitive-geodesic product](#selberg-primitive-product).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §5 Lemma 5.1 proof, (5.9)–(5.11), pp.16–17; scalar representation.

<a id="selberg-log-product"></a>
#### Logarithmic derivative of the primitive product

**Lemma** `TauCeti.SpectralZeta.selberg_log_product` · `AnalyticNumberTheory:AN.9/selberg-log-product`.

For Res>1, expand log(1−e^(−(s+k)ℓp)) and sum k geometrically. This gives Z′/Z=Σp,m≥1 ℓp e^(−msℓp)/(1−e^(−mℓp)), locally uniformly.

**Proof route.** Use the geodesic-count bound with a strict real-part margin. Justify derivative and summation interchanges. Sum the k-series and preserve the primitive/power weights.

**Direct inputs.** [The scalar Selberg primitive-geodesic product](#selberg-primitive-product), `AutomorphicSpectralTheory:AS.6`, [Compact geodesic-series majorant](#selberg-geodesic-majorant).

**Sources.** [Don Zagier](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2.

<a id="scalar-heat-trace-formula"></a>
#### The compact scalar heat trace input

**Lemma** `TauCeti.SpectralZeta.scalar_heat_trace_formula` · `AnalyticNumberTheory:AN.9/scalar-heat-trace-formula`.

For t>0, H(t)=area(X)/(4π)∫R r tanh(πr)e^(−t(r²+1/4))dr +Σp,m≥1 ℓp/[2sinh(mℓp/2)] · e^(−t/4−(mℓp)²/(4t))/√(4πt). Class multiplicities agree with the primitive list fixed above. There are no cusp, elliptic or continuous-spectrum terms in this selected compact torsion-free case.

**Proof route.** Supply the heat test function and its Fourier transform with exact constants. Prove the trace formula accepts this noncompactly supported test function by approximation and convergence. Match spectral, identity and primitive hyperbolic terms.

**Direct inputs.** [The compact discrete-spectrum input](#compact-spectrum-and-weyl), [The scalar Selberg primitive-geodesic product](#selberg-primitive-product), `AutomorphicSpectralTheory:AS.6`.

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §5 equations (5.1)–(5.3), p.16, scalar trivial twist m=0; remove the 1/4 operator shift; no elliptic terms.

<a id="selberg-laplace-integral"></a>
#### Elementary half-order Laplace integral

**Lemma** `TauCeti.SpectralZeta.selberg_laplace_integral` · `AnalyticNumberTheory:AN.9/selberg-laplace-integral`.

For a>0 and Rew>0, integral_0^infinity t^(−3/2) exp(−w²t−a²/(4t))dt=(2sqrtπ/a)exp(−aw), initially on Re(w²)>0 and then by holomorphic continuation in Rew>0. The elementary z=0 half-order evaluation avoids a general Bessel-function package.

**Proof route.** For positive real w reduce by t=a²/(4v²) to a Gaussian integral and differentiate the usual Gaussian parameter identity. Use a common integrable majorant on compact subsets of Re(w²)>0, Rew>0. The resulting exponential expression extends to the right w half-plane.

**Direct inputs.** `mathlib:Complex.Gamma`, `mathlib:mellin`.

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §5 (5.10), Lemma 5.3 and Proposition 5.4, pp.17–18.

<a id="selberg-transform-normal-convergence"></a>
#### Normal convergence of the hyperbolic transform

**Lemma** `TauCeti.SpectralZeta.selberg_transform_normal_convergence` · `AnalyticNumberTheory:AN.9/selberg-transform-normal-convergence`.

For the scalar compact trace, choose Rew>0 and Re(w²)>C with w=s−1/2 and C large enough for the geodesic count. The heat transform is jointly holomorphic in z,s on this region, locally uniform for every compact z set; sum, integral and z derivative may be interchanged. Continuation, not the integral itself, is then used outside this region.

**Proof route.** Use the exponential length bound and the systole to dominate each term uniformly for compact parameter sets. Integrable decay at 0 comes from exp(−ℓ²/(4t)); at infinity it comes from Re(w²)>C. Log powers from z derivatives retain the same exponential majorant.

**Direct inputs.** [Compact geodesic-series majorant](#selberg-geodesic-majorant), [Elementary half-order Laplace integral](#selberg-laplace-integral).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §5 Lemmas 5.1–5.3, pp.16–18, with the explicit safe region.

<a id="hyperbolic-laplace-mellin"></a>
#### Hyperbolic transform is the Selberg logarithm

**Lemma** `TauCeti.SpectralZeta.hyperbolic_laplace_mellin` · `AnalyticNumberTheory:AN.9/hyperbolic-laplace-mellin`.

For real s>1, the Laplace–Mellin transform of the hyperbolic heat contribution in the shifted determinant has derivative at Mellin exponent0 equal to−log ZΓ(s). This is the scalar specialization of JSS Proposition5.4; the integral proof uses the explicit Laplace identity and the compact-uniform geodesic majorant.

**Proof route.** Use e^(−t(s−1/2)²) after factoring e^(−t/4) from the heat trace. Evaluate the scalar Gaussian Laplace–Mellin integral term by term. Use the absolute geodesic sum and the primitive product expansion.

**Direct inputs.** [Logarithmic derivative of the primitive product](#selberg-log-product), [The compact scalar heat trace input](#scalar-heat-trace-formula), [Elementary half-order Laplace integral](#selberg-laplace-integral), [Normal convergence of the hyperbolic transform](#selberg-transform-normal-convergence).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §5 Lemmas 5.1–5.3 and Proposition 5.4, pp.17–18; determinant proof §6.

<a id="identity-barnes-transform"></a>
#### Identity contribution and Barnes normalization

**Lemma** `TauCeti.SpectralZeta.identity_barnes_transform` · `AnalyticNumberTheory:AN.9/identity-barnes-transform`.

Let C=area(X)/(4π)=g−1. The scalar identity factor is I_g(s)=exp(2C[s log(2π)+s(1−s)+logΓ(s)−2logG(s+1)]), where G is the classical Barnes G-function normalized by G(1)=1, G(s+1)=Γ(s)G(s) and the source asymptotic expansion. The full normalization/asymptotic input is required; recurrence alone is insufficient.

**Proof route.** Differentiate the identity Laplace–Mellin term in s and evaluate the contour integral as the digamma combination in JSS(6.5). Use the normalized Barnes logarithmic derivative (source(2.8)). Recover the integration constant from the large-real-s asymptotics, as in the final paragraph of the proof.

**Direct inputs.** [The compact scalar heat trace input](#scalar-heat-trace-formula), `AnalyticNumberTheory:AN.7`.

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §6 proof of Theorem 6.1, identity contribution and asymptotic constant, pp.21–24; (2.8)–(2.9).

<a id="shifted-zeta-holomorphic"></a>
#### Two-parameter shifted spectral zeta

**Lemma** `TauCeti.SpectralZeta.shifted_zeta_holomorphic` · `AnalyticNumberTheory:AN.9/shifted-zeta-holomorphic`.

On Reu>0, Rez>1 define ζu(z)=Σj≥0 exp(−z Log(λj+u)) with the principal logarithm. Compact-uniform Weyl bounds give joint holomorphy. Heat subtraction with exp(−ut) continues it meromorphically in z, jointly holomorphic in u, and regular at z=0. It satisfies ∂u ζu(z)=−z ζu(z+1) where both sides are initially convergent, hence as germs.

**Proof route.** Bound lambda+u away from the principal logarithm cut on compact subsets of Re u>0. Weyl estimates dominate the series and derivatives for Re z>1. Multiply the full heat expansion by exp(-ut), subtract finitely many terms, and continue the resulting Mellin germs jointly.

**Direct inputs.** [Weyl bounds imply spectral summability](#spectral-weyl-summability), [Holomorphic remainder after heat subtraction](#heat-subtracted-holomorphy).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 Laplace–Mellin continuation, pp.13–15; Theorem 6.1 determinant argument, p.20.

<a id="shifted-genus-one-product"></a>
#### Genus-one determinant product

**Lemma** `TauCeti.SpectralZeta.shifted_genus_one_product` · `AnalyticNumberTheory:AN.9/shifted-genus-one-product`.

Let ζ+ be the positive spectral continuation and F(z) its analytic pole clearance (z−1)ζ+(z) near 1. The shifted determinant extends as D(u)=u exp(−ζ+′(0)+F′(1)u)∏j≥1(1+u/λj)exp(−u/λj). The product is normally convergent on all compact u sets since Σλj^(−2)<∞. On Reu>0 it equals exp(−∂z ζu(0)).

**Proof route.** Differentiate log(D(u)/u) twice; heat/Mellin differentiation gives −Σj≥1(λj+u)^(−2). The genus-one product has the same second derivative, so the quotient is exp(a+bu). At u=0 the constant is det′Δ; the linear coefficient is the finite part of ζ+ at 1, namely F′(1).

**Direct inputs.** [Two-parameter shifted spectral zeta](#shifted-zeta-holomorphic), [Weyl bounds imply spectral summability](#spectral-weyl-summability).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 regularization and eigenvalue product (4.4), pp.13–15.

<a id="shifted-entire-determinant"></a>
#### Entire shifted determinant

**Construction** `TauCeti.SpectralZeta.ShiftedDet` · `AnalyticNumberTheory:AN.9/shifted-entire-determinant`.

The canonical shifted determinant D is entire in u, agrees with the zeta determinant for Reu>0, has D(u)/u→det′Δ at 0, and includes all eigenvalues with their multiplicities. Its function, rather than a branch of its logarithm, is continued.

**Proof route.** The sum of inverse squared positive eigenvalues converges, so the genus-one canonical product converges normally on all compact u sets. Its exponential prefactor is entire and nonzero. Compare on Re u>0 by integrating the shifted-zeta derivative, fixing the constant at zero.

**Direct inputs.** [Genus-one determinant product](#shifted-genus-one-product).

**API.**

- `TauCeti.SpectralZeta.ShiftedDet.entire` (characterisation): The whole shifted family is entire.
- `TauCeti.SpectralZeta.ShiftedDet.agrees` (compatibility): On Reu>0 it is the exponentiated derivative of the jointly continued ζu.
- `TauCeti.SpectralZeta.ShiftedDet.zero_mode` (characterisation): D(u)/u tends to det′Δ at u=0, retaining the simple zero mode.

**Unit tests.**

- `TauCeti.SpectralZeta.ShiftedDet.test_zero` (degenerate): The actual infinite-family determinant vanishes at u=0, retaining the zero eigenvalue.
- `TauCeti.SpectralZeta.ShiftedDet.test_positive_shift` (compatibility): At u=1, the actual genus-one family equals exp(−ζ1′(0)).
- `TauCeti.SpectralZeta.ShiftedDet.test_actual_quarter` (non-example): If eigenvalue λ1=1/4, the actual infinite determinant at −1/4 vanishes; its quadratic pullback multiplicity is governed by the exact zero-divisor lemma.

**Consumers.** [The compact Selberg functional equation](#selberg-functional-equation): Supplies a branch-independent determinant invariant under s↦1−s.; [Selberg zeros and scalar spectral parameters](#selberg-spectral-zero-comparison): The exact zero divisor gives the spectral multiplicity..

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 (4.4), pp.13–15; Theorem 6.1, p.20.

<a id="selberg-identity-germ"></a>
#### Branch-independent identity factor

**Lemma** `TauCeti.SpectralZeta.scalar_identity_germ` · `AnalyticNumberTheory:AN.9/selberg-identity-germ`.

For integer g≥2, the scalar identity factor has the single-valued meromorphic form I_g(s)=(2π)^(2(g−1)s) exp(2(g−1)s(1−s)) Γ(s)^(2(g−1))/G(s+1)^(4(g−1)). It equals the stated exponential logarithmic formula on a simply connected right-half-plane. Its integer exponents remove logarithm branch ambiguity.

**Proof route.** Exponentiate the logarithmic formula on a simply connected right-half-plane. The integer genus-dependent exponents turn the Gamma and Barnes factors into a single-valued meromorphic function. Equality on the original domain identifies its continuation.

**Direct inputs.** [Identity contribution and Barnes normalization](#identity-barnes-transform), `AnalyticNumberTheory:AN.7`.

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §6 (6.2), p.20; scalar (8.4), p.27.

<a id="selberg-determinant-comparison"></a>
#### The compact Selberg determinant comparison

**Comparison** `TauCeti.SpectralZeta.selberg_determinant_comparison` · `AnalyticNumberTheory:AN.9/selberg-determinant-comparison`.

For the selected scalar compact surface, det(Δ+s(s−1))=ZΓ(s)I_g(s) exp(2(g−1)[2ζ′(−1)−log√(2π)]) for real s>1, extended by the proved analytic continuation. Thus det′Δ=Z′Γ(1)(2π)^(g−1)exp(4(g−1)ζ′(−1)). The sign is the corrected v2 sign; source v1(1.3) has the opposite Euler-characteristic sign.

**Proof route.** Combine the hyperbolic and identity Laplace–Mellin derivatives. Determine the additive logarithmic constant from the prescribed large-s expansion. At s=1 remove the simple zero eigenvalue and use Γ(1)=G(2)=1.

**Direct inputs.** [The regularized scalar Laplace determinant](#spectral-regularized-determinant), [Spectral zeta is regular at zero](#spectral-regularity-zero), [Hyperbolic transform is the Selberg logarithm](#hyperbolic-laplace-mellin), [Identity contribution and Barnes normalization](#identity-barnes-transform), [Entire shifted determinant](#shifted-entire-determinant), [Branch-independent identity factor](#selberg-identity-germ).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §6 Theorem 6.1 (6.1), pp.20–24, scalar m=0 and trivial representation; §8.3 (8.8), p.28.

<a id="selberg-functional-equation"></a>
#### The compact Selberg functional equation

**Theorem** `TauCeti.SpectralZeta.selberg_functional_equation` · `AnalyticNumberTheory:AN.9/selberg-functional-equation`.

With D_g(s)=I_g(s)exp(2(g−1)[2ζ′(−1)−log√(2π)]), the continued scalar Selberg function satisfies ZΓ(s)D_g(s)=ZΓ(1−s)D_g(1−s) as a meromorphic identity. This formulation fixes all Barnes branches by continuation from real s>1 and avoids an unnormalized path integral.

**Proof route.** The shifted operator Δ+s(s−1) is unchanged by s↦1−s. Use the determinant comparison on its domain and continue. Multiply by the explicit identity factors to obtain a branch-consistent equation.

**Direct inputs.** [The compact Selberg determinant comparison](#selberg-determinant-comparison), [Identity contribution and Barnes normalization](#identity-barnes-transform), [Entire shifted determinant](#shifted-entire-determinant), [Branch-independent identity factor](#selberg-identity-germ).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), Theorem 6.1 (6.1)–(6.2), p.20; scalar (8.4), p.27; (8.8), p.28.

<a id="shifted-zero-divisor"></a>
#### Exact shifted determinant zero divisor

**Lemma** `TauCeti.SpectralZeta.shifted_zero_divisor` · `AnalyticNumberTheory:AN.9/shifted-zero-divisor`.

D(u) vanishes exactly at u=−λj, with order equal to the eigenvalue multiplicity. Around each such u0, D(u)=(u−u0)^m h(u), with h holomorphic and nonzero at u0. The finite factors for that eigenvalue are separated from the normally convergent nonvanishing residual product.

**Proof route.** Separate the finitely many factors for the selected eigenvalue. The other canonical factors converge normally and are nonzero locally, as is the exponential prefactor. Their product is the analytic unit multiplying the required finite power.

**Direct inputs.** [Entire shifted determinant](#shifted-entire-determinant).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 eigenvalue regularized product (4.4), pp.13–15.

<a id="spectral-quarter-double-root"></a>
#### Spectral quadratic pullback multiplicity

**Lemma** `TauCeti.SpectralZeta.spectral_pullback_order` · `AnalyticNumberTheory:AN.9/spectral-quarter-double-root`.

For q(s)=s(s−1), if D has order m at u0=−λ and q(s0)=u0, then D∘q has order m when s0≠1/2 and order 2m when s0=1/2 (necessarily λ=1/4). This uses q(s)−q(s0)=(s−s0)(s+s0−1); at s0=1/2 it is (s−1/2)².

**Proof route.** Factor q(s)-q(s0)=(s-s0)(s+s0-1). The second factor is a unit unless s0=1/2; at that point both factors coincide. Substitute into the local determinant factorization to obtain orders m and 2m.

**Direct inputs.** [Exact shifted determinant zero divisor](#shifted-zero-divisor).

**Sources.** [Don Zagier](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), Zagier §1 spectral relation, p.2; polynomial pullback refinement.

<a id="selberg-identity-nonvanishing"></a>
#### Identity factor at spectral points

**Lemma** `TauCeti.SpectralZeta.selberg_identity_nonvanishing` · `AnalyticNumberTheory:AN.9/selberg-identity-nonvanishing`.

I_g is holomorphic and nonzero on Res>0. At s=0 it has a pole of order 2g−2, because Γ has a simple pole there and G(1)=1; at s=1 it is finite and nonzero. Thus spectral points in 0<Res<1 are unaffected, while ZΓ has order 2g−1 at 0 and order 1 at 1.

**Proof route.** Apply the Gamma and normalized Barnes zero/pole divisors in the open right half-plane. At zero Gamma has pole one while G(s+1) is a unit, giving pole order 2g-2. Combine with the simple determinant zero at q(0)=q(1)=0.

**Direct inputs.** [Branch-independent identity factor](#selberg-identity-germ), `AnalyticNumberTheory:AN.7`.

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §2.5 Barnes zeros, p.9; §8.1, pp.26–27; scalar identity factor.

<a id="selberg-spectral-zero-comparison"></a>
#### Selberg zeros and scalar spectral parameters

**Comparison** `TauCeti.SpectralZeta.selberg_spectral_zero_comparison` · `AnalyticNumberTheory:AN.9/selberg-spectral-zero-comparison`.

On 0<Res<1, zeros of the continued scalar ZΓ are exactly the solutions s(1−s)=λ>0. An eigenvalue of multiplicity m contributes order m at each root when λ≠1/4, and order 2m at s=1/2 when λ=1/4. For λ>1/4 the two roots have real part 1/2; for 0<λ<1/4 both are real in (0,1). Separately, the simple zero mode gives order 1 at s=1 and order 2g−1 at s=0 after the identity-factor pole. Other trivial zeros are not called spectral.

**Proof route.** Use the shifted determinant zeros with eigenvalue multiplicity. Separate the explicit identity-factor zeros/poles. Solve the quadratic relation and retain small positive eigenvalues.

**Direct inputs.** [The compact Selberg determinant comparison](#selberg-determinant-comparison), [Spectral quadratic pullback multiplicity](#spectral-quarter-double-root), [Identity factor at spectral points](#selberg-identity-nonvanishing).

**Sources.** [Don Zagier](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2.

<a id="shifted-finite-determinant"></a>
#### Finite spectral determinant benchmark

**Construction** `TauCeti.SpectralZeta.ShiftedDet.finite` · `AnalyticNumberTheory:AN.9/shifted-finite-determinant`.

For a finite index set and eigenvalues λj define Dfin(u)=∏j(λj+u). This is the finite-dimensional version of zeta regularization; it includes zero modes. It is a separate constructor from the infinite genus-one determinant and does not substitute for tests of that family.

**Proof route.** Multiply the finitely many affine factors, including any zero-mode factor u. Polynomial analyticity and the finite product zero criterion give the API and tests; the empty product equals one.

**Direct inputs.** `mathlib:Polynomial`.

**API.**

- `TauCeti.SpectralZeta.ShiftedDet.finite_empty` (characterisation): The empty determinant is 1.
- `TauCeti.SpectralZeta.ShiftedDet.finite_zero_iff` (characterisation): Dfin(u)=0 iff λj+u=0 for some j.
- `TauCeti.SpectralZeta.ShiftedDet.finite_entire` (characterisation): The finite determinant is entire in u.

**Unit tests.**

- `TauCeti.SpectralZeta.ShiftedDet.test_finite_empty` (degenerate): For the empty finite spectrum the shifted determinant is 1.
- `TauCeti.SpectralZeta.ShiftedDet.test_finite_single` (computation): For one finite eigenvalue λ it is λ+u.
- `TauCeti.SpectralZeta.ShiftedDet.test_quarter_pullback` (non-example): For one eigenvalue 1/4, its pullback u=s(s−1) is (s−1/2)², giving a double zero.

**Consumers.** `AnalyticNumberTheory:AN.9`: Supplies the explicitly named analytic output or arithmetic construction of this layer..

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4 regularized eigenvalue product (4.4), pp.13–15; finite specialization.

<a id="spectral-continuation-output"></a>
#### Spectral continuation output

**Lemma** `TauCeti.SpectralZeta.spectral_continuation_exists` · `AnalyticNumberTheory:AN.9/spectral-continuation-output`.

The heat-asymptotic contract yields actual positive and shifted meromorphic functions, regular at z=0, agreeing with their convergent series on Rez>1. It also yields an analytic function F=(z−1)ζ+(z) near 1. These are the fields of SpectralContinuation; existence follows from the Mellin subtraction chain, not from an arbitrary function-valued placeholder.

**Proof route.** Assemble the normally convergent right-half-plane series, the subtracted Mellin germs and regularity at zero into actual continuation functions. Their overlapping germs agree by the identity theorem. The pole-cleared germ near one is the data used in the genus-one prefactor.

**Direct inputs.** [Holomorphic remainder after heat subtraction](#heat-subtracted-holomorphy), [Two-parameter shifted spectral zeta](#shifted-zeta-holomorphic), [Spectral zeta is regular at zero](#spectral-regularity-zero).

**Sources.** [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti](https://arxiv.org/pdf/2512.16681v2), §4, pp.13–15; Sarnak §1, p.603.

### AnalyticNumberTheory:AN.9 — Bost–Connes presentation, completed dynamics, scaling-state classification, III1 and arithmetic symmetry

<a id="ax-plus-b-pair"></a>
#### The positive rational ax+b subgroup

**Construction** `TauCeti.BostConnes.axbRat` · `AnalyticNumberTheory:AN.9/ax-plus-b-pair`.

axbRat is the subgroup of GL₂(Q) consisting of matrices [1 b;0 a], with a,b rational and a>0. Its product is [1,b′+ba′;0,aa′], its inverse [1,−b/a;0,1/a]. Integral translations, the diagonal map and the two named matrix families are separate constructions.

**Proof route.** Closure: [1 b; 0 a]·[1 b′; 0 a′] = [1, b′ + b a′; 0, a a′], again with positive (2,2) entry, and the inverse of [1 b; 0 a] is [1, −b/a; 0, 1/a]. P⁺_ℤ ≤ P⁺_ℚ, and the (2,2) entry is multiplicative by the product formula. Conjugation: [1 b; 0 a][1 n; 0 1] = [1, n + b; 0, a], and multiplying by [1, −b/a; 0, 1/a] gives [1, n/a; 0, 1].

**Direct inputs.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero`, `mathlib:Subgroup.Normal`.

**API.**

- `TauCeti.BostConnes.axbRat` (constructor): P⁺_ℚ : Subgroup (GL (Fin 2) ℚ), the matrices [1 b; 0 a] with a > 0.
- `TauCeti.BostConnes.axbInt` (constructor): P⁺_ℤ : Subgroup (GL (Fin 2) ℚ), the matrices [1 n; 0 1] with n ∈ ℤ.
- `TauCeti.BostConnes.mem_axbRat_iff` (characterisation): g ∈ axbRat ↔ g 1 0 = 0 ∧ g 0 0 = 1 ∧ 0 < g 1 1.
- `TauCeti.BostConnes.axbInt_le_axbRat` (relation): axbInt ≤ axbRat.
- `TauCeti.BostConnes.diagEntry` (projection): The (2,2) entry as a homomorphism axbRat →* ℚˣ with positive values (diagEntry_pos), diagEntry (dilation a) = a and diagEntry (translation b) = 1.
- `TauCeti.BostConnes.translation` (constructor): translation b = [1 b; 0 1] ∈ axbRat, a homomorphism from Multiplicative ℚ.
- `TauCeti.BostConnes.dilation` (constructor): dilation a = [1 0; 0 a] ∈ axbRat for a > 0.
- `TauCeti.BostConnes.conj_translation` (relation): g · translation n · g⁻¹ = translation (n / diagEntry g).

**Unit tests.**

- `TauCeti.BostConnes.translation_half_mem_axbRat_not_mem_axbInt` (computation): translation (1/2) ∈ axbRat and translation (1/2) ∉ axbInt.
- `TauCeti.BostConnes.not_mem_axbRat_neg_diag` (non-example): The matrix [1 0; 0 −1] is invertible but not in axbRat: the positivity of a is part of the definition.
- `TauCeti.BostConnes.axbInt_not_normal` (non-example): axbInt is not a normal subgroup of axbRat (conjugate translation 1 by dilation 2).
- `TauCeti.BostConnes.diagEntry_mul_example` (computation): diagEntry ([1 1; 0 2] · [1 1/3; 0 3]) = 6.

**Consumers.** [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#ax-plus-b-hecke-triple): The pair is a Hecke pair.; [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra): Its Hecke ring is the Bost–Connes algebra.; [The Bost–Connes time evolution](#time-evolution): The (2,2) entry a(g) defines the time evolution.; `AnalyticNumberTheory:AN.9`: The whole Bost–Connes branch is built on this pair..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.61)–(3.65), p. 460; [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, notations (α), (β), p. 431 (PDF p. 21).

<a id="axb-integral-translations"></a>
#### Integral translation subgroup

**Construction** `TauCeti.BostConnes.axbInt` · `AnalyticNumberTheory:AN.9/axb-integral-translations`.

axbInt is the subgroup of GL₂(Q) consisting of [1 n;0 1], n∈Z, and axbInt≤axbRat.

**Proof route.** Multiply the upper triangular matrices and compute inverses. The translation coordinate remains an integer, and diagonal 1 gives positivity and inclusion in axbRat.

**Direct inputs.** [The positive rational ax+b subgroup](#ax-plus-b-pair).

**API.**

- `TauCeti.BostConnes.mem_axbInt_iff` (characterisation): Membership means lower-left=0, both diagonal entries=1 and upper-right integral.
- `TauCeti.BostConnes.axbInt_le_axbRat` (coercion): The subgroup inclusion into positive rational ax+b matrices.
- `TauCeti.BostConnes.mem_axbInt_iff` (simp): The explicit coordinate membership law.

**Unit tests.**

- `TauCeti.BostConnes.test_translation_integral` (computation): Translation 2 is integral.
- `TauCeti.BostConnes.translation_half_mem_axbRat_not_mem_axbInt` (non-example): Translation 1/2 is rational but not integral.
- `TauCeti.BostConnes.axbInt_not_normal` (non-example): Conjugation of translation 1 by dilation 2 leaves the integral subgroup.

**Consumers.** [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#ax-plus-b-hecke-triple): Supplies the subgroup whose commensurability is proved..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="axb-named-matrices"></a>
#### Translations and positive dilations

**Construction** `TauCeti.BostConnes.translation` · `AnalyticNumberTheory:AN.9/axb-named-matrices`.

translation:Multiplicative Q→axbRat sends b to [1 b;0 1]; dilation(a), for a>0, is [1 0;0 a]. These are the normal-form coordinate maps, with diagonal values 1 and a respectively.

**Proof route.** Insert the two matrices into the subgroup membership criterion. Matrix multiplication proves translation additivity and dilation multiplicativity; evaluate the diagonal entry directly.

**Direct inputs.** [The positive rational ax+b subgroup](#ax-plus-b-pair).

**API.**

- `TauCeti.BostConnes.translation` (constructor): Additive rational translations written as a multiplicative homomorphism.
- `TauCeti.BostConnes.dilation` (constructor): The positive rational diagonal matrix.
- `TauCeti.BostConnes.diagEntry_translation` (simp): Every translation has diagonal value 1.
- `TauCeti.BostConnes.diagEntry_dilation` (simp): The diagonal value of dilation(a) is a.

**Unit tests.**

- `TauCeti.BostConnes.test_translation_zero` (degenerate): Translation 0 is the identity.
- `TauCeti.BostConnes.test_dilation_one` (degenerate): Dilation 1 is the identity.
- `TauCeti.BostConnes.test_translation_add` (computation): Translations 1/2 and 1/3 compose to translation 5/6.

**Consumers.** [The presentation of the rational Bost–Connes algebra](#rational-presentation): Names representatives of the generators..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="axb-diagonal-map"></a>
#### Positive diagonal homomorphism

**Construction** `TauCeti.BostConnes.diagEntry` · `AnalyticNumberTheory:AN.9/axb-diagonal-map`.

diagEntry:axbRat→Q× takes the lower-right entry, is multiplicative and has positive rational values. It is invariant under left and right integral translations.

**Proof route.** The lower-left zero entry removes the cross term in the lower-right product. Positivity gives a nonzero rational unit; integral translations have diagonal 1, so both coset actions preserve this unit.

**Direct inputs.** [The positive rational ax+b subgroup](#ax-plus-b-pair), [Integral translation subgroup](#axb-integral-translations).

**API.**

- `TauCeti.BostConnes.diagEntry_pos` (relation): The rational value is positive.
- `TauCeti.BostConnes.diagEntry_coset_invariant` (compatibility): The value descends to an ax+b double coset.
- `TauCeti.BostConnes.diagEntry_translation` (simp): Every translation has diagonal value one.

**Unit tests.**

- `TauCeti.BostConnes.test_diagonal_one` (degenerate): The identity has diagonal value 1.
- `TauCeti.BostConnes.test_diagonal_two` (computation): Dilation 2 has value 2.
- `TauCeti.BostConnes.diagEntry_mul_example` (computation): Values 2 and 3 multiply to 6.

**Consumers.** [The Bost–Connes time evolution](#time-evolution): Defines the positive character used in complex time..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="axb-conjugation"></a>
#### Conjugation of translations

**Lemma** `TauCeti.BostConnes.conj_translation` · `AnalyticNumberTheory:AN.9/axb-conjugation`.

For g∈axbRat and b∈Q, g translation(b) g⁻¹=translation(b/diagEntry(g)).

**Proof route.** Use the explicit inverse matrix and multiply all three factors. The upper-right entry is b/a and the diagonal is 1.

**Direct inputs.** [Translations and positive dilations](#axb-named-matrices), [Positive diagonal homomorphism](#axb-diagonal-map).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="ax-plus-b-hecke-triple"></a>
#### (P⁺_ℚ, P⁺_ℤ) is a Hecke pair

**Theorem** `TauCeti.BostConnes.isHeckeTriple_axb` · `AnalyticNumberTheory:AN.9/ax-plus-b-hecke-triple`.

IsHeckeTriple (axbRat as a submonoid) axbInt axbInt: every g ∈ P⁺_ℚ commensurates P⁺_ℤ. Explicitly, for a(g) = n/m in lowest terms, P⁺_ℤ ∩ g P⁺_ℤ g⁻¹ is the translation group by mℤ, of index m in P⁺_ℤ and index n in g P⁺_ℤ g⁻¹. Equivalently (Bost–Connes' condition), the orbits of P⁺_ℤ on P⁺_ℚ/P⁺_ℤ are finite.

**Proof route.** By B.9/ax-plus-b-pair, g P⁺_ℤ g⁻¹ is translation by (m/n)ℤ, and ℤ ∩ (m/n)ℤ = mℤ because gcd(m, n) = 1. The two indices are [ℤ : mℤ] = m and [(m/n)ℤ : mℤ] = n, both finite, so g lies in the commensurator of P⁺_ℤ. IsHeckeTriple.of_diagonal applies with H = P⁺_ℤ ≤ P⁺_ℚ.

**Direct inputs.** [The positive rational ax+b subgroup](#ax-plus-b-pair), `mathlib:IsHeckeTriple`, `mathlib:IsHeckeTriple.of_diagonal`, `mathlib:Subgroup.Commensurable`, `mathlib:Subgroup.relIndex`, [Integral translation subgroup](#axb-integral-translations), [Conjugation of translations](#axb-conjugation).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.62), p. 460.

<a id="coset-coordinate-bijection"></a>
#### Double-coset coordinate bijection

**Lemma** `TauCeti.BostConnes.normalCoset_bijective` · `AnalyticNumberTheory:AN.9/coset-coordinate-bijection`.

For positive coprime n,m, b↦class([1,b/m;0,n/m]) factors through Q/Z. The resulting map from triples (n,m,γ), gcd(n,m)=1, to axbInt\axbRat/axbInt is bijective. Equality of two representatives with fixed n,m is exactly equality of γ in Q/Z.

**Proof route.** Reduce the positive rational diagonal uniquely to n/m in lowest terms. Left and right integral translations change b by Z+(n/m)Z=(1/m)Z. Multiplication by m identifies the remaining coordinate with Q/Z and proves injectivity and surjectivity.

**Direct inputs.** [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#ax-plus-b-hecke-triple), [Translations and positive dilations](#axb-named-matrices), `mathlib:Rat.num_div_den`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="double-cosets-and-degrees"></a>
#### Double cosets of the ax+b pair and their degrees

**Lemma** `TauCeti.BostConnes.degree_heckeCoset_eq_den` · `AnalyticNumberTheory:AN.9/double-cosets-and-degrees`.

The left-coset degree of an ax+b double coset X is den(cosetEntry X), where cosetEntry is its positive rational diagonal value.

**Proof route.** Left multiplication by [1 k; 0 1] sends [1 b; 0 a] to [1, b + ka; 0, a] and right multiplication by [1 j; 0 1] sends it to [1, b + j; 0, a]; so the double coset is b mod ℤ + aℤ = (1/m)ℤ, with a unchanged. HeckeCoset.degree_eq_relIndex: the degree is the index of P⁺_ℤ ∩ g P⁺_ℤ g⁻¹ in P⁺_ℤ, which is m by B.9/ax-plus-b-hecke-triple; the inverse double coset has (2,2) entry 1/a = m/n, so its degree is n.

**Direct inputs.** [Double-coset coordinate bijection](#coset-coordinate-bijection), `tauceti:HeckeCoset.degree_eq_relIndex`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.71)–(3.72), p. 461.

<a id="bost-connes-hecke-algebra"></a>
#### The Bost–Connes Hecke algebra

**Definition** `TauCeti.BostConnes.BCHecke` · `AnalyticNumberTheory:AN.9/bost-connes-hecke-algebra`.

For a field K of characteristic zero, the Bost–Connes Hecke algebra is BCHecke K = 𝕋 P⁺_ℚ P⁺_ℤ K, Tau Ceti's Hecke ring of the Hecke pair of B.9/ax-plus-b-hecke-triple with coefficients in K: finitely supported K-valued functions on double cosets, with Shimura's convolution product. Its product is the Bost–Connes convolution (f₁ ∗ f₂)(g) = Σ_{g₁ ∈ Γ/Γ₀} f₁(g₁) f₂(g₁⁻¹g) (BC (1)), because Tau Ceti's multiplicity counts pairs of left-coset representatives. K = ℚ gives the rational Hecke algebra H_ℚ(Γ, Γ₀) of ℚ-valued functions, and K = ℂ gives BC's H. The named elements are x_n = [X_n] with X_n the class of dilation n, x′_n = [X_n⁻¹] the class of dilation (1/n), and e(γ) = [class of translation γ] for γ ∈ ℚ/ℤ. For K = ℂ the involution is f*(X) = conj f(X⁻¹), which sends x_n to x′_n and e(γ) to e(−γ).

**Hypotheses.** K a field of characteristic zero (for the involution, K = ℂ).

**Proof route.** The ring structure is Tau Ceti's HeckeCosetModule.instRingHeckeRing for the Hecke triple of B.9/ax-plus-b-hecke-triple; the K-algebra structure is the coefficientwise scalar action. Agreement with BC's convolution: for double cosets D₁ = Γ₀gΓ₀ = ⊔ σᵢgΓ₀ and D₂ = Γ₀hΓ₀ = ⊔ τⱼhΓ₀, (1_{D₁} ∗ 1_{D₂})(d) counts the i with d ∈ σᵢ g D₂, and for each such i exactly one j has dΓ₀ = σᵢ g τⱼ h Γ₀; this is Tau Ceti's multiplicity m(g, h; d). e(γ) depends only on γ mod ℤ, since the class of translation b is b mod ℤ + 1·ℤ (B.9/double-cosets-and-degrees). The involution: Γ is a group, so X ↦ X⁻¹ is an involution of the double cosets that reverses products (the multiplicity of (h⁻¹, g⁻¹; d⁻¹) equals that of (g, h; d), with degrees exchanged as in BC (2)); with complex conjugation of coefficients it is a conjugate-linear anti-automorphism.

**Direct inputs.** [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#ax-plus-b-hecke-triple), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `mathlib:HeckeRing`, `mathlib:HeckeCosetModule`, `tauceti:HeckeCosetModule.instRingHeckeRing`, `tauceti:HeckeCosetModule.single`, `tauceti:HeckeCosetModule.mul_single_single`, `mathlib:AddCircle`.

**API.**

- `TauCeti.BostConnes.BCHecke` (constructor): BCHecke K := HeckeRing axbRat.toSubmonoid axbInt K, with Ring and Algebra K instances.
- `TauCeti.BostConnes.BCHecke.x` (constructor): x n = single [X_n] for n : ℕ+, X_n the double coset of dilation n.
- `TauCeti.BostConnes.BCHecke.x'` (constructor): x' n = single [X_n⁻¹], the double coset of dilation (1/n).
- `TauCeti.BostConnes.BCHecke.e` (constructor): e : ℚ/ℤ → BCHecke K (AddCircle (1 : ℚ) as ℚ/ℤ), e γ = single [class of translation γ].
- `TauCeti.BostConnes.BCHecke.e_zero` (simp): e 0 = 1.
- `TauCeti.BostConnes.BCHecke.e_add` (relation): e (γ + δ) = e γ * e δ.
- `TauCeti.BostConnes.BCHecke.mul_eq_convolution` (compatibility): (f₁ * f₂) evaluated at the class of d is Σ over left cosets g₁Γ₀ of f₁(g₁) f₂(g₁⁻¹d): Tau Ceti's product is Bost–Connes' convolution (1).
- `TauCeti.BostConnes.BCHecke.star` (structure): For K = ℂ: a StarRing structure with (star f) X = conj (f X⁻¹), star (x n) = x' n, star (e γ) = e (−γ).
- `TauCeti.BostConnes.BCHecke.map` (functoriality): A field homomorphism φ:K→L induces a ring homomorphism on coefficients, compatible with x, x′ and e. If an algebra structure on L induced by φ is supplied it is a K-algebra homomorphism. The rational inclusion is injective.

**Unit tests.**

- `TauCeti.BostConnes.e_half_mul_self` (computation): e (1/2) * e (1/2) = 1 in BCHecke ℚ.
- `TauCeti.BostConnes.x'_mul_x_two` (computation): x' 2 * x 2 = 2 in BCHecke ℚ: the two left cosets of X₂⁻¹ both multiply into the identity coset.
- `TauCeti.BostConnes.x_mul_x'_two` (computation): x 2 * x' 2 = 1 + e (1/2) in BCHecke ℚ, so x 2 is not invertible.
- `TauCeti.BostConnes.not_commute_e_half_x_two` (non-example): e (1/2) * x 2 ≠ x 2 * e (1/2): the algebra is not commutative, unlike the GL₂ Hecke rings.
- `TauCeti.BostConnes.x_one` (degenerate): x 1 = 1 and x' 1 = 1.

**Consumers.** [The presentation of the rational Bost–Connes algebra](#rational-presentation): Presented by the x_n, x′_n and e(γ).; [The Bost–Connes time evolution](#time-evolution): The time evolution acts on it.; [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation): It acts on ℓ²(ℕ≥1).; [KMS_β states on the Bost–Connes algebra](#kms-states): KMS states are states on it.; [Cyclotomic values and Galois action on extremal KMS∞ states](#galois-action-on-ground-states): Its ℚ-form carries the arithmetic of the ground states..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.61)–(3.65), p. 460; [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, proof of Proposition 18, formulas (1)–(2), p. 431 (PDF p. 21); [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, notations (α), (β), p. 431 (PDF p. 21).

**Atlas planet.** Bost–Connes Hecke algebra.

<a id="bc-relation-left-inverse"></a>
#### For n≥1, x′n xn=n·1.

**Lemma** `TauCeti.BostConnes.BCHecke.x_prime_mul_x` · `AnalyticNumberTheory:AN.9/bc-relation-left-inverse`.

For n≥1, x′n xn=n·1.

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** Count the n left-coset representatives of Xn inverse; each product with Xn is in the identity class. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-relation-coprime"></a>
#### For coprime n,m≥1, xn x′m=x′m xn.

**Lemma** `TauCeti.BostConnes.BCHecke.x_mul_x_prime_of_coprime` · `AnalyticNumberTheory:AN.9/bc-relation-coprime`.

For coprime n,m≥1, xn x′m=x′m xn.

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** Use the finite coset decomposition and the residue bijection modulo coprime n,m. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-relation-dilations"></a>
#### For n,m≥1, x(nm)=xn xm.

**Lemma** `TauCeti.BostConnes.BCHecke.x_mul` · `AnalyticNumberTheory:AN.9/bc-relation-dilations`.

For n,m≥1, x(nm)=xn xm.

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** The positive integral dilation cosets have the single representative needed for this product. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-relation-inverse-dilations"></a>
#### For n,m≥1, x′(nm)=x′n x′m.

**Lemma** `TauCeti.BostConnes.BCHecke.x_prime_mul` · `AnalyticNumberTheory:AN.9/bc-relation-inverse-dilations`.

For n,m≥1, x′(nm)=x′n x′m.

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** Compute the inverse dilation coset representatives and count each output once. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-gcd-cancellation"></a>
#### Cancellation of common dilation factors

**Lemma** `TauCeti.BostConnes.mu_star_mul_gcd` · `AnalyticNumberTheory:AN.9/bc-gcd-cancellation`.

For q=gcd(m,n), μ_m* μ_n=μ_(n/q) μ_(m/q)*. The rational version includes the scalar q: x′_m x_n=q x_(n/q) x′_(m/q).

**Proof route.** Factor n and m by q=gcd(n,m), cancel the common isometry using the left-inverse relation and commute the remaining coprime factors. Rescaling back to x and x-prime contributes the scalar q.

**Direct inputs.** [For n≥1, x′n xn=n·1.](#bc-relation-left-inverse), [For coprime n,m≥1, xn x′m=x′m xn.](#bc-relation-coprime), [For n,m≥1, x(nm)=xn xm.](#bc-relation-dilations), [For n,m≥1, x′(nm)=x′n x′m.](#bc-relation-inverse-dilations).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 proof, p.433.

<a id="bc-relation-preimage-sum"></a>
#### For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.

**Lemma** `TauCeti.BostConnes.BCHecke.x_mul_e_mul_x_prime` · `AnalyticNumberTheory:AN.9/bc-relation-preimage-sum`.

For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** Enumerate the n residue representatives of the inverse dilation and match the translations to the n-element fiber. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-preimage-finite"></a>
#### Finite translation fibres

**Lemma** `TauCeti.BostConnes.preimage_ncard` · `AnalyticNumberTheory:AN.9/bc-preimage-finite`.

For n≥1 and γ∈Q/Z, {δ:nδ=γ} has exactly n elements. For γ represented by a∈Q, its elements are (a+j)/n modulo Z, 0≤j<n.

**Proof route.** Choose a rational lift of gamma. The n displayed preimages are distinct modulo Z, since their differences are (j-k)/n. Every preimage differs from the chosen lift divided by n by an element of the n-torsion subgroup.

**Direct inputs.** `mathlib:AddCircle`, `mathlib:PNat`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Proposition 3.23, relation (3.51), p.457; finite coset calculation pp.431–433 of BC95.

<a id="bc-normal-form-gcd-reduction"></a>
#### Reduction to coprime normal forms

**Lemma** `TauCeti.BostConnes.normalForm_reduce_gcd` · `AnalyticNumberTheory:AN.9/bc-normal-form-gcd-reduction`.

For q=gcd(n,m), x_n eγ x′_m=Σqδ=γ x_(n/q)eδ x′_(m/q). After the finite sum every remaining dilation pair is coprime.

**Proof route.** Factor out the common dilation q. Apply its preimage-sum relation to e(gamma), then multiply by the remaining two dilation factors. The preimage cardinality gives a finite sum and the new dilation pair is coprime.

**Direct inputs.** [For n,m≥1, x(nm)=xn xm.](#bc-relation-dilations), [For n,m≥1, x′(nm)=x′n x′m.](#bc-relation-inverse-dilations), [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#bc-relation-preimage-sum), [Finite translation fibres](#bc-preimage-finite).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 proof, p.433.

<a id="bc-relation-transport"></a>
#### For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).

**Lemma** `TauCeti.BostConnes.BCHecke.e_mul_x` · `AnalyticNumberTheory:AN.9/bc-relation-transport`.

For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** The corresponding triangular matrices multiply to the same representative. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-relation-translation-add"></a>
#### For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).

**Lemma** `TauCeti.BostConnes.BCHecke.e_add` · `AnalyticNumberTheory:AN.9/bc-relation-translation-add`.

For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** Multiply the single translation representatives, independent of their integer lifts. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="bc-normal-form-product"></a>
#### Normal-form multiplication and common-divisor reduction

**Lemma** `TauCeti.BostConnes.bc_normal_form_product` · `AnalyticNumberTheory:AN.9/bc-normal-form-product`.

The K-linear span of the coprime normal forms x_n eγ x′_m is a subalgebra of BCHecke K; over C it is star closed. Product reduction uses the gcd cancellation and finite preimage reduction in separate lemmas.

**Proof route.** Use the separately listed generator relations; do not reprove them inside the normal-form closure lemma. Use the displayed gcd cancellation and character-transport formulas of p.433. Reduce a noncoprime outer pair with μq eγ μq*=q^(−1)Σqδ=γ eδ.

**Direct inputs.** [Cancellation of common dilation factors](#bc-gcd-cancellation), [Reduction to coprime normal forms](#bc-normal-form-gcd-reduction), [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#bc-relation-transport), [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#bc-relation-translation-add).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="bc-normal-form-support"></a>
#### Normal-form support

**Lemma** `TauCeti.BostConnes.BCHecke.x_mul_e_mul_x'` · `AnalyticNumberTheory:AN.9/bc-normal-form-support`.

For positive coprime n,m and γ represented by a∈Q, x_n eγ x′_m is the single Hecke basis vector at [1,a/m;0,n/m], with coefficient 1. Over C the corresponding μ-normal form is multiplied by (nm)^(−1/2).

**Proof route.** Apply the Hecke single-product multiplicities to the two dilations and translation. Coprimality leaves exactly the stated double coset with coefficient one; its complex normalization is the product of the two inverse square roots.

**Direct inputs.** [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#bc-relation-preimage-sum), [Double-coset coordinate bijection](#coset-coordinate-bijection), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 proof, (7), p.433, corrected γ/m.

<a id="bc-normal-form-independent"></a>
#### The corrected double-coset basis is independent

**Lemma** `TauCeti.BostConnes.bc_normal_form_independent` · `AnalyticNumberTheory:AN.9/bc-normal-form-independent`.

The family (n,m,γ)↦x_n eγ x′_m indexed by positive coprime n,m and γ∈Q/Z is linearly independent over K. Together with the support bijection it is a K-basis of BCHecke K.

**Proof route.** Compute eγ x′m using the paper convolution, obtaining upper entryγ/m. Left multiply by xn and use uniqueness of the reduced positive rational n/m. Use independence of the Tau Hecke finitely supported basis; retain E14.

**Direct inputs.** [Normal-form support](#bc-normal-form-support), [Double-coset coordinate bijection](#coset-coordinate-bijection), `tauceti:HeckeCosetModule.single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="bc-relation-translation-zero"></a>
#### e(0)=1.

**Lemma** `TauCeti.BostConnes.BCHecke.e_zero` · `AnalyticNumberTheory:AN.9/bc-relation-translation-zero`.

e(0)=1.

**Hypotheses.** K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

**Proof route.** The zero translation is the identity double coset. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="rational-presentation"></a>
#### The presentation of the rational Bost–Connes algebra

**Theorem** `TauCeti.BostConnes.BCHecke.lift` · `AnalyticNumberTheory:AN.9/rational-presentation`.

Let K be a characteristic-zero field and B a unital K-algebra. Any families X_n,X′_n,Eγ in B satisfying the eight displayed rational relations induce a unique K-algebra homomorphism BCHecke K→B taking x_n,x′_n,eγ to these families. Thus the Hecke algebra has the stated algebraic presentation; the lift is determined on the coprime normal-form basis.

**Hypotheses.** K a field of characteristic zero.

**Proof route.** Define the lift on the normal-form basis by X_n Eγ X′_m. The same finite rewriting proves product compatibility in B; check 1 and scalars. Every Hecke element is a finite basis sum, so its generator values determine the homomorphism.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), `tauceti:HeckeCosetModule.single_mul_single`, `tauceti:HeckeCosetModule.mul_single_single`, [Normal-form multiplication and common-divisor reduction](#bc-normal-form-product), [The corrected double-coset basis is independent](#bc-normal-form-independent), [For n≥1, x′n xn=n·1.](#bc-relation-left-inverse), [For n,m≥1, x(nm)=xn xm.](#bc-relation-dilations), [For n,m≥1, x′(nm)=x′n x′m.](#bc-relation-inverse-dilations), [For coprime n,m≥1, xn x′m=x′m xn.](#bc-relation-coprime), [e(0)=1.](#bc-relation-translation-zero), [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#bc-relation-translation-add), [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#bc-relation-transport), [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#bc-relation-preimage-sum).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18, p. 431 (PDF p. 21); [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, proof of Proposition 18, formula (7), p. 433 (PDF p. 23); corrected as AnalyticNumberTheory/E14; [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4, Proposition 3.23, p. 457.

<a id="time-evolution"></a>
#### The Bost–Connes time evolution

**Construction** `TauCeti.BostConnes.timeEvolution` · `AnalyticNumberTheory:AN.9/time-evolution`.

For z ∈ ℂ let σ_z : BCHecke ℂ → BCHecke ℂ be σ_z(f)(X) = a(X)^{iz} f(X), where a(X) ∈ ℚ_{>0} is the (2,2) entry of the double coset (B.9/double-cosets-and-degrees) and a^{iz} = exp(iz log a). Each σ_z is a ℂ-algebra automorphism, σ_0 = id and σ_{z+w} = σ_z σ_w; for real t, σ_t is a *-automorphism. On generators σ_z(x_n) = n^{iz}x_n, σ_z(x′_n) = n^{−iz}x′_n and σ_z(e(γ)) = e(γ). For real t this is Bost–Connes' σ_t(f)(γ) = (L(γ)/R(γ))^{−it} f(γ), because L(X)/R(X) = a(X)⁻¹.

**Proof route.** a is well defined on double cosets and multiplicative on structure constants: m(g, h; d) ≠ 0 forces a(d) = a(g)a(h), since a is a homomorphism on P⁺_ℚ that is trivial on P⁺_ℤ. Hence σ_z(f₁f₂) = σ_z(f₁)σ_z(f₂) on basis elements, σ_z is invertible with inverse σ_{−z}, and σ_{z+w} = σ_zσ_w. For real t, a(X⁻¹) = a(X)⁻¹ and |a^{it}| = 1 give σ_t(f*) = σ_t(f)*. L(X)/R(X) = den a / num a = a⁻¹ (B.9/double-cosets-and-degrees), so (L/R)^{−it} = a^{it}.

**Direct inputs.** [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), `mathlib:Complex.cpow`.

**API.**

- `TauCeti.BostConnes.timeEvolution` (constructor): timeEvolution (z : ℂ) : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ, with (timeEvolution z f) X = (a X : ℂ)^(I * z) * f X.
- `TauCeti.BostConnes.timeEvolution_zero` (simp): timeEvolution 0 = AlgEquiv.refl.
- `TauCeti.BostConnes.timeEvolution_add` (relation): timeEvolution (z + w) = (timeEvolution z).trans (timeEvolution w).
- `TauCeti.BostConnes.timeEvolution_x` (simp): timeEvolution z (x n) = (n : ℂ)^(I * z) • x n.
- `TauCeti.BostConnes.timeEvolution_x'` (simp): timeEvolution z (x' n) = (n : ℂ)^(−(I * z)) • x' n.
- `TauCeti.BostConnes.timeEvolution_e` (simp): timeEvolution z (e γ) = e γ.
- `TauCeti.BostConnes.timeEvolution_star` (compatibility): For real t, timeEvolution t (star f) = star (timeEvolution t f).
- `TauCeti.BostConnes.timeEvolution_eq_LR` (characterisation): For real t, (timeEvolution t f) X = ((L X : ℂ) / R X)^(−(I * t)) * f X with L, R the degrees of X and X⁻¹ (Bost–Connes (3.71)).

**Unit tests.**

- `TauCeti.BostConnes.timeEvolution_x_two` (computation): timeEvolution t (x 2) = 2^(I t) • x 2.
- `TauCeti.BostConnes.timeEvolution_x_mul_x'` (computation): timeEvolution z (x 2 * x' 2) = x 2 * x' 2, as it must be since x 2 * x' 2 = 1 + e (1/2) has a = 1.
- `TauCeti.BostConnes.not_multiplicative_left_degree_only` (non-example): f ↦ (X ↦ L(X)^(it) f(X)) is not multiplicative: it fixes x 2 * x' 2 = 1 + e(1/2) (all L = 1) but multiplies x' 2 by 2^(it) and fixes x 2.
- `TauCeti.BostConnes.timeEvolution_neg_half_I` (compatibility): timeEvolution (−I/2) ((n : ℂ)^(−1/2) • x n) = x n: σ_{−i/2} takes BC's μ_n to x_n (B.9/rational-forms-comparison).

**Consumers.** [KMS_β states on the Bost–Connes algebra](#kms-states): The KMS condition is taken with respect to σ at z = iβ.; [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation): Implemented by the Hamiltonian: π(σ_t f) = e^{itH}π(f)e^{−itH}.; [The two rational forms of the Bost–Connes algebra](#rational-forms-comparison): σ_{−i/2} exchanges the two rational forms.; [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#symmetry-action): Commutes with the symmetries..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.1, Lemma 3.24, (3.60), p. 459; [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.71)–(3.72), p. 461.

<a id="rational-forms-comparison"></a>
#### The two rational forms of the Bost–Connes algebra

**Comparison** `TauCeti.BostConnes.sigma_neg_half_I_map_rationalForm` · `AnalyticNumberTheory:AN.9/rational-forms-comparison`.

Inside BCHecke ℂ there are two ℚ-forms. (i) H_ℚ, the ℚ-valued functions (the image of BCHecke ℚ), spanned by the double cosets [X] = x_n e(γ) x′_m. (ii) Bost–Connes' rational algebra A_ℚ, the ℚ-span of the monomials t_{n,m,γ} = μ_n e(γ) μ*_m = (nm)^{−1/2}[X]; this is Connes–Marcolli's A_{1,ℚ}. They are different subsets (μ₂ = 2^{−1/2}x₂ ∉ H_ℚ), and the complexified time evolution at z = −i/2, σ_{−i/2}(f)(X) = a(X)^{1/2} f(X), is a ℂ-algebra automorphism of BCHecke ℂ carrying A_ℚ onto H_ℚ, with μ_n ↦ x_n and μ*_n ↦ x′_n/n. It is not a *-map. Statements about 'the rational subalgebra' are pinned to one of the two forms.

**Proof route.** t_{n,m,γ} = (nm)^{−1/2}[X] with a(X) = n/m (B.9/rational-presentation), and σ_{−i/2} multiplies [X] by (n/m)^{1/2}; the product is m^{−1}[X], a rational multiple of a basis element, and every basis element arises. So σ_{−i/2}(A_ℚ) = H_ℚ. σ_{−i/2} is multiplicative because a is multiplicative on the structure constants (B.9/time-evolution).

**Direct inputs.** [The presentation of the rational Bost–Connes algebra](#rational-presentation), [The Bost–Connes time evolution](#time-evolution).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, Proposition 3.25, p. 461; [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, after the proof of Proposition 18, p. 433 (PDF p. 23); [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, notations (α), (β), p. 431 (PDF p. 21).

<a id="bc-complex-rescaling"></a>
#### Rational and isometric generator conventions

**Lemma** `TauCeti.BostConnes.mu_relations` · `AnalyticNumberTheory:AN.9/bc-complex-rescaling`.

Over C put μ_n=n^(−1/2)x_n. Then μ_n*=n^(−1/2)x′_n, μ_n*μ_n=1, μ_n μ_n*=(1/n)Σnδ=0 eδ, and μ_n eγ μ_n*=(1/n)Σnδ=γ eδ. All positive scalar square roots use the real branch.

**Proof route.** Replace x by sqrt(n) times mu in the left-inverse and preimage-sum identities. Positivity of n fixes the square-root branch and conjugation leaves that scalar unchanged.

**Direct inputs.** [For n≥1, x′n xn=n·1.](#bc-relation-left-inverse), [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#bc-relation-preimage-sum).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18, p.431.

<a id="bc-regular-shift-bounds"></a>
#### Isometries and phase unitaries on l²(N+)

**Lemma** `TauCeti.BostConnes.regular_shift_bounds` · `AnalyticNumberTheory:AN.9/bc-regular-shift-bounds`.

S_n ε_k=ε_nk is a linear isometry; S_n* ε_k is ε_(k/n) if n divides k, and 0 otherwise. D_(u,γ)ε_k=ζ_(kuγ)ε_k is unitary. Their relations realize μ_n and eγ, giving the bounded regular representation.

**Proof route.** Compute inner products on finitely supported basis vectors. Multiplication by n is injective, so the shift preserves the squared norm; the diagonal multipliers have modulus one. Extend these maps by continuity and calculate their adjoints on the basis.

**Direct inputs.** [Rational and isometric generator conventions](#bc-complex-rescaling), `mathlib:lp`, `mathlib:HilbertBasis`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, (3.130), p.475.

<a id="regular-representation"></a>
#### The representation on ℓ²(ℕ≥1) and its Hamiltonian

**Construction** `TauCeti.BostConnes.regularRep` · `AnalyticNumberTheory:AN.9/regular-representation`.

Let ℓ² = ℓ²(ℕ≥1) (Mathlib's lp (fun _ : ℕ+ ↦ ℂ) 2) with orthonormal basis (ε_k). For u ∈ Aut(ℚ/ℤ) ≅ Ẑ^× define π_u : BCHecke ℂ → B(ℓ²) by π_u(x_n)ε_k = n^{1/2}ε_{nk}, π_u(x′_n)ε_k = n^{1/2}ε_{k/n} if n | k and 0 otherwise, π_u(e(γ))ε_k = exp(2πi k·u(γ))ε_k. Then π_u is a unital *-representation by bounded operators, with π_u(μ_n)ε_k = ε_{nk} for BC's μ_n = n^{−1/2}x_n. The Hamiltonian H is the self-adjoint operator Hε_k = log(k)ε_k, and π_u(σ_t f) = e^{itH}π_u(f)e^{−itH} for real t.

**Hypotheses.** u ∈ Aut(ℚ/ℤ); H is unbounded, with domain the k with Σ log(k)²|c_k|² < ∞.

**Proof route.** The operators are bounded: π_u(μ_n) is an isometry, π_u(μ*_n) its adjoint, and π_u(e(γ)) is diagonal unitary. They satisfy (a′)–(f′) of B.9/rational-presentation. For (f′): π_u(x_n e(γ) x′_n)ε_k = n·[n | k]·exp(2πi (k/n)u(γ))ε_k, and Σ_{nδ=γ} exp(2πi k u(δ)) = n·[n | k]·exp(2πi (k/n)u(γ)) by summing the n-th roots of unity. So the presentation defines π_u as an algebra map. Implementation: e^{itH}π_u(x_n)e^{−itH}ε_k = n^{1/2}k^{−it}(nk)^{it}ε_{nk} = n^{it}π_u(x_n)ε_k, matching σ_t(x_n) = n^{it}x_n; the e(γ) commute with H.

**Direct inputs.** [The presentation of the rational Bost–Connes algebra](#rational-presentation), [The Bost–Connes time evolution](#time-evolution), `mathlib:lp`, `mathlib:HilbertBasis`, `mathlib:Real.log`, `mathlib:PNat`, [Isometries and phase unitaries on l²(N+)](#bc-regular-shift-bounds).

**API.**

- `TauCeti.BostConnes.regularRep` (constructor): regularRep (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₐ[ℂ] (ℓ²(ℕ+) →L[ℂ] ℓ²(ℕ+)).
- `TauCeti.BostConnes.regularRep_x` (simp): regularRep u (x n) (single k 1) = (n : ℂ)^(1/2 : ℂ) • single (n * k) 1.
- `TauCeti.BostConnes.regularRep_e` (simp): regularRep u (e γ) (single k 1) = exp (2π I k u(γ)) • single k 1.
- `TauCeti.BostConnes.regularRep_star` (compatibility): regularRep u (star f) = (regularRep u f)† (adjoint).
- `TauCeti.BostConnes.hamiltonianExp` (constructor): hamiltonianExp β hβ = e^{−βH}, the bounded diagonal operator ε_k ↦ k^{−β} ε_k for β > 0; H itself is the unbounded self-adjoint diagonal operator ε_k ↦ log(k) ε_k.
- `TauCeti.BostConnes.regularRep_timeEvolution` (compatibility): π_u(σ_t f) = e^{itH} π_u(f) e^{−itH}, stated through matrix coefficients: ⟨ε_j, π_u(σ_t f) ε_k⟩ = (j/k)^{it} ⟨ε_j, π_u(f) ε_k⟩.

**Unit tests.**

- `TauCeti.BostConnes.regularRep_x_mul_x'_two` (computation): regularRep u (x 2 * x' 2) (single k 1) = (if 2 ∣ k then 2 else 0) • single k 1.
- `TauCeti.BostConnes.regularRep_one` (degenerate): regularRep u 1 = 1.
- `TauCeti.BostConnes.regularRep_mu_isometry` (compatibility): The operator 2^(−1/2) • regularRep u (x 2) is an isometry, BC's π(μ₂).
- `TauCeti.BostConnes.regularRep_x'_one_zero` (non-example): regularRep u (x' 2) (single 1 1) = 0: x′₂ is not injective in the representation, so it has no inverse.

**Consumers.** [The partition function is the Riemann zeta function](#partition-function): e^{−βH} gives the partition function ζ(β).; [The Gibbs states φ_{β,u}](#gibbs-states): The Gibbs states are traces in this representation.; [Cyclotomic values and Galois action on extremal KMS∞ states](#galois-action-on-ground-states): The ground states are vector states at ε₁..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.140)–(3.141), p. 475.

<a id="bc-diagonal-heat-operator"></a>
#### BC diagonal heat operator

**Construction** `TauCeti.BostConnes.hamiltonianExp` · `AnalyticNumberTheory:AN.9/bc-diagonal-heat-operator`.

For β>0 define e^(−βH) on l²(N+) by multiplying the kth coordinate by k^(−β). It is a bounded positive self-adjoint operator of norm 1. Its semigroup law is addition of positive β. Trace-class membership and its trace for β>1 use the existing OperatorIdeals trace contract.

**Proof route.** For k>=1 the real multipliers k^(-beta) lie in (0,1], with equality at k=1. The diagonal operator bound follows from the l2 norm formula; coordinatewise real positivity and multiplication prove positivity, adjointness and the semigroup law.

**Direct inputs.** [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), `mathlib:lp`.

**API.**

- `TauCeti.BostConnes.hamiltonianExp_apply` (characterisation): hamiltonianExp β εk=k^(−β)εk.
- `TauCeti.BostConnes.hamiltonianExp_norm` (characterisation): Its operator norm is 1.
- `TauCeti.BostConnes.hamiltonianExp_add` (relation): hamiltonianExp(β+γ)=hamiltonianExp β∘hamiltonianExp γ.

**Unit tests.**

- `TauCeti.BostConnes.hamiltonianExp_test_one` (computation): The first coordinate vector is fixed.
- `TauCeti.BostConnes.hamiltonianExp_test_two` (computation): At β=1, ε2 is multiplied by 1/2.
- `TauCeti.BostConnes.hamiltonianExp_test_positive` (characterisation): Its quadratic form is real nonnegative on every vector.

**Consumers.** [The partition function is the Riemann zeta function](#partition-function): Uses this construction with its stated normalization and domain..

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, (9)–(10), p.434; Hamiltonian description p.435.

<a id="partition-function"></a>
#### The partition function is the Riemann zeta function

**Theorem** `TauCeti.BostConnes.tsum_hamiltonian_eq_riemannZeta` · `AnalyticNumberTheory:AN.9/partition-function`.

For β>1, the diagonal sum of e^(−βH) in the positive-integer basis is Σ k^(−β)=ζ(β). The positive scalar series diverges for β≤1. The state-classification theorem, rather than this scalar identity alone, establishes the phase transition at β=1.

**Hypotheses.** β ∈ ℝ; the trace is taken as the diagonal sum in the basis (ε_k).

**Proof route.** e^{−βH}ε_k = k^{−β}ε_k, so the diagonal sum is Σ k^{−β}. For β > 1 this is riemannZeta β (zeta_eq_tsum_one_div_nat_cpow); for β ≤ 1 the series diverges by comparison with the harmonic series.

**Direct inputs.** [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), `mathlib:riemannZeta`, `mathlib:zeta_eq_tsum_one_div_nat_cpow`, [BC diagonal heat operator](#bc-diagonal-heat-operator).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.142), p. 476; [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.140)–(3.141), p. 475.

<a id="bc-gns-generator-bounds"></a>
#### Algebraic GNS generator estimates

**Lemma** `TauCeti.BostConnes.algebraic_gns_generator_bounds` · `AnalyticNumberTheory:AN.9/bc-gns-generator-bounds`.

For every positive normalized algebraic functional φ, the GNS quotient seminorm obeys ‖μ_n[a]‖φ=‖[a]‖φ, ‖eγ[a]‖φ=‖[a]‖φ and ‖μ_n*[a]‖φ≤‖[a]‖φ. The last inequality follows from 1−μ_n μ_n* being a self-adjoint projection, hence a square.

**Proof route.** Apply the algebraic relations inside φ(a*μ_n*μ_n a) and φ(a*eγ*eγ a). Use φ(a*(1−μ_n μ_n*)a)≥0 because the middle projection equals its own square. Bound every finite generator word, so left multiplication descends to bounded operators on the Hilbert completion.

**Direct inputs.** [Rational and isometric generator conventions](#bc-complex-rescaling), [Normal-form multiplication and common-divisor reduction](#bc-normal-form-product).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-universal`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 C*-presentation, pp.431–433; CM Proposition 3.5, pp.445–446.

<a id="inverse-coset-degree"></a>
#### Inverse double-coset degree

**Lemma** `TauCeti.BostConnes.inverse_degree_eq_num` · `AnalyticNumberTheory:AN.9/inverse-coset-degree`.

The degree of X⁻¹ is num(cosetEntry X), a positive integer. Thus L(X)/R(X)=cosetEntry(X)⁻¹. The numerator is its absolute natural numerator, since the diagonal value is positive.

**Proof route.** Invert the reduced diagonal n/m, which exchanges n and m. Apply the degree formula to the inverse class, then divide the two positive integer degrees.

**Direct inputs.** [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), [Positive diagonal homomorphism](#axb-diagonal-map), `mathlib:Rat.num_div_den`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="bc-convolution-row-column"></a>
#### Finite convolution row and column counts

**Lemma** `TauCeti.BostConnes.Completed.kernel_degree` · `AnalyticNumberTheory:AN.9/bc-convolution-row-column`.

On Q=axbRat/axbInt use K_X(gH,hH)=1_X(g⁻¹h). Every row has L(X) nonzero entries and every column R(X)=L(X⁻¹). These counts are constant on quotient representatives.

**Proof route.** Fix one quotient variable and identify the nonzero kernel entries with the appropriate left-coset decomposition of X. Interchanging variables replaces X by its inverse. Translation invariance proves independence of quotient representatives.

**Direct inputs.** [Double cosets of the ax+b pair and their degrees](#double-cosets-and-degrees), [Inverse double-coset degree](#inverse-coset-degree), `mathlib:lp`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="bc-convolution-schur"></a>
#### Schur estimate for one double coset

**Lemma** `TauCeti.BostConnes.Completed.single_norm_le` · `AnalyticNumberTheory:AN.9/bc-convolution-schur`.

For finitely supported ξ on Q, ‖K_X ξ‖₂²≤L(X)R(X)‖ξ‖₂². Consequently K_X extends uniquely to l²(Q) with operator norm≤sqrt(L(X)R(X)).

**Proof route.** Bound each row square by L times the sum of its entry squares using Cauchy–Schwarz. Sum the rows; every input entry occurs R times. Extend on the dense finite-support subspace with this exact bound.

**Direct inputs.** [Finite convolution row and column counts](#bc-convolution-row-column), `mathlib:lp`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="bc-convolution-norm-bound"></a>
#### Bounded faithful left convolution

**Lemma** `TauCeti.BostConnes.Completed.bc_convolution_norm_bound` · `AnalyticNumberTheory:AN.9/bc-convolution-norm-bound`.

For finite-support f, its left convolution on l²(Q) satisfies ‖λ(f)‖≤ΣX∈supp f |f(X)|sqrt(L(X)R(X)). This gives the bounded algebra homomorphism λ; no C*-closure is used to obtain the estimate.

**Proof route.** Write f as the finite sum of its single-coset basis coefficients. Use the triangle inequality and the preceding operator bound. Kernel convolution on finite-support vectors proves multiplicativity; extend by density.

**Direct inputs.** [Schur estimate for one double coset](#bc-convolution-schur), [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="bc-convolution-faithful"></a>
#### Coefficient recovery and faithfulness

**Lemma** `TauCeti.BostConnes.Completed.leftRegular_injective` · `AnalyticNumberTheory:AN.9/bc-convolution-faithful`.

For δ_H the unit vector at the identity coset, (λ(f)δ_H)(gH)=f(class(g⁻¹)). Thus λ(f)=0 implies f=0. Faithfulness precedes the completion.

**Proof route.** Evaluate the operator on the identity-coset unit vector. Only the identity input coordinate survives, recovering the coefficient at the inverse class. Vanishing of the operator therefore annihilates every coefficient.

**Direct inputs.** [Bounded faithful left convolution](#bc-convolution-norm-bound).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="bc-universal-norm"></a>
#### Universal C*-norm of the BC core

**Lemma** `TauCeti.BostConnes.universal_norm_finite` · `AnalyticNumberTheory:AN.9/bc-universal-norm`.

The supremum of ‖π(f)‖ over unital star representations of the complex BC core is finite: if f=Σc_(n,m,γ)μ_n eγ μ_m*, it is at most Σ|c_(n,m,γ)|. It is a norm, because λ is faithful. Its completion has the universal property for these representations.

**Proof route.** Express each element in the independent normalized monomial basis. Every bounded star representation sends these monomials to contractions, giving the coefficient l1 bound. The faithful left-regular representation separates zero; the standard completion then has the stated representation property. The general completion theorem is the OP2-universal supplier contract.

**Direct inputs.** [Algebraic GNS generator estimates](#bc-gns-generator-bounds), [The corrected double-coset basis is independent](#bc-normal-form-independent), [Coefficient recovery and faithfulness](#bc-convolution-faithful).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-universal`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 and amenability remark, pp.431–433.

<a id="bc-adelic-endomorphism"></a>
#### Division endomorphisms on the existing profinite ring

**Lemma** `TauCeti.BostConnes.adele_division_endomorphism` · `AnalyticNumberTheory:AN.9/bc-adelic-endomorphism`.

On C(Ẑ), α_n(f)(x)=f(x/n) for x∈nẐ and 0 elsewhere. This is an injective star endomorphism, α_nα_m=α_nm, and α_n(1)=1_(nẐ). Import Ẑ, its p-adic product and unit subgroup from ProfiniteArithmetic; do not reconstruct these objects.

**Proof route.** Use that n times the integral adeles is compact open. Extension by zero of the pullback is continuous; direct evaluation proves star, product and composition identities. Surjectivity onto the corner and injectivity follow by evaluating on n times each integral adele.

**Direct inputs.** .

**Current upstream imports.** `tauceti:TauCetiRoadmap/ProfiniteArithmetic`, `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-dilation-corner`.

**Sources.** [Marcelo Laca](https://arxiv.org/pdf/math/9911135), Laca §3.1, pp.8–9.

<a id="bc-adelic-dilation"></a>
#### Minimal finite-adele dilation

**Lemma** `TauCeti.BostConnes.adele_minimal_dilation` · `AnalyticNumberTheory:AN.9/bc-adelic-dilation`.

Extension by zero i:C(Ẑ)→C0(A_f) is injective. The action β_q f(x)=f(q⁻¹x) extends α_n, and ⋃n β_(1/n)(i(C(Ẑ))) is dense in C0(A_f). Hence this is the minimal automorphic dilation.

**Proof route.** Use the compact-open exhaustion of finite adeles by n^(-1) times the integral adeles. Functions supported on each such compact open set come from the corresponding translated integral function algebra. Compactly supported functions are dense in C0, proving minimality.

**Direct inputs.** [Division endomorphisms on the existing profinite ring](#bc-adelic-endomorphism), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`.

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-dilation-corner`.

**Sources.** [Marcelo Laca](https://arxiv.org/pdf/math/9911135), Laca Theorem 2.1.1, pp.5–6; Proposition 3.2.1, p.9.

<a id="bc-crossed-product-full-corner"></a>
#### BC algebra as a full crossed-product corner

**Lemma** `TauCeti.BostConnes.crossed_product_full_corner` · `AnalyticNumberTheory:AN.9/bc-crossed-product-full-corner`.

Let B=C0(A_f)⋊Q_+×, for β_q f(x)=f(q⁻¹x), and p=1_Ẑ. The universal BC completion is star isomorphic to pBp, sending μ_n to U_n p and eγ to its additive-character function on Ẑ. The projection p is full: the closed span of BpB is B.

**Proof route.** Check the BC relations on U_n p and characters; use the algebraic lift. Dilate each covariant isometric representation to a unitary rational representation, as Lemma 2.1.3, pp.6–7; compression establishes the universal norm equality. The translates (1/n)Ẑ exhaust A_f, so the ideal generated by p contains a dense set of compactly supported functions and their rational translates.

**Direct inputs.** [Universal C*-norm of the BC core](#bc-universal-norm), [Minimal finite-adele dilation](#bc-adelic-dilation), [The presentation of the rational Bost–Connes algebra](#rational-presentation).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-dilation-corner`.

**Sources.** [Marcelo Laca](https://arxiv.org/pdf/math/9911135), Laca Theorem 2.2.1 and proof, pp.7–8; Proposition 3.2.1, p.9.

<a id="bc-universal-reduced"></a>
#### Universal and reduced BC norms agree

**Lemma** `TauCeti.BostConnes.universal_eq_reduced` · `AnalyticNumberTheory:AN.9/bc-universal-reduced`.

Q_+× is abelian, hence amenable; its full and reduced crossed-product norms on C0(A_f) agree. The full-corner identification and the regular Hecke representation therefore give ‖f‖univ=‖λ(f)‖ for every f in the BC core.

**Proof route.** Apply the amenable crossed-product theorem from OP2-dilation-corner to the abelian positive rational group. Transport its norm equality through the full-corner maps and identify the reduced representation with the faithful Hecke representation.

**Direct inputs.** [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner), [Coefficient recovery and faithfulness](#bc-convolution-faithful).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-dilation-corner`.

**Sources.** [Marcelo Laca](https://arxiv.org/pdf/math/9911135), BC95 Proposition 18 amenability remark, p.432; Laca Proposition 3.2.1 and Corollary 3.2.2, pp.9–10.

<a id="bc-gibbs-absolute-convergence"></a>
#### Absolute Gibbs diagonal summability

**Lemma** `TauCeti.BostConnes.completed_gibbs_summable` · `AnalyticNumberTheory:AN.9/bc-gibbs-absolute-convergence`.

For β>1 and bounded a∈C_Q, |⟨ε_k,π_u(a)ε_k⟩|≤‖a‖ and Σk k^(−β)<∞. Thus the diagonal Gibbs sum converges absolutely, defines a functional of norm≤1 after division by ζ(β), and is positive on squares.

**Proof route.** Bound every diagonal coefficient by the operator norm and dominate the sum by zeta(beta). Each coefficient on a star square is a squared vector norm; normalization on 1 and positivity give the norm-one state.

**Direct inputs.** [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), [The partition function is the Riemann zeta function](#partition-function), [Universal and reduced BC norms agree](#bc-universal-reduced).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32 and (3.130), pp.474–475.

<a id="gibbs-states"></a>
#### The Gibbs states φ_{β,u}

**Construction** `TauCeti.BostConnes.gibbsState` · `AnalyticNumberTheory:AN.9/gibbs-states`.

For real β > 1 and u ∈ Aut(ℚ/ℤ), φ_{β,u}(f) = ζ(β)⁻¹ Σ_{k≥1} k^{−β}⟨ε_k, π_u(f)ε_k⟩ is a state on BCHecke ℂ: linear, φ_{β,u}(1) = 1 and φ_{β,u}(f*f) ≥ 0. On the basis, φ_{β,u}(x_n e(γ) x′_m) = 0 unless n = m, and φ_{β,u}(e(γ)) = ζ(β)⁻¹ Σ_k k^{−β} exp(2πi k u(γ)) = Li_β(exp(2πi u(γ)))/ζ(β), with Li_β(z) = Σ_{k≥1} z^k/k^β.

**Hypotheses.** β > 1; u ∈ Aut(ℚ/ℤ).

**Proof route.** The series converges absolutely because |⟨ε_k, π_u(f)ε_k⟩| ≤ ‖π_u(f)‖ and Σ k^{−β} = ζ(β) < ∞ (B.9/partition-function). Positivity: each ⟨ε_k, π_u(f*f)ε_k⟩ = ‖π_u(f)ε_k‖² ≥ 0. Off-diagonal vanishing: π_u(x_n e(γ) x′_m) sends ε_k to a multiple of ε_{nk/m}, orthogonal to ε_k unless n = m.

**Direct inputs.** [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), [The partition function is the Riemann zeta function](#partition-function), `mathlib:riemannZeta`, [Absolute Gibbs diagonal summability](#bc-gibbs-absolute-convergence).

**API.**

- `TauCeti.BostConnes.gibbsState` (constructor): gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₗ[ℂ] ℂ.
- `TauCeti.BostConnes.gibbsState_one` (simp): gibbsState β hβ u 1 = 1.
- `TauCeti.BostConnes.gibbsState_star_mul_self_nonneg` (other): 0 ≤ gibbsState β hβ u (star f * f) (a nonnegative real).
- `TauCeti.BostConnes.gibbsState_e` (characterisation): gibbsState β hβ u (e γ) = (Σ' k : ℕ+, exp (2π I k u(γ)) / k^β) / riemannZeta β.
- `TauCeti.BostConnes.gibbsState_basis_of_ne` (other): gibbsState β hβ u (x n * e γ * x' m) = 0 for n ≠ m.

**Unit tests.**

- `TauCeti.BostConnes.gibbsState_e_half` (computation): gibbsState β hβ u (e (1/2)) = 2^(1−β) − 1 for every u (u fixes 1/2).
- `TauCeti.BostConnes.gibbsState_x_mul_x'_two` (computation): gibbsState β hβ u (x 2 * x' 2) = 2^(1−β).
- `TauCeti.BostConnes.gibbsState_e_zero` (degenerate): gibbsState β hβ u (e 0) = 1.
- `TauCeti.BostConnes.gibbsState_x_two` (non-example): gibbsState β hβ u (x 2) = 0 while gibbsState β hβ u (x 2 * x' 2) = 2^(1−β) ≠ 0, so the state is not multiplicative.

**Consumers.** [The Gibbs states are KMS_β states](#gibbs-states-are-kms): They are KMS_β states.; [The Bost–Connes phase transition](#kms-classification): They are the extremal KMS_β states for β > 1.; [Cyclotomic values and Galois action on extremal KMS∞ states](#galois-action-on-ground-states): Their limits as β → ∞ are the ground states..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.135) and (3.139), p. 475.

<a id="kms-states"></a>
#### KMS_β states on the Bost–Connes algebra

**Definition** `TauCeti.BostConnes.IsKMS` · `AnalyticNumberTheory:AN.9/kms-states`.

For β>0, IsKMS(β,φ) on the dense complex Hecke algebra means: φ is complex linear, φ(1)=1, φ(f* f) is a nonnegative real number for every f, and φ(f σ_(iβ)(g))=φ(gf) for all f,g. This is the algebraic boundary identity. Its equivalence with the bounded strip definition on the C*-completion requires the bounded-state extension and analytic-core lemmas below. Ground states satisfy the upper-half-plane boundedness condition; KMS∞ states are weak limits of KMS states as inverse temperature tends to infinity. These notions are distinct.

**Hypotheses.** β > 0.

**Proof route.** A basis vector with dilation a≠1 is annihilated by the boundary identity with f=1 because a^(−β)≠1. Time invariance follows coefficientwise, since the remaining dilation-one basis vectors are fixed. For a bounded state on the completion, the analytic-core lemma proves the strip equivalence. Algebraic positivity alone is not silently identified with a completed state.

**Direct inputs.** [The Bost–Connes time evolution](#time-evolution), [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), `mathlib:Complex.cpow`.

**API.**

- `TauCeti.BostConnes.IsKMS` (constructor): IsKMS(β,φ) includes β>0, normalization, complex-order positivity and the displayed boundary identity on the dense Hecke algebra.
- `TauCeti.BostConnes.IsKMS.timeEvolution_invariant` (other): IsKMS β φ → φ (timeEvolution t f) = φ f for real t.
- `TauCeti.BostConnes.IsKMS.convex` (structure): KMS_β states form a convex set.
- `TauCeti.BostConnes.IsKMS.comp_symmetry` (functoriality): IsKMS β φ → IsKMS β (φ ∘ symmetry u).

**Unit tests.**

- `TauCeti.BostConnes.isKMS_gibbsState` (computation): IsKMS β (gibbsState β hβ u) for β > 1 (B.9/gibbs-states-are-kms).
- `TauCeti.BostConnes.isKMS_one_iff` (non-example): The state f ↦ f(identity coset) satisfies IsKMS β exactly when β = 1.
- `TauCeti.BostConnes.isKMS_sign` (non-example): The Gibbs state fails the identity with σ_{−iβ} in place of σ_{iβ}: at f = x′₂, g = x₂ the two sides are 2^{1+β} and 2^{1−β}.
- `TauCeti.BostConnes.isKMS_x_mul_x'_two` (computation): Every KMS_β state has φ(x 2 * x' 2) = 2^(1−β), hence φ(e (1/2)) = 2^(1−β) − 1.

**Consumers.** [The Gibbs states are KMS_β states](#gibbs-states-are-kms): The Gibbs states satisfy it.; [The Bost–Connes phase transition](#kms-classification): The classification describes all of them.; [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#symmetry-action): The symmetries act on the KMS states..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §2.2, Definition 3.6, p. 446.

<a id="bc-completed-gibbs"></a>
#### Completed Gibbs state

**Construction** `TauCeti.BostConnes.CompletedKMS.gibbs` · `AnalyticNumberTheory:AN.9/bc-completed-gibbs`.

For β>1, define φβ,u(a)=ζ(β)⁻¹Σk≥1 k^(−β)⟨ε_k,π_u(a)ε_k⟩. This continuous normalized positive functional on C_Q restricts to the algebraic Gibbs state.

**Proof route.** Use absolute convergence to define a linear functional on the completed algebra. The preceding uniform norm bound gives continuity; compute its value on 1 and on star squares. Agreement on the core follows by inserting the regular representation formula.

**Direct inputs.** [Absolute Gibbs diagonal summability](#bc-gibbs-absolute-convergence).

**API.**

- `TauCeti.BostConnes.CompletedKMS.gibbs_restrict` (compatibility): Restriction gives gibbsState.
- `TauCeti.BostConnes.CompletedKMS.gibbs_norm` (relation): The norm is 1.
- `TauCeti.BostConnes.CompletedKMS.gibbs_isKMS` (characterisation): The completed Gibbs state is KMSβ.

**Unit tests.**

- `TauCeti.BostConnes.CompletedKMS.test_gibbs_one` (degenerate): The completed Gibbs state evaluates 1 to 1.
- `TauCeti.BostConnes.CompletedKMS.test_gibbs_half` (computation): Its value at embedded e(1/2) is 2^(1−β)−1.
- `TauCeti.BostConnes.CompletedKMS.test_gibbs_projection` (computation): Its value at μ₂μ₂* is 2^(−β).

**Consumers.** [The Bost–Connes phase transition](#kms-classification): Provides every high-beta extreme point..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, (3.130), p.475.

<a id="bc-convolution-adjoint"></a>
#### Convolution preserves the adjoint

**Lemma** `TauCeti.BostConnes.Completed.leftRegular_star` · `AnalyticNumberTheory:AN.9/bc-convolution-adjoint`.

For f in the complex Hecke algebra, λ(f*)=λ(f)*, since K_(f*)(gH,hH)=conj K_f(hH,gH). Both sides are bounded, so equality on finite-support vectors suffices.

**Proof route.** Reverse the two quotient variables in the finite-support kernel and conjugate the coefficients. Inner products on finite-support vectors prove the adjoint equality; boundedness extends it to the Hilbert space.

**Direct inputs.** [Bounded faithful left convolution](#bc-convolution-norm-bound), [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="bc-cstar-completion"></a>
#### The reduced Bost–Connes C*-algebra

**Construction** `TauCeti.BostConnes.Completed.algebra` · `AnalyticNumberTheory:AN.9/bc-cstar-completion`.

Let πleft be convolution on l²(P_Q⁺/P_Z⁺), using the paper’s right-coset convention and the Tau Hecke product comparison. Define C_Q as the operator-norm closure of πleft(BCHecke C) in bounded operators, a unital star subalgebra. This is distinct from an individual πu on l²(N+), which is not the left regular carrier.

**Proof route.** Bound left convolution on each finite double-coset support using its finite degrees. Prove it is a faithful star representation, matching the coset convention. Use the existing star-subalgebra closure; norm/C*-completeness and the universal/reduced comparison are separate leaves.

**Direct inputs.** [Bounded faithful left convolution](#bc-convolution-norm-bound), [Convolution preserves the adjoint](#bc-convolution-adjoint), [Coefficient recovery and faithfulness](#bc-convolution-faithful), `mathlib:StarSubalgebra.topologicalClosure`.

**API.**

- `TauCeti.BostConnes.Completed.leftRegular` (constructor): Convolution on the l² right-coset carrier.
- `TauCeti.BostConnes.Completed.algebra` (constructor): The operator-norm closure of the left regular image.
- `TauCeti.BostConnes.Completed.embed` (coercion): The faithful dense star-algebra map from BCHecke C into C_Q.

**Unit tests.**

- `TauCeti.BostConnes.Completed.test_unit` (degenerate): The embedded unit is the identity operator.
- `TauCeti.BostConnes.Completed.test_isometry` (characterisation): The embedded μn satisfies μn*μn=1.
- `TauCeti.BostConnes.Completed.test_range_projection` (computation): The embedded μ2μ2*=(1+e(1/2))/2 is a proper projection, not1.

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

**Atlas planet.** Bost–Connes C*-algebra.

<a id="bc-completion-dense"></a>
#### Dense isometric core embedding

**Lemma** `TauCeti.BostConnes.Completed.denseRange_embed` · `AnalyticNumberTheory:AN.9/bc-completion-dense`.

The map ι:BCHecke C→C_Q is an injective star algebra homomorphism with dense range and ‖ι(f)‖=‖λ(f)‖. C_Q has the inherited unital C*-algebra structure of its closed star subalgebra of bounded operators.

**Proof route.** Embed the faithful core into the operator-norm closure. Multiplication, involution and norm are inherited from bounded operators, while density is the closure property and injectivity is coefficient recovery.

**Direct inputs.** [The reduced Bost–Connes C*-algebra](#bc-cstar-completion), [Coefficient recovery and faithfulness](#bc-convolution-faithful).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="bc-dynamics-entire-core"></a>
#### Entire Hecke orbit maps

**Lemma** `TauCeti.BostConnes.Completed.entire_embed_orbit` · `AnalyticNumberTheory:AN.9/bc-dynamics-entire-core`.

For each f in the finite-support Hecke core, z↦ι(σ_z f) is an entire C_Q-valued map, supported on the same finite set of double cosets. For real t it is implemented in λ by the diagonal unitary with weights a(g)^(−it).

**Proof route.** On the support it is a finite sum of exponentials z↦exp(iz log a(X)) times fixed vectors. For the specified kernel use U_t(gH)=a(g)^(−it); conjugation multiplies K_f by a(g⁻¹h)^(it).

**Direct inputs.** [The Bost–Connes time evolution](#time-evolution), [Dense isometric core embedding](#bc-completion-dense).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="bc-gibbs-strip-series"></a>
#### Gibbs strip correlations

**Lemma** `TauCeti.BostConnes.gibbs_strip_normal_convergence` · `AnalyticNumberTheory:AN.9/bc-gibbs-strip-series`.

For β>1 and core a,b, the Gibbs correlation Σk ζ(β)⁻¹k^(−β)⟨ε_k,π_u(a σ_z b)ε_k⟩ converges locally uniformly on C and uniformly on each closed real strip of bounded imaginary height. On the KMS strip 0≤Imz≤β it has the required two boundary values; finite normal-form reindexing supplies the upper boundary.

**Proof route.** Finite support of a,b bounds all complex-time coefficients on each bounded imaginary strip. Dominate the diagonal sum by C k^(−β). Check the boundary identity on normal forms by the divisibility formula and change k to nk; the factor n^(−β) is exactly the imaginary-time scalar. Extend bilinearly to the core and then by the core strip equivalence.

**Direct inputs.** [Isometries and phase unitaries on l²(N+)](#bc-regular-shift-bounds), [Completed Gibbs state](#bc-completed-gibbs), [Entire Hecke orbit maps](#bc-dynamics-entire-core), [Normal-form multiplication and common-divisor reduction](#bc-normal-form-product).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, §4.7, (3.130), pp.474–475.

<a id="bc-core-base-state"></a>
#### Coefficient state on the Hecke core

**Construction** `TauCeti.BostConnes.baseState` · `AnalyticNumberTheory:AN.9/bc-core-base-state`.

Define φbase(f)=f(identity double coset). Positivity follows from the faithful left-regular vector state at the identity coset; φbase(1)=1. It is the core KMS state at β=1. It has φbase(eγ)=1 when γ=0 and 0 otherwise.

**Proof route.** Apply the identity-coset vector functional to the faithful convolution representation. Its value is the identity coefficient, and its value on a square is a squared norm. Compare modular degrees on basis products to obtain beta=1 KMS.

**Direct inputs.** [Coefficient recovery and faithfulness](#bc-convolution-faithful), [Convolution preserves the adjoint](#bc-convolution-adjoint).

**API.**

- `TauCeti.BostConnes.baseState_apply` (characterisation): Evaluation at the identity double coset.
- `TauCeti.BostConnes.baseState_positive` (characterisation): φbase(f*f)≥0, with f* denoting star.
- `TauCeti.BostConnes.baseState_e` (characterisation): φbase(eγ)=if γ=0 then 1 else 0.

**Unit tests.**

- `TauCeti.BostConnes.baseState_test_one` (computation): φbase(1)=1.
- `TauCeti.BostConnes.baseState_test_half` (computation): φbase(e(1/2))=0.
- `TauCeti.BostConnes.baseState_test_projection` (computation): φbase(x2 x2*)=1 in rational normalization.

**Consumers.** [Completed coefficient state](#bc-completed-coefficient-state): Uses this construction with its stated normalization and domain..

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3, p.414; modular dynamics and state, pp.415–416.

<a id="bc-bounded-state-extension"></a>
#### Positive Hecke states extend boundedly

**Lemma** `TauCeti.BostConnes.CompletedKMS.positive_core_extension` · `AnalyticNumberTheory:AN.9/bc-bounded-state-extension`.

Every normalized positive complex-linear φ on the BC core has |φ(f)|≤‖λ(f)‖, and therefore a unique norm-one positive continuous extension to C_Q. Its restriction is φ; extensions agree by core density.

**Proof route.** Use the cyclic unit vector in the bounded algebraic GNS representation to get |φ(f)|≤‖f‖univ. Replace the universal norm by the regular norm and extend continuously. Approximate a completed square by core squares to preserve positivity.

**Direct inputs.** [Algebraic GNS generator estimates](#bc-gns-generator-bounds), [Universal C*-norm of the BC core](#bc-universal-norm), [Universal and reduced BC norms agree](#bc-universal-reduced), [Dense isometric core embedding](#bc-completion-dense).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-universal`.

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="bc-completed-coefficient-state"></a>
#### Completed coefficient state

**Construction** `TauCeti.BostConnes.CompletedKMS.base` · `AnalyticNumberTheory:AN.9/bc-completed-coefficient-state`.

The core coefficient state extends uniquely and positively to C_Q. The completed state has norm 1, restricts to φbase, and is KMS exactly at β=1 for positive β.

**Proof route.** The identity vector functional is bounded on the operator completion and extends the core coefficient state. The dense-core KMS equivalence gives beta=1. A dilation range projection has value 1/n and forces n^(-beta)=1/n, excluding every other positive beta.

**Direct inputs.** [Coefficient state on the Hecke core](#bc-core-base-state), [Positive Hecke states extend boundedly](#bc-bounded-state-extension).

**API.**

- `TauCeti.BostConnes.CompletedKMS.base_restrict` (compatibility): Restriction along embed is baseState.
- `TauCeti.BostConnes.CompletedKMS.base_norm` (characterisation): The norm of the continuous state is 1.
- `TauCeti.BostConnes.CompletedKMS.base_kms_iff` (characterisation): For β>0, the base state is KMSβ iff β=1.

**Unit tests.**

- `TauCeti.BostConnes.CompletedKMS.base_test_one` (computation): base(1)=1.
- `TauCeti.BostConnes.CompletedKMS.base_test_half` (computation): base(embed e(1/2))=0.
- `TauCeti.BostConnes.CompletedKMS.base_test_projection` (computation): base(μ2 μ2*)=1/2.

**Consumers.** [Completed KMS states and the bounded strip condition](#bc-completed-kms): Uses this construction with its stated normalization and domain..

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3, p.414; modular dynamics pp.415–416.

<a id="bc-completed-kms"></a>
#### Completed KMS states and the bounded strip condition

**Definition** `TauCeti.BostConnes.CompletedKMS` · `AnalyticNumberTheory:AN.9/bc-completed-kms`.

For β>0, a completed state is a bounded complex-linear functional φ on C_Q with φ(1)=1 and φ(a*a) a nonnegative real. It is KMSβ when, for all a,b, there is a bounded continuous F on0≤Imz≤β, holomorphic on the interior, with F(t)=φ(aσt(b)) and F(t+iβ)=φ(σt(b)a). Dynamics is a point-norm-continuous group of star automorphisms.

**Proof route.** Extend real dynamics isometrically to the norm closure and prove point-norm continuity by dense finite supports. Use the bounded strip definition with both boundary conditions. Relate it to the algebraic identity only after the analytic-core extension lemma.

**Direct inputs.** [The reduced Bost–Connes C*-algebra](#bc-cstar-completion), [The Bost–Connes time evolution](#time-evolution), [Completed coefficient state](#bc-completed-coefficient-state).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-kms`.

**API.**

- `TauCeti.BostConnes.CompletedKMS.state` (characterisation): Bounded linear functional, normalization and complex-order positivity.
- `TauCeti.BostConnes.CompletedKMS.isKMS` (constructor): The bounded closed-strip predicate just specified.
- `TauCeti.BostConnes.CompletedKMS.restrict` (compatibility): Restriction to the dense Hecke algebra satisfies IsKMS(β,φ).

**Unit tests.**

- `TauCeti.BostConnes.CompletedKMS.test_wrong_sign` (non-example): Using σ−iβ reverses the required boundary identity and fails for x′2,x2 in a Gibbs state.
- `TauCeti.BostConnes.CompletedKMS.test_temperature_one` (characterisation): The completed base-vector state restricts to a KMS state atβ=1.
- `TauCeti.BostConnes.CompletedKMS.test_scaling_projection` (computation): Every KMSβ state has φ(μnμn*)=n^(−β).

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definitions 3.4–3.6, pp.445–447.

<a id="bc-strip-core-bound"></a>
#### Uniform correlation bound on the closed strip

**Lemma** `TauCeti.BostConnes.core_correlation_bound` · `AnalyticNumberTheory:AN.9/bc-strip-core-bound`.

Let φ be a completed state satisfying the core KMS identity at β>0. For core a,b, F(z)=φ(ι(a σ_z b)) is entire and bounded on 0≤Imz≤β. The two boundary bounds are≤‖ι(a)‖‖ι(b)‖; the three-lines principle gives the same bound throughout the strip.

**Proof route.** Finite spectral support bounds F on each closed strip, before invoking three-lines. The KMS identity identifies the upper boundary with φ(σ_t(b)a); both real automorphism norms are unchanged. Apply the bounded-strip maximum principle.

**Direct inputs.** [Entire Hecke orbit maps](#bc-dynamics-entire-core), [Positive Hecke states extend boundedly](#bc-bounded-state-extension), [KMS_β states on the Bost–Connes algebra](#kms-states).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-kms`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Definition 3.6, p.446; (3.19), p.450.

<a id="bc-real-dynamics-extension"></a>
#### Extending real dynamics to the C*-completion

**Lemma** `TauCeti.BostConnes.bc_real_dynamics_extension` · `AnalyticNumberTheory:AN.9/bc-real-dynamics-extension`.

The real σt are isometric star automorphisms in the left representation and extend to a point-norm-continuous automorphism group on C_Q. The complex σz is retained only on the entire dense Hecke algebra.

**Proof route.** Implement real σt by diagonal unitaries from the dilation character. Extend the norm-preserving map and inverse to the closure. Approximate by finite Hecke sums to prove point-norm continuity.

**Direct inputs.** [The reduced Bost–Connes C*-algebra](#bc-cstar-completion), [Bounded faithful left convolution](#bc-convolution-norm-bound), [The Bost–Connes time evolution](#time-evolution).

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="bc-dynamics-continuous"></a>
#### Point-norm continuous completed dynamics

**Lemma** `TauCeti.BostConnes.Completed.continuous_dynamics` · `AnalyticNumberTheory:AN.9/bc-dynamics-continuous`.

For every a∈C_Q, t↦σ_t(a) is continuous. Approximate a in norm by a core element, whose orbit is a finite exponential sum, and use the isometry of every σ_t to bound both approximation errors.

**Proof route.** For each core element the orbit is a finite sum of scalar exponentials. Approximate an arbitrary completed element in norm by a core element and bound the two approximation terms using the isometric dynamics.

**Direct inputs.** [Extending real dynamics to the C*-completion](#bc-real-dynamics-extension), [Entire Hecke orbit maps](#bc-dynamics-entire-core).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="bc-analytic-core-strip-equivalence"></a>
#### The analytic core and the strip KMS condition

**Lemma** `TauCeti.BostConnes.CompletedKMS.core_iff` · `AnalyticNumberTheory:AN.9/bc-analytic-core-strip-equivalence`.

For β>0 a completed state is KMSβ exactly when its restriction to the dense Hecke core satisfies IsKMS β. In the core-to-strip direction, approximate both completed arguments by core arguments; the uniform strip estimate makes their correlation functions Cauchy uniformly on the closed strip.

**Proof route.** Restrict a bounded strip correlation and use uniqueness against the entire core orbit to evaluate the upper boundary. For the converse take norm approximations a_j,b_j in the core. The bound on differences gives uniform convergence on the full closed strip. Locally uniform limits remain holomorphic, and the limits have the required two boundary values.

**Direct inputs.** [Completed KMS states and the bounded strip condition](#bc-completed-kms), [Uniform correlation bound on the closed strip](#bc-strip-core-bound), [Dense isometric core embedding](#bc-completion-dense), [Point-norm continuous completed dynamics](#bc-dynamics-continuous).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-kms`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definition 3.6 and entire-element condition (3.17), pp.446–447; the converse analytic-core theorem is an additional source gap.

<a id="gibbs-states-are-kms"></a>
#### The Gibbs states are KMS_β states

**Theorem** `TauCeti.BostConnes.isKMS_gibbsState` · `AnalyticNumberTheory:AN.9/gibbs-states-are-kms`.

For β > 1 and u ∈ Aut(ℚ/ℤ), φ_{β,u} is a KMS_β state.

**Hypotheses.** β > 1.

**Proof route.** For a normal-form basis monomial each basis vector is sent to a scalar multiple of at most one other basis vector. The Hamiltonian implements σ on these coefficients. The KMS boundary identity follows by changing the positive-integer summation index and retaining the factors n^(−β). Bound each diagonal series by the operator norm times Σ k^(−β), and extend by linearity. No cyclic rearrangement with the unbounded operator e^(βH) is used.

**Direct inputs.** [The Gibbs states φ_{β,u}](#gibbs-states), [KMS_β states on the Bost–Connes algebra](#kms-states), [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), [Gibbs strip correlations](#bc-gibbs-strip-series), [The analytic core and the strip KMS condition](#bc-analytic-core-strip-equivalence).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.135) and (3.139), p. 475; [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §2.2, Definition 3.6, p. 446.

<a id="bc-adelic-scaling-measure"></a>
#### The finite-adele scaling measure

**Construction** `TauCeti.BostConnes.ScalingMeasure` · `AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure`.

For β>0, the canonical scaling measure μβ on the existing finite-adele carrier has local density (1−p^(−β))/(1−p^(−1))·|x|p^(β−1) relative to normalized additive Haar, interpreted away from x=0. Its restriction to Ẑ is the product of the local probabilities; extend it to ⋃n (1/n)Ẑ by rational scaling. This unit-invariant measure is distinct from the space of all normalized scaling measures.

**Proof route.** Sum p-adic valuation shells to normalize the local measure. Construct the product probability on Ẑ and extend consistently to rational dilates in finite adeles. Verify the rational scaling law and uniqueness among the specified unit-invariant measures.

**Direct inputs.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`, `mathlib:IsDedekindDomain.FiniteAdeleRing`, `mathlib:MeasureTheory.Measure.infinitePi`.

**Current upstream imports.** `tauceti:TauCetiRoadmap/RestrictedProducts`, `tauceti:TauCetiRoadmap/ProfiniteArithmetic`.

**API.**

- `TauCeti.BostConnes.ScalingMeasure.local` (constructor): Given p prime, the Borel measurable Padic p carrier and normalized additive Haar μ, form μ.withDensity with density ((1−p^(−β))/(1−p^(−1)))·‖x‖^(β−1) away from 0, assigned zero at 0. The Haar normalization and canonical finite-adele component adapter are the AA.0/ProfiniteArithmetic inputs.
- `TauCeti.BostConnes.ScalingMeasure.adelic` (constructor): The restricted-product measure with μβ(Ẑ)=1.
- `TauCeti.BostConnes.ScalingMeasure.scale` (relation): μβ(q^(−1)E)=q^β μβ(E).

**Unit tests.**

- `TauCeti.BostConnes.ScalingMeasure.test_beta_one` (compatibility): Atβ=1 the local measures and restricted product are additive Haar.
- `TauCeti.BostConnes.ScalingMeasure.test_valuation_shell` (computation): μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ) for k≥0.
- `TauCeti.BostConnes.ScalingMeasure.test_units_mass` (characterisation): μβ,p(Zp×)=1−p^(−β).

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Local product density and Proposition, p.2; normalized scaling equation (1β), p.1.

<a id="bc-finite-prime-projection"></a>
#### Finite-prime orbit projection

**Lemma** `TauCeti.BostConnes.bc_finite_prime_projection` · `AnalyticNumberTheory:AN.9/bc-finite-prime-projection`.

For a finite prime set A, NA is its generated multiplicative monoid and WA={x∈Ẑ:xp∈Zp× for p∈A}. On WA the projection to NA-invariant functions is PAf(x)=ζA(β)^(−1)Σn∈NA n^(−β)f(nx), extended along NA-orbits, where ζA(β)=∏p∈A(1−p^(−β))^(−1).

**Proof route.** Decompose Ẑ into disjoint nWA for n∈NA up to the measure-zero zero-coordinate set. Use μβ(nE)=n^(−β)μβ(E). Check conditional expectation, invariant range and idempotence in L².

**Direct inputs.** [The finite-adele scaling measure](#bc-adelic-scaling-measure).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Proposition proof, projection formula (2) and verification, p.2.

<a id="bc-local-character-density"></a>
#### Local characters form a dense family

**Lemma** `TauCeti.BostConnes.bc_local_character_density` · `AnalyticNumberTheory:AN.9/bc-local-character-density`.

Functions depending on finitely many p-adic coordinates and valuation shells, with characters of local unit quotients, span a dense subspace of L²(Ẑ,μβ).

**Proof route.** Approximate by finite-coordinate cylinder functions. Decompose each coordinate into its countable valuation shells. Use finite character orthogonality on the compact local unit quotients.

**Direct inputs.** [The finite-adele scaling measure](#bc-adelic-scaling-measure).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Proposition proof, local characters and valuation translates, pp.2–3.

<a id="bc-prime-progression-divergence"></a>
#### Reciprocal primes in progressions

**Lemma** `TauCeti.BostConnes.prime_progression_reciprocal_diverges` · `AnalyticNumberTheory:AN.9/bc-prime-progression-divergence`.

Fix N≥1 and a coprime to N. The fixed-progression prime asymptotic π(X;N,a)∼Li(X)/φ(N) implies Σp≤X,p≡a(modN)1/p=(1/φ(N))log log X+o(log log X). In particular Σp≡a(modN)p^(−β) diverges for 0<β≤1.

**Proof route.** Apply partial summation to π(t;N,a): π(X)/X+integral from 2 to X of π(t)/t² dt. Use the asymptotic with a fixed relative error on large t and squeeze the integral against (1/φ(N)) integral dt/(t log t). For β≤1, p^(−β)≥1/p.

**Direct inputs.** `AnalyticNumberTheory:AN.2`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Proposition proof, p.3 (Dirichlet input); partial summation is the local refinement.

<a id="bc-nontrivial-character-projection"></a>
#### Nontrivial characters are annihilated in the critical interval

**Lemma** `TauCeti.BostConnes.bc_nontrivial_character_projection` · `AnalyticNumberTheory:AN.9/bc-nontrivial-character-projection`.

For0<β≤1 and a nontrivial local unit characterχ, the increasing-prime projections P_Aχ tend to0: their product coefficients contain factors (1−p^(−β))/(1−χ(p)p^(−β)), and divergence of the prime reciprocal sum in a suitable character sector forces the product to0.

**Proof route.** Compute the geometric prime-power factors in the finite-prime average. Choose a congruence sector where Reχ(p)<0. Use the fixed-progression prime theorem to obtain divergence of Σp p^(−β), not merely infinitude of primes.

**Direct inputs.** [Finite-prime orbit projection](#bc-finite-prime-projection), [Local characters form a dense family](#bc-local-character-density), `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`, [Reciprocal primes in progressions](#bc-prime-progression-divergence).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Proposition proof, nontrivial character product and progression argument, p.3.

<a id="bc-decreasing-projections"></a>
#### Decreasing orthogonal projections

**Lemma** `TauCeti.BostConnes.decreasing_projection_strong` · `AnalyticNumberTheory:AN.9/bc-decreasing-projections`.

Let Hn be a decreasing sequence of closed subspaces of a Hilbert space and H=intersection Hn. Their orthogonal projections Pn satisfy ‖Pn v−P v‖→0 for every v. In the finite-prime exhaustion, Hn consists of functions invariant under multiplication by all primes in its first n entries.

**Proof route.** For m≥n, orthogonality gives ‖Pn v−Pm v‖²=‖Pn v‖²−‖Pm v‖². The decreasing norm squares make Pn v Cauchy. Its limit lies in every Hn and has the defining projection orthogonality to H.

**Direct inputs.** `mathlib:lp`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Projection exhaustion in the Proposition proof, p.2.

<a id="bc-critical-ergodicity"></a>
#### Ergodicity of positive rationals on finite adeles

**Theorem** `TauCeti.BostConnes.bc_critical_ergodicity` · `AnalyticNumberTheory:AN.9/bc-critical-ergodicity`.

For0<β≤1 the Q+× action on(A_Q,f,μβ) is ergodic: every invariant L² function on the compact integral slice is constant, and rational dilates cover the finite adeles.

**Proof route.** For the trivial character compute the projection constant. For every nontrivial dense character use the zero projection limit. Pass by L² density and the rational-dilate exhaustion.

**Direct inputs.** [Nontrivial characters are annihilated in the critical interval](#bc-nontrivial-character-projection), [Local characters form a dense family](#bc-local-character-density), [Finite-prime orbit projection](#bc-finite-prime-projection), [Decreasing orthogonal projections](#bc-decreasing-projections).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Proposition and complete proof, pp.2–3.

<a id="bc-scaling-measure-space"></a>
#### All normalized scaling measures

**Definition** `TauCeti.BostConnes.IsScalingMeasure` · `AnalyticNumberTheory:AN.9/bc-scaling-measure-space`.

A β-scaling measure is a positive Radon measure μ on A_f with μ(Ẑ)=1 and μ(qE)=q^(−β)μ(E) for every positive rational q and Borel set E. These two conditions force μ({0})=0. No unit invariance is assumed; the canonical product measure is one element.

**Proof route.** State Radon regularity, normalization and the rational scaling law on the existing finite-adele carrier. Apply the law to the fixed singleton zero with a rational q different from 1; its finite mass must vanish.

**Direct inputs.** [The finite-adele scaling measure](#bc-adelic-scaling-measure).

**API.**

- `TauCeti.BostConnes.IsScalingMeasure.normalized` (projection): The integral-adeles mass equals 1.
- `TauCeti.BostConnes.IsScalingMeasure.scale` (relation): Every positive rational dilation scales mass by q^(−β).
- `TauCeti.BostConnes.IsScalingMeasure.zero_atom` (simp): The singleton 0 has zero mass.
- `TauCeti.BostConnes.IsScalingMeasure.convex` (structure): Convex mixtures at fixed β stay in the space.

**Unit tests.**

- `TauCeti.BostConnes.IsScalingMeasure.test_zero_measure` (non-example): The zero measure is not normalized.
- `TauCeti.BostConnes.IsScalingMeasure.test_dirac_zero` (non-example): The atom at 0 is normalized but violates scaling for q=2 and β>0.
- `TauCeti.BostConnes.IsScalingMeasure.test_canonical` (compatibility): The product-density measure satisfies the normalized scaling predicate.

**Consumers.** [KMS states and scaling measures](#bc-kms-scaling-correspondence): Is exactly the measure side of the correspondence..

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 (1β), p.1.

<a id="bc-canonical-extreme"></a>
#### Ergodic scaling measure is extreme

**Lemma** `TauCeti.BostConnes.canonical_scaling_extreme` · `AnalyticNumberTheory:AN.9/bc-canonical-extreme`.

For 0<β≤1, if μβ=tμ1+(1−t)μ2 for normalized β-scaling measures and 0<t<1, then μ1=μ2=μβ. The Radon–Nikodym density dμ1/dμβ is bounded by 1/t and Q+×-invariant, hence constant by ergodicity; normalization makes the constant one.

**Proof route.** Domination by the convex combination bounds the Radon-Nikodym density. Equal scaling laws make the density invariant under every rational dilation. Ergodicity makes it constant; normalization fixes the constant and then both summands.

**Direct inputs.** [Ergodicity of positive rationals on finite adeles](#bc-critical-ergodicity), [All normalized scaling measures](#bc-scaling-measure-space).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Corollary proof, p.3; direct measure form of extremality.

<a id="bc-unit-average"></a>
#### Unit average of a scaling measure

**Lemma** `TauCeti.BostConnes.unit_average_canonical` · `AnalyticNumberTheory:AN.9/bc-unit-average`.

For any normalized β-scaling measure μ, its average over W=Ẑ× with normalized Haar measure is again normalized and β-scaling, is W-invariant, and equals the canonical product-density μβ. Equality follows from finite valuation/unit cylinders, then a countable rational-dilate exhaustion of A_f.

**Proof route.** On every compact rational dilate, integrate the finite measures over compact W; Fubini gives normalization and scaling. W invariance makes unit residues Haar and scaling fixes each valuation-shell mass. Cylinder uniqueness yields the product measure.

**Direct inputs.** [All normalized scaling measures](#bc-scaling-measure-space), [The finite-adele scaling measure](#bc-adelic-scaling-measure).

**Current upstream imports.** `tauceti:TauCetiRoadmap/ProfiniteArithmetic`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Unique W-invariant measure, p.2; Corollary argument, p.3.

<a id="bc-extreme-average-rigidity"></a>
#### Extreme unit average is constant

**Lemma** `TauCeti.BostConnes.extreme_unit_average_rigid` · `AnalyticNumberTheory:AN.9/bc-extreme-average-rigidity`.

Let μ be a normalized scaling measure whose compact-unit average is the extreme μβ. Then u_*μ=μβ for every u∈W. For any finite-measure cylinder test, a nonconstant continuous value in u would split Haar into two positive pieces and give a nontrivial convex decomposition of μβ. Cylinder tests separate measures; setting u=1 proves μ=μβ.

**Proof route.** Evaluate the unit translates on compact-cylinder test functions. If one value varies continuously, two positive-Haar pieces yield distinct normalized averaged scaling measures whose convex combination is the canonical extreme. This contradiction makes all test integrals constant; separating tests and the identity unit recover the original measure.

**Direct inputs.** [Ergodic scaling measure is extreme](#bc-canonical-extreme), [Unit average of a scaling measure](#bc-unit-average).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Corollary conclusion and averaging argument, p.3.

<a id="bc-corner-expectation"></a>
#### Diagonal expectation in the full corner

**Lemma** `TauCeti.BostConnes.corner_expectation` · `AnalyticNumberTheory:AN.9/bc-corner-expectation`.

The reduced crossed product has the positive contractive expectation E(Σq fq Uq)=f1. Its compression to pBp maps to C(Ẑ), preserves 1 and is faithful. The dynamics multiplies the q-term by q^(it).

**Proof route.** Import the identity-coefficient expectation of the reduced crossed product from OP2-expectation-measure. Compress by the compact-open integral projection. Positivity, contractivity and faithfulness survive compression, and the compressed unit maps to the constant one function.

**Direct inputs.** [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner), [Universal and reduced BC norms agree](#bc-universal-reduced).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-expectation-measure`.

**Sources.** [Marcelo Laca](https://arxiv.org/pdf/math/9911135), Laca §3.2, p.9; Neshveyev 2000 scaling correspondence, p.1.

<a id="bc-measure-to-kms"></a>
#### Scaling measure produces a KMS state

**Lemma** `TauCeti.BostConnes.scalingMeasure_to_kms` · `AnalyticNumberTheory:AN.9/bc-measure-to-kms`.

For β>0 and a normalized β-scaling μ, the functional φμ(a)=∫Ẑ E(a) dμ is a completed KMSβ state. The rational covariance and μ(qE)=q^(−β)μ(E) prove the core KMS identity. It is positive and normalized by the expectation.

**Proof route.** Integrate the corner expectation against the normalized measure. Check the core KMS identity on two finite crossed-product monomials using the rational scaling law and covariance. Linearity and the dense-core strip equivalence give the completed state.

**Direct inputs.** [Diagonal expectation in the full corner](#bc-corner-expectation), [All normalized scaling measures](#bc-scaling-measure-space), [The analytic core and the strip KMS condition](#bc-analytic-core-strip-equivalence).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-expectation-measure`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 scaling correspondence (1β), p.1.

<a id="bc-kms-to-measure"></a>
#### KMS restriction reconstructs a scaling measure

**Lemma** `TauCeti.BostConnes.kms_to_scalingMeasure` · `AnalyticNumberTheory:AN.9/bc-kms-to-measure`.

For β>0, restrict φ to C(Ẑ) and use the existing positive-functional measure representation. The KMS dilation identity implies ν(nE)=n^(−β)ν(E). This extends uniquely to a Radon μ on A_f with μ(Ẑ)=1 and μ(qE)=q^(−β)μ(E). Nonidentity rational terms have zero expectation in φ: use dynamics invariance when q≠1.

**Proof route.** Represent the diagonal restriction by the imported positive-functional measure theorem. The KMS identity for dilations gives scaling on integral compact opens, and exhaustion extends it uniquely to finite adeles. Dynamics invariance kills all terms with rational index different from 1; diagonal uniqueness proves reconstruction.

**Direct inputs.** [Diagonal expectation in the full corner](#bc-corner-expectation), [The analytic core and the strip KMS condition](#bc-analytic-core-strip-equivalence), [All normalized scaling measures](#bc-scaling-measure-space).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-expectation-measure`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 scaling correspondence, p.1.

<a id="bc-kms-scaling-correspondence"></a>
#### KMS states and scaling measures

**Comparison** `TauCeti.BostConnes.bc_kms_scaling_correspondence` · `AnalyticNumberTheory:AN.9/bc-kms-scaling-correspondence`.

For β>0 the maps μ↦φμ and φ↦μφ are inverse affine bijections between all normalized β-scaling Radon measures on A_f and completed KMSβ states. Restriction to Ẑ identifies the measure topology with weak convergence of its probability measures; under this topology the bijection is a homeomorphism.

**Proof route.** Expectation determines φ on rational terms; its diagonal restriction determines the normalized measure. Compare both compositions on C(Ẑ), then use scaling and density to obtain equality everywhere. Cylinder characters determine weak convergence on compact Ẑ; finite rational terms determine weak state convergence.

**Direct inputs.** [Scaling measure produces a KMS state](#bc-measure-to-kms), [KMS restriction reconstructs a scaling measure](#bc-kms-to-measure).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-expectation-measure`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Introduction, normalized scaling condition (1β) and KMS correspondence attributed to Laca, p.1.

<a id="bc-low-temperature-uniqueness"></a>
#### Critical-regime KMS uniqueness

**Theorem** `TauCeti.BostConnes.low_beta_unique` · `AnalyticNumberTheory:AN.9/bc-low-temperature-uniqueness`.

For 0<β≤1 every normalized β-scaling measure equals the canonical μβ, and therefore there is exactly one completed KMSβ state. The proof uses the explicit canonical extremality and compact-unit average rigidity, rather than assuming a general Choquet decomposition.

**Proof route.** Use the ergodic scaling measure to get an extremal factor state. Average any extremal state over the compact unit symmetries and use the invariant-measure uniqueness/Choquet argument. Compute the local Fourier coefficients by valuation shells.

**Direct inputs.** [Extreme unit average is constant](#bc-extreme-average-rigidity), [KMS states and scaling measures](#bc-kms-scaling-correspondence).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Corollary and proof, p.3 (p.4 contains references).

<a id="bc-high-beta-unit-orbits"></a>
#### Unit-orbit decomposition above the critical temperature

**Lemma** `TauCeti.BostConnes.bc_high_beta_unit_orbits` · `AnalyticNumberTheory:AN.9/bc-high-beta-unit-orbits`.

Forβ>1, the disjoint sets nẐ× cover a μβ-full subset ofẐ, and μβ(Ẑ×)=∏p(1−p^(−β))=ζ(β)^(−1). Every scaling measure is reconstructed from a probability measure onẐ× by the weighted orbit sums.

**Proof route.** Use the convergent Euler product for the unit mass. Apply the scaling law to disjoint n-unit orbits. The weighted masses sum to1, proving full measure and the reconstruction.

**Direct inputs.** [The finite-adele scaling measure](#bc-adelic-scaling-measure), [The partition function is the Riemann zeta function](#partition-function).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Introduction, unit-orbit decomposition after (1β), pp.1–2.

<a id="bc-high-beta-unit-measure"></a>
#### High-beta unit-mass reconstruction

**Lemma** `TauCeti.BostConnes.high_beta_unit_measure` · `AnalyticNumberTheory:AN.9/bc-high-beta-unit-measure`.

For β>1 any normalized scaling μ is carried by the disjoint sets qW, q∈Q_+×, W=Ẑ×, and μ(W)=1/ζ(β). Its normalized unit restriction ν=ζ(β) μ|W is a probability measure. Conversely μν=ζ(β)⁻¹Σq∈Q_+× q^(−β)(q_*ν) is the unique scaling measure with that unit restriction.

**Proof route.** For the normalization on Ẑ, only q∈N+ contributes, giving ζ(β). On compact rational dilates the sum is finite as a measure after the same convergent bound. Recover each qW component by scaling; the complement is null by the high-beta orbit theorem.

**Direct inputs.** [Unit-orbit decomposition above the critical temperature](#bc-high-beta-unit-orbits), [All normalized scaling measures](#bc-scaling-measure-space).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000, pp.1–2.

<a id="bc-high-beta-affine-homeomorphism"></a>
#### Probability measures parameterize high-beta KMS states

**Lemma** `TauCeti.BostConnes.high_beta_affine_homeomorphism` · `AnalyticNumberTheory:AN.9/bc-high-beta-affine-homeomorphism`.

For β>1, ν↦∫W φβ,u dν(u) is an affine homeomorphism from Radon probability measures on the existing compact group W=Ẑ× to completed KMSβ states. The inverse is the normalized unit restriction of the corresponding scaling measure.

**Proof route.** Restrict the scaling measure to units and multiply by zeta(beta). The rational-orbit decomposition reconstructs it and yields the Gibbs barycentre. Integrals against continuous test functions give weak continuity of both maps; the state topology is pointwise weak evaluation.

**Direct inputs.** [KMS states and scaling measures](#bc-kms-scaling-correspondence), [High-beta unit-mass reconstruction](#bc-high-beta-unit-measure), [Completed Gibbs state](#bc-completed-gibbs).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32, pp.474–476; Neshveyev 2000, pp.1–2.

<a id="bc-high-beta-extremes"></a>
#### High-beta extreme states

**Lemma** `TauCeti.BostConnes.high_beta_extreme_iff` · `AnalyticNumberTheory:AN.9/bc-high-beta-extremes`.

For β>1 the extreme KMS states are precisely φβ,u, u∈W; equality of two such states forces equality of their unit parameters. Dirac probability measures are exactly the extremes of ProbabilityMeasure W under the preceding affine homeomorphism.

**Proof route.** Transport extreme points through the affine probability-measure correspondence. Probability measures on a compact Hausdorff space are extreme exactly when Dirac; injectivity of the correspondence separates unit parameters.

**Direct inputs.** [Probability measures parameterize high-beta KMS states](#bc-high-beta-affine-homeomorphism).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32(2), p.474.

<a id="bc-unit-qmodz-adapter"></a>
#### Profinite units act on rational torsion

**Lemma** `TauCeti.BostConnes.profiniteUnits_qmodz_equiv` · `AnalyticNumberTheory:AN.9/bc-unit-qmodz-adapter`.

The imported Ẑ× maps to AddAut(Q/Z) by its compatible residues u_N acting on each N-torsion subgroup. This is bijective and continuous in the topology of finite restrictions; every torsion element belongs to one of these finite subgroups.

**Proof route.** Restrict an additive automorphism to every cyclic N-torsion subgroup and identify it with an invertible residue modulo N. These residues are compatible under divisibility, yielding a profinite unit. Conversely compatible residues act consistently on the union of all torsion subgroups; finite evaluations prove continuity.

**Direct inputs.** `mathlib:MulAut`, `mathlib:AddCircle`.

**Current upstream imports.** `tauceti:TauCetiRoadmap/ProfiniteArithmetic`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, §4.1, pp.457–459; Theorem 3.32, p.474.

<a id="bc-completed-barycentre"></a>
#### Gibbs barycentre of a probability measure

**Construction** `TauCeti.BostConnes.completedBarycentre` · `AnalyticNumberTheory:AN.9/bc-completed-barycentre`.

For β>1 and a Borel probability ν on W=zHat×, define φν(a)=integral_W φβ,u(a)dν(u). The character parameter W≃AddAut(Q/Z) is continuous on every torsion evaluation. The resulting map is a positive norm-one continuous functional and a KMSβ state. It is affine in ν; bijectivity and weak topological continuity are separate results.

**Proof route.** Integrate the completed Gibbs evaluations over the probability parameter. Their uniform norm-one bound gives an integrable bounded linear functional. Positivity and normalization pass under integration, and the completed KMS strip identity passes by dominated convergence.

**Direct inputs.** [Completed Gibbs state](#bc-completed-gibbs), [Profinite units act on rational torsion](#bc-unit-qmodz-adapter).

**API.**

- `TauCeti.BostConnes.completedBarycentre_apply` (characterisation): Evaluation is the stated Bochner integral.
- `TauCeti.BostConnes.completedBarycentre_norm` (characterisation): The functional has norm 1.
- `TauCeti.BostConnes.completedBarycentre_isKMS` (compatibility): Every probability barycentre is KMSβ.

**Unit tests.**

- `TauCeti.BostConnes.completedBarycentre_test_dirac` (computation): A Dirac mass at u recovers the completed Gibbs state u.
- `TauCeti.BostConnes.completedBarycentre_test_projection` (computation): For every ν, φν(μ2 μ2*)=2^(−β).
- `TauCeti.BostConnes.completedBarycentre_test_affine` (compatibility): A convex combination of probabilities gives the same convex combination of functionals.

**Consumers.** [High-β extremal states and unique barycentres](#bc-high-beta-barycentres): Uses this construction with its stated normalization and domain..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32 and proof, pp.474–476.

<a id="bc-high-beta-barycentres"></a>
#### High-β extremal states and unique barycentres

**Theorem** `TauCeti.BostConnes.bc_high_beta_barycentres` · `AnalyticNumberTheory:AN.9/bc-high-beta-barycentres`.

For β>1 every completed KMSβ state has a unique barycentre ν on W, characterized by φ(a)=∫W φβ,u(a)dν(u) for each a∈C_Q. Thus the high-beta KMS set is a Bauer simplex with extreme boundary homeomorphic to W. This specialized uniqueness follows from the measure bijection; it does not require an unproved general Choquet decomposition.

**Proof route.** Use the KMS–scaling-measure affine correspondence. Identify Dirac masses with the explicit Gibbs formula. Use the probability-measure extreme-point theorem and transport unit multiplication.

**Direct inputs.** [Probability measures parameterize high-beta KMS states](#bc-high-beta-affine-homeomorphism), [High-beta extreme states](#bc-high-beta-extremes), [Gibbs barycentre of a probability measure](#bc-completed-barycentre).

**Current upstream imports.** `tauceti:LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32, pp.474–475; Proposition 3.8, pp.447–448 supplies the general Choquet statement.

<a id="symmetry-action"></a>
#### The symmetry group Ẑ^× = Aut(ℚ/ℤ)

**Construction** `TauCeti.BostConnes.symmetry` · `AnalyticNumberTheory:AN.9/symmetry-action`.

For v ∈ Aut(ℚ/ℤ) (≅ Ẑ^×) there is a unique K-algebra automorphism θ_v of BCHecke K with θ_v(x_n) = x_n, θ_v(x′_n) = x′_n and θ_v(e(γ)) = e(v(γ)); on the basis, θ_v[class of [1 γ/m; 0 n/m]] = [class of [1 v(γ)/m; 0 n/m]]. It commutes with the time evolution, θ_vθ_w = θ_{vw}, and for K = ℂ it is a *-automorphism with π_u ∘ θ_v = π_{uv}, so φ_{β,u} ∘ θ_v = φ_{β,uv}.

**Hypotheses.** v ∈ Aut(ℚ/ℤ).

**Proof route.** The relations (a′)–(f′) are preserved: v is additive and commutes with multiplication by n on ℚ/ℤ, and permutes {δ : nδ = γ} onto {δ : nδ = v(γ)}. By the presentation (B.9/rational-presentation), θ_v is a well-defined algebra endomorphism with inverse θ_{v⁻¹}. θ_v fixes a(X), so it commutes with σ_z; it preserves the involution because v(−γ) = −v(γ). π_u(θ_v(e(γ)))ε_k = exp(2πik·u(v(γ)))ε_k.

**Direct inputs.** [The presentation of the rational Bost–Connes algebra](#rational-presentation), [The Bost–Connes time evolution](#time-evolution), [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), `mathlib:AddCircle`, `mathlib:MulAut`.

**API.**

- `TauCeti.BostConnes.symmetry` (constructor): symmetry (v : AddAut (ℚ/ℤ)) : BCHecke K ≃ₐ[K] BCHecke K (AddAut is the additive twin of MulAut).
- `TauCeti.BostConnes.symmetry_e` (simp): symmetry v (e γ) = e (v γ).
- `TauCeti.BostConnes.symmetry_x` (simp): symmetry v (x n) = x n and symmetry v (x' n) = x' n.
- `TauCeti.BostConnes.symmetry_mul` (relation): symmetry (v * w) = (symmetry w).trans (symmetry v).
- `TauCeti.BostConnes.symmetry_timeEvolution` (compatibility): symmetry v (timeEvolution z f) = timeEvolution z (symmetry v f).

**Unit tests.**

- `TauCeti.BostConnes.symmetry_neg_e` (computation): symmetry (−1) (e γ) = e (−γ).
- `TauCeti.BostConnes.symmetry_one` (degenerate): symmetry 1 = AlgEquiv.refl.
- `TauCeti.BostConnes.symmetry_gibbs` (compatibility): gibbsState β hβ u ∘ symmetry v = gibbsState β hβ (u * v).
- `TauCeti.BostConnes.no_symmetry_of_double` (non-example): Doubling on ℚ/ℤ is not bijective, and e γ ↦ e (2γ), x n ↦ x n is not an algebra map: it would send x 2 * x' 2 = 1 + e (1/2) both to itself and to 1 + e 1 = 2.

**Consumers.** [The Bost–Connes phase transition](#kms-classification): Acts freely and transitively on the low-temperature extremal states.; [Cyclotomic values and Galois action on extremal KMS∞ states](#galois-action-on-ground-states): Intertwines the Galois action on ground-state values..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.3, (3.75), p. 461.

<a id="bc-kms-symmetry-transitive"></a>
#### Symmetry on the high-beta extreme boundary

**Lemma** `TauCeti.BostConnes.extreme_symmetry_torsor` · `AnalyticNumberTheory:AN.9/bc-kms-symmetry-transitive`.

For β>1, pullback by θ_v maps φβ,u to φβ,uv, with composition conventions fixed by the action on Q/Z. Therefore W acts freely and transitively on the high-beta extreme boundary.

**Proof route.** Apply the symmetry to each torsion generator in the Gibbs formula. The resulting character is the product of the two unit parameters. The injective identification of extremes with units then gives freeness and transitivity.

**Direct inputs.** [High-beta extreme states](#bc-high-beta-extremes), [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#symmetry-action).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32(3), p.474.

<a id="kms-classification"></a>
#### The Bost–Connes phase transition

**Theorem** `TauCeti.BostConnes.kms_classification` · `AnalyticNumberTheory:AN.9/kms-classification`.

For 0<β≤1 there is exactly one completed KMSβ state; for β>1 its extreme boundary is W and its states are uniquely the barycentres of the Gibbs extremes. The first regime follows from low-temperature-uniqueness, the second from high-beta-affine-homeomorphism; symmetry is a separate torsor theorem.

**Hypotheses.** β > 0; states and KMS condition as in B.9/kms-states.

**Proof route.** Restrict a completed KMS state to the commutative C(Ẑ) and use the KMS–scaling-measure correspondence. For 0<β≤1 use the finite-prime projection, character-annihilation and ergodicity chain; for β>1 use the unit-orbit decomposition and barycentre chain. Transport the measure classification back to states and apply the symmetry intertwining.

**Direct inputs.** [Critical-regime KMS uniqueness](#bc-low-temperature-uniqueness), [High-β extremal states and unique barycentres](#bc-high-beta-barycentres), [Symmetry on the high-beta extreme boundary](#bc-kms-symmetry-transitive).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, Theorem 3.32, pp. 474–475; [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, Theorem 3.32, p. 475.

**Atlas planet.** Bost–Connes phase transition.

<a id="bc-kms-infinity-and-ground"></a>
#### KMS∞ states and upper-half-plane ground states

**Definition** `TauCeti.BostConnes.KMSInfinity` · `AnalyticNumberTheory:AN.9/bc-kms-infinity-and-ground`.

For the BC system, KMS∞ means a state in the weak closure of KMSβ states along β→∞: every finite set of observables, tolerance ε>0 and threshold B is met by some β>B and KMSβ state. Ground means each correlation has a bounded holomorphic extension to the upper half-plane. These are separate predicates; the general trivial-dynamics matrix test distinguishes them.

**Proof route.** Use the finite-observable weak topology on bounded states. Use the upper-half-plane boundedness definition separately. Prove the implication by compactness/normal-family limits rather than equating the definitions.

**Direct inputs.** [Completed KMS states and the bounded strip condition](#bc-completed-kms), [Point-norm continuous completed dynamics](#bc-dynamics-continuous).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-kms`.

**API.**

- `TauCeti.BostConnes.KMSInfinity.isLimit` (constructor): The finite-observable weak-limit criterion as β tends to infinity.
- `TauCeti.BostConnes.KMSInfinity.isGround` (constructor): The bounded holomorphic upper-half-plane correlation condition.
- `TauCeti.BostConnes.KMSInfinity.limit_isGround` (relation): Every KMS∞ state is a ground state under the completed dynamics.

**Unit tests.**

- `TauCeti.BostConnes.KMSInfinity.test_gibbs_limit` (compatibility): The β→∞ limit of φβ,u is the ε1 vector state.
- `TauCeti.BostConnes.KMSInfinity.test_value_half` (computation): The extremal limit has value−1 on e(1/2).
- `TauCeti.BostConnes.KMSInfinity.test_different_notions` (non-example): For trivial dynamics on M2(C), the vector state a↦a00 satisfies the same upper-half-plane ground-state predicate but fails the finite-temperature-limit predicate: a01a10 and a10a01 have state values 1 and 0. This tests the generic predicates with which the completed BC predicates are compatible.

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definition 3.7 and following ground-state remark, p.447.

<a id="bc-eisenstein-finite-fourier"></a>
#### Finite cotangent Fourier identity

**Lemma** `TauCeti.BostConnes.bc_eisenstein_finite_fourier` · `AnalyticNumberTheory:AN.9/bc-eisenstein-finite-fourier`.

For N>0 and ζ^N=1, Σ1≤j<N(j/N−1/2)ζ^j equals (ζ+1)/(2(ζ−1)) when ζ≠1 and equals 0 when ζ=1. The nontrivial value is cot(πt)/(2i) for ζ=exp(2πit). Passing to a multiple of N gives the same value for every N-torsion character; finite Fourier injectivity proves level independence in Q[Q/Z].

**Proof route.** Differentiate the finite geometric sum and evaluate at a nontrivial Nth root. At ζ=1 sum the rational coefficients directly; their sum is zero. Evaluate both levels at all characters of their common finite cyclic group and use finite Fourier injectivity.

**Direct inputs.** `mathlib:Complex.exp`, `mathlib:Polynomial`, [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Lemma 3.28 and its finite Abel-summation proof, pp.464–465.

<a id="bc-trigonometric-eisenstein"></a>
#### First trigonometric Eisenstein function

**Construction** `TauCeti.BostConnes.ArithmeticEisenstein` · `AnalyticNumberTheory:AN.9/bc-trigonometric-eisenstein`.

For a∈Q/Z and any positive N annihilating a, e1,a=Σ1≤j<N(j/N−1/2)e(ja) in the rational group algebra. The sum is independent of N. Under a torsion character with ρ(a)≠0 it evaluates to cot(πρ(a))/(2i); at ρ(a)=0 it is zero. Higher functions and their polynomial recurrence are separate constructions.

**Proof route.** Choose an annihilating level and form the finite rational Fourier sum. The finite Fourier identity proves independence under multiples of a level and hence under a common multiple. Evaluate at torsion characters, retaining the zero value at the trivial character.

**Direct inputs.** [The Bost–Connes Hecke algebra](#bost-connes-hecke-algebra), [Finite cotangent Fourier identity](#bc-eisenstein-finite-fourier).

**API.**

- `TauCeti.BostConnes.ArithmeticEisenstein.first` (constructor): The first finite rational Fourier sum.
- `TauCeti.BostConnes.ArithmeticEisenstein.finite_sum` (characterisation): For every positive N annihilating a, first a is the displayed sum.
- `TauCeti.BostConnes.ArithmeticEisenstein.neg` (functoriality): first (−a)=−first a.

**Unit tests.**

- `TauCeti.BostConnes.ArithmeticEisenstein.test_first_zero` (degenerate): first 0=0.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_half` (computation): first (1/2)=0.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_third` (computation): first (1/3)=−e(1/3)/6+e(2/3)/6.

**Consumers.** `AnalyticNumberTheory:AN.9`: The downstream proof chains below consume these named operations, identities and normalization tests..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, §4.4, Lemmas3.27–3.28, (3.91)–(3.101), pp.464–465.

<a id="bc-eisenstein-polynomials"></a>
#### Eisenstein recurrence polynomials

**Definition** `TauCeti.BostConnes.ArithmeticEisenstein.polynomial` · `AnalyticNumberTheory:AN.9/bc-eisenstein-polynomials`.

Define P0=0, P1=X and Pk+1=(X²−1/4)P′k/k for k≥1 in Q[X]. For k≥1, Pk is monic of degree k. The derivative recurrence comes from the normalized cotangent identity; Pk(0) is the prescribed value at a degenerate lattice.

**Proof route.** Define recursively in Q[X]. The leading derivative coefficient k cancels division by k, preserving monicity while increasing the degree by one.

**Direct inputs.** `mathlib:Polynomial`.

**API.**

- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial_recurrence` (characterisation): For k≥1, P(k+1)=(X²−1/4)P′k/k.
- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial_monic` (characterisation): For k≥1, Pk.Monic.
- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial_degree` (characterisation): For k≥1, Pk.natDegree=k.

**Unit tests.**

- `TauCeti.BostConnes.ArithmeticEisenstein.test_polynomial_two` (computation): P2=X²−1/4.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_polynomial_three` (computation): P3=X³−X/4.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_polynomial_four` (computation): P4=X⁴−X²/3+1/48.

**Consumers.** [Higher trigonometric Eisenstein functions](#bc-eisenstein-higher): Uses the exact construction, normalization and compatibility API stated here.; [Rational power sums in a prime corner](#bc-eisenstein-corner-power-sums): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Lemma 3.27, (3.94)–(3.97), pp.464–465.

<a id="bc-eisenstein-mobius-divisibility"></a>
#### Möbius divisibility identities

**Lemma** `TauCeti.BostConnes.bc_eisenstein_mobius_divisibility` · `AnalyticNumberTheory:AN.9/bc-eisenstein-mobius-divisibility`.

For fn(j)=Σd|j μ(d)(j/d)^n, the projection sum Σd|N fn(d)πd evaluates on a Q-lattice to m^n, where m is the order of its N-torsion kernel. Keep n=1 and n=1−k, including negative exponents.

**Proof route.** Write divisibility projections as indicator functions of divisors of m. Use finite Möbius inversion. Retain rational negative powers when deriving the k-division relation.

**Direct inputs.** [First trigonometric Eisenstein function](#bc-trigonometric-eisenstein), `mathlib:ArithmeticFunction.moebius`, `mathlib:ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, equations (3.103)–(3.107), p.466.

<a id="bc-eisenstein-higher"></a>
#### Higher trigonometric Eisenstein functions

**Definition** `TauCeti.BostConnes.ArithmeticEisenstein.higher` · `AnalyticNumberTheory:AN.9/bc-eisenstein-higher`.

For k≥0 and a∈Q/Z define ek,a=Pk(e1,a) in the rational group algebra. The value at a character killing a is Pk(0), including e2,0=−1/4. On the nondegenerate locus this agrees with the k-fold normalized cotangent series; k=1 uses the symmetric principal-value convention.

**Proof route.** Apply the rational polynomial Pk to the first function. Evaluate in characters and use the cotangent recurrence on the nondegenerate locus. The degenerate character has first value zero, hence higher value Pk(0), rather than zero in every weight.

**Direct inputs.** [First trigonometric Eisenstein function](#bc-trigonometric-eisenstein), [Eisenstein recurrence polynomials](#bc-eisenstein-polynomials).

**API.**

- `TauCeti.BostConnes.ArithmeticEisenstein.higher_eval` (characterisation): higher k a=eval₂ (algebraMap Q _) (first a) (polynomial k).
- `TauCeti.BostConnes.ArithmeticEisenstein.higher_one` (characterisation): higher 1 a=first a.
- `TauCeti.BostConnes.ArithmeticEisenstein.higher_zero_argument` (characterisation): higher k 0=algebraMap Q _ ((polynomial k).eval 0).

**Unit tests.**

- `TauCeti.BostConnes.ArithmeticEisenstein.test_zero` (degenerate): first 0=0 and higher 2 0=−1/4.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_higher_half` (computation): higher 2 (1/2)=−1/4 and higher 3 (1/2)=0.
- `TauCeti.BostConnes.ArithmeticEisenstein.test_higher_third` (computation): higher 2 (1/3)=(e(1/3)+e(2/3)−11·1)/36.

**Consumers.** [The Eisenstein division formula](#bc-eisenstein-division): Uses the exact construction, normalization and compatibility API stated here.; [Eisenstein algebra is stable under semigroup endomorphisms](#bc-eisenstein-semigroup-preservation): Uses the exact construction, normalization and compatibility API stated here..

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Lemma 3.27, (3.91)–(3.101), pp.464–465.

<a id="bc-eisenstein-division"></a>
#### The Eisenstein division formula

**Lemma** `TauCeti.BostConnes.bc_eisenstein_division` · `AnalyticNumberTheory:AN.9/bc-eisenstein-division`.

For k≥1, ΣNa=0 ek,a=γk Σd|N[(2^k−2)f1(d)+N^k f1−k(d)]πd, with γk=(2πi)^(−k)Σy∈Z\{0} y^(−k) in the source normalization (symmetric principal value for k=1; absolute convergence for k>1). For odd k the vanishing is interpreted consistently. Both the arithmetic coefficients and the degenerate-value convention are fixed by the preceding identities.

**Proof route.** Count the m-fold fibres of the N-torsion map. Evaluate the nondegenerate trigonometric sum plus the degenerate correction. Replace powers of m by the Möbius projection sums.

**Direct inputs.** [First trigonometric Eisenstein function](#bc-trigonometric-eisenstein), [Möbius divisibility identities](#bc-eisenstein-mobius-divisibility), [Higher trigonometric Eisenstein functions](#bc-eisenstein-higher), `mathlib:ArithmeticFunction.moebius`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Lemma 3.29, (3.108)–(3.109), p.467.

<a id="bc-eisenstein-prime-projections"></a>
#### Recovering prime-power divisibility projections

**Lemma** `TauCeti.BostConnes.bc_eisenstein_prime_projections` · `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-projections`.

All projections πp^b belong to the Q-algebra generated by e1,a. For odd p, solve the k=2 division relation inductively in b. For p=2 the leading π2^b coefficient vanishes, so use the relation at N=2^(b+1) to recover π2^b; e.g. π2=3+2Σ4a=0 e2,a.

**Proof route.** Compute the leading coefficient−p^(b−1)(2−3p+p²). For p=2 retain the nonzero next projection coefficient at the doubled torsion level. Use coprime products to recover allπN.

**Direct inputs.** [The Eisenstein division formula](#bc-eisenstein-division), [First trigonometric Eisenstein function](#bc-trigonometric-eisenstein).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, proof of Theorem 3.30, prime-power and doubled dyadic level step, pp.467–468.

<a id="bc-eisenstein-corner-power-sums"></a>
#### Rational power sums in a prime corner

**Lemma** `TauCeti.BostConnes.bc_eisenstein_corner_power_sums` · `AnalyticNumberTheory:AN.9/bc-eisenstein-corner-power-sums`.

Let N=p^b, e=1−πp, and zj=e e1,j/N for 1≤j<N in the unital corner eQ[Q/Z]. The division formula gives Σj Pk(zj)=(N^k−1)γk e for every k≥1, where Pk is evaluated with corner unit e. Since Pk is monic of degree k, triangular induction gives Σj zj^k∈Qe. Zero roots and repeated roots are retained; there are N−1 indices.

**Proof route.** Multiply the division identity by e and subtract the j=0 term Pk(0)e. Solve successively for each ordinary power sum using the monic polynomial Pk and previously known lower powers.

**Direct inputs.** [Eisenstein recurrence polynomials](#bc-eisenstein-polynomials), [The Eisenstein division formula](#bc-eisenstein-division), [Recovering prime-power divisibility projections](#bc-eisenstein-prime-projections).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, proof of Theorem 3.30, (3.110)–(3.113), p.468.

<a id="bc-eisenstein-newton-rationality"></a>
#### Newton identities in the reduced corner

**Lemma** `TauCeti.BostConnes.bc_eisenstein_newton_rationality` · `AnalyticNumberTheory:AN.9/bc-eisenstein-newton-rationality`.

For the N−1 commuting elements zj in the preceding corner, all elementary symmetric functions σh(z1,…,zN−1) belong to Qe. Hence QN(X)=∏j=1..N−1(X−zj) is a monic degree-N−1 polynomial with rational scalar coefficients in that corner and QN(z1)=0.

**Proof route.** Use hσh=Σk=1..h(−1)^(k−1)σh−k sk over Q. Division by each positive h is permitted, so induction gives rational coefficients. The product polynomial vanishes at z1 by its first factor; its degree is N−1 regardless of zero-root multiplicity.

**Direct inputs.** [Rational power sums in a prime corner](#bc-eisenstein-corner-power-sums), `mathlib:Polynomial`, `mathlib:MvPolynomial.mul_esymm_eq_sum`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, proof of Theorem 3.30, (3.113)–(3.115), pp.468–469.

<a id="bc-eisenstein-cotangent-roots"></a>
#### Roots of the reduced polynomial

**Lemma** `TauCeti.BostConnes.bc_eisenstein_cotangent_roots` · `AnalyticNumberTheory:AN.9/bc-eisenstein-cotangent-roots`.

At an invertible Q-lattice, QN has multiset of roots cot(πj/N)/(2i), 1≤j<N. A unit character permutes this multiset. These roots are purely imaginary, so 1/2 is never a root. For even N the root at j=N/2 is zero and must be retained.

**Proof route.** Evaluate the corner polynomial in an invertible lattice and list all N-1 nontrivial torsion characters. A unit permutes this list. Each cotangent is real, so its division by 2i is purely imaginary and differs from 1/2; the even-level zero remains a root.

**Direct inputs.** [Newton identities in the reduced corner](#bc-eisenstein-newton-rationality), [Finite cotangent Fourier identity](#bc-eisenstein-finite-fourier).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, proof of Theorem 3.30, after (3.115), p.469.

<a id="bc-eisenstein-bezout-cayley"></a>
#### Polynomial recovery of the Cayley transform

**Lemma** `TauCeti.BostConnes.bc_eisenstein_bezout_cayley` · `AnalyticNumberTheory:AN.9/bc-eisenstein-bezout-cayley`.

Since QN(1/2)≠0, gcd(QN,2X−1)=1 in Q[X]. Bézout yields U,V∈Q[X] with U(2X−1)+VQN=1. In the reduced corner, 2z1−e is invertible with inverse U(z1), and (2z1+e)U(z1)=e e(1/N). Thus this root-of-unity component lies in the Eisenstein algebra.

**Proof route.** Evaluate the Bézout identity at z1; QN(z1)=0. Use the finite cotangent Fourier identity to identify (2z1+e)/(2z1−e) with e times the root of unity.

**Direct inputs.** [Roots of the reduced polynomial](#bc-eisenstein-cotangent-roots), `mathlib:Polynomial`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, proof of Theorem 3.30, (3.116)–(3.117), p.469.

<a id="bc-eisenstein-semigroup-preservation"></a>
#### Eisenstein algebra is stable under semigroup endomorphisms

**Lemma** `TauCeti.BostConnes.bc_eisenstein_semigroup_preservation` · `AnalyticNumberTheory:AN.9/bc-eisenstein-semigroup-preservation`.

For αn(f)=μn f μn*, αn(ek,a)=πn ek,a/n, independently of the chosen n-preimage a/n. The projections πn belong to the algebra generated by first functions, so αn preserves that algebra.

**Proof route.** Apply dilation covariance to every term of the finite first-function Fourier expression. It produces the range projection times the selected preimage expression; different preimages agree after multiplying by that projection. Polynomial evaluation gives all higher functions.

**Direct inputs.** [Higher trigonometric Eisenstein functions](#bc-eisenstein-higher), [Recovering prime-power divisibility projections](#bc-eisenstein-prime-projections), [The presentation of the rational Bost–Connes algebra](#rational-presentation).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, (3.98)–(3.99), pp.464–465; final induction in Theorem 3.30, pp.469–470.

<a id="bc-eisenstein-prime-level-induction"></a>
#### Reassembly of the prime-power components

**Lemma** `TauCeti.BostConnes.bc_eisenstein_prime_level_induction` · `AnalyticNumberTheory:AN.9/bc-eisenstein-prime-level-induction`.

For N=p^b, the (1−πp)e(1/N) component is supplied by the Cayley lemma. The other component is πp e(1/N)=αp(e(p/N)); the induction hypothesis at p^(b−1) and semigroup preservation put it in the Eisenstein algebra. At b=1 its lower-level input is e(0)=1. Adding the complementary components recovers e(1/N).

**Proof route.** Split e(1/N) by the complementary prime projection. The Cayley lemma recovers the complementary corner; semigroup covariance expresses the prime-projection part through the lower-level torsion element. Induct on b with e(0)=1 as the base.

**Direct inputs.** [Polynomial recovery of the Cayley transform](#bc-eisenstein-bezout-cayley), [Eisenstein algebra is stable under semigroup endomorphisms](#bc-eisenstein-semigroup-preservation).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, last part of Theorem 3.30 proof, pp.469–470.

<a id="bc-eisenstein-roots-recovery"></a>
#### Recovering roots of unity from Eisenstein functions

**Lemma** `TauCeti.BostConnes.bc_eisenstein_roots_recovery` · `AnalyticNumberTheory:AN.9/bc-eisenstein-roots-recovery`.

Every e(a), a∈Q/Z, belongs to the Q-algebra generated by first trigonometric Eisenstein functions. Prime-power denominators follow from reduced-corner Newton identities, the Bézout Cayley inverse and the explicit lower-level induction. General denominators follow by writing a as a sum of its prime-primary components and using e(a+b)=e(a)e(b).

**Proof route.** Apply the prime-level induction separately to each prime power in the denominator. Decompose the torsion point into prime-primary summands and multiply the recovered roots.

**Direct inputs.** [Reassembly of the prime-power components](#bc-eisenstein-prime-level-induction), [The presentation of the rational Bost–Connes algebra](#rational-presentation).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, proof of Theorem 3.30, (3.110)–(3.117), pp.468–469.

<a id="bc-arithmetic-algebra-generation"></a>
#### The trigonometric arithmetic algebra equals the BC rational form

**Theorem** `TauCeti.BostConnes.bc_arithmetic_algebra_generation` · `AnalyticNumberTheory:AN.9/bc-arithmetic-algebra-generation`.

The rational subalgebra generated by e1,a for all a is Q[Q/Z]. The finite Fourier formula gives containment in the group algebra, and the root-recovery lemma gives the opposite containment. This is a statement about the diagonal rational group algebra; adjoining isometries and complexification are separate results.

**Proof route.** Use the finite Fourier sum for the first inclusion. Use root recovery and the spanning basis e(a) for the reverse inclusion.

**Direct inputs.** [First trigonometric Eisenstein function](#bc-trigonometric-eisenstein), [Recovering roots of unity from Eisenstein functions](#bc-eisenstein-roots-recovery).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.30 and proof, pp.467–470.

<a id="bc-cyclotomic-restrictions"></a>
#### Compatible finite cyclotomic restrictions

**Lemma** `TauCeti.BostConnes.cyclotomic_restrictions_compatible` · `AnalyticNumberTheory:AN.9/bc-cyclotomic-restrictions`.

For every field automorphism τ of C fixing Q, the exponents v_N∈(Z/NZ)× defined by τ(ζ_N)=ζ_N^(v_N) are compatible under divisibility. Conversely compatible exponents define an automorphism of Qcycl. The imported finite cyclotomic Galois identifications supply each v_N; the transition verification supplies their inverse-limit element v∈Ẑ×.

**Proof route.** Import each finite cyclotomic Galois identification. Restriction to smaller cyclotomic fields equates the exponents modulo their levels. The compatible family acts on the union Qcycl and yields the profinite unit; no global Artin theorem is needed.

**Direct inputs.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, [Profinite units act on rational torsion](#bc-unit-qmodz-adapter), `mathlib:IsCyclotomicExtension`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32(4), pp.474–476.

<a id="galois-action-on-ground-states"></a>
#### Cyclotomic values and Galois action on extremal KMS∞ states

**Theorem** `TauCeti.BostConnes.groundState_galois` · `AnalyticNumberTheory:AN.9/galois-action-on-ground-states`.

For u ∈ Aut(ℚ/ℤ) the extremal KMS∞ vector state φ_{∞,u}(f) = ⟨ε₁, π_u(f)ε₁⟩ is the limit of φ_{β,u} as β → ∞. On the rational form H_ℚ (the ℚ-valued functions), φ_{∞,u}([X]) = exp(2πi u(γ)) if X is the class of translation γ and 0 otherwise; so φ_{∞,u}(H_ℚ) lies in the cyclotomic field ℚ(μ_∞) ⊂ ℂ. For every field automorphism τ of ℂ, τ ∘ φ_{∞,u} = φ_{∞,χ(τ)u} on H_ℚ, where χ(τ) ∈ Aut(ℚ/ℤ) is the automorphism with τ(exp(2πiγ)) = exp(2πi χ(τ)(γ)); that is, τ ∘ φ_{∞,u} = φ_{∞,u} ∘ θ_{χ(τ)}. This states the extremal KMS∞ result and does not classify all upper-half-plane ground states.

**Hypotheses.** u ∈ Aut(ℚ/ℤ); τ a ring automorphism of ℂ.

**Proof route.** π_u(x_n e(γ) x′_m)ε₁ = 0 unless m = 1, and then it is a multiple of ε_n, orthogonal to ε₁ unless n = 1; so φ_{∞,u} kills every basis element except the classes of translations, where it is exp(2πi u(γ)). Limit: φ_{β,u}(e(γ)) = ζ(β)⁻¹Σ k^{−β}exp(2πiku(γ)) → exp(2πiu(γ)) as β → ∞, since ζ(β) → 1 and the tail is O(2^{−β}). τ permutes the roots of unity in ℂ, and the induced map on ℚ/ℤ ≅ μ_∞ is additive and bijective; this defines χ(τ) (the cyclotomic character). Then τ(exp(2πiu(γ))) = exp(2πi χ(τ)(u(γ))), and B.9/symmetry-action gives the intertwining. Prove the KMS∞ limit on the completed state space and then restrict to either rational form; continuity of arbitrary complex field automorphisms is never assumed.

**Direct inputs.** [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), [The Gibbs states φ_{β,u}](#gibbs-states), [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#symmetry-action), [The two rational forms of the Bost–Connes algebra](#rational-forms-comparison), `mathlib:IsCyclotomicExtension`, [KMS∞ states and upper-half-plane ground states](#bc-kms-infinity-and-ground), [The trigonometric arithmetic algebra equals the BC rational form](#bc-arithmetic-algebra-generation), [Compatible finite cyclotomic restrictions](#bc-cyclotomic-restrictions).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, Theorem 3.32, (3.136)–(3.137), p. 475.

<a id="bc-prime-pair-ratio"></a>
#### Prime pairs with prescribed ratio and divergent weights

**Lemma** `TauCeti.BostConnes.bc_prime_pair_ratio` · `AnalyticNumberTheory:AN.9/bc-prime-pair-ratio`.

For0<β≤1, λ>1 and ε>0 there are disjoint prime pairs(pn,qn) with |(qn/pn)^β−λ|<ε and Σn qn^(−β)=∞.

**Proof route.** Choose multiplicative intervals(λ^(2m)x0,(1+δ)λ^(2m)x0] and their alternating partners, adjustingλ toλ^(1/β). Use the prime number theorem to inject the smaller prime list into the partner list. The interval cardinalities divided by the upper endpoint give a divergent harmonic-m sum; β≤1 retains divergence.

**Direct inputs.** `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

<a id="bc-valuation-tail-ratio"></a>
#### Valuation-tail cylinder ratios

**Lemma** `TauCeti.BostConnes.bc_valuation_tail_ratio` · `AnalyticNumberTheory:AN.9/bc-valuation-tail-ratio`.

For distinct primes p,q, the valuation swap (vp,vq)=(0,1)→(1,0) has target/source cylinder mass ratio (q/p)^β. Under the pushforward-at-target convention, the derivative of this forward map x↦(p/q)x is (p/q)^β; the inverse map has derivative (q/p)^β. Both values enter the ratio-set subgroup. The factors (1−p^(−β))(1−q^(−β)) cancel.

**Proof route.** Multiply the two local probabilities. Cancel the two(1−p^(−β)) normalizers in the ratio. Use q^(−β)(1−p^(−β))(1−q^(−β)) and the prime-pair divergence.

**Direct inputs.** [The finite-adele scaling measure](#bc-adelic-scaling-measure), [Prime pairs with prescribed ratio and divergent weights](#bc-prime-pair-ratio).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), Theorem 2.1 proof, pp.4–5; §1 convention, p.2.

<a id="bc-prime-pairs-congruence"></a>
#### Prime pairs with controlled unit residues

**Lemma** `TauCeti.BostConnes.prime_pair_congruence_ratio` · `AnalyticNumberTheory:AN.9/bc-prime-pairs-congruence`.

For N≥1, λ>1 and ε>0, fixed-progression PNT supplies disjoint prime pairs p_n,q_n≡1(modN) with q_n/p_n→λ and Σp_n^(−1)=∞. Select primes in two disjoint proportional intervals inside successive geometric blocks, matching their counts with a fixed positive density. For 0<β≤1 the pair-swap source masses also have divergent sum.

**Proof route.** Apply PNT in the residue class 1 mod N to paired intervals [X,(1+δ)X] and [λX,λ(1+δ)X]. Choose δ small enough for the desired ratio tolerance; matching counts are bounded below by cX/logX. Separate successive blocks geometrically; each block contributes ≥c/logX to Σ1/p, so the block sum diverges. A diagonal tolerance choice preserves this divergence.

**Direct inputs.** `AnalyticNumberTheory:AN.2`, [Reciprocal primes in progressions](#bc-prime-progression-divergence).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), Lemma 2.3 and proof, p.5, with fixed-progression refinement.

<a id="bc-ratio-set"></a>
#### Ratio set of a nonsingular action

**Definition** `TauCeti.BostConnes.RatioSet` · `AnalyticNumberTheory:AN.9/bc-ratio-set`.

Let a countable group G act nonsingularly on a nonzero standard sigma-finite measure space (X,μ), and let ρg=d(g_*μ)/dμ with g_*μ(E)=μ(g⁻¹E). RatioSet is the set of λ≥0 such that for every measurable A of positive measure and ε>0 some g has μ({x∈A∩gA:|ρg(x)−λ|<ε})>0. The derivative is evaluated at the target x.

**Proof route.** Use the Radon-Nikodym derivative of the pushforward at its target and restrict the witness set to A intersect gA. This definition records positivity and essential approximation; its general orbit-invariance and classification API belongs to OP2-ratio.

**Direct inputs.** .

**Current upstream imports.** `tauceti:TauCetiRoadmap/RestrictedProducts`, `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-ratio`.

**API.**

- `TauCeti.BostConnes.RatioSet.one_mem` (characterisation): The identity transformation puts 1 in the ratio set.
- `TauCeti.BostConnes.RatioSet.closed` (characterisation): The ratio set is closed in nonnegative reals.
- `TauCeti.BostConnes.RatioSet.orbit_invariant` (compatibility): Equivalent nonsingular orbit relations have the same ratio set. The derivative convention is pushforward at the target.

**Unit tests.**

- `TauCeti.BostConnes.RatioSet.test_trivial_one` (computation): For the identity action on a one-point probability space, 1 lies in the ratio set.
- `TauCeti.BostConnes.RatioSet.test_trivial_two` (non-example): For that same action, 2 does not lie in the ratio set.
- `TauCeti.BostConnes.RatioSet.test_trivial_zero` (non-example): For that same action, 0 does not lie in the ratio set.

**Consumers.** [All positive numbers belong to the ratio set](#bc-full-positive-ratio-set): States the target on finite adeles with its explicit pushforward derivative..

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), §1 ratio-set definition, p.2.

<a id="bc-asymptotic-ratio-inclusion"></a>
#### Independent tail swaps give essential ratios

**Lemma** `TauCeti.BostConnes.asymptotic_ratio_mem` · `AnalyticNumberTheory:AN.9/bc-asymptotic-ratio-inclusion`.

On a product of countable probability spaces, suppose mutually disjoint finite coordinate blocks have bijective swaps with cylinder mass ratios approaching λ>0 uniformly and a divergent sum of source cylinder masses. Then λ belongs to the ratio set of the finite-tail equivalence relation. The pushforward derivative of the inverse swap at its target equals the forward cylinder mass ratio.

**Proof route.** Independent blocks and the divergent sum give arbitrarily distant successful swaps of positive total mass. Approximate any positive-measure set by a finite cylinder in relative measure, then select a tail block for which source and image both meet that set with positive mass. Apply the inverse swap so its target derivative has the stated mass ratio.

**Direct inputs.** [Ratio set of a nonsingular action](#bc-ratio-set).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-ratio`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), §1 asymptotic ratio definition and inclusion, p.2.

<a id="bc-ratio-unit-lifting"></a>
#### Ratio witnesses lift through unit cylinders

**Lemma** `TauCeti.BostConnes.ratio_witness_unit_lift` · `AnalyticNumberTheory:AN.9/bc-ratio-unit-lifting`.

For any finite cylinder of integral adeles, choose its congruence level N and all its specified valuation primes. Tail pairs p,q≡1(modN), beyond those primes, act trivially on the cylinder unit residues. Their swaps therefore retain the independent-tail essential-ratio witnesses on the full adele space, rather than only on its quotient by W.

**Proof route.** Approximate a positive-measure set by a finite valuation-and-residue cylinder. Select tail prime pairs outside those coordinates and congruent to one at its finite level. Their rational swaps preserve specified unit residues, so independent-tail witnesses lift with positive measure.

**Direct inputs.** [Prime pairs with controlled unit residues](#bc-prime-pairs-congruence), [Independent tail swaps give essential ratios](#bc-asymptotic-ratio-inclusion), [Valuation-tail cylinder ratios](#bc-valuation-tail-ratio).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-ratio`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), Theorem 2.1 proof, pp.4–5; specialized congruence-cylinder lifting.

<a id="bc-full-positive-ratio-set"></a>
#### All positive numbers belong to the ratio set

**Lemma** `TauCeti.BostConnes.bc_full_positive_ratio_set` · `AnalyticNumberTheory:AN.9/bc-full-positive-ratio-set`.

For 0<β≤1 the nonsingular Q+× action on (A_f,μβ) has RatioSet=[0,∞). Its pushforward density is ρq(x)=q^β. Prime pairs with fixed unit congruences give every λ>1 after the β power; inverses give λ∈(0,1), and closure gives 0.

**Proof route.** Approximate any finite positive-measure set by a finite valuation and unit cylinder. Use congruence-controlled disjoint pairs and the independent-tail inclusion; the inverse swap fixes the derivative convention. Close the resulting multiplicative subgroup and use a rational-dilate exhaustion for arbitrary positive-measure sets.

**Direct inputs.** [Ratio witnesses lift through unit cylinders](#bc-ratio-unit-lifting), [Ratio set of a nonsingular action](#bc-ratio-set).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

<a id="bc-ergodic-crossed-product-factor"></a>
#### Ergodicity makes the group-measure algebra a factor

**Lemma** `TauCeti.BostConnes.ergodic_crossed_product_factor` · `AnalyticNumberTheory:AN.9/bc-ergodic-crossed-product-factor`.

For the canonical μβ, the Q+× action is essentially free: qx=x with q≠1 forces x=0, a null point. For a countable essentially free nonsingular action on a standard sigma-finite measure space, the center of L∞(X,μ)⋊G equals L∞(X,μ)^G; ergodicity therefore makes it a factor.

**Proof route.** For a nonidentity rational q, invert q-1 in the finite adeles to show its only fixed point is zero; scaling gives that point measure zero. Import the group-measure-space center theorem from OP2-factor, then use the canonical ergodicity result.

**Direct inputs.** [Ergodicity of positive rationals on finite adeles](#bc-critical-ergodicity), [All normalized scaling measures](#bc-scaling-measure-space).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-factor`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Corollary proof, p.3.

<a id="bc-ratio-factor-type"></a>
#### Full positive ratio set determines type III1

**Lemma** `TauCeti.BostConnes.ratio_set_type_three_one` · `AnalyticNumberTheory:AN.9/bc-ratio-factor-type`.

For a countable essentially free ergodic nonsingular action on a standard sigma-finite measure space, RatioSet=[0,∞) implies its group-measure factor has type III1; equivalently its flow of weights is trivial. This is the operator classification input, distinct from the arithmetic ratio witnesses.

**Proof route.** Apply OP2-factor to the established essentially free ergodic action and its full nonnegative ratio set. The theorem identifies the Connes type from that measured ratio invariant; no arithmetic witness replaces this classification input.

**Direct inputs.** [Ergodicity makes the group-measure algebra a factor](#bc-ergodic-crossed-product-factor), [All positive numbers belong to the ratio set](#bc-full-positive-ratio-set).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-factor`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), §1 flow-of-weights/type criterion, p.2; Theorem 2.1, p.3.

<a id="bc-full-corner-type"></a>
#### A nonzero full corner preserves factor type

**Lemma** `TauCeti.BostConnes.full_corner_type_three_one` · `AnalyticNumberTheory:AN.9/bc-full-corner-type`.

The GNS algebra of the diagonal-expectation KMS state is p(L∞(A_f,μβ)⋊Q+×)p, where p=1Ẑ and p≠0. A nonzero corner of a type III1 factor is again type III1. The C*-full corner identification and the von Neumann compression identification are separate requirements.

**Proof route.** Use the expectation-measure construction to identify the completed state GNS algebra with the integral projection compression of the group-measure factor. Normalization makes that projection nonzero. Apply OP2-factor nonzero-corner type invariance.

**Direct inputs.** [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner), [KMS states and scaling measures](#bc-kms-scaling-correspondence), [Full positive ratio set determines type III1](#bc-ratio-factor-type).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-factor`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Corollary proof, p.3; Neshveyev 2009 §1, p.2.

<a id="bc-type-three-one"></a>
#### The critical KMS factors have type III₁

**Theorem** `TauCeti.BostConnes.bc_type_three_one` · `AnalyticNumberTheory:AN.9/bc-type-three-one`.

For 0<β≤1, the GNS von Neumann algebra of the unique completed Bost–Connes KMSβ state is a type III1 factor. The proof passes through the full positive ratio set, the ergodic group-measure factor and its nonzero compression by 1Ẑ.

**Proof route.** Use ergodicity for factoriality. Lift the positive ratio set through the compact quotient, as required by Neshveyev Theorem2.1. Use the nonsingular crossed-product/type classification and preserve type under a full corner.

**Direct inputs.** [A nonzero full corner preserves factor type](#bc-full-corner-type).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-factor`.

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/0907.1456v1), §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

<a id="bc-vector-ground-state"></a>
#### Ground state at an invertible lattice

**Construction** `TauCeti.BostConnes.KMSInfinity.vectorState` · `AnalyticNumberTheory:AN.9/bc-vector-ground-state`.

For each unit character u, the representation πu has a continuous extension to C_Q. Its vector functional at ε1 is a normalized positive state φ∞,u. It is the weak limit of Gibbsβ,u as β→∞ and hence a KMS-infinity state. Evaluation on μn eγ μm* is zero unless n=m=1, when it is exp(2πi uγ).

**Proof route.** Extend the bounded core representation to the completion. Its epsilon_1 vector functional is positive and normalized. Dominate the Gibbs tail by the zeta tail to prove pointwise convergence as beta grows, then evaluate the normalized monomial on epsilon_1.

**Direct inputs.** [Positive Hecke states extend boundedly](#bc-bounded-state-extension), [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation).

**API.**

- `TauCeti.BostConnes.KMSInfinity.vectorState_one` (characterisation): φ∞,u(1)=1.
- `TauCeti.BostConnes.KMSInfinity.vectorState_basis` (characterisation): The normalized basis has the stated zero/character values.
- `TauCeti.BostConnes.KMSInfinity.vectorState_isLimit` (compatibility): φ∞,u is KMS-infinity.

**Unit tests.**

- `TauCeti.BostConnes.KMSInfinity.vectorState_test_one` (computation): The vector state sends 1 to 1.
- `TauCeti.BostConnes.KMSInfinity.test_value_half` (computation): It sends e(1/2) to −1.
- `TauCeti.BostConnes.KMSInfinity.vectorState_test_shift` (computation): It sends μ2 to 0.

**Consumers.** [The Gibbs limit and its uniform tail bound](#bc-gibbs-tail-limit): Uses this construction with its stated normalization and domain..

**Sources.** [Jean-Benoît Bost and Alain Connes](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, extremal states and zero-temperature limit, pp.434–436; CM Theorem 3.32, pp.474–476; [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32, pp.474–476.

<a id="bc-gibbs-tail-limit"></a>
#### The Gibbs limit and its uniform tail bound

**Lemma** `TauCeti.BostConnes.bc_gibbs_tail_limit` · `AnalyticNumberTheory:AN.9/bc-gibbs-tail-limit`.

For β→∞ the Gibbs states converge weakly to the ε1 vector state, uniformly on each fixed norm-bounded observable set: the difference is at most2||a||(ζ(β)−1)/ζ(β), which tends to0. This supplies completed KMS∞ states.

**Proof route.** Separate k=1 from the Gibbs diagonal sum. Bound every matrix coefficient by||a||. Use ζ(β)−1→0 and the normalization difference.

**Direct inputs.** [KMS∞ states and upper-half-plane ground states](#bc-kms-infinity-and-ground), [The Gibbs states φ_{β,u}](#gibbs-states), [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#regular-representation), [Positive Hecke states extend boundedly](#bc-bounded-state-extension), [Ground state at an invertible lattice](#bc-vector-ground-state).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, (3.140)–(3.142), pp.475–476; weak Gibbs limit is the stated elementary consequence.

<a id="bc-arithmetic-values-and-symmetry"></a>
#### Arithmetic values and symmetry intertwining

**Theorem** `TauCeti.BostConnes.bc_arithmetic_values_and_symmetry` · `AnalyticNumberTheory:AN.9/bc-arithmetic-values-and-symmetry`.

For an extremal KMS∞ vector state, e(a) evaluates to the corresponding root of unity and every reduced normal-form monomial with(n,m)≠(1,1) evaluates to0. Its rational arithmetic values generate Qcycl. The induced cyclotomic character intertwines field automorphisms with unit symmetries on those values.

**Proof route.** Evaluate the normal form on ε1, retaining the coprime-index restriction. Use the rational generation theorem and the cyclotomic root image. Invoke the supplied cyclotomic/class-field character and verify the equality on the basis.

**Direct inputs.** [The Gibbs limit and its uniform tail bound](#bc-gibbs-tail-limit), [The trigonometric arithmetic algebra equals the BC rational form](#bc-arithmetic-algebra-generation), [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#symmetry-action), [Cyclotomic values and Galois action on extremal KMS∞ states](#galois-action-on-ground-states), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, [Compatible finite cyclotomic restrictions](#bc-cyclotomic-restrictions).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32 (3)–(4), (3.136)–(3.137), p.475.

<a id="bc-kms-limit-ground"></a>
#### KMS-infinity limits are ground states

**Lemma** `TauCeti.BostConnes.KMSInfinity.limit_isGround` · `AnalyticNumberTheory:AN.9/bc-kms-limit-ground`.

For a unital C*-system with point-norm continuous dynamics, each KMS∞ state is a ground state. On every finite upper strip the KMSβ correlation functions, for sufficiently large β, are bounded by ‖a‖‖b‖; use normal families and boundary convergence.

**Proof route.** Take beta tending to infinity along the weak state limit. On each fixed upper strip the correlation functions have a common norm bound once beta exceeds its height. A diagonal normal-family limit is analytic on the upper half-plane and has the required boundary values.

**Direct inputs.** [KMS∞ states and upper-half-plane ground states](#bc-kms-infinity-and-ground), [Uniform correlation bound on the closed strip](#bc-strip-core-bound).

**Current upstream imports.** `tauceti:TauCetiRoadmap/OperatorTheory`.

**General supplier contracts.** `OP2-kms`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Definition 3.7, p.447.

<a id="bc-trivial-dynamics-test"></a>
#### Ground and KMS-infinity differ for trivial dynamics

**Lemma** `TauCeti.CStarDynamics.matrix_ground_not_kmsInfinity` · `AnalyticNumberTheory:AN.9/bc-trivial-dynamics-test`.

For M₂(C) with σ_t=id, every state is a ground state, while every KMSβ state is tracial and every KMS∞ state is tracial. The vector state a↦a₀₀ is ground and is not KMS∞: on matrix units it gives φ(E₀₁E₁₀)=1 and φ(E₁₀E₀₁)=0.

**Proof route.** With trivial dynamics every correlation function is constant and bounded on the upper half-plane. The KMS boundary condition reduces to the trace identity and traces form a weakly closed set. Evaluate the two matrix-unit products in the vector state to exclude that identity.

**Direct inputs.** [KMS∞ states and upper-half-plane ground states](#bc-kms-infinity-and-ground).

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Definition 3.7 discussion, p.447.

<a id="bc-local-density-normalization"></a>
#### Normalize the local scaling density

**Lemma** `TauCeti.BostConnes.ScalingMeasure.local_shell` · `AnalyticNumberTheory:AN.9/bc-local-density-normalization`.

For β>0 and every integer k, μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ). Summing k≥0 gives μβ,p(Zp)=1; the singleton 0 has mass 0. Multiplication by p^j scales measurable masses by p^(−jβ).

**Proof route.** Integrate the radial density on each additive-Haar shell. Its Haar mass is (1-p^(-1))p^(-k), so the normalization constant yields (1-p^(-beta))p^(-k beta). Sum the nonnegative shells and apply a change of variables for dilation by p^j.

**Direct inputs.** [The finite-adele scaling measure](#bc-adelic-scaling-measure).

**Sources.** [Sergey Neshveyev](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 product-density formula, p.2.

<a id="bc-eisenstein-isometry-generation"></a>
#### Arithmetic generation after adjoining isometries

**Lemma** `TauCeti.BostConnes.bc_eisenstein_isometry_generation` · `AnalyticNumberTheory:AN.9/bc-eisenstein-isometry-generation`.

The Q-algebra generated by all first functions and μn,μn* equals the normalized arithmetic form A1,Q spanned by μn e(a) μm*. The comparison to Q-valued Hecke functions is through σ−i/2 and is not a star-algebra identification.

**Proof route.** Recover every torsion generator from the first functions by the prime-level induction. The eight relations reduce every word with isometries and adjoints to the normalized arithmetic monomial span. The imaginary-time comparison records which rational form this is.

**Direct inputs.** [The trigonometric arithmetic algebra equals the BC rational form](#bc-arithmetic-algebra-generation), [The presentation of the rational Bost–Connes algebra](#rational-presentation), [The two rational forms of the Bost–Connes algebra](#rational-forms-comparison), `mathlib:RingHom.toAlgebra'`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.30, pp.467–470; rational-form convention pp.460–462.

<a id="bc-eisenstein-complexification"></a>
#### Complexification of the arithmetic form

**Lemma** `TauCeti.BostConnes.bc_eisenstein_complexification` · `AnalyticNumberTheory:AN.9/bc-eisenstein-complexification`.

The scalar-extension map C⊗Q A1,Q→H_C is an algebra isomorphism sending 1⊗μn e(a) μm* to the normalized complex normal form. Its image is dense in the completed BC algebra. Rational Hecke and arithmetic forms remain distinct subalgebras until the specified imaginary-time comparison.

**Proof route.** Use linear independence and spanning of normalized complex normal forms to prove bijectivity of scalar extension. Use density of the Hecke core in its operator-norm completion.

**Direct inputs.** [Arithmetic generation after adjoining isometries](#bc-eisenstein-isometry-generation), [The corrected double-coset basis is independent](#bc-normal-form-independent), [Normal-form multiplication and common-divisor reduction](#bc-normal-form-product), [Dense isometric core embedding](#bc-completion-dense), `mathlib:RingHom.toAlgebra'`.

**Sources.** [Alain Connes and Matilde Marcolli](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.30 and surrounding discussion, pp.460–470.

## Supplier-stage contracts

These requests state the exact supplier result consumed by the direct dependency graph. Their presence prevents closed coverage. No broader theorem is inferred from a stage title.

### ArithmeticStatistics:ST.2

In the ANT/ST tier-14 bundle, supply the quadratic large sieve for primitive real characters and the fourth-moment contract specified by quadratic-fourth-moment (Heath-Brown Theorem 2, p.238; proof pp.267–269). SV.2 moves down to ST.2 under the upstream order. PNT is not this supplier.

**Consumers.** [Quadratic fourth moment](#quadratic-fourth-moment).

### ArithmeticStatistics:ST.0

Provide bounded-discriminant finiteness and inverse-automorphism-weighted coefficient sums for all locally free cubic O_F-algebras, retaining reducible and nonmaximal rings.

**Consumers.** [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series).

### ArithmeticStatistics:ST.1

Provide the binary-cubic twisted action, discriminant, local nondegenerate orbit types, trace-divisible dual lattice and adelic parametrization including nonprincipal locally free O_F-modules. Existing Delone–Faddeev nodes are used only in their proved base-ring scope.

**Consumers.** [Binary-cubic local zeta integrals](#pvs-local-zeta), [From arithmetic cubic orbits to analytic coefficients](#cubic-orbit-to-coefficient), [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series), [Local density and coefficient conventions agree](#local-density-coefficient-comparison), [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta), [Orders in a fixed étale cubic algebra](#cubic-orders-generating-series), [Binary cubic orbital Jacobian](#local-orbit-jacobian), [Five local orbital Euler factors](#local-orbital-euler-factor), [Adelic orbital unfolding](#cubic-adelic-unfolding), [Poisson decomposition of the global integral](#cubic-poisson-decomposition), [Unfold the triple-root orbit](#cubic-triple-root-unfolding), [Unfold the double-root orbit](#cubic-double-root-unfolding), [Split local factor](#local-split-orbit-factor), [Unramified quadratic local factor](#local-unramified-quadratic-factor), [Ramified quadratic local factor](#local-ramified-quadratic-factor), [Unramified cubic local factor](#local-unramified-cubic-factor), [Ramified cubic local factor](#local-ramified-cubic-factor), [All class-group components in unfolding](#cubic-class-group-components).

### AutomorphicLFunctionsAndLocalFactors:AL.0

Local/adelic Schwartz–Bruhat carriers and additive Poisson in F^4, obtained from the existing one-dimensional Tate Fourier transform by finite product/Fubini with the binary-cubic alternating pairing. Singular-orbit distributions and their residues belong to AN.8 and are explicitly planned there; they are not asserted to follow from Tate Poisson alone. Supply the Schwartz lattice bound in Wright Lemma 1.1, pp.510–511: for fixed finite-adelic Φ0, dimension m and α>1 there is a continuous Schwartz seminorm N such that the sum over rational x with x1≠0 after positive coordinate dilations λi is bounded by N(Φinfty) product_i max(1,λi^(−1)) max(1,λ1)^(−α/[F:Q]); Lemma 1.2 drops the last decay factor for the unrestricted sum.

**Consumers.** [Binary-cubic local zeta integrals](#pvs-local-zeta), [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta), [Self-dual versus integral-normalized measures](#local-measure-normalization), [Adelic binary cubic convergence](#cubic-adelic-convergence), [Compact averaging and Fourier](#cubic-compact-average-laws), [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions), [Poisson decomposition of the global integral](#cubic-poisson-decomposition), [Fourier transform of the integral lattice](#local-finite-fourier-dual).

### AdelicAlgebraicGroups:AA.2

Supply GL2 quotient Haar measures, local GL2 factors and inversion transport between quotient sides. Finite-adèle carriers come from GlobalNumberFields Layer 4 and integral/restricted-product topology from RestrictedProducts. Additive Haar normalization belongs to AA.0; RestrictedProducts does not supply measures. Also supply the GL2 rank-one compact-times-Siegel-set integration majorant of Wright Lemmas 3.1–3.2, p.515: quotient |F| integral ≤γ integral_Theta+ F0(theta)t(theta)^(−2)dtheta when |F(c theta)|≤F0(theta) for the fixed compact C, and its determinant-one specialization.

**Consumers.** [Binary-cubic local zeta integrals](#pvs-local-zeta), [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta), [Self-dual versus integral-normalized measures](#local-measure-normalization), [Adelic binary cubic convergence](#cubic-adelic-convergence), [Compact averaging and Fourier](#cubic-compact-average-laws), [Entire truncated cubic integral](#cubic-truncated-entire), [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue).

### ArithmeticStatistics:ST.3

Supply LOWW Lemma3.5 cubic-extension count over F, including h2(F) and uniform discriminant powers, for the AN.8 reducible/field coefficient estimate.

**Consumers.** [The weighted cubic-coefficient bound](#cubic-reducible-and-field-coefficient-bound).

### AnalyticNumberTheory:AN.7

Supply the normalized classical Barnes G-function, its logarithmic derivative and full large-real-s expansion as used in JSS(2.8)–(2.9). This is an extension request; the current AN.7 target pass covers Hurwitz/Lerch and does not yet provide Barnes G.

**Consumers.** [Identity contribution and Barnes normalization](#identity-barnes-transform), [Branch-independent identity factor](#selberg-identity-germ), [Identity factor at spectral points](#selberg-identity-nonvanishing), [Archimedean Fourier comparison](#cubic-archimedean-fourier-comparison).

### ArithmeticLocallySymmetricSpaces:ALS.0

Supply the connected compact oriented hyperbolic surface Γ\H for a torsion-free cocompact Γ, curvature−1 and area4π(g−1), and the primitive conjugacy-class/length convention used in the scalar Selberg product.

**Consumers.** [Positive-spectrum zeta and heat series](#spectral-zeta-series), [The scalar Selberg primitive-geodesic product](#selberg-primitive-product).

### AutomorphicSpectralTheory:AS.4

Supply the scalar positive self-adjoint Laplacian, complete discrete eigenbasis, finite multiplicities, simple zero mode, Weyl counting and uniform heat-kernel asymptotics on the selected compact surface. AS.4 supplies discrete automorphic Hilbert sums; the scalar geometric Laplacian, simple zero mode, Weyl law and uniform heat asymptotics are extension requests.

**Consumers.** [Positive-spectrum zeta and heat series](#spectral-zeta-series), [The compact discrete-spectrum input](#compact-spectrum-and-weyl), [Subtracting small-time heat coefficients](#heat-small-time-subtraction).

### AutomorphicSpectralTheory:AS.6

Supply the compact scalar heat trace formula, the Gaussian test-function extension and geodesic growth, with exactly the primitive-class convention and the identity/hyperbolic constants displayed here. AS.6 is stated for compactly supported smooth tests; Gaussian tests and their orbital-integral constants require an explicit limiting/decay adapter.

**Consumers.** [The scalar Selberg primitive-geodesic product](#selberg-primitive-product), [Logarithmic derivative of the primitive product](#selberg-log-product), [The compact scalar heat trace input](#scalar-heat-trace-formula), [Compact geodesic-series majorant](#selberg-geodesic-majorant).

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Import the finite cyclotomic Galois identifications and their compatible transition maps from GlobalNumberFields layer 10. Construct the inverse-limit identification Gal(Qcycl/Q)=Ẑ× by compatible finite restrictions. That layer explicitly supplies arithmetic Frobenius and no global Artin map; do not assume a class-field existence or reciprocity theorem from it.

**Consumers.** [Arithmetic values and symmetry intertwining](#bc-arithmetic-values-and-symmetry), [Compatible finite cyclotomic restrictions](#bc-cyclotomic-restrictions).

### AutomorphicSpectralTheory:AS.2

Extend the GL2 spherical rank-one specialization: constant term t^(z/2)+t^((2−z)/2)Z_F(z−1)/Z_F(z), simple residue rho0 at z=2, and nonconstant Fourier bound C_l t^(2−Rez−2l)(1+|z|)^l/(Rez−1) for l≥2 on a Siegel set. Wright Lemmas 6.1, 6.3, pp.524–526. General Eisenstein continuation is imported by its existing node; it does not alone give these normalized quantitative bounds.

**Consumers.** [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue).

### AdelicAlgebraicGroups:AA.0

Provide normalized additive Haar on Qp with mass(Zp)=1 and restricted-product compatibility for finite adeles. AN.9 itself multiplies by ((1−p^(−β))/(1−p^(−1)))|x|p^(β−1), uses probability product measures on integral adeles, and extends by rational dilation. No generic restricted product is replanned.

**Consumers.** [The finite-adele scaling measure](#bc-adelic-scaling-measure), [Self-dual versus integral-normalized measures](#local-measure-normalization).

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles

Import the current finite-adèle arithmetic contract, with the actual restricted-product carrier and the integral compact-open subgroup; the atlas layer id is #layer-4-finite-adeles. The current reader uses an expanded heading but the stable atlas id is retained. Normalized additive Haar is the AA.0 request, not this topology contract.

**Consumers.** [The finite-adele scaling measure](#bc-adelic-scaling-measure), [Minimal finite-adele dilation](#bc-adelic-dilation).

### AnalyticNumberTheory:AN.5

Extension contract: the uniform complex Gamma Stirling ratio estimate on compact real strips, with bounded-height removable points handled separately, and the precise order-one vertical estimate needed by cubic-entire-order-bound. The current stage does not yet certify these normalized quantitative outputs.

**Consumers.** [Gamma reflection block growth](#double-gamma-quotient-growth), [Order-one bound for cubic clearance](#cubic-entire-order-bound).

## Operator theory, Part II contracts

This extension builds on the current OperatorTheory roadmap and owns the general results below. The AN.9 declarations specialize them to BC. The current upstream roadmap remains the source of operator ideals, projections and spectral theory.

### OP2-universal

For a unital complex star algebra presented by unitary torsion generators and isometries, positive normalized functionals give a Hilbert GNS representation in which each generator is bounded by one. A finite sum of generator words has universal norm at most the sum of coefficient moduli. A faithful bounded star representation makes that seminorm a norm; the completion represents bounded unital star representations. Existing PositiveLinearMap.GNS starts with a C*-algebra and is imported after this algebraic step.

**Consumers.** [Algebraic GNS generator estimates](#bc-gns-generator-bounds), [Universal C*-norm of the BC core](#bc-universal-norm), [Positive Hecke states extend boundedly](#bc-bounded-state-extension).

### OP2-dilation-corner

For cancellative Ore semigroup injective corner endomorphisms, construct the minimal automorphic dilation and the full projection corner of its group crossed product, with universal covariance maps and inverse. For countable amenable groups full and reduced crossed products agree. Import Laca Theorems 2.1.1,2.2.1 and specialize the already-existing Af/Ẑ carriers; never reconstruct their topology.

**Consumers.** [Division endomorphisms on the existing profinite ring](#bc-adelic-endomorphism), [Minimal finite-adele dilation](#bc-adelic-dilation), [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner), [Universal and reduced BC norms agree](#bc-universal-reduced).

### OP2-kms

For point-norm continuous dynamics on a unital C*-algebra, expose the bounded closed-strip KMS predicate, upper-half-plane ground predicate and weak limit KMS-infinity predicate, their weak state topology, and the implication KMS-infinity⇒ground. A dense entire invariant star subalgebra characterizes KMS via the +iβ core identity, with correlation bound ||a||||b|| and norm-approximation extension. The trivial M2 vector state distinguishes ground from KMS-infinity.

**Consumers.** [Completed KMS states and the bounded strip condition](#bc-completed-kms), [KMS∞ states and upper-half-plane ground states](#bc-kms-infinity-and-ground), [The analytic core and the strip KMS condition](#bc-analytic-core-strip-equivalence), [Uniform correlation bound on the closed strip](#bc-strip-core-bound), [KMS-infinity limits are ground states](#bc-kms-limit-ground).

### OP2-expectation-measure

For a reduced crossed product C0(X)⋊G, the identity-coefficient map is a faithful positive contractive conditional expectation; compression to a compact-open full corner is unital. With character time evolution and β-scaling Radon measures, integration of this expectation is KMS and restriction to the diagonal recovers the measure uniquely. Import the current Tau Ceti positive-functional character-space measure theorem and Mathlib/RMK uniqueness.

**Consumers.** [Diagonal expectation in the full corner](#bc-corner-expectation), [Scaling measure produces a KMS state](#bc-measure-to-kms), [KMS restriction reconstructs a scaling measure](#bc-kms-to-measure), [KMS states and scaling measures](#bc-kms-scaling-correspondence).

### OP2-ratio

For countable nonsingular actions on standard nonzero sigma-finite spaces, define the target-Radon–Nikodym ratio set and asymptotic product ratio set; prove asymptotic inclusion, measured orbit invariance and compact-unit quotient lifting under the stated recurrence hypotheses. AN.9 proves the arithmetic witnesses; this extension owns the general interface.

**Consumers.** [Ratio set of a nonsingular action](#bc-ratio-set), [Independent tail swaps give essential ratios](#bc-asymptotic-ratio-inclusion), [Ratio witnesses lift through unit cylinders](#bc-ratio-unit-lifting).

### OP2-factor

For an essentially free ergodic countable nonsingular action, construct L∞(X,μ)⋊G and identify its center with invariant functions. Prove RatioSet=[0,∞)⇒type III1 and preservation of III1 by nonzero corners; identify the diagonal-expectation state GNS algebra with the corresponding von Neumann compression.

**Consumers.** [Ergodicity makes the group-measure algebra a factor](#bc-ergodic-crossed-product-factor), [Full positive ratio set determines type III1](#bc-ratio-factor-type), [A nonzero full corner preserves factor type](#bc-full-corner-type), [The critical KMS factors have type III₁](#bc-type-three-one).

## Obligations preventing closed coverage

### 1. Quadratic primitive-character and uniform-strip proof adapters

The conductor/parity/deleted-Euler table is now explicit. Formalize the fundamental-discriminant character and its Gauss-sum sign +1 against the pinned primitive functional equation, including conductor one. In the strip first moment prove compact-uniform constants by the smoothed-sum argument; pointwise Oσ constants do not imply this. ST.2 supplies the real-character fourth moment and large sieve; no PNT shortcut is used.

**Affected declarations.** [Quadratic conductor and root number](#quadratic-primitive-adapter), [Pole-aware strip first moment](#quadratic-pole-aware-strip-moment), [Quadratic fourth moment](#quadratic-fourth-moment).

### 2. Bochner theorem: primary proof acquisition

DGH Proposition 4.6, p.37 states the connected-tube extension and cites Hörmander; it does not prove it. Its exact analytic carrier and uniqueness on the convex tube are prototyped, and the bounded-extension proof by extending 1/(f−a) is decomposed. Acquire a permitted complete proof of Bochner before claiming source decomposition or library closure. No assertion of arbitrary punctured-domain extension is made.

**Affected declarations.** [Bochner tube extension](#tube-bochner-extension), [Filling the remaining real twelve-gon](#tube-hull-extension).

### 3. Cubic rings on nonprincipal modules

ST.1 PID/local-ring parametrizations are imported. Extend them to all locally free cubic O_F-modules, every ideal-class component and the trace-divisible dual lattice. ST.0 must prove finite inverse-automorphism-weighted coefficient sums, and ST.3 supplies the uniform field count. The explicit S-integral class-group component node prevents silently restricting to free modules.

**Affected declarations.** [From arithmetic cubic orbits to analytic coefficients](#cubic-orbit-to-coefficient), [All class-group components in unfolding](#cubic-class-group-components), [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series), [The weighted cubic-coefficient bound](#cubic-reducible-and-field-coefficient-bound).

### 4. Local distribution functional equations: external original proofs

The complete DW five-factor valuation proof and complex-place Fourier proof have been read. DW Theorem 3.2, p.47 invokes Igusa for nonarchimedean distribution continuation/functional equations; Theorem 4.1, p.48 invokes Shintani for the real matrix. Those two original proofs remain to acquire. Residue characteristics 2 and 3 are retained through characteristic-zero local fields, the different, discriminant and |3| normalization; no invented separate tame formula is used.

**Affected declarations.** [Binary-cubic local zeta integrals](#pvs-local-zeta), [Five local orbital Euler factors](#local-orbital-euler-factor), [Archimedean Fourier comparison](#cubic-archimedean-fourier-comparison), [The cubic global matrix functional equation](#cubic-global-functional-equation).

### 5. GL2 measures, Siegel majorants and normalized Eisenstein input

AA.2 must expose quotient-side inversion and the precise majorants of Wright Lemmas 3.1–3.2, p.515, whose general reduction-theory input is cited to Weil there. AL.0 supplies the lattice bound of Wright Lemmas 1.1–1.2, pp.510–511 and finite-product Fourier/Poisson. AS.2 must supply Wright Lemmas 6.1,6.3, pp.524–526 with the displayed residue and nonconstant-term bound. The full singular-orbit argument is now planned; its external reduction/analytic suppliers remain requests.

**Affected declarations.** [Adelic binary cubic convergence](#cubic-adelic-convergence), [Adelic orbital unfolding](#cubic-adelic-unfolding), [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue), [Adelic cubic continuation and equation](#cubic-adelic-meromorphic-equation).

### 6. Cubic entire order-one quantitative estimate

DW Theorem 6.2(ii), p.71 states the order-one clearance; its discussion does not furnish the complete quantitative entire-plane growth estimate. The node cubic-entire-order-bound states the ε formulation explicitly, separate from pole removal. Supply that original quantitative argument and the AN.5 uniform Gamma/Stirling contract before certifying this growth leaf.

**Affected declarations.** [Order-one bound for cubic clearance](#cubic-entire-order-bound), [The two cubic poles and their residues](#cubic-residues-and-entire-clearance), [Pole-aware cubic convexity bound](#cubic-pole-cleared-convexity).

### 7. Normalized Haar and canonical adelic component adapters

The finite-adèle ring is an existing Mathlib carrier, its compact integral subgroup is imported from current Tau Ceti, and probability products already exist in Mathlib. AA.0 must connect normalized additive Haar of Qp to the actual local components and restricted-product exhaustion. Then construct the canonical local density/product/dilation measure on that carrier. The native local density and global Radon scaling predicates are already concrete; this gap is their canonical compatibility, not a missing measure type.

**Affected declarations.** [The finite-adele scaling measure](#bc-adelic-scaling-measure), [Normalize the local scaling density](#bc-local-density-normalization), [Self-dual versus integral-normalized measures](#local-measure-normalization).

### 8. OperatorTheory Part II: crossed products and bounded-state completion

Import existing operator ideals, closed operator algebras and Mathlib C*-GNS; do not replan them. The exact extension requests below cover algebraic bounded-generator GNS, universal C*-completion, semigroup minimal dilation, full-corner covariance, amenability/full=reduced, dense analytic-core KMS extension and expectation/state-measure reconstruction. Laca proves the dilation/corner comparison read here; the general amenability and analytic-strip framework proofs remain unsupplied.

**Affected declarations.** [Algebraic GNS generator estimates](#bc-gns-generator-bounds), [Universal C*-norm of the BC core](#bc-universal-norm), [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner), [Universal and reduced BC norms agree](#bc-universal-reduced), [Positive Hecke states extend boundedly](#bc-bounded-state-extension), [The analytic core and the strip KMS condition](#bc-analytic-core-strip-equivalence), [Diagonal expectation in the full corner](#bc-corner-expectation), [KMS states and scaling measures](#bc-kms-scaling-correspondence).

### 9. OperatorTheory Part II: nonsingular factor classification

The target-evaluated ratio predicate and the BC prime/cylinder/unit-lifting witnesses are explicit. Supply the standard sigma-finite measured equivalence-relation/asymptotic-ratio interface, group-measure-space von Neumann algebra, ergodic center/factor theorem, ratio-set-to-III1 theorem, and nonzero-corner/GNS compression invariance. Neshveyev states/uses this general theory; its primary proofs are not certified here.

**Affected declarations.** [Independent tail swaps give essential ratios](#bc-asymptotic-ratio-inclusion), [Ratio witnesses lift through unit cylinders](#bc-ratio-unit-lifting), [Ergodicity makes the group-measure algebra a factor](#bc-ergodic-crossed-product-factor), [Full positive ratio set determines type III1](#bc-ratio-factor-type), [A nonzero full corner preserves factor type](#bc-full-corner-type), [The critical KMS factors have type III₁](#bc-type-three-one).

### 10. Compact scalar geometric spectral and Gaussian trace adapters

ALS.0 supplies the compact torsion-free oriented surface. AS.4 must identify its actual scalar Laplacian with the concrete monotone heat/spectrum contract (simple zero, Weyl counts, uniform full expansion). AS.6 must extend compactly supported smooth trace tests to the Gaussian and supply geodesic counting and the same primitive orientation convention. The full JSS §5 transform proofs have been read; the generic Mellin and shifted-product signatures do not by themselves establish these geometric suppliers.

**Affected declarations.** [The compact discrete-spectrum input](#compact-spectrum-and-weyl), [The compact scalar heat trace input](#scalar-heat-trace-formula), [Compact geodesic-series majorant](#selberg-geodesic-majorant), [The compact Selberg determinant comparison](#selberg-determinant-comparison).

### 11. Barnes G original normalization and asymptotic proof

AN.7 must extend beyond its Hurwitz/Lerch pass to the normalized Barnes G of JSS §2.5, (2.8)–(2.9), p.9: G(1)=1, functional equation, zeros, logarithmic derivative and the uniform asymptotic used to fix C. JSS cites Adamchik; that primary proof remains unread. The single-valued integer-power identity factor and zero/pole divisor have explicit contracts.

**Affected declarations.** [Identity contribution and Barnes normalization](#identity-barnes-transform), [Branch-independent identity factor](#selberg-identity-germ), [Identity factor at spectral points](#selberg-identity-nonvanishing).

### 12. Canonical native interfaces and weak state topology

One definition API is intentionally omitted: CubicAdelic.unfolding requires the actual GL2 adelic quotient measure, Schwartz space, rational orbits and weighted orbital integrals from AA.2/AL.0/ST.1. Other native leaf omissions are itemized individually in nativeOmissions, with exact missing functions or topology. In particular ordinary ξ,ξhat,ρF and class-group/signature indices cannot be replaced by unconstrained function fields; the high-beta homeomorphism uses pointwise weak state topology, not the operator-norm topology of continuous functionals.

**Affected declarations.** [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta), [The cubic global matrix functional equation](#cubic-global-functional-equation), [Cubic residue at one](#cubic-residue-one), [Cubic secondary residue](#cubic-residue-five-sixths), [Probability measures parameterize high-beta KMS states](#bc-high-beta-affine-homeomorphism).

### 13. Current upstream identifiers absent from the historical declaration index

The separately audited upstreamImports are existing work and are imported, never replanned. The checker only knows its historical atlas/library index, so these edges are also recorded on each affected node as upstreamImports. A package must resolve them to current modules or current upstream roadmap layer ids; this is an integration obligation rather than an assertion that the mathematics is missing.

**Affected declarations.** [Completed KMS states and the bounded strip condition](#bc-completed-kms), [KMS∞ states and upper-half-plane ground states](#bc-kms-infinity-and-ground), [Positive Hecke states extend boundedly](#bc-bounded-state-extension), [The analytic core and the strip KMS condition](#bc-analytic-core-strip-equivalence), [The finite-adele scaling measure](#bc-adelic-scaling-measure), [KMS states and scaling measures](#bc-kms-scaling-correspondence), [High-β extremal states and unique barycentres](#bc-high-beta-barycentres), [The critical KMS factors have type III₁](#bc-type-three-one), [Algebraic GNS generator estimates](#bc-gns-generator-bounds), [Universal C*-norm of the BC core](#bc-universal-norm), [Division endomorphisms on the existing profinite ring](#bc-adelic-endomorphism), [Minimal finite-adele dilation](#bc-adelic-dilation), [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner), [Universal and reduced BC norms agree](#bc-universal-reduced), [Uniform correlation bound on the closed strip](#bc-strip-core-bound), [KMS-infinity limits are ground states](#bc-kms-limit-ground), [Diagonal expectation in the full corner](#bc-corner-expectation), [Scaling measure produces a KMS state](#bc-measure-to-kms), [KMS restriction reconstructs a scaling measure](#bc-kms-to-measure), [Profinite units act on rational torsion](#bc-unit-qmodz-adapter), [Unit average of a scaling measure](#bc-unit-average), [Ratio set of a nonsingular action](#bc-ratio-set), [Independent tail swaps give essential ratios](#bc-asymptotic-ratio-inclusion), [Ratio witnesses lift through unit cylinders](#bc-ratio-unit-lifting), [Ergodicity makes the group-measure algebra a factor](#bc-ergodic-crossed-product-factor), [Full positive ratio set determines type III1](#bc-ratio-factor-type), [A nonzero full corner preserves factor type](#bc-full-corner-type).

## Native prototype scope

The suggested file uses genuine library carriers and actual mathematical data. Every definition and construction has a native form, every test has an example, and every API item has a signature except the canonical adelic unfolding specified below. Generic data forms require their canonical arithmetic or geometric comparison. The catalog remains definitive for the complete mathematical claims.

- [Signature-refined cubic Shintani zeta functions](#cubic-shintani-series): CubicShintani has actual disc, automorphism-order and signature functions; canonical number-field order and all class-group inputs are separate adapters.
- [Binary-cubic local zeta integrals](#pvs-local-zeta): LocalIntegral integrates actual supplied measure, norm and discriminant data. DW uses discriminant exponent s-1; the native generic integral uses s, so orbital comparison shifts the argument by one.
- [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta): CubicAdelic integrates actual supplied quotient measure, determinant norm and theta. Its scaling test uses a Dirac quotient point with determinant norm two and theta three. Canonical unfolding is omitted precisely.
- [The finite-adele scaling measure](#bc-adelic-scaling-measure): ScalingMeasure uses the existing FiniteAdeleRing Z Q carrier; its local density takes a genuine normalized Haar measure as parameter. Canonical component/product compatibility is AA.0 input.
- [Gibbs barycentre of a probability measure](#bc-completed-barycentre): The native compact Hausdorff Borel parameter W is equipped with an actual equivalence to AddAut(Q/Z) and continuous torsion evaluations. It is not yet the imported zHat-unit carrier.
- [The Bost–Connes phase transition](#kms-classification): The native theorem proves the low-beta unique-state clause and high-beta unique probability-barycentre clause. Extreme boundary, Bauer property and its weak homeomorphism are separate omitted canonical-topology clauses.
- [Positive-spectrum zeta and heat series](#spectral-zeta-series): The native scalar spectral sequence is monotone and has simple zero, positive remaining modes, Weyl counts and a full heat expansion. Construction from a particular geometric Laplacian is the AS.4 adapter.
- [The regularized scalar Laplace determinant](#spectral-regularized-determinant): RegularizedDet applies exp(-deriv f 0) to an actual function; the constructor alone does not prove regularity. SpectralContinuation existence supplies it.

The following omitted names and stronger clauses each have a specific missing adapter or supplier object. The suggested file records the same list.

- [Isometries and phase unitaries on l²(N+)](#bc-regular-shift-bounds) — `TauCeti.BostConnes.regular_shift_bounds`: regularRep and its isometry examples are native. Separate coordinate operators S_n, S_n-adjoint and D_(u,gamma), with the exact lp coordinate/adjoint formula, have not been named as bounded operators.
- [Algebraic GNS generator estimates](#bc-gns-generator-bounds) — `TauCeti.BostConnes.algebraic_gns_generator_bounds`: The algebraic positive-functional quotient and its Hilbert completion before a C*-norm is available require OP2-universal. Mathlib PositiveLinearMap.gnsStarAlgHom assumes a C*-algebra and cannot stand for this precompletion bound.
- [Finite convolution row and column counts](#bc-convolution-row-column) — `TauCeti.BostConnes.Completed.kernel_degree`: The native leftRegular is an actual bounded operator on lp of right cosets. The missing leaf is the representative-independent indicator kernel K_X(gH,hH) and exact finite row/column cardinalities L(X),R(X); it requires the canonical quotient kernel construction, rather than the Gibbs l2(N+) carrier.
- [Universal C*-norm of the BC core](#bc-universal-norm) — `TauCeti.BostConnes.universal_norm_finite`: Missing is a quantified carrier of all bounded unital star representations of the algebraic Hecke core and its universal norm/completion. Completed.algebra is instead the concrete left-regular operator closure; equality to the universal completion uses OP2-universal and OP2-dilation-corner.
- [Division endomorphisms on the existing profinite ring](#bc-adelic-endomorphism) — `TauCeti.BostConnes.adele_division_endomorphism`: Missing is the compact-open C(zHat) corner star-endomorphism carrier and its canonical multiplication-by-n/extension-by-zero map on the imported ProfiniteArithmetic zHat.
- [Minimal finite-adele dilation](#bc-adelic-dilation) — `TauCeti.BostConnes.adele_minimal_dilation`: Missing is the actual C0(FiniteAdeles) automorphic action and its equivariant embedding of C(zHat); the minimal-dilation exhaustion must be stated in this function-algebra topology.
- [BC algebra as a full crossed-product corner](#bc-crossed-product-full-corner) — `TauCeti.BostConnes.crossed_product_full_corner`: No canonical crossed-product C*-algebra or full-projection corner exists at the pin. OP2-dilation-corner must expose the universal covariant maps and their inverse before this particular BC comparison can be given a native signature.
- [Universal and reduced BC norms agree](#bc-universal-reduced) — `TauCeti.BostConnes.universal_eq_reduced`: The full and reduced crossed-product norms and the canonical regular quotient map are the missing OP2-dilation-corner objects. The existing Completed closure alone does not express their amenability comparison.
- [Gibbs strip correlations](#bc-gibbs-strip-series) — `TauCeti.BostConnes.gibbs_strip_normal_convergence`: Completed Gibbs and its algebraic KMS identity are native. The omitted stronger leaf names the actual entire correlation series, its compact-strip uniform convergence and its two boundary evaluations for arbitrary completed arguments.
- [Extending real dynamics to the C*-completion](#bc-real-dynamics-extension) — `TauCeti.BostConnes.bc_real_dynamics_extension`: Completed.dynamics, dynamics_embed, dynamics_star and continuous_dynamics are native. The separate existence-and-uniqueness leaf for extending the core real star-automorphism group, including its group law, has no named signature.
- [Finite-prime orbit projection](#bc-finite-prime-projection) — `TauCeti.BostConnes.bc_finite_prime_projection`: Missing is the explicit rational-subsemigroup orbit conditional projection in L2(FiniteAdeles,mu_beta), its product shell formula and dependence on a finite set of primes; the Gibbs representation on l2(N+) is a different space.
- [Local characters form a dense family](#bc-local-character-density) — `TauCeti.BostConnes.bc_local_character_density`: Missing is the canonical local character span on the finite-prime invariant L2 space and the cylinder approximation map to the full adelic space. The general Hilbert density theorem is imported; the concrete character embedding is absent.
- [Nontrivial characters are annihilated in the critical interval](#bc-nontrivial-character-projection) — `TauCeti.BostConnes.bc_nontrivial_character_projection`: Missing is the finite-prime L2 conditional projection applied to a nontrivial finite-conductor unit character, with its explicit product and AN.2 progression-partial-sum estimate.
- [Decreasing orthogonal projections](#bc-decreasing-projections) — `TauCeti.BostConnes.decreasing_projection_strong`: The imported OperatorTheory Hilbert projection theorem supplies the general limit. Missing here are the canonical BC decreasing projection sequence and the identification of its limiting range with rational-dilation invariant functions.
- [Ergodicity of positive rationals on finite adeles](#bc-critical-ergodicity) — `TauCeti.BostConnes.bc_critical_ergodicity`: ScalingMeasure and canonical_scaling_extreme are native. A native ergodicity signature requires the canonical nonsingular Q-positive action on the L2/exhaustion carrier and the preceding projection-to-invariant-range identification.
- [Unit average of a scaling measure](#bc-unit-average) — `TauCeti.BostConnes.unit_average_canonical`: Missing is the imported compact unit group acting continuously on actual finite adeles and the normalized Haar pushforward average of an arbitrary scaling measure. The native parameter W in barycentres supplies torsion characters only.
- [Extreme unit average is constant](#bc-extreme-average-rigidity) — `TauCeti.BostConnes.extreme_unit_average_rigid`: Missing is that concrete unit averaging operator and its continuous compact-cylinder separating test family. canonical_scaling_extreme is native, but does not state this additional averaging-rigidity argument.
- [Diagonal expectation in the full corner](#bc-corner-expectation) — `TauCeti.BostConnes.corner_expectation`: OP2-expectation-measure must expose the actual reduced crossed-product identity-coefficient conditional expectation and its compact-open corner restriction; neither is represented by an arbitrary linear-functional field.
- [Scaling measure produces a KMS state](#bc-measure-to-kms) — `TauCeti.BostConnes.scalingMeasure_to_kms`: The missing canonical map integrates the actual corner expectation against a scaling Radon measure. ScalingMeasure and CompletedKMS are native separately; their expectation-mediated map depends on OP2-expectation-measure.
- [KMS restriction reconstructs a scaling measure](#bc-kms-to-measure) — `TauCeti.BostConnes.kms_to_scalingMeasure`: Missing is the diagonal C(zHat) embedding into the completed Hecke algebra and the canonical measure recovered from that restriction. The current Tau Ceti character-space measure theorem is imported for existence, with uniqueness separately required.
- [KMS states and scaling measures](#bc-kms-scaling-correspondence) — `TauCeti.BostConnes.bc_kms_scaling_correspondence`: Missing are the two preceding canonical maps and their mutually inverse affine and weak-topological identities. The native kms_classification states a barycentre result without replacing this measure-state equivalence by a placeholder.
- [Probability measures parameterize high-beta KMS states](#bc-high-beta-affine-homeomorphism) — `TauCeti.BostConnes.high_beta_affine_homeomorphism`: The native high_beta_barycentre_unique proves only unique probability-measure representation on a compact parameter W. The missing stronger signature identifies W with the imported zHat units and equips completed states with pointwise weak evaluation topology; norm topology of continuous linear maps is incorrect.
- [High-beta extreme states](#bc-high-beta-extremes) — `TauCeti.BostConnes.high_beta_extreme_iff`: The missing signature uses the actual convex set of completed states and its ExtremePoints, the canonical unit parametrization and the weak topology. Unique barycentres alone do not give a native extreme-boundary declaration.
- [Profinite units act on rational torsion](#bc-unit-qmodz-adapter) — `TauCeti.BostConnes.profiniteUnits_qmodz_equiv`: Native barycentres accept an actual equivalence W to AddAut(Q/Z) with continuous torsion evaluations. Construction of that equivalence from the imported profinite unit carrier and its compatible finite restrictions is omitted.
- [High-β extremal states and unique barycentres](#bc-high-beta-barycentres) — `TauCeti.BostConnes.bc_high_beta_barycentres`: Native high_beta_barycentre_unique and kms_classification give the unique-measure part. The Bauer-simplex and homeomorphic extreme-boundary clauses require the missing weak state topology and canonical zHat-unit comparison.
- [Symmetry on the high-beta extreme boundary](#bc-kms-symmetry-transitive) — `TauCeti.BostConnes.extreme_symmetry_torsor`: symmetryAction on the core is native. Its completed star-automorphism extension and the weak extreme-boundary/unit identification are missing from the stronger free/transitive action signature.
- [Rational power sums in a prime corner](#bc-eisenstein-corner-power-sums) — `TauCeti.BostConnes.bc_eisenstein_corner_power_sums`: The missing signature introduces the actual idempotent e=1-pi_p corner, its unit e and z_j=e E1(j/N), then asserts all their power sums belong to Qe. Existing native division and prime-projection identities supply its inputs.
- [Newton identities in the reduced corner](#bc-eisenstein-newton-rationality) — `TauCeti.BostConnes.bc_eisenstein_newton_rationality`: The pinned generic Newton identity is cited. Missing is its specialization to the actual e-corner, where constants map to c e and the product polynomial has degree N-1, including repeated and zero roots.
- [Roots of the reduced polynomial](#bc-eisenstein-cotangent-roots) — `TauCeti.BostConnes.bc_eisenstein_cotangent_roots`: The missing carrier is evaluation of the commutative arithmetic corner at an invertible Q-lattice character. It must identify the full multiset of N-1 roots with cot(pi j/N)/(2i), including zero at even N.
- [Polynomial recovery of the Cayley transform](#bc-eisenstein-bezout-cayley) — `TauCeti.BostConnes.bc_eisenstein_bezout_cayley`: Missing is the preceding corner polynomial Q_N and its Bezout identity with X-1/2, evaluated with corner unit e. That identity supplies the inverse needed for the Cayley recovery of e e(1/N).
- [The trigonometric arithmetic algebra equals the BC rational form](#bc-arithmetic-algebra-generation) — `TauCeti.BostConnes.bc_arithmetic_algebra_generation`: Native bc_eisenstein_roots_recovery, bc_eisenstein_isometry_generation and bc_eisenstein_complexification cover the torsion recovery and normalized arithmetic form. The node additionally asks for a canonical rational presentation comparison and hence keeps its own composite target signature omitted.
- [Compatible finite cyclotomic restrictions](#bc-cyclotomic-restrictions) — `TauCeti.BostConnes.cyclotomic_restrictions_compatible`: Finite cyclotomic Galois identifications are imported from GN.10. Missing is their inverse-limit compatibility map to the actual zHat-unit carrier and its comparison with AddAut(Q/Z); no global Artin map is assumed.
- [Quadratic conductor and root number](#quadratic-primitive-adapter) — `TauCeti.SeveralVariableZeta.quadratic_primitive_adapter`: quadraticTwist is an actual DirichletCharacter and its LFunction is native. The omitted signature names its primitive fundamental-discriminant character, proves the exact conductor/parity table and Gauss-sum root number +1, and identifies all change-level deleted factors, including conductor one.
- [Quadratic fourth moment](#quadratic-fourth-moment) — `TauCeti.SeveralVariableZeta.quadratic_fourth_moment`: The exact moment is requested from ST.2. Its native statement needs a finite enumeration of nonprincipal primitive real characters across varying conductor modules, with constants uniform in that enumeration and the conductor bound, rather than an arbitrary same-modulus family.
- [Primitive quadratic first moment](#quadratic-holder-first-moment) — `TauCeti.SeveralVariableZeta.quadratic_holder_first_moment`: The missing native signature sums only squarefree discriminants, with each corresponding primitive character and its fundamental-discriminant conductor. quadratic_mean_bound_import already states the resulting all-odd continued first moment.
- [Imprimitive square-factor bound](#quadratic-square-factor-sum) — `TauCeti.SeveralVariableZeta.quadratic_square_factor_sum`: The native squarefree_square_decomposition is a double-series identity. This omitted analytic leaf compares continued primitive and imprimitive L-functions via the exact deleted-prime factors, uniformly over the square component and the real strip.
- [Gluing the four continued tubes](#tube-overlap-gluing) — `TauCeti.SeveralVariableZeta.tube_overlap_gluing`: double_overlap_identity is native for actual analytic branches on an open preconnected domain. The missing stronger signature recursively constructs canonical branches on each transported tube base and records their compatibility across every gluing.
- [Filling the remaining real twelve-gon](#tube-hull-extension) — `TauCeti.SeveralVariableZeta.tube_hull_extension`: tube_bochner_extension and tube_reciprocal_bound are native exact analytic statements. This composite application to the canonical double-series shell has no additional named signature; primary Bochner proof acquisition remains the source gap.
- [From arithmetic cubic orbits to analytic coefficients](#cubic-orbit-to-coefficient) — `TauCeti.SeveralVariableZeta.cubic_orbit_to_coefficient`: The native CubicShintani uses supplied actual disc/aut/signature functions. Their canonical construction from all locally free cubic O_F-modules and finite automorphism groups is missing, including nonprincipal ideal-class components.
- [Self-dual versus integral-normalized measures](#local-measure-normalization) — `TauCeti.SeveralVariableZeta.local_measure_normalization`: Missing are the actual local field, different-normalized additive character, self-dual Haar pairing and GL2 Haar normalization maps from AL.0/AA.2. LocalIntegral accepts a genuine measure, but does not identify these canonical measures or their |3| factors.
- [Binary cubic orbital Jacobian](#local-orbit-jacobian) — `TauCeti.SeveralVariableZeta.local_orbit_jacobian`: Missing is the canonical binary-cubic GL2 orbit covering with finite stabilizer and its change-of-variables map, on the supplier local field and normalized Haar carriers.
- [Local density and coefficient conventions agree](#local-density-coefficient-comparison) — `TauCeti.SeveralVariableZeta.local_density_coefficient_comparison`: LocalIntegral.shell_sum is native for actual norm/discriminant shells. The stronger comparison needs the actual open-orbit selector, representative discriminant, stabilizer order and GL2 orbital measure; it is not an equality with arbitrary coefficient data.
- [The selected adelic binary-cubic zeta integral](#cubic-adelic-zeta) — `TauCeti.SeveralVariableZeta.CubicAdelic.unfolding`: Missing are the actual GL2 adelic quotient measure, Schwartz-Bruhat space, rational binary-cubic orbit quotient and finite stabilizers, all with the right-quotient determinant exponent 2s. Generic theta reindexing and inversion_kernel are native, but not this canonical orbital unfolding.
- [Adelic binary cubic convergence](#cubic-adelic-convergence) — `TauCeti.SeveralVariableZeta.cubic_adelic_convergence`: CubicAdelic.integral is native for actual quotient measure, determinant norm and theta supplied as parameters. Identifying them with GL2(A_F)/GL2(F) and proving the canonical Schwartz-Siegel majorant requires AA.2/AL.0/ST.1.
- [Adelic orbital unfolding](#cubic-adelic-unfolding) — `TauCeti.SeveralVariableZeta.cubic_adelic_unfolding`: Missing are the actual GL2 adelic quotient measure, Schwartz-Bruhat space, rational binary-cubic orbit quotient and finite stabilizers, all with the right-quotient determinant exponent 2s. Generic theta reindexing and inversion_kernel are native, but not this canonical orbital unfolding.
- [All class-group components in unfolding](#cubic-class-group-components) — `TauCeti.SeveralVariableZeta.cubic_class_group_components`: Missing is the finite ideal-class component index and the S-integral-to-all-locally-free-module comparison supplied by ST.1 and GN arithmetic. A freely chosen generic series index cannot express that equality.
- [Split local factor](#local-split-orbit-factor) — `TauCeti.SeveralVariableZeta.local_split_orbit_factor`: Missing is the standard split auxiliary orbital integral I_alpha(omega,Phi1), its four explicit valuation support subsets and their normalized measures. The rational factor alone would omit the proof carrier.
- [Unramified quadratic local factor](#local-unramified-quadratic-factor) — `TauCeti.SeveralVariableZeta.local_unramified_quadratic_factor`: Missing is the standard auxiliary integral with its unramified quadratic integral basis and two support regions, using the actual field norm and GL2 orbital measure.
- [Ramified quadratic local factor](#local-ramified-quadratic-factor) — `TauCeti.SeveralVariableZeta.local_ramified_quadratic_factor`: Missing is the standard auxiliary integral with ramified quadratic uniformizer basis and its two field-norm valuation regions, retaining residue characteristic two and the separate discriminant Jacobian.
- [Unramified cubic local factor](#local-unramified-cubic-factor) — `TauCeti.SeveralVariableZeta.local_unramified_cubic_factor`: Missing is the standard auxiliary integral with unramified cubic integral basis and the three valuation regions, not merely the algebraic rational-function simplification.
- [Ramified cubic local factor](#local-ramified-cubic-factor) — `TauCeti.SeveralVariableZeta.local_ramified_cubic_factor`: Missing is the standard auxiliary integral with ramified cubic uniformizer basis, norm valuation and its three support regions; wild discriminant factors stay in the canonical measure adapter.
- [Five local orbital Euler factors](#local-orbital-euler-factor) — `TauCeti.SeveralVariableZeta.local_orbital_euler_factor`: Missing are the five canonical local etale-cubic orbit types, standard representatives, unramified quasicharacter and orbital integrals. The five-factor formula is fully stated in the reader; neither a generic shell nor a rational function field replaces these objects.
- [Absolute convergence of cubic Shintani series](#cubic-absolute-convergence) — `TauCeti.SeveralVariableZeta.cubic_absolute_convergence`: CubicShintani is native as a generic weighted series. Its canonical number-field order coefficients, finite inverse-automorphism sums and all signature/class-group indices must be supplied before the unconditional arithmetic convergence signature.
- [Entire truncated cubic integral](#cubic-truncated-entire) — `TauCeti.SeveralVariableZeta.cubic_truncated_entire`: Missing is the actual determinant-at-least-one GL2 adelic quotient restriction and Schwartz-Bruhat tempered distribution topology; a generic integrability assumption would lose the uniform Siegel majorant target.
- [Poisson decomposition of the global integral](#cubic-poisson-decomposition) — `TauCeti.SeveralVariableZeta.cubic_poisson_decomposition`: Missing is the canonical finite-product adelic Fourier transform, nonsingular/singular theta decomposition and quotient measures. The exact zero/triple-root/double-root rational orbit selectors must accompany the exponent u and Jacobian.
- [Rank-one smoothing extracts the quotient integral](#cubic-smoothing-residue) — `TauCeti.SeveralVariableZeta.cubic_smoothing_residue`: Missing is the normalized GL2 rank-one Eisenstein function, entire vertical test space and contour smoothing operator from AS.2/AA.2, with the residue rho0=Res Z_F(1)/Z_F(2).
- [Zero-orbit contribution](#cubic-zero-singular-term) — `TauCeti.SeveralVariableZeta.cubic_zero_singular_term`: Missing is the actual zero-orbit smoothed theta integral and determinant-one idele character; its vanishing by character orthogonality is stated on the canonical quotient measure.
- [Compact averaging and Fourier](#cubic-compact-average-laws) — `TauCeti.SeveralVariableZeta.cubic_compact_average_laws`: Missing is the canonical maximal compact adelic group, its probability Haar measure and its action on the binary-cubic Schwartz space, together with the unitary determinant-character Fourier intertwining.
- [Singular distributions from Tate integrals](#cubic-singular-tate-restrictions) — `TauCeti.SeveralVariableZeta.cubic_singular_tate_restrictions`: Missing is the actual adelic Schwartz restriction/integration map T1,T2 and their normalized Tate meromorphic continuations. The four residue distributions must be stated as these canonical restrictions.
- [Unfold the triple-root orbit](#cubic-triple-root-unfolding) — `TauCeti.SeveralVariableZeta.cubic_triple_root_unfolding`: Missing is the rational triple-root orbit quotient GL2(F)/B(F) and its smoothed theta integral, compact average and idele/Tate change of variables, including the factor 1/3.
- [Triple-root contour residues](#cubic-triple-root-residue) — `TauCeti.SeveralVariableZeta.cubic_triple_root_residue`: Missing are the actual Sigma1 continued Tate restriction, smoothing contours and normalized residue distributions, whose poles are at w=2 and w=3.
- [Unfold the double-root orbit](#cubic-double-root-unfolding) — `TauCeti.SeveralVariableZeta.cubic_double_root_unfolding`: Missing is the rational double-root selector and its unfolded smoothed integral, nonconstant Eisenstein part and two Tate contours with parameters -1-z and z-3.
- [Double-root contour residues](#cubic-double-root-residue) — `TauCeti.SeveralVariableZeta.cubic_double_root_residue`: Missing are the actual Sigma2(-1) distribution and contour functions; the w=2,3,4 residue formula must use the same normalized restriction integrals as the triple-root term.
- [Cancel the extra smoothing poles](#cubic-singular-cancellation) — `TauCeti.SeveralVariableZeta.cubic_singular_cancellation`: Missing is the canonical Fourier-minus-original singular distribution and its determinant-one quotient integration map. The w=3 and w=4 cancellations are identities of those distributions.
- [Integrate the singular radial powers](#cubic-singular-rational-term) — `TauCeti.SeveralVariableZeta.cubic_singular_rational_term`: Missing is the canonical singular correction I(Phi,u), with actual Fourier and Sigma1/Sigma2 distribution evaluations. A rational expression in unrelated complex parameters would not state its identity with the integral.
- [Adelic cubic continuation and equation](#cubic-adelic-meromorphic-equation) — `TauCeti.SeveralVariableZeta.cubic_adelic_meromorphic_equation`: Missing is the canonical adelic Z(Phi,u) continued as a Schwartz-Bruhat distribution and its actual Fourier transform; the generic CubicContinuation instead describes ordinary two-pole arithmetic functions.
- [Fourier transform of the integral lattice](#local-finite-fourier-dual) — `TauCeti.SeveralVariableZeta.local_finite_fourier_dual`: Missing is the different-normalized local binary-cubic Fourier operator and its integral/trace-divisible lattice indicators, including the exact |3|^(-1) q^(-2e) self-dual mass.
- [Archimedean Fourier comparison](#cubic-archimedean-fourier-comparison) — `TauCeti.SeveralVariableZeta.cubic_archimedean_fourier_comparison`: ArchMatrix is native. Its identification as the Fourier matrix for the actual real/complex binary-cubic orbital distributions is omitted; the real primary Shintani proof and nonarchimedean Igusa proof remain named source gaps.
- [The cubic global matrix functional equation](#cubic-global-functional-equation) — `TauCeti.SeveralVariableZeta.cubic_global_functional_equation`: Missing are the canonical ordinary and trace-divisible dual series on the same number-field signature index and the self-dual local/global normalization comparison. ArchMatrix alone and supplied generic meromorphic functions do not establish this equation.
- [Cubic meromorphic continuation](#cubic-meromorphic-continuation) — `TauCeti.SeveralVariableZeta.cubic_meromorphic_continuation`: CubicContinuation prototypes actual meromorphic continuation and entire pole clearance of a given series. The omitted existence theorem constructs this data for the canonical cubic-order series from the adelic unfolding, local factors and all ideal-class components.
- [Order-one bound for cubic clearance](#cubic-entire-order-bound) — `TauCeti.SeveralVariableZeta.cubic_entire_order_bound`: Missing is the canonical cleared arithmetic function C_(F,alpha) and the primary quantitative entire-plane growth proof. A function with assumed order-one bound would hide the precise remaining source gap.
- [The two cubic poles and their residues](#cubic-residues-and-entire-clearance) — `TauCeti.SeveralVariableZeta.cubic_residues_and_entire_clearance`: Native CubicContinuation.clear_spec and its two residue limits are present. The stronger arithmetic target additionally constructs the canonical continuation and proves order at most one, whose separate growth proof is a gap.
- [Archimedean coefficients vanish to degree order](#arch-entry-vanishing-at-one) — `TauCeti.SeveralVariableZeta.arch_entry_vanishing_at_one`: ArchMatrix and explicit sine entries are native. This omitted leaf states their local analytic vanishing orders in the number-field signature matrix, including the double complex factor and total n=r1+2r2.
- [The global prefactor is a unit at one](#gamma-unit-at-one) — `TauCeti.SeveralVariableZeta.gamma_unit_at_one`: Missing is the canonical global number-field Gamma/discriminant prefactor with its normalization and its local analytic unit germ at one; generic Gamma facts do not identify that prefactor.
- [Simple poles of the dual cubic Shintani series](#cubic-dual-simple-poles) — `TauCeti.SeveralVariableZeta.cubic_dual_simple_poles`: CubicShintani.dual is native as an actual trace-selector weighted series. Its canonical trace-divisible order lattice, meromorphic continuation and two simple-pole assertion require the same arithmetic/adelic adapters as the ordinary series.
- [The degree-dependent zero at the origin](#cubic-zero-at-origin) — `TauCeti.SeveralVariableZeta.cubic_zero_at_origin`: Missing is the canonical ordinary/dual functional equation and their analytic germs. The vanishing order n-1 cannot be concluded from independently supplied arbitrary continuation data.
- [Orders in a fixed étale cubic algebra](#cubic-orders-generating-series) — `TauCeti.SeveralVariableZeta.cubic_orders_generating_series`: Missing are canonical orders inside an etale cubic F-algebra, their relative index norm and counting coefficients, and the arithmetic-to-local-orbit bijection supplied by ST.1. The zeta quotient is specified mathematically.
- [The weighted cubic-coefficient bound](#cubic-reducible-and-field-coefficient-bound) — `TauCeti.SeveralVariableZeta.cubic_reducible_and_field_coefficient_bound`: Missing is the canonical split/quadratic/cubic-field decomposition of weighted cubic order coefficients, h2(F), and the ST.3 uniform field-count comparison on number-field discriminant carriers.
- [Reflected vertical bound from the matrix equation](#cubic-reflected-bound) — `TauCeti.SeveralVariableZeta.cubic_reflected_bound`: Missing are canonical xi_hat, the ordinary/dual comparison, h2(F) and absolute field discriminant D. The stated exponents and pole exclusion are explicit; arbitrary complex-function bounds would omit these hypotheses.
- [Pole-aware cubic convexity bound](#cubic-pole-cleared-convexity) — `TauCeti.SeveralVariableZeta.cubic_pole_cleared_convexity`: Missing is the canonical entire pole-cleared ordinary cubic function with its established order-one estimate and number-field discriminant normalization; AN.5 supplies the uniform Gamma and Phragmen-Lindelof adapter.
- [The compact discrete-spectrum input](#compact-spectrum-and-weyl) — `TauCeti.SpectralZeta.compact_spectrum_and_weyl`: HeatAsymptotics has actual monotone eigenvalues, counts and expansion. AS.4 must construct that data from the scalar Laplacian of the imported compact oriented hyperbolic surface and identify multiplicities and its simple zero.
- [Holomorphic remainder after heat subtraction](#heat-subtracted-holomorphy) — `TauCeti.SpectralZeta.heat_subtracted_holomorphy`: heat_small_time_subtraction and spectral_continuation_exists are native. The omitted intermediate signature gives the precise locally uniform holomorphy of the actual remainder integral on Re z>-N, with quantitative compact-dependent derivative bounds.
- [Compact geodesic-series majorant](#selberg-geodesic-majorant) — `TauCeti.SpectralZeta.selberg_geodesic_majorant`: Selberg is native for actual length data. AS.6 must identify its index with primitive conjugacy classes and provide positive systole, finite counts, exponential growth and the selected orientation convention.
- [Logarithmic derivative of the primitive product](#selberg-log-product) — `TauCeti.SpectralZeta.selberg_log_product`: Selberg.log_derivative is native under an actual convergence condition. The stronger leaf proves compact-normal convergence and the logarithmic product expansion from the canonical primitive geodesic count and systole.
- [The compact scalar heat trace input](#scalar-heat-trace-formula) — `TauCeti.SpectralZeta.scalar_heat_trace_formula`: Missing is the actual scalar Laplacian heat data and matching primitive geodesic index from AS.4/AS.6, plus the Gaussian trace-test adapter. No generic sequence and length fields are asserted to satisfy the geometric identity.
- [Normal convergence of the hyperbolic transform](#selberg-transform-normal-convergence) — `TauCeti.SpectralZeta.selberg_transform_normal_convergence`: Missing is the canonical hyperbolic heat summand and its geometric count majorant, sufficient to state joint compact-normal z,s convergence on the restricted Laplace cone.
- [Hyperbolic transform is the Selberg logarithm](#hyperbolic-laplace-mellin) — `TauCeti.SpectralZeta.hyperbolic_laplace_mellin`: selberg_laplace_integral is native with Re w>0 and Re(w^2)>0. Missing is its identification with the actual Gaussian hyperbolic trace sum, justified by the stronger geometric counting cone and the same primitive orientation.
- [Identity contribution and Barnes normalization](#identity-barnes-transform) — `TauCeti.SpectralZeta.identity_barnes_transform`: scalarIdentity is native for supplied actual Barnes G. AN.7 must supply the normalized G, its original derivative/asymptotic proof and the geometric identity heat-transform comparison; recurrence alone is insufficient.
- [Two-parameter shifted spectral zeta](#shifted-zeta-holomorphic) — `TauCeti.SpectralZeta.shifted_zeta_holomorphic`: SpectralContinuation has actual shifted meromorphic functions and right-half-plane agreement. Missing is a native joint holomorphy carrier in the complex shift u and Mellin z, with the principal-logarithm cut and parameter derivatives.
- [Branch-independent identity factor](#selberg-identity-germ) — `TauCeti.SpectralZeta.scalar_identity_germ`: scalarIdentity states the single-valued integer-power formula. Missing is the actual normalized Barnes G continuation and equality to its logarithmic heat-transform formula as meromorphic germs.
- [The compact Selberg determinant comparison](#selberg-determinant-comparison) — `TauCeti.SpectralZeta.selberg_determinant_comparison`: ShiftedDet and scalarIdentity are native separately. Missing is the canonical geometric equality involving the scalar Laplacian, primitive-geodesic continued Z and normalized Barnes G, with the v2 constant fixed by their asymptotics.
- [Identity factor at spectral points](#selberg-identity-nonvanishing) — `TauCeti.SpectralZeta.selberg_identity_nonvanishing`: Missing is the normalized Barnes G zero divisor and Gamma-unit comparison needed for the canonical identity factor; its order 2g-2 pole at zero is retained in the mathematical target.
- [Selberg zeros and scalar spectral parameters](#selberg-spectral-zero-comparison) — `TauCeti.SpectralZeta.selberg_spectral_zero_comparison`: shifted_zero_divisor and spectral_pullback_order are native exact statements for actual eigenvalues and determinant functions. The missing geometric comparison identifies those zeros with canonical Selberg Z and separates the identity-factor endpoint orders.
- [Prime pairs with prescribed ratio and divergent weights](#bc-prime-pair-ratio) — `TauCeti.BostConnes.bc_prime_pair_ratio`: Missing is the exact prime-pair sequence construction with disjoint coordinates, quantitative ratio limit and divergent weighted source masses, using the AN.2 fixed-progression PNT contract.
- [Valuation-tail cylinder ratios](#bc-valuation-tail-ratio) — `TauCeti.BostConnes.bc_valuation_tail_ratio`: ScalingMeasure.local_shell is native. Missing is the canonical two-prime cylinder swap on the local product and its target-evaluated pushforward derivative; the forward and inverse rational maps have different stated powers.
- [Prime pairs with controlled unit residues](#bc-prime-pairs-congruence) — `TauCeti.BostConnes.prime_pair_congruence_ratio`: prime_progression_reciprocal_diverges is native. The stronger missing leaf constructs disjoint pairs in congruence classes with matching proportional intervals and divergent source masses, uniformly avoiding any prescribed finite prime set.
- [Independent tail swaps give essential ratios](#bc-asymptotic-ratio-inclusion) — `TauCeti.BostConnes.asymptotic_ratio_mem`: RatioSet is native for actual actions and densities. OP2-ratio must supply the finite-block product equivalence relation, independent swaps and the asymptotic-ratio inclusion theorem with its precise recurrence assumptions.
- [Ratio witnesses lift through unit cylinders](#bc-ratio-unit-lifting) — `TauCeti.BostConnes.ratio_witness_unit_lift`: Missing is the actual adelic cylinder coordinate map from the canonical product measure and profinite units. It connects congruent prime swaps to the full adelic action and its essential-ratio witnesses.
- [All positive numbers belong to the ratio set](#bc-full-positive-ratio-set) — `TauCeti.BostConnes.bc_full_positive_ratio_set`: canonical_ratio_set is native on FiniteAdeles with the explicit target density q^beta. The additional leaf is its canonical prime/cylinder witness proof; that proof is recorded in the packet rather than a second named native theorem.
- [Ergodicity makes the group-measure algebra a factor](#bc-ergodic-crossed-product-factor) — `TauCeti.BostConnes.ergodic_crossed_product_factor`: The sigma-finite group-measure-space von Neumann algebra and its center theorem are missing OP2-factor carriers. No C*-closed operator algebra is substituted for the GNS von Neumann factor.
- [Full positive ratio set determines type III1](#bc-ratio-factor-type) — `TauCeti.BostConnes.ratio_set_type_three_one`: Missing are the operator-theoretic TypeIII1 predicate, flow of weights and the OP2-factor ratio-set classification theorem for the actual measured crossed product.
- [A nonzero full corner preserves factor type](#bc-full-corner-type) — `TauCeti.BostConnes.full_corner_type_three_one`: Missing are the group-measure-space factor, its von Neumann corner and the completed-state GNS compression equivalence, plus the nonzero-corner type invariance theorem from OP2-factor.
- [The critical KMS factors have type III₁](#bc-type-three-one) — `TauCeti.BostConnes.bc_type_three_one`: The actual GNS von Neumann algebra and TypeIII1 predicate are missing OP2-factor objects; native canonical_ratio_set and completed state classification provide arithmetic inputs only.
- [Arithmetic values and symmetry intertwining](#bc-arithmetic-values-and-symmetry) — `TauCeti.BostConnes.bc_arithmetic_values_and_symmetry`: groundState and groundState_galois are native on the core. The stronger target needs the canonical cyclotomic subfield Qcycl, its generated-field comparison and the completed unit/cyclotomic restriction intertwining map.
- [Cubic residue at one](#cubic-residue-one) — `TauCeti.SeveralVariableZeta.cubic_residue_one`: CubicContinuation.residue_one is native as 6 C(1). The omitted arithmetic evaluation identifies C(1) with the actual zeta_F residue, signature and discriminant-normalized AF, rather than a supplied complex constant.
- [Cubic secondary residue](#cubic-residue-five-sixths) — `TauCeti.SeveralVariableZeta.cubic_residue_five_sixths`: CubicContinuation.residue_five_sixths is native as -6 C(5/6). The omitted arithmetic evaluation identifies that value with BF times 3^(-r_alpha/2), on the canonical number-field zeta and signature carriers.

## Baseline declarations

- `mathlib:AddCircle` in `Mathlib/Topology/Instances/AddCircle/Defs.lean`: ℚ/ℤ as AddCircle (1 : ℚ), the index set of the e(γ).
- `mathlib:Complex.cpow` in `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean`: Complex powers a^{iz}.
- `mathlib:HeckeCoset` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`: Double cosets H₁\Δ/H₂.
- `mathlib:HeckeCoset.mk` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`: The double coset of an element.
- `mathlib:HeckeCosetModule` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`: The Hecke coset module underlying the Hecke ring.
- `mathlib:HeckeRing` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`: The Hecke ring 𝕋 Δ H Z of finitely supported functions on double cosets.
- `mathlib:HilbertBasis` in `Mathlib/Analysis/InnerProductSpace/l2Space.lean`: An indexed Hilbert basis is a linear isometry equivalence with lp over the index type. This structure does not itself choose the canonical coordinate vectors or prove their basis laws.
- `mathlib:IsCyclotomicExtension` in `Mathlib/NumberTheory/Cyclotomic/Basic.lean`: Cyclotomic fields, where the ground-state values lie.
- `mathlib:IsHeckeTriple` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`: Hecke triples (H₁, Δ, H₂): Δ in the commensurator, the input of the Hecke ring.
- `mathlib:IsHeckeTriple.of_diagonal` in `Mathlib/NumberTheory/HeckeRing/Defs.lean`: A pair H ≤ Δ ≤ commensurator H is a Hecke triple.
- `mathlib:Matrix.GeneralLinearGroup` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: GL₂(ℚ), the ambient group of the ax+b pair.
- `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: Invertible matrices from a nonzero determinant, for the named elements [1 b; 0 a].
- `mathlib:MulAut` in `Mathlib/Algebra/Group/End.lean`: Multiplicative automorphisms and the additive twin AddAut. The profinite topological identification of AddAut(Q/Z) is imported from ProfiniteArithmetic.
- `mathlib:PNat` in `Mathlib/Data/PNat/Notation.lean`: The index set ℕ≥1.
- `mathlib:Rat.num_div_den` in `Mathlib/Algebra/Ring/Rat.lean`: (a.num : Q)/(a.den : Q)=a, with positive natural denominator; use symmetry when decomposing a.
- `mathlib:Real.log` in `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: The eigenvalues log k of the Hamiltonian.
- `mathlib:Subgroup.Commensurable` in `Mathlib/GroupTheory/Commensurable.lean`: Commensurability of subgroups.
- `mathlib:Subgroup.Normal` in `Mathlib/Algebra/Group/Subgroup/Defs.lean`: Normality, for the test that P⁺_ℤ is not normal in P⁺_ℚ.
- `mathlib:Subgroup.relIndex` in `Mathlib/GroupTheory/Index.lean`: H.relIndex K is the index of H∩K in K. The Hecke degree uses the conjugated subgroup as H and the left-coset subgroup as K.
- `mathlib:lp` in `Mathlib/Analysis/Normed/Lp/lpSpace.lean`: The Hilbert space ℓ²(ℕ≥1).
- `mathlib:riemannZeta` in `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`: The Riemann zeta function, the partition function.
- `mathlib:zeta_eq_tsum_one_div_nat_cpow` in `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`: ζ(s) = Σ n^{−s} for Re s > 1.
- `tauceti:HeckeCoset.degree` in `TauCeti/NumberTheory/HeckeRing/Basic.lean`: The number of left cosets in a double coset.
- `tauceti:HeckeCoset.degree_eq_relIndex` in `TauCeti/NumberTheory/HeckeRing/Basic.lean`: The degree as a relative index.
- `tauceti:HeckeCosetModule.instRingHeckeRing` in `TauCeti/NumberTheory/HeckeRing/Associativity.lean`: The ring structure (Shimura's convolution) on the Hecke ring.
- `tauceti:HeckeCosetModule.mul_single_single` in `TauCeti/NumberTheory/HeckeRing/Multiplication.lean`: Product of two basis elements through the structure constants.
- `tauceti:HeckeCosetModule.single` in `TauCeti/NumberTheory/HeckeRing/Basic.lean`: The basis element of a double coset.
- `tauceti:HeckeCosetModule.single_mul_single` in `TauCeti/NumberTheory/HeckeRing/Multiplication.lean`: Product of basis elements in the Hecke ring.
- `mathlib:DirichletCharacter` in `Mathlib/NumberTheory/DirichletCharacter/Basic.lean`: Real mod8 character carrier.
- `mathlib:jacobiSym` in `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean`: Jacobi symbol on integer numerator and natural denominator.
- `mathlib:LSeries` in `Mathlib/NumberTheory/LSeries/Basic.lean`: Totalized Dirichlet sum; domain assertions remain separate.
- `mathlib:Complex.Gamma` in `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`: Complex gamma, totalized at poles; meromorphic identities use germs.
- `mathlib:mellin` in `Mathlib/Analysis/MellinTransform.lean`: Mellin integral on positive reals.
- `mathlib:AnalyticOnNhd` in `Mathlib/Analysis/Analytic/Basic.lean`: Analytic carrier on C and normed C².
- `mathlib:MeromorphicOn` in `Mathlib/Analysis/Meromorphic/Basic.lean`: One-variable meromorphic carrier.
- `mathlib:StarSubalgebra.topologicalClosure` in `Mathlib/Topology/Algebra/StarSubalgebra.lean`: Existing operator star-subalgebra closure.
- `mathlib:Polynomial` in `Mathlib/Algebra/Polynomial/Basic.lean`: Polynomial carrier for the Eisenstein recurrence.
- `mathlib:ArithmeticFunction.moebius` in `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`: The integer-valued arithmetic Möbius function, zero at zero and at nonsquarefree positive integers.
- `mathlib:ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` in `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`: For a NonAssocRing R and functions f,g : ℕ→R, the divisor-sum identity for every n>0 is equivalent to Möbius inversion over divisorsAntidiagonal. Apply over ℚ to positive integers; negative powers are rational powers of nonzero integers.
- `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub` in `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`: For a primitive complex character at nonzero level N and any s, completedLFunction χ (1−s)=N^(s−1/2) rootNumber χ completedLFunction χ⁻¹ s. Identification of quadratic root number and conductor is a separate adapter.
- `mathlib:DirichletCharacter.LFunction_changeLevel` in `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`: For nonzero levels M|N, χ mod M and χ≠1 or s≠1, the changed-level L-function equals LFunction χ times the deleted Euler factors at prime divisors of N. At the principal pole use meromorphic germs.
- `mathlib:Complex.exp` in `Mathlib/Analysis/Complex/Exponential.lean`: The complex exponential as the limit of its power series, used by cotangent and determinant normalizations.
- `mathlib:jacobiSym.quadratic_reciprocity` in `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean`: For odd natural a,b, J(a|b)=(−1)^(a/2·b/2)J(b|a), including pairs that are not coprime.
- `mathlib:MvPolynomial.mul_esymm_eq_sum` in `Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean`: Newton recurrence over any commutative ring with a finite variable set. Evaluate into the commutative rational corner and divide by positive k in Q.
- `mathlib:PositiveLinearMap.GNS` in `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`: The completed GNS space for a positive functional on an already normed C*-algebra. It does not bound left multiplication for a merely algebraic Hecke core.
- `mathlib:PositiveLinearMap.gnsStarAlgHom` in `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`: Unital star representation on the completed GNS Hilbert space under CStarAlgebra and StarOrderedRing hypotheses.
- `mathlib:IsDedekindDomain.FiniteAdeleRing` in `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`: Restricted product of adic completions relative to their integer subrings; supplies the actual finite-adèle ring, its topology and scalar algebra.
- `mathlib:MeasureTheory.Measure.infinitePi` in `Mathlib/Probability/ProductMeasure.lean`: Product of probability measures; cylindrical masses and uniqueness are supplied by infinitePi_pi and eq_infinitePi. This is not a finite product only.
- `mathlib:DirichletCharacter.LFunction` in `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`: The meromorphic Dirichlet L-function; unlike LSeries, this is analytic continuation beyond the series region.
- `mathlib:DirichletCharacter.LFunction_eq_LSeries` in `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`: For Re s>1, the continued L-function agrees with the naive character Dirichlet series.
- `mathlib:RingHom.toAlgebra'` in `Mathlib/Algebra/Algebra/Defs.lean`: A ring homomorphism into a possibly noncommutative semiring defines an algebra when all image elements commute with the target. Supplies the central rational scalar algebra on the complex Hecke core.

## Current upstream imports

- `tauceti:TauCetiRoadmap/ProfiniteArithmetic` at `81207c7f16d5abf770f13a7d2bdcdb465c030787`: Layer 0 owns the topological ring zHat, its product of p-adic integer rings, units, finite reductions and compatible finite-character lifting. AN.9 imports these and proves only the torsion-character identification needed by BC.
- `tauceti:TauCetiRoadmap/RestrictedProducts` at `81207c7f16d5abf770f13a7d2bdcdb465c030787`: Generic topology, integral compact-open subgroup and finite/away-S product decomposition. Haar and nonsingular-action theorems are not part of this contract.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles` at `81207c7f16d5abf770f13a7d2bdcdb465c030787`: Finite-adèle/idèle arithmetic and rational dilations; does not imply a BC scaling measure or GL2 quotient measure.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic` at `81207c7f16d5abf770f13a7d2bdcdb465c030787`: Finite cyclotomic Galois identifications, restriction compatibility and arithmetic Frobenius. No global Artin existence theorem is assumed.
- `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries` at `81207c7f16d5abf770f13a7d2bdcdb465c030787`: Arithmetic Dirichlet series, coefficient carriers, ideal/norm interfaces and the upstream Tauberian direction which this Part II extends.
- `tauceti:TauCetiRoadmap/OperatorTheory` at `81207c7f16d5abf770f13a7d2bdcdb465c030787`: Operator ideals, trace-class infrastructure, Hilbert projection geometry and self-adjoint spectral theory; crossed products, KMS simplexes and type classification require the exact Part II requests recorded here.
- `tauceti:LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq` at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: A positive linear functional on a unital commutative C*-algebra is integration against a finite inner regular character-space measure. Read on current Tau Ceti; absent at the historical pin. Use it for existence and RMK uniqueness for uniqueness.
- `tauceti:IsDedekindDomain.FiniteAdeleRing.isCompact_integralFiniteAdeles` at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: Compactness of the integral finite-adèle subset, under the local compact-integer hypotheses. Current Tau Ceti declaration; absent at the historical pin.

## Sources and proof-reading scope

The locators above refer to these editions and public versions. Statements and arguments are given in this document’s own words. Reading a paper’s cited theorem does not certify the original proof of an external theorem it invokes; those cases appear in the obligations list.

### Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory

[Selecta Mathematica (N.S.) 1 (1995), no. 3, 411–457; author-hosted scan of the published article on Connes's site (no text layer, read on page images); journal page = PDF page + 410; accessed 2026-09-28](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf).

**Read scope.** Fresh 2026-10-10 reading: Hecke conventions and Proposition 3 with proof, pp.411–414; modular evolution pp.415–416; complete Proposition 18 and rational presentation pp.431–433.

### Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives

[AMS Colloquium Publications 55 (2008); author-hosted PDF on Marcolli's page; printed page = PDF page − 22; accessed 2026-09-28](https://www.its.caltech.edu/~matilde/coll-55.pdf).

**Read scope.** Fresh 2026-10-10 reading: Definitions 3.4–3.7 pp.445–448; presentation pp.460–462; complete Lemmas 3.27–3.29 and Theorem 3.30 proof pp.464–470; complete Theorem 3.32 discussion pp.474–476. General cited C*-classification proofs are not claimed read.

### Valentin Blomer — Subconvexity for a double Dirichlet series

[Compositio Math.147 (2011),355–374; version of record downloaded 2026-10-05. Results outside the selected continuation/functional-equation target are not extracted.](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf).

**Read scope.** Fresh 2026-10-10 reading: full §2.1 pp.358–359 and Lemma 2 proof pp.361–364; R6 shell geometry independently checked using the explicit affine maps.

### Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem

[arXiv math/0002141v1. The inherited math/0012110 link was a blueprint citation error and points to an unrelated paper.](https://arxiv.org/pdf/math/0002141v1).

**Read scope.** All four pages, including Proposition, finite-prime projection formula, character proof, corollary and references.

### Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems

[arXiv 0907.1456v1. Only the Q specialization of the number-field argument is used.](https://arxiv.org/pdf/0907.1456v1).

**Read scope.** Introduction; §1 ratio and asymptotic ratio sets; §2 Theorem 2.1, Lemma 2.3 and their complete proofs, pp.1–5. The GL2 argument is outside this target.

### Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions

[Source route PAPER-LEMKEOLIVER-WANG-WOOD25/14, reviewed payload. Fresh arXiv text; published-version reading evidence stays with that accepted extraction. Do not promote this receipt to a reading of the published PDF.](https://arxiv.org/pdf/2110.07712).

**Read scope.** Fresh 2026-10-10 reading: §3.2 pp.12–14. Wright global and DW local/ordinary-series proofs were then read in their original public papers; the remaining external local and growth proofs are recorded separately.

### Peter Sarnak — Determinants of Laplacians, heights and finiteness

[Author-hosted published scan, pp.601–622. Only the spectral definition and heat argument on p.603 are cited.](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf).

**Read scope.** Page images pp.601–606; §1.1–1.5 on p.603 supplies the spectral series, heat Mellin transform, regularity at zero and determinant definition. Sections beyond the stated scope were not read.

### Don Zagier — New points of view on the Selberg zeta function

[Author-hosted survey. Supplies conventions, not a proof-closure certificate for continuation.](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf).

**Read scope.** §1 in full, pp.1–2, including spectral parameters and primitive-hyperbolic product. §2–3 statement context read, not used as complete proofs.

### Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function

[arXiv 2512.16681v2, 9 February 2026. The torsion-factor sign in v1 is already corrected in v2.](https://arxiv.org/pdf/2512.16681v2).

**Read scope.** Fresh 2026-10-10 reading: v2 §5 pp.16–19 in full, §6 Theorem 6.1 and complete proof pp.20–24, §8 pp.26–28 and Barnes input §2.5 p.9. The geometric heat and cited Barnes primary proofs remain supplier gaps.

### D. R. Heath-Brown — A mean value estimate for real character sums

[Acta Arithmetica 72 (1995), 235–275](https://www.impan.pl/shop/en/publication/transaction/download/product/108575).

**Read scope.** Corollaries 1–3 and Theorem 2, pp.237–238; §10 proof of the fourth-moment bound through its critical-line endpoint, pp.267–269.

### Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein — Multiple Dirichlet series and moments of zeta and L-functions

[Public author manuscript, arXiv math.NT/0110092v1 (2001); journal version 2003](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf).

**Read scope.** §4.3, Definitions 4.4–4.5 and Propositions 4.6–4.7, pp.37–44; tube continuation and bounded-extension argument.

### D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory

[Mathematische Annalen 270 (1985), 503–534; scan has a metadata cover, printed p.503 is PDF p.2](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf).

**Read scope.** Fresh page-image reading 2026-10-10: definitions and Fourier normalization pp.506–509; complete Lemmas 1.1–1.2 and their lattice-sum estimates pp.510–511.

### Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory

[Journal für die reine und angewandte Mathematik 367 (1986), 27–75; scan metadata cover, printed p.27 is PDF p.2](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf).

**Read scope.** Full Theorem 3.1 valuation-region proof, pp.42–45; Proposition 3.3 and Theorem 3.2 discussion, pp.46–47; real matrix Theorem 4.1 and complex matrix proof through Theorem 4.2, pp.48–51.

### Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners

[Author preprint arXiv math/9911135v1; published JLMS 61 (2000), 893–904. Locators below use preprint pages.](https://arxiv.org/pdf/math/9911135).

**Read scope.** §1.3, pp.4–5; Theorem 2.1.1 and proof, pp.5–6; Lemma 2.1.3 and proof, pp.6–7; Theorem 2.2.1 and proof, pp.7–8; §3 and Proposition 3.2.1, pp.8–9; Corollary 3.2.2, p.10.

## Coverage and acceptance

`AnalyticNumberTheory:AN.8`: **planned**. Closed coverage requires Quadratic primitive-character and uniform-strip proof adapters; Bochner theorem: primary proof acquisition; Cubic rings on nonprincipal modules; Local distribution functional equations: external original proofs; GL2 measures, Siegel majorants and normalized Eisenstein input; Cubic entire order-one quantitative estimate; Normalized Haar and canonical adelic component adapters; Canonical native interfaces and weak state topology.

`AnalyticNumberTheory:AN.9`: **planned**. Closed coverage requires Normalized Haar and canonical adelic component adapters; OperatorTheory Part II: crossed products and bounded-state completion; OperatorTheory Part II: nonsingular factor classification; Compact scalar geometric spectral and Gaussian trace adapters; Barnes G original normalization and asymptotic proof; Canonical native interfaces and weak state topology; Current upstream identifiers absent from the historical declaration index.

Acceptance requires the dependency and supplier normalizations to agree; all API and tests to appear in the suggested file or the individually stated omission; only proof-stub warnings on elaboration; and all canonical adapters to be established before claiming mathematical closure. Exact finite checks of the character matrices, affine order, recurrence and division identities support the specification. The rational-grid shell check supplements the stated linear-inequality proof and is not a substitute for it.
