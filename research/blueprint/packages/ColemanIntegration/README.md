# Coleman integration and noncritical Dirichlet L-values

This roadmap constructs Coleman integration on good-reduction curves,
normalized p-adic polylogarithms and positive integer Kubota–Leopoldt L-values.
It develops primitives, logarithm branches, Frobenius continuation, functional
equations and smoothed moments, then compares complex values and regulators.

For an odd prime p, a nontrivial primitive Dirichlet character θ of conductor
N = Dp^n with p ∤ D, and k ≥ 1, the principal formula is

$$
L_p(\theta\omega^{1-k},k)
 = \frac{1-\theta(p)p^{-k}}{G(\theta^{-1})}
   \sum_{c\in(\mathbb Z/N\mathbb Z)^\times}
        \theta^{-1}(c)\,\mathrm{Li}_k(\varepsilon_N^c).
$$

Here ε_N is primitive, G(θ⁻¹) = Σ_c θ⁻¹(c)ε_N^c, and Li_k uses the Iwasawa
logarithm. The ω^(1−k) twist is part of the statement under RJW Definition 5.18;
the printed Theorem 6.7(ii) suppresses it. The untwisted form holds at the
normalization level when k ≡ 1 mod(p−1). For p=5, θ=χ_−3 and k=2, parity makes
the untwisted value zero while the character sum with its Euler factor is a
5-adic unit. This is a required rejection test. Sources: RJW §6.2, Theorem 6.7,
p.39 (v2); corresponding published theorem p.154; BBdJR Theorem 4.14, pp.20–21.

## Ownership and dependencies

Each definition uses the existing Mathlib vocabulary when applicable.
`PowerSeries`, `PowerSeries.derivative`, `PowerSeries.IsRestricted`,
`FormalMultilinearSeries.radius`, `HasFPowerSeriesOnBall`, `AnalyticOnNhd`,
`Metric.eball`, `Derivation`, `Finsupp`, `FreeMonoid`, `PadicComplex`,
`AbstractMeasure`, `AbstractMeasure.amiceTransform`, `DirichletCharacter`,
`gaussSum`, and the complex `HurwitzZeta.expZeta` are imported carriers.
Formal Laurent series are not rings of analytic functions on an annulus.
Tau Ceti supplies `NormedSpace.logOneAdd`, `logOneAddSeries` and their defining
series, and the local-field Teichmüller lift. The ultrametric convergence theorem
needed here is proved on that logarithm: its existing radius theorem assumes
continuous rational nonnegative scalar multiplication, which p-adic fields lack.

| Imported material | Owning roadmap and layer |
|---|---|
| Dagger algebras, weak completions, rational localizations, differentials, scalar extension, identity principle and integral étale Taylor estimates | `AS-F1`: AdicSpacesPartII:F1 |
| Generic fibres, specialization, tubes and residue-disc coordinates | `AS-R2`: AdicSpacesPartII:R2 |
| Laurent annulus rings, restriction maps, norms and local-field valuation facts | `PH-P7`: PadicHodgeTheory:P7:annulus-foundations |
| Frobenius lifting and finite-order coefficient-field linear algebra | `RD0`: PadicDifferentialEquationsAndRigidCohomology:RD.0 |
| Rigid cohomology, finite-dimensionality, lift independence and weights | `RD4–RD6`: PadicDifferentialEquationsAndRigidCohomology:RD.4–RD.6 |
| Bounded Mahler–Amice theory over O_K, continuous rotation and residue-class integrals | `PM2`: PadicMeasuresIwasawaAlgebras:L2 |
| Evaluation of pseudomeasures at nontrivial characters | `PM3`: PadicMeasuresIwasawaAlgebras:L3 |
| Locally analytic distributions, their Amice transform onto R⁺ and restriction to units | `LA1`: LocallyAnalyticDistributions:L1 |
| Gauss-sum conventions, smoothing measures, character measures and the Kubota–Leopoldt normalization | `DP0–DP3`: DirichletPadicLFunctions:L0–L3 |
| Finite-image complex Artin factors, induction and meromorphic continuation | `AA-Artin`: AdelicAlgebraicGroups:AA.2.4, convergence-factors |

DirichletPadicLFunctions imports logarithm branches from L0 and supplies
measures and L-functions to L3 within the same arithmetic bundle. General
Tannakian path torsors belong to AnabelianGeometryAndNonabelianChabauty;
L1 constructs the direct word algebra. Comparisons with abelian integration
on Jacobians belong to EffectiveDiophantineMethods:ED.4.

## Conventions and order
- p is prime and |p|=p⁻¹ on C_p; v_p(p)=1. General ultrametric results state
  their own characteristic-zero and completeness assumptions.
- D⁻(a,r) uses the positive ENNReal radius r. A function analytic on the whole
  disc has one convergent power series; `AnalyticOnNhd` alone means local
  analyticity and permits nonconstant locally constant functions.
- log_a(p)=a, and log_p means log_0. On nonzero points,
  log_b−log_a=(b−a)v_p. Total functions may assign zero at a removed point;
  every formula using a logarithm's group law states nonvanishing.
- A good-reduction pair descends to finite K/Q_p, with k=F_q. Arithmetic
  K-linear Frobenius lifts z↦z^q. The auxiliary analytic p-power map can
  permute tame roots; when q≠p it is not arithmetic Frobenius over K.
- The first letter of a word is the outermost integral. Nonempty words are
  normalized at an ordinary base or at the constant term of their regular-log
  expansion at a tangent. Constant term on arbitrary Laurent germs is not
  multiplicative; tangential formulas require the simple-pole and
  pullback-normalization hypotheses in L1.
- Li_0(z)=z/(1−z), Li_1(z)=−log_a(1−z), and
  dLi_k=Li_(k−1) dz/z. Near zero, Li_k=Σ_(m≥1)z^m/m^k. For k≥2,
  Li_k(1) denotes the continuous limiting value. The Frobenius-modified value
  is Li_k^(p)(z)=Li_k(z)−p⁻ᵏLi_k(z^p).
- Character formulas in the L-function normalization assume p odd; analytic
  polylogarithm statements allow p=2. The full dyadic motivic comparison has
  its separate normalization requirement in L3.
- On R⁺, ∂=(1+T)d/dT. A pole-cancelled smoothing transform is formed before
  formal inversion; separate inverses at the removed centre give a different
  power series.

The order is L0 → L1 → L2 → L3; numbered targets follow dependency order.
Source abbreviations resolve in the reference list.


## L0. Power series, residues and logarithm branches

Use Mathlib’s analytic and formal-series carriers. Termwise integration preserves the open convergence radius but can lose the closed boundary. Adjoin one logarithmic symbol to remove the annulus residue obstruction; then construct every branch on C_p from principal-unit logarithms. Whole-disc analyticity is stronger than local analyticity.

**L0.F. Rational coefficient series.** For k∈ℤ define q_k∈ℚ[[X]] by coeff_0=0 and coeff_n=n^(−k) for n≥1 (`rationalPolylogSeries`, `coeff_rationalPolylogSeries`). Native coefficient mapping gives its series over every characteristic-zero field (`map_rationalPolylogSeries_coeff`); mapping through any homomorphism of ℚ-algebras gives the same result (`map_rationalPolylogSeries_comp`). Prove Xq_k′=q_(k−1) (`X_mul_derivative_rationalPolylogSeries`), including k≤0; zero constant term and this Euler derivative characterize q_k (`rationalPolylogSeries_unique`). Prove q_0=X/(1−X) and q_1=−log(1−X) (`rationalPolylogSeries_zero_weight`, `rationalPolylogSeries_one_eq_neg_log`). Mathlib's `PowerSeries.log` represents log(1+X), so substitute −X before negating. Tests: coeff_0(q_1)=0, coeff_1(q_−2)=1, coeff_2(q_1)=1/2, coeff_3(q_1)=1/3, q_−1=X/(1−X)², and coeff_2(q_2) mapped to ℂ is 1/4. Use `PowerSeries.coeff_map`, `coeff_derivative`, coefficient extensionality and the formal logarithm API. Source: F §2, Remark 2.29, p.14 (depth-one rational series for integer weights); RJW §6.2, Remark 6.6, pp.38–39. The derivative and transport laws follow coefficientwise, without analytic convergence hypotheses.

**L0.1. Norms of integers in an ultrametric field of characteristic zero.** Let K be a nontrivially normed field whose norm is ultrametric (IsUltrametricDist) and whose characteristic is zero. Then ||(n : K)|| <= 1 for every natural number n, and exactly one of the following holds: (a) ||(n : K)|| = 1 for every n >= 1 (residue characteristic zero); (b) there is a unique prime p with ||(p : K)|| < 1, and then ||(n : K)|| = ||(p : K)||^(v_p(n)) for every n >= 1, where v_p = padicValNat p. Put s := 0 in case (a) and s := log(1/||p||)/log(p) in case (b). Then ||(n : K)||^(-1) <= n^s for every n >= 1. For K a complete subfield of C_p, normalised by |p| = 1/p, s = 1: |1/n| = p^(v_p(n)) <= n.

**Assumptions:** K is a field with a nontrivial ultrametric norm and CharZero K. No completeness is needed.

**From:** IsUltrametricDist, padicValNat, CharZero. **Sources:** [^1], [^2].

### L0.2. The normalised formal primitive of a power series

Let A be a commutative ring which is a Q-algebra. The normalised formal primitive is the A-linear map PowerSeries.primitive : A[[X]] -> A[[X]] with constant coefficient 0 and coeff (n+1) (primitive f) = (n+1)^(-1) * coeff n f for all n >= 0; that is, primitive (sum a_n X^n) = sum a_n X^(n+1)/(n+1). It is the unique power series with derivative f (Mathlib's PowerSeries.derivative) and constant coefficient zero (L0.3, L0.4).

**Assumptions:** A is a commutative ring with an algebra structure over Q (every positive integer is invertible in A). Without the Q-algebra hypothesis the construction is not available: over ZMod p the monomial X^(p-1) is not a derivative.

**Required API.**
- `PowerSeries.primitive`: For a commutative Q-algebra A, the A-linear map A[[X]] -> A[[X]], sum a_n X^n |-> sum a_n X^(n+1)/(n+1).
- `PowerSeries.coeff_zero_primitive`: coeff 0 (primitive f) = 0.
- `PowerSeries.coeff_succ_primitive`: coeff (n+1) (primitive f) = (n+1)^(-1) * coeff n f.
- `PowerSeries.derivative_primitive`: d/dX (primitive f) = f.
- `PowerSeries.primitive_derivative`: primitive (d/dX f) = f - C (constantCoeff f).
- `PowerSeries.primitive_X_pow`: primitive (X^n) = (n+1)^(-1) * X^(n+1).
- `PowerSeries.map_primitive`: For a morphism of Q-algebras g : A -> B, map g (primitive f) = primitive (map g f).
- `PowerSeries.primitive_eq_log`: primitive (mk fun n => (-1)^n) = PowerSeries.log A, Mathlib's formal log(1 + X).

**Tests.**
- primitive (1 : A[[X]]) = X.
- primitive (0 : A[[X]]) = 0.
- primitive (mk fun n => (-1 : A)^n) = PowerSeries.log A (Mathlib's formal logarithm of 1 + X).
- Over ZMod p there is no g with d/dX g = X^(p-1): the coefficient of X^(p-1) in d/dX g is p * coeff p g = 0. Hence the Q-algebra hypothesis cannot be dropped.

**From:** PowerSeries.derivative, PowerSeries.log. **Sources:** [^3], [^4].

**L0.3. The derivative of the normalised formal primitive in characteristic zero.** Let A be a commutative Q-algebra and f in A[[X]]. Then d/dX (primitive f) = f and primitive (d/dX f) = f - C(constantCoeff f), where d/dX is Mathlib's PowerSeries.derivative.

**Assumptions:** A is a commutative Q-algebra.

**From:** L0.2, PowerSeries.coeff_derivative, PowerSeries.derivative_log_mul_one_add_X. **Sources:** [^5].

**L0.4. Uniqueness of the formal primitive with given constant term.** Let A be a commutative Q-algebra, f in A[[X]] and c in A. A power series g satisfies d/dX g = f and constantCoeff g = c if and only if g = C c + primitive f.

**Assumptions:** A is a commutative Q-algebra (in particular additively torsion free).

**From:** L0.3, PowerSeries.derivative.ext. **Sources:** [^6].

### L0.5. Radius-loss estimate for termwise integration

For complete nontrivially normed ultrametric K of characteristic zero, R(primitive f)=R(f), using FormalMultilinearSeries.ofScalars K (coeff f). If f is restricted at ρ>0, its primitive is restricted at every 0<r<ρ, with Gauss bound ‖primitive f‖_r≤C(r,ρ)‖f‖_ρ, where C(r,ρ)=sup_n r^(n+1)‖1/(n+1)‖/ρ^n<∞. Restrictedness at ρ can fail (L0.6). Thus integration preserves open-disc analytic series and dagger series overconvergent at ρ, but need not preserve the closed-disc Tate algebra.

**Assumptions:** K complete, nontrivially normed, ultrametric, characteristic zero; in particular every complete subfield of C_p. rho > 0 is a real number; radii are compared in ENNReal as in Mathlib's FormalMultilinearSeries.radius.

**From:** L0.1, L0.2, FormalMultilinearSeries.radius, FormalMultilinearSeries.ofScalars, PowerSeries.IsRestricted, PowerSeries.gaussNorm. **Sources:** [^5], [^1].

**L0.6. Termwise integration fails on the closed disc.** Let K be a complete ultrametric field of characteristic zero with |p| < 1 for the prime p (for example any complete subfield of C_p). The series f := sum_{k>=0} p^k X^(p^k - 1) is restricted at 1 (it lies in the Tate algebra K<X>, since |p^k| -> 0), but primitive f = sum_{k>=0} X^(p^k) is not restricted at 1 and does not converge at X = 1. Hence d : K<X> -> K<X> dX is not surjective, whereas every f restricted at some rho > 1 (the dagger algebra) and every f analytic on the open unit disc has a primitive of the same kind (L0.5 (c)).

**Assumptions:** |p| < 1 in K.

**From:** L0.2, L0.4, PowerSeries.IsRestricted. **Sources:** [^5], [^1].

### L0.7. Analytic functions on an open disc

For complete nontrivially normed ultrametric K and 0<r≤∞, O_K(D⁻(a,r)) is the K-subalgebra of functions on Metric.eball a r represented by one HasFPowerSeriesOnBall series: f(z)=Σ c_n(z−a)^n, with ‖c_n‖ρ^n→0 for every ρ<r. For K=C_p, a=0, r=1 and coefficients in L, this is R⁺, the Amice target of LA1. Prove invariance under every centre a′∈D⁻(a,r), and the identity principle for vanishing on a nonempty open subset.

**Assumptions:** K complete, nontrivially normed, ultrametric; characteristic zero where primitives are used. r in (0, infinity] (ENNReal); r = infinity gives entire functions.

**Required API.**
- `discAnalytic`: discAnalytic K a r : Subalgebra K (Metric.eball a r -> K), the functions given on the ball by one convergent power series.
- `mem_discAnalytic_iff`: f is in discAnalytic K a r iff there is P with HasFPowerSeriesOnBall (extension of f) P a r.
- `discAnalytic.coeff`: The coefficient sequence of f at the centre a, unique by HasFPowerSeriesAt.eq_formalMultilinearSeries.
- `discAnalytic.deriv_mem`: f in discAnalytic implies deriv f in discAnalytic (termwise, same radius).
- `discAnalytic.recentre`: For a' in Metric.eball a r, discAnalytic K a r = discAnalytic K a' r (same ball, recentred series).
- `discAnalytic.restrict`: Restriction to D^-(b, r') for D^-(b, r') contained in D^-(a, r) maps discAnalytic K a r to discAnalytic K b r'.
- `discAnalytic.eq_zero_of_eqOn`: If f vanishes on a nonempty open subset of the ball then f = 0.
- `discAnalytic.equivRPlus`: For a = 0, r = 1 the coefficient map is an isomorphism onto the ring R^+ of LA1 (power series with |a_n| rho^n -> 0 for all rho < 1).
- `discAnalytic.ofIsRestricted`: A power series restricted at some rho > r (in particular an element of a dagger or Tate algebra at radius > r) defines an element.

**Tests.**
- For K = C_p, the function z |-> NormedSpace.logOneAdd K K z restricted to D^-(0, 1) lies in discAnalytic K 0 1, with coefficients (-1)^(n+1)/n.
- The indicator function of D^-(0, 1/p) on D^-(0, 1) in C_p is AnalyticOnNhd (locally constant) but is not in discAnalytic C_p 0 1.
- Constant functions lie in discAnalytic K a r for every r, including r = infinity.
- The geometric series z |-> sum z^n is in discAnalytic C_p 0 1 but its coefficient sequence is not PowerSeries.IsRestricted at 1 (not in the Tate algebra).

**From:** HasFPowerSeriesOnBall, Metric.ball, HasFPowerSeriesOnBall.fderiv, FormalMultilinearSeries.radius_le_radius_derivSeries, HasFPowerSeriesAt.eq_formalMultilinearSeries, AnalyticOnNhd, PowerSeries.IsRestricted, LA1, L0.1, Metric.eball. **Sources:** [^7], [^8], [^6].

### L0.8. The unique primitive with chosen base value on an open disc

Let K be a complete nontrivially normed ultrametric field of characteristic zero, a in K, r in (0, infinity], f in O_K(D^-(a, r)) (L0.7), b in D^-(a, r) and c in K. There is a unique F in O_K(D^-(a, r)) with F' = f and F(b) = c; explicitly F(z) = c + sum_n f_n (z - b)^(n+1)/(n+1) where f(z) = sum_n f_n (z - b)^n is the expansion at b. Uniqueness is among functions analytic on the whole disc; among locally analytic functions it fails (L0.9).

**Assumptions:** [^C1] b lies in the open disc D^-(a, r).

**From:** L0.7, L0.2, L0.3, L0.5, HasFPowerSeriesOnBall.fderiv, HasFPowerSeriesAt.eq_formalMultilinearSeries. **Sources:** [^6], [^4].

**L0.9. Locally analytic primitives are unique only up to locally constant functions.** On any nonempty open U⊆C_p, locally analytic functions with zero derivative are exactly the locally constant ones. Nonconstant examples exist, such as indicators of clopen discs. Given a locally analytic primitive F, all such primitives are F+LC(U), an infinite-dimensional affine space. A fixed value determines a whole-disc analytic primitive on D⁻(0,1) (L0.8), but does not determine a locally analytic primitive, including on P¹(C_p)∖{0,1,∞}.

**Assumptions:** U open in C_p, nonempty.

**From:** L0.7, L0.8, AnalyticOnNhd, IsLocallyConstant, LA1. **Sources:** [^9], [^10].

**L0.10. Convergence of the logarithm series on the open unit disc.** Let K be a complete nontrivially normed ultrametric field of characteristic zero (for example C_p or a finite extension of Q_p). The Tau Ceti series NormedSpace.logOneAddSeries K K has radius at least 1, the Tau Ceti function log(1 + u) := NormedSpace.logOneAdd K K u equals sum_{n>=1} (-1)^(n+1) u^n/n for ||u|| < 1, satisfies HasFPowerSeriesOnBall (logOneAdd K K) (logOneAddSeries K K) 0 1, and its derivative is 1/(1 + u) on the open unit disc. (Tau Ceti proves the radius bound only under ContinuousSMul Q>=0 K, which fails for p-adic fields; this lemma supplies the ultrametric case.)

**Assumptions:** K complete, nontrivially normed, ultrametric, CharZero.

**From:** L0.1, NormedSpace.logOneAdd, NormedSpace.logOneAddSeries, NormedSpace.hasFPowerSeriesOnBall_logOneAdd, FormalMultilinearSeries.radius, HasFPowerSeriesOnBall, PowerSeries.derivative_log_mul_one_add_X. **Sources:** [^11], [^12].

### L0.11. The residue of a differential on an annulus

Let K be a complete subfield of C_p, e in K a centre, 0 <= r < s <= infinity, and A = A(e; r, s) = {z in C_p : r < |z - e| < s} (around infinity use the coordinate 1/z). Let O_K(A) be the ring of Laurent series f = sum_{n in Z} a_n (z - e)^n, a_n in K, with |a_n| rho^n -> 0 as |n| -> infinity for every rho in (r, s), as functions on A(C_p) (the carrier constructed in PH-P7). For a differential omega = f dz with f in O_K(A), res_A(omega) := a_(-1). The same definition applies to the germ ring R_e = colim_{r -> 1} O_K(A(e; r, 1)) of the end of a residue disc, the only case in which A is not a full punctured disc.

**Assumptions:** K complete subfield of C_p (or any complete ultrametric field of characteristic zero). 0 <= r < s <= infinity; the residue is taken with respect to the coordinate z - e, oriented so that |z - e| increases outwards.

**Required API.**
- `annulusResidue`: annulusResidue A : (O_K(A) dz) ->L[K] K, f dz |-> a_(-1).
- `annulusResidue_d`: annulusResidue A (d g) = 0 for g in O_K(A).
- `annulusResidue_dz_div`: annulusResidue A (dz/(z - e)) = 1 and annulusResidue A ((z - e)^n dz) = 0 for n != -1.
- `annulusResidue_coord`: Invariance under orientation-preserving automorphisms t = u (z - e)(1 + h) of A with |u| = 1, |h| < 1.
- `annulusResidue_inv`: Under t = 1/(z - e) the residue changes sign.
- `annulusResidue_restrict`: Compatible with restriction to a sub-annulus A(e; r', s') with r <= r' < s' <= s and with passage to the end germ ring R_e.
- `annulusResidue_laurentSeries`: For r = 0 and f meromorphic at e (finitely many negative powers) the residue is the coefficient of X^(-1) of the corresponding Mathlib LaurentSeries.

**Tests.**
- On A(0; r, s), annulusResidue (dz/z) = 1 and annulusResidue (z^2 dz) = 0.
- Pulling dz/z back along z = 1/w gives -dw/w, whose residue in w is -1.
- annulusResidue A 0 = 0, and on a full disc (no negative powers) every residue is 0.
- For |c - e| >= s the form dz/(z - c) is analytic on A with residue 0, although as a rational form it has a pole with residue 1: the residue on A is not the algebraic residue at a chosen point.

**From:** PH-P7, LaurentSeries, IsUltrametricDist, L0.10. **Sources:** [^13], [^6].

### L0.12. A differential on an annulus is exact exactly when its residue vanishes

Let K be a complete subfield of C_p (or any complete ultrametric field of characteristic zero), A = A(e; r, s) an open annulus, and omega = f dz with f = sum a_n (z - e)^n in O_K(A). There is g in O_K(A) with dg = omega if and only if res_A(omega) = 0; in that case g = sum_{n != -1} a_n (z - e)^(n+1)/(n+1) + const, and g is unique up to an additive constant because ker(d on O_K(A)) = K.

**Assumptions:** [^C1] A an open annulus or the end germ of a residue disc.

**From:** L0.11, L0.1, L0.5, PH-P7. **Sources:** [^14], [^6].

**L0.13. The logarithm series is a homomorphism on principal units.** Let K be as in L0.10. For ||u|| < 1 and ||v|| < 1, log(1 + u) + log(1 + v) = log((1 + u)(1 + v)) (note ||u + v + uv|| < 1). Hence u |-> log(1 + u) is a continuous group homomorphism from the principal units 1 + m_K to (K, +), and it vanishes at every root of unity lying in 1 + m_K.

**Assumptions:** [^C1]

**From:** L0.10, L0.8. **Sources:** [^15].

**L0.14. Every element of C_p^x has a power that is p^m times a principal unit.** For every x in C_p^x there are integers N >= 1 and m such that ||x^N p^(-m) - 1|| < 1. For every such pair, m/N = v_p(x) := -log_p ||x||, so v_p(x) lies in Q and ||C_p^x|| = p^Q. The same holds in every complete subfield K of C_p that is finite over Q_p, with x^N p^(-m) in 1 + m_K.

**Assumptions:** C_p is Mathlib's PadicComplex p; its norm restricts to |p| = 1/p.

**From:** PadicComplex, PadicAlgCl, spectralNorm, PadicComplexInt, Real.logb, PH-P7. **Sources:** [^12].

### L0.15. The branches log_a of the p-adic logarithm

Fix a prime p and a in C_p. The branch log_a : C_p^x -> C_p is defined by log_a(x) := (log(x^N p^(-m)) + m a)/N for any N >= 1 and m in Z with x^N p^(-m) in 1 + m_{C_p} (L0.14), where log is the series of L0.10. It is independent of the pair (N, m), a group homomorphism (C_p^x, *) -> (C_p, +), equal to the series on 1 + m_{C_p}, with log_a(p) = a; and it is the unique homomorphism with these last two properties. It vanishes at all roots of unity, satisfies log_a(-x) = log_a(x), and is locally analytic with d log_a = dz/z (L0.19). The Iwasawa branch is log_p := log_0 (L0.18).

**Assumptions:** p prime; a in C_p. As a Lean function on all of C_p the value at 0 is the junk value 0.

**Required API.**
- `padicLogBranch`: padicLogBranch p a : C_p -> C_p, the branch log_a (value 0 at 0).
- `padicLogBranch_mul`: For x, y != 0, log_a(x y) = log_a(x) + log_a(y).
- `padicLogBranch_p`: log_a(p) = a.
- `padicLogBranch_one_add`: For ||u|| < 1, log_a(1 + u) = NormedSpace.logOneAdd C_p C_p u (Tau Ceti's series).
- `padicLogBranch_pow`: log_a(x^n) = n log_a(x) and log_a(x^(-1)) = -log_a(x).
- `padicLogBranch_rootOfUnity`: If zeta^m = 1 with m >= 1 then log_a(zeta) = 0; in particular log_a(-x) = log_a(x).
- `padicLogBranch_unique`: A group homomorphism C_p^x -> C_p that agrees with the series on 1 + m and sends p to a equals log_a.
- `padicLogBranch_sub`: log_b(x) - log_a(x) = (b - a) v_p(x).
- `padicLogBranch_hasDerivAt`: For x != 0, log_a has derivative 1/x at x and is given on D^-(x, |x|) by one power series.
- `padicLogBranch_map`: For a continuous field automorphism sigma of C_p, log_(sigma a)(sigma x) = sigma(log_a x) (L0.17).

**Tests.**
- padicLogBranch p a p = a and padicLogBranch p a 1 = 0.
- For p = 3 and every a: log_a(4) = 3 + 2*3^2 + 3^3 + 2*3^5 + 2*3^6 + 3^8 + 2*3^10 + 3^11 modulo 3^12 (PARI/GP).
- For p = 5 and zeta in Q_5 with zeta^4 = 1 and zeta = 2 mod 5: log_a(zeta) = 0; and log_a(-2) = log_a(16)/4.
- On the open ball of radius 1 around 1 the branch equals Tau Ceti's NormedSpace.logOneAdd composed with u |-> 1 + u.
- The series sum (-1)^(n+1) (x - 1)^n/n diverges at x = p, so no branch is given by one power series on C_p^x.

**From:** L0.10, L0.13, L0.14, NormedSpace.logOneAdd, PadicComplex. **Sources:** [^12], [^15], [^16].

**L0.16. Changing the branch of the logarithm.** For a, b in C_p and x in C_p^x: log_b(x) - log_a(x) = (b - a) v_p(x), where v_p(x) = -log_p ||x|| in Q. In particular all branches agree on the units O_{C_p}^x (and on 1 + m_{C_p}), and log_a = log_p + a v_p with log_p the Iwasawa branch.

**Assumptions:** a, b in C_p; x != 0.

**From:** L0.15, L0.14, Real.logb. **Sources:** [^17], [^18].

**L0.17. Compatibility of the branches with automorphisms and finite extensions.** (a) For every continuous field automorphism sigma of C_p, every a in C_p and x in C_p^x: log_(sigma(a))(sigma(x)) = sigma(log_a(x)); in particular the Iwasawa branch commutes with every such sigma. (b) For a finite extension K of Q_p inside C_p and a in K, log_a(K^x) is contained in K, and log_a restricted to K^x is the unique homomorphism K^x -> K that agrees with the series on 1 + m_K and sends p to a. (c) Hence the logarithms of all finite (algebraic) extensions of Q_p obtained this way are compatible under inclusion: the restriction of log_a from L^x to K^x is log_a of K for K inside L.

**Assumptions:** a in C_p; for (b) and (c), K and L are finite over Q_p inside C_p and a lies in K.

**From:** L0.15, L0.14, L0.10. **Sources:** [^19].

### L0.18. The Iwasawa logarithm log_p

The Iwasawa branch of the p-adic logarithm is log_p := log_0 (L0.15): the unique group homomorphism C_p^x -> C_p that is the series log(1 + u) on 1 + m_{C_p} and satisfies log_p(p) = 0. It is equivariant under every continuous field automorphism of C_p, maps K^x into K for every finite extension K of Q_p inside C_p, and log_a = log_p + a v_p. This is the branch used for every statement about L-values in ColemanIntegration:L3 and imported by DP3.

**Assumptions:** p prime.

**Required API.**
- `iwasawaLog`: iwasawaLog p := padicLogBranch p 0.
- `iwasawaLog_p`: iwasawaLog p p = 0.
- `padicLogBranch_eq_iwasawaLog_add`: padicLogBranch p a x = iwasawaLog p x + a * v_p(x) for x != 0.
- `iwasawaLog_map`: iwasawaLog p (sigma x) = sigma (iwasawaLog p x) for every continuous field automorphism sigma of C_p.
- `iwasawaLog_mem_of_finite`: For K a finite extension of Q_p inside C_p and x in K^x, iwasawaLog p x lies in K.
- `iwasawaLog_of_unit`: On units of O_{C_p} the Iwasawa logarithm agrees with every branch.

**Tests.**
- iwasawaLog p (p^k) = 0 for all k.
- In Q_3: iwasawaLog 3 63 = iwasawaLog 3 7.
- iwasawaLog commutes with every continuous Q_p-automorphism sigma of C_p. If sigma(a) != a, then log_a does not commute with sigma, as evaluation at p shows. An algebraic a with a nontrivial conjugate gives a discriminating example; no assertion about the fixed field of all automorphisms is needed.
- padicLogBranch p 1 agrees with iwasawaLog on units but padicLogBranch p 1 p = 1 != 0.

**From:** L0.15, L0.16, L0.17. **Sources:** [^19], [^12].

**L0.19. Local expansion of log_a and its derivative.** For x_0 in C_p^x and z in D^-(x_0, |x_0|) (so |z| = |x_0|): log_a(z) = log_a(x_0) + log(1 + (z - x_0)/x_0), with log the series of L0.10. Hence the restriction of log_a to D^-(x_0, |x_0|) lies in O(D^-(x_0, |x_0|)) (L0.7) with derivative 1/z; log_a is locally analytic on C_p^x with d log_a = dz/z. Every open disc in C_p^x lies in a sphere |z| = const, so log_a is analytic on every such disc; its failure to be a single analytic function shows only on annuli (L0.21).

**Assumptions:** a in C_p, x_0 != 0.

**From:** L0.15, L0.13, L0.7, L0.10. **Sources:** [^12], [^13].

### L0.20. Functions with logarithmic terms on an annulus

Let A = A(e; r, s) be an open annulus (or the end germ R_e of a residue disc) over a complete subfield K of C_p and a in C_p a branch. The logarithmic function ring is the polynomial ring O_K(A)[l] in one indeterminate l, with the derivation d extending d on O_K(A) by dl = dz/(z - e); it is realised on points by the ring homomorphism rho_a : O_K(A)[l] -> (A(C_p) -> C_p), sum f_k l^k |-> (z |-> sum f_k(z) log_a(z - e)^k), which commutes with d (L0.19) and is injective (L0.21). This is A_log(U_x) of Besser and A^a_log(U_x) of Furusho at an end; it does not depend on the local parameter (a change t = u (z - e)(1 + h) with |u| = 1 replaces l by l + log_a(u) + log(1 + h), an element of O(A)).

**Assumptions:** K complete subfield of C_p; a in C_p. A an open annulus A(e; r, s) with 0 ≤ r < s, or the end germ colim_{r -> 1} O(A(e; r, 1)). For change of parameter, u is in K with ||u||=1 and h has coefficients in K with ||h||<1 on a suitable sub-annulus. Since u is a unit, log_a(u)=log_p(u) lies in K by L0.17.

**Required API.**
- `AnnulusLogRing`: The ring O_K(A)[l] with its derivation d, dl = dz/(z - e).
- `AnnulusLogRing.d_ell_pow`: d (l^k) = k l^(k-1) dz/(z - e).
- `AnnulusLogRing.realize`: The ring homomorphism rho_a to functions on A(C_p), l |-> log_a(z - e).
- `AnnulusLogRing.realize_injective`: rho_a is injective (L0.21).
- `AnnulusLogRing.realize_d`: rho_a commutes with d: the derivative of rho_a(F) is rho_a(dF/dz).
- `AnnulusLogRing.changeParam`: For t = u (z - e)(1 + h), |u| = 1, |h| < 1, the substitution l |-> l + log_a(u) + log(1 + h) is an isomorphism compatible with d and rho_a.
- `AnnulusLogRing.realize_branch`: rho_b(F) = rho_a(F with l replaced by l + (b - a) v_p(z - e)) as functions (L0.23).
- `AnnulusLogRing.restrict`: Restriction to sub-annuli and to the end germ.

**Tests.**
- d l = dz/(z - e), and rho_a(l)(e + p) = a when r < 1/p < s.
- On polynomials of degree 0 in l, rho_a is the inclusion of O_K(A) as functions.
- rho_a(l) = log_a(z - e) is not rho_a of any element of O_K(A): dz/(z - e) has residue 1 (L0.12).
- rho_b(l)-rho_a(l)=(b-a)v_p(z-e). It is locally constant, and for a!=b it is nonconstant on A(0;p^(-2),1), which contains circles of two different valuations.

**From:** L0.11, L0.15, L0.19, L0.10, PH-P7, L0.17. **Sources:** [^6], [^12].

**L0.21. The logarithm is transcendental over functions on an annulus.** Let A = A(e; r, s) with 0 ≤ r < s and a in C_p. If f_0, ..., f_n in O_K(A) satisfy sum_k f_k(z) log_a(z - e)^k = 0 for all z in A(C_p), then all f_k = 0. Equivalently the realisation rho_a of L0.20 is injective.

**Assumptions:** 0 ≤ r < s, so that A contains circles of more than one radius; K complete subfield of C_p.

**From:** L0.12, L0.20, L0.19, PH-P7. **Sources:** [^12].

### L0.22. Logarithmic primitives on an annulus

Let A be an open annulus (or end germ) over a complete subfield K of C_p. The derivation d : O_K(A)[l] -> O_K(A)[l] dz of L0.20 is surjective with kernel K. For f = sum a_n (z - e)^n the primitive of f dz is res_A(f dz) l + sum_{n != -1} a_n (z - e)^(n+1)/(n+1) (the log-branch term appears exactly when the residue is nonzero); in general a primitive of f l^k dz is computed by integration by parts: writing f dz = c dz/(z - e) + dg (L0.12), one has integral of f l^k dz = c l^(k+1)/(k+1) + g l^k - k (integral of g l^(k-1) dz/(z - e)). Realised with a branch a, the definite integral between P and Q in A is Balakrishnan-Bradshaw-Kedlaya's formula a_(-1) log_a((Q - e)/(P - e)) + sum_{n != -1} a_n ((Q-e)^(n+1) - (P-e)^(n+1))/(n+1).

**Assumptions:** K complete subfield of C_p; A an open annulus or end germ; a a branch for the realisation.

**From:** L0.12, L0.20, L0.21, L0.11. **Sources:** [^6], [^13].

**L0.23. How a change of branch changes logarithmic primitives.** For F=sum f_k l^k in O_K(A)[l], rho_b(F)(z)=sum f_k(z)(log_a(z-e)+(b-a)v_p(z-e))^k. Choose for f dt the coefficient primitive with constant coefficient0 and logarithmic coefficient res_A(f dt), using the same additive normalization in both branches. Its branch difference is res_A(f dt)(b-a)v_p(z-e), constant on each circle. It is nonconstant when res_A(f dt)(b-a)!=0 and the annulus contains two different radii in p^Q. A zero-residue differential has branch-independent primitives under this common normalization; arbitrary primitives can also differ by constants.

**Assumptions:** a, b in C_p.

**From:** L0.16, L0.20, L0.22. **Sources:** [^18], [^17].

**L0.24. A logarithm bound on a geometric sequence.** For c≠0 and every natural m, |L(c p^m)|≤max(|L(c)|,|a|).

**Assumptions:** [^C2] [^C3] c∈C_p is nonzero.

**Tests.**
- At p=2 and branch parameter a=1, |L(2^m)|≤1 for every natural m.

**From:** L0.15, IsUltrametricDist.norm_natCast_le_one, PadicComplex.isNonarchimedean. **Sources:** [^20].

**L0.25. Logarithm of a geometric quotient.** For c≠0 and every n, L(c q_n/(1+q_n))=L(c)+(n+1)a−L(1+q_n).

**Assumptions:** [^C2] [^C3] c∈C_p is nonzero.

**From:** L0.15, Padic.norm_p_lt_one, PadicComplex.norm_extends'. **Sources:** [^20].

## L1. Frobenius continuation and Coleman functions

Construct the shuffle word algebra, its local solutions and its Frobenius realization from a good-reduction datum. The punctured-line instances supply explicit cohomology bases and arithmetic q-power lifts. The general-curve existence, scalar extension, meromorphic pole removal and Taylor-gluing inputs must be supplied with the hypotheses stated below; the genus-zero calculation does not prove those general statements.

### L1.1. A curve with good reduction and an etale divisor

Fix finite K/Q_p⊆C_p, with integers O_K, uniformizer π and residue field F_q. A good-reduction pair is a smooth proper geometrically connected relative curve X/O_K together with nonempty finite étale D⊆X. Set Y=X∖D, an affine O_K-scheme. Distinct geometric points of D have distinct reductions; over O_Cp they correspond to D_k(F̄_p). This gives Furusho's good-reduction hypothesis and Besser's tight triple. Scope requires descent to finite K; unipotence is imposed on the connections, rather than on X.

**Assumptions:** K finite over Q_p, contained in C_p; k = F_q. X -> Spec O_K smooth, proper, relative dimension 1, geometrically connected fibres. D a nonempty closed subscheme of X, finite etale over O_K; Y = X - D.

**Required API.**
- `GoodReductionPair`: The data (X, D) over O_K with the smoothness, properness, relative dimension, geometric connectedness and finite etaleness hypotheses as fields.
- `GoodReductionPair.affineComplement`: Y = X - D, with IsAffine Y.
- `GoodReductionPair.residueClasses`: The set X_k(F_p-bar) of residue classes, with the ends D_k(F_p-bar) marked.
- `GoodReductionPair.frobenius`: The q-power Frobenius F on X_k(F_p-bar): a bijection with finite orbits, preserving D_k.
- `GoodReductionPair.baseChange`: Base change along a finite extension K -> K' inside C_p gives a good-reduction pair over O_K'.
- `GoodReductionPair.puncturedLine`: (P^1, {0, infinity} u mu_N) over Z_p[mu_N] for p not dividing N (L1.25).
- `GoodReductionPair.D_reduction_injective`: Reduction D(O_Cp) -> D_k(F_p-bar) is a bijection.

**Tests.**
- (P^1_{Z_p}, {0, 1, infinity}) is a good-reduction pair for every prime p, with residue classes P^1(F_p-bar) and ends 0, 1, infinity.
- (P^1_{Z_p}, V(z(z - p))) is not a good-reduction pair: D is not etale over Z_p.
- (P^1, {0, infinity} u mu_p) over Z_p[mu_p] is not a good-reduction pair: all p-th roots of unity reduce to 1.
- (P^1_{Z_p}, {infinity}) is a good-reduction pair with Y = A^1, one end and no residue class of D other than infinity.

**From:** AlgebraicGeometry.Scheme, AlgebraicGeometry.Smooth, AlgebraicGeometry.IsProper, AlgebraicGeometry.IsFinite, AlgebraicGeometry.Etale, AlgebraicGeometry.IsAffine. **Sources:** [^21], [^22], [^23].

### L1.2. Wide open neighbourhoods and the dagger algebra

For a good-reduction pair, X_an is the generic fibre of its formal completion, with specialization sp. Write ]x[=sp⁻¹(x) and ]Y_k[=sp⁻¹(Y_k). Choose an integral parameter t_e at each section e∈D. For 0<r<1 in |C_p^×|, set W_r=X_an∖⋃_e{|t_e|≤r} inside the end discs. These connected wide opens are cofinal strict neighborhoods of ]Y_k[, independently of parameters up to cofinality. Define A⁺(Y)=colim_(r→1)O(W_r) and Ω⁺(Y)=colim_r Ω¹(W_r); identify A⁺ with the Monsky–Washnitzer weak completion of O(Y) tensored with K. AS-F1 supplies these carriers; AS-R2 supplies fibres and tubes.

**Assumptions:** (X, D) a good-reduction pair; r ranges over |C_p^x| intersected with (0, 1).

**Required API.**
- `wideOpen`: wideOpen (X, D) r : the basic wide open W_r, an admissible open of X_an.
- `daggerAlgebra`: A+(Y) = colim_r O(W_r), the dagger algebra (carrier from AS-F1).
- `daggerDifferentials`: Omega+(Y) = colim_r Omega^1(W_r), a projective A+(Y)-module of rank one with the derivation d.
- `mem_tube_iff`: x lies in ]Y_k[ iff sp(x) is in Y_k.
- `wideOpen_anti`: r <= r' implies W_r' is contained in W_r; the W_r are cofinal among strict neighbourhoods.
- `wideOpen_param_indep`: Changing the local parameters t_e changes the system (W_r) by a cofinal one and does not change A+(Y).
- `daggerAlgebra_eq_weakCompletion`: A+(Y) is the Monsky-Washnitzer weak completion of O(Y) tensored with K (Balakrishnan-Bradshaw-Kedlaya Definition 7 for hyperelliptic curves).
- `daggerAlgebra_restrict`: Restriction maps A+(Y) -> O(]x[) for x in Y_k and to the end germs at points of D (L1.3).
- `daggerAlgebra_identity`: An element of A+(Y) or Omega+(Y) whose restriction to one residue disc of ]Y_k[ vanishes is zero (identity principle on the connected W_r; imported from AS-F1).

**Tests.**
- For (P^1, {0, 1, infinity}) with the standard parameters, wideOpen r = {z : r < |z| < 1/r, |z - 1| > r}.
- For (P^1, {infinity}), wideOpen r = D^-(0, 1/r) and the dagger algebra is the ring of power series restricted at some rho > 1.
- The tube ]A^1_k[ = D(0, 1) is not a wide open: its ring of functions, the Tate algebra, has non-exact differentials (L0.6), while every differential on the dagger algebra of A^1 is exact (L0.5).

**From:** L1.1, AS-F1, AS-R2, L0.6, L0.5. **Sources:** [^6], [^24], [^12].

**L1.3. Residue discs are open discs and ends are annuli.** An integral parameter at a lift of x identifies ]x[ with D⁻(0,1); at e∈D it identifies ]e[∩W_r with A(0;r,1). Changes of parameter have t′=v+ut+Σ_(j≥2)a_jt^j, |v|<1, |u|=1, |a_j|≤1. If both vanish at the same section, v=0 and t′=ut(1+h), |h|<1. Construct differential-compatible restrictions res_x:A⁺→O(D⁻(0,1)) and res_e:A⁺→R_e. Parameter changes preserve these rings, residues and logarithmic end rings.

**Assumptions:** (X, D) a good-reduction pair; x a point of X_k(F_p-bar).

**From:** L1.1, L1.2, AS-R2, L0.7, L0.11, L0.20. **Sources:** [^22], [^6], [^25], [^26].

### L1.4. Locally analytic functions with logarithmic ends

For branch a, define A_loc^a(Y)=∏_(x∈X_k(F̄_p))A_log^a(x), with O(]x[) at ordinary points and R_e[l_e] at ends, realizing l_e as log_a(t_e). Set Ω_loc^a=∏_x A_log^a(x)dt_x and differentiate componentwise. Restrictions embed A⁺ diagonally; ker d=∏_x C_p. The branch-change isomorphism ι_(a,b) is the identity on ordinary components and changes end logarithm realizations from log_a to log_b. Prove independence of local parameters.

**Assumptions:** (X, D) a good-reduction pair; a in C_p.

**Required API.**
- `LocAn`: LocAn (X, D) a : the C_p-algebra A_loc^a(Y), product of the local rings.
- `LocAn.d`: The componentwise derivation A_loc^a -> Omega_loc^a.
- `LocAn.ker_d`: ker d = LC, the functions constant on each residue class and each end.
- `LocAn.d_surjective`: d is surjective componentwise (L0 primitives).
- `LocAn.ofDagger`: The injective K-algebra map A+(Y) -> A_loc^a(Y) by restriction.
- `LocAn.eval`: Evaluation at points of ]Y_k[(C_p).
- `LocAn.iotaBranch`: iota_(a,b) : A_loc^a -> A_loc^b, identity on residue discs of Y_k, l_e realised with log_b instead of log_a.
- `LocAn.paramIndep`: Changing local parameters induces the identity of A_loc^a (Furusho Lemma 2.2).

**Tests.**
- ker(d on LocAn) equals the locally constant functions.
- For (P^1, {0, 1, infinity}), the family (log_a z on each residue disc, l_0 at the end 0, l_inf with sign at infinity, log_a z on the end at 1 as an element of R_1) lies in LocAn with d = dz/z.
- For (P^1, {infinity}): LocAn is the product of O(]x[) over x in F_p-bar and R_inf[l_inf].
- iota_(a,b) is the identity on the image of A+(Y) and on every component at a residue disc of Y_k.

**From:** L1.1, L1.2, L1.3, L0.7, L0.20, L0.8, L0.22, L0.15. **Sources:** [^6], [^27], [^28].

### L1.5. Frobenius lifts on a wide open

For residue field F_q, a Frobenius lift is a K-algebra endomorphism φ:A⁺→A⁺ preserving the integral weak completion S and reducing to q-power Frobenius; on S use AlgHom.IsArithFrobAt at πS. Extend by φ*(g dh)=φ(g)dφ(h), and by componentwise composition to A_loc. At an end, φ*t_(F(e))=ut_e^q(1+h), |h|<1 near the boundary, so φ*l_(F(e))=ql_e+log_a(u)+log(1+h); u is a unit constant, making its logarithm branch independent. RD0 supplies existence and homotopy of lifts.

**Assumptions:** (X, D) a good-reduction pair; q = #k. phi is K-linear (the q-power Frobenius of Y_k is k-linear).

**Required API.**
- `FrobeniusLift`: A K-algebra endomorphism phi of A+(Y) preserving the integral weak completion S with AlgHom.IsArithFrobAt phi (pi S).
- `FrobeniusLift.isArithFrobAt`: The defining condition is Mathlib's AlgHom.IsArithFrobAt at the ideal pi S.
- `FrobeniusLift.mapsTo`: phi maps ]x[ into ]F(x)[ for every x in X_k(F_p-bar), and ends into ends.
- `FrobeniusLift.pullback`: The induced ring endomorphism phi^* of A_loc^a, commuting with d.
- `FrobeniusLift.pullback_ell`: phi^* l_(F(e)) = q l_e + c_e + log(1 + h_e) with c_e = log_a(u_e) a branch-independent constant and log(1 + h_e) in R_e.
- `FrobeniusLift.pow`: For m>=1, phi^m preserves the integral weak completion and satisfies phi^m(x)-x^(q^m) in pi S. It is an iterated-exponent datum; when m>1 it is not AlgHom.IsArithFrobAt at the original ideal with the original base-ring cardinality.
- `FrobeniusLift.exists`: Every good-reduction pair admits a Frobenius lift (imported from RD0).
- `FrobeniusLift.close`: Two lifts phi, phi' satisfy |phi'(g) - phi(g)| <= |pi| |g| on the integral algebra (the input of L1.21).

**Tests.**
- On (P^1, {0, 1, infinity}) over Z_p, z |-> z^p defines a Frobenius lift.
- For zeta a p-power root of unity, z |-> zeta^(-1) z^p is another Frobenius lift of the same curve over Z_p[zeta] (it reduces to z^p), not commuting with z |-> z^p.
- z |-> p z and z |-> z^p + 1 are not Frobenius lifts of P^1 minus {0, 1, infinity}: their reductions are not the p-power map.
- The fixed points of (z |-> z^p)^m on the residue discs of U = P^1 minus {0, 1, infinity} are the roots of unity of order dividing p^m - 1 other than 1.

**From:** L1.1, L1.2, L1.4, L0.15, L0.16, AlgHom.IsArithFrobAt, RD0, AS-F1. **Sources:** [^29], [^6], [^30].

**L1.6. Teichmueller points of residue discs.** Let phi be a Frobenius lift on a good-reduction pair (X, D) over O_K with residue field F_q, and x in Y_k(F_(q^m)). Then phi^m maps ]x[ into itself and has a unique fixed point b_x in ]x[, the Teichmueller point of ]x[ (for phi); phi(b_x) = b_(F(x)). For P^1 minus {0, 1, infinity} and phi(z) = z^p the Teichmueller point of ]x[ is the Teichmueller lift of x, a root of unity of order prime to p.

**Assumptions:** x has coordinates in F_(q^m).

**From:** L1.5, L1.3. **Sources:** [^31], [^32], [^33].

### L1.7. Frobenius-structured unipotent datum

A Frobenius datum is (φ,ω_1,…,ω_r,M,g), with φ*ω_i=Σ_j M_ijω_j+dg_i, M∈M_r(K), g∈(A⁺)^r. Require H0:ker(d:A⁺→Ω⁺)=K; H1:η=dh+Σ_i c_iω_i with c unique and h unique modulo K; Hi:restriction of functions and differentials to every ordinary disc is injective; Hw:for n,m≥1, (M^(⊗n))^m has no eigenvalue 1, equivalently no nonempty eigenvalue product is a root of unity. L1.6 supplies general existence; L1.28 gives the punctured-line datum.

**Assumptions:** (X, D) a good-reduction pair over O_K; phi K-linear. (H0), (H1) and (Hi) are required after coefficient extension to C_p whenever U and its realization are extended to C_p. For a geometrically connected smooth curve this is part of the coefficient-base-change input, not a consequence of an arbitrary algebraic datum over K.

**Required API.**
- `FrobeniusDatum`: The tuple (phi, omega, M, g) with the hypotheses (H0), (H1), (Hi), (Hw) as hypotheses of the constructions that use them.
- `FrobeniusDatum.coords`: The K-linear map Omega+ -> K^r, eta |-> c with eta - sum c_i omega_i exact (by H1).
- `FrobeniusDatum.frobenius_eq`: phi^* omega = M omega + d g.
- `FrobeniusDatum.coords_frobenius`: coords (phi^* eta) = M^T coords eta (the Frobenius on H^1_dR+).
- `FrobeniusDatum.changeBasis`: For P in GL_r(K), (phi, P omega, P M P^(-1), P g) is again a datum.
- `FrobeniusDatum.pow`: For m>=1, (phi^m,omega,M^m,g_m) is the algebraic datum for the q^m-power map. This changes the exponent parameter; it does not assert IsArithFrobAt at the original q for m>1.
- `FrobeniusDatum.noRootOfUnity`: (Hw) holds iff no product of n >= 1 eigenvalues of M in an algebraic closure is a root of unity.

**Tests.**
- For (P^1, {0, 1, infinity}), omega = (dz/z, dz/(z - 1)), phi(z) = z^p: M = p times the identity and g = (0, log u) with u = (z^p - 1)/(z - 1)^p.
- The tuple with phi = identity on A+(G_m) (not a Frobenius lift) and M = 1 violates (Hw); for it the constant in the primitive of dz/z cannot be fixed.
- For (P^1, {infinity}) the datum has r = 0: H^1_dR+ = 0 and every differential is exact.
- Replacing (dz/z, dz/(z - 1)) by (dz/z, dz/(z(z - 1))) gives M' = P (p I) P^(-1) = p I again.

**From:** L1.2, L1.5, Module.End.HasEigenvalue, Derivation, Module.Free. **Sources:** [^34], [^6].

**L1.8. Products of Weil numbers of positive weight are not roots of unity.** Let q be a power of p and lambda_1, ..., lambda_n algebraic numbers such that for every embedding into C, |lambda_i| = q^(w_i/2) with w_i >= 1. Then for every m >= 1, (lambda_1 ... lambda_n)^m != 1. Consequently if M is a matrix whose eigenvalues are Weil q-numbers of weights 1 and 2, then (M^(tensor n))^m has no eigenvalue 1 for n, m >= 1, i.e. hypothesis (Hw) of L1.7 holds.

**Assumptions:** The lambda_i are Weil q-numbers of positive weight.

**From:** Module.End.HasEigenvalue, LinearMap.charpoly. **Sources:** [^35], [^36].

### L1.9. Every good-reduction pair carries a Frobenius datum

Let (X, D) be a good-reduction pair over O_K (K finite over Q_p, residue field F_q). Then (X, D) carries a Frobenius-structured datum (L1.7): a Frobenius lift phi exists; H^1_dR+(Y) = Omega+(Y)/dA+(Y), which is the Monsky-Washnitzer (rigid) cohomology H^1_rig(Y_k/K), is finite dimensional, of dimension 2g + #D(K-bar) - 1 with a basis of algebraic differentials on Y_K, and its Frobenius does not depend on the lift; ker d = K on A+(Y); the identity principle (Hi) holds on the connected wide opens; and the eigenvalues of the K-linear Frobenius are Weil q-numbers of weights 1 (from H^1 of X_k) and 2 (from the residues along D), so (Hw) holds by L1.8. All inputs except the last step are imported; the comparison with algebraic de Rham cohomology and the dimension formula are a separate proof obligation.

**Assumptions:** (X, D) a good-reduction pair over O_K with K finite over Q_p.

**From:** L1.1, L1.2, L1.5, L1.7, L1.8, RD0, RD4, RD5, RD6, AS-F1. **Sources:** [^37], [^35], [^38].

**L1.10. Solving Frobenius equations along finite orbits.** Let S be a set with a bijection F : S -> S all of whose orbits are finite, V a finite-dimensional vector space over a field L, and T in End_L(V) such that T^m - 1 is invertible for every m >= 1. Then for every e : S -> V there is a unique c : S -> V with c(F(s)) = T(c(s)) + e(s) for all s in S. On the orbit of s of length m it is c(s) = (1 - T^m)^(-1) sum_{j=0}^{m-1} T^(m-1-j) e(F^j(s)). Semilinear form (Besser's Lemma 1): if sigma is an automorphism of L of finite order r and M is a matrix with 1 - sigma^(r-1)(M) ... sigma(M) M invertible, then x |-> sigma(x) - M x is bijective on L^n.

**Assumptions:** F bijective with finite orbits (for S = X_k(F_p-bar) every point is defined over a finite field). No eigenvalue of T in an algebraic closure is a root of unity.

**From:** Function.IsPeriodicPt, Function.minimalPeriod, Module.End.HasEigenvalue, RD0. **Sources:** [^39], [^40].

### L1.11. Dwork's principle of continuation along Frobenius

Let (phi, omega, M, g) be a Frobenius-structured datum on (X, D), a a branch, N >= 1 and T in M_N(K) such that T^m - 1 is invertible for all m >= 1. (a) Uniqueness: if G in (A_loc^a)^N satisfies dG = 0 and phi^* G - T G is a constant vector C in C_p^N, then G is constant, G = (1 - T)^(-1) C. (b) Existence: for G_0 in (A_loc^a)^N and R in (A_loc^a)^N with d(phi^* G_0 - T G_0 - R) = 0 there is a unique locally constant c in LC^N with phi^*(G_0 + c) - T (G_0 + c) = R. (c) Polynomial form (Coleman): if G in A_loc^a has dG = 0 and P(phi^*) G is constant for a polynomial P in K[t] with no root of unity among its roots, then G is constant.

**Assumptions:** The datum's Frobenius lift phi; T without root-of-unity eigenvalues.

**From:** L1.7, L1.10, L1.5, L1.4, L1.1. **Sources:** [^41], [^6], [^42].

### L1.12. The unipotent word algebra

For a commutative K-algebra A, derivation d:A→Ω and ω_1,…,ω_r∈Ω, define U as the free A-module on words, with basis L_w, L_∅=1 and shuffle multiplication L_uL_v=Σ_(w∈u⧢v)L_w. Its derivation is D(fL_(iw))=L_(iw)⊗df+fL_w⊗ω_i and D(f)=df: the first letter is the outermost integral. The word-length filtration gives unipotent connections U_≤n with trivial graded piece of rank r^n. Apply this to A⁺, Ω⁺ and the datum's H¹-basis.

**Assumptions:** A commutative K-algebra with a derivation d : A -> Omega; K of characteristic zero.

**Required API.**
- `WordAlgebra`: WordAlgebra A omega : the free A-module on words in Fin r with the shuffle product.
- `WordAlgebra.L`: The basis vector L_w of a word w.
- `WordAlgebra.L_mul_L`: L_u * L_v = sum over the shuffles w of u and v of L_w.
- `WordAlgebra.D`: The derivation D : U -> U (x)_A Omega.
- `WordAlgebra.D_L_cons`: D (L (e_i :: w)) = L w (x) omega_i and D (L []) = 0.
- `WordAlgebra.D_mul`: D is a derivation: D(x y) = x D y + y D x.
- `WordAlgebra.depth`: The filtration U_(<= n) by word length, with free graded pieces of rank r^n and trivial connection.
- `WordAlgebra.map`: Base change along A -> A' compatible with d, and linear change of the forms omega' = P omega (P in GL_r(K)), which acts on L_w through P^(tensor n).
- `WordAlgebra.isUnipotent`: U_(<= n) with D is isomorphic to Besser's unipotent connection M_B for a strictly triangular B.

**Tests.**
- L [e_1] * L [e_2] = L [e_1, e_2] + L [e_2, e_1] and L [e_1] * L [e_1] = 2 L [e_1, e_1].
- D (L [e_i]) = 1 (x) omega_i.
- For r = 0 the word algebra is A with D = d.
- With concatenation instead of shuffle, D would send L [e_1] * L [e_1] = L [e_1, e_1] to omega_1 L [e_1] instead of 2 omega_1 L [e_1]: the shuffle product is forced by the Leibniz rule.

**From:** FreeMonoid, Finsupp, Derivation, Module.Free. **Sources:** [^43], [^44], [^45].

### L1.13. Every form with word-algebra coefficients has a primitive

Let (phi, omega, M, g) be a Frobenius-structured datum and U = U(A+(Y); omega). (a) D : U -> U (x) Omega+ is surjective, and more precisely maps U_(<= n+1) onto U_(<= n) (x) Omega+. (b) ker D = K L_empty. (c) The primitive is computed recursively: for f in A+(Y) and eta in Omega+ write f eta = dh + sum c_i omega_i (H1); then f L_w eta = D(h L_w + sum c_i L_(e_i w)) - h D L_w, and h D L_w has shorter words. This is the exactness of the Coleman de Rham complex at one-forms in the direct setting.

**Assumptions:** Hypotheses (H0) and (H1) of L1.7.

**From:** L1.7, L1.12. **Sources:** [^46], [^6].

### L1.14. Local horizontal sections on residue discs and ends

For a datum and ordinary b∈]x[, construct the unique A⁺-algebra map λ_(x,b):U→O(]x[) commuting with derivatives and satisfying λ(L_w)(b)=0 for w≠∅. Under the end normalization assumptions below, construct λ_e:U→R_e[l_e] with CT λ_e(L_w)=0. Here CT selects the t⁰l⁰ coefficient. Every derivative-compatible realization has λ(L_w)=Σ_(w=uv)λ_base(L_u)c_v for a unique shuffle-compatible family c_∅=1; at an ordinary base c_v=λ(L_v)(b). Constants occur on innermost letters. Use CT-normalized λ_e at a tangent.

**Assumptions:** A datum; b a point of ]x[ (for (i)); e a point of D_k (for (ii)); coefficients extended to C_p. For (ii) and the tangential version of (iii), every omega_i has at most a simple pole at the chosen end e, with convergent regular part. The resulting word germs belong to C_p{t}[l], with nonnegative t-powers. A+ coefficients can still have negative Laurent powers; CT is not an algebra homomorphism on all of R_e[l]. Normalization is imposed on the word generators, whose regular-log subalgebra does have multiplicative CT. Higher-pole tangential normalization is a separate proof obligation.

**Required API.**
- `localExpansion`: localExpansion x b : U ->ₐ O(]x[), the tiny iterated integrals based at b.
- `localExpansionEnd`: For an end where all omega_i have at most simple poles with regular parts: U -> R_e[l_e], with word images in C_p{t_e}[l_e] and their CT equal to0 for nonempty words.
- `localExpansion_D`: d (localExpansion x b y) = localExpansion x b (D y).
- `localExpansion_apply_base`: localExpansion x b (L w) b = 0 for w nonempty.
- `constantTerm`: CT : R_e[l_e] -> C_p is the constant Laurent coefficient of the l-free part. It is linear, and is multiplicative on C_p{t_e}[l_e], but not on general Laurent-log germs.
- `localExpansion_classify`: Every D-compatible A+-algebra map U -> A_log(x) is localExpansion x b twisted by a shuffle character c (deconcatenation formula).
- `localExpansion_changeBase`: Chen's formula: for b' in ]x[, localExpansion x b' (L w) = sum over w = u v of localExpansion x b (L u) * (localExpansion x b' (L v))(b).

**Tests.**
- For (P^1, {0, 1, infinity}) at the end 0: localExpansionEnd 0 (L [e_0]) = l_0 and localExpansionEnd 0 (L [e_1]) = sum_{n >= 1} -z^n/n.
- localExpansion x b (L []) = 1 and localExpansion x b restricted to A+ is restriction to ]x[.
- localExpansion x b (L [e_0]) = log(z/b) on ]x[ does not extend to an element of O(W_r): dz/z is not exact in Omega+.
- If the germ lies in C_p[[t]] (no l, no negative powers) then CT is its value at t = 0 (Besser-Furusho constant term).
- CT(t^-1)=CT(t)=0 while CT(t^-1*t)=1. Thus CT on R_e[l] is not an algebra homomorphism, and tangential word normalization must use the nonnegative-power regular-log subalgebra.

**From:** L1.7, L1.12, L1.3, L1.4, L0.8, L0.22. **Sources:** [^47], [^48], [^49].

### L1.15. Frobenius on the word algebra

Let (phi, omega, M, g) be a datum and fix a base point fixed by phi: either a Teichmueller point b in ]x_0[ with x_0 in Y_k(F_q) and phi(b) = b (L1.6), or an end e_0 fixed by F with phi^* t = t^q (1 + h) (tangential normalisation). There is a unique K-algebra endomorphism phi^# of U = U(A+(Y); omega) extending phi^* on A+(Y) with D o phi^# = (phi^# (x) phi^*) o D and lambda(phi^# L_w) normalised at the base point (value 0 at b, resp. constant term 0 at e_0) for w nonempty. It satisfies phi^# L_(e_i) = sum_j M_ij L_(e_j) + g_i - g_i(b) (resp. minus the constant term of g_i), and in general phi^# L_w = sum_{|v| = |w|} (M^(tensor n))_(w,v) L_v modulo U_(<= n-1), n = |w|; moreover lambda o phi^# = phi^* o lambda for the local expansion at the base point.

**Assumptions:** A datum; a phi-fixed base point (Teichmueller point in a residue class of an F_q-point, or an F-fixed end with phi^* t = t^q (1 + h)). For a tangential base point, use the simple-pole regular-log word expansions of L1.14, and require phi-pullback to preserve their CT normalization. In particular phi^*t=t^q with unit leading coefficient of logarithm0 has this property. An arbitrary dagger Frobenius lift is not silently assumed to preserve formal evaluation at a puncture.

**Required API.**
- `frobeniusWord`: frobeniusWord : U ->ₐ[K] U, the endomorphism phi^#.
- `frobeniusWord_dagger`: phi^# restricted to A+(Y) is phi^*.
- `frobeniusWord_D`: D (phi^# y) = (phi^# (x) phi^*) (D y).
- `frobeniusWord_L_single`: phi^# L [e_i] = sum_j M_ij L [e_j] + g_i - (normalising constant).
- `frobeniusWord_top`: phi^# L_w = (M^(tensor |w|)) L_w modulo shorter words.
- `frobeniusWord_localExpansion`: localExpansion at the base point composed with phi^# equals phi^* composed with localExpansion.

**Tests.**
- For (P^1, {0, 1, infinity}), phi(z) = z^p, tangential base point at 0: phi^# L [e_0] = p L [e_0].
- phi^# (L []) = L [] = 1.
- For the same datum, phi^# L [e_1] = p L [e_1] + log((z^p - 1)/(z - 1)^p), with log u of constant term 0 at the end 0 (u(0) = 1 for odd p; u(0) = -1 and log(-1) = 0 for p = 2).
- phi^# L[e_0,e_1] differs from p^2 L[e_0,e_1] by pH, where dH=g_1 dz/z and rho(H)=p(Li_2(z)-p^-2 Li_2(z^p)). Hence rho(pH)=p^2 Li_2^(p)(z); the correction cannot be discarded.

**From:** L1.5, L1.6, L1.7, L1.12, L1.13, L1.14. **Sources:** [^50], [^34].

### L1.16. Realisation of the word algebra by Frobenius continuation

Let (phi, omega, M, g) be a Frobenius-structured datum on (X, D), a in C_p a branch and a phi-fixed base point as in L1.15. There is a unique K-algebra homomorphism rho = rho^a : U(A+(Y); omega) -> A_loc^a(Y) such that (i) rho restricted to A+(Y) is the diagonal embedding; (ii) d o rho = rho o D componentwise; (iii) phi^* o rho = rho o phi^#; (iv) rho(L_w) is normalised at the base point (value 0 at b, resp. constant term 0 at e_0) for w nonempty. On each residue class x, rho restricted to A_log^a(x) is a local expansion twisted by constants (L1.14 (iii)).

**Assumptions:** A datum satisfying (H0), (H1), (Hw); a in C_p; a phi-fixed base point. A tangential base point must satisfy the regular-log and pullback-normalization hypotheses of L1.15; ordinary Teichmueller bases do not need those end hypotheses.

**From:** L1.7, L1.11, L1.13, L1.14, L1.15, L1.4, L0.8, L0.22, L1.10. **Sources:** [^51], [^52], [^53].

### L1.17. Coleman functions

Let (X, D) be a good-reduction pair with a Frobenius-structured datum (phi, omega, M, g), a in C_p a branch and rho = rho^a the realisation of L1.16. The ring of Coleman functions is A_Col^a(Y) := rho(U) in A_loc^a(Y), filtered by depth A_Col,<=n := rho(U_(<= n)), and the module of Coleman forms is Omega_Col := A_Col Omega+(Y) in Omega_loc^a. It contains A+(Y), is closed under products and d (d A_Col,<=n in A_Col,<=n Omega+), every Coleman form has a Coleman primitive (L1.19), and it depends neither on the basis omega (API changeBasis of L1.7), nor on the base point (change of base point by Chen's formula), nor on the Frobenius lift (L1.22). It is Coleman's ring M(U) (Besser's Theorem 5.7) and Furusho's A^a_Col.

**Assumptions:** A datum on (X, D); a in C_p; for independence of the lift, the hypotheses of L1.22.

**Required API.**
- `ColemanFunctions`: ColemanFunctions datum a : Subalgebra C_p (LocAn (X, D) a), the image of the realisation.
- `ColemanFunctions.dagger_le`: A+(Y) is contained in ColemanFunctions.
- `ColemanFunctions.d_mem`: For F Coleman, dF lies in ColemanFunctions . Omega+(Y).
- `ColemanFunctions.depth`: The filtration by depth, with depth 0 equal to A+(Y).
- `ColemanFunctions.ker_d`: F Coleman with dF = 0 implies F constant (L1.18).
- `ColemanFunctions.frobenius_mem`: phi^* preserves ColemanFunctions.
- `ColemanFunctions.pullback`: Pullback along morphisms of wide opens (L1.43).
- `ColemanFunctions.branch`: iota_(a,b) maps ColemanFunctions for a onto those for b (L1.23).
- `ColemanFunctions.indep_basis`: The subalgebra does not depend on the H^1 basis omega nor on the phi-fixed base point.
- `ColemanFunctions.eval`: Values at points of ]Y_k[(C_p).

**Tests.**
- For (P^1, {0, 1, infinity}): log_a z and log_a(1 - z) are Coleman functions of depth 1 (realisations of L [e_0] and L [e_1]).
- The depth-0 part is A+(Y).
- For p >= 3, the element of LocAn equal to log_a z + 1 on the residue disc of 2 and to log_a z elsewhere has d = dz/z but is not a Coleman function.
- A Coleman function with dF = 0 is a constant.

**From:** L1.16, L1.4, L1.7, L1.12, L1.14. **Sources:** [^17], [^6], [^54].

### L1.18. Coleman's uniqueness principle

Let a datum on (X, D) be given and F in A_Col^a(Y). If F vanishes on a nonempty open subset of one residue disc ]x[ (x in Y_k(F_p-bar)), or its germ vanishes at one end, then F = 0. Consequently rho is injective, ker(d on A_Col) = C_p, and a locally constant Coleman function is constant.

**Assumptions:** A datum satisfying (H0), (H1), (Hi); coefficients extended to C_p.

**From:** L1.7, L1.14, L1.16, L1.17, L0.7, L1.13, AS-F1. **Sources:** [^55], [^56], [^57].

### L1.19. The Coleman integral

For F∈A_Col,≤n and η∈Ω⁺, define ∫Fη=ρ(D⁻¹(ρ⁻¹(F)η)) in A_Col,≤n+1/C_p, using injectivity of ρ and surjectivity of D with constant kernel. A primitive G gives ∫_x^yFη=G(y)−G(x); a based primitive satisfies G(x)=0. Tangential endpoints require convergent nonnegative-power logarithmic expansions. Prove d∫=id, ∫dG=G mod C_p, φ*∫=∫φ* mod C_p, linearity, endpoint concatenation, tiny-disc agreement, change of variables and ∫_x^ydg=g(y)−g(x) for g∈A⁺. For F=1 this is BBK Theorem 5's integration map.

**Assumptions:** A datum on (X, D); a in C_p.

**Required API.**
- `colemanIntegral`: colemanIntegral : ColemanForms -> ColemanFunctions / C_p.
- `d_colemanIntegral`: d (colemanIntegral eta) = eta.
- `colemanIntegral_d`: colemanIntegral (d G) = G mod C_p for G a Coleman function.
- `colemanIntegral_frobenius`: colemanIntegral (phi^* eta) = phi^* (colemanIntegral eta) mod C_p.
- `definiteIntegral`: int_x^y eta for x,y in the ordinary tube. A tangential endpoint is permitted when a primitive has a convergent nonnegative-power logarithmic expansion there; evaluate by its CT with the chosen tangent/parameter. General higher-pole evaluation is not supplied.
- `definiteIntegral_add`: int_x^y + int_y^z = int_x^z.
- `definiteIntegral_tiny`: For x, y in one residue disc, int_x^y is the integral of the local power series (L0.8).
- `basedPrimitive`: basedPrimitive x eta : the Coleman function with d = eta and value 0 at x.
- `definiteIntegral_d`: int_x^y dg = g(y) - g(x).
- `definiteIntegral_pullback`: int_(f x)^(f y) eta = int_x^y f^* eta for morphisms f (L1.43).

**Tests.**
- On (P^1, {0, 1, infinity}): int_x^y dz/z = log_a(y) - log_a(x); for x, y roots of unity of order prime to p it is 0.
- int_x^y d g = g(y) - g(x) for g in A+(Y), and int_x^x eta = 0.
- For p odd, int_2^(2+p) dz/z = logOneAdd (p/2), the disc integral.
- For p >= 5 the locally analytic primitive log_a z + (indicator of the residue disc of 2) of dz/z gives log_a 2 - log_a 3 + 1 between 3 and 2, whereas int_3^2 dz/z = log_a(2/3): an arbitrary locally analytic primitive does not compute the Coleman integral.

**From:** L1.13, L1.16, L1.17, L1.18, L1.15, L0.8, L0.22. **Sources:** [^58], [^59], [^60], [^6].

### L1.20. Coleman integration is characterised by Frobenius equivariance

After extending a Frobenius datum and its hypotheses to C_p, there is a unique C_p-linear integration map int : Omega+(Y) tensor_K C_p -> A_loc^a(Y)/C_p with d int the inclusion, int d the canonical map on A+ tensor_K C_p, and Frobenius equivariance. Its image is the depth-one Coleman primitives. At depth n, integration is the unique C_p-linear inverse to d into A_Col,<=n+1/C_p for Coleman forms of depth<=n. The original K-linear/K-quotient formulation in Besser concerns K-valued local functions and a branch valued in K; it must not be applied to all C_p-valued Coleman functions. Independence of phi is subject to L1.22.

**Assumptions:** A datum; a in C_p.

**From:** L1.7, L1.11, L1.19, L1.18. **Sources:** [^61], [^6], [^62].

**L1.21. Taylor expansion along two nearby Frobenius lifts.** Assume an integral étale coordinate t with Ω⁺=A⁺dt and uniform divided-derivative bounds on strict neighborhoods at Taylor radius R>|π|. For equal-q lifts φ,φ′ and finite-depth y, prove convergence of Y=Σ_(j≥0)(φ′*t−φ*t)^jφ#(∂^j y)/j! and ρ(y)(φ′z)=ρ(Y)(z). Hence φ′* preserves the Coleman image. Prove the same result for two maps with equal reduction under the corresponding pulled-back divided-derivative bounds. Freeness of Ω⁺ alone does not supply these analytic bounds.

**Assumptions:** An integral etale coordinate t on the model, Omega+=A+ dt, and uniform divided-derivative bounds on strict neighborhoods with radius R>|pi|; the bounds and compatibility with restriction are an AS-F1 input. The two maps have the same reduction, so their integral coordinate increments have norm at most |pi| on the tube and, after a sufficiently small enlargement, norm strictly less than R. For cross-map pullback the target coordinate and all pulled-back coefficient bounds are used.

**From:** L1.5, L1.12, L1.15, L1.16, L0.1, L0.7, AS-F1. **Sources:** [^63], [^64].

### L1.22. Independence of the Frobenius lift

Let (phi, omega, M, g) and (phi', omega, M', g') be data on (X, D) that differ in the Frobenius lift (same q). Then (a) M' = M: the Frobenius on H^1_dR+ depends only on the q-power Frobenius of Y_k; (b) A_Col^(a, phi) = A_Col^(a, phi') as subalgebras of A_loc^a, and the Coleman integrals coincide modulo constants; with a common base point fixed by both lifts (for P^1 minus {0, infinity} and mu_N: the tangential base point at 0) the realisations coincide, rho_phi = rho_phi'; (c) replacing phi by phi^m does not change A_Col or int. Proved here when the integral etale coordinate and uniform Taylor hypotheses of L1.21 (in particular the standard coordinate on the stated punctured lines); for general good-reduction pairs (a) is imported from RD4 and (b) remains a separate proof obligation.

**Assumptions:** The integral etale coordinate and uniform Taylor bounds of L1.21; two lifts with the same q. For equality of normalized realizations, a common fixed ordinary base point, or a common tangential base satisfying the regular-log and CT-pullback hypotheses. Equality of images and integrals needs no common fixed base point.

**From:** L1.16, L1.17, L1.18, L1.21, L1.7, RD4, L1.6, L1.14. **Sources:** [^61], [^6], [^65].

**L1.23. Branch independence principle.** For a, b in C_p: the isomorphism iota_(a,b) : A_loc^a -> A_loc^b of L1.4 maps A_Col^a onto A_Col^b and iota_(a,b) o int_(a) = int_(b) o tau_(a,b) modulo constants; in the direct construction rho^b = iota_(a,b) o rho^a. Consequently the values of Coleman functions at points of the tube ]Y_k[ do not depend on the branch (a branch-independent region); only the end components, realised with log_a(t_e), do.

**Assumptions:** A datum; a, b in C_p.

**From:** L1.4, L1.16, L1.17, L1.5, L0.23. **Sources:** [^66], [^67].

**L1.24. Cohomological and analytic Frobenius pullback agree.** Let a datum on (X, D) be given. (a) For g in A+(Y) and x in X_k(F_p-bar): res_x(phi^* g) = phi^*(res_(F(x)) g), i.e. pulling back functions on the wide open and pulling back their restrictions to residue discs agree. (b) For eta in Omega+(Y) and x, y in one residue disc: int_(phi(x))^(phi(y)) eta = int_x^y phi^* eta (tiny integrals). (c) The class of phi^* eta in H^1_dR+, which is the cohomological pullback, is M^T applied to the class of eta, and depends only on the Frobenius of Y_k (L1.22 (a)). Together these are the comparison between cohomological and local analytic pullback of the roadmap.

**Assumptions:** A datum on (X, D).

**From:** L1.5, L1.3, L1.7, L0.8, L1.22. **Sources:** [^68], [^63].

### L1.25. The projective line minus zero, infinity and roots of unity

Let N >= 1 with p not dividing N, O = Z_p[mu_N] (unramified over Z_p) and K_N = Q_p(mu_N) inside C_p. The punctured line is U_N := P^1_O minus ({0, infinity} u mu_N); (P^1_O, D_N = {0, infinity} u mu_N) is a good-reduction pair (L1.1) because the N-th roots of unity have distinct reductions. U_1 = P^1 minus {0, 1, infinity}. Residue classes: P^1(F_p-bar) = {0, infinity} u F_p-bar^x, with ends at 0, infinity and at the zeta in mu_N; local parameters t_0 = z, t_inf = 1/z, t_zeta = z - zeta; wide opens W_r = {r < |z| < 1/r, |z - zeta| > r for all zeta in mu_N}; dagger algebra A+(U_N) = weak completion of O[z, z^(-1), (z^N - 1)^(-1)] tensored with K_N (AS-F1).

**Assumptions:** p prime, N >= 1, p does not divide N.

**Required API.**
- `puncturedLine`: puncturedLine p N : the good-reduction pair (P^1_O, {0, infinity} u mu_N) for p not dividing N.
- `puncturedLine.wideOpen_eq`: The wide open W_r = {r < |z| < 1/r, |z - zeta| > r for zeta in mu_N}.
- `puncturedLine.residueClasses`: Residue classes P^1(F_p-bar), ends {0, infinity} u reduction of mu_N.
- `puncturedLine.teichmuller`: For the K_N-linear arithmetic lift phi(z)=z^q with q=#k_N=p^f, the Teichmueller points are the roots of unity of order prime to p outside mu_N. The auxiliary analytic p-power map has the same periodic points but is not the K_N-linear arithmetic q-Frobenius when f>1.
- `puncturedLine.inclusion`: For N | N', U_N' is contained in U_N (more points removed).
- `puncturedLine.powerMap`: z |-> z^N maps U_N onto U_1 (finite etale of degree N on the generic fibre).
- `puncturedLine.rotation`: z |-> zeta z (zeta in mu_N) is an automorphism of U_N; z |-> 1/z and z |-> 1 - z are automorphisms of U_1.
- `puncturedLine.pPowerRotation`: For zeta a p-power root of unity, z |-> zeta z maps W_r into itself for r > |zeta - 1| and reduces to the identity.

**Tests.**
- puncturedLine p 1 is P^1 minus {0, 1, infinity} for every p.
- For N = 1 the phi-fixed points in the residue discs of U_1 are the p - 2 roots of unity of order dividing p - 1 other than 1.
- For N = p the pair is not of good reduction (L1.1 test goodReductionPair_mu_p).
- The fibre of z |-> z^N over 1 is mu_N, the removed points of U_N other than 0 and infinity.

**From:** L1.1, L1.2, AS-F1, rootsOfUnity, IsPrimitiveRoot. **Sources:** [^69], [^62].

**L1.26. Mittag-Leffler decomposition on the punctured line.** Every f in A+(U_N) has a unique decomposition f = f_inf(z) + f_0(1/z) + sum_{zeta in mu_N} f_zeta(1/(z - zeta)) with f_inf in K_N[[T]] and f_0, f_zeta in T K_N[[T]], all restricted at some common rho > 1 (PowerSeries.IsRestricted); conversely every such sum lies in A+(U_N). The expansion on each residue disc and on each end is obtained by expanding the pieces, and (Hi) holds: an element vanishing on one residue disc of the tube, or as a germ at one end, is zero.

**Assumptions:** [^C4]

**From:** L1.25, AS-F1, L0.7, L0.11, PowerSeries.IsRestricted. **Sources:** [^70], [^12].

### L1.27. The de Rham cohomology of the punctured line

For U_N: (H0) ker(d : A+(U_N) -> Omega+(U_N)) = K_N; (H1) every eta = f dz in Omega+(U_N) = A+(U_N) dz can be written uniquely as eta = dh + c_0 dz/z + sum_{zeta in mu_N} c_zeta dz/(z - zeta), with h in A+(U_N) unique up to K_N, c_0 = res_0(eta) (residue at the end 0 in the coordinate z) and c_zeta = res_zeta(eta) (coordinate z - zeta). Thus H^1_dR+(U_N) has basis dz/z, dz/(z - zeta): dimension N + 1 = 2g + #D - 1 with g = 0 and #D = N + 2.

**Assumptions:** [^C4]

**From:** L1.25, L1.26, L0.5, L0.1, L0.11, L0.12. **Sources:** [^6], [^71].

**L1.28. The Frobenius z |-> z^p on the punctured line.** Put K_N=Q_p(mu_N), q=#k_N=p^f. The K_N-linear map phi(z)=z^q is an arithmetic Frobenius lift on U_N. Since zeta^q=zeta for zeta in mu_N, phi*(dz/z)=q dz/z and phi*(dz/(z-zeta))=q dz/(z-zeta)+d log u_zeta, with u_zeta=(z^q-zeta)/(z-zeta)^q. The numerator difference is divisible by p in O_N[z]; log u_zeta belongs to A+(U_N), converging on |z-zeta|>p^(-1/q), with ||u_zeta-1||<=|p|/|z-zeta|^q for |z|<=1 and <=|p|/|z| for |z|>1. At 0, log u_zeta=0. Separately, the auxiliary analytic p-power map on C_p-valued functions has the formula p dz/(z-eta_0)+d log((z^p-zeta)/(z-eta_0)^p), eta_0^p=zeta. It permutes end labels and can be iterated f times to recover the q-map; for f>1 it is not AlgHom.IsArithFrobAt over O_N.

**Assumptions:** p does not divide N; q is the cardinality of the residue field of K_N, so q=p^f and zeta^q=zeta for all zeta in mu_N.

**From:** L1.25, L1.26, L1.27, L1.5, L0.10, L0.13. **Sources:** [^62], [^30].

### L1.29. The Frobenius datum of the punctured line

For q=#k_N=p^f, (A+(U_N),omega=(dz/z,(dz/(z-zeta))_zeta),phi(z)=z^q,M=qI,g=(0,(log u_zeta)_zeta)) is the K_N-linear arithmetic Frobenius datum. H0,H1,Hi hold by the punctured-line de Rham and Mittag-Leffler nodes, also after the stated coefficient extension. Hw holds because M^(tensor n)=q^n I and ||q^(nm)||_p=q^(-nm)<1. The fixed ends0,infinity have phi*t=t^q; the periodic Teichmueller points are the tame roots outside mu_N. Thus the realization, Coleman image, uniqueness and the coordinate-qualified lift independence/pullback apply. The auxiliary analytic p-map instead has matrix p(1 direct_sum P), P:zeta->zeta^(1/p); its f-th iterate gives the q-datum, but the p-map is not arithmetic Frobenius over K_N when f>1.

**Assumptions:** [^C4]

**From:** L1.7, L1.25, L1.26, L1.27, L1.28. **Sources:** [^32], [^72].

### L1.30. Coleman functions on the thrice-punctured line

For p∤N and branch a, define A_Col^a(U_N)=ρ^a(U(U_N))⊆A_loc^a(U_N), using letters e_0 for dz/z and e_ζ for dz/(z−ζ), ζ∈μ_N, and the datum L1.28. Normalize at the tangent at 0 by CT_0ρ(L_w)=0 for w≠∅. Then L_(e_0)=log_a z, L_(e_1)=log_a(1−z), and −L_(e_0^(k−1)e_1)=Li_k. N=1 gives Furusho's Coleman ring on P¹∖{0,1,∞}, with the stated simple-pole and coordinate hypotheses satisfied.

**Assumptions:** p prime not dividing N; a in C_p.

**Required API.**
- `PuncturedLine.colemanFunctions`: PuncturedLine.colemanFunctions p N a : the subalgebra A_Col^a(U_N) of LocAn.
- `PuncturedLine.iteratedIntegral`: iteratedIntegral w := rho^a(L_w), the regularised iterated integral from the tangential base point at 0.
- `PuncturedLine.d_iteratedIntegral`: d L_(e_0 w) = L_w dz/z and d L_(e_zeta w) = L_w dz/(z - zeta).
- `PuncturedLine.constantTerm_iteratedIntegral`: CT_0(L_w) = 0 for w nonempty.
- `PuncturedLine.iteratedIntegral_shuffle`: L_u L_v = sum over the shuffles w of u and v of L_w.
- `PuncturedLine.frobenius_iteratedIntegral`: For the arithmetic q-lift: phi*L_(e_0)=q L_(e_0), phi*L_(e_1)=q L_(e_1)+log u_1 and phi*L_w=q^|w|L_w plus lower depth. The auxiliary p-map has p^|w|L_(sigma w) plus lower depth; its f-fold iterate is the q-action.
- `PuncturedLine.iteratedIntegral_series`: For w = e_0^(k-1) e_1, L_w = -sum_{n >= 1} z^n/n^k on D^-(0, 1): the coefficients of the complex polylogarithm Li_k^C (L0.F).
- `PuncturedLine.pullback_S3`: z |-> 1/z and z |-> 1 - z act on A_Col^a(U_1) (L1.43).
- `PuncturedLine.pullback_power`: z |-> z^m (p not dividing m) pulls A_Col^a(U_1) into A_Col^a(U_m); z |-> zeta z (zeta a p-power root of unity) preserves A_Col^a(U_N).
- `PuncturedLine.branch`: iota_(a,b) maps A_Col^a(U_N) onto A_Col^b(U_N); values on the tube are branch independent.

**Tests.**
- For N = 1: iteratedIntegral [e_0] = log_a z and iteratedIntegral [e_1] = log_a(1 - z); at z = zeta in mu_(p-1), zeta != 1, iteratedIntegral [e_0] (zeta) = 0.
- With H the D-primitive of log(u) dz/z of constant term 0 at 0, rho(H) = p (Li_2(z) - p^(-2) Li_2(z^p)).
- On A+(U_N) the realisation is the inclusion; for N = 1 the construction is the thrice-punctured line.
- On D^-(0, 1), -iteratedIntegral (e_0^(k-1) e_1) = sum z^n/n^k, whose coefficients are those of the complex Li_k (L0.F).
- For p >= 3, log_a z + (indicator of the residue disc of 2) has differential dz/z and is not in A_Col^a(U_1).

**From:** L1.29, L1.16, L1.17, L1.12, L1.14, L1.18, L1.22, L1.23, L0.F. **Sources:** [^73], [^48], [^74].

### L1.31. The primitive from the tangential base point at zero

For F in A_Col^a(U_N) and eta in Omega+(U_N), the based primitive int_0^z F eta is the unique Coleman function G with dG = F eta and CT_0(G) = 0 (constant term of its expansion at the end 0). If the expansion of G at the end 0 lies in C_p[[z]] (no logarithm and no negative powers), CT_0(G) = G(0), so the normalisation is the value 0 at 0. For x, y in the tube, int_x^y F eta = G(y) - G(x). This is the operator by which ColemanIntegration:L2 defines Li_k(z) = int_0^z Li_(k-1)(t) dt/t with Li_1(z) = int_0^z dt/(1 - t).

**Assumptions:** p does not divide N; a in C_p.

**Required API.**
- `PuncturedLine.basedPrimitive`: basedPrimitive (F eta) : the Coleman function G with dG = F eta and CT_0(G) = 0.
- `PuncturedLine.d_basedPrimitive`: d (basedPrimitive (F eta)) = F eta.
- `PuncturedLine.constantTerm_basedPrimitive`: CT_0 (basedPrimitive (F eta)) = 0.
- `PuncturedLine.basedPrimitive_eq_zero_at_zero`: If the expansion of basedPrimitive (F eta) at 0 lies in C_p[[z]] then its value at 0 is 0.
- `PuncturedLine.basedPrimitive_unique`: A Coleman function G with dG = F eta and CT_0(G) = 0 equals basedPrimitive (F eta).
- `PuncturedLine.basedPrimitive_frobenius`: phi^* (basedPrimitive (F eta)) = basedPrimitive (phi^*(F eta)).
- `PuncturedLine.basedPrimitive_branch`: iota_(a,b) (basedPrimitive_a (F eta)) = basedPrimitive_b (iota_(a,b)(F) eta).

**Tests.**
- basedPrimitive (dz/(1 - z)) = -log_a(1 - z).
- basedPrimitive (dz/z) = log_a z, normalised by CT_0 = 0 although it has no value at 0.
- basedPrimitive 0 = 0.
- No Coleman primitive G of dz/z has G(0) = 0: G = log_a z + c has no value at 0, so the value normalisation cannot replace the constant term.

**From:** L1.30, L1.19, L1.14. **Sources:** [^60], [^48].

**L1.32. Expansions on the removed residue discs.** Let U_alg be the subalgebra of U(U_N) with coefficients in the regular functions K_N[z, z^(-1), (z^N - 1)^(-1)] (functions of algebraic origin). For y in U_alg and s in {0, infinity} u mu_N, the actual realized end germ rho(y)_s extends to the whole punctured residue disc: it lies in O(D^-(s, 1) minus {s})[l_s] with only finitely many negative powers of t_s; hence rho(y) extends to a locally analytic function on ]s[ minus {s} and can be evaluated there. In particular Li_k restricted to ]1[ lies in O(]1[)[log_a(z - 1)] and can be evaluated at the p-power roots of unity different from 1, and L_w is analytic at 0 with value 0 when the last letter of w is not e_0.

**Assumptions:** p does not divide N; y of algebraic origin.

**From:** L1.30, L1.14, L0.22, L0.20. **Sources:** [^75], [^76].

### L1.33. Tube of the four-punctured line

For v in C_p define specialUnitTube(v)={z: |z|=|z−1|=|z−v|=1}. For |v|=|1−v|=1 this is the tube of P¹_k minus {0,1,infinity,v-bar}; the definition is the existing Set of C_p-points, not a new analytic-space carrier.

**Assumptions:** p is prime; the set is defined for every v in C_p. The geometric assertion additionally assumes v lies in finite K/Q_p and |v|=|1−v|=1.

**Required API.**
- `TauCeti.ColemanIntegration.mem_specialUnitTube`: z belongs exactly when |z|=1, |z−1|=1 and |z−v|=1.
- `TauCeti.ColemanIntegration.specialUnitTube_subset`: specialUnitTube(v) is contained in the existing puncturedTube(p,1).
- `TauCeti.ColemanIntegration.specialUnitTube_one`: specialUnitTube(1)=puncturedTube(p,1) as subsets of C_p; this set equality does not assert a four-point good-reduction model.
- `TauCeti.ColemanIntegration.specialUnitTube_isOpen`: specialUnitTube(v) is open in the ultrametric topology on C_p.

**Tests.**
- For p=5,v=2, the point3 belongs to specialUnitTube(2).
- v never belongs to specialUnitTube(v).
- specialUnitTube(1)=puncturedTube(p,1).
- For p=2,v=2, |v| is not1, so the geometric separated-section hypothesis fails even though specialUnitTube(2) remains a defined set.

**From:** PadicComplex, L1.3. **Sources:** [^77].

**L1.34. Separated four-point good-reduction model.** The pair (P¹_(O_K), D_v) with D_v the disjoint union of the sections 0,1,v,infinity is a good-reduction pair. Its affine complement is Spec O_K[z,1/(z(z−1)(z−v))]; its differentials are free on dz. Its wide opens are W_r(v)={r<|z|<r⁻¹, |z−1|>r, |z−v|>r}, 0<r<1. Its tube is specialUnitTube(v).

**Assumptions:** [^C5]

**From:** L1.1, L1.2, L1.33. **Sources:** [^77].

**L1.35. Principal parts at four separated punctures.** Write A_v=A†(P¹ minus {0,1,v,infinity}). Every f in A_v has a unique decomposition f=f_infinity(z)+f_0(1/z)+f_1(1/(z−1))+f_v(1/(z−v)), where f_infinity is a power series and each finite-puncture series has zero constant coefficient; all four are restricted at some common radius rho>1. Conversely each such expression lies in A_v. Restriction of A_v and A_v dz to any nonempty residue disc is injective.

**Assumptions:** [^C5]

**From:** L1.34, L0.7, L0.11, PowerSeries.IsRestricted, AS-F1. **Sources:** [^77].

### L1.36. Residue coordinates on the four-punctured line

For A_v, ker(d)=K and every differential eta in A_v dz has a unique residue vector (c_0,c_1,c_v) in K³ with eta=dh+c_0 dz/z+c_1 dz/(z−1)+c_v dz/(z−v), h in A_v unique modulo K. The three displayed logarithmic forms give a basis of H¹ of the dagger de Rham complex; the residue at infinity is −c_0−c_1−c_v.

**Assumptions:** [^C5]

**From:** L1.35, L0.5, L0.1, L0.12, AS-F1. **Sources:** [^77].

**L1.37. Small error in the q-power Frobenius polynomial.** For each c in {0,1,v}, E_c(Z)=Z^q−c−(Z−c)^q has every coefficient in the maximal ideal of O_K and degree less than q. Thus there is a real delta<1 bounding the norms of all coefficients of the three E_c. On W_s(v), |E_c(z)/(z−c)^q|≤delta/s^q whenever0<s<1. For c=0 the error is zero.

**Assumptions:** [^C5]

**From:** L1.34, FiniteField.pow_card, sub_pow_char_pow, PadicComplex.isNonarchimedean. **Sources:** [^77].

**L1.38. Overconvergent Frobenius logarithmic corrections.** The K-linear q-power map phi(z)=z^q induces an endomorphism of A_v. For c in {0,1,v}, u_c=(z^q−c)/(z−c)^q is an overconvergent unit with a canonical convergent log(u_c) in A_v; log(u_0)=0. One has phi*(dz/(z−c))=q dz/(z−c)+d log(u_c). This asserts convergence near the tube, not on all of the punctured residue disc.

**Assumptions:** [^C5]

**From:** L1.37, L0.10, L0.13, AS-F1. **Sources:** [^77].

### L1.39. Frobenius datum for an arbitrary separated fourth point

For the four-punctured line over finite K, the forms dz/z,dz/(z−1),dz/(z−v), the K-linear lift z↦z^q, matrix q I_3 and corrections(0,log u_1,log u_v) form the existing FrobeniusDatum, satisfying(H0),(H1),(Hi),(Hw). Therefore the inherited word-algebra construction and Coleman uniqueness apply to this concrete line. No general-curve de Rham comparison is required for this instance.

**Assumptions:** [^C5]

**From:** L1.7, L1.36, L1.35, L1.38, L1.16, L1.18. **Sources:** [^77].

**L1.40. Integral argument maps on the four-punctured line.** The four nonconstant maps z, v/z, v(z−1)/(z(v−1)), (1−z)/(1−v) extend to O_K-automorphisms of P¹ whose restriction sends Y_v=P¹ minus {0,1,v,infinity} into U_1=P¹ minus {0,1,infinity}. The constant map v also maps Y_v into U_1. Preimages of the ordered target punctures(0,1,infinity) are respectively(0,1,infinity), (infinity,v,0), (1,v,0), (1,v,infinity). Each nonconstant map sends specialUnitTube(v) into puncturedTube(p,1).

**Assumptions:** [^C5]

**From:** L1.34, L1.33, L1.25, norm_div. **Sources:** [^77].

**L1.41. Whole-disc composition in a fractional local coordinate.** Let F(c+s)=Σ a_m s^m be one power series converging on |s|<1 in C_p. For |u|≤1 and |b|≤1, F(c+u t/(1+b t)) is one power series on |t|<1. Its constant coefficient is a_0 and, for n≥1, its coefficient is Σ_(1≤m≤n) a_m u^m (−b)^(n−m) binom(n−1,m−1). For each 0<r<R<1 choose C_R with |a_m|R^m≤C_R; the composed coefficients c_n satisfy |c_n|r^n≤C_R(r/R)^n. In particular the ordinary target-disc function pulls back on the whole source disc, including its centre.

**Assumptions:** p is any prime; c,u,b∈C_p; |u|≤1 and |b|≤1. F has one expansion on the whole target disc, not merely local analyticity.

**From:** L0.7, FormalMultilinearSeries.ofScalars, HasFPowerSeriesOnBall, HasFPowerSeriesAt.comp, hasFPowerSeriesOnBall_inv_one_add, IsUltrametricDist.norm_natCast_le_one. **Sources:** [^78].

**L1.42. Pullback at an additional source end.** For genus-zero good-reduction pairs (P¹,D′) and (P¹,D) over O_K, let f be an integral fractional-linear automorphism with f^−1(D)⊆D′. At a source end e′ whose reduction maps into the ordinary target locus Y_k, an ordinary target component H∈O(]f(e′)[) pulls back to H∘f∈O(]e′[), and hence to its Laurent end germ in A_loc^a(Y′). At ends mapping to target ends use the existing logarithmic parameter substitution. These component maps define the usual f# on A_loc and commute with differentiation. Together with the inherited Taylor/Frobenius argument they permit L1.43 for these maps, even when an additional source end maps to an ordinary target point.

**Assumptions:** K is a finite extension of Q_p; both divisors have disjoint reduction; both pairs carry the existing Frobenius data. f is represented by an O_K matrix with unit determinant; f^−1(D)⊆D′. Coefficients and branch are extended to C_p. This is the genus-zero free-differential case. The nonfree-differential gluing requirement is retained. The uniform integral-coordinate, same-reduction cross-map Taylor estimates in L1.21 are required for the inherited Coleman induction. Local composition of ordinary-disc/end germs by itself is only the local component check.

**From:** L1.41, L1.4, L1.14, L1.21, L1.11, L0.20, L0.15, L0.10, L1.15, L1.16. **Sources:** [^79].

### L1.43. Pullback of Coleman functions

Let f*:A⁺(Y)→A⁺(Y′) reduce to a morphism Y′_k→Y_k and map ends to ends; the Frobenius q-powers must have a common power. Prove f* preserves Coleman functions, commutes with d and satisfies ∫f*η=f*∫η modulo constants. The coordinate argument requires the uniform cross-map Taylor bounds of L1.21; general pairs require nonfree differential gluing. Include inversion and reflection on U_1, tame rotations on U_N, p-power rotations reducing to identity, inclusions U_N→U_1, and z↦z^m:U_m→U_1 for p∤m. In the free genus-zero case also include integral fractional-linear maps with f⁻¹(D)⊆D′, allowing additional source ends to map to ordinary points; use L1.42 for their local comparison.

**Assumptions:** Data on both pairs; f as stated; the integral etale coordinate and uniform same-reduction cross-map bounds of L1.21 on the target and source strict neighborhoods. The punctured-line maps satisfy these explicit coordinate hypotheses. For the additional genus-zero case, use the precise integral fractional-linear and divisor hypotheses of L1.42; no ends-to-ends hypothesis is imposed there.

**From:** L1.17, L1.19, L1.21, L1.11, L1.22, L1.16, L1.42, L1.10, L1.13, L1.18. **Sources:** [^80], [^81], [^82].

**L1.44. Local coordinates of the four argument maps.** Fix |v|=|1−v|=1 and write f_0(z)=z, f_1(z)=v/z, f_2(z)=v(z−1)/(z(v−1)), f_3(z)=(1−z)/(1−v). At the source points (0,1,v,∞), with parameters (z,z−1,z−v,1/z), the target values are respectively (0,1,v,∞), (∞,v,1,0), (∞,0,1,v/(v−1)), (1/(1−v),0,1,∞). For each entry use target parameter w at0, w−1 at1, 1/w at∞, and w−c at a regular value c. Every resulting coordinate is u t/(1+b t). The rows (u;b) are (1,1,1,1;0,0,0,0), (1/v,−v,−1/v,v;0,1,1/v,0), ((1−v)/v,v/(v−1),1/(v(v−1)),−v/(v−1);−1,1,1/v,0), (−1/(1−v),1/(v−1),1/(v−1),v−1;0,0,0,−1). All |u|=1 and |b|≤1; every regular target value is a special unit. Thus the parameter map preserves |t| and gives an automorphism of the open unit disc.

**Assumptions:** p is any prime, including2; v∈C_p is a special unit; 0<|t|<1 for formulas using t^−1. These local algebra/norm identities do not require v algebraic. The scheme/Frobenius use still takes v in a finite extension.

**From:** L1.40, L1.41, L0.15, L0.10, norm_div. **Sources:** [^83].

## L2. Coleman polylogarithms and functional equations

Normalize the iterated integrals tangentially at zero, continue them onto the removed residue discs, and prove their distribution, inversion, branch-change and dilogarithm identities. The scalar five-term proof uses a four-punctured line, all its local components, and a geometric boundary sequence. Its algebraic projective and Bloch comparison is a distinct target.

**L2.Fa. Complex boundary values.** Construct integer-weight complex polylogarithms in the `Complex.polylog` vocabulary, agreeing with Σ_(m≥1)z^m/m^k on |z|<1. Prove distribution and boundary values at nontrivial roots; at k=1 prove Dirichlet convergence and Abel passage to −Log(1−ζ). For k≥2 identify the root series with HurwitzZeta.expZeta, then use its Bernoulli Fourier identities for inversion. Tests are the complex values at −1 and 1/2 in L2.30 and the failure of absolute convergence at weight 1. From the rational coefficients, complex logarithm Taylor series and HurwitzZeta's summation theorems. Source: RJW §6.2, Theorem 6.7(i), pp.38–39. Follow the definition and API direction of [Mathlib PR #44531](https://github.com/leanprover-community/mathlib4/pull/44531).

**L2.Fb. Field-general Bloch algebra.** For any field K, let `Symbols K` be the free abelian group on K∖{0,1}; total notation `symbol` is zero at 0 and 1. For x,y≠0,1 with x≠y, `fiveTermRelation` is [x]−[y]+[y/x]−[(1−x⁻¹)/(1−y⁻¹)]+[(1−x)/(1−y)]. `fiveTermSubgroup` is generated by these expressions; `PreBlochGroup` is its integral quotient and `preBlochSymbol` its generator map. No inverse or complement relation is imposed separately.

**Required API.** `symbol_admissible`, `symbol_zero`, `symbol_one`; `fiveTermRelation_arguments` proves admissibility of the three ratios. `preBlochSymbol_zero`, `preBlochSymbol_one`, `preBlochSymbol_fiveTerm` give the quotient relations. `preBlochGroup_lift`: every K→A, for an additive abelian group A, zero at 0,1 and killing every five-term expression, induces a unique additive map. A field homomorphism f:K→E gives `preBlochMap`, with generator evaluation, identity and composition (`preBlochMap_symbol`, `_id`, `_comp`).

`UnitTensor` is Additive(K×)⊗_ℤAdditive(K×), where K× denotes units. `symmetricTensorRelations` spans u⊗v+v⊗u; its quotient is `AntisymmetricSquare`, with pure classes `tensorClass`. Prove multiplicativity in each argument becomes additivity (`tensorClass_mul_left`, `_mul_right`), sign on interchange (`_swap`), and 2(u⊗u)=0 (`_diagonal_two_torsion`). `antisymmetricSquare_hom_ext` tests maps on pure tensors. `antisymmetricMap` transports unit factors, with `_tensorClass`, `_id`, `_comp` laws. Retain diagonal 2-torsion: this carrier differs from the alternating exterior square and from de Jeu's further modified quotient.

`boundaryRaw` sends [x] to x⊗(1−x); `boundaryRaw_fiveTerm` kills the generating relations. Its quotient map `boundary` has `boundary_symbol` and `boundary_natural` for field transport. `BlochGroup` is its actual kernel (`mem_blochGroup_iff`); `boundary_complement` puts [x]+[1−x] there. `blochMap` restricts `preBlochMap`, with `_val`, `_id`, `_comp` laws.

On C_p, `dilogEvaluation a` sends [x] to the actual D^a(x), using L2.69 (`dilogEvaluation_symbol`). Define the additive `branchPair a` on the tensor quotient by (u⊗v)↦(v_p(u)log_a(v)−v_p(v)log_a(u))/2 (`branchPair_tensorClass`). It is independent of a (`branchPair_branch_independent`), and D^b(z)−D^a(z)=(b−a)branchPair a(δz) (`dilogEvaluation_branch_change`). Restriction to B(C_p), or transport of B(K) through K→C_p, is branch independent (`dilogEvaluation_bloch_branch_independent`, `_field_bloch_branch_independent`). Use the p-adic scalar theorem.

**Tests.** Before quotienting: [0]=[1]=0, [2]≠0, [2]+[1/2]≠0 over ℚ. In the pre-Bloch group: the signed (4,2) expression is zero, removed points are zero, and [2] transports to [2] in ℂ. In the tensor quotient: 1⊗u=u⊗1=0, 2(−1⊗−1)=0, but −1⊗−1≠0 over ℚ (detected by the sign pairing modulo 2). For δ: the (4,2) expression maps to zero, δ[2]=2⊗(−1), and δ[0]=0. In B: [2]+[−1] belongs, zero belongs, and every element has zero boundary. Each transport map preserves zero, generators (or the displayed complement element), and identity transport. Evaluation sends zero and the (4,2) expression to zero and agrees for branches on [x]+[1−x]. The branch pairing kills diagonals and 1⊗u; on C_3 it sends 3⊗4 to log_a(4)/2.

**From:** `FreeAbelianGroup.of`, `.lift`, `QuotientAddGroup.mk'`, `.lift`, `TensorProduct`, `Submodule.span`, `Submodule.mkQ`, L0.15–L0.16, L2.18, L2.69. **Source:** DJ §3, p.7 (integral carriers and boundary), Prop.2.10, pp.6–7 and proof pp.14–15 (p-adic relations and branch formula). Projective/infinity comparison: L2.70, W §4, pp.362–365.

### L2.1. The polylogarithm power series on the open unit disc of C_p

For k∈ℤ use the rational series polylogSeries k=Σ_(n≥1)X^n/n^k in C_p. Its radius is exactly 1, with no convergence at |z|=1. On D⁻(0,1), Li_k^ser(0)=0, (Li_k^ser)′(0)=1 and z(Li_k^ser)′=Li_(k−1)^ser. Li_0^ser=z/(1−z), Li_1^ser=−log_a(1−z) for every a; for k≤0 use (z d/dz)^(−k)(z/(1−z)). Values lie in every complete coefficient subfield containing z, and commute with continuous automorphisms of C_p.

**Assumptions:** k ∈ Z; p any prime; C_p with |p| = 1/p. The analytic function is defined on the open disc |z| < 1 only; no continuation is part of this definition.

**Required API.**
- `polylogSer`: polylogSer p k : ℂ_[p] → ℂ_[p], z ↦ Σ'_{n≥1} z^n/n^k; this is Li_k^ser(z) for |z| < 1 (and the junk value 0 of the unconditional sum elsewhere).
- `polylogSer_hasFPowerSeriesOnBall`: polylogSer p k has the power series Σ_{n≥1} n^{−k}X^n at 0 on the ball of radius 1.
- `radius_polylogSeries`: The radius of convergence over ℂ_[p] of Σ_{n≥1} z^n/n^k is exactly 1, for every k ∈ Z.
- `polylogSer_zero`: polylogSer p k 0 = 0.
- `polylogSer_zero_index`: For |z| < 1, polylogSer p 0 z = z/(1 − z).
- `polylogSer_hasDerivAt`: For |z| < 1: HasDerivAt (polylogSer p (k+1)) (polylogSer p k z / z) z when z ≠ 0, and HasDerivAt (polylogSer p (k+1)) 1 0.
- `polylogSer_one_eq_neg_logOneAdd`: For |z| < 1, polylogSer p 1 z = −NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (−z) (Tau Ceti's series logarithm).
- `polylogSer_eq_eval_polylogSeries`: The coefficients of polylogSer are the images in ℂ_[p] of the rational coefficients of L0.F’s rational series q_k.
- `polylogSer_mem_of_mem`: If K ⊂ ℂ_[p] is a closed subfield, z ∈ K and |z| < 1, then polylogSer p k z ∈ K.
- `polylogSer_map`: For a continuous ring automorphism σ of ℂ_[p] and |z| < 1, σ(polylogSer p k z) = polylogSer p k (σ z).

**Tests.**
- polylogSer p 0 (p : ℂ_[p]) = p/(1 − p).
- For p ≥ 5: ‖polylogSer p 2 (p : ℂ_[p]) − p‖ = p^{−2}.
- polylogSer p k 0 = 0 for every k ∈ Z.
- For k ≥ 0 the family n ↦ (1 + p)^n / n^k is not summable in ℂ_[p]: the series gives no value on the residue disc of 1.
- For |z| < 1: polylogSer p 1 z = −NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (−z).

**From:** L0.F, L0.15, PadicComplex, FormalMultilinearSeries.radius, HasFPowerSeriesOnBall, PowerSeries, NormedSpace.logOneAdd, NormedSpace.logOneAdd_eq_tsum. **Sources:** [^84], [^85], [^86].

**L2.2. In which residue disc a root of unity lies.** Let ζ ∈ C_p be a root of unity of exact order N ≥ 2. If N = p^r with r ≥ 1, then |ζ − 1| = p^{−1/(p^{r−1}(p−1))} < 1: ζ lies in the residue disc of 1, with |ζ − 1| > p^{−1/(p−1)} if and only if r ≥ 2 and |ζ − 1| = p^{−1/(p−1)} for r = 1. If N is not a power of p, then |ζ| = |ζ − 1| = 1: ζ and 1 − ζ are units, ζ lies in a residue disc of U = P¹ ∖ {0,1,∞}, and v(1 − ζ) = 0. For c ∈ (Z/NZ)^× the same holds for ζ^c, with |1 − ζ^c| = |1 − ζ|. When p ∤ N and K ⊂ C_p is a finite extension of Q_p containing ζ, ζ is the Teichmüller representative of its reduction (the roots of unity of order prime to p in K are the image of the Teichmüller lift of the residue field of K).

**Assumptions:** N ≥ 2 the exact order of ζ; p any prime.

**From:** PadicComplex, IsPrimitiveRoot, IsPrimitiveRoot.prod_one_sub_pow_eq_order, Polynomial.cyclotomic, Polynomial.eval_one_cyclotomic_prime_pow, Polynomial.eval_one_cyclotomic_not_prime_pow, TauCeti.teichmuller, TauCeti.range_teichmuller. **Sources:** [^87], [^88], [^89].

### L2.3. Existence and uniqueness of Coleman's polylogarithms

On U=P¹∖{0,1,∞}, for every branch a and k≥1 construct the unique Coleman sequence Li_1^a,…,Li_k^a with Li_1^a=−log_a(1−z), dLi_j^a=Li_(j−1)^a dz/z for j≥2, and end germ at 0 equal to Li_j^ser, without logarithmic terms. Thus it extends over D⁻(0,1) with value 0. All Coleman primitives of Li_(j−1)^a dz/z differ from Li_j^a by a C_p constant; this normalization removes it. Prove independence of the auxiliary Frobenius lift.

**Assumptions:** a ∈ C_p arbitrary; p any prime; k ≥ 1. Coleman functions and Coleman integration are those of ColemanIntegration L1 for the good-reduction pair (P¹, {0,1,∞}) over Z_p; the forms integrated are unipotent (iterated integrals of dz/z and dz/(1−z)). Normalisation (iii) is at the base point 0, which lies outside U; it is meaningful because the integrand Li^a_{j−1}dz/z is regular at 0 (Li^a_{j−1}(0) = 0), and it agrees with the tangential-base-point normalisation (L2.6).

**From:** L2.1, L0.15, L1.30, L1.31, L1.19, L1.18, L1.22, L0.21, L0.22. **Sources:** [^85], [^90], [^91], [^92], [^93].

**L2.4. The polylogarithms on the punctured residue discs of 1 and ∞.** For k≥1 define λ_k=Li_k^a+log(z)^(k−1)log_a(1−z)/(k−1)! near 1. It extends branch independently to D⁻(1,1), with λ_1=0, dλ_k=λ_(k−1)dz/z+log(z)^(k−1)dz/((k−1)!(z−1)) for k≥2, and λ_2(z)=λ_2(1)−Li_2^ser(1−z). At infinity Li_k^a is polynomial in log_a(1/z) with coefficients analytic on D⁻(0,1) in 1/z. These end expansions, the whole ordinary residue-disc series and Li_k^ser near 0 give unique locally analytic continuation to C_p∖{1}, satisfying dLi_k^a=Li_(k−1)^a dz/z.

**Assumptions:** a ∈ C_p, k ≥ 1. log_a(1 − z) = log_a(z − 1) since log_a(−1) = 0 for every branch. A(D) is the ring of analytic functions on the open disc D (convergent power series), A(annulus) the ring of convergent Laurent series on the annulus.

**From:** L2.3, L2.1, L0.15, L1.30, L0.8, L0.21, L0.22, L1.32. **Sources:** [^75], [^94], [^95], [^96].

### L2.5. Coleman's p-adic polylogarithm Li_k^a

Define Li_0^a=z/(1−z). For k≥1 use the normalized Coleman function on C_p∖{0,1}, with its end continuation (L2.4), and Li_k^ser near 0, giving Li_k^a(0)=0. For k≥2 set Li_k^a(1)=λ_k(1)=ζ_p(k), the branch-independent limit through finitely ramified extensions. Write Li_k=Li_k^0 for the Iwasawa branch. Define Li_k^(p),a(z)=Li_k^a(z)−p^(−k)Li_k^a(z^p) when z^p≠1, or for every z≠1 if k≥2; L2.15 gives branch independence where |z−1|>p^(−1/(p−1)).

**Assumptions:** p any prime; a ∈ C_p; k ≥ 0. At z = 1 the value is not defined for k ≤ 1 (Li^a_0 has a pole and Li^a_1 = −log_a(1 − z) a logarithmic singularity). Coleman functions and their continuation to the punctured discs are those of the two preceding nodes.

**Required API.**
- `padicPolylog`: padicPolylog p a k : ℂ_[p] → ℂ_[p]; Li^a_k on ℂ_[p] ∖ {1}, with Li^a_k(1) = ζ_p(k) for k ≥ 2 and junk value 0 at 1 for k ≤ 1.
- `padicPolylog_zero_index`: padicPolylog p a 0 z = z/(1 − z) for z ≠ 1.
- `padicPolylog_one_index`: padicPolylog p a 1 z = −log_a(1 − z) for z ≠ 1.
- `padicPolylog_apply_zero`: padicPolylog p a k 0 = 0.
- `padicPolylog_eq_polylogSer`: For |z| < 1, padicPolylog p a k z = polylogSer p k z.
- `padicPolylog_analyticAt`: For z ≠ 1 (and k ≥ 0), padicPolylog p a k is analytic at z (locally analytic on ℂ_[p] ∖ {1}).
- `padicPolylog_isColeman`: On U(ℂ_[p]) = ℂ_[p] ∖ {0,1}, padicPolylog p a k is the Coleman function Li^a_k of the existence theorem (stated against ColemanIntegration L1's ring of Coleman functions).
- `padicPolylog_one`: For k ≥ 2, padicPolylog p a k 1 = padicZeta p k := λ_k(1), independent of a.
- `padicModPolylog`: padicModPolylog p a k z := padicPolylog p a k z − p^{−k}·padicPolylog p a k (z^p).
- `padicPolylog_hasDerivAt`: z·(Li^a_k)'(z) = Li^a_{k−1}(z).7.
- `padicPolylog_distribution`: Σ_{ζ^m=1} Li^a_k(ζz) = m^{1−k}Li^a_k(z^m).8.
- `padicPolylog_inversion`: Li^a_k(z) + (−1)^k Li^a_k(1/z) = −log_a(z)^k/k!.9.
- `padicPolylog_sub_padicPolylog`: The branch-dependence formula.10.
- `padicPolylog_map`: σ(Li^a_k(z)) = Li^{σ(a)}_k(σ z) for continuous automorphisms σ of ℂ_[p].17.
- `padicModPolylog_eq_frobeniusSeries`: Li^{(p),a}_k(z) = g_k(1/(1 − z)) for |z − 1| > p^{−1/(p−1)}.15.

**Tests.**
- For p odd and every a: padicPolylog p a 2 (−1) = 0.
- For p odd and every a: padicPolylog p a 2 2 = 0.
- For p odd and every a: padicPolylog p a 2 (1/2) = −log(2)^2/2, with log the branch-free logarithm of the unit 2.
- padicPolylog p a 2 (1/p) = −polylogSer p 2 p − a^2/2; so a definition of Li_2 that ignores the branch fails on the residue disc of ∞.
- padicPolylog p a k 0 = 0 for all k, and padicPolylog p a 0 z = z/(1 − z).
- For |z| < 1: padicPolylog p a 1 z = −NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (−z).

**From:** L2.3, L2.4, L2.1, L0.15. **Sources:** [^85], [^97], [^98], [^99], [^100].

### L2.6. The base-point normalisation at zero is the tangential one

If the end germ of F has F=Σ_i f_i(z)log_a(z)^i with f_i analytic on D⁻(0,1), set Reg_(λ∂z)F=Σ_i f_i(0)log_a(λ)^i for λ≠0. Li_k^a is the unique Coleman primitive hierarchy with Li_1=−log_a(1−z) and Reg_(∂z)Li_k=0; its germs have no log terms, so every tangent gives Li_k(0)=0. For log_a z the regularized value is log_a λ and there is no ordinary value at 0. In Furusho's KZ solution G_0≈z^A, the A^(k−1)B coefficient is −Li_k. Rebasing at x gives G_0(z)G_0(x)⁻¹: depth 1 subtracts Li_1(x), while depth 2 is Li_2(z)−Li_2(x)−Li_1(x)(log_a z−log_a x). Use the full Chen rebasing for higher depths.

**Assumptions:** a ∈ C_p; k ≥ 1; λ ∈ C_p^×. The regularisation uses the local parameter z at 0; changing the parameter to z·h(z) with h(0) = λ^{−1} is the same as changing the tangent vector.

**From:** L2.3, L2.4, L2.5, L1.30, L1.18, L0.15. **Sources:** [^101], [^102], [^60], [^90].

**L2.7. The differential recursion z·(d/dz)Li_k = Li_{k−1}.** For every a ∈ C_p, k ≥ 1 and z ∈ C_p ∖ {1}, the function Li^a_k : C_p ∖ {1} → C_p is differentiable at z (in the sense of HasDerivAt over C_p), with derivative Li^a_{k−1}(z)/z if z ≠ 0 and 1 if z = 0; in particular z·(Li^a_k)'(z) = Li^a_{k−1}(z) everywhere on C_p ∖ {1}, and (Li^a_1)'(z) = 1/(1 − z).

**Assumptions:** a ∈ C_p; k ≥ 1; z ≠ 1.

**From:** L2.5, L2.4, L2.3, L2.1, L0.15, HasDerivAt, L0.19. **Sources:** [^103], [^104], [^105].

### L2.8. The distribution relation

For every branch parameter a ∈ C_p, every k ≥ 0, every m ≥ 1 and every z ∈ C_p with z^m ≠ 1: Σ_{ζ∈μ_m} Li^a_k(ζz) = m^{1−k}·Li^a_k(z^m), where μ_m ⊂ C_p is the group of m-th roots of unity (all ζz ≠ 1 because z^m ≠ 1). Equivalently Li^a_k(z^m) = m^{k−1}Σ_{ζ^m=1}Li^a_k(ζz). For p ∤ m the same identity holds for the modified polylogarithm Li^{(p),a}_k wherever z^{pm} ≠ 1. (The extension to z^m = 1 for k ≥ 2, with Li_k(1) = ζ_p(k), is part of L2.11.)

**Assumptions:** a ∈ C_p; k ≥ 0; m ≥ 1; z ∈ C_p with z^m ≠ 1 (z = 0 allowed). The same branch a on both sides; log_a(ζ) = 0 for roots of unity, so no branch term appears.

**From:** L2.5, L2.7, L2.4, L2.3, L2.1, L0.15, L1.30, L1.17, L1.43, L1.18, IsPrimitiveRoot, HasFPowerSeriesAt.eq_zero_of_eventually, HasFPowerSeriesOnBall.changeOrigin, L0.21. **Sources:** [^106], [^107], [^108].

### L2.9. The inversion relation

For every branch parameter a ∈ C_p, every k ≥ 0 and every z ∈ C_p ∖ {0, 1}: Li^a_k(z) + (−1)^k·Li^a_k(1/z) = −log_a(z)^k/k!. Consequences: (i) for |z| > 1, Li^a_k(z) = (−1)^{k+1}Li_k^ser(1/z) − log_a(z)^k/k!, the explicit form of Li^a_k on the residue disc of ∞; (ii) for k >= 1 and every root of unity ζ ≠ 1, Li^a_k(ζ^{−1}) = (−1)^{k+1}Li^a_k(ζ) (log_a ζ = 0); (iii) Li^{(p),a}_k(1/z) = (−1)^{k+1}Li^{(p),a}_k(z) whenever z^p ≠ 1. The right side has no Bernoulli-polynomial term, unlike the complex inversion formula of L2.Fa, because there is no 2πi in C_p.

**Assumptions:** a ∈ C_p, the same branch on both sides; k ≥ 0; z ∉ {0, 1}.

**From:** L2.8, L2.5, L2.7, L2.4, L2.1, L0.15, L1.30, L1.18, L1.43, L0.21. **Sources:** [^109], [^110], [^111].

### L2.10. Dependence of the polylogarithms on the branch of the logarithm

Let a, b ∈ C_p, β := a − b = log_a(p) − log_b(p), and v = v_p (v(p) = 1), so that log_a(z) − log_b(z) = v(z)·β for z ∈ C_p^×. For every k ≥ 1 and z ∈ C_p ∖ {1}: Li^a_k(z) − Li^b_k(z) = −(β/k!)·v(1 − z)·Σ_{j=0}^{k−1} log_a(z)^{k−1−j}·log_b(z)^j. Consequently: (i) Li^a_k = Li^b_k on {|z − 1| = 1, |z| ≤ 1}, i.e. on the residue disc of 0 and on every residue disc of U; (ii) on D⁻(1,1) ∖ {1}, Li^a_k(z) − Li^b_k(z) = −β·v(1 − z)·log(z)^{k−1}/(k−1)!, so λ_k and ζ_p(k) (k ≥ 2) do not depend on the branch; (iii) on {|z| > 1}, Li^a_k(z) − Li^b_k(z) = −(log_a(z)^k − log_b(z)^k)/k!; (iv) for k ≥ 2, Li^a_k(ζ) is independent of a at every root of unity ζ ≠ 1, while Li^a_1(ζ) − Li^b_1(ζ) = −β/(p^{r−1}(p−1)) for ζ of exact order p^r (r ≥ 1) and 0 for ζ of order not a power of p; (v) the modified Li^{(p),a}_k is independent of a on {|z − 1| > p^{−1/(p−1)}}.

**Assumptions:** a, b ∈ C_p arbitrary; k ≥ 1; z ≠ 1 (for k ≥ 2 also z = 1, where both sides vanish).

**From:** L2.9, L2.4, L2.5, L2.3, L2.2, L0.15, L1.30, L0.16, L1.23. **Sources:** [^112], [^113], [^114], [^115].

**L2.11. The limit at z = 1 and the p-adic zeta values.** (a) For k ≥ 2, every branch a and every subfield L ⊂ C_p of finite ramification index over Q_p (L need not be complete or of finite degree), Li^a_k(z) → λ_k(1) as z → 1 with z ∈ L ∖ {1}; the limit ζ_p(k) := λ_k(1) is independent of a and L, and Li^a_k(1) := ζ_p(k) makes Li^a_k continuous on every such L. For k = 1 there is no such limit: Li^a_1(1 − p^n) = −na and Li^a_1(1 − p^n(1 + p)) = −na − log(1 + p), so for a = 0 the two sequences have the different limits 0 and −log(1 + p) ≠ 0. (b) ζ_p(k) = 0 for every even k ≥ 2. (c) For k ≥ 2 the distribution relation holds for all z ∈ C_p: Σ_{ζ∈μ_m}Li^a_k(ζz) = m^{1−k}Li^a_k(z^m); in particular Σ_{ζ∈μ_m}Li^a_k(ζ) = m^{1−k}ζ_p(k), Σ_{ζ∈μ_m, ζ≠1}Li^a_k(ζ) = (m^{1−k} − 1)ζ_p(k), and for p odd ζ_p(k) = Li_k(−1)/(2^{1−k} − 1). (d) λ_2(z) = −Li_2^ser(1 − z) on D⁻(1,1).

**Assumptions:** k ≥ 2 in (a)-(d); L ⊂ C_p with e(L/Q_p) < ∞; p any prime (for the formula with Li_k(−1), p odd so that −1 is not in the residue disc of 1).

**From:** L2.4, L2.5, L2.8, L2.9, L2.10, L0.15. **Sources:** [^116], [^117], [^118], [^97], [^119].

### L2.12. Local antiderivatives do not determine Li_k: the ambiguity and a non-example

For k≥2, consider primitives F of Li_(k−1)^a dz/z with F(0)=0, whole-disc analytic expansions at 0 and ordinary unit discs, and polynomial logarithmic expansions at 1 and infinity whose coefficients are analytic on the punctured discs. Exactly these functions are Li_k^a+c(z̄), for arbitrary functions c on P¹(F̄_p)∖{0}; the ambiguity is infinite dimensional. The Coleman condition removes it; so does Σ_(ζ∈μ_p)F(ζz)=p^(1−k)F(z^p). For p=5,k=2, adding 1 on the residue disc of 2 gives a normalized local primitive with G(2)+G(−2)−G(4)/2=1, violating distribution. The ODE and normalization alone therefore do not determine global values.

**Assumptions:** k ≥ 2 (for k = 1 there is no integration constant: Li^a_1 = −log_a(1 − z)); a ∈ C_p.

**From:** L2.8, L2.5, L2.3, L1.18, L0.21, L0.22. **Sources:** [^120], [^108], [^121].

### L2.13. The modified polylogarithm as an integral rigid function off the residue disc of 1

For k∈ℤ put ℓ_k=Σ_(n≥1,p∤n)t^n/n^k and f_(k,m)=(1−t^(p^m))⁻¹Σ_(0<b<p^m,p∤b)b^(−k)t^b. In 𝒜=Z_p[t,(1−t)⁻¹]^∧, prove f_(k,m)∈𝒜, f_(k,m)≡ℓ_k mod p^mZ_p[[t]] and f_(k,m+1)≡f_(k,m) mod p^m𝒜. Their limit has the given expansion. On X_0={|z|≤1,|z−1|=1}, |ℓ_k|≤1 and |ℓ_k−f_(k,m)|≤p^(−m); integral points have integral values. Mod p, ℓ_k=li_k(t)/(1−t^p), li_k=Σ_(b=1)^(p−1)t^b/b^k. The congruence f_(k,m)(1/t)≡(−1)^(k+1)f_(k,m)(t) extends ℓ_k to P¹∖D⁻(1,1), bounded by 1 with value 0 at infinity. Prove tℓ_k′=ℓ_(k−1), ℓ_0=t/(1−t)−t^p/(1−t^p), and tame distribution Σ_(ζ∈μ_m)ℓ_k(ζt)=m^(1−k)ℓ_k(t^m) on the common domain. Its s=t/(1−t) expansion is restricted over Z_p.

**Assumptions:** k ∈ Z (all integers; k ≥ 0 is what L2 uses); p any prime. No Coleman theory is used in this node; the identification with Li^{(p),a}_k is L2.15.

**Required API.**
- `modPolylogApprox`: modPolylogApprox p k m z := (1 − z^{p^m})^{−1}·Σ_{0<b<p^m, p∤b} b^{−k}z^b, a rational function of z.
- `modPolylogLimit`: modPolylogLimit p k : ℂ_[p] → ℂ_[p]; on X_0 the p-adic limit of modPolylogApprox p k m z, extended to {|z| > 1} by (−1)^{k+1}·modPolylogLimit p k (1/z).
- `norm_modPolylogLimit_sub_approx_le`: For |z| ≤ 1 with |z − 1| = 1: ‖modPolylogLimit p k z − modPolylogApprox p k m z‖ ≤ p^{−m}.
- `norm_modPolylogLimit_le_one`: For |z − 1| ≥ 1: ‖modPolylogLimit p k z‖ ≤ 1.
- `modPolylogLimit_eq_tsum`: For |z| < 1: modPolylogLimit p k z = Σ'_{n≥1, p∤n} z^n/n^k.
- `modPolylogLimit_inv`: For |z − 1| ≥ 1, z ≠ 0: modPolylogLimit p k (1/z) = (−1)^{k+1}·modPolylogLimit p k z.
- `modPolylogLimit_hasDerivAt`: For |z − 1| ≥ 1, z ≠ 0: HasDerivAt (modPolylogLimit p (k+1)) (modPolylogLimit p k z / z) z.
- `modPolylogLimit_zero_index`: modPolylogLimit p 0 z = z/(1 − z) − z^p/(1 − z^p) for |z − 1| ≥ 1.
- `modPolylogLimit_reduction`: For z ∈ 𝓞_ℂ_[p] with |z − 1| = 1: ‖modPolylogLimit p k z − (1 − z^p)^{−1}Σ_{b=1}^{p−1} z^b/b^k‖ ≤ p^{−1}.
- `modPolylogLimit_distribution`: For p ∤ m: Σ_{ζ∈μ_m} modPolylogLimit p k (ζz) = m^{1−k}·modPolylogLimit p k (z^m) where all arguments satisfy |· − 1| ≥ 1.
- `modPolylogElement`: The element ℓ_k of the p-adic completion of Z_p[t, (1 − t)^{−1}] (AdicCompletion of Localization.Away (1 − X)); its expansion at 0 is Σ_{p∤n} t^n/n^k.

**Tests.**
- modPolylogLimit p 0 z = z/(1 − z) − z^p/(1 − z^p) for every z with |z − 1| ≥ 1.
- For p odd and every even k ≥ 2: modPolylogLimit p k (−1) = 0 (from the symmetry at z = −1 = 1/(−1)).
- modPolylogLimit p k 0 = 0, and modPolylogLimit p k z → 0 as |z| → ∞.
- For p odd, modPolylogLimit p 1 (−1) = −(1 − 1/p)·log(2) ≠ −log(2) = Li_1(−1): ℓ_k is not the restriction of Li_k to X_0.
- The expansion of ℓ_k in s = t/(1 − t) is a power series with coefficients in ℤ_[p] that is restricted (PowerSeries.IsRestricted 1) — the Mathlib notion of a Tate-algebra element.

**From:** L2.1, AdicCompletion, Localization.Away, PadicInt, PowerSeries, PowerSeries.IsRestricted, AS-F1. **Sources:** [^122], [^123], [^124], [^125].

**L2.14. Overconvergence of the modified polylogarithm: the series g_k(v).** Put v := 1/(1 − z); it identifies P¹ ∖ D⁻(1,1) with the closed disc |v| ≤ 1 (z = 0 ↦ v = 1, z = ∞ ↦ v = 0, the residue disc of 1 ↦ |v| > 1). Define g_0(v) := v − 1 − (v − 1)^p/(v^p − (v − 1)^p) and, for k ≥ 1, g_k(v) := ∫_1^v g_{k−1}(w)·dw/(w(w − 1)). Then for every k ≥ 0: g_k is a power series in v with coefficients in Q_p converging on the open disc D⁻(0, p^{1/(p−1)}) (radius at least p^{1/(p−1)}; for k = 0 exactly, the poles being v = (1 − ζ)^{−1}, ζ ∈ μ_p ∖ {1}); g_k(0) = g_k(1) = 0; g_k(1 − v) = (−1)^{k+1}g_k(v); g_1(v) = p^{−1}·log(±(v^p − (v − 1)^p)) with the sign making the argument a principal unit; and ℓ_k(z) = g_k(1/(1 − z)) for all z ∈ P¹ ∖ D⁻(1,1), where ℓ_k is L2.13.

**Assumptions:** k ≥ 0; p any prime; D⁻(0, p^{1/(p−1)}) = {v ∈ C_p : |v| < p^{1/(p−1)}}.

**From:** L2.13, L2.2, L0.8, HasFPowerSeriesOnBall, FormalMultilinearSeries.radius. **Sources:** [^126], [^125], [^127].

### L2.15. Coleman's Frobenius relation for the polylogarithms

For k≥0, every branch a and |z−1|>p^(−1/(p−1)), prove Li_k^a(z)−p^(−k)Li_k^a(z^p)=g_k(1/(1−z)) with g_k from L2.14. This branch-independent rigid function on P¹∖D(1,p^(−1/(p−1))) vanishes at infinity. On P¹∖D⁻(1,1) it equals integral ℓ_k and reduces to li_k(z)/(1−z^p). The domain includes primitive p^r roots for r≥2. Derive the identity from Coleman equivariance for z↦z^p and φ*(dz/z)=p dz/z.

**Assumptions:** a ∈ C_p; k ≥ 0; |z − 1| > p^{−1/(p−1)} (so z^p ≠ 1 and z ≠ 1). The bound is sharp: g_0 has poles at v = (1 − ζ)^{−1}, ζ ∈ μ_p ∖ {1}.

**From:** L2.13, L2.14, L2.5, L2.4, L2.7, L2.1, L1.30, L1.18, L1.22, L0.21, L0.22, L1.15. **Sources:** [^126], [^100], [^128], [^127].

### L2.16. An elementary characterisation of the polylogarithms

Let 𝒞^a consist of functions on C_p∖{1} represented by one series on every D⁻(x,1), |x−1|=1, and by polynomials in log_a(z−1) or log_a(1/z) with convergent Laurent coefficients on the punctured disc at 1 or infinity. In this class the Li_k^a are the unique sequence satisfying Li_0=z/(1−z), Li_k(0)=0, dLi_(k+1)=Li_k dz/z, and Li_k(z)−p^(−k)Li_k(z^p)=g_k(1/(1−z)) for a series g_k convergent at |v|<p^(1/(p−1)). This analytic characterization can define Li_k; prove agreement with the Coleman construction using existence, continuation and L2.15.

**Assumptions:** a ∈ C_p; k ≥ 0; the class 𝒞^a depends on the branch only through log_a on the punctured discs of 1 and ∞.

**From:** L2.15, L2.4, L2.5, L2.7, L2.12, L0.21, L0.22, HasFPowerSeriesOnBall.changeOrigin, HasFPowerSeriesAt.eq_zero_of_eventually, L0.7. **Sources:** [^129], [^130], [^131].

### L2.17. Compatibility with automorphisms and embeddings of the coefficients

For every continuous automorphism σ of C_p, σ(Li_k^a(z))=Li_k^(σa)(σz), σ(ζ_p(k))=ζ_p(k) for k≥2, and the analogous identity holds for Li_k^(p),a. Such σ fixes Q_p and preserves the norm. If a∈Q_p, values on finite Galois L/Q_p commute with Gal(L/Q_p). Consequently, for coefficient embeddings ι′=σ∘ι of a number field, Li_k(ι′z)=σ(Li_k(ιz)). At nontrivial roots of unity and k≥2 the result holds for every branch by branch independence.

**Assumptions:** σ a continuous ring automorphism of C_p; a ∈ C_p; k ≥ 0; z ≠ 1.

**From:** L2.4, L2.5, L2.10, L2.1, L0.15, L2.16, L0.17. **Sources:** [^132], [^133], [^134], [^135].

**L2.18. The p-adic dilogarithm D and its two-term, branch and Frobenius identities.** Define D^a(z)=Li_2^a(z)+log_a z·log_a(1−z)/2 for z≠0,1. Prove Li_2^a(z)+Li_2^a(1−z)=−log_a z·log_a(1−z), D^a(1−z)=D^a(1/z)=−D^a(z), and dD^a=(log_a z dlog(1−z)−log_a(1−z)dlog z)/2. Branch change is D^a−D^b=(a−b)(v(z)log_b(1−z)−v(1−z)log_b z)/2. Thus D is branch independent on special units and nontrivial roots, where D(ζ)=Li_2(ζ). On |z−1|>p^(−1/(p−1)), D^a(z)−p⁻²D^a(z^p)=Li_2^(p),a(z)−log_a z·Li_1^(p),a(z)/2, branch-free rigid analytic on U's residue discs; for tame ζ this equals ℓ_2(ζ). Prove σD^a(z)=D^(σa)(σz) for continuous σ.

**Assumptions:** a, b ∈ C_p; z ∉ {0, 1}; v = v_p.

**From:** L2.9, L2.10, L2.11, L2.17, L2.15, L2.5, L2.7, L1.30, L1.18, L1.22, L0.15, L1.43. **Sources:** [^136], [^137], [^138].

**L2.19. The two rational substitutions in Abel's identity.** For x,u in C_p with |x|<1 and |u|<1, put v=u(1-x)/(1-xu), w=x(1-u)/(1-xu). Then |1-x|=|1-u|=|1-xu|=1, 1-v=(1-u)/(1-xu), 1-w=(1-x)/(1-xu), |v|=|u| and |w|=|x|. Thus every displayed denominator is nonzero, and v,w are in the open unit disc. If x,u are nonzero, then x,u,xu,v,w are all different from 0 and 1. Zero x or u is permitted in the norm and rational identities.

**Assumptions:** p any prime; x,u in C_p; |x|<1 and |u|<1.

**From:** L2.1. **Sources:** [^139].

**L2.20. Coefficient bounds for the Abel substitutions.** For fixed u in C_p with |u|<1, there exist coefficients c_n,d_n such that Li_2^ser(u(1-x)/(1-ux))=sum_n c_n x^n and Li_2^ser(x(1-u)/(1-ux))=sum_n d_n x^n for every |x|<1. The sums converge absolutely in norm. One has |c_n| <= C_u := sum_{m>=1} m^2 |u|^m < infinity, d_0=0, and |d_n| <= n^2 for all n. In particular both functions admit a single scalar power series on the entire open unit disc, not just separate local series.

**Assumptions:** p any prime; u in C_p; |u|<1; Li_2^ser is the existing L2 power-series function.

**Tests.**
- For u=0 the v-composite is zero and the w-composite is Li_2^ser(x).

**From:** L2.19, L2.1, FormalMultilinearSeries.ofScalars_norm, FormalMultilinearSeries.le_radius_of_bound, summable_norm_pow_mul_geometric_of_norm_lt_one, HasFPowerSeriesOnBall. **Sources:** [^139].

**L2.21. One-disc analyticity of the Abel difference.** For fixed |u|<1 define v(x)=u(1-x)/(1-xu), w(x)=x(1-u)/(1-xu), A(x)=-Li_1^ser(x), B=-Li_1^ser(u), C(x)=-Li_1^ser(xu), P=A-C, Q=B-C. The function F(x)=Li_2^ser(x)+Li_2^ser(u)-Li_2^ser(xu)-Li_2^ser(v(x))-Li_2^ser(w(x))-P(x)Q(x) has a FormalMultilinearSeries S with HasFPowerSeriesOnBall F S 0 1. All functions here are understood only on |x|<1; their total-function values outside that disc are irrelevant.

**Assumptions:** p any prime; |u|<1; the definition of F is notation within the assertion, not a new function carrier.

**From:** L2.20, L2.1, L0.7, HasFPowerSeriesOnBall, FormalMultilinearSeries.le_radius_of_bound. **Sources:** [^139].

**L2.22. Abel's dilogarithm identity on the open unit bidisc.** For |x|<1 and |u|<1 in C_p, including zero values, set v=u(1-x)/(1-xu), w=x(1-u)/(1-xu). Then Li_2^ser(x)+Li_2^ser(u)-Li_2^ser(xu)-Li_2^ser(v)-Li_2^ser(w)=(Li_1^ser(x)-Li_1^ser(xu))(Li_1^ser(u)-Li_1^ser(xu)). Equivalently the right side is P Q with P=log(1-x)-log(1-xu), Q=log(1-u)-log(1-xu), using the ordinary principal-unit series.

**Assumptions:** p any prime; |x|<1 and |u|<1; no nonzero condition and no branch choice needed in the statement.

**Tests.**
- At x=0 and any |u|<1 both sides of the ordinary identity equal zero.
- The wrong-sign residual has XU coefficient 2, which is nonzero in C_2 as well as every C_p.

**From:** L2.21, L2.19, L2.1, L0.15, L0.8, HasFPowerSeriesOnBall.fderiv, HasFPowerSeriesAt.eq_formalMultilinearSeries. **Sources:** [^139].

**L2.23. Cancellation of the two branch logarithms.** For nonzero |x|,|u|<1 and any branch log_a on C_p, write v=u(1-x)/(1-xu), w=x(1-u)/(1-xu), L=log_a x, M=log_a u, A=log_a(1-x), B=log_a(1-u), C=log_a(1-xu), P=A-C, Q=B-C. Then log_a(xu)=L+M, log_a v=M+P, log_a(1-v)=Q, log_a w=L+Q, log_a(1-w)=P, and [LA+MB-(L+M)C-(M+P)Q-(L+Q)P]/2=-P Q.

**Assumptions:** p any prime; x,u nonzero with norms below 1; log_a is the existing normalized branch; 2 is invertible in C_p, also when p=2.

**From:** L2.19, L0.15. **Sources:** [^139].

**L2.24. The five-term dilogarithm relation on nested discs.** For every branch a, any prime p and x,y in C_p with 0<|y|<|x|<1, D^a(x)-D^a(y)+D^a(y/x)-D^a((1-x^(-1))/(1-y^(-1)))+D^a((1-x)/(1-y))=0. Here D^a is the existing L2 dilogarithm; all five arguments are different from 0 and 1.

**Assumptions:** p any prime; a in C_p; y!=0, |y|<|x| and |x|<1. No finite-extension or bounded-ramification hypothesis.

**Tests.**
- At p=2, (x,y)=(2,8) satisfies the relation for every branch.
- At p=5, (x,y)=(5,25) satisfies the relation for every branch.

**From:** L2.22, L2.23, L2.19, L2.18, L2.5. **Sources:** [^139].

### L2.25. Polylogarithm values at roots of unity of order prime to p

Let ζ ∈ C_p be a root of unity of order N ≥ 2 with p ∤ N, let f be the order of p in (Z/NZ)^× (so ζ^{p^f} = ζ and Q_p(ζ) is unramified of degree f), and k ≥ 1. For every branch a: (a) Li^a_k(ζ) − p^{−k}Li^a_k(ζ^p) = ℓ_k(ζ) (the Frobenius relation at a point with φ(ζ) = ζ^p), hence Li^a_k(ζ) = (1 − p^{−kf})^{−1}·Σ_{i=0}^{f−1} p^{−ik}ℓ_k(ζ^{p^i}) = p^k(p^{kf} − 1)^{−1}Σ_{i=0}^{f−1}p^{(f−1−i)k}ℓ_k(ζ^{p^i}); in particular Li^a_k(ζ) does not depend on a and lies in Q_p(ζ); (b) Li_k(ζ) ∈ p^k·Z_p[ζ] (for k = 1: Li_1(ζ) = −log(1 − ζ) ∈ pZ_p[ζ]); (c) p^{−k}Li_k(ζ) ≡ −li_k(σ(ζ))/(1 − ζ) mod p, where σ(ζ) := ζ^{p^{f−1}} is the root of unity with σ(ζ)^p = ζ and li_k(x) := Σ_{b=1}^{p−1}x^b/b^k (Besser's finite polylogarithm); equivalently p^{−k}Li_k(ζ^p) ≡ −li_k(ζ)/(1 − ζ)^p mod p; (d) Li_k(ζ^{−1}) = (−1)^{k+1}Li_k(ζ).

**Assumptions:** ζ a root of unity of order N ≥ 2, p ∤ N; k ≥ 1; a ∈ C_p arbitrary.

**From:** L2.15, L2.13, L2.2, L2.9, L2.5, TauCeti.teichmuller. **Sources:** [^140], [^141], [^142], [^143].

**L2.26. Values at points of finite extensions of Q_p.** Let K ⊂ C_p be a finite extension of Q_p and a ∈ K. Then Li^a_k(K ∖ {1}) ⊂ K for every k ≥ 0, Li^{(p),a}_k maps {z ∈ K : z^p ≠ 1} into K, and ζ_p(k) ∈ Q_p for every k ≥ 2. For a ∈ Q_p (in particular the Iwasawa branch) and K Galois over Q_p, τ(Li^a_k(z)) = Li^a_k(τ z) for z ∈ K ∖ {1} and τ ∈ Gal(K/Q_p).

**Assumptions:** K finite over Q_p; a ∈ K; k ≥ 0.

**From:** L2.25, L2.9, L2.11, L2.17, L2.4, L2.7, L2.1, L0.15, TauCeti.teichmuller, L0.17. **Sources:** [^137], [^144].

### L2.27. Polylogarithm values at roots of unity of p-power order

For primitive ζ of order p^r, r≥1, Li_1^a(ζ)=−log_a(1−ζ), branch difference is −(a−b)/(p^(r−1)(p−1)), and the primitive-root sum is −a. Nontrivial character sums cancel this difference. For k≥2, Li_k^a(ζ)=λ_k(ζ)∈Q_p(ζ), independently of a. If r≥2 and k≥0, Li_k^a(ζ)−p^(−k)Li_k^a(ζ^p)=g_k(1/(1−ζ)). For k≥2, Σ_(c=1)^(p−1)Li_k(ζ_p^c)=(p^(1−k)−1)ζ_p(k), and Σ_(η∈μ_(p^r))Li_k(η)=p^(r(1−k))ζ_p(k). For k≥1, Li_k(ζ⁻¹)=(−1)^(k+1)Li_k(ζ). Prove Galois equivariance for k≥2, and for k=1 when a∈Q_p.

**Assumptions:** ζ of exact order p^r, r ≥ 1; a, b ∈ C_p; k as indicated.

**From:** L2.2, L2.4, L2.10, L2.15, L2.14, L2.11, L2.9, L2.17, L2.26, Polynomial.eval_one_cyclotomic_prime_pow, L0.15. **Sources:** [^145], [^113], [^126].

**L2.28. The expansion of Li_k((1+T)ε) at a root of unity and its logarithmic growth.** For a root ε of order N≥2 that is not a p-power, P_(k,ε)(T)=Li_k^a(ε(1+T)) belongs to Q_p(ε)[[T]]∩R⁺ independently of a. Its constant is Li_k(ε), P_(0,ε)=ε(1+T)/(1−ε(1+T))=A_ε−1, A_ε∈Z_p[ε][[T]], and ∂P_k=P_(k−1). For n≥1, v_p(c_n)≥−k⌊log_p n⌋−C, C=max(0,−min_(1≤j≤k)v_p Li_j(ε)); C=0 for tame ε. Hence |c_n|≤p^C n^k. For nontrivial primitive θ, G(θ⁻¹)⁻¹Σ_c θ⁻¹(c)P_(k,ε^c) has the same logarithmic growth, ∂^k equal to RJW's F_θ, and constant G⁻¹Σ_c θ⁻¹(c)Li_k(ε^c). For N=p^r, the expression λ_k(ε(1+T))−log(1+T)^(k−1)log_a(1−ε(1+T))/(k−1)! has a singularity at T=ε⁻¹−1 inside |T|<1. The distinct singularities in its character sum do not cancel; neither expression lies in R⁺.

**Assumptions:** ε of exact order N ≥ 2; a ∈ C_p; k ≥ 0; R^+ = {Σ c_nT^n : |c_n|r^n → 0 for every r < 1} (RJW Remark 3.39); logarithmic growth of order h means |c_n| = O(n^h). Part(b) requires theta primitive of conductor N; this is the hypothesis that guarantees the Gauss sum is nonzero. The all-branch statement in(a) uses norm(epsilon-1)=1, not merely a chosen smaller neighborhood.

**From:** L2.2, L2.5, L2.4, L2.10, L2.7, L2.25, L2.26, L0.21, L0.22, PowerSeries, PowerSeries.IsRestricted, gaussSum, DirichletCharacter. **Sources:** [^146], [^7], [^147], [^148].

**L2.29. Norm and trace compatibilities: sums over conjugate roots of unity.** For primitive ε of order N≥2, k≥1 (a∈Q_p if k=1), prove σLi_k(ε)=Li_k(ε^(c_σ)) and trace equal to the Galois-orbit sum. For tame N, Frobenius c=p generates the group; Tr Li_1^a(ε)=−log_a Norm(1−ε). For k≥2 the sum over all primitive roots is ζ_p(k)Σ_(d|N)μ(N/d)d^(1−k)=ζ_p(k)N^(1−k)∏_(ℓ|N)(1−ℓ^(k−1)). For k=1 it is −log_a Φ_N(1), giving −a for N=p^r, −log ℓ for N=ℓ^s with ℓ≠p, and 0 otherwise. If M|N have the same prime divisors, the sum over c≡c_0 mod M is (N/M)^(1−k)Li_k^a(ε^(c_0N/M)). Include adjacent p-power levels.

**Assumptions:** ε primitive of order N ≥ 2; k ≥ 1; a ∈ Q_p when k = 1 in (a); in (b) for k ≥ 2 the value Li_k(1) = ζ_p(k).

**From:** L2.17, L2.26, L2.11, L2.8, L2.2, Polynomial.eval_one_cyclotomic_prime_pow, Polynomial.eval_one_cyclotomic_not_prime_pow, IsPrimitiveRoot, L0.15. **Sources:** [^97], [^149].

### L2.30. The complex polylogarithm at roots of unity, compared with the p-adic one

For k≥2, the principal complex value Li_k^C(e^(2πix))=Σ_(n≥1)e^(2πinx)/n^k=HurwitzZeta.expZeta(x,k). At x=j/N it equals ZMod.LFunction of n↦e^(2πijn/N), or N^(−k)Σ_(b mod N)e^(2πijb/N)ζ(k,b/N). At weight 1 and ε≠1 use −Log(1−ε). Prove distribution and, for 0<x<1,k≥1, inversion Li_k^C(e^(2πix))+(−1)^kLi_k^C(e^(−2πix))=−(2πi)^k B_k(x)/k!, versus zero for p-adic root inversion. Shared rational coefficients do not identify the values: Li_2^C(−1)=−π²/12 versus Li_2(−1)=0 for odd p, and Li_2^C(1/2)=π²/12−log(2)²/2 versus Li_2(1/2)=−log_p(2)²/2. Comparisons use chosen embeddings of algebraic character values and Gauss sums.

**Assumptions:** k ≥ 2 in (a) except for the last sentence; x real; N ≥ 1.

**From:** L2.Fa, L2.9, L2.25, L2.18, HurwitzZeta.expZeta, HurwitzZeta.hasSum_expZeta_of_one_lt_re, ZMod.LFunction, ZMod.LFunction_stdAddChar_eq_expZeta, HurwitzZeta.cosZeta_two_mul_nat, HurwitzZeta.sinZeta_two_mul_nat_add_one, Complex.hasSum_taylorSeries_neg_log. **Sources:** [^150], [^149], [^151].

### L2.31. Scalar five-term dilogarithm expression

For the fixed branch a define R_a(x,y)=D^a(x)−D^a(y)+D^a(y/x)−D^a((1−x⁻¹)/(1−y⁻¹))+D^a((1−x)/(1−y)). The mathematical domain is the admissible pairs; this is a scalar expression in ℂ_p, not a new pre-Bloch group or projective cross-ratio.

**Assumptions:** [^C6] [^C7]

**Required API.**
- `fiveTermDefect_eq`: R(x,y) is the displayed five-term expression with fourth coefficient −1 and fifth coefficient +1.
- `fiveTermDefect_swap`: R(y,x)=−R(x,y).
- `fiveTermDefect_one_sub`: R(1−x,1−y)=−R(x,y).
- `fiveTermDefect_inv`: R(x⁻¹,y⁻¹)=−R(x,y).
- `fiveTermDefect_dilate`: R(x⁻¹,y/x)=−R(x,y).
- `fiveTermDefect_move_origin`: R(x/(x−1),(y−x)/(1−x))=−R(x,y).
- `fiveTermDefect_fractional`: R(x/(x−1),y/(y−1))=−R(x,y).
- `fiveTermDefect_mixed_norm`: R(x,y)=0 when 0<|x|<1<|y|.
- `fiveTermDefect_separated_discs`: R(x,y)=0 when 0<|x|<1 and 0<|1−y|<1.
- `fiveTermDefect_close_pair`: R(x,y)=0 when 0<|x|=|y|<1 and 0<|x−y|<|x|.
- `fiveTermDefect_small_first`: When 0<|x|<1, R(x,y) is zero or equals, up to sign, R(u,v) with admissible u,v and |v|=|1−v|=1.
- `fiveTermDefect_reduce_special_unit`: Every admissible pair has the same zero-or-signed-special-unit reduction.
- `fiveTermDefect_vanishes_of_special_units`: Vanishing for every admissible pair with special-unit second coordinate implies vanishing for every admissible pair.

**Tests.**
- At p=5, R_a(5,25)=0, by the exact inherited nested-disc theorem.
- At p=2, R_a(2,8)=0; no odd-prime assumption is present.
- At p=5, R_a(5,30)=0: |5|=|30|=1/5 but |5−30|=1/25.
- At p=5, R_a(5,6)=0: 5 is close to0 and6 is close to1.

**From:** L2.18. **Sources:** [^152].

**L2.32. Admissibility of the five dilogarithm arguments.** For an admissible pair x,y, all three additional arguments A=y/x, B=(1−x)/(1−y), C=(1−x⁻¹)/(1−y⁻¹)=AB are different from0 and1.

**Assumptions:** [^C6] [^C7]

**From:** . **Sources:** [^152].

**L2.33. Exchange of the two scalar inputs.** For admissible x,y, R_a(y,x)=−R_a(x,y).

**Assumptions:** [^C6] [^C7]

**From:** L2.31, L2.32, L2.18. **Sources:** [^152].

**L2.34. Simultaneous complementation of the inputs.** For admissible x,y, R_a(1−x,1−y)=−R_a(x,y).

**Assumptions:** [^C6] [^C7]

**From:** L2.31, L2.32, L2.18. **Sources:** [^152].

**L2.35. Simultaneous inversion of the inputs.** For admissible x,y, R_a(x⁻¹,y⁻¹)=−R_a(x,y).

**Assumptions:** [^C6] [^C7]

**From:** L2.31, L2.32, L2.18. **Sources:** [^152].

**L2.36. Dilation by the first input.** For admissible x,y, R_a(x⁻¹,y/x)=−R_a(x,y).

**Assumptions:** [^C6] [^C7]

**From:** L2.31, L2.32, L2.18. **Sources:** [^152].

**L2.37. Moving the first input to the origin.** For admissible x,y, R_a(x/(x−1),(y−x)/(1−x))=−R_a(x,y).

**Assumptions:** [^C6] [^C7]

**From:** L2.34, L2.36. **Sources:** [^152].

**L2.38. Fractional transformation of both inputs.** For admissible x,y, R_a(x/(x−1),y/(y−1))=−R_a(x,y).

**Assumptions:** [^C6] [^C7]

**From:** L2.35, L2.34. **Sources:** [^152].

**L2.39. Five-term relation across small and large norms.** If 0<|x|<1<|y|, then R_a(x,y)=0.

**Assumptions:** [^C6] [^C7] x≠0, |x|<1 and1<|y|; the other admissibility conditions follow.

**From:** L2.33, L2.36, L2.24, PadicComplex.isNonarchimedean, norm_div, norm_inv. **Sources:** [^152].

**L2.40. Five-term relation on two separated residue discs.** If 0<|x|<1 and0<|1−y|<1, then R_a(x,y)=0.

**Assumptions:** [^C6] [^C7] x≠0, |x|<1, y≠1 and |1−y|<1.

**From:** L2.38, L2.39, PadicComplex.isNonarchimedean, norm_div, norm_inv. **Sources:** [^152].

**L2.41. Five-term relation for an equal-norm collision.** If0<|x|=|y|<1 and0<|x−y|<|x|, then R_a(x,y)=0.

**Assumptions:** [^C6] [^C7] x≠0, |x|<1, |y|=|x|, x≠y and |x−y|<|x|.

**From:** L2.37, L2.24, PadicComplex.isNonarchimedean, norm_div, norm_inv. **Sources:** [^152].

**L2.42. Norm reduction when the first input is small.** For an admissible pair with |x|<1, either R_a(x,y)=0, or there exist admissible u,v with |v|=|1−v|=1 such that R_a(x,y)=R_a(u,v) or R_a(x,y)=−R_a(u,v).

**Assumptions:** [^C6] [^C7] |x|<1.

**From:** L2.39, L2.40, L2.41, L2.33, L2.36, L2.24, PadicComplex.isNonarchimedean, norm_div, norm_inv. **Sources:** [^152].

### L2.43. Exhaustive scalar reduction to special units

For every admissible pair x,y, either R_a(x,y)=0, or there exist admissible u,v with |v|=|1−v|=1 such that R_a(x,y)=R_a(u,v) or R_a(x,y)=−R_a(u,v).

**Assumptions:** [^C6] [^C7]

**From:** L2.42, L2.35, L2.34, L2.33, PadicComplex.isNonarchimedean, norm_div, norm_inv. **Sources:** [^152].

### L2.44. Special-unit sufficiency for the scalar five-term theorem

For a fixed branch a, assume the special-unit subcase: R_a(u,v)=0 for every admissible u,v with |v|=|1−v|=1. Then R_a(x,y)=0 for every admissible x,y.

**Assumptions:** [^C6] [^C7] For every admissible u,v with |v|=|1−v|=1, the special-unit scalar identity R_a(u,v)=0 is supplied as an explicit hypothesis.

**From:** L2.43. **Sources:** [^152].

**L2.45. Logarithmic coordinates of the five argument maps.** For admissible x,v in C_p, write X=log_a x, U=log_a(1−x), V=log_a v, W=log_a(1−v), H=log_a(x−v), and alpha=dx/x, beta=dx/(x−1), gamma=dx/(x−v). For the ordered arguments x,v,v/x,v(x−1)/(x(v−1)),(1−x)/(1−v), the pairs(log f,log(1−f)) are (X,U),(V,W),(V−X,H−X),(V+U−X−W,H−X−W),(U−W,H−W). Their differential pairs are(alpha,beta),(0,0),(−alpha,gamma−alpha),(beta−alpha,gamma−alpha),(beta,gamma).

**Assumptions:** p is prime; a in C_p is any branch parameter; x,v are different from0,1 and x≠v. No special-unit or algebraicity assumption is needed.

**From:** L2.32, L0.15, L0.19, HasDerivAt. **Sources:** [^77].

**L2.46. Vanishing differential of the scalar five-term defect.** For every branch a and every admissible pair x,v in C_p, HasDerivAt (x↦R_a(x,v)) 0 holds at x, where R_a is the existing scalar fiveTermDefect. This is a differential statement on the admissible open locus; global vanishing is not asserted.

**Assumptions:** p is prime; a in C_p is any branch parameter; x,v are different from0,1 and x≠v.

**From:** L2.31, L2.45, L2.18, HasDerivAt. **Sources:** [^77].

**L2.47. Local analyticity of the actual polylogarithm.** For every natural k and z≠1, the function Li_k^a is analytic at z over ℂ_p.

**Assumptions:** [^C8] [^C9]

**From:** L2.5, L2.4, L2.1. **Sources:** [^153].

**L2.48. Weight one and the fixed logarithm branch.** For z≠1, the actual weight-one polylogarithm satisfies Li_1^a(z)=−L(1−z).

**Assumptions:** [^C8] [^C9]

**From:** L2.5. **Sources:** [^153].

**L2.49. Continuity of the Coleman dilogarithm.** For z≠0,1, the existing Coleman dilogarithm D^a is continuous at z as an ℂ_p-valued function.

**Assumptions:** [^C8] [^C9]

**Tests.**
- For p=2 and every branch, D^a is continuous at 2.

**From:** L2.47, L2.48, L2.18, AnalyticAt.continuousAt. **Sources:** [^153].

**L2.50. Continuity of the five-term expression.** The actual scalar function (x,y)↦R_a(x,y) is continuous on the admissible open set A⊂ℂ_p².

**Assumptions:** [^C8] [^C9]

**Tests.**
- For p=2 and every branch, (x,y)↦R_a(x,y) is continuous at (2,8).

**From:** L2.31, L2.32, L2.49. **Sources:** [^153].

**L2.51. The special-unit admissible locus is open.** The set S={(x,y)∈A: |y|=|1−y|=1} is open in ℂ_p².

**Assumptions:** [^C8] [^C9]

**Tests.**
- At p=3, (3,2) belongs to S and |3|≠1; restricting the first coordinate to special units would fail this test.
- At p=5, (2,2) does not belong to S.
- At p=3, (0,2) does not belong to S.

**From:** PadicComplex.isUltrametricDist, IsUltrametricDist.isOpen_sphere, isOpen_ne_fun. **Sources:** [^153].

**L2.52. Algebraic pairs are dense in the special-unit locus.** Let e:PadicAlgCl(p)²→ℂ_p² be the pair of canonical completion embeddings. Then S⊆closure(S∩range(e)). Thus admissible algebraic pairs with special-unit second coordinate approximate every pair in S while retaining those conditions.

**Assumptions:** [^C8] [^C9]

**From:** L2.51, PadicComplex, UniformSpace.Completion.denseRange_coe₂, Dense.open_subset_closure_inter. **Sources:** [^153].

### L2.53. Reduction to algebraic special-unit inputs

Fix a branch. Assume R_a(e(u),e(v))=0 for every u,v in the existing PadicAlgCl(p) whose image pair is in S. Then R_a(x,y)=0 for every admissible x,y∈ℂ_p. This is a conditional density-and-norm reduction. Its hypothesis is supplied by five-term-algebraic-special-unit-constancy and the geometric boundary normalization.

**Assumptions:** [^C8] [^C9]

**From:** L2.50, L2.52, L2.44, Set.EqOn.of_subset_closure. **Sources:** [^153].

**L2.54. The normalized polylogarithm at zero.** For every natural k, Li_k^a(0)=0.

**Assumptions:** [^C2] [^C3]

**From:** L2.5, L2.1. **Sources:** [^20].

**L2.55. Dilogarithm limit under a bounded-log hypothesis.** Let u_n→0 in C_p, with u_n≠0 eventually, and suppose there is a real M with |L(u_n)|≤M eventually. Then D^a(u_n)→0.

**Assumptions:** [^C2] [^C3] u is a sequence; convergence, eventual nonvanishing and the eventual real norm bound on L(u_n) are explicit hypotheses.

**From:** L2.47, L2.54, L0.19, L2.18, AnalyticAt.continuousAt, Filter.isBoundedUnder_le_mul_tendsto_zero. **Sources:** [^20].

**L2.56. Dilogarithm along a scaled geometric sequence.** For every c≠0 in C_p, D^a(c q_n)→0 as n→∞.

**Assumptions:** [^C2] [^C3] c∈C_p is nonzero; c and a need not be algebraic.

**From:** L0.24, L2.55, tendsto_pow_atTop_nhds_zero_of_norm_lt_one, Padic.norm_p_lt_one, PadicComplex.norm_extends'. **Sources:** [^20].

**L2.57. Dilogarithm along a geometric quotient.** For every c≠0 in C_p, D^a(c q_n/(1+q_n))→0 as n→∞.

**Assumptions:** [^C2] [^C3] c∈C_p is nonzero; no finite-extension hypothesis.

**Tests.**
- At p=2, D^a(2^(n+1)/(1+2^(n+1))) tends to zero for every branch a.

**From:** L0.25, L0.19, L2.55, IsUltrametricDist.norm_natCast_le_one, tendsto_pow_atTop_nhds_zero_of_norm_lt_one, Filter.Tendsto.div, Padic.norm_p_lt_one, PadicComplex.norm_extends'. **Sources:** [^20].

**L2.58. Admissibility near the boundary point one.** For every v≠0,1, the pairs (1+q_n,v) are admissible for all sufficiently large n.

**Assumptions:** [^C2] [^C3] v∈C_p differs from 0 and 1.

**Tests.**
- At p=3 the pair (1+3^(n+1),2) is admissible for every n.

**From:** tendsto_pow_atTop_nhds_zero_of_norm_lt_one, Padic.norm_p_lt_one, PadicComplex.norm_extends'. **Sources:** [^20].

**L2.59. The five-term expression on the boundary sequence.** For v≠0,1 and every n, R_a(1+q_n,v)=−D^a(−q_n)−D^a(v)+D^a(v/(1+q_n))−D^a((v/(v−1))q_n/(1+q_n))+D^a(q_n/(v−1)).

**Assumptions:** [^C2] [^C3] v∈C_p differs from 0 and 1.

**Tests.**
- At p=3 and n=0: R_a(4,2)=−D^a(−3)−D^a(2)+D^a(1/2)−D^a(3/2)+D^a(3).

**From:** L2.31, L2.18, Padic.norm_p_lt_one, PadicComplex.norm_extends'. **Sources:** [^20].

### L2.60. Vanishing limit of the five-term expression

For every v∈C_p with v≠0,1, R_a(1+q_n,v)→0.

**Assumptions:** [^C2] [^C3] v∈C_p differs from 0 and 1; both v and a can be transcendental.

**Tests.**
- For v≠0,1 and any δ∈C_p, R_a(1+q_n,v)+δ tends to δ. A nonzero added constant survives the boundary test even though it does not change a derivative.

**From:** L2.59, L2.58, L2.56, L2.57, L2.49, Filter.Tendsto.div, tendsto_pow_atTop_nhds_zero_of_norm_lt_one, Padic.norm_p_lt_one, PadicComplex.norm_extends'. **Sources:** [^20].

**L2.61. Determination of a constant by the boundary limit.** For v≠0,1 and C∈C_p, if R_a(1+q_n,v)=C for all sufficiently large n, then C=0.

**Assumptions:** [^C2] [^C3] v≠0,1 and an actual eventual equality R_a(1+q_n,v)=C are supplied.

**From:** L2.60, tendsto_nhds_unique_of_eventuallyEq. **Sources:** [^20].

### L2.62. Reduction to algebraic constancy on a punctured line

Fix a branch and let e:PadicAlgCl(p)→C_p be the canonical completion embedding. Suppose that for every v in PadicAlgCl(p) with |e(v)|=|1−e(v)|=1 there exists C_v such that R_a(e(u),e(v))=C_v for every u in PadicAlgCl(p) with e(u)≠0,1,e(v). Then R_a(x,y)=0 for every admissible x,y∈C_p.

**Assumptions:** [^C2] [^C3] The stated constancy on all admissible algebraic first coordinates is an explicit hypothesis; constancy only on the special-unit tube is insufficient.

**From:** L2.58, L2.61, L2.53, PadicComplex.coe_eq, PadicComplex.coe_natCast. **Sources:** [^20].

**L2.63. A logarithmic Laurent end determines its punctured disc.** Let L be the actual logarithm branch. Suppose f and g each have a finite polynomial expansion in L(z−c), with Laurent coefficients converging absolutely at every real radius 0<ρ<1, as in the existing IsLogLaurentNear. If for some 0≤r<1 one has f(z)=g(z) whenever r<|z−c|<1, then f(z)=g(z) for every 0<|z−c|<1. A germ equality means such equality on an outer annulus; it is not merely agreement on a finite collection of points.

**Assumptions:** p is any prime; a,c∈C_p; L=log_a; 0≤r<1. Both functions have the existing whole-punctured-disc logarithmic Laurent expansions, with a finite logarithmic degree and all-radius convergence.

**Tests.**
- The indicator of |z|<|p| has no IsLogLaurentNear expansion at0, although it is locally constant and vanishes on its outer end.

**From:** L0.21, L0.20, L2.16, PH-P7. **Sources:** [^154].

**L2.64. A logarithmic Laurent end determines the disc at infinity.** Let f,g satisfy the existing IsLogLaurentAtInfty for the same branch. If for some 0≤r<1 they agree whenever r<|1/z|<1, then they agree for every |z|>1. This compares the functions on the entire punctured residue disc of∞.

**Assumptions:** p is any prime; a∈C_p; L=log_a; 0≤r<1; both expansions converge at every parameter radius0<ρ<1.

**From:** L2.63, L2.16, norm_inv. **Sources:** [^155].

**L2.65. Whole-disc expansions of the scalar defect.** For any special unit v∈C_p and branch L, the function z↦R_a(z,v) has an IsLogLaurentNear expansion at each of0,1,v and an IsLogLaurentAtInfty expansion at∞. The logarithmic degree is finite; each Laurent coefficient converges on the whole punctured parameter disc. These statements concern the actual dilogD and fiveTermDefect defined here, not an abstract replacement.

**Assumptions:** p is any prime; a∈C_p; L=log_a; |v|=|1−v|=1. No algebraicity restriction is needed for these local expansions.

**From:** L1.44, L1.41, L2.4, L2.5, L2.18, L2.31, L0.19, L0.15, L0.10. **Sources:** [^83].

**L2.66. Coleman membership of the scalar defect.** Let v lie in a finite extension K/Q_p and satisfy |v|=|1−v|=1. In the existing Coleman algebra for the four-punctured pair Y_v, the element H_v=f_0^*D−D(v)+f_1^*D−f_2^*D+f_3^*D has, on every ordinary source disc, the actual values R_a(z,v), and at every source end the germ of the function R_a(·,v). It is a Coleman function of depth at most2. The equality at regular-image additional ends uses the ordinary-series restriction of L1.42.

**Assumptions:** K is finite over Q_p; v∈K is a special unit; a∈C_p is arbitrary. The four-puncture Frobenius datum and the actual Li_2 and logarithm branches are those already planned; no new Coleman carrier is introduced.

**From:** L1.42, L1.43, L1.17, L1.39, L1.40, L2.3, L2.18, L2.31, L2.65. **Sources:** [^156].

**L2.67. One Coleman constant for the scalar defect.** For the Coleman element H_v of five-term-defect-coleman there exists one C_v∈C_p with H_v=C_v in A_Col^a(Y_v), hence in every component of A_loc. Thus the actual scalar defect is C_v on every ordinary residue disc and its germ at each of0,1,v,∞ is the constant C_v. The same constant is used in all components.

**Assumptions:** K/Q_p finite; v∈K special unit; arbitrary branch a∈C_p. H_v is the actual pullback realization supplied by five-term-defect-coleman.

**From:** L2.66, L2.46, L1.18, L1.17, L1.16. **Sources:** [^157].

### L2.68. Constancy of the actual defect for an algebraic special unit

Let v be in PadicAlgCl(p), embedded into C_p, and |v|=|1−v|=1. For every branch there exists C_v∈C_p such that R_a(x,v)=C_v for every x∈C_p minus {0,1,v}. This includes all points in the four punctured residue discs, not only the special-unit tube.

**Assumptions:** p is any prime, including2; v is algebraic over Q_p; a∈C_p is arbitrary. The actual dilogD and fiveTermDefect are used throughout.

**From:** L2.67, L2.65, L2.63, L2.64, L1.34, L2.26. **Sources:** [^83].

### L2.69. The scalar five-term dilogarithm identity

For every primep, every brancha∈C_p and every x,y∈C_p with x,y≠0,1 and x≠y, the actual fiveTermDefect R_a(x,y) is zero. This is the scalar part of L2.70. L2.Fb supplies pre-Bloch evaluation and Bloch branch descent; the projective reformulation is separate.

**Assumptions:** p is any prime, including2; a∈C_p; x,y≠0,1; x≠y.

**Tests.**
- For any branch onC_3 the scalar defectR_a(4,2) is0.
- For a special unitζ∈C_2 withζ²+ζ+1=0, the scalar defectR_a(2,ζ) is0 for every branch.

**From:** L2.68, L2.62. **Sources:** [^158].

### L2.70. The five-term relation for the p-adic dilogarithm

For x,y∈C_p∖{0,1}, x≠y, the scalar relation is D^a(x)−D^a(y)+D^a(y/x)−D^a((1−x⁻¹)/(1−y⁻¹))+D^a((1−x)/(1−y))=0. The further projective target is Σ_(i mod 5)D^a([s_i,s_(i+1),s_(i+2),s_(i+3)])=0 for five distinct P¹ points, with [a,b,c,d]=(a−b)(c−d)/((a−d)(c−b)) and all infinity cases. Over every K⊆C_p this must induce pre-Bloch group→C_p, branch independent on the Bloch kernel. L2.69 supplies the scalar identity and L2.Fb the Bloch boundary and branch descent. The projective/infinity comparison requires its own algebraic proof.

**Assumptions:** a ∈ C_p; x, y ∉ {0, 1}, x ≠ y; p any prime.

**From:** L2.18, L2.11, L2.4, L2.9, L1.17, L1.43, L1.18, L2.24, L2.Fb, L2.44, L1.39, L1.40, L2.46, L2.53, L2.62, L2.69. **Sources:** [^159], [^160], [^161], [^139].

**L2.71. Twisted sums Σ_c θ^{−1}(c)Li_k(ε^c) for primitive characters.** For nontrivial θ mod N, primitive ε and k≥1, set S_k^a=Σ_cθ⁻¹(c)Li_k^a(ε^c), G=Σ_cθ⁻¹(c)ε^c. Prove branch independence, S(ε^b)=θ(b)S(ε) for units b, and the primitive-character Gauss identity G(ε^b)=θ(b)G(ε) for all residues b. Thus S/G is root independent. Parity gives S=−θ(−1)(−1)^kS, vanishing unless θ(−1)=(−1)^(k+1). If θ is primitive and N≠p or k≥2, Σ_cθ⁻¹(c)Li_k^(p),a(ε^c)=(1−θ(p)p^(−k))S, taking θ(p)=0 for p|N. Continuous automorphisms transform both sums compatibly with θ, ε and a, and transform the quotient accordingly.

**Assumptions:** θ nontrivial modulo N ≥ 2 (primitive where stated); ε primitive N-th root of unity; k ≥ 1; for (d) with N = p, k ≥ 2 (Li_1(1) is undefined).

**From:** L2.10, L2.9, L2.11, L2.17, L2.2, L2.5, DirichletCharacter, DirichletCharacter.IsPrimitive, gaussSum, gaussSum_mulShift_of_isPrimitive, L3.9. **Sources:** [^162], [^163], [^164].

## L3. Positive integer L-values and regulators

Use geometric measures away from the disc of one, and pole-cancelled smoothing on that disc. Negative moments yield the character sum with its Euler factor and Teichmüller twist. Keep the scalar formula, the complex comparison, and the motivic regulator interpretation distinct: the final interpretation requires the stated regulator and realization interfaces.

**L3.Fa. Cyclotomic motivic input.** Construct the de Jeu symbol complexes M̃•_(n)(F), their localization maps and comparison to the Adams-weight n part of K_(2n−1)(F)_ℚ under the hypotheses of BDJ Theorem 1.6. Construct [ζ]_n for n≥2, ζ≠1 and prove the cyclotomic eigenspace spanning statements used in BBdJR Proposition 4.17. These include the relative K-theory, localization and symbol relations, rather than only a name for K-groups. Sources: BDJ §§1,3; Theorems 1.6, 1.10 and 1.12, pp.870–877; BBdJR §4, Proposition 4.17, pp.21–22.

**L3.Fb. Regulator input.** Construct rigid syntomic regulators with the target identification of BDJ Definition 4.6. For special units prove reg([x]_n)=±(n−1)!L_n^mod(x), with the source's sign and normalization, by the multi-relative K-theory, relative Chern-class and integration-down construction of BDJ §§3–7. Include the Gros comparison and its Euler factor before using L3.37. Sources: BDJ Theorem 1.10(2), pp.874–875, Theorem 1.12, pp.875–877; BBdJR Theorem 4.14 and Remark 4.16, pp.20–21.

**L3.Fc. Complex regulator input.** Construct the Beilinson regulator pairing and its coefficient and Galois functoriality. Prove the Borel rank and idempotent dimension statement used in L3.16, and the cyclotomic regulator determinants used in L3.36. Sources: BBdJR Definitions 3.5–3.6, Proposition 3.12 and §4, Proposition 4.17, pp.10–14,21–22.

**L3.Fd. Artin L-values.** Import `AA-Artin`'s complex finite-image Artin factors, inertia invariants, ramified induction and meromorphic germs: `FiniteImageArtin.localFactor`, `localFactor_induction`, `globalL_eq_eulerProduct`, `oneDimensional_eq_hecke`. For E-valued representations, apply this interface at each embedding E→ℂ and assemble the coefficient-valued function; prove independence of realization and direct-sum compatibility. Construct the p-adic parity components by Brauer induction from totally real fields, prove expression independence, and specify Eul_p and ω_p^(1−n). The abelian specialization agrees with DP3 and Mathlib's Dirichlet L-function. Sources: BBdJR §2 and Conjecture 3.18, pp.3–9,15–16. The E-valued assembly and p-adic construction are additional targets here; `AA-Artin` supplies the complex theory.

**L3.1. p-adic L-values at positive integers as negative moments of the measure mu_theta.** Let p be an odd prime and theta = chi*eta a nontrivial primitive Dirichlet character of conductor N = D p^n, where eta is primitive of conductor D > 1 with p not dividing D and chi is primitive of conductor p^n (n >= 0). Let L be a finite extension of Q_p inside C_p containing mu_N and the values of theta, and mu_theta = (mu_eta)_chi in Lambda(Z_p) (x) L the measure of RJW (5.5), with Amice transform F_theta (RJW Lemma 5.12). For every integer k >= 1, L_p(theta*omega^{1-k}, k) = int_{Z_p^x} x^{-k} . mu_theta. Here omega is the Teichmueller character, L_p(psi, s) is RJW Definition 5.18, and theta*omega^{1-k} = (chi*omega^{1-k})*eta, its p-part chi*omega^{1-k} being the finite-order character of Z_p^x it defines (trivial when chi = omega^{k-1}).

**Assumptions:** p is an odd prime: RJW Definition 5.15 defines omega and <x> = omega^{-1}(x) x only for odd p. D > 1, so that eta is nontrivial and mu_eta is a bounded measure (RJW Theorem 5.7); D = 1 is L3.2. k >= 1 is an integer; the integrand 1_{Z_p^x}(x) x^{-k} is continuous on Z_p.

**From:** DP2, DP3. **Sources:** [^165], [^166], [^167].

**L3.2. p-adic L-values at positive integers for pure p-power conductor, through the smoothed measure.** Let p be an odd prime, chi a nontrivial primitive Dirichlet character of conductor p^n (n >= 1) with values in a finite extension L of Q_p, and k >= 1 an integer. Let b > 1 be an integer prime to p with chi(b) b^{1-k} != 1 (such b exist: x -> chi(x) x^{1-k} is a nontrivial continuous character of Z_p^x and the positive integers prime to p are dense in Z_p^x). Let mu_b in Lambda(Z_p) be the measure with Amice transform F_b(T) = 1/T - b/((1+T)^b - 1) (RJW Definition 4.5) and mu_{chi,b} = (mu_b)_chi its twist by chi. Then L_p(chi*omega^{1-k}, k) = (chi(b) b^{1-k} - 1)^{-1} int_{Z_p^x} x^{-k} . mu_{chi,b}.

**Assumptions:** p is an odd prime (RJW's standing assumption for omega and <x>). chi has conductor p^n with n >= 1 (tame part D = 1); no bounded measure with Amice transform F_chi of RJW Lemma 5.12 exists in this case. b > 1 is an integer prime to p with chi(b) b^{1-k} != 1.

**From:** DP1, DP2, DP3, PM3. **Sources:** [^168], [^169], [^170].

### L3.3. The geometric measure mu_w of a point outside the residue disc of 1

Let K be a finite extension of Q_p inside C_p and w in K with |w| <= 1 and |w - 1| = 1 (w lies in the closed unit disc but not in the residue disc D^-(1,1) of 1). The geometric measure mu_w in Lambda(Z_p) (x) O_K is the unique bounded measure on Z_p with Amice transform A_{mu_w}(T) = w(1+T)/(1 - w(1+T)) = Li_0(w(1+T)) = w/(1-w) + sum_{m>=1} w^m (1-w)^{-m-1} T^m, where Li_0(z) = z/(1-z). Its values on residue classes are mu_w(a + p^m Z_p) = w^a/(1 - w^{p^m}) for 0 < a <= p^m, and mu_w = sum_{n>=1} w^n delta_n when |w| < 1.

**Assumptions:** K is a finite extension of Q_p (so that the bounded Mahler-Amice theory of RJW Theorem 3.25 applies over O_K). |w| <= 1 and |w - 1| = 1; for w in the residue disc of 1 the series below is unbounded and no measure exists.

**Required API.**
- `geometricMeasure`: For w in K with |w| <= 1 and |w - 1| = 1, the bounded measure mu_w in D(Z_p, K).
- `amiceTransform_geometricMeasure`: A_{mu_w}(T) = w(1+T) (1 - w(1+T))^{-1} in K[[T]].
- `geometricMeasure_residueClass`: mu_w(1_{a + p^m Z_p}) = w^a/(1 - w^{p^m}) for 0 < a <= p^m.
- `geometricMeasure_moment`: int x^j . mu_w = Li_{-j}(w) := (z d/dz)^j (z/(1-z)) at z = w, for j >= 0 (RJW Corollary 3.30).
- `geometricMeasure_eq_tsum_dirac`: For |w| < 1, mu_w = sum_{n>=1} w^n delta_n (convergent in the weak topology).
- `geometricMeasure_norm_le_one`: mu_w takes C(Z_p, O_K) into O_K.
- `geometricMeasure_psi`: psi(mu_w) = mu_{w^p}, hence Res_{pZ_p} mu_w = phi(mu_{w^p}) and Res_{Z_p^x} mu_w = mu_w - phi(mu_{w^p}); this is the distribution relation sum_{xi in mu_p} Li_0(xi z) = p Li_0(z^p) for the rational function Li_0.
- `geometricMeasure_rotate`: For xi in mu_{p^infinity}, xi^x mu_w = mu_{xi w} (RJW §3.5.2).
- `geometricMeasure_galois`: For a continuous automorphism sigma of C_p over Q_p, sigma o mu_w = mu_{sigma(w)}.

**Tests.**
- mu_w(Z_p) = w/(1-w); for p odd and w = -1 this is -1/2.
- For p = 3 and w = -1: mu_{-1}(1 + 3Z_3) = -1/2, mu_{-1}(2 + 3Z_3) = 1/2, mu_{-1}(3Z_3) = -1/2.
- w = 0 gives mu_0 = 0.
- For |w| < 1, mu_w = sum_{n>=1} w^n delta_n, and int_{Z_p^x} x^{-k} . mu_w = sum_{n>=1, p not | n} w^n n^{-k}.
- For w = zeta_p a primitive p-th root of unity the coefficients w^m (1-w)^{-m-1} have absolute value p^{(m+1)/(p-1)}, unbounded, so the formula defines no measure: the pure p-power conductor case needs the smoothed measure.

**From:** PM2, AbstractMeasure, AbstractMeasure.amiceTransform, AbstractMeasure.injective_amiceTransform. **Sources:** [^171], [^172], [^173].

**L3.4. mu_theta as a Gauss-sum combination of geometric measures.** Let theta = chi*eta be primitive of conductor N = D p^n with D > 1 and p not dividing D, L as in L3.1, eps_N in L a primitive N-th root of unity and G(theta^{-1}) = sum_{c in (Z/NZ)^x} theta^{-1}(c) eps_N^c. For every c in (Z/NZ)^x, |eps_N^c| = |eps_N^c - 1| = 1, and mu_theta = G(theta^{-1})^{-1} sum_c theta^{-1}(c) mu_{eps_N^c}; equivalently F_theta(T) = G(theta^{-1})^{-1} sum_c theta^{-1}(c) Li_0((1+T) eps_N^c).

**Assumptions:** D > 1: every eps_N^c reduces to a nontrivial root of unity of order D, so it lies outside the residue disc of 1. The Gauss sum and F_theta are formed with the same root eps_N.

**From:** DP0, DP2, L3.3, MulChar.sum_eq_zero_of_ne_one, AbstractMeasure.injective_amiceTransform. **Sources:** [^174], [^175].

### L3.5. Taylor expansions of Coleman's polylogarithms on a residue disc as Amice transforms

For |w|≤1, |w−1|=1 in finite K/Q_p and k≥0, the Taylor series F̃_w^(k)(T) of Li_k(w(1+T)) belongs to R⁺ and evaluates correctly throughout |T|<1. F̃_w^(0)=A_(μ_w), and ∂F̃_w^(k)=F̃_w^(k−1). Under the LA1 Amice correspondence its distribution μ̃_w^(k) satisfies x·μ̃_w^(k)=μ̃_w^(k−1) and x^k·μ̃_w^(k)=μ_w. Root-of-unity instances have the additional coefficient growth of L2.28; all such w are needed for geometric measures.

**Assumptions:** |w|<=1 and |w-1|=1. For |w|=1, {w(1+t):|t|<1} is the whole residue disc D^-(w,1) and avoids0,1,infinity. For 0<|w|<1 it is D^-(w,|w|), a proper subdisc of D^-(0,1); for w=0 it is the singleton0. The series identity is restricted to that actual image. k >= 0; the construction does not depend on the branch, since Li_k is independent of the branch outside the residue discs of 1 and infinity (Besser-de Jeu, proof of Proposition 2.6).

**Required API.**
- `polylogPrimitive`: Ftilde^{(k)}_w in K[[T]], the Taylor series of Li_k(w(1+T)) at T = 0.
- `polylogPrimitive_mem_openDisc`: Ftilde^{(k)}_w is restricted at every radius c < 1 (PowerSeries.IsRestricted), i.e. lies in R^+.
- `polylogPrimitive_eval`: Ftilde^{(k)}_w(t) = Li_k(w(1+t)) for |t| < 1; in particular Ftilde^{(k)}_w(0) = Li_k(w) and Ftilde^{(k)}_w(xi - 1) = Li_k(xi w) for xi in mu_{p^infinity}.
- `polylogPrimitive_zero`: Ftilde^{(0)}_w = A_{mu_w}.
- `polylogPrimitive_derivation`: (1+T) d/dT Ftilde^{(k)}_w = Ftilde^{(k-1)}_w for k >= 1.
- `polylogDistribution`: mutilde^{(k)}_w in D^la(Z_p, K) with Amice transform Ftilde^{(k)}_w.
- `polylogDistribution_mul_x_pow`: x^k . mutilde^{(k)}_w = mu_w.
- `polylogPrimitive_of_norm_lt_one`: For |w| < 1, Ftilde^{(k)}_w = sum_{n>=1} w^n (1+T)^n n^{-k}.

**Tests.**
- w = 0: Ftilde^{(k)}_0 = 0 for every k >= 0.
- Ftilde^{(1)}_w(T) = -log(1 - w) + sum_{m>=1} (w/(1-w))^m T^m/m, with log(1 - w) branch independent because 1 - w is a unit.
- (1+T) d/dT Ftilde^{(1)}_w = w(1+T)/(1 - w(1+T)) = A_{mu_w}.
- For |w| < 1, Ftilde^{(k)}_w = sum_{n>=1} w^n (1+T)^n/n^k.
- For w = zeta_p (in the residue disc of 1) the Taylor series of Li_1(w(1+T)) at 0 has radius |zeta_p - 1| = p^{-1/(p-1)} < 1, so it is not in R^+.

**From:** L2.5, L2.4, L3.3, LA1, PowerSeries.derivative, PowerSeries.IsRestricted, L2.7, L2.28, L0.17, L2.26. **Sources:** [^176], [^177], [^178], [^179].

**L3.6. Negative moments on Z_p^x through a locally analytic primitive.** Let K be a finite extension of Q_p, mu in Lambda(Z_p) (x) K a bounded measure, k >= 0, and Ftilde in R^+ subset K[[T]] with ((1+T) d/dT)^k Ftilde = A_mu. Let lambda in D^la(Z_p, K) be the distribution with A_lambda = Ftilde. Then x^k lambda = mu, and int_{Z_p^x} x^{-k} . mu = lambda(1_{Z_p^x}) = ((1 - phi o psi) Ftilde)(0) = Ftilde(0) - p^{-1} sum_{xi in mu_p} Ftilde(xi - 1), where Ftilde(xi - 1) is the value of the convergent series at the point xi - 1 of the open unit disc. The value does not depend on the choice of Ftilde.

**Assumptions:** mu bounded; Ftilde in R^+ with the k-fold derivative condition.

**From:** LA1, PM2. **Sources:** [^180], [^181], [^182].

### L3.7. Negative moments of the geometric measure are modified polylogarithms

Let K be a finite extension of Q_p and w in K with |w| <= 1 and |w - 1| = 1. For every integer k >= 1, int_{Z_p^x} x^{-k} . mu_w = Li_k(w) - p^{-k} Li_k(w^p), where Li_k is Coleman's polylogarithm (for any branch; the right side is branch independent). For |w| < 1 both sides equal sum_{n>=1, p not | n} w^n n^{-k}.

**Assumptions:** |w| <= 1, |w - 1| = 1, w in a finite extension of Q_p. k >= 1.

**From:** L3.5, L3.6, L3.3, L2.8, L2.5. **Sources:** [^171], [^183], [^184].

**L3.8. Negative moments of the geometric measure as limits of finite sums.** For w as in L3.3 and every integer k: int_{Z_p^x} x^{-k} . mu_w = lim_{r -> infinity} (1 - w^{p^r})^{-1} sum_{0 < a < p^r, p not | a} a^{-k} w^a in K, and the r-th term differs from the limit by an element of absolute value at most p^{-r}. Consequently the negative moments of mu_w are the values at w of BHYY's rigid analytic function Li_k^{(p)} on {|t| <= 1, |1 - t| = 1} (BHYY Lemma 3.3 and Proposition 3.4 with F = Q).

**Assumptions:** w as in L3.3; k any integer.

**From:** L3.3, PM2. **Sources:** [^171], [^185].

**L3.9. Sums of a primitive character along the fibres of reduction vanish.** Let theta be a primitive Dirichlet character modulo N with values in an integral domain, M a proper divisor of N, and f any function on (Z/MZ)^x. Then sum_{c in (Z/NZ)^x} theta(c) f(c mod M) = 0. In particular, if p | N and eps_N is a primitive N-th root of unity, then sum_{c in (Z/NZ)^x} theta^{-1}(c) g(eps_N^{pc}) = 0 for every function g on mu_{N/p}.

**Assumptions:** theta primitive of conductor N; M | N, M != N.

**From:** DirichletCharacter.IsPrimitive, DirichletCharacter.factorsThrough_iff_ker_unitsMap, ZMod.unitsMap, ZMod.unitsMap_surjective, sum_hom_units_eq_zero. **Sources:** [^186], [^187].

**L3.10. The Euler factor from the p-th power map on roots of unity.** Let theta be a nontrivial primitive Dirichlet character of conductor N with values in a field of characteristic 0, eps_N a primitive N-th root of unity, k an integer and f a function on the roots of unity. Then sum_{c in (Z/NZ)^x} theta^{-1}(c) f(eps_N^{pc}) = theta(p) sum_{c} theta^{-1}(c) f(eps_N^c), with theta(p) = 0 when p | N; hence sum_c theta^{-1}(c) (f(eps_N^c) - p^{-k} f(eps_N^{pc})) = (1 - theta(p) p^{-k}) sum_c theta^{-1}(c) f(eps_N^c).

**Assumptions:** theta primitive of conductor N; f arbitrary (in the application f = Li_k, and eps_N^{pc} != 1 whenever the tame part D > 1).

**From:** L3.9, DirichletCharacter.IsPrimitive. **Sources:** [^188].

**L3.11. Independence of the choice of primitive root of unity.** Let theta be a nontrivial primitive character of conductor N with values in a field F of characteristic 0 containing mu_N, f any function from mu_N to F, eps a primitive N-th root of unity and eps' = eps^a with a in (Z/NZ)^x. Write G_eps(theta^{-1}) = sum_c theta^{-1}(c) eps^c. Then G_eps(theta^{-1}) != 0 and G_{eps'}(theta^{-1})^{-1} sum_c theta^{-1}(c) f(eps'^c) = G_eps(theta^{-1})^{-1} sum_c theta^{-1}(c) f(eps^c).

**Assumptions:** theta primitive of conductor N, nontrivial.

**From:** DP0, gaussSum, gaussSum_mulShift_eq, AddChar.zmodChar. **Sources:** [^189].

**L3.12. The complex polylogarithm on the unit circle and the exponential zeta function.** For every integer k >= 2 and every real a: Li_k(e^{2 pi i a}) = sum_{n>=1} e^{2 pi i a n} n^{-k} = expZeta(a, k), where Li_k is the principal-branch complex polylogarithm of L0.F and L2.Fa and expZeta is HurwitzZeta.expZeta.

**Assumptions:** k >= 2 (for k = 1 the series converges only conditionally; that case is RJW Theorem 6.1(i), supplied by DP3).

**From:** L2.Fa, HurwitzZeta.expZeta, HurwitzZeta.hasSum_expZeta_of_one_lt_re. **Sources:** [^76], [^190].

### L3.13. The complex formula L(theta, k) through polylogarithms at roots of unity

Let theta be a nontrivial primitive complex Dirichlet character of conductor N >= 2 and G(theta^{-1}) = sum_{c in (Z/NZ)^x} theta^{-1}(c) e^{2 pi i c/N} (gaussSum with ZMod.stdAddChar). For every s in C, L(theta, s) = G(theta^{-1})^{-1} sum_{c in (Z/NZ)^x} theta^{-1}(c) expZeta(c/N, s), with L(theta, s) = DirichletCharacter.LFunction. Hence for every integer k >= 1, L(theta, k) = G(theta^{-1})^{-1} sum_c theta^{-1}(c) Li_k(e^{2 pi i c/N}) with the principal-branch complex polylogarithm (RJW Theorem 6.7(i)).

**Assumptions:** theta primitive of conductor N >= 2 (so theta(0) = 0 and theta^{-1} vanishes on non-units).

**From:** DirichletCharacter.LFunction, DirichletCharacter.LFunction_eq_LSeries, ZMod.LFunction_dft, DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum, ZMod.dft_dft, ZMod.dft_comp_neg, gaussSum, ZMod.stdAddChar, ZMod.toAddCircle, HurwitzZeta.expZeta, L3.12, DP0, DP3, L2.Fa. **Sources:** [^191], [^192], [^193].

### L3.14. The modified p-adic polylogarithm of the syntomic regulator

For n >= 2 and a branch log = log_lambda, the modified p-adic polylogarithm L^mod_n : C_p minus {0, 1} -> C_p is L^mod_n(z) := sum_{j=0}^{n-1} (B_j/j!) Li_{n-j}(z) log(z)^j, with B_j the Bernoulli numbers (t/(e^t - 1) = sum B_j t^j/j!, B_1 = -1/2; bernoulli) and Li_m Coleman's polylogarithms for the same branch. It satisfies L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0, L^mod_n(z^m) = m^{n-1} sum_{zeta^m = 1} L^mod_n(zeta z) for z^m != 0, 1, and L^mod_n(zeta) = Li_n(zeta) for every root of unity zeta != 1.

**Assumptions:** n >= 2; the same branch for log and the Li_m; z != 0, 1.

**Required API.**
- `padicRegulatorPolylog`: L^mod_n(z) = sum_{j<n} (B_j/j!) Li_{n-j}(z) log(z)^j.
- `padicRegulatorPolylog_inv`: L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0 for z != 0, 1.
- `padicRegulatorPolylog_distribution`: L^mod_n(z^m) = m^{n-1} sum_{zeta^m = 1} L^mod_n(zeta z) for z^m != 0, 1.
- `padicRegulatorPolylog_rootOfUnity`: L^mod_n(zeta) = Li_n(zeta) for zeta a root of unity, zeta != 1.
- `padicRegulatorPolylog_two`: L^mod_2(z) = Li_2(z) - (1/2) log(z) Li_1(z).
- `padicRegulatorPolylog_galois`: For a branch with lambda in Q_p and sigma a continuous automorphism of C_p over Q_p, L^mod_n(sigma z) = sigma(L^mod_n(z)) (Besser-de Jeu Remark 2.3).
- `padicRegulatorPolylog_specialUnit_branch`: On special units (|z| = |1 - z| = 1) L^mod_n(z) does not depend on the branch.

**Tests.**
- L^mod_2(z) = Li_2(z) - (1/2) log(z) Li_1(z).
- L^mod_n(zeta) = Li_n(zeta) for zeta in mu_infinity minus {1}; for p odd, L^mod_n(-1) = (2^{1-n} - 1) Li_n(1).
- L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0; for n = 2 and z = 2 this relates L^mod_2(2) and L^mod_2(1/2).
- For the Iwasawa branch and z = p + p^2, L^mod_2(z) - Li_2(z) = (1/2) log(1 + p) log(1 - p - p^2) != 0: L^mod_n is not Li_n away from roots of unity.
- Zagier's complex single-valued P_n (L3.Fc) uses coefficients 2^j B_j/j! and log|z|; at roots of unity both reduce to Li_n up to taking real or imaginary parts.

**From:** L2.5, L2.8, L0.18, bernoulli, L2.9. **Sources:** [^194], [^195], [^196].

### L3.15. The syntomic regulator of cyclotomic elements

Let F be a number field, O the localisation of O_F at a prime above p, K a complete discretely valued subfield of C_p with ring of integers R and residue field algebraic over F_p, sigma : F -> K an embedding with sigma(O) in R, and n >= 2. Let reg_sigma be the composite H^1(Mtilde_n(F)) -> K_{2n-1}^{(n)}(F) = K_{2n-1}^{(n)}(O) -> K_{2n-1}^{(n)}(R) -> H^1_syn(Spec R, n) = K of de Jeu's map (BBdJR Theorem 4.7), sigma_* and Besser's syntomic regulator (BBdJR Lemma 2.15). For every root of unity zeta != 1 in F: reg_sigma([zeta]_n) = ±(n-1)! L^mod_n(sigma(zeta)) = ±(n-1)! Li_n(sigma(zeta)), the sign depending only on the normalisation of the relativity isomorphisms (BBdJR Remark 4.16). For F unramified at p, Gros's regulator reg^Gros = (1 - Frob/p^n) reg sends [zeta]_n (zeta of order prime to p) to ±(n-1)! (Li_n(zeta) - p^{-n} Li_n(zeta^p)).

**Assumptions:** n >= 2; zeta a root of unity different from 1. The target H^1_syn(Spec R, n) is identified with K by the normalisation of Besser-de Jeu (Definition 4.6 and the following discussion).

**From:** L3.14, L3.Fb, L3.Fa, L2.8, L2.17, L2.25. **Sources:** [^197], [^198], [^199].

### L3.16. The p-adic Beilinson conjecture for Artin motives over Q, as a proposition

For finite Galois k/Q with group G, number field E, idempotent π∈E[G], n≥2 and dim_E E[G]π=dim_E πK_(2n−1)(k)_E, choose embeddings φ_∞,φ_p and ordered E-bases. Put M=π(E⊗k). D_*^(1/2) is the determinant of (σ,a)↦φ_*(σa) on E[G]π×M; R_(n,*) is the determinant of (σ,α)↦reg_*(φ_*(σα)) on E[G]π×πK_(2n−1)(k)_E, using Beilinson and syntomic regulators. Define PBC to require L(n,χ_π⊗id,Q)D_∞^(1/2)=eR_(n,∞) and L_p(n,χ_π⊗ω_p^(1−n),Q)D_p^(1/2)=e_p Eul_p(n,χ_π⊗id,Q)R_(n,p), for e,e_p∈E^×, with e=e_p and both the p-adic L-value and R_(n,p) units in the stated coefficient algebras. This defines a proposition; it does not assert it.

**Assumptions:** n >= 2 and the dimension condition dim_E E[G]pi = dim_E pi K_{2n-1}(k)_E (by BBdJR Proposition 3.12 this holds exactly when the kernel field of E[G]pi is totally real and n is odd, or is CM, n is even and complex conjugation acts by -1). chi_pi is the character of Gal(Qbar/Q) on E[G]pi; L_p(s, chi_pi (x) omega_p^{1-n}, Q) is the p-adic Artin L-function of BBdJR §2 (Brauer induction from totally real fields); Eul_p is the Euler factor at p.

**Required API.**
- `padicBeilinsonConjecture`: PBC(k, E, pi, n, p) : Prop, the conjunction of parts (1)-(4).
- `padicBeilinsonConjecture_basis_indep`: The truth of each part does not depend on the chosen bases (BBdJR Remark 3.19(1)).
- `padicBeilinsonConjecture_coeff_ext`: PBC for pi in E[G] is equivalent to PBC for pi in E'[G], E' an extension of E (Remark 3.21(2)).
- `padicBeilinsonConjecture_orthogonal_sum`: If pi = sum pi_i with orthogonal idempotents, PBC for all pi_i implies PBC for pi (Remark 3.21(1)).
- `padicBeilinsonConjecture_dimension_iff`: The dimension hypothesis holds iff the kernel field of E[G]pi is totally real with n odd, or CM with n even and complex conjugation acting by -1 (Proposition 3.12).
- `padicBeilinsonConjecture_quotient_group`: PBC for pi in E[G/N] is equivalent to PBC for its canonical lift to E[G] (Remark 3.23(1)).

**Tests.**
- k = Q(mu_N), chi primitive with chi(-1) = (-1)^{n-1}, pi its idempotent: both dimensions are 1, with bases pi, pi(1 (x) zeta_N) and pi(1 (x) [zeta_N]_n).
- k = Q, pi = 1, n odd >= 3: part (2) relates L_p(n, omega^{1-n}) to (1 - p^{-n}) and the syntomic regulator of [-1]_n (BBdJR, N = 2 case of the proof of Proposition 4.17).
- k = Q(i), pi = (1 + c)/2, n = 2: dim E[G]pi = 1 but pi K_3(Q(i))_E = K_3(Q)_E = 0, so the proposition is not formed.
- k totally real and n even: pi K_{2n-1}(k)_E = 0 for every pi (Borel), so no instance exists.

**From:** L3.Fc, L3.Fb, L3.Fd, DP3, L3.Fa. **Sources:** [^200], [^201], [^202].

**L3.17. Unit denominator for a rotated smoothing series.** Write Q_b(Z)=sum_(0<=i<b) Z^i and R_b(Z)=sum_(0<=i<b-1)(b-1-i)Z^i as finite-polynomial notation, and W=w(1+T). Then |Q_b(w)|=1, and every coefficient of Q_b(W) and R_b(W) has norm at most one. Hence Q_b(W) is a unit in O_K[[T]]. The norm assertions hold more generally in an ultrametric normed field when |b|=1 and |w-1|<1; Q_b and R_b are explanatory finite sums, not new generic polynomial carriers.

**Assumptions:** [^C10]

**From:** IsUltrametricDist, PowerSeries.isUnit_iff_constantCoeff, geom_sum_mul, DP1. **Sources:** [^203].

### L3.18. The pole-cancelled rotated smoothing transform

With the finite sums Q_b and R_b of rotated-smoothing-denominator, define G_(b,w)(T)=R_b(w(1+T))*Q_b(w(1+T))^(-1) in K[[T]]. The inverse is the existing formal power-series inverse of a unit. Every coefficient lies in O_K, so G is in R^+ and, for every |t|<1, G(t)=R_b(w(1+t))/Q_b(w(1+t)). At w=1 it is exactly the coefficient image of the integral DP1/smoothed-series F_b; for z=w(1+t) !=1 it equals 1/(z-1)-b/(z^b-1). At z=1 the value is (b-1)/2. All substitutions defining G are finite polynomial evaluations. No infinite formal substitution at nonzero constant coefficient is used.

**Assumptions:** [^C10]

**Required API.**
- `rotatedSmoothedTransform`: G_(b,w)=R_b(w(1+T))*Q_b(w(1+T))^(-1), using only finite polynomial evaluation.
- `rotatedSmoothedTransform_mul_denominator`: If Q_b(w)!=0, Q_b(w(1+T))*G_(b,w)=R_b(w(1+T)).
- `rotatedSmoothedTransform_unique`: For Q_b(w)!=0, a series satisfying the cleared Q equation equals G_(b,w).
- `constantCoeff_rotatedSmoothedTransform`: constantCoeff G_(b,w)=R_b(w)/Q_b(w), including w=1.
- `rotatedSmoothedTransform_coeff_bound`: For |b|=1 and |w-1|<1 every coefficient of G has norm at most one.
- `rotatedSmoothedTransform_mem_openDisc`: Under the same norm hypotheses, G is restricted at every 0<=rho<1.
- `rotatedSmoothedTransform_eval`: For |t|<1 and the same norm hypotheses, evalSeries G t=R_b(w(1+t))/Q_b(w(1+t)).
- `rotatedSmoothedTransform_one`: For IsUnit(b:K), G_(b,1)=DirichletPadic.smoothedSeries K b; this is the existing owner's series.
- `rotatedSmoothedTransform_parameter_one`: G_(1,w)=0 for every w.
- `rotatedSmoothedTransform_map`: For a field homomorphism f:K->K' and Q_b(w)!=0, coefficient mapping sends G_(b,w) to the same finite quotient at f(w).
- `rotatedSmoothedTransform_eq_rational`: For b>=1 and w in a field K with w!=1 and w^b!=1, the explicit G_(b,w) equals (w(1+T)-1)^(-1)-b*(w^b(1+T)^b-1)^(-1) in K[[T]]. These hypotheses ensure both separate denominators have nonzero constant coefficient. They hold for w a nontrivial p-power root of unity and b prime to p. This identity is not extended to w=1.

**Tests.**
- At p=3,b=2,w=1 the constant coefficient is 1/2.
- At p=3,b=2,w=1 the coefficient of T is -1/4.
- At p=2,b=3,w=1 the constant coefficient is 1; the dyadic prime is allowed.
- At p=3,b=2,w=4 the constant coefficient is 1/5; |4-1|_3<1.
- G_(1,4)=0 over Q_3.
- Over Q_3, G_(2,1) differs from (W-1)^(-1)-2(W^2-1)^(-1) formed inside Q_3[[T]] at W=1+T: the latter is zero.
- At p=3,b=3,w=1, coeff_1 G=-2/3 has norm 3>1. The prime-to-p condition is necessary for the integral coefficient bound.
- At p=3,b=2,w=4, the regularized transform agrees with the separate reciprocal formula, whose constant denominators are 3 and 15.

**From:** L3.17, DP1, PowerSeries.mul_inv_cancel, PowerSeries.constantCoeff_inv, PowerSeries.coeff_inv, PowerSeries.coeff_mul, PowerSeries.isRestricted_iff', PowerSeries.inv_eq_zero, geom_sum_mul. **Sources:** [^204].

**L3.19. Integral coefficients of the rotated transform.** If |b|=1 and |w-1|<1 in a complete ultrametric normed field K, every coefficient of G_(b,w) has norm at most one.

**Assumptions:** [^C11]

**From:** L3.17, L3.18, PowerSeries.coeff_inv, PowerSeries.coeff_mul. **Sources:** [^205].

**L3.20. Convergence of the rotated transform on the open unit disc.** Under the same norm hypotheses, G_(b,w) is restricted at every real radius 0<=rho<1, hence lies in R^+.

**Assumptions:** [^C11]

**From:** L3.19, PowerSeries.isRestricted_iff', IsUltrametricDist. **Sources:** [^206].

**L3.21. Evaluation of the rotated transform including its removable point.** Under the same norm hypotheses, for every |t|<1, G_(b,w)(t)=R_b(w(1+t))/Q_b(w(1+t)). In characteristic zero, when w(1+t)=1 this value is (b-1)/2; the two separate reciprocal terms must not be evaluated there.

**Assumptions:** [^C11]

**From:** L3.20, L3.17, L3.18, PowerSeries.mul_inv_cancel. **Sources:** [^207].

**L3.22. Comparison with the separate reciprocal formula away from the centre.** For b>=1 and w in a field K with w!=1 and w^b!=1, the explicit G_(b,w) equals (w(1+T)-1)^(-1)-b*(w^b(1+T)^b-1)^(-1) in K[[T]]. These hypotheses ensure both separate denominators have nonzero constant coefficient. They hold for w a nontrivial p-power root of unity and b prime to p. This identity is not extended to w=1.

**Assumptions:** K is a field, b>=1, w!=1 and w^b!=1; no convergence hypothesis is needed for this algebraic comparison.

**From:** L3.18, geom_sum_mul, PowerSeries.mul_inv_cancel. **Sources:** [^208].

**L3.23. Amice transform of the rotated smoothing measure.** Let mu_b be the actual DP1/smoothed-measure, extended to O_K by the bounded coefficient-extension interface of PM2. For |w-1|<1, multiplication by the continuous character x->w^x gives a bounded measure w^x mu_b with Amice transform G_(b,w) of rotated-smoothed-transform. In particular w=1 recovers the existing F_b, and the derivative of the smoothed-polylog expansion must use G_(b,w), also at its centre.

**Assumptions:** [^C10]

**From:** L3.18, L3.21, DP1, PM2, HasFPowerSeriesAt.eq_formalMultilinearSeries. **Sources:** [^209].

**L3.24. The twisted smoothed measure as a combination of rotated smoothed measures.** Let chi be primitive of conductor p^n (n >= 1), eps = eps_{p^n} a primitive p^n-th root of unity in L, G(chi^{-1}) = sum_c chi^{-1}(c) eps^c, and b > 1 an integer prime to p. For c in (Z/p^nZ)^x the measure (eps^c)^x mu_b (multiplication by the continuous function x -> eps^{cx}, defined because |eps^c - 1| < 1) has Amice transform F_b((1+T) eps^c - 1), and mu_{chi,b} = (mu_b)_chi = G(chi^{-1})^{-1} sum_{c in (Z/p^nZ)^x} chi^{-1}(c) (eps^c)^x mu_b.

**Assumptions:** n >= 1 and chi primitive of conductor p^n. b > 1 is an integer prime to p.

**From:** DP0, DP1, DP2, PM2, AbstractMeasure.injective_amiceTransform, L3.23, L3.22. **Sources:** [^210], [^211].

### L3.25. The smoothed polylogarithm on the residue disc of 1

For b>1 prime to p, set Φ_b^(k)(z)=−Li_k(z)+b^(1−k)Li_k(z^b)+(b−1)log(z)^k/k! on D⁻(1,1)∖{1}. It extends branch independently across 1. Φ_b^(0)=F_b(z−1), equal to 1/(z−1)−b/(z^b−1) off 1 and (b−1)/2 at 1; z(Φ_b^(k))′=Φ_b^(k−1). For w∈D⁻(1,1) in finite K/Q_p, Φ_b^(k)(w(1+T))∈R⁺ and ∂^k equals the rotated-smoothed Amice transform G_(b,w). Composition denotes convergent evaluation. At the centre, Φ_b^(1)(1)=−log_p b, and Φ_b^(k)(1)=−(1−b^(1−k))Li_k(1) for k≥2.

**Assumptions:** b > 1 an integer prime to p (for b = 1 the combination is 0). Li_k with any branch log_lambda; the combination is branch independent.

**Required API.**
- `smoothedPolylog`: Phi^{(k)}_b, a rigid analytic function on D^-(1,1).
- `smoothedPolylog_analyticOnNhd`: Phi^{(k)}_b is analytic on D^-(1,1), with the values at z = 1 given by smoothedPolylog_one (removable singularity).
- `smoothedPolylog_eq`: Phi^{(k)}_b(z) = -Li_k(z) + b^{1-k} Li_k(z^b) + (b-1) log(z)^k/k! for z in D^-(1,1), z != 1.
- `smoothedPolylog_zero`: For z!=1 in the disc of 1, Phi_b^(0)(z)=1/(z-1)-b/(z^b-1); at z=1 its pole-cancelled value is (b-1)/2.
- `smoothedPolylog_deriv`: For k>=1, z d/dz Phi_b^(k)=Phi_b^(k-1).
- `smoothedPolylog_one`: Phi^{(1)}_b(1) = -log_p(b); Phi^{(k)}_b(1) = -(1 - b^{1-k}) Li_k(1) for k >= 2.
- `smoothedPolylog_rootOfUnity`: For k>=1 and zeta in mu_(p^infinity), zeta!=1: Phi_b^(k)(zeta)=-Li_k(zeta)+b^(1-k)Li_k(zeta^b), since log(zeta)=0. At k=0 retain the additional constant b-1.
- `smoothedPolylog_expansion`: Ftilde_(b,w)^(k)(T)=Phi_b^(k)(w(1+T)) lies in R^+ and its k-fold (1+T)d/dT image is G_(b,w), identified with A_(w^x mu_b) by rotated-smoothed-amice, including w=1.
- `smoothedPolylog_branch_independent`: Phi^{(k)}_b computed with any two branches log_lambda, log_lambda' is the same function.

**Tests.**
- Phi^{(1)}_b(1+T) = log(T(1+T)^{b-1}/((1+T)^b - 1)), with value -log_p(b) at T = 0 (RJW (7.8)).
- Phi^{(0)}_b(1+T) = F_b(T) in Z_p[[T]], and Phi^{(0)}_b(1) = (b - 1)/2.
- For b = 1 the defining combination is identically 0 for every k.
- For k >= 1 neither -Li_k(z) nor b^{1-k} Li_k(z^b) alone is analytic on D^-(1,1): each contains -+(log z)^{k-1} log_lambda(1 - z)/(k-1)!.
- Phi^{(k)}_b computed with log_lambda and with the Iwasawa branch coincide.

**From:** L2.5, L2.4, L0.18, LA1, PM2, L2.11, L0.16, DP1, L3.21, L3.23. **Sources:** [^212], [^213], [^214].

**L3.26. The distribution relation for the smoothed polylogarithm on the residue disc of 1.** For b > 1 prime to p and k >= 0: sum_{xi in mu_p} Phi^{(k)}_b(xi w) = p^{1-k} Phi^{(k)}_b(w^p) for every w in D^-(1,1), including w in mu_p.

**Assumptions:** b > 1 an integer prime to p; k >= 0.

**From:** L3.25, L2.8, L0.18. **Sources:** [^215], [^216].

**L3.27. Negative moments of the rotated smoothed measure.** Let b > 1 be an integer prime to p, w in D^-(1,1) lying in a finite extension K of Q_p, and k >= 1. Then int_{Z_p^x} x^{-k} . (w^x mu_b) = Phi^{(k)}_b(w) - p^{-k} Phi^{(k)}_b(w^p). In particular, at w = 1, int_{Z_p^x} x^{-k} . mu_b = (1 - p^{-k}) Phi^{(k)}_b(1).

**Assumptions:** b > 1 prime to p; w in the residue disc of 1; k >= 1.

**From:** L3.25, L3.6, L3.26, DP1, L3.23. **Sources:** [^217].

### L3.28. Coleman's formula for the p-adic L-values L_p(theta omega^{1-k}, k)

For odd p, nontrivial primitive θ of conductor N≥2, primitive ε_N and character values in finite L/Q_p containing μ_N, prove for every k≥1: L_p(θω^(1−k),k)=(1−θ(p)p^(−k))G(θ⁻¹)⁻¹Σ_c θ⁻¹(c)Li_k(ε_N^c), with Iwasawa Li_k and RJW Definition 5.18 normalization. θ(p)=0 if p|N. For N not a p-power the right side is G⁻¹Σ_cθ⁻¹(c)Li_k^(p)(ε_N^c)=G⁻¹Σ_cθ⁻¹(c)∫_(Z_p^×)x^(−k)dμ_(ε_N^c). Retain the ω^(1−k) twist suppressed in RJW's printed theorem; include pure p-power conductors by smoothing.

**Assumptions:** p odd (RJW's L_p is defined for odd p). theta nontrivial primitive of conductor N = D p^n, any D >= 1 prime to p and n >= 0. k >= 1 an integer. Li_k for the Iwasawa branch; the right side is the same for every branch (L3.35).

**From:** L3.1, L3.2, L3.4, L3.24, L3.7, L3.27, L3.10, L3.9, L3.11, L3.25, L2.5, L0.18, PadicComplex, L2.25, L2.27, L2.26, L2.18. **Sources:** [^218], [^163], [^193].

### L3.29. Coleman's formula for the trivial character

For p odd and every integer k >= 2: L_p(omega^{1-k}, k) = int_{Z_p^x} x^{1-k} . zeta_p = (1 - p^{-k}) Li_k(1), where Li_k(1) is the limit of Coleman's Li_k(z) as z -> 1 inside any finitely ramified extension of Q_p (L2.11).

**Assumptions:** p odd, k >= 2.

**From:** L3.27, L3.25, DP1, DP3, PM3, L2.4, L2.11. **Sources:** [^219], [^213].

### L3.30. Coleman's formula for L_p(theta, k) itself, in the normalisation of RJW

Let p be odd, theta = chi*eta a Dirichlet character as in RJW Definition 5.18, k >= 1, and psi the primitive character attached to theta omega^{k-1}, of conductor N_psi. If psi is nontrivial, L_p(theta, k) = (1 - psi(p) p^{-k}) G(psi^{-1})^{-1} sum_{c in (Z/N_psi Z)^x} psi^{-1}(c) Li_k(eps_{N_psi}^c). If psi is trivial (theta = omega^{1-k}) and k >= 2, L_p(theta, k) = (1 - p^{-k}) Li_k(1). In particular the character normalization in RJW Theorem6.7(ii) agrees with the corrected normalization when psi=theta, equivalently (p-1) divides k-1. Outside this congruence the characters differ; numerical values may nevertheless coincide, for example when both vanish, so no iff about equality of values is claimed.

**Assumptions:** p odd; k >= 1; for trivial psi, k >= 2 (at k = 1 the trivial component has the pole of RJW Theorem 7.1).

**From:** L3.28, L3.29, DP3. **Sources:** [^220], [^221].

### L3.31. k = 1 recovers Leopoldt's formula and the complex value at s = 1

At k = 1, L3.28 is RJW Theorem 6.1(ii): L_p(theta, 1) = -(1 - theta(p) p^{-1}) G(theta^{-1})^{-1} sum_c theta^{-1}(c) log_p(1 - eps_N^c), because omega^0 = 1 and Li_1(z) = -log_p(1 - z) for the Iwasawa branch; and at k = 1 L3.13 is RJW Theorem 6.1(i). The proof of L3.28 covers both conductor cases of RJW §6.2: tame part D > 1 (including n = 0) through the geometric measures and the distribution relation, and pure p-power conductor D = 1 through the smoothed measure.

**Assumptions:** theta nontrivial primitive of conductor N; p odd.

**From:** L3.28, L3.13, L2.5, L0.18, DP3. **Sources:** [^222], [^76].

### L3.32. Comparison with the locally analytic distribution argument of RJW §6.2

At k=1 and tame part D>1, RJW's F̃_θ=−G⁻¹Σ_cθ⁻¹(c)log((1+T)ε_N^c−1) is G⁻¹Σ_cθ⁻¹(c)F̃_(ε_N^c)^(1), since log_p(−1)=0. Identify his Lemmas 6.4–6.5 and (6.5) with the primitive, x·μ̃=μ and unit-moment targets; the root-log identity is weight-one distribution. For D=1, F_θ is not an Amice transform: use the smoothed μ_a and §7's F̃_a=Φ_a^(1)(1+T). For all k≥1 replace Li_1 by Li_k, using ∂=z d/dz, Li_0=z/(1−z), Σ_cθ⁻¹(c)=0 and Σ_(ξ∈μ_p)Li_k(ξz)=p^(1−k)Li_k(z^p) to obtain the primitive and Euler factor.

**Assumptions:** k >= 1; theta nontrivial primitive.

**From:** L3.5, L3.6, L3.7, L3.27, L3.25, L3.4, L3.28, DP3, LA1. **Sources:** [^223], [^224], [^212].

### L3.33. Comparison with the bounded-measure argument of Bannai-Hagihara-Yamada-Yamamoto

For N not a p-power, identify BHYY's negative moments with ∫_(Z_p^×)x^(−k)dμ_w=Li_k^(p)(w) on |w|≤1, |w−1|=1 in finite extensions. For k≤0 use moments and t d/dt of t/(1−t)−t^p/(1−t^p); for k>0 use uniform convergence x^(−k+(p−1)p^r)→x^(−k) on Z_p^×. The distribution route instead gives Li_k(w)−p^(−k)Li_k(w^p) from Coleman disc analyticity. Comparing the two proves the Frobenius relation on this domain.

**Assumptions:** w in a finite extension of Q_p, |w| <= 1, |w - 1| = 1; k any integer for BHYY's side, k >= 1 for the distribution side.

**From:** L3.7, L3.8, L3.28, L2.5, L2.8, L2.15. **Sources:** [^225], [^127].

### L3.34. Coleman's polylogarithms versus arbitrary locally analytic solutions

Perturbing Li_k by δ1_U, δ≠0, on a disc containing one ε_N^(c_0) and no other N-th root preserves the local ODE and lower weights but changes the formula by (1−θ(p)p^(−k))δθ⁻¹(c_0)/G≠0. Coleman uniqueness or distribution excludes the perturbation. For tame/mixed roots, choose U a proper clopen subdisc of the whole residue disc: its indicator cannot be one power series on that whole disc by the identity principle, so its multiplicative pullback has no open-unit-disc Amice transform. Pure p-power roots have their original singularity inside that parameter disc and require smoothing.

**Assumptions:** p odd, theta nontrivial primitive, k >= 1.

**From:** L3.28, L3.5, L1.18, L2.4, L2.8. **Sources:** [^226], [^227].

### L3.35. Independence of the root of unity, the branch and the Frobenius lift

The formula is independent of the primitive root, branch and Frobenius lift. Root independence follows from the compatible θ(b) factors in Gauss and polylogarithm sums. For k≥2 root values are branch independent; for k=1 their branch difference −v(1−ζ)(λ−λ′) is constant on primitive N-th roots and the nontrivial character sum cancels it. Coleman uniqueness gives lift independence. The construction with any branch and lift yields the same L-value normalization.

**Assumptions:** theta nontrivial primitive, k >= 1.

**From:** L3.28, L3.11, L1.18, L0.18, L2.10, L2.17, L0.16, L1.22. **Sources:** [^214], [^227].

### L3.36. Parts (1)-(3) of the p-adic Beilinson conjecture for Dirichlet motives

(BBdJR Proposition 4.17.) Let N >= 2, k = Q(mu_N), G = (Z/NZ)^x, E a number field containing a root of unity of order the exponent of G, chi an irreducible character of G with idempotent pi, and n >= 2 with chi(-1) = (-1)^{n-1}. Then dim_E E[G]pi = dim_E pi K_{2n-1}(k)_E = 1, and parts (1), (2) and (3) of PBC(k, E, pi, n, p) hold for every odd prime p in the odd-prime normalization, with e(n, M^E_pi) = e_p(n, M^E_pi) in Q^x. BBdJR Proposition4.17 states the result for every prime, including2; the dyadic normalization is a separate requirement using torsion modulo 4 and principal units 1+4Z_2.

**Assumptions:** N >= 2; chi(-1) = (-1)^{n-1}; E contains the values of chi. p odd for the odd-prime normalization. The published p=2 case is a target under the dyadic normalization, not claimed to follow from the odd-prime formula.

**From:** L3.28, L3.13, L3.29, L3.15, L3.16, L3.Fa, L3.Fc, DP0. **Sources:** [^228], [^229].

### L3.37. Coleman's formula as a formula for syntomic regulators

Let theta be a nontrivial primitive Dirichlet character of conductor N >= 2, n >= 2, F = Q(mu_N) and sigma : F -> C_p with sigma(zeta_N) = eps_N. Then L_p(theta omega^{1-n}, n) = ±((n-1)!)^{-1} (1 - theta(p) p^{-n}) G(theta^{-1})^{-1} sum_{c in (Z/NZ)^x} theta^{-1}(c) reg_sigma([zeta_N^c]_n), and, when p does not divide N, L_p(theta omega^{1-n}, n) = ±((n-1)!)^{-1} G(theta^{-1})^{-1} sum_c theta^{-1}(c) reg^Gros_sigma([zeta_N^c]_n).

**Assumptions:** p odd; n >= 2; the sign is the one of L3.15.

**From:** L3.28, L3.15, L3.10, L3.Fb. **Sources:** [^230], [^198].

## Shared assumptions

A reference C1, C2, … in an assertion includes the whole corresponding contract below. Every result using a weaker algebraic hypothesis states it explicitly.

[^C1]: K complete, ultrametric, characteristic zero.

[^C2]: p is any prime, including 2; a is any element of C_p; L=log_a is the existing branch (equivalently an actual function satisfying IsLogBranch), and D and R_a are the existing dilogD and fiveTermDefect.

[^C3]: Write q_n=p^(n+1) as notation for a sequence in C_p; n runs through the natural numbers. No new function carrier or global puncture-continuity assertion is introduced.

[^C4]: p does not divide N.

[^C5]: p is prime; K is a finite extension of Q_p inside C_p, O_K its valuation ring, k its residue field of cardinal q=p^f; v in K satisfies |v|=|1−v|=1.

[^C6]: p is any prime, a∈ℂ_p is the logarithm branch, and D=D^a is the already constructed Coleman dilogarithm. No finite-extension assumption on the points is made.

[^C7]: An admissible pair means x,y∉{0,1} and x≠y. All uses of reflection or inversion have their nonzero/nonone hypotheses checked. The total Lean expression has junk values outside that locus and no theorem uses them.

[^C8]: p is any prime, including 2. Fix a branch parameter a∈ℂ_p and an actual logarithm branch L satisfying the existing IsLogBranch interface. D and R_a are the existing dilogD and scalar fiveTermDefect.

[^C9]: An admissible pair (x,y) has x,y different from 0 and 1, and x≠y. Write A for this subset of ℂ_p² and S for its subset with |y|=|1−y|=1. No condition |x|=1 or |x−y|=1 is imposed. The topology is the ordinary product p-adic topology.

[^C10]: p is prime, K is a finite extension of Q_p with its extended p-adic absolute value, b>1 is a natural number prime to p, and |w-1|<1, unless a more general algebraic API is explicitly stated.

[^C11]: K is a complete nontrivially normed ultrametric field, b is natural, |b|=1 and |w-1|<1; in the arithmetic application K/Q_p is finite and p does not divide b.

## Source locators

References identify sources or frameworks for the elementary deductions. The four-puncture charts, scalar defect reductions, geometric boundary sequence and rotated smoothing quotient are deductions here, rather than named source theorems. Pages refer to the versions in References; published pages are labelled.

[^1]: BBK, § 2, Rem. 2 p.3.

[^2]: BH, § 1.3.2 p.5 (author copy).

[^3]: BBK, § 3.2, Algorithm 8, step 2 p.6.

[^4]: MP, § 5.2, item (3) p.6.

[^5]: BH, § 1.3.2 p.5.

[^6]: BT, § 5 p.18.

[^7]: RJW, Rem. 3.39 p.24.

[^8]: BH, § 1.3.1 pp.4-5.

[^9]: BH, § 1.2 p.2.

[^10]: F, § 3.1, before Thm. 3.3 p.15.

[^11]: BBK, § 2, opening paragraph p.3.

[^12]: F, § 2.1 p.7.

[^13]: BBK, § 2, Def. 1 p.3.

[^14]: BBK, § 2, Def. 1 and Rem. 2 p.3.

[^15]: BBK, § 2, opening paragraph p.3.

[^16]: RJW, Proof of Thm. 6.1(ii) p.38.

[^17]: F, § 2.1 p.8.

[^18]: BBK, § 2 p.3.

[^19]: RJW, Thm. 6.1(ii) p.36.

[^20]: F, arXiv math/0304085v2, §2.1 p.7; Definition2.9 and Remark2.10 pp.9–10; Proposition2.11 and Notation2.12 p.10; Lemma2.14 p.11.

[^21]: F, Assumption 2.1 p.7.

[^22]: BBK, § 2, Def. 3 p.4.

[^23]: BT, § 5 p.17-18.

[^24]: BBK, § 2, Def. 4 p.4.

[^25]: MP, § 5.2, item (1) p.6.

[^26]: BH, § 1.3.3, Def. 2 p.6.

[^27]: BH, § 1.3.3, Def. 3 p.6.

[^28]: F, Lem. 2.2 p.8.

[^29]: BH, § 1.3.2 p.6.

[^30]: BBK, § 3.3, Algorithm 10, step 1 p.7.

[^31]: BBK, § 3.3, Def. 14 p.8.

[^32]: BH, § 1.2 p.3.

[^33]: MP, Rem. 8.3 (2) p.13.

[^34]: BH, Proof of Thm. 2 p.8.

[^35]: BH, § 1.3.2, Thm. 1 p.6.

[^36]: BBK, § 3.3, Algorithm 11, step 2 p.8.

[^37]: BH, § 1.3.2, Def. 1 and the following sentence p.6.

[^38]: BT, § 5 pp.17-18.

[^39]: BH, Proof of Thm. 2, Lem. 1 p.8.

[^40]: BBK, § 3.3, Algorithm 11, step 2 p.8.

[^41]: BBK, § 3.3 p.7.

[^42]: BH, Proof of Thm. 2 pp.8-9.

[^43]: BH, § 1.5, equation (1.4) pp.9-10.

[^44]: BT, Rem. 5.6 p.17.

[^45]: BT, § 2 p.3.

[^46]: BT, Thm. 4.15 p.14.

[^47]: BH, § 1.5.4 p.18.

[^48]: BH, § 1.5.4 p.19.

[^49]: BH, § 1.5.1 p.11.

[^50]: BH, § 1.5.2 p.13.

[^51]: BH, Thm. 2 and its proof pp.7-9.

[^52]: BT, Thm. 5.7 p.18.

[^53]: BF, § 2, proof of Prop. p.2.

[^54]: BH, § 1.5.3 p.17.

[^55]: F, Prop. 2.4 (Uniqueness Principle) p.8.

[^56]: BH, § 1.5.3, Prop. 7 p.17.

[^57]: BT, Corollary 4.13 p.14.

[^58]: BBK, § 2, Thm. 5 (Coleman) p.4.

[^59]: BBK, § 2, Thm. 5 (d) p.4.

[^60]: F, Notation 2.6 p.9.

[^61]: BH, Thm. 2 p.7.

[^62]: BH, § 1.2 pp.2-3.

[^63]: BH, § 1.3.2, Prop. 1 p.5.

[^64]: BH, Proof of Thm. 2 p.9.

[^65]: BT, Proof of Corollary 3.2 p.8.

[^66]: F, Prop. 2.3 (Branch Independency Principle) p.8.

[^67]: F, Proof of Thm. 3.10 p.17.

[^68]: BBK, § 3.3, Rem. 13 p.8.

[^69]: F, § 2.2, before Def. 2.9 p.9.

[^70]: BBK, § 3, Def. 7 p.5.

[^71]: BBK, § 3.1 p.6.

[^72]: F, § 2.2 p.9.

[^73]: F, Def. 2.9 p.9.

[^74]: BF, § 1 p.1.

[^75]: F, Prop. 2.11 p.10.

[^76]: RJW, Rem. 6.6 p.39.

[^77]: F, v2, §2.1 pp.7–9, Assumption2.1 and Proposition2.5.

[^78]: F, arXiv math/0304085v2, §2.1 p.7: the ordinary components are A(]x[); Proposition2.5 pp.8–9.

[^79]: F, arXiv math/0304085v2, Proposition2.5 pp.8–9 (no ends-to-ends hypothesis), with the component rings on p.7..

[^80]: F, Prop. 2.5 (Functorial Property) p.8.

[^81]: BBK, § 2, Thm. 5 (c) p.4.

[^82]: BT, Def. 4.7 p.13.

[^83]: F, arXiv math/0304085v2, §2.1 pp.7–9 and Proposition2.11 p.10.

[^84]: F, §2.2, (2.1), Lem. 2.7 and Lem. 2.8 p.9.

[^85]: BDJ, §1 p.869 (Ann. Sci. ENS 36 (2003)); p.3 of v2.

[^86]: BHYY, §1, (1.1) p.1.

[^87]: BHYY, §3.1 p.14.

[^88]: RJW, Proof of Lem. 6.4 p.38.

[^89]: BF, Proof of Corollary 2.2 p.2.

[^90]: BDJ, §2 p.875 (published).

[^91]: F, Rem. 2.10(2) p.10.

[^92]: BT, Corollary 4.14 and Thm. 4.15 p.14.

[^93]: W, §0, Thm. A' p.345.

[^94]: F, Proof of Thm. 2.13 p.10.

[^95]: BDJ, Proof of Prop. 2.6 p.877 (published).

[^96]: BBdJR, §4, class of functions (1)-(2) p.19.

[^97]: BDJ, §2 p.876 (published); p.10 of v2.

[^98]: RJW, Rem. 6.6 p.40.

[^99]: F, Def. 2.9 and Rem. 2.10(3) pp.9-10.

[^100]: BF, Prop. 2.1 p.2.

[^101]: F, Thm. 3.3 p.15.

[^102]: F, Examples 3.25 p.21.

[^103]: BBdJR, §4, properties (1)-(3) p.19.

[^104]: F, Lem. 2.8 p.9.

[^105]: BF, Proof of Thm. 1.1 p.4.

[^106]: BDJ, §2, (2.4) p.876 (published); p.10 of v2.

[^107]: BBdJR, §4, (4.11) p.20.

[^108]: BF, §3 p.6.

[^109]: BDJ, §1, (1.2) p.869 (published); p.3 of v2.

[^110]: BBdJR, §4 p.20.

[^111]: W, §4, (*) before Lem. 4.2 p.362.

[^112]: BDJ, §2, (2.5) and Prop. 2.6 p.876 (published); p.10 of v2.

[^113]: BDJ, Proof of Prop. 2.6 p.876 (published).

[^114]: GSWZ, §3.1, before (174) p.37.

[^115]: F, Prop. 2.3 p.8.

[^116]: F, Notation 2.12 and Thm. 2.13 p.10.

[^117]: F, Lem. 2.14 p.11.

[^118]: F, Thm. 2.18 and Examples 2.19(a) pp.11-12.

[^119]: BBdJR, Proof of Prop. 4.17 (case N = 2) p.23.

[^120]: BDJ, §2 p.875 (published); p.8 of v2.

[^121]: F, §3.1, before Thm. 3.3 p.15.

[^122]: GSWZ, Lem. 2.1 and its proof p.19.

[^123]: BHYY, Lem. 3.3, proof pp.14-15.

[^124]: BF, Prop. 2.1 and proof p.2.

[^125]: GSWZ, §2.1 p.18.

[^126]: BBdJR, §4, property (4) p.20.

[^127]: BHYY, §1 p.2.

[^128]: BDJ, §2, rules (1)-(3) p.875 (published).

[^129]: BBdJR, §4 p.19.

[^130]: BBdJR, §4 pp.19-20.

[^131]: BBdJR, §4, class (1) p.19.

[^132]: BDJ, Rem. 2.3 pp.875-876 (published); p.9 of v2.

[^133]: BDJ, Rem. 2.3 p.876 (published).

[^134]: BBK, §2, Thm. 5 (Coleman), (c) p.4.

[^135]: F, Proof of Thm. 2.25 p.13.

[^136]: GSWZ, §3.1, (174) p.37.

[^137]: BDJ, §1 p.870 (published); p.3 of v2.

[^138]: W, §4, Example 3 p.363.

[^139]: DJ, arXiv:2007.11014v1 p.6 Prop. 2.10; p.14 paragraph before its proof.

[^140]: BF, Corollary 2.2 p.2.

[^141]: BF, Proof of Corollary 2.2 pp.2-3.

[^142]: GSWZ, Proof of Lem. 3.1, (175) p.37.

[^143]: GSWZ, Prop. 3.2, (178) p.38.

[^144]: F, Thm. 2.25 p.13.

[^145]: RJW, Thm. 6.7 p.40.

[^146]: RJW, Lem. 6.4 and its proof pp.37-38.

[^147]: RJW, Lem. 5.12 p.34.

[^148]: BF, Lem. 2.4 p.3.

[^149]: BBdJR, Proof of Prop. 4.17 p.22.

[^150]: RJW, Rem. 6.6 and Thm. 6.7(i) p.40.

[^151]: BDJ, Rem. 1.5 p.870 (published).

[^152]: DJ, arXiv:2007.11014v1 p.6 discussion before Proposition2.10 and p.14 discussion immediately before its proof..

[^153]: F, §2.2, Definition2.9 and Proposition2.11, v2 pp.9–10.

[^154]: F, arXiv math/0304085v2, §2.1 p.7 (Laurent germ ring and logarithm transcendence); Proposition2.11 and proof of Theorem2.13 p.10 (whole-disc logarithmic coefficients)..

[^155]: F, arXiv math/0304085v2, Proposition2.11 p.10, the parameter1/t at∞..

[^156]: F, arXiv math/0304085v2, Proposition2.5 pp.8–9 and Definition2.9 pp.9–10..

[^157]: F, arXiv math/0304085v2, Proposition2.4 p.8; corroborated by Besser arXiv math/0011269v1, Corollary4.14 p.14..

[^158]: DJ, arXiv2007.11014v1, Proposition2.10 p.6 and its normalization on p.14.

[^159]: GSWZ, §3.1, after (174) p.38.

[^160]: W, Prop. 4.4 and proof (case n = 1) pp.364-365.

[^161]: W, Lem. 4.3 p.362.

[^162]: RJW, Thm. 6.7(ii) p.40.

[^163]: BHYY, Thm. 1.1 p.2.

[^164]: RJW, Proof of Thm. 6.1(ii) p.39.

[^165]: RJW, Rem. 5.19, (5.7) p.35; p.147 published.

[^166]: RJW, (6.2) p.37.

[^167]: BHYY, proof of Thm. 5.8 p.30.

[^168]: RJW, Def. 5.18 p.35.

[^169]: RJW, (3.11), §3.6 p.22.

[^170]: RJW, Defs. 4.5 and 4.10 pp.27-28.

[^171]: BF, proof of Prop. 2.1 p.2.

[^172]: RJW, (3.6), §3.5.3 p.20.

[^173]: RJW, Thm. 3.25 p.18.

[^174]: RJW, Lem. 5.12 p.33; p.145 published.

[^175]: RJW, proof of Lem. 6.5 p.38.

[^176]: RJW, Thm. 3.43 p.25.

[^177]: RJW, Lem. 3.29 p.19, and Rem. 3.45 p.25.

[^178]: RJW, §6.2 p.37.

[^179]: BF, §1 p.1.

[^180]: RJW, Lem. 6.5 p.38.

[^181]: RJW, (6.5) p.38.

[^182]: RJW, (3.8) and (3.9) p.21.

[^183]: BHYY, Thm. 5.5 p.27.

[^184]: RJW, proof of Thm. 6.1(ii), case (2) pp.38-39.

[^185]: BHYY, proof of Lem. 3.3 pp.14-15.

[^186]: RJW, proof of Thm. 6.1(ii), case (1) p.38.

[^187]: RJW, Rem. 5.3(ii) p.30.

[^188]: RJW, proof of Thm. 6.1(ii), case (2) p.39; p.153 published.

[^189]: RJW, Rem. 5.3 p.30.

[^190]: BBdJR, §4, (4.1) p.17.

[^191]: RJW, Thm. 6.7(i) p.39.

[^192]: RJW, proof of Thm. 6.1(i) p.36.

[^193]: BBdJR, proof of Prop. 4.17 p.22.

[^194]: BDJ-preprint, Rem. 1.5 pp.3-4.

[^195]: BBdJR, §4, (4.12) p.20.

[^196]: BDJ-preprint, §1, (1.2) p.3.

[^197]: BDJ-preprint, Thm. 1.12 p.6.

[^198]: BDJ-preprint, Rem. 1.13 p.6.

[^199]: BBdJR, Rem. 4.15 p.21.

[^200]: BBdJR, Conjecture 3.18 p.14.

[^201]: BBdJR, Def. 3.6 p.11.

[^202]: BBdJR, Prop. 3.12 p.12.

[^203]: RJW, §4, Prop. 4.4 and Def. 4.5, v2 pp.26–27; §3.5.2 p.20.

[^204]: RJW, Prop. 4.4 and Def. 4.5, v2 pp.26–27; (7.5)–(7.8) p.42; published (7-7)–(7-8), printed p.157.

[^205]: RJW, Prop. 4.4, v2 p.27 and §3.5.2 p.20.

[^206]: RJW, §3.5.2, v2 p.20; Prop. 4.4 p.27.

[^207]: RJW, (7.7)–(7.8), v2 p.42; published printed p.157.

[^208]: RJW, §3.5.2 p.20; Lem. 4.3 p.27.

[^209]: RJW, §3.5.2, v2 p.20; Def. 4.5 p.27; (7.7)–(7.8) p.42.

[^210]: RJW, Lem. 5.4 p.30.

[^211]: RJW, §3.5.2 p.20.

[^212]: RJW, §7, (7.5) p.42.

[^213]: BDJ-preprint, §2 p.10.

[^214]: BDJ-preprint, Prop. 2.6 p.10.

[^215]: BDJ-preprint, §2, (2.4) p.10.

[^216]: RJW, proof of Lem. 7.5 p.42.

[^217]: RJW, Lem. 7.5 p.42.

[^218]: RJW, Thm. 6.7(ii) p.39; p.154 published.

[^219]: BBdJR, proof of Prop. 4.17 p.23.

[^220]: RJW, Rem. 5.19 and Thm. 5.20 p.35.

[^221]: BBdJR, §1 p.3.

[^222]: RJW, Thm. 6.1 p.36.

[^223]: RJW, proof of Lem. 6.4 p.37.

[^224]: RJW, proof of Lem. 6.4 p.38; p.152 published.

[^225]: BHYY, proof of Prop. 5.6 p.28.

[^226]: BF, Section3, remark after Proposition3.1, preprint p6.

[^227]: BDJ-preprint, §2 p.9.

[^228]: BBdJR, Prop. 4.17 p.22.

[^229]: BBdJR, Rem. 4.19 p.23.

[^230]: RJW, Rem. 6.8 p.39.

## References
- **RJW:** Joaquin Rodrigues Jacinto, Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), arXiv:2309.15692v2.
- **F:** Hidekazu Furusho, [p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation](https://arxiv.org/abs/math/0304085v2), arXiv:math/0304085v2 (published Invent. Math. 155 (2004)).
- **BT:** Amnon Besser, [Coleman integration using the Tannakian formalism](https://arxiv.org/abs/math/0011269v1), arXiv:math/0011269v1 (published Math. Ann. 322 (2002)).
- **BBK:** Jennifer S. Balakrishnan, Robert W. Bradshaw, Kiran S. Kedlaya, [Explicit Coleman integration for hyperelliptic curves](https://arxiv.org/abs/1004.4936v2), arXiv:1004.4936v2 (ANTS IX, LNCS 6197, 2010).
- **BF:** Amnon Besser, [Finite and p-adic polylogarithms](https://arxiv.org/abs/math/0006051v1), arXiv:math/0006051v1 (published Compositio Math. 130 (2002)).
- **BH:** Amnon Besser, [Heidelberg lectures on Coleman integration](https://www.math.bgu.ac.il/~bessera/Heidelberg-lecture.pdf), author copy dated 7 November 2010, from the author's page, read 2026-09-25.
- **MP:** William McCallum, Bjorn Poonen, [The method of Chabauty and Coleman](https://math.mit.edu/~poonen/papers/chabauty.pdf), author preprint from Poonen's page, read 2026-09-25 (published in Panoramas et Syntheses 36, SMF 2012).
- **BDJ:** Amnon Besser, Rob de Jeu, [The syntomic regulator for the K-theory of fields](https://www.numdam.org/item/10.1016/j.ansens.2003.01.003.pdf), Ann. Sci. École Norm. Sup. (4) 36 (2003), 867-924 (version of record).
- **BBdJR:** Amnon Besser, Paul Buckingham, Rob de Jeu, Xavier-François Roblot, [On the p-adic Beilinson conjecture for number fields](https://arxiv.org/abs/0707.3682v2), arXiv:0707.3682v2 (published in Pure Appl. Math. Q. 5 (2009)).
- **BHYY:** Kenichi Bannai, Kei Hagihara, Kazuki Yamada, Shuji Yamamoto, [p-adic polylogarithms and p-adic Hecke L-functions for totally real fields](https://arxiv.org/abs/2003.08157v2), arXiv:2003.08157v2 (25 May 2022).
- **GSWZ:** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier, [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2), arXiv:2412.04241v2.
- **W:** Zdzisław Wojtkowiak, [A note on functional equations of the p-adic polylogarithms](http://www.numdam.org/item/BSMF_1991__119_3_343_0/), Bull. Soc. Math. France 119 (1991), no. 3, 343-370 (version of record).
- **RJW-published:** Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions (version of record)](https://msp.org/ent/2025/4-1/p03.xhtml), Essential Number Theory 4 (2025), no. 1, 101-216.
- **BDJ-preprint:** Amnon Besser and Rob de Jeu, [The syntomic regulator for K-theory of fields](https://arxiv.org/abs/math/0110334v2), arXiv:math/0110334v2.
- **DJ:** Rob de Jeu, [Describing all multivariable functional equations of dilogarithms](https://arxiv.org/abs/2007.11014v1), arXiv:2007.11014v1, 21 July 2020.
