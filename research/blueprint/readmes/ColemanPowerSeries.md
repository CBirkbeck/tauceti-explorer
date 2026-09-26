# Coleman power series, local units, and cyclotomic-unit quotients

This roadmap connects actual norm-compatible local units with norm-fixed power
series, then with bounded measures and the local cyclotomic-unit quotient. It
builds on the local-field and profinite-group roadmaps and on the bounded
Iwasawa-algebra interfaces. It does not rebuild global cyclotomic-unit subgroups
or turn the local quotient into the Galois main conjecture.

## Conventions and extent

The arithmetic prime p is odd unless a separate dyadic statement is proved.
The field index is n≥1, with K_n=ℚ_p(μ_(p^n)); write G=Gal(ℚ(μ_(p^∞))/ℚ),
Γ for its pro-p factor, and G⁺=G/{±1}. These are different groups.
The source sometimes calls the full group Γ; translate that notation explicitly.

For the algebraic section below, R is any commutative ring, B=R[[T]],
Y=1+T and D is the existing formal derivative. No prime or topology is needed
for those declarations. Write Δ(f)=Y D(f)f⁻¹ for f∈Bˣ. Inverses here are
inverses of actual units; T is not a unit. Additive torsion-freeness, not just
a characteristic-zero label, is required by the kernel theorem. For example,
ℤ×ℤ/3ℤ has characteristic zero but has additive torsion.

The ownership-corrected checkpoint covers 15 local algebraic nodes in L2. It includes
one definition, one construction, ten lemmas, one theorem and two comparisons;
all are implementation-unchecked. It does not assert completion of
any layer. In particular, the conditional comparison with a series F is an
algebraic theorem with a concrete denominator-cleared hypothesis. It does not
assume a Coleman map exists, and it does not construct the Dirichlet measure.

The named Lean signatures use the namespace
`TauCetiRoadmap.Campaign.ColemanPowerSeries`; names below are relative to it.
All 14 API items and eight definition/construction tests have corresponding
signatures/examples. Five comparison tests and two additional boundary controls
are also present. The suggested file is a specification, not a formalization.

## Ownership and baseline

The accepted RS-16 assignment is retained. PMIA abbreviates
`PadicMeasuresIwasawaAlgebras`.

| Interface | Owner | Coleman responsibility |
| --- | --- | --- |
| Finite local extensions, units, ramification, unramified Frobenius | LocalFieldsRamification L0–L3 | Construct the particular cyclotomic tower and norm-compatible structures |
| ℤ_p-module structure on abelian pro-p groups | ProfiniteProPGroups L4 | Prove that the principal-unit limit meets the hypotheses |
| Completed action | PMIA L1 | Verify its continuity and module hypotheses |
| Bounded ∂, φ, ψ, restriction, inverse derivative | PMIA L2 | Δ, finite-free norm/trace comparison, and the Coleman composite |
| Weierstrass adapter | PMIA L4, using pinned Mathlib preparation | Interpolation uniqueness and approximation |
| Compact exactness and tensor comparison | PMIA L5 | Prove the arithmetic sequence and its topology |
| Integral denominator q_a, smoothed F_a and normalized ζ_p | DirichletPadicLFunctions L1 | Import the exact denominator/basic-law nodes, prove the finite-sum comparison and Δ comparison, and retain the raw minus sign |
| Global cyclotomic groups and finite index | IntegralIwasawaTheory L0 | Local closure, compatible generator, inverse limit and local quotient |

The reviewed AUDIT-24 entries for all five stages guide this boundary. Norm
transitivity and the ℤ_p Amice equivalence already exist; neither is a new
declaration here. The algebraic nodes directly use the pinned power-series
carrier, derivative, coefficient map, substitution homomorphism, inverse/unit
criterion and multiplication-by-T injectivity, together with exact Dirichlet L1 denominator nodes. In particular the kernel proof
uses `PowerSeries.derivative.ext` with its actual
`IsAddTorsionFree` hypothesis.

The pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists fifteen statement-read
baseline declarations. No Tau Ceti result is reintroduced under a private
carrier. The search found analytic logarithmic derivatives but no formal
power-series unit Δ at these pins.

## L0. Towers and genuine modules

Construct K_n, its integers and residue fields from the existing local-field
interface. Choose compatible primitive roots and prove the cyclotomic
Eisenstein and relative norm facts; do not insert degree or ramification as
unconstrained fields of a structure. The inverse-limit elements are compatible
families of genuine units, with the norm transition maps.

The principal-unit tower is a closed compact abelian pro-p group. Only after
proving this may one apply the generic ℤ_p-module construction. The full group
has prime-to-p torsion and must not be called a ℤ_p-module. The finite-level
Teichmüller splitting must commute with the norms before passing to the limit:
for an element of μ_(p−1), the relative degree-p norm is its p-th power, hence
the element itself. This is an arithmetic compatibility to prove, not a
consequence of an abstract product decomposition alone. Identify the Tate
module with its actual compatible-root subgroup.

The unramified/semilocal coefficient version includes the coefficient
Frobenius and norm data. Ramified coefficients require their own sourced
statement. All these construction and topology nodes remain to be decomposed;
the L0 continuation record enumerates the precise tasks.

**Acceptance.** Field degrees and ramification agree with the local-field
supplier, norm maps compose, compatible roots give the specified Tate module,
and the torsion/principal splitting is continuous and norm-compatible.

## L1. The Coleman norm operator

Take B=ℤ_p[[T]] and φ(T)=Y^p−1. Prove the finite-free φ-coordinate
decomposition with basis 1,Y,…,Y^(p−1). Use the existing determinant norm and
trace of this finite-free algebra. Prove trace divisibility before comparing
the integral normalized trace with the bounded ψ supplied by PMIA L2.

The substitutions T↦ηY−1 are not ℤ_p[[T]] automorphisms for general
η∈μ_p. After adjoining μ_p they require the topology of the coefficient
extension: η−1 is topologically nilpotent, not nilpotent. Thus the formal
`HasSubst` used in L2 below is not the missing analytic substitution theorem.
Prove the product formula by the correct coefficient extension and descent,
then the compatibility between the Coleman norm and finite-level field norms.

All four congruences of RJW Lemma 10.11 are separate mathematical obligations.
The proof of its third part takes place in O_(K_1)[[T]], then intersects the
coefficient ideal with ℤ_p. The packet records the source's ambient-ring slip.

The interpolation theorem requires both uniqueness and existence. Use the
pinned Weierstrass engine through its Iwasawa adapter to establish the
finite-zero property, then uniqueness on the infinite set of cyclotomic
points. Prove finite-level lifts, compactness in the coefficientwise
(p,T)-adic topology, the norm-iteration approximation and the surjectivity of
evaluation on norm-fixed units. A map with interpolation as a hypothesis
does not establish the theorem.

**Acceptance.** Recover the isomorphism U_∞≃(ℤ_p[[T]]ˣ)^(N=id), not merely
injectivity; establish norm/evaluation identities and the four congruences.
The original Coleman and Coates–Sujatha source arguments and coefficient
variants still need reading and granular decomposition.

## L2. The Coleman map and its sign

### Algebraic declarations

The stable node prefix for the following declarations is
`ColemanPowerSeries:L2/`. Each proof uses only the listed node prerequisites,
the exact Dirichlet denominator nodes, the named pinned baseline, and elementary ring/unit manipulations. The
arithmetic and measure constructions are not hidden prerequisites of these
algebraic statements.

### One denominator owner

Write f_a for the imported `DirichletPadic.smoothingDenominator R a`, whose coefficient in degree n
is choose(a,n+1). Its owner is `DirichletPadicLFunctions:L1/smoothing-denominator`. The concurrently
submitted Dirichlet and Coleman checkpoints had described this same arithmetic object by binomial
coefficients and by a finite geometric sum. This correction makes those descriptions a comparison,
not two definitions.

The following basic laws are imported without local duplicate nodes:

| Law | Exact owner node |
| --- | --- |
| T f_a=(1+T)^a−1 | `DirichletPadicLFunctions:L1/denominator-factorization` |
| constant coefficient a | `DirichletPadicLFunctions:L1/denominator-constant` |
| unit a implies unit f_a | `DirichletPadicLFunctions:L1/denominator-unit` |
| coefficient-map compatibility | `DirichletPadicLFunctions:L1/denominator-coefficient-map` |

The old local factorization, constant, unit-criterion and coefficient-change node IDs are superseded
by these owner nodes. Every consuming edge is redirected. The retained local
`cyclotomic-series` ID now denotes only the finite-sum comparison. Its four tests remain;
they are comparison tests, not evidence for a second definition.

The suggested file uses local notation expanding the exact transparent binomial-coefficient body
of the imported proposed definition. This introduces no Lean declaration or alternate constructor.
The proposed supplier is not falsely imported as an existing compiled library module. On implementation,
replace that notation by the supplier's name and import its module. All mathematical prerequisites
already point to the supplier's exact blueprint nodes.

### Logarithmic derivative

Node `ColemanPowerSeries:L2/logarithmic-derivative`; declaration `logDeriv`.

For f∈Bˣ define Δ_R(f)=Y·D(f)·f⁻¹ in B. This is the weighted formal logarithmic derivative, not an analytic logarithm.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Use the existing PowerSeries.derivative and the inverse already carried by the unit f. Multiply in B; no convergence or rational coefficients are required.

**Dependencies.** `mathlib:PowerSeries.derivative`

**Acceptance.** Δ(1+T)=1; omitting the factor Y would instead give Y⁻¹.

**Uses.** RJW §12.2.1, Theorem 12.9 and Lemma 12.10: Product, integer powers and chain rule control the norm-fixed logarithmic derivative; kernel constants are the first kernel calculation. ColemanPowerSeries:L2 and L3: The Coleman composite and its kernel use Δ, coefficient change and the twist factor. This checkpoint does not construct the full composite.

**API.**

- `logDeriv_def` — Δ(f)=Y D(f) f⁻¹, with the existing formal derivative and the unit's inverse.
- `logDeriv_one` — Δ(1)=0.
- `logDeriv_mul` — Δ(fg)=Δ(f)+Δ(g); promoted to the product node.
- `logDeriv_inv` — Δ(f⁻¹)=−Δ(f); promoted to the inverse node.
- `logDeriv_zpow` — Δ(fⁿ)=nΔ(f) for n∈ℤ; promoted to integer powers.
- `logDeriv_const` — Δ(C(c))=0 for c∈Rˣ.
- `logDeriv_eq_zero_iff` — With IsAddTorsionFree R, Δ(f)=0 precisely for constant f.
- `logDeriv_map` — Coefficient change commutes with Δ; identity and composition follow from the existing PowerSeries.map laws.
- `logDeriv_subst` — (1+g)Δ(f[g])=Y Dg (Δf)[g] whenever HasSubst g.
- `logDeriv_power_subst` — For natural m, Δ(f[Yᵐ−1])=m(Δf)[Yᵐ−1]; not full p-adic equivariance.

**Tests.**

- `logDeriv_identity` — Over ℚ, Δ(1)=0.
- `logDeriv_one_add_X` — Over ℚ, a unit with value 1+T has Δ=1; detects omission of the weight.
- `logDeriv_inverse_one_add_X` — Over ℚ, the inverse of that unit has Δ=−1; detects the inverse sign.
- `logDeriv_characteristic_three` — Over ℤ/3ℤ, the unit 1+T³ has Δ=0 but is not constant; forbids dropping the additive-torsion-free kernel hypothesis.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Logarithmic derivative of a product

Node `ColemanPowerSeries:L2/logarithmic-derivative-product`; declaration `logDeriv_mul`.

For f,g∈Bˣ, Δ(fg)=Δ(f)+Δ(g).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Apply Derivation.leibniz to D(fg). Use (fg)⁻¹=f⁻¹g⁻¹ and commutativity; distribute Y and cancel units.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:Derivation.leibniz`

**Acceptance.** The target group is additive: the output is a sum, not a product.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Logarithmic derivative of an inverse

Node `ColemanPowerSeries:L2/logarithmic-derivative-inverse`; declaration `logDeriv_inv`.

For f∈Bˣ, Δ(f⁻¹)=−Δ(f).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Use PowerSeries.derivative_inv for the inverse of a unit. Multiply by Yf and cancel f; alternatively use the product lemma at ff⁻¹=1.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-product`, `mathlib:PowerSeries.derivative_inv`

**Acceptance.** For f=Y, the answer is −1.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Integer powers

Node `ColemanPowerSeries:L2/logarithmic-derivative-integer-powers`; declaration `logDeriv_zpow`.

For f∈Bˣ and n∈ℤ, Δ(fⁿ)=n·Δ(f), where the right side is integer scalar multiplication on the additive group B.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Induct on nonnegative n with the product lemma. For negative n use the inverse lemma and additive negation; no division by n.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-product`, `ColemanPowerSeries:L2/logarithmic-derivative-inverse`

**Acceptance.** n=0 gives zero and n=−1 gives the inverse formula.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Constant units

Node `ColemanPowerSeries:L2/logarithmic-derivative-constants`; declaration `logDeriv_const`.

For c∈Rˣ, Δ(C(c))=0, where the constant unit is Units.map of PowerSeries.C.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** PowerSeries.derivative_C makes D(C(c))=0. Substitute in the definition of Δ.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.derivative_C`

**Acceptance.** All constant units, including −1, are killed; this does not assert they are norm-fixed.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Kernel of the logarithmic derivative

Node `ColemanPowerSeries:L2/logarithmic-derivative-kernel`; declaration `logDeriv_eq_zero_iff`.

If the additive group of R is torsion-free, then Δ(f)=0 iff f=C(constantCoeff f), for every f∈Bˣ.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. IsAddTorsionFree R; mere characteristic zero is not substituted for this hypothesis in a ring with additive torsion.

**Construction or proof.** The constant coefficient of Y is 1, so Y is a unit by PowerSeries.isUnit_iff_constantCoeff. Cancel Y and f⁻¹ to deduce D(f)=0. PowerSeries.derivative.ext applied to f and its constant series proves equality; its additive-torsion-free assumption is explicit. The converse is the constant-unit calculation (or derivative_C).

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-constants`, `mathlib:PowerSeries.derivative.ext`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`

**Acceptance.** In characteristic 3, f=1+T³ is a nonconstant unit with Δ(f)=0; the omitted-hypothesis variant fails.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Coefficient change

Node `ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change`; declaration `logDeriv_map`.

For a commutative-ring homomorphism ρ:R→S, mapping the coefficients of Δ_R(f) gives Δ_S of the mapped unit.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. S is a commutative ring and ρ is a unital ring homomorphism; no injectivity or flatness is required.

**Construction or proof.** Compare coefficient n of D(map ρ f) and map ρ(Df), using coeff_derivative and that ρ preserves natural-number multiplication. The coefficient map preserves Y, products and the inverse of a unit. Apply the definition of Δ.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_derivative`

**Acceptance.** Reduction mod 3 commutes with Δ, but the torsion-free kernel theorem need not survive that reduction.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Weighted chain rule

Node `ColemanPowerSeries:L2/logarithmic-derivative-substitution`; declaration `logDeriv_subst`.

For g∈B with nilpotent constant coefficient and f∈Bˣ, let f[g] be the unit mapped by the existing substitution homomorphism. Then (1+g)Δ(f[g])=Y·D(g)·(Δ(f))[g].

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. PowerSeries.HasSubst g: the constant coefficient of g is nilpotent. This formal substitution condition does not cover ζ(1+T)−1 over ℤ_p[ζ].

**Construction or proof.** Use PowerSeries.derivative_subst and the substitution homomorphism's preservation of unit inverses. On substituting into Δ(f), the weight Y becomes 1+g. Multiply the two expressions out. No division by g or by 1+g is used.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.derivative_subst`, `mathlib:PowerSeries.substAlgHom`

**Acceptance.** g=T recovers the identity and g=0 makes the left side zero.

**Source.** Proposition 12.5, equation (12-2), printed p.179 / PDF 80; the cross-multiplied general chain rule is the algebraic calculation underlying it. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic substitution

Node `ColemanPowerSeries:L2/logarithmic-derivative-natural-power-substitution`; declaration `logDeriv_power_subst`.

For m∈ℕ and g_m=Yᵐ−1, Δ(f[g_m])=m·(Δ(f))[g_m]. This is a natural-power identity, not a theorem about the full ℤ_pˣ-action.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** constantCoeff(g_m)=0, so HasSubst.of_constantCoeff_zero' supplies substitution. D(g_m)=mY^(m−1) for m>0 by derivative_pow and D(Y)=1. Use the weighted chain rule; cancel the unit Yᵐ. For m=0, substitution is constant evaluation and both sides are zero.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-substitution`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:PowerSeries.derivative_X`

**Acceptance.** m=0 and m=1 are required; m=p is the formal Frobenius chain factor p.

**Source.** Proposition 12.5, equation (12-2), printed p.179 / PDF 80; natural-exponent specialization. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic finite-sum comparison

Node `ColemanPowerSeries:L2/cyclotomic-series`; declaration `cyclotomicSeries_def`.

Let f_a be the imported DirichletPadic.smoothingDenominator R a. For every a∈ℕ, f_a(T)=Σ_(0≤i<a)(1+T)ⁱ. This identifies RJW's local cyclotomic formula with the existing planned arithmetic denominator; it is not a second definition.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Multiply the proposed equality by T. The imported DirichletPadicLFunctions:L1/denominator-factorization identifies the left side with (1+T)^a−1. For the right side, induct on the finite sum (or telescope using T=(1+T)−1) to get the same polynomial. The base a=0 gives zero; the successor step adds T(1+T)^a. Cancel T with the baseline PowerSeries.X_mul_injective, valid even with zero divisors. The identification includes f_0=0 and f_1=1, and introduces no new carrier or inverse of T.

**Dependencies.** `DirichletPadicLFunctions:L1/smoothing-denominator`, `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** f_3=3+3T+T², not (1+T)³−1 and not its logarithm.

**Uses.** RJW §10.2, Proposition 10.4: Identify the imported arithmetic smoothing denominator with RJW's local cyclotomic expression, so the later unit lift and logarithmic derivative use the identical series. ColemanPowerSeries:L1 and L2: Arithmetic interpolation must identify this explicit series with the series of the genuine norm-compatible unit c(a); that arithmetic identification remains a gap.

**Tests.**

- `cyclotomicSeries_empty` — Over ℤ, f_0=0.
- `cyclotomicSeries_three` — Over ℤ, f_3=3+3T+T².
- `cyclotomicSeries_nonunit_at_three` — Over ℤ/3ℤ, f_3 is not a unit.
- `cyclotomicSeries_coefficient_reduction` — The existing coefficient map ℤ→ℤ/3ℤ sends f_3 to T².

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality. The shared series is imported from DirichletPadicLFunctions:L1; this node only proves its finite geometric-sum formula.

### Multiplication of parameters

Node `ColemanPowerSeries:L2/cyclotomic-series-parameter-product`; declaration `cyclotomicSeries_mul`.

For a,b∈ℕ, f_(ab)(T)=f_a(T)·f_b(Yᵃ−1).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The substituted argument has constant coefficient zero, so substitution is a ring homomorphism. Multiply by T and use T f_a=Yᵃ−1 and the substituted geometric factorization for f_b. Both sides multiplied by T become Y^(ab)−1. Cancel T by PowerSeries.X_mul_injective, valid without a domain assumption.

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** Either a=0 or b=0 gives zero; a=1 or b=1 gives f of the other parameter.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic unit series

Node `ColemanPowerSeries:L2/cyclotomic-series-unit`; declaration `cyclotomicSeriesUnit`.

For a∈ℕ whose image in R is a unit, construct the unique element u_a∈Bˣ with value f_a. Its inverse is the formal inverse of f_a, never 1/T.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The imported DirichletPadicLFunctions:L1/denominator-unit supplies IsUnit f_a from IsUnit a. Use the existing IsUnit.unit/Units carrier. Uniqueness follows from Units extensionality. For the unit API, coefficient-map compatibility imports denominator-coefficient-map and uses Units extensionality; constant/inverse tests import denominator-constant and the unit inverse laws. These basic denominator facts are not re-planned here.

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/denominator-coefficient-map`, `DirichletPadicLFunctions:L1/denominator-constant`

**Acceptance.** The inverse at a=3 over ℚ has constant coefficient 1/3.

**Uses.** RJW Proposition 10.4 and Definition 12.8: Δ is defined on actual units, so the explicit series requires the proven unit criterion. ColemanPowerSeries:L2: The sign computation uses the same series and its actual inverse, not a private abstract unit type.

**API.**

- `cyclotomicSeriesUnit_val` — The unit has underlying series f_a; promoted to the value node.
- `cyclotomicSeriesUnit_ext` — Every unit with value f_a equals u_a, independently of its proof of invertibility.
- `cyclotomicSeriesUnit_map` — A coefficient homomorphism takes u_a to u_a over the target, with any proof that a is a unit there.
- `cyclotomicSeriesUnit_inv` — f_a times the value of u_a⁻¹ is 1, using the existing Units inverse.

**Tests.**

- `cyclotomicSeriesUnit_one` — Over ℚ, u_1=1.
- `cyclotomicSeriesUnit_three_value` — Over ℚ, u_3 has value 3+3T+T².
- `cyclotomicSeriesUnit_three_inverse` — The constant coefficient of u_3⁻¹ is 1/3.
- `cyclotomicSeriesUnit_three_logDeriv` — For u_3 over ℚ, coefficients zero and one of Δ are 1 and 2/3; detects the wrong logarithmic derivative weight.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Underlying cyclotomic series

Node `ColemanPowerSeries:L2/cyclotomic-unit-value`; declaration `cyclotomicSeriesUnit_val`.

For ha: IsUnit(a in R), the underlying series of u_a is f_a.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The unit constructor chooses a witness to IsUnit f_a; its value is f_a by construction.

**Dependencies.** `ColemanPowerSeries:L2/cyclotomic-series-unit`

**Acceptance.** Changing the proof ha does not change the unit.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic logarithmic derivative

Node `ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared`; declaration `cyclotomicSeries_logDeriv_cleared`.

For ha: IsUnit(a in R), T f_a Δ(u_a)=aYᵃ−Y f_a.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and its image in R is a unit. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Differentiate T f_a=Yᵃ−1 using the product rule and derivative_pow; obtain f_a+T D(f_a)=aY^(a−1) when a>0. Multiply by Y and substitute the definition of Δ(u_a), using the unit-value node to cancel f_a. Handle a=0 by the same polynomial identity (only the zero ring can supply its unit hypothesis).

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-factorization`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:Derivation.leibniz`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.derivative_X`

**Acceptance.** No illegal division by the nonunit T occurs.

**Source.** Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Smoothed logarithmic derivative

Node `ColemanPowerSeries:L2/cyclotomic-smoothed-comparison`; declaration `cyclotomicSeries_logDeriv_smoothed`.

Let a∈ℕ be a unit in R. If F∈B satisfies T f_a F=f_a−C(a), then Δ(u_a)=C(a−1)−F. The equation for F is a denominator-cleared characterization of the independent smoothed series, not an assumption of the conclusion.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and ha: IsUnit(a in R). F is an actual power series satisfying T f_a F=f_a−C(a). This node is conditional algebra; the Dirichlet supplier must construct F for its measure application. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Use the cleared logarithmic derivative formula and the equation for F to compare T f_a times both sides. The discrepancy is a multiple of T f_a−(Yᵃ−1), so it vanishes by geometric factorization. Cancel the unit f_a and then T by X_mul_injective. This proof needs neither a field nor analytic logarithms.

**Dependencies.** `ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared`, `DirichletPadicLFunctions:L1/denominator-factorization`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** For a=3 over ℚ, F=1−(2/3)T+… and Δ(u_3)=1+(2/3)T+…; reversing the sign fails already in degree one.

**Tests.**

- `smoothed_three_sign` — Over ℚ with a=3, the defining equation for F forces coefficients 1 and −2/3, and Δ(u_3)=2−F.

**Source.** Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Realization in the Coleman composite

For positive a>1 prime to p, import the already planned Dirichlet L1 smoothed-series,
series-cleared-equation and smoothed-measure nodes. They supply the independently constructed F_a
and T f_a F_a=f_a−a for this same denominator. Only ψ/restriction/pseudomeasure results remain
in the Dirichlet stage-level request. The comparison theorem above then gives
Δ(u_a)=a−1−F_a without taking an inverse of T. To use this as a Coleman
calculation, L0/L1 must identify u_a with the interpolating series of the
actual norm-compatible units c_n(a)=(ζ_(p^n)^a−1)/(ζ_(p^n)−1).

Unit restriction kills the constant series. Consequently the raw composite

Col₀=A⁻¹ ∘ ∂⁻¹ ∘ (1−φψ) ∘ Δ ∘ Coleman

has Col₀(c(a))=−([a]−1)ζ_p once those genuine interfaces are constructed.
Define the normalized Col to be −Col₀ and prove that equality of maps.
This does not change ζ_p, the cyclotomic-moment quotient map, or the first
kernel inclusion. An equality of principal ideals would not determine this
sign and is not an adequate acceptance test.

For a=3, f_a=3+3T+T², Δ(u_a)=1+(2/3)T+… and F_a=1−(2/3)T+….
The coefficient of T detects both an omitted Y in Δ and the reversed sign.
These rational coefficients are p-integral for p≠3. The characteristic-3
test instead checks that f_3 is not a unit, so this parameter is excluded
exactly where it should be.

The first algebraic specialization of G-equivariance gives
Δ(f[Y^m−1])=m(Δf)[Y^m−1] for m∈ℕ. Full p-adic equivariance also needs the
p-adic power/substitution construction and continuity. The inverse derivative
on ψ=0 is multiplication by x⁻¹ on measures supported on units; this yields
the inverse twist factor a⁻¹. It is not an arbitrary antiderivative on B.
Both factors must be shown to cancel.

Negative integer parameters are not polynomials. The boundary control
`negative_parameter_boundary` checks Δ(−Y⁻¹)=−1; the full negative-parameter
family and its arithmetic compatibility remain in the continuation list.
The additional `power_subst_zero` control checks that substitution by zero
kills Δ. Together with the comparison example, the suggested file has
fifteen examples.

## L3. Kernel and cokernel

The torsion-free kernel theorem above concerns Δ on all formal units.
It does not prove the kernel of the Coleman map. First restrict to genuine
norm-fixed units: a constant c is norm-fixed precisely when c^p=c, and for a
unit this gives μ_(p−1). The image calculation is the separate mod-p
argument, lifting and compactness proof of RJW Lemmas 12.10–12.14.

Next construct the exact sequence for 1−φ on the ψ=1 subspace, including
the convergence of the series of iterates and its constant-term obstruction.
Combine the two sequences with the unit-supported inverse derivative.
Identify the full kernel μ_(p−1)×ℤ_p(1) and the cyclotomic-moment cokernel.
On principal units the required sequence is

0 → ℤ_p(1) → U_(∞,1) → ℤ_p[[G]] → ℤ_p(1) → 0.

Exactness is both algebraic and topological. For finite-flat coefficient
extension, tensor the two endpoint lattices and the unit module as well as
the Iwasawa algebra. The O(1) endpoints and completed-tensor comparison are
part of the assertion. They do not follow by changing the middle ring's
notation. The PMIA L5 request fixes the generic algebra supplier; the
arithmetic maps and hypotheses remain here.

**Acceptance.** Recover RJW Theorems 12.9 and 12.17 with actual continuous
maps, not assumed image/kernel predicates. Check the cyclotomic moment and
both endpoint identifications.

## L4. Cyclotomic units and inverse-limit generators

Import the global groups and finite-conductor real generators from
IntegralIwasawaTheory L0. Embed them in the local principal-unit tower and
prove the Teichmüller adjustment, retaining finite-level −1 where necessary.
Show that the closure of the relevant finitely generated subgroup is its
ℤ_p-span in the principal-unit module.

Prove norm compatibility of the chosen generator. Finite-level cyclicity
does not itself give a cyclic inverse limit with that generator: use the
compatible finite-level solution sets and compactness to prove surjectivity.
Apply the continuous Coleman map to the closed tower, determine its image
ideal and derive the odd-prime plus quotient

U_(∞,1)⁺/C_(∞,1)⁺ ≃ ℤ_p[[G⁺]]/(I(G⁺)ζ_p).

The O-coefficient assertion tensors the unit quotient too. This stage has
not yet been source-decomposed in the packet. Its acceptance includes
Theorems 11.9 and 12.23, actual finite-level units and all closure/comparison
maps. It is a local-unit theorem, distinct from the global Galois main
conjecture.

## Sources and corrections

The principal source is [Rodrigues Jacinto–Williams, published 2025](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
collated at the indicated passages with [arXiv v2](https://arxiv.org/pdf/2309.15692v2).
The packet records their exact hashes, read passages, locators and the bounded
search for corrections. This is not an exhaustive reading of either text.

The following findings concern the version of record and were also checked
in v2; they await independent review. Existing programme corrections are
credited rather than claimed as new discoveries.

- **ColemanPowerSeries/E1.** Definition 10.14/Theorem 10.15, published p.170 / PDF 71; arXiv v2 p.52; compare published Proposition 10.4/Lemma 10.5 p.165 and Definition 4.10 p.138. With the displayed composite call the map Col₀ and write Col₀(c(a))=−θ_a ζ_p. Define Col=−Col₀ for the positive formula; do not renormalize ζ_p. Δ(f_a)=a−1−F_a. Unit restriction kills constants, so the subsequent linear inverse derivative and Amice inverse give −x⁻¹ Res μ_a=−θ_a ζ_p. The positive formula contradicts these independently fixed definitions. The a=3 expansion checks the algebraic sign; it is not a proof of the measure comparison.
- **ColemanPowerSeries/E2.** Proof of Lemma 10.8, published p.167 / PDF 68; arXiv v2 p.49. Construct the finite-free extension and its determinant norm over ℤ_p first. Identify the product only after adjoining μ_p and using the completed coefficient topology; descend the equality. For nontrivial η∈μ_p with odd p, η−1 is not a coefficient in ℤ_p, so T↦η(1+T)−1 is not an endomorphism of ℤ_p[[T]]. Moreover its constant coefficient is topologically nilpotent but not nilpotent; the pinned formal subst API is insufficient even after extending coefficients. The product formula remains a target with the correct base-change and convergence proof.
- **ColemanPowerSeries/E3.** §10.2 after Lemma 10.3, published p.165 / PDF 66; arXiv v2 p.48. For a>0 the series is the finite geometric sum. For negative integer parameters it is an invertible infinite formal series, with f_(−a)=−Y^(−a)f_a. The source allows any integer a prime to p. At a=−1, f_(−1)=−(1+T)⁻¹ has infinitely many nonzero coefficients over ℤ_p, so is not a polynomial. The finite-sum construction in this packet is explicitly restricted to natural parameters.
- **ColemanPowerSeries/E4.** Proof of Lemma 10.11(iii), published p.168 / PDF 69; arXiv v2 p.50. Perform the congruences in O_(K₁)[[T]], modulo p₁ p^k O_(K₁)[[T]], then intersect coefficientwise with ℤ_p[[T]]. The ideal p₁ and η−1 belong to the ring of integers of K₁=ℚ_p(μ_p), not ℤ_p. For the descended difference, p₁p^k O_(K₁)∩ℤ_p=p^(k+1)ℤ_p. This repairs the ambient ring without changing the asserted congruence.
- **ColemanPowerSeries/E5.** Last displayed geometric-series equality in Proposition 4.4 proof, published p.137 / PDF 38 (rendered); arXiv v2 p.27. Insert a minus sign before the sum over n≥1, or use Σ_(n≥1)(−1)^(n+1)T^(n−1)g(T)^n. Since F=(1−(1+Tg)⁻¹)/T, the geometric tail is subtracted, not added. For a=3, g=1+T/3 and F has constant coefficient +1; the printed series has constant coefficient −1. Integrality remains correct, but the formula cannot define the source's F_a.
- **ColemanPowerSeries/E6.** §4.1 before Lemma 4.2, published p.136 / PDF 37; arXiv v2 p.26. Use a positive integer a (in the analytic Mellin argument) and retain a>1 prime to p in the smoothing supplier. Negative parameters require an independent algebraic power-series argument. The phrase integer coprime to p allows a=−1. Then 1/(e^t−1)+1/(e^(−t)−1)=−1 for positive t, which does not decay. The Mellin-transform hypothesis fails; this does not obstruct the positive-parameter p-adic construction.
- **ColemanPowerSeries/E7.** Final sentence in proof of Proposition 4.11, published p.139 / PDF 40; arXiv v2 p.28. Handle k=1 separately: ζ(0)=−1/2, but the Euler factor 1−p^(k−1) is zero. For odd k>1 the negative-even zeta value is zero; even k has positive sign. The printed iff between nonvanishing of ζ(1−k) and even k misses k=1. The interpolation conclusion remains unchanged because its Euler factor kills that exceptional case.
- **ColemanPowerSeries/E8.** Proof of Lemma 4.7, published p.137 / PDF 38; arXiv v2 pp.27–28. Either define and compare an extension of the trace operator to a suitable localization, or prove the rational partial-fraction identity after clearing denominators and apply it to the already-integral F_a. Do not apply the bounded-series ψ to 1/T directly. The ψ constructed from bounded measures acts on ℤ_p[[T]], which does not contain T⁻¹. The displayed calculation is a useful rational-function identity, but the asserted domain extension and agreement with bounded ψ are missing. The Dirichlet supplier must discharge this proof interface.
- **ColemanPowerSeries/E9.** Proof of Proposition 12.1, series immediately preceding (12-1), published p.178 / PDF 79; arXiv v2 p.57. The expansion of f_u starts at k=0; retain a₀(u). The next line requires a₀(u)≡1 mod p, and a unit series must have a unit constant coefficient. Starting the displayed expansion at k=1 contradicts that. The subsequent separated constant-term calculation uses the intended expansion.

The source's pseudomeasure localization/evaluation problems are already
recorded in PMIA's E1–E3. They are not new findings of this packet and are
not fixed by changing the sign of Col₀. Consumers must use the supplier's
admissible-evaluation interface.

## Exact continuation boundary

### ColemanPowerSeries:L0 — partial

- Decompose RJW §9 fully: actual cyclotomic fields K_n=ℚ_p(μ_(p^n)), n≥1, compatible roots, integral rings, degrees, residue fields, total ramification and relative norm formulas. Generic local-field structure and Eisenstein theory are imports, not fresh carriers here.
- Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module.
- Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.

### ColemanPowerSeries:L1 — partial

- Build the finite-free φ-coordinate basis, determinant norm and trace, normalized-trace divisibility and comparison with the PMIA bounded ψ. Use completed coefficient topology for root-of-unity substitutions, not formal HasSubst alone.
- Give norm/evaluation comparison and every part of Lemma 10.11, including the actual coefficient ring in the proof; inspect Coates–Sujatha Lemma 2.3.1 and Coleman original sources.
- Import pinned Weierstrass through PMIA L4; prove interpolation uniqueness and finite-level lifting, compact successive approximation, and surjectivity onto the entire norm-compatible tower. Recover Theorems 10.2 and 10.13, including unramified variants with precise hypotheses.

### ColemanPowerSeries:L2 — partial

- Identify the explicit f_a with the Coleman series of the actual unit tower c(a), proving membership, relative norm compatibility and interpolation; the 15 local algebraic nodes do not construct the tower.
- Extend the natural-parameter finite-sum family to negative integers with f_(−a)=−Y^(−a) f_a, and prove full p-adic-exponent substitution and continuity. The source's blanket polynomial claim for negative a is false.
- Consume actual PMIA bounded measure operators and the still-missing Dirichlet ψ/restriction/pseudomeasure results. The smoothed series, integral measure and T f_a F_a=f_a−a are already supplied by the exact Dirichlet L1 nodes; instantiate its series-cleared-equation on the shared denominator. Then prove equality of measures for raw Col₀ and normalized Col=−Col₀. This algebraic checkpoint introduces no measure carrier or Col map.
- Establish additivity, continuity, principal-unit ℤ_p-linearity and full G-equivariance; explicitly cancel the factors a and a⁻¹ from Δ and inverse derivative. Natural-power and integer-power lemmas alone are insufficient.

### ColemanPowerSeries:L3 — partial

- Decompose the mod-p image calculation and lifting/compactness proof in Lemmas 12.10–12.14; derive the exact logarithmic-derivative sequence of Theorem 12.9 on actual norm-fixed units.
- Decompose the 1−φ exact sequence on ψ=1, including convergence of the series of iterates and the evaluation-at-zero obstruction.
- Construct the kernel μ_(p−1)×ℤ_p(1), cyclotomic-moment cokernel, and Theorem 12.17 for principal units as both topological and algebraic modules. Tensor every term in a finite-flat coefficient extension and prove the completed-tensor comparison.

### ColemanPowerSeries:L4 — not_read

- Read and decompose RJW §11 and §12.3 through Theorem 12.23 with their cited sources. Import actual global cyclotomic subgroups, finite-conductor real generators and their finite index from IntegralIwasawaTheory:L0.
- Prove local embeddings, the Teichmüller-adjusted compatible generator, closure equals ℤ_p-span, finite-level generation and the compactness argument for inverse-limit cyclicity. Retain −1 at finite real level where required.
- Compute the closed cyclotomic tower's Coleman image and U_(∞,1)^+/C_(∞,1)^+ ≃ Λ(G^+)/(I(G^+)ζ_p) for odd p; transport the unit quotient itself under coefficient extension. This is not the Galois main conjecture.

The six gap records and eleven supplier requests are open. Their
`neededBy` entries name stages because the missing arithmetic declarations
have not been invented merely to give the requests a node target. The
nineteen algebraic node chains use only existing baseline declarations or
earlier nodes; passing the packet checker does not close the stage targets.

Two planets are proposed in L2: Logarithmic derivative and Cyclotomic power
series. No planet is a completion claim. The reader and packet contain no
Lean implementation; all implementation statuses remain unchecked.
