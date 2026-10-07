# Modularity and modular parametrisations of elliptic curves over ℚ, Part II

## Effective residual comparisons

Modularity attaches a normalized weight-two newform to an elliptic curve over ℚ. A modular-method argument needs more than this existence theorem. It removes primes from a level, compares residual representations, and asks when the surviving newform has rational coefficients. If the initial curve has full rational two-torsion, the comparison curve must retain that structure. These questions require quantitative estimates and integral comparisons that are absent from the unconditional modularity statement.

This continuation develops the reusable arithmetic package in Bennett–Siksek §2. Its first main export bounds the characteristic of a residual coincidence at a removed multiplicative prime. Its second constructs a curve at the exact residual conductor with the same residual representation and full rational two-torsion. The dimension estimate of Martin and the comparison theorems of Kraus make both results effective. The two remaining exports are uniform irreducibility for curves with rational two-torsion and Lemos’s surjectivity theorem for non-CM curves admitting a rational cyclic isogeny.

The parent’s `EllipticCurveModularity:R29.6/modularity-theorem` supplies modularity over ℚ, including the exact level and the equivalences with modular parametrisations and Jacobian quotients. Its proof of residual irreducibility for each fixed curve does not need the uniform isogeny theorems developed here. This direction of dependence is essential: EC.5 consumes the parent’s arithmetic setting, and no edge returns from EC.5 to the parent’s initial irreducibility step.

The roadmap has six layers. EC.1 defines the three numerical thresholds and proves the sharp dimension estimate. EC.2 converts level-lowering congruences into bounds on the residual characteristic. EC.3 forces small Fourier coefficients to be integers, recognizes rationality from finitely many coefficients, and realizes the rational newform by a curve of exact conductor. EC.4 propagates point-count congruences modulo four and repairs two-torsion by a two-isogeny. EC.5 derives uniform irreducibility from rational-isogeny exclusions. EC.6 proves the restricted uniformity theorem by combining Cartan reduction, formal immersion, integral modular-curve points, and complete Galois-image certificates.

The genus-zero functions in EC.6 and the finite dimension calculations in EC.1 are exact arithmetic. An implementation must attach the calculations to intrinsic modular curves and newspaces. Tables, database identifiers, and a handful of tested primes do not provide the universal statements the final theorems require.

## Conventions and imported objects

All elliptic curves are smooth genus-one curves with an origin, defined over ℚ and represented by elliptic Weierstrass models. Their geometric torsion groups are the actual points of the curve over an algebraic closure, with the natural action of Gℚ. For a rational prime ℓ, E[ℓ] is a two-dimensional vector space over 𝔽ℓ. Isomorphism of E[ℓ] and F[ℓ] means a Gℚ-equivariant linear isomorphism over 𝔽ℓ. A newform representation is compared after extension to the residue field at the chosen prime above ℓ; it is not identified with the elliptic representation by a change of notation.

Write M for the conductor of E and Δ for its global minimal discriminant. The valuation ordq(Δ) is the nonnegative integer valuation of the nonzero minimal discriminant, independent of changing the minimal model by an integral admissible coordinate transformation. The expression q∥M means that the conductor exponent at q is exactly one. The prime-to-ℓ residual Artin conductor is N(E[ℓ]); by definition it has no factor ℓ. The Serre weight is the source-scoped weight of the odd residual representation. Finite flatness at ℓ supplies weight two only under the supplier’s precise local hypotheses.

The quotient level M₀ in `SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve` is

\[
 M_0=M\Big/\prod_{\substack{q\parallel M\\ \ell\mid\operatorname{ord}_q(\Delta)}}q.
\]

The product runs over all primes satisfying the displayed conditions. Its definition does not exclude q=ℓ. Accordingly M₀ is a quotient level and N(E[ℓ]) is a prime-to-ℓ conductor; their equality is a theorem with local hypotheses. The removed-prime estimate uses M₀ as supplied by R20.6. Kraus’s theorems use N(E[ℓ]) and Serre weight two. An application at M₀ must cross that interface explicitly.

Full rational two-torsion means E[2](ℚ) has four elements, or equivalently that the Gℚ-action on E[2] is trivial. A rational two-torsion point means one nonzero element of order two in E(ℚ). A rational cyclic n-isogeny is characterized by a Gℚ-stable cyclic subgroup of E(ℚ̄) of order n. Its points need not be individually rational. Non-CM means every geometric endomorphism is integer multiplication, equivalently Endℚ̄(E)=ℤ. Replacing geometric endomorphisms by endomorphisms over ℚ would change the hypothesis.

A newform is normalized, cuspidal, of weight two and trivial nebentypus. Its full coefficient field K is generated by all Fourier coefficients, and these coefficients are algebraic integers. Its residual representation is attached to a Galois-stable lattice and a prime λ above ℓ, then semisimplified. Irreducibility of E[ℓ] makes this semisimplification compatible with the desired residual isomorphism. The degree [K:ℚ] counts all embeddings into ℂ; norm bounds use all of them, including multiplicities.

For N>0, μ(N) is the index of Γ₀(N) in SL₂(ℤ), equivalently N∏q|N(1+1/q). Let g⁺(N) denote the complex dimension of the weight-two Γ₀(N) newspace with trivial character. Tau Ceti’s bundled newforms and newspace use Γ₁(N). The trivial-character intersection identifies the space required here. This compatibility must be preserved when using a general dimension formula. The thresholds are real numbers; their inequalities are strict. The expression μ(N)/6 is real division and its square root is taken before exponentiation.

## Baseline and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed EllipticCurves, ModularForms and algebraic-modular-forms audits guide the boundary. The upstream EllipticCurves and ModularForms reader documents supply the conventions and library structure. Declaration statements at the two pins, rather than the presence of a similar name, determine which mathematical steps are already available.

The following distinctions govern the plan. The norm product formula exists, but converting an integral element norm into a field norm and extracting the residue characteristic divisor still needs an adapter. The normalized newform carrier exists, but integrality of its full coefficient field and compatibility of every conjugate are supplier targets. The analytic Sturm equality theorem exists, but it cannot substitute for congruences modulo an ideal such as (2)². The finite-field trace formula exists, but the Hasse inequality and the elliptic Tate-module conductor comparison are separate results. Actual point maps and coordinate-pullback isogeny homomorphisms exist; the complete geometric endomorphism classification and the local torsion actions are not consequences of those carrier definitions alone.

The roadmap owns the effective norm estimate, sharp dimension inequality, rationality comparisons, and the arithmetic isogeny/image results. It imports general newform, Tate-module, local-conductor, modular-curve, and finite-group theories. The mixed Cartan modular curves needed in EC.6 exceed the currently described Γ₀/Γ₁ compactification scope. Their construction belongs in a shared modular-curve extension serving both this continuation and the imaginary-quadratic continuation. The absence of that extension is recorded explicitly; it is not filled by an unspecified modular-curve object.

### Baseline declarations and their scope
- `mathlib:Algebra.norm_eq_prod_embeddings`: Norm as the product over all embeddings into an algebraically closed extension.
- `mathlib:Algebra.norm_eq_zero_iff`: Norm is zero exactly at zero for a finite free extension of domains.
- `mathlib:Ideal.absNorm_dvd_norm_of_mem`: Ideal norm divides the integral element norm for an element belonging to that ideal.
- `tauceti:HeckeRing.GL2.Newform`: Bundled normalized newform on Γ₁(N), with a nebentypus and newness.
- `tauceti:TauCeti.cuspFormsNew`: Γ₁(N) newspace, Petersson orthogonal to the oldspace; trivial-character intersection supplies Γ₀ newspace.
- `tauceti:cuspFormCharSpace`: Joint diamond eigenspace for a specified nebentypus.
- `tauceti:TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z`: Characteristic-zero equality bound; does not provide congruence modulo arbitrary ideals.
- `mathlib:CongruenceSubgroup.Gamma0`: Congruence subgroup used for μ(N) as its index.
- `tauceti:WeierstrassCurve.frobeniusTrace_eq_card_point`: For an elliptic finite-field model the trace equals q+1 minus the actual point-group cardinality.
- `mathlib:WeierstrassCurve.j`: j-invariant of an elliptic Weierstrass curve.
- `mathlib:Representation.IsIrreducible`: Irreducibility via the simple lattice of subrepresentations.
- `tauceti:TauCeti.Isogeny.Hom`: Coordinate-pullback elliptic homomorphisms, including zero; the Add module supplies integer multiples of identity.
- `mathlib:WeierstrassCurve.Affine.Point.map`: Actual additive point map along an algebra homomorphism; used for Galois stability.

## EC.1. Thresholds and sharp newspace dimensions

The dimension g⁺ belongs to the supplier’s newspace theory; this layer owns its sharp upper bound, rather than a second definition of the space. The exact exponent 2g⁺ controls the number-field norm in EC.2 and EC.3. The lcm in the two-torsion threshold comes from the weight-two level-four Eisenstein comparison in EC.4. A threshold at the radical of N loses this integral level information.

The degenerate newspace case is useful: g⁺(1)=g⁺(2)=0 makes F equal to one, but there is no normalized newform in these zero-dimensional spaces. Consequently the existence hypotheses in EC.3 do real work. At level 11, μ(11)=12, g⁺(11)=1 and μ(44)=72. Thus F(11)=(√2+1)² and G(11)=(√12+1)². The maximum cannot uniformly be replaced by F. At level 35, μ(35)=48 and g⁺(35)=3, giving F(35)=(√8+1)⁶. These cases detect a missing square root, a wrong exponent, and an incorrectly chosen newspace.

Martin’s estimate is sharper than a coarse genus inequality. His general formula expresses the new dimension using multiplicative functions and elliptic-point correction terms. The proof of the sharp bound divides according to the number of prime divisors. Its final finite calculation is part of the proof: the reduction to 10,125 integers and the bounded checks are verified with exact formulas. A general asymptotic estimate does not establish the equality classification.

### Kraus rationality threshold

Declaration `krausF`. For positive N, μ(N)=[SL₂(ℤ):Γ₀(N)] and g⁺(N)=dimℂ S₂(Γ₀(N))new, define krausF(N)=(√(μ(N)/6)+1)^(2g⁺(N)), as a real number.

The API exposes these operations without unfolding the threshold:

- `krausF_eq` (characterisation): krausF(N)=(√(μ(N)/6)+1)^(2g⁺(N)).
- `one_le_krausF` (relation): 1≤krausF(N).
- `krausF_eq_one_of_dim_zero` (simp): g⁺(N)=0 implies krausF(N)=1.

The unit tests are:

- `krausF_one` (degenerate): krausF(1)=1.
- `krausF_eleven` (computation): krausF(11)=(√2+1)^2.
- `krausF_thirtyfive` (computation): krausF(35)=(√8+1)^6.

The threshold is consumed by Kraus’s comparison theorems and the modular-method cutoff calculations; the strict inequality and normalization are part of its public interface.

Proof route. Use the supplier’s index and trivial-character newspace dimension; real division by 6 precedes the square root.

Direct dependencies: `mathlib:CongruenceSubgroup.Gamma0`, `tauceti:TauCeti.cuspFormsNew`, `tauceti:cuspFormCharSpace`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.1, equation (7), p. 1143.

Acceptance: At g⁺=0 the threshold is 1, not 0.

Atlas planet: Kraus rationality threshold.

### Kraus two-torsion threshold

Declaration `krausG`. For positive N define krausG(N)=(√(μ(lcm(4,N))/6)+1)^2, using the full level lcm(4,N), as a real number.

The API exposes these operations without unfolding the threshold:

- `krausG_eq` (characterisation): krausG(N)=(√(μ(lcm(4,N))/6)+1)^2.
- `one_le_krausG` (relation): 1≤krausG(N).
- `krausG_eq_of_lcm_eq` (compatibility): lcm(4,N)=lcm(4,M) implies krausG(N)=krausG(M).

The unit tests are:

- `krausG_one` (degenerate): krausG(1)=4.
- `krausG_two` (computation): krausG(2)=4.
- `krausG_eleven` (computation): krausG(11)=(√12+1)^2.

The threshold is consumed by Kraus’s comparison theorems and the modular-method cutoff calculations; the strict inequality and normalization are part of its public interface.

Proof route. Use the same μ as krausF; lcm is taken before μ; the exponent is exactly 2.

Direct dependencies: `mathlib:CongruenceSubgroup.Gamma0`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.1, equation (8), p. 1144.

Acceptance: For N=1 and N=2 the value is 4.

Atlas planet: Kraus two-torsion threshold.

### Kraus comparison threshold

Declaration `krausH`. For positive N define krausH(N)=max(krausF(N),krausG(N)).

The API exposes these operations without unfolding the threshold:

- `krausF_le_krausH` (relation): krausF(N)≤krausH(N).
- `krausG_le_krausH` (relation): krausG(N)≤krausH(N).
- `krausH_lt_iff` (characterisation): krausH(N)<x iff krausF(N)<x and krausG(N)<x.

The unit tests are:

- `krausH_one` (degenerate): krausH(1)=4.
- `krausH_two` (computation): krausH(2)=4.
- `krausH_not_F_eleven` (non-example): krausF(11)<krausH(11).

The threshold is consumed by Kraus’s comparison theorems and the modular-method cutoff calculations; the strict inequality and normalization are part of its public interface.

Proof route. Take the real maximum; neither branch can be discarded uniformly.

Direct dependencies: `EllipticCurveModularityPartII:EC.1/krausF`, `EllipticCurveModularityPartII:EC.1/krausG`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.1, equation (9), p. 1144.

Acceptance: ℓ>krausH(N) is equivalent to both strict inequalities.

Atlas planet: Kraus comparison threshold.

### Martin’s sharp weight-two dimension bound

Declaration `martin-bound`. For every positive N, 12g⁺(N)≤N+1. Equality holds exactly when N=35 or N is prime with N≡11 mod 12.

Proof route. Import the general dimension formula and old/new decomposition from ModularForms 10C and Layer 3; obtain Martin’s multiplicative formula by Möbius convolution, rather than defining a second newspace. Apply Martin Lemmas 16 and 19 for at most two prime factors. For at least three, use Lemmas 20–22 to reduce to 2^a3^b5^cp^d with 0≤a,b,c,d≤5 and 7≤p≤41. Verify the 10,125 distinct remaining integers, and the finite checks below 1521 and 1548, by exact dimension formulas; derive the equality cases.

Direct dependencies: `tauceti:TauCeti.cuspFormsNew`, `tauceti:cuspFormCharSpace`, `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`, `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`.

Source: [Greg Martin](https://arxiv.org/pdf/math/0306128), Theorem 2; §5, Lemmas 16–22, pp. 14–16 (v1).

Acceptance: N=1 gives 0; N=11 gives 1; N=35 gives 3; N=23 gives 2 and equality.

Atlas planet: Martin’s dimension bound.

Layer coverage: planned. Resolve the exact supplier contracts listed in requests.

## EC.2. Removed-prime exponent bounds

The removed-prime argument measures a nonzero algebraic integer lying in λ. The difference is p+1∓c_p, rather than a difference of two good-reduction traces. Since p is absent from M₀, the newform coefficient has the good-prime purity bound at every embedding. The strict inequality p+1>2√p rules out zero in every sign case. The characteristic ℓ divides its integral norm, which has absolute value at least ℓ.

The upper norm bound is (p+1+2√p)^d=(√p+1)^(2d), where d is the coefficient-field degree. The conjugate orbit injects into the newspace at M₀, so d≤g⁺(M₀). Martin’s estimate then gives 2d≤(M₀+1)/6. Because the base √p+1 exceeds one, exponent comparison has the correct direction. The final exponent is generally rational, so a real power is required.

The statement excludes p=ℓ, where a Frobenius comparison is not supplied by the away-from-ℓ formula. It also requires multiplicative exponent one; arbitrary conductor lowering at additive primes does not satisfy the displayed congruence. None of these exclusions can be dropped by observing that an ideal norm is an integer.

### Effective congruence norm bound

Declaration `norm-bound`. Let K be a number field of degree d, x∈𝒪K nonzero, λ a prime above the rational prime ℓ, and x∈λ. If |σ(x)|≤B for every embedding σ:K→ℂ and B≥0, then ℓ≤|NormK/ℚ(x)|≤B^d.

Proof route. The residue characteristic ℓ divides the ideal norm of λ, which divides Normℤ(x) by the baseline ideal-norm result. Use norm nonvanishing and the all-embeddings product formula, with the integral/field norm comparison; bound each factor, including conjugate embeddings with their multiplicities.

Direct dependencies: `mathlib:Algebra.norm_eq_prod_embeddings`, `mathlib:Algebra.norm_eq_zero_iff`, `mathlib:Ideal.absNorm_dvd_norm_of_mem`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Lemma 2.2 proof, p. 359.

Acceptance: A bound at one distinguished embedding alone is insufficient; x=0 must be excluded.

Atlas planet: Effective norm bound.

### Removed-prime exponent bound

Declaration `removed-prime-bound`. Let E/ℚ have conductor M and minimal discriminant Δ, ℓ≥3 prime with E[ℓ] irreducible, and M₀ the reduced level of R20.6. If p≠ℓ is prime, p∥M and ℓ divides ordp(Δ), then ℓ≤(√p+1)^((M₀+1)/6).

Proof route. Use the supplier’s weight-two newform f at M₀ and the removed-prime congruence p+1≡±c_p modulo λ. Every conjugate satisfies |σ(c_p)|≤2√p. Hence p+1∓c_p≠0 since p+1>2√p; bound the norm by (√p+1)^(2d). The orbit degree d≤g⁺(M₀) and Martin’s bound give 2d≤(M₀+1)/6. Use the real power and base √p+1>1.

Direct dependencies: `EllipticCurveModularityPartII:EC.2/norm-bound`, `EllipticCurveModularityPartII:EC.1/martin-bound`, `SerreWeightAndLevelOptimisation:R20.6/weight-two-newform-at-reduced-level`, `SerreWeightAndLevelOptimisation:R20.6/removed-prime-trace-congruence`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `AutomorphicGaloisRepresentations:R19.3`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Lemma 2.2, p. 359.

Acceptance: The characteristic prime p=ℓ is excluded; additive primes are excluded; sign does not affect the bound.

Atlas planet: Removed-prime exponent bound.

Layer coverage: planned. Norm comparison and residue characteristic divisibility Resolve the exact supplier contracts listed in requests.

## EC.3. Rationality and exact-conductor realization

Kraus’s rationality mechanism first forces integrality at finitely many prime indices. At a bad prime of the newform, the weight-two trivial-character coefficient is already 0 or ±1. At a good prime q≤μ(N)/6, a nonrational coefficient gives a nonzero difference from the integral elliptic trace, or from ±(q+1) at removed multiplicative reduction. Every conjugate of that difference is bounded by (√q+1)². The norm argument therefore contradicts ℓ>F(N).

The characteristic prime needs care. If a realizing newform exists, g⁺(N)≥1; then F(N)>μ(N)/6, so no tested prime is ℓ. The local-conductor comparison for ℓ≥5 separates good from removed multiplicative reduction. This is the precise reason the short proof cannot treat all bad reduction by the same trace formula.

Finite-prime rationality is a characteristic-zero recognition result. Hecke recurrences reconstruct the coefficients up to the Sturm bound from the small prime coefficients, with bad-prime terms handled separately. Each conjugate form therefore agrees through that bound. Sturm equality makes it equal to the initial form; invariance under every embedding puts each coefficient in ℚ, and algebraic integrality puts it in ℤ.

A rational newform determines a dimension-one modular quotient. The conductor of that quotient is exactly the primitive level N; an assertion that it divides N does not discharge Kraus’s theorem. Residual realization uses the common coefficient field, Chebotarev, and semisimplicity, with irreducibility retained when descending to the elliptic 𝔽ℓ-representation.

### Finite-prime rationality recognition

Declaration `finite-rationality`. For a normalized weight-two trivial-character newform f of level N, if c_q∈ℤ for every prime q≤μ(N)/6, then every coefficient c_n is in ℤ.

Proof route. Galois conjugation preserves the normalized newform. Prime-power Hecke recurrences, including the bad-prime coefficients 0,±1, give equality of all coefficients n≤floor(μ(N)/6). Apply characteristic-zero Sturm equality to f and each conjugate. Algebraic integrality then turns rational coefficients into integers.

Direct dependencies: `tauceti:HeckeRing.GL2.Newform`, `tauceti:TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`, `ComputationalNumberTheory:CN.3`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.2, Lemma 1, pp. 1144–1145.

Acceptance: Only checking good primes is valid after separately proving integrality at primes dividing N.

Atlas planet: Finite rationality recognition.

### Small-prime integrality above the Kraus threshold

Declaration `small-prime-integrality`. Let E/ℚ have irreducible E[ℓ], Serre weight 2, ℓ≥5 prime, and residual conductor N. For a weight-two trivial-character newform f realizing E[ℓ] at N, if ℓ>krausF(N), then c_q∈ℤ for all primes q≤μ(N)/6.

Proof route. If c_q is nonintegral, q∤N by the bad-prime formula. Since g⁺(N)≥1 and krausF(N)>μ(N)/6, q≠ℓ. At good q use c_q≡a_q(E); at a removed multiplicative q use c_q≡±(q+1). The differences are nonzero because c_q is nonrational. Hasse and purity bound every conjugate difference by (√q+1)^2; use the norm bound and degree≤g⁺(N) to obtain ℓ≤krausF(N), a contradiction.

Direct dependencies: `EllipticCurveModularityPartII:EC.1/krausF`, `EllipticCurveModularityPartII:EC.2/norm-bound`, `EllipticCurveModularityPartII:EC.3/finite-rationality`, `EllipticCurveModularity:R29.6/modularity-theorem`, `SerreWeightAndLevelOptimisation:R20.4`, `ArithmeticGaloisRepresentations:R01.6`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `AutomorphicGaloisRepresentations:R19.3`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.2, proof of Theorem 3, p. 1145.

Acceptance: The case g⁺(N)=0 cannot admit the required newform.

Atlas planet: Kraus coefficient rationality.

### Rational newform comparison curve

Declaration `rational-newform-curve`. For a normalized weight-two trivial-character newform f of exact level N with all coefficients in ℤ, there exists an elliptic curve F/ℚ of exact conductor N with a_q(F)=c_q at good primes. If f realizes irreducible E[ℓ], then F[ℓ]≅E[ℓ] over ℚ.

Proof route. Use the supplier’s J₀(N) newform quotient, of dimension one because the full coefficient field is ℚ; identify it as an elliptic curve with its origin. Local-global compatibility proves exact conductor N, rather than merely a divisor; compare residual characteristic polynomials via Chebotarev and semisimplicity.

Direct dependencies: `AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform`, `ModularCurvesPartII:R14.5`, `AutomorphicGaloisRepresentations:R19.4`, `ArithmeticGaloisRepresentations:R01.5`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.1, p. 1143; Theorem 3.

Acceptance: The ℚℓ-dimension of the quotient Tate module is 2, not 2[N:ℚ]; reducible residuals require semisimplification.

Atlas planet: Rational newform realization.

### Kraus’s rational comparison theorem

Declaration `kraus-rational`. For E/ℚ, prime ℓ≥5, irreducible E[ℓ] of Serre weight 2 and prime-to-ℓ conductor N, ℓ>krausF(N) implies there is F/ℚ of exact conductor N with F[ℓ]≅E[ℓ].

Proof route. Parent modularity supplies Kraus’s modularity assumption; take the exact-conductor residual newform. Apply small-prime integrality, finite-prime rationality recognition and rational-newform realization.

Direct dependencies: `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularityPartII:EC.3/small-prime-integrality`, `EllipticCurveModularityPartII:EC.3/finite-rationality`, `EllipticCurveModularityPartII:EC.3/rational-newform-curve`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), Theorem 3, p. 1144.

Acceptance: No full rational 2-torsion conclusion follows from this threshold alone.

Atlas planet: Kraus’s rational comparison theorem.

Layer coverage: planned. Resolve the exact supplier contracts listed in requests.

## EC.4. Full rational two-torsion realization

Preservation of full rational two-torsion is not automatic under a residual isomorphism at an odd prime. It is obtained through point counts. The additional G(N) bound makes all tested trace differences smaller than ℓ, so congruent integral traces are equal. Good reduction at the tested odd primes injects the original rational two-torsion, yielding divisibility of the comparison curve’s point counts by four.

The finite recognition theorem upgrades the tested congruences to all good odd primes. Its modular-form input is a weight-two level-four series with odd coefficients given by divisor sums, together with the source’s depletion at bad primes. It is an ideal-valued congruence calculation at level lcm(4,N). The analytic characteristic-zero equality theorem does not supply this implication, especially in residue characteristic two.

Point counts divisible by four do not force the initial comparison curve to have four rational two-torsion points. Chebotarev instead constrains its mod-four image. The subgroup argument produces a rational point of order two and, when needed, the quotient by that point has full rational two-torsion. The repair is a degree-one or degree-two rational isogeny. Its inverse on odd torsion and conductor invariance preserve the two conclusions already obtained in EC.3.

For applications at the quotient level M₀, equality with N(E[ℓ]) is checked prime by prime. When ℓ≥5 and ℓ∤M, the additive exponents agree and the multiplicative exponent drops exactly when ℓ divides the minimal discriminant valuation. No factor at ℓ is present. The weight-two consequence uses the finite-flat supplier statement. When ℓ divides M, the quotient level expression alone does not justify either identification.

### Finite recognition of point counts modulo four

Declaration `finite-mod-four`. For E/ℚ of conductor N, 4 divides #E(𝔽q) at every prime q∤2N iff it does so for all such q≤μ(lcm(4,N))/6.

Proof route. Import the ideal-valued Sturm congruence bound, not just analytic equality. Compare with the weight-two Γ₀(4) series Σ_{n odd}σ₁(n)q^n. Deplete coefficients at primes dividing 2N using the source’s bad-prime conditions, transfer to lcm(4,N), and apply Kraus Appendix II Proposition 2 at the ideal 2ℤ squared. Parent modularity identifies the elliptic L-series coefficients with the required newform.

Direct dependencies: `EllipticCurveModularity:R29.6/modularity-theorem`, `tauceti:WeierstrassCurve.frobeniusTrace_eq_card_point`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), Appendix II, Proposition 2 and Corollary, pp. 1158–1160.

Acceptance: The full level lcm(4,N) and modulus 4 are required, rather than rad(N) and modulus 2.

Atlas planet: Finite mod-four recognition.

### Small-prime point-count transfer

Declaration `small-trace-transfer`. Under Kraus Theorem 3, assume E has full rational 2-torsion and ℓ>krausG(N). For each prime q∤2N with q≤μ(lcm(4,N))/6, E has good reduction at q, and a_q(E)=a_q(F), hence 4 divides #F(𝔽q).

Proof route. If E were bad at q while F is good, residual conductor comparison gives multiplicative reduction and a_q(F)≡±(q+1) mod ℓ; the nonzero integer difference is bounded by (√q+1)^2≤krausG(N). At good q the two traces differ by a multiple of ℓ and have absolute difference≤4√q≤(√q+1)^2, so they are equal. Good reduction at odd q injects rational 2-torsion; its four points imply the required divisibility.

Direct dependencies: `EllipticCurveModularityPartII:EC.1/krausG`, `EllipticCurveModularityPartII:EC.3/kraus-rational`, `tauceti:WeierstrassCurve.frobeniusTrace_eq_card_point`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `ArithmeticGaloisRepresentations:R01.6`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.3, p. 1146.

Acceptance: Strict ℓ>krausG(N) is necessary for these inequalities; q=ℓ cannot lie in the tested range.

### Two-isogeny repair of rational two-torsion

Declaration `two-isogeny-repair`. If E/ℚ satisfies 4|#E(𝔽q) for all but finitely many good odd q, then E is ℚ-isogenous by degree 1 or 2 to a curve F with full rational 2-torsion. For odd ℓ this isogeny preserves E[ℓ] and the conductor.

Proof route. Chebotarev converts the congruence into constraints on each Galois element’s action on E[4]. Modulo 2 there is no order-3 image, so there is a fixed nonzero 2-torsion point P. If the full 2-torsion is not rational, form E/⟨P⟩. The mod-4 constraints force both remaining 2-torsion directions of this quotient to be rational. Use the dual isogeny to invert the degree-2 map on ℓ-torsion and the isogeny invariance of the ℓ-adic conductor.

Direct dependencies: `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:R01.6`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), §3.3 end, pp. 1146–1147.

Acceptance: Do not conclude E itself has full rational 2-torsion from the point-count condition.

Atlas planet: Two-isogeny repair.

### Kraus’s full-two-torsion realization

Declaration `kraus-full-two`. If E/ℚ has full rational 2-torsion, ℓ≥5 is prime, E[ℓ] is irreducible of Serre weight 2 and prime-to-ℓ conductor N, and ℓ>krausH(N), then some F/ℚ has exact conductor N, full rational 2-torsion, and F[ℓ]≅E[ℓ].

Proof route. Use krausH’s two inequalities. Obtain F₀ from Kraus’s rational comparison theorem. Transfer the tested point counts, propagate them by finite mod-four recognition, and apply two-isogeny repair to F₀. The repair preserves the odd residual representation and exact conductor.

Direct dependencies: `EllipticCurveModularityPartII:EC.1/krausH`, `EllipticCurveModularityPartII:EC.3/kraus-rational`, `EllipticCurveModularityPartII:EC.4/small-trace-transfer`, `EllipticCurveModularityPartII:EC.4/finite-mod-four`, `EllipticCurveModularityPartII:EC.4/two-isogeny-repair`.

Source: [Alain Kraus](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), Theorem 4, p. 1144; §3.3.

Acceptance: Both hypotheses “Serre weight 2” and “exact prime-to-ℓ conductor N” remain explicit.

Atlas planet: Kraus’s two-torsion realization.

### Reduced-level adapter for Kraus’s theorem

Declaration `quotient-conductor-adapter`. In an application with reduced level M₀ from R20.6, Kraus’s full-two-torsion theorem applies at M₀ only after establishing Serre weight 2 and N(E[ℓ])=M₀. In particular, for ℓ≥5 and ℓ∤M, local conductor comparison gives N(E[ℓ])=M₀; weight 2 must still be checked (for example by finite flatness at ℓ).

Proof route. At each q≠ℓ, additive exponents agree and multiplicative exponent 1 drops exactly when ℓ|ordq(Δ). At ℓ∤M there is no coefficient-prime factor left in M₀. Use the supplier’s finite-flat weight recipe where it applies; substitute the proved equality into Kraus’s theorem, without identifying the carriers by definition.

Direct dependencies: `EllipticCurveModularityPartII:EC.4/kraus-full-two`, `SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve`, `ArithmeticGaloisRepresentations:R01.6`, `AlgebraicModularFormsAndSerreWeights:R15.4`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Theorem 4, p. 360; compare Kraus §3.1.

Acceptance: If ℓ divides M and remains in M₀, then M₀ cannot be the prime-to-ℓ conductor.

Layer coverage: planned. Mod-four image argument for the two-isogeny repair Resolve the exact supplier contracts listed in requests.

## EC.5. Uniform two-torsion irreducibility

The two irreducibility thresholds concern all curves with the stated two-torsion, including CM curves. They use rational cyclic isogenies, rather than the classification of rational points on the torsion subgroup. A reducible two-dimensional representation has an invariant line; that line gives a Galois-stable cyclic subgroup of order ℓ, even if none of its nonzero points is rational.

With one rational point of order two, summing the coprime kernels gives a cyclic 2ℓ-isogeny. With full rational two-torsion, the cyclic 4-kernel is constructed on an isogenous curve. Choose distinct nonzero P,Q in E[2](ℚ), put E′=E/⟨P⟩, and compose the dual E′→E with E→E/⟨Q⟩. Its kernel has order four and is cyclic because preimages of Q double to the nonzero dual-kernel point. Transport the ℓ-line through the two-isogeny and sum the coprime kernels. Directly summing E[2] with the ℓ-line would give a noncyclic group and would not prove the result.

The required degree exclusions come from the rational cyclic-isogeny classification. Mazur’s prime theorem alone does not exclude the composite degrees 2ℓ and 4ℓ. Kenku’s composite classification and its arithmetic modular-curve proofs are essential inputs. At ℓ=7, a cyclic 14-isogeny is possible, so the one-point threshold cannot be lowered to seven by the same argument. Full two-torsion permits the stronger exclusion through degree 4ℓ.

Oddness then upgrades irreducibility to absolute irreducibility. Complex conjugation has the distinct eigenvalues 1 and −1 in odd characteristic. The supplier’s two-dimensional representation lemma uses that constraint to exclude an irreducible representation that splits only over a coefficient extension.

### Mazur’s prime-isogeny theorem

Declaration `mazur-prime-isogenies`. If E/ℚ admits a cyclic rational isogeny of prime degree r, then r∈{2,3,5,7,11,13,17,19,37,43,67,163}. For non-CM E the possibilities are {2,3,5,7,11,13,17,37}.

Proof route. Identify the isogeny with a noncuspidal rational point on X₀(r). Follow Mazur’s four-step route: cuspidal formal immersion into the Eisenstein quotient; finiteness of its rational points; potentially good reduction and the isogeny character; Frobenius congruences. The character exponents 0,1/3,1/2 reduce the possibilities by the p=3 and p=5 calculations and the imaginary quadratic class-number-one theorem. Use the complete rational-point lists in Theorem 7.1 to discard the CM-only degrees 19,43,67,163 for non-CM curves. This uses geometric CM, not Endℚ(E).

Direct dependencies: `mathlib:WeierstrassCurve.j`, `ModularCurvesPartII:R12.2`.

Source: [Barry Mazur; appendix by Dorian Goldfeld](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), Theorem 1, pp. 129–130; proof outline pp. 132–133; Theorem 7.1, pp. 153–155.

Acceptance: A CM curve can have a rational 163-isogeny; it is excluded only from the non-CM list.

Atlas planet: Mazur’s prime-isogeny theorem.

### Two-torsion isogeny exclusions

Declaration `two-torsion-isogeny-exclusions`. For every prime ℓ≥11, no elliptic curve over ℚ admits a cyclic rational 2ℓ-isogeny. For every prime ℓ≥7, none admits a cyclic rational 4ℓ-isogeny.

Proof route. Use Mazur’s prime list to reduce the odd prime degrees to a finite set. For ℓ≥11 the forbidden composite degrees 2ℓ follow from the rational cyclic-degree classification; the 4ℓ exclusions for ℓ≥7 follow from the same classification. The required classification is the Mazur–Kenku list n≤19 or n∈{21,25,27,37,43,67,163}. The unresolved source verification is a recorded gap, not attributed to Mazur’s prime theorem.

Direct dependencies: `EllipticCurveModularityPartII:EC.5/mazur-prime-isogenies`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Proofs of Lemmas 3.3 and 3.5, pp. 362–363.

Acceptance: 2·7=14 is allowed; neither threshold can be extended just by dropping its inequality.

Atlas planet: Two-torsion isogeny exclusions.

### Two-torsion kernel transport

Declaration `two-torsion-kernel-transport`. For odd prime ℓ, if E/ℚ has a rational cyclic ℓ-subgroup and a rational point of order 2, it admits a rational cyclic 2ℓ-isogeny. If all E[2] is rational, some curve isogenous to E admits a rational cyclic 4ℓ-isogeny.

Proof route. For one 2-point, take the sum of the coprime stable kernels; it is cyclic of order 2ℓ. For full 2-torsion, choose distinct nonzero P,Q∈E[2](ℚ). On E′=E/⟨P⟩ compose the dual map E′→E with E→E/⟨Q⟩; its kernel is stable cyclic of order 4, since the preimages of Q double to the nonzero dual kernel point. Transport the ℓ-kernel through the 2-isogeny, then sum it with the cyclic 4-kernel.

Direct dependencies: `mathlib:WeierstrassCurve.Affine.Point.map`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Mazur input in Lemmas 3.3 and 3.5, pp. 362–363.

Acceptance: A full rational E[2] is itself noncyclic; directly adding it to an ℓ-kernel does not produce a cyclic 4ℓ-kernel.

### Irreducibility with full rational two-torsion

Declaration `irreducible-full-two`. If E/ℚ has full rational 2-torsion and ℓ≥7 is prime, E[ℓ] is irreducible over 𝔽ℓ; since it is odd, it is absolutely irreducible.

Proof route. A proper nonzero invariant subspace is a line, hence a stable cyclic ℓ-subgroup. Kernel transport gives a rational cyclic 4ℓ-isogeny on an isogenous curve; apply the exclusion theorem. Use oddness and the distinct ±1 eigenvalues of complex conjugation to upgrade irreducibility for odd ℓ.

Direct dependencies: `EllipticCurveModularityPartII:EC.5/two-torsion-kernel-transport`, `EllipticCurveModularityPartII:EC.5/two-torsion-isogeny-exclusions`, `mathlib:Representation.IsIrreducible`, `ArithmeticGaloisRepresentations:R01.6`, `ArithmeticGaloisRepresentations:R01.4`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Lemma 3.3 proof, p. 362.

Acceptance: No non-CM hypothesis is used.

Atlas planet: Full-two-torsion irreducibility.

### Irreducibility with a rational two-torsion point

Declaration `irreducible-one-two`. If E/ℚ has a rational point of order 2 and ℓ≥11 is prime, E[ℓ] is irreducible over 𝔽ℓ and absolutely irreducible.

Proof route. An invariant line gives a cyclic ℓ-subgroup. Combine it with the rational 2-point and exclude the resulting cyclic 2ℓ-isogeny. Upgrade by oddness as for the full-two-torsion case.

Direct dependencies: `EllipticCurveModularityPartII:EC.5/two-torsion-kernel-transport`, `EllipticCurveModularityPartII:EC.5/two-torsion-isogeny-exclusions`, `mathlib:Representation.IsIrreducible`, `ArithmeticGaloisRepresentations:R01.6`, `ArithmeticGaloisRepresentations:R01.4`.

Source: [Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Lemma 3.5 proof, p. 363.

Acceptance: A curve with a 14-isogeny supplies a boundary counterexample at ℓ=7.

Atlas planet: One-two-torsion irreducibility.

Layer coverage: planned. Mazur’s arithmetic prime-isogeny inputs Composite cyclic-isogeny exclusions Resolve the exact supplier contracts listed in requests.

## EC.6. Rational-isogeny uniformity

Lemos’s result concerns non-CM curves admitting a nontrivial rational cyclic isogeny. It does not establish surjectivity for all elliptic curves over ℚ. The argument reduces a hypothetical large proper image to a nonsplit Cartan normalizer, proves integrality of the j-invariant in the small-isogeny cases, and checks the resulting finite collections of rational j-values with complete arithmetic certificates.

There are two different arithmetic reductions. For prime isogeny degrees 11, 17 and 37, the rational j-values already form explicit finite sets. For degrees 2, 3, 5, 7 and 13, a nonsplit-normalizer image leads to a rational point on a mixed modular curve. The rank-zero quotient and formal immersion rule out cusp specialization at denominator primes away from p, giving j∈ℤ[1/p]. The local Tate-curve argument rules out the remaining denominator at p, so j is integral. The genus-zero j-map then gives finite divisor sets.

The local argument squares image elements to enter the nonsplit Cartan. If the curve were potentially multiplicative, the two Tate eigencharacters would become equal after squaring, forcing the cyclotomic character squared to be trivial. At q≠p this imposes q²≡1 mod p. At q=p the local cyclotomic character is surjective, contradicting p≥5. This last case is needed to pass from prime-integrality to integrality.

The global argument is not a finite-group classification alone. Excluding a Borel image uses the prime-isogeny theorem; excluding split Cartan and exceptional arithmetic images requires the Bilu–Parent–Rebolledo and Serre inputs. The mixed-curve correspondence requires Chen’s isogeny and the correct p-new quotient. The winding quotient needs nonvanishing and rank zero, not just a definition of the winding ideal. Lemos’s §3 provides a sketch with references to Darmon–Merel for these facts and for the precise local specialization argument. Those references remain explicit source obligations.

For j=f_r(t)/t with f_r monic and t=a/b in lowest terms, integrality forces b=1 and then a divides f_r(0). Both signs of every nonzero divisor are retained. These exact polynomial steps must be combined with certificates identifying f_r with the intrinsic modular j-map. The higher-level sets contain seven displayed j-values in total, one of which, −2¹⁵, is CM. The six non-CM values and the five genus-zero integral sets require complete exceptional-prime certificates. A database check at selected primes cannot prove surjectivity for every p>37. Quadratic-twist invariance transports the certificate from one representative to every curve with the same non-CM j.


### Potential good reduction in the nonsplit Cartan case

Declaration `nonsplit-potential-good`. If p≥5 is prime and ρ̄E,p(Gℚ) is contained in the normalizer of a nonsplit Cartan, then E has potentially good reduction at each rational prime q with q≢±1 mod p, and also at q=p.

Proof route. If potentially multiplicative, write the local representation as a quadratic twist of a Tate-curve representation with eigencharacters ψχp,ψ. Squaring sends each image element into the nonsplit Cartan; a split pair of eigenvalues there must coincide, forcing χp²=1. At q=p the cyclotomic character is surjective, contradicting p≥5. At q≠p its unramified Frobenius value q forces q²≡1 mod p.

Direct dependencies: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.6`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Proposition 2.2, pp. 4–5.

Acceptance: At q=p the congruence exception cannot excuse potentially multiplicative reduction.

Atlas planet: Nonsplit Cartan reduction criterion.

### Chen’s isogeny at rational-isogeny level

Declaration `chen-correspondence`. For r∈{1,2,3,5,7,13} and prime p∉{1,2,3,5,7,13}, the Jacobian of X₀(r)×X(1)Xns⁺(p) is ℚ-isogenous to the p-new quotient of Jac(X₀⁺(rp²)), by a correspondence commuting with T_n for gcd(n,p)=1.

Proof route. Construct X′(p)=X(p)/(Nsp∩Nns) and the split/nonsplit projection correspondence. Under Xsp⁺(p)≅X₀⁺(p²), the p-old divisors map to old divisors; the target’s r-level old Jacobian vanishes since X₀(r) has genus zero. Apply Chen’s explicit-isogeny identification, retaining the away-from-p Hecke equivariance.

Direct dependencies: `ModularCurvesPartII:R14.2`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), §3, Theorem 3.3 and Lemma 3.2, pp. 8–9.

Acceptance: p-old means degeneracy from level rp, not the full oldspace at level rp².

Atlas planet: Chen’s isogeny.

### Rank-zero winding quotient

Declaration `rank-zero-quotient`. For r∈{2,3,5,7,13} and prime p outside that set, J₀,ns⁺(r,p) has a nonzero optimal ℚ-quotient A with A(ℚ) finite and kernel stable under every T_n with gcd(n,p)=1.

Proof route. Transfer the problem through Chen’s isogeny to the p-new quotient of Jac(X₀⁺(rp²)). Project the rational winding element e to the full new quotient, form its Hecke annihilator Ie, and pass to the connected-kernel quotient. Prove this quotient is nonzero and has finite rational points by Darmon–Merel’s winding argument; Lemos §3 explicitly refers these two claims to that paper.

Direct dependencies: `EllipticCurveModularityPartII:EC.6/chen-correspondence`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Theorem 3.4 and sketch, p. 10.

Acceptance: Nonzero quotient and finite A(ℚ) are theorem conclusions, not fields in a certificate structure.

Atlas planet: Rank-zero winding quotient.

### Cuspidal formal immersion at isogeny level

Declaration `cuspidal-formal-immersion`. For r∈{2,3,5,7,13}, p outside that set and a prime q≠p with q≡±1 mod p, the Abel–Jacobi map to the rank-zero quotient A on X₀,ns⁺(r,p), after choosing a cusp and its local integral model, is a formal immersion at that cusp in characteristic q; a rational section specializing there has torsion image in A.

Proof route. Compute the first q-expansion coefficient of differentials pulled back from the quotient; the Hecke-stable kernel detects the cotangent direction. Control specialization of torsion, including residue characteristic 2, using the precise Darmon–Merel local hypotheses. Use Darmon–Merel Lemma 8.3 for the torsion image. The local statement and characteristic-2 treatment are explicit source gaps until their proof is read.

Direct dependencies: `EllipticCurveModularityPartII:EC.6/rank-zero-quotient`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), §3 final paragraph, p. 10.

Acceptance: A torsion image by itself does not force section equality; the local specialization lemma is essential.

Atlas planet: Cuspidal formal immersion.

### Prime-integrality of the isogeny j-invariant

Declaration `j-prime-integrality`. For r∈Σ={2,3,5,7,13}, prime p∉Σ, and E/ℚ admitting a cyclic rational r-isogeny with mod-p image in a nonsplit Cartan normalizer, j(E)∈ℤ[1/p].

Proof route. The curve supplies a rational point on X₀,ns⁺(r,p). A denominator prime q≠p forces specialization at a cusp. Cusps are defined over ℚ(ζp)⁺, so a rational section can meet them only when q≡±1 mod p. Combine the finite quotient, torsion-image comparison and formal immersion with the verified local specialization input to rule out that specialization.

Direct dependencies: `EllipticCurveModularityPartII:EC.6/rank-zero-quotient`, `EllipticCurveModularityPartII:EC.6/cuspidal-formal-immersion`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Theorem 1.4, p. 3; proof sketch §3.

Acceptance: Theorem 1.4 gives ℤ[1/p]; removing the possible denominator p is a separate local argument.

### Integrality of the isogeny j-invariant

Declaration `j-integrality`. For r∈{2,3,5,7,13}, prime p∉{2,3,5,7,13}, and non-CM E/ℚ with an r-isogeny and mod-p image in a nonsplit Cartan normalizer, j(E) is an integer.

Proof route. Apply prime-integrality. Apply the nonsplit potential-good-reduction criterion at p≥5 and the j-integrality criterion locally at p. These eliminate the only remaining denominator.

Direct dependencies: `EllipticCurveModularityPartII:EC.6/j-prime-integrality`, `EllipticCurveModularityPartII:EC.6/nonsplit-potential-good`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Proposition 2.1, pp. 4–5.

Acceptance: CM exclusion can be retained to match Proposition 2.1; no global uniformity conjecture is needed.

### Integral j-values at genus-zero isogeny levels

Declaration `integral-isogeny-j-values`. For r∈{2,3,5,7,13}, choose t on X₀(r) so j=f_r(t)/t, where f₂=(t+16)^3, f₃=(t+27)(t+3)^3, f₅=(t²+10t+5)^3, f₇=(t²+5t+1)^3(t²+13t+49), f₁₃=(t⁴+7t³+20t²+19t+1)^3(t²+5t+13). Every noncuspidal rational point with integral j has nonzero integral t dividing f_r(0).

Proof route. Import the verified modular-curve models and j-map identity, rather than treat a rational function as a modular curve by definition. Write t=a/b in lowest terms with b>0. Since f_r is monic, integrality forces b|a^(r+1), whence b=1; then integrality forces a|f_r(0). Enumerate both signs of every nonzero divisor of the constant term and deduplicate j-values.

Direct dependencies: `mathlib:WeierstrassCurve.j`, `ComputationalNumberTheory:CN.3`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), §2 table and divisibility proof, pp. 6–7.

Acceptance: r=2 has constant term 4096; testing only positive divisors misses negative integral j-values.

Atlas planet: Integral isogeny j-values.

### Large proper images are nonsplit Cartan images

Declaration `large-proper-image`. For non-CM E/ℚ and prime p>37, if ρ̄E,p is not surjective onto GL₂(𝔽p), its image is contained in a nonsplit Cartan normalizer.

Proof route. Import the finite-subgroup classification and determinant surjectivity. Mazur excludes Borel images above 37; Serre’s exceptional-image argument excludes the exceptional groups. The Bilu–Parent–Rebolledo theorem excludes split Cartan normalizers in this range. Its source proof is a recorded gap; finite-subgroup classification alone does not exclude these arithmetic images.

Direct dependencies: `EllipticCurveModularityPartII:EC.5/mazur-prime-isogenies`, `ArithmeticGaloisRepresentations:R01.4`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Theorem 2.3, p. 6.

Acceptance: The general non-CM statement is about the type of a proper image, not about its impossibility.

### Surjectivity under quadratic twisting

Declaration `surjectivity-twist`. For odd prime p and non-CM E/ℚ, quadratic twisting preserves surjectivity of the mod-p representation. Thus for a fixed non-CM rational j, surjectivity at p can be tested on one representative curve.

Proof route. Curves with the same non-CM j are quadratic twists. Their residual representations differ by the central quadratic character. If the original image is GL₂(𝔽p), restriction to the character kernel contains SL₂, and the twisted image still has full determinant. Exclude the possible index-two graph by the determinant character; it cannot twist a scalar −I to the identity. Apply the argument in both directions.

Direct dependencies: `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `ArithmeticGaloisRepresentations:R01.4`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Proof of Theorem 1.1, pp. 5–6.

Acceptance: The conclusion retains non-CM and odd p; arbitrary sextic/quartic twists at j=0,1728 are not included.

### Finite rational-j Galois-image certificates

Declaration `finite-image-certificates`. For every non-CM j in the integral sets S₂∪S₃∪S₅∪S₇∪S₁₃ from the divisor enumeration, and every non-CM j in S₁₁={−11·131³,−2¹⁵,−11²}, S₁₇={−17²·101³/2,−17·373³/2¹⁷}, S₃₇={−7·137³·2083³,−7·11³}, an explicit curve with that j has surjective mod-p representation for every prime p>37.

Proof route. Certify the seven higher-level rational j-values and the five integral-j lists from intrinsic modular-curve models. Select Weierstrass representatives, prove non-CM for the retained entries, and pin complete finite exceptional-prime/image certificates using Sutherland’s algorithm or a proved equivalent arithmetic recognition method. Verify all primes outside the certified exceptional set, rather than sample primes. The source uses LMFDB computations without shipping these proof certificates; their absence is recorded as a gap.

Direct dependencies: `EllipticCurveModularityPartII:EC.6/integral-isogeny-j-values`, `EllipticCurveModularityPartII:EC.6/surjectivity-twist`, `ComputationalNumberTheory:CN.3`, `ComputationalNumberTheory:CN.5`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Proof of Theorem 1.1, pp. 5–7.

Acceptance: j=−2¹⁵ is CM and removed; the six other higher-level values remain. An LMFDB label alone does not discharge the theorem.

### Lemos’s rational-isogeny uniformity theorem

Declaration `lemos-surjectivity`. If E/ℚ is non-CM, meaning Endℚ̄(E)=ℤ, and admits a nontrivial cyclic rational isogeny, then ρ̄E,p(Gℚ)=GL₂(𝔽p) for every prime p>37.

Proof route. Choose a prime divisor r of the isogeny degree. Mazur restricts r to {2,3,5,7,11,13,17,37}. For r=11,17,37, use the finite rational-j certificates and quadratic-twist invariance. For r=2,3,5,7,13, a hypothetical proper mod-p image is nonsplit by the large-image theorem; j-integrality reduces to the finite divisor lists, whose certificates and twist invariance contradict the proper image.

Direct dependencies: `tauceti:TauCeti.Isogeny.Hom`, `EllipticCurveModularityPartII:EC.5/mazur-prime-isogenies`, `EllipticCurveModularityPartII:EC.6/large-proper-image`, `EllipticCurveModularityPartII:EC.6/j-integrality`, `EllipticCurveModularityPartII:EC.6/finite-image-certificates`, `EllipticCurveModularityPartII:EC.6/surjectivity-twist`.

Source: [Pedro Lemos](https://arxiv.org/pdf/1702.01985v2), Theorem 1.1, p. 2; proof §2.

Acceptance: p=37 is outside the conclusion; without the rational-isogeny hypothesis this is not the general Serre uniformity theorem.

Atlas planet: Lemos’s uniformity theorem.

Layer coverage: planned. Cartan-level compactifications and Chen’s isogeny proof Darmon–Merel winding and formal-immersion inputs Arithmetic exclusions of split and exceptional Cartan images Complete finite image certificates Resolve the exact supplier contracts listed in requests.

## Supplier contracts

Every existing blueprint node below is consumed at its stated scope. When a matching statement is absent, the packet records the exact requested supplier stage and the consuming nodes. The contracts concern general objects and comparisons owned by those suppliers; the special effective arithmetic conclusions remain in EC.1–EC.6.

The exact imported nodes are the parent modularity theorem, R20.6’s reduced level, residual newform and trace congruence, and R19.6’s residual representation of a newform. The reduced-level theorem supplies a weight-two form at M₀; it does not identify M₀ with the prime-to-ℓ conductor by definition. R19.6 supplies a residual representation after lattice reduction and semisimplification over its actual residue field. The comparison to an elliptic 𝔽ℓ-representation must respect coefficient extension.

### `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`

General Γ₀ dimension formula, μ index/product formula, and the elliptic/cusp correction counts.

Consumers: `martin-bound`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`

Old/new decomposition in each fixed character; compatibility of Γ₀ newspace with the trivial-character intersection inside Γ₁.

Consumers: `martin-bound`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

Finite coefficient field of a normalized newform; embeddings inject into its normalized newform orbit, so degree≤dimension. All Fourier coefficients are algebraic integers in the full coefficient field. Coefficient-field degree bounded by dimension of the trivial-character newspace.

Consumers: `removed-prime-bound`, `finite-rationality`, `small-prime-integrality`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`

Conjugate newforms of trivial character stay in the same newspace. Conjugate newforms and rationality from invariance under all embeddings.

Consumers: `removed-prime-bound`, `finite-rationality`.

### `AutomorphicGaloisRepresentations:R19.3`

Weight-two good-prime purity bound |σ(c_p)|≤2√p for every embedding at p∤M₀. All-embeddings purity bounds for f at q∤N.

Consumers: `removed-prime-bound`, `small-prime-integrality`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

Full prime-power coefficient recurrences and bad-prime coefficient values for weight-two trivial-character newforms. Hecke recurrences and depletion operators at bad primes, including the Γ₀(4) weight-two Eisenstein series used in Kraus Appendix II.

Consumers: `finite-rationality`, `finite-mod-four`.

### `ComputationalNumberTheory:CN.3`

Intrinsic q-expansion recognition using the finite-index Sturm bound, with prime-to-all-coefficient Hecke reconstruction. Exact model and j-map certificates for X₀(2),X₀(3),X₀(5),X₀(7),X₀(13); finite divisor enumeration linked to the intrinsic moduli curves. Exact rational-point and j-map certificates at levels 11,17,37, plus verified Galois-image recognition for each explicit elliptic curve.

Consumers: `finite-rationality`, `integral-isogeny-j-values`, `finite-image-certificates`.

### `SerreWeightAndLevelOptimisation:R20.4`

For weight 2 residual elliptic representations in characteristic≥5: a normalized trivial-character newform at the exact prime-to-ℓ conductor, with a place above ℓ.

Consumers: `small-prime-integrality`.

### `ArithmeticGaloisRepresentations:R01.6`

At q≠ℓ, conductor exponents cannot drop from additive elliptic reduction for ℓ≥5; good and removed-multiplicative trace congruences at the exact residual conductor. Exact-conductor removed-multiplicative trace formula and conductor invariance under prime-to-ℓ isogeny. Conductor invariant under rational isogeny. Local residual conductor exponents for ℓ≥5: multiplicative removal criterion and equality at additive primes. Invariant lines in E[ℓ] are exactly Galois-stable cyclic ℓ-subgroups; residual oddness from the Weil pairing. Tate-curve residual matrices and local cyclotomic character, including q=p.

Consumers: `small-prime-integrality`, `small-trace-transfer`, `two-isogeny-repair`, `quotient-conductor-adapter`, `irreducible-full-two`, `irreducible-one-two`, `nonsplit-potential-good`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Hasse bound at every good reduction of E. Hasse bound for both good-reduction curves.

Consumers: `small-prime-integrality`, `small-trace-transfer`.

### `ModularCurvesPartII:R14.5`

Dimension-one quotient of J₀(N) for rational weight-two primitive f; the quotient is an elliptic curve.

Consumers: `rational-newform-curve`.

### `AutomorphicGaloisRepresentations:R19.4`

Exact conductor of the quotient, including bad primes and monodromy.

Consumers: `rational-newform-curve`.

### `ArithmeticGaloisRepresentations:R01.5`

Recognition of semisimple residual representations by characteristic polynomials over a common residue field; descent to ℚ’s ℓ-torsion coefficient field. Chebotarev recognition of the determinant condition det(1−Frob)≡0 mod 4.

Consumers: `rational-newform-curve`, `two-isogeny-repair`.

### `AlgebraicModularFormsAndSerreWeights:R15.2`

Ideal-valued Sturm congruence bound at general finite index for integral q-expansions, including characteristic 2 and ideals (2)^2.

Consumers: `finite-mod-four`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Prime-to-residue-characteristic torsion reduction is injective at good reduction. Local potentially multiplicative curves as quadratic twists of Tate curves and the j-integrality criterion.

Consumers: `small-trace-transfer`, `nonsplit-potential-good`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`

Quotient by a rational point of order two, dual isogeny, and inverse on odd torsion. Quotient by a finite Galois-stable subgroup, dual 2-isogeny and kernel-composition properties.

Consumers: `two-isogeny-repair`, `two-torsion-kernel-transport`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

Compatible Galois actions on E[2] and E[4]. Actual pointwise torsion and its Galois action; coprime torsion decompositions.

Consumers: `two-isogeny-repair`, `two-torsion-kernel-transport`.

### `AlgebraicModularFormsAndSerreWeights:R15.4`

Finite-flat weight-two consequence for elliptic residual representations, retaining the coefficient-prime local hypotheses.

Consumers: `quotient-conductor-adapter`.

### `ModularCurvesPartII:R12.2`

Rational noncuspidal points of Y₀(r) classify Galois-stable cyclic r-subgroups up to the appropriate twists.

Consumers: `mazur-prime-isogenies`.

### `ArithmeticGaloisRepresentations:R01.4`

An odd irreducible two-dimensional representation over 𝔽ℓ for odd ℓ is absolutely irreducible. Normalizer quotient of order two and eigenvalue test for elements of a nonsplit Cartan. Classification of proper GL₂(𝔽p) images with surjective determinant and the elliptic exceptional-image exclusions. Index-two subgroups and abelianization of GL₂(𝔽p), including determinant and central scalar −I.

Consumers: `irreducible-full-two`, `irreducible-one-two`, `nonsplit-potential-good`, `large-proper-image`, `surjectivity-twist`.

### `ModularCurvesPartII:R14.2`

Jacobians, Picard pushforward/pullback and Hecke action for the compactified curves once their Cartan-level construction is supplied.

Consumers: `chen-correspondence`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`

Quadratic-twist classification for non-CM rational j and the Galois point-action comparison.

Consumers: `surjectivity-twist`.

### `ComputationalNumberTheory:CN.5`

Pinned input data and machine-checkable certificate format for the complete exceptional-prime lists; no database assertions as axioms.

Consumers: `finite-image-certificates`.

## Source and closure obligations

All six layers are planned at target level. Their dependency chains end at the pinned declarations, supplied blueprint nodes, precise supplier-stage requests, or the gaps below. No layer is closed, and no theorem is claimed to be implemented. The distinction is mathematical: the target statements and proof routes are specified, while the following identified inputs still need verification or source decomposition.

### Norm comparison and residue characteristic divisibility

Confirm the precise integer-ring/field norm comparison and ℓ|Norm(λ) for λ above ℓ from pinned NumberField ideal norms; the three cited baseline lemmas alone do not establish this adapter.

Consumers: `norm-bound`.

### Mod-four image argument for the two-isogeny repair

Kraus cites Serre [25], IV-6. Enumerate the subgroups of GL₂(ℤ/4) whose elements satisfy det(1−g)=0 mod 4, and prove a stable quotient with trivial mod-2 action; read the cited argument before proof execution. The source paragraph alone is not a supplied subgroup proof.

Consumers: `two-isogeny-repair`.

### Mazur’s arithmetic prime-isogeny inputs

Read and decompose the formal immersion and finite Eisenstein quotient inputs in Mazur §§1,4–6, the isogeny-character analysis, the complete small-level rational-point lists, and the class-number-one theorem. Only the introduction and §7 proof have been read in this pass; no generic ModularCurves supplier is claimed to contain these arithmetic theorems.

Consumers: `mazur-prime-isogenies`.

### Composite cyclic-isogeny exclusions

Obtain and read Kenku’s classification proof and its predecessor modular-curve papers. The publisher of Kenku 1982 returned 403. Needed here are the finite forbidden 2ℓ and 4ℓ degrees after Mazur’s prime restriction; do not use the prime theorem or rational torsion classification as a replacement.

Consumers: `two-torsion-isogeny-exclusions`.

### Cartan-level compactifications and Chen’s isogeny proof

The existing Γ₀/Γ₁ compactification scope does not supply Xns⁺(p) and the mixed fiber products. Assign their common compactified Cartan-level owner, and read Chen 1998/2000 and Darmon–Merel §6 for the explicit correspondence/isogeny. The imaginary-quadratic split proposes mixed level 3 and 5 models, so a shared general extension should supply both families.

Consumers: `chen-correspondence`.

### Darmon–Merel winding and formal-immersion inputs

Read Darmon–Merel Propositions 7.1 and Theorem 8.1, Lemma 8.3 and the local specialization hypotheses, including residue characteristic 2, for r=2,3,5,7,13. Lemos supplies a sketch and refers the nonvanishing/rank-zero and local details to that paper. These are owned special arithmetic targets here, not established by the sketch.

Consumers: `rank-zero-quotient`, `cuspidal-formal-immersion`, `j-prime-integrality`.

### Arithmetic exclusions of split and exceptional Cartan images

Read Bilu–Parent–Rebolledo Ann. Inst. Fourier 63 (2013), 957–984 and Serre’s exceptional-image local argument; verify p>37 and non-CM hypotheses. R01.4 supplies group classification, not the rational-point exclusion theorem.

Consumers: `large-proper-image`.

### Complete finite image certificates

Lemos checks LMFDB/Sutherland output but no certificate data was fetched or verified here. Reconstruct every representative in the five integral lists and six non-CM higher-level values, prove the modular j-map and high-level rational-point lists, and attach complete exceptional-prime certificates valid for all primes, with software/data versions. Reading the published Lemos version and checking it against v2 is also required before executing this route.

Consumers: `finite-image-certificates`.

The formal-immersion target follows Lemos’s stated proof sketch. Its integral model, cusp field, and local hypotheses require the indicated Darmon–Merel verification before a faithful geometric signature can be fixed. The absence of that verification is a source obligation, rather than an assertion that Lemos’s theorem is false. Likewise the mod-four repair theorem is a stated Kraus consequence whose cited subgroup argument must be read. No error in a published source is established by this planning pass. The complete hypotheses of Kraus’s published Theorems 3–4 are retained when interpreting the abbreviated invocation in Bennett–Siksek.

The general coefficient-field, newspace, finite-flat, local Tate, and modular-curve theories are never reconstructed here. Closing a layer requires discharging its supplier contracts as well as its own source obligations. In particular a characteristic-zero Sturm proof does not close EC.4, a finite-group classification does not close EC.6, and a finite list of primes tested numerically does not close its certificate theorem.

## The independent continuations

Four paper routes share the parent modularity roadmap but have different theorem endpoints. The effective comparison route covers all seven Bennett–Siksek items. The other three routes receive separate proposed continuations with their complete routed-item inventories recorded in the packet. Their mathematical scopes are definite:

- `EllipticCurveModularityImaginaryQuadratic` owns all 27 Caraiani–Newton items: CM-field switching and lifting, Theorem 6.1; density, Corollary 6.1.2; quadratic-field residual images, Theorem 7.1; explicit modular-curve models, exceptional rational points and their modularity, culminating in Corollary 7.1.2.
- `EllipticCurveModularityPartIIGL2TypeAbelianVarieties` owns all three Khare–Wintenberger items: modular abelian varieties, two-dimensional compatible systems and the Ribet comparison, and modularity with its exact conductor. Its dimension-one specialization is consistent with the parent. The Q-curve argument of the imaginary-quadratic continuation consumes this general result.
- `EllipticCurveModularityWild3Adic` owns all 62 BCDT items: wild types and admittance, tangent-space bounds, explicit local fields, Breuil modules and descent computations, and the global switching/lifting route. Its endpoint is an independent proof of rational elliptic modularity. It does not replace the parent’s strong-Serre proof or introduce a dependence of that proof on its historical predecessor.

Shared finite-group theory stays with ArithmeticGaloisRepresentations R01.4; local Tate/finite-flat theory stays with the elliptic and local arithmetic suppliers. Compactified Cartan-level moduli and the mixed fiber products have one general owner serving EC.6 and the imaginary-quadratic branch. This arrangement prevents the special explicit level-3 and level-5 models in that branch from becoming duplicate definitions of the general curves required by Lemos.

## Sources and versions

The source passages below delimit what was read. They supply the locators for every node; the outstanding proofs are identified above. A public preprint and the published version are recorded as different texts. The Martin and Lemos proof routes are based on the stated preprint versions, with published-version collation retained as a source obligation for Lemos’s certificate route.

- [Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392; published PDF. Read 2026-10-07: §2, pp. 358–360; §3, pp. 361–364; §6, p. 373; references.

- [Alain Kraus, *Majorations effectives pour l’équation de Fermat généralisée*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf). Canadian Journal of Mathematics 49 (1997), 1139–1161; published PDF. Read 2026-10-07: §1 notation; §3.1–3.3, pp. 1142–1146; Appendix I dimension formula; Appendix II, pp. 1158–1160.

- [Greg Martin, *Dimensions of the spaces of cusp forms and newforms on Γ₀(N) and Γ₁(N)*](https://arxiv.org/pdf/math/0306128). arXiv math/0306128v1, 6 June 2003; published J. Number Theory 112 (2005), 298–331; preprint read. Read 2026-10-07: Theorems 1–2 and definitions 1A–1F; §5, Lemmas 16–22 and proof of Theorem 2, pp. 14–16.

- [Barry Mazur; appendix by Dorian Goldfeld, *Rational isogenies of prime degree*](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf). Inventiones mathematicae 44 (1978), 129–162; published scan. Read 2026-10-07: Introduction, pp. 129–133; §7, pp. 153–155; proof inputs located in §§1,4–6.

- [Pedro Lemos, *Serre’s uniformity conjecture for elliptic curves with rational cyclic isogenies*](https://arxiv.org/pdf/1702.01985v2). arXiv:1702.01985v2, 8 March 2017; published Trans. AMS 371 (2019), 137–146, DOI 10.1090/tran/7198; preprint read. Read 2026-10-07: Entire v2, pp. 1–11: Theorems 1.1–1.4; §2; §3; references.

Kenku’s composite-degree proof, Chen’s correspondence proofs, Darmon–Merel’s winding and local arguments, Bilu–Parent–Rebolledo’s split-Cartan exclusions, and the complete Galois-image certificate data are source inputs still to obtain. Their absence is recorded with the affected nodes, and none is treated as a proved supplier theorem.
