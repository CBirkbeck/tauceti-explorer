# Dirichlet p-adic L-functions — L4: Eisenstein families

This layer constructs arithmetic Eisenstein coefficient families on the actual p-adic unit group and compares their specializations with classical modular forms through common algebraic q-expansions. The planning pass is complete: L4 is planned, with explicit gaps and supplier requests, and every implementation status remains unchecked. Planning status does not assert a gap-free proof or a compiled library.

## Objects and conventions

For each prime p, including 2, use U=(ℤ_p)ˣ and the native integral measure carrier with the supplied multiplicative convolution. Positive coefficient n is the sum of Dirac masses at the positive divisors d of n prime to p. A classical weight w uses the test x^(w−1). The finite-character factors keep their order: the left character is evaluated at n/d and the right at d. Characters retain their stated levels and zero extensions; a primitive inducing character is used only after restoring the exact Euler factors.

The arithmetic level-one normalization has constant ζ(1−w)/2=−B_w/(2w). For even w≥4, native level raising constructs E_w−p^(w−1)E_w(pz). The coefficient comparisons pass through a rational or specified character field and its separate embeddings into ℂ and a p-adic coefficient field. They never transport arbitrary complex values by an isomorphism to a p-adic field.

The constant A₀ is an element of the actual total quotient of the integral measure algebra, represented by a numerator divided by the doubled shifted denominator 2(aδ_a−1). It is the half of the coordinate twist of the arithmetic zeta pseudomeasure when the requested twist ring equivalence is supplied. It need not be an ordinary pseudomeasure for the factors δ_a−1. Evaluation uses a particular admissible localization; the inverse-coordinate character obstructs extending it to every fraction. At p=2, the factor 2 stays in the denominator and is not inverted inside the integer ring.

## The corrected obstruction

The unit tests j_e(u)=u^e satisfy a uniform norm estimate
‖j_(k+(p−1)pⁿ)−j_k‖≤p^(−n−1). Reduce each actual unit modulo p^(n+1), use the finite-unit totient exponent, then convert the reduction kernel into the p-adic norm bound. Compactness supplies the continuous-test supremum norm. This proof includes p=2 and uses no odd-order idempotents.

Consequently these tests converge to j_k in the continuous-test norm. An actual bounded ℚ_p-valued measure with moments p^e would, at k=0, send them to a sequence tending to 1. The same alleged values tend to 0 since their exponents tend to infinity and ‖p‖<1. This supplies the motivating obstruction for deleting p-divisible divisors. The fixed residue class of exponents is essential.

## Principal tame Euler deletion

The principal tame case uses the localized zeta family, rather than the modulus-one tame constructor whose constant is zero. For D>0 prime to p, let P be its distinct prime divisors. For each subset T let d_T be their product and u_T its actual unit in ℤ_p. Define

E_(a,D)=Σ_(T⊆P)(−1)^|T| C(i_a(δ_(u_T))) expand_(d_T)(E_a).

This is a finite expression in the native localization and formal-series carrier. Its positive coefficients retain exactly the divisors prime to pD. Its constant is A₀,a multiplied by ∏_(ℓ∈P)(1−i_a(δ_(u(ℓ)))). Repeated prime factors of D have no effect. The first coefficient is 1, and D=1 returns the entire original family, including the localized constant.

At arithmetic exponent e the constant becomes
−(1−p^e)B_(e+1)/(2(e+1))·∏_(ℓ∈P)(1−ℓ^e).
For p=2,D=3,e=3 this is 91/120, whereas the original D=1 constant is −7/240. Native level raising of the existing p-stabilized modular form constructs the corresponding classical finite sum at level Γ₀(pD). Coefficient maps commute with each expansion, giving a unique common rational series.

The integral congruence retains the clearing factors Δ_e=2(a^(e+1)−1). When e and e′ agree modulo p^(r−1)(p−1), every coefficient of Δ_e′F_(e′,D)−Δ_eF_(e,D) has norm at most p^(−r). The finite Euler operators preserve that precision because their divisor weights are units. This is not an integral congruence for the uncleared constants.

## Nonprincipal characters and classical ownership

The inherited nonprincipal-right family includes its actual tame constant measure, with a doubled integral normalization and an explicit scalar-integrality criterion. At p=2 a normalized half exists only under the recorded conditions. The new primitive nontrivial-left comparison has zero constant and therefore uses the entire existing integral positive-series measure, without halving.

The existing ModularForms Layer 0 owns classical primitive character Eisenstein forms, their Bernoulli quantities and Fourier/Gauss translation. The new request states the positive coefficient formula, the two constant cases, primitive levels, parity and weight w≥3. It includes no inference that a product character is primitive. Weight 1 and the weight 2 trivial-pair correction keep the owner’s separate contracts. Geometric affinoid realization and Hida–Coleman control belong to PadicFamilies.

## Target coverage and open boundaries

### Actual level-one q-expansion and p-stabilization, even w≥4

Existing native classical carriers and rational/complex/p-adic coefficient comparisons.

Declarations: DirichletPadicLFunctions:L4/normalized-eisenstein, DirichletPadicLFunctions:L4/p-stabilized-eisenstein, DirichletPadicLFunctions:L4/p-stabilized-q-expansion, DirichletPadicLFunctions:L4/full-eisenstein-common-series.

### Positive coefficient measures and impossibility of interpolating p^e

The new contradiction uses uniform unit-power convergence in a fixed component, including p=2.

Declarations: DirichletPadicLFunctions:L4/positive-eisenstein-measure, DirichletPadicLFunctions:L4/prime-power-moments-impossible.

### Corrected localized A0 and whole-series specialization

Retain doubled shifted denominators and the precise generic twist request; no evaluation on every fraction.

Declarations: DirichletPadicLFunctions:L4/localized-eisenstein-constant, DirichletPadicLFunctions:L4/localized-eisenstein-twist-comparison, DirichletPadicLFunctions:L4/full-eisenstein-common-series, DirichletPadicLFunctions:L4/eisenstein-not-ordinary-pseudomeasure.

### Tame-character families and common classical coefficients

Canonical primitive-pair classical input is requested; finite-character principal comparison, conductor synthesis and exceptional weights have explicit gaps.

Declarations: DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series, DirichletPadicLFunctions:L4/tame-actual-classical-full-comparison, DirichletPadicLFunctions:L4/principal-tame-eisenstein-series, DirichletPadicLFunctions:L4/principal-tame-classical-comparison, DirichletPadicLFunctions:L4/nontrivial-left-full-family.

### Integral q-expansion congruences and dyadic normalization

Keep clearing factors and exact integral-half criteria. No division by2 in the dyadic integer ring is presumed.

Declarations: DirichletPadicLFunctions:L4/full-cleared-eisenstein-weight-congruence, DirichletPadicLFunctions:L4/principal-tame-cleared-congruence, DirichletPadicLFunctions:L4/integral-twisted-positive-series-weight-congruence, DirichletPadicLFunctions:L4/integral-doubled-tame-weight-congruence, DirichletPadicLFunctions:L4/all-prime-tame-half-classification.

### Roadmap-wide acceptance and geometric realization boundaries

RJW §§2–8 acceptance includes L0–L3; Theorem6.7 belongs to ColemanIntegration. PadicFamilies owns full affinoid/Hida–Coleman geometry. This L4 planning status certifies none of those independent targets.

## Remaining work

1. Discharge the two inherited PMIA requests: the actual completed-algebra comparison with joint finite quotient projections, and the character-twist ring equivalence on the convolution algebra. The completed-coordinate comparison stays an explicit unstatable signature comment until its owner supplies the native carrier and maps.

2. Obtain the actual primitive-pair classical forms and precise generalized-Bernoulli/Fourier coefficient translation from the existing ModularForms Layer0 request. The nontrivial-left comparison imports that construction; the inherited nonprincipal-right comparison still takes an actual supplied classical form. Primitive levels, parity and w≥3 are mandatory. Product primitivity and arbitrary imprimitive existence are not inferred.

3. Complete the finite-character specialization of the principal tame localized constant, using the actual coefficient-field character ring homomorphism and an admissible shifted denominator. L2 provides a primitive p-power smoothing formula only with its actual root, nonzero Gauss sum and coefficient-field hypotheses; its general evaluator is itself conditional. Reconcile imprimitive zero extensions at the given modulus with the primitive inducing character and every removed Euler factor. The new principal construction and ordinary-weight specialization do not discharge this finite-character comparison.

4. Extend the full two-character comparison along the exact native conductor-change and level-raising maps, retaining the zero constant for nontrivial primitive left character and the actual nonprincipal-right constant for trivial left character. The ordinary principal tame family is now specified by finite Euler deletion of the localized zeta family. Weight1 and the weight2 trivial-pair correction require the classical owner’s separate hypotheses; they are not ordinary-weight applications.

5. Check the whole split suggested module after the L1/L2 prototype imports and exact pinned Tau dependency closure are available. The new Mathlib-only obstruction file has an admitted signature-check receipt; this is neither a proof certificate nor a compilation of the full file. The entire roadmap’s RJW §§2–8 acceptance also requires the separately owned L0–L3 work; geometric affinoid and Hida–Coleman realization remain PadicFamilies work.

## Source corrections and verification boundary

The published RJW text at printed 158–161 was freshly read against its retained SHA-256. The fixed-component correction is already recorded and independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E53. The shifted-constant correction is recorded as E54 of that extraction; the existing all-prime obstruction here retains its own doubled-denominator precision. Those findings are credited to their existing records, not rediscovered or independently reviewed by this pass. The two inherited local findings E8 and E9 retain the weight/level correction and exponent shift. Stein’s primitive-pair coefficient and two-case constant formula were freshly read; the referenced Miyake proof is not claimed read.

All 182 inherited mathematical node contracts, API entries and tests are retained. Twenty-one declaration-name metadata records are completed or namespace-qualified to match their existing signatures. Ten new declarations cover the obstruction, principal tame construction and comparisons, and cleared congruences; the exact counts are in the catalogue and handoff. The independent reviewer must assess their proof plans and recorded gaps.

The inherited projection contains 288 distinct typed declaration/API signatures and 350 examples. The completed-algebra comparison is retained as an explicit comment because its requested native carrier is unavailable. New signatures and tests are appended with their exact bodies. The full split file is uncompiled: L1/L2 prototype files and the exact pinned Tau dependency closure are unavailable. A separate Mathlib-only file checks the three new obstruction signatures and three examples with six expected admission warnings. This is a signature check, not an implementation or proof certificate. Earlier combined-file compiler claims remain attributed historical evidence.

## Sources

### RJW-published

An introduction to p-adic L-functions — Joaquín Rodrigues Jacinto and Chris Williams. Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101

https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf

Recorded source hash: 78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.

### Stein-Eisenstein-online

Modular Forms, A Computational Approach: Eisenstein Series and Bernoulli Numbers — William Stein. Author-hosted online edition, v0.1 chapter

https://wstein.org/books/modform/modform/eisenstein.html

Recorded source hash: eb50d5d211a33736da400c5953ce96cbb6a3d6332485cfe88d26888a760672fc.

## Supplier requests

### PadicMeasuresIwasawaAlgebras:L1

For U=ℤ_p× and every prime p including2, supply the actual ℤ_p-linear integral-measure equivalence D(U,ℤ_p)→ℤ_p[[U]] on the existing ProfiniteProPGroups Layer9 completed-group-algebra anchor, compatible with convolution and Dirac u↦[u]. Supply the projections to (ℤ/p^sℤ)[(ℤ/p^rℤ)×], all r,s≥0, their joint coefficient/group transition laws, projection of [u] to [red_r(u)], and separation by these projections. Identify these quotients through the canonical unit reduction and its open kernel; use the joint adic/finite-quotient topology, not pure T-adic kernels or an integral dyadic eigenspace splitting. This request imports the general comparison; the finite divisor-coordinate arithmetic is already provided by the consuming nodes.

Needed by: DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates

### PadicMeasuresIwasawaAlgebras:L3

For the existing compact-group measure algebra D(G,R), supply the generic character-twist algebra equivalence attached to an actual continuous unit-valued character, with pointwise weighting action on every measure, inverse-character law, coefficient compatibility and exact Dirac action. In the arithmetic specialization G=Z_pˣ,R=Z_p, export an actual T:D(G,R)≃+*D(G,R) with T(μ)=weight(Units.val)(μ). Use the native total-quotient equivalence and its algebraMap compatibility, and state precisely how clearing by δ_g−1 is transported to clearing by χ(g)δ_g−1; do not assert preservation of ordinary pseudomeasures. This is distinct from the earlier coefficient-field evaluation request. The consumer supplies the arithmetic numerator, doubled shifted denominator and native localized constant; the generic convolution compatibility and ring-equivalence structure belong to this owner.

Needed by: DirichletPadicLFunctions:L4/localized-eisenstein-twist-comparison

### tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus

Export actual primitive-pair Eisenstein forms in the native character eigenspaces and hence ModularForm(Γ₁(uv),w), for positive conductors u,v, primitive ψ,φ, w≥3 and ψ(−1)φ(−1)=(−1)^w, raising parameter1. Their positive coefficient is the native twistedDivisorSum(w−1,ψ,φ); the constant is0 when u>1 and −B_(w,φ)/(2w) when u=1. Supply the exact finite Bernoulli polynomial comparison through each specified coefficient embedding. The owner supplies the Fourier/Gauss translation to native Eisenstein series. For the nonprincipal tame application the right character θ=ηχ must separately satisfy primitivity at Dp^t; no primitivity of a product is inferred. Retain the owner’s separate weight1 and weight2 trivial-pair correction contracts; this request does not import them as ordinary w≥3 cases.

Needed by: DirichletPadicLFunctions:L4/nontrivial-left-full-family, DirichletPadicLFunctions:L4/tame-actual-classical-full-comparison

## Declaration catalogue

### Positive Eisenstein coefficient measures

DirichletPadicLFunctions:L4/positive-eisenstein-measure

Declaration: DirichletPadic.positiveEisensteinMeasure

Kind: construction. Implementation: unchecked.

Define A_n=Σ_{d∣n,p∤d}δ_u(d) in the existing D(U,ℤ_p), where u(d) is the unique unit whose underlying p-adic integer is d. This is an integral measure for every p and every n>0. The construction specifies only the positive coefficients; A₀ is the distinct localized coefficient Tw_x(ζ_p/2), whose character twist moves the pole away from the trivial character (confirmed source correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54).

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

**Construction or proof outline**

- Enumerate positive divisors using Nat.divisors; positivity of n excludes its zero-index convention.
- For p∤d, use Nat.Prime.coprime_iff_not_dvd, PadicInt.norm_natCast_eq_one_iff and PadicInt.isUnit_iff. The existing IsUnit.unit supplies u(d); IsUnit.unit_spec identifies its value with d. Proof irrelevance and unit extensionality make this independent of the certificate.
- Take the finite sum of existing AbstractMeasure.dirac in the native additive group of integral measures. No inverse of p, inverse of 2, localization or Amice comparison is used.
- The n=1 and prime-power APIs follow by enumerating the divisors; for p^r every divisor except 1 is divisible by p. Evaluation at the constant test function counts the summands. The evaluation, moment, p-removal and congruence APIs used by other declarations have their own nodes below.

**Prerequisites**

- mathlib:AbstractMeasure
- mathlib:AbstractMeasure.dirac
- mathlib:AbstractMeasure.dirac_apply
- mathlib:Nat.mem_divisors
- mathlib:Nat.mem_divisors_prime_pow
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:PadicInt.isUnit_iff
- mathlib:IsUnit.unit
- mathlib:IsUnit.unit_spec

**Acceptance**

- All seven tests use the actual unit-group measure carrier. A_p=δ_1 and the exponent-zero test exclude deleting the entire q^p coefficient or summing only prime divisors.

**API**

- DirichletPadic.positiveEisensteinMeasure_eq_sum: For n>0, A_n is the finite sum over d∣n of δ_u(d) if p∤d and zero otherwise; u(d) is the existing IsUnit.unit of the natural cast, proved a unit by the pinned norm and coprimality criteria.
- DirichletPadic.positiveEisensteinMeasure_apply: For every continuous f:ℤ_p×→ℤ_p, A_n(f)=Σ_{d∣n,p∤d}f(u(d)). Promoted to positive-eisenstein-evaluation.
- DirichletPadic.positiveEisensteinMeasure_moment: For e≥0, A_n(x^e)=Σ_{d∣n,p∤d}d^e in ℤ_p. Promoted to positive-eisenstein-moment.
- DirichletPadic.positiveEisensteinMeasure_one: A_1=δ_1.
- DirichletPadic.positiveEisensteinMeasure_prime_pow: For every r≥0, A_{p^r}=δ_1, including r=0.
- DirichletPadic.positiveEisensteinMeasure_mul_p: A_{pn}=A_n for every positive n. Promoted to positive-eisenstein-remove-p.
- DirichletPadic.positiveEisensteinMeasure_mass: A_n(1) is the number of positive divisors of n prime to p, cast to ℤ_p.
- DirichletPadic.positiveEisensteinMeasure_euler_moment: A_n(x^e)=σ_e(n)−p^e σ_e(n/p) when p∣n, and σ_e(n) otherwise, with both natural divisor sums cast to ℤ_p. Promoted to positive-eisenstein-euler-moment.
- DirichletPadic.positiveEisensteinMeasure_moment_congr: For r≥1 and e≡e′ modulo p^(r−1)(p−1), the difference A_n(x^e′)−A_n(x^e) is divisible by p^r in ℤ_p. Promoted to positive-eisenstein-weight-congruence.

**Tests**

- SuggestedEisensteinTests.first_coefficient: At p=3, A_1=δ_1.
- SuggestedEisensteinTests.prime_coefficient_survives: At p=3, A_3=δ_1; the coefficient of q^p survives stabilization.
- SuggestedEisensteinTests.dyadic_divisor_sum: At p=2, A_6=δ_1+δ_3 on ℤ₂×; the natural cast of 3 is viewed as a unit.
- SuggestedEisensteinTests.mass_counts_divisors: At p=2, the exponent-zero moment of A_6 is 2, its number of odd divisors.
- SuggestedEisensteinTests.weight_four_dyadic: At p=2 and n=6, the weight-four exponent is 3 and A_6(x³)=1+27=28.
- SuggestedEisensteinTests.dyadic_precision: At p=2, n=3, r=3 and exponents 1,5, the moment difference is 244−4=240, divisible by 8.
- SuggestedEisensteinTests.tame_component_not_enough_for_precision: At p=5, n=2, exponents 3,7 agree modulo p−1, but their moments differ by 129−9=120, which is not divisible by 25 in ℤ₅.

**Uses**

- RJW Theorem 8.2(b), positive coefficients: Evaluate A_n at x^(k−1) for even k≥4; this produces the p-depleted divisor sum in Definition 8.1.
- RJW Remark 8.3(1–2); DirichletPadicLFunctions:L4: Positive coefficient congruences quantify weight variation, with the tame component and precision modulus made explicit.
- PadicFamilies via the RS-14 boundary: Supplies the arithmetic positive coefficient data for the geometric owner’s family comparison; no geometric family or completed algebra is rebuilt here.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Evaluation of positive Eisenstein coefficients

DirichletPadicLFunctions:L4/positive-eisenstein-evaluation

Declaration: DirichletPadic.positiveEisensteinMeasure_apply

Kind: lemma. Implementation: unchecked.

For every continuous f:U→ℤ_p, A_n(f)=Σ_{d∣n,p∤d}f(u(d)).

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

**Construction or proof outline**

- Unfold the finite arithmetic sum in positive-eisenstein-measure.
- Evaluation is additive in AbstractMeasure, so distribute it over the finite sum. Apply the pinned dirac_apply to each retained divisor; omitted divisors contribute zero.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- At p=2,n=6 and f=1 the value is 2; for f(u)=u³ the value is 28.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Positive Eisenstein moment formula

DirichletPadicLFunctions:L4/positive-eisenstein-moment

Declaration: DirichletPadic.positiveEisensteinMeasure_moment

Kind: theorem. Implementation: unchecked.

For every e≥0, A_n(x^e)=Σ_{d∣n,p∤d}d^e in ℤ_p. In particular, even weight k≥4 uses e=k−1 and gives the positive divisor coefficient σ^p_{k−1}(n) printed in Definition 8.1.

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

**Construction or proof outline**

- The unit value map is continuous; its e-th power is a continuous ℤ_p-valued test function.
- Apply positive-eisenstein-evaluation and use IsUnit.unit_spec to identify each evaluation with d^e. Natural cast and power commute.
- Substitute e=k−1 to identify the arithmetic coefficient in the source. This is the finite coefficient identity; the new positive-eisenstein-modular-comparison node identifies the native modular-form coefficient, while the completed-algebra image remains recorded in the L4 gap.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation
- mathlib:IsUnit.unit_spec

**Acceptance**

- p=2,n=6,e=3 gives 28; p=3,n=6,e=3 gives 9. e=0 gives the number of divisors prime to p.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Invariance under multiplying the coefficient index by p

DirichletPadicLFunctions:L4/positive-eisenstein-remove-p

Declaration: DirichletPadic.positiveEisensteinMeasure_mul_p

Kind: lemma. Implementation: unchecked.

For n>0, A_{pn}=A_n as integral measures on U. Thus A_{p^r n}=A_n for every r≥0.

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

**Construction or proof outline**

- For d prime to p, primality gives gcd(d,p)=1. Nat.Coprime.dvd_mul_left identifies d∣pn with d∣n.
- Use Nat.mem_divisors and positivity of both indices to identify the two finite filtered divisor sets.
- The Dirac summand depends only on d, so the constructor sums coincide. Iteration gives the stated prime-power consequence.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:Nat.mem_divisors
- mathlib:Nat.Coprime.dvd_mul_left
- mathlib:Nat.Prime.coprime_iff_not_dvd

**Acceptance**

- At p=2 the measures A_3 and A_6 are both δ_1+δ_3; at n=1 all A_{p^r} equal δ_1.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Euler-factor deletion for positive divisor sums

DirichletPadicLFunctions:L4/divisor-sum-euler-deletion

Declaration: DirichletPadic.divisorSum_eulerDeletion

Kind: lemma. Implementation: unchecked.

For e≥0, Σ_{d∣n,p∤d}d^e=σ_e(n)−p^e σ_e(n/p) if p∣n, and σ_e(n) otherwise. This equality is in ℤ, with σ_e the existing natural-valued ArithmeticFunction.sigma and all terms cast before subtraction.

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

**Construction or proof outline**

- Use ArithmeticFunction.sigma_apply to express the full sum over positive divisors.
- Split the divisor set into p-divisible and prime-to-p parts. If p∤n, the first part is empty.
- If p∣n, multiplication by p bijects divisors of n/p with p-divisible divisors of n: its inverse sends d to d/p. The equalities n=p(n/p) and d=p(d/p), with p>0, prove both divisibility directions and inverse identities by cancellation.
- Reindex the divisible part by this bijection and use (pd)^e=p^e d^e. Subtract its integer sum from the full sum. The same argument works at e=0.

**Prerequisites**

- mathlib:ArithmeticFunction.sigma_apply
- mathlib:Nat.mem_divisors

**Acceptance**

- At p=3,n=6,e=3: 252−27·9=9. At p=2,n=6,e=0: 4−2=2.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. The elementary coefficient calculation following Definition 8.1 is separated into its precise finite-divisor identity. The source uses e=k−1 for even k≥4; the finite identity itself holds for all e≥0.

### Euler-deleted Eisenstein moments

DirichletPadicLFunctions:L4/positive-eisenstein-euler-moment

Declaration: DirichletPadic.positiveEisensteinMeasure_euler_moment

Kind: theorem. Implementation: unchecked.

For every e≥0, A_n(x^e)=σ_e(n)−p^eσ_e(n/p) if p∣n, and σ_e(n) otherwise, in ℤ_p. Taking e=k−1 recovers the nonconstant coefficient calculation for E_k−p^(k−1)E_k(pz); it does not yet identify an actual bundled modular form.

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.

**Construction or proof outline**

- Apply positive-eisenstein-moment.
- Map divisor-sum-euler-deletion along the existing integer cast ℤ→ℤ_p; finite sums, products, powers and subtraction commute with the map.
- For even k≥4 use e=k−1. The quotient index n/p occurs only in the p∣n branch.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-moment
- DirichletPadicLFunctions:L4/divisor-sum-euler-deletion

**Acceptance**

- At p=2,n=6,e=3: 252−8·28=28. At n=p all e≥0 give 1, not zero.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. The positive coefficients are finite sums of unit Dirac measures. We instantiate the native continuous integral measure carrier. Its comparison with the completed group algebra and the constant coefficient are separate open comparisons.

### Weight congruences for positive Eisenstein coefficients

DirichletPadicLFunctions:L4/positive-eisenstein-weight-congruence

Declaration: DirichletPadic.positiveEisensteinMeasure_moment_congr

Kind: theorem. Implementation: unchecked.

For r≥1 and e,e′≥0 with e≡e′ modulo p^(r−1)(p−1), the element A_n(x^e′)−A_n(x^e) is divisible by p^r in ℤ_p. For weights k,k′≥4 even, apply this with e=k−1 and e′=k′−1. The assertion includes p=2; it is a sufficient precision modulus, with no claim of optimality.

**Hypotheses**

- p is any prime, including 2; n is a positive natural number, represented by ℕ+ in the suggested file.
- Write U=ℤ_p× with its native unit-group topology and D(U,ℤ_p)=AbstractMeasure U ℤ_p ℤ_p. All powers have natural exponent. No coefficient at n=0 is defined here.
- r is a positive natural number; e,e′ are natural numbers satisfying the displayed congruence.

**Construction or proof outline**

- Use positive-eisenstein-moment for both exponents. Every retained divisor d is coprime to p and hence to p^r.
- Apply Nat.pow_totient_mod at modulus p^r, which is greater than 1. Nat.totient_prime_pow rewrites its totient as p^(r−1)(p−1). The exponent congruence identifies the remainders, so the two powers of each d are congruent modulo p^r.
- Use Nat.modEq_iff_dvd to express each power difference as an integer multiple of p^r. Cast this equality to ℤ_p and sum the finitely many witnesses.
- For odd p the factor p−1 records the tame component; p-adic closeness without that condition is insufficient. At p=2 the modulus here is 2^(r−1), and the argument does not assume ℤ₂× is procyclic.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-moment
- mathlib:Nat.pow_totient_mod
- mathlib:Nat.totient_prime_pow
- mathlib:Nat.modEq_iff_dvd
- mathlib:Nat.Prime.coprime_iff_not_dvd

**Acceptance**

- At p=2,n=3,r=3,e=1,e′=5 the difference is 240 and is divisible by 8. At p=5,n=2,r=2, exponents 3,7 have the same tame component but difference 120 is not divisible by 25; the required modulus is 20.

**Sources**

- RJW-published, §8, Definition 8.1 and proof of Theorem 8.2, printed pp.159–160 / PDF60–61; collated with arXiv v2 p.44.. A quantitative finite-coefficient consequence of Theorem 8.2 and the weight-variation discussion in Remark 8.3. The precision statement is derived using the pinned Fermat–Euler remainder API; it is not quoted as a separately numbered source theorem. It covers only positive coefficients.

### Arithmetic normalization of the classical Eisenstein form

DirichletPadicLFunctions:L4/normalized-eisenstein

Declaration: DirichletPadic.normalizedEisenstein

Kind: construction. Implementation: unchecked.

For k≥4 define Eᵃ_k=(−B_k/(2k))·E_k^lib in the existing complex ModularForm(SL₂(ℤ),k), where E_k^lib is the pinned ModularForm.E. This is only a scalar normalization of the existing form. Its arithmetic coefficient formulas below require k even; the constructor itself also makes sense for odd k≥4.

**Hypotheses**

- k is a natural number with k≥4. Evenness is required by the arithmetic coefficient API, not by scalar multiplication in the constructor.
- The Bernoulli scalar is rational with its usual complex embedding; ModularForm.E is Mathlib’s pinned constant-one form at even weights.

**Construction or proof outline**

- Use k≥4 to obtain the existing constructor’s bound 3≤k. Apply the native complex scalar action to ModularForm.E, with scalar the complex image of −B_k/(2k)∈ℚ. Slash invariance, holomorphy and boundedness at every cusp are supplied by the existing ModularForm module structure.
- Do not define a second lattice sum, nebentypus space or q-expansion carrier. The pointwise formula is scalar evaluation, and changing the proof of k≥4 does not change the form by proof irrelevance.
- The positive coefficients and the constant zeta comparison are separate promoted API nodes, because p-stabilization consumes both. The restriction k≥4 excludes the exceptional weight-two correction, which belongs to the classical ModularForms owner.

**Prerequisites**

- mathlib:ModularForm.E

**Acceptance**

- At even weight4 the constant coefficient is 1/240 and the first positive coefficient is 1; native E₄ has constant1 and first coefficient240.
- At weight6 the constant is −1/504 and the coefficient at2 is33. The Bernoulli sign and weight exponent are visible in these tests.

**API**

- DirichletPadic.normalizedEisenstein_eq_smul: Eᵃ_k=(−B_k/(2k))·E_k^lib in the native level-one modular-form space.
- DirichletPadic.normalizedEisenstein_apply: For z in the upper half-plane, Eᵃ_k(z)=(−B_k/(2k))E_k^lib(z).
- DirichletPadic.normalizedEisenstein_coeff: For even k≥4, the period-one coefficient at0 is −B_k/(2k), and at n>0 is σ_(k−1)(n). Promoted to normalized-eisenstein-coeff.
- DirichletPadic.normalizedEisenstein_constant_zeta: For even k≥4, the constant coefficient equals ζ(1−k)/2. Promoted to normalized-eisenstein-zeta-constant.

**Tests**

- SuggestedModularTests.weight_four_normalization: The weight-four constant is 1/240 and its q coefficient is1.
- SuggestedModularTests.weight_six_sign: The weight-six constant is −1/504 and its q² coefficient is33.
- SuggestedModularTests.native_constant_one_rejected: The weight-four arithmetic constant is not1; the pinned constant-one E₄ cannot be used unchanged in Theorem8.2.

**Uses**

- RJW Definition8.1: The p-stabilized form must start from the arithmetic normalization with positive coefficients σ_(k−1).
- RJW Theorem8.2(b): Its constant coefficient is compared with the separately constructed arithmetic pseudomeasure, and its positive coefficients with native integral measures.

**Sources**

- RJW-published, §8, normalized E_k formula, printed159 / PDF60; arXiv v2 p.43.. Arithmetic scalar conversion of the source’s normalization using the existing constant-one Eisenstein form, not a reconstruction of that form.

### Divisor coefficients of the arithmetic normalization

DirichletPadicLFunctions:L4/normalized-eisenstein-coeff

Declaration: DirichletPadic.normalizedEisenstein_coeff

Kind: lemma. Implementation: unchecked.

For even k≥4 and n≥0, a_n(Eᵃ_k)=−B_k/(2k) if n=0, and a_n(Eᵃ_k)=σ_(k−1)(n) if n>0, with the rational and natural quantities embedded in ℂ.

**Hypotheses**

- p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2.
- Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

**Construction or proof outline**

- Apply ModularForm.qExpansion_smul with the native period-one certificate one_mem_strictPeriods_SL. The coefficient map is linear. Substitute the exact pinned EisensteinSeries.E_qExpansion_coeff formula, separating n=0 before cancelling any scalar.
- Justify B_k≠0 inside this proof: write k=2j with j>0. riemannZeta_ne_zero_of_one_lt_re applies at 2j>1, while riemannZeta_two_mul_nat expresses this nonzero value as a scalar multiple of B_(2j). If B_(2j)=0 the value would vanish. This short specialization uses the existing zeta API, not a new general Bernoulli theory.
- For n>0 cancel (−B_k/(2k))(−2k/B_k)=1 using k≠0 and the preceding nonvanishing. For n=0 the original coefficient is1, leaving −B_k/(2k).

**Prerequisites**

- DirichletPadicLFunctions:L4/normalized-eisenstein
- mathlib:ModularForm.qExpansion_smul
- mathlib:one_mem_strictPeriods_SL
- mathlib:EisensteinSeries.E_qExpansion_coeff
- mathlib:riemannZeta_two_mul_nat
- mathlib:riemannZeta_ne_zero_of_one_lt_re

**Acceptance**

- Positive coefficient1 is1, not −2k/B_k. At k=4,n=2 it is9; at k=6,n=2 it is33.
- The proof must not cancel B_k at odd k>1, when the required nonvanishing fails.

**Sources**

- RJW-published, §8, normalized E_k formula, printed159 / PDF60; arXiv v2 p.43.. Rescales the already proved classical coefficient formula. The nonvanishing step is explicitly discharged through baseline zeta declarations.

### The zeta constant term

DirichletPadicLFunctions:L4/normalized-eisenstein-zeta-constant

Declaration: DirichletPadic.normalizedEisenstein_constant_zeta

Kind: lemma. Implementation: unchecked.

For even k≥4, a₀(Eᵃ_k)=ζ(1−k)/2 in ℂ. Both equal the complex image of the rational number −B_k/(2k).

**Hypotheses**

- p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2.
- Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

**Construction or proof outline**

- Use normalized-eisenstein-coeff at n=0. Apply the pinned all-index riemannZeta_neg_nat_eq_bernoulli at k−1.
- Here k−1 is odd, k−1+1=k and −(k−1)=1−k after casting. Thus (−1)^(k−1)=−1 and the zeta value is −B_k/k. Divide by2 and rearrange in ℂ.
- This comparison only uses a rational normalized special value; it defines no map from ℂ to a p-adic field.

**Prerequisites**

- DirichletPadicLFunctions:L4/normalized-eisenstein-coeff
- mathlib:riemannZeta_neg_nat_eq_bernoulli

**Acceptance**

- For k=4 the constant is ζ(−3)/2=1/240. For k=6 it is ζ(−5)/2=−1/504.
- The k=1 sign exception in the source’s unrestricted negative-value formula never enters: the stated range is even k≥4.

**Sources**

- RJW-published, §8, normalized E_k formula, printed159 / PDF60; arXiv v2 p.43.. Identifies the source constant through the corrected pinned zeta formula, with the common rational value specified.

### The p-stabilized Eisenstein modular form

DirichletPadicLFunctions:L4/p-stabilized-eisenstein

Declaration: DirichletPadic.pStabilizedEisenstein

Kind: construction. Implementation: unchecked.

For every prime p and k≥4 construct Eᵃ_{k,p}=res_(Γ₀(p)) Eᵃ_k−p^(k−1)V_p(res_(Γ₀(1)) Eᵃ_k) in the existing ModularForm(Γ₀(p),k). Here V_p is TauCeti.ModularForm.levelRaise, so pointwise Eᵃ_{k,p}(z)=Eᵃ_k(z)−p^(k−1)Eᵃ_k(pz). Evenness is required for the following coefficient comparisons.

**Hypotheses**

- p is any prime, including2; k≥4. Arithmetic coefficient statements additionally require k even.
- Γ₀(N) always means its native image (CongruenceSubgroup.Gamma0 N).map(mapGL ℝ); V_p has the pinned evaluation f(pz).

**Construction or proof outline**

- View Γ₀(N) through its image under mapGL ℝ. This image is contained in SL₂(ℤ)’s image by the elementary subgroup-map inclusion, so the existing ModularForm.ofLe restricts Eᵃ_k to Γ₀(p) and Γ₀(1). No equality of differently represented group carriers is assumed.
- Prime p is nonzero. Specialize Gamma0_map_le_conjAct_scaleGL at M=1,d=p and simplify p·1=p. This supplies exactly the conjugation hypothesis for the existing levelRaise from Γ₀(1) to Γ₀(p). The determinant-one structure comes from these native congruence subgroups.
- Take the difference in that native complex modular-form module. Holomorphy and the conditions at all cusps are inherited from ofLe, levelRaise, scalar multiplication and subtraction; the definition is therefore an actual modular form, not a formal q-series assumed modular.
- Use coe_ofLe and levelRaise_apply to get the pointwise API. In this normalization V_p f(z)=f(pz), with no additional p-power from the slash operator. No odd-prime hypothesis or division by p is needed.

**Prerequisites**

- DirichletPadicLFunctions:L4/normalized-eisenstein
- tauceti:ModularForm.ofLe
- tauceti:ModularForm.coe_ofLe
- tauceti:TauCeti.ModularForm.levelRaise
- tauceti:TauCeti.ModularForm.levelRaise_apply
- tauceti:TauCeti.Gamma0_map_le_conjAct_scaleGL

**Acceptance**

- At p=2,k=4 the form has levelΓ₀(2), constant −7/240 and coefficient at2 equal1.
- At p=3,k=4 coefficient at2 is9 and at6 is9. The coefficient at p is1: stabilization removes p-divisible divisors, not all coefficients indexed by multiples of p.

**API**

- DirichletPadic.pStabilizedEisenstein_eq: Eᵃ_{k,p} is the stated difference of restriction and the pinned p-level raise in ModularForm(Γ₀(p),k).
- DirichletPadic.pStabilizedEisenstein_apply: For every z∈ℍ, Eᵃ_{k,p}(z)=Eᵃ_k(z)−p^(k−1)Eᵃ_k(pz).
- DirichletPadic.pStabilizedEisenstein_qExpansion: Its full period-one q-expansion is Q_k−p^(k−1)Q_k(q^p), including degree0, where Q_k=qExpansion(Eᵃ_k). Promoted to p-stabilized-q-expansion.
- DirichletPadic.pStabilizedEisenstein_coeff_pos: For even k≥4 and n>0, a_n(Eᵃ_{k,p})=Σ_{d∣n,p∤d}d^(k−1) in ℂ. Promoted to p-stabilized-positive-coeff.
- DirichletPadic.pStabilizedEisenstein_constant_zeta: For even k≥4, a₀(Eᵃ_{k,p})=(1−p^(k−1))ζ(1−k)/2. Promoted to p-stabilized-zeta-constant.

**Tests**

- SuggestedModularTests.dyadic_stabilized_constant: At p=2,k=4 the constant is −7/240.
- SuggestedModularTests.coefficient_at_p_survives: At p=2,k=4 the coefficient at2 is1, hence it is not zero.
- SuggestedModularTests.prime_to_p_index: At p=3,k=4 the coefficient at2 is9.
- SuggestedModularTests.multiple_of_p_index: At p=3,k=4 the coefficient at6 is9, equal to the coefficient at2.

**Uses**

- RJW Definition8.1: Gives the modular-form side of the arithmetic specialization.
- RJW Theorem8.2(b): The coefficient measures specialize to the q-expansion of this actual form. Geometric family realization stays with PadicFamilies.

**Sources**

- RJW-published, Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44.. Instantiates the pinned degeneracy operator and restriction maps to establish the source’s actual modularity and normalization.

### Degeneracy formula for the full q-expansion

DirichletPadicLFunctions:L4/p-stabilized-q-expansion

Declaration: DirichletPadic.pStabilizedEisenstein_qExpansion

Kind: comparison. Implementation: unchecked.

For every prime p and k≥4, qExpansion₁(Eᵃ_{k,p})=Q_k−p^(k−1)·expand_p(Q_k) in ℂ[[q]], where Q_k=qExpansion₁(Eᵃ_k) and expand_p substitutes q↦q^p. This equality includes the constant coefficient and does not require k even.

**Hypotheses**

- p is prime and k≥4; no evenness is needed for the level-raise identity.
- Q_k is the period-one q-expansion of the arithmetic scalar multiple Eᵃ_k.

**Construction or proof outline**

- Apply ModularForm.qExpansion_sub and qExpansion_smul at Γ₀(p). The baseline strictPeriods_Gamma0 identifies the strict periods with ℤ, giving period1 at both Γ₀(p) and Γ₀(1).
- Apply the exact TauCeti.ModularForm.qExpansion_levelRaise to the same conjugation certificate used in the constructor. Its result is native PowerSeries.expand p, not an unproved assertion about reindexing an analytic infinite sum.
- Restriction does not change the underlying function, by ModularForm.coe_ofLe. Since qExpansion is defined on functions, both remaining restricted q-expansions are definitionally Q_k. This proves the full series identity.

**Prerequisites**

- DirichletPadicLFunctions:L4/p-stabilized-eisenstein
- mathlib:ModularForm.qExpansion_sub
- mathlib:ModularForm.qExpansion_smul
- mathlib:CongruenceSubgroup.strictPeriods_Gamma0
- tauceti:ModularForm.coe_ofLe
- tauceti:TauCeti.ModularForm.qExpansion_levelRaise

**Acceptance**

- At n=0, expand_p retains a₀, hence the factor1−p^(k−1).
- At n>0 not divisible by p, expand_p has zero coefficient. At p∣n it contributes a_(n/p), with no extra normalization factor.

**Sources**

- RJW-published, Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44.. Makes the source’s easy Fourier check a comparison using the existing modular-form and formal-series APIs.

### Positive Fourier coefficients after stabilization

DirichletPadicLFunctions:L4/p-stabilized-positive-coeff

Declaration: DirichletPadic.pStabilizedEisenstein_coeff_pos

Kind: theorem. Implementation: unchecked.

For every prime p, even k≥4 and positive n, a_n(Eᵃ_{k,p}) is the complex image of S_(p,k,n)=Σ_{d∣n,p∤d}d^(k−1)∈ℤ. Equivalently it is σ_(k−1)(n)−p^(k−1)σ_(k−1)(n/p) if p∣n, and σ_(k−1)(n) otherwise.

**Hypotheses**

- p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2.
- Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

**Construction or proof outline**

- Take coefficient n in p-stabilized-q-expansion and use PowerSeries.coeff_expand. Split p∣n. If p∤n the expanded coefficient is0; if p∣n, primality and n>0 give n/p>0, so both source coefficients are positive-index instances of normalized-eisenstein-coeff.
- The resulting difference is the complex cast of the integer expression in the existing divisor-sum-euler-deletion node at exponent k−1. Apply that node and distribute the cast across the finite sum. Integer subtraction avoids truncated natural subtraction.
- All positivity and divisibility hypotheses are explicit: the n=0 branch uses a different constant-term theorem, not the convention for Nat.divisors 0.

**Prerequisites**

- DirichletPadicLFunctions:L4/p-stabilized-q-expansion
- DirichletPadicLFunctions:L4/normalized-eisenstein-coeff
- DirichletPadicLFunctions:L4/divisor-sum-euler-deletion
- mathlib:PowerSeries.coeff_expand

**Acceptance**

- At p=2,k=4,n=6 the coefficient is28=1+3³; at p=3 it is9=1+2³.
- For n=p the coefficient is1, so the phrase about killing coefficients at p is interpreted as removing p-divisible divisors.
- For p=3,k=4,n=2 the exponent is3 and the result9; the incorrect exponent4 gives17.

**Sources**

- RJW-published, Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44.. Combines the actual modular-form q-expansion with the already planned integer divisor deletion; no duplicate finite-divisor lemma is introduced.

### Euler factor in the stabilized constant term

DirichletPadicLFunctions:L4/p-stabilized-zeta-constant

Declaration: DirichletPadic.pStabilizedEisenstein_constant_zeta

Kind: theorem. Implementation: unchecked.

For every prime p and even k≥4, a₀(Eᵃ_{k,p})=(1−p^(k−1))ζ(1−k)/2 in ℂ. It is the complex image of c_(p,k)=−(1−p^(k−1))B_k/(2k)∈ℚ.

**Hypotheses**

- p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2.
- Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

**Construction or proof outline**

- Take coefficient0 in p-stabilized-q-expansion. PowerSeries.coeff_expand has p∣0 and 0/p=0, so the coefficient is (1−p^(k−1))a₀(Eᵃ_k).
- Apply normalized-eisenstein-zeta-constant. For the rational representative, use normalized-eisenstein-coeff at0 and commute the rational-to-complex cast with products and division. Here2k≠0.
- The rational representative can independently be embedded in ℚ_p, but this does not construct A₀ or supply an integral measure. In particular, dyadic denominators are not dismissed by a division inside ℤ₂.

**Prerequisites**

- DirichletPadicLFunctions:L4/p-stabilized-q-expansion
- DirichletPadicLFunctions:L4/normalized-eisenstein-zeta-constant
- DirichletPadicLFunctions:L4/normalized-eisenstein-coeff
- mathlib:PowerSeries.coeff_expand

**Acceptance**

- At p=2,k=4 the constant is −7/240; at p=3,k=4 it is −13/120.
- At p=2,k=6 it is31/504. These are rational constants, with no claim that they all lie in ℤ_p.

**Sources**

- RJW-published, Definition8.1 and following q-expansion and level assertion, printed159 / PDF60; arXiv v2 p.44.. Identifies the exact constant needed by Theorem8.2 while retaining the missing arithmetic pseudomeasure as an explicit gap.

### Measure moments and modular Fourier coefficients

DirichletPadicLFunctions:L4/positive-eisenstein-modular-comparison

Declaration: DirichletPadic.positiveEisensteinMeasure_modular_coeff

Kind: theorem. Implementation: unchecked.

For every prime p, even k≥4 and n>0, there is a unique integer S such that a_n(Eᵃ_{k,p})=ι_ℂ(S) and A_n(x^(k−1))=ι_ℤp(S), where A_n is the native positiveEisensteinMeasure and S=Σ_{d∣n,p∤d}d^(k−1). This is the positive-index specialization in Theorem8.2 through a common arithmetic coefficient.

**Hypotheses**

- p is any prime, including 2; k is an even natural number with k≥4. B_k is Mathlib’s rational Bernoulli number, with B₁=−1/2.
- Eᵃ_k denotes normalizedEisenstein in the existing level-one ModularForm carrier; Eᵃ_{k,p} denotes pStabilizedEisenstein at Γ₀(p). All q-expansions have period 1, q=exp(2πiz).

**Construction or proof outline**

- Choose the displayed finite integer sum. p-stabilized-positive-coeff identifies its complex image with the coefficient of the actual stabilized modular form.
- Apply the existing positive-eisenstein-moment node at exponent k−1 to identify the integral p-adic moment. The integer cast distributes over powers and the finite divisor sum, giving precisely the same S in ℤ_p.
- Uniqueness follows from injectivity of the integer cast into ℂ. No C-to-C_p isomorphism, measure scalar-extension assumption or completion of the group ring appears in this positive-coefficient comparison.
- For arbitrary p-adic coefficient extensions one must still use the owner’s measure base-change maps; the joint equality proved here concerns the native ℤ_p-valued measure. The index0 is excluded and remains the separate A₀=xζ_p/2 construction.

**Prerequisites**

- DirichletPadicLFunctions:L4/p-stabilized-positive-coeff
- DirichletPadicLFunctions:L4/positive-eisenstein-moment

**Acceptance**

- At p=2,k=4,n=6 the common integer is28, in both ℂ and ℤ₂.
- At p=3,k=4,n=2 it is9; exponent k instead of k−1 would give17.
- At n=p the common integer is1, consistent with A_p=δ₁. The common-integer theorem makes no assertion for A₀.

**Sources**

- RJW-published, Theorem8.2(b), positive-index calculation in its proof, printed160 / PDF61; arXiv v2 p.44.. Completes only the positive-index comparison with the native classical modular form. The completed-algebra image and the twisted localized constant coefficient remain distinct missing inputs.

### Finite quotient Eisenstein coefficients

DirichletPadicLFunctions:L4/positive-eisenstein-finite

Declaration: DirichletPadic.positiveEisensteinFinite

Kind: construction. Implementation: unchecked.

Define E_(n;r,s)=Σ_{d∣n,p∤d}[red_r(u(d))] in (ℤ/p^sℤ)[U_r]. Each divisor contributes a coefficient 1, so divisors with the same unit residue contribute with multiplicity. This is the explicit finite group-ring coordinate of the positive coefficient, using existing group algebras and residue maps.

**Hypotheses**

- p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r).
- For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

**Construction or proof outline**

- Use the same natural-cast unit and finite divisor set as positive-eisenstein-measure; apply the existing Units.map to ρ_r. No quotient group or unit carrier is reconstructed.
- Sum the existing MonoidAlgebra.single at those units with coefficient 1 in ℤ/p^sℤ. Distinct divisors need not have distinct images, so the sum is taken over divisors, not the set of distinct residues.
- At s=0 the coefficient ring is ℤ/1ℤ and the result is zero. At r=0 the group is trivial, so its single coefficient is the number of p-prime divisors modulo p^s. At n=1 and n=p^a the only retained divisor is 1.
- Deleting powers of p in n leaves the p-prime divisor set unchanged, by the existing positive-eisenstein-remove-p argument. These are arithmetic specializations, not a definition of the shared completed algebra.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- DirichletPadicLFunctions:L4/positive-eisenstein-remove-p
- mathlib:PadicInt.toZModPow
- mathlib:Units.map
- mathlib:MonoidAlgebra.single

**Acceptance**

- The dyadic tests distinguish adding multiplicities from deleting collisions, and distinguish the coefficient level from the group level. No coefficient A₀ is defined.

**API**

- DirichletPadic.positiveEisensteinFinite_eq_sum: E_(n;r,s) is the divisor-indexed sum of single(red_r(u(d)),1), with the same u(d) as A_n.
- DirichletPadic.positiveEisensteinFinite_coeff: For a∈U_r, its coefficient is Σ_{d∣n,p∤d}1_(red_r(u(d))=a) in ℤ/p^sℤ. Promoted to positive-eisenstein-finite-coeff.
- DirichletPadic.positiveEisensteinFinite_transition: For r′≤r and s′≤s, reduce coefficients then push the group index forward; the image of E_(n;r,s) is E_(n;r′,s′). Promoted to positive-eisenstein-finite-transition.
- DirichletPadic.positiveEisensteinFinite_apply: For continuous f:U→ℤ_p and any g:U_r→ℤ/p^sℤ with ρ_s(f(u))=g(red_r(u)), the reduced integral A_n(f) equals Σ_a coeff_a(E_(n;r,s))g(a). Promoted to positive-eisenstein-finite-evaluation.
- DirichletPadic.positiveEisensteinFinite_moment: If s≤r and e≥0, evaluation on the e-th power of the reduced unit equals ρ_s(A_n(x^e)). Promoted to positive-eisenstein-finite-moment.
- DirichletPadic.positiveEisensteinFinite_one: E_(1;r,s)=[1] for all r,s.
- DirichletPadic.positiveEisensteinFinite_prime_pow: E_(p^a;r,s)=[1] for all a,r,s, including a=0.
- DirichletPadic.positiveEisensteinFinite_mul_p: E_(pn;r,s)=E_(n;r,s) for all n>0.
- DirichletPadic.positiveEisensteinFinite_coeff_zero: E_(n;r,0)=0 because the coefficient ring is ℤ/1ℤ.

**Tests**

- FiniteCoefficientTests.dyadic_separated: At p=2,n=6,r=2,s=3, E=[1]+[3] in (ℤ/8ℤ)[(ℤ/4ℤ)×].
- FiniteCoefficientTests.dyadic_collision: At p=2,n=6,r=1,s=3, E=2[1]; the two divisors merge and their multiplicities add.
- FiniteCoefficientTests.dyadic_cancellation: At p=2,n=6,r=1,s=1, E=0. A set of distinct residues with coefficient1 gives the wrong answer.
- FiniteCoefficientTests.prime_coefficient: At p=3,n=3,r=2,s=2, E=[1], so the positive coefficient at q^p survives.
- FiniteCoefficientTests.trivial_group_mass: At p=2,n=6,r=0,s=3, E=2[1]; trivial group level does not force coefficient precision0.
- FiniteCoefficientTests.zero_coefficient_ring: For every p,n,r, E_(n;r,0)=0.
- FiniteCoefficientTests.separate_precision_levels: At p=2,n=6,r=2,s=1, E=[1]+[3] is nonzero, while its image at r=1,s=1 vanishes.

**Uses**

- RJW Proposition3.16 followed by Theorem8.2: Identify the finite group-ring coordinates of the actual positive coefficient measures.
- DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates: Supplies explicit, compatible coordinate values for the existing completed-algebra owner’s measure comparison.
- DirichletPadicLFunctions:L4 coefficient specialization and congruences: Check finite precision moments with the unit-group quotient and coefficient precision separately specified.

**Sources**

- RJW-published, §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026.. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Finite residue multiplicities

DirichletPadicLFunctions:L4/positive-eisenstein-finite-coeff

Declaration: DirichletPadic.positiveEisensteinFinite_coeff

Kind: lemma. Implementation: unchecked.

For a∈U_r, coeff_a(E_(n;r,s)) is the number of p-prime positive divisors d of n with red_r(u(d))=a, reduced modulo p^s. Equivalently it is the sum of the corresponding 0–1 indicators.

**Hypotheses**

- p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r).
- For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

**Construction or proof outline**

- Apply the existing coefficient map to the finite sum; evaluate each MonoidAlgebra.single by Finsupp.single_apply.
- Collect the indicators. Coefficients count preimages with multiplicity; they are not membership indicators for the image set.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-finite
- mathlib:MonoidAlgebra.coeff_sum
- mathlib:MonoidAlgebra.coeff_single
- mathlib:Finsupp.single_apply

**Acceptance**

- At p=2,n=6 the two residue classes at r=2 merge into a coefficient2 at r=1 and then become0 modulo2.

**Sources**

- RJW-published, §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026.. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Joint finite-level compatibility

DirichletPadicLFunctions:L4/positive-eisenstein-finite-transition

Declaration: DirichletPadic.positiveEisensteinFinite_transition

Kind: lemma. Implementation: unchecked.

For r′≤r and s′≤s, map E_(n;r,s) first along ℤ/p^sℤ→ℤ/p^s′ℤ and then along U_r→U_r′. The result is E_(n;r′,s′). The group map pushes coefficients forward by adding over each fiber.

**Hypotheses**

- p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r).
- For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

**Construction or proof outline**

- The native PadicInt.zmod_cast_comp_toZModPow gives compatibility of the ring reductions. Applying Units.map identifies the two routes for every u(d).
- Map the finite sum through MonoidAlgebra.mapRingHom and mapDomainRingHom. Both preserve sums and the image of each single basis vector has coefficient1 at red_r′(u(d)).
- Composition and the commutation of coefficient/group reduction are the pinned general map identities. No averaging, division by the kernel size, procyclic generator or pure T-adic quotient is introduced.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-finite
- mathlib:PadicInt.zmod_cast_comp_toZModPow
- mathlib:MonoidAlgebra.mapRingHom
- mathlib:MonoidAlgebra.mapDomainRingHom
- mathlib:MonoidAlgebra.mapRingHom_single
- mathlib:MonoidAlgebra.mapDomain_single
- mathlib:MonoidAlgebra.mapRingHom_comp_mapDomainRingHom

**Acceptance**

- The transition from r=2,s=3 to r′=1,s′=1 at p=2,n=6 sends [1]+[3] to0. Coefficient reduction is independent of the group reduction.

**Sources**

- RJW-published, §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026.. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Finite coordinate and native integral comparison

DirichletPadicLFunctions:L4/positive-eisenstein-finite-evaluation

Declaration: DirichletPadic.positiveEisensteinFinite_apply

Kind: lemma. Implementation: unchecked.

Let f:U→ℤ_p be continuous and g:U_r→ℤ/p^sℤ any function such that ρ_s(f(u))=g(red_r(u)) for all u. Then ρ_s(A_n(f))=Σ_{a∈U_r}coeff_a(E_(n;r,s))·g(a). This compares the actual intrinsic measure with the finite coordinate, with factorization required only after coefficient reduction.

**Hypotheses**

- p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r).
- For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

**Construction or proof outline**

- Use positive-eisenstein-evaluation to write A_n(f) as its divisor sum and apply the ring map ρ_s term by term.
- Apply the stated factorization at each u(d). On the other side expand positive-eisenstein-finite-coeff, interchange two finite sums and evaluate the single nonzero indicator for each divisor.
- This arithmetic finite-sum argument needs neither a new measure restriction functor nor a general completed-algebra comparison. The factorization hypothesis is explicit; arbitrary f need not factor at a fixed r,s.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation
- DirichletPadicLFunctions:L4/positive-eisenstein-finite-coeff

**Acceptance**

- The constant function1 recovers mass modulo p^s. A nonconstant residue function checks that the comparison remembers individual cosets rather than just total mass.

**Sources**

- RJW-published, §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026.. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Finite precision power moments

DirichletPadicLFunctions:L4/positive-eisenstein-finite-moment

Declaration: DirichletPadic.positiveEisensteinFinite_moment

Kind: lemma. Implementation: unchecked.

For s≤r and e≥0, pair E_(n;r,s) with a↦(a reduced from ℤ/p^rℤ to ℤ/p^sℤ)^e. Its value is ρ_s(A_n(x^e))=Σ_{d∣n,p∤d}d^e modulo p^s. Weight k specializes at e=k−1.

**Hypotheses**

- p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r).
- For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

**Construction or proof outline**

- Apply positive-eisenstein-finite-evaluation with the actual continuous function u↦u^e.
- The hypothesis s≤r and native compatibility of ρ give the required factorization. Use positive-eisenstein-moment for the final divisor sum.
- At s>r this particular power function need not descend modulo p^s: no such assertion is made. The constructor and transition theorem still allow independent r,s.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-finite-evaluation
- DirichletPadicLFunctions:L4/positive-eisenstein-moment
- mathlib:PadicInt.zmod_cast_comp_toZModPow

**Acceptance**

- At p=2,n=6,r=s=3,e=3 the answer is28 modulo8, namely4. The moment exponent is k−1, and e=0 remains the mass test.

**Sources**

- RJW-published, §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026.. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Completed-algebra coordinates of positive coefficients

DirichletPadicLFunctions:L4/positive-eisenstein-completed-coordinates

Declaration: DirichletPadic.positiveEisenstein_completed_projection

Kind: comparison. Implementation: unchecked.

Under the actual integral measure/completed-group-algebra comparison supplied by PadicMeasuresIwasawaAlgebras:L1, the image of A_n has projection E_(n;r,s) in (ℤ/p^sℤ)[U_r] for every r,s. These projections uniquely characterize that image in the separated joint inverse limit. This is an arithmetic specialization of the requested owner map, not a construction of another completed algebra.

**Hypotheses**

- p is any prime, including 2; n>0. Put U=ℤ_p× and U_r=(ℤ/p^rℤ)× for r≥0. Let ρ_s:ℤ_p→ℤ/p^sℤ be the pinned PadicInt.toZModPow and red_r=Units.map(ρ_r).
- For a positive divisor d of n with p∤d, u(d) is the same unit of ℤ_p used by positive-eisenstein-measure. Define E_(n;r,s) in the existing MonoidAlgebra(ℤ/p^sℤ,U_r). The group level r and coefficient level s vary independently, including zero. No p-adic topology is assigned to a power-series carrier here.

**Construction or proof outline**

- Import the owner’s actual ℤ_p-linear measure comparison, Dirac-generator compatibility, finite coefficient/group projections and their separating property. Its ℤ_p anchor is the existing ProfiniteProPGroups Layer9 roadmap, with the accepted RS16 topology gate.
- Expand A_n as its native intrinsic-unit Dirac sum. Linearity and projection of Dirac at u(d) to [red_r(u(d))] give exactly the defining finite coordinate.
- Invoke the supplied separated joint inverse-limit property for uniqueness. The arithmetic finite-level formula and transitions are supplied here; the common completed carrier and measure equivalence remain an open named request. This does not construct A₀ or arithmetic ζ_p.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- DirichletPadicLFunctions:L4/positive-eisenstein-finite
- DirichletPadicLFunctions:L4/positive-eisenstein-finite-transition
- PadicMeasuresIwasawaAlgebras:L1

**Acceptance**

- The requested map sends intrinsic δ_1 to the multiplicative identity and preserves convolution; the inclusion into measures on additive ℤ_p is not substituted for that algebra map. Include p=2 with no integral sign-idempotent splitting.

**Sources**

- RJW-published, §3.3, Proposition3.16 and explicit coordinate maps, printed121–123 / PDF22–24; §8 Theorem8.2 proof, printed160 / PDF61. Read 27 September2026.. The source identifies a measure with its finite coset masses and defines A_n as the divisor Dirac sum. The two-index reduction modulo p^s at unit-group level p^r, its exact multiplicities and tests are worker-derived specializations. The general completed-algebra comparison remains an explicit supplier request.

### Uniform bound for positive Eisenstein integrals

DirichletPadicLFunctions:L4/positive-eisenstein-evaluation-bound

Declaration: DirichletPadic.positiveEisensteinMeasure_norm_le

Kind: lemma. Implementation: unchecked.

For every n>0 and f∈C(U,Z), |A_n(f)|_p ≤ ‖f‖∞. The constant is one, independently of n and of the number of divisors.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- Use positive-eisenstein-evaluation to write A_n(f) as a finite sum of evaluations at the prime-to-p divisors. Every nonzero summand has norm at most ‖f‖∞ by ContinuousMap.norm_coe_le_norm.
- Apply the additive form of the indexed IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg. Its generated norm_sum_le_of_forall_le_of_nonneg handles the finite sum, including zero summands. No division by the cardinality occurs.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation
- mathlib:ContinuousMap.norm_coe_le_norm
- mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg

**Acceptance**

- At n=1 this is the norm bound for evaluation at 1. The dyadic n=6 mass is 2 and has norm 1/2, so equality is not asserted.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### The positive Eisenstein q-expansion measure

DirichletPadicLFunctions:L4/positive-eisenstein-series

Declaration: DirichletPadic.positiveEisensteinSeries

Kind: construction. Implementation: unchecked.

There is a canonical native AbstractMeasure(U,Z,Z[[q]]), denoted E⁺, given on f∈C(U,Z) by E⁺(f)=Σ_{n≥1} A_n(f)qⁿ. In this formal coefficient description coefficient zero is zero. This is the positive part of the source family, and does not define its missing A₀.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- Use PowerSeries.mk with coefficient zero equal to zero and coefficient n>0 equal to the existing A_n(f). Establish additivity and Z-linearity coefficientwise using native linearity of A_n and PowerSeries.ext.
- For each fixed coefficient, the map in f is either zero or the continuous linear functional A_n. The existing coefficientwise convergence criterion gives continuity of the assembled map. This is exactly the native AbstractMeasure carrier; no new definition of a generic measure or completed group algebra is needed.
- The projection formulas follow from coeff_mk. Extensionality of power series and of native continuous linear maps proves uniqueness. The algebraic and continuity API comes from this construction.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:AbstractMeasure
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto

**Acceptance**

- Construct the map using the actual native continuous-dual and PowerSeries types. Maintain zero only as the positive truncation boundary; retain the nonzero classical constant in the modular comparison.

**API**

- positiveEisensteinSeries_coeff: For n≥0, coefficient n of E⁺(f) is zero when n=0 and A_n(f) when n>0. This item is promoted to positive-eisenstein-series-coeff.
- positiveEisensteinSeries_coeff_zero: Coefficient zero of E⁺(f) is zero for every f.
- positiveEisensteinSeries_coeff_pos: For n>0, coefficient n of E⁺(f) is A_n(f).
- positiveEisensteinSeries_zero: E⁺(0)=0.
- positiveEisensteinSeries_add: E⁺(f+g)=E⁺(f)+E⁺(g).
- positiveEisensteinSeries_smul: E⁺(a f)=a E⁺(f) for a∈Z.
- positiveEisensteinSeries_continuous: E⁺:C(U,Z)→Z[[q]] is continuous for the compact-open and coefficientwise topologies.
- positiveEisensteinSeries_unique: Any native Z[[q]]-valued measure M with coefficient zero equal to zero and coefficient n equal to A_n on every test for every n>0 equals E⁺.

**Tests**

- SuggestedPositiveSeriesTests.zero_input: At p=2, E⁺(0)=0.
- SuggestedPositiveSeriesTests.constant_coefficient: At p=2 and every f∈C(U,Z), coefficient zero of E⁺(f) is zero.
- SuggestedPositiveSeriesTests.first_coefficient: At p=3, coefficient one of E⁺(f) is f(1).
- SuggestedPositiveSeriesTests.prime_coefficient: At p=3, coefficient three of E⁺(f) is f(1), so it need not vanish.
- SuggestedPositiveSeriesTests.dyadic_weight_four: At p=2, coefficient six of E⁺(x³) is 1³+3³=28.
- SuggestedPositiveSeriesTests.dyadic_series_precision: At p=2, the constant series 8 divides E⁺(x⁵)−E⁺(x).
- SuggestedPositiveSeriesTests.tame_congruence_insufficient: At p=5, the constant series 25 does not divide E⁺(x⁷)−E⁺(x³): coefficient two of the difference is 120.
- SuggestedPositiveSeriesTests.omitted_constant_is_nonzero: At p=2, the actual weight-four p-stabilized modular form has constant coefficient −7/240 in ℂ, while E⁺(x³) has constant coefficient zero in ℤ₂.

**Uses**

- RJW Theorem8.2(b): Packages all positive coefficient specializations in one actual continuous linear map, so its equality with the positive modular q-expansion can be stated as a series equality.
- RJW Remark8.3(1) and DirichletPadicLFunctions:L4: Uniform coefficient bounds and congruences make the positive-coefficient weight variation precise. The constant-term and tame-character extensions remain separate targets.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### Coefficients of the positive q-expansion

DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff

Declaration: DirichletPadic.positiveEisensteinSeries_coeff

Kind: lemma. Implementation: unchecked.

For every f∈C(U,Z) and n≥0, coefficient n of E⁺(f) equals zero for n=0, and equals A_n(f) for n>0.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- Unfold only the coefficient assembly and apply PowerSeries.coeff_mk. Split n=0 from n>0. The positive index passed to A_n carries the proof n>0.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-series
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- Use this promoted projection node in all later coefficient arguments; do not depend on an unlisted API item.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### Uniform bound for all q-coefficients

DirichletPadicLFunctions:L4/positive-eisenstein-series-bound

Declaration: DirichletPadic.positiveEisensteinSeries_coeff_norm_le

Kind: lemma. Implementation: unchecked.

For every f∈C(U,Z) and n≥0, |coeff_n(E⁺(f))|_p≤‖f‖∞. Thus all positive coefficients are bounded by the same constant.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- Apply positive-eisenstein-series-coeff. At n=0 use nonnegativity of the norm; at n>0 apply positive-eisenstein-evaluation-bound.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation-bound

**Acceptance**

- This is a coefficientwise inequality, with no assertion that the coefficientwise topology is a supremum-norm topology.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### Uniform test-function congruences

DirichletPadicLFunctions:L4/positive-eisenstein-series-test-congruence

Declaration: DirichletPadic.positiveEisensteinSeries_test_congr

Kind: lemma. Implementation: unchecked.

Let r≥0 and f,g∈C(U,Z). If pʳ divides f(u)−g(u) in Z for every u∈U, then the constant series C(pʳ) divides E⁺(f)−E⁺(g) in Z[[q]].

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- At positive degree use positive-eisenstein-series-coeff and positive-eisenstein-evaluation. Subtract the two finite sums. Every summand is divisible by pʳ by hypothesis, so Finset.dvd_sum gives divisibility of each coefficient. Degree zero vanishes.
- Choose a quotient coefficient b_n for each coefficient difference. Set B=PowerSeries.mk(b_n). PowerSeries.coeff_C_mul and PowerSeries.ext give E⁺(f)−E⁺(g)=C(pʳ)B. This elementary coefficientwise argument requires no continuity or uniform choice for the quotient coefficients.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
- DirichletPadicLFunctions:L4/positive-eisenstein-evaluation
- mathlib:Finset.dvd_sum
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.ext

**Acceptance**

- Allow r=0; then divisibility by one is automatic. The conclusion is in the actual integral power-series ring and has no unmentioned denominator.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### Weight congruences for the positive series

DirichletPadicLFunctions:L4/positive-eisenstein-series-weight-congruence

Declaration: DirichletPadic.positiveEisensteinSeries_weight_congr

Kind: theorem. Implementation: unchecked.

For r≥1 and e,e′≥0 with e≡e′ modulo p^(r−1)(p−1), C(pʳ) divides E⁺(x^e′)−E⁺(x^e) in Z[[q]]. This includes p=2. A classical weight k uses e=k−1.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- For n>0, the promoted coefficient formula reduces the assertion to positive-eisenstein-weight-congruence. The zero coefficient vanishes.
- Assemble quotient coefficients with PowerSeries.mk and conclude by coeff_C_mul and PowerSeries.ext, exactly as in the preceding divisibility argument. This uses the already planned all-prime moment congruence, and does not posit a topological generator of ℤ₂×.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
- DirichletPadicLFunctions:L4/positive-eisenstein-weight-congruence
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.ext

**Acceptance**

- At p=2,e=1,e′=5,r=3 obtain divisibility by8. At p=5,e=3,e′=7, coefficient two is120, divisible by5 but not25; congruence modulo p−1 alone cannot give the stronger precision.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### Invariance of coefficients under multiplication by p

DirichletPadicLFunctions:L4/positive-eisenstein-series-index-invariance

Declaration: DirichletPadic.positiveEisensteinSeries_coeff_mul_p

Kind: lemma. Implementation: unchecked.

For every n≥0 and f∈C(U,Z), coeff_(pn)(E⁺(f))=coeff_n(E⁺(f)).

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- At n=0 both sides are the same zero coefficient. At n>0, prime positivity implies pn>0. Apply positive-eisenstein-series-coeff twice and positive-eisenstein-remove-p.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
- DirichletPadicLFunctions:L4/positive-eisenstein-remove-p

**Acceptance**

- The q^p coefficient equals f(1), not zero. This coefficient identity introduces no generic U_p or Hecke operator.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### Joint integral series comparison with the modular form

DirichletPadicLFunctions:L4/positive-eisenstein-series-modular-comparison

Declaration: DirichletPadic.positiveEisensteinSeries_modular

Kind: comparison. Implementation: unchecked.

For even k≥4 there exists a unique Q∈ℤ[[q]] such that its coefficient map to ℂ equals the actual q-expansion of pStabilizedEisenstein(p,k) minus the constant series of that expansion’s constant coefficient, and its coefficient map to Z equals E⁺(x^(k−1)). Explicitly Q₀=0 and Q_n=Σ_{d∣n,p∤d}d^(k−1) for n>0.

**Hypotheses**

- p is any prime, including 2; Z=ℤ_p and U=Z× with their native topologies. A_n is the already planned positiveEisensteinMeasure for n>0.
- C(U,Z) has its compact-open topology and supremum norm. Z[[q]] has the existing coefficientwise topology PowerSeries.WithPiTopology; no norm on that power-series carrier is asserted.

**Construction or proof outline**

- For each positive degree take the unique common integer supplied by positive-eisenstein-modular-comparison. Set degree zero to zero and use PowerSeries.mk to assemble these integers into Q. The supplier identifies each positive coefficient with the displayed divisor sum.
- For the complex comparison, apply PowerSeries.coeff_map and PowerSeries.ext. At degree zero subtraction of the constant series gives zero; at every positive degree coeff_C_of_ne_zero vanishes and the existing common-integer comparison supplies equality.
- For the p-adic comparison, use positive-eisenstein-series-coeff and the other equality from the same integer comparison; again degree zero is zero. Injectivity of the integer embedding into ℂ and PowerSeries.map_injective give uniqueness.
- The removed coefficient is the actual rational zeta constant from p-stabilized-zeta-constant. This theorem compares whole positive power series through ℤ; it does not postulate an embedding of ℂ into a p-adic field and does not supply the missing twisted localized constant coefficient.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
- DirichletPadicLFunctions:L4/positive-eisenstein-modular-comparison
- DirichletPadicLFunctions:L4/p-stabilized-zeta-constant
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_zero_C
- mathlib:PowerSeries.coeff_C_of_ne_zero
- mathlib:PowerSeries.map_injective

**Acceptance**

- At p=2,k=4 the omitted constant is−7/240, while Q₆=28. No equality with the full untruncated modular expansion is asserted.

**Sources**

- RJW-published, §8, Definition 8.1, Theorem 8.2 and Remark 8.3(1), printed159–160 / PDF60–61; fresh reading 27 September2026.. The positive Dirac coefficients and exponent k−1 are explicit in the source. Their assembly into a native continuous linear map, the uniform coefficient bounds and series divisibility are worker deductions. The actual twisted localized constant coefficient and the geometric weight family remain outside this positive-part adapter.

### The shifted Eisenstein clearing denominator

DirichletPadicLFunctions:L4/twisted-eisenstein-denominator

Declaration: DirichletPadic.eisensteinTwistedDenominator

Kind: construction. Implementation: unchecked.

For u∈U define d_u=(u:Z)•δ_u−δ_1 in the existing integral convolution algebra M.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Use the existing Dirac measure, scalar action and subtraction. The unit of the supplied convolution ring is δ_1, not a constant measure on the additive p-adic integers.
- Evaluate at an arbitrary continuous f to obtain d_u(f)=(u:Z)f(u)−f(1). This gives d_1=0 and the mass (u:Z)−1.
- The ordinary moment formula is promoted to the following node before its use for regularity. At the canonical a=p+1, the mass is p, although the denominator will be regular.

**Prerequisites**

- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
- mathlib:AbstractMeasure.dirac
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The shift changes δ_u−1 to uδ_u−1. The coefficient u is indispensable. No claim that d_a is an integral unit is made.

**API**

- DirichletPadic.eisensteinTwistedDenominator_def: d_u=(u:Z)•δ_u−1 in M.
- DirichletPadic.eisensteinTwistedDenominator_apply: For f∈C(U,Z), d_u(f)=(u:Z)f(u)−f(1).
- DirichletPadic.eisensteinTwistedDenominator_one: d_1=0.
- DirichletPadic.eisensteinTwistedDenominator_moment: d_u(j^k)=(u:Z)^(k+1)−1 for all k≥0. Promoted to twisted-eisenstein-denominator-moment.

**Tests**

- SuggestedLocalizedEisensteinTests.denominator_identity: The identity parameter has d_1=0.
- SuggestedLocalizedEisensteinTests.denominator_zero_test: Every shifted denominator vanishes on the zero test.
- SuggestedLocalizedEisensteinTests.denominator_mass_shift: For a with value p+1, d_a(1)=p.

**Uses**

- RJW Theorem8.2 proof, corrected by E54: The x-twist of the arithmetic clearing factor has this shifted denominator.
- Localized Eisenstein constant below: Twice the canonical shifted denominator is the actual regular denominator.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### Moments of the shifted denominator

DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment

Declaration: DirichletPadic.eisensteinTwistedDenominator_moment

Kind: lemma. Implementation: unchecked.

For every u∈U and k≥0, d_u(j^k)=(u:Z)^(k+1)−1.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Insert f=j^k into the preceding all-test evaluation, or unfold the finite two-Dirac expression and apply native dirac_apply directly.
- The unit coordinate is multiplicative and takes1 to1. Combine u·u^k=u^(k+1). This includes k=0; no positive-weight hypothesis is needed.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The denominator for a weight-k Eisenstein specialization is a^k−1 because the test exponent is k−1.

**Tests**

- SuggestedLocalizedEisensteinTests.denominator_dyadic_first: At p=2,a=3 the first moment of d_a is8.
- SuggestedLocalizedEisensteinTests.denominator_dyadic_cubic: At p=2,a=3 the cubic moment is80.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### A regular doubled Eisenstein denominator

DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-regular

Declaration: DirichletPadic.eisensteinTwistedDenominator_double_regular

Kind: lemma. Implementation: unchecked.

For a∈U with underlying value p+1, 2d_a belongs to native nonZeroDivisors M.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.
- a has value p+1; no topological-generator hypothesis is imposed, including at p=2.

**Construction or proof outline**

- The supplied one-add-prime positive-power theorem gives a^(k+1)≠1 for every k≥0 in Z.
- Use the preceding moment formula and linearity: (2d_a)(j^k)=2(a^(k+1)−1). Multiplication by2 in the measure ring is addition twice and has the same action on tests as Z-scalar multiplication by2.
- Characteristic zero and the domain structure of native Z imply this value is nonzero. Apply the existing unit-moment-regularity criterion to the positive k. The proof does not infer that2 or d_a is an integral unit.
- Native localization therefore makes the displayed denominator invertible. The dyadic nonunit control explicitly retains the distinction between being regular and being a unit in Z.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-positive-powers
- PadicMeasuresIwasawaAlgebras:L3/unit-moment-regularity

**Acceptance**

- No coefficient inverse of2 in Z_2 and no integral half-measure are introduced.

**Tests**

- SuggestedLocalizedEisensteinTests.regular_dyadic_double: The denominator2d_3 is regular in the actual dyadic unit-measure ring.
- SuggestedLocalizedEisensteinTests.regular_is_not_integral_division: 2 is not a unit in Z_2.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### The integral numerator for the Eisenstein constant

DirichletPadicLFunctions:L4/weighted-eisenstein-numerator

Declaration: DirichletPadic.eisensteinWeightedNumerator

Kind: construction. Implementation: unchecked.

For u∈U define n_u=weight(j)(λ_u) in the existing integral unit-measure module M.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Apply the existing PMIA weight linear map to the actual all-unit arithmetic numerator. This defines an integral measure without division or a new carrier.
- The supplied weight-evaluation theorem gives n_u(f)=λ_u(jf) for every f. The identity and negative-identity parameters give zero because the existing λ_1 and λ_−1 are zero.
- The shift from test exponent k to k+1 in λ_u is promoted to the following Bernoulli-moment node. No ring-homomorphism property of the generic weight map is assumed.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-numerator
- PadicMeasuresIwasawaAlgebras:L2/weight
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation
- mathlib:Units.continuous_val
- DirichletPadicLFunctions:L1/padic-intrinsic-identity
- DirichletPadicLFunctions:L1/padic-intrinsic-negative-identity

**Acceptance**

- The actual numerator is integral for every unit u. Twisting the total quotient remains a separate comparison.

**API**

- DirichletPadic.eisensteinWeightedNumerator_def: n_u=weight(j)(padicIntrinsicNumerator p u).
- DirichletPadic.eisensteinWeightedNumerator_apply: n_u(f)=λ_u(jf) for all f∈C(U,Z).
- DirichletPadic.eisensteinWeightedNumerator_one: n_1=0.
- DirichletPadic.eisensteinWeightedNumerator_neg_one: n_−1=0.
- DirichletPadic.eisensteinWeightedNumerator_moment: Its k-th moment is the (k+1)-st λ moment. Promoted to weighted-eisenstein-numerator-moment.

**Tests**

- SuggestedLocalizedEisensteinTests.numerator_identity: n_1=0.
- SuggestedLocalizedEisensteinTests.numerator_negative_identity: n_−1=0, including p=2.
- SuggestedLocalizedEisensteinTests.numerator_all_tests: The value on every continuous unit test is λ_u(jf).

**Uses**

- RJW Theorem8.2 proof: Weighting by x produces the numerator for the source constant.
- Localized Eisenstein constant: This actual integral measure is the numerator of the native fraction.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### Bernoulli moments with the Eisenstein shift

DirichletPadicLFunctions:L4/weighted-eisenstein-numerator-moment

Declaration: DirichletPadic.eisensteinWeightedNumerator_moment

Kind: lemma. Implementation: unchecked.

For u∈U and every k≥0, the Q_p image of n_u(j^k) is (1−p^k)(1−u^(k+1))·ι_Q(B_(k+1)/(k+1)).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Expand weight evaluation and identify j·j^k with j^(k+1) by pointwise equality of continuous maps.
- Apply the existing all-unit intrinsic moment theorem at k+1≥1. Simplify (k+1)−1=k. The Bernoulli number and division are first taken over Q and only then mapped into Q_p.
- For k=0 the Euler factor vanishes, so every numerator has mass0. For even positive k the odd Bernoulli number vanishes. At p=2,a=3, the first and cubic moments are2/3 and−14/3.

**Prerequisites**

- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- DirichletPadicLFunctions:L1/padic-intrinsic-moments
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation

**Acceptance**

- This is an equality of actual measure moments, not an evaluation map on arbitrary elements of Q.

**Tests**

- SuggestedLocalizedEisensteinTests.numerator_mass_zero: Every n_u has mass0, including nontrivial u.
- SuggestedLocalizedEisensteinTests.numerator_dyadic_first: At p=2,a=3 the Q_2 image of the first moment is2/3.
- SuggestedLocalizedEisensteinTests.numerator_dyadic_cubic: At p=2,a=3 the cubic moment includes as−14/3.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### The Eisenstein constant in the total quotient

DirichletPadicLFunctions:L4/localized-eisenstein-constant

Declaration: DirichletPadic.localizedEisensteinConstant

Kind: construction. Implementation: unchecked.

Choose the unique a∈U whose value is p+1 and define A₀=mk′_Q(n_a,2d_a) in the existing total quotient Q.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- The supplier provides existence of a with value p+1. Unit extensionality makes a unique; use the existing unit subtype and classical choice, not a new generator structure.
- The doubled shifted-denominator regularity theorem supplies the native denominator subtype required by IsLocalization.mk′. Its numerator is the preceding integral n_a.
- Every representative a with the same underlying value is equal by unit extensionality; proof irrelevance removes dependence on the regularity certificate. The fraction API therefore holds for every such a.
- The defining clearing equality and uniqueness are promoted to the next node. The zero constant in the old positive Eisenstein series is still a truncation convention; this new A₀ has its own native localized carrier.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-regular
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- PadicMeasuresIwasawaAlgebras:L1/commutative-convolution
- mathlib:IsLocalization.mk'
- mathlib:IsLocalization.eq_mk'_iff_mul_eq

**Acceptance**

- No ordinary pseudomeasure membership, field structure on Q, chosen half in Z, or canonical evaluation of all fractions is asserted.

**API**

- DirichletPadic.localizedEisensteinConstant_eq_fraction: A₀=mk′_Q(n_a,2d_a) for every a with value p+1.
- DirichletPadic.localizedEisensteinConstant_clearing: 2i(d_a)A₀=i(n_a). Promoted to localized-eisenstein-clearing.
- DirichletPadic.localizedEisensteinConstant_unique: This clearing identity uniquely specifies A₀ in Q, since its denominator is regular.

**Tests**

- SuggestedLocalizedEisensteinTests.constant_fraction_canonical: For every a with value p+1, the native fraction with numerator n_a and denominator2d_a equals A₀.
- SuggestedLocalizedEisensteinTests.constant_representative_independent: Two native unit representatives with underlying value p+1 give the same fraction.
- SuggestedLocalizedEisensteinTests.constant_clearing_unique: A total-quotient element satisfying the displayed clearing equation equals A₀.

**Uses**

- RJW Theorem8.2, corrected constant coefficient: Supplies an actual localized candidate with the required shifted numerator and denominator.
- The positive Eisenstein family: Provides the missing constant carrier before its admissible coefficientwise specialization and full-series assembly.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### Clearing the localized Eisenstein denominator

DirichletPadicLFunctions:L4/localized-eisenstein-clearing

Declaration: DirichletPadic.localizedEisensteinConstant_clearing

Kind: lemma. Implementation: unchecked.

For every a∈U with value p+1, 2i(d_a)A₀=i(n_a) in Q, and this equality determines A₀ uniquely.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.

**Construction or proof outline**

- Substitute the defining native fraction and apply IsLocalization.mk′_spec′. The canonical ring map sends2d_a to2i(d_a).
- For any competing z, rewrite its clearing equation in the form of the native eq_mk′_iff_mul_eq. The denominator carries its exact non-zero-divisor certificate, so no domain cancellation assumption is needed.
- Two complete native proofs check clearing and uniqueness for an arbitrary commutative ring with regular denominator2d, exercising exactly the total-quotient API used here.

**Prerequisites**

- DirichletPadicLFunctions:L4/localized-eisenstein-constant
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.eq_mk'_iff_mul_eq

**Acceptance**

- The factor2 remains visible even at odd p; its removal requires an explicitly justified inverse.

**Tests**

- SuggestedLocalizedEisensteinTests.clearing_keeps_two: The clearing equation can equivalently be written i(2d_a)A₀=i(n_a).

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### Comparison with an actual character-twist equivalence

DirichletPadicLFunctions:L4/localized-eisenstein-twist-comparison

Declaration: DirichletPadic.localizedEisensteinConstant_double_twist

Kind: comparison. Implementation: unchecked.

Given an actual ring equivalence T:M≃+*M satisfying T(μ)=weight(j)(μ) for every μ, let T_Q be its native FractionRing extension. Then 2A₀=T_Q(ζ_p) in Q.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z with the supplied actual convolution ring and its commutativity theorem. Q is the native FractionRing M, the total quotient ring of a commutative ring, with its canonical injection i. No domain or field structure on M or Q is assumed.
- j∈C(U,Z) is the existing continuous unit coordinate. λ_u=padicIntrinsicNumerator p u is the existing all-unit integral arithmetic numerator. The notation for scalar multiplication in M is the native Z-module structure.
- T is the displayed bundled ring equivalence with its all-measure agreement. Its existence is the new precise PMIA L3 request, not an implicit consequence of the linear weighting operation. ζ_p is the existing actual arithmetic pseudomeasure, included in Q.

**Construction or proof outline**

- Use the existing arithmetic-pseudomeasure regular-parameter formula at a=p+1. Its denominator δ_a−1 is regular by the supplied positive-moment theorem.
- The hypothesis on T identifies T(λ_a)=n_a. On δ_a−1, all-test weight evaluation and native Dirac evaluation identify T(δ_a−1)=d_a; preservation of1 follows from the actual ring-equivalence structure.
- Extend T by the native IsFractionRing.ringEquivOfRingEquiv, whose algebraMap formula is read at the pin. Apply this ring map to the original clearing equality to obtain i(d_a)T_Q(ζ_p)=i(n_a).
- The image of the old regular denominator is a unit in Q, because the extension is an actual ring equivalence. Compare with 2i(d_a)A₀=i(n_a) and cancel this unit. A complete native arbitrary-commutative-ring proof checks this argument.
- Retain the identity2A₀=T_Q(ζ_p) at all primes. It expresses the corrected source normalization without assuming an integral half or that T_Q preserves the ordinary pseudomeasure submodule. The pole shifts to the inverse coordinate character; admissible evaluation on the localized constant still needs its own construction.

**Prerequisites**

- DirichletPadicLFunctions:L4/localized-eisenstein-clearing
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-regular-parameter
- PadicMeasuresIwasawaAlgebras:L3/regular-one-add-prime-difference
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation
- mathlib:AbstractMeasure.dirac_apply
- mathlib:IsFractionRing.ringEquivOfRingEquiv
- mathlib:IsFractionRing.ringEquivOfRingEquiv_algebraMap
- mathlib:IsLocalization.map_units
- mathlib:IsUnit.mul_right_inj
- PadicMeasuresIwasawaAlgebras:L3

**Acceptance**

- The supplied object must be a ring equivalence on the actual M. An arbitrary map, linear weight or character functional is not substituted for it. No homomorphism from all of Q to a coefficient field is claimed.

**Tests**

- SuggestedLocalizedEisensteinTests.conditional_twist_keeps_two: For an actual T with the required action,2A₀ is its native total-quotient image of ζ_p.

**Sources**

- RJW-published, Definition3.34 and formula(3-11), published129–130 / PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160 / PDF60–61. Complete pages freshly read 29 September2026. Theorem8.2(a) is used with the independently confirmed correction PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E54.. Worker construction on the actual integral unit-measure algebra and its native total quotient. Weighting the arithmetic numerator by the coordinate shifts the clearing denominator to uδ_u−1. The factor2 stays in the regular denominator, including for p=2. Comparison with the source character twist is conditional on its owning roadmap supplying the actual ring equivalence; no ordinary pseudomeasure membership or arbitrary fraction evaluation is asserted.

### The arithmetic moment ring homomorphism

DirichletPadicLFunctions:L4/eisenstein-moment-hom

Declaration: DirichletPadic.eisensteinMomentHom

Kind: construction. Implementation: unchecked.

For k≥0 define f_k:M→+*Q_p by composing the supplied characterIntegralAlgHom at κ_(0,1,k):U→Z with the native inclusion Z→Q_p.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.

**Construction or proof outline**

- Use the actual arithmetic coordinate character at level0 and the supplied matching-coefficient characterIntegralAlgHom. Forget its algebra structure to a ring homomorphism, then compose with algebraMap Z Q_p.
- The promoted level-zero character formula identifies its test with j^k pointwise. The all-measure evaluation formula is promoted to the next node.
- Native Dirac evaluation gives f_k(δ_u)=u^k. At k=0 the test is1 and this is the ordinary total-mass ring map on integral measures. No extension to Q is made.

**Prerequisites**

- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
- mathlib:PadicInt.algebraMap_apply
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- This concrete arithmetic composite uses the existing general character-integration API; it does not replan a generic coefficient-extension functor.

**API**

- DirichletPadic.eisensteinMomentHom_def: f_k is algebraMap Z Q_p composed with the ring homomorphism underlying characterIntegralAlgHom κ_(0,1,k).
- DirichletPadic.eisensteinMomentHom_apply: f_k(μ)=ι(μ(j^k)) for all μ. Promoted to eisenstein-moment-hom-evaluation.
- DirichletPadic.eisensteinMomentHom_dirac: f_k(δ_u)=u^k.
- DirichletPadic.eisensteinMomentHom_zero_weight: f_0(μ)=ι(μ(1)).

**Tests**

- SuggestedEisensteinAwayTests.moment_zero_is_mass: f_0(μ) is the Q_p image of μ(1).
- SuggestedEisensteinAwayTests.moment_identity_atom: f_k(δ_1)=1 for every k.
- SuggestedEisensteinAwayTests.moment_sign_atom: f_k(δ_−1)=(-1)^k, including dyadic coefficients.

**Uses**

- RJW Theorem8.2(b): The evaluation test for weightw is j^(w−1).
- Admissible denominator localization: This actual ring map supplies the native localization lift after its denominator image is proved nonzero.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### Evaluation of the arithmetic moment map

DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation

Declaration: DirichletPadic.eisensteinMomentHom_apply

Kind: lemma. Implementation: unchecked.

For every k≥0 and actual integral unit measure μ, f_k(μ)=ι(μ(j^k)).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.

**Construction or proof outline**

- Unfold the arithmetic composite. The supplied character-integral construction has underlying map μ↦μ(κ.toContinuousMap).
- Use the promoted level-zero formula and continuous-map extensionality to replace the test by j^k. The native coefficient map is precisely the canonical p-adic inclusion.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-moment-hom
- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- The formula is on integral measures, before any localization.

**Tests**

- SuggestedEisensteinAwayTests.moment_arbitrary_integral_test: The formula holds for an arbitrary actual μ and every k, including0.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### Admissibility of every nonnegative moment

DirichletPadicLFunctions:L4/eisenstein-moment-denominator

Declaration: DirichletPadic.eisensteinMomentHom_denominator_ne_zero

Kind: lemma. Implementation: unchecked.

For a∈U with value p+1 and every k≥0, f_k(Δ_a)=2(a^(k+1)−1) is nonzero in Q_p.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.
- The canonical parameter condition a=p+1 is required. The map f_k alone is defined on all integral measures.

**Construction or proof outline**

- Apply the exact all-measure evaluation to Δ_a. Multiplication by2 in the measure ring is addition twice, so evaluation is twice the moment of d_a.
- The preceding shifted-denominator moment formula gives2(a^(k+1)−1). The supplied one-add-prime positive-power theorem makes a^(k+1)−1 nonzero in Z.
- Native PadicInt.coe_ne_zero transports nonvanishing to Q_p. Characteristic zero gives2≠0, and the field has no zero divisors. This includes k=0, when the value is2p.
- Use native isUnit_iff_ne_zero only in Q_p to obtain the unit required by Away.lift. Nothing implies this denominator is a unit in Z.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-positive-powers
- mathlib:PadicInt.coe_ne_zero
- mathlib:isUnit_iff_ne_zero

**Acceptance**

- An inverse-coordinate test would instead give2(a·a⁻¹−1)=0, so that test is outside this lift. The finite negative control records this obstruction without claiming a pole theorem.

**Tests**

- SuggestedEisensteinAwayTests.denominator_mass_nonzero: At k=0 the denominator image is2p.
- SuggestedEisensteinAwayTests.denominator_dyadic_fourth_weight: At p=2,a=3,k=3 the denominator image is160, nonzero in Q_2.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### The constant in its denominator localization

DirichletPadicLFunctions:L4/eisenstein-away-constant

Declaration: DirichletPadic.eisensteinAwayConstant

Kind: construction. Implementation: unchecked.

For each u∈U define A₀,u^away=mk′_(S_u)(n_u,Δ_u), using Δ_u∈Submonoid.powers(Δ_u).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.

**Construction or proof outline**

- Use the existing Localization.Away carrier, with its native commutative-ring and algebra instances. Its denominator certificate is native Submonoid.mem_powers.
- The localization defining relation gives alg(Δ_u)A₀,u^away=alg(n_u); the native fraction equality criterion gives uniqueness. No regularity hypothesis is needed to form this localization.
- The value u=1 is an intentional non-example for specialization: d_1=0 directly from its two-Dirac definition, and localizing at0 collapses the ring. The map to the intended total quotient and all evaluations therefore impose the canonical a=p+1 condition.

**Prerequisites**

- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- mathlib:Localization.Away
- mathlib:Submonoid.mem_powers
- mathlib:IsLocalization.mk'
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.eq_mk'_iff_mul_eq

**Acceptance**

- The carrier is Mathlib Localization.Away. The constructor does not postulate a field or a second measure algebra.

**API**

- DirichletPadic.eisensteinAwayConstant_def: A₀,u^away=mk′_(S_u)(n_u,Δ_u).
- DirichletPadic.eisensteinAwayConstant_clearing: alg(Δ_u)A₀,u^away=alg(n_u) in S_u.
- DirichletPadic.eisensteinAwayConstant_unique: Every element with this clearing equation equals A₀,u^away.

**Tests**

- SuggestedEisensteinAwayTests.away_fraction_definition: The representative is exactly the native localization fraction with numerator n_u and denominator Δ_u.
- SuggestedEisensteinAwayTests.away_clearing_characterizes: The displayed clearing equation determines the element in S_u.
- SuggestedEisensteinAwayTests.identity_parameter_collapses_localization: For u=1, the denominator localization has0=1; this parameter cannot define an admissible field specialization.

**Uses**

- Admissible Eisenstein evaluation: Gives an actual element in the domain of the denominator-localized evaluator.
- Comparison to the total quotient: Its native localization image is the existing A₀; it is not a renamed arbitrary total fraction.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### Embedding the denominator localization

DirichletPadicLFunctions:L4/eisenstein-away-inclusion

Declaration: DirichletPadic.eisensteinAwayToFraction

Kind: construction. Implementation: unchecked.

For a with value p+1 define J_a:S_a→+*Q by native Away.lift of the canonical map i:M→Q. The resulting ring map is injective.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.
- a has value p+1. The previous regularity theorem places Δ_a in nonZeroDivisors M.

**Construction or proof outline**

- Native IsLocalization.map_units makes i(Δ_a) a unit in Q. Apply Away.lift and retain its exact coefficient agreement J_a(alg μ)=i(μ).
- For injectivity use the native criterion injective_iff_map_algebraMap_eq on the powers submonoid. An equality of original coefficients in S_a maps to an equality in Q; conversely an equality in Q gives equality in M by native IsFractionRing.injective and then equality in S_a.
- The constant-image API is promoted to the following node. The complete native probe checks the map and injection for an arbitrary commutative ring with a regular denominator.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-regular
- mathlib:IsLocalization.Away.lift
- mathlib:IsLocalization.Away.lift_eq
- mathlib:IsLocalization.map_units
- mathlib:IsLocalization.injective_iff_map_algebraMap_eq
- mathlib:IsFractionRing.injective

**Acceptance**

- The existence and injectivity hold without M being a domain or Q being a field.

**API**

- DirichletPadic.eisensteinAwayToFraction_def: J_a is the native Away.lift of i using the exact regularity certificate.
- DirichletPadic.eisensteinAwayToFraction_algebraMap: J_a(alg μ)=i(μ).
- DirichletPadic.eisensteinAwayToFraction_injective: J_a is injective.
- DirichletPadic.eisensteinAwayToFraction_constant: J_a(A₀,a^away)=A₀. Promoted to eisenstein-away-constant-image.

**Tests**

- SuggestedEisensteinAwayTests.inclusion_integral_numerator: J_a sends the included arithmetic numerator to its canonical total-quotient image.
- SuggestedEisensteinAwayTests.inclusion_detects_equality: J_a(x)=J_a(y) if and only if x=y.
- SuggestedEisensteinAwayTests.inclusion_unit: J_a preserves1.

**Uses**

- The existing localized Eisenstein constant: Identifies the admissible representative with that exact total-quotient element.
- Uniqueness of admissible representatives: Ensures the localized representative is uniquely determined by its image in Q.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### The actual total-quotient image of the constant

DirichletPadicLFunctions:L4/eisenstein-away-constant-image

Declaration: DirichletPadic.eisensteinAwayToFraction_constant

Kind: lemma. Implementation: unchecked.

For canonical a, J_a(A₀,a^away)=localizedEisensteinConstant p.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.

**Construction or proof outline**

- Apply J_a to the defining fraction or its clearing relation. Native Away.lift_eq identifies the numerator and denominator images.
- Use the existing localized-eisenstein-clearing uniqueness theorem to identify the result with A₀. The factor2 is part of Δ_a throughout.
- The complete native fraction-image lemma checks the same argument using eq_mk′_iff_mul_eq for arbitrary commutative rings.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-inclusion
- DirichletPadicLFunctions:L4/eisenstein-away-constant
- DirichletPadicLFunctions:L4/localized-eisenstein-clearing
- mathlib:IsLocalization.Away.lift_eq
- mathlib:IsLocalization.eq_mk'_iff_mul_eq

**Acceptance**

- Admissible evaluation below is attached to this actual representative; no map on all of Q is inferred.

**Tests**

- SuggestedEisensteinAwayTests.inclusion_is_actual_constant: The image is the existing A₀ in FractionRing M, not a newly postulated symbol.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### The admissible moment evaluator

DirichletPadicLFunctions:L4/eisenstein-away-evaluation

Declaration: DirichletPadic.eisensteinAwayMoment

Kind: construction. Implementation: unchecked.

For canonical a and k≥0 define E_(a,k):S_a→+*Q_p by native Away.lift of f_k, using f_k(Δ_a)≠0. It is the unique ring map extending f_k.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.

**Construction or proof outline**

- The denominator-nonvanishing node and native isUnit_iff_ne_zero provide the exact unit hypothesis. Apply Away.lift on S_a, not on Q.
- Its coefficient agreement gives E_(a,k)(alg μ)=ι(μ(j^k)), using the promoted all-measure moment evaluation.
- For any other ring map F with the same agreement on every original μ, use the native localization lift_unique theorem. Thus the extension is unique on its displayed domain.
- The constant-value API is promoted to the following theorem. This construction uses only the matching-coefficient character homomorphism followed by Z→Q_p, so it does not discharge either earlier general PMIA coefficient-field or twist request.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-moment-denominator
- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- mathlib:IsLocalization.Away.lift
- mathlib:IsLocalization.Away.lift_eq
- mathlib:IsLocalization.lift_unique
- mathlib:isUnit_iff_ne_zero

**Acceptance**

- The evaluator domain remains S_a. Inverting unrelated regular elements would need new unit-image hypotheses and is not done.

**API**

- DirichletPadic.eisensteinAwayMoment_def: E_(a,k)=Away.lift(Δ_a,f_k) with the proved unit image.
- DirichletPadic.eisensteinAwayMoment_algebraMap: E_(a,k)(alg μ)=ι(μ(j^k)).
- DirichletPadic.eisensteinAwayMoment_unique: Any ring map extending f_k is E_(a,k).
- DirichletPadic.eisensteinAwayMoment_constant: E_(a,k)(A₀,a^away)=ι_Q(−(1−p^k)B_(k+1)/(2(k+1))). Promoted to eisenstein-away-constant-value.

**Tests**

- SuggestedEisensteinAwayTests.evaluator_integral_measure: For every actual μ the evaluator agrees with its included k-th moment.
- SuggestedEisensteinAwayTests.evaluator_unit: E_(a,k)(1)=1.
- SuggestedEisensteinAwayTests.evaluator_unique_extension: The all-coefficient agreement uniquely determines the ring map on S_a.

**Uses**

- RJW Theorem8.2(b): Provides a genuine evaluator for the constant at each required arithmetic test.
- Full coefficientwise family comparison: The ring structure will permit coefficientwise specialization of a native power series over S_a.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### The admissible Bernoulli constant value

DirichletPadicLFunctions:L4/eisenstein-away-constant-value

Declaration: DirichletPadic.eisensteinAwayMoment_constant

Kind: theorem. Implementation: unchecked.

For every k≥0, E_(a,k)(A₀,a^away)=ι_Q(−(1−p^k)B_(k+1)/(2(k+1))).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.

**Construction or proof outline**

- Apply the evaluator to the localization fraction. Map its clearing relation and divide only by the already proved nonzero value f_k(Δ_a). A complete native proof obtains the fraction value f_k(n_a)/f_k(Δ_a).
- The exact weighted-numerator moment is (1−p^k)(1−a^(k+1))ι_Q(B_(k+1)/(k+1)); the shifted denominator moment is2(a^(k+1)−1). Cancel the nonzero factor a^(k+1)−1, retaining the minus sign and the factor2.
- The remaining rational expression maps naturally into Q_p. The native field proof checks the sign and factor2 cancellation without replacing any denominator by a unit in Z.
- At k=0 the Euler factor gives0. Even positive k give the odd-weight Bernoulli zeros. At p=2,k=3 the value is−7/240, which need not lie in Z_2.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-evaluation
- DirichletPadicLFunctions:L4/eisenstein-away-constant
- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- DirichletPadicLFunctions:L4/eisenstein-moment-denominator
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator-moment
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.Away.lift_eq
- mathlib:eq_div_iff_mul_eq

**Acceptance**

- This is a value of an actual ring map on the denominator-localized representative whose image is A₀. It does not assert an integral constant measure.

**Tests**

- SuggestedEisensteinAwayTests.constant_zero_exponent: At test exponent0 the actual admissible value is0.
- SuggestedEisensteinAwayTests.constant_dyadic_weight_four: At p=2,test exponent3, the value is−7/240 in Q_2.
- SuggestedEisensteinAwayTests.constant_odd_weight_three: At test exponent2 the value vanishes for every p.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### The common classical and arithmetic Eisenstein constant

DirichletPadicLFunctions:L4/eisenstein-away-classical-constant

Declaration: DirichletPadic.eisensteinAwayConstant_classical

Kind: comparison. Implementation: unchecked.

For even w≥4 let c=−(1−p^(w−1))B_w/(2w)∈Q. Then E_(a,w−1)(A₀,a^away)=ι_Qp(c) and the constant coefficient of the existing classical pStabilizedEisenstein p w is ι_C(c).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing topologies and supplied actual commutative convolution algebra. Q=FractionRing M is the native total quotient, not an assumed field.
- j∈C(U,Z) is the unit coordinate. Use the existing d_a=eisensteinTwistedDenominator p a and n_a=eisensteinWeightedNumerator p a. Write Δ_a=2d_a and S_a=Localization.Away(Δ_a), the existing localization at the submonoid of powers of Δ_a. The notation does not define another carrier.
- w is an even natural number with w≥4. The classical object is the existing native modular form at Γ_0(p), with the period-one UpperHalfPlane.qExpansion. No identification or embedding between C and Q_p is used.

**Construction or proof outline**

- Apply the preceding admissible value theorem at test exponent w−1. Since w≥4, its Bernoulli index (w−1)+1 equals w.
- Use the existing p-stabilized-zeta-constant theorem for the actual classical modular form. Its rational constant is exactly c, with the factor2 and Euler factor retained.
- Keep the two equalities as images of the same rational element. The separate constant-image node identifies the arithmetic representative with the already constructed element of Q.
- The dyadic and ternary weight-four controls give−7/240 and−13/120 in both respective coefficient fields. This is the constant comparison; whole-series assembly and the generic twist equivalence remain separate work.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-constant-value
- DirichletPadicLFunctions:L4/eisenstein-away-constant-image
- DirichletPadicLFunctions:L4/p-stabilized-zeta-constant

**Acceptance**

- Classical modularity is claimed only for the existing even-weight w≥4 object. The extra arithmetic values at small weights are not promoted to classical modular forms.

**Tests**

- SuggestedEisensteinAwayTests.common_dyadic_classical_constant: At p=2,w=4 both values are the separate images of−7/240.
- SuggestedEisensteinAwayTests.common_ternary_classical_constant: At p=3,w=4 both values are the separate images of−13/120.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2(b) with its proof, published159–160/PDF60–61. Complete pages read29September2026 in the immediately preceding checkpoint. The confirmed E54 correction to part(a) is retained.. Worker admissible-localization construction for the corrected Eisenstein constant. The native localization inverts only its explicit doubled shifted denominator. The existing coordinate character and supplied character-integral algebra homomorphism define the moment map, whose denominator is proved nonzero. The same rational Bernoulli constant is embedded separately into Q_p and C. Generic localizations, measures, convolution and modular forms are reused; no total-quotient field evaluator or ordinary pseudomeasure membership is asserted.

### Integral coefficients under admissible evaluation

DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation

Declaration: DirichletPadic.eisensteinAwayMoment_algebraMap

Kind: lemma. Implementation: unchecked.

For canonical a, k≥0 and every actual μ∈M, E_(a,k)(alg μ)=ι(μ(j^k)).

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- Promote the existing all-integral-coefficient API of the admissible evaluator, keeping its suggested signature unchanged.
- Unfold the existing native Away.lift and use its coefficient agreement. The already promoted ordinary moment-map evaluation identifies its value with the included integral moment.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-evaluation
- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- mathlib:IsLocalization.Away.lift_eq

**Acceptance**

- A coefficient in the localization is distinguished from its original integral measure, and the evaluator is not applied to all of Q.

**Tests**

- SuggestedFullEisensteinTests.integral_coefficient_evaluator: The equality holds for every actual integral measure, at all nonnegative test exponents.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### The full Eisenstein series over the denominator localization

DirichletPadicLFunctions:L4/full-eisenstein-away-series

Declaration: DirichletPadic.eisensteinAwaySeries

Kind: construction. Implementation: unchecked.

Define E_u^away∈S_u[[q]] by coefficient0 equal to A₀,u^away and coefficient n>0 equal to alg(A_n).

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- Use native PowerSeries.mk on the coefficient function which branches on0<n. The positive case supplies the native positive natural index to the existing coefficient measure; degree0 uses the preceding actual away-localized constant.
- Native coeff_mk yields both coefficient APIs. Equality of series follows from native PowerSeries.ext, splitting the natural index into0 and a positive natural. No summability or convergence claim is needed for a formal power series.
- The all-index coefficient formula is promoted to the next node for the image and specialization proofs. The first coefficient is1 because A_1 is the unit Dirac measure; this follows directly from its one-divisor construction.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-constant
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext

**Acceptance**

- The positive truncation is no longer substituted for the full source series. This is a native formal power series, without a claim of affinoid realization.

**API**

- DirichletPadic.eisensteinAwaySeries_coeff: Coefficient n is alg(A_n) when0<n and A₀,u^away otherwise. Promoted to full-eisenstein-away-coefficients.
- DirichletPadic.eisensteinAwaySeries_coeff_zero: Coefficient0 equals A₀,u^away.
- DirichletPadic.eisensteinAwaySeries_coeff_pos: For n∈N+, coefficient n equals alg(A_n).
- DirichletPadic.eisensteinAwaySeries_unique: The displayed constant and all positive coefficients uniquely determine E_u^away.

**Tests**

- SuggestedFullEisensteinTests.away_constant_coefficient: Degree0 is exactly the actual localized constant A₀,u^away.
- SuggestedFullEisensteinTests.away_first_coefficient: The coefficient of q is1 in S_u.
- SuggestedFullEisensteinTests.away_positive_coefficient: Each positive coefficient is the canonical image of the existing A_n.

**Uses**

- RJW Theorem8.2: Supplies the full formal coefficient family before its image in the source total quotient.
- Coefficientwise admissible specialization: Its coefficients all lie in the domain of one actual denominator-localized ring map.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### All coefficients of the denominator-localized family

DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients

Declaration: DirichletPadic.eisensteinAwaySeries_coeff

Kind: lemma. Implementation: unchecked.

For all n≥0, coeff_n(E_u^away)=alg(A_n) if0<n and equals A₀,u^away otherwise.

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- Unfold the native PowerSeries.mk construction and apply coeff_mk.
- The positive proof in the native N+ index is irrelevant, so this agrees exactly with the original A_n constructor. The complementary natural-number case is n=0.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-away-series
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- The coefficient formula is uniform in n and keeps the constant distinct from the positive native measure coefficients.

**Tests**

- SuggestedFullEisensteinTests.coefficient_zero_formula: The all-index formula at0 retains A₀,u^away.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### The full Eisenstein series in the total quotient

DirichletPadicLFunctions:L4/full-eisenstein-total-series

Declaration: DirichletPadic.totalEisensteinSeries

Kind: construction. Implementation: unchecked.

Define E∈Q[[q]] with coefficient0=A₀ and coefficient n>0=i(A_n).

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- Use the same native coefficient constructor, now in the actual total quotient of M. The constant is the previously constructed localizedEisensteinConstant, not a new abstract coefficient.
- Native coeff_mk provides the constant and positive coefficient formulas; native PowerSeries.ext gives uniqueness.
- The first coefficient equals i(δ_1)=1. No ordinary-pseudomeasure condition is imposed on coefficient0; the confirmed source correction E54 continues to govern its interpretation.

**Prerequisites**

- DirichletPadicLFunctions:L4/localized-eisenstein-constant
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext

**Acceptance**

- The source Q(U)[[q]] carrier is realized by native FractionRing M and PowerSeries. Its ordinary-character evaluation is supplied through a separate admissible representative.

**API**

- DirichletPadic.totalEisensteinSeries_coeff: Coefficient n is i(A_n) for0<n and A₀ otherwise.
- DirichletPadic.totalEisensteinSeries_coeff_zero: Coefficient0=A₀.
- DirichletPadic.totalEisensteinSeries_coeff_pos: Every positive coefficient is i(A_n).
- DirichletPadic.totalEisensteinSeries_unique: The coefficient formulas determine E uniquely.

**Tests**

- SuggestedFullEisensteinTests.total_constant_coefficient: The total-quotient series has the actual A₀ as its constant.
- SuggestedFullEisensteinTests.total_first_coefficient: Its first positive coefficient is1.
- SuggestedFullEisensteinTests.total_unique_coefficients: The actual constant and every included positive A_n uniquely determine the series.

**Uses**

- RJW Theorem8.2 displayed source series: Realizes the displayed total-quotient-valued series with the corrected constant.
- Image of the admissible family: Receives the entire actual away-localized series under the native coefficient map.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### The full family maps to the source series

DirichletPadicLFunctions:L4/full-eisenstein-fraction-image

Declaration: DirichletPadic.eisensteinAwaySeries_toFraction

Kind: comparison. Implementation: unchecked.

For a with value p+1, PowerSeries.map(J_a)(E_a^away)=E in Q[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- Apply native PowerSeries.ext and coeff_map. At degree0 use the existing eisenstein-away-constant-image node.
- At a positive degree use the exact all-index away coefficient formula. The native Away.lift coefficient agreement sends alg(A_n) to i(A_n).
- Unfold the total-series coefficient construction and use coeff_mk to identify the result at every index. A complete native assembly lemma checks coefficient maps commute with the same0/positive split.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- DirichletPadicLFunctions:L4/full-eisenstein-total-series
- DirichletPadicLFunctions:L4/eisenstein-away-constant-image
- DirichletPadicLFunctions:L4/eisenstein-away-inclusion
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext
- mathlib:IsLocalization.Away.lift_eq

**Acceptance**

- This identifies a representative on which admissible specialization is defined; it does not extend that specialization over Q.

**Tests**

- SuggestedFullEisensteinTests.image_is_full_total_series: The entire away-localized family maps to the actual total-quotient series, including its constant.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### The full admissible specialization

DirichletPadicLFunctions:L4/full-eisenstein-admissible-specialization

Declaration: DirichletPadic.eisensteinAwaySeries_specialize

Kind: theorem. Implementation: unchecked.

For canonical a and every k≥0, E_a^away mapped coefficientwise by E_(a,k) equals C(E_(a,k)(A₀,a^away)) plus the Z→Q_p coefficient map of the existing positiveEisensteinSeries evaluated at j^k.

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- Use native coefficient extensionality and the exact all-index away coefficient formula.
- At degree0, the existing positive-series coefficient theorem gives0; the constant-series coefficient is precisely the new admissible constant value.
- At a positive degree, the constant-series coefficient is0. Apply the promoted eisenstein-away-integral-evaluation node to A_n. The existing positive-series coefficient theorem identifies the other side with the same A_n(j^k), included into Q_p.
- No new positive-series constructor, measure-valued power-series topology, or finite-support approximation is needed. This is a whole formal-series equality for all nonnegative exponents.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation
- DirichletPadicLFunctions:L4/positive-eisenstein-series-coeff
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_zero_C
- mathlib:PowerSeries.coeff_C_of_ne_zero

**Acceptance**

- The test exponent for classical weightw is w−1. Degree0 is not silently deleted and coefficients with p-divisible index survive stabilization.

**Tests**

- SuggestedFullEisensteinTests.specialization_retains_constant: At p=2,k=3 the specialized coefficient0 is−7/240.
- SuggestedFullEisensteinTests.specialization_prime_coefficient_survives: At the same data the coefficient of q² is1, not0.
- SuggestedFullEisensteinTests.specialization_dyadic_sixth_coefficient: The coefficient of q⁶ is1+3³=28.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### The common rational Eisenstein q-expansion

DirichletPadicLFunctions:L4/full-eisenstein-common-series

Declaration: DirichletPadic.eisensteinSeries_common

Kind: comparison. Implementation: unchecked.

For every even w≥4 and canonical a there exists a unique F∈ℚ[[q]] whose separate images in C[[q]] and Q_p[[q]] are the actual q-expansion of pStabilizedEisenstein(p,w) and PowerSeries.map(E_(a,w−1))(E_a^away), respectively.

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.
- The rational coefficient field is ℚ. The classical q-expansion has period1.

**Construction or proof outline**

- Use the existing positive-eisenstein-series-modular-comparison to choose its unique integral positive series I∈ℤ[[q]], whose complex image is the classical q-expansion minus its constant, and whose Z_p image is the positive measure-valued series at j^(w−1).
- Let c=−(1−p^(w−1))B_w/(2w)∈ℚ. The preceding common-constant theorem identifies its separate complex and p-adic images. Define F=C(c)+PowerSeries.map(Int.castRingHom ℚ)(I).
- Use native map_add, map_C and map_comp. The complex image restores the removed constant, giving the full classical q-expansion. The p-adic image is the full admissible specialization by the previous whole-series theorem.
- The integer maps through ℚ and through Z_p agree after mapping to Q_p by ordinary preservation of integer casts. No ℚ→Z_p map or scalar tower through it is introduced.
- For uniqueness, the canonical rational-to-complex map is injective by native Rat.cast_injective; PowerSeries.map_injective then shows any series with the stated complex image equals F. A complete native restoration and uniqueness probe checks these coefficient-map arguments.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-admissible-specialization
- DirichletPadicLFunctions:L4/eisenstein-away-classical-constant
- DirichletPadicLFunctions:L4/positive-eisenstein-series-modular-comparison
- mathlib:PowerSeries.map_C
- mathlib:PowerSeries.map_comp
- mathlib:PowerSeries.map_injective
- mathlib:Rat.cast_injective

**Acceptance**

- The common rational series compares all coefficients at once. It does not identify C and Q_p or prove geometric weight-space or Hida–Coleman control.

**Tests**

- SuggestedFullEisensteinTests.common_whole_dyadic_series: At p=2,w=4 the full classical and arithmetic series are the separate images of a unique rational power series.
- SuggestedFullEisensteinTests.common_whole_ternary_series: The same whole-series comparison holds at p=3,w=4.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### Index invariance of the full family

DirichletPadicLFunctions:L4/full-eisenstein-index-invariance

Declaration: DirichletPadic.eisensteinAwaySeries_coeff_mul_p

Kind: lemma. Implementation: unchecked.

For every u∈U and n≥0, coeff_(pn)(E_u^away)=coeff_n(E_u^away).

**Hypotheses**

- p is any prime, including2. Z=Z_p,U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied commutative convolution algebra. Q=FractionRing M is the total quotient, without a domain or field assumption.
- For u∈U use Δ_u=2·eisensteinTwistedDenominator p u and the native S_u=Localization.Away(Δ_u). Write A₀,u^away=eisensteinAwayConstant p u, A₀=localizedEisensteinConstant p and A_n=positiveEisensteinMeasure p n for n∈N+. For a with value p+1, J_a:S_a→Q and E_(a,k):S_a→Q_p are the preceding actual ring homomorphisms.

**Construction or proof outline**

- For n=0 both indices are0, so both sides are the same actual localized constant.
- For n>0, p is positive and both indices correspond to native positive naturals. Use the exact away-series coefficient formula and the existing positive-eisenstein-remove-p theorem A_(pn)=A_n.
- Iterate the equality for prime powers. The coefficient of q is1 by the one-divisor formula, so every coefficient at p^r is1. This excludes interpreting p-stabilization as deletion of all p-divisible Fourier indices.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- DirichletPadicLFunctions:L4/positive-eisenstein-remove-p

**Acceptance**

- This is a coefficient identity. No new generic Hecke operator or modular-form carrier is defined.

**Tests**

- SuggestedFullEisensteinTests.index_invariance_includes_zero: Index invariance includes0 without forcing its coefficient to vanish.
- SuggestedFullEisensteinTests.prime_power_coefficient_survives: Every coefficient at p^r, including r=0, equals1.

**Sources**

- RJW-published, Definition8.1 and its q-expansion, Theorem8.2 and its proof, published159–160/PDF60–61, read completely during this continuation on29September2026. Part(a) is used with the independently confirmed correction E54; the source constant is a character-twisted localized element.. Worker assembly in the native PowerSeries over the actual denominator localization and total quotient. The existing positive integral coefficient measures and positive-series modular comparison are imported. The actual localized constant and its admissible evaluator supply degree0. Separate coefficient maps of one rational series compare the arithmetic and classical q-expansions; no geometric family, complex-to-p-adic embedding or evaluation on arbitrary total fractions is asserted.

### Clearing the constant in its denominator localization

DirichletPadicLFunctions:L4/eisenstein-away-constant-clearing

Declaration: DirichletPadic.eisensteinAwayConstant_clearing

Kind: lemma. Implementation: unchecked.

For every u∈U, alg(Δ_u)A₀,u^away=alg(n_u) in S_u.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Promote the existing away-constant clearing API without changing its suggested signature.
- Unfold the defining native fraction and apply IsLocalization.mk′_spec′ at the denominator subtype whose certificate is Submonoid.mem_powers. This equality holds even when the localization is the zero ring; it does not assert an admissible field map for such a parameter.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-constant
- mathlib:IsLocalization.mk'_spec'

**Acceptance**

- Regularity is unnecessary for this equality in the native away localization. Canonical-parameter hypotheses remain explicit in the subsequent maps.

**Tests**

- SuggestedEisensteinClearingTests.away_constant_clearing_all_parameters: The constant clearing equality holds for every unit parameter, including1.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### The integral numerator series of the full Eisenstein family

DirichletPadicLFunctions:L4/integral-cleared-eisenstein-series

Declaration: DirichletPadic.clearedEisensteinSeries

Kind: construction. Implementation: unchecked.

Define N_u∈M[[q]] with coefficient0=n_u and positive coefficient n equal to Δ_u A_n, where multiplication is the existing convolution multiplication of M.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Use native PowerSeries.mk on the coefficient function that chooses the existing integral n_u at0 and the convolution product Δ_u A_n when0<n. The positive branch uses the native positive natural index.
- Native coeff_mk proves the all-index formula, promoted below, and its zero and positive specializations. Native PowerSeries.ext proves uniqueness from all coefficients.
- The first coefficient is Δ_u, since the one-divisor construction of A_1 is the convolution identity δ_1. For u=1, d_1=0 from its two-Dirac definition and n_1=0 from the existing weighted-numerator construction, so the whole series is0.
- Every coefficient is an actual integral unit measure. The product Δ_u A_n is convolution, not pointwise multiplication of measures. No division by2 occurs in M.

**Prerequisites**

- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext

**Acceptance**

- The integral coefficient carrier is M, before either localization or arithmetic specialization. The scalar factor2 is retained at p=2.

**API**

- DirichletPadic.clearedEisensteinSeries_coeff: Coefficient n equals Δ_u A_n if0<n, and n_u otherwise. Promoted to integral-cleared-eisenstein-coefficients.
- DirichletPadic.clearedEisensteinSeries_coeff_zero: Coefficient0 equals n_u.
- DirichletPadic.clearedEisensteinSeries_coeff_pos: For each positive n, coefficient n equals Δ_u A_n.
- DirichletPadic.clearedEisensteinSeries_unique_coefficients: These constant and positive coefficients uniquely determine N_u.

**Tests**

- SuggestedEisensteinClearingTests.integral_cleared_constant: Coefficient0 is the existing integral weighted numerator n_u.
- SuggestedEisensteinClearingTests.integral_cleared_first: Coefficient1 is the entire doubled denominator Δ_u.
- SuggestedEisensteinClearingTests.identity_parameter_zero_series: The integral series at u=1 is0.

**Uses**

- RJW Theorem8.2 and Remark8.3: Provides a single integral series obtained by clearing the actual common denominator of the full source family.
- Integral full-series congruences: Its integral measures are the coefficient functionals to which integral test congruences can later be applied.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### Coefficients of the integral numerator series

DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients

Declaration: DirichletPadic.clearedEisensteinSeries_coeff

Kind: lemma. Implementation: unchecked.

For every natural n, coeff_n(N_u)=Δ_u A_n when0<n, and coeff_0(N_u)=n_u.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Unfold the coefficient constructor and use native PowerSeries.coeff_mk. The dependent positive-natural index is independent of its positivity proof.
- This promotes the coefficient API without changing its signature, so later clearing and moment proofs cite an actual node.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-series
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- The zero branch is retained separately; no positive-divisor convention at n=0 is used.

**Tests**

- SuggestedEisensteinClearingTests.cleared_all_index_formula: For every positive native index the coefficient is precisely the convolution product Δ_u A_n.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### Uniform denominator clearing in the away localization

DirichletPadicLFunctions:L4/full-eisenstein-away-clearing

Declaration: DirichletPadic.clearedEisensteinSeries_toAway

Kind: theorem. Implementation: unchecked.

For every u∈U, PowerSeries.map(alg)(N_u)=C(alg Δ_u)E_u^away in S_u[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Use native PowerSeries.ext, coeff_map and coeff_C_mul to reduce the equality to a coefficient identity.
- At0, use the promoted away-constant clearing equality and the exact coefficient formulas for the two series.
- At a positive index, the left coefficient is alg(Δ_u A_n), while the right coefficient is alg(Δ_u)alg(A_n); multiplicativity of the coefficient ring map identifies them.
- The proof uses no inverse inside M and requires no regularity of Δ_u. A complete native constructor and clearing lemma check the same coefficient argument for arbitrary commutative coefficient rings.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients
- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- DirichletPadicLFunctions:L4/eisenstein-away-constant-clearing
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_C_mul

**Acceptance**

- One factor clears every coefficient at once. This equality does not require a geometric modular-family construction.

**Tests**

- SuggestedEisensteinClearingTests.whole_away_clearing: The equality holds for the entire native power series and every unit parameter.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### Uniform denominator clearing in the total quotient

DirichletPadicLFunctions:L4/full-eisenstein-total-clearing

Declaration: DirichletPadic.clearedEisensteinSeries_toFraction

Kind: theorem. Implementation: unchecked.

For canonical a, PowerSeries.map(i)(N_a)=C(i Δ_a)E in Q[[q]], where i:M→Q is the canonical total-quotient map.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Apply native PowerSeries.ext, coeff_map and coeff_C_mul. For positive indices use the integral coefficient formula and the actual total-series coefficient construction.
- At degree0 use the existing localized-eisenstein-clearing node, which states 2i(d_a)A₀=i(n_a). Preservation of2 and multiplication by i rewrites its left side as i(Δ_a)A₀.
- This directly identifies the integral numerator series of the actual source total-quotient series. It uses no chosen inverse in M and no field structure on Q.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients
- DirichletPadicLFunctions:L4/full-eisenstein-total-series
- DirichletPadicLFunctions:L4/localized-eisenstein-clearing
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- The canonical parameter guarantees the constant is the previously chosen A₀. This is an integral lift of a multiplied series, not an assertion that E itself has integral coefficients.

**Tests**

- SuggestedEisensteinClearingTests.whole_total_quotient_clearing: The actual total-quotient family clears by the image of Δ_a into the actual integral series N_a.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### Uniqueness of the integral numerator series

DirichletPadicLFunctions:L4/full-eisenstein-integral-lift-unique

Declaration: DirichletPadic.clearedEisensteinSeries_unique

Kind: lemma. Implementation: unchecked.

For canonical a, if F∈M[[q]] satisfies PowerSeries.map(i)(F)=C(i Δ_a)E, then F=N_a.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- The total-clearing theorem identifies the specified image with PowerSeries.map(i)(N_a).
- Native IsFractionRing.injective makes i injective for this total quotient of a commutative ring, without assuming M is a domain.
- Native PowerSeries.map_injective lifts this injectivity coefficientwise and yields F=N_a. A complete native lemma checks uniqueness of such an integral lift.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-total-clearing
- mathlib:IsFractionRing.injective
- mathlib:PowerSeries.map_injective

**Acceptance**

- Uniqueness uses injectivity of the total-quotient map, not injectivity of an arbitrary away localization.

**Tests**

- SuggestedEisensteinClearingTests.integral_lift_unique: Every integral series mapping to the cleared source series equals the constructed N_a.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### Integral moments of the cleared full series

DirichletPadicLFunctions:L4/integral-cleared-eisenstein-moment

Declaration: DirichletPadic.integralClearedEisensteinMoment

Kind: construction. Implementation: unchecked.

For every u∈U and k≥0, define N_(u,k)∈Z[[q]] by mapping N_u through the ring map underlying the supplied characterIntegralAlgHom at κ_(0,1,k).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Use the existing primePowerArithmeticCharacter at level0 with the trivial Dirichlet character and exponent k. Its promoted coordinate formula identifies its continuous test with j^k.
- The supplied matching-coefficient characterIntegralAlgHom is an actual Z-algebra homomorphism M→Z. Forget to its underlying ring map and apply native PowerSeries.map to N_u. No coefficient-field extension or localization is needed.
- Native coeff_map gives coeff_n(N_(u,k))=coeff_n(N_u)(j^k), promoted below. In degree0 this is n_u(j^k). For positive n, multiplicativity of the character integral evaluates Δ_u A_n as 2(u^(k+1)−1)A_n(j^k), using the existing shifted-denominator moment theorem.
- The constructor and coefficient formula give uniqueness by native PowerSeries.ext. At exponent0 its first coefficient is2(u−1). At p=2,u=3,k=3 its constant is−14/3 in Z_2 and its first coefficient is160, distinguishing the integral numerator from the original rational series and from a missing-half normalization.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator-moment
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
- mathlib:PowerSeries.map
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.ext

**Acceptance**

- The moment series genuinely has coefficients in Z, including at p=2. The general supplied character integration owns multiplicativity; this node only forms the arithmetic coefficient map.

**API**

- DirichletPadic.integralClearedEisensteinMoment_def: N_(u,k) is PowerSeries.map of the supplied level-zero character integral applied to N_u.
- DirichletPadic.integralClearedEisensteinMoment_coeff: Coefficient n is coeff_n(N_u)(j^k). Promoted to integral-cleared-eisenstein-moment-coefficients.
- DirichletPadic.integralClearedEisensteinMoment_coeff_zero: Coefficient0 is n_u(j^k) in Z.
- DirichletPadic.integralClearedEisensteinMoment_coeff_pos: The positive coefficient n is2(u^(k+1)−1)A_n(j^k) in Z.
- DirichletPadic.integralClearedEisensteinMoment_unique: The integral moment formula at every natural index uniquely determines N_(u,k).

**Tests**

- SuggestedEisensteinClearingTests.integral_moment_zero_exponent: At k=0 the first coefficient is2(u−1) in Z.
- SuggestedEisensteinClearingTests.integral_moment_dyadic_constant: At p=2,u=3,k=3, three times the constant is−14 in Z_2. Since3 is a unit, this specifies the integral value conventionally written−14/3.
- SuggestedEisensteinClearingTests.integral_moment_dyadic_first: At the same data the first coefficient is160 in Z_2.
- SuggestedEisensteinClearingTests.integral_moment_retains_double: The same first coefficient is not80; dropping the doubled denominator changes the series.

**Uses**

- RJW Remark8.3, arithmetic weight variation: Places the numerator moments in the integral coefficient ring where divisibility expresses congruence.
- Full admissible specialization: Supplies the integral preimage of the explicit denominator times the full p-adic series.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### All integral coefficients of the cleared specialization

DirichletPadicLFunctions:L4/integral-cleared-eisenstein-moment-coefficients

Declaration: DirichletPadic.integralClearedEisensteinMoment_coeff

Kind: lemma. Implementation: unchecked.

For every u∈U and k,n≥0, coeff_n(N_(u,k))=coeff_n(N_u)(j^k) in Z.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Unfold the arithmetic coefficient-map constructor and use native PowerSeries.coeff_map.
- The defining underlying map of characterIntegralAlgHom evaluates a measure on its character test. The existing level-zero arithmetic character formula identifies this continuous test pointwise with j^k.
- Promote the all-coefficient API unchanged. This statement will allow future integral test congruences to be applied to the actual coefficient measures, uniformly including the constant.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-moment
- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
- mathlib:PowerSeries.coeff_map

**Acceptance**

- The integral coefficient is not replaced by a quotient in Q_p. Any precision statement must first be made on these integral values.

**Tests**

- SuggestedEisensteinClearingTests.integral_moment_every_coefficient: The equality holds inside Z for every natural coefficient index, including0.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### The integral lift of the full admissible specialization

DirichletPadicLFunctions:L4/full-eisenstein-cleared-specialization

Declaration: DirichletPadic.integralClearedEisensteinMoment_specialize

Kind: comparison. Implementation: unchecked.

For canonical a and every k≥0, PowerSeries.map(Z→Q_p)(N_(a,k))=C(2(a^(k+1)−1))·PowerSeries.map(E_(a,k))(E_a^away) in Q_p[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the native carriers with the supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient without a domain or field assumption.
- For u∈U write d_u=eisensteinTwistedDenominator p u, Δ_u=2d_u and n_u=eisensteinWeightedNumerator p u. The native localization is S_u=Localization.Away(Δ_u). The preceding full series are E_u^away∈S_u[[q]] and E∈Q[[q]]. Their positive coefficients come from the existing A_n=positiveEisensteinMeasure p n; degree0 is their actual localized constant.
- The continuous coordinate is j(u)=u. Canonical a means its underlying Z-value is p+1. Only this canonical parameter is used for the map into Q and the admissible evaluator E_(a,k):S_a→Q_p.

**Construction or proof outline**

- Map the uniform away-clearing identity through the actual admissible evaluator E_(a,k). Native coefficient maps preserve multiplication and constant series.
- The promoted all-integral-coefficient evaluator agreement identifies the composite M→S_a→Q_p with the Z→Q_p image of μ↦μ(j^k). Apply coefficient extensionality and the promoted integral-moment coefficient theorem to identify the mapped numerator series.
- For the mapped denominator, use the same all-integral-coefficient agreement and the existing shifted-denominator moment theorem. Linearity and the convolution identity show the doubled denominator evaluates to2(a^(k+1)−1). Native preservation of casts identifies its integral and field versions.
- The resulting equality retains the exact weight-dependent factor. At k=0 it is2p, and at p=2,a=3,k=3 it is160. The coefficient at the prime index also survives, with value160 in that example.
- A complete native lemma checks the commutation of denominator clearing with coefficient maps; another checks integral coefficient-map composition. This result alone does not cancel a nonunit denominator in an integral congruence.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-away-clearing
- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-moment-coefficients
- DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- mathlib:PowerSeries.map
- mathlib:PowerSeries.map_C
- mathlib:PowerSeries.map_comp
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.ext

**Acceptance**

- The equality specifies the factor that must be kept when translating integral full-series congruences. It neither evaluates all of Q nor assumes an unchanged precision after dividing by2(a^(k+1)−1).

**Tests**

- SuggestedEisensteinClearingTests.field_specialization_dyadic_four: At p=2,a=3,k=3 the included integral moment series is160 times the actual full admissible series.
- SuggestedEisensteinClearingTests.field_specialization_zero_exponent: At exponent0 the multiplier is2p; the theorem includes this exponent.
- SuggestedEisensteinClearingTests.field_specialization_prime_index_survives: At p=2,a=3,k=3 the coefficient at q² is160, not0.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely on29September2026. The independently confirmed correction E54 to part(a) is retained.. Worker integral denominator-clearing construction for the full arithmetic series. The source motivates coefficientwise variation in weight; this checkpoint first constructs its integral numerator series and compares its actual integral moments with the full admissible specialization. It imports the existing numerator, doubled shifted denominator, convolution algebra and character integral. It does not infer an integral constant or unchanged precision after division, and does not call the twisted constant an ordinary pseudomeasure.

### Integral test congruences for every cleared coefficient

DirichletPadicLFunctions:L4/cleared-eisenstein-coefficient-test-congruence

Declaration: DirichletPadic.clearedEisensteinCoefficient_test_congr

Kind: lemma. Implementation: unchecked.

For every u∈U, n,r≥0 and f,g∈C(U,Z), if p^r divides f(v)−g(v) for every v∈U, then p^r divides μ_(u,n)(f)−μ_(u,n)(g) in Z.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- Fix the actual integral coefficient measure μ_(u,n). The supplied rational-unit-extension-norm theorem identifies the norm of its Q_p extension with the bounded image Amice coefficient sequence of its ambient inclusion. The supplier integral-coefficient-sequence statement gives bound1 in Q_p. This bound can also be read directly from its defining coefficient function using PadicInt.norm_le_one and BoundedContinuousFunction.norm_le; no norm on the integral measure carrier is assigned.
- Native PadicInt.norm_le_pow_iff_mem_span_pow and Ideal.mem_span_singleton convert the assumed pointwise divisibility of f−g into the norm bound p^(−r). The inclusion Z→Q_p preserves norms by PadicInt.norm_def.
- For the continuous field-valued test (f−g) times the constant1, native ContinuousMap.norm_le bounds its supremum norm by p^(−r). Apply ContinuousLinearMap.le_opNorm and the preceding operator bound1.
- The supplied integral-unit-extension-test-function theorem identifies this field integral with the inclusion of μ_(u,n)(f−g). Native linearity rewrites it as the desired integral difference. Convert the resulting norm bound back into divisibility with the same ideal criterion.
- The reasoning applies to n=0 and r=0. A complete native lemma checks the norm-to-divisibility inference under precisely the field operator bound and integral-test agreement used here.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-series
- PadicMeasuresIwasawaAlgebras:L2/rational-unit-extension-norm
- PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence
- PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-test-function
- mathlib:PadicInt.norm_le_one
- mathlib:BoundedContinuousFunction.norm_le
- mathlib:PadicInt.norm_le_pow_iff_mem_span_pow
- mathlib:Ideal.mem_span_singleton
- mathlib:PadicInt.norm_def
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousLinearMap.le_opNorm

**Acceptance**

- The general bounded-extension theory is imported from its owner. This arithmetic consumer applies it to the coefficients of N_u and introduces no duplicate general measure theory.

**Tests**

- SuggestedEisensteinCongruenceTests.integral_constant_test_congruence: The same divisibility holds for the degree0 weighted numerator measure; the constant coefficient is included.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### The full cleared q-expansion measure

DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation

Declaration: DirichletPadic.clearedEisensteinEvaluation

Kind: construction. Implementation: unchecked.

Define the native Z[[q]]-valued measure N_u^eval∈AbstractMeasure(U,Z,Z[[q]]) by coeff_n(N_u^eval(f))=μ_(u,n)(f) for every n≥0 and f∈C(U,Z).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- Use native PowerSeries.mk to assemble the actual coefficient measure evaluations. Every coefficient is Z-linear in f; native PowerSeries.ext therefore proves additivity and scalar compatibility.
- Each μ_(u,n) is already a continuous linear functional on the integral test space. Native PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto proves continuity of the assembled function for the coefficientwise topology.
- Bundle the continuous linear map by native AbstractMeasure.toCLMEquiv. Its zero, addition, scalar and continuity APIs are the inherited linear structure. Native coefficient extensionality and measure extensionality give uniqueness.
- The all-index coefficient formula is promoted below. The comparison of power-test evaluation with the existing integral moment series is also promoted below. At degree0 the coefficient is the actual weighted numerator evaluated on f. At degree1 it is2(u f(u)−f(1)), obtained by the one-divisor identity and the explicit two-Dirac denominator.
- A complete native constructor and coefficient lemma verify assembly from arbitrary actual integral coefficient measures. No summability, convergence radius or norm on Z[[q]] is required.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:AbstractMeasure
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto

**Acceptance**

- The native coefficientwise topology gives the required continuity. This is the cleared full series, with its actual constant measure, rather than another positive truncation.

**API**

- DirichletPadic.clearedEisensteinEvaluation_coeff: Coefficient n of N_u^eval(f) equals μ_(u,n)(f). Promoted to cleared-eisenstein-evaluation-coefficients.
- DirichletPadic.clearedEisensteinEvaluation_zero: Evaluation at0 is0.
- DirichletPadic.clearedEisensteinEvaluation_add: Evaluation preserves addition of integral continuous tests.
- DirichletPadic.clearedEisensteinEvaluation_smul: Evaluation preserves scalar multiplication by every element of Z.
- DirichletPadic.clearedEisensteinEvaluation_continuous: Evaluation is continuous from the compact-open test space to the coefficientwise power-series topology.
- DirichletPadic.clearedEisensteinEvaluation_unique: A native Z[[q]]-valued measure with the specified value of every coefficient on every test equals N_u^eval.
- DirichletPadic.clearedEisensteinEvaluation_moment: Evaluation on j^k equals the existing N_(u,k). Promoted to cleared-eisenstein-evaluation-moment.

**Tests**

- SuggestedEisensteinCongruenceTests.cleared_evaluation_zero: N_u^eval(0)=0.
- SuggestedEisensteinCongruenceTests.cleared_evaluation_constant: Coefficient0 of N_u^eval(f) is n_u(f), including nonzero constants.
- SuggestedEisensteinCongruenceTests.cleared_evaluation_first: Coefficient1 equals2(u f(u)−f(1)).
- SuggestedEisensteinCongruenceTests.cleared_evaluation_dyadic_cubic: For p=2,u=3,f=j³, coefficient1 equals160.

**Uses**

- RJW Remark8.3, arithmetic full-series variation: Packages all integral coefficient tests, including the numerator of the constant term, into one actual continuous linear map.
- Full integral test congruence: Allows the coefficientwise precision statement to be stated as divisibility of one integral formal series.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### Coefficients of the full cleared q-expansion measure

DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation-coefficients

Declaration: DirichletPadic.clearedEisensteinEvaluation_coeff

Kind: lemma. Implementation: unchecked.

For every f∈C(U,Z) and n≥0, coeff_n(N_u^eval(f))=μ_(u,n)(f).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- Unfold the coefficient constructor inside the native continuous-linear-map bundle and apply PowerSeries.coeff_mk.
- Promote the exact projection signature from the construction, without replacing the actual coefficient measure by a formal scalar sequence.

**Prerequisites**

- DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- All later full-series proofs use this explicit projection node.

**Tests**

- SuggestedEisensteinCongruenceTests.full_coefficient_evaluation: The projection identity holds for every actual integral continuous test and every natural coefficient index.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### Agreement of full evaluation with the integral moment series

DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation-moment

Declaration: DirichletPadic.clearedEisensteinEvaluation_moment

Kind: comparison. Implementation: unchecked.

For all u∈U and k≥0, N_u^eval(j^k)=N_(u,k) in Z[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- Use native PowerSeries.ext. The full evaluation projection gives μ_(u,n)(j^k).
- The preceding promoted integral-cleared-eisenstein-moment-coefficients theorem gives exactly the same coefficient for the existing arithmetic moment constructor.

**Prerequisites**

- DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation-coefficients
- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-moment-coefficients
- mathlib:PowerSeries.ext

**Acceptance**

- No new arithmetic moment object is introduced. The actual character-algebra specialization and the linear test evaluation are identified coefficientwise.

**Tests**

- SuggestedEisensteinCongruenceTests.moment_evaluation_comparison: The equality holds at every natural exponent, including0, inside the integral power-series ring.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### Uniform integral congruences for the full series

DirichletPadicLFunctions:L4/full-cleared-eisenstein-test-congruence

Declaration: DirichletPadic.clearedEisensteinEvaluation_test_congr

Kind: theorem. Implementation: unchecked.

For every u∈U, r≥0 and f,g∈C(U,Z), pointwise divisibility p^r∣f(v)−g(v) implies C(p^r)∣N_u^eval(f)−N_u^eval(g) in Z[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- Use the promoted projection identity and linearity of each coefficient projection. The preceding cleared coefficient test-congruence node gives divisibility of the difference at every n, including0.
- For each n choose an integral quotient coefficient b_n. Define B=PowerSeries.mk(b_n). Native coeff_C_mul, coeff_mk and PowerSeries.ext identify the entire difference with C(p^r)B.
- The quotient is a formal series; the coefficientwise choice needs no uniform bound or continuity as n varies. The native complete divisibility lemma verifies this assembly. The case r=0 is divisibility by1.

**Prerequisites**

- DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation-coefficients
- DirichletPadicLFunctions:L4/cleared-eisenstein-coefficient-test-congruence
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.ext

**Acceptance**

- This is divisibility in the integral power-series ring. Field divisibility would contain no precision information and is not used.

**Tests**

- SuggestedEisensteinCongruenceTests.precision_zero_allowed: For r=0 the conclusion is divisibility by the constant series1.
- SuggestedEisensteinCongruenceTests.uniform_eight_test_precision: At p=2, pointwise congruence modulo8 gives full-series divisibility by C(8), including the constant.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### Weight congruences for the full integral series

DirichletPadicLFunctions:L4/full-cleared-eisenstein-weight-congruence

Declaration: DirichletPadic.integralClearedEisensteinMoment_weight_congr

Kind: theorem. Implementation: unchecked.

For every u∈U, r≥1 and e,e′≥0 with e≡e′ modulo p^(r−1)(p−1), C(p^r) divides N_(u,e′)−N_(u,e) in Z[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- Apply the integral test-congruence theorem to f=j^e′ and g=j^e, then identify both evaluations with the existing integral moment series by the promoted comparison node.
- For each v∈U reduce it to an actual unit in ZMod(p^r) using Units.map and PadicInt.toZModPow. Native pow_card_eq_one, ZMod.card_units_eq_totient and Nat.totient_prime_pow show its power p^(r−1)(p−1) equals1.
- Native pow_eq_pow_of_modEq now equates its powers e and e′. Apply the unit-value map and rewrite the residue of v^e′−v^e as0. Native ker_toZModPow identifies this kernel with the ideal generated by p^r; Ideal.mem_span_singleton gives the required pointwise integral divisibility.
- A complete native proof checks the finite-unit reduction and its kernel calculation, including p=2 and zero exponents. No topological generator or logarithm is used. The modulus is sufficient; no optimality is asserted.
- The old positive-series congruence and L1 smoothed Kummer results remain unchanged. This new statement packages the full cleared family, including the weighted constant numerator, as one integral-series divisibility. For classical even weightw≥4 the exponent is w−1.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-cleared-eisenstein-test-congruence
- DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation-moment
- mathlib:Units.map
- mathlib:PadicInt.toZModPow
- mathlib:PadicInt.ker_toZModPow
- mathlib:Ideal.mem_span_singleton
- mathlib:pow_card_eq_one
- mathlib:ZMod.card_units_eq_totient
- mathlib:Nat.totient_prime_pow
- mathlib:pow_eq_pow_of_modEq

**Acceptance**

- Both the tame factor p−1 and the precision factor p^(r−1) are retained. The dyadic unit group is never assumed procyclic.

**Tests**

- SuggestedEisensteinCongruenceTests.dyadic_full_weight_precision: At p=2, exponents3 and7 give full-series divisibility by C(8) for every u.
- SuggestedEisensteinCongruenceTests.quinary_full_weight_precision: At p=5, exponents3 and23 give full-series divisibility by C(25) for every u.
- SuggestedEisensteinCongruenceTests.tame_component_not_full_precision: At p=5,u=6, exponents3 and7 agree modulo4, but the full integral series difference is not divisible by C(25). Its first coefficient is3356640, which is not divisible by25.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### Qualified weight congruences for the full admissible family

DirichletPadicLFunctions:L4/full-eisenstein-cleared-field-congruence

Declaration: DirichletPadic.eisensteinAwaySeries_cleared_weight_congr

Kind: comparison. Implementation: unchecked.

For canonical a, set F_e=PowerSeries.map(E_(a,e))(E_a^away) and D_e=2(a^(e+1)−1) in Q_p. If r≥1 and e≡e′ modulo p^(r−1)(p−1), then for every n≥0, ‖D_e′ coeff_n(F_e′)−D_e coeff_n(F_e)‖≤p^(−r).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ, and M=AbstractMeasure U Z Z use the native topologies and the supplied actual commutative convolution algebra. Let N_u=clearedEisensteinSeries p u∈M[[q]] and μ_(u,n)=coeff_n(N_u). Its degree0 coefficient is the actual weighted numerator; every coefficient is integral.
- The continuous unit coordinate is j(u)=u. N_(u,k)=integralClearedEisensteinMoment p u k∈Z[[q]] is the existing integral character specialization. The power-series topology is the native coefficientwise topology PowerSeries.WithPiTopology; no power-series norm or operator norm on M is presumed.
- All divisibility statements are in Z or Z[[q]]. Measure operator norms occur only after the supplied extension to Q_p and native toCLMEquiv, using the canonical bounded Z-action on Q_p.

**Construction or proof outline**

- The integral full-series weight-congruence theorem supplies a quotient series B with N_(a,e′)−N_(a,e)=C(p^r)B. Native coeff_C_mul gives divisibility of each coefficient difference in Z.
- Native ideal membership and PadicInt.norm_le_pow_iff_mem_span_pow convert coefficient divisibility into the norm bound. PadicInt.norm_def preserves it under inclusion into Q_p.
- Apply the preceding full-eisenstein-cleared-specialization equality to each exponent. Native coeff_map and coeff_C_mul identify the two included integral coefficients with D_e′ coeff_n(F_e′) and D_e coeff_n(F_e).
- Keep both weight-dependent factors. At p=2,a=3,e=3,e′=7,r=3 the cleared constant difference is−10400/3 and has valuation5. The corresponding uncleared difference is−113/480, of valuation−5 and norm32. Thus this conclusion cannot be read as a norm bound1/8 for the uncleared constants.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-cleared-eisenstein-weight-congruence
- DirichletPadicLFunctions:L4/full-eisenstein-cleared-specialization
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.coeff_map
- mathlib:PadicInt.norm_le_pow_iff_mem_span_pow
- mathlib:Ideal.mem_span_singleton
- mathlib:PadicInt.norm_def

**Acceptance**

- The statement is a uniform coefficient norm bound for the full admissible family with its exact clearing factors. A precision-loss formula after division remains separate; no field divisibility or unqualified cancellation is substituted.

**Tests**

- SuggestedEisensteinCongruenceTests.cleared_constant_dyadic_precision: The dyadic cleared constant difference−10400/3 has norm at most1/8.
- SuggestedEisensteinCongruenceTests.uncleared_constant_precision_loss: The dyadic uncleared constant difference−113/480 has norm32; cancelling the two distinct nonunit factors would lose the asserted precision.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its proof, Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; independently confirmed E54 correction retained.. Worker quantitative consequence for the full family after the actual denominator is cleared. Integral coefficient measures and their existing bounded field extension give uniform test congruences. Finite unit reduction supplies the sufficient weight modulus, including at2. The field comparison retains the explicit doubled shifted factor. The source does not state these quantitative full-series divisibilities, and its qualitative weight-variation remark is not interpreted as unconditional preservation of precision after dividing by nonunits.

### The exact quotient of each full coefficient

DirichletPadicLFunctions:L4/full-eisenstein-coefficient-quotient

Declaration: DirichletPadic.eisensteinAwaySeries_coeff_eq_integral_div

Kind: lemma. Implementation: unchecked.

For canonical a and all e,n≥0, coeff_n(F_e)=ι(coeff_n(N_(a,e)))/D_e in Q_p, where ι:Z→Q_p is the canonical inclusion.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- Take coefficient n in the existing full-eisenstein-cleared-specialization equality. Native coeff_map and coeff_C_mul give D_e coeff_n(F_e)=ι(coeff_n(N_(a,e))).
- Use the exact nonvanishing supplied by eisenstein-moment-denominator. Native eq_div_iff and commutativity rearrange this scalar equality to the displayed quotient.
- The complete native scaled-value lemma checks the division step. This operates on the actual admissible series and does not extend its evaluator over the whole total quotient.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-cleared-specialization
- DirichletPadicLFunctions:L4/eisenstein-moment-denominator
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_C_mul
- mathlib:eq_div_iff

**Acceptance**

- The formula holds for n=0 and e=0 as well. Its denominator is a field unit by nonvanishing, without claiming it is an integral unit.

**Tests**

- SuggestedEisensteinPrecisionTests.full_coefficient_quotient: At p=2,a=3,e=3 every full coefficient is its included integral numerator divided by160.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### Variation of the explicit arithmetic denominator

DirichletPadicLFunctions:L4/eisenstein-denominator-weight-congruence

Declaration: DirichletPadic.eisensteinDenominator_weight_congr

Kind: lemma. Implementation: unchecked.

For every a∈U, r≥1 and e,e′≥0 with e≡e′ modulo p^(r−1)(p−1), ‖D_e′−D_e‖≤p^(−r). No canonical-parameter condition is required here.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- Take coefficient1 in the existing full integral weight-congruence theorem. A quotient-series witness and native coeff_C_mul give divisibility by p^r of that integral coefficient difference.
- The promoted integral moment coefficient formula evaluates the first coefficient measure on j^e. The promoted cleared-series coefficient formula identifies this measure with Δ_a A_1. Unfold the one-divisor construction of A_1 to obtain the convolution identity, so it is Δ_a=2d_a.
- Linearity and the existing shifted-denominator moment theorem give the integral value2(a^(e+1)−1). This uses explicit constructor formulas and promoted nodes, not an unlisted first-coefficient API.
- Native norm/ideal equivalence and principal-ideal divisibility translate the integral difference into the bound. PadicInt.norm_def preserves it after inclusion into Q_p. This proof also covers a=1, when both denominators vanish.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-cleared-eisenstein-weight-congruence
- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-moment-coefficients
- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PadicInt.norm_le_pow_iff_mem_span_pow
- mathlib:Ideal.mem_span_singleton
- mathlib:PadicInt.norm_def

**Acceptance**

- The weight factor itself varies with controlled precision. It is not treated as a fixed constant when comparing different specializations.

**Tests**

- SuggestedEisensteinPrecisionTests.denominator_dyadic_variation: At p=2,a=3,e=3,e′=7,r=3 the difference13120−160 has norm at most1/8.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### A uniform bound for the full specialized coefficients

DirichletPadicLFunctions:L4/full-eisenstein-coefficient-bound

Declaration: DirichletPadic.eisensteinAwaySeries_coeff_norm_le

Kind: lemma. Implementation: unchecked.

For canonical a and every e,n≥0, ‖coeff_n(F_e)‖≤1/‖D_e‖.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- Use the exact coefficient-quotient theorem. Its numerator is the inclusion of an actual coefficient in Z.
- Native PadicInt.norm_le_one and norm_def bound that included numerator by1. Native norm_div and nonnegativity of the denominator norm give the reciprocal-denominator bound.
- The estimate is uniform in the coefficient index and includes the constant. A complete native lemma checks this scalar norm argument. No optimality is asserted.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-coefficient-quotient
- mathlib:PadicInt.norm_le_one
- mathlib:PadicInt.norm_def
- mathlib:norm_div

**Acceptance**

- This is a coefficientwise bound. It does not install a normed structure on the formal series or assert all coefficients integral before division.

**Tests**

- SuggestedEisensteinPrecisionTests.uniform_dyadic_bound: For p=2,a=3,e=3 all full coefficient norms are at most32, including the constant−7/240.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### Precision after division by the arithmetic denominators

DirichletPadicLFunctions:L4/full-eisenstein-quotient-precision

Declaration: DirichletPadic.eisensteinAwaySeries_weight_precision

Kind: theorem. Implementation: unchecked.

For canonical a, r≥1 and e≡e′ modulo p^(r−1)(p−1), every coefficient satisfies ‖coeff_n(F_e′)−coeff_n(F_e)‖≤p^(−r)/(‖D_e‖‖D_e′‖).

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- Write x and y for the included integral numerator coefficients at e and e′, and d=D_e, d′=D_e′. The quotient theorem gives the difference y/d′−x/d. The denominator theorem supplies d,d′≠0.
- Both ‖x‖ and ‖d‖ are at most1: x comes from Z, and d is the inclusion of2(a^(e+1)−1) in Z. The cleared-field congruence gives ‖y−x‖≤p^(−r) after using the exact full clearing identities. The denominator variation theorem gives ‖d−d′‖≤p^(−r), with norm invariance under negation.
- Use native div_sub_div and commutative ring algebra to rewrite the numerator as (y−x)d+x(d−d′). Native Padic.nonarchimedean bounds its norm by the maximum of the two summand norms, each at most p^(−r).
- Native norm_div and multiplicativity of the norm divide that bound by ‖d‖‖d′‖. A complete native quotient-difference lemma proves exactly this inference with its nonzero denominator and norm hypotheses.
- At p=2,a=3,e=3,e′=7,r=3 the denominator valuations are5 and6. The bound is256, while the actual constant difference has norm32. The weaker bound is intentional and need not be sharp.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-coefficient-quotient
- DirichletPadicLFunctions:L4/eisenstein-moment-denominator
- DirichletPadicLFunctions:L4/full-eisenstein-cleared-field-congruence
- DirichletPadicLFunctions:L4/full-eisenstein-cleared-specialization
- DirichletPadicLFunctions:L4/eisenstein-denominator-weight-congruence
- mathlib:PadicInt.norm_le_one
- mathlib:PadicInt.norm_def
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_C_mul
- mathlib:Padic.nonarchimedean
- mathlib:div_sub_div
- mathlib:norm_div

**Acceptance**

- The exact dependence on both denominators states the loss of precision. Cancelling an integral congruence without this loss would give a false constant-term bound.

**Tests**

- SuggestedEisensteinPrecisionTests.dyadic_quotient_precision: For p=2,a=3,e=3,e′=7 the norm of every coefficient difference is at most256.
- SuggestedEisensteinPrecisionTests.distinct_denominator_norms: The same two denominators have norms1/32 and1/64; their norms cannot be identified without a neighborhood hypothesis.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### Constant denominator norm in a strict weight neighborhood

DirichletPadicLFunctions:L4/eisenstein-denominator-local-norm

Declaration: DirichletPadic.eisensteinDenominator_norm_eq

Kind: lemma. Implementation: unchecked.

For a∈U and the preceding r,e,e′ congruence hypotheses, if p^(−r)<‖D_e‖, then ‖D_e′‖=‖D_e‖.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- The denominator variation theorem bounds ‖D_e′−D_e‖ by p^(−r). Compose this weak inequality with the strict neighborhood hypothesis.
- Native Padic.norm_eq_of_norm_sub_lt_right identifies the two norms. Its proof and strict inequality were read at the pin and checked by a complete native lemma.
- The strictness cannot be removed: at p=3,a=4,e=0,e′=2,r=1 the threshold is1/3=‖6‖, but D_2=126 has norm1/9. No canonical parameter is needed for the general norm implication, although the examples use one.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-denominator-weight-congruence
- mathlib:Padic.norm_eq_of_norm_sub_lt_right

**Acceptance**

- The radius condition is strict and explicit. This is a local numerical statement, without a new weight-space object.

**Tests**

- SuggestedEisensteinPrecisionTests.stable_ternary_denominator: At p=3,a=4,e=3,e′=9,r=2 the two denominator norms agree.
- SuggestedEisensteinPrecisionTests.strict_neighborhood_required: At p=3,a=4,e=0,e′=2,r=1 the denominator norms of6 and126 differ, at the equality boundary of the proposed threshold.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### Precision on a neighborhood with fixed denominator norm

DirichletPadicLFunctions:L4/full-eisenstein-local-precision

Declaration: DirichletPadic.eisensteinAwaySeries_local_weight_precision

Kind: theorem. Implementation: unchecked.

For canonical a, the preceding weight congruence, and p^(−r)<‖D_e‖, every coefficient difference satisfies ‖coeff_n(F_e′)−coeff_n(F_e)‖≤p^(−r)/‖D_e‖².

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- Apply the full quotient-precision theorem, which retains both denominator norms.
- Use the preceding local denominator-norm theorem to replace ‖D_e′‖ by ‖D_e‖. The product is its square by the native power definition.
- At p=3,a=4,e=3,e′=57,r=4 both norms are1/3 and the strict threshold1/81<1/3 holds. The displayed bound is1/9; the exact constant difference attains this bound.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-quotient-precision
- DirichletPadicLFunctions:L4/eisenstein-denominator-local-norm

**Acceptance**

- The denominator loss is fixed in this neighborhood. This coefficientwise estimate supplies a precise arithmetic form of weight variation without claiming geometric family realization.

**Tests**

- SuggestedEisensteinPrecisionTests.local_ternary_precision: At p=3,a=4,e=3,e′=57 every coefficient difference has norm at most1/9.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### Precision for the rational classical q-expansions

DirichletPadicLFunctions:L4/classical-rational-eisenstein-precision

Declaration: DirichletPadic.rationalEisensteinSeries_weight_precision

Kind: comparison. Implementation: unchecked.

Let a be canonical, r≥1, and w,w′≥4 even with w−1≡w′−1 modulo p^(r−1)(p−1). If F,G∈ℚ[[q]] have complex images equal to the actual classical p-stabilized q-expansions of weights w,w′, then every n satisfies ‖ι_Q(G_n−F_n)‖≤p^(−r)/(‖2(a^w−1)‖‖2(a^w′−1)‖) in Q_p.

**Hypotheses**

- p is any prime, including2. Let Z=Z_p, U=Zˣ, N_(a,e)=integralClearedEisensteinMoment p a e∈Z[[q]], and D_e=2(a^(e+1)−1)∈Q_p. The integral numerator series and actual coefficient maps are the preceding constructions.
- For canonical a with underlying value p+1, F_e=PowerSeries.map(eisensteinAwayMoment p a ha e)(eisensteinAwaySeries p a) is the actual full admissible arithmetic series. Its constant is included. The existing moment-denominator theorem gives D_e≠0 for every natural exponent e.
- All norms in these estimates are coefficient norms in Q_p or real numbers. No supremum norm on the power-series carrier, field structure on the measure total quotient, or map ℚ→Z_p is assumed.

**Construction or proof outline**

- For each weight use the existing full-eisenstein-common-series theorem to obtain the unique rational series whose separate complex and p-adic images are the actual classical and arithmetic q-expansions.
- The assumed complex image of F agrees with that common series. Native Rat.cast_injective and PowerSeries.map_injective identify them. Do the same for G. Consequently their separate Q_p images are exactly F_(w−1) and F_(w′−1).
- Apply the full quotient-precision theorem at exponents w−1,w′−1. Preservation of subtraction and native coeff_map identify the coefficient difference with ι_Q(G_n−F_n). Since both weights are at least4, the natural identities (w−1)+1=w and (w′−1)+1=w′ rewrite the two denominator exponents.
- This compares rational coefficients by their specified embeddings. It constructs no new rational series, identifies no complex field with Q_p, and uses no rational-to-integral p-adic map.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-common-series
- DirichletPadicLFunctions:L4/full-eisenstein-quotient-precision
- mathlib:Rat.cast_injective
- mathlib:PowerSeries.map_injective
- mathlib:PowerSeries.coeff_map

**Acceptance**

- The modular-form carriers and their q-expansions are the existing native constructions. The arithmetic exponent remains weight minus1.

**Tests**

- SuggestedEisensteinPrecisionTests.classical_rational_precision: At p=2 and weights4,8, any rational series with the specified actual complex q-expansions have Q_2 coefficient differences bounded by256.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its proof and Remark8.3, published159–160/PDF60–61, read completely in this continuation on29September2026; confirmed E54 correction retained.. Worker quantitative refinement of the source weight-variation remark, derived from the existing integral full-series congruences and explicit admissible denominator. The estimates include the constant and record the loss on dividing by nonunits. The classical comparison uses separate images of rational q-expansions. No unqualified integral constant, whole-total-quotient evaluation or geometric modular-family theorem is inferred.

### The shifted cross-numerator identity

DirichletPadicLFunctions:L4/weighted-eisenstein-cross

Declaration: DirichletPadic.eisensteinWeightedNumerator_cross

Kind: lemma. Implementation: unchecked.

For every u,v∈U, d_v n_u=d_u n_v in the actual integral convolution ring M.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- Apply the existing linear operator weight(j) to the exact all-unit identity (δ_v−δ_1)λ_u=(δ_u−δ_1)λ_v supplied by padic-intrinsic-cross. Linearity distributes it over subtraction.
- At an arbitrary continuous test f, the supplied convolution-evaluation and right-convolution-evaluation formulas followed by native Dirac evaluation give (δ_v μ)(f)=μ(y↦f(vy)).
- Weight evaluation replaces f by jf. The pointwise identity j(vy)=v·j(y) identifies this test with v times j(y)f(vy). Pull the scalar through the integral linear functional. Hence the weighted translated term evaluates as vδ_v(weight(j)μ). A complete native test-function lemma verifies this equality for an actual integral measure.
- The identity atom acts as the convolution identity. Thus the two sides become (vδ_v−1)n_u and (uδ_u−1)n_v. Unfold the existing d and n constructors and use measure extensionality. No generic multiplicativity or ring-equivalence claim for weight(j) is used.

**Prerequisites**

- DirichletPadicLFunctions:L1/padic-intrinsic-cross
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- PadicMeasuresIwasawaAlgebras:L2/weight
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation
- PadicMeasuresIwasawaAlgebras:L1/convolution-evaluation
- PadicMeasuresIwasawaAlgebras:L1/right-convolution-evaluation
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The factors are shifted by their scalar unit values. Replacing d_u by δ_u−1 gives the wrong moment factors. The generic character-twist supplier request remains open.

**Tests**

- SuggestedEisensteinParameterTests.shifted_cross_orientation: The factor indexed by v multiplies n_u and the factor indexed by u multiplies n_v, for every unit pair.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### The constant clears at every unit parameter

DirichletPadicLFunctions:L4/localized-eisenstein-all-unit-clearing

Declaration: DirichletPadic.localizedEisensteinConstant_clearing_all

Kind: theorem. Implementation: unchecked.

For every u∈U, i(Δ_u)A₀=i(n_u) in Q.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- Choose the existing unit a with value p+1. Its doubled shifted denominator Δ_a is regular, so native IsLocalization.map_units makes i(Δ_a) invertible in Q.
- The existing canonical localized-eisenstein-clearing equality gives i(Δ_a)A₀=i(n_a), after rewriting preservation of2 and multiplication.
- Multiply the shifted cross-numerator identity by2 to obtain Δ_a n_u=Δ_u n_a. Map it into Q. Multiply the desired equality by i(Δ_a), commute the factors and use the canonical clearing equality followed by this cross identity.
- Cancel only the unit i(Δ_a), with native IsUnit.mul_right_inj. The complete native all-parameter clearing lemma checks exactly this cancellation in a commutative target ring.
- For u=1 both numerator and shifted denominator vanish. For u=−1 the weighted numerator vanishes, so i(Δ_−1) annihilates A₀. Neither statement permits cancellation of that parameter’s denominator.

**Prerequisites**

- DirichletPadicLFunctions:L4/weighted-eisenstein-cross
- DirichletPadicLFunctions:L4/localized-eisenstein-clearing
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-regular
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- mathlib:IsLocalization.map_units
- mathlib:IsUnit.mul_right_inj

**Acceptance**

- All parameters clear the same actual A₀ by their doubled shifted factors. Ordinary pseudomeasure membership concerns different factors and does not follow.

**Tests**

- SuggestedEisensteinParameterTests.all_parameter_identity_clearing: The u=1 clearing equation has zero left side and zero numerator.
- SuggestedEisensteinParameterTests.torsion_parameter_annihilates_constant: For u=−1, i(Δ_−1)A₀=0; the all-unit theorem does not authorize cancellation of this torsion denominator.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### Independence of the regular smoothing representative

DirichletPadicLFunctions:L4/localized-eisenstein-regular-fraction

Declaration: DirichletPadic.localizedEisensteinConstant_regular_fraction

Kind: comparison. Implementation: unchecked.

For any u with Δ_u∈nonZeroDivisors M, the native fraction mk′_Q(n_u,Δ_u) equals the existing A₀.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- The all-unit clearing theorem supplies i(Δ_u)A₀=i(n_u). The displayed regularity certificate makes Δ_u an admissible denominator for the native total quotient.
- Use native IsLocalization.eq_mk′_iff_mul_eq and commutativity to identify A₀ with the native fraction. A complete native fraction-comparison lemma verifies the argument.
- Consequently any two regular smoothing parameters give the same total-quotient element. The construction does not reselect A₀ or modify the preceding canonical constructor.

**Prerequisites**

- DirichletPadicLFunctions:L4/localized-eisenstein-all-unit-clearing
- mathlib:IsLocalization.mk'
- mathlib:IsLocalization.eq_mk'_iff_mul_eq

**Acceptance**

- Regularity is an explicit hypothesis on the actual measure-ring denominator. A nonzero scalar moment alone is not used as a regularity certificate.

**Tests**

- SuggestedEisensteinParameterTests.canonical_fraction_comparison: For a with value p+1, the comparison recovers the existing canonical fraction with its exact regularity certificate.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### Uniform full-series clearing at every parameter

DirichletPadicLFunctions:L4/full-eisenstein-all-unit-clearing

Declaration: DirichletPadic.clearedEisensteinSeries_toFraction_all

Kind: theorem. Implementation: unchecked.

For every u∈U, PowerSeries.map(i)(N_u)=C(i Δ_u)E in Q[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- Apply native PowerSeries.ext, coeff_map and coeff_C_mul. In degree0, use the all-unit clearing equality for the same A₀.
- At each positive degree, the promoted integral numerator-series coefficient formula gives Δ_u A_n. The total-series constructor gives i(A_n). Multiplicativity of i identifies the two sides.
- The native coefficient construction and coeff_mk handle the zero/positive split. This extends the old canonical-parameter full-series clearing theorem while retaining it unchanged.

**Prerequisites**

- DirichletPadicLFunctions:L4/localized-eisenstein-all-unit-clearing
- DirichletPadicLFunctions:L4/integral-cleared-eisenstein-coefficients
- DirichletPadicLFunctions:L4/full-eisenstein-total-series
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- This is an equality after multiplication. It does not assume every away localization embeds into the total quotient.

**Tests**

- SuggestedEisensteinParameterTests.all_parameter_full_clearing: The same actual total series clears to the constructed N_u for every unit parameter, without a regularity hypothesis on that parameter.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### Embedding a regular smoothing localization

DirichletPadicLFunctions:L4/regular-eisenstein-away-inclusion

Declaration: DirichletPadic.regularEisensteinAwayToFraction

Kind: construction. Implementation: unchecked.

For u∈U and h_u:Δ_u∈nonZeroDivisors M, define J_u:S_u→+*Q by the native Away.lift of i. This map is injective and specializes to the previous canonical map.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- Native IsLocalization.map_units applied to the exact regular-denominator subtype makes i(Δ_u) a unit. Native Away.lift constructs the actual ring map; Away.lift_eq gives J_u(alg μ)=i(μ).
- Use native injective_iff_map_algebraMap_eq and IsFractionRing.injective, as for the earlier canonical map, to obtain injectivity. An equality in Q between original coefficients reflects to M, hence to S_u.
- For canonical a=p+1, unfold both map constructors. They are native lifts of the same ring map at the same denominator; proof irrelevance identifies their regularity certificates. This yields the exact canonical compatibility API.
- The constant-image API is promoted below. It uses the all-parameter fraction comparison. No new localization carrier or generic localization theory is introduced.

**Prerequisites**

- DirichletPadicLFunctions:L4/localized-eisenstein-regular-fraction
- DirichletPadicLFunctions:L4/eisenstein-away-inclusion
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-regular
- mathlib:IsLocalization.Away.lift
- mathlib:IsLocalization.Away.lift_eq
- mathlib:IsLocalization.map_units
- mathlib:IsLocalization.injective_iff_map_algebraMap_eq
- mathlib:IsFractionRing.injective

**Acceptance**

- The carrier Q remains the total quotient of a commutative ring. No field or integral-domain hypothesis is introduced.

**API**

- DirichletPadic.regularEisensteinAwayToFraction_def: J_u is the native Away.lift of i using the supplied regularity certificate.
- DirichletPadic.regularEisensteinAwayToFraction_algebraMap: J_u(alg μ)=i(μ) for every μ∈M.
- DirichletPadic.regularEisensteinAwayToFraction_injective: The coefficient map J_u is injective.
- DirichletPadic.regularEisensteinAwayToFraction_canonical: For canonical a, J_a agrees exactly with the preceding canonical Away-to-fraction map.
- DirichletPadic.regularEisensteinAwayToFraction_constant: J_u(A₀,u^away)=A₀. Promoted to regular-eisenstein-away-constant-image.

**Tests**

- SuggestedEisensteinParameterTests.regular_map_integral_coefficients: For every actual μ∈M the map sends alg(μ) to i(μ).
- SuggestedEisensteinParameterTests.regular_map_preserves_one: The map sends1 to1 in the native total quotient.
- SuggestedEisensteinParameterTests.regular_map_canonical_compatibility: For a with value p+1 this map is exactly the previous eisensteinAwayToFraction.

**Uses**

- Regular smoothing-parameter comparison: Places different native denominator localizations inside the same total quotient.
- Full source-series identification: Identifies every regular-parameter localized family with the existing total Eisenstein series.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### The constant image for every regular parameter

DirichletPadicLFunctions:L4/regular-eisenstein-away-constant-image

Declaration: DirichletPadic.regularEisensteinAwayToFraction_constant

Kind: comparison. Implementation: unchecked.

For every regular parameter u, J_u(A₀,u^away)=A₀.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- Unfold the existing away-constant fraction and the new native lift. Map its native clearing equation through J_u, using lift_eq on the original integral coefficients.
- The complete native regular-away-fraction lemma identifies this image with mk′_Q(n_u,Δ_u). Apply the preceding regular-fraction comparison to obtain the same actual A₀.
- Promote the constructor API unchanged. The assertion remains conditional on regularity in M and is not inferred merely from a chosen character denominator being nonzero.

**Prerequisites**

- DirichletPadicLFunctions:L4/regular-eisenstein-away-inclusion
- DirichletPadicLFunctions:L4/eisenstein-away-constant
- DirichletPadicLFunctions:L4/localized-eisenstein-regular-fraction
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.eq_mk'_iff_mul_eq
- mathlib:IsLocalization.Away.lift_eq

**Acceptance**

- The comparison uses actual native fraction and lift formulas, not an assumed identification of two independently named constants.

**Tests**

- SuggestedEisensteinParameterTests.regular_constant_image: The image is the existing localizedEisensteinConstant, independent of the chosen regular parameter.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### The full family is independent of the regular representative

DirichletPadicLFunctions:L4/regular-eisenstein-full-series-image

Declaration: DirichletPadic.regularEisensteinAwaySeries_toFraction

Kind: comparison. Implementation: unchecked.

For every regular parameter u, PowerSeries.map(J_u)(E_u^away)=E in Q[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z are the existing native carriers with the supplied commutative convolution algebra. Q=FractionRing M is the actual total quotient with canonical map i; no domain or field assumption is made.
- For u∈U write λ_u=padicIntrinsicNumerator p u, n_u=eisensteinWeightedNumerator p u=weight(j)(λ_u), d_u=eisensteinTwistedDenominator p u=uδ_u−1, and Δ_u=2d_u. The unit coordinate is j. A₀ is the existing localizedEisensteinConstant built with the canonical parameter p+1.
- S_u=Localization.Away(Δ_u), A₀,u^away, E_u^away, the total series E and the integral numerator series N_u are the preceding actual constructions. A regular parameter means precisely Δ_u∈nonZeroDivisors M; no such condition is imposed in the all-unit clearing statements.

**Construction or proof outline**

- Use native PowerSeries.ext and coeff_map. At degree0 apply the promoted regular constant-image theorem.
- At a positive degree use the promoted all-index away-series coefficient theorem. Native Away.lift_eq sends the included existing A_n to its image under i.
- The actual total-series coefficient constructor and coeff_mk identify the result with E at every index. Thus all regular-parameter representatives have the same full total-quotient image.

**Prerequisites**

- DirichletPadicLFunctions:L4/regular-eisenstein-away-constant-image
- DirichletPadicLFunctions:L4/regular-eisenstein-away-inclusion
- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- DirichletPadicLFunctions:L4/full-eisenstein-total-series
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_mk
- mathlib:IsLocalization.Away.lift_eq

**Acceptance**

- The statement generalizes the earlier canonical map without changing its interface. Specialization at arbitrary admissible noncanonical characters remains a separate step.

**Tests**

- SuggestedEisensteinParameterTests.regular_full_family_image: The whole localized series maps to the same totalEisensteinSeries, including its actual constant.

**Sources**

- RJW-published, Theorem8.2 and its proof, published159–160/PDF60–61; Lemma3.36(iii) on published131/PDF32 and the interpolation/uniqueness conclusion on published139/PDF40. These pages were read completely in this continuation;131 and139 reread for this checkpoint. Confirmed E54 correction retained.. Worker all-parameter comparison of the actual corrected Eisenstein constant. The previous integral cross-numerator relation is weighted by the fixed coordinate, using the supplied convolution evaluation, then the canonical regular denominator is cancelled in the total quotient. This avoids reconstructing the generic character-twist equivalence and does not assert every smoothing denominator regular. The source constant remains a twisted localized element, not an ordinary pseudomeasure.

### The character image of every smoothing denominator

DirichletPadicLFunctions:L4/eisenstein-all-parameter-denominator

Declaration: DirichletPadic.eisensteinMomentHom_denominator

Kind: lemma. Implementation: unchecked.

For every u∈U and e≥0, f_e(Δ_u)=2(u^(e+1)−1)=D(u,e).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Apply the existing all-measure moment formula to Δ_u. Evaluation of scalar multiplication by the integer2 is linear, so this is twice the included e-th moment of the shifted denominator.
- The promoted shifted-denominator moment theorem gives u^(e+1)−1 in Z. Map into Q_p, preserving the integer2, subtraction and powers. No restriction to the canonical parameter is needed.
- For u=1 the image is always0. For u=−1, it is−4 if e is even and0 if e is odd; characteristic0 makes the even case nonzero even when p=2. These are image calculations, not regularity assertions in M.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-moment
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- The exponent is e+1 because the denominator is shifted. The canonical nonvanishing theorem is retained unchanged.

**Tests**

- SuggestedAdmissibleEisensteinTests.identity_is_never_admissible: The identity parameter has denominator image0 at every exponent.
- SuggestedAdmissibleEisensteinTests.negative_parameter_even_exponent: For even e the negative-identity parameter has denominator image−4, including p=2.
- SuggestedAdmissibleEisensteinTests.negative_parameter_odd_exponent: For odd e the negative-identity parameter has denominator image0.
- SuggestedAdmissibleEisensteinTests.noncanonical_ternary_denominator: At p=3,u=2,e=1 the image is6.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### Evaluation at an arbitrary admissible smoothing parameter

DirichletPadicLFunctions:L4/admissible-eisenstein-away-evaluation

Declaration: DirichletPadic.admissibleEisensteinAwayMoment

Kind: construction. Implementation: unchecked.

For u,e and h:D(u,e)≠0, define E_(u,e,h):S_u→+*Q_p as the native Away.lift of f_e. It is the unique extension of f_e to this localization.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Rewrite the image of Δ_u by the preceding denominator formula. Native isUnit_iff_ne_zero turns h into the exact IsUnit hypothesis needed by Away.lift.
- Construct the actual ring homomorphism on S_u. Away.lift_eq gives agreement on every integral coefficient. Compose with the existing all-measure moment formula; this API is promoted in the following node.
- Unfold Away.lift to native IsLocalization.lift. Its constructor provides invertible images for every power of Δ_u. Native lift_unique, with that same power-submonoid certificate, proves uniqueness for any map agreeing with f_e on all original coefficients. A complete native lemma checks this exact interface.
- For canonical a, both this map and the previous eisensteinAwayMoment are lifts of the same f_e at the same denominator. Their proof arguments agree by proof irrelevance, giving canonical compatibility. The constant-value API is promoted below.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-all-parameter-denominator
- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- DirichletPadicLFunctions:L4/eisenstein-away-evaluation
- mathlib:IsLocalization.Away.lift
- mathlib:IsLocalization.Away.lift_eq
- mathlib:IsLocalization.lift_unique
- mathlib:isUnit_iff_ne_zero

**Acceptance**

- No total-quotient evaluator is constructed. The general coefficient-field supplier request remains open. No regularity certificate in M is required by this constructor.

**API**

- DirichletPadic.admissibleEisensteinAwayMoment_def: The map is the native Away.lift of f_e, using the displayed nonzero denominator image.
- DirichletPadic.admissibleEisensteinAwayMoment_algebraMap: E_(u,e,h)(alg μ)=ι(μ(j^e)). Promoted to admissible-eisenstein-integral-agreement.
- DirichletPadic.admissibleEisensteinAwayMoment_unique: Any ring map S_u→Q_p extending f_e equals E_(u,e,h).
- DirichletPadic.admissibleEisensteinAwayMoment_canonical: For a=p+1 the map agrees with eisensteinAwayMoment p a ha e.
- DirichletPadic.admissibleEisensteinAwayMoment_constant: The constant image is the same rational Bernoulli value. Promoted to admissible-eisenstein-constant-value.

**Tests**

- SuggestedAdmissibleEisensteinTests.admissible_evaluator_one: The constructed ring map sends1 to1.
- SuggestedAdmissibleEisensteinTests.admissible_evaluator_integral_agreement: It agrees with the included e-th moment of every actual integral measure.
- SuggestedAdmissibleEisensteinTests.admissible_evaluator_unique_extension: All-coefficient agreement determines the extension uniquely on S_u.
- SuggestedAdmissibleEisensteinTests.admissible_evaluator_canonical: At a with value p+1 it equals the previous canonical evaluator.

**Uses**

- Parameter-independent Eisenstein specialization: Evaluates the actual full family on every displayed admissible smoothing localization.
- RJW Theorem8.2(b): Supplies a valid arithmetic evaluation with an explicit denominator condition.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### Agreement on every integral coefficient

DirichletPadicLFunctions:L4/admissible-eisenstein-integral-agreement

Declaration: DirichletPadic.admissibleEisensteinAwayMoment_algebraMap

Kind: lemma. Implementation: unchecked.

For every actual μ∈M and admissible (u,e,h), E_(u,e,h)(alg μ)=ι(μ(j^e)).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Unfold the actual Away.lift. Native lift_eq evaluates it on algebraMap μ as f_e(μ).
- Apply the promoted all-measure moment formula. A complete native agreement lemma verifies the original-coefficient computation before any particular Eisenstein coefficient is substituted.
- In particular native Dirac evaluation gives u-independent values v^e on the image of δ_v. This is the uniform positive-coefficient comparison used below.

**Prerequisites**

- DirichletPadicLFunctions:L4/admissible-eisenstein-away-evaluation
- DirichletPadicLFunctions:L4/eisenstein-moment-hom-evaluation
- mathlib:IsLocalization.Away.lift_eq
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- This promotes the construction API at every actual integral measure, with no assumption that a chosen coefficient generates the measure ring.

**Tests**

- SuggestedAdmissibleEisensteinTests.admissible_integral_dirac: The image of the included atom δ_v is v^e for every unit v.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### The constant value is independent of admissible smoothing

DirichletPadicLFunctions:L4/admissible-eisenstein-constant-value

Declaration: DirichletPadic.admissibleEisensteinAwayMoment_constant

Kind: theorem. Implementation: unchecked.

For every admissible (u,e,h), E_(u,e,h)(A₀,u^away)=ι_Q(−(1−p^e)B_(e+1)/(2(e+1))).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Use the actual away-constant fraction and apply the ring map to its native mk′ clearing equation. The complete native fraction lemma gives f_e(n_u)/f_e(Δ_u), dividing only by h.
- Substitute the promoted weighted-numerator moment (1−p^e)(1−u^(e+1))ι_Q(B_(e+1)/(e+1)) and the new denominator formula2(u^(e+1)−1).
- The nonzero product h implies that both2 and u^(e+1)−1 are nonzero in Q_p. Cancel the latter and retain the minus sign and factor2. The complete native cancellation lemma checks this algebra in a field under exactly the product-nonvanishing hypothesis.
- Preservation of rational casts identifies the result with the displayed rational expression. At p=3,u=2,e=1 the numerator is1/2 and denominator6, giving1/12. At p=2,u=5,e=3 they are−182/5 and1248, giving−7/240.
- The negative-identity parameter is admitted at even exponents; its weighted numerator and constant value both vanish. The identity parameter and negative identity at odd exponents fail the hypothesis and are not assigned a value by this construction.

**Prerequisites**

- DirichletPadicLFunctions:L4/admissible-eisenstein-away-evaluation
- DirichletPadicLFunctions:L4/admissible-eisenstein-integral-agreement
- DirichletPadicLFunctions:L4/eisenstein-away-constant
- DirichletPadicLFunctions:L4/weighted-eisenstein-numerator-moment
- DirichletPadicLFunctions:L4/eisenstein-all-parameter-denominator
- mathlib:IsLocalization.mk'_spec'
- mathlib:IsLocalization.Away.lift_eq
- mathlib:eq_div_iff

**Acceptance**

- Cancellation occurs only after evaluation in Q_p. It does not imply regularity or cancellation of the same measure-ring denominator.

**Tests**

- SuggestedAdmissibleEisensteinTests.noncanonical_ternary_constant: At p=3,u=2,e=1 the constant is1/12.
- SuggestedAdmissibleEisensteinTests.noncanonical_dyadic_constant: At p=2,u=5,e=3 the constant is−7/240.
- SuggestedAdmissibleEisensteinTests.admissible_torsion_zero_constant: At the negative-identity parameter and exponent2 the admissible constant is0.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### Every admissible parameter gives the canonical full series

DirichletPadicLFunctions:L4/admissible-eisenstein-full-canonical

Declaration: DirichletPadic.admissibleEisensteinSeries_canonical

Kind: comparison. Implementation: unchecked.

For admissible (u,e,h) and canonical a, map(E_(u,e,h))(E_u^away)=map(eisensteinAwayMoment(a,e))(E_a^away) in Q_p[[q]].

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Apply native PowerSeries.ext and coeff_map. At degree0 the promoted coefficient formula reduces both sides to their actual away constants.
- Use the new arbitrary-parameter constant-value theorem and the old canonical constant-value theorem. They give the same rational Bernoulli expression.
- At every positive index, the promoted full-series coefficient formula gives the included same actual measure A_n on each side. The new all-integral agreement and the old promoted canonical integral-evaluation theorem give the same included moment A_n(j^e).
- The complete native mapped-full-series lemma checks the zero/positive coefficient argument even when the two source coefficient rings differ. No identification between S_u and S_a or embedding into the total quotient is needed.

**Prerequisites**

- DirichletPadicLFunctions:L4/admissible-eisenstein-constant-value
- DirichletPadicLFunctions:L4/eisenstein-away-constant-value
- DirichletPadicLFunctions:L4/admissible-eisenstein-integral-agreement
- DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation
- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map

**Acceptance**

- Equality is in the common target Q_p[[q]]; the two denominator-localization carriers remain distinct.

**Tests**

- SuggestedAdmissibleEisensteinTests.admissible_full_canonical_comparison: The whole series, including degree0, agrees with the previous canonical arithmetic family.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### The specialized family is independent of smoothing

DirichletPadicLFunctions:L4/admissible-eisenstein-full-independent

Declaration: DirichletPadic.admissibleEisensteinSeries_independent

Kind: comparison. Implementation: unchecked.

For u,v admissible at the same exponent e, map(E_(u,e))(E_u^away)=map(E_(v,e))(E_v^away).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Choose the existing canonical unit a with value p+1 using the supplied one-add-prime-unit construction.
- Apply the preceding full canonical comparison once to u and once to v, with the same a and exponent. Transitivity with the second equality reversed identifies the two full target power series.
- Each map retains its own admissibility proof and domain. The argument also applies when a parameter is torsion but its chosen character denominator is nonzero.

**Prerequisites**

- DirichletPadicLFunctions:L4/admissible-eisenstein-full-canonical
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit

**Acceptance**

- This is independence of arithmetic specialization. It does not assert isomorphic source localizations or regularity of every admissible measure denominator.

**Tests**

- SuggestedAdmissibleEisensteinTests.admissible_full_parameter_independence: Any two parameters admissible at the same moment exponent give equal full field power series.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### The common rational classical series for every admissible parameter

DirichletPadicLFunctions:L4/admissible-eisenstein-common-classical

Declaration: DirichletPadic.admissibleEisensteinSeries_common

Kind: comparison. Implementation: unchecked.

For even w≥4 and u admissible at e=w−1, there exists a unique F∈ℚ[[q]] whose complex image is the actual period1 q-expansion of pStabilizedEisenstein(p,w) and whose Q_p image is map(E_(u,w−1))(E_u^away).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing actual commutative convolution algebra. j is the unit coordinate and f_e=eisensteinMomentHom p e is the supplied matching-coefficient character-integral map followed by Z→Q_p.
- For u∈U write Δ_u=2·eisensteinTwistedDenominator p u and n_u=eisensteinWeightedNumerator p u. S_u=Localization.Away(Δ_u), A₀,u^away and E_u^away are the existing native localization, constant and full power series.
- For e≥0 set D(u,e)=2(u^(e+1)−1) in Q_p. Character admissibility means exactly D(u,e)≠0. It neither assumes nor proves Δ_u∈nonZeroDivisors M. Canonical a means the existing unit with value p+1.

**Construction or proof outline**

- Choose the supplied canonical unit a=p+1. The previous full-eisenstein-common-series theorem gives a unique rational series with the actual classical q-expansion and the canonical arithmetic specialization.
- The new full canonical comparison at the exact exponent w−1 identifies the admissible-u specialization with the canonical specialization. Substitute this equality in the second component of the existing property.
- Both existence and uniqueness transfer along that equality; the complex comparison and its injective rational coefficient map remain unchanged. The positive coefficient exponent is w−1, while the denominator exponent is (w−1)+1=w because w≥4.
- At p=2,u=5,w=4 the common constant is−7/240 and all positive coefficients are the existing depleted divisor sums. Separate rational coefficient maps are used for C and Q_p.

**Prerequisites**

- DirichletPadicLFunctions:L4/admissible-eisenstein-full-canonical
- DirichletPadicLFunctions:L4/full-eisenstein-common-series
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit

**Acceptance**

- The comparison includes the actual constant and every positive coefficient. No rational-to-Z_p map, complex-to-Q_p map or geometric family assertion is introduced.

**Tests**

- SuggestedAdmissibleEisensteinTests.noncanonical_common_dyadic_series: The p=2,u=5,w=4 full specialization and actual classical q-expansion are separate images of a unique rational power series.

**Sources**

- RJW-published, Definition3.34, formula(3-11) and Remark3.35, published129–130/PDF30–31; Definition8.1 and Theorem8.2 with its proof, published159–160/PDF60–61. All four pages reread completely for this checkpoint. Existing source qualifications and confirmed E54 retained.. Worker comparison of the actual shifted-denominator localizations at an arithmetic character. Only the displayed denominator image is inverted. The existing corrected constant and integral positive coefficients yield the same full specialization for every admissible parameter. This does not use the erroneous unrestricted total-quotient evaluator in Remark3.35 or the ordinary-pseudomeasure assertion in Theorem8.2(a).

### The doubled constant is the shifted arithmetic moment

DirichletPadicLFunctions:L4/eisenstein-double-constant-moment

Declaration: DirichletPadic.eisensteinAwayMoment_double_constant

Kind: lemma. Implementation: unchecked.

For every canonical a and e≥0, 2E_(a,e)(A₀,a^away)=positivePseudoMoment(p,e+1,ζ_p).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- The existing constant-value theorem expresses E_(a,e)(A₀,a^away) as the Q_p image of−(1−p^e)B_(e+1)/(2(e+1)). Multiply by2 in Q_p.
- The existing actual arithmetic positive-Bernoulli theorem at degree e+1 expresses its positivePseudoMoment as−(1−p^e) times the image of B_(e+1)/(e+1). This degree is positive for every e≥0.
- Preservation of rational arithmetic and cancellation of the nonzero integer2 in Q_p identify the expressions. The complete native doubled-scalar lemma checks the factor2. No division by2 in Z_p or its measure ring is used.
- At e=0 both sides vanish through the Euler factor. At p=2,e=3 the doubled value is−7/120; at p=3,e=1 it is1/6.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-constant-value
- DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli

**Acceptance**

- This compares actual admissible evaluations. It is not an unconditional construction of the missing total-quotient character-twist equivalence.

**Tests**

- SuggestedEisensteinObstructionTests.double_constant_dyadic: The doubled p=2,e=3 constant is−7/120.
- SuggestedEisensteinObstructionTests.double_constant_ternary: The doubled p=3,e=1 constant is1/6.
- SuggestedEisensteinObstructionTests.double_constant_zero_exponent: The doubled exponent0 constant is0, agreeing with the actual first arithmetic moment.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### Moments forced by an ordinary clearing candidate

DirichletPadicLFunctions:L4/eisenstein-ordinary-clearing-candidate

Declaration: DirichletPadic.localizedEisensteinConstant_clearing_candidate

Kind: lemma. Implementation: unchecked.

If g∈U and μ∈M satisfy i(μ)=i(δ_g−1)A₀, then for every e≥0 and canonical a, ι(μ(j^e))=(g^e−1)E_(a,e)(A₀,a^away).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- The existing J_a is injective, sends every alg(ν) to i(ν), and sends A₀,a^away to A₀. Rewrite the assumed equality as equality of the J_a-images of alg(μ) and alg(δ_g−1)A₀,a^away.
- Injectivity reflects this to an equality inside S_a. Apply E_(a,e), using multiplicativity. The complete native reflection lemma verifies this argument for actual ring homomorphisms with precisely the coefficient-agreement and injectivity hypotheses.
- The promoted all-integral evaluation theorem identifies the first factor with the included test moment of δ_g−1. Native Dirac evaluation gives g^e; the supplied convolution identity is δ_1, which gives1. Hence this factor is g^e−1.
- The same promoted agreement identifies the left side with ι(μ(j^e)). Evaluation has occurred exclusively inside S_a, after reflecting the Q-equality; no map from arbitrary total fractions to Q_p is assumed.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-away-inclusion
- DirichletPadicLFunctions:L4/eisenstein-away-constant-image
- DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The hypothesis is an alleged integral representative, not an existence assertion. Ordinary and shifted clearing factors are kept distinct.

**Tests**

- SuggestedEisensteinObstructionTests.identity_clearing_candidate_moments: A candidate clearing the ordinary identity factor has every moment0.
- SuggestedEisensteinObstructionTests.arbitrary_clearing_candidate_moments: For any g, a candidate’s e-th moment has the ordinary factor g^e−1, without the source’s shifted exponent.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### The sign factor forces negative arithmetic moments

DirichletPadicLFunctions:L4/eisenstein-sign-clearing-candidate

Declaration: DirichletPadic.localizedEisensteinConstant_sign_candidate

Kind: lemma. Implementation: unchecked.

If i(μ)=i(δ_−1−1)A₀ and k>0, then ι(μ(j^(2k−1)))=−positivePseudoMoment(p,2k,ζ_p).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- Choose the supplied canonical unit a=p+1 and apply the ordinary-clearing candidate theorem at g=−1 and e=2k−1.
- Since k>0, the natural number2k−1 is odd. Its ordinary factor is (−1)^(2k−1)−1=−2 in Q_p.
- The doubled-constant comparison at that exponent has degree (2k−1)+1=2k. Substitute it to identify−2 times the constant value with the negative actual positive arithmetic moment.
- The complete native sign-clearing lemma checks the parity and multiplication step. For even test exponents the ordinary sign factor is0 instead, as recorded by a separate control.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-ordinary-clearing-candidate
- DirichletPadicLFunctions:L4/eisenstein-double-constant-moment
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit

**Acceptance**

- The dyadic sign factor−2 is retained. It need not be an integral unit for the norm obstruction.

**Tests**

- SuggestedEisensteinObstructionTests.sign_candidate_second_shift: At k=1 the candidate’s first moment is the negative actual second arithmetic moment.
- SuggestedEisensteinObstructionTests.sign_candidate_even_test_zero: At every even test exponent the candidate’s ordinary sign-cleared moment is0.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### The ordinary sign factor does not clear the constant

DirichletPadicLFunctions:L4/eisenstein-sign-clearing-not-integral

Declaration: DirichletPadic.localizedEisensteinConstant_sign_not_integral

Kind: theorem. Implementation: unchecked.

The actual element i(δ_−1−1)A₀ does not belong to Set.range(i).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- Suppose an integral representative μ exists. Put k=p−1, which is positive by primality. The preceding candidate theorem identifies its moment at exponent2(p−1)−1 with the negative actual arithmetic moment at degree2(p−1).
- The existing arithmetic-positive-moment-norm theorem applies because p−1 divides2(p−1). It gives norm at least p for this actual moment.
- But μ(j^(2(p−1)−1)) is an element of Z_p. Native PadicInt.norm_le_one and norm_def bound its image norm by1; negation leaves the norm unchanged.
- Primality gives p>1, contradicting these two bounds. The complete native integral-value-obstruction lemma checks this step for every prime, including2.
- For p=2 the witness exponent is1 and the forced value is−1/12, of norm4. For p=3 the chosen uniform witness exponent is3 and the value is13/60, of norm3.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-sign-clearing-candidate
- DirichletPadicLFunctions:L1/arithmetic-positive-moment-norm
- mathlib:PadicInt.norm_le_one
- mathlib:PadicInt.norm_def

**Acceptance**

- This excludes an actual integral representative in the native total quotient. A finite numerical table alone is not used as the general proof.

**Tests**

- SuggestedEisensteinObstructionTests.sign_clearing_dyadic_not_integral: At p=2 the ordinary sign-cleared total-quotient element has no integral measure representative.
- SuggestedEisensteinObstructionTests.sign_clearing_ternary_not_integral: The same obstruction holds at p=3.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### The corrected constant is not an ordinary pseudomeasure

DirichletPadicLFunctions:L4/eisenstein-not-ordinary-pseudomeasure

Declaration: DirichletPadic.localizedEisensteinConstant_not_pseudomeasure

Kind: theorem. Implementation: unchecked.

For every prime p, A₀∉Iwasawa.pseudomeasures(diracHom)Q.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- Assume ordinary pseudomeasure membership. Apply the supplier’s promoted mem_pseudomeasures_iff characterization.
- At the actual unit−1 it supplies μ∈M with i(μ)=i(δ_−1−1)A₀.
- This contradicts the preceding sign-clearing nonintegrality theorem. The argument uses the ordinary pseudomeasure definition exactly as supplied.
- The earlier shifted clearing theorem i(2(uδ_u−1))A₀=i(n_u) remains unchanged. At u=−1 its numerator is0; this is a different factor and gives no ordinary membership.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-sign-clearing-not-integral
- PadicMeasuresIwasawaAlgebras:L3/pseudomeasure-membership

**Acceptance**

- This directly supports the already confirmed E54 correction without introducing a duplicate source finding or asserting an independent review. The generic twist request remains open.

**Tests**

- SuggestedEisensteinObstructionTests.dyadic_not_ordinary_pseudomeasure: The actual dyadic constant is outside the ordinary pseudomeasure submodule.
- SuggestedEisensteinObstructionTests.ternary_not_ordinary_pseudomeasure: The actual ternary constant is outside the ordinary pseudomeasure submodule.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### The corrected constant is not an integral measure

DirichletPadicLFunctions:L4/eisenstein-constant-not-integral

Declaration: DirichletPadic.localizedEisensteinConstant_not_integral

Kind: theorem. Implementation: unchecked.

For every prime p, A₀∉Set.range(i).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- If A₀=i(ν) for an actual ν∈M, the integral convolution-ring product μ=(δ_−1−1)ν satisfies i(μ)=i(δ_−1−1)A₀ by multiplicativity of i.
- This contradicts sign-clearing nonintegrality. The complete native nonintegral-clearing lemma checks this purely ring-theoretic implication.
- The conclusion concerns the exact existing localized constant, with all factors2 retained. It is stronger than merely observing that some rational presentation has a denominator.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-sign-clearing-not-integral
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra

**Acceptance**

- No domain assumption on M and no cancellation of a torsion denominator is introduced.

**Tests**

- SuggestedEisensteinObstructionTests.constant_not_any_integral_image: Every actual μ∈M has i(μ)≠A₀.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### No bounded field measure has all the constant values

DirichletPadicLFunctions:L4/eisenstein-constant-no-field-measure

Declaration: DirichletPadic.eisensteinAwayConstant_no_field_measure

Kind: theorem. Implementation: unchecked.

For canonical a there is no μ∈D(U,Q_p) with μ(t^e)=E_(a,e)(A₀,a^away) for every e≥0.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing supplied commutative convolution ring. Q=FractionRing M is the native total quotient and i:M→Q its canonical injection, with no domain or field hypothesis on M.
- A₀=localizedEisensteinConstant p is the existing actual constant. For canonical a with value p+1, S_a is its doubled shifted-denominator localization, J_a:S_a→Q the existing injective ring map, E_(a,e):S_a→Q_p its actual moment evaluator, and A₀,a^away its representative.
- j:U→Z and t:U→Q_p are the native continuous coordinate tests. The ordinary pseudomeasure submodule is the supplied Iwasawa.pseudomeasures(diracHom)Q, defined using δ_g−1. Norms of field measures below belong to their existing continuous linear functional, not to a new norm on the weak measure carrier.

**Construction or proof outline**

- Suppose such a native field-valued measure μ exists and put B=‖AbstractMeasure.toCLMEquiv μ‖. Native compactness of U and PadicInt.norm_le_one imply ‖t^e‖≤1 for every e.
- Native ContinuousMap.norm_le and ContinuousLinearMap.le_opNorm_of_le give ‖μ(t^e)‖≤B uniformly. A complete native field-measure-power-bound proof checks these exact carriers and topologies.
- For each positive n, set e=n−1. The doubled-constant comparison and the assumed moment agreement give positivePseudoMoment(p,n,ζ_p)=2μ(t^(n−1)). Therefore all these actual positive arithmetic moments have norm at most ‖2‖B.
- Apply the previously proved arithmetic-unbounded-moments theorem at the real bound ‖2‖B. Its positive witness contradicts the uniform inequality. A complete native doubled-moments-obstruction lemma verifies the contradiction, including the exponent shift.
- This excludes field-valued measures of arbitrary finite operator norm, not just integral measures. It does not identify coefficient extension with scalar extension or infer an analytic pole order or residue.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-double-constant-moment
- DirichletPadicLFunctions:L1/arithmetic-unbounded-moments
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousLinearMap.le_opNorm_of_le
- mathlib:PadicInt.compactSpace
- mathlib:PadicInt.norm_le_one
- mathlib:PadicInt.norm_def

**Acceptance**

- The boundedness argument uses the existing continuous functional norm. The weak measure carrier is not assigned a new norm topology.

**Tests**

- SuggestedEisensteinObstructionTests.field_measure_fails_some_exponent: Every native field-valued measure disagrees with the actual constant evaluator at some natural exponent.
- SuggestedEisensteinObstructionTests.dyadic_identity_atom_fails: The Q_2 identity atom has first moment1, while the actual exponent1 constant value is1/24.

**Sources**

- RJW-published, Definitions3.7–3.8 and the integral-measure criterion, published119–120/PDF20–21, reread completely for this checkpoint. Definition3.34 and Theorem8.2 with its proof, published129/PDF30 and159–160/PDF60–61, read completely in preceding4693 during this continuation. Confirmed E54 correction retained.. Worker proof that the actual corrected Eisenstein constant is not an ordinary pseudomeasure. Its negative-identity ordinary clearing factor would have a nonintegral arithmetic moment. The source’s shifted numerator relation remains valid; the false ordinary-membership clause is not assumed. A separate native continuous-dual bound excludes a field-valued measure with all the same arithmetic values. No analytic pole order or residue is concluded from unboundedness alone.

### The inverse-coordinate arithmetic character

DirichletPadicLFunctions:L4/eisenstein-inverse-character

Declaration: DirichletPadic.eisensteinInverseCharacter

Kind: construction. Implementation: unchecked.

Define κ⁻:ContinuousMonoidHom U Z by κ_(0,1,1) composed with native inversion on U. It is nontrivial for every prime.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- The existing arithmetic coordinate character is a continuous multiplicative map to Z. The native ContinuousMonoidHom.inv on the commutative topological group U is continuous and multiplicative. Compose these actual maps using native ContinuousMonoidHom.comp.
- Its pointwise inverse-unit formula is promoted below. Multiplying that value by the original unit value gives1 by the native unit inverse law. This takes no inverse of an arbitrary nonunit p-adic integer.
- For nontriviality choose the supplied unit a=p+1. If κ⁻ were the trivial character, its value at a would be1, and the unit inverse law would give a=1 in Z. The characteristic-zero inclusion of the natural number p+1 contradicts p>0.
- A complete native constructor and inverse-product/nontrivial-value lemmas verify the exact unit carrier and topology. Generic continuous characters and their inversion are reused from the libraries.

**Prerequisites**

- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- mathlib:ContinuousMonoidHom.comp
- mathlib:ContinuousMonoidHom.inv

**Acceptance**

- This is the specific arithmetic character needed by the corrected Eisenstein denominator. It is not a reconstruction of general character-space theory.

**API**

- DirichletPadic.eisensteinInverseCharacter_def: The character is κ_(0,1,1) composed with ContinuousMonoidHom.inv U.
- DirichletPadic.eisensteinInverseCharacter_apply: κ⁻(u) is the underlying Z-value of u⁻¹. Promoted to eisenstein-inverse-character-value.
- DirichletPadic.eisensteinInverseCharacter_mul: u·κ⁻(u)=1 in Z for every actual unit u.
- DirichletPadic.eisensteinInverseCharacter_ne_one: κ⁻ is nontrivial, witnessed by the supplied unit p+1.

**Tests**

- SuggestedInverseCharacterTests.inverse_character_identity: The inverse-coordinate character sends1 to1.
- SuggestedInverseCharacterTests.inverse_character_negative_identity: It sends−1 to−1, including p=2.
- SuggestedInverseCharacterTests.inverse_character_nontrivial: It is not the trivial continuous character at any prime.

**Uses**

- Corrected RJW Theorem8.2 denominator: The coordinate shift places its denominator obstruction at the inverse coordinate.
- Actual integral evaluation: Supplies a concrete integral continuous character to the existing character-integral algebra homomorphism.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### The exact inverse-unit value

DirichletPadicLFunctions:L4/eisenstein-inverse-character-value

Declaration: DirichletPadic.eisensteinInverseCharacter_apply

Kind: lemma. Implementation: unchecked.

For every u∈U, κ⁻(u)=(u⁻¹:U):Z.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- Unfold the native composition and inversion. Apply the promoted level-zero coordinate-character formula at the actual unit u⁻¹, with exponent1.
- The coefficient algebra is Z over itself, so its algebraMap is the identity and the first power simplifies. This gives the exact coerced group inverse.
- The native inverse_apply lemma is definitional for the corresponding concrete native coordinate map. At p=3,u=2 the value satisfies2κ⁻(u)=1 in Z_3.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-inverse-character
- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- mathlib:ContinuousMonoidHom.comp
- mathlib:ContinuousMonoidHom.inv

**Acceptance**

- The inverse is a group operation on units; no nonexistent division structure on Z_p is introduced.

**Tests**

- SuggestedInverseCharacterTests.inverse_character_ternary_two: At the actual ternary unit represented by2, twice its inverse-character value is1.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### Integral evaluation at the inverse coordinate

DirichletPadicLFunctions:L4/eisenstein-inverse-moment-hom

Declaration: DirichletPadic.eisensteinInverseMomentHom

Kind: construction. Implementation: unchecked.

Define f⁻:M→+*Q_p by the supplied characterIntegralAlgHom at κ⁻ followed by the native coefficient inclusion Z→Q_p.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- Apply the existing matching-coefficient characterIntegralAlgHom to κ⁻. Its source is the actual convolution algebra M and its target is Z.
- Forget to its ring homomorphism and compose with algebraMap Z Q_p. This constructs f⁻ on every actual integral measure with inherited unit and multiplicative laws.
- The all-measure evaluation formula is promoted below. Native Dirac evaluation and the promoted inverse-character value identify f⁻(δ_u) with the included underlying inverse-unit value.
- The ordinary factor at the ternary canonical unit4 has image1/4−1=−3/4. Thus vanishing of the shifted factors proved below does not result from a trivial character or a zero ring map.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-inverse-character-value
- PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
- mathlib:PadicInt.algebraMap_apply
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The map is on integral measures only. It uses the existing matching-coefficient algebra map and does not discharge the generic coefficient-field supplier request.

**API**

- DirichletPadic.eisensteinInverseMomentHom_def: f⁻ is algebraMap Z Q_p composed with the ring map underlying characterIntegralAlgHom κ⁻.
- DirichletPadic.eisensteinInverseMomentHom_apply: f⁻(μ)=ι(μ(κ⁻.toContinuousMap)). Promoted to eisenstein-inverse-moment-agreement.
- DirichletPadic.eisensteinInverseMomentHom_dirac: f⁻(δ_u)=ι((u⁻¹:U):Z).

**Tests**

- SuggestedInverseCharacterTests.inverse_moment_unit: The actual ring map sends1 to1.
- SuggestedInverseCharacterTests.inverse_moment_sign_atom: The sign atom has value−1.
- SuggestedInverseCharacterTests.inverse_moment_ordinary_factor: At p=3 and u=4, the ordinary difference δ_u−1 has value−3/4.

**Uses**

- Shifted denominator image: Computes the obstruction using an actual integral ring homomorphism.
- Localization nonextension: Fixes the exact original-coefficient agreement that an alleged extension would have to satisfy.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### Agreement with the actual inverse-coordinate integral

DirichletPadicLFunctions:L4/eisenstein-inverse-moment-agreement

Declaration: DirichletPadic.eisensteinInverseMomentHom_apply

Kind: lemma. Implementation: unchecked.

For every actual μ∈M, f⁻(μ)=ι(μ(κ⁻.toContinuousMap)).

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- Unfold the constructed composite. The supplier characterIntegralAlgHom has underlying function given by evaluation on its character test.
- The following coefficient map is exactly the native inclusion of the resulting p-adic integer into Q_p. No extension of the measure carrier or change of coefficient module is used.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-inverse-moment-hom
- PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
- mathlib:PadicInt.algebraMap_apply

**Acceptance**

- This supplies the uniform integral evaluation interface before any fraction is introduced.

**Tests**

- SuggestedInverseCharacterTests.inverse_moment_all_integral_measures: The agreement holds at every actual integral measure, not merely at Dirac atoms.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### Every shifted denominator has zero inverse-coordinate image

DirichletPadicLFunctions:L4/eisenstein-inverse-denominator-zero

Declaration: DirichletPadic.eisensteinInverseMomentHom_denominator

Kind: lemma. Implementation: unchecked.

For every u∈U, f⁻(Δ_u)=0.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- The shifted denominator is2(uδ_u−1). By the promoted all-measure evaluation, native linearity, Dirac evaluation and the convolution identity δ_1, its image is2(uκ⁻(u)−1).
- Use the promoted inverse-character value to identify uκ⁻(u) with the product of an actual unit and its inverse, hence1.
- The result is0 already in Z, and remains0 after inclusion in Q_p. The complete native shifted-denominator-zero lemma checks the same calculation with an actual coefficient-preserving algebra homomorphism.
- This includes the canonical regular denominator at p+1. Nonzero-divisor regularity in M does not imply nonzero image under this character.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-inverse-character-value
- DirichletPadicLFunctions:L4/eisenstein-inverse-moment-agreement
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator
- PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The vanishing concerns shifted denominators. It does not assert that all ordinary Dirac differences have zero image.

**Tests**

- SuggestedInverseCharacterTests.inverse_shifted_identity_zero: The identity-parameter shifted denominator has image0.
- SuggestedInverseCharacterTests.inverse_shifted_dyadic_canonical_zero: The doubled shifted denominator at the dyadic canonical unit3 also has image0, despite its established regularity in M.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### No smoothing localization admits this character evaluation

DirichletPadicLFunctions:L4/eisenstein-inverse-no-away-extension

Declaration: DirichletPadic.eisensteinInverseMomentHom_no_away_extension

Kind: theorem. Implementation: unchecked.

For every u∈U there is no ring homomorphism F:S_u→+*Q_p whose value on alg(μ) is f⁻(μ) for every μ∈M.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- Suppose such an F exists. The denominator Δ_u belongs to its own powers submonoid, so native IsLocalization.map_units makes alg(Δ_u) a unit in S_u.
- A ring homomorphism preserves units. Hence F(alg(Δ_u)) must be a unit in Q_p.
- The assumed agreement on integral coefficients and the preceding denominator-zero theorem identify that value with0. Zero is not a unit in the nontrivial field Q_p, a contradiction.
- The complete native no-away-extension lemma checks this argument with the actual native localization. It also handles u=1, whose localization is the zero ring.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-inverse-denominator-zero
- mathlib:IsLocalization.map_units
- mathlib:Submonoid.mem_powers
- mathlib:isUnit_iff_ne_zero

**Acceptance**

- This excludes ring-map extension on the displayed localization. It does not prove that a particular smaller-domain function has a nonremovable analytic singularity.

**Tests**

- SuggestedInverseCharacterTests.inverse_no_parameter_away_extension: No choice of smoothing parameter supplies an Away extension of this actual integral character map.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### No total-quotient extension at the inverse coordinate

DirichletPadicLFunctions:L4/eisenstein-inverse-no-fraction-extension

Declaration: DirichletPadic.eisensteinInverseMomentHom_no_fraction_extension

Kind: theorem. Implementation: unchecked.

There is no ring homomorphism F:Q→+*Q_p agreeing with f⁻ on the image of every integral measure.

**Hypotheses**

- p is any prime, including2. Z=Z_p, U=Zˣ and M=AbstractMeasure U Z Z use the existing native carriers and supplied actual commutative convolution algebra. Q=FractionRing M is the total quotient, not an assumed field.
- The existing arithmetic character κ_(0,1,1):U→Z is the unit coordinate. Native continuous group inversion on U defines its inverse-coordinate composite. The inverse is taken in U before coercion into Z.
- For u∈U let Δ_u=2·eisensteinTwistedDenominator p u=2(uδ_u−1), and S_u=Localization.Away(Δ_u). These are the preceding actual native denominators and localizations.

**Construction or proof outline**

- Choose the supplied canonical unit a=p+1. The preceding doubled shifted-denominator regularity theorem gives Δ_a∈nonZeroDivisors M.
- Native IsLocalization.map_units makes i(Δ_a) a unit in Q. Its image under any alleged F is therefore a unit in Q_p.
- All-integral agreement and the inverse-denominator-zero theorem force that image to be0, contradicting nontriviality of Q_p. The complete native no-fraction-extension lemma verifies this exact regular-denominator argument.
- The character itself is nontrivial. Thus nontriviality alone is insufficient for an unrestricted total-quotient ring-map extension, as already recorded in the source qualifications. This does not alter the existing admissible ordinary-pseudomeasure evaluation API.

**Prerequisites**

- DirichletPadicLFunctions:L4/eisenstein-inverse-denominator-zero
- DirichletPadicLFunctions:L4/twisted-eisenstein-denominator-regular
- PadicMeasuresIwasawaAlgebras:L3/one-add-prime-unit
- mathlib:IsLocalization.map_units
- mathlib:isUnit_iff_ne_zero

**Acceptance**

- The proof uses a known regular denominator, with no assumption that the measure ring is a domain. Analytic pole and residue constructions remain separate work.

**Tests**

- SuggestedInverseCharacterTests.inverse_no_dyadic_total_extension: The actual inverse-coordinate integral map at p=2 has no total-quotient extension.
- SuggestedInverseCharacterTests.inverse_no_ternary_total_extension: The same nonextension holds at p=3.

**Sources**

- RJW-published, Definition3.34, equation(3-11), Remark3.35, published129–130/PDF30–31; Theorem8.2 and its proof, published159–160/PDF60–61. Complete pages read in4693 during this continuation. The rescaling construction on published137–140/PDF38–41 was also reread completely after4695 preparation. Existing source qualifications and confirmed E54 retained.. Worker algebraic analysis of the inverse-coordinate character at the shifted Eisenstein denominator. Its actual integral evaluation is defined, but maps every displayed shifted denominator to0, so it cannot extend as a ring map to those localizations. This locates a precise obstruction without asserting analytic pole order, residue or failure of every possible smaller-domain evaluation.

### Character-weighted positive Eisenstein coefficient measures

DirichletPadicLFunctions:L4/twisted-positive-eisenstein-measure

Declaration: DirichletPadic.twistedPositiveEisensteinMeasure

Kind: construction. Implementation: unchecked.

Construct A_(ψ,φ,n)∈D(U,R) as the finite character-weighted divisor-Dirac sum above.

**Hypotheses**

- p is any prime, including2. Z=ℤ_p and U=Zˣ have their native topology. Let R be a normed commutative ring, ψ:DirichletCharacter R D and φ:DirichletCharacter R E, and n:ℕ+ a positive coefficient index. Neither primitivity nor a parity hypothesis is needed for this finite arithmetic construction.
- For a retained divisor d of n with p∤d let u(d)∈U be the same actual natural-cast unit used by positiveEisensteinMeasure, constructed with PadicInt.isUnit_iff and norm_natCast_eq_one_iff. Define A_(ψ,φ,n)=Σ_(d|n,p∤d)ψ(n/d)φ(d)·δ_u(d) in the native D(U,R). The left character is evaluated at the complementary divisor n/d and the right character at d.
- Coordinate moments additionally take Algebra Z R and ContinuousSMul Z R. The test is u↦algebraMap Z R(u)^e for e≥0. In the classical weight-k application e=k−1; this arithmetic statement imposes no modularity assertion at exceptional weights.
- The uniform test bound takes a normed coefficient field K with IsUltrametricDist K. It needs no complete-space or Z-algebra assumption. All coefficients and tests in this bound are K-valued.
- The tame application has D,E>0 with p∤DE. The finite construction and identities also allow characters whose levels are divisible by p, with their native zero extension. Classical primitive-character Eisenstein forms, parity, raising level and exceptional-weight corrections remain in ModularForms Layer0; affinoid family realization remains in PadicFamilies. No coefficient at n=0 is supplied here.

**Construction or proof outline**

- Use Nat.divisors of the positive index and retain exactly the divisors prime to p. For each retained d use the existing natural-unit construction from the unweighted coefficient measure. The unit value determines the unit uniquely, so neither its certificate nor n changes u(d).
- Multiply each native Dirac measure byψ(n/d)φ(d) in R and take the finite sum in the existing AbstractMeasure module. No measure carrier, generic distribution, divisor-sum arithmetic function or new coefficient topology is introduced.
- At n=1 the only divisor is1 and both characters take1 to1, givingδ_1. At n=p^r the only retained divisor is1; the result isψ(p)^rδ_1. This includes r=0 and the zero value when the left character vanishes at p.
- For both characters of level1 and R=Z, every scalar is1. The result is exactly the existing positiveEisensteinMeasure. This uses the existing constructor, not a second untwisted family.
- At p=2 and quadraticχ modulo3 withχ(2)=−1, the left-character coefficient at n=5 is−δ_1+δ_5, while the right-character coefficient isδ_1−δ_5. At n=2 the left-character coefficient is−δ_1, and at n=4 it isδ_1. These tests reject exchanging the character positions or discarding the whole q^p coefficient.

**Prerequisites**

- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- mathlib:AbstractMeasure.dirac
- mathlib:Nat.mem_divisors
- mathlib:Nat.mem_divisors_prime_pow
- mathlib:PadicInt.isUnit_iff
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:IsUnit.unit
- mathlib:IsUnit.unit_spec

**Acceptance**

- The atomic weights use the pinned native twisted-divisor convention. Only positive coefficients are constructed; no claim about the constant or modularity is made.

**API**

- DirichletPadic.twistedPositiveEisensteinMeasure_eq_sum: A_n is the finite sumψ(n/d)φ(d)δ_u(d) over d|n,p∤d, with the exact native unit term.
- DirichletPadic.twistedPositiveEisensteinMeasure_apply: A_n(f)=Σ_(d|n,p∤d)ψ(n/d)φ(d)f(u(d)). Promoted to twisted-positive-eisenstein-evaluation.
- DirichletPadic.twistedPositiveEisensteinMeasure_one: A_1=δ_1 for every character pair.
- DirichletPadic.twistedPositiveEisensteinMeasure_prime_pow: A_(p^r)=ψ(p)^rδ_1 for every r≥0.
- DirichletPadic.twistedPositiveEisensteinMeasure_mul_p: A_(pn)=ψ(p)A_n. Promoted to twisted-positive-eisenstein-p-scaling.
- DirichletPadic.twistedPositiveEisensteinMeasure_mass: A_n(1)=Σ_(d|n,p∤d)ψ(n/d)φ(d).
- DirichletPadic.twistedPositiveEisensteinMeasure_moment: With a continuous Z-algebra structure, A_n(x^e)=Σ_(d|n,p∤d)ψ(n/d)φ(d)d^e. Promoted to twisted-positive-eisenstein-moment.
- DirichletPadic.twistedPositiveEisensteinMeasure_modOne: For R=Z and both characters of level1, A_n equals the existing positiveEisensteinMeasure.

**Tests**

- SuggestedTwistedEisensteinTests.first_twisted_coefficient: For every character pair A_1=δ_1.
- SuggestedTwistedEisensteinTests.level_one_integral_comparison: The level-one integral pair recovers the existing unweighted positive coefficient measure.
- SuggestedTwistedEisensteinTests.dyadic_prime_sign: At p=2, left quadraticχ modulo3 and right principal level1, A_2=−δ_1.
- SuggestedTwistedEisensteinTests.dyadic_square_sign: For the same pair A_4=δ_1.
- SuggestedTwistedEisensteinTests.character_positions_left: For the same pair A_5=−δ_1+δ_5.
- SuggestedTwistedEisensteinTests.character_positions_right: Switching thatχ to the right position gives A_5=δ_1−δ_5.

**Uses**

- RJW Theorem8.2 and atlas L4 tame-nebentypus extension: Interpolates the positive coefficient sums on the actual unit-measure domain.
- Pinned DirichletCharacter.twistedDivisorSum: Fixes the orderψ(n/d)φ(d) and the classical exponent e=k−1 without rebuilding the arithmetic function.
- Integral q-expansion congruences and PadicFamilies input: The uniform test bound supplies coefficientwise continuity and precision before any geometric family comparison.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, freshly read completely. The atlas L4 tame-nebentypus extension is read with the existing ModularForms Layer0 character-Eisenstein target and the whole pinned TauCeti ArithmeticFunction/TwistedDivisorSum module.. Worker extension of the positive divisor-Dirac construction to two existing native Dirichlet characters. The order of the characters is the pinned twistedDivisorSum conventionψ(n/d)φ(d), not an assertion that RJW states this two-character theorem. Generic twisted divisor sums and classical primitive-character Eisenstein forms retain their existing owners. This checkpoint constructs only actual positive coefficient measures and finite-sum moments, without a constant term or a geometric family.

### Evaluation of character-weighted coefficients

DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation

Declaration: DirichletPadic.twistedPositiveEisensteinMeasure_apply

Kind: lemma. Implementation: unchecked.

For every native continuous f:U→R, A_(ψ,φ,n)(f)=Σ_(d|n,p∤d)ψ(n/d)φ(d)f(u(d)).

**Hypotheses**

- p is any prime, including2. Z=ℤ_p and U=Zˣ have their native topology. Let R be a normed commutative ring, ψ:DirichletCharacter R D and φ:DirichletCharacter R E, and n:ℕ+ a positive coefficient index. Neither primitivity nor a parity hypothesis is needed for this finite arithmetic construction.
- For a retained divisor d of n with p∤d let u(d)∈U be the same actual natural-cast unit used by positiveEisensteinMeasure, constructed with PadicInt.isUnit_iff and norm_natCast_eq_one_iff. Define A_(ψ,φ,n)=Σ_(d|n,p∤d)ψ(n/d)φ(d)·δ_u(d) in the native D(U,R). The left character is evaluated at the complementary divisor n/d and the right character at d.
- Coordinate moments additionally take Algebra Z R and ContinuousSMul Z R. The test is u↦algebraMap Z R(u)^e for e≥0. In the classical weight-k application e=k−1; this arithmetic statement imposes no modularity assertion at exceptional weights.
- The uniform test bound takes a normed coefficient field K with IsUltrametricDist K. It needs no complete-space or Z-algebra assumption. All coefficients and tests in this bound are K-valued.
- The tame application has D,E>0 with p∤DE. The finite construction and identities also allow characters whose levels are divisible by p, with their native zero extension. Classical primitive-character Eisenstein forms, parity, raising level and exceptional-weight corrections remain in ModularForms Layer0; affinoid family realization remains in PadicFamilies. No coefficient at n=0 is supplied here.

**Construction or proof outline**

- Apply evaluation to the actual finite sum of measures. The existing AbstractMeasure module inherits evaluation of finite sums and scalar multiples from its continuous linear map.
- Native dirac_apply evaluates each retained atom at f(u(d)); the omitted divisors contribute0. The complete native atomic_apply proof uses precisely the existing continuous dual and scalar action.
- Putting f=1 gives the weighted mass. Its summands can cancel: it is not a count of retained divisors, except for the unweighted level-one pair.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-measure
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- All coefficients act by the existing R-module structure on actual measures. No replacement finite-measure carrier is used.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, freshly read completely. The atlas L4 tame-nebentypus extension is read with the existing ModularForms Layer0 character-Eisenstein target and the whole pinned TauCeti ArithmeticFunction/TwistedDivisorSum module.. Worker extension of the positive divisor-Dirac construction to two existing native Dirichlet characters. The order of the characters is the pinned twistedDivisorSum conventionψ(n/d)φ(d), not an assertion that RJW states this two-character theorem. Generic twisted divisor sums and classical primitive-character Eisenstein forms retain their existing owners. This checkpoint constructs only actual positive coefficient measures and finite-sum moments, without a constant term or a geometric family.

### Finite arithmetic moments with two characters

DirichletPadicLFunctions:L4/twisted-positive-eisenstein-moment

Declaration: DirichletPadic.twistedPositiveEisensteinMeasure_moment

Kind: theorem. Implementation: unchecked.

For e≥0, A_(ψ,φ,n)(u↦algebraMap(u)^e)=Σ_(d|n,p∤d)ψ(n/d)φ(d)d^e.

**Hypotheses**

- p is any prime, including2. Z=ℤ_p and U=Zˣ have their native topology. Let R be a normed commutative ring, ψ:DirichletCharacter R D and φ:DirichletCharacter R E, and n:ℕ+ a positive coefficient index. Neither primitivity nor a parity hypothesis is needed for this finite arithmetic construction.
- For a retained divisor d of n with p∤d let u(d)∈U be the same actual natural-cast unit used by positiveEisensteinMeasure, constructed with PadicInt.isUnit_iff and norm_natCast_eq_one_iff. Define A_(ψ,φ,n)=Σ_(d|n,p∤d)ψ(n/d)φ(d)·δ_u(d) in the native D(U,R). The left character is evaluated at the complementary divisor n/d and the right character at d.
- Coordinate moments additionally take Algebra Z R and ContinuousSMul Z R. The test is u↦algebraMap Z R(u)^e for e≥0. In the classical weight-k application e=k−1; this arithmetic statement imposes no modularity assertion at exceptional weights.
- The uniform test bound takes a normed coefficient field K with IsUltrametricDist K. It needs no complete-space or Z-algebra assumption. All coefficients and tests in this bound are K-valued.
- The tame application has D,E>0 with p∤DE. The finite construction and identities also allow characters whose levels are divisible by p, with their native zero extension. Classical primitive-character Eisenstein forms, parity, raising level and exceptional-weight corrections remain in ModularForms Layer0; affinoid family realization remains in PadicFamilies. No coefficient at n=0 is supplied here.

**Construction or proof outline**

- The native unit value map, continuous algebra map and natural power give the actual continuous coordinate test. Apply the promoted evaluation theorem.
- For every retained divisor, the unit certificate has value d. Preservation of natural casts and powers gives algebraMap(u(d))^e=(d:R)^e. The complete actual_unit_coordinate proof checks this exact coefficient map.
- The summands are exactly the pinned native twistedDivisorSum convention, with only p-prime divisors retained. The generic arithmetic function and its divisor formula already exist in Tau Ceti and are recorded as baseline declarations. This theorem states the explicit finite-sum moment; it introduces no duplicate arithmetic-function definition.
- Classical weight k uses e=k−1. The left quadratic character at p=2,n=5 has exponent-one value4, whereas the same character in the right position has value−4. Neither arithmetic identity asserts the existence of a classical weight-two form.
- A later Euler-deleted native-object comparison must retain the right-character factorφ(p)p^e and the explicit p|n branch. The existing classical owner supplies parity and exceptional-weight restrictions before a bundled modular-form comparison.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:IsUnit.unit_spec
- mathlib:continuous_algebraMap
- tauceti:DirichletCharacter.twistedDivisorSum
- tauceti:DirichletCharacter.twistedDivisorSum_apply

**Acceptance**

- The suggested signature uses the exact finite sum. The native Tau Ceti arithmetic function is source-checked, not copied or claimed newly compiled.

**Tests**

- SuggestedTwistedEisensteinTests.dyadic_weight_two_left: At p=2,n=5, left quadraticχ modulo3 gives the coordinate moment4.
- SuggestedTwistedEisensteinTests.dyadic_weight_two_right: The sameχ in the right position gives the coordinate moment−4.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, freshly read completely. The atlas L4 tame-nebentypus extension is read with the existing ModularForms Layer0 character-Eisenstein target and the whole pinned TauCeti ArithmeticFunction/TwistedDivisorSum module.. Worker extension of the positive divisor-Dirac construction to two existing native Dirichlet characters. The order of the characters is the pinned twistedDivisorSum conventionψ(n/d)φ(d), not an assertion that RJW states this two-character theorem. Generic twisted divisor sums and classical primitive-character Eisenstein forms retain their existing owners. This checkpoint constructs only actual positive coefficient measures and finite-sum moments, without a constant term or a geometric family.

### The left-character factor under multiplication by p

DirichletPadicLFunctions:L4/twisted-positive-eisenstein-p-scaling

Declaration: DirichletPadic.twistedPositiveEisensteinMeasure_mul_p

Kind: theorem. Implementation: unchecked.

For every positive n, A_(ψ,φ,pn)=ψ(p)·A_(ψ,φ,n).

**Hypotheses**

- p is any prime, including2. Z=ℤ_p and U=Zˣ have their native topology. Let R be a normed commutative ring, ψ:DirichletCharacter R D and φ:DirichletCharacter R E, and n:ℕ+ a positive coefficient index. Neither primitivity nor a parity hypothesis is needed for this finite arithmetic construction.
- For a retained divisor d of n with p∤d let u(d)∈U be the same actual natural-cast unit used by positiveEisensteinMeasure, constructed with PadicInt.isUnit_iff and norm_natCast_eq_one_iff. Define A_(ψ,φ,n)=Σ_(d|n,p∤d)ψ(n/d)φ(d)·δ_u(d) in the native D(U,R). The left character is evaluated at the complementary divisor n/d and the right character at d.
- Coordinate moments additionally take Algebra Z R and ContinuousSMul Z R. The test is u↦algebraMap Z R(u)^e for e≥0. In the classical weight-k application e=k−1; this arithmetic statement imposes no modularity assertion at exceptional weights.
- The uniform test bound takes a normed coefficient field K with IsUltrametricDist K. It needs no complete-space or Z-algebra assumption. All coefficients and tests in this bound are K-valued.
- The tame application has D,E>0 with p∤DE. The finite construction and identities also allow characters whose levels are divisible by p, with their native zero extension. Classical primitive-character Eisenstein forms, parity, raising level and exceptional-weight corrections remain in ModularForms Layer0; affinoid family realization remains in PadicFamilies. No coefficient at n=0 is supplied here.

**Construction or proof outline**

- A positive divisor d of pn prime to p divides n: its coprimality with p allows native Nat.Coprime.dvd_mul_left. Conversely every divisor of n prime to p remains a divisor of pn. The complete filtered_divisors_mul_prime proof checks equality of the actual filtered native divisor finsets.
- On that common set, (pn)/d=p(n/d) by exact divisibility. Native multiplicativity ofψ givesψ((pn)/d)=ψ(p)ψ(n/d); the factorφ(d), unit u(d) and test value remain the same.
- Use the promoted evaluation formula and finite-sum scalar distributivity, then extensionality of the actual measures. The complete weighted_p_scaling proof verifies the native arithmetic identity with both character positions fixed.
- Iterating gives the prime-power APIψ(p)^rδ_1. Ifψ(p)=0, every coefficient A_(pn) is zero. If the pair is tame,ψ(p) is a unit character value, but need not equal1.
- For p=2 and left quadraticχ modulo3, A_10=−A_5. The unweighted relation A_(pn)=A_n is therefore not valid for a general tame pair.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:Nat.Coprime.dvd_mul_left
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:Nat.mem_divisors

**Acceptance**

- The scaling factor is the left characterψ(p). It differs from the right-character factor in the later Euler-deletion formula.

**Tests**

- SuggestedTwistedEisensteinTests.bad_left_character_annihilation: Ifψ(p)=0 then A_(pn)=0 for every positive n.
- SuggestedTwistedEisensteinTests.left_character_p_scaling: For p=2 and left quadraticχ modulo3, A_10=−A_5.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, freshly read completely. The atlas L4 tame-nebentypus extension is read with the existing ModularForms Layer0 character-Eisenstein target and the whole pinned TauCeti ArithmeticFunction/TwistedDivisorSum module.. Worker extension of the positive divisor-Dirac construction to two existing native Dirichlet characters. The order of the characters is the pinned twistedDivisorSum conventionψ(n/d)φ(d), not an assertion that RJW states this two-character theorem. Generic twisted divisor sums and classical primitive-character Eisenstein forms retain their existing owners. This checkpoint constructs only actual positive coefficient measures and finite-sum moments, without a constant term or a geometric family.

### Uniform precision for character-weighted coefficients

DirichletPadicLFunctions:L4/twisted-positive-eisenstein-test-bound

Declaration: DirichletPadic.twistedPositiveEisensteinMeasure_test_bound

Kind: theorem. Implementation: unchecked.

Over ultrametric K, ‖A_n(f)−A_n(g)‖≤‖f−g‖ for every n and every pair of continuous tests.

**Hypotheses**

- p is any prime, including2. Z=ℤ_p and U=Zˣ have their native topology. Let R be a normed commutative ring, ψ:DirichletCharacter R D and φ:DirichletCharacter R E, and n:ℕ+ a positive coefficient index. Neither primitivity nor a parity hypothesis is needed for this finite arithmetic construction.
- For a retained divisor d of n with p∤d let u(d)∈U be the same actual natural-cast unit used by positiveEisensteinMeasure, constructed with PadicInt.isUnit_iff and norm_natCast_eq_one_iff. Define A_(ψ,φ,n)=Σ_(d|n,p∤d)ψ(n/d)φ(d)·δ_u(d) in the native D(U,R). The left character is evaluated at the complementary divisor n/d and the right character at d.
- Coordinate moments additionally take Algebra Z R and ContinuousSMul Z R. The test is u↦algebraMap Z R(u)^e for e≥0. In the classical weight-k application e=k−1; this arithmetic statement imposes no modularity assertion at exceptional weights.
- The uniform test bound takes a normed coefficient field K with IsUltrametricDist K. It needs no complete-space or Z-algebra assumption. All coefficients and tests in this bound are K-valued.
- The tame application has D,E>0 with p∤DE. The finite construction and identities also allow characters whose levels are divisible by p, with their native zero extension. Classical primitive-character Eisenstein forms, parity, raising level and exceptional-weight corrections remain in ModularForms Layer0; affinoid family realization remains in PadicFamilies. No coefficient at n=0 is supplied here.

**Construction or proof outline**

- Native DirichletCharacter.norm_le_one bounds both character values, including zero values at nonunits of their finite levels. Thus every atomic scalarψ(n/d)φ(d) has norm at most1; the complete character_coefficient_bound proof verifies this product bound.
- Subtract the two evaluations from the promoted finite-sum formula. Each summand is its atomic scalar times(f−g)(u(d)), whose norm is at most‖f−g‖ by the native continuous-map supremum bound on the compact unit group.
- The native ultrametric finite-sum estimate bounds the whole sum by the same number. There is no factor counting divisors. The complete atomic_test_bound proof checks this exact inequality on native AbstractMeasure and continuous tests.
- Taking g=0 gives‖A_n(f)‖≤‖f‖ uniformly in n and the character pair. Any pointwise/supremum test precision immediately transfers to coefficient precision. Completeness and a Z-algebra structure are not needed for this finite estimate.
- The bound supplies arithmetic positive-coefficient continuity. Building an integer-ring realization, a whole formal-series-valued measure, denominator-qualified constant term or an analytic weight family remains separate work.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:DirichletCharacter.norm_le_one
- mathlib:ContinuousMap.norm_coe_le_norm
- mathlib:PadicInt.compactSpace
- mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg

**Acceptance**

- The norm is on the scalar value and the native continuous test, not a newly imposed norm on the weak measure carrier.

**Tests**

- SuggestedTwistedEisensteinTests.uniform_single_test_bound: Every positive coefficient satisfies‖A_n(f)‖≤‖f‖.
- SuggestedTwistedEisensteinTests.close_tests_close_coefficients: If‖f−g‖≤b then the coefficient evaluations differ by norm at most b.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, freshly read completely. The atlas L4 tame-nebentypus extension is read with the existing ModularForms Layer0 character-Eisenstein target and the whole pinned TauCeti ArithmeticFunction/TwistedDivisorSum module.. Worker extension of the positive divisor-Dirac construction to two existing native Dirichlet characters. The order of the characters is the pinned twistedDivisorSum conventionψ(n/d)φ(d), not an assertion that RJW states this two-character theorem. Generic twisted divisor sums and classical primitive-character Eisenstein forms retain their existing owners. This checkpoint constructs only actual positive coefficient measures and finite-sum moments, without a constant term or a geometric family.

### Integral character-weighted Eisenstein coefficients

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-measure

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure

Kind: construction. Implementation: unchecked.

Construct A^O_(ψ,φ,n)∈D(U,O) by the finite weighted divisor-Dirac sum, with coefficient inclusion recovering the existing K-valued measure on every continuous O-valued test.

**Hypotheses**

- p is any prime, including 2. U=(ℤ_p)ˣ has its native topology. K is a normed field with IsUltrametricDist K. O is exactly Valuation.integer(NormedField.valuation K), with its inherited normed commutative ring structure. No replacement coefficient carrier or completeness hypothesis is introduced.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, and let n:ℕ+ be a positive coefficient index. The retained divisors satisfy d|n and p∤d. Their actual units u(d) are the same natural-cast units as in twistedPositiveEisensteinMeasure.
- Set w_n(d)=ψ(n/d)φ(d). Native character norm bounds give ‖w_n(d)‖≤1 and hence a canonical element of O with this value. Define A^O_n as the finite sum of these O-scaled native Dirac measures at u(d). No primitivity, parity or tame-level condition is needed for this finite construction; the intended tame application imposes p∤DE.
- For arithmetic moments and weight congruences only, additionally assume Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Let κ^O_e be the already constructed integralPrimePowerArithmeticCharacter at level zero, principal finite character and exponent e≥0. No ℤ_p-algebra on O is assumed.
- The weight-congruence assertion takes r≥1 and e≡e′ modulo p^(r−1)(p−1). It states divisibility by (p:O)^r in O. The exponent is e=k−1 in classical weight k. This concerns positive coefficients only; neither a constant term nor a bundled classical or geometric family is constructed.

**Construction or proof outline**

- Read the character bound in the pinned library: every value has norm at most one, including its zero extension at nonunits. Multiplicativity of the field norm bounds each product ψ(n/d)φ(d). Native NormedField.valuation_apply and Valuation.mem_integer_iff put that exact product in O. The complete native character_weight_integral proof checks this membership, without assuming a generic integral Dirichlet-character constructor.
- Use the native normed commutative ring structure on the integer subring. Sum the actual O-scaled Dirac measures over precisely the retained positive divisors. Each atom uses the existing unit of the natural cast, whose value is d. Membership certificates are propositions and do not affect the resulting coefficient or measure.
- At index one the only scalar and atom are both one, so the measure is δ_1. Evaluation at zero vanishes by the native measure laws. The all-test coefficient inclusion is promoted below; it also gives uniqueness by injectivity of the subtype inclusion and extensionality of the existing continuous dual.
- The norm of an included integer-subring element is its inherited K-norm. Apply the existing uniform K-valued test bound to the included test, whose supremum norm equals the original test norm. This yields ‖A^O_n(f)‖≤‖f‖; no topology or operator norm is imposed on the weak measure carrier.
- At p=2, ψ the quadratic character modulo 3 and φ the level-one character, the coefficient at n=2 is −δ_1 in D(U,O). At n=5 its exponent-one moment is 4, while switching the character positions gives −4. These tests reject a sign, character-order or coefficient-ring error.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-measure
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-test-bound
- mathlib:DirichletCharacter.norm_le_one
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply
- mathlib:SubringClass.toNormedCommRing
- mathlib:AbstractMeasure.dirac
- mathlib:IsUnit.unit_spec

**Acceptance**

- The output is an actual measure over the existing O. A divisibility assertion made only in the field K is not accepted as an integral congruence.

**API**

- DirichletPadic.integralTwistedPositiveEisensteinMeasure_eq_sum: A^O_n is the sum over d|n,p∤d of the subtype lift of ψ(n/d)φ(d) times δ_u(d); its membership proof is supplied by the native character bounds.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_apply: Evaluation is the same finite sum of integral weights times f(u(d)). Promoted to integral-twisted-positive-eisenstein-evaluation.
- DirichletPadic.coe_integralTwistedPositiveEisensteinMeasure_apply: Including A^O_n(f) into K gives A^K_n(ι∘f) for every O-valued continuous test. Promoted to integral-twisted-positive-eisenstein-coefficient.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_one: At the first positive coefficient A^O_1=δ_1.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_unique_coefficient: Any O-valued measure with the same included evaluations on all O-valued continuous tests is A^O_n.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_bound: For every continuous O-valued f, ‖A^O_n(f)‖≤‖f‖.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_test_congruence: If b divides g(u)−f(u) in O for every u, then b divides A^O_n(g)−A^O_n(f). Promoted to integral-twisted-positive-eisenstein-test-congruence.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_moment: The included value on κ^O_e equals Σ_(d|n,p∤d)ψ(n/d)φ(d)d^e in K. Promoted to integral-twisted-positive-eisenstein-moment.
- DirichletPadic.integralTwistedPositiveEisensteinMeasure_weight_congruence: For r≥1 and e≡e′ modulo p^(r−1)(p−1), (p:O)^r divides A^O_n(κ^O_e′)−A^O_n(κ^O_e). Promoted to integral-twisted-positive-eisenstein-weight-congruence.

**Tests**

- SuggestedIntegralTwistedEisensteinTests.first_integral_coefficient: For every character pair, A^O_1=δ_1.
- SuggestedIntegralTwistedEisensteinTests.zero_integral_test: Every positive coefficient evaluates to zero on the zero continuous O-valued test.
- SuggestedIntegralTwistedEisensteinTests.dyadic_integral_sign: At p=2 with left quadratic character modulo3, A^O_2=−δ_1.
- SuggestedIntegralTwistedEisensteinTests.exact_coefficient_inclusion: For every continuous O-valued test f, ι(A^O_n(f))=A^K_n(ι∘f).

**Uses**

- Atlas L4 integral q-expansion congruences: Provides coefficients in the native integer ring so that ideal divisibility records meaningful precision.
- RJW Theorem8.2 and Remark8.3 positive coefficients: Retains the actual weighted divisor atoms while varying their continuous arithmetic tests.
- Existing integral arithmetic characters: Evaluates the already constructed O-valued characters without introducing a new scalar action on O.

**Sources**

- RJW-published, Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161/PDF60–62, freshly read in full. Read with the exact atlas L4 integral tame-nebentypus target and ModularForms Layer0 character-Eisenstein ownership.. Worker integral realization and quantitative weight-congruence extension of the actual two-character positive coefficient measures. RJW supplies the divisor-Dirac construction and weight-variation motivation; the two-character convention comes from the existing pinned twistedDivisorSum. This is not a claim that the paper states the generalized theorem. Generic divisor sums, classical character modular forms, exceptional weights and geometric family constructions retain their owners.

### Evaluation of integral weighted coefficients

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_apply

Kind: lemma. Implementation: unchecked.

For every f∈C(U,O), A^O_n(f)=Σ_(d|n,p∤d)w_n(d)^O f(u(d)) in O.

**Hypotheses**

- p is any prime, including 2. U=(ℤ_p)ˣ has its native topology. K is a normed field with IsUltrametricDist K. O is exactly Valuation.integer(NormedField.valuation K), with its inherited normed commutative ring structure. No replacement coefficient carrier or completeness hypothesis is introduced.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, and let n:ℕ+ be a positive coefficient index. The retained divisors satisfy d|n and p∤d. Their actual units u(d) are the same natural-cast units as in twistedPositiveEisensteinMeasure.
- Set w_n(d)=ψ(n/d)φ(d). Native character norm bounds give ‖w_n(d)‖≤1 and hence a canonical element of O with this value. Define A^O_n as the finite sum of these O-scaled native Dirac measures at u(d). No primitivity, parity or tame-level condition is needed for this finite construction; the intended tame application imposes p∤DE.
- For arithmetic moments and weight congruences only, additionally assume Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Let κ^O_e be the already constructed integralPrimePowerArithmeticCharacter at level zero, principal finite character and exponent e≥0. No ℤ_p-algebra on O is assumed.
- The weight-congruence assertion takes r≥1 and e≡e′ modulo p^(r−1)(p−1). It states divisibility by (p:O)^r in O. The exponent is e=k−1 in classical weight k. This concerns positive coefficients only; neither a constant term nor a bundled classical or geometric family is constructed.

**Construction or proof outline**

- Evaluate the finite sum in the existing continuous dual. Native finite addition, O-scalar multiplication and dirac_apply reduce each term to w_n(d)^O f(u(d)).
- The complete atomic_apply proof checks this identity on the native AbstractMeasure, by finite-set induction, for any normed commutative coefficient ring. Here that ring is the existing O.
- This is an equality in O before any coefficient inclusion. It therefore supports explicit witnesses for ideal congruences. It is not inferred by attempting to divide an equality in K.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-measure
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- The indexing set, character positions and actual unit certificates agree with the K-valued predecessor.

**Sources**

- RJW-published, Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161/PDF60–62, freshly read in full. Read with the exact atlas L4 integral tame-nebentypus target and ModularForms Layer0 character-Eisenstein ownership.. Worker integral realization and quantitative weight-congruence extension of the actual two-character positive coefficient measures. RJW supplies the divisor-Dirac construction and weight-variation motivation; the two-character convention comes from the existing pinned twistedDivisorSum. This is not a claim that the paper states the generalized theorem. Generic divisor sums, classical character modular forms, exceptional weights and geometric family constructions retain their owners.

### Coefficient inclusion on every integral test

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient

Declaration: DirichletPadic.coe_integralTwistedPositiveEisensteinMeasure_apply

Kind: comparison. Implementation: unchecked.

For every continuous f:U→O, ι(A^O_n(f))=A^K_n(ι∘f), where A^K_n is the existing twistedPositiveEisensteinMeasure.

**Hypotheses**

- p is any prime, including 2. U=(ℤ_p)ˣ has its native topology. K is a normed field with IsUltrametricDist K. O is exactly Valuation.integer(NormedField.valuation K), with its inherited normed commutative ring structure. No replacement coefficient carrier or completeness hypothesis is introduced.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, and let n:ℕ+ be a positive coefficient index. The retained divisors satisfy d|n and p∤d. Their actual units u(d) are the same natural-cast units as in twistedPositiveEisensteinMeasure.
- Set w_n(d)=ψ(n/d)φ(d). Native character norm bounds give ‖w_n(d)‖≤1 and hence a canonical element of O with this value. Define A^O_n as the finite sum of these O-scaled native Dirac measures at u(d). No primitivity, parity or tame-level condition is needed for this finite construction; the intended tame application imposes p∤DE.
- For arithmetic moments and weight congruences only, additionally assume Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Let κ^O_e be the already constructed integralPrimePowerArithmeticCharacter at level zero, principal finite character and exponent e≥0. No ℤ_p-algebra on O is assumed.
- The weight-congruence assertion takes r≥1 and e≡e′ modulo p^(r−1)(p−1). It states divisibility by (p:O)^r in O. The exponent is e=k−1 in classical weight k. This concerns positive coefficients only; neither a constant term nor a bundled classical or geometric family is constructed.

**Construction or proof outline**

- The native subtype inclusion O→K is a continuous ring homomorphism. Its composition with f is an actual continuous K-valued test, using ContinuousMap.mk and comp.
- Apply the integral evaluation formula and include the finite sum into K. The subtype value of every lifted coefficient is exactly ψ(n/d)φ(d), and inclusion preserves sums and products.
- Use the existing K-valued evaluation formula to identify the result. The complete atomic_coefficient_inclusion proof checks this comparison on arbitrary actual finite Dirac sums and all continuous O-valued tests.
- Injectivity of the inclusion and extensionality imply the uniqueness API. No arbitrary K-valued test is asserted to have an O-valued lift, and no generic coefficient-extension functor is constructed.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:SubringClass.toNormedCommRing

**Acceptance**

- Comparison is on all continuous integral tests, not just polynomial or locally constant tests.

**Sources**

- RJW-published, Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161/PDF60–62, freshly read in full. Read with the exact atlas L4 integral tame-nebentypus target and ModularForms Layer0 character-Eisenstein ownership.. Worker integral realization and quantitative weight-congruence extension of the actual two-character positive coefficient measures. RJW supplies the divisor-Dirac construction and weight-variation motivation; the two-character convention comes from the existing pinned twistedDivisorSum. This is not a claim that the paper states the generalized theorem. Generic divisor sums, classical character modular forms, exceptional weights and geometric family constructions retain their owners.

### Integral test congruences for positive coefficients

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-test-congruence

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_test_congruence

Kind: theorem. Implementation: unchecked.

For b∈O and f,g∈C(U,O), if b divides g(u)−f(u) for every u∈U, then b divides A^O_n(g)−A^O_n(f) in O.

**Hypotheses**

- p is any prime, including 2. U=(ℤ_p)ˣ has its native topology. K is a normed field with IsUltrametricDist K. O is exactly Valuation.integer(NormedField.valuation K), with its inherited normed commutative ring structure. No replacement coefficient carrier or completeness hypothesis is introduced.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, and let n:ℕ+ be a positive coefficient index. The retained divisors satisfy d|n and p∤d. Their actual units u(d) are the same natural-cast units as in twistedPositiveEisensteinMeasure.
- Set w_n(d)=ψ(n/d)φ(d). Native character norm bounds give ‖w_n(d)‖≤1 and hence a canonical element of O with this value. Define A^O_n as the finite sum of these O-scaled native Dirac measures at u(d). No primitivity, parity or tame-level condition is needed for this finite construction; the intended tame application imposes p∤DE.
- For arithmetic moments and weight congruences only, additionally assume Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Let κ^O_e be the already constructed integralPrimePowerArithmeticCharacter at level zero, principal finite character and exponent e≥0. No ℤ_p-algebra on O is assumed.
- The weight-congruence assertion takes r≥1 and e≡e′ modulo p^(r−1)(p−1). It states divisibility by (p:O)^r in O. The exponent is e=k−1 in classical weight k. This concerns positive coefficients only; neither a constant term nor a bundled classical or geometric family is constructed.

**Construction or proof outline**

- Subtract the two integral evaluation formulas and distribute the finite sum. Each summand is w_n(d)^O times g(u(d))−f(u(d)).
- Use the stated divisibility at the retained atoms and multiply its witnesses by the integral weights. Native Finset.dvd_sum adds the finitely many witnesses in O. The complete native atomic_test_congruence proof checks precisely this operation on actual measures.
- The theorem allows b=0: its hypothesis forces equality of tests, and its conclusion forces equality of evaluations. No division by b, discrete valuation, uniformizer or completeness is required.
- The bound is independent of the number of divisors. For p-integral rational polynomial tests differing by p^r times another integral polynomial, the exact finite controls verify the resulting integral quotient as well as its field value.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- mathlib:Finset.dvd_sum

**Acceptance**

- The quotient witness lies in O. A field-only divisibility test is insufficient.

**Tests**

- SuggestedIntegralTwistedEisensteinTests.pointwise_ideal_transfer: Divisibility of all test differences by any b∈O transfers to every positive coefficient.
- SuggestedIntegralTwistedEisensteinTests.zero_modulus_is_equality: At b=0 the conclusion is equality of the coefficient evaluations.

**Sources**

- RJW-published, Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161/PDF60–62, freshly read in full. Read with the exact atlas L4 integral tame-nebentypus target and ModularForms Layer0 character-Eisenstein ownership.. Worker integral realization and quantitative weight-congruence extension of the actual two-character positive coefficient measures. RJW supplies the divisor-Dirac construction and weight-variation motivation; the two-character convention comes from the existing pinned twistedDivisorSum. This is not a claim that the paper states the generalized theorem. Generic divisor sums, classical character modular forms, exceptional weights and geometric family constructions retain their owners.

### Arithmetic moments of integral weighted coefficients

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-moment

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_moment

Kind: theorem. Implementation: unchecked.

For e≥0, ι(A^O_n(κ^O_e))=Σ_(d|n,p∤d)ψ(n/d)φ(d)d^e in K.

**Hypotheses**

- p is any prime, including 2. U=(ℤ_p)ˣ has its native topology. K is a normed field with IsUltrametricDist K. O is exactly Valuation.integer(NormedField.valuation K), with its inherited normed commutative ring structure. No replacement coefficient carrier or completeness hypothesis is introduced.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, and let n:ℕ+ be a positive coefficient index. The retained divisors satisfy d|n and p∤d. Their actual units u(d) are the same natural-cast units as in twistedPositiveEisensteinMeasure.
- Set w_n(d)=ψ(n/d)φ(d). Native character norm bounds give ‖w_n(d)‖≤1 and hence a canonical element of O with this value. Define A^O_n as the finite sum of these O-scaled native Dirac measures at u(d). No primitivity, parity or tame-level condition is needed for this finite construction; the intended tame application imposes p∤DE.
- For arithmetic moments and weight congruences only, additionally assume Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Let κ^O_e be the already constructed integralPrimePowerArithmeticCharacter at level zero, principal finite character and exponent e≥0. No ℤ_p-algebra on O is assumed.
- The weight-congruence assertion takes r≥1 and e≡e′ modulo p^(r−1)(p−1). It states divisibility by (p:O)^r in O. The exponent is e=k−1 in classical weight k. This concerns positive coefficients only; neither a constant term nor a bundled classical or geometric family is constructed.

**Construction or proof outline**

- Use the existing integralPrimePowerArithmeticCharacter at principal level zero. Its coefficient inclusion agrees with the existing K-valued arithmetic character; the level-zero formula is the actual unit coordinate to the natural exponent e.
- At each retained natural-cast unit u(d), its included value is d^e in K. Injectivity of the native integer-subring inclusion identifies its value in O with (d:O)^e. The complete integral_coordinate_from_inclusion proof checks this step without a ℤ_p-algebra structure on O.
- Apply the all-test coefficient comparison, then the existing K-valued weighted moment theorem. Alternatively the integral evaluation formula is the finite sum of w_n(d)^O(d:O)^e, whose inclusion gives the stated formula.
- The moment exponent is e=k−1. For the dyadic quadratic-left pair at n=5 the e=1 value is 4 and the e=5 value is 3124, giving difference 3120. Switching the character to the right gives exponent-one value −4.
- The finite sum has exactly the pinned twistedDivisorSum convention. The native arithmetic function already exists and is not copied; this checkpoint needs no new import of its unavailable pinned artifact.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-moment
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- DirichletPadicLFunctions:L2/arithmetic-character-pointwise-value
- mathlib:IsUnit.unit_spec

**Acceptance**

- The suggested statement uses the actual existing integral test, not a freely supplied function with the desired values.

**Tests**

- SuggestedIntegralTwistedEisensteinTests.dyadic_integral_left_moment: At p=2,n=5 with left quadratic character modulo3, A^O_5(κ^O_1)=4.
- SuggestedIntegralTwistedEisensteinTests.dyadic_integral_right_moment: Switching that character to the right position gives A^O_5(κ^O_1)=−4.
- SuggestedIntegralTwistedEisensteinTests.dyadic_actual_moment_difference: For the left pair, A^O_5(κ^O_5)−A^O_5(κ^O_1)=3120 in O.

**Sources**

- RJW-published, Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161/PDF60–62, freshly read in full. Read with the exact atlas L4 integral tame-nebentypus target and ModularForms Layer0 character-Eisenstein ownership.. Worker integral realization and quantitative weight-congruence extension of the actual two-character positive coefficient measures. RJW supplies the divisor-Dirac construction and weight-variation motivation; the two-character convention comes from the existing pinned twistedDivisorSum. This is not a claim that the paper states the generalized theorem. Generic divisor sums, classical character modular forms, exceptional weights and geometric family constructions retain their owners.

### Weight congruences in the integer coefficient ring

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-weight-congruence

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_weight_congruence

Kind: theorem. Implementation: unchecked.

If r≥1 and e≡e′ modulo p^(r−1)(p−1), then (p:O)^r divides A^O_n(κ^O_e′)−A^O_n(κ^O_e) in O.

**Hypotheses**

- p is any prime, including 2. U=(ℤ_p)ˣ has its native topology. K is a normed field with IsUltrametricDist K. O is exactly Valuation.integer(NormedField.valuation K), with its inherited normed commutative ring structure. No replacement coefficient carrier or completeness hypothesis is introduced.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, and let n:ℕ+ be a positive coefficient index. The retained divisors satisfy d|n and p∤d. Their actual units u(d) are the same natural-cast units as in twistedPositiveEisensteinMeasure.
- Set w_n(d)=ψ(n/d)φ(d). Native character norm bounds give ‖w_n(d)‖≤1 and hence a canonical element of O with this value. Define A^O_n as the finite sum of these O-scaled native Dirac measures at u(d). No primitivity, parity or tame-level condition is needed for this finite construction; the intended tame application imposes p∤DE.
- For arithmetic moments and weight congruences only, additionally assume Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Let κ^O_e be the already constructed integralPrimePowerArithmeticCharacter at level zero, principal finite character and exponent e≥0. No ℤ_p-algebra on O is assumed.
- The weight-congruence assertion takes r≥1 and e≡e′ modulo p^(r−1)(p−1). It states divisibility by (p:O)^r in O. The exponent is e=k−1 in classical weight k. This concerns positive coefficients only; neither a constant term nor a bundled classical or geometric family is constructed.

**Construction or proof outline**

- Use the integral finite evaluation and the moment identification κ^O_e(u(d))=(d:O)^e. Only retained divisors occur, so each d is coprime to p and hence to p^r.
- Native Nat.pow_totient_mod reduces the two integer exponents modulo the totient of p^r. Because r≥1 and p is prime, p^r>1; Nat.totient_prime_pow gives that totient as p^(r−1)(p−1). The exponent congruence identifies the two remainders. The complete power_congruence proof checks the exact native arithmetic statement.
- Nat.modEq_iff_dvd supplies an integer witness z_d with d^e′−d^e=p^r z_d. Cast this equality directly to O. The complete ring_power_divisibility proof establishes the cast for any commutative ring, and weighted_power_congruence multiplies by the integral character coefficients and sums the witnesses.
- This argument proves divisibility in O and needs neither field division nor a chosen uniformizer. It works for p=2 with sufficient modulus 2^(r−1); no odd-prime cyclicity or idempotent argument is used. The modulus is not claimed optimal.
- At p=2,n=5,r=3,e=1,e′=5 with the quadratic-left pair, the difference is 3120 and 8 divides it. At p=5,n=2, exponents 3 and 7 agree modulo4 but their weighted moments differ by120, which is not divisible by25 in O. The complete integer_ring_precision_counterexample proves this failure in the actual norm-valuation integer subring of ℚ_5, using ‖120‖=1/5 and ‖25‖=1/25.
- For modular weights put e=k−1 and e′=k′−1 only after importing the shared classical owner and its parity and exceptional-weight hypotheses. No congruence for a constant coefficient, arbitrary unsmoothed pseudomeasure or geometric family follows from this positive-coefficient theorem.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-moment
- DirichletPadicLFunctions:L4/positive-eisenstein-weight-congruence
- mathlib:Nat.pow_totient_mod
- mathlib:Nat.totient_prime_pow
- mathlib:Nat.modEq_iff_dvd
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:Finset.dvd_sum
- mathlib:Padic.norm_p
- mathlib:Padic.norm_natCast_eq_one_iff
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- The theorem covers all fixed finite character pairs, including bad-level zeros; its tame modular application is distinguished from the finite arithmetic proof.

**Tests**

- SuggestedIntegralTwistedEisensteinTests.dyadic_weight_congruence: The actual dyadic moment difference at n=5 and exponents1,5 is divisible by8 in O.
- SuggestedIntegralTwistedEisensteinTests.tame_component_is_not_full_precision: At p=5,n=2 with left quadratic character modulo3, the exponent7 minus exponent3 moment is not divisible by25 in O, although the weights agree modulo4.

**Sources**

- RJW-published, Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161/PDF60–62, freshly read in full. Read with the exact atlas L4 integral tame-nebentypus target and ModularForms Layer0 character-Eisenstein ownership.. Worker integral realization and quantitative weight-congruence extension of the actual two-character positive coefficient measures. RJW supplies the divisor-Dirac construction and weight-variation motivation; the two-character convention comes from the existing pinned twistedDivisorSum. This is not a claim that the paper states the generalized theorem. Generic divisor sums, classical character modular forms, exceptional weights and geometric family constructions retain their owners.

### Finite coordinates of integral weighted coefficients

DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite

Declaration: DirichletPadic.integralTwistedEisensteinFinite

Kind: construction. Implementation: unchecked.

Define E_(ψ,φ,n;r)∈O[U_r] by the existing finite projection of the actual integral weighted measure A^O_n.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field and O is its native norm-valuation integer subring, with the inherited normed commutative ring structure. Let ψ:DirichletCharacter K D, φ:DirichletCharacter K E and n:ℕ+. Write A^O_n for the existing integralTwistedPositiveEisensteinMeasure.
- U=(ℤ_p)ˣ and U_r=(ℤ/p^rℤ)ˣ use their native group and topological structures, with r≥0. The shared red_r=PadicInt.unitToZModPow is continuous and agrees with Units.map of the native integer reduction. At r=0 the group is trivial. Neither O nor a coefficient quotient of O is assumed finite.
- Define E_(n;r)=MonoidAlgebra.ofCoeff(π_(red_r)(A^O_n)), using the existing AbstractMeasure.finiteProjection. This is an element of the native MonoidAlgebra O U_r. The explicit ofCoeff conversion is required because MonoidAlgebra is not definitionally its Finsupp coefficient carrier.
- Retain the exact positive divisors d|n with p∤d, their existing natural-cast units u(d), and the integral lifts w_n(d)^O of ψ(n/d)φ(d). Colliding residues contribute the sum of all their weights, including cancellation. There is no averaging factor.
- For reduced evaluation, R is any commutative ring and c:O→+*R any ring homomorphism. Assume explicitly c(f(u))=g(red_r(u)) for the continuous integral test f and the finite function g. No continuity of c or factorization of an arbitrary test at a fixed level is assumed.
- For arithmetic moments, additionally use Algebra ℤ_p K and IsBoundedSMul ℤ_p K, with the existing principal level-zero integral arithmetic test κ^O_e, e≥0. A group level r gives precision (p:O)^r. Coefficient precision s is independent and the quotient moment formula assumes s≤r. No ℤ_p-algebra structure on O is required.

**Construction or proof outline**

- Use the supplier’s actual red_r and its proved-continuous planning interface. Apply the supplier’s finiteProjection, whose output is a native finitely supported coefficient function. Wrap it with native MonoidAlgebra.ofCoeff; do not reconstruct a finite projection or unit quotient.
- The projection equality is the defining API. The explicit weighted divisor formula is promoted below. Native coefficient extensionality provides access to the same finite coefficients without asserting a new convolution or completed-algebra structure on measures.
- At n=1 the actual integral measure is δ_1. The supplied finite Dirac formula and native ofCoeff_single give the basis element [1]. At r=0 the group has one element and its coefficient is the full integral mass A^O_n(1), not a forced zero.
- Coefficient reduction is the existing MonoidAlgebra.mapRingHom applied to Ideal.Quotient.mk. Reduction modulo (p:O)^0 is zero because that ideal is the whole ring. This coefficient boundary is independent of group level zero.
- For p=2, left quadratic character modulo3, right level-one character and n=5, the coordinate at r=3 is −[1]+[5]. At r=2 the two residues coincide and the integral weights cancel. At n=2 the coordinate is −[1], so the q^p coefficient survives.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-measure
- PadicMeasuresIwasawaAlgebras:L1/finite-projection
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-dirac
- PadicMeasuresIwasawaAlgebras:L1/unit-reduction
- PadicMeasuresIwasawaAlgebras:L1/unit-reduction-continuity
- mathlib:MonoidAlgebra.coeff_ofCoeff
- mathlib:MonoidAlgebra.ofCoeff_single
- mathlib:MonoidAlgebra.mapRingHom
- mathlib:Ideal.Quotient.mk

**Acceptance**

- Only the group index is claimed finite. The ring O and its quotients need not be finite. No completed-algebra equivalence or constant coefficient is constructed.

**API**

- DirichletPadic.integralTwistedEisensteinFinite_eq_projection: E_(n;r)=ofCoeff(π_(red_r)(A^O_n)) using the existing actual projection.
- DirichletPadic.integralTwistedEisensteinFinite_eq_sum: E_(n;r)=Σ_(d|n,p∤d)w_n(d)^O[red_r(u(d))]. Promoted to integral-twisted-eisenstein-finite-divisors.
- DirichletPadic.integralTwistedEisensteinFinite_coeff: The coefficient at a is the sum of all retained weights with red_r(u(d))=a. Promoted to integral-twisted-eisenstein-finite-coefficients.
- DirichletPadic.integralTwistedEisensteinFinite_transition: For r′≤r, the native group-index pushforward sends E_(n;r) to E_(n;r′). Promoted to integral-twisted-eisenstein-finite-refinement.
- DirichletPadic.integralTwistedEisensteinFinite_apply: If c∘f=g∘red_r, then c(A^O_n(f))=Σ_a c(coeff_a(E_(n;r)))g(a). Promoted to integral-twisted-eisenstein-finite-evaluation.
- DirichletPadic.integralTwistedEisensteinFinite_one: At n=1, E_(1;r)=[1].
- DirichletPadic.integralTwistedEisensteinFinite_zero_level: At r=0, E_(n;0)=A^O_n(1)[1].
- DirichletPadic.integralTwistedEisensteinFinite_moment_precision: The difference between the actual arithmetic moment and the finite representative-power pairing is divisible by (p:O)^r. Promoted to integral-twisted-eisenstein-finite-moment-precision.
- DirichletPadic.integralTwistedEisensteinFinite_moment_mod: For s≤r, the arithmetic moment and finite representative-power pairing have the same image in O/(p:O)^s.

**Tests**

- SuggestedTwistedFiniteTests.first_finite_coefficient: For every pair and group level, E_(1;r)=[1].
- SuggestedTwistedFiniteTests.actual_integral_projection: Its native coeff field is exactly the existing finite projection of A^O_n along red_r.
- SuggestedTwistedFiniteTests.trivial_group_remembers_mass: At group level0, the sole coefficient is the actual integral total mass.
- SuggestedTwistedFiniteTests.zero_coefficient_precision: Reduction modulo (p:O)^0 is zero at every group level.
- SuggestedTwistedFiniteTests.dyadic_prime_coefficient_survives: For p=2 with the quadratic-left pair, E_(2;3)=−[1].

**Uses**

- RJW Proposition3.16 and Theorem8.2: Gives the actual finite group coordinates of the already constructed positive coefficient measure.
- Atlas L4 integral q-expansion congruences: Keeps integral weights and independent coefficient reduction for rigorous finite-precision tests.
- Arithmetic moment approximation: Pairs finite coefficients with powers of native residue representatives and states the exact error ideal.

**Sources**

- RJW-published, Propositions3.15–3.16, its complete proof and explicit coordinate maps, Definition3.17 and Example3.19, published121–123/PDF22–24, freshly read in full; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, read in the immediately preceding checkpoint.. Worker specialization of the existing finite-measure projection to the actual integral two-character positive Eisenstein coefficient. The source gives coset masses and the divisor-Dirac construction; character-weighted collisions and quantitative finite moment precision are derived here. The shared finite projection, unit reduction and completed algebra retain their owners. No inverse-limit equivalence or geometric modular family is inferred.

### The weighted divisor formula in finite coordinates

DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-divisors

Declaration: DirichletPadic.integralTwistedEisensteinFinite_eq_sum

Kind: lemma. Implementation: unchecked.

E_(n;r)=Σ_(d|n,p∤d)w_n(d)^O[red_r(u(d))] in the native group algebra O[U_r].

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field and O is its native norm-valuation integer subring, with the inherited normed commutative ring structure. Let ψ:DirichletCharacter K D, φ:DirichletCharacter K E and n:ℕ+. Write A^O_n for the existing integralTwistedPositiveEisensteinMeasure.
- U=(ℤ_p)ˣ and U_r=(ℤ/p^rℤ)ˣ use their native group and topological structures, with r≥0. The shared red_r=PadicInt.unitToZModPow is continuous and agrees with Units.map of the native integer reduction. At r=0 the group is trivial. Neither O nor a coefficient quotient of O is assumed finite.
- Define E_(n;r)=MonoidAlgebra.ofCoeff(π_(red_r)(A^O_n)), using the existing AbstractMeasure.finiteProjection. This is an element of the native MonoidAlgebra O U_r. The explicit ofCoeff conversion is required because MonoidAlgebra is not definitionally its Finsupp coefficient carrier.
- Retain the exact positive divisors d|n with p∤d, their existing natural-cast units u(d), and the integral lifts w_n(d)^O of ψ(n/d)φ(d). Colliding residues contribute the sum of all their weights, including cancellation. There is no averaging factor.
- For reduced evaluation, R is any commutative ring and c:O→+*R any ring homomorphism. Assume explicitly c(f(u))=g(red_r(u)) for the continuous integral test f and the finite function g. No continuity of c or factorization of an arbitrary test at a fixed level is assumed.
- For arithmetic moments, additionally use Algebra ℤ_p K and IsBoundedSMul ℤ_p K, with the existing principal level-zero integral arithmetic test κ^O_e, e≥0. A group level r gives precision (p:O)^r. Coefficient precision s is independent and the quotient moment formula assumes s≤r. No ℤ_p-algebra structure on O is required.

**Construction or proof outline**

- Expand the existing integral coefficient measure into its actual divisor-Dirac sum. The generic projection is O-linear, so it preserves the finite sum and each scalar.
- The supplied finiteProjection_dirac sends δ_u(d) to the native Finsupp.single at red_r(u(d)) with coefficient1. Native ofCoeff_single and scalar compatibility give the required weighted basis element.
- The formula fixes both character positions and the integral coefficient lift. At p=2,n=5,r=3 with the quadratic-left pair it gives precisely −[1]+[5]. It is a specialization of the shared finite projection, not a parallel definition of measure coordinates.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-measure
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-dirac
- mathlib:MonoidAlgebra.ofCoeff_single

**Acceptance**

- The indexing set is the set of retained divisors, not the image set of their residue classes.

**Tests**

- SuggestedTwistedFiniteTests.dyadic_signed_separation: For p=2,n=5 with the quadratic-left pair, E_(5;3)=−[1]+[5].

**Sources**

- RJW-published, Propositions3.15–3.16, its complete proof and explicit coordinate maps, Definition3.17 and Example3.19, published121–123/PDF22–24, freshly read in full; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, read in the immediately preceding checkpoint.. Worker specialization of the existing finite-measure projection to the actual integral two-character positive Eisenstein coefficient. The source gives coset masses and the divisor-Dirac construction; character-weighted collisions and quantitative finite moment precision are derived here. The shared finite projection, unit reduction and completed algebra retain their owners. No inverse-limit equivalence or geometric modular family is inferred.

### Signed residue multiplicities

DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-coefficients

Declaration: DirichletPadic.integralTwistedEisensteinFinite_coeff

Kind: lemma. Implementation: unchecked.

For a∈U_r, coeff_a(E_(n;r))=Σ_(d|n,p∤d,red_r(u(d))=a)w_n(d)^O.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field and O is its native norm-valuation integer subring, with the inherited normed commutative ring structure. Let ψ:DirichletCharacter K D, φ:DirichletCharacter K E and n:ℕ+. Write A^O_n for the existing integralTwistedPositiveEisensteinMeasure.
- U=(ℤ_p)ˣ and U_r=(ℤ/p^rℤ)ˣ use their native group and topological structures, with r≥0. The shared red_r=PadicInt.unitToZModPow is continuous and agrees with Units.map of the native integer reduction. At r=0 the group is trivial. Neither O nor a coefficient quotient of O is assumed finite.
- Define E_(n;r)=MonoidAlgebra.ofCoeff(π_(red_r)(A^O_n)), using the existing AbstractMeasure.finiteProjection. This is an element of the native MonoidAlgebra O U_r. The explicit ofCoeff conversion is required because MonoidAlgebra is not definitionally its Finsupp coefficient carrier.
- Retain the exact positive divisors d|n with p∤d, their existing natural-cast units u(d), and the integral lifts w_n(d)^O of ψ(n/d)φ(d). Colliding residues contribute the sum of all their weights, including cancellation. There is no averaging factor.
- For reduced evaluation, R is any commutative ring and c:O→+*R any ring homomorphism. Assume explicitly c(f(u))=g(red_r(u)) for the continuous integral test f and the finite function g. No continuity of c or factorization of an arbitrary test at a fixed level is assumed.
- For arithmetic moments, additionally use Algebra ℤ_p K and IsBoundedSMul ℤ_p K, with the existing principal level-zero integral arithmetic test κ^O_e, e≥0. A group level r gives precision (p:O)^r. Coefficient precision s is independent and the quotient moment formula assumes s≤r. No ℤ_p-algebra structure on O is required.

**Construction or proof outline**

- Apply native MonoidAlgebra.coeff_sum to the divisor formula and evaluate each single with coeff_single and Finsupp.single_apply. The complete native weighted_coeff proof checks this exact formula.
- Every retained preimage contributes its weight. Several equal residues can add or cancel, even before coefficient reduction. The formula does not count distinct residues and is not an average.
- At p=2,n=5 the quadratic-left weights −1 and1 are at distinct residues modulo8 but the same residue modulo4. Native dyadic_signed_collision proves cancellation in every commutative coefficient ring; dyadic_signed_separation proves nonvanishing at the finer level for every nontrivial coefficient ring.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-divisors
- mathlib:MonoidAlgebra.coeff_sum
- mathlib:MonoidAlgebra.coeff_single
- mathlib:Finsupp.single_apply

**Acceptance**

- Character-weighted cancellation is checked integrally. The coarser coordinate does not determine the finer coordinate.

**Tests**

- SuggestedTwistedFiniteTests.dyadic_signed_collision: For the quadratic-left pair at p=2,n=5, E_(5;2)=0 in the integral group algebra.
- SuggestedTwistedFiniteTests.dyadic_distinct_levels: The same coefficient is nonzero at group level3 but zero at level2.

**Sources**

- RJW-published, Propositions3.15–3.16, its complete proof and explicit coordinate maps, Definition3.17 and Example3.19, published121–123/PDF22–24, freshly read in full; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, read in the immediately preceding checkpoint.. Worker specialization of the existing finite-measure projection to the actual integral two-character positive Eisenstein coefficient. The source gives coset masses and the divisor-Dirac construction; character-weighted collisions and quantitative finite moment precision are derived here. The shared finite projection, unit reduction and completed algebra retain their owners. No inverse-limit equivalence or geometric modular family is inferred.

### Refinement of weighted unit-group coordinates

DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-refinement

Declaration: DirichletPadic.integralTwistedEisensteinFinite_transition

Kind: theorem. Implementation: unchecked.

For r′≤r, MonoidAlgebra.mapDomainRingHom along the native U_r→U_r′ sends E_(n;r) to E_(n;r′).

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field and O is its native norm-valuation integer subring, with the inherited normed commutative ring structure. Let ψ:DirichletCharacter K D, φ:DirichletCharacter K E and n:ℕ+. Write A^O_n for the existing integralTwistedPositiveEisensteinMeasure.
- U=(ℤ_p)ˣ and U_r=(ℤ/p^rℤ)ˣ use their native group and topological structures, with r≥0. The shared red_r=PadicInt.unitToZModPow is continuous and agrees with Units.map of the native integer reduction. At r=0 the group is trivial. Neither O nor a coefficient quotient of O is assumed finite.
- Define E_(n;r)=MonoidAlgebra.ofCoeff(π_(red_r)(A^O_n)), using the existing AbstractMeasure.finiteProjection. This is an element of the native MonoidAlgebra O U_r. The explicit ofCoeff conversion is required because MonoidAlgebra is not definitionally its Finsupp coefficient carrier.
- Retain the exact positive divisors d|n with p∤d, their existing natural-cast units u(d), and the integral lifts w_n(d)^O of ψ(n/d)φ(d). Colliding residues contribute the sum of all their weights, including cancellation. There is no averaging factor.
- For reduced evaluation, R is any commutative ring and c:O→+*R any ring homomorphism. Assume explicitly c(f(u))=g(red_r(u)) for the continuous integral test f and the finite function g. No continuity of c or factorization of an arbitrary test at a fixed level is assumed.
- For arithmetic moments, additionally use Algebra ℤ_p K and IsBoundedSMul ℤ_p K, with the existing principal level-zero integral arithmetic test κ^O_e, e≥0. A group level r gives precision (p:O)^r. Coefficient precision s is independent and the quotient moment formula assumes s≤r. No ℤ_p-algebra structure on O is required.

**Construction or proof outline**

- Use the supplier’s exact unitToZModPow_refinement to identify the two paths from U to U_r′. Its underlying statement is the pinned native zmod_cast_comp_toZModPow; the complete actual_unit_refinement proof checks that native identity on units.
- Apply the supplied finiteProjection_refinement and the explicit MonoidAlgebra conversion. Equivalently map the weighted divisor formula term by term through native mapDomainRingHom and mapDomain_single. The complete group_map_atoms proof checks this finite map.
- Every coarser fiber receives the sum of its finer coefficients. There is no division by the size of a fiber. Coefficient reduction commutes with group pushforward by the native mapRingHom_comp_mapDomainRingHom, and the complete coefficient_map_atoms proof checks its scalar action on the actual atoms.
- The dyadic transition from r=3 to r′=2 sends −[1]+[5] to zero, while the scalar ring remains O. This loss of group information is separate from any reduction modulo a power of p.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-divisors
- PadicMeasuresIwasawaAlgebras:L1/unit-reduction-refinement
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-refinement
- mathlib:MonoidAlgebra.mapDomainRingHom
- mathlib:MonoidAlgebra.mapDomain_single
- mathlib:MonoidAlgebra.mapRingHom_comp_mapDomainRingHom

**Acceptance**

- The construction and transition include level0. No joint inverse-limit surjectivity or completed-algebra equivalence is asserted.

**Tests**

- SuggestedTwistedFiniteTests.compatible_group_refinement: The group-index pushforward from level2 to level1 gives the corresponding coefficient at level1.

**Sources**

- RJW-published, Propositions3.15–3.16, its complete proof and explicit coordinate maps, Definition3.17 and Example3.19, published121–123/PDF22–24, freshly read in full; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, read in the immediately preceding checkpoint.. Worker specialization of the existing finite-measure projection to the actual integral two-character positive Eisenstein coefficient. The source gives coset masses and the divisor-Dirac construction; character-weighted collisions and quantitative finite moment precision are derived here. The shared finite projection, unit reduction and completed algebra retain their owners. No inverse-limit equivalence or geometric modular family is inferred.

### Finite evaluation after coefficient reduction

DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-evaluation

Declaration: DirichletPadic.integralTwistedEisensteinFinite_apply

Kind: comparison. Implementation: unchecked.

If c(f(u))=g(red_r(u)) for all actual units u, then c(A^O_n(f))=Σ_a c(coeff_a(E_(n;r)))g(a).

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field and O is its native norm-valuation integer subring, with the inherited normed commutative ring structure. Let ψ:DirichletCharacter K D, φ:DirichletCharacter K E and n:ℕ+. Write A^O_n for the existing integralTwistedPositiveEisensteinMeasure.
- U=(ℤ_p)ˣ and U_r=(ℤ/p^rℤ)ˣ use their native group and topological structures, with r≥0. The shared red_r=PadicInt.unitToZModPow is continuous and agrees with Units.map of the native integer reduction. At r=0 the group is trivial. Neither O nor a coefficient quotient of O is assumed finite.
- Define E_(n;r)=MonoidAlgebra.ofCoeff(π_(red_r)(A^O_n)), using the existing AbstractMeasure.finiteProjection. This is an element of the native MonoidAlgebra O U_r. The explicit ofCoeff conversion is required because MonoidAlgebra is not definitionally its Finsupp coefficient carrier.
- Retain the exact positive divisors d|n with p∤d, their existing natural-cast units u(d), and the integral lifts w_n(d)^O of ψ(n/d)φ(d). Colliding residues contribute the sum of all their weights, including cancellation. There is no averaging factor.
- For reduced evaluation, R is any commutative ring and c:O→+*R any ring homomorphism. Assume explicitly c(f(u))=g(red_r(u)) for the continuous integral test f and the finite function g. No continuity of c or factorization of an arbitrary test at a fixed level is assumed.
- For arithmetic moments, additionally use Algebra ℤ_p K and IsBoundedSMul ℤ_p K, with the existing principal level-zero integral arithmetic test κ^O_e, e≥0. A group level r gives precision (p:O)^r. Coefficient precision s is independent and the quotient moment formula assumes s≤r. No ℤ_p-algebra structure on O is required.

**Construction or proof outline**

- Use the actual integral measure evaluation to write A^O_n(f) as the finite sum of w_n(d)^O f(u(d)), then apply the ring homomorphism c term by term.
- The explicit factorization hypothesis identifies c(f(u(d))) with g(red_r(u(d))). Use the weighted coefficient formula, exchange finite sums and evaluate the single surviving indicator for each divisor.
- The complete weighted_pairing and reduced_pairing proofs check precisely this finite coefficient contraction and arbitrary coefficient-ring map. There is no requirement that c be continuous because it is used only on the resulting finite scalar expressions.
- Taking c to be the quotient map O→O/I gives finite integral precision whenever the test factors after that reduction. This does not claim that an arbitrary continuous integral test factors at a prescribed group level.
- The complete native pairing sees signed residues individually. At p=2,n=5,r=3, pairing the quadratic-left coordinate with the natural representative gives −1+5=4.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-coefficients
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-pairing
- mathlib:MonoidAlgebra.mapRingHom

**Acceptance**

- The factorization after coefficient change is an explicit hypothesis; an O-valued lift of an arbitrary finite R-valued test is not assumed.

**Tests**

- SuggestedTwistedFiniteTests.dyadic_residue_representative_moment: At p=2,n=5,r=3 the finite representative-power pairing at exponent1 is4 in O.

**Sources**

- RJW-published, Propositions3.15–3.16, its complete proof and explicit coordinate maps, Definition3.17 and Example3.19, published121–123/PDF22–24, freshly read in full; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, read in the immediately preceding checkpoint.. Worker specialization of the existing finite-measure projection to the actual integral two-character positive Eisenstein coefficient. The source gives coset masses and the divisor-Dirac construction; character-weighted collisions and quantitative finite moment precision are derived here. The shared finite projection, unit reduction and completed algebra retain their owners. No inverse-limit equivalence or geometric modular family is inferred.

### Arithmetic precision of finite coefficient moments

DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-moment-precision

Declaration: DirichletPadic.integralTwistedEisensteinFinite_moment_precision

Kind: theorem. Implementation: unchecked.

For every r,e≥0, (p:O)^r divides A^O_n(κ^O_e)−Σ_a coeff_a(E_(n;r))(val(a):O)^e. Consequently for s≤r these values agree in O/(p:O)^s.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field and O is its native norm-valuation integer subring, with the inherited normed commutative ring structure. Let ψ:DirichletCharacter K D, φ:DirichletCharacter K E and n:ℕ+. Write A^O_n for the existing integralTwistedPositiveEisensteinMeasure.
- U=(ℤ_p)ˣ and U_r=(ℤ/p^rℤ)ˣ use their native group and topological structures, with r≥0. The shared red_r=PadicInt.unitToZModPow is continuous and agrees with Units.map of the native integer reduction. At r=0 the group is trivial. Neither O nor a coefficient quotient of O is assumed finite.
- Define E_(n;r)=MonoidAlgebra.ofCoeff(π_(red_r)(A^O_n)), using the existing AbstractMeasure.finiteProjection. This is an element of the native MonoidAlgebra O U_r. The explicit ofCoeff conversion is required because MonoidAlgebra is not definitionally its Finsupp coefficient carrier.
- Retain the exact positive divisors d|n with p∤d, their existing natural-cast units u(d), and the integral lifts w_n(d)^O of ψ(n/d)φ(d). Colliding residues contribute the sum of all their weights, including cancellation. There is no averaging factor.
- For reduced evaluation, R is any commutative ring and c:O→+*R any ring homomorphism. Assume explicitly c(f(u))=g(red_r(u)) for the continuous integral test f and the finite function g. No continuity of c or factorization of an arbitrary test at a fixed level is assumed.
- For arithmetic moments, additionally use Algebra ℤ_p K and IsBoundedSMul ℤ_p K, with the existing principal level-zero integral arithmetic test κ^O_e, e≥0. A group level r gives precision (p:O)^r. Coefficient precision s is independent and the quotient moment formula assumes s≤r. No ℤ_p-algebra structure on O is required.

**Construction or proof outline**

- Apply the integral measure evaluation and identify κ^O_e(u(d)) with (d:O)^e. This uses the existing integral arithmetic-character inclusion, its actual level-zero coordinate formula and injectivity of the native integer-subring inclusion, without a ℤ_p-algebra on O.
- Use the weighted finite coefficient formula to turn the representative-power pairing into the divisor sum with representative val(red_r(u(d))). Native map_natCast and ZMod.val_natCast identify this natural number with d mod p^r. The complete actual_unit_residue proof checks that exact native unit computation.
- The natural integers d mod p^r and d are congruent modulo p^r. Native Nat.ModEq.pow raises this congruence to exponent e, and Nat.modEq_iff_dvd supplies an integer witness for d^e−(d mod p^r)^e. Cast that witness directly to O. The complete residue_power_divisibility proof checks this argument for every commutative ring.
- Multiply by each integral weight and sum the witnesses using native Finset.dvd_sum. The complete weighted_residue_precision proof establishes the resulting bound. Both r=0 and e=0 are included: the former asserts divisibility by1, and the latter gives exact mass.
- If s≤r then (p:O)^s divides (p:O)^r. Native Ideal.mem_span_singleton and Ideal.Quotient.mk_eq_mk_iff_sub_mem convert divisibility into equality in O/(p:O)^s. Preservation of finite sums, products and natural powers gives the displayed moment_mod API; the complete quotient_precision proof checks the exact quotient step.
- The condition on the group level is substantive. For the dyadic quadratic-left coefficient at n=5, the coordinate at r=2 is zero while its actual exponent-one moment is4. They agree modulo4, but not modulo8. The complete insufficient_group_level proof shows that8 does not divide4 in the actual norm-valuation integer subring of ℚ_2.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-coefficients
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- DirichletPadicLFunctions:L2/arithmetic-character-pointwise-value
- PadicMeasuresIwasawaAlgebras:L1/unit-reduction
- mathlib:ZMod.val_natCast
- mathlib:Nat.ModEq.pow
- mathlib:Nat.modEq_iff_dvd
- mathlib:Finset.dvd_sum
- mathlib:Ideal.mem_span_singleton
- mathlib:Ideal.Quotient.mk_eq_mk_iff_sub_mem
- mathlib:Padic.norm_p
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- The error and quotient equalities are in the native integer ring. Coefficient precision cannot exceed the group resolution without additional information. No arbitrary norm on the power-series carrier is introduced.

**Tests**

- SuggestedTwistedFiniteTests.dyadic_sufficient_precision: The actual exponent-one moment4 of the dyadic quadratic-left coefficient at n=5 vanishes modulo4.
- SuggestedTwistedFiniteTests.dyadic_insufficient_group_level: The same actual moment does not vanish modulo8, although its group-level2 coordinate is zero.

**Sources**

- RJW-published, Propositions3.15–3.16, its complete proof and explicit coordinate maps, Definition3.17 and Example3.19, published121–123/PDF22–24, freshly read in full; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62, read in the immediately preceding checkpoint.. Worker specialization of the existing finite-measure projection to the actual integral two-character positive Eisenstein coefficient. The source gives coset masses and the divisor-Dirac construction; character-weighted collisions and quantitative finite moment precision are derived here. The shared finite projection, unit reduction and completed algebra retain their owners. No inverse-limit equivalence or geometric modular family is inferred.

### Integral character-weighted positive series

DirichletPadicLFunctions:L4/integral-twisted-positive-series

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries

Kind: construction. Implementation: unchecked.

Construct the continuous O-linear positive-series measure E^+_(ψ,φ):C(U,O)→PowerSeries O from the existing actual integral weighted coefficient measures.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- Extend the actual family A^O_n to index0 by the zero measure. Apply native PowerSeries.mk to its values on each integral continuous test. This uses native AbstractMeasure with a general topological module target; a normed power-series ring is unnecessary.
- Native coefficient extensionality proves addition and O-scalar compatibility, using the linearity of each actual coefficient measure and native coeff_smul. Apply the native coefficientwise tendsto criterion to the continuity of each coefficient evaluation. The complete native seriesMeasure constructor and actual_series_continuous proof verify this exact assembly for any family of native R-valued measures.
- Uniqueness follows by extensionality of the bundled measure and then native PowerSeries.ext. The zero and positive coefficient formulas determine the whole map. The complete assembled_unique proof checks that argument.
- The old actual coefficient bound gives a uniform bound ‖coeff_n(E^+(f))‖≤‖f‖, including n=0. This is a family of coefficient bounds, not an asserted norm on the power-series target. The complete assembled_coefficient_bound proof checks precisely that distinction.
- For both level-one characters, test1 gives the old unweighted mass series after each coefficient ring is included separately into ℚ_p. The typed level_one_mass_series test avoids assuming that the native valuation integer subring is definitionally ℤ_p. No missing general coefficient-algebra instance is introduced.
- The initial coefficient is f(1), whereas the constant is0. For the quadratic-left dyadic pair the q² mass coefficient is−1. These tests distinguish the actual ordered character weights and the positive truncation from plausible erroneous series definitions.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-measure
- DirichletPadicLFunctions:L4/positive-eisenstein-series
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-measure
- mathlib:AbstractMeasure
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_smul
- mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-bound

**Acceptance**

- The target carries the native coefficientwise topology. No analytic convergence in q, norm on the series ring or true character-pair constant coefficient is claimed.

**API**

- DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff: Coefficient n is A^O_n(f) for n>0 and0 for n=0. Promoted to integral-twisted-positive-series-coeff.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff_zero: The constant coefficient is zero.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff_pos: Every positive coefficient is the actual integral coefficient measure applied to f.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_zero: The zero test gives zero.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_add: E^+(f+g)=E^+(f)+E^+(g).
- DirichletPadic.integralTwistedPositiveEisensteinSeries_smul: E^+(a•f)=a•E^+(f) for every a∈O.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_continuous: The actual map is continuous for the native coefficientwise topology.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_unique: A native series-valued measure with the specified zero and positive coefficients equals E^+.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff_norm_le: Each coefficient has norm at most the sup norm of f, uniformly in n.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_test_congr: If b divides g(u)−f(u) for every u, then C(b) divides E^+(g)−E^+(f) in O[[q]]. Promoted to integral-twisted-positive-series-test-congruence.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff_mul_p: After inclusion into K, coefficient pn equals ψ(p) times coefficient n, including n=0. Promoted to integral-twisted-positive-series-p-scaling.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_weight_congr: For r≥1 and e≡e′ modulo p^(r−1)(p−1), C((p:O)^r) divides E^+(κ^O_e′)−E^+(κ^O_e). Promoted to integral-twisted-positive-series-weight-congruence.
- DirichletPadic.integralTwistedPositiveEisensteinSeries_finite_moment_mod: For s≤r, reduction modulo (p:O)^s of E^+(κ^O_e) is the series of the actual level-r finite-coordinate moment pairings. Promoted to integral-twisted-positive-series-finite-moments.
- DirichletPadic.coe_integralTwistedPositiveEisensteinSeries_apply: Coefficient inclusion into K identifies the whole series with native mk of the actual K-valued coefficient evaluations. Promoted to integral-twisted-positive-series-coefficient-inclusion.

**Tests**

- SuggestedTwistedSeriesTests.zero_test_series: The zero integral test gives the zero power series.
- SuggestedTwistedSeriesTests.positive_truncation_constant: The constant coefficient is zero for every integral test.
- SuggestedTwistedSeriesTests.first_series_coefficient: The coefficient of q is exactly f(1), for every ordered character pair.
- SuggestedTwistedSeriesTests.level_one_mass_series: For K=ℚ_p and both characters of level1, the mass series agrees with the old unweighted positive-series mass after the two native coefficient inclusions into ℚ_p.
- SuggestedTwistedSeriesTests.dyadic_series_prime_sign: For p=2 and the quadratic-left character modulo3, the coefficient of q² at test1 is−1.

**Uses**

- RJW Theorem8.2 positive q-expansion and Remark8.3 weight congruences: Assembles the actual integral coefficient measures so arithmetic congruences hold for the whole positive formal series.
- Atlas L4 character-weighted Eisenstein interpolation: Preserves the integral coefficient ring, ordered pair, coefficient inclusion and left-character p-index scaling.
- Finite-precision whole q-expansions: Identifies coefficient reduction of the entire positive series with existing finite group-coordinate moments at sufficient resolution.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Coefficients of the integral weighted positive series

DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff

Kind: lemma. Implementation: unchecked.

coeff_n(E^+_(ψ,φ)(f)) is A^O_(ψ,φ,n)(f) for n>0, and0 for n=0.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- Use native coeff_mk on the actual family used in the construction. This is a direct equality with the existing integral coefficient measure, not a new arithmetic-function definition.
- Specialize to positive n and then to n=1. The existing integral Dirac formula gives f(1), independently of both conductors. At n=0 the coefficient is zero by the chosen truncation.
- For the dyadic quadratic-left pair, the actual exponent-one coefficient at n=5 is−1+5=4. The complete native coefficient_formula checks extraction from the actual assembled measure; the typed example uses the actual existing weighted coefficient and integral arithmetic character.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-moment
- mathlib:PowerSeries.coeff_mk

**Acceptance**

- The coefficient formula includes n=0 and retains the actual measure for every positive index.

**Tests**

- SuggestedTwistedSeriesTests.actual_positive_coefficient: For every positive n and test f, the actual series coefficient equals A^O_n(f).
- SuggestedTwistedSeriesTests.dyadic_series_fifth_moment: For the quadratic-left pair at p=2, the q⁵ coefficient of E^+(κ^O_1) is4.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Coefficient inclusion of the whole positive series

DirichletPadicLFunctions:L4/integral-twisted-positive-series-coefficient-inclusion

Declaration: DirichletPadic.coe_integralTwistedPositiveEisensteinSeries_apply

Kind: comparison. Implementation: unchecked.

PowerSeries.map(O↪K)(E^+_(ψ,φ)(f)) equals PowerSeries.mk of the actual K-valued coefficient evaluations on the included test, with zero constant.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- Use native PowerSeries.ext and coeff_map. For n>0 substitute the promoted coefficient formula and the existing coe_integralTwistedPositiveEisensteinMeasure_apply theorem; at n=0 both sides vanish.
- The test in C(U,K) is the composite of f with the actual continuous subtype inclusion O→K. Native PowerSeries.map uses the integer subring’s ring homomorphism. No second family of K-series measures is needed.
- The complete native map_series and mapped_series_ext proofs verify coefficient inclusion and assembly through an arbitrary coefficient ring homomorphism. Continuity of a general ring map is not assumed in the formal-series equality.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- mathlib:PowerSeries.map
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.ext

**Acceptance**

- The inclusion is the actual native integer-subring map. The theorem neither identifies O definitionally with ℤ_p nor asserts a new general scalar extension of measure spaces.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Integral ideals control the whole positive series

DirichletPadicLFunctions:L4/integral-twisted-positive-series-test-congruence

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_test_congr

Kind: theorem. Implementation: unchecked.

For b∈O, if b divides g(u)−f(u) at every u∈U, then C(b) divides E^+(g)−E^+(f) in PowerSeries O.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- The existing actual coefficient test-congruence theorem gives b-divisibility at every positive index. The difference of constant coefficients is zero, hence also divisible by b.
- For each index choose an integral quotient coefficient. Assemble those witnesses with native PowerSeries.mk. Native coeff_C_mul and extensionality prove that multiplying the resulting whole series by C(b) gives precisely the series difference.
- The complete constant_divisibility and assembled_difference_divisibility proofs check this witness argument over any normed commutative coefficient ring. No field division or constant-series invertibility is used.
- The converse coefficient_divisibility native proof shows that whole-series C(b)-divisibility implies b-divisibility of each coefficient. At b=0 the assertion reduces to equality; the typed zero_ideal_series_equality test checks that edge case.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-test-congruence
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.ext

**Acceptance**

- All witnesses lie in O. The argument includes b=0 and does not discard integral precision by moving to K.

**Tests**

- SuggestedTwistedSeriesTests.zero_ideal_series_equality: If0 divides g(u)−f(u) everywhere, the two whole positive series are equal.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Weight congruences of integral weighted positive series

DirichletPadicLFunctions:L4/integral-twisted-positive-series-weight-congruence

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_weight_congr

Kind: theorem. Implementation: unchecked.

For r≥1 and e≡e′ modulo p^(r−1)(p−1), C((p:O)^r) divides E^+(κ^O_e′)−E^+(κ^O_e) in O[[q]].

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- Apply the existing integral weighted coefficient weight-congruence at each positive n. It uses actual integral arithmetic characters and the full prime-power totient modulus. The zero coefficient contributes zero.
- As in the preceding whole test-ideal theorem, choose integral quotient coefficients and assemble them with native mk. The complete native constant_divisibility proof supplies the whole-series step. This does not require an unstated pointwise divisibility theorem for arbitrary K-valued unit tests.
- At p=2,r=3, exponents1 and5 differ by4=2^(3−1)(2−1), so their entire positive-series difference is divisible by C(8). The q⁵ difference for the quadratic-left pair is3120, consistent with this integral statement.
- The tame component alone is insufficient. For p=5 and the quadratic-left character modulo3, exponents3 and7 agree modulo4, but the q² difference is120. The prior actual integer-ring counterexample says25 does not divide120. Native coefficient_divisibility then rules out divisibility of the whole series difference by C(25).

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-test-congruence
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-weight-congruence
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.ext

**Acceptance**

- The stated exponent modulus includes the p-power part. This is an integral formal-series theorem, not a claim of modularity or analytic weight-space interpolation.

**Tests**

- SuggestedTwistedSeriesTests.dyadic_whole_series_congruence: For p=2 and the quadratic-left pair, C(8) divides the whole difference between exponents5 and1.
- SuggestedTwistedSeriesTests.tame_only_whole_series_failure: For p=5 and the quadratic-left pair, C(25) does not divide the whole difference between exponents7 and3, despite equality modulo p−1.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Left-character scaling of positive-series indices

DirichletPadicLFunctions:L4/integral-twisted-positive-series-p-scaling

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_coeff_mul_p

Kind: theorem. Implementation: unchecked.

After O↪K, coeff_(pn)(E^+(f))=ψ(p)coeff_n(E^+(f)) for every n≥0.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- For n>0, the coefficient formula and actual inclusion comparison reduce the claim to the existing twistedPositiveEisensteinMeasure_mul_p theorem. Its ordered left-character factor is ψ(p).
- At n=0 both coefficients vanish. The complete native zero_extended_scaling proof checks the extension of the positive-index identity over this boundary.
- No integral lift of ψ(p) is introduced as a new generic character construction: the signature records the identity after the existing inclusion into K. Subtype injectivity recovers integral identities when the factor is explicitly integral, as in the dyadic sign test.
- For the quadratic-left character modulo3 at p=2, coefficient10 is the negative of coefficient5 for every integral test. The native wrong_left_character proof rejects replacing−1 by1 in characteristic different from2. If p divides the left conductor the same finite identity may instead force zero; neither unconditional invariance nor unconditional deletion of all p-indexed coefficients is claimed.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coefficient-inclusion
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-p-scaling

**Acceptance**

- The scaling factor is the left character ψ(p), independent of the moment exponent; it is not the right-character Euler-deletion factor.

**Tests**

- SuggestedTwistedSeriesTests.dyadic_series_index_sign: At p=2 with the quadratic-left pair, coeff_10(E^+(f))=−coeff_5(E^+(f)) for every integral continuous test.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Finite-coordinate moments of the whole reduced series

DirichletPadicLFunctions:L4/integral-twisted-positive-series-finite-moments

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_finite_moment_mod

Kind: comparison. Implementation: unchecked.

For s≤r, reduction modulo (p:O)^s of E^+(κ^O_e) equals the native mk series with positive coefficient Σ_a red_s(coeff_a(E_(n;r)))val(a)^e and zero constant.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- Use native PowerSeries.ext and coeff_map to inspect each coefficient of the actual reduced series. At n=0 the coefficient vanishes.
- For every positive n, the existing integralTwistedEisensteinFinite_moment_mod theorem identifies the coefficient with the finite pairing over (ℤ/p^rℤ)ˣ. It uses the actual projected integral measure and keeps all signed contributions from colliding residues.
- Native mk assembles these exact quotient-ring coefficients; the complete mapped_series_ext proof checks the formal-series step for arbitrary coefficient ring maps. Only the group-index set is finite. No finiteness of O or its quotient and no inverse-limit equivalence are used.
- The same group level r works for every q-index n because the prior integral residue-power error bound is uniform. This produces equality of whole formal series, not merely a finite truncation. The finite numerical controls below are separate finite checks of that statement’s arithmetic content.
- For the dyadic quadratic-left pair at n=5, the group-level2 coordinate is zero while the actual exponent-one coefficient is4 and is nonzero modulo8. The typed insufficient_group_level_in_series test exhibits this failure within the actual mapped series. The requirement s≤r cannot be omitted.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-moment-precision
- mathlib:PowerSeries.map
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext

**Acceptance**

- Group precision and coefficient precision are independent parameters with the explicit relation s≤r. The generic completed-algebra comparison stays open with its owner.

**Tests**

- SuggestedTwistedSeriesTests.insufficient_group_level_in_series: The dyadic quadratic-left q⁵ coordinate at group level2 is zero, but the coefficient of q⁵ in the exponent-one series reduced modulo8 is nonzero.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Uniform bounds for integral weighted coefficients

DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-bound

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_bound

Kind: lemma. Implementation: unchecked.

For every positive n and f∈C(U,O), ‖A^O_(ψ,φ,n)(f)‖≤‖f‖.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field, O is its native norm-valuation integer subring and U=(ℤ_p)ˣ. Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E, with their ordered character positions retained.
- The actual existing integral coefficient A^O_(ψ,φ,n) is used for every n>0. The new series E^+_(ψ,φ)(f) has coefficient A^O_n(f) for n>0 and zero at0. Its target is the native PowerSeries O with the native coefficientwise topology.
- The bundled map is AbstractMeasure U O (PowerSeries O), namely a continuous O-linear map from C(U,O). No convolution-ring structure on measures, no norm on O[[q]], and no completeness of K or O are required for this assembly.
- The zero constant denotes positive truncation only. It is not the true Eisenstein constant coefficient. No primitive-character condition, parity, exceptional-weight modularity or analytic-family construction is asserted.
- Moment statements additionally require Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and use the existing principal level-zero integral arithmetic character κ^O_e for natural e. The arithmetic exponent is e=k−1. No ℤ_p-algebra structure on O is postulated.
- Finite moment reduction has group level r and coefficient precision s, with s≤r. Its coefficient ring is O/(p:O)^s, not assumed finite. Powers use native natural representatives of units modulo p^r.

**Construction or proof outline**

- Promote the existing integral coefficient constructor’s bound API because the new whole-series constructor consumes it. Its suggested signature is already present in the preserved predecessor; it is not redefined or duplicated.
- Use the promoted all-test coefficient inclusion to identify the included value with A^K_n on the actual included continuous test. The norm of an element of the native integer subring is its inherited K-norm.
- Apply the existing uniform K-valued test bound with the second test zero. Subtype inclusion is an isometry, so the sup norm of its composite with f equals the sup norm of f. Alternatively the same finite weighted-atom proof bounds every summand by ‖f‖, then uses the ultrametric maximum bound.
- The result is uniform in n and in the two finite characters. It uses neither completeness nor a ℤ_p-algebra on O, and has no factor counting divisors. The whole-series assembly applies this bound separately to each positive coefficient and handles the zero coefficient directly.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-test-bound
- mathlib:SubringClass.toNormedCommRing
- mathlib:ContinuousMap.norm_coe_le_norm

**Acceptance**

- This is a promoted existing API with the exact previous Lean signature. The bound is on scalar evaluations and the compact-domain sup norm, never a norm on the weak measure carrier.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 with its entire proof and Remark8.3, published159–161/PDF60–62, freshly read in full. Proposition3.16, Definition3.17 and Example3.19, published121–123, read in the preceding finite-coordinate checkpoint.. Worker extension of the positive divisor-Dirac construction to the already planned integral two-character coefficients. Native coefficientwise topology assembles the measures and their congruences. The character-pair extension and precise finite-coordinate reduction are derived here; they are not attributed verbatim to the source. The actual constant coefficient, classical modularity and weight-space geometry retain their existing boundaries and owners.

### Finite-character twisting of integral coefficients

DirichletPadicLFunctions:L4/integral-twisted-coefficient-character-twist

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_character_twist

Kind: theorem. Implementation: unchecked.

A^O_(ψ,φ,n)(κ^O_(t,χ,0)·f)=A^O_(ψ,φ.mul χ,n)(f) for every actual integral continuous test f.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- Evaluate both actual integral measures by their existing finite weighted divisor formula. At each retained divisor d, the promoted natural-input arithmetic-character formula and its integral coefficient inclusion identify κ^O_(t,χ,0)(u(d)) after inclusion as χ(d).
- Native DirichletCharacter.mul already forms the product at lcm(E,p^t). Prove its natural-input product formula by considering whether d is coprime to both levels. In the unit case use the native changeLevel_eq_cast_of_dvd on the actual unit represented by d and native cast_natCast. If either coprimality fails, native map_nonunit makes both the product character and the corresponding factor zero. The complete native_character_product proof checks all cases, including level0.
- The integral scalar multiplying f(u(d)) has included value ψ(n/d)φ(d)χ(d), equal to the included scalar for the right-product pair. Subtype injectivity gives equality inside O; reassociate the finite products and sums. The complete actual_atomic_test_twist proof verifies multiplication of the test against actual native Dirac sums.
- The new finite character multiplies the divisor-side φ, because it is evaluated at u(d), not at the complementary divisor n/d. The existing left character ψ and its p-index scaling factor remain unchanged.
- At n=1 the formula evaluates to f(1). At p=2 with χ modulo4, the only retained divisor of2 is1, so the q² coefficient survives. A mistaken left-character twist would instead see χ(2)=0.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- DirichletPadicLFunctions:L2/arithmetic-character-natural-value
- mathlib:DirichletCharacter.mul
- mathlib:DirichletCharacter.changeLevel_eq_cast_of_dvd
- mathlib:MulChar.map_nonunit
- mathlib:MulChar.mul_apply

**Acceptance**

- The character product is the existing native product, with its exact level and zero extension. No new generic measure-twist operator or primitive-product convention is introduced.

**Tests**

- SuggestedWildEisensteinTests.coefficient_twist_identity_atom: At the first positive coefficient, the character-weighted test evaluates to f(1).

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### Arithmetic moments with a finite character

DirichletPadicLFunctions:L4/integral-twisted-coefficient-arithmetic-moment

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_arithmetic_moment

Kind: theorem. Implementation: unchecked.

The included value A^O_(ψ,φ,n)(κ^O_(t,χ,e)) is Σ_(d|n,p∤d)ψ(n/d)φ(d)χ(d)d^e in K.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- Use the actual integral coefficient inclusion, then the existing K-valued finite divisor evaluation on the included arithmetic test. The integral character inclusion and promoted natural-input formula give χ(d)d^e at the actual unit u(d).
- Reassociate the three character values and the natural power. The arithmetic exponent is e, hence k−1 in a weight-k application. No assumption of primitivity or positive e is needed for the finite identity.
- Native weighted_right_character checks that each such summand also equals ψ(n/d)(φ.mul χ)(d)d^e using the actual native product. This supplies the integral specialization comparison below by injectivity of the coefficient inclusion.
- At n=1 every factor is1. The principal character modulo p^t is1 on retained divisors, so its moment agrees with the existing principal level-zero moment even when t>0. The native dyadic_right_prime_survives and dyadic_right_third_moment proofs compute the precise small divisor sums.
- For p=2, base pair(1,1) and χ modulo4 with χ(3)=−1, the exponent-one q³ coefficient is1−3=−2. Putting χ in the left position gives−1+3=2; the typed tests retain this distinction.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- DirichletPadicLFunctions:L4/integral-twisted-coefficient-character-twist
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- DirichletPadicLFunctions:L2/arithmetic-character-natural-value

**Acceptance**

- The identity is in the actual field after the native coefficient inclusion. Integral comparisons below use subtype injectivity, not field divisibility.

**Tests**

- SuggestedWildEisensteinTests.first_arithmetic_coefficient: Every finite character and exponent give1 at the first positive coefficient.
- SuggestedWildEisensteinTests.principal_character_preserves_moment: The principal character at any p-power level gives the old principal level-zero coefficient moment.
- SuggestedWildEisensteinTests.wild_right_third_moment: For p=2 and the quadratic character modulo4 inserted in the test, the q³ exponent-one coefficient is−2.
- SuggestedWildEisensteinTests.wrong_left_third_moment: For the same χ placed on the left, the principal exponent-one coefficient at n=3 is+2.

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### Finite-character twisting of the whole positive series

DirichletPadicLFunctions:L4/integral-twisted-series-character-twist

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_character_twist

Kind: comparison. Implementation: unchecked.

E^+_(ψ,φ)(κ^O_(t,χ,0)·f)=E^+_(ψ,φ.mul χ)(f) in PowerSeries O for every continuous integral test f.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- Apply native PowerSeries.ext to the two actual series. At each positive index use the promoted series coefficient formula and the preceding actual coefficient character-twist theorem.
- Both constant coefficients are zero. No infinite summation or convergence argument is needed: native formal-series extensionality identifies the entire objects.
- The complete coefficientwise_twist proof checks assembly of coefficient equality. The equality is inside O[[q]], with the original native topology and actual measures on each side.
- The typed actual_series_character_specialization test extracts any positive coefficient of this whole equality and identifies it with the actual right-product coefficient measure, preventing replacement by a surrogate scalar sequence.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-coefficient-character-twist
- mathlib:PowerSeries.ext

**Acceptance**

- The left character stays unchanged. This is an identity of existing specific integral series, not a new shared twist construction.

**Tests**

- SuggestedWildEisensteinTests.actual_series_character_specialization: Every positive coefficient of the character-weighted whole series equals the actual right-product coefficient evaluation.

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### Integral arithmetic specialization as a right-character product

DirichletPadicLFunctions:L4/integral-twisted-series-arithmetic-twist

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_arithmetic_twist

Kind: comparison. Implementation: unchecked.

E^+_(ψ,φ)(κ^O_(t,χ,e))=E^+_(ψ,φ.mul χ)(κ^O_(0,1,e)) in O[[q]].

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- At each positive coefficient, include both values into K. The preceding general arithmetic-moment formula gives ψ(n/d)φ(d)χ(d)d^e on the left, and the existing principal arithmetic-moment theorem gives ψ(n/d)(φ.mul χ)(d)d^e on the right.
- The complete native_character_product and weighted_right_character proofs identify each summand. Injectivity of O↪K brings the equality back to O. The zero coefficient is zero on both sides; apply native PowerSeries.ext.
- Equivalently the arithmetic test is the product of its finite-order part and the principal arithmetic power. The coefficient argument above uses only already available character formulas, without adding an assumed character-factorization field.
- For a principal finite character of arbitrary p-power level, its values are1 on all retained divisors, so the whole specialized series is unchanged. This is true even though its native zero extension at p differs from that of the level-one character.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-coefficient-arithmetic-moment
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-moment
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- mathlib:DirichletCharacter.mul
- mathlib:PowerSeries.ext

**Acceptance**

- Keep the actual integral equality and the product character at its lcm level. This does not replace its zero extension by that of a primitive inducing character.

**Tests**

- SuggestedWildEisensteinTests.principal_character_preserves_series: The whole arithmetic series for a principal finite character at any p-power level equals its principal level-zero counterpart.
- SuggestedWildEisensteinTests.wild_prime_coefficient_survives: For p=2 and χ modulo4, the q² arithmetic coefficient of the base pair(1,1) is1 for every natural exponent, although χ(2)=0.

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### The finite-character positive q-expansion

DirichletPadicLFunctions:L4/integral-twisted-series-arithmetic-moment

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_arithmetic_moment

Kind: theorem. Implementation: unchecked.

After O↪K, E^+_(ψ,φ)(κ^O_(t,χ,e)) is native mk with coefficient Σ_(d|n,p∤d)ψ(n/d)φ(d)χ(d)d^e for n>0, and zero constant.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- Use native coeff_map and the promoted actual series coefficient formula. At every positive index the arithmetic coefficient moment theorem supplies the exact finite sum.
- The zero index maps to zero under the native integer-subring ring homomorphism. Native PowerSeries.ext then identifies the whole mapped series with the displayed native mk.
- The complete mapped_moment_series proof checks this assembly through an arbitrary coefficient ring homomorphism. This assertion concerns formal coefficients only; no q-adic analytic convergence, primitive-character Eisenstein-form existence or exceptional-weight comparison is inferred.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-coefficient-arithmetic-moment
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- mathlib:PowerSeries.map
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext

**Acceptance**

- The character ordering and exponent are displayed explicitly. The character-pair constant coefficient remains a separate unresolved task.

**Tests**

- SuggestedWildEisensteinTests.character_series_constant_zero: Every finite-character arithmetic specialization has zero constant coefficient as a positive truncation.

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### Weight congruences on a fixed finite-character component

DirichletPadicLFunctions:L4/integral-twisted-series-character-weight-congruence

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_character_weight_congr

Kind: theorem. Implementation: unchecked.

For fixed χ, r≥1 and e≡e′ modulo p^(r−1)(p−1), C((p:O)^r) divides E^+_(ψ,φ)(κ^O_(t,χ,e′))−E^+_(ψ,φ)(κ^O_(t,χ,e)).

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- Use the integral arithmetic specialization comparison for both exponents. This rewrites the two whole series to the same pair(ψ,φ.mul χ) and principal arithmetic tests.
- Apply the existing whole-series integral weight-congruence theorem to this pair. It already includes arbitrary finite right characters and keeps the full prime-power totient modulus. No t≤r condition enters this argument.
- As a coefficient check, χ(d) is one more integral bounded scalar multiplying the same difference d^e′−d^e. The complete native weighted_divisibility proof shows that arbitrary integral weights preserve the finite divisibility witnesses.
- For the dyadic quadratic character modulo4 and base pair(1,1), exponents1 and5 give whole-series C(8)-divisibility. The q³ difference is−240. The fixed character must be the same in both specializations; varying the finite character is not covered by this theorem.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-series-arithmetic-twist
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-weight-congruence

**Acceptance**

- The precision is divisibility in O[[q]], not the vacuous field divisibility of a scalar. No conductor-only or tame-only exponent criterion replaces the full modulus.

**Tests**

- SuggestedWildEisensteinTests.wild_whole_weight_congruence: For p=2, χ modulo4 and the base pair(1,1), C(8) divides the whole exponent5 minus exponent1 series.

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### Finite coordinates after inserting the character

DirichletPadicLFunctions:L4/integral-twisted-series-character-finite-moments

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_character_finite_moment_mod

Kind: comparison. Implementation: unchecked.

For s≤r, the reduction of E^+_(ψ,φ)(κ^O_(t,χ,e)) is the series of finite representative-power pairings of E_(ψ,φ.mul χ,n;r), with zero constant.

**Hypotheses**

- p is any prime, including2. K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native norm-valuation integer subring and U=(ℤ_p)ˣ. No completeness or ℤ_p-algebra structure on O is assumed.
- Fix ψ:DirichletCharacter K D, φ:DirichletCharacter K E, t≥0 and χ:DirichletCharacter K(p^t). All use their native zero extension. Primitivity, nontriviality and tame-level coprimality are not required for these finite arithmetic statements. In the intended tame application p∤DE.
- The actual integral coefficient measures A^O_(ψ,φ,n), their continuous positive-series measure E^+_(ψ,φ), and the existing integral arithmetic characters κ^O_(t,χ,e) are reused. The new statements do not define those objects again.
- The right product is exactly native φ.mul χ:DirichletCharacter K(lcm(E,p^t)), formed by native changeLevel and multiplication. On natural d its value is φ(d)χ(d), including zeros at nonunits. It is not replaced by its primitive inducing character, whose zero extension can differ.
- An arithmetic exponent e≥0 corresponds to classical weight e+1, without asserting classical modularity at any weight. The whole series has its existing zero constant as a positive truncation.
- Finite-coordinate reduction first incorporates χ into the actual weighted coefficient measure and then projects to group level r. Coefficient precision s satisfies s≤r. This ordering permits r<t. It does not assert that a fixed coarse untwisted coordinate determines the character twist.

**Construction or proof outline**

- First use the integral arithmetic specialization equality to insert χ into the right character of the actual integral measure. Then use the existing whole-series finite-coordinate moment theorem for the pair(ψ,φ.mul χ).
- The right-hand finite coordinates are the actual projection of this already weighted coefficient measure. The character values are scalar coefficients before residues collide. Thus the remaining residue-power approximation has the same precision p^r as before, independent of t.
- Only s≤r is required. In particular r<t is allowed when the character is applied before projection. This does not evaluate χ on representatives of a coarser untwisted coordinate, and it does not assert that χ factors through that smaller group.
- For p=2, χ modulo4, n=3 and r=1, the right-product finite coordinate is[1]−[3]=0 because1 and3 coincide modulo2. The actual exponent-one moment is−2, so the zero coordinate correctly computes it modulo2. The complete native dyadic_coarse_after_twist proof verifies the actual group-algebra cancellation.
- The untwisted coordinate at the same index and group level is2[1], not zero. Multiplying it afterward by χ(1)=1 would retain2 and miss the signed cancellation. The typed untwisted_coarse_coordinate_loses_character test records this concrete distinction. Finite controls include r<t and a failure of this incorrect order of operations.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-series-arithmetic-twist
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-finite-moments
- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-divisors

**Acceptance**

- The order of operations is part of the statement. Neither a generic completed-algebra equivalence nor a finite quotient character at insufficient resolution is asserted.

**Tests**

- SuggestedWildEisensteinTests.character_inserted_before_coarse_projection: At p=2,n=3 with the quadratic right product modulo4, the group-level1 coordinate is zero.
- SuggestedWildEisensteinTests.coarse_after_twist_moment_precision: The actual exponent-one moment−2 is zero modulo2, even though the character level2 exceeds the group level1.
- SuggestedWildEisensteinTests.untwisted_coarse_coordinate_loses_character: At this index and group level the untwisted finite coordinate differs from the coordinate projected after inserting χ.

**Sources**

- RJW-published, Whole published143–146/PDF44–47 freshly read: end of Theorem5.1, Theorem5.7 and Remark5.8, full tame proof including Lemmas5.9–5.12 and equations5-5/5-6, Definition5.13. Whole published159–161/PDF60–62, Theorem8.2 and Remark8.3, read in predecessor4764.. Worker specialization of the existing integral weighted positive coefficients at the already constructed arithmetic character χ(x)x^e. Twisting finite divisor atoms changes the right character using native DirichletCharacter.mul. This direct finite argument does not use the invalid geometric expansion in Lemma5.10, does not assert a new generic twist functor, and does not identify a primitive conductor with an arbitrary modulus. No generalized constant term or classical modularity is attributed to these source passages.

### Coefficient-field change for weighted integral measures

DirichletPadicLFunctions:L4/integral-twisted-coefficient-base-change

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_baseChange

Kind: comparison. Implementation: unchecked.

c(A^K_(ψ,φ,n)(f))=A^L_(ψ_L,φ_L,n)(c_*f) for every integral continuous test f.

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Use the existing native valuation-extension integer-ring algebra map. Native val_algebraMap identifies its underlying field map; the complete integer_map_continuous proof checks the actual continuous subtype lift. This reuses the library construction instead of defining another coefficient carrier or map.
- Apply the existing actual integral finite divisor evaluation and commute c through the finite sum and products. The retained divisor set and the actual p-adic unit at d are independent of the coefficient field.
- Each integral atomic weight maps to the target weight: after inclusion into L this says algebraMap(ψ(n/d)φ(d))=ψ_L(n/d)φ_L(d). Native ringHomComp and map_mul prove the equality, then native subtype injectivity returns to O_L. The complete character_weight_change proof checks the field equality.
- The complete atomic_coefficient_change proof checks the whole comparison for native finite Dirac sums, an actual continuous ring map and the actual composite test. This is a comparison of the specific finite-atom measures on included tests, not a new generic extension of arbitrary measures.
- At n=1 both sides give c(f(1)). With the identity field extension, c is the native identity algebra map and the original measure evaluation is recovered.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-evaluation
- mathlib:Valuation.HasExtension
- mathlib:Valuation.HasExtension.instAlgebraInteger
- mathlib:Valuation.HasExtension.val_algebraMap
- mathlib:continuous_algebraMap
- mathlib:Continuous.subtype_mk
- mathlib:MulChar.ringHomComp

**Acceptance**

- Continuity is proved for the actual native integer-ring map. No general O_K-to-O_L measure extension or unproved density criterion is introduced.

**Tests**

- SuggestedEisensteinCoefficientChangeTests.first_coefficient_base_change: The extended first coefficient on c_*f is c(f(1)).
- SuggestedEisensteinCoefficientChangeTests.identity_coefficient_change: The identity coefficient extension preserves the actual integral coefficient evaluation.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Coefficient-field change in finite unit-group coordinates

DirichletPadicLFunctions:L4/integral-twisted-finite-base-change

Declaration: DirichletPadic.integralTwistedEisensteinFinite_baseChange

Kind: comparison. Implementation: unchecked.

MonoidAlgebra.mapRingHom(U_r,c)(E^K_(ψ,φ,n;r))=E^L_(ψ_L,φ_L,n;r) at every group level r≥0.

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Expand the actual finite coordinate by the promoted weighted divisor formula. Its group indices are the same native reductions of the same p-adic units on both sides.
- Native mapRingHom_single maps each scalar coefficient by c and leaves its unit-group index unchanged. The atomic weight identity from coefficient base change identifies the resulting scalar with the target character weight. Commute the map through the finite sum.
- The complete finite_coefficient_change proof verifies exactly this native group-algebra map. It includes signed or nonrational character values and residue collisions; no scalar is replaced by its rational or real component.
- The first coefficient maps to[1]. In a compatible tower K→L→M, the native integer-ring maps compose by their field inclusions and subtype extensionality; native group-algebra coefficient maps then compose. The typed tower test retains this functoriality.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-eisenstein-finite-divisors
- DirichletPadicLFunctions:L4/integral-twisted-coefficient-base-change
- mathlib:MonoidAlgebra.mapRingHom
- mathlib:MonoidAlgebra.mapRingHom_single

**Acceptance**

- The group level is unchanged. Coefficient-field change does not assert finiteness of the integer rings or their residue quotients.

**Tests**

- SuggestedEisensteinCoefficientChangeTests.finite_first_atom_base_change: Every group level sends the first finite coefficient to the basis element[1].
- SuggestedEisensteinCoefficientChangeTests.finite_coordinate_change_composes: Finite coefficient maps through a compatible field tower equal the direct coefficient map.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Coefficient-field change for the whole positive series

DirichletPadicLFunctions:L4/integral-twisted-series-base-change

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_baseChange

Kind: comparison. Implementation: unchecked.

PowerSeries.map c(E^K_(ψ,φ)(f))=E^L_(ψ_L,φ_L)(c_*f).

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Use native PowerSeries.ext and coeff_map. At every positive index the actual series coefficient formula reduces the claim to the promoted integral coefficient base-change theorem.
- Both zero coefficients are zero, and c preserves zero. The complete power_series_change proof checks that these coefficient equalities identify the whole formal series.
- Native PowerSeries.map_comp and equality of the integer-ring maps on underlying field values give composition in a compatible field tower. Native self-algebra maps give the identity case. Both appear as typed tests on the actual series.
- The series target keeps its existing native coefficientwise topology. The equality is a formal-series comparison and uses no analytic convergence or completed-algebra equivalence.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-coefficient-base-change
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.map_comp

**Acceptance**

- The zero constant is still only positive truncation. No constant-term descent or modular-form scalar extension is supplied.

**Tests**

- SuggestedEisensteinCoefficientChangeTests.identity_series_change: The native self coefficient map preserves the whole series.
- SuggestedEisensteinCoefficientChangeTests.extension_preserves_zero_constant: The extended positive series still has zero constant coefficient.
- SuggestedEisensteinCoefficientChangeTests.series_change_composes: Mapping the whole actual series through K→L→M equals mapping it directly to M.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Equality of positive series descends through coefficient extension

DirichletPadicLFunctions:L4/integral-twisted-series-base-change-equality

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_baseChange_eq_iff

Kind: theorem. Implementation: unchecked.

Two extended actual positive series on c_*f and c_*g are equal if and only if their original O_K-valued positive series are equal.

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Rewrite both extended series using the promoted whole-series base-change equality. The native integer-ring algebra map is injective because the underlying coefficient map is a homomorphism from the field K to the nontrivial field L.
- Apply native PowerSeries.map_injective using native Valuation.HasExtension.algebraMap_injective. The complete integer_map_injective proof checks the exact native map used in the suggested signatures.
- Taking g=0 shows that vanishing of the extended positive series descends. This compares values of the series-valued measure; it does not assert that the map from arbitrary continuous tests to series is injective.
- The theorem gives faithful comparison of these already integral objects. It does not state that every arbitrary O_L-valued measure or series descends to O_K.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-series-base-change
- mathlib:Valuation.HasExtension.algebraMap_injective
- mathlib:PowerSeries.map_injective

**Acceptance**

- The quantified objects on both sides are the existing series evaluations. No essential-surjectivity or arbitrary-measure descent claim is made.

**Tests**

- SuggestedEisensteinCoefficientChangeTests.zero_series_descends: If the actual series on the included test vanishes after extension, the original series vanishes.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Integral congruence precision is reflected by coefficient extension

DirichletPadicLFunctions:L4/integral-twisted-series-base-change-precision

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_baseChange_dvd_iff

Kind: theorem. Implementation: unchecked.

C(c(b)) divides E^L(c_*g)−E^L(c_*f) if and only if C(b) divides E^K(g)−E^K(f), for every b∈O_K.

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Native Valuation.integer.integers realizes each actual integer ring. Its native dvd_iff_le says x divides y precisely when v(y)≤v(x), including x=0. Native HasExtension.val_map_le_iff identifies that inequality upstairs and downstairs.
- The complete integer_divisibility_iff proof verifies c(x)∣c(y) iff x∣y directly from those native declarations. It assumes equivalence of valuations, not equality of their numerical normalizations, and needs no finite-degree or completeness hypothesis.
- Constant-series divisibility is equivalent to scalar divisibility of every coefficient: one direction applies coeff_C_mul, and the other chooses integral quotient coefficients and assembles them with native mk. The complete constant_divisibility_iff proof checks both directions without field division.
- Rewrite the extended series difference using whole-series base change and preservation of subtraction. Apply the preceding two equivalences coefficientwise. The complete whole_series_divisibility_reflect proof checks this exact formal-series argument, and integral_nondivisibility_preserved records its contrapositive.
- At b=0 this reduces to descent of equality. At b=p^r the same p-power modulus is retained in a ramified extension. If π²=3 in O_L over ℚ_3, then9 does not divide π²: replacing3² byπ² would incorrectly weaken the modulus. In the field L,9 does divide3, so field divisibility cannot serve as the integral precision statement.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-series-base-change
- mathlib:Valuation.integer.integers
- mathlib:Valuation.Integers.dvd_iff_le
- mathlib:Valuation.HasExtension.val_map_le_iff
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_mk
- mathlib:PowerSeries.ext

**Acceptance**

- The theorem reflects the exact integral ideal generated by b. It neither changes a p-power modulus into a uniformizer-power modulus nor treats nonzero field scalars as meaningful precision ideals.

**Tests**

- SuggestedEisensteinCoefficientChangeTests.zero_modulus_reflects_equality: C(0)-divisibility of the extended difference forces equality of the original series.
- SuggestedEisensteinCoefficientChangeTests.ramified_parameter_does_not_change_p_precision: For any compatible coefficient extension of ℚ_3 and π∈O_L withπ²=3,9 does not divideπ² in O_L.
- SuggestedEisensteinCoefficientChangeTests.field_divisibility_is_not_integral_precision: In the same extension9 divides3 in L but not in O_L.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Coefficient-field compatibility of arithmetic moments

DirichletPadicLFunctions:L4/integral-twisted-arithmetic-coefficient-base-change

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_arithmetic_baseChange

Kind: comparison. Implementation: unchecked.

c(A^K_(ψ,φ,n)(κ^K_(t,χ,e)))=A^L_(ψ_L,φ_L,n)(κ^L_(t,χ_L,e)).

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Include both O_L-valued expressions into L. Native val_algebraMap identifies the left inclusion with the image under algebraMap K L of the actual K-valued arithmetic moment.
- Apply the existing finite-character moment formula in each field. Ring homomorphisms preserve the finite divisor sums, products, natural casts and natural powers, while native ringHomComp gives the transported values of ψ,φ andχ.
- The two finite expressions therefore agree in L. Native subtype injectivity yields equality in O_L. The argument uses natural-cast divisor units, so no unstated commutative scalar tower for arbitrary p-adic unit evaluations is required.
- At n=1 both actual arithmetic moments are1. The proof includes t=0, e=0 and imprimitive finite characters, retaining their native zero extensions.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-coefficient-arithmetic-moment
- DirichletPadicLFunctions:L4/integral-twisted-coefficient-base-change
- mathlib:Valuation.HasExtension.val_algebraMap
- mathlib:MulChar.ringHomComp

**Acceptance**

- Each field carries the explicitly stated p-adic algebra and bounded action needed by its existing arithmetic character. No general comparison of arbitrary K-valued continuous characters is assumed.

**Tests**

- SuggestedEisensteinCoefficientChangeTests.first_arithmetic_coefficient_base_change: The image of the first actual arithmetic coefficient is1 for every finite character and exponent.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Coefficient-field compatibility of arithmetic positive series

DirichletPadicLFunctions:L4/integral-twisted-arithmetic-series-base-change

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_arithmetic_baseChange

Kind: comparison. Implementation: unchecked.

PowerSeries.map c(E^K_(ψ,φ)(κ^K_(t,χ,e)))=E^L_(ψ_L,φ_L)(κ^L_(t,χ_L,e)).

**Hypotheses**

- p is any prime. K and L are normed ultrametric fields with Algebra K L. Their norm valuations v_K and v_L satisfy the native Valuation.HasExtension condition: v_K is equivalent to the pullback of v_L, not necessarily numerically equal to it.
- O_K=v_K.integer and O_L=v_L.integer are the existing native integer subrings. Use exactly the algebraMap c:O_K→O_L supplied by native Valuation.HasExtension.instAlgebraInteger. Its underlying field value is algebraMap K L. No new integral coefficient map or replacement carrier is constructed.
- For statements involving continuous tests assume ContinuousSMul K L. The field algebra map is then continuous, and native Continuous.subtype_mk gives continuity of c. Write c_*f for this actual continuous-map composite. The finite-coordinate and divisibility arguments themselves are algebraic.
- Let ψ:DirichletCharacter K D and φ:DirichletCharacter K E. Transport each character with native MulChar.ringHomComp(algebraMap K L), retaining its level and zero extension. The actual integral coefficient measures, finite group coordinates and continuous positive-series measures on U=(ℤ_p)ˣ are reused.
- For arithmetic moments additionally assume Algebra ℤ_p K and Algebra ℤ_p L with their bounded scalar actions. The proof uses only natural-cast divisor units and preservation of natural casts by the field map; no compatibility of arbitrary unit tests is assumed. The finite character χ has level p^t and exponent e≥0.
- Precision reflection uses an arbitrary b∈O_K and its exact image c(b), including b=0. For b=p^r the modulus remains p^r upstairs, even in a ramified extension. Replacing it by the r-th power of a uniformizer is not part of this statement.

**Construction or proof outline**

- Apply native coefficient extensionality to the actual mapped series and the target arithmetic specialization. At each positive index use the promoted arithmetic coefficient base-change equality.
- At index0 both positive truncations vanish. Native coeff_map and coeff_mk/series coefficient formulas complete the equality.
- This specializes coefficient-field naturality to the source’s finite-character arithmetic tests, including nonrational character values. Its integral form can be combined with the precision-reflection argument coefficientwise; no classical Eisenstein form or analytic family is inferred.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-arithmetic-coefficient-base-change
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map

**Acceptance**

- The output remains in the actual integer-ring power series before any field inclusion, and keeps the same character levels and arithmetic exponent.

**Sources**

- RJW-published, Remark5.8(2) and the integral coefficient discussion, published143–144/PDF44–45, read with whole143–146 in predecessor4769. Theorem8.2 and its entire proof, Remark8.3, published159–161/PDF60–62, read in4764.. Worker coefficient-field comparisons for the actual integral character-weighted positive coefficients and series. The source fixes a coefficient field containing the character values; the explicit naturality, injective descent and integral-precision reflection are derived from the finite divisor formulas and native valuation-extension theory. This does not construct a general measure coefficient-extension functor, a constant coefficient or a geometric family.

### Euler deletion for native twisted divisor sums

DirichletPadicLFunctions:L4/twisted-divisor-euler-deletion

Declaration: DirichletPadic.twistedDivisorSum_euler_deletion

Kind: lemma. Implementation: unchecked.

Σ_(d|n,p∤d)ψ(n/d)φ(d)d^e=σ(e,ψ,φ)(n)−[φ(p)p^e σ(e,ψ,φ)(n/p) if p∣n; 0 otherwise], including n=0 and e=0.

**Hypotheses**

- p is any prime, including2. For the algebraic divisor identity R is an arbitrary commutative ring, n and e are natural numbers, and ψ and φ are native Dirichlet characters at levels D and E, with their given zero extensions.
- For integral measure and series comparisons K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native integer subring of its norm valuation, and ι:O→K is its native subtype ring map.
- Write σ(e,ψ,φ) for the existing native DirichletCharacter.twistedDivisorSum, never for a newly defined arithmetic function. Its native formula is Σ_(d|n)ψ(n/d)φ(d)d^e and σ(0)=0. Write F_(e,ψ,φ)=PowerSeries.mk(n↦σ(e,ψ,φ)(n)); F is notation for this expression, not a proposed new constructor.
- A^O_(ψ,φ,n) and E^+_(ψ,φ) are the existing integral coefficient and positive-series measures. The principal arithmetic test is the existing κ^O_(0,1,e). Finite-character arithmetic tests use χ of level p^t and the existing κ^O_(t,χ,e).
- V_p is the actual native PowerSeries.expand p with p≠0; it substitutes q^p. The correction factor is the right character φ(p)p^e. The existing p-index scaling factor ψ(p) is a different quantity. No primitive replacement or implicit removal of level primes is allowed.

**Construction or proof outline**

- Rewrite the actual native arithmetic function with twistedDivisorSum_apply. Partition the finite divisor sum into p-prime divisors and divisors divisible by p; subtraction is in R. No character value or natural coefficient is divided in R.
- When n=p m>0, multiplication by p is a bijection from divisors of m to divisors of p m divisible by p. In the reverse direction write d=p a and cancel p in the divisibility relation. Positivity of p and m verifies both native Nat.mem_divisors conditions; injectivity is natural-number cancellation.
- Under d=p a, the left argument is (p m)/(p a)=m/a, whereas φ(p a)(p a)^e=φ(p)p^e φ(a)a^e. Factor the constant out of the finite sum. Complete removed_divisors and removed_weighted_sum proofs check this bijection and transformation.
- If p∤n, no divisor of n is divisible by p. If n=0, native Nat.divisors_zero makes both divisor sums empty and native twistedDivisorSum_apply gives σ(0)=0. Complete literal_euler_deletion proves the resulting literal finite-sum equality at every n.
- Only the final rewriting uses the native Tau Ceti declaration. Its source and exact signature were read at the pin; the full suggested file importing it is uncompiled because no matching existing artifact is available. The separate native probe contains no replacement for this arithmetic function.

**Prerequisites**

- tauceti:DirichletCharacter.twistedDivisorSum
- tauceti:DirichletCharacter.twistedDivisorSum_apply
- mathlib:Nat.mem_divisors
- mathlib:Nat.divisors_zero

**Acceptance**

- The statement holds in a commutative ring with arbitrary native character levels. The existing native arithmetic-function constructor, multiplicativity and prime-power API are not re-planned.

**Tests**

- SuggestedTwistedEulerTests.native_zero_index: At n=0 the native σ value and its correction are both zero, even though p divides0.
- SuggestedTwistedEulerTests.exponent_zero_keeps_right_factor: At exponent0 and indexp, σ_0(p)−φ(p)σ_0(1)=ψ(p).

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its whole proof, Remark8.3, published159–161/PDF60–62; all three pages freshly read30September2026. Native TauCeti twisted-divisor module at f790474 read in full.. The source motivates removing divisors divisible by p in the positive coefficients. This is the worker-derived two-character extension using the exact native twistedDivisorSum convention. The source does not state this general two-character comparison. Its constant-term and weight-space assertions keep all previously recorded qualifications.

### Native divisor-sum comparison of integral moments

DirichletPadicLFunctions:L4/integral-twisted-coefficient-native-moment

Declaration: DirichletPadic.integralTwistedPositiveEisensteinMeasure_native_moment

Kind: comparison. Implementation: unchecked.

For n>0, ι(A^O_(ψ,φ,n)(κ^O_(0,1,e)))=σ(e,ψ,φ)(n)−[φ(p)p^e σ(e,ψ,φ)(n/p) if p∣n; 0 otherwise].

**Hypotheses**

- p is any prime, including2. For the algebraic divisor identity R is an arbitrary commutative ring, n and e are natural numbers, and ψ and φ are native Dirichlet characters at levels D and E, with their given zero extensions.
- For integral measure and series comparisons K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native integer subring of its norm valuation, and ι:O→K is its native subtype ring map.
- Write σ(e,ψ,φ) for the existing native DirichletCharacter.twistedDivisorSum, never for a newly defined arithmetic function. Its native formula is Σ_(d|n)ψ(n/d)φ(d)d^e and σ(0)=0. Write F_(e,ψ,φ)=PowerSeries.mk(n↦σ(e,ψ,φ)(n)); F is notation for this expression, not a proposed new constructor.
- A^O_(ψ,φ,n) and E^+_(ψ,φ) are the existing integral coefficient and positive-series measures. The principal arithmetic test is the existing κ^O_(0,1,e). Finite-character arithmetic tests use χ of level p^t and the existing κ^O_(t,χ,e).
- V_p is the actual native PowerSeries.expand p with p≠0; it substitutes q^p. The correction factor is the right character φ(p)p^e. The existing p-index scaling factor ψ(p) is a different quantity. No primitive replacement or implicit removal of level primes is allowed.

**Construction or proof outline**

- Apply the existing integral principal arithmetic-moment identity, which includes the actual O-valued measure evaluation into K and gives the p-prime divisor sum.
- Apply the promoted twisted-divisor Euler-deletion identity in K. Its character order agrees literally with the existing weighted measure: ψ is evaluated at n/d, and φ at d.
- At indices prime to p the correction is absent. At p, the existing native prime formula σ(p)=ψ(p)+φ(p)p^e leaves ψ(p). Thus this agrees with the preserved p-index scaling theorem, without interchanging its left factor and the right Euler factor.
- For p=2, ψ the quadratic character modulo3 and φ of level1, e=1 gives σ(2)=1 and correction2, hence the retained coefficient−1. Using ψ(2)2=−2 instead would give3. At n=10, σ(10)=4 and σ(5)=4 give4−2·4=−4: deleting all coefficients at indices divisible by p is false.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-moment
- DirichletPadicLFunctions:L4/twisted-divisor-euler-deletion
- tauceti:DirichletCharacter.twistedDivisorSum_apply_prime

**Acceptance**

- The comparison states equality after the native integer-ring inclusion; no unjustified cast of a nonintegral field element into O is introduced.

**Tests**

- SuggestedTwistedEulerTests.away_index_equals_native: At every positive index prime to p the integral moment includes as the actual native σ coefficient.
- SuggestedTwistedEulerTests.left_character_prime_coefficient: At p=2, ψ modulo3 with ψ(2)=−1, φ of level1 and e=1, the actual integral coefficient at2 includes as−1.
- SuggestedTwistedEulerTests.left_factor_would_be_wrong: In that example subtracting ψ(2)2σ(1) from native σ(2) does not give−1.
- SuggestedTwistedEulerTests.divisible_index_is_not_deleted: The actual coefficient at10 in the same example is−4, not0.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its whole proof, Remark8.3, published159–161/PDF60–62; all three pages freshly read30September2026. Native TauCeti twisted-divisor module at f790474 read in full.. The source motivates removing divisors divisible by p in the positive coefficients. This is the worker-derived two-character extension using the exact native twistedDivisorSum convention. The source does not state this general two-character comparison. Its constant-term and weight-space assertions keep all previously recorded qualifications.

### Native Euler comparison of the whole positive series

DirichletPadicLFunctions:L4/integral-twisted-series-native-moment

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_native_moment

Kind: comparison. Implementation: unchecked.

PowerSeries.map ι(E^+_(ψ,φ)(κ^O_(0,1,e)))=F_(e,ψ,φ)−C(φ(p)p^e)V_p(F_(e,ψ,φ)).

**Hypotheses**

- p is any prime, including2. For the algebraic divisor identity R is an arbitrary commutative ring, n and e are natural numbers, and ψ and φ are native Dirichlet characters at levels D and E, with their given zero extensions.
- For integral measure and series comparisons K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native integer subring of its norm valuation, and ι:O→K is its native subtype ring map.
- Write σ(e,ψ,φ) for the existing native DirichletCharacter.twistedDivisorSum, never for a newly defined arithmetic function. Its native formula is Σ_(d|n)ψ(n/d)φ(d)d^e and σ(0)=0. Write F_(e,ψ,φ)=PowerSeries.mk(n↦σ(e,ψ,φ)(n)); F is notation for this expression, not a proposed new constructor.
- A^O_(ψ,φ,n) and E^+_(ψ,φ) are the existing integral coefficient and positive-series measures. The principal arithmetic test is the existing κ^O_(0,1,e). Finite-character arithmetic tests use χ of level p^t and the existing κ^O_(t,χ,e).
- V_p is the actual native PowerSeries.expand p with p≠0; it substitutes q^p. The correction factor is the right character φ(p)p^e. The existing p-index scaling factor ψ(p) is a different quantity. No primitive replacement or implicit removal of level primes is allowed.

**Construction or proof outline**

- Apply native PowerSeries.ext and coeff_map. At every positive coefficient use the promoted actual integral coefficient comparison.
- Native coeff_expand gives σ(n/p) when p∣n and0 otherwise; coeff_C_mul multiplies that coefficient by φ(p)p^e. Complete whole_series_euler proves this whole formal-series assembly from its literal coefficient premise.
- At coefficient0, both positive series have zero constant because the existing integral series is a positive truncation and σ(0)=0. This boundary must be checked rather than inferred from n>0.
- For both character levels1, the existing native twistedDivisorSum_modOne_eq_sigma identifies F with Mathlib’s σ_e series and φ(p)=1. This recovers the earlier unweighted Euler-deletion formula. No new ordinary divisor sum or Eisenstein modular form is defined.
- This is a formal positive q-expansion identity. It does not supply the generalized constant coefficient, its denominator or pseudomeasure qualification, classical modularity or weight-space geometry.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-coefficient-native-moment
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- mathlib:PowerSeries.expand
- mathlib:PowerSeries.coeff_expand
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.mk
- tauceti:DirichletCharacter.twistedDivisorSum_modOne_eq_sigma

**Acceptance**

- The series operator is the existing native expansion map and is applied to the actual native twisted divisor coefficients. No private series-substitution operator or surrogate arithmetic function appears.

**Tests**

- SuggestedTwistedEulerTests.principal_levels_recover_sigma: Both level-one characters give the actual Mathlib σ_e series minus p^e times its q^p expansion.
- SuggestedTwistedEulerTests.native_comparison_zero_constant: The native Euler-comparison right side has coefficient0 equal to0.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its whole proof, Remark8.3, published159–161/PDF60–62; all three pages freshly read30September2026. Native TauCeti twisted-divisor module at f790474 read in full.. The source motivates removing divisors divisible by p in the positive coefficients. This is the worker-derived two-character extension using the exact native twistedDivisorSum convention. The source does not state this general two-character comparison. Its constant-term and weight-space assertions keep all previously recorded qualifications.

### Native comparison at finite-character arithmetic points

DirichletPadicLFunctions:L4/integral-twisted-series-native-arithmetic-moment

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_native_arithmetic_moment

Kind: comparison. Implementation: unchecked.

PowerSeries.map ι(E^+_(ψ,φ)(κ^O_(t,χ,e)))=F_(e,ψ,φ.mul χ)−C((φ.mul χ)(p)p^e)V_p(F_(e,ψ,φ.mul χ)).

**Hypotheses**

- p is any prime, including2. For the algebraic divisor identity R is an arbitrary commutative ring, n and e are natural numbers, and ψ and φ are native Dirichlet characters at levels D and E, with their given zero extensions.
- For integral measure and series comparisons K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native integer subring of its norm valuation, and ι:O→K is its native subtype ring map.
- Write σ(e,ψ,φ) for the existing native DirichletCharacter.twistedDivisorSum, never for a newly defined arithmetic function. Its native formula is Σ_(d|n)ψ(n/d)φ(d)d^e and σ(0)=0. Write F_(e,ψ,φ)=PowerSeries.mk(n↦σ(e,ψ,φ)(n)); F is notation for this expression, not a proposed new constructor.
- A^O_(ψ,φ,n) and E^+_(ψ,φ) are the existing integral coefficient and positive-series measures. The principal arithmetic test is the existing κ^O_(0,1,e). Finite-character arithmetic tests use χ of level p^t and the existing κ^O_(t,χ,e).
- V_p is the actual native PowerSeries.expand p with p≠0; it substitutes q^p. The correction factor is the right character φ(p)p^e. The existing p-index scaling factor ψ(p) is a different quantity. No primitive replacement or implicit removal of level primes is allowed.

**Construction or proof outline**

- Use the preserved integral whole-series arithmetic twist to move χ into the right character. Its native DirichletCharacter.mul has level lcm(E,p^t) and retains the zero extension of both factors.
- Apply the promoted native whole-series comparison to ψ and the actual native product φ.mul χ. Do not multiply the left character or replace the right product by its primitive inducing character.
- For t=0 the character has level1 and its natural values are1; the native divisor formula then recovers the principal comparison. For t>0 the product’s level is divisible by p, so its value at p is0 and the Euler correction vanishes.
- Vanishing of the correction does not delete coefficients with p-divisible indices. With p=2 and right character modulo4 the first prime coefficient still equals the left value at2. The right-zero extension has already suppressed precisely the unwanted divisor terms.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-series-arithmetic-twist
- DirichletPadicLFunctions:L4/integral-twisted-series-native-moment
- DirichletPadicLFunctions:L4/integral-twisted-series-native-bad-right-level
- mathlib:DirichletCharacter.mul

**Acceptance**

- The correct native lcm-level product appears explicitly, including imprimitive characters. Primitive modular-form specialization remains with its existing owner.

**Tests**

- SuggestedTwistedEulerTests.positive_wild_level_removes_euler_correction: At positive finite-character level the actual arithmetic specialization equals the full native σ(e,ψ,φ.mulχ) positive series.
- SuggestedTwistedEulerTests.zero_level_wild_character_recovers_principal: At t=0 the native divisor sum with right product φ.mulχ equals the original native divisor sum.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its whole proof, Remark8.3, published159–161/PDF60–62; all three pages freshly read30September2026. Native TauCeti twisted-divisor module at f790474 read in full.. The source motivates removing divisors divisible by p in the positive coefficients. This is the worker-derived two-character extension using the exact native twistedDivisorSum convention. The source does not state this general two-character comparison. Its constant-term and weight-space assertions keep all previously recorded qualifications.

### Bad right level removes the Euler correction

DirichletPadicLFunctions:L4/integral-twisted-series-native-bad-right-level

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_native_bad_right_level

Kind: theorem. Implementation: unchecked.

If p∣E, then PowerSeries.map ι(E^+_(ψ,φ)(κ^O_(0,1,e)))=F_(e,ψ,φ).

**Hypotheses**

- p is any prime, including2. For the algebraic divisor identity R is an arbitrary commutative ring, n and e are natural numbers, and ψ and φ are native Dirichlet characters at levels D and E, with their given zero extensions.
- For integral measure and series comparisons K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. O is the native integer subring of its norm valuation, and ι:O→K is its native subtype ring map.
- Write σ(e,ψ,φ) for the existing native DirichletCharacter.twistedDivisorSum, never for a newly defined arithmetic function. Its native formula is Σ_(d|n)ψ(n/d)φ(d)d^e and σ(0)=0. Write F_(e,ψ,φ)=PowerSeries.mk(n↦σ(e,ψ,φ)(n)); F is notation for this expression, not a proposed new constructor.
- A^O_(ψ,φ,n) and E^+_(ψ,φ) are the existing integral coefficient and positive-series measures. The principal arithmetic test is the existing κ^O_(0,1,e). Finite-character arithmetic tests use χ of level p^t and the existing κ^O_(t,χ,e).
- V_p is the actual native PowerSeries.expand p with p≠0; it substitutes q^p. The correction factor is the right character φ(p)p^e. The existing p-index scaling factor ψ(p) is a different quantity. No primitive replacement or implicit removal of level primes is allowed.

**Construction or proof outline**

- Since p divides E, the natural image of p in ZMod E is not a unit by native ZMod.isUnit_iff_coprime. Native MulChar.map_nonunit gives φ(p)=0. The complete right_bad_level_zero proof checks this argument with precisely the native character carrier.
- Substitute φ(p)=0 in the promoted native whole-series comparison. The constant-series factor is0, so the expansion term vanishes.
- At p=2, any right character modulo4 and left level1 yield coefficient2 equal to1. In contrast, a left character modulo4 and right level1 give retained coefficient2 equal to0. These tests distinguish bad right level from bad left level and from deletion of indices.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-series-native-moment
- mathlib:MulChar.map_nonunit
- mathlib:ZMod.isUnit_iff_coprime

**Acceptance**

- Only the correction is zero. The full native coefficient series need not vanish at indices divisible by p.

**Tests**

- SuggestedTwistedEulerTests.right_bad_level_prime_survives: With left level1 and any right character modulo4, the actual p=2 integral prime coefficient is1.
- SuggestedTwistedEulerTests.left_bad_level_prime_vanishes: With any left character modulo4 and right level1, that retained prime coefficient is0.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its whole proof, Remark8.3, published159–161/PDF60–62; all three pages freshly read30September2026. Native TauCeti twisted-divisor module at f790474 read in full.. The source motivates removing divisors divisible by p in the positive coefficients. This is the worker-derived two-character extension using the exact native twistedDivisorSum convention. The source does not state this general two-character comparison. Its constant-term and weight-space assertions keep all previously recorded qualifications.

### Coefficient maps of native twisted divisor sums

DirichletPadicLFunctions:L4/twisted-divisor-coefficient-map

Declaration: DirichletPadic.twistedDivisorSum_ringHomComp

Kind: lemma. Implementation: unchecked.

For every ring homomorphism j:R→S of commutative rings, j(σ(e,ψ,φ)(n))=σ(e,ψ.ringHomComp(j),φ.ringHomComp(j))(n), including n=0.

**Hypotheses**

- R and S are commutative rings, j:R→S is a ring homomorphism, e,n are natural numbers, and ψ and φ are native R-valued Dirichlet characters of arbitrary given levels. The later tests use the indicated valued-field specialization.

**Construction or proof outline**

- Rewrite both actual native arithmetic-function evaluations with their existing twistedDivisorSum_apply formula. The divisor set and arguments n/d and d are natural numbers and do not change with the coefficient ring.
- Commute the ring map through the finite sum, products and natural powers. Native ringHomComp evaluates each transported character by applying j to the original value, and j preserves natural casts. Complete weighted_sum_map proves this literal finite-sum equality.
- The same proof works for the p-prime divisor restriction by splitting the conditional; complete retained_sum_map checks it. No reinterpretation of nonreal values as rational numbers or primitive replacement of a character is made.
- The source-checked native Tau Ceti function is used by name in the suggested statement. Its missing matching artifact prevents compilation of the full file, while the two complete finite-sum lemmas are checked against available native libraries.

**Prerequisites**

- tauceti:DirichletCharacter.twistedDivisorSum
- tauceti:DirichletCharacter.twistedDivisorSum_apply
- mathlib:MulChar.ringHomComp

**Acceptance**

- This is a naturality lemma for the existing native object, not another arithmetic-function definition.

**Tests**

- SuggestedClassicalTwistedTests.identity_preserves_native_divisor_sum: Transport by the identity ring homomorphism preserves the actual native divisor sum.
- SuggestedClassicalTwistedTests.embedding_preserves_native_zero: A coefficient embedding sends the native zero-index value to0.
- SuggestedClassicalTwistedTests.nonreal_prime_value_survives_embedding: For p=2, a quartic left character modulo5 with ψ(2)=i and i²=−1, right level1 and e=2, the actual integral prime moment includes as ι_K(i).

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its full proof, Remark8.3, published159–161/PDF60–62, freshly read in4777; existing ModularForms roadmap Layer0, whole259–337, read this checkpoint.. Worker-derived comparison through a common algebraic coefficient field, extending the source’s rational comparison. The classical form and its coefficient formula are explicit hypotheses. The primitive pair-character construction, Gauss-sum translation, generalized Bernoulli constants and exceptional weights remain with their existing ModularForms owner; these nodes prove no existence theorem for that input.

### Common algebraic positive coefficients of classical and p-adic series

DirichletPadicLFunctions:L4/integral-twisted-classical-positive-comparison

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_classical_positive

Kind: comparison. Implementation: unchecked.

Given the actual classical form f and its positive coefficient formula as above, there is a unique Q⁺∈F[[q]] such that map(ι_C)(Q⁺)=qExpansion(g)−C(a_0(g)) and map(ι_K)(Q⁺)=map(O↪K)(E⁺_(ψ_K,φ_K)(κ^O_(0,1,k−1))).

**Hypotheses**

- p is any prime. F is a field with separate ring embeddings ι_C:F→ℂ and ι_K:F→K; existence of ι_C forces characteristic zero. No map from ℂ to K is chosen. K is normed ultrametric with Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and O is its native norm-valuation integer ring.
- ψ and φ are native F-valued Dirichlet characters at their given levels D and E. Write ψ_K and φ_K for their native ringHomComp transports. Their zero extensions and order are retained. The arithmetic exponent is e=k−1 for natural weight k.
- The classical comparison takes an actual f:ModularForm(Γ₁(N),k), N≠0, and the explicit hypothesis a_n(f)=ι_C(σ(e,ψ,φ)(n)) for every n>0. This is a conditional comparison for a supplied form, not a theorem that any pair of characters produces f.
- For application to primitive character Eisenstein series, the existing ModularForms Layer0 owns the construction: positive levels D,E, primitive characters, parity ψ(−1)φ(−1)=(−1)^k, and DE dividingN (raising parameter1). Its ordinary k≥3 case supplies the intended input. Its weight1 case and weight2 trivial-pair correction stay separate; no existence at those weights is inferred from the conditional comparison.
- Set b=φ(p)p^e in F. The symbol g denotes the actual expression ofLe(f)−ι_C(b)·TauCeti.ModularForm.levelRaise(p,f) in ModularForm(Γ₁(pN),k), using native inclusion and conjugation maps. This notation is not a new generic stabilization constructor.
- The full fixed-weight comparison additionally takes c∈F and a_0(f)=ι_C(c) as an explicit hypothesis. It does not define c by a new generalized Bernoulli number, construct a constant measure or prove interpolation of constants.

**Construction or proof outline**

- Let Fσ be the existing formal expression PowerSeries.mk(n↦σ(e,ψ,φ)(n)), and take Q⁺=Fσ−C(b)expand_p(Fσ). This explicitly specifies the common coefficients without proposing a new constructor. Its constant is0 because native σ(0)=0.
- Native Γ₁ level inclusion supplies ofLe(f), and native Gamma1_map_le_conjAct_scaleGL supplies levelRaise(p,f) at Γ₁(pN). The period1 lemmas allow the existing qExpansion_sub/smul and qExpansion_levelRaise APIs. Complete actual_level_raised_expansion checks this actual bundled modular-form expression, with no unproved modularity witness.
- The coefficient hypothesis identifies qExpansion(f)−C(a_0(f)) with map(ι_C)(Fσ). Complete positive_truncation proves this all-index assembly, including index0. The supplied form is used here; no theorem asserting its existence is invoked.
- Expansion preserves constant series, so subtracting the new constant commutes with the Euler operation: positive(g)=(1−C(ι_C(b))expand_p)positive(f). Complete euler_positive_truncation verifies the identity. Complete euler_map and the promoted native coefficient-map lemma identify this with map(ι_C)(Q⁺).
- For the p-adic image use the preserved native whole-series moment comparison and the same coefficient-map lemma. This gives precisely the actual integral series after inclusion into K, not a newly constructed measure.
- The field embedding ι_C is injective, and native PowerSeries.map_injective therefore determines Q⁺ from its complex image. Complete common_series_unique proves existence and uniqueness given the two established image equalities. The second embedding need not be topologically related to the complex one.

**Prerequisites**

- DirichletPadicLFunctions:L4/twisted-divisor-coefficient-map
- DirichletPadicLFunctions:L4/integral-twisted-series-native-moment
- tauceti:ModularForm.ofLe
- mathlib:ModularForm.qExpansion_sub
- mathlib:ModularForm.qExpansion_smul
- tauceti:TauCeti.ModularForm.levelRaise
- tauceti:TauCeti.ModularForm.qExpansion_levelRaise
- tauceti:CongruenceSubgroup.Gamma1_map_le_Gamma1_map_of_dvd
- tauceti:TauCeti.Gamma1_map_le_conjAct_scaleGL
- tauceti:TauCeti.one_mem_strictPeriods_Gamma1_map
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.map_injective
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.expand_C

**Acceptance**

- The explicit classical-form hypothesis remains visible in the typed statement. This closes the comparison conditional on that input, not the upstream primitive-character construction or its coefficient formula. No new supplier existence result is claimed.

**Tests**

- SuggestedClassicalTwistedTests.common_positive_zero_constant: Any common series whose complex image is the positive truncation of the actual form has coefficient0 equal to0.
- SuggestedClassicalTwistedTests.common_positive_first_coefficient: Any common series whose p-adic image is the actual principal arithmetic positive series has coefficient1 equal to1.
- SuggestedClassicalTwistedTests.one_embedding_already_determines_common_series: Equality after the complex coefficient embedding forces equality of two F-valued common series.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its full proof, Remark8.3, published159–161/PDF60–62, freshly read in4777; existing ModularForms roadmap Layer0, whole259–337, read this checkpoint.. Worker-derived comparison through a common algebraic coefficient field, extending the source’s rational comparison. The classical form and its coefficient formula are explicit hypotheses. The primitive pair-character construction, Gauss-sum translation, generalized Bernoulli constants and exceptional weights remain with their existing ModularForms owner; these nodes prove no existence theorem for that input.

### Fixed-weight comparison with a supplied algebraic constant

DirichletPadicLFunctions:L4/integral-twisted-classical-full-comparison

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_classical_full

Kind: comparison. Implementation: unchecked.

If additionally a_0(f)=ι_C(c), there is a unique Q∈F[[q]] whose complex image is qExpansion(g) and whose K-image is C(ι_K((1−φ(p)p^(k−1))c))+map(O↪K)(E⁺_(ψ_K,φ_K)(κ^O_(0,1,k−1))).

**Hypotheses**

- p is any prime. F is a field with separate ring embeddings ι_C:F→ℂ and ι_K:F→K; existence of ι_C forces characteristic zero. No map from ℂ to K is chosen. K is normed ultrametric with Algebra ℤ_p K and IsBoundedSMul ℤ_p K, and O is its native norm-valuation integer ring.
- ψ and φ are native F-valued Dirichlet characters at their given levels D and E. Write ψ_K and φ_K for their native ringHomComp transports. Their zero extensions and order are retained. The arithmetic exponent is e=k−1 for natural weight k.
- The classical comparison takes an actual f:ModularForm(Γ₁(N),k), N≠0, and the explicit hypothesis a_n(f)=ι_C(σ(e,ψ,φ)(n)) for every n>0. This is a conditional comparison for a supplied form, not a theorem that any pair of characters produces f.
- For application to primitive character Eisenstein series, the existing ModularForms Layer0 owns the construction: positive levels D,E, primitive characters, parity ψ(−1)φ(−1)=(−1)^k, and DE dividingN (raising parameter1). Its ordinary k≥3 case supplies the intended input. Its weight1 case and weight2 trivial-pair correction stay separate; no existence at those weights is inferred from the conditional comparison.
- Set b=φ(p)p^e in F. The symbol g denotes the actual expression ofLe(f)−ι_C(b)·TauCeti.ModularForm.levelRaise(p,f) in ModularForm(Γ₁(pN),k), using native inclusion and conjugation maps. This notation is not a new generic stabilization constructor.
- The full fixed-weight comparison additionally takes c∈F and a_0(f)=ι_C(c) as an explicit hypothesis. It does not define c by a new generalized Bernoulli number, construct a constant measure or prove interpolation of constants.

**Construction or proof outline**

- Use the common positive series Q⁺ from the promoted conditional comparison and set Q=C((1−b)c)+Q⁺. This is an explicit expression, not a new family of measures or a new coefficient ring.
- The native expansion map preserves C(c). Hence the constant of the actual classical difference g is ι_C((1−b)c). Complete euler_constant_split proves the full formal identity (C(c)+F)−C(b)expand_p(C(c)+F)=C((1−b)c)+(F−C(b)expand_p(F)).
- Apply the two separate coefficient maps. The positive components agree by the previous comparison and both constant components agree by the supplied c and preservation of multiplication/subtraction. Injectivity of the complex embedding again gives uniqueness.
- At p=2,k=4 and the level-one arithmetic normalization c=1/240, the transformed constant is−7/240. It is nonzero and has2-adic norm16, so neither zero truncation nor integrality of positive coefficients supplies an integral constant term.
- The statement is pointwise in k with an explicitly supplied algebraic c. Generalized Bernoulli evaluation, admissible constant-term interpolation, pseudomeasure denominators, weight1/2 cases and geometric modular families remain open with the existing owners.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-classical-positive-comparison
- mathlib:PowerSeries.expand_C
- mathlib:PowerSeries.map_injective
- mathlib:PowerSeries.C
- mathlib:PowerSeries.coeff_C

**Acceptance**

- The conclusion is a full fixed-weight q-expansion comparison conditional on c, not construction or interpolation of the missing generalized constant coefficient.

**Tests**

- SuggestedClassicalTwistedTests.supplied_constant_has_euler_factor: The common full series has constant (1−φ(p)p^e)c, as forced by its K-valued comparison.
- SuggestedClassicalTwistedTests.fixed_weight_constant_can_be_nonintegral: The level-one p=2,k=4 constant−7/240 has2-adic norm greater than1.
- SuggestedClassicalTwistedTests.zero_truncation_cannot_supply_full_constant: An F=ℚ series with constant−7/240 differs from its positive truncation.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and its full proof, Remark8.3, published159–161/PDF60–62, freshly read in4777; existing ModularForms roadmap Layer0, whole259–337, read this checkpoint.. Worker-derived comparison through a common algebraic coefficient field, extending the source’s rational comparison. The classical form and its coefficient formula are explicit hypotheses. The primitive pair-character construction, Gauss-sum translation, generalized Bernoulli constants and exceptional weights remain with their existing ModularForms owner; these nodes prove no existence theorem for that input.

### Integral doubled tame Eisenstein series

DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries

Kind: construction. Implementation: unchecked.

Construct Gη:AbstractMeasure U O (PowerSeries O) with Gη(f)=C(ζO(xO·f))+2·E⁺(f).

**Hypotheses**

- p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. The measure constructor also permits principal η; the common-value comparison requires η≠1.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the existing native carriers. Let ζO be intrinsicIntegralTameZetaMeasure(η,hD,hpD), and let E⁺ be integralTwistedPositiveEisensteinSeries(p,1,η), where the left character is exactly the principal character modulo one. Let xO be the continuous map underlying integralPrimePowerArithmeticCharacter(p,0,1,1). No new coordinate character, coefficient subring, convolution structure or coefficient-extension functor is defined.
- The target PowerSeries O has its native coefficientwise topology. Set Gη(f)=C(ζO(xO·f))+2·E⁺(f), as a continuous O-linear map on C(U,O). Coefficient bounds use the native norm of O and the compact-domain sup norm of f; no norm on PowerSeries O is asserted.
- At D=1 the existing tame arithmetic construction is zero, so Gη=2·E⁺. This boundary does not recover the ordinary principal zeta constant or the principal Eisenstein family. No nonprincipal assumption is silently removed from a Dirichlet special-value theorem.
- Field normalization assumes CharZero K, so 2 is nonzero. It is a comparison on the actual O-valued tests under the native inclusion O↪K, not an extension of arbitrary O-valued measures to all K-valued tests. Classical modularity, parity restrictions, exceptional weights and the existence of character Eisenstein forms remain with their existing ModularForms owner.

**Construction or proof outline**

- Use the already constructed integral arithmetic character to supply xO, the existing intrinsic integral tame measure for ζO, and the existing positive series for E⁺. The defining function uses only their actual native carriers.
- Multiplication by the fixed continuous function xO is continuous and O-linear. Compose it with the continuous linear functional ζO and with native PowerSeries.C. The latter is continuous for the coefficientwise topology. Add twice E⁺ and bundle the result using AbstractMeasure.toCLMEquiv.symm. Complete doubleSeries verifies the full constructor, including additivity, scalar compatibility and continuity.
- Evaluation is the defining formula; zero, addition and scalar APIs are the inherited continuous-linear laws. At D=1 use the promoted exact zero-measure boundary. Complete doubleSeries_zero_measure then gives Gη=2·E⁺.
- The coefficient formula, uniform coefficient bound, normalized comparison and common arithmetic constant are promoted below. For uniqueness use equality of all coefficients for every test, followed by extensionality of the continuous linear functionals; complete doubleSeries_unique checks that no finite set of moments is substituted for all-test equality.
- At the constant test one, coefficient q¹ is 2 because the only retained divisor is 1. Together with the zero test and the level-one boundary, this checks the factor two, the linear structure and the exceptional tame convention.

**Prerequisites**

- DirichletPadicLFunctions:L2/intrinsic-integral-tame-zeta-measure
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-one-level
- DirichletPadicLFunctions:L2/integral-arithmetic-character
- DirichletPadicLFunctions:L4/integral-twisted-positive-series
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:PowerSeries.C
- mathlib:PowerSeries.WithPiTopology.continuous_C
- mathlib:PowerSeries.ext

**Acceptance**

- This constructs an integral formal-series-valued measure. It does not supply a classical modular form, arbitrary coefficient extension or an analytic family on weight space.

**API**

- DirichletPadic.integralDoubledTameEisensteinSeries_apply: Gη(f)=C(ζO(xO·f))+2·E⁺(f), the defining evaluation.
- DirichletPadic.integralDoubledTameEisensteinSeries_zero: Gη(0)=0.
- DirichletPadic.integralDoubledTameEisensteinSeries_add: Gη(f+g)=Gη(f)+Gη(g).
- DirichletPadic.integralDoubledTameEisensteinSeries_smul: Gη(a·f)=a·Gη(f) for a∈O.
- DirichletPadic.integralDoubledTameEisensteinSeries_continuous: The map C(U,O)→PowerSeries O is continuous for the native coefficientwise topology.
- DirichletPadic.integralDoubledTameEisensteinSeries_one_level: At D=1, Gη=2·E⁺ as measures; it has zero constant coefficient.
- DirichletPadic.integralDoubledTameEisensteinSeries_coeff: The constant is ζO(xO·f), and every positive coefficient is twice the actual integral weighted coefficient; promoted below.
- DirichletPadic.integralDoubledTameEisensteinSeries_unique: All-test equality with these constant and positive coefficient formulas uniquely specifies Gη.
- DirichletPadic.integralDoubledTameEisensteinSeries_coeff_norm_le: Every coefficient value has norm at most the sup norm of its test; promoted below.
- DirichletPadic.integralDoubledTameEisensteinSeries_normalize: On O-valued tests, half the included Gη is the half-weighted field-valued constant plus the included positive series; promoted below.
- DirichletPadic.integralDoubledTameEisensteinSeries_common_constant: At an arithmetic test of exponent e, the constant is the p-adic image of the existing common Euler–Bernoulli value at weight e+1; promoted below.

**Tests**

- SuggestedTameFullSeriesTests.zero_test: Gη applied to the zero test is the zero power series.
- SuggestedTameFullSeriesTests.first_positive_coefficient: At the constant test one, coefficient q¹ of Gη is exactly 2 in O.
- SuggestedTameFullSeriesTests.level_one_positive_only: For tame level one, Gη equals twice the existing positive series as an actual formal-series-valued measure.

**Uses**

- RJW Theorem 8.2 and the existing L4 generalized constant gap: Assembles the source pattern xζ/2 with the already owned positive coefficients in the nonprincipal tame setting, after multiplying the entire series by two.
- Arithmetic specialization at χ(x)x^e: Its constant uses the positive zeta weight e+1, while its positive coefficients retain divisor exponent e and the right-character product ηχ.
- Integral coefficient bounds and later congruences: Supplies an actual O-valued measure in every coefficient, including degree zero, with all-test linearity and continuity.

**Sources**

- RJW-published, Theorem 5.7, Remark 5.8, the integral coefficient discussion, and Definition 5.13, published 143–146 / PDF 44–47; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. These whole pages were freshly read during preparation of this checkpoint.. Worker tame-character extension of the source constant-coefficient pattern xζ/2, assembled from the already planned actual integral tame zeta measure and integral positive coefficients. The doubled series clears the factor two inside the existing integer subring. This specific tame formal-series construction is a derived extension, not a theorem quoted verbatim from RJW. The source corrections, the modulus-one zero-construction boundary and the ModularForms owner of classical character Eisenstein series remain explicit.

### Coefficients of the doubled tame series

DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_coeff

Kind: theorem. Implementation: unchecked.

For every f∈C(U,O), coeff₀ Gη(f)=ζO(xO·f), and coeff_n Gη(f)=2·A^O_(1,η,n)(f) for n>0.

**Hypotheses**

- p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. The measure constructor also permits principal η; the common-value comparison requires η≠1.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the existing native carriers. Let ζO be intrinsicIntegralTameZetaMeasure(η,hD,hpD), and let E⁺ be integralTwistedPositiveEisensteinSeries(p,1,η), where the left character is exactly the principal character modulo one. Let xO be the continuous map underlying integralPrimePowerArithmeticCharacter(p,0,1,1). No new coordinate character, coefficient subring, convolution structure or coefficient-extension functor is defined.
- The target PowerSeries O has its native coefficientwise topology. Set Gη(f)=C(ζO(xO·f))+2·E⁺(f), as a continuous O-linear map on C(U,O). Coefficient bounds use the native norm of O and the compact-domain sup norm of f; no norm on PowerSeries O is asserted.
- At D=1 the existing tame arithmetic construction is zero, so Gη=2·E⁺. This boundary does not recover the ordinary principal zeta constant or the principal Eisenstein family. No nonprincipal assumption is silently removed from a Dirichlet special-value theorem.
- Field normalization assumes CharZero K, so 2 is nonzero. It is a comparison on the actual O-valued tests under the native inclusion O↪K, not an extension of arbitrary O-valued measures to all K-valued tests. Classical modularity, parity restrictions, exceptional weights and the existence of character Eisenstein forms remain with their existing ModularForms owner.

**Construction or proof outline**

- Unfold Gη. Native coeff_C is zero in positive degree and the identity in degree zero; native coeff_smul commutes coefficient extraction with the scalar 2.
- Apply the existing promoted positive-series coefficient formula, whose degree-zero coefficient is zero and whose positive coefficients are the actual weighted divisor measures. Split n=0 from n>0. Complete doubleSeries_zero_coefficient and doubleSeries_positive_coefficient verify this algebra on native PowerSeries.
- At p=2, η quadratic modulo 3, coefficient q² evaluated on the principal exponent-one test is 2: among divisors of 2 only 1 is retained. Thus deleting the entire q² coefficient would be incorrect even though the right finite character later can vanish at p.
- At D=1 the promoted zero-measure boundary makes the displayed constant vanish for every test. This is a boundary of this tame construction, not a calculation of the principal Eisenstein constant.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-one-level
- mathlib:PowerSeries.coeff_C
- mathlib:PowerSeries.coeff_smul

**Acceptance**

- Both scalar factors are retained: the constant is undivided ζO(xO·f), while the positive coefficients are doubled.

**Tests**

- SuggestedTameFullSeriesTests.level_one_constant_zero: For tame level one, coefficient zero vanishes on every O-valued test.
- SuggestedTameFullSeriesTests.dyadic_prime_coefficient_survives: At p=2, η quadratic modulo 3 and exponent one, coefficient q² is 2 in O.

**Sources**

- RJW-published, Theorem 5.7, Remark 5.8, the integral coefficient discussion, and Definition 5.13, published 143–146 / PDF 44–47; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. These whole pages were freshly read during preparation of this checkpoint.. Worker tame-character extension of the source constant-coefficient pattern xζ/2, assembled from the already planned actual integral tame zeta measure and integral positive coefficients. The doubled series clears the factor two inside the existing integer subring. This specific tame formal-series construction is a derived extension, not a theorem quoted verbatim from RJW. The source corrections, the modulus-one zero-construction boundary and the ModularForms owner of classical character Eisenstein series remain explicit.

### Uniform bounds including the tame constant

DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-bound

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_coeff_norm_le

Kind: lemma. Implementation: unchecked.

For every n≥0 and f∈C(U,O), ‖coeff_n Gη(f)‖≤‖f‖.

**Hypotheses**

- p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. The measure constructor also permits principal η; the common-value comparison requires η≠1.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the existing native carriers. Let ζO be intrinsicIntegralTameZetaMeasure(η,hD,hpD), and let E⁺ be integralTwistedPositiveEisensteinSeries(p,1,η), where the left character is exactly the principal character modulo one. Let xO be the continuous map underlying integralPrimePowerArithmeticCharacter(p,0,1,1). No new coordinate character, coefficient subring, convolution structure or coefficient-extension functor is defined.
- The target PowerSeries O has its native coefficientwise topology. Set Gη(f)=C(ζO(xO·f))+2·E⁺(f), as a continuous O-linear map on C(U,O). Coefficient bounds use the native norm of O and the compact-domain sup norm of f; no norm on PowerSeries O is asserted.
- At D=1 the existing tame arithmetic construction is zero, so Gη=2·E⁺. This boundary does not recover the ordinary principal zeta constant or the principal Eisenstein family. No nonprincipal assumption is silently removed from a Dirichlet special-value theorem.
- Field normalization assumes CharZero K, so 2 is nonzero. It is a comparison on the actual O-valued tests under the native inclusion O↪K, not an extension of arbitrary O-valued measures to all K-valued tests. Classical modularity, parity restrictions, exceptional weights and the existence of character Eisenstein forms remain with their existing ModularForms owner.

**Construction or proof outline**

- Use the preceding promoted coefficient formula. In degree zero, the all-test integral coefficient comparison identifies the included ζO value with the existing K-valued intrinsic tame zeta measure on the included product test.
- The native subring inclusion preserves norms. The existing intrinsic-tame-zeta-norm and native continuous-linear operator inequality bound the scalar integral by the sup norm of xO·f. Every value of xO lies in O and therefore has norm at most one; native ContinuousMap.norm_le bounds ‖xO·f‖ by ‖f‖. Complete weighted_test_bound checks the compact-domain step.
- For positive n use the existing promoted integral weighted-coefficient bound. In the ultrametric ring O, native IsUltrametricDist.norm_natCast_le_one gives ‖2‖≤1. Multiplicativity/submultiplicativity then bounds twice the coefficient by the same ‖f‖. Complete doubleSeries_coefficient_bound combines both cases.
- This derivation does not consume an unpromoted integral-zeta bound API or assume an operator norm over the ring O. All bounds concern scalar evaluations and the native sup norm; they are uniform in n and include p=2.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients
- DirichletPadicLFunctions:L2/intrinsic-tame-zeta-norm
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-bound
- mathlib:ContinuousLinearMap.le_opNorm
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousMap.norm_coe_le_norm
- mathlib:SubringClass.toNormedCommRing
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply
- mathlib:IsUltrametricDist.norm_natCast_le_one

**Acceptance**

- No factor counting divisors and no norm on the power-series target enters this bound.

**Tests**

- SuggestedTameFullSeriesTests.all_coefficients_bounded: The same bound holds for every coefficient and every continuous O-valued test, including degree zero.

**Sources**

- RJW-published, Theorem 5.7, Remark 5.8, the integral coefficient discussion, and Definition 5.13, published 143–146 / PDF 44–47; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. These whole pages were freshly read during preparation of this checkpoint.. Worker tame-character extension of the source constant-coefficient pattern xζ/2, assembled from the already planned actual integral tame zeta measure and integral positive coefficients. The doubled series clears the factor two inside the existing integer subring. This specific tame formal-series construction is a derived extension, not a theorem quoted verbatim from RJW. The source corrections, the modulus-one zero-construction boundary and the ModularForms owner of classical character Eisenstein series remain explicit.

### Field normalization of the tame full series

DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-normalize

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_normalize

Kind: comparison. Implementation: unchecked.

Assume CharZero K. For every actual O-valued test f, ½·map_ι(Gη(f))=C(½·ζK^U(xK·(ι∘f)))+map_ι(E⁺(f)), where xK is the existing principal level-zero weight-one character.

**Hypotheses**

- p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. The measure constructor also permits principal η; the common-value comparison requires η≠1.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the existing native carriers. Let ζO be intrinsicIntegralTameZetaMeasure(η,hD,hpD), and let E⁺ be integralTwistedPositiveEisensteinSeries(p,1,η), where the left character is exactly the principal character modulo one. Let xO be the continuous map underlying integralPrimePowerArithmeticCharacter(p,0,1,1). No new coordinate character, coefficient subring, convolution structure or coefficient-extension functor is defined.
- The target PowerSeries O has its native coefficientwise topology. Set Gη(f)=C(ζO(xO·f))+2·E⁺(f), as a continuous O-linear map on C(U,O). Coefficient bounds use the native norm of O and the compact-domain sup norm of f; no norm on PowerSeries O is asserted.
- At D=1 the existing tame arithmetic construction is zero, so Gη=2·E⁺. This boundary does not recover the ordinary principal zeta constant or the principal Eisenstein family. No nonprincipal assumption is silently removed from a Dirichlet special-value theorem.
- Field normalization assumes CharZero K, so 2 is nonzero. It is a comparison on the actual O-valued tests under the native inclusion O↪K, not an extension of arbitrary O-valued measures to all K-valued tests. Classical modularity, parity restrictions, exceptional weights and the existence of character Eisenstein forms remain with their existing ModularForms owner.

**Construction or proof outline**

- Unfold the new constructor and apply native PowerSeries.map to the defining sum. Native map_C, coefficient-map laws and preservation of the natural scalar 2 give C(ι(ζO(xO·f)))+2·map_ι(E⁺(f)).
- The existing promoted inclusion of the integral arithmetic character gives ι∘xO=xK. The promoted all-test intrinsic integral tame coefficient comparison then identifies the constant with ζK^U(xK·(ι∘f)). This is a comparison on the displayed tests and does not require defining a field-valued measure on every K-valued test.
- Since K has characteristic zero, 2≠0. Divide the whole included series by 2, extracting coefficientwise and cancelling 2 in K. Complete normalize_doubled_series proves the entire native formal-series identity for a ring inclusion into any characteristic-zero field.
- Every positive coefficient becomes exactly the old included weighted coefficient. For the dyadic quadratic example at exponent zero, the constant becomes 1/3, while the doubled value was 2/3. Division occurs only in K; no inverse of 2 in O is postulated.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- mathlib:PowerSeries.map_C
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:PowerSeries.ext

**Acceptance**

- CharZero K is explicit. A ℤ_p-algebra structure alone is not used to infer it. No classical modularity or arbitrary coefficient extension is claimed.

**Tests**

- SuggestedTameFullSeriesTests.normalized_positive_coefficient: Each positive coefficient of half the included Gη equals the included old integral weighted coefficient.
- SuggestedTameFullSeriesTests.dyadic_normalized_constant: At p=2, η quadratic modulo 3 and the principal exponent-zero test, the normalized constant is 1/3 in ℚ₂.

**Sources**

- RJW-published, Theorem 5.7, Remark 5.8, the integral coefficient discussion, and Definition 5.13, published 143–146 / PDF 44–47; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. These whole pages were freshly read during preparation of this checkpoint.. Worker tame-character extension of the source constant-coefficient pattern xζ/2, assembled from the already planned actual integral tame zeta measure and integral positive coefficients. The doubled series clears the factor two inside the existing integer subring. This specific tame formal-series construction is a derived extension, not a theorem quoted verbatim from RJW. The source corrections, the modulus-one zero-construction boundary and the ModularForms owner of classical character Eisenstein series remain explicit.

### Common arithmetic constant at the shifted weight

DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-common-constant

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_common_constant

Kind: comparison. Implementation: unchecked.

For η≠1 over a common characteristic-zero field E, exponent e≥0 and χ modulo p^n, let N=D p^n and θ=η.changeLevel(D∣N)·χ.changeLevel(p^n∣N). Put b=(1−θ(p)p^e)(−N^e/(e+1))Σ_a θ(a)B_(e+1)(a.val/N) in E. Its complex image is (1−θC(p)p^e)L(θC,−e), and its K-image is the included constant of G_(ηK)(κO_(n,χK,e)).

**Hypotheses**

- p is any prime, including 2. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. The measure constructor also permits principal η; the common-value comparison requires η≠1.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the existing native carriers. Let ζO be intrinsicIntegralTameZetaMeasure(η,hD,hpD), and let E⁺ be integralTwistedPositiveEisensteinSeries(p,1,η), where the left character is exactly the principal character modulo one. Let xO be the continuous map underlying integralPrimePowerArithmeticCharacter(p,0,1,1). No new coordinate character, coefficient subring, convolution structure or coefficient-extension functor is defined.
- The target PowerSeries O has its native coefficientwise topology. Set Gη(f)=C(ζO(xO·f))+2·E⁺(f), as a continuous O-linear map on C(U,O). Coefficient bounds use the native norm of O and the compact-domain sup norm of f; no norm on PowerSeries O is asserted.
- At D=1 the existing tame arithmetic construction is zero, so Gη=2·E⁺. This boundary does not recover the ordinary principal zeta constant or the principal Eisenstein family. No nonprincipal assumption is silently removed from a Dirichlet special-value theorem.
- Field normalization assumes CharZero K, so 2 is nonzero. It is a comparison on the actual O-valued tests under the native inclusion O↪K, not an extension of arbitrary O-valued measures to all K-valued tests. Classical modularity, parity restrictions, exceptional weights and the existence of character Eisenstein forms remain with their existing ModularForms owner.
- For this comparison, K has CharZero and Algebra ℚ K. E is a field with CharZero and Algebra ℚ E, ιC:E→+*ℂ and ιK:E→+*K are separate embeddings, and η and χ are E-valued characters with η≠1. The actual measure and integral arithmetic test use their ιK-images. Rational Bernoulli-polynomial values are formed over ℚ before mapping to E.

**Construction or proof outline**

- Use the promoted coefficient formula in degree zero. The relevant test is xO·κO_(n,χK,e), not κO_(n,χK,e) alone.
- Include into K and use the promoted integral-character coefficient, arithmetic pointwise-value and arithmetic zero-level formulas. Pointwise the product is x·(χ(x)x^e)=χ(x)x^(e+1). Subtype and continuous-map extensionality bring the equality back to O-valued tests. Complete character_exponent_shift and doubleSeries_constant_shift verify the exact exponent arithmetic.
- Apply the existing intrinsic-integral-tame-common-value theorem at w=e+1, which is positive even for e=0. Simplify w−1=e and 1−w=−e in the respective fields. This gives both images of exactly the displayed b without identifying the complex and p-adic fields.
- Retain the full product level N and native zero extensions. At n=0 the tame Euler factor remains explicit. At n>0, even for principal χ, the product character vanishes at p and its imprimitive L-value already carries that Euler deletion. Do not replace θ by its primitive inducing character.
- For p=2 and quadratic η modulo 3, the constants at exponents 0,1,2 are 2/3,0,−10/9. With quadratic χ modulo 4 and e=1 the constant is −2. Exact finite residue moment controls and Bernoulli-polynomial evaluations check these signs and the shift. The positive arithmetic coefficients are twice the already owned divisor moments with χ multiplying the right character; no separate classical form is inferred.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-common-value
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- DirichletPadicLFunctions:L2/arithmetic-character-pointwise-value
- DirichletPadicLFunctions:L2/arithmetic-character-zero-level

**Acceptance**

- The comparison requires η≠1, K of characteristic zero with its rational algebra, and E a characteristic-zero field with rational algebra and separate ring embeddings into ℂ and K. It computes a formal-series constant, not a classical modular form or a branch at all weights.

**Tests**

- SuggestedTameFullSeriesTests.dyadic_constant_at_exponent_zero: At p=2, η quadratic modulo 3 and principal χ, exponent zero gives included constant 2/3.
- SuggestedTameFullSeriesTests.dyadic_constant_at_exponent_one: For the same character, exponent one gives constant zero; the unshifted first zeta moment would incorrectly give 2/3.
- SuggestedTameFullSeriesTests.dyadic_constant_at_exponent_two: For the same character, exponent two gives included constant −10/9.
- SuggestedTameFullSeriesTests.dyadic_wild_constant: With quadratic χ modulo 4 and exponent one, the included constant is −2.

**Sources**

- RJW-published, Theorem 5.7, Remark 5.8, the integral coefficient discussion, and Definition 5.13, published 143–146 / PDF 44–47; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. These whole pages were freshly read during preparation of this checkpoint.. Worker tame-character extension of the source constant-coefficient pattern xζ/2, assembled from the already planned actual integral tame zeta measure and integral positive coefficients. The doubled series clears the factor two inside the existing integer subring. This specific tame formal-series construction is a derived extension, not a theorem quoted verbatim from RJW. The source corrections, the modulus-one zero-construction boundary and the ModularForms owner of classical character Eisenstein series remain explicit.

### The tame constant as an actual unit measure

DirichletPadicLFunctions:L4/integral-tame-constant-restriction

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_constant_restriction

Kind: comparison. Implementation: unchecked.

For every f∈C(U,O), ι(coeff₀ Gη(f))=restrictUnits(p,K,μ_η)(ι∘f).

**Hypotheses**

- p is any prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), and ι:O↪K are the native objects.
- Gη is the existing integralDoubledTameEisensteinSeries. Its degree-zero coefficient is ζO^U(xO·f). The existing μ_η=tameMeasure(η,hD,hpD), ζK, intrinsic restriction r_U, pushforward j_U and weighting operation are reused. The field normalization is ½·map_ι(Gη(f)) on O-valued tests only.
- For the finite-residue formula, also require CharZero K and η≠1, and take n≥1 and a:ZMod(p^n) with IsUnit a. Define q_n(u)=toZModPow n(↑u). The test e_(n,a):C(U,O) is the native continuous discrete function Function.update(0,a,1) composed with q_n. This is notation for existing continuous-map constructions, not another indicator definition or a new finite-projection operation.
- The positive quotient level and the unit residue assumption are essential. At level zero the unit-group fiber is all of U, whereas the ambient residue fiber is all of ℤ_p. At positive level a nonunit residue has empty preimage in U even if its ambient mass is nonzero.
- The dyadic statements specialize to K=ℚ₂, p=2, D=3 and η(2)=−1. The witness is exactly f=e_(2,1), the indicator of u≡1 modulo 4. No assumption about integrality on all tests is inferred from arithmetic character values. All assertions concern formal series; no classical modularity or analytic character-family theorem is added.

**Construction or proof outline**

- The existing promoted coefficient formula gives the left side as the inclusion of ζO^U(xO·f). Apply the all-test integral coefficient comparison and the integral arithmetic-character inclusion to obtain ζK^U(xK·(ι∘f)), where xK(u)=algebraMap(↑u). The latter coordinate identity is the existing arithmetic zero-level formula.
- Consider the actual K-valued unit measure ν=weight(xK)(ζK^U). Under j_U, the supplier weight-pushforward formula and the existing intrinsic-tame-zeta-inclusion give j_Uν=weight(x_K)(ζK). The existing arithmetic tame-zeta-weight theorem identifies this with Eμ_η.
- The supplier intrinsic-unit-extension-projector also gives j_U(r_U μ_η)=Eμ_η. Apply the supplier restriction-section r_Uj_U=id to the equality of these two pushforwards. Thus ν=r_U μ_η, as actual measures on the native unit group. Evaluate at the included test and use weight-evaluation.
- The cancellation behind the weight identity is inverse-coordinate times coordinate equal to one on units, and zero extension outside the unit locus. Complete inverse_coordinate_cancel and weighted_extension check the native pointwise algebra. The argument uses the existing generic projection formula rather than defining another weighting or restriction operation.
- At the constant test one the result is the total unit mass. It is not the total ambient mass of μ_η. No characteristic-zero or nonprincipal assumption is needed for this all-test equality itself; those enter only the arithmetic residue formula.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-coefficients
- DirichletPadicLFunctions:L2/integral-arithmetic-character-coefficient
- DirichletPadicLFunctions:L2/arithmetic-character-zero-level
- DirichletPadicLFunctions:L2/intrinsic-tame-zeta-inclusion
- DirichletPadicLFunctions:L2/tame-zeta-weight
- PadicMeasuresIwasawaAlgebras:L2/weight-pushforward
- PadicMeasuresIwasawaAlgebras:L2/weight-evaluation
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section

**Acceptance**

- The equality is on every actual integral-valued continuous test. It identifies the restricted μ_η, preserving the unit Euler deletion and making no convolution-algebra identification.

**Tests**

- SuggestedTameResidueTests.constant_zero_test: The included doubled constant at the zero test is zero.
- SuggestedTameResidueTests.constant_mass_is_unit_mass: The included doubled constant at the constant test one equals the actual restricted unit mass of μ_η.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, Remark 3.31, equations 3-6 through 3-9 and Remark 3.33, published 127–129 / PDF 28–30; Lemmas 5.10–5.12 and Definition 5.13, published 145–146 / PDF 46–47. These whole pages were freshly read for this checkpoint. Theorem 8.2 and Remark 8.3, published 159–161, were read in the immediately preceding checkpoint.. Worker consequences of the existing actual finite-residue construction and doubled tame formal series. Restriction and inverse weighting identify the true constant on every continuous integral test. The dyadic indicator gives a new concrete denominator obstruction derived here, not an assertion or error attributed to RJW. The finite-residue route avoids the invalid geometric expansion already recorded for Lemma 5.10.

### Finite residues of the doubled tame constant

DirichletPadicLFunctions:L4/integral-tame-constant-residue

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_constant_residue

Kind: theorem. Implementation: unchecked.

For n≥1, IsUnit a and η≠1 in characteristic zero, ι(coeff₀ Gη(e_(n,a)))=−hD.unit⁻¹·Σ_(j:ZMod D) η(a.val+p^n·j.val)·j.val.

**Hypotheses**

- p is any prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), and ι:O↪K are the native objects.
- Gη is the existing integralDoubledTameEisensteinSeries. Its degree-zero coefficient is ζO^U(xO·f). The existing μ_η=tameMeasure(η,hD,hpD), ζK, intrinsic restriction r_U, pushforward j_U and weighting operation are reused. The field normalization is ½·map_ι(Gη(f)) on O-valued tests only.
- For the finite-residue formula, also require CharZero K and η≠1, and take n≥1 and a:ZMod(p^n) with IsUnit a. Define q_n(u)=toZModPow n(↑u). The test e_(n,a):C(U,O) is the native continuous discrete function Function.update(0,a,1) composed with q_n. This is notation for existing continuous-map constructions, not another indicator definition or a new finite-projection operation.
- The positive quotient level and the unit residue assumption are essential. At level zero the unit-group fiber is all of U, whereas the ambient residue fiber is all of ℤ_p. At positive level a nonunit residue has empty preimage in U even if its ambient mass is nonzero.
- The dyadic statements specialize to K=ℚ₂, p=2, D=3 and η(2)=−1. The witness is exactly f=e_(2,1), the indicator of u≡1 modulo 4. No assumption about integrality on all tests is inferred from arithmetic character values. All assertions concern formal series; no classical modularity or analytic character-family theorem is added.

**Construction or proof outline**

- Apply the preceding all-test constant comparison to the actual O-valued indicator. The coefficient inclusion maps its zero and one values to the corresponding K-valued indicator; complete coefficient_map_indicator proves this without choosing another coefficient ring.
- Every ambient x with reduction a is a unit. If x were a nonunit, native not_isUnit_iff and norm_lt_one_iff_dvd would write x=p·y. Since n≥1, p divides p^n, so the native ring hom ZMod.castHom maps its reduction to zero in ZMod p. But the image of the unit a is a unit, contradicting that zero is not a unit in the nontrivial field ZMod p. Complete unit_of_unit_reduction proves this exact implication.
- Consequently the ambient residue indicator vanishes off the unit locus. Apply the supplied intrinsic-unit-restriction evaluation and the zero-extension inside/outside laws to identify evaluation of r_U μ_η on the unit indicator with μ_η on the ambient indicator. Complete residue_indicator_outside checks the support step. The existing unit-domain homeomorphism evaluation identifies the two restrictions pointwise.
- Use the existing finite-projection coefficient formula, followed by the already owned tame-residue-coefficients theorem. The latter supplies exactly the displayed finite sum with canonical representatives and the supplied unit inverse of D. No new residue system, Gauss scalar, root-of-unity sum or geometric expansion is introduced.
- At p=2, D=3 and η(2)=−1, the residue 1 modulo 4 has mass 1/3. At level zero the unit mass is 2/3 but the ambient mass is 1/3. At residue 0 modulo 4 the unit test is zero but the ambient mass is 1/3. The last two tests detect removal of either of the two residue hypotheses.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-tame-constant-restriction
- DirichletPadicLFunctions:L2/tame-residue-coefficients
- PadicMeasuresIwasawaAlgebras:L1/finite-projection-coefficient
- PadicMeasuresIwasawaAlgebras:L1/integer-reduction-continuity
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation
- PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism-evaluation
- PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside
- PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside
- mathlib:PadicInt.not_isUnit_iff
- mathlib:PadicInt.norm_lt_one_iff_dvd
- mathlib:ZMod.castHom
- mathlib:ContinuousMap.equivFnOfDiscrete

**Acceptance**

- n≥1, IsUnit a, η≠1 and CharZero K remain explicit. The theorem evaluates the already constructed measure, rather than postulating that the finite formula defines one.

**Tests**

- SuggestedTameResidueTests.dyadic_one_mod_four: For η quadratic modulo 3 at p=2, the included doubled constant on the indicator of 1 modulo 4 is 1/3.
- SuggestedTameResidueTests.level_zero_residue_boundary: For the same data, the doubled constant at the test one differs from the ambient total mass: 2/3 versus 1/3.
- SuggestedTameResidueTests.nonunit_residue_boundary: The constant on the unit-group indicator of 0 modulo 4 differs from the ambient residue mass: zero versus 1/3.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, Remark 3.31, equations 3-6 through 3-9 and Remark 3.33, published 127–129 / PDF 28–30; Lemmas 5.10–5.12 and Definition 5.13, published 145–146 / PDF 46–47. These whole pages were freshly read for this checkpoint. Theorem 8.2 and Remark 8.3, published 159–161, were read in the immediately preceding checkpoint.. Worker consequences of the existing actual finite-residue construction and doubled tame formal series. Restriction and inverse weighting identify the true constant on every continuous integral test. The dyadic indicator gives a new concrete denominator obstruction derived here, not an assertion or error attributed to RJW. The finite-residue route avoids the invalid geometric expansion already recorded for Lemma 5.10.

### A dyadic constant of norm two

DirichletPadicLFunctions:L4/dyadic-tame-normalized-constant-norm

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_dyadic_normalized_norm

Kind: lemma. Implementation: unchecked.

For p=2, K=ℚ₂, D=3, η(2)=−1 and f=e_(2,1), the constant coefficient of ½·map_ι(Gη(f)) has norm exactly 2.

**Hypotheses**

- p is any prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), and ι:O↪K are the native objects.
- Gη is the existing integralDoubledTameEisensteinSeries. Its degree-zero coefficient is ζO^U(xO·f). The existing μ_η=tameMeasure(η,hD,hpD), ζK, intrinsic restriction r_U, pushforward j_U and weighting operation are reused. The field normalization is ½·map_ι(Gη(f)) on O-valued tests only.
- For the finite-residue formula, also require CharZero K and η≠1, and take n≥1 and a:ZMod(p^n) with IsUnit a. Define q_n(u)=toZModPow n(↑u). The test e_(n,a):C(U,O) is the native continuous discrete function Function.update(0,a,1) composed with q_n. This is notation for existing continuous-map constructions, not another indicator definition or a new finite-projection operation.
- The positive quotient level and the unit residue assumption are essential. At level zero the unit-group fiber is all of U, whereas the ambient residue fiber is all of ℤ_p. At positive level a nonunit residue has empty preimage in U even if its ambient mass is nonzero.
- The dyadic statements specialize to K=ℚ₂, p=2, D=3 and η(2)=−1. The witness is exactly f=e_(2,1), the indicator of u≡1 modulo 4. No assumption about integrality on all tests is inferred from arithmetic character values. All assertions concern formal series; no classical modularity or analytic character-family theorem is added.

**Construction or proof outline**

- The character is nonprincipal: the principal character at the unit 2 has value 1, whereas η(2)=−1 and the coefficient field has characteristic zero. Apply the preceding residue formula at n=2,a=1.
- Expand the three terms j=0,1,2. Their character arguments 1,5,9 reduce to 1,2,0 modulo 3, respectively. The weighted sum is −1. Since hD.unit has value 3, the included doubled constant is 1/3. Complete dyadic_residue_sum verifies the finite character calculation over every characteristic-zero field.
- Native coeff_map and coeff_smul give the normalized constant (1/2)(1/3)=1/6. Complete normalized_constant checks extraction of this scalar from the formal series.
- Native norm_natCast_eq_one_iff gives ‖3‖₂=1 and native norm_p gives ‖2‖₂=1/2. Multiplicativity and norm_div therefore give ‖1/6‖₂=2; complete dyadic_sixth_norm proves it. In particular the constant is outside the native integer ring.
- The same test has normalized q¹ coefficient 1, because its value at the unit 1 is 1 and the old positive coefficient is the Dirac atom there. This isolates the actual constant-coefficient obstruction; it is not a failure of the positive divisor construction.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-tame-constant-residue
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-normalize
- mathlib:MulChar.map_zero
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:Padic.norm_natCast_eq_one_iff
- mathlib:Padic.norm_p

**Acceptance**

- The norm is exactly two, with a fixed native continuous indicator as witness. No analytic limit, character density or classical modular-form existence is used.

**Tests**

- SuggestedTameResidueTests.dyadic_normalized_one_mod_four: The normalized constant on the residue test is exactly 1/6 in ℚ₂.
- SuggestedTameResidueTests.dyadic_normalized_norm_two: Its norm is greater than one; arithmetic-character integrality does not imply all-test integrality.
- SuggestedTameResidueTests.dyadic_normalized_positive_first: The normalized q¹ coefficient on this same residue test is 1.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, Remark 3.31, equations 3-6 through 3-9 and Remark 3.33, published 127–129 / PDF 28–30; Lemmas 5.10–5.12 and Definition 5.13, published 145–146 / PDF 46–47. These whole pages were freshly read for this checkpoint. Theorem 8.2 and Remark 8.3, published 159–161, were read in the immediately preceding checkpoint.. Worker consequences of the existing actual finite-residue construction and doubled tame formal series. Restriction and inverse weighting identify the true constant on every continuous integral test. The dyadic indicator gives a new concrete denominator obstruction derived here, not an assertion or error attributed to RJW. The finite-residue route avoids the invalid geometric expansion already recorded for Lemma 5.10.

### No integral measure for the halved dyadic family

DirichletPadicLFunctions:L4/dyadic-tame-no-integral-normalization

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_no_integral_normalization

Kind: theorem. Implementation: unchecked.

For the same dyadic data, there is no M:AbstractMeasure U O (PowerSeries O) such that map_ι(M(f))=½·map_ι(Gη(f)) for every f∈C(U,O).

**Hypotheses**

- p is any prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), and ι:O↪K are the native objects.
- Gη is the existing integralDoubledTameEisensteinSeries. Its degree-zero coefficient is ζO^U(xO·f). The existing μ_η=tameMeasure(η,hD,hpD), ζK, intrinsic restriction r_U, pushforward j_U and weighting operation are reused. The field normalization is ½·map_ι(Gη(f)) on O-valued tests only.
- For the finite-residue formula, also require CharZero K and η≠1, and take n≥1 and a:ZMod(p^n) with IsUnit a. Define q_n(u)=toZModPow n(↑u). The test e_(n,a):C(U,O) is the native continuous discrete function Function.update(0,a,1) composed with q_n. This is notation for existing continuous-map constructions, not another indicator definition or a new finite-projection operation.
- The positive quotient level and the unit residue assumption are essential. At level zero the unit-group fiber is all of U, whereas the ambient residue fiber is all of ℤ_p. At positive level a nonunit residue has empty preimage in U even if its ambient mass is nonzero.
- The dyadic statements specialize to K=ℚ₂, p=2, D=3 and η(2)=−1. The witness is exactly f=e_(2,1), the indicator of u≡1 modulo 4. No assumption about integrality on all tests is inferred from arithmetic character values. All assertions concern formal series; no classical modularity or analytic character-family theorem is added.

**Construction or proof outline**

- Assume such a measure M exists and specialize its all-test equality to the actual residue indicator e_(2,1). Extract coefficient zero after native PowerSeries.map.
- Every coefficient of M(f) is an actual element of the native integer subring O. Native Valuation.mem_integer_iff and NormedField.valuation_apply imply that its image in ℚ₂ has norm at most one. Complete norm_included_integer checks that implication for every eligible normed field.
- The preceding exact norm theorem says the same coefficient has norm two. This contradiction proves nonexistence. In fact continuity and linearity of a putative M are not needed for the contradiction: even a single integral power series at this test cannot have the required coefficient image. Complete normalized_third_not_integral and no_integral_series_with_half_third prove that stronger pointwise obstruction.
- Doubling the normalized field series returns map_ι(Gη(f)), which does have the already constructed integral lift Gη(f). The obstruction is therefore to dropping the factor two on all tests in this dyadic example, not to the existence of the doubled family.

**Prerequisites**

- DirichletPadicLFunctions:L4/dyadic-tame-normalized-constant-norm
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply
- mathlib:PowerSeries.coeff_map

**Acceptance**

- The quantifier ranges over actual formal-series-valued continuous O-linear measures. The counterexample already rules out an arbitrary integral series at the single witness test.

**Tests**

- SuggestedTameResidueTests.no_integral_series_at_residue_test: At the witness test, no power series over O has the prescribed halved field-valued coefficient image.
- SuggestedTameResidueTests.doubling_recovers_an_integral_series: Twice the normalized series at the witness test is the coefficient image of an actual integral power series.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, Remark 3.31, equations 3-6 through 3-9 and Remark 3.33, published 127–129 / PDF 28–30; Lemmas 5.10–5.12 and Definition 5.13, published 145–146 / PDF 46–47. These whole pages were freshly read for this checkpoint. Theorem 8.2 and Remark 8.3, published 159–161, were read in the immediately preceding checkpoint.. Worker consequences of the existing actual finite-residue construction and doubled tame formal series. Restriction and inverse weighting identify the true constant on every continuous integral test. The dyadic indicator gives a new concrete denominator obstruction derived here, not an assertion or error attributed to RJW. The finite-residue route avoids the invalid geometric expansion already recorded for Lemma 5.10.

### Congruences of the full doubled tame series

DirichletPadicLFunctions:L4/integral-doubled-tame-test-congruence

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_test_congruence

Kind: theorem. Implementation: unchecked.

For b∈O and f,g∈C(U,O), if b divides g(u)−f(u) for every u, then C(b) divides Gη(g)−Gη(f) in PowerSeries O, including coefficient zero.

**Hypotheses**

- p is prime; K is a nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native carriers, with inclusion ι:O↪K.
- For statements involving Gη, also assume CompleteSpace K, D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. Gη is the existing integralDoubledTameEisensteinSeries with the native coefficientwise topology. No norm on the power-series ring is required.
- Weight changes retain the same χ:DirichletCharacter K(p^t), with t,e,e′ natural. Require r≥1 and e≡e′ modulo p^(r−1)(p−1). There is no relation required between t and r. These are exponents of the test; the classical weight, where an independent comparison exists, is e+1.
- Normalization additionally assumes CharZero K. The expression ½ map_ι(Gη(f)) is only evaluated on O-valued continuous tests. An integral lift of a difference is asserted explicitly; divisibility in K would not express integral precision. The factor two is retained even at p=2.
- The constructor permits principal η but retains its level-one zero-constant boundary. No new classical modularity assertion, arbitrary K-test extension, analytic family or generic measure constructor is introduced.

**Construction or proof outline**

- For the actual norm-valuation integer ring, native Valuation.integer.integers and Valuation.Integers.dvd_iff_le identify b∣a with ‖a‖≤‖b‖. This includes b=0; no inverse of b or divided continuous test is constructed. The complete integer_dvd_iff_norm probe checks this exact native specialization.
- The pointwise hypothesis therefore gives ‖g−f‖≤‖b‖ by native ContinuousMap.norm_le on the compact unit group. Linearity gives Gη(g)−Gη(f)=Gη(g−f). Apply the existing all-coefficient norm bound, then the same native divisibility equivalence, to obtain b∣coeff_n(Gη(g)−Gη(f)) for every n, including n=0.
- Choose one quotient coefficient h_n for each n. Native PowerSeries.mk forms H with those coefficients; coeff_C_mul and ext give Gη(g)−Gη(f)=C(b)H. This routine coefficient assembly is the complete constant_dvd_of_coeff proof. The complete series_test_congruence combines these steps for an actual AbstractMeasure with the stated bound.
- At b=0 the hypothesis says f=g, and the conclusion is equality of full series. At f=g the result holds for every modulus. The constant coefficient is not inferred from the earlier positive-coefficient finite-atom congruences: it uses the existing full-series norm bound.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-bound
- mathlib:Valuation.integer.integers
- mathlib:Valuation.Integers.dvd_iff_le
- mathlib:ContinuousMap.norm_le
- mathlib:PowerSeries.mk
- mathlib:PowerSeries.coeff_C_mul
- mathlib:PowerSeries.ext

**Acceptance**

- The modulus is an actual element of O, including zero. The conclusion is divisibility in PowerSeries O, with a coefficientwise integral quotient witness.

**Tests**

- SuggestedTameCongruenceTests.zero_modulus: The zero-modulus pointwise condition implies equality of the full series.
- SuggestedTameCongruenceTests.identical_tests: Equal tests give a difference divisible by every constant series.
- SuggestedTameCongruenceTests.constant_included: The coefficient-zero difference is divisible by the same b in O.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the preceding doubled tame-series checkpoint; the finite-residue discussion on published 145–146 was read in the immediately preceding constant-residue checkpoint.. Worker consequences of the already planned full doubled tame series and its coefficient bound, motivated by the integral measure and Eisenstein-series discussion. The full tame congruences and the sharp dyadic precision example are derived here, not attributed as verbatim theorems of RJW. Existing source corrections and the independent classical ModularForms ownership remain unchanged.

### Weight congruences including the tame constant

DirichletPadicLFunctions:L4/integral-doubled-tame-weight-congruence

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_weight_congruence

Kind: theorem. Implementation: unchecked.

For fixed χ at level p^t, r≥1 and e≡e′ modulo p^(r−1)(p−1), C((p:O)^r) divides Gη(κO_(t,χ,e′))−Gη(κO_(t,χ,e)) in PowerSeries O.

**Hypotheses**

- p is prime; K is a nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native carriers, with inclusion ι:O↪K.
- For statements involving Gη, also assume CompleteSpace K, D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. Gη is the existing integralDoubledTameEisensteinSeries with the native coefficientwise topology. No norm on the power-series ring is required.
- Weight changes retain the same χ:DirichletCharacter K(p^t), with t,e,e′ natural. Require r≥1 and e≡e′ modulo p^(r−1)(p−1). There is no relation required between t and r. These are exponents of the test; the classical weight, where an independent comparison exists, is e+1.
- Normalization additionally assumes CharZero K. The expression ½ map_ι(Gη(f)) is only evaluated on O-valued continuous tests. An integral lift of a difference is asserted explicitly; divisibility in K would not express integral precision. The factor two is retained even at p=2.
- The constructor permits principal η but retains its level-one zero-constant boundary. No new classical modularity assertion, arbitrary K-test extension, analytic family or generic measure constructor is introduced.

**Construction or proof outline**

- Apply the full test-congruence theorem with b=(p:O)^r and the two native continuous maps underlying the existing integral arithmetic characters.
- Its pointwise hypothesis is precisely the preceding integral arithmetic-character weight congruence. This gives a single integral formal-series quotient and hence includes the tame constant in degree zero.
- For p=2, exponents one and five give congruence modulo 8 at every fixed character. Exponents zero and four also give a modulo-8 constant congruence for the principal level-zero test. At r=1 arbitrary characters of level 8 still qualify, since t≤r was never required.
- This is a formal-series congruence for the doubled integral family. A classical interpretation needs the separate owner-supplied modular-form existence and normalization theorems. The normalization precision is the next statement and is not obtained by cancelling two in O.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-test-congruence
- DirichletPadicLFunctions:L2/integral-arithmetic-character-weight-congruence

**Acceptance**

- Both the positive coefficients and degree zero are covered by one divisibility statement. No finite-character-level bound or exceptional classical-weight assertion is added.

**Tests**

- SuggestedTameCongruenceTests.dyadic_whole_eight: The whole doubled series for exponents one and five is congruent modulo 8 at fixed level-4 character.
- SuggestedTameCongruenceTests.dyadic_constant_eight: For principal level-zero tests, the doubled constants at exponents zero and four are congruent modulo 8.
- SuggestedTameCongruenceTests.wild_full_level_above_precision: The full series congruence modulo 2 holds at fixed arbitrary level-8 character.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the preceding doubled tame-series checkpoint; the finite-residue discussion on published 145–146 was read in the immediately preceding constant-residue checkpoint.. Worker consequences of the already planned full doubled tame series and its coefficient bound, motivated by the integral measure and Eisenstein-series discussion. The full tame congruences and the sharp dyadic precision example are derived here, not attributed as verbatim theorems of RJW. Existing source corrections and the independent classical ModularForms ownership remain unchanged.

### Integral precision after halving the tame family

DirichletPadicLFunctions:L4/integral-doubled-tame-normalized-congruence

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_normalized_congruence

Kind: theorem. Implementation: unchecked.

In characteristic zero, for a∈O and f,g∈C(U,O) with 2a∣g(u)−f(u) for every u, there is H∈PowerSeries O such that ½ map_ι(Gη(g))−½ map_ι(Gη(f))=map_ι(C(a)H).

**Hypotheses**

- p is prime; K is a nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native carriers, with inclusion ι:O↪K.
- For statements involving Gη, also assume CompleteSpace K, D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. Gη is the existing integralDoubledTameEisensteinSeries with the native coefficientwise topology. No norm on the power-series ring is required.
- Weight changes retain the same χ:DirichletCharacter K(p^t), with t,e,e′ natural. Require r≥1 and e≡e′ modulo p^(r−1)(p−1). There is no relation required between t and r. These are exponents of the test; the classical weight, where an independent comparison exists, is e+1.
- Normalization additionally assumes CharZero K. The expression ½ map_ι(Gη(f)) is only evaluated on O-valued continuous tests. An integral lift of a difference is asserted explicitly; divisibility in K would not express integral precision. The factor two is retained even at p=2.
- The constructor permits principal η but retains its level-one zero-constant boundary. No new classical modularity assertion, arbitrary K-test extension, analytic family or generic measure constructor is introduced.

**Construction or proof outline**

- The full test-congruence theorem with modulus 2a gives Gη(g)−Gη(f)=C(2a)H for an actual H∈PowerSeries O. Map this identity under the native coefficient inclusion O↪K.
- Use additivity of PowerSeries.map and scalar multiplication to combine the normalized difference, then extract coefficients. Native coeff_map, coeff_smul and coeff_C_mul reduce the identity to (1/2)(2ι(a)ι(h_n))=ι(a)ι(h_n). Characteristic zero ensures 2≠0 in K. Complete normalized_cleared_congruence proves exactly this algebra for any commutative source ring and characteristic-zero target field.
- The conclusion supplies an integral lift with factor C(a); this is stronger than a field-valued divisibility assertion. It does not assert that either normalized value separately lies in the integer ring. At a=0 the condition gives f=g and the difference is zero.
- For sharpness take p=2, K=ℚ₂, D=3, η(2)=−1 and f4 the existing indicator of units congruent to 1 modulo 4. Its doubled constant is 1/3 by the existing residue comparison and the explicit three-term sum. Linearity gives normalized constant 2^s/3 on 2^(s+1)f4; native scalar norms give exact norm 2^(−s). The complete scaled_dyadic_third_norm verifies this norm for all s.
- In particular 2f4 is pointwise divisible by 2 but its normalized constant is 1/3, which is not divisible by 2 in O. If a proposed quotient H existed with C(2), coefficient zero would give 2ι(h₀)=1/3. The complete dyadic_third_not_twice_integral contradicts the integer-ring norm bound. Thus the missing factor two cannot be discarded uniformly at p=2.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-test-congruence
- DirichletPadicLFunctions:L4/integral-tame-constant-residue
- DirichletPadicLFunctions:L4/dyadic-tame-normalized-constant-norm
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:PowerSeries.coeff_C_mul
- mathlib:Padic.norm_p_pow
- mathlib:Padic.norm_natCast_eq_one_iff
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- The result retains an explicit integral quotient witness and characteristic zero. The sharp example proves loss of one dyadic digit for all-test precision; no integral normalized measure is asserted.

**Tests**

- SuggestedTameCongruenceTests.normalized_zero_modulus: The zero-modulus hypothesis makes the normalized difference zero.
- SuggestedTameCongruenceTests.dyadic_scaled_exact_precision: For every s, the normalized constant on 2^(s+1) times the fixed indicator has norm exactly 2^(−s).
- SuggestedTameCongruenceTests.dyadic_missing_factor_two: The normalized series on 2 times the indicator has no integral lift divisible by C(2).

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the preceding doubled tame-series checkpoint; the finite-residue discussion on published 145–146 was read in the immediately preceding constant-residue checkpoint.. Worker consequences of the already planned full doubled tame series and its coefficient bound, motivated by the integral measure and Eisenstein-series discussion. The full tame congruences and the sharp dyadic precision example are derived here, not attributed as verbatim theorems of RJW. Existing source corrections and the independent classical ModularForms ownership remain unchanged.

### The integral normalized tame Eisenstein measure

DirichletPadicLFunctions:L4/integral-normalized-tame-series

Declaration: DirichletPadic.integralTameEisensteinSeries

Kind: construction. Implementation: unchecked.

Given h2:IsUnit(2:O), construct Nη:AbstractMeasure U O (PowerSeries O) by Nη=(↑h2.unit⁻¹:O)•Gη. In particular, every odd prime admits this integral normalized family.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native objects.
- Supply h2:IsUnit(2:O), and write v=(h2.unit)⁻¹∈Oˣ. The existing doubled tame measure is Gη. Define Nη=v•Gη using the inherited scalar action on AbstractMeasure U O (PowerSeries O), with the native coefficientwise topology.
- Every odd prime supplies h2: restrict the bounded coefficient algebra map ℤ_p→K to the existing integer subring and map the native unit 2∈ℤ_p. No separate ℤ_p-algebra structure on O is assumed or defined. Characteristic zero is not needed for this constructor or its coefficient-image comparison: h2 itself ensures 2≠0 in K.
- The p=2, K=ℚ₂ case cannot supply h2. The existing indicator counterexample shows that an integral normalized family is not automatic there. The unit criterion is sufficient, not claimed necessary for every individual tame character.
- All evaluations are on actual O-valued continuous tests. No extension to arbitrary K-valued tests, generic measure operation, classical modularity or analytic character family is constructed. The level-one tame constant remains zero.

**Construction or proof outline**

- Use the native inherited O-module structure on AbstractMeasure. The existing continuous O-linear Gη can be multiplied by the fixed integral scalar v without a new continuity argument or new measure constructor. Complete normalized and normalized_apply check the actual native measure type and its evaluation.
- For odd-prime availability, native PadicInt.isUnit_iff, norm_natCast_eq_one_iff and Nat.coprime_primes give IsUnit(2:ℤ_p). The coefficient algebra map has image in O since ‖algebraMap(z)‖=‖z•1‖≤‖z‖≤1. Native RingHom.codRestrict packages this existing map with the restricted codomain; IsUnit.map sends the unit certificate to O. Complete algebra_image_integral and odd_prime_two_isUnit verify this routine certificate construction. No second integer-ring definition or separately chosen algebra on O is introduced.
- Zero, addition, scalar compatibility and continuity are inherited from the native measure. The two certificates for the same proposition give the same normalized object by proof irrelevance. Native IsUnit.mul_val_inv gives 2v=1, so 2•Nη=Gη. Conversely any M satisfying 2•M=Gη equals Nη after acting by v. Complete two_mul_inverse and normalized_double check the central identity.
- Use the existing promoted doubled coefficient formula and native coeff_smul. For n>0 cancel v·2 inside O to recover the actual integral twisted positive coefficient; in degree zero the coefficient is v·ζO^U(xO f). At tame level one the promoted intrinsic-integral-tame-one-level node makes this constant zero. Compare all coefficients with the promoted positive-series coefficient formula to obtain Nη equal to that positive series. This uses no unpromoted one-level API as a new prerequisite.
- The constructor is governed by h2, not by a blanket assertion of dyadic integrality. At p=2,K=ℚ₂, the norm of two is 1/2, so it cannot be a unit in the norm-valuation integer ring. The earlier all-test residue obstruction remains valid; special dyadic characters are not classified here.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-one-level
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/dyadic-tame-no-integral-normalization
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:PadicInt.isUnit_iff
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:Nat.coprime_primes
- mathlib:RingHom.codRestrict
- mathlib:IsUnit.map
- mathlib:IsUnit.mul_val_inv
- mathlib:norm_smul_le
- mathlib:PadicInt.norm_le_one
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply
- mathlib:PowerSeries.coeff_smul
- mathlib:Padic.norm_p

**Acceptance**

- An actual continuous O-linear measure with native power-series coefficients is produced, using only existing scalar multiplication. Odd-prime availability is established from the actual algebra map. The criterion is sufficient and no classification at p=2 is claimed.

**API**

- DirichletPadic.integralTameEisensteinSeries_apply: Nη(f)=v•Gη(f).
- DirichletPadic.integralTameEisensteinSeries_zero: Nη(0)=0.
- DirichletPadic.integralTameEisensteinSeries_add: Nη(f+g)=Nη(f)+Nη(g).
- DirichletPadic.integralTameEisensteinSeries_smul: Nη(a•f)=a•Nη(f) for a∈O.
- DirichletPadic.integralTameEisensteinSeries_continuous: Nη is continuous on the native continuous-test space.
- DirichletPadic.integralTameEisensteinSeries_double: 2•Nη=Gη as actual measures.
- DirichletPadic.integralTameEisensteinSeries_coeff: The positive coefficient is the existing integral twisted positive coefficient, and coefficient zero is v·ζO^U(xO f).
- DirichletPadic.integralTameEisensteinSeries_certificate_independent: The normalized measure is independent of the proof h2.
- DirichletPadic.integralTameEisensteinSeries_one_level: For D=1 it equals the existing integral positive series.
- DirichletPadic.integralTameEisensteinSeries_unique: Any native measure M with 2•M=Gη equals Nη.

**Tests**

- SuggestedTameNormalizationTests.odd_prime_certificate: For any p≠2 the actual bounded coefficient algebra map supplies IsUnit(2:O).
- SuggestedTameNormalizationTests.normalized_zero: The normalized measure sends the zero test to zero.
- SuggestedTameNormalizationTests.normalized_one_level: At tame modulus one, the normalized measure is exactly the existing positive series, with zero constant.
- SuggestedTameNormalizationTests.positive_first: The q¹ coefficient at every test f is f(1).
- SuggestedTameNormalizationTests.dyadic_two_not_unit: Two is not a unit in the native integer ring of ℚ₂, so the constructor cannot be invoked with a nonexistent certificate.

**Uses**

- Full normalized coefficient and field comparison below: Expose the actual integral coefficients and identify their image with the existing field half.
- Integral test and fixed-character weight congruences below: Use scalar evaluation and the doubled congruence witness without losing precision.
- Boundary and uniqueness tests: Recover the doubled measure, prove certificate independence, and retain the zero tame constant at modulus one.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the doubled tame-series checkpoint and retained through the two following congruence/residue checkpoints.. Worker normalization of the already planned actual doubled tame formal-series measure. A certificate that two is a unit in the native coefficient ring permits integral normalization. Odd primes supply that certificate by the native p-adic integer unit criterion. This tame extension is derived here, not attributed as a verbatim RJW statement; all existing source corrections and classical ModularForms ownership remain.

### The integral lift of the field normalization

DirichletPadicLFunctions:L4/integral-normalized-tame-map

Declaration: DirichletPadic.integralTameEisensteinSeries_map

Kind: comparison. Implementation: unchecked.

For every f∈C(U,O), map_ι(Nη(f))=(2:K)⁻¹•map_ι(Gη(f)). No CharZero K hypothesis is required in addition to h2.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native objects.
- Supply h2:IsUnit(2:O), and write v=(h2.unit)⁻¹∈Oˣ. The existing doubled tame measure is Gη. Define Nη=v•Gη using the inherited scalar action on AbstractMeasure U O (PowerSeries O), with the native coefficientwise topology.
- Every odd prime supplies h2: restrict the bounded coefficient algebra map ℤ_p→K to the existing integer subring and map the native unit 2∈ℤ_p. No separate ℤ_p-algebra structure on O is assumed or defined. Characteristic zero is not needed for this constructor or its coefficient-image comparison: h2 itself ensures 2≠0 in K.
- The p=2, K=ℚ₂ case cannot supply h2. The existing indicator counterexample shows that an integral normalized family is not automatic there. The unit criterion is sufficient, not claimed necessary for every individual tame character.
- All evaluations are on actual O-valued continuous tests. No extension to arbitrary K-valued tests, generic measure operation, classical modularity or analytic character family is constructed. The level-one tame constant remains zero.

**Construction or proof outline**

- Map the native unit identity 2v=1 under O↪K. In the field K it implies ι(v)=2⁻¹, and also ensures 2≠0. Complete inverse_image verifies this implication without a characteristic-zero assumption.
- Extract every coefficient after native PowerSeries.map. Apply the constructor evaluation, coeff_map and coeff_smul. The coefficient equality is ι(v a_n)=2⁻¹ι(a_n), which follows from multiplicativity and the preceding inverse identity. Complete normalized_map proves this for every actual native measure.
- The comparison shows that the earlier field-valued half has an actual integral measure lift under h2. The field half still takes the original integral tests as input; no coefficient-extension functor or measure on all K-valued tests is inferred.
- At p=3, D=4 and η(3)=−1, the actual unit mass of the tame measure is one. The previous constant restriction/residue formula gives included Gη(1) constant one and hence included Nη(1) constant 1/2. This is integral at p=3 and supplies a nonzero constant test.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-normalized-tame-series
- DirichletPadicLFunctions:L4/integral-tame-constant-restriction
- DirichletPadicLFunctions:L4/integral-tame-constant-residue
- mathlib:IsUnit.mul_val_inv
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul

**Acceptance**

- The equality is between actual formal series over K and identifies an actual O-valued lift on every integral test. The unit hypothesis itself supplies nonvanishing of two.

**Tests**

- SuggestedTameNormalizationTests.map_double: Doubling the coefficient image of Nη(f) recovers the image of Gη(f).
- SuggestedTameNormalizationTests.map_zero: The coefficient image at the zero test is zero.
- SuggestedTameNormalizationTests.triadic_constant_half: At p=3 with the quadratic tame character modulo 4, the included constant at test one is 1/2.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the doubled tame-series checkpoint and retained through the two following congruence/residue checkpoints.. Worker normalization of the already planned actual doubled tame formal-series measure. A certificate that two is a unit in the native coefficient ring permits integral normalization. Odd primes supply that certificate by the native p-adic integer unit criterion. This tame extension is derived here, not attributed as a verbatim RJW statement; all existing source corrections and classical ModularForms ownership remain.

### The normalized tame coefficient bound

DirichletPadicLFunctions:L4/integral-normalized-tame-bound

Declaration: DirichletPadic.integralTameEisensteinSeries_coeff_norm_le

Kind: theorem. Implementation: unchecked.

For every f∈C(U,O) and n≥0, ‖coeff_n Nη(f)‖≤‖f‖.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native objects.
- Supply h2:IsUnit(2:O), and write v=(h2.unit)⁻¹∈Oˣ. The existing doubled tame measure is Gη. Define Nη=v•Gη using the inherited scalar action on AbstractMeasure U O (PowerSeries O), with the native coefficientwise topology.
- Every odd prime supplies h2: restrict the bounded coefficient algebra map ℤ_p→K to the existing integer subring and map the native unit 2∈ℤ_p. No separate ℤ_p-algebra structure on O is assumed or defined. Characteristic zero is not needed for this constructor or its coefficient-image comparison: h2 itself ensures 2≠0 in K.
- The p=2, K=ℚ₂ case cannot supply h2. The existing indicator counterexample shows that an integral normalized family is not automatic there. The unit criterion is sufficient, not claimed necessary for every individual tame character.
- All evaluations are on actual O-valued continuous tests. No extension to arbitrary K-valued tests, generic measure operation, classical modularity or analytic character family is constructed. The level-one tame constant remains zero.

**Construction or proof outline**

- The constructor evaluation and coeff_smul give coeff_n Nη(f)=v·coeff_n Gη(f). Since v is an actual element of O, its norm is at most one by the defining norm valuation. No norm on the power-series ring is used.
- Multiplicativity bounds the norm of this coefficient by that of the doubled coefficient, which is at most ‖f‖ by the existing full doubled bound. Complete integer_norm_le_one and normalized_bound check the native normed subtype and the inequality.
- In particular the estimate includes degree zero. For the constant test one it gives a bound of one on every coefficient. It is uniform in the fixed tame character and does not assert a normed structure on formal series.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-normalized-tame-series
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-bound
- mathlib:PowerSeries.coeff_smul
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- The norm is the native coefficient norm and the native compact-domain sup norm, not an invented power-series norm.

**Tests**

- SuggestedTameNormalizationTests.constant_norm_bound: The degree-zero coefficient satisfies the same sup-norm bound.
- SuggestedTameNormalizationTests.one_test_bound: Every coefficient at the constant test one has norm at most one.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the doubled tame-series checkpoint and retained through the two following congruence/residue checkpoints.. Worker normalization of the already planned actual doubled tame formal-series measure. A certificate that two is a unit in the native coefficient ring permits integral normalization. Odd primes supply that certificate by the native p-adic integer unit criterion. This tame extension is derived here, not attributed as a verbatim RJW statement; all existing source corrections and classical ModularForms ownership remain.

### Normalized tame congruences without precision loss

DirichletPadicLFunctions:L4/integral-normalized-tame-test-congruence

Declaration: DirichletPadic.integralTameEisensteinSeries_test_congruence

Kind: theorem. Implementation: unchecked.

For b∈O and f,g∈C(U,O), if b∣g(u)−f(u) for every u, then C(b)∣Nη(g)−Nη(f) in PowerSeries O.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native objects.
- Supply h2:IsUnit(2:O), and write v=(h2.unit)⁻¹∈Oˣ. The existing doubled tame measure is Gη. Define Nη=v•Gη using the inherited scalar action on AbstractMeasure U O (PowerSeries O), with the native coefficientwise topology.
- Every odd prime supplies h2: restrict the bounded coefficient algebra map ℤ_p→K to the existing integer subring and map the native unit 2∈ℤ_p. No separate ℤ_p-algebra structure on O is assumed or defined. Characteristic zero is not needed for this constructor or its coefficient-image comparison: h2 itself ensures 2≠0 in K.
- The p=2, K=ℚ₂ case cannot supply h2. The existing indicator counterexample shows that an integral normalized family is not automatic there. The unit criterion is sufficient, not claimed necessary for every individual tame character.
- All evaluations are on actual O-valued continuous tests. No extension to arbitrary K-valued tests, generic measure operation, classical modularity or analytic character family is constructed. The level-one tame constant remains zero.

**Construction or proof outline**

- The existing full doubled test-congruence theorem supplies H∈PowerSeries O with Gη(g)−Gη(f)=C(b)H.
- Scalar evaluation of the normalized measure gives Nη(g)−Nη(f)=v•(C(b)H)=C(b)(v•H). This identity follows coefficientwise from coeff_smul and coeff_C_mul and routine commutative ring algebra. Complete normalized_congruence proves it on the actual native formal series.
- The quotient v•H remains integral because v∈O. There is no extra factor two in the hypothesis and no loss of precision; this applies at every odd prime. It does not contradict the preceding dyadic obstruction, since that case lacks h2.
- For b=0 the hypothesis gives f=g and equality of normalized series. Extracting coefficient zero gives the same modulus for the normalized tame constants.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-normalized-tame-series
- DirichletPadicLFunctions:L4/integral-doubled-tame-test-congruence
- mathlib:PowerSeries.coeff_smul
- mathlib:PowerSeries.coeff_C_mul

**Acceptance**

- The quotient is an actual integral power series. The same arbitrary modulus, including zero, is preserved.

**Tests**

- SuggestedTameNormalizationTests.zero_modulus: The zero-modulus condition implies equality of normalized series.
- SuggestedTameNormalizationTests.normalized_constant_congruence: The normalized constant difference is divisible by exactly b in O.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the doubled tame-series checkpoint and retained through the two following congruence/residue checkpoints.. Worker normalization of the already planned actual doubled tame formal-series measure. A certificate that two is a unit in the native coefficient ring permits integral normalization. Odd primes supply that certificate by the native p-adic integer unit criterion. This tame extension is derived here, not attributed as a verbatim RJW statement; all existing source corrections and classical ModularForms ownership remain.

### Integral weight congruences for the normalized family

DirichletPadicLFunctions:L4/integral-normalized-tame-weight-congruence

Declaration: DirichletPadic.integralTameEisensteinSeries_weight_congruence

Kind: theorem. Implementation: unchecked.

For fixed χ:DirichletCharacter K(p^t), r≥1 and e≡e′ modulo p^(r−1)(p−1), C((p:O)^r) divides Nη(κO_(t,χ,e′))−Nη(κO_(t,χ,e)) in PowerSeries O.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D, hD:IsUnit(D:K) and p∤D. U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the actual native objects.
- Supply h2:IsUnit(2:O), and write v=(h2.unit)⁻¹∈Oˣ. The existing doubled tame measure is Gη. Define Nη=v•Gη using the inherited scalar action on AbstractMeasure U O (PowerSeries O), with the native coefficientwise topology.
- Every odd prime supplies h2: restrict the bounded coefficient algebra map ℤ_p→K to the existing integer subring and map the native unit 2∈ℤ_p. No separate ℤ_p-algebra structure on O is assumed or defined. Characteristic zero is not needed for this constructor or its coefficient-image comparison: h2 itself ensures 2≠0 in K.
- The p=2, K=ℚ₂ case cannot supply h2. The existing indicator counterexample shows that an integral normalized family is not automatic there. The unit criterion is sufficient, not claimed necessary for every individual tame character.
- All evaluations are on actual O-valued continuous tests. No extension to arbitrary K-valued tests, generic measure operation, classical modularity or analytic character family is constructed. The level-one tame constant remains zero.

**Construction or proof outline**

- Use the native continuous maps underlying the existing integral arithmetic characters as the two tests in the preceding normalized congruence.
- The already established integral arithmetic-character weight congruence gives pointwise divisibility by (p:O)^r at every actual unit. It holds for any fixed finite level t, without t≤r. The conclusion includes the constant coefficient.
- For p=3, r=2 the period is six. At any character of level 27, exponents one and seven therefore give a full normalized congruence modulo nine. This simultaneously tests the period and the absence of a finite-level restriction.
- Identical exponents give a zero difference divisible by any modulus. No classical modular form at these weights or analytic weight-space interpolation is asserted by this formal-series theorem.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-normalized-tame-test-congruence
- DirichletPadicLFunctions:L2/integral-arithmetic-character-weight-congruence

**Acceptance**

- The p-power modulus is unchanged after normalization, with every coefficient covered. Classical ownership and all existing analytic requests remain explicit.

**Tests**

- SuggestedTameNormalizationTests.equal_weights: Equal exponents give a difference divisible by every p-power constant series.
- SuggestedTameNormalizationTests.triadic_weights_mod_nine: At p=3, fixed characters at level 27 have normalized weights one and seven congruent modulo nine.

**Sources**

- RJW-published, Theorem 5.7 and Remark 5.8, published 143–144 / PDF 44–45; Definition 8.1, Theorem 8.2 and Remark 8.3, published 159–161 / PDF 60–62. Whole passages read in the doubled tame-series checkpoint and retained through the two following congruence/residue checkpoints.. Worker normalization of the already planned actual doubled tame formal-series measure. A certificate that two is a unit in the native coefficient ring permits integral normalization. Odd primes supply that certificate by the native p-adic integer unit criterion. This tame extension is derived here, not attributed as a verbatim RJW statement; all existing source corrections and classical ModularForms ownership remain.

### A unit constant detected by two residue tests

DirichletPadicLFunctions:L4/integral-tame-unit-constant-witness

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_unit_constant_witness

Kind: theorem. Implementation: unchecked.

For n≥1 and 2D≤p^n there is a unit b∈ZMod(p^n) such that, for the actual unit-residue indicators e_b and e_1, ι(coeff₀Gη(e_b−e_1))=−1.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field of characteristic zero, with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D is nonprincipal, hD:IsUnit(D:K) and p∤D.
- U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), ι:O↪K and the actual μ_η=tameMeasure(η,hD,hpD) are reused. Gη is integralDoubledTameEisensteinSeries. All formal series use the native coefficientwise topology.
- The finite shift compares canonical representatives modulo D: b.val≡a.val+p^n modD, for a,b∈ZMod(p^n). It is not the operation of adding p^n inside ZMod(p^n), which is the identity.
- For the unit-residue witness take n≥1 and 2D≤p^n. Such a level exists. Indicators are the existing native discrete continuous maps Function.update(0,a,1) composed with unit reduction; no new generic indicator constructor is defined.
- The scalar criterion concerns an actual O-linear continuous formal-series-valued measure on every O-valued continuous test. No arbitrary K-valued test extension, character-density assertion, classical modular form or analytic family is introduced. Nonprincipal η is essential; the tame level-one constructor has zero constant and is a separate case.

**Construction or proof outline**

- Put q=p^n and b0=(1+q) modD. If p does not divide b0 choose b=b0; otherwise choose b=b0+D. Since p∤D, the second choice is not divisible by p. In both cases b<2D≤q and b≡1+q modD. Complete unit_representative proves this construction without restricting p to2.
- The natural b gives a native element of ZMod q whose canonical value is exactly b. Native unit/coprimality criteria and complete unit_residue make it a unit. Since n≥1 and p is prime, q>1, so the canonical representative of1 is1 and it too is a unit.
- The preceding actual residue-shift theorem with a=1 gives the ambient mass difference −η(1)=−1. For these two unit residues at a positive quotient level, the existing integral-tame-constant-residue comparison identifies each ambient mass with the included doubled constant of its unit indicator.
- The inherited linearity of the actual Gη identifies the difference with the constant on e_b−e_1. Both tests are continuous O-valued native finite indicators. Their difference is a legitimate test even if no scalar extension to all K-valued tests is available.
- For an existential test independent of the quotient level, native pow_unbounded_of_one_lt supplies n with2D<p^n; D>0 ensures n≥1. Complete large_residue_level verifies this selection. The modulus-five dyadic example uses n=4,b=7 and gives exactly−1, without Gauss sums or character primitivity.

**Prerequisites**

- DirichletPadicLFunctions:L2/tame-residue-cyclic-shift
- DirichletPadicLFunctions:L4/integral-tame-constant-residue
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series
- mathlib:ContinuousMap.equivFnOfDiscrete
- mathlib:ZMod.val_natCast_of_lt
- mathlib:ZMod.isUnit_iff_coprime
- mathlib:Nat.Prime.coprime_iff_not_dvd
- mathlib:pow_unbounded_of_one_lt

**Acceptance**

- The witness is explicit at every sufficiently large finite quotient and is a test on the actual unit group. Nonprincipal η, positive level and the size bound remain stated.

**Tests**

- SuggestedTameScalarTests.actual_test_witness: For every eligible nonprincipal tame family there exists an actual integral continuous test whose included doubled constant is−1.
- SuggestedTameScalarTests.modulus_five_unit_witness: At p=2,D=5,n=4, the difference of indicators at residues7 and1 has doubled constant−1.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, published127–129/PDF28–30; Lemmas5.10–5.12 and Definition5.13, published145–146/PDF46–47; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in the preceding constant-residue and doubled tame-series checkpoints; retained source corrections apply.. Worker consequences of the existing actual finite-residue formula and integral doubled tame series. The two-unit-residue witness, exact scalar criterion and general dyadic obstruction are derived here, not quoted as source theorems. The proof uses finite cyclic sums, avoiding the previously recorded invalid geometric expansion. No new source erratum, independent review or classical modularity assertion is made.

### The exact scalar integrality criterion

DirichletPadicLFunctions:L4/tame-full-series-scalar-integrality

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_scalar_lift_iff

Kind: theorem. Implementation: unchecked.

For every s∈K, there exists M:AbstractMeasure U O (PowerSeries O) with map_ι(M(f))=s•map_ι(Gη(f)) for every f∈C(U,O) if and only if ‖s‖≤1.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field of characteristic zero, with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D is nonprincipal, hD:IsUnit(D:K) and p∤D.
- U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), ι:O↪K and the actual μ_η=tameMeasure(η,hD,hpD) are reused. Gη is integralDoubledTameEisensteinSeries. All formal series use the native coefficientwise topology.
- The finite shift compares canonical representatives modulo D: b.val≡a.val+p^n modD, for a,b∈ZMod(p^n). It is not the operation of adding p^n inside ZMod(p^n), which is the identity.
- For the unit-residue witness take n≥1 and 2D≤p^n. Such a level exists. Indicators are the existing native discrete continuous maps Function.update(0,a,1) composed with unit reduction; no new generic indicator constructor is defined.
- The scalar criterion concerns an actual O-linear continuous formal-series-valued measure on every O-valued continuous test. No arbitrary K-valued test extension, character-density assertion, classical modular form or analytic family is introduced. Nonprincipal η is essential; the tame level-one constructor has zero constant and is a separate case.

**Construction or proof outline**

- If ‖s‖≤1, the defining norm valuation gives the actual subtype element sO∈O. Let M=sO•Gη using the native scalar action on measures. Extract coefficients after PowerSeries.map; multiplicativity of the subtype hom gives the required all-test equality. Complete scalar_integral_lift constructs precisely this native measure and proves the comparison.
- Conversely use the preceding explicit residue-difference test f0 with included doubled constant−1. Extract coefficient zero from a proposed all-test equality. The image of the integral coefficient of M(f0) is then−s.
- Every coefficient of M(f0) belongs to the actual norm-valuation integer ring, hence has image of norm at most one. Since ‖−s‖=‖s‖, this gives the necessary bound. Complete scalar_lift_necessity checks this argument against the actual measure and PowerSeries.map interfaces.
- Necessity needs only the single integral series value at f0, so the result is not a consequence of a vacuous divisibility assertion over K. Sufficiency genuinely supplies an O-linear continuous measure on all integral tests. The scalar can be zero; no inverse of s is used.
- Nonprincipal η is essential. At tame level one the promoted intrinsic integral tame measure is zero, so Gη has zero constant and is twice the existing positive integral series. In characteristic zero that positive series provides a half-normalized integral lift, including the dyadic case where the scalar1/2 is not integral. This boundary does not identify the zero tame constructor with the principal zeta family.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-tame-unit-constant-witness
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-series
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L2/intrinsic-integral-tame-one-level
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- The quantifier is over actual native integral measures and all actual integral tests. Both directions are proved with native coefficient inclusion; no generic extension functor is assumed.

**Tests**

- SuggestedTameScalarTests.scalar_zero: The zero scalar has the actual zero measure as an integral lift.
- SuggestedTameScalarTests.scalar_negative_one: The scalar−1 has an actual integral measure lift.
- SuggestedTameScalarTests.principal_one_level_exception: At tame modulus one the positive integral series gives a half-normalized lift; therefore the nonprincipal hypothesis cannot be dropped.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, published127–129/PDF28–30; Lemmas5.10–5.12 and Definition5.13, published145–146/PDF46–47; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in the preceding constant-residue and doubled tame-series checkpoints; retained source corrections apply.. Worker consequences of the existing actual finite-residue formula and integral doubled tame series. The two-unit-residue witness, exact scalar criterion and general dyadic obstruction are derived here, not quoted as source theorems. The proof uses finite cyclic sums, avoiding the previously recorded invalid geometric expansion. No new source erratum, independent review or classical modularity assertion is made.

### The dyadic obstruction for every nonprincipal tame character

DirichletPadicLFunctions:L4/dyadic-nonprincipal-tame-no-normalization

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_dyadic_no_normalization

Kind: theorem. Implementation: unchecked.

For p=2 and every eligible nonprincipal η of odd tame modulus, no M:AbstractMeasure U O (PowerSeries O) has map_ι(M(f))=(2:K)⁻¹•map_ι(Gη(f)) for every integral continuous test f.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field of characteristic zero, with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0, η:DirichletCharacter K D is nonprincipal, hD:IsUnit(D:K) and p∤D.
- U=(ℤ_p)ˣ, O=Valuation.integer(NormedField.valuation(K)), ι:O↪K and the actual μ_η=tameMeasure(η,hD,hpD) are reused. Gη is integralDoubledTameEisensteinSeries. All formal series use the native coefficientwise topology.
- The finite shift compares canonical representatives modulo D: b.val≡a.val+p^n modD, for a,b∈ZMod(p^n). It is not the operation of adding p^n inside ZMod(p^n), which is the identity.
- For the unit-residue witness take n≥1 and 2D≤p^n. Such a level exists. Indicators are the existing native discrete continuous maps Function.update(0,a,1) composed with unit reduction; no new generic indicator constructor is defined.
- The scalar criterion concerns an actual O-linear continuous formal-series-valued measure on every O-valued continuous test. No arbitrary K-valued test extension, character-density assertion, classical modular form or analytic family is introduced. Nonprincipal η is essential; the tame level-one constructor has zero constant and is a separate case.

**Construction or proof outline**

- The bounded ℤ₂ scalar action gives ‖2:K‖=‖(2:ℤ₂)•1‖≤‖2:ℤ₂‖=1/2. Complete dyadic_two_norm checks the exact native algebra map, numeral casts and p-adic scalar norm.
- Characteristic zero ensures2≠0. Multiplicativity and the inverse norm identity give ‖(2:K)⁻¹‖≥2>1; complete dyadic_half_norm proves the inequality. An isometric coefficient embedding is not assumed, so equality with2 is not claimed for general K.
- Apply the exact scalar integrality criterion with s=(2:K)⁻¹. Its necessary norm bound is impossible. Equivalently the explicit residue-difference test has normalized constant−1/2 outside O, ruling out even an arbitrary integral series value there.
- The argument uses only nonprincipality, not primitivity. It applies to the quadratic character modulo5 and to the explicit character obtained by raising the nontrivial character modulo3 to modulus9. The old quadratic-modulo3 obstruction is retained whole as a concrete earlier special case.
- The theorem does not cover principal η; the tame level-one half has an integral lift as tested above. At odd primes the prior two-unit construction supplies the normalized integral measure, consistent with the scalar criterion.

**Prerequisites**

- DirichletPadicLFunctions:L4/tame-full-series-scalar-integrality
- mathlib:norm_smul_le
- mathlib:PadicInt.norm_p

**Acceptance**

- All nonprincipal tame characters are covered over the stated characteristic-zero coefficient fields. The proof only needs a norm lower bound for1/2 and retains the principal exception.

**Tests**

- SuggestedTameScalarTests.modulus_five_no_normalization: The quadratic tame character modulo5 also has no all-test integral half at p=2.
- SuggestedTameScalarTests.imprimitive_nine_no_normalization: The explicit changeLevel lift from modulus3 to9 has the same obstruction; primitivity is unnecessary.

**Sources**

- RJW-published, Restriction and zero extension in §3.5.3, published127–129/PDF28–30; Lemmas5.10–5.12 and Definition5.13, published145–146/PDF46–47; Definition8.1, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in the preceding constant-residue and doubled tame-series checkpoints; retained source corrections apply.. Worker consequences of the existing actual finite-residue formula and integral doubled tame series. The two-unit-residue witness, exact scalar criterion and general dyadic obstruction are derived here, not quoted as source theorems. The proof uses finite cyclic sums, avoiding the previously recorded invalid geometric expansion. No new source erratum, independent review or classical modularity assertion is made.

### Character variation of the full doubled tame series

DirichletPadicLFunctions:L4/tame-full-series-character-variation

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_character_bound

Kind: theorem. Implementation: unchecked.

For every f∈C(U,O) and n≥0, ‖ι(coeff_n Gη0(f))−ι(coeff_n Gη1(f))‖≤B‖f‖, including the constant coefficient.

**Hypotheses**

- p is prime, D>0 with NeZero D, p∤D, and η0,η1 are native DirichletCharacter K D at the same tame modulus. hD:IsUnit(D:K). The real bound B satisfies B≥0 and ‖η0(a)−η1(a)‖≤B for every a∈ZMod D, including nonunits. Both characters may be principal in the three variation bounds.
- For formal coefficients K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. For actual measure and doubled-series statements K is additionally complete and nontrivially normed. No characteristic-zero hypothesis is needed for these bounds.
- The existing Fη=tameSeries, bounded coefficient sequence and μη=tameMeasure are reused. O is exactly the native norm-valuation integer subring of K, U=(ℤ_p)ˣ, and Gη is the actual integralDoubledTameEisensteinSeries with coefficientwise topology on PowerSeries O. Norms of measures are taken only after AbstractMeasure.toCLMEquiv; no norm on a formal-series ring is introduced.

**Construction or proof outline**

- In degree zero, apply the existing all-test constant-restriction comparison to each character. The two included constants become evaluations of the actual tame measures on the same extended unit test.
- The exact supplier restriction-evaluation formula first precomposes ι∘f with the inverse homeomorphism from the clopen unit locus to U and then extends by zero. The promoted zero-extension-norm theorem preserves the supremum norm. Precomposition cannot increase it, by native ContinuousMap.norm_le and norm_coe_le_norm. The native integer-subring norm makes ‖ι∘f‖=‖f‖; complete included_test_norm and precomposition_bound verify these two routine estimates.
- Use the preceding actual measure-difference bound and native le_opNorm on this common extended test. This yields the constant-coefficient bound without a principal-character residue formula or any density argument.
- For n>0 use the doubled coefficient formula, coefficient inclusion and the existing finite divisor-Dirac evaluation. The included coefficient is 2Σ_(d|n,p∤d)η(d)ι(f(u_d)), since the left character is principal modulo one.
- Subtract the two finite sums and apply the complete finite_weighted_difference estimate with A=‖f‖. Native pointwise-to-sup norm bounds control each f(u_d); the ultrametric natural-cast bound gives ‖2:K‖≤1. Thus multiplication by two preserves the desired B‖f‖ bound. At n=1 both characters take the value one, so that coefficient difference is exactly zero.
- Every assertion is coefficientwise on all actual integral continuous tests. No scalar extension to arbitrary K-valued tests or analytic character family is inferred.

**Prerequisites**

- DirichletPadicLFunctions:L2/tame-character-measure-variation
- DirichletPadicLFunctions:L4/integral-tame-constant-restriction
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation
- PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-norm
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:ContinuousMap.norm_le
- mathlib:ContinuousMap.norm_coe_le_norm
- mathlib:ContinuousLinearMap.le_opNorm
- mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg
- mathlib:IsUltrametricDist.norm_natCast_le_one

**Acceptance**

- The degree-zero estimate is proved using actual restriction and the general norm-preserving zero extension, not the rational-only restriction bound. Positive degrees retain the factor two and the correct divisor support.

**Tests**

- SuggestedTameVariationTests.constant_variation: The character-distance estimate includes coefficient zero on every integral test.
- SuggestedTameVariationTests.first_coefficient_independent: Coefficient one is2f(1), hence independent of the tame character.
- SuggestedTameVariationTests.zero_test: Every coefficient difference vanishes on the zero test.

**Sources**

- RJW-published, Restriction and zero extension, §3.5.3, published127–129/PDF28–30; tame kernel and integral coefficients, §5.2, published143–146/PDF44–47; Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in the retained tame-series and constant-residue checkpoints.. Worker quantitative variation of the existing tame character and full doubled integral formal series. The fixed-level Lipschitz estimates and stability of scalar integrality are derived consequences, not statements quoted from RJW. The source motivates integral coefficient variation; classical modularity and analytic weight-space existence remain with their owners. Retained source corrections apply, including the invalid geometric expansion avoided by the finite-kernel proof.

### Scalar integrality near a nonprincipal tame character

DirichletPadicLFunctions:L4/tame-near-character-scalar-integrality

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_near_scalar_lift_iff

Kind: theorem. Implementation: unchecked.

Assume additionally CharZero K, η1≠1 and B<1. For every s∈K there exists M:AbstractMeasure U O (PowerSeries O) with map_ι(M(f))=s•map_ι(Gη0(f)) for every integral test f if and only if ‖s‖≤1. The target character η0 may be principal.

**Hypotheses**

- p is prime, D>0 with NeZero D, p∤D, and η0,η1 are native DirichletCharacter K D at the same tame modulus. hD:IsUnit(D:K). The real bound B satisfies B≥0 and ‖η0(a)−η1(a)‖≤B for every a∈ZMod D, including nonunits. Both characters may be principal in the three variation bounds.
- For formal coefficients K is a normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. For actual measure and doubled-series statements K is additionally complete and nontrivially normed. No characteristic-zero hypothesis is needed for these bounds.
- The existing Fη=tameSeries, bounded coefficient sequence and μη=tameMeasure are reused. O is exactly the native norm-valuation integer subring of K, U=(ℤ_p)ˣ, and Gη is the actual integralDoubledTameEisensteinSeries with coefficientwise topology on PowerSeries O. Norms of measures are taken only after AbstractMeasure.toCLMEquiv; no norm on a formal-series ring is introduced.
- For this stability theorem only, K has characteristic zero, η1 is nonprincipal and0≤B<1. No nonprincipal assumption is imposed on η0. All character comparisons are at the same positive tame modulus.

**Construction or proof outline**

- Apply the existing unit-constant witness to the nonprincipal reference character η1. Choose a sufficiently large positive residue level as in that theorem; its difference of two unit indicators is an actual O-valued continuous test f0 with ι(coeff₀Gη1(f0))=−1.
- Every O-valued continuous test has supremum norm at most one. This follows from the defining norm valuation and native ContinuousMap.norm_le; complete integral_test_norm proves it on every compact domain. The full character-variation theorem therefore bounds the two constants at f0 by B<1.
- In an ultrametric field, two elements at distance less than one have the same norm if either has norm one. Apply the native generated additive counterpart of the indexed norm_eq_of_mul_norm_lt_max. Complete unit_norm_stable and transfer_unit_constant verify that the target constant has norm one. Its exact value need not be−1.
- If an all-test integral lift M exists, extract its coefficient zero at f0. Its included coefficient has norm at most one, while multiplicativity gives norm equal to ‖s‖ times the unit norm of the target constant. Complete scalar_lift_necessity_norm_one proves this argument on native AbstractMeasure and PowerSeries.map.
- If ‖s‖≤1, package s as its actual integer-subring element and multiply the existing integral measure Gη0 by it. The scalar-lift construction from the prior criterion uses only native linearity and coefficient inclusion and never used nonprincipality; this same construction proves sufficiency here.
- For p=2,D=3, a supplied χ with χ(2)=−1 is nonprincipal in characteristic zero and differs from the principal character by norm at most1/2. Hence the principal modulus-three doubled tame family also has the exact scalar criterion and no all-test integral half. These typed tests explicitly supply χ; no general existence theorem for quadratic characters at all tame moduli is asserted in this checkpoint.
- The strict inequality B<1 is necessary for the norm-stability step: zero and−1 have distance one but unequal norms. The modulus-one zero tame constructor remains outside the hypothesis since no nonprincipal reference character exists at that modulus. No identification with the principal zeta family follows.

**Prerequisites**

- DirichletPadicLFunctions:L4/tame-full-series-character-variation
- DirichletPadicLFunctions:L4/integral-tame-unit-constant-witness
- DirichletPadicLFunctions:L4/tame-full-series-scalar-integrality
- mathlib:pow_unbounded_of_one_lt
- mathlib:ContinuousMap.norm_le
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply
- mathlib:IsUltrametricDist.norm_eq_of_mul_norm_lt_max
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:MulChar.one_apply
- mathlib:PadicInt.norm_p

**Acceptance**

- Only the reference character is required to be nonprincipal. The strict distance hypothesis, actual test witness and native integral measure quantifier remain explicit.

**Tests**

- SuggestedTameVariationTests.stable_unit_constant: A nearby target character has an actual integral test with included doubled constant of norm one.
- SuggestedTameVariationTests.principal_three_scalar_criterion: Given the actual modulus-three character χ with χ(2)=−1, the principal character at that modulus has the exact scalar lift criterion over ℚ₂.
- SuggestedTameVariationTests.principal_three_no_half: The same principal modulus-three family has no integral half on all integral tests.
- SuggestedTameVariationTests.radius_one_not_enough: Zero and−1 have distance one but different norms, so a closed radius-one estimate cannot transfer unit norm.

**Sources**

- RJW-published, Restriction and zero extension, §3.5.3, published127–129/PDF28–30; tame kernel and integral coefficients, §5.2, published143–146/PDF44–47; Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in the retained tame-series and constant-residue checkpoints.. Worker quantitative variation of the existing tame character and full doubled integral formal series. The fixed-level Lipschitz estimates and stability of scalar integrality are derived consequences, not statements quoted from RJW. The source motivates integral coefficient variation; classical modularity and analytic weight-space existence remain with their owners. Retained source corrections apply, including the invalid geometric expansion avoided by the finite-kernel proof.

### Exact scalar integrality for every dyadic tame character

DirichletPadicLFunctions:L4/dyadic-all-tame-scalar-integrality

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_dyadic_scalar_lift_iff

Kind: theorem. Implementation: unchecked.

If D≠1, then for every η and s∈K an integral all-test scalar lift of sGη exists if and only if ‖s‖≤1.

**Hypotheses**

- D>0 with NeZero D and2∤D. K is a complete nontrivially normed ultrametric field of characteristic zero with Algebra ℤ₂ K and IsBoundedSMul ℤ₂ K. hD:IsUnit(D:K), η:DirichletCharacter K D, U=(ℤ₂)ˣ, and O is the native norm-valuation integer subring of K.
- Gη is the existing integralDoubledTameEisensteinSeries, valued in native PowerSeries O with its coefficientwise topology. An integral scalar lift means an actual M:AbstractMeasure U O (PowerSeries O) whose included value at every actual O-valued continuous test is s times the included value of Gη. No extension to all K-valued tests or norm on formal series is assumed.
- The dyadic statements allow every tame character, principal or nonprincipal and primitive or imprimitive. The modulus D is the given level, not silently replaced by the conductor. The tame modulus-one kernel is zero and is not the ordinary principal zeta pseudomeasure.
- Require D≠1. No nonprincipal hypothesis is imposed on η.

**Construction or proof outline**

- Split on whether η is principal. For nonprincipal η, apply the existing exact scalar-integrality theorem, which already covers arbitrary tame modulus and imprimitive characters.
- For principal η, choose the actual nonprincipal quadratic reference at level D from the preceding lemma. Its pointwise distance bound is B=1/2, with0≤B<1. Apply the previous near-character scalar-integrality theorem with η0=1_D and this reference η1.
- Both branches give the identical necessary and sufficient bound ‖s‖≤1. The principal branch is an application of the actual measure and full-series variation bounds, including the constant coefficient; it does not apply a nonprincipal finite-residue formula to the principal character.
- The supplied coefficient field needs only a bounded ℤ₂ action. No assertion that it is isometric to ℚ₂ is made. The conclusion holds for every actual integral continuous test, not merely finite-order or arithmetic characters.
- At D=3 and D=9 the principal scalar criterion is now unconditional in the reference character. The zero scalar is still supplied by the native zero measure. Modulus one has the different criterion in the next node.

**Prerequisites**

- DirichletPadicLFunctions:L2/dyadic-tame-quadratic-reference
- DirichletPadicLFunctions:L4/tame-full-series-scalar-integrality
- DirichletPadicLFunctions:L4/tame-near-character-scalar-integrality

**Acceptance**

- The conclusion covers all characters at every odd level greater than one. This is a scalar-integrality classification for the actual tame formal-series constructor, not a principal L-function identity.

**Tests**

- SuggestedDyadicClassificationTests.principal_three_unconditional: The principal modulus-three criterion requires no externally supplied nonprincipal character.
- SuggestedDyadicClassificationTests.principal_nine_unconditional: The principal modulus-nine criterion also has no supplied reference character.
- SuggestedDyadicClassificationTests.arbitrary_character_zero_scalar: For every actual tame character the zero measure lifts the zero scalar multiple.

**Sources**

- RJW-published, Tame kernel and integral coefficients, Theorem5.7, Remark5.8 and Definition5.13, published143–146/PDF44–47; Eisenstein measures and coefficient variation, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in retained tame-series checkpoints. The native quadratic character, its nonprincipality and level-change interfaces were freshly read at the pinned Mathlib commit.. Worker classification of scalar integrality for the existing doubled tame formal-series measure. Native quadratic characters supply the nearby nonprincipal reference required by the previous stability theorem. The exact modulus-one criterion and dyadic half-lift classification are derived here, not quoted from RJW. No source convention for the principal zeta pseudomeasure is identified with the zero tame kernel, and no classical modularity or analytic-family theorem is asserted.

### The exact scalar criterion at tame modulus one

DirichletPadicLFunctions:L4/one-level-tame-scalar-integrality

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_one_level_scalar_lift_iff

Kind: theorem. Implementation: unchecked.

At D=1 and any prime p, an integral all-test scalar lift of sGη exists if and only if ‖2s‖≤1.

**Hypotheses**

- p is any prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. Characteristic zero is not required for this node. η:DirichletCharacter K 1, hD:IsUnit(1:K), and p∤1.
- U=(ℤ_p)ˣ, O is the native norm-valuation integer subring, and E⁺=integralTwistedPositiveEisensteinSeries(p,1,η) is the existing integral positive-series measure. The scalar lift quantifies over actual integral formal-series-valued measures and all O-valued continuous tests.
- The result concerns the actual modulus-one tame constructor whose intrinsic zeta measure is zero. It does not provide the ordinary principal Eisenstein constant or replace the localized principal zeta theory.

**Construction or proof outline**

- Use the promoted intrinsic-integral-tame-one-level theorem to make the constant zero. The promoted doubled-series and positive-series coefficient formulas then give Gη=2E⁺ by native PowerSeries.ext at each test. This derives the needed equality directly from promoted nodes, rather than depending on an unpromoted constructor API.
- For the constant integral test one, the first positive coefficient of E⁺ is one: the only divisor of1 is1, the unit test has value one, and both characters take value one there. This is a direct specialization of the existing finite divisor-Dirac evaluation and coefficient inclusion.
- If M is a scalar lift, extract coefficient one at the constant test. Its included coefficient equals2s. Its membership in O therefore gives ‖2s‖≤1. Complete double_scalar_lift_necessity verifies this native coefficient argument for any measure E with a first coefficient equal to one at an actual test.
- Conversely, the norm bound packages2s as an actual element a∈O. Set M=aE⁺. Coefficient inclusion and commutativity give map_ι(M(f))=s·map_ι(2E⁺(f)) for every test. Complete double_scalar_integral_lift constructs this actual native measure without dividing inside O.
- At p=2 over ℚ₂, s=1/2 is allowed even though s itself is not integral, while s=1/4 is excluded because2s=1/2 has norm2. No exact field norm for2 is needed in the general theorem. The same doubled criterion also holds in positive characteristic if the stated coefficient action exists.

**Prerequisites**

- DirichletPadicLFunctions:L2/intrinsic-integral-tame-one-level
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- Both directions use the actual positive-series measure. The necessary coefficient is degree one, since the true tame modulus-one constant is zero.

**Tests**

- SuggestedDyadicClassificationTests.one_half_lift: The actual modulus-one dyadic family has an integral half on all integral tests.
- SuggestedDyadicClassificationTests.one_quarter_no_lift: Over ℚ₂ its quarter multiple has no such integral lift.
- SuggestedDyadicClassificationTests.one_half_scalar_is_not_integral: The allowed scalar1/2 is not itself integral, while twice it has norm one.

**Sources**

- RJW-published, Tame kernel and integral coefficients, Theorem5.7, Remark5.8 and Definition5.13, published143–146/PDF44–47; Eisenstein measures and coefficient variation, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in retained tame-series checkpoints. The native quadratic character, its nonprincipality and level-change interfaces were freshly read at the pinned Mathlib commit.. Worker classification of scalar integrality for the existing doubled tame formal-series measure. Native quadratic characters supply the nearby nonprincipal reference required by the previous stability theorem. The exact modulus-one criterion and dyadic half-lift classification are derived here, not quoted from RJW. No source convention for the principal zeta pseudomeasure is identified with the zero tame kernel, and no classical modularity or analytic-family theorem is asserted.

### Exactly when a dyadic tame integral half exists

DirichletPadicLFunctions:L4/dyadic-tame-half-classification

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_dyadic_half_lift_iff

Kind: theorem. Implementation: unchecked.

For every η at positive odd tame modulus D, an integral all-test lift of(1/2)Gη exists if and only if D=1.

**Hypotheses**

- D>0 with NeZero D and2∤D. K is a complete nontrivially normed ultrametric field of characteristic zero with Algebra ℤ₂ K and IsBoundedSMul ℤ₂ K. hD:IsUnit(D:K), η:DirichletCharacter K D, U=(ℤ₂)ˣ, and O is the native norm-valuation integer subring of K.
- Gη is the existing integralDoubledTameEisensteinSeries, valued in native PowerSeries O with its coefficientwise topology. An integral scalar lift means an actual M:AbstractMeasure U O (PowerSeries O) whose included value at every actual O-valued continuous test is s times the included value of Gη. No extension to all K-valued tests or norm on formal series is assumed.
- The dyadic statements allow every tame character, principal or nonprincipal and primitive or imprimitive. The modulus D is the given level, not silently replaced by the conductor. The tame modulus-one kernel is zero and is not the ordinary principal zeta pseudomeasure.

**Construction or proof outline**

- If D=1, use the preceding exact modulus-one criterion. Characteristic zero ensures2≠0, hence2·2⁻¹=1 and the required norm is one. Equivalently the existing positive-series measure itself is the integral half.
- If D≠1, the all-character dyadic scalar criterion would force ‖2⁻¹‖≤1. The bounded ℤ₂ action gives ‖2‖≤1/2, while characteristic zero ensures a positive norm. Native multiplicativity of the inverse norm gives ‖2⁻¹‖≥2>1; complete dyadic_half_norm proves precisely this lower bound.
- The two cases are exhaustive at positive odd modulus, so the result is an equivalence with D=1. It covers every principal and nonprincipal character without a primitivity or supplied-reference hypothesis.
- The principal modulus-five and arbitrary modulus-fifteen tests retain composite-level behavior explicitly. The conclusion concerns integrality on every continuous integral test. Arithmetic moments alone cannot certify such a lift, and the theorem makes no assertion of classical modularity.

**Prerequisites**

- DirichletPadicLFunctions:L4/dyadic-all-tame-scalar-integrality
- DirichletPadicLFunctions:L4/one-level-tame-scalar-integrality
- mathlib:norm_smul_le
- mathlib:PadicInt.norm_p

**Acceptance**

- The sole allowed positive odd level is exactly one. The proof keeps the principal tame-zero boundary separate from the source principal pseudomeasure convention.

**Tests**

- SuggestedDyadicClassificationTests.principal_five_no_half: The principal character modulo5 has no all-test integral half at p=2.
- SuggestedDyadicClassificationTests.every_fifteen_no_half: Every actual character modulo15 has the same all-test half obstruction.

**Sources**

- RJW-published, Tame kernel and integral coefficients, Theorem5.7, Remark5.8 and Definition5.13, published143–146/PDF44–47; Eisenstein measures and coefficient variation, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in retained tame-series checkpoints. The native quadratic character, its nonprincipality and level-change interfaces were freshly read at the pinned Mathlib commit.. Worker classification of scalar integrality for the existing doubled tame formal-series measure. Native quadratic characters supply the nearby nonprincipal reference required by the previous stability theorem. The exact modulus-one criterion and dyadic half-lift classification are derived here, not quoted from RJW. No source convention for the principal zeta pseudomeasure is identified with the zero tame kernel, and no classical modularity or analytic-family theorem is asserted.

### Exact scalar integrality of the normalized tame family

DirichletPadicLFunctions:L4/normalized-tame-scalar-integrality

Declaration: DirichletPadic.integralTameEisensteinSeries_scalar_lift_iff

Kind: theorem. Implementation: unchecked.

Under h2:IsUnit(2:O), an integral all-test scalar lift of sNη exists if and only if ‖s‖≤1, at every prime and positive tame level.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. Every character, principal or nonprincipal and primitive or imprimitive, is allowed.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the native carriers. Gη is integralDoubledTameEisensteinSeries. Under h2:IsUnit(2:O), Nη is the existing integralTameEisensteinSeries. Both are actual O-linear continuous measures with target PowerSeries O and its coefficientwise topology.
- An integral scalar lift means M:AbstractMeasure U O (PowerSeries O) such that map_ι(M(f))=s•map_ι(Gη(f)), or the corresponding equality for Nη, for every actual O-valued continuous test f. No coefficient extension to all K-valued tests and no norm on formal series is introduced.
- The normalized-family criterion requires h2 and does not require characteristic zero. The all-prime doubled criterion and half-lift classification require CharZero K, as their dyadic branch uses the preceding characteristic-zero results. The modulus-one tame kernel remains zero, not the source principal pseudomeasure convention.

**Construction or proof outline**

- Evaluate the promoted doubled coefficient formula at degree one on the constant integral test one. The finite positive divisor sum contains only d=1, both character values are one, and the test value is one. Therefore coeff₁Gη(1)=2 in O, independently of η and D.
- Unfold only the scalar definition Nη=(↑h2.unit⁻¹)•Gη and use native coeff_smul. The native unit identity h2.mul_val_inv cancels two and gives coeff₁Nη(1)=1. Complete normalized_first_coefficient proves this exact step on any actual native measure with the given doubled first coefficient; it needs no unpromoted coefficient API as a prerequisite.
- If M lifts sNη, extract degree one at this test. The included coefficient is s and has norm at most one by membership in the actual integer subring. Complete scalar_lift_necessity proves the more general argument at any coefficient whose included value has norm one.
- Conversely package s as an actual element of O and multiply the existing Nη by it. Complete scalar_integral_lift constructs the native measure and proves its all-test coefficient inclusion. Complete scalar_lift_iff_of_unit_coefficient assembles both directions.
- The criterion is independent of the constant term, so it includes principal characters and D=1. For p=3, the scalar1/3 fails even for the principal modulus-four normalized family. No characteristic-zero hypothesis is required beyond the unit certificate and existing constructor hypotheses.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-normalized-tame-series
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:IsUnit.mul_val_inv
- mathlib:PowerSeries.coeff_smul
- mathlib:PowerSeries.coeff_map
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply

**Acceptance**

- The first coefficient supplies necessity on an actual integral test. Sufficiency constructs a continuous O-linear measure; no assumption about the constant or a nonprincipal character is hidden.

**Tests**

- SuggestedAllPrimeScalarTests.normalized_first_unit: The first coefficient of Nη at test one is exactly one.
- SuggestedAllPrimeScalarTests.normalized_zero_scalar: The zero measure is an integral lift of the zero scalar multiple.
- SuggestedAllPrimeScalarTests.normalized_third_no_lift: Over ℚ₃, the principal modulus-four normalized family has no integral all-test lift after multiplication by1/3.

**Sources**

- RJW-published, Tame kernel and integral coefficients, Theorem5.7, Remark5.8 and Definition5.13, published143–146/PDF44–47; Eisenstein coefficient measures, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in retained checkpoints. Native valuation-integer unit norms and the existing normalization proof were freshly checked.. Worker completion of the scalar-integrality and half-normalization criteria for the actual tame formal-series family. First positive coefficients handle odd primes, while the preceding actual unit-test argument handles the dyadic obstruction. These criteria are derived consequences, not quoted source statements. The zero tame modulus-one constructor remains distinct from the principal zeta pseudomeasure; no classical modularity or analytic-family theorem is inferred.

### The scalar-integrality criterion at every prime

DirichletPadicLFunctions:L4/all-prime-tame-scalar-integrality

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_all_prime_scalar_lift_iff

Kind: theorem. Implementation: unchecked.

Assume CharZero K. An integral all-test scalar lift of sGη exists if and only if ‖2s‖≤1 when D=1, and if and only if ‖s‖≤1 when D≠1.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. Every character, principal or nonprincipal and primitive or imprimitive, is allowed.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the native carriers. Gη is integralDoubledTameEisensteinSeries. Under h2:IsUnit(2:O), Nη is the existing integralTameEisensteinSeries. Both are actual O-linear continuous measures with target PowerSeries O and its coefficientwise topology.
- An integral scalar lift means M:AbstractMeasure U O (PowerSeries O) such that map_ι(M(f))=s•map_ι(Gη(f)), or the corresponding equality for Nη, for every actual O-valued continuous test f. No coefficient extension to all K-valued tests and no norm on formal series is introduced.
- The normalized-family criterion requires h2 and does not require characteristic zero. The all-prime doubled criterion and half-lift classification require CharZero K, as their dyadic branch uses the preceding characteristic-zero results. The modulus-one tame kernel remains zero, not the source principal pseudomeasure convention.

**Construction or proof outline**

- If D=1, use the exact modulus-one scalar criterion already proved at every prime. Its zero constant and first positive coefficient two are retained; it is not replaced by a nonprincipal theorem.
- Suppose D≠1. If p=2, apply the complete dyadic all-character scalar criterion. It supplies its own native nearby quadratic reference for a principal character and therefore covers every η without an external reference assumption.
- If p≠2, obtain IsUnit(2:ℤ_p) from the native p-adic unit/norm criterion and Nat.coprime_primes. The bounded coefficient algebra map has values in O, so its native codRestrict maps this unit to h2:IsUnit(2:O). Complete algebra_image_integral and odd_prime_two_isUnit verify the actual map and certificate, with no extra ℤ_p-algebra on O.
- The actual norm-valuation integer ring satisfies Valuation.integer.integers. Native Integers.one_of_isUnit therefore says the included unit2 has valuation one, hence norm one. Complete integer_unit_norm proves this for every O-unit, and odd_prime_two_norm specializes it to two at every odd prime; no isometric ℚ_p embedding is assumed.
- The doubled first coefficient on test one is2 by the promoted coefficient and finite divisor-Dirac formulas. Its included norm is one, so complete scalar_lift_iff_of_unit_coefficient gives the exact criterion ‖s‖≤1 in the odd-prime branch. This branch works for principal and imprimitive characters and never invokes a nonprincipal finite-residue formula.
- The cases D=1, D≠1 with p=2, and D≠1 with p≠2 are exhaustive. The result is a single criterion for the actual full doubled family. At odd p the first branch also simplifies to ‖s‖≤1 because two has norm one; the displayed doubled form records the genuine dyadic modulus-one exception.

**Prerequisites**

- DirichletPadicLFunctions:L4/one-level-tame-scalar-integrality
- DirichletPadicLFunctions:L4/dyadic-all-tame-scalar-integrality
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L4/integral-twisted-positive-eisenstein-coefficient
- DirichletPadicLFunctions:L4/twisted-positive-eisenstein-evaluation
- mathlib:PadicInt.isUnit_iff
- mathlib:PadicInt.norm_natCast_eq_one_iff
- mathlib:Nat.coprime_primes
- mathlib:RingHom.codRestrict
- mathlib:IsUnit.map
- mathlib:norm_smul_le
- mathlib:PadicInt.norm_le_one
- mathlib:Valuation.integer.integers
- mathlib:Valuation.Integers.one_of_isUnit
- mathlib:Valuation.mem_integer_iff
- mathlib:NormedField.valuation_apply
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul

**Acceptance**

- All positive tame levels and primes are covered with the explicit D=1 exception. The coefficient field action is bounded, with no unstated norm isometry.

**Tests**

- SuggestedAllPrimeScalarTests.triadic_principal_scalar: At p=3 the principal modulus-four scalar criterion is ‖s‖≤1.
- SuggestedAllPrimeScalarTests.triadic_one_level_scalar: At p=3 the modulus-one criterion also simplifies to ‖s‖≤1.
- SuggestedAllPrimeScalarTests.quintic_any_character_scalar: At p=5 every character at tame modulus6 has the same scalar criterion.

**Sources**

- RJW-published, Tame kernel and integral coefficients, Theorem5.7, Remark5.8 and Definition5.13, published143–146/PDF44–47; Eisenstein coefficient measures, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in retained checkpoints. Native valuation-integer unit norms and the existing normalization proof were freshly checked.. Worker completion of the scalar-integrality and half-normalization criteria for the actual tame formal-series family. First positive coefficients handle odd primes, while the preceding actual unit-test argument handles the dyadic obstruction. These criteria are derived consequences, not quoted source statements. The zero tame modulus-one constructor remains distinct from the principal zeta pseudomeasure; no classical modularity or analytic-family theorem is inferred.

### Exactly when the tame family has an integral half

DirichletPadicLFunctions:L4/all-prime-tame-half-classification

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_half_lift_iff

Kind: theorem. Implementation: unchecked.

Assume CharZero K. An integral all-test lift of(1/2)Gη exists if and only if p≠2 or D=1.

**Hypotheses**

- p is prime. K is a complete nontrivially normed ultrametric field with Algebra ℤ_p K and IsBoundedSMul ℤ_p K. D>0 with NeZero D, η:DirichletCharacter K D, hD:IsUnit(D:K), and p∤D. Every character, principal or nonprincipal and primitive or imprimitive, is allowed.
- U=(ℤ_p)ˣ and O=Valuation.integer(NormedField.valuation(K)) are the native carriers. Gη is integralDoubledTameEisensteinSeries. Under h2:IsUnit(2:O), Nη is the existing integralTameEisensteinSeries. Both are actual O-linear continuous measures with target PowerSeries O and its coefficientwise topology.
- An integral scalar lift means M:AbstractMeasure U O (PowerSeries O) such that map_ι(M(f))=s•map_ι(Gη(f)), or the corresponding equality for Nη, for every actual O-valued continuous test f. No coefficient extension to all K-valued tests and no norm on formal series is introduced.
- The normalized-family criterion requires h2 and does not require characteristic zero. The all-prime doubled criterion and half-lift classification require CharZero K, as their dyadic branch uses the preceding characteristic-zero results. The modulus-one tame kernel remains zero, not the source principal pseudomeasure convention.

**Construction or proof outline**

- For p≠2, the native unit certificate supplies the existing integral normalized measure Nη. Its promoted coefficient-image comparison identifies it with the field half of Gη on every actual integral test. This constructs the required lift.
- For p=2, the preceding exact dyadic half-lift classification says such a measure exists precisely at D=1. That positive-series lift and the obstruction at every larger odd level remain unchanged.
- Combine the prime cases to obtain the stated equivalence. Equivalently, substitute s=2⁻¹ in the all-prime scalar criterion: at D=1 the norm of2s is one, at odd primes the inverse of two is an integral unit, and at p=2,D>1 its norm is at least two.
- When D≠1 this simplifies to existence if and only if p≠2. The statement concerns the given tame level and the actual full formal-series measure, not merely its arithmetic specializations. It supplies no ordinary principal zeta constant or classical modular-form existence theorem.

**Prerequisites**

- DirichletPadicLFunctions:L4/all-prime-tame-scalar-integrality
- DirichletPadicLFunctions:L4/dyadic-tame-half-classification
- DirichletPadicLFunctions:L4/integral-normalized-tame-series
- DirichletPadicLFunctions:L4/integral-normalized-tame-map

**Acceptance**

- The existence direction gives an actual existing measure. The obstruction is all-test integrality, and the sole dyadic exception is precisely the zero-constant tame level-one constructor.

**Tests**

- SuggestedAllPrimeScalarTests.nontrivial_level_half_iff_odd: At any tame modulus greater than one, existence of an all-test integral half is equivalent to p≠2.
- SuggestedAllPrimeScalarTests.triadic_half_exists: Every character modulo4 admits an integral half at p=3.
- SuggestedAllPrimeScalarTests.dyadic_one_half_exists: At p=2 the modulus-one positive-series measure is the integral half.
- SuggestedAllPrimeScalarTests.dyadic_three_half_fails: The principal modulus-three dyadic family has no integral half.

**Sources**

- RJW-published, Tame kernel and integral coefficients, Theorem5.7, Remark5.8 and Definition5.13, published143–146/PDF44–47; Eisenstein coefficient measures, Theorem8.2 and Remark8.3, published159–161/PDF60–62. Whole passages read in retained checkpoints. Native valuation-integer unit norms and the existing normalization proof were freshly checked.. Worker completion of the scalar-integrality and half-normalization criteria for the actual tame formal-series family. First positive coefficients handle odd primes, while the preceding actual unit-test argument handles the dyadic obstruction. These criteria are derived consequences, not quoted source statements. The zero tame modulus-one constructor remains distinct from the principal zeta pseudomeasure; no classical modularity or analytic-family theorem is inferred.

### Full tame arithmetic q-expansion through a common field

DirichletPadicLFunctions:L4/tame-full-arithmetic-common-series

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_common_series

Kind: comparison. Implementation: unchecked.

The explicit full series Q satisfies map(ιK)(Q)=2⁻¹·map(ι)(G). This includes the actual constant coefficient and every positive coefficient, for all t,e≥0 and nonprincipal η at its given tame level.

**Hypotheses**

- p is any prime, F is a characteristic-zero field with a rational algebra structure and separate embeddings ιC:F→ℂ and ιK:F→K. K is a complete nontrivially normed ultrametric characteristic-zero field with bounded ℤ_p-algebra action. O is its native norm-valuation integer ring and ι:O→K its inclusion.
- D is positive and prime to p, its image in K has the supplied unit certificate, and η:F-valued DirichletCharacter D is nonprincipal. χ has its given level p^t, t≥0. Set N=D p^t and θ=changeLevel(η)·changeLevel(χ) at exactly N. No primitive inducing character is silently substituted.
- e≥0 is the arithmetic exponent, w=e+1 the modular weight. Let c=−N^e/(2(e+1)) Σ_(a:ZMod N) θ(a)B_(e+1)(a.val/N) in F, using the native Bernoulli polynomial and rational embedding. This is notation for a finite expression, not a second generalized-Bernoulli constructor.
- Write A(q)=Σ_(m>0)(Σ_(d|m,p∤d)θ(d)d^e)q^m, implemented literally with PowerSeries.mk and the native empty divisor set at0. Its coefficients are the existing native twistedDivisorSum with left level1 after the existing right Euler deletion. Set Q=C((1−θ(p)p^e)c)+A.
- G is the actual integralDoubledTameEisensteinSeries(η_K) at the existing integral arithmetic test κ^O_(t,χ_K,e). The half is formed only after mapping O[[q]] to K[[q]]. It is not asserted to be integral for every dyadic test.

**Construction or proof outline**

- The existing common-constant theorem identifies coeff₀(G), included in K, with ιK(b), where b=(1−θ(p)p^e)(−N^e/(e+1))Σ_aθ(a)B_(e+1)(a.val/N). Native field arithmetic gives b=2(1−θ(p)p^e)c. The complete bernoulli_constant_map and doubled_bernoulli_constant lemmas check coefficient transport and this exact factor.
- At m>0, the doubled-family coefficient theorem gives twice the existing positive measure. Its arithmetic-moment formula is the p-prime divisor sum with η(d)χ(d). For d coprime toN, both level changes evaluate to the original character values by the native unit-cast theorem. Otherwise d is nonunit at at least one original factor level; that character value and the product-level character both vanish. This proves θ(d)=η(d)χ(d) without incorrectly applying changeLevel evaluation to a nonunit. The same unit/nonunit argument identifies the native lcm-level product on every natural argument; no equality of dependent character types is required.
- Apply the native right Euler-deletion comparison if expressing this finite sum using twistedDivisorSum. The left character is modulus1. The displayed signature keeps the literal existing coefficient formula, rather than defining another arithmetic function or requiring a substitute compiled TwistedDivisorSum.
- At m=0 the native divisor set is empty. Complete full_series_from_coefficients combines the separately proved constant and positive formulas by PowerSeries.ext, coeff_map and coeff_smul. Invert2 in K, where characteristic zero proves it nonzero; no division in O is used.
- At positive wild level θ(p)=0, so the explicit Euler factor is1. For an imprimitive principal wild character, the Bernoulli value at levelN already contains the removed p-factor; returning to a primitive inducing character without restoring it would change the answer.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-common-constant
- DirichletPadicLFunctions:L4/integral-doubled-tame-eisenstein-coeff
- DirichletPadicLFunctions:L4/integral-twisted-series-arithmetic-moment
- DirichletPadicLFunctions:L4/integral-twisted-series-native-arithmetic-moment
- mathlib:PowerSeries.ext
- mathlib:PowerSeries.coeff_map
- mathlib:PowerSeries.coeff_smul
- mathlib:Nat.divisors_zero

**Acceptance**

- The result is an identity with the existing actual integral family after scalar inclusion, not merely a freely chosen constant appended to a positive series. No modularity or geometric family is asserted.

**Tests**

- SuggestedFullTameComparisonTests.retained_series_has_zero_constant: The literal retained divisor series has constant0.
- SuggestedFullTameComparisonTests.constant_retains_euler_factor: The full explicit series has constant(1−θ(p)p^e)c.
- SuggestedFullTameComparisonTests.first_retained_coefficient_is_one: The first retained coefficient equals1 for every prime and native character.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161; Definitions5.9/5.13 and Theorem5.14, published143–146, whole pages read in4793 and retained.. Worker-derived tame-character extension. The existing common Bernoulli constant and positive moments are assembled with separate coefficient embeddings. The source does not itself construct the general primitive character modular form required by the application.

### Full comparison with a supplied tame classical form

DirichletPadicLFunctions:L4/tame-actual-classical-full-comparison

Declaration: DirichletPadic.integralDoubledTameEisensteinSeries_classical_full

Kind: comparison. Implementation: unchecked.

For an actual f:ModularForm(Γ₁(M),e+1), M>0, with a₀(f)=ιC(c) and a_m(f)=ιC(Σ_(d|m)θ(d)d^e) for m>0, let g=ofLe(f)−ιC(θ(p)p^e)·levelRaise(p,f) at Γ₁(pM). There is a unique Q∈F[[q]] with map(ιC)(Q)=qExpansion(g) and map(ιK)(Q)=2⁻¹·map(ι)(G).

**Hypotheses**

- p is any prime, F is a characteristic-zero field with a rational algebra structure and separate embeddings ιC:F→ℂ and ιK:F→K. K is a complete nontrivially normed ultrametric characteristic-zero field with bounded ℤ_p-algebra action. O is its native norm-valuation integer ring and ι:O→K its inclusion.
- D is positive and prime to p, its image in K has the supplied unit certificate, and η:F-valued DirichletCharacter D is nonprincipal. χ has its given level p^t, t≥0. Set N=D p^t and θ=changeLevel(η)·changeLevel(χ) at exactly N. No primitive inducing character is silently substituted.
- e≥0 is the arithmetic exponent, w=e+1 the modular weight. Let c=−N^e/(2(e+1)) Σ_(a:ZMod N) θ(a)B_(e+1)(a.val/N) in F, using the native Bernoulli polynomial and rational embedding. This is notation for a finite expression, not a second generalized-Bernoulli constructor.
- Write A(q)=Σ_(m>0)(Σ_(d|m,p∤d)θ(d)d^e)q^m, implemented literally with PowerSeries.mk and the native empty divisor set at0. Its coefficients are the existing native twistedDivisorSum with left level1 after the existing right Euler deletion. Set Q=C((1−θ(p)p^e)c)+A.
- G is the actual integralDoubledTameEisensteinSeries(η_K) at the existing integral arithmetic test κ^O_(t,χ_K,e). The half is formed only after mapping O[[q]] to K[[q]]. It is not asserted to be integral for every dyadic test.

**Construction or proof outline**

- The supplied positive and constant formulas identify qExpansion(f) with the image of C(c)+Fθ, where Fθ denotes the existing native divisor-coefficient series. The complete positive_formula_determines_full_series verifies the all-index assembly.
- Use the existing bundled Γ₁ inclusion and levelRaise, together with the native period1 and qExpansion linearity laws. Their actual bundled q-expansion identity was proved completely in retained4780/ClassicalComparisonProbe; it is reused, not replaced by an assumed modularity witness.
- Expand the full formal expression. Native expand preserves constants, so its constant becomes(1−θ(p)p^e)c and the positive part is the existing retained divisor series. Complete euler_full_constant verifies the constant split over every commutative ring.
- The preceding common-series node identifies the K-image with the actual half of G, including its previously constructed constant measure. This removes the freely supplied p-adic constant of the earlier fixed-weight comparison: the only remaining classical input is f with its two exact coefficient formulas.
- The injective complex coefficient embedding makes the common series unique, by native PowerSeries.map_injective. Complete common_series_unique checks this uniqueness without requiring any relation between the complex and p-adic topologies.
- At p=2,D=3, the nontrivial quadratic η, t=0 and weight3, c=−1/9 and the full stabilized constant is−5/9. Retaining c itself would miss the Euler factor5.

**Prerequisites**

- DirichletPadicLFunctions:L4/tame-full-arithmetic-common-series
- DirichletPadicLFunctions:L4/integral-twisted-classical-full-comparison
- mathlib:PowerSeries.map_injective
- mathlib:PowerSeries.expand_C
- mathlib:PowerSeries.C

**Acceptance**

- The theorem is conditional on an actual bundled classical form and exact coefficient formulas. It makes no existence assertion at weights1 or2 or for imprimitive characters.

**Tests**

- SuggestedFullTameComparisonTests.common_series_uniqueness_uses_one_embedding: Equality after the complex embedding determines the common F-series uniquely.
- SuggestedFullTameComparisonTests.dyadic_tame_cubic_constant: At the stated dyadic cubic example the constant is−5/9.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and Remark8.3, published159–161; Definitions5.9/5.13 and Theorem5.14, published143–146, whole pages read in4793 and retained.. Worker-derived tame-character extension. The existing common Bernoulli constant and positive moments are assembled with separate coefficient embeddings. The source does not itself construct the general primitive character modular form required by the application.
- Stein-Eisenstein-online, Explicit Basis for the Eisenstein Subspace, equation(4), its following constant formula, and Theorem5.8 restricted to weight≥3; Definition5.1 for the Bernoulli convention. Read30September2026.. The left character is the primitive level-one character and the right character is θ, so the constant is −B_(w,θ)/(2w). Only weight≥3 is used in the existence application. The existing ModularForms Layer0 owns construction and its Gauss/Fourier translation; weight1, the weight2 trivial-pair correction and arbitrary imprimitive modular existence are not imported by this request.

### Uniform precision of unit powers

DirichletPadicLFunctions:L4/unit-power-totient-precision

Declaration: DirichletPadic.unitPower_totient_precision

Kind: lemma. Implementation: unchecked.

For every k,n≥0, ‖j_(k+(p−1)pⁿ)−j_k‖≤p^(−(n+1)).

**Hypotheses**

- p is any prime, U=(ℤ_p)ˣ with its native compact topology. For e≥0 write j_e∈C(U,ℚ_p) for u↦(u:ℚ_p)^e. All norms of tests are the native supremum norm.

**Construction or proof outline**

- Map each actual unit u to (ℤ/p^(n+1)ℤ)ˣ using Units.map(PadicInt.toZModPow). ZMod.pow_totient and Nat.totient_prime_pow_succ give u^((p−1)pⁿ)=1 after reduction.
- Multiplication by u^k shows u^(k+(p−1)pⁿ)−u^k lies in ker(toZModPow(n+1)). Rewrite this kernel as the ideal generated by p^(n+1).
- PadicInt.norm_le_pow_iff_mem_span_pow gives the pointwise bound; PadicInt.norm_def preserves it under ℤ_p→ℚ_p. ContinuousMap.norm_le converts the uniform pointwise bound into the supremum-norm bound. This uses no Teichmüller splitting.

**Prerequisites**

- mathlib:ZMod.pow_totient
- mathlib:Nat.totient_prime_pow_succ
- mathlib:PadicInt.toZModPow
- mathlib:PadicInt.ker_toZModPow
- mathlib:PadicInt.norm_le_pow_iff_mem_span_pow
- mathlib:PadicInt.norm_def
- mathlib:ContinuousMap.norm_le

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Tests**

- SuggestedEisensteinTargetTests.dyadic_uniform_precision: For p=2, k=0, n=2, the test u↦u⁴−1 has supremum norm at most1/8.
- SuggestedEisensteinTargetTests.odd_torsion_retained: At p=3,u=−1,k=0,n=2, u^18−1=0.
- SuggestedEisensteinTargetTests.wrong_component_fails: At p=3,u=−1 the sequence u^(3ⁿ) is constantly−1, and never tends to1.

**Sources**

- RJW-published, Published §8, printed159 / physicalPDF60, non-interpolation argument; complete pp.158–161 freshly read 4October2026.. Decomposition of the corrected argument recorded as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E53. Use the explicit sequence k+(p−1)pⁿ and uniform convergence in the continuous-test norm; include p=2 without a cyclic-unit assumption.

### Convergence within a fixed weight component

DirichletPadicLFunctions:L4/unit-power-sequence-convergence

Declaration: DirichletPadic.unitPower_sequence_tendsto

Kind: lemma. Implementation: unchecked.

For each k≥0 the sequence j_(k+(p−1)pⁿ) tends to j_k in C(U,ℚ_p).

**Hypotheses**

- p is any prime, U=(ℤ_p)ˣ with its native compact topology. For e≥0 write j_e∈C(U,ℚ_p) for u↦(u:ℚ_p)^e. All norms of tests are the native supremum norm.

**Construction or proof outline**

- The preceding uniform bound tends to zero because p>1. Apply the metric characterization of convergence to the norm of the difference.
- The exponents are all congruent to k modulo p−1, tend to k in ℤ_p, and tend to infinity as natural numbers. The specified sequence handles the dyadic case as well. Mere p-adic convergence of arbitrary exponents is not substituted for the fixed-component assertion.

**Prerequisites**

- DirichletPadicLFunctions:L4/unit-power-totient-precision
- mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Sources**

- RJW-published, Published §8, printed159 / physicalPDF60, non-interpolation argument; complete pp.158–161 freshly read 4October2026.. Decomposition of the corrected argument recorded as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E53. Use the explicit sequence k+(p−1)pⁿ and uniform convergence in the continuous-test norm; include p=2 without a cyclic-unit assumption.

### No unit measure interpolates prime powers

DirichletPadicLFunctions:L4/prime-power-moments-impossible

Declaration: DirichletPadic.not_exists_primePower_moments

Kind: theorem. Implementation: unchecked.

There is no μ∈AbstractMeasure U ℚ_p ℚ_p with μ(j_e)=(p:ℚ_p)^e for every e≥0.

**Hypotheses**

- p is any prime, U=(ℤ_p)ˣ with its native compact topology. For e≥0 write j_e∈C(U,ℚ_p) for u↦(u:ℚ_p)^e. All norms of tests are the native supremum norm.

**Construction or proof outline**

- Apply continuity of the native continuous linear functional AbstractMeasure.toCLMEquiv μ to the preceding convergence with k=0. Its values would tend to μ(1)=1.
- The alleged moments on the same sequence are p^((p−1)pⁿ). Since ‖p‖=p⁻¹<1 and (p−1)pⁿ tends to infinity, these values tend to0 by the native power-limit theorem.
- Uniqueness of limits in ℚ_p gives1=0, contradicting the field structure. Thus deletion of p-divisible divisors is essential, rather than a choice of an unavailable Dirac mass at p.

**Prerequisites**

- DirichletPadicLFunctions:L4/unit-power-sequence-convergence
- mathlib:AbstractMeasure.toCLMEquiv
- mathlib:Padic.norm_p_lt_one
- mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Sources**

- RJW-published, Published §8, printed159 / physicalPDF60, non-interpolation argument; complete pp.158–161 freshly read 4October2026.. Decomposition of the corrected argument recorded as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E53. Use the explicit sequence k+(p−1)pⁿ and uniform convergence in the continuous-test norm; include p=2 without a cyclic-unit assumption.

### The principal tame Eisenstein family

DirichletPadicLFunctions:L4/principal-tame-eisenstein-series

Declaration: DirichletPadic.principalTameEisensteinAwaySeries

Kind: construction. Implementation: unchecked.

Define E_(a,D)=Σ_(T⊆P)(−1)^|T| C(i_a(δ_(u_T)))·expand_(d_T)(E_a) in the native S_a[[q]]. This finite Euler deletion retains exactly the divisors prime to pD.

**Hypotheses**

- p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.
- D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.
- Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.

**Construction or proof outline**

- The native prime-factor finset has no repetition. Its subset product is positive and divides D; hence its ℤ_p image is a unit. Use that actual unit and the existing native Dirac measure, independent of its membership certificate.
- Apply native PowerSeries.expand at the positive integer d_T, multiply by the constant series of the indicated coefficient and sum over P.powerset. This is a finite algebraic construction on E_a; there is no convergence assumption or new completed-algebra carrier.
- For D=1 the powerset contains only the empty subset and δ_1 is the convolution identity, so E_(a,1)=E_a. Since the definition depends only on primeFactors(D), repeated prime factors have no additional effect.
- The coefficient and specialization lemmas below identify the retained divisor measures and the Euler-deleted constant. The construction uses the localized constant, which may fail integral ordinary-pseudomeasure membership.

**Prerequisites**

- DirichletPadicLFunctions:L4/full-eisenstein-away-series
- DirichletPadicLFunctions:L4/eisenstein-away-constant
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- PadicMeasuresIwasawaAlgebras:L1/commutative-convolution
- mathlib:PowerSeries.expand
- mathlib:PowerSeries.C
- mathlib:AbstractMeasure.dirac

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**API**

- DirichletPadic.principalTameEisensteinAwaySeries_def: The series equals the displayed finite subset sum.
- DirichletPadic.principalTameEisensteinAwaySeries_one: At D=1 it equals E_a, including its actual localized constant.
- DirichletPadic.principalTameEisensteinAwaySeries_primeFactors: Equal prime-factor sets give equal series, under the stated positivity and coprimality hypotheses.
- DirichletPadic.principalTameEisensteinAwaySeries_coeff_pos: For n>0 its coefficient is i_a(Σ_(d|n,gcd(d,pD)=1)δ_(u(d))). Promoted below.
- DirichletPadic.principalTameEisensteinAwaySeries_constant: The constant is (∏_(ℓ∈P)(1−i_a(δ_(u(ℓ)))))A₀,a. Promoted below.

**Tests**

- SuggestedEisensteinTargetTests.principal_level_one_keeps_constant: D=1 returns E_a, not the zero-constant level-one tame kernel.
- SuggestedEisensteinTargetTests.principal_repeated_prime: For p=2, tame levels3 and9 give the same principal family.
- SuggestedEisensteinTargetTests.principal_first_coefficient: For every allowed D the first coefficient is1 in S_a.

**Uses**

- L4 principal tame-character specialization: Supplies the constant missing from the level-one-zero tame kernel.
- L4 integral q-expansion congruences: Finite Euler operators commute with clearing and preserve integral coefficient formulas.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.. Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.

### Tame Euler deletion of positive coefficients

DirichletPadicLFunctions:L4/principal-tame-positive-coefficients

Declaration: DirichletPadic.principalTameEisensteinAwaySeries_coeff_pos

Kind: lemma. Implementation: unchecked.

For n>0, coeff_n(E_(a,D))=i_a(Σ_(d|n,gcd(d,pD)=1)δ_(u(d))).

**Hypotheses**

- p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.
- D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.
- Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.

**Construction or proof outline**

- Use the native coefficient formula for expand and C-multiplication on each subset term. A summand contributes only when d_T divides n.
- The original positive coefficient formula and convolution δ_(u_T)δ_(u(b))=δ_(u(d_Tb)) reindex each contributing pair by the divisor d=d_Tb of n.
- For each fixed p-prime divisor d, the signed subset sum ranges over prime factors of D dividing d. It is the product of 1−1 over those primes: it is1 exactly when gcd(d,D)=1 and0 otherwise. This proves the displayed finite sum, retaining the native unit rather than its residue representative.

**Prerequisites**

- DirichletPadicLFunctions:L4/principal-tame-eisenstein-series
- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- DirichletPadicLFunctions:L4/positive-eisenstein-measure
- PadicMeasuresIwasawaAlgebras:L1/convolution-dirac
- mathlib:PowerSeries.coeff_expand

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.. Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.

### The principal tame localized constant

DirichletPadicLFunctions:L4/principal-tame-constant

Declaration: DirichletPadic.principalTameEisensteinAwaySeries_constant

Kind: lemma. Implementation: unchecked.

coeff₀(E_(a,D))=(∏_(ℓ∈P)(1−i_a(δ_(u(ℓ)))))A₀,a.

**Hypotheses**

- p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.
- D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.
- Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.

**Construction or proof outline**

- Every expand_(d_T) preserves coefficient zero because d_T>0. Pull A₀,a out of the finite sum.
- Use the actual Dirac multiplication law to write δ_(u_T) as the product of the δ_(u(ℓ)). The finite distributive expansion of ∏(1−i_a(δ_(u(ℓ)))) is exactly the signed subset sum.
- The factor is1 when D=1. There is no division by2 inside ℤ_p and no claim that the displayed constant is an integral measure.

**Prerequisites**

- DirichletPadicLFunctions:L4/principal-tame-eisenstein-series
- DirichletPadicLFunctions:L4/full-eisenstein-away-coefficients
- PadicMeasuresIwasawaAlgebras:L1/convolution-dirac
- mathlib:PowerSeries.constantCoeff_expand

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.. Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.

### Ordinary arithmetic values of the principal tame constant

DirichletPadicLFunctions:L4/principal-tame-ordinary-constant

Declaration: DirichletPadic.principalTameEisensteinAwaySeries_constant_moment

Kind: lemma. Implementation: unchecked.

For canonical a with value p+1 and e≥0, the actual evaluator E_(a,e) sends coeff₀(E_(a,D)) to −(1−p^e)B_(e+1)/(2(e+1))·∏_(ℓ∈P)(1−ℓ^e), viewed in ℚ_p.

**Hypotheses**

- p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.
- D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.
- Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.
- The evaluator is the already constructed eisensteinAwayMoment, and all rational expressions are mapped directly to ℚ_p.

**Construction or proof outline**

- Map the preceding product formula through the existing ring homomorphism E_(a,e). The inherited integral-evaluation theorem and Dirac evaluation send i_a(δ_(u(ℓ))) to ℓ^e.
- Apply eisenstein-away-constant-value to A₀,a and multiply by the finite Euler factors. No character evaluation on the entire total quotient ring is used.
- At p=2,D=3,e=3 the value is(−7/240)(1−27)=91/120. At D=1 recover−7/240; neither is replaced by zero.

**Prerequisites**

- DirichletPadicLFunctions:L4/principal-tame-constant
- DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation
- DirichletPadicLFunctions:L4/eisenstein-away-constant-value
- mathlib:AbstractMeasure.dirac_apply

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Tests**

- SuggestedEisensteinTargetTests.principal_dyadic_cubic_constant: At p=2,D=3 and arithmetic exponent3 the constant is91/120 in ℚ₂.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.. Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.

### Classical comparison of principal tame Euler deletion

DirichletPadicLFunctions:L4/principal-tame-classical-comparison

Declaration: DirichletPadic.principalTameEisensteinAwaySeries_classical

Kind: comparison. Implementation: unchecked.

For every even w≥4 and canonical a, there is an actual g_D∈ModularForm(Γ₀(pD),w) whose value at z is Σ_(T⊆P)(−1)^|T|d_T^(w−1)·pStabilizedEisenstein(p,w)(d_Tz). Its q-expansion and the specialization of E_(a,D) at x^(w−1) are the separate complex and p-adic images of one unique rational power series.

**Hypotheses**

- p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.
- D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.
- Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.

**Construction or proof outline**

- For each T, d_T>0 and d_T divides D. Apply the native levelRaise to the existing modular form at Γ₀(p), then the native subgroup inclusion from Γ₀(pD) into Γ₀(pd_T). Sum with the displayed rational scalar. This constructs an actual modular form and does not invoke an imprimitive Eisenstein existence assertion.
- Native level-raising q-expansions turn the finite sum into Σ_T(−1)^|T|d_T^(w−1)expand_(d_T)(F), where F is the unique rational series already supplied by full-eisenstein-common-series.
- Map the constructor’s finite subset formula through the existing admissible moment homomorphism. Dirac evaluation gives d_T^(w−1), and native map_expand commutes with both coefficient embeddings. The resulting p-adic series is the same rational expression.
- Uniqueness follows from injectivity of the rational-to-complex coefficient map. At D=1 recover the original actual p-stabilization and common rational series, including the constant.

**Prerequisites**

- DirichletPadicLFunctions:L4/principal-tame-eisenstein-series
- DirichletPadicLFunctions:L4/full-eisenstein-common-series
- DirichletPadicLFunctions:L4/eisenstein-away-integral-evaluation
- tauceti:TauCeti.ModularForm.levelRaise
- tauceti:TauCeti.ModularForm.qExpansion_levelRaise
- tauceti:ModularForm.ofLe
- tauceti:TauCeti.Gamma0_map_le_conjAct_scaleGL
- mathlib:PowerSeries.map_expand
- mathlib:PowerSeries.map_injective
- tauceti:CongruenceSubgroup.Gamma0_le_Gamma0_of_dvd

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.. Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.

### Integral precision of the principal tame family

DirichletPadicLFunctions:L4/principal-tame-cleared-congruence

Declaration: DirichletPadic.principalTameEisensteinAwaySeries_cleared_congr

Kind: theorem. Implementation: unchecked.

For canonical a, put F_(e,D)=map(E_(a,e))(E_(a,D)) and Δ_e=2(a^(e+1)−1) in ℚ_p. If r≥1 and e≡e′ modulo p^(r−1)(p−1), then every q-coefficient of Δ_e′F_(e′,D)−Δ_eF_(e,D) has norm at most p^(−r).

**Hypotheses**

- p is any prime. Z=ℤ_p, U=Zˣ and M=AbstractMeasure U Z Z carry the existing commutative convolution algebra. For a∈U let S_a=Localization.Away(2·eisensteinTwistedDenominator(p,a)) and i_a:M→S_a be its canonical map.
- D>0 and p∤D. Let P be the native finite set of prime divisors of D. For T⊆P put d_T=∏ℓ∈T ℓ and let u_T∈U have underlying value d_T. Empty products are1. Every d_T is prime to p, so its native unit exists.
- Use E_a=eisensteinAwaySeries(p,a), A₀,a=eisensteinAwayConstant(p,a) and the existing positive coefficient measures. No principal tame kernel of L2 is identified with this localized zeta family.

**Construction or proof outline**

- The constructor and Dirac evaluation express Δ_eF_(e,D) as the finite sum Σ_T(−1)^|T|d_T^e expand_(d_T)(N_e), where N_e is the included actual integral cleared Eisenstein moment series.
- The inherited full-cleared-eisenstein-weight-congruence bounds each coefficient of N_e′−N_e. Every coefficient of N_e is integral, and each d_T is prime to p.
- The native totient congruence implies d_T^e′−d_T^e is divisible by p^r. Expand d_T^e′N_e′−d_T^eN_e into d_T^e′(N_e′−N_e)+(d_T^e′−d_T^e)N_e. Both terms have coefficient norm at most p^(−r).
- The ultrametric finite-sum inequality preserves the same bound. Expansion inserts zero coefficients and does not weaken it. Retain both weight-dependent clearing factors; the theorem does not assert integral congruences for the uncleared constant or an integral half at p=2.

**Prerequisites**

- DirichletPadicLFunctions:L4/principal-tame-eisenstein-series
- DirichletPadicLFunctions:L4/full-cleared-eisenstein-weight-congruence
- DirichletPadicLFunctions:L4/full-eisenstein-cleared-specialization
- DirichletPadicLFunctions:L4/full-eisenstein-cleared-field-congruence
- mathlib:Nat.pow_totient_mod
- mathlib:Nat.totient_prime_pow
- mathlib:PowerSeries.map_expand

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Sources**

- RJW-published, Definition8.1, Theorem8.2 and proof, published159–160 / physicalPDF60–61, freshly read4October2026; Stein equation(4) specifies the corresponding divisor coefficients.. Worker-derived finite tame Euler deletion on the existing localized principal family. The new formulas are not quoted as a theorem of RJW. Classical existence uses the already owned modular-form level-raising maps; finite-character value identification remains a separately recorded gap.

### The full family with nontrivial primitive left character

DirichletPadicLFunctions:L4/nontrivial-left-full-family

Declaration: DirichletPadic.integralTwistedPositiveEisensteinSeries_nontrivial_left_full

Kind: comparison. Implementation: unchecked.

For primitive ψ modulo u>1 and primitive φ modulo v, and weight w≥3 with ψ(−1)φ(−1)=(−1)^w, the existing integral positive-series measure specializes to the full q-expansion of the p-stabilized owned classical E_w^(ψ,φ), through its unique common coefficient-field series. The constant is zero.

**Hypotheses**

- Use the same characteristic-zero field F with separate embeddings into ℂ and a complete ultrametric K as in integral-twisted-classical-full-comparison. The native integer subring O⊆K, integral arithmetic test κ^O_(0,1,w−1) and ordered characters are unchanged.
- The positive conductor levels u,v are prime to p; ψ and φ are primitive at their stated levels, u>1, w≥3 and the stated parity holds. The classical owner supplies an actual f∈ModularForm(Γ₁(uv),w) with coefficients Σ_(d|n)ψ(n/d)φ(d)d^(w−1) and constant0.
- Use the actual native inclusion and p-level raising to form g=f−φ(p)p^(w−1)V_p f on Γ₁(puv). No product primitivity is inferred and no exceptional-weight existence theorem is used.

**Construction or proof outline**

- Request the actual classical form with these hypotheses and its zero constant from the existing ModularForms Layer0. Its character carrier and Bernoulli/Fourier construction are not recreated in this packet.
- Apply integral-twisted-classical-full-comparison to that form with c=0. Its constant term after stabilization is(1−φ(p)p^(w−1))·0=0, so the existing actual positive measure gives the whole series.
- The inherited integral test and weight congruences now cover every coefficient, including degree0. They require no factor1/2 even at p=2, unlike the nonprincipal-right/left-trivial constant family.

**Prerequisites**

- DirichletPadicLFunctions:L4/integral-twisted-classical-full-comparison
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-test-congruence
- DirichletPadicLFunctions:L4/integral-twisted-positive-series-weight-congruence
- tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus

**Acceptance**

- Preserve every displayed carrier, hypothesis and normalization; a conditional input is not a completed supplier proof.

**Tests**

- SuggestedEisensteinTargetTests.nontrivial_left_zero_constant: For a primitive left character of conductor greater than1, both the full integral family and its stabilized classical series have coefficient zero equal to0.

**Sources**

- Stein-Eisenstein-online, Definition5.1; Explicit Basis equation(4), following constant formula, Theorem5.8, restricted to weight≥3. Freshly read4October2026.. Import the primitive-pair classical form from its existing ModularForms owner. The arithmetic measure, Euler deletion and comparison on a common coefficient field are L4 work. No claim to have read the cited Miyake proof or to construct an exceptional-weight form.
