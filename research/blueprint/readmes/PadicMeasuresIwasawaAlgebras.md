**Residue averaging checkpoint, 27 September 2026.** The packet now has 209
unchecked nodes (28 constructions, 134 lemmas, 2 definitions, 26 theorems, 19 comparisons), 163 API entries, 140 packet tests,
151 typed examples, 13 planets and 205 baseline references. All 191
predecessor nodes, 185 baseline entries and fourteen source findings are preserved.
Eighteen new nodes give the residue comparison and the pole-cancelled fixed-error
argument. Eight gaps remain, with zero requests and zero closed stages. Counts
and validation reports in earlier checkpoint sections below are historical.

## L0 and L2 continuation: the residue of integral averaging

Write Z=Z_p, k=F_p, B=Z[[T]], B_0=k[[T]] and Y=1+T. Every prime is admitted,
including 2. These are the existing p-adic integer, residue-ring and power-series
carriers. The integral operator psi is fixed throughout: it is the existing
Amice transport of the bounded measure operator that restricts a measure to pZ_p
and pushes forward by exact division by p. The coefficient map rho:B→B_0 is
native reduction by PadicInt.toZMod.

The natural basis calculation comes from measures. Amice sends delta_n to Y^n.
The measure operator sends delta_n to delta_(n/p) when p divides n and to zero
otherwise. The native residue-map kernel identifies divisibility of a natural
number in Z_p with its ordinary divisibility in N. Thus psi sends Y^n to Y^(n/p)
or zero. The exponent really is divided by p; it is not the formula for the
composite of psi with Frobenius.

The general Cartier extractor already belongs to
`ClassicalArithmeticCompletion:CA.2/cartier-operators`. Import its restriction
to k[[T]] at modulus p>0 and indices 0≤i<p. Define the new operator psi_0 as
the weighted finite sum of those restrictions with weights (−1)^i. In coordinates,

coeff_n(psi_0 F) = c_(pn) − c_(pn+1) + … + (−1)^(p−1)c_(pn+p−1).

This coordinate formula can be prototyped directly using native PowerSeries.mk;
coefficient extensionality identifies it with the imported Cartier sum. It adds
no second general Cartier construction. The supplier's unrestricted q=0 and
r≥q wording is not needed: positivity and the residue range are explicit here.
The source definition and Proposition 4 supply precisely this valid specialization.
The current suggested file does not import an unfinished supplier module; it
states a typed characterization for any native linear family with the exact
Cartier coefficient interface. Semilinearity in the plan depends on the existing
supplier, whose implementation is not claimed by this checkpoint.

The monomial rule is psi_0(aT^n)=a(−1)^(n mod p)T^(n div p). At p=3, T maps to
−1, while at p=2 it maps to 1. This distinguishes psi_0 from the single extractor
Lambda_0. It is a linear operator, and the dyadic values on Y and Y^2 show that
it is not multiplicative. Native finite-field expansion identifies F(T^p) with
F^p. Cartier semilinearity therefore gives psi_0(F(T^p)G)=F psi_0(G).

For r<p, the average of Y^r is the constant alternating binomial sum, which is
zero for r>0 and one for r=0. Writing n=pq+r now gives the same translated-power
formula as the actual integral psi. Every integral polynomial P(T) can be written
as Q(Y), where Q(S)=P(S−1). Finite linearity proves the reduction comparison for
polynomials. This uses polynomial composition only; it never substitutes a unit
constant into a general infinite power series.

To pass to all series, the topology matters. Give k its discrete topology and
both power-series rings their native coefficientwise topologies, using the p-adic
topology on Z. The residue map Z→k is locally constant: points at distance less
than one have the same residue. Consequently rho is continuous. Each output
coefficient of psi_0 depends on a finite block of input coefficients, so psi_0
is continuous. The integral psi already has its coefficientwise continuity node.
The two composites agree on integral polynomials, whose inclusion has dense range
in B. The Hausdorff equalizer theorem then proves

rho(psi(F)) = psi_0(rho(F)) for every F in B.

This is a comparison with the actual measure-derived operator, rather than a
new definition of it. It gives Coleman consumers the characteristic-p operator
without creating a reverse dependency from PMIA to the Coleman roadmap.

### The fixed error term without a rational pole

RJW Lemma 12.13 uses the fact that psi fixes Y/T, referring back to Lemma 4.7.
The bounded operator's domain does not contain this rational function. That
domain issue is already recorded in `ColemanPowerSeries/E8`; it is not duplicated
here. The application can be stated and proved entirely in ordinary power series.
The monomial formula gives psi_0(Y T^(p−1))=Y, including at p=2. Applying the
Cartier relation to a general H gives

psi_0(Y T^(p−1) H(T^p)) = YH.

The error term in Lemma 12.13 has precisely this form: its coefficients d_m,
m≥1, determine H=sum_(n≥0) d_(n+1)T^n. This parametrization clears the pole
before applying psi_0 and avoids any unproved exchange of infinite sums.
If the error term is fixed, cancellation of the unit Y gives
H=T^(p−1)H(T^p). A nonzero H of order d would satisfy d=p−1+pd, impossible
for p>1. Hence H and the error term vanish.

The complete characteristic-p image theorem still requires the logarithmic-
derivative decomposition and the infinite Euler product in Lemma 12.14, owned
by ColemanPowerSeries. This checkpoint supplies its residue-operator and final
fixed-error inputs. It does not claim the full Coleman image, the coefficient-
general bounded operator comparison, or a completed convolution algebra.

### Local constancy of p-adic reduction

`PadicMeasuresIwasawaAlgebras:L0/residue-map-locally-constant` (lemma); proposed declaration `IwasawaResidue.isLocallyConstant_toZMod`.

The native ring homomorphism PadicInt.toZMod:Z_p→F_p is locally constant.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. At x, use the open ball of radius one. For y in this ball the native norm criterion says p divides y−x.
2. The kernel of toZMod is the maximal ideal, which is the ideal generated by p. Thus toZMod(y−x)=0 and the two residues agree. Apply the eventual-equality characterization of local constancy.

Prerequisites: `mathlib:PadicInt.norm_lt_one_iff_dvd`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:IsLocallyConstant.iff_eventually_eq`.


Acceptance:

- No new residue field, quotient ring or norm on F_p is defined.

Sources:

- RJW-published, Lemma12.13, printed182–183/PDF83–84, passage to characteristic p. Native-library deduction making the coefficient reduction used in the source continuous. The topology of the finite residue field is stated explicitly.

### Continuity of coefficient reduction

`PadicMeasuresIwasawaAlgebras:L2/series-residue-continuous` (lemma); proposed declaration `IwasawaResidue.continuous_residue_map`.

The actual coefficient reduction rho:B→B_0 is continuous.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.
- Use the coefficientwise p-adic topology on B and the coefficientwise discrete topology on B_0; k is given its discrete topology explicitly. The map rho:B→B_0 is the existing coefficient map induced by PadicInt.toZMod.

Proof outline:

1. For each n, the nth coefficient of rho(F) is toZMod(coeff_n(F)), by the native coeff_map formula.
2. The preceding local-constancy lemma makes toZMod continuous into discrete F_p. Compose with native continuous coefficient evaluation, and use the coefficientwise continuity criterion.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/residue-map-locally-constant`, `mathlib:IsLocallyConstant.continuous`, `mathlib:PowerSeries.coeff_map`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.


Acceptance:

- Continuity is for the displayed product topologies, not an invented norm on all power series.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Averaging a Dirac measure

`PadicMeasuresIwasawaAlgebras:L2/psi-measure-dirac` (lemma); proposed declaration `AbstractMeasure.psiMeasure_dirac`.

For every x in Z_p, psiMeasure(delta_x) is delta_(divideByP(x)) if p divides x in Z_p, and zero otherwise.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.
- For this lemma the coefficient ring R is any normed commutative ring, and measures are native D(Z_p,R).

Proof outline:

1. Use the existing evaluation formula for psiMeasure. Applying the Dirac measure evaluates the characteristic function of pZ_p and the divided test at x.
2. If p divides x the indicator is one, and otherwise it is zero. Native measure extensionality yields the displayed equality. This promotes the already supplied psiMeasure_dirac API item without creating a second signature.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/divide-by-p`, `PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:LocallyConstant.charFn_eq_one`, `mathlib:LocallyConstant.charFn_eq_zero`.


Acceptance:

- The point p is sent to delta_1; a unit point is killed.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Integral averaging on translated powers

`PadicMeasuresIwasawaAlgebras:L2/psi-series-natural-powers` (lemma); proposed declaration `IwasawaResidue.psiSeries_one_add_X_pow`.

For n≥0, psi(Y^n)=Y^(n/p) if p divides n in N, and psi(Y^n)=0 otherwise.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. The existing natural-Dirac Amice identity expresses Y^n as the transform of delta_n. Commute psi with this transform using psi-series-intertwining and apply psi-measure-dirac.
2. The kernel and maximal-ideal formulas for toZMod, together with natCast_eq_zero_iff, identify divisibility of n by p in Z_p with divisibility in N.
3. When p divides n, the equality n=p(n/p) and divide-by-p-mul show that the divided point is n/p. Transform the resulting Dirac mass back. When p does not divide n, the transformed measure is zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-dirac-natural`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/psi-measure-dirac`, `PadicMeasuresIwasawaAlgebras:L2/divide-by-p-mul`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:ZMod.natCast_eq_zero_iff`.


Typed tests:

- `ResiduePsiTests.integral_ternary` (computation): The actual integral operator at p=3 sends (1+T)^6 to (1+T)^2.

Acceptance:

- The exponent is divided by p, not left equal to n; n=0 gives psi(1)=1.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Residue averaging operator

`PadicMeasuresIwasawaAlgebras:L2/residue-psi` (construction); proposed declaration `IwasawaResidue.residuePsi`.

Define the k-linear operator psi_0:B_0→B_0 to be the finite weighted sum of the existing Cartier power-series restrictions, psi_0(F)=sum_(0≤i<p) (−1)^i Lambda_i(F). Equivalently its nth coefficient is sum_(0≤i<p) (−1)^i coeff_(pn+i)(F).

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Import the Cartier supplier only at positive modulus p and residues 0≤i<p. Its power-series restriction is the decimation coeff_n(Lambda_i F)=coeff_(pn+i)(F).
2. Take the finite weighted sum of these native linear maps. Alternatively construct the same map with PowerSeries.mk and the displayed coefficient formula; linearity is coefficientwise finite-sum algebra and coefficient extensionality identifies the two constructions.
3. The zero, sum and scalar APIs are linear-map laws. The coefficient characterization and weighted-Cartier characterization expose the construction; the separate monomial and left-inverse nodes provide the generator and Frobenius APIs.

Prerequisites: `ClassicalArithmeticCompletion:CA.2/cartier-operators`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.ext`.

Uses:

- RJW Lemma12.13 and ColemanPowerSeries:L1 characteristic-p image proof: Identifies reduction of the actual integral bounded operator and supplies the pole-cancelled fixed-error calculation.
- ClassicalArithmeticCompletion:CA.2/cartier-operators: Reuses its power-series restrictions and finite-field semilinearity, with the precise positive-modulus/range boundary.
- The residue comparison and polynomial-density nodes in this packet: Provides an explicit continuous native operator whose values on translated polynomial powers agree with actual integral averaging after coefficient reduction.

Planning API:

- `IwasawaResidue.coeff_residuePsi` (characterisation): coeff_n(psi_0 F)=sum_(0≤i<p) (−1)^i coeff_(pn+i)(F).
- `IwasawaResidue.residuePsi_zero` (simp): psi_0(0)=0.
- `IwasawaResidue.residuePsi_add` (structure): psi_0(F+G)=psi_0(F)+psi_0(G).
- `IwasawaResidue.residuePsi_smul` (structure): psi_0(aF)=a psi_0(F) for a in F_p.
- `IwasawaResidue.residuePsi_monomial` (simp): psi_0(aT^n)=a(−1)^(n mod p) T^(n div p).
- `IwasawaResidue.residuePsi_one` (simp): psi_0(1)=1.
- `IwasawaResidue.residuePsi_eq_sum_cartier` (compatibility): For any native k-linear family C_i with coeff_n(C_i F)=coeff_(pn+i)(F) for 0≤i<p, psi_0(F)=sum_(0≤i<p) (−1)^i C_i(F). In particular this applies to the imported Cartier restrictions.
- `IwasawaResidue.residuePsi_expand` (relation): psi_0(F(T^p))=F, using the native PowerSeries.expand map.

Typed tests:

- `ResiduePsiTests.zero` (degenerate): At p=3, psi_0(0)=0.
- `ResiduePsiTests.ternary_X` (computation): At p=3, psi_0(T)=−1, distinguishing the weighted operator from Lambda_0.
- `ResiduePsiTests.dyadic_X` (computation): At p=2, psi_0(T)=1; no odd-prime assumption is made.
- `ResiduePsiTests.native_monomial` (compatibility): At p=3, psi_0 of the native monomial 2T^7 is the native monomial T^2.
- `ResiduePsiTests.nonmultiplicative` (non-example): At p=2, psi_0((1+T)^2)=1+T differs from psi_0(1+T)^2=0.

Acceptance:

- This is a new weighted bounded-operator specialization, not a second general Cartier extractor or a new series carrier.
- The map is k-linear and is not multiplicative.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.
- rowland-stipulanti-yassawi-bridy-2023, Section3, definition of the Cartier operators and Proposition4, PDF5 (v2); full PDF5–6 read. Use only K=F_p, q=p>0 and 0≤r<p. The generic Cartier construction and power-series restriction are owned by ClassicalArithmeticCompletion:CA.2/cartier-operators. Its finite-field relation supplies the semilinearity of the weighted sum. No q=0 or r≥q power-series claim is consumed.

### Coefficients of residue averaging

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-coefficient` (lemma); proposed declaration `IwasawaResidue.coeff_residuePsi`.

For F in B_0 and n≥0, coeff_n(psi_0 F)=sum_(0≤i<p) (−1)^i coeff_(pn+i)(F).

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Apply coefficient evaluation to the finite weighted Cartier sum. Use the coefficient characterization of each imported restriction and linearity of the native coefficient map.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi`, `ClassicalArithmeticCompletion:CA.2/cartier-operators`.


Acceptance:

- For p=3 the nth output coefficient is c_(3n)−c_(3n+1)+c_(3n+2).

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.
- rowland-stipulanti-yassawi-bridy-2023, Section3, definition of the Cartier operators and Proposition4, PDF5 (v2); full PDF5–6 read. Use only K=F_p, q=p>0 and 0≤r<p. The generic Cartier construction and power-series restriction are owned by ClassicalArithmeticCompletion:CA.2/cartier-operators. Its finite-field relation supplies the semilinearity of the weighted sum. No q=0 or r≥q power-series claim is consumed.

### Residue averaging on a monomial

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-monomial` (lemma); proposed declaration `IwasawaResidue.residuePsi_monomial`.

For a in F_p and n≥0, psi_0(aT^n)=a(−1)^(n mod p)T^(n div p), expressed using native monomial.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Apply residue-psi-coefficient and the native coefficient-of-monomial formula. Write n=p(n div p)+(n mod p), with 0≤n mod p<p.
2. Only that residue can contribute, and only at output degree n div p. Coefficient extensionality proves the identity, also when a=0.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-coefficient`, `mathlib:PowerSeries.coeff_monomial`, `mathlib:PowerSeries.ext`.


Acceptance:

- The sign depends on the remainder, not the quotient. In particular psi_0(1)=1 follows with n=0 and a=1.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Continuity of residue averaging

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-continuous` (lemma); proposed declaration `IwasawaResidue.continuous_residuePsi`.

The k-linear map psi_0 is continuous for the coefficientwise discrete topology on B_0.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.
- Use the coefficientwise p-adic topology on B and the coefficientwise discrete topology on B_0; k is given its discrete topology explicitly. The map rho:B→B_0 is the existing coefficient map induced by PadicInt.toZMod.

Proof outline:

1. For each output degree n, residue-psi-coefficient writes its value as a finite sum of fixed scalar multiples of input coefficient evaluations.
2. Every coordinate evaluation is continuous. Finite sums and fixed scalar multiplication in the discrete finite field are continuous. Apply the native coefficientwise continuity criterion.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-coefficient`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.


Acceptance:

- The argument uses only finitely many input coefficients for each output coordinate.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Cartier semilinearity of residue averaging

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-semilinear` (lemma); proposed declaration `IwasawaResidue.residuePsi_expand_mul`.

For F,G in B_0, psi_0(F(T^p)G)=F psi_0(G). Here F(T^p) is the native expand map.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Native FiniteField.PowerSeries.expand_card identifies F(T^p) with F^p over F_p.
2. For each imported Cartier restriction with 0≤i<p, its finite-field relation gives Lambda_i(F^p G)=F Lambda_i(G). Multiply by (−1)^i and add the p identities.
3. Coefficient characterization identifies the weighted sums with psi_0 on each side. No trace division by p is used in characteristic p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-coefficient`, `ClassicalArithmeticCompletion:CA.2/cartier-operators`, `mathlib:PowerSeries.expand`, `mathlib:FiniteField.PowerSeries.expand_card`.


Acceptance:

- This twisted relation does not make psi_0 a multiplicative map.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.
- rowland-stipulanti-yassawi-bridy-2023, Section3, definition of the Cartier operators and Proposition4, PDF5 (v2); full PDF5–6 read. Use only K=F_p, q=p>0 and 0≤r<p. The generic Cartier construction and power-series restriction are owned by ClassicalArithmeticCompletion:CA.2/cartier-operators. Its finite-field relation supplies the semilinearity of the weighted sum. No q=0 or r≥q power-series claim is consumed.

### Residue averaging below degree p

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-small-translated-powers` (lemma); proposed declaration `IwasawaResidue.residuePsi_one_add_X_pow_lt`.

For 0≤r<p, psi_0(Y^r)=1 if r=0 and zero otherwise.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. For any polynomial of degree less than p, the coefficient formula has zero output in every positive degree, and its constant coefficient is the alternating sum of polynomial coefficients.
2. Apply this to (1+T)^r. The native coefficient/binomial formula and polynomial evaluation at −1 identify the alternating sum with (1−1)^r. Treat r=0 separately, giving one; every positive r gives zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-coefficient`, `mathlib:Polynomial.coeff_one_add_X_pow`, `mathlib:Polynomial.eval_eq_sum_range`, `mathlib:PowerSeries.ext`.


Acceptance:

- The zero exponent is included; at p=2 the sole positive case is r=1.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Residue averaging on all translated powers

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-natural-powers` (lemma); proposed declaration `IwasawaResidue.residuePsi_one_add_X_pow`.

For n≥0, psi_0(Y^n)=Y^(n/p) if p divides n, and zero otherwise.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Write n=pq+r with q=n div p and r=n mod p. Native finite-field expansion gives Y^(pq+r)=expand_p(Y^q)Y^r.
2. Apply residue-psi-semilinear and then residue-psi-small-translated-powers. The remainder is zero exactly when p divides n.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-semilinear`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-small-translated-powers`, `mathlib:FiniteField.PowerSeries.expand_card`.


Acceptance:

- Both n=0 and n=p agree with the integral natural-power formula.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Reduction of integral averaging on polynomials

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-polynomial-comparison` (comparison); proposed declaration `IwasawaResidue.residue_psiSeries_polynomial`.

For every P in Z_p[T], rho(psi(P))=psi_0(rho(P)), where P is coerced to the native integral power-series ring.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Put Q(S)=P(S−1). The native polynomial composition identity gives P(T)=Q(1+T); finite polynomial expansion therefore writes P as a finite sum of integral scalar multiples of Y^n.
2. For each Y^n, compare psi-series-natural-powers and residue-psi-natural-powers. The native coefficient map preserves constants, sums and powers.
3. Use Z_p-linearity of the actual psi, F_p-linearity of psi_0 and scalar reduction to sum the identities. Only finite polynomial composition is used, so substitution of a nonzero constant into an infinite series never occurs.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-series-natural-powers`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-natural-powers`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi`, `mathlib:Polynomial.comp_assoc`, `mathlib:Polynomial.comp_eq_sum_left`, `mathlib:PowerSeries.map`.


Acceptance:

- The integral operator is kept fixed; agreement is derived from native measures rather than defining it by the residue formula.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Reduction of the actual integral averaging operator

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison` (comparison); proposed declaration `IwasawaResidue.residue_psiSeries`.

For every integral power series F, rho(psi(F))=psi_0(rho(F)).

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.
- Use the coefficientwise p-adic topology on B and the coefficientwise discrete topology on B_0; k is given its discrete topology explicitly. The map rho:B→B_0 is the existing coefficient map induced by PadicInt.toZMod.

Proof outline:

1. The maps rho composed with actual psi and psi_0 composed with rho are continuous by psi-series-continuous, series-residue-continuous and residue-psi-continuous.
2. They agree on every polynomial by residue-psi-polynomial-comparison. Native denseRange_toPowerSeries makes integral polynomials dense for the coefficientwise p-adic topology.
3. The residue series ring is Hausdorff because its coefficients are discrete. Apply DenseRange.equalizer to obtain equality on all B.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-polynomial-comparison`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous`, `PadicMeasuresIwasawaAlgebras:L2/series-residue-continuous`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-continuous`, `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries`, `mathlib:DenseRange.equalizer`.


Typed tests:

- `ResiduePsiTests.actual_reduction` (compatibility): For every F in Z_2[[T]], reduction of its actual integral psi equals psi_0 of its coefficient reduction.

Acceptance:

- This comparison is available to Coleman consumers without reversing the dependency to the Coleman packet. It makes no completed-group-algebra or finite-extension coefficient claim.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Residue averaging is a left inverse to expansion

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-left-inverse` (lemma); proposed declaration `IwasawaResidue.residuePsi_expand`.

For every F in B_0, psi_0(F(T^p))=F.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Apply residue-psi-semilinear with G=1. The monomial formula at n=0, a=1 gives psi_0(1)=1, and multiplication by one yields the result.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-semilinear`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-monomial`.


Acceptance:

- This is the residue counterpart of the supplied integral left inverse; expansion is the native algebra map.

Sources:

- RJW-published, §3.5.3–5, printed127–129/PDF28–30; Lemma12.13 and proof, printed182–183/PDF83–84. Worker decomposition of the actual bounded integral averaging operator and its reduction modulo p. The weighted coefficient formula is derived here; it is not asserted to be a separate printed formula. The comparison is proved through the existing Amice transport, then polynomial density.

### Averaging the polynomial that clears the pole

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-pole-basis` (lemma); proposed declaration `IwasawaResidue.residuePsi_pole_basis`.

In B_0, psi_0(Y T^(p−1))=Y.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Expand the input as T^(p−1)+T^p, using p>1. The monomial formula sends these terms to (−1)^(p−1) and T respectively.
2. Native ZMod.pow_card_sub_one_eq_one applied to −1 gives (−1)^(p−1)=1 for every prime, including 2. Add the terms.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-monomial`, `mathlib:PowerSeries.monomial_eq_C_mul_X_pow`, `mathlib:ZMod.pow_card_sub_one_eq_one`.


Typed tests:

- `ResiduePsiTests.pole_polynomial` (computation): At p=2, psi_0((1+T)T)=1+T.

Acceptance:

- Both sides are ordinary power series; no value of bounded psi at Y/T is used.

Sources:

- RJW-published, Lemma12.13, printed182–183/PDF83–84, especially the displayed error term b and the appeal to Lemma4.7. Worker replacement of the rational-pole step by a statement entirely inside F_p[[T]]. Existing ColemanPowerSeries/E8 records the bounded-domain problem with Lemma4.7; this is its Lemma12.13 application, not a second source finding. The present statements do not supply Lemma12.14 or the full Coleman image theorem.

### Pole-cancelled residue averaging identity

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-pole-cancelled` (lemma); proposed declaration `IwasawaResidue.residuePsi_pole_cancelled`.

For H in B_0, psi_0(Y T^(p−1) H(T^p))=Y H.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Commute H(T^p) to the first factor and apply residue-psi-semilinear.
2. The remaining factor is Y T^(p−1), whose average is Y by residue-psi-pole-basis. Commute H and Y to give the stated identity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-semilinear`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-pole-basis`.


Acceptance:

- For b=sum_(m≥1) d_m Y T^(pm−1), take H=sum_(n≥0) d_(n+1)T^n. This parametrizes the source error term without introducing a Laurent series or exchanging an unproved infinite sum.

Sources:

- RJW-published, Lemma12.13, printed182–183/PDF83–84, especially the displayed error term b and the appeal to Lemma4.7. Worker replacement of the rational-pole step by a statement entirely inside F_p[[T]]. Existing ColemanPowerSeries/E8 records the bounded-domain problem with Lemma4.7; this is its Lemma12.13 application, not a second source finding. The present statements do not supply Lemma12.14 or the full Coleman image theorem.

### Vanishing of a shifted Frobenius fixed series

`PadicMeasuresIwasawaAlgebras:L2/shifted-expand-fixed-zero` (lemma); proposed declaration `IwasawaResidue.shifted_expand_fixed_zero`.

If H in B_0 satisfies T^(p−1)H(T^p)=H, then H=0.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. Suppose H is nonzero and let d be its finite native power-series order. The order of T^(p−1) is p−1 and the native order_expand formula gives order(H(T^p))=pd.
2. The native order_mul theorem over the field F_p turns the assumed equality into d=p−1+pd.
3. Since p>1 and d≥0, the right side is strictly greater than d. This contradiction proves H=0.

Prerequisites: `mathlib:PowerSeries.coe_toNat_order`, `mathlib:PowerSeries.order_mul`, `mathlib:PowerSeries.order_X_pow`, `mathlib:PowerSeries.order_expand`.


Acceptance:

- The prime hypothesis supplies p>1. At p=1 the analogous equation would hold for every H, so that case cannot be admitted.

Sources:

- RJW-published, Lemma12.13, printed182–183/PDF83–84, especially the displayed error term b and the appeal to Lemma4.7. Worker replacement of the rational-pole step by a statement entirely inside F_p[[T]]. Existing ColemanPowerSeries/E8 records the bounded-domain problem with Lemma4.7; this is its Lemma12.13 application, not a second source finding. The present statements do not supply Lemma12.14 or the full Coleman image theorem.

### Vanishing of the fixed error term

`PadicMeasuresIwasawaAlgebras:L2/residue-psi-fixed-error-zero` (lemma); proposed declaration `IwasawaResidue.pole_error_fixed_zero`.

If psi_0(Y T^(p−1) H(T^p))=Y T^(p−1) H(T^p), then H=0; consequently the displayed error term is zero.

Hypotheses and conventions:

- p is prime, including p=2. Z=Z_p is the native p-adic integer ring and k=ZMod p. B=Z[[T]] and B_0=k[[T]] are native PowerSeries carriers; Y=1+T. The integral psi is the existing Amice transport of the measure restriction/division operator.

Proof outline:

1. The pole-cancelled identity makes the fixedness equation YH=Y T^(p−1)H(T^p).
2. The constant coefficient of Y is one, so the native isUnit_iff_constantCoeff criterion makes Y a unit. Cancel it to obtain H=T^(p−1)H(T^p).
3. Apply shifted-expand-fixed-zero, then substitute H=0 in the error term. This supplies exactly the final fixed-error argument in Lemma12.13.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/residue-psi-pole-cancelled`, `PadicMeasuresIwasawaAlgebras:L2/shifted-expand-fixed-zero`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.


Typed tests:

- `ResiduePsiTests.nonzero_error` (non-example): At p=3, the nonzero error polynomial (1+T)T^2 is not fixed by psi_0.

Acceptance:

- The statement proves the fixed-error step only. The preceding Cartier/logarithmic-derivative decomposition and the Lemma12.14 Euler product remain Coleman-owned inputs; the full image theorem is not claimed.

Sources:

- RJW-published, Lemma12.13, printed182–183/PDF83–84, especially the displayed error term b and the appeal to Lemma4.7. Worker replacement of the rational-pole step by a statement entirely inside F_p[[T]]. Existing ColemanPowerSeries/E8 records the bounded-domain problem with Lemma4.7; this is its Lemma12.13 application, not a second source finding. The present statements do not supply Lemma12.14 or the full Coleman image theorem.

### Reading and validation boundary

Fresh full readings: RJW published printed127–129/PDF28–30 and printed181–184/
PDF82–85; Rowland–Stipulanti–Yassawi v2 PDF5–6, with PDF3–4 checked to confirm
the section context. The published RJW and arXiv edition findings are preserved.
No new source mistake or independent-review verdict is added. All fourteen
previous findings remain unchanged. The source and baseline entries distinguish
native inputs, imported planned results and worker deductions.

The full suggested file compiles with zero errors and 442 proof-placeholder
warnings only. Its import audit reaches 2,793 byte-checked Mathlib sources.
Separate scratch verification contains one native weighted linear-map construction
and fourteen lemmas: nine unconditional native lemmas and five conditional adapters.
Four adapters take the existing Cartier coefficient/semilinearity interface; the
fifth takes actual-operator continuity and the polynomial comparison to verify
the density passage. They compile with no errors, warnings or placeholders,
against 2,072 byte-checked Mathlib sources. They do not implement the imported
Cartier supplier or the existing Amice operator.

An independent integer-polynomial computation checks reduction of the translated-
basis integral action against the direct residue coefficient formula. Together
with generator, semilinearity, pole, fixed-error and nonmultiplicativity controls,
it passes 2,444 exact assertions for p=2,3,5,7. These finite checks test formulas;
they are not a proof about arbitrary infinite series.

The eighteen nodes add no planet: the existing thirteen planets continue to name
the layer's central objects. The coverage ledger remains partial in all eight
stages. All 191 predecessor nodes and 185 baseline entries are preserved whole.

## Earlier checkpoint material

**Integral unit-domain checkpoint, 27 September2026.** The packet now has191
unchecked nodes,155 API items,131 packet tests,142 typed examples,13 planets
and185 baseline references. All179 predecessor nodes from the weak/norm
checkpoint are preserved. Fourteen source findings, eight gaps, zero requests
and zero closed stages remain. Twelve new declarations give the actual
integral unit-domain coefficient extension and its rational lattice comparison.
Earlier checkpoint counts and validation reports below are historical.

**Weak/norm topology checkpoint, 27 September 2026.** The packet has 179
unchecked nodes (26 constructions, 110 lemmas, 2 definitions, 25 theorems, 16 comparisons), 149 API entries, 124 packet tests,
135 typed examples, 13 planets and 185 baseline references. All 168
predecessor nodes and thirteen source findings are preserved. Eleven new nodes
compare the existing weak and operator-norm topologies; E14 records a set-argument
misprint in Example 3.19. Eight gaps remain, with no requests or closed stages.
All earlier checkpoint counts and validation reports below are historical.

**Previous bounded Amice norm checkpoint, 27 September 2026 (historical).** There are 168 unchecked
nodes, 149 API entries, 117 packet tests, 128 typed examples, 13 planets and
166 baseline references. Eight gaps remain, with no requests and no closed
stages. The eleven new declarations identify field-valued measures with bounded
Amice sequences isometrically and identify the actual integral extension into
Q_p measures with the field-dual unit ball. Earlier checkpoint counts and
validation reports below are historical.

# Profinite and pro-p groups, Part II: p-adic measures and Iwasawa algebras

First prerequisite: [Profinite and pro-p groups](../../../content/tau-ceti/ProfiniteProPGroups/README.md), especially the completed group algebra in its Layer 9 prerequisites. Accepted RS-16 makes this an extension of that roadmap. The base profinite group, its inverse-limit description, the completed ℤ_p group algebra, Dirac map and procyclic/dyadic coordinates are imported. General adic coefficients and their comparisons, bounded measures and module-theoretic Iwasawa constructions belong here. StableReduction Layer 1 owns the general finite-presentation Fitting carrier; SchemeKTheoryOperations:S.1 owns general perfect-complex comparisons, and DeformationAndDerivedPatchingAlgebra:P7 supplies the stated complete-Noetherian-local input.

This is a partial blueprint, checked on 27 September 2026 against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All eight campaign layers remain in scope. L0, L2 and L3 have partial source decompositions; the other five layers retain their full targets as explicit coverage gaps. No layer is closed and no declaration is claimed implemented. The suggested file gives signatures and typed examples; the mathematical statements here and in the packet are the specification.

The roadmap distinguishes three carriers throughout: the native continuous dual D(X,R), an intrinsic measure on a clopen subset of X, and its pushforward to X. It also distinguishes the additive group of ℤ_p from its multiplicative group of units. Their convolution products are different. All unit statements in this checkpoint include p=2, and the native unit group retains −1; it is not replaced by the procyclic subgroup 1+4ℤ₂.

The upstream topological coordinate has a correction gate. Finite group quotients in the procyclic case have kernels generated by (1+T)^(p^n)−1, and the compact coefficient topology also involves reduction modulo powers of p. The comparison is with the joint (p,T)-adic topology, not the pure T-adic filtration. General-coefficient and measure comparisons must establish that topology rather than inherit the upstream filtration sentence. The basic ℤ_p algebraic carrier is not constructed a second time.

The reviewed AUDIT-26 rows for all scoped layers and accepted RS-16/RS-14 boundaries were checked before this addition. Native AbstractMeasure, pushforward, homeomorphism transport, product measures and Fubini are baseline inputs. The new clopen constructions specialize those objects and do not re-plan them. Character-family distribution actions remain with LocallyAnalyticDistributions:L4; arithmetic smoothing and Eisenstein coefficients remain with DirichletPadicLFunctions; Coleman norm/trace and arithmetic Galois comparisons remain with their recipients.


## L0 and L2 continuation: weak compactness and norm separation

The Dirac map gives a direct way to see why the two measure topologies must stay
separate. For every topological X and normed commutative ring R, evaluation at
x defines the existing measure delta_x. Against a fixed test f this map is just
x↦f(x), so it is weakly continuous without compactness. The operator norm only
enters once X is compact and coefficients are a nontrivially normed field K.
Then delta_x has norm one, since evaluation is bounded by the supremum norm and
the constant test one attains the bound.

For an ultrametric K and distinct points of a totally separated compact X, the
norm of delta_x−delta_y is exactly one. The upper bound is the ultrametric
inequality. The lower bound uses the characteristic function of a clopen set
separating x from y. No completeness assumption on K is needed. In contrast,
the same difference on a real two-point space has norm two; discarding the
ultrametric hypothesis would change the statement. When X is infinite, its
Dirac measures give an infinite family separated by distance one inside the
unit ball, proving that this ball is not compact in operator norm.

On Z_p the points p^n approach zero, including at p=2. Their Dirac measures
therefore tend weakly to delta_0 with any normed commutative coefficient ring.
With Q_p coefficients, every norm difference from delta_0 is one. This is a
concrete failure of strong convergence on the very same native measure carrier.
It does not establish or require weak completeness of the whole dual; the
existing correction E10 to Remark 3.6 remains in force.

The actual integral coefficient extension E:D(Z_p,Z_p)→D(Z_p,Q_p) already has
image the field-dual unit ball. To identify its topology, take a fixed rational
continuous test f. Compactness of the domain supplies an exponent n for which
p^n f is integral-valued, and it has a continuous lift g to Z_p. The existing
extension identity on integral tests yields

E(mu)(f)=p^(−n) times the coercion of mu(g).

The exponent depends only on the chosen f, not on mu. Thus E is continuous for
the two weak topologies. There is no uniform exponent making every rational
test integral. The constant test 1/3 over Q_3 gives a small check: multiplying
by 3 gives the integral constant one, while no unscaled integral lift exists.
The scaling lemma holds on any compact topological domain, without a group
structure or a total-separation hypothesis.

The already planned integral Amice homeomorphism identifies D(Z_p,Z_p) weakly
with native power series carrying their coefficientwise p-adic topology.
This is a product of compact copies of Z_p, hence is compact by the existing
Tychonoff theorem. Since the rational weak dual is Hausdorff, E is a closed
embedding. Together with its established unit-ball range, this identifies the
integral weak topology exactly with the weak subspace topology on that ball.

The generic Banach–Alaoglu theorem is already in the pinned library as
WeakDual.isCompact_closedBall, for proper nontrivially normed coefficient
fields. It supplies weak compactness of the native dual ball and is a baseline
reference, not a second proposed theorem. Q_p is proper. The new integral
comparison specifies which topology its existing embedding carries; the
Dirac argument separately shows failure of norm compactness. The old inverse
Amice measures of T^n also remain weakly null, while their rational extensions
have norm one by the primary bounded-Amice isometry. This recovers the explicit
example in Remark 3.28(3) without conflating coefficientwise and uniform
coefficient convergence.

### Weak continuity of Dirac measures

`PadicMeasuresIwasawaAlgebras:L0/dirac-weak-continuous` (lemma); proposed declaration `AbstractMeasure.continuous_dirac_weak`.

The existing map x ↦ delta_x from X to D(X,R) is continuous for the native weak topology.

Hypotheses and conventions:

- X is any topological space; R is a normed commutative ring. Compactness, completeness and an ultrametric norm are not required. D(X,R) is the native continuous scalar-valued dual.

Proof outline:

1. Unfold WeakTopology as the topology induced by evaluation into the product of copies of R indexed by continuous test functions.
2. For each test f, evaluation of delta_x is f(x). Apply continuous_induced_rng and continuous_pi to the continuity of f.

Prerequisites: `mathlib:AbstractMeasure.dirac`, `mathlib:AbstractMeasure.WeakTopology`, `mathlib:continuous_induced_rng`, `mathlib:continuous_pi`.


Acceptance:

- The conclusion applies to integral coefficients, including R=Z_2; it is not a claim of operator-norm continuity.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Operator norm of a Dirac measure

`PadicMeasuresIwasawaAlgebras:L0/dirac-operator-norm` (lemma); proposed declaration `AbstractMeasure.norm_dirac`.

For each x in X, the native operator norm of delta_x is exactly 1.

Hypotheses and conventions:

- X is compact; K is a nontrivially normed field. Norms are those of toCLMEquiv into the existing continuous K-linear dual. No ultrametric or completeness hypothesis is needed.

Proof outline:

1. Pointwise evaluation is bounded by the supremum norm of f. The native opNorm_le_bound gives the upper bound 1.
2. The constant test function 1 has norm 1 since x supplies a point of X, and delta_x(1)=1. Apply le_opNorm to obtain the lower bound.

Prerequisites: `mathlib:AbstractMeasure.dirac`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:ContinuousMap.norm_coe_le_norm`.


Acceptance:

- For the one-point domain over Q_3 the unique Dirac functional has norm 1; the statement is vacuous on an empty domain.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Norm separation of distinct Dirac measures

`PadicMeasuresIwasawaAlgebras:L0/dirac-difference-operator-norm` (lemma); proposed declaration `AbstractMeasure.norm_dirac_sub`.

If x and y are distinct points of X, then the native operator norm of delta_x−delta_y is exactly 1.

Hypotheses and conventions:

- X is compact and totally separated; K is a nontrivially normed field satisfying |a+b|≤max(|a|,|b|). No completeness is required.

Proof outline:

1. The ultrametric inequality bounds |f(x)−f(y)| by the supremum norm of f, giving the operator upper bound 1.
2. Use exists_isClopen_of_totally_separated to choose a clopen U containing x and excluding y. Its native locally constant characteristic function has norm at most 1 and evaluates to 1 and 0 respectively. Applying le_opNorm to this test gives the lower bound 1.

Prerequisites: `mathlib:AbstractMeasure.dirac`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:exists_isClopen_of_totally_separated`, `mathlib:LocallyConstant.charFn`, `mathlib:LocallyConstant.charFn_eq_one`, `mathlib:LocallyConstant.charFn_eq_zero`, `mathlib:ContinuousMap.norm_le`, `mathlib:ContinuousMap.norm_coe_le_norm`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`.

Typed tests:

- `WeakNormTests.dyadic_dirac_difference` (computation): On Z_2 with Q_2 coefficients, the norm of delta_0−delta_1 is 1.
- `WeakNormTests.equal_dirac_points` (degenerate): On Z_3 with Q_3 coefficients, the norm of delta_0−delta_0 is zero.

Acceptance:

- Over Q_2, delta_0−delta_1 has norm 1 even in the dyadic case. For x=y the norm is zero.
- The ultrametric hypothesis matters: over the real field, the difference of the two point evaluations on a discrete two-point space has norm 2.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Failure of norm compactness of the measure unit ball

`PadicMeasuresIwasawaAlgebras:L0/measure-unit-ball-not-norm-compact` (theorem); proposed declaration `AbstractMeasure.not_isCompact_measure_unitBall`.

The unit ball {L in the continuous K-linear dual of C(X,K) : norm(L)≤1} is not compact for its operator-norm topology.

Hypotheses and conventions:

- X is infinite, compact and totally separated; K is a nontrivially normed ultrametric field. No properness or completeness of K is needed for this negative result.

Proof outline:

1. Use Infinite.natEmbedding to choose distinct points of X. Their Dirac functionals lie in the unit ball by dirac-operator-norm, and every pair has distance 1 by dirac-difference-operator-norm.
2. If the unit ball were compact, IsCompact.tendsto_subseq would give a convergent subsequence. Its shift by one has the same limit, so the norms of the differences tend to zero. Strict monotonicity of the subsequence indices says every such norm is 1, contradicting uniqueness of limits in the real field.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/dirac-operator-norm`, `PadicMeasuresIwasawaAlgebras:L0/dirac-difference-operator-norm`, `mathlib:Infinite.natEmbedding`, `mathlib:IsCompact.tendsto_subseq`, `mathlib:Filter.tendsto_add_atTop_nat`, `mathlib:tendsto_nhds_unique`.


Acceptance:

- In particular the Q_p-valued measure unit ball on Z_p is not norm compact. Native WeakDual.isCompact_closedBall gives weak compactness over proper K; the two topologies must stay explicit.
- The infinitude hypothesis cannot be removed: the Q_p dual unit ball on a one-point space is the compact ring Z_p.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Weak limit of prime-power Dirac measures

`PadicMeasuresIwasawaAlgebras:L2/dirac-prime-powers-weak-limit` (lemma); proposed declaration `AbstractMeasure.tendsto_dirac_prime_powers_weak`.

For every normed commutative ring R, the measures delta_(p^n) in D(Z_p,R) converge weakly to delta_0 as n tends to infinity.

Hypotheses and conventions:

- p is prime, including 2. The domain points p^n lie in the native p-adic integer ring. The target measure topology is WeakTopology.

Proof outline:

1. PadicInt.norm_p and p>1 give norm(p)<1, so tendsto_pow_atTop_nhds_zero_of_norm_lt_one gives p^n→0 in Z_p.
2. Compose that limit with dirac-weak-continuous. This is convergence against each fixed continuous test, not uniform convergence on the test unit ball.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/dirac-weak-continuous`, `mathlib:PadicInt.norm_p`, `mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one`.

Typed tests:

- `WeakNormTests.integral_dyadic_weak_limit` (computation): The Z_2-valued measures delta_(2^n) converge weakly to delta_0.

Acceptance:

- The same weak convergence holds both for integral Z_2 coefficients and for rational Q_2 coefficients.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Constant norm distance of prime-power Dirac measures

`PadicMeasuresIwasawaAlgebras:L2/dirac-prime-powers-norm-distance` (lemma); proposed declaration `AbstractMeasure.norm_dirac_prime_powers_sub_zero`.

For every n≥0, norm(delta_(p^n)−delta_0)=1 in the native Q_p continuous dual on Z_p.

Hypotheses and conventions:

- p is prime, including 2. The norm is the field-valued operator norm after toCLMEquiv; no native operator norm on integral measures is introduced.

Proof outline:

1. The native Z_p space is compact and ultrametric, hence totally separated. Its characteristic-zero domain structure gives p^n≠0, even for n=0.
2. Apply dirac-difference-operator-norm using Padic.nonarchimedean.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/dirac-difference-operator-norm`, `mathlib:PadicInt.compactSpace`, `mathlib:Padic.nonarchimedean`.


Acceptance:

- At n=0 this is delta_1−delta_0. At arbitrarily large n the norm remains 1 although p^n approaches zero.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Weak and strong convergence differ

`PadicMeasuresIwasawaAlgebras:L2/dirac-prime-powers-not-strong-limit` (comparison); proposed declaration `AbstractMeasure.not_tendsto_dirac_prime_powers_strong`.

The Q_p-valued sequence delta_(p^n) does not converge to delta_0 in the native operator-norm topology, although it converges there weakly by dirac-prime-powers-weak-limit.

Hypotheses and conventions:

- p is prime, including 2. StrongTopology is exactly the native field-valued continuous-dual norm topology; it is not the integral coefficientwise topology.

Proof outline:

1. A strong limit at delta_0 would force norm(delta_(p^n)−delta_0) to tend to zero by continuity of subtraction and norm.
2. The preceding distance lemma makes this the constant real sequence 1, whose limit cannot also be zero. The existing weak-limit node supplies the comparison.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/dirac-prime-powers-norm-distance`, `PadicMeasuresIwasawaAlgebras:L2/dirac-prime-powers-weak-limit`, `mathlib:AbstractMeasure.StrongTopology`, `mathlib:tendsto_nhds_unique`.

Typed tests:

- `WeakNormTests.ternary_weak_not_strong` (non-example): The Q_3-valued delta_(3^n) converge weakly to delta_0 but fail to converge to it in operator norm.

Acceptance:

- Over Q_3 the same concrete sequence has the stated weak limit and fails the stated strong limit; this does not assert weak completeness of the whole dual.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Example 3.10, printed 120/PDF21; Remark 3.28(3), printed 125–126/PDF26–27. Worker deduction on the native Dirac measure. The source defines the weak and strong topologies and illustrates their distinction; it does not state this exact Dirac criterion. The operator norm is uniform on the test-function unit ball, retaining source correction E9.

### Integral scaling of rational continuous tests

`PadicMeasuresIwasawaAlgebras:L0/rational-test-integral-scaling` (lemma); proposed declaration `ContinuousMap.exists_integral_test_scaling`.

For every continuous f:X→Q_p there are n≥0 and a continuous g:X→Z_p such that g(x), viewed in Q_p, equals p^n f(x) for every x.

Hypotheses and conventions:

- p is prime; X is compact. No group structure, total separation or nonemptiness of X is required.

Proof outline:

1. The native supremum norm bounds every |f(x)|. Since norm(p)<1, the real quantities norm(p^n) norm(f) tend to zero; choose n for which this bound is at most 1.
2. Define g pointwise using the native subtype Z_p={z in Q_p : norm(z)≤1}. The pointwise norm bound supplies membership, and the continuous product p^n f has a continuous subtype lift.

Prerequisites: `mathlib:ContinuousMap.norm_coe_le_norm`, `mathlib:Padic.norm_p_lt_one`, `mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `mathlib:PadicInt`.

Typed tests:

- `WeakNormTests.nonintegral_constant_scaling` (computation): For the constant rational test 1/3 on Z_3, multiplication by 3 gives the coercion of the constant integral test 1; without scaling no integral test has value 1/3 everywhere.

Acceptance:

- For f constantly 1/3 over Q_3, n=1 and g constantly 1 work; n=0 cannot work. For the zero test n=0 and g=0 work, including on the empty domain.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Theorem 3.25 including proof, printed 124–125/PDF25–26; Remark 3.28(1),(3), printed 125–126/PDF26–27. Worker decomposition of the integral/rational and weak/coefficientwise comparisons, restricted here to Z_p and Q_p with the displayed domain hypotheses. The existing native Amice equivalence and actual coefficient extension are reused. No completed-algebra or unrestricted weak-completeness assertion is made.

### Weak continuity of integral coefficient extension

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension-weak-continuous` (lemma); proposed declaration `AbstractMeasure.continuous_extendIntegralCoefficients_weak`.

The existing extendIntegralCoefficients map from D(Z_p,Z_p) to D(Z_p,Q_p) is continuous when both measure spaces carry their native weak topologies.

Hypotheses and conventions:

- p is prime. Use the canonical Z_p-algebra structure on Q_p and its bounded scalar action, obtainable from the native subtype norm. The actual bounded-inverse coefficient extension is used.

Proof outline:

1. For a fixed rational test f, rational-test-integral-scaling supplies a single n and integral test g with g=p^n f after coercion. The choice depends on f, not on the varying integral measure.
2. Coefficient-extension-test-function and Q_p-linearity give E(mu)(f)=p^(−n) times the coercion of mu(g). This is weakly continuous in mu because evaluation at g, the inclusion Z_p→Q_p, and multiplication by the fixed scalar are continuous.
3. Apply the induced-product criterion for the rational weak topology. Scaling every fixed test supplies continuity on the whole source; no common scaling exponent for all rational tests is claimed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/rational-test-integral-scaling`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension`, `mathlib:AbstractMeasure.WeakTopology`, `mathlib:continuous_induced_rng`, `mathlib:continuous_pi`, `mathlib:continuous_induced_dom`, `mathlib:continuous_apply`.


Acceptance:

- This is continuity of the actual extension, not a map on formal series or a replacement measure carrier. The integral Dirac sequence therefore has the same rational weak limit.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Theorem 3.25 including proof, printed 124–125/PDF25–26; Remark 3.28(1),(3), printed 125–126/PDF26–27. Worker decomposition of the integral/rational and weak/coefficientwise comparisons, restricted here to Z_p and Q_p with the displayed domain hypotheses. The existing native Amice equivalence and actual coefficient extension are reused. No completed-algebra or unrestricted weak-completeness assertion is made.

### Weak compactness of integral measures

`PadicMeasuresIwasawaAlgebras:L2/integral-measures-weak-compact` (theorem); proposed declaration `AbstractMeasure.compactSpace_integralMeasures_weak`.

The native space D(Z_p,Z_p), equipped with WeakTopology, is compact.

Hypotheses and conventions:

- p is prime. The topology is the weak topology of integral test evaluations; no norm is installed on this integral dual.

Proof outline:

1. Use integral-amice-weak-homeomorphism to identify this space topologically with the native Z_p power series with coefficientwise p-adic topology.
2. That topology is the product topology on coefficients. Each Z_p is compact by PadicInt.compactSpace, so Pi.compactSpace applies. Pull compactness back along the existing Amice homeomorphism using the native closed-embedding compactness theorem.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-amice-weak-homeomorphism`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:Topology.IsClosedEmbedding.compactSpace`.


Acceptance:

- This compactness includes p=2. It concerns integral measures, not the entire rational weak dual; source finding E10 remains unchanged.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Theorem 3.25 including proof, printed 124–125/PDF25–26; Remark 3.28(1),(3), printed 125–126/PDF26–27. Worker decomposition of the integral/rational and weak/coefficientwise comparisons, restricted here to Z_p and Q_p with the displayed domain hypotheses. The existing native Amice equivalence and actual coefficient extension are reused. No completed-algebra or unrestricted weak-completeness assertion is made.

### Weak topology on the integral unit ball

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension-weak-closed-embedding` (comparison); proposed declaration `AbstractMeasure.isClosedEmbedding_extendIntegralCoefficients_weak`.

The actual coefficient extension E:D(Z_p,Z_p)→D(Z_p,Q_p) is a closed embedding for the native weak topologies. Thus the integral weak topology agrees with the weak subspace topology on the rational unit ball identified by rational-integral-image.

Hypotheses and conventions:

- p is prime. Use the canonical Z_p-algebra structure on Q_p and bounded scalar action. The unit ball means norm(toCLMEquiv(nu))≤1; its topology here is the weak subspace topology.

Proof outline:

1. Integral-measures-weak-compact supplies compactness of the source, and integral-coefficient-extension-weak-continuous supplies continuity. Rational-integral-extension-injective supplies injectivity.
2. The rational weak topology is induced by the injective evaluation map into a product of Hausdorff copies of Q_p, hence is Hausdorff by IsEmbedding.t2Space. Apply Continuous.isClosedEmbedding.
3. The existing rational-integral-image node identifies the range with the rational operator unit ball. This is therefore a compact weak subspace, in agreement with native Banach–Alaoglu. The Dirac noncompactness theorem applies separately to its operator-norm topology.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-measures-weak-compact`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension-weak-continuous`, `PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-injective`, `PadicMeasuresIwasawaAlgebras:L2/rational-integral-image`, `mathlib:Topology.IsEmbedding.t2Space`, `mathlib:Continuous.isClosedEmbedding`, `mathlib:WeakDual.isCompact_closedBall`.

Typed tests:

- `WeakNormTests.dyadic_integral_weak_embedding` (compatibility): The actual Z_2-to-Q_2 coefficient extension is a closed embedding for the two weak topologies.
- `WeakNormTests.amice_monomial_norm` (non-example): For each n, the rational extension of the native inverse integral Amice transform of T^n over Z_3 has operator norm 1, while the existing integral weak-homeomorphism comparison makes these measures weakly null.

Acceptance:

- Over Q_2 the integral extension still gives this weak closed embedding. The image is weakly compact and norm closed, but is not norm compact.
- The old inverse-Amice sequence for T^n remains weakly null; the primary exact norm comparison gives norm 1 for each rational extension. This recovers the source’s monomial example without identifying weak and uniform coefficient convergence.

Source: Definitions 3.5 and 3.8, printed 119/PDF20; Theorem 3.25 including proof, printed 124–125/PDF25–26; Remark 3.28(1),(3), printed 125–126/PDF26–27. Worker decomposition of the integral/rational and weak/coefficientwise comparisons, restricted here to Z_p and Q_p with the displayed domain hypotheses. The existing native Amice equivalence and actual coefficient extension are reused. No completed-algebra or unrestricted weak-completeness assertion is made.

### Source correction and ownership boundary

E14 records the repeated point argument in Example 3.19, printed p.123/PDF24:
both occurrences of delta-tilde_a(a) should have the set argument X. The
function is explicitly defined on open compact subsets, and Example 3.14
already gives the correct set argument. The published image and arXiv v2
PDF17 agree on the misprint; the projective system of Dirac elements that
follows is unaffected. The latest arXiv version, publisher article, author
notes page, bounded correction searches and existing atlas findings were
checked on 27 September 2026. No published correction was found. This finding
is recorded as new and affects nothing; it has no independent-review verdict.
All thirteen previous findings remain byte-for-byte unchanged as objects.

This checkpoint freshly reads published RJW printed pp.119–121/PDF20–22 and
pp.123–126/PDF24–27, including the entire Theorem 3.25 proof and Remark 3.28(3).
The two public edition hashes remain those in the source ledger. These reads
support the indicated local topology and lattice statements; they do not
complete the full source decomposition. The exact Dirac norm criterion and
test-scaling adapters are explicitly worker deductions from these passages.

Reviewed AUDIT-26 and accepted RS-16 keep these native-measure comparisons in
L0/L2. The completed Z_p group algebra is imported from ProfiniteProPGroups
Layer 9, and its general-coefficient joint adic/finite-quotient comparison
remains a gap. Finite quotient kernels involve (1+T)^(p^n)−1 and coefficient
reduction; no pure T-adic replacement is introduced. Character-family actions
remain in LocallyAnalyticDistributions:L4. Arithmetic measure applications,
Coleman trace/norm comparisons and finite-extension coefficient instances
remain with their stated owners and dependencies.

### Current validation and continuation

The full suggested file compiles with zero errors and 386 proof-placeholder
warnings only; all 2775 reached Mathlib sources match the pinned commit,
with no actual Tau Ceti or planned-supplier imports. It gives signatures,
not implementations. Two separate scratch files compile with zero errors,
warnings or placeholders. The first proves seven native Dirac/norm/limit
lemmas against 1,922 byte-checked Mathlib modules. The second proves the
compact-domain rational-test scaling lemma and three conditional adapters
for weak continuity, compactness and closed embedding, against 2,034 modules;
it also supplies the native bounded-scalar instance. The conditional adapters
take precisely the existing extension test identity, injectivity and Amice
homeomorphism as inputs. They do not claim those planned suppliers implemented.

All 168 preceding node objects, 166 baseline objects, thirteen findings and
thirteen planets are preserved. The new graph has eleven declaration nodes,
eleven named signatures and seven typed tests; no new construction carrier
or API is introduced. The indexed blueprint, source-issue wrapper, exact
four-file intake, acyclicity, preservation and new reader/signature/test
parity checks must pass before publication.

- PadicMeasuresIwasawaAlgebras:L0 (partial): Clopen restriction/extension, support, complementary decomposition and restriction-pushforward naturality are supplied, with weak continuity and closed embeddings and field-valued strong/norm comparisons, on the native scalar-valued continuous dual for compact X and normed commutative R. Complete the general profinite measure decomposition: clopen density and dense extension from the pinned baseline, finitely additive clopen data with the necessary boundedness, and the general profinite integral-lattice/field-valued comparisons (the Z_p-domain, Q_p-coefficient case now has exact L2 nodes). Read and decompose finite free integral lattices, scaling and scalar extension with the required value-group hypotheses, orthonormal bases and completed coefficient tensors. Native weak and field-valued strong topologies, clopen comparisons and Dirac weak/norm separation are supplied. The infinite-domain ultrametric unit ball is not norm compact; native Banach–Alaoglu supplies weak compactness over proper fields. The Z_p-domain, Q_p-coefficient extension has its integral weak topology identified with the weakly compact unit ball in L2. General profinite coefficient extension, finite-extension lattices, and qualified completeness statements remain.
- PadicMeasuresIwasawaAlgebras:L0a (not_read): Read and decompose the continuous character functor and its parameter spaces using the existing partial ℤ_p-character library. Keep family distribution actions at LocallyAnalyticDistributions:L4 under accepted RS-16; do not add a reverse prerequisite.
- PadicMeasuresIwasawaAlgebras:L1 (not_read): Read and decompose joint adic/finite-group completed group algebras, bounded-measure comparison and convolution. Import the ℤ_p completed group algebra from ProfiniteProPGroups:Layer9 rather than rebuilding it. Resolve the RS-16 topology gate: finite-quotient kernels ((1+T)^(p^n)−1), with p-power coefficient reduction, are not the pure T-adic kernels.
- PadicMeasuresIwasawaAlgebras:L2 (partial): The native bounded inverse, field-valued bounded Amice coefficient map, exact operator norm, linear isometry and bounded-series range are supplied. The actual Z_p-to-Q_p integral extension is injective with image the closed dual unit ball, and every Q_p measure admits a common p-power denominator. Receiving finite-extension integer-ring instances, general coefficient-lattice/tower comparisons, convolution and multivariable theory remain. No equivalence with all K[[T]] or with a completed convolution algebra is asserted. The integral weak topology and rational unit-ball weak subspace topology now agree through the actual closed embedding; prime-power Dirac measures provide an explicit weak/strong separation. This does not settle finite-extension or completed-algebra topology comparisons. The integral inverse weight and inverse Mahler derivative on kerψ, together with inverse-factor covariance under the existing unit-dilation pushforward, are supplied. Generic clopen restriction, the comparison with native unit-group measures, and the linear identifications with the ambient and integral-series ψ kernels are supplied by the L0 clopen and L2 intrinsic-unit nodes. Decompose multiplication by z^x with genuine convergence hypotheses. Prove the unit-dilation/formal-binomial-substitution comparison and import the P7 cyclotomic action after identifying its coefficients and topology; the raw pushforward identity alone does not identify an arithmetic Galois action. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; broader coefficient and finite-extension lattice comparisons remain separate; the Z_p-domain field norm and rational unit-ball comparison now have exact nodes. The integral ℤ_p prime-root averaging identity, unique integral descent, finite partial fractions, and rational-series comparison over C_p or an embedded cyclotomic field are supplied. Use the supplied bounded inverse and Z_p coefficient extension, but establish the remaining coefficient-lattice and coefficient-general operator comparisons before claiming the full §3.5.3–5 formulas; decompose arbitrary residue classes modulo p^n and multiplication by z^x with their convergence hypotheses. ColemanPowerSeries:L1 owns the finite-free normalized-trace comparison; locally analytic and period-ring recipients own their comparisons. Keep all these edges directed from the bounded supplier to its consumers. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; broader coefficient and finite-extension lattice comparisons remain separate; the Z_p-domain field norm and rational unit-ball comparison now have exact nodes. Import completed-algebra/procyclic coordinates from L1 and ProfiniteProPGroups Layer9 and compare them with the pinned Amice equivalence. Preserve the joint adic/finite-quotient topology gate; finite-group kernels are ((1+T)^(p^n)−1), with coefficient reduction, not pure T-adic kernels. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; broader coefficient and finite-extension lattice comparisons remain separate; the Z_p-domain field norm and rational unit-ball comparison now have exact nodes.
- PadicMeasuresIwasawaAlgebras:L3 (partial): Identify this generic algebraic δ with the Dirac homomorphism into the actual completed group algebra supplied by L1/ProfiniteProPGroups:Layer9, and identify the scalar map f with continuous-character integration. The present declarations take those data explicitly. Compare the R-span of all Dirac differences with the completed augmentation kernel, with the required closure and topology stated; do not silently identify algebraic span with a closed ideal. Decompose Lemma 3.36(i) positive-moment uniqueness via Mahler/ψ, (ii) moment nonvanishing implies regularity, and (iii) pseudomeasure uniqueness. Choose an infinite-order integer a (e.g. p+1) in the proof, as explained in E3. Decompose the procyclic augmentation-kernel/principal-generator argument and prove the chosen denominator regular before forming the Lemma 3.38 fraction. Keep the dyadic ℤ₂ˣ ≅ C₂ × ℤ₂ case separate; ℤ₂[C₂] is not an integral product of character components. Construct admissible character specializations, including their varying-character loci and any topology actually required by downstream L-functions. The generic algebraic evaluation map alone does not supply analytic families.
- PadicMeasuresIwasawaAlgebras:L4 (not_read): Read/decompose one- and multivariable Iwasawa module structure, characteristic ideals/divisors, regular-local dimension hypotheses and coefficient specialization. Reuse existing Weierstrass preparation, Noetherian/UFD facts and the Fitting owner tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- PadicMeasuresIwasawaAlgebras:L5 (not_read): Read/decompose determinant functors and compact inverse-limit exactness with their hypotheses. Import generic perfect-complex theory from SchemeKTheoryOperations:S.1 and complete-local input from DeformationAndDerivedPatchingAlgebra:P7; plan only the remaining Iwasawa-specific structures. For the compact inverse-limit step, reject the finite-generation-to-Mittag–Leffler implication in RJW Proposition13.13 (E6): prove the compact Hausdorff exactness argument or the actual tower hypothesis. Reading that local passage does not decompose this layer.
- PadicMeasuresIwasawaAlgebras:L6 (not_read): Read/decompose Gorenstein order duality, exterior biduals and their integral comparison and base-change maps; retain this ownership under RS-16. Import Fitting facts; Euler/Kolyvagin system contractions remain at their separate ES6–8 owners.


## L0: clopen restriction, support and decomposition

Let X be compact, s a clopen subset and R a normed commutative ring. The existing scalar-valued measure carrier is D(X,R)=Hom_cont,R(C(X,R),R). The subtype s is compact, including when it is empty. A test function f on s extends by zero to z_s(f) on X, because s and its complement are open. This extension is R-linear and preserves the supremum norm. Neither a scalar field nor completeness nor an ultrametric norm is required.

Precomposition gives r_s:D(X,R)→D(s,R). The opposite arrow j_s is the existing pushforward along subtype inclusion, so j_s(ν)(f)=ν(f|s). The central identities are r_s j_s=id and (j_s r_s μ)(f)=μ(χ_s f). The image of j_s consists exactly of functionals annihilating every continuous function vanishing on s. This quantifies over all such test functions: zero total mass on the complement alone is insufficient for signed or p-adic measures.

The two restrictions give a linear equivalence D(X,R)≃D(s,R)×D(sᶜ,R), whose inverse adds the native pushforwards. Thus decomposition is a statement on actual continuous duals, not an identification of bare sets. For q:X→Y continuous and t clopen, restriction commutes with pushforward when the source subset is precisely q⁻¹(t). These are the interfaces underlying RJW Remark 3.31 and the unit-group comparison below.

The algebraic constructions leave topology selection explicit. The continuation below uses the native weak topology for normed ring coefficients and the native strong topology for nontrivially normed field coefficients. It supplies the clopen and unit-domain topology comparisons and the integral Amice homeomorphism. The weak/norm continuation below supplies Dirac separation and the rational integral-lattice topology comparison. Bounded finitely additive clopen data, broader coefficient lattices and qualified completeness statements remain in the coverage ledger. Source findings E9–E12 explain why those hypotheses cannot be discarded.


### Extension by zero of clopen test functions

`PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension` — construction.

Define ContinuousMap.zeroExtendClopen s R : C(s,R) →L[R] C(X,R), denoted z_s, by z_s(f)(x)=f(x) on s and 0 off s.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Glue f on s and the zero function on its complement using ContinuousMap.liftCover. Both sets are open and cover X; their intersection is empty, so compatibility is vacuous. The native liftCover_coe gives the two pointwise formulas.
2. Addition and scalar multiplication follow pointwise on the two pieces. Compactness of s follows from IsClosed.isCompact and isCompact_iff_compactSpace.
3. At every point the norm of the extension is at most ‖f‖, using ContinuousMap.norm_coe_le_norm on s and zero off s. ContinuousMap.norm_le gives the bound ‖z_s(f)‖≤‖f‖, including s empty. Apply LinearMap.mkContinuous with constant 1. No norm-one condition on R is used.

Prerequisites: `mathlib:ContinuousMap.liftCover`, `mathlib:ContinuousMap.liftCover_coe`, `mathlib:TopologicalSpace.Clopens.isClopen`, `mathlib:IsClosed.isCompact`, `mathlib:isCompact_iff_compactSpace`, `mathlib:ContinuousMap.norm_coe_le_norm`, `mathlib:ContinuousMap.norm_le`, `mathlib:LinearMap.mkContinuous`.

API:

- `ContinuousMap.zeroExtendClopen_apply_mem` (simp): For x∈s, z_s(f)(x)=f(x); promoted to clopen-zero-extension-inside.
- `ContinuousMap.zeroExtendClopen_apply_not_mem` (simp): For x∉s, z_s(f)(x)=0; promoted to clopen-zero-extension-outside.
- `ContinuousMap.norm_zeroExtendClopen` (relation): ‖z_s(f)‖=‖f‖, including s empty; promoted to clopen-zero-extension-norm.
- `ContinuousMap.restrict_zeroExtendClopen` (relation): Restriction of z_s(f) to s is f; promoted to clopen-zero-extension-restriction.
- `ContinuousMap.zeroExtendClopen_restrict` (compatibility): z_s(f|s)=χ_s f, where χ_s is the native continuous characteristic function; promoted to clopen-zero-extension-projector.
- `AddHomClass.map_add` (structure): Native inherited API: The continuous linear map preserves addition, zero and R-scalars by its inherited structure.

Uses:

- RJW Remark 3.31: Separate a functional on the subset from its ambient extension by the native inclusion pushforward.
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction: Supply the clopen restriction used before transporting to the native units group.
- DirichletPadicLFunctions:L1 and L4: Distinguish intrinsic unit-group measures used for smoothing and coefficient measures from ambient unit-supported measures; no reverse prerequisite is introduced.

Unit tests:

- `SuggestedTests.Clopen.clopen_zero_extension_inside` (computation): For X=Fin 2 with its discrete topology, s={0} and R=ℤ, extension of the constant 7 on s has value 7 at 0.
- `SuggestedTests.Clopen.clopen_zero_extension_outside` (non-example): For the same data it has value 0 at 1, rather than 7.
- `SuggestedTests.Clopen.clopen_zero_extension_empty` (degenerate): Extension of the unique zero test function on the empty clopen is zero.
- `SuggestedTests.Clopen.clopen_zero_extension_full` (compatibility): Extending the constant 7 from the full clopen gives the constant 7 on Fin 2.

Acceptance: The output is continuous even when f has no extension already given on X; the clopen hypothesis supplies the gluing.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Extension agrees on its clopen domain

`PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside` — lemma.

For f∈C(s,R) and x∈s, z_s(f)(x)=f(x).

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Apply the gluing evaluation property in the definition of z_s on the s piece.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension`, `mathlib:ContinuousMap.liftCover_coe`.

Acceptance: The subtype point keeps its membership proof; the value is independent of that proof.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Extension vanishes on the complement

`PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside` — lemma.

For f∈C(s,R) and x∉s, z_s(f)(x)=0.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Apply the gluing evaluation property on the complementary piece, whose function is zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension`, `mathlib:ContinuousMap.liftCover_coe`.

Acceptance: A nonempty complement does not inherit the original constant value.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Extension by zero preserves the supremum norm

`PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-norm` — lemma.

For every f∈C(s,R), ‖z_s(f)‖=‖f‖. Thus z_s is isometric, also for the empty clopen.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. For the upper bound split X into s and its complement and use the two evaluation lemmas with ContinuousMap.norm_le.
2. For the lower bound, every value f(x) for x∈s is a value of z_s(f), hence has norm at most ‖z_s(f)‖. Apply ContinuousMap.norm_le on the compact subtype. This proof uses a nonnegative bound and never chooses a point of s.
3. Linearity gives the corresponding equality of distances by applying the norm identity to a difference.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:ContinuousMap.norm_coe_le_norm`, `mathlib:ContinuousMap.norm_le`, `mathlib:IsClosed.isCompact`, `mathlib:isCompact_iff_compactSpace`.

Acceptance: When s is empty both norms are zero; no Nonempty assumption is hidden.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Restriction retracts extension of test functions

`PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-restriction` — lemma.

For every f∈C(s,R), (z_s(f))|s=f.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Apply continuous-function extensionality and clopen-zero-extension-inside.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`.

Acceptance: Restriction is the native ContinuousMap.restrict operation.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Extending a restricted test function gives its characteristic multiplier

`PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-projector` — lemma.

For f∈C(X,R), z_s(f|s)=χ_s f, where χ_s=(LocallyConstant.charFn R s.isClopen).toContinuousMap.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Use the two extension evaluation lemmas. On s both sides equal f, and off s both vanish by the native characteristic-function formula.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:LocallyConstant.charFn`, `mathlib:LocallyConstant.toContinuousMap`, `mathlib:LocallyConstant.coe_charFn`.

Acceptance: This is a function identity on X, with neither support nor positivity assumptions on a measure.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Measures restricted to a clopen subtype

`PadicMeasuresIwasawaAlgebras:L0/clopen-restriction` — construction.

Define AbstractMeasure.restrictClopen s R : D(X,R) →ₗ[R] D(s,R), denoted r_s, by r_s(μ)(f)=μ(z_s(f)). Denote by j_s the already existing AbstractMeasure.map along ContinuousMap.subtypeVal s; it extends a measure on s to X.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Precompose the actual continuous R-linear functional μ with the continuous linear map z_s, using AbstractMeasure.toCLMEquiv. Composition is continuous and R-linear; dependence on μ is R-linear.
2. No new pushforward or measure carrier is defined: j_s is native map. Its test-function action is restriction by the pinned map_apply theorem.
3. Dirac evaluation and the pointwise extension lemmas give r_s(δ_x)=δ_x on the subtype when x∈s and zero when x∉s.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:ContinuousMap.subtypeVal`.

API:

- `AbstractMeasure.restrictClopen_apply` (characterisation): r_s(μ)(f)=μ(z_s(f)); promoted to clopen-restriction-evaluation.
- `AbstractMeasure.restrictClopen_map_subtype` (relation): r_s(j_sν)=ν; promoted to clopen-restriction-section.
- `AbstractMeasure.restrictClopen_dirac_mem` (simp): If x∈s, r_s(δ_x) is the native Dirac measure at the subtype point x.
- `AbstractMeasure.restrictClopen_dirac_not_mem` (simp): If x∉s, r_s(δ_x)=0.
- `AddHomClass.map_add` (structure): Native inherited API: Restriction preserves addition, zero and R-scalars by the inherited linear-map structure.
- `AbstractMeasure.restrictClopen_map_preimage` (functoriality): Restriction commutes with pushforward when the source subset is the preimage of the target clopen; promoted to clopen-restriction-pushforward.

Uses:

- RJW Remark 3.31: Separate a functional on the subset from its ambient extension by the native inclusion pushforward.
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction: Supply the clopen restriction used before transporting to the native units group.
- DirichletPadicLFunctions:L1 and L4: Distinguish intrinsic unit-group measures used for smoothing and coefficient measures from ambient unit-supported measures; no reverse prerequisite is introduced.

Unit tests:

- `SuggestedTests.Clopen.clopen_restriction_signed_atoms` (computation): For X=Fin 2, s={0}, R=ℤ, restricting 2δ₀−3δ₁ gives 2δ₀ on s.
- `SuggestedTests.Clopen.clopen_restriction_outside` (non-example): For the same data restricting δ₁ gives zero.
- `SuggestedTests.Clopen.clopen_restriction_empty` (degenerate): Every measure restricts to zero on the empty clopen.
- `SuggestedTests.Clopen.clopen_restriction_section` (compatibility): For any ν on {0}, native pushforward to Fin 2 followed by restriction recovers ν.

Acceptance: Restriction lands on D(s,R), whereas j_s r_s is an ambient endomorphism; these types are not silently identified.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

Atlas planet: Clopen measure restriction.

### Evaluation of intrinsic clopen restriction

`PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation` — lemma.

For μ∈D(X,R) and f∈C(s,R), r_s(μ)(f)=μ(z_s(f)).

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Unfold the continuous-linear precomposition defining r_s and the native toCLMEquiv evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction`.

Acceptance: The right side has an X-valued test-function domain; it never applies μ directly to f on s.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Clopen inclusion is split injective on measures

`PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-section` — lemma.

For every ν∈D(s,R), r_s(j_sν)=ν. In particular j_s is injective.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Test at f∈C(s,R). The restriction formula followed by native map_apply gives ν((z_s f)|s).
2. Apply clopen-zero-extension-restriction. Continuous-dual extensionality gives the identity, and a map with a left inverse is injective.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-restriction`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: At s empty this is the identity on the zero module of measures.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### The ambient clopen projector

`PadicMeasuresIwasawaAlgebras:L0/clopen-projector-evaluation` — lemma.

For μ∈D(X,R) and f∈C(X,R), (j_s r_s μ)(f)=μ(χ_s f).

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Native map_apply gives r_s μ(f|s). Apply clopen-restriction-evaluation and clopen-zero-extension-projector.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-projector`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: This identifies the ambient operator by all continuous test functions.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Supported measures come uniquely from the clopen subtype

`PadicMeasuresIwasawaAlgebras:L0/clopen-support-characterization` — theorem.

There exists a unique ν∈D(s,R) with j_sν=μ if and only if μ(f)=0 for every f∈C(X,R) vanishing on s. When it exists, ν=r_sμ.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. For μ=j_sν, native map_apply evaluates every such f to ν(0)=0.
2. Conversely f−χ_s f vanishes on s. The annihilation assumption and linearity give μ(f)=μ(χ_s f). Apply clopen-projector-evaluation and extensionality to obtain μ=j_s r_sμ.
3. Uniqueness follows from clopen-restriction-section. This is support in the continuous-dual sense, not the support of a real-valued measure.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-projector-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-section`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: For s empty the condition forces μ=0. Vanishing of μ on the single complementary characteristic function alone is insufficient: signed masses can cancel.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

Atlas planet: Clopen support characterization.

### Complementary clopen pieces reconstruct a measure

`PadicMeasuresIwasawaAlgebras:L0/clopen-complement-decomposition` — lemma.

For every μ∈D(X,R), j_s r_sμ+j_(sᶜ) r_(sᶜ)μ=μ.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Evaluate on f. The projector formulas give μ(χ_s f)+μ(χ_(sᶜ) f).
2. The characteristic functions sum to 1 pointwise, so linearity gives μ(f). Use continuous-dual extensionality.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-projector-evaluation`, `mathlib:LocallyConstant.coe_charFn`.

Acceptance: Both summands retain their signs and coefficients; no positivity is required.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

### Measure decomposition over complementary clopens

`PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-equivalence` — construction.

Define AbstractMeasure.clopenDecomposition s R : D(X,R) ≃ₗ[R] D(s,R)×D(sᶜ,R) by μ↦(r_sμ,r_(sᶜ)μ), with inverse (ν,η)↦j_sν+j_(sᶜ)η.

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier.

Proof outline:

1. Both forward coordinates and the inverse are R-linear by restriction and native pushforward.
2. The inverse after the forward map is the identity by clopen-complement-decomposition.
3. For the other identity, clopen-restriction-section gives each diagonal term. For a cross term, evaluate r_s(j_(sᶜ)η) on f: native map_apply and restriction evaluation give η((z_s f)|sᶜ)=0 by clopen-zero-extension-outside. The other cross term is identical with the sets exchanged.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-complement-decomposition`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-section`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:AbstractMeasure.map_apply`.

API:

- `AbstractMeasure.clopenDecomposition_apply` (projection): The two components are exactly r_sμ and r_(sᶜ)μ.
- `AbstractMeasure.clopenDecomposition_symm_apply` (constructor): The inverse is the sum of the native inclusion pushforwards.
- `LinearEquiv.injective` (extensionality): Native inherited API: Two ambient measures agree if their two restrictions agree, by the inherited linear equivalence.
- `LinearEquiv.apply_symm_apply` (relation): Native inherited inverse API: Recombining and restricting recovers both input measures; the opposite round trip recovers the ambient measure.

Uses:

- RJW Remark 3.31: Separate a functional on the subset from its ambient extension by the native inclusion pushforward.
- PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction: Supply the clopen restriction used before transporting to the native units group.
- DirichletPadicLFunctions:L1 and L4: Distinguish intrinsic unit-group measures used for smoothing and coefficient measures from ambient unit-supported measures; no reverse prerequisite is introduced.

Unit tests:

- `SuggestedTests.Clopen.clopen_decomposition_signed_atoms` (computation): For Fin 2, s={0}, R=ℤ, the pair for 2δ₀−3δ₁ is (2δ₀,−3δ₁) on the respective subtypes.
- `SuggestedTests.Clopen.clopen_decomposition_inverse` (compatibility): Recombining the unit Dirac measures on {0} and {1} gives δ₀+δ₁ on Fin 2.
- `SuggestedTests.Clopen.clopen_decomposition_zero` (degenerate): The zero measure maps to (0,0).

Acceptance: This is a finite algebraic product of native measure modules. It asserts no topology on the duals and no infinite disjoint-union theorem.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

Atlas planet: Complementary clopen decomposition.

### Restriction and pushforward along a preimage clopen

`PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-pushforward` — lemma.

Let Y be compact, q:X→Y continuous, t clopen in Y, and s=q⁻¹(t). With q_s:s→t the native ContinuousMap.restrictPreimage, r_t(q₊μ)=(q_s)₊(r_sμ).

Hypotheses: X is a compact topological space, s is a clopen subset, and R is a normed commutative ring. No field, completeness, ultrametricity, Hausdorffness of X, or nonemptiness of s is assumed. C(s,R) uses the subspace topology and its supremum norm; s is compact because it is closed in X. D(X,R) and D(s,R) are the existing AbstractMeasure carriers. No topology is installed on either measure carrier. Y is compact and q∈C(X,Y); t is clopen in Y, and s is exactly its inverse image.

Proof outline:

1. Test at f∈C(t,R). The left side is μ((z_t f)∘q). The right side is μ(z_s(f∘q_s)), by the two native map evaluation formulas and clopen restriction evaluation.
2. The functions agree on s by clopen-zero-extension-inside; off s both vanish by clopen-zero-extension-outside. This proves equality without requiring q to be injective, surjective or proper.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:AbstractMeasure.map_apply`, `mathlib:ContinuousMap.restrictPreimage`.

Acceptance: If q is constant outside t both sides vanish. An arbitrary source clopen in place of q⁻¹(t) would not give this formula.

Source: RJW-published, §3.5.3 and Remark 3.31, printed p.127 / physical PDF28; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, printed pp.119–121 / PDF20–22. Collated with arXiv v2 pp.14–15 and20. The source distinguishes the ambient restriction from the measure on the subset. This node is a worker decomposition and generalization to compact X and normed commutative coefficients, using native continuous maps, continuous duals and pushforward. Only clopen subsets are used, avoiding the unrestricted-subset claim of Remark 3.9.

## L2: bounded operators, Amice theory and intrinsic units

The pinned integral Amice equivalence A identifies D(ℤ_p,ℤ_p) with ℤ_p[[T]]. Its coefficient n is integration of the nth Mahler function. Weighting a measure by x corresponds to the Mahler derivation ∂=(1+T)D, so the kth ordinary moment is the constant coefficient of ∂ iterated k times. After embedding the value and series coefficients into ℚ_p, formal substitution T=exp(S)−1 gives k! times the kth coefficient. This formal exponential is not asserted integral or analytically convergent on all ℤ_p.

The ambient operators have explicit test-function definitions. Let P weight by the characteristic function of pℤ_p. The map φ is native pushforward by x↦px. Extend division by p from pℤ_p by zero, and push Pμ forward by this continuous function to obtain ψμ. Then ψφ=id and φψ=P. The ambient unit projector E=id−P satisfies Eμ=μ exactly when ψμ=0. None of these formulas divides a measure value by p.

For the intrinsic comparison, V={x∈ℤ_p:IsUnit x} is clopen. Native units have their topology induced by the pair of value and inverse; the continuous bijection h:ℤ_pˣ→V is a homeomorphism by compactness and Hausdorffness. Define r_U by r_V followed by native transport along h⁻¹, and let j_U be native pushforward along Units.val. Then r_Uj_U=id and j_Ur_U=E. This supplies the precise comparison used when the source treats a supported ambient measure as a measure on the unit group. It gives linear equivalences D(ℤ_pˣ,R)≃ker ψ and, for integral coefficients, D(ℤ_pˣ,ℤ_p)≃ker ψSeries through A. At p=2, additive convolution of δ₁ with itself is δ₂, whereas multiplicative convolution on units gives δ₁. Thus these linear equivalences do not preserve both products.

The inverse weight uses the existing p-adic integer unit inverse, extended by zero on every nonunit. Its continuity and weighting define J. Both WJ and JW equal E, where W weights by x; on ker ψ it is the unique inverse. Under unit dilation by a, the covariance factor is a⁻¹. Transport through A gives the inverse Mahler derivative on ker ψSeries. The operator on all ambient measures or series is a projected inverse, not an inverse on the whole space.

Prime-root averaging is constructed using actual topological power-series evaluation over the integer ring O of C_p. A pth root ζ satisfies |ζ−1|<1, including at p=2. The translated constant term is topologically nilpotent, but is generally nonzero, so the ordinary zero-constant formal substitution API is not substituted for the topological evaluation. Uniform Mahler tails, continuity in the coefficientwise topology and polynomial density give the root-average identity and unique integral descent. Rational comparisons clear denominators and keep the individual translated denominators nonzero; they do not apply the bounded ψ operator to an individual pole 1/T.

For a complete ultrametric normed commutative ℤ_p-algebra R with bounded scalar action, the bounded-sequence inverse pairs a bounded coefficient sequence with the Mahler coefficients of an R-valued continuous test function. Those Mahler coefficients tend to zero, so the pairing converges and has a uniform bound. It defines an actual R-valued measure and gives coefficient extension of an integral measure on ℤ_p. Arbitrary unbounded field-coefficient formal series are not inputs. The lattice, coefficient-tower, convolution, multivariable and topology comparisons remain separate entries in the ledger.


### Weighted measures

`PadicMeasuresIwasawaAlgebras:L2/weight` — construction.

Define AbstractMeasure.weight g : D(X,R) →ₗ[R] D(X,R) by (weight g μ)(f)=μ(gf). This acts on the existing carrier, not a second definition of bounded measures.

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Continuous functions on compact X form a normed commutative ring. Promote LinearMap.mulLeft R g to a continuous linear map by continuity of multiplication (also ‖gf‖≤‖g‖‖f‖). No scalar field is required.
2. Use AbstractMeasure.toCLMEquiv to transport μ, precompose with multiplication by g and transport back. Linearity in μ is inherited from composition.
3. The defining evaluation law gives weight 1=id, weight 0=0, constant-scalar compatibility and the Dirac formula. Weighting by x need not be invertible: it kills δ₀.

Prerequisites: `mathlib:AbstractMeasure`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:LinearMap.mulLeft`, `mathlib:AbstractMeasure.dirac_apply`.

API:

- `AbstractMeasure.weight_apply` (characterisation): (weight g μ)(f)=μ(gf); promoted to weight-evaluation.
- `AbstractMeasure.weight_one` (simp): weight 1 μ=μ.
- `AbstractMeasure.weight_zero` (simp): weight 0 μ=0.
- `AbstractMeasure.weight_mul` (compatibility): weight (gh) μ=weight g (weight h μ); promoted to weight-multiplication.
- `AbstractMeasure.weight_const` (compatibility): weight (const r) μ=r • μ.
- `AbstractMeasure.weight_dirac` (simp): weight g δ_a=g(a) • δ_a.
- `AbstractMeasure.map_weight` (functoriality): h₊(weight (g∘h) μ)=weight g (h₊μ); promoted to weight-pushforward.
- `AbstractMeasure.iterate_weight_apply` (compatibility): ((weight g)^[k] μ)(f)=μ(g^k f); promoted to weight-iteration.

Uses:

- DirichletPadicLFunctions:L1/measure-ordinary-moment: Use the generic ℚ_p coefficient formula for the particular integral measure. Bernoulli and zeta arithmetic remain Dirichlet-owned; this supplier has no reverse dependency.
- LocallyAnalyticDistributions:L1: Import the bounded reference operator; its extension to a different test-function topology needs the recipient's comparison.
- ColemanPowerSeries:L2/logarithmic-derivative: The numerator is (1+T)D; dividing by a series unit and the norm/trace comparison remain distinct Coleman constructions.

Unit tests:

- `SuggestedTests.weight_zero_atom` (non-example): Over ℤ₃, weight x δ₀=0 although δ₀≠0, as evaluation on 1 shows. Weighting by x is not injective.
- `SuggestedTests.weight_one_atom` (compatibility): Over ℤ₃, weight x δ₁=δ₁.
- `SuggestedTests.weight_two_atom` (computation): Over ℤ₃, weight x δ₂=2δ₂; this rejects ignoring g.

Acceptance: The construction itself was independently checked by a complete scratch Lean proof; the suggested deliverable remains an unchecked plan.

Source: RJW-published, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20 Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

Atlas planet: Weighted measures.

### Evaluation of a weighted measure

`PadicMeasuresIwasawaAlgebras:L2/weight-evaluation` — lemma.

For f : C(X,R), (weight g μ)(f)=μ(gf).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Unfold the transported composition and AbstractMeasure.toCLMEquiv. The equality is definitional.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight`.

Acceptance: At g=1 this gives μ(f); at g=0 it gives μ(0)=0.

Source: RJW-published, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20 Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Composition of weights

`PadicMeasuresIwasawaAlgebras:L2/weight-multiplication` — lemma.

For g,h : C(X,R), weight (gh) μ=weight g (weight h μ).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Use measure extensionality and weight-evaluation twice. The right side at f is μ(h(gf)); associativity and commutativity identify it with μ((gh)f).

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: The inner evaluation is h(gf), not evaluation of g at a point.

Source: RJW-published, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20 Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Projection formula for weights

`PadicMeasuresIwasawaAlgebras:L2/weight-pushforward` — lemma.

For compact Y, h : C(X,Y), g : C(Y,R), AbstractMeasure.map h (weight (g.comp h) μ)=weight g (AbstractMeasure.map h μ).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Evaluate at f : C(Y,R). The existing map_apply and weight-evaluation reduce both sides to μ((g∘h)(f∘h)). No new pushforward is defined.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: For h constant with value a the scalar weight is g(a), with g defined on Y.

Source: RJW-published, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20 Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Iterated weighting

`PadicMeasuresIwasawaAlgebras:L2/weight-iteration` — lemma.

For k∈ℕ and f : C(X,R), ((weight g)^[k] μ)(f)=μ(g^k f).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Induct on k. At zero, μ(f)=μ(1f). At the successor step apply weight-evaluation and the induction hypothesis at gf, then use g^k(gf)=g^(k+1)f. Weight-multiplication records the same action identity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`.

Acceptance: At k=0 the multiplier is 1 even if g vanishes; this is needed for the zero-th moment.

Source: RJW-published, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20 Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation` — definition.

Define PowerSeries.mahlerDerivation R : Derivation R R⟦T⟧ R⟦T⟧ as (1+T) • PowerSeries.derivative R. Write ∂F=(1+T)DF.

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Reuse the existing Derivation scalar action and formal derivative. Multiplying the derivation by 1+T inherits linearity, vanishing on constants and Leibniz.
2. Unfold scalar action for the explicit apply law. This operator never divides by F and is different from Coleman's logarithmic derivative.

Prerequisites: `mathlib:PowerSeries.derivative`, `mathlib:Derivation.smul_apply`.

API:

- `PowerSeries.mahlerDerivation_apply` (characterisation): ∂F=(1+T)DF; promoted to mahler-derivation-value.
- `PowerSeries.coeff_mahlerDerivation` (characterisation): coeff_n ∂F=(n+1)coeff_(n+1)F+n coeff_n F; promoted to mahler-derivation-coefficients.
- `PowerSeries.mahlerDerivation_C` (simp): ∂(C r)=0.
- `PowerSeries.mahlerDerivation_X` (simp): ∂T=1+T.
- `PowerSeries.mahlerDerivation_mul` (structure): ∂(FG)=F∂G+G∂F from the inherited derivation law.
- `PowerSeries.map_mahlerDerivation` (functoriality): map f (∂F)=∂(map f F); promoted to mahler-derivation-map.
- `PowerSeries.map_iterate_mahlerDerivation` (functoriality): Coefficient change commutes with ∂^[k]; promoted to mahler-derivation-iterate-map.
- `PowerSeries.constantCoeff_iterate_mahlerDerivation` (compatibility): Over a ℚ-algebra, constantCoeff(∂^[k] F)=k! coeff_k(F(exp T−1)); promoted to exp-coefficient.

Uses:

- DirichletPadicLFunctions:L1/measure-ordinary-moment: Use the generic ℚ_p coefficient formula for the particular integral measure. Bernoulli and zeta arithmetic remain Dirichlet-owned; this supplier has no reverse dependency.
- LocallyAnalyticDistributions:L1: Import the bounded reference operator; its extension to a different test-function topology needs the recipient's comparison.
- ColemanPowerSeries:L2/logarithmic-derivative: The numerator is (1+T)D; dividing by a series unit and the norm/trace comparison remain distinct Coleman constructions.

Unit tests:

- `SuggestedTests.mahler_constant` (degenerate): Over ℤ, ∂(C 7)=0.
- `SuggestedTests.mahler_X` (computation): Over ℤ, ∂T=1+T; D and TD both fail this test.
- `SuggestedTests.mahler_square` (computation): Over ℤ, ∂((1+T)^2)=2(1+T)^2.
- `SuggestedTests.mahler_char_three` (non-example): Over ZMod 3, ∂(T^3)=0 although T^3≠0.

Acceptance: Valid over every commutative ring, including positive characteristic. Its kernel is not claimed to consist only of constants.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

Atlas planet: Mahler derivation.

### Explicit Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value` — lemma.

PowerSeries.mahlerDerivation R F=(1+T)*PowerSeries.derivative R F.

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Unfold the definition, apply Derivation.smul_apply and the self-module action on the power-series ring.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation`, `mathlib:Derivation.smul_apply`.

Acceptance: The multiplier is 1+T, not T or 1.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Coefficients of the Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients` — lemma.

For n∈ℕ, coeff_n(∂F)=(n+1)coeff_(n+1)F+n coeff_n F.

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Expand (1+T)DF=DF+TDF using mahler-derivation-value.
2. The first coefficient is (n+1)coeff_(n+1)F by coeff_derivative. At n=0 the second term is zero. At n=m+1, coeff_mul_X_pow makes it coeff_m DF=(m+1)coeff_(m+1)F. Combine by commutativity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:PowerSeries.coeff_mul_X_pow`.

Acceptance: For F=T, coefficients 0 and 1 are both 1. A shifted factor on the second summand fails.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Coefficient change for the Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-map` — lemma.

For a ring homomorphism f : R →+* S between commutative rings, PowerSeries.map f (∂F)=mahlerDerivation S (PowerSeries.map f F).

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Use power-series extensionality, the coefficient formula, coeff_map and preservation of addition, multiplication and natural casts. No unlisted derivative-map theorem is assumed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`.

Acceptance: Reduction ℤ→ZMod 3 commutes with ∂, including ∂T^3=0.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Coefficient change for iterated derivations

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-iterate-map` — lemma.

For f : R →+* S and k∈ℕ, map f (∂^[k] F)=(mahlerDerivation S)^[k] (map f F).

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Induct on k. The zero case is reflexive; at the successor step use mahler-derivation-map and the induction hypothesis.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-map`.

Acceptance: At k=0 the map is the original coefficient map with no derivative.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Multiplication recurrence for Mahler functions

`PadicMeasuresIwasawaAlgebras:L2/mahler-recurrence` — lemma.

For n∈ℕ, x * mahler n = (n+1) • mahler (n+1) + n • mahler n as continuous ℤ_p-valued functions.

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. Use continuous-function extensionality and mahler_apply to reduce to Ring.choose x n.
2. Specialize Ring.choose_add_smul_choose at k=1: (n+1)choose(x+1,n+1)=(x+1)choose(x,n). Substitute Ring.choose_succ_succ and choose_one_right; expand and subtract choose(x,n).
3. No division by n+1 or n! occurs, so the recurrence also applies when p divides those integers.

Prerequisites: `mathlib:mahler`, `mathlib:mahler_apply`, `mathlib:Ring.choose_add_smul_choose`, `mathlib:Ring.choose_succ_succ`, `mathlib:Ring.choose_one_right`.

Acceptance: The pointwise recurrence was independently proved in Lean without placeholders. Includes n=0 and n=p−1.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Amice transform of multiplication by x

`PadicMeasuresIwasawaAlgebras:L2/amice-weight` — theorem.

A(weight x μ)=∂(Aμ) in ℤ_p⟦T⟧.

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. Use power-series extensionality at n. The left coefficient is (weight x μ)(mahler n) by coeff_amiceTransform.
2. Apply weight-evaluation and mahler-recurrence. Linearity gives (n+1)μ(mahler(n+1))+n μ(mahler n).
3. Identify the values with coefficients of Aμ and apply mahler-derivation-coefficients. Over ℤ_p the scalar multiple of the constant-one function in the existing Amice definition simplifies to mahler n.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/mahler-recurrence`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:AbstractMeasure.coeff_amiceTransform`.

Acceptance: For δ₂ this recovers ∂(1+T)^2=2(1+T)^2; replacing ∂ by D fails.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Amice transform of iterated weighting

`PadicMeasuresIwasawaAlgebras:L2/amice-iterate-weight` — lemma.

A((weight x)^[k] μ)=∂^[k](Aμ) for every k∈ℕ.

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. Induct on k, applying amice-weight to the iterated measure in the successor step. The zero case applies no derivative.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-weight`.

Acceptance: At k=0 the output is Aμ, without a positive-k restriction.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Ordinary moments from the Amice transform

`PadicMeasuresIwasawaAlgebras:L2/ordinary-moment` — theorem.

For k∈ℕ, μ(x^k)=constantCoeff(∂^[k](Aμ)) in ℤ_p.

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. For any ν, the constant coefficient of Aν is ν(mahler 0)=ν(1), by coeff_amiceTransform, mahler_apply and Ring.choose_zero_right.
2. Apply this to ν=(weight x)^[k] μ. Use amice-iterate-weight on the series and weight-iteration at f=1 on its evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-iterate-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-iteration`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:mahler_apply`, `mathlib:Ring.choose_zero_right`.

Acceptance: δ₀ has zero-th moment 1. The third moment of δ₂ is 8 although coeff₃(Aδ₂)=0.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

Atlas planet: Ordinary moments of the Amice transform.

### Exponential coordinate change

`PadicMeasuresIwasawaAlgebras:L2/exp-conjugacy` — lemma.

D(F(h))=(∂F)(h), where h=exp(T)−1 and F(h)=PowerSeries.subst h F.

Hypotheses: R is a commutative ℚ-algebra; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R. E=PowerSeries.exp R and h=E−1; constantCoeff h=0, so formal substitution at h is defined. No analytic convergence hypothesis or inverse substitution is asserted.

Proof outline:

1. constantCoeff_exp=1 gives constantCoeff h=0 and HasSubst h.
2. derivative_subst gives D(F(h))=(DF)(h)Dh, and derivative_exp gives Dh=E.
3. The substAlgHom laws, subst_X and subst_C give (1+T)(h)=1+h=E. Thus (∂F)(h)=E(DF)(h); use commutativity. No cancellation, domain hypothesis or analytic inverse theorem is used.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.constantCoeff_exp`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.derivative_subst`, `mathlib:PowerSeries.derivative_exp`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.subst_X`, `mathlib:PowerSeries.subst_C`, `mathlib:PowerSeries.subst_mul`, `mathlib:PowerSeries.derivative_one`.

Acceptance: The formal conjugacy was independently proved in Lean over an arbitrary commutative ℚ-algebra without placeholders.

Source: RJW-published, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27 Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### Iterated exponential coordinate change

`PadicMeasuresIwasawaAlgebras:L2/exp-iterate` — lemma.

D^[k](F(h))=(∂^[k] F)(h) for every k∈ℕ.

Hypotheses: R is a commutative ℚ-algebra; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R. E=PowerSeries.exp R and h=E−1; constantCoeff h=0, so formal substitution at h is defined. No analytic convergence hypothesis or inverse substitution is asserted.

Proof outline:

1. Induct on k. In the successor step rewrite by the induction hypothesis and apply exp-conjugacy to ∂^[k] F. No new analytic differentiability assertion is needed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/exp-conjugacy`.

Acceptance: At k=0 both sides equal F(h), not F.

Source: RJW-published, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27 Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### Factorial-normalized exponential coefficients

`PadicMeasuresIwasawaAlgebras:L2/exp-coefficient` — lemma.

constantCoeff(∂^[k] F)=k! coeff_k(F(h)) for every k∈ℕ.

Hypotheses: R is a commutative ℚ-algebra; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R. E=PowerSeries.exp R and h=E−1; constantCoeff h=0, so formal substitution at h is defined. No analytic convergence hypothesis or inverse substitution is asserted.

Proof outline:

1. Take constant coefficients in exp-iterate. Since h has zero constant coefficient, constantCoeff_subst_of_constantCoeff_zero gives constantCoeff(∂^[k] F) on the right.
2. On the left apply the existing constantCoeff_iterate_derivative; the factorial identity is baseline, not new work. Reverse the equality.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/exp-iterate`, `mathlib:PowerSeries.constantCoeff_subst_of_constantCoeff_zero`, `mathlib:PowerSeries.constantCoeff_iterate_derivative`.

Acceptance: For F=(1+T)^2 and k=3, coeff₃(F(exp T−1))=4/3, and 3!*(4/3)=8.

Source: RJW-published, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27 Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### Ordinary moments as exponential coefficients

`PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp` — theorem.

For μ : D(ℤ_p,ℤ_p) and k∈ℕ, (μ(x^k) : ℚ_p) = (k! : ℚ_p) * coeff_k(PowerSeries.subst (PowerSeries.exp ℚ_p−1) (PowerSeries.map (algebraMap ℤ_p ℚ_p) Aμ)).

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. Embed ordinary-moment into ℚ_p. The coefficient-zero instance of coeff_map commutes the constant coefficient with the embedding.
2. Use mahler-derivation-iterate-map for algebraMap ℤ_p ℚ_p to move the coefficient map inside ∂^[k].
3. Apply exp-coefficient over ℚ_p. Only the evaluated integral and series coefficients are embedded: μ remains integral. No missing inverse Amice equivalence over ℚ_p, measure scalar-extension theorem, or Bernoulli arithmetic is assumed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-iterate-map`, `PadicMeasuresIwasawaAlgebras:L2/exp-coefficient`, `mathlib:PowerSeries.coeff_map`.

Uses:

- DirichletPadicLFunctions:L1/measure-ordinary-moment: Use the generic ℚ_p coefficient formula for the particular integral measure. Bernoulli and zeta arithmetic remain Dirichlet-owned; this supplier has no reverse dependency.
- LocallyAnalyticDistributions:L1: Import the bounded reference operator; its extension to a different test-function topology needs the recipient's comparison.
- ColemanPowerSeries:L2/logarithmic-derivative: The numerator is (1+T)D; dividing by a series unit and the norm/trace comparison remain distinct Coleman constructions.

Acceptance: Includes k=0 and p=2. Formal exp is over ℚ_p, never over an assumed ℚ-algebra structure on ℤ_p.

Source: RJW-published, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19 Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

Source: RJW-published, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27 Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### The clopen subset pZ_p

`PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples` — lemma.

U=pZ is clopen in Z.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. By norm_lt_one_iff_dvd, U is the inverse image of the open interval (−∞,1) under the norm, hence open.
2. U is the image of compact Z under the continuous map m_p. This image is compact and hence closed in the metric space Z. Equality with the divisibility set is the definition of divisibility.

Prerequisites: `mathlib:PadicInt.norm_lt_one_iff_dvd`, `mathlib:PadicInt.compactSpace`.

Acceptance: For p=2, zero and 2 lie in U and 1 does not.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Exact division on pZ_p

`PadicMeasuresIwasawaAlgebras:L2/divide-by-p` — construction.

Define divideByP : C(Z,Z) by q(px)=x and q(y)=0 for y outside U.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Multiplication by the nonzero scalar p in the characteristic-zero domain Z gives a continuous bijection Z→U. Surjectivity is divisibility; injectivity is cancellation. Bundle its ordinary inverse as an equivalence.
2. Use Continuous.homeoOfEquivCompactToT2 to make this equivalence a homeomorphism. Its inverse is continuous on the subspace U.
3. Extend the inverse by zero off U. On the closed set U it is continuous by the subtype criterion, and on the closed complement it is constant. The frontier is empty, so continuous_piecewise pastes these maps without a boundary condition. Bundle the resulting continuous function.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples`, `mathlib:Continuous.homeoOfEquivCompactToT2`, `mathlib:continuous_piecewise`, `mathlib:PadicInt.compactSpace`.

API:

- `AbstractMeasure.divideByP_mul` (simp): q(px)=x; promoted to divide-by-p-mul.
- `AbstractMeasure.mul_divideByP` (characterisation): For x∈U, pq(x)=x; promoted to mul-divide-by-p.
- `AbstractMeasure.divideByP_of_not_dvd` (simp): For x∉U, q(x)=0.

Uses:

- PadicMeasuresIwasawaAlgebras:L2/psi-measure: Rescales the argument only after restriction to pZ_p, without dividing a measure value by p.

Unit tests:

- `SuggestedTests.divide_zero` (degenerate): q(0)=0 over ℤ₃.
- `SuggestedTests.divide_six` (computation): q(6)=2 over ℤ₃; rejects the identically-zero function.
- `SuggestedTests.divide_unit` (non-example): q(1)=0 over ℤ₃; it is not multiplication by a ring inverse of 3.
- `SuggestedTests.divide_dyadic` (computation): q(6)=3 over ℤ₂.

Acceptance: The extension convention is zero off U, not an inverse for the ring operation p in Z.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Division after multiplication

`PadicMeasuresIwasawaAlgebras:L2/divide-by-p-mul` — lemma.

For every x∈Z, q(px)=x.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. px belongs to U. The inverse of the multiplication homeomorphism used in divide-by-p sends px to x.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/divide-by-p`.

Acceptance: At p=3 and x=2 the value is 2.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Multiplication after division on pZ_p

`PadicMeasuresIwasawaAlgebras:L2/mul-divide-by-p` — lemma.

For x∈U, pq(x)=x.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Use the opposite inverse identity of the multiplication homeomorphism at the element (x,hx) of U.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/divide-by-p`.

Acceptance: The membership hypothesis cannot be dropped: at x=1 the left side is zero.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Restriction to pZ_p

`PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples` — construction.

Define restrictMultiples : D(Z,R)→ₗ[R]D(Z,R) to be weight χ. It is restriction followed by extension by zero on the ambient Z carrier.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. clopen-pmultiples supplies U to LocallyConstant.charFn R; its existing toContinuousMap gives χ. Reuse weight χ directly.
2. The characteristic-function values give χ²=χ pointwise. The existing weight-multiplication law gives idempotence. Evaluation on a Dirac measure gives the stated cases; no nontriviality hypothesis on R is needed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`, `mathlib:LocallyConstant.charFn`, `mathlib:LocallyConstant.toContinuousMap`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.dirac_apply`.

API:

- `AbstractMeasure.restrictMultiples_eq_weight` (compatibility): restrictMultiples=weight χ, using the existing weight carrier.
- `AbstractMeasure.restrictMultiples_apply` (characterisation): Pμ(f)=μ(χf); promoted to restriction-evaluation.
- `AbstractMeasure.restrictMultiples_dirac` (simp): Pδ_x=δ_x if x∈U, and zero otherwise.
- `AbstractMeasure.restrictMultiples_idem` (relation): P(Pμ)=Pμ.

Uses:

- ColemanPowerSeries:L1: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- LocallyAnalyticDistributions:L1: Supplies bounded operators that the recipient must compare with its different test-function topology.

Unit tests:

- `SuggestedTests.restrict_zero_atom` (degenerate): Pδ₀=δ₀ over ℤ₃, since 0 belongs to 3ℤ₃.
- `SuggestedTests.restrict_unit_atom` (non-example): Pδ₁=0 over ℤ₃.
- `SuggestedTests.restrict_three_atom` (computation): Pδ₃=δ₃ over ℤ₃; restriction does not rescale the atom.

Acceptance: Generic clopen-subtype restriction and inclusion are supplied by L0/clopen-restriction and L0/clopen-restriction-section; this construction specializes the existing weighting operator.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Evaluation after restriction

`PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation` — lemma.

Pμ(f)=μ(χf).

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Apply weight-evaluation to the definition P=weight χ.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: Taking f=1 computes the mass on pZ_p.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Frobenius on bounded measures

`PadicMeasuresIwasawaAlgebras:L2/phi-measure` — construction.

Define phiMeasure=AbstractMeasure.map m_p as an R-linear endomorphism of D(Z,R). Denote it φ.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Multiplication by p is continuous on Z. Apply the existing pushforward map to that continuous map.
2. Pushforward evaluation and its Dirac compatibility give the immediate API. The injectivity API is justified by the separately promoted psi-phi theorem; it is not an input to this data construction.

Prerequisites: `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.map_dirac`.

API:

- `AbstractMeasure.phiMeasure_eq_map` (compatibility): φ equals the pinned pushforward along m_p.
- `AbstractMeasure.phiMeasure_apply` (characterisation): φμ(f)=μ(f∘m_p); promoted to phi-evaluation.
- `AbstractMeasure.phiMeasure_dirac` (simp): φδ_x=δ_(px).
- `AbstractMeasure.phiMeasure_injective` (characterisation): φ is injective; proof supplied by psi-phi.

Uses:

- ColemanPowerSeries:L1: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- LocallyAnalyticDistributions:L1: Supplies bounded operators that the recipient must compare with its different test-function topology.

Unit tests:

- `SuggestedTests.phi_zero` (degenerate): φ(0)=0 over ℤ₃.
- `SuggestedTests.phi_two_atom` (computation): φδ₂=δ₆ over ℤ₃.
- `SuggestedTests.phi_mass` (compatibility): φμ(1)=μ(1) over ℤ₃; rejects an extra factor p.

Acceptance: The map sends atoms forward and preserves total mass.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

Atlas planet: Frobenius on measures.

### Evaluation after Frobenius

`PadicMeasuresIwasawaAlgebras:L2/phi-evaluation` — lemma.

φμ(f)=μ(f∘m_p).

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Use the exact existing AbstractMeasure.map_apply statement at m_p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-measure`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: The first ordinary moment is multiplied by p.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The left inverse of Frobenius

`PadicMeasuresIwasawaAlgebras:L2/psi-measure` — construction.

Define psiMeasure=(AbstractMeasure.map q)∘restrictMultiples as an R-linear endomorphism of D(Z,R). Denote it ψ.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. First apply P, then the existing pushforward along q. Both maps are R-linear and their output is on the original AbstractMeasure carrier.
2. Evaluation gives μ(χ(f∘q)). The factor χ makes the arbitrary extension q=0 off U harmless. It is essential: bare pushforward by q would send every outside atom to δ₀ instead of zero.
3. This construction does not divide μ(f) by p and works over the stated normed commutative rings. Its boundedness as a functional follows from the actual continuous-map composition and weight construction.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/divide-by-p`, `PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.map_dirac`.

API:

- `AbstractMeasure.psiMeasure_eq_map_restrict` (compatibility): ψ=(map q)∘P, as linear maps.
- `AbstractMeasure.psiMeasure_apply` (characterisation): ψμ(f)=μ(χ(f∘q)); promoted to psi-evaluation.
- `AbstractMeasure.psiMeasure_dirac` (simp): ψδ_x=δ_(q(x)) for x∈U, and zero otherwise.
- `AbstractMeasure.psiMeasure_phiMeasure` (relation): ψφμ=μ; promoted to psi-phi.
- `AbstractMeasure.phiMeasure_psiMeasure` (relation): φψμ=Pμ; promoted to phi-psi.

Uses:

- ColemanPowerSeries:L1: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- LocallyAnalyticDistributions:L1: Supplies bounded operators that the recipient must compare with its different test-function topology.

Unit tests:

- `SuggestedTests.psi_zero_atom` (degenerate): ψδ₀=δ₀ over ℤ₃.
- `SuggestedTests.psi_six_atom` (computation): ψδ₆=δ₂ over ℤ₃; no scalar 1/3 occurs.
- `SuggestedTests.psi_unit_atom` (non-example): ψδ₁=0 over ℤ₃; bare pushforward by q would give δ₀.
- `SuggestedTests.psi_dyadic` (computation): ψδ₆=δ₃ over ℤ₂.

Acceptance: ψδ₀=δ₀ and ψδ₁=0 distinguish restriction before rescaling.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

Atlas planet: Left inverse of Frobenius.

### Evaluation after the left inverse

`PadicMeasuresIwasawaAlgebras:L2/psi-evaluation` — lemma.

ψμ(f)=μ(χ(f∘q)).

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Apply map_apply, then restriction-evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: The total mass is μ(χ), not μ(1)/p.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The left inverse identity

`PadicMeasuresIwasawaAlgebras:L2/psi-phi` — theorem.

ψ(φμ)=μ for every μ∈D(Z,R).

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Test on an arbitrary continuous f. Use psi-evaluation and then phi-evaluation to obtain μ(x↦χ(px)f(q(px))).
2. Here χ(px)=1 by divisibility and q(px)=x by divide-by-p-mul. The test function is f; continuous-dual extensionality gives the result.
3. The change of variables leaves μ as the integrating measure in this intermediate expression. This is the correction in source finding E4.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/divide-by-p-mul`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.toCLMEquiv`.

Acceptance: At p=3, μ=δ₁ and f=x, both sides evaluate to 1; keeping φμ in the intermediate integral incorrectly gives 3.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Frobenius after its left inverse

`PadicMeasuresIwasawaAlgebras:L2/phi-psi` — theorem.

φ(ψμ)=Pμ for every μ∈D(Z,R).

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Test on f and apply phi-evaluation and psi-evaluation: the integrand is χ(x)f(pq(x)).
2. For x∈U, mul-divide-by-p replaces pq(x) by x. Outside U, χ is zero; hence the test function is χf everywhere.
3. Use restriction-evaluation and extensionality. No identity pq(x)=x is asserted outside U.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/mul-divide-by-p`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.toCLMEquiv`.

Acceptance: φψδ₁=0, so φψ is a projector rather than the identity on all measures.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Restriction to units

`PadicMeasuresIwasawaAlgebras:L2/unit-restriction` — construction.

Define unitRestriction=id−P as an R-linear endomorphism of D(Z,R), denoted E. Its test-function multiplier is 1−χ, the characteristic function of Z×.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Subtract P from the identity linear map. By norm_lt_one_iff_dvd and not_isUnit_iff the complement of U is exactly the units.
2. Linearity of μ gives Eμ(f)=μ((1−χ)f). Pointwise (1−χ)²=1−χ and the weight construction prove idempotence. Dirac evaluation yields the unit/nonunit cases.
3. Together with phi-psi, E=id−φψ. The API ψE=0 and Eφ=0 follows from the two composition identities and linearity. This does not construct a measure on a separately defined unit-subtype carrier.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`, `PadicMeasuresIwasawaAlgebras:L2/psi-phi`, `mathlib:PadicInt.norm_lt_one_iff_dvd`, `mathlib:PadicInt.not_isUnit_iff`, `mathlib:AbstractMeasure.dirac_apply`.

API:

- `AbstractMeasure.unitRestriction_eq_sub` (compatibility): E=id−P as linear maps.
- `AbstractMeasure.unitRestriction_apply` (characterisation): Eμ(f)=μ((1−χ)f); promoted to unit-restriction-evaluation.
- `AbstractMeasure.unitRestriction_dirac` (simp): Eδ_x=δ_x if x is a unit, and zero otherwise.
- `AbstractMeasure.unitRestriction_idem` (relation): E²=E.
- `AbstractMeasure.unitRestriction_eq_self_iff` (characterisation): Eμ=μ iff μ(χf)=0 for every f; promoted to unit-restriction-support.
- `AbstractMeasure.unitRestriction_eq_self_iff_psi_eq_zero` (characterisation): Eμ=μ iff ψμ=0; promoted to unit-support-psi.
- `AbstractMeasure.psiMeasure_unitRestriction` (relation): ψ(Eμ)=0.
- `AbstractMeasure.unitRestriction_phiMeasure` (relation): E(φμ)=0.

Uses:

- ColemanPowerSeries:L1: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- LocallyAnalyticDistributions:L1: Supplies bounded operators that the recipient must compare with its different test-function topology.

Unit tests:

- `SuggestedTests.unit_one_atom` (compatibility): Eδ₁=δ₁ over ℤ₃.
- `SuggestedTests.unit_zero_atom` (degenerate): Eδ₀=0 over ℤ₃.
- `SuggestedTests.unit_three_atom` (non-example): Eδ₃=0 over ℤ₃; a nonzero atom need not be on units.

Acceptance: A unit atom survives; both δ₀ and δ_p vanish.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

Atlas planet: Restriction to units.

### Evaluation after restriction to units

`PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation` — lemma.

Eμ(f)=μ((1−χ)f).

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Expand E=id−P and use restriction-evaluation and linearity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`.

Acceptance: For f=1, total unit mass is μ(1−χ).

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Test-function support on units

`PadicMeasuresIwasawaAlgebras:L2/unit-restriction-support` — theorem.

Eμ=μ iff μ(χf)=0 for every f∈C(Z,R). Equivalently, μ annihilates every continuous function vanishing outside U.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. Eμ=μ is equivalent to Pμ=0 by subtraction in the additive group of measures.
2. Use restriction-evaluation and continuous-dual extensionality. Functions χf vanish outside U. Conversely any continuous g vanishing off U equals χg pointwise, giving the asserted support interpretation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.toCLMEquiv`.

Acceptance: This is a continuous-dual support condition, not MeasureTheory.support for real-valued measures.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Unit support and the kernel of psi

`PadicMeasuresIwasawaAlgebras:L2/unit-support-psi` — theorem.

Eμ=μ iff ψμ=0.

Hypotheses: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof outline:

1. If Eμ=μ then Pμ=0. Since ψ=(map q)∘P, linearity gives ψμ=0.
2. If ψμ=0, phi-psi gives Pμ=φ0=0, so Eμ=μ. The statement holds without dividing coefficients by p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`.

Acceptance: δ₁ is killed by ψ and fixed by E; δ₀ is fixed by ψ and killed by E.

Source: RJW-published, Corollary 3.32, printed p.129 / PDF30; equations (3-7)–(3-8), printed p.128 / PDF29. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Mahler expansion under dilation

`PadicMeasuresIwasawaAlgebras:L2/mahler-frobenius` — lemma.

For n≥0 and x∈Z, mahler_n(px)=Σ_(0≤k≤n) coeff_n(b^k) mahler_k(x).

Hypotheses: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof outline:

1. At x=m a natural number, expand (1+T)^(pm)=(1+b)^m by add_pow. Coefficients of (1+T)^(pm) are binomial(pm,n), using Polynomial.coeff_one_add_X_pow and Polynomial.coeff_coe. The right side has coefficient Σ_k binomial(m,k) coeff_n(b^k).
2. Since constantCoeff b=0, le_order_pow_of_constantCoeff_eq_zero and coeff_of_lt_order give coeff_n(b^k)=0 for k>n. Terms k>m also vanish by the natural binomial convention. Thus both finite ranges can be replaced by 0≤k≤n. mahler_natCast_eq identifies the claimed natural-point identity.
3. Both sides are continuous functions of x: the left is a continuous Mahler function composed with multiplication by p; the right is a finite linear combination of continuous Mahler functions. Apply denseRange_natCast and DenseRange.equalizer to extend to all Z.

Prerequisites: `mathlib:mahler`, `mathlib:mahler_natCast_eq`, `mathlib:PadicInt.denseRange_natCast`, `mathlib:DenseRange.equalizer`, `mathlib:add_pow`, `mathlib:Polynomial.coeff_one_add_X_pow`, `mathlib:Polynomial.coeff_coe`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`.

Acceptance: At p=3,n=2: binomial(3x,2)=3 binomial(x,1)+9 binomial(x,2), checked by the suggested example.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker finite-coefficient proof of equation (3-7), replacing informal integration of a formal series by a finite identity on each coefficient.

### Frobenius and the Amice transform

`PadicMeasuresIwasawaAlgebras:L2/amice-phi` — comparison.

A(φμ)=PowerSeries.subst b (Aμ) for integral Z-valued μ.

Hypotheses: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof outline:

1. Take coefficient n. coeff_amiceTransform and phi-evaluation identify the left side with μ(x↦mahler_n(px)).
2. Apply mahler-frobenius as an equality of continuous test functions. Move the finite sum and scalar coefficients through the Z-linear functional μ.
3. On the right use coeff_subst' with HasSubst supplied by constantCoeff b=0. As in mahler-frobenius, the order bound kills all indices k>n, reducing its finite-support sum to the same finite sum. Power-series extensionality finishes.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/mahler-frobenius`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`.

Acceptance: The constant coefficient is preserved. For δ₂ at p=3 the series is (1+T)^6.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Exact integral-carrier comparison for source equation (3-7). The substitution operator itself is already in Mathlib.

### Psi on integral power series

`PadicMeasuresIwasawaAlgebras:L2/psi-series` — construction.

Define psiSeries=A∘ψ∘A⁻¹ : B→ₗ[Z]B. This is a linear operator, not a ring homomorphism.

Hypotheses: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof outline:

1. Use the existing amiceTransformEquiv and its inverse; compose their linear maps with psiMeasure. No new Amice carrier or inverse theorem is introduced.
2. The composite is Z-linear by the three existing linear-map structures. The promoted intertwining and left-inverse declarations prove its comparison API independently of this data construction.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:mahler_natCast_eq`.

API:

- `AbstractMeasure.psiSeries_eq_transport` (compatibility): psiSeries=A∘ψ∘A⁻¹ as linear maps.
- `AbstractMeasure.psiSeries_amiceTransform` (compatibility): psiSeries(Aμ)=A(ψμ); promoted to psi-series-intertwining.
- `AbstractMeasure.psiSeries_phi` (relation): psiSeries(subst b F)=F; promoted to psi-series-phi.
- `AbstractMeasure.psiSeries_one` (simp): psiSeries(1)=1.
- `AbstractMeasure.psiSeries_one_add_X` (simp): psiSeries(1+T)=0.

Uses:

- ColemanPowerSeries:L1: The normalized finite-free trace must be proved equal to this integral bounded ψ; no trace formula is assumed in this construction.
- ColemanPowerSeries:L2: Forms F−φψF on the bounded-series carrier before the recipient logarithmic-derivative comparison.

Unit tests:

- `SuggestedTests.psi_series_zero` (degenerate): psiSeries(0)=0 for p=3.
- `SuggestedTests.psi_series_one` (computation): psiSeries(1)=1 for p=3; rejects a zero operator.
- `SuggestedTests.psi_series_unit` (non-example): psiSeries(1+T)=0 for p=3.
- `SuggestedTests.psi_series_cube` (compatibility): psiSeries((1+T)^3)=1+T for p=3.
- `SuggestedTests.psi_series_dyadic` (computation): psiSeries((1+T)^2)=1+T for p=2.

Acceptance: At p=2 the images of Y and Y² show that the operator is not multiplicative. For the constant and linear tests, Aδ₀=1 and Aδ₁=1+T follow coefficientwise from coeff_amiceTransform, dirac_apply and mahler_natCast_eq. The Dirac formula for ψ then gives psiSeries(1)=1 and psiSeries(1+T)=0. The psi-series-phi theorem gives psiSeries((1+T)^p)=1+T.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Psi and the Amice transform

`PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining` — comparison.

psiSeries(Aμ)=A(ψμ).

Hypotheses: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof outline:

1. Expand transport and cancel A⁻¹A using the linear equivalence.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Acceptance: On δ_p both sides equal 1+T.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The power-series left inverse

`PadicMeasuresIwasawaAlgebras:L2/psi-series-phi` — theorem.

psiSeries(PowerSeries.subst b F)=F for every F∈B.

Hypotheses: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof outline:

1. Write F=Aμ using the integral equivalence. Replace subst b Aμ by Aφμ using amice-phi; then use psi-series-intertwining and psi-phi.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-phi`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/psi-phi`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Acceptance: At F=1+T and p=2, psiSeries((1+T)^2)=1+T.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The Amice unit projector

`PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction` — comparison.

A(Eμ)=Aμ−PowerSeries.subst b (psiSeries(Aμ)).

Hypotheses: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof outline:

1. E=id−P and phi-psi give Eμ=μ−φψμ. Apply the linear Amice transform, then amice-phi and psi-series-intertwining.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`, `PadicMeasuresIwasawaAlgebras:L2/amice-phi`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `mathlib:AbstractMeasure.amiceTransform`.

Acceptance: For μ=δ₁ the correction term is zero; for μ=δ₀ it removes all of Aμ.

Source: RJW-published, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Identification of p-adic unit inverses

`PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification` — lemma.

For every z∈Z, PadicInt.inv z=Ring.inverse z. Both functions already exist; no new inverse function is defined.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. For a unit z, PadicInt.mul_inv and isUnit_iff give z·PadicInt.inv(z)=1. Ring.mul_inverse_cancel gives z·Ring.inverse(z)=1. Cancel the nonzero z.
2. For a nonunit z, isUnit_iff implies ‖z‖≠1. Unfold the existing PadicInt.inv conditional using norm_eq_padic_norm: its value is zero. Ring.inverse_non_unit gives the same value.

Prerequisites: `mathlib:PadicInt.inv`, `mathlib:PadicInt.mul_inv`, `mathlib:PadicInt.isUnit_iff`, `mathlib:PadicInt.norm_eq_padic_norm`, `mathlib:Ring.inverse`, `mathlib:Ring.mul_inverse_cancel`, `mathlib:Ring.inverse_non_unit`.

Acceptance: At z=0 and z=p both functions vanish; at a unit they agree with its actual unit-group inverse. Complete scratch proof, without proof placeholders, checks this identification.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Continuity of the extended unit inverse

`PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-continuity` — lemma.

The existing function PadicInt.inv:Z→Z is continuous, including at zero and at every nonunit.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. Replace the existing function by Ring.inverse using padic-unit-inverse-identification.
2. At a unit u, apply NormedRing.inverse_continuousAt. The p-adic integer ring is a complete normed ring and supplies HasSummableGeomSeries; it is not treated as a field.
3. At a nonunit z, PadicInt.not_isUnit_iff gives ‖z‖<1. The open set {w:‖w‖<1} is a neighbourhood of z. Ring.inverse is identically zero there by inverse_non_unit. Transfer continuity from the constant-zero function via eventual equality.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification`, `mathlib:NormedRing.inverse_continuousAt`, `mathlib:PadicInt.not_isUnit_iff`, `mathlib:Ring.inverse_non_unit`.

Acceptance: Complete scratch Lean proof compiles without proof placeholders or warnings. The zero extension is essential; this is not continuity of field inversion at zero.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Division by x on unit-supported measures

`PadicMeasuresIwasawaAlgebras:L2/inverse-weight` — construction.

Define J=inverseWeight p : D→ₗ[Z]D by J=weight ι, where ι:C(Z,Z) bundles the existing PadicInt.inv using its continuity. Thus (Jμ)(f)=μ(ιf). The extension is zero on nonunits, including nonzero multiples of p.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. Bundle PadicInt.inv as a continuous map using padic-unit-inverse-continuity. Apply the preexisting weight construction; its compact-domain normed-ring hypotheses hold for Z.
2. The evaluation formula is weight_apply. The Dirac formula is weight_dirac, so Jδ_a=a.inv·δ_a. Existing linear-map laws supply zero, addition and scalar compatibility.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-continuity`, `PadicMeasuresIwasawaAlgebras:L2/weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

API:

- `AbstractMeasure.inverseWeight_eq_weight` (characterisation): J is exactly weighting by the bundled existing PadicInt.inv.
- `AbstractMeasure.inverseWeight_apply` (characterisation): (Jμ)(f)=μ(ιf). Promoted to inverse-weight-evaluation.
- `AbstractMeasure.inverseWeight_dirac` (simp): Jδ_a=a.inv·δ_a, hence zero at every nonunit.

Uses:

- RJW equation (4-3), printed p.138: Give the inverse x-weight on unit-supported integral measures used before pseudomeasure normalization.
- ColemanPowerSeries:L2: Supply the bounded inverse derivative and the inverse scalar factor of Proposition 12.5; Coleman retains its arithmetic and norm/trace comparisons.
- ColemanIntegration:L3/unit-moment-via-distribution-primitive: Provide the integral bounded reference for division by x; its locally analytic and larger-coefficient comparison remains with the stated owners.

Unit tests:

- `SuggestedTests.inverse_weight_zero_atom` (non-example): At p=3, Jδ₀=0.
- `SuggestedTests.inverse_weight_unit_atom` (compatibility): At p=3, Jδ₁=δ₁.
- `SuggestedTests.inverse_weight_two_atom` (computation): At p=3, 2·Jδ₂=δ₂; the multiplier is 1/2, not 2.
- `SuggestedTests.inverse_weight_nonunit_atom` (non-example): At p=3, Jδ₃=0 although 3≠0.
- `SuggestedTests.inverse_weight_dyadic_atom` (computation): At p=2, 3·Jδ₃=δ₃.

Acceptance: The concrete integral carrier is reused. No inverse of x is taken in the whole continuous-function ring, and no measure topology or field-valued inverse Amice theorem is assumed.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Evaluation after division by x

`PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation` — lemma.

(Jμ)(f)=μ(ιf) for every μ∈D and f∈C(Z,Z).

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. Unfold only inverseWeight and apply the earlier weight-evaluation theorem.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: For f=1 this is the negative first moment on unit support.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Unit support of the inverse weight

`PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support` — lemma.

For every μ∈D, J(rμ)=Jμ and r(Jμ)=Jμ. Thus J always lands in the actual unit-supported subspace and ignores the nonunit part.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. The main unit restriction has evaluation μ((1−χ_pZ)f). The identity 1−χ_pZ=1 on units and 0 on nonunits follows from not_isUnit_iff and norm_lt_one_iff_dvd.
2. Pointwise ι(1−χ_pZ)=ι: on units the indicator is 1; on nonunits the existing inverse is 0. Evaluate both composites using weight_apply and the restriction evaluation, then use commutativity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation`, `mathlib:PadicInt.not_isUnit_iff`, `mathlib:PadicInt.norm_lt_one_iff_dvd`, `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification`, `mathlib:Ring.inverse_non_unit`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation`.

Acceptance: The identities hold for all ambient μ, so support is obtained without assuming it of the input.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Multiplication after division by x

`PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight` — lemma.

For every μ∈D, W(Jμ)=rμ. In particular W(Jμ)=μ when ψμ=0.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. Pointwise z·PadicInt.inv(z) is 1 on units by mul_inv and is 0 on nonunits by the inverse identification. It is exactly1−χ_pZ by the nonunit/divisibility equivalences.
2. Evaluate W(Jμ) on f. The two weighting evaluations give μ(ι·x·f), which equals μ((1−χ_pZ)f). Use the unitRestriction evaluation. For the consequence use unitRestriction_eq_self_iff_psi_eq_zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-support-psi`, `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification`, `mathlib:PadicInt.mul_inv`, `mathlib:PadicInt.isUnit_iff`, `mathlib:PadicInt.not_isUnit_iff`, `mathlib:PadicInt.norm_lt_one_iff_dvd`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation`.

Acceptance: At μ=δ₀ or δ_p the composite is 0, so the ambient identity map would be false.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Division after multiplication by x

`PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight` — lemma.

For every μ∈D, J(Wμ)=rμ.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. Weight-multiplication and commutativity identify J(Wμ) with W(Jμ). Apply weight-inverse-weight. This is an equality of measures, tested on every continuous function.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`, `PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight`.

Acceptance: This gives the cancellation needed for uniqueness only after restricting to rμ=μ.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Unique unit-supported division by x

`PadicMeasuresIwasawaAlgebras:L2/inverse-weight-unique` — theorem.

If μ∈D satisfies ψμ=0, there exists a unique ν∈D with ψν=0 and Wν=μ. Its value is Jμ.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. Existence: inverse-weight-support makes r(Jμ)=Jμ, hence ψ(Jμ)=0 by unit support. Weight-inverse-weight gives W(Jμ)=rμ=μ.
2. Uniqueness: for any ν with ψν=0 and Wν=μ, apply J. Inverse-weight-weight gives ν=rν=J(Wν)=Jμ. The assertion is on the existing kernel condition, with no new carrier definition.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`, `PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight`, `PadicMeasuresIwasawaAlgebras:L2/unit-support-psi`.

Acceptance: The support hypothesis on both μ and ν is necessary for this inverse characterization; adding δ₀ otherwise preserves Wν.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Inverse weight under unit dilation

`PadicMeasuresIwasawaAlgebras:L2/inverse-weight-dilation` — lemma.

For a∈Zˣ let d_a:C(Z,Z) be z↦a·z. On all ambient μ, J(AbstractMeasure.map d_a μ)=a⁻¹·AbstractMeasure.map d_a(Jμ). The displayed map is the existing pushforward, not a newly constructed group action.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed.

Proof outline:

1. The inverse identification and Ring.inverse_mul applied to the unit a give ι(a z)=a⁻¹ι(z) for every z, including nonunits; Ring.inverse_unit fixes the inverse convention.
2. At f the left side is μ((ιf)∘d_a)=μ((ι∘d_a)(f∘d_a)). Substitute the pointwise identity, pull out the scalar a⁻¹ using measure linearity, and use inverseWeight_apply and map_apply for the right side.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/padic-unit-inverse-identification`, `mathlib:Ring.inverse_mul`, `mathlib:Ring.inverse_unit`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-evaluation`.

Unit tests:

- `SuggestedTests.inverse_weight_dilation_factor` (computation): At p=3, dilate δ₁ by 2 and then apply J: twice the result is δ₂. A factor 2 in place of 1/2 fails.

Acceptance: This is the measure calculation in (12-3), valid also for p=2. Identifying an arithmetic Galois action or formal substitution with this pushforward is a separate comparison.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Inverse Mahler derivative on unit support

`PadicMeasuresIwasawaAlgebras:L2/inverse-mahler` — construction.

Define H=inverseMahler p : Z[[T]]→ₗ[Z]Z[[T]] by H=A∘J∘A⁻¹, using the existing integral Amice linear equivalence A. Then H(Aμ)=A(Jμ), and ψSeries(HF)=0 for every F.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed. B=Z[[T]], A is the existing integral Amice linear equivalence, ∂ is the earlier Mahler derivation, H=inverseMahler p, and ψSeries is the earlier transport of ψ through A. The formal substituent b=(1+T)^p−1 has constant coefficient 0.

Proof outline:

1. Compose the linear maps of the existing Amice equivalence, inverseWeight and inverse equivalence. No inverse transform over a larger coefficient field is used.
2. The API intertwining and support statements are promoted below. For the tests, coefficientwise Dirac evaluation and mahler_natCast_eq give Aδ_n=(1+T)^n; apply inverseWeight_dirac and linearity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:mahler_natCast_eq`.

API:

- `AbstractMeasure.inverseMahler_eq_transport` (characterisation): H equals the displayed composition of three existing/planned linear maps.
- `AbstractMeasure.inverseMahler_amiceTransform` (compatibility): H(Aμ)=A(Jμ). Promoted to inverse-mahler-intertwining.
- `AbstractMeasure.psiSeries_inverseMahler` (compatibility): ψSeries(HF)=0. Promoted to inverse-mahler-support.

Uses:

- RJW equation (4-3), printed p.138: Give the inverse x-weight on unit-supported integral measures used before pseudomeasure normalization.
- ColemanPowerSeries:L2: Supply the bounded inverse derivative and the inverse scalar factor of Proposition 12.5; Coleman retains its arithmetic and norm/trace comparisons.
- ColemanIntegration:L3/unit-moment-via-distribution-primitive: Provide the integral bounded reference for division by x; its locally analytic and larger-coefficient comparison remains with the stated owners.

Unit tests:

- `SuggestedTests.inverse_mahler_constant` (non-example): At p=3, H(1)=0; the constant series is Aδ₀.
- `SuggestedTests.inverse_mahler_unit` (compatibility): At p=3, H(1+T)=1+T.
- `SuggestedTests.inverse_mahler_square` (computation): At p=3, 2H((1+T)²)=(1+T)².
- `SuggestedTests.inverse_mahler_nonunit` (non-example): At p=3, H((1+T)³)=0.
- `SuggestedTests.inverse_mahler_dyadic` (computation): At p=2, 3H((1+T)³)=(1+T)³.

Acceptance: H is an ambient linear extension of the inverse on kerψSeries. It is not an inverse of the Mahler derivative on all formal series.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Amice transform of division by x

`PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining` — comparison.

For every integral μ, H(Aμ)=A(Jμ).

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed. B=Z[[T]], A is the existing integral Amice linear equivalence, ∂ is the earlier Mahler derivation, H=inverseMahler p, and ψSeries is the earlier transport of ψ through A. The formal substituent b=(1+T)^p−1 has constant coefficient 0.

Proof outline:

1. Expand the transport defining H. Cancel A⁻¹A by the existing Amice linear equivalence.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Acceptance: On δ₂ at p=3 both sides have coefficients equal to those of (1+T)² divided by 2.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Unit support of the inverse Mahler derivative

`PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-support` — lemma.

For every integral formal series F, ψSeries(HF)=0.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed. B=Z[[T]], A is the existing integral Amice linear equivalence, ∂ is the earlier Mahler derivation, H=inverseMahler p, and ψSeries is the earlier transport of ψ through A. The formal substituent b=(1+T)^p−1 has constant coefficient 0.

Proof outline:

1. Write F=Aμ using surjectivity of the existing integral Amice equivalence. Inverse-mahler-intertwining writes HF=A(Jμ).
2. Inverse-weight-support gives r(Jμ)=Jμ, hence ψ(Jμ)=0 by unit support. Apply psi-series-intertwining to identify ψSeries(A(Jμ)) with A(ψ(Jμ))=0.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-support`, `PadicMeasuresIwasawaAlgebras:L2/unit-support-psi`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Acceptance: The conclusion holds for every F, not only for a series already killed byψ.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Mahler derivative after its unit inverse

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivative-inverse` — lemma.

For every integral formal series F, ∂(HF)=F−subst((1+T)^p−1)(ψSeries F), with ∂=(1+T)D. In particular ∂(HF)=F when ψSeries F=0.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed. B=Z[[T]], A is the existing integral Amice linear equivalence, ∂ is the earlier Mahler derivation, H=inverseMahler p, and ψSeries is the earlier transport of ψ through A. The formal substituent b=(1+T)^p−1 has constant coefficient 0.

Proof outline:

1. Write F=Aμ using the existing integral Amice equivalence. InverseMahler_amiceTransform and the earlier amice-weight turn the left side into A(W(Jμ)).
2. Apply weight-inverse-weight to get A(rμ). The main amiceTransform_unitRestriction gives precisely the displayed subtraction/substitution formula. The kernel consequence uses linearity and substitution at zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler`, `PadicMeasuresIwasawaAlgebras:L2/amice-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-inverse-weight`, `PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining`.

Acceptance: For F=1 both sides vanish: ψSeries1=1 and the restriction removes the atom0.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Unit inverse after the Mahler derivative

`PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-derivative` — lemma.

For every integral formal series F, H(∂F)=F−subst((1+T)^p−1)(ψSeries F).

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed. B=Z[[T]], A is the existing integral Amice linear equivalence, ∂ is the earlier Mahler derivation, H=inverseMahler p, and ψSeries is the earlier transport of ψ through A. The formal substituent b=(1+T)^p−1 has constant coefficient 0.

Proof outline:

1. Write F=Aμ. Amice-weight gives ∂F=A(Wμ); the defining inverseMahler comparison turns the left side into A(J(Wμ)).
2. Use inverse-weight-weight and then amiceTransform_unitRestriction. No claim that the ambient derivative is injective is used.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler`, `PadicMeasuresIwasawaAlgebras:L2/amice-weight`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight-weight`, `PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining`.

Acceptance: The derivative kills constant series; the right side removes their corresponding atom at 0.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### Unique unit-supported Mahler primitive

`PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-unique` — theorem.

If ψSeries F=0, there exists a unique integral formal series G with ψSeries G=0 and ∂G=F. It is G=HF.

Hypotheses: p is any prime, including 2; Z=ℤ_p with its pinned norm topology. D=D(Z,Z) is the existing integral AbstractMeasure carrier, x is the identity continuous function, and W=weight x. Write r=unitRestriction p Z and ψ=psiMeasure p Z. No topology on the measure carrier is newly imposed. B=Z[[T]], A is the existing integral Amice linear equivalence, ∂ is the earlier Mahler derivation, H=inverseMahler p, and ψSeries is the earlier transport of ψ through A. The formal substituent b=(1+T)^p−1 has constant coefficient 0.

Proof outline:

1. Existence uses psiSeries_inverseMahler and mahler-derivative-inverse; the projection term vanishes because ψSeries F=0.
2. For another G with ψSeries G=0 and ∂G=F, inverse-mahler-derivative gives G=H(∂G)=HF. This proves that ∂ restricts to a bijection of the existing kernel submodule without defining another series carrier.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivative-inverse`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-derivative`, `PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-support`.

Acceptance: The statement is integral and includes p=2. Neither an arbitrary primitive on all series nor uniqueness up to an unspecified constant is substituted for the kernel condition.

Source: RJW-published, Equation (4-3), printed p.138 / PDF39; Proposition 12.5, equation (12-3), printed pp.179–180 / PDF80–81; collated with arXiv v2 PDF28 and58–59. The source defines division by x on units. This is its integral specialization on the actual ambient measure carrier, using the existing p-adic unit inverse extended by zero. Continuity and the two ambient projection identities are the explicit library-level decomposition. The intrinsic/ambient comparison is supplied by L0/clopen-restriction and L2/intrinsic-unit-extension-projector; the present inverse-weight statement keeps its original ambient carrier.

### The linear topology on the receiving integer ring

`PadicMeasuresIwasawaAlgebras:L2/integer-ring-linear-topology` — comparison.

The induced topology on O=Valued.integer(ℂ_p) is a linear ring topology: zero has a basis of open ideals.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Use the existing valuation integer ring, not a new ring or a discrete topology. Its norm is the induced p-adic norm and its elements have norm at most 1.
2. For each positive radius r≤1, the elements of O with norm less than r form an ideal: the ultrametric inequality proves additivity and multiplication by an element of O cannot increase the norm. These are exactly the valuation ltIdeal balls.
3. The induced valued-field neighborhood basis is this ideal basis. Apply IsLinearTopology.mk_of_hasBasis. Completeness is supplied separately by the pinned closed-integer-subspace theorem; no finiteness or discretely valued hypothesis is imposed on O.

Prerequisites: `mathlib:Valued.integer`, `mathlib:Valuation.ltIdeal`, `mathlib:Valued.hasBasis_nhds_zero`, `mathlib:IsLinearTopology.mk_of_hasBasis`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The integral coefficient embedding

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map` — construction.

Let j₀:ℤ_p→ℂ_p be the composite ℤ_p→ℚ_p→ℂ_p. Define j:ℤ_p→O by lifting this existing ring map to the valuation integer ring, so the underlying ℂ_p value of j(x) is j₀(x).

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The composite preserves the p-adic norm; every x in ℤ_p has norm at most 1. Hence j₀(x) lies in the existing valuation integer subring.
2. Restrict the codomain of the existing composite ring homomorphism to that subring. All ring laws come from the existing maps. This is a coefficient embedding, not scalar extension of measures on arbitrary profinite spaces.

Prerequisites: `mathlib:Valued.integer`, `mathlib:PadicComplex.norm_extends'`, `mathlib:PadicInt.norm_le_one`.

API:

- `IwasawaAveraging.integralCoefficientMap_coe` (coercion): For every x∈ℤ_p, the image of j(x) in ℂ_p equals j₀(x). Promoted to integral-coefficient-map-coe.
- `IwasawaAveraging.integralCoefficientMap_continuous` (compatibility): The canonical coefficient embedding j:ℤ_p→O is continuous for the induced p-adic topologies. Promoted to integral-coefficient-map-continuous.
- `IwasawaAveraging.integralCoefficientMap_injective` (characterisation): The coefficient embedding j:ℤ_p→O is injective. Promoted to integral-coefficient-map-injective.

Uses:

- RJW equation (3-9); PadicMeasuresIwasawaAlgebras:L2/root-average: Evaluate integral series after root translation in a complete linear receiving topology and compare the finite sum with the actual bounded operator.
- DirichletPadicLFunctions:L1 rational psi requests: Supply generic rational-series averaging and finite partial fractions to the existing Dirichlet proof. Bernoulli formulas and the smoothed rational input remain in the consumer.
- ColemanPowerSeries:L1 and LocallyAnalyticDistributions:L1: Provide the bounded reference identity; recipients own their finite-free trace or locally analytic comparison. There is no reverse prerequisite.

Unit tests:

- `IwasawaAveraging.Tests.coefficient_zero` (degenerate): j(0)=0.
- `IwasawaAveraging.Tests.coefficient_one` (computation): j(1)=1; the zero map fails this test.
- `IwasawaAveraging.Tests.coefficient_agreement` (compatibility): For each x∈ℤ_p, the underlying C_p element of j(x) is the canonical image of x through ℚ_p.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The underlying coefficient embedding

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-coe` — lemma.

For every x∈ℤ_p, the image of j(x) in ℂ_p equals j₀(x).

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Unfold the codomain restriction in integral-coefficient-map. Its first component is exactly the composite through ℚ_p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Continuity of the coefficient embedding

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous` — lemma.

The canonical coefficient embedding j:ℤ_p→O is continuous for the induced p-adic topologies.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The embedding into ℂ_p preserves the p-adic norm, by the base-field norm-extension theorem and the subtype norm on ℤ_p.
2. A norm-preserving map is continuous. The induced subtype topology on O then gives continuity of the lifted map.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-coe`, `mathlib:PadicComplex.norm_extends'`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Faithfulness of the coefficient embedding

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-injective` — lemma.

The coefficient embedding j:ℤ_p→O is injective.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Equality after j implies equality after the inclusion into ℂ_p. This inclusion agrees with the composite through ℚ_p.
2. The first map is the inclusion of ℤ_p into its fraction field and the second is a field embedding; both are injective. Alternatively use the norm-preserving description to show that only zero maps to zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-coe`, `mathlib:PadicComplex.norm_extends'`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Prime roots of unity are close to one

`PadicMeasuresIwasawaAlgebras:L2/prime-root-sub-one-norm` — lemma.

For every ζ∈ℂ_p with ζ^p=1, including ζ=1 and p=2, one has |ζ−1|<1.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Since p>0 and ζ^p=1, ζ has finite order and the pinned finite-order norm lemma gives |ζ|=1. Thus w=ζ−1 satisfies |w|≤1 by ultrametricity.
2. Expand (1+w)^p=1. For 1≤k<p, the integer binomial coefficient binom(p,k) is divisible by p. Thus w^p is minus the sum of binom(p,k)w^k over this range.
3. Every summand has norm at most |p|=1/p<1. The ultrametric inequality yields |w|^p≤1/p, hence |w|<1. No unjustified substitution or assumption on a finite extension occurs.

Prerequisites: `mathlib:IsOfFinOrder.norm_eq_one`, `mathlib:PadicComplex.isNonarchimedean`, `mathlib:PadicComplex.norm_extends'`, `mathlib:Nat.Prime.dvd_choose_self`, `mathlib:add_pow`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Topological nilpotence of the root displacement

`PadicMeasuresIwasawaAlgebras:L2/integer-root-sub-one-nilpotent` — lemma.

For ζ∈O with ζ^p=1, the powers of ζ−1 tend to zero in O.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Include ζ in ℂ_p and apply prime-root-sub-one-norm. The subtype norm on O is the same norm.
2. The pinned norm-less-than-one power convergence theorem gives convergence of powers to zero. This is topological nilpotence; ζ−1 is not asserted algebraically nilpotent.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/prime-root-sub-one-norm`, `mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Uniform tails for integral Amice evaluation

`PadicMeasuresIwasawaAlgebras:L2/inverse-amice-uniform-tail` — lemma.

For f∈C(ℤ_p,ℤ_p) and ε>0 there is N such that, for every F∈ℤ_p[[T]] and n≥N, |invTransform(F)(f)−Σ_{k<n} c_k(f)·coeff_k(F)|<ε, where c_k(f) is its pinned Mahler coefficient.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Use the exact pinned invTransform_apply series, whose Mahler coefficients c_k(f) tend to zero.
2. Choose N so that |c_k(f)|≤ε/2 for every k≥N. The choice is independent of F because every integral coefficient of F has norm at most 1.
3. Split off the finite sum. Each remaining term has norm at most ε/2. The ultrametric sum bound gives a tail norm at most ε/2, which is strictly less than ε. The smaller bound is needed to preserve strictness after taking the infinite sum. The indexed prerequisite names the multiplicative source declaration; its generated additive counterpart is IsUltrametricDist.norm_tsum_le_of_forall_le, whose exact telescope was compiled and checked.

Prerequisites: `mathlib:AbstractMeasure.invTransform_apply`, `mathlib:PadicInt.mahlerEquiv`, `mathlib:PadicInt.norm_le_one`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Weak continuity of integral Amice evaluation

`PadicMeasuresIwasawaAlgebras:L2/inverse-amice-evaluation-continuous` — lemma.

For each f∈C(ℤ_p,ℤ_p), the map F↦invTransform(F)(f) is continuous for the coefficientwise p-adic topology on ℤ_p[[T]].

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Each finite Mahler pairing is a finite sum of continuous coefficient projections multiplied by fixed constants.
2. The preceding uniform tail estimate proves uniform convergence of those finite pairings to the actual inverse Amice evaluation. The uniform limit is continuous.
3. This is continuity against a fixed test function. It neither identifies the coefficientwise topology with the sup norm on coefficients nor asserts norm continuity of the full inverse transform.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/inverse-amice-uniform-tail`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Coefficientwise continuity of bounded psi

`PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous` — lemma.

The existing bounded integral operator psiSeries:ℤ_p[[T]]→ℤ_p[[T]] is continuous for the coefficientwise p-adic topology.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. For a fixed coefficient n, use the actual Amice transport and psi-evaluation: coeff_n(psiSeries F)=invTransform(F)(χ·(mahler_n∘q)), where χ is the clopen pℤ_p indicator and q is the existing extended exact-division map.
2. The indicated test function is continuous and integral. Apply inverse-amice-evaluation-continuous.
3. Continuity of every coefficient proves continuity into the product topology. No ring-homomorphism property of psi is used.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/inverse-amice-evaluation-continuous`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Continuity of the bounded averaging projector

`PadicMeasuresIwasawaAlgebras:L2/phi-psi-series-continuous` — lemma.

The map F↦φ(psiSeries F), where φ(F)=F((1+T)^p−1), is continuous in the coefficientwise p-adic topology.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The constant coefficient of b=(1+T)^p−1 is zero. For fixed n, coeff_n(F(b)) is a finite sum over k≤n of coeff_k(F)·coeff_n(b^k), using the pinned substitution coefficient formula.
2. Each such coefficient depends continuously on finitely many input coefficients. Therefore φ is continuous, and composition with psi-series-continuous gives the assertion.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Natural Dirac transforms

`PadicMeasuresIwasawaAlgebras:L2/amice-dirac-natural` — lemma.

For n∈ℕ, the Amice transform of the existing integral Dirac measure δ_n is (1+T)^n.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Evaluate the nth Dirac measure on each Mahler basis function. The pinned mahler_natCast_eq gives binom(n,k).
2. These are exactly the coefficients of (1+T)^n. Coefficient extensionality proves the equality.

Prerequisites: `mathlib:AbstractMeasure.dirac_apply`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:mahler_natCast_eq`, `mathlib:Polynomial.coeff_one_add_X_pow`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The bounded projector on natural powers

`PadicMeasuresIwasawaAlgebras:L2/phi-psi-natural-powers` — lemma.

For n∈ℕ, φ(psiSeries((1+T)^n)) equals (1+T)^n if p divides n and equals zero otherwise.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Use amice-dirac-natural to write the input as the transform of δ_n.
2. The existing phi-psi theorem gives restriction of δ_n to pℤ_p. Its value is δ_n precisely when p divides the p-adic integer n, and is zero otherwise.
3. For natural n, divisibility by p in ℤ_p agrees with ordinary divisibility. Transform back using the Dirac formula.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-dirac-natural`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`, `PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/amice-phi`, `mathlib:PadicInt.norm_lt_one_iff_dvd`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The convergent root-translation argument

`PadicMeasuresIwasawaAlgebras:L2/root-translation-convergence` — lemma.

For ζ∈O with ζ^p=1 and i∈ℕ, the series C(ζ^i)(1+T)−1 is topologically nilpotent in O[[T]] with its coefficientwise topology.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The constant coefficient is ζ^i−1. Since (ζ^i)^p=1, integer-root-sub-one-nilpotent applies.
2. Use the existing theorem that a power series over a linearly topological commutative ring is topologically nilpotent when its constant coefficient is. The target integer ring has the topology supplied above.
3. This supplies HasEval, not HasSubst. The latter would require algebraic nilpotence and is generally false here.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integer-root-sub-one-nilpotent`, `PadicMeasuresIwasawaAlgebras:L2/integer-ring-linear-topology`, `mathlib:MvPowerSeries.LinearTopology.isTopologicallyNilpotent_of_constantCoeff`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Integral topological root translation

`PadicMeasuresIwasawaAlgebras:L2/root-translation` — construction.

For ζ∈O with ζ^p=1 and i∈ℕ, define τ_i:ℤ_p[[T]]→O[[T]] to be the existing continuous topological evaluation ring homomorphism with coefficient map C∘j and argument C(ζ^i)(1+T)−1.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Use the existing complete Hausdorff integer ring O and its coefficientwise power-series topology. Completeness of O is the pinned closed-subspace result and completeness of the product is inherited.
2. The coefficient map is continuous by integral-coefficient-map-continuous and continuity of constant-series inclusion. The argument has HasEval by root-translation-convergence.
3. Instantiate PowerSeries.eval₂Hom. Its ring laws are inherited from this baseline construction; no second bounded psi or new power-series carrier is defined.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-convergence`, `mathlib:Valued.isClosed_integer`, `mathlib:IsClosed.completeSpace_coe`, `mathlib:PowerSeries.eval₂Hom`.

API:

- `IwasawaAveraging.rootTranslation_eq_eval` (characterisation): For integral F, τ_i(F)=eval₂(C∘j,C(ζ^i)(1+T)−1,F). Promoted to root-translation-evaluation.
- `IwasawaAveraging.rootTranslation_continuous` (compatibility): For fixed ζ and i, τ_i:ℤ_p[[T]]→O[[T]] is continuous in the coefficientwise p-adic topologies. Promoted to root-translation-continuous.
- `IwasawaAveraging.rootTranslation_polynomial` (compatibility): For P∈ℤ_p[T], τ_i(P)=P evaluated with coefficient map C∘j at C(ζ^i)(1+T)−1. Promoted to root-translation-polynomial.
- `IwasawaAveraging.rootTranslation_one_add_X_pow` (simp): For i,n∈ℕ, τ_i((1+T)^n)=C(ζ^(in))(1+T)^n. Promoted to root-translation-natural-powers.
- `IwasawaAveraging.rootTranslation_hasSum` (characterisation): For integral F, the series Σ_n C(j(coeff_n F))·(C(ζ^i)(1+T)−1)^n has sum τ_i(F) in O[[T]]. Promoted to root-translation-sum.
- `IwasawaAveraging.rootTranslation_zeroth` (simp): For every integral F, τ_0(F)=map(j,F). Promoted to root-translation-zeroth.

Uses:

- RJW equation (3-9); PadicMeasuresIwasawaAlgebras:L2/root-average: Evaluate integral series after root translation in a complete linear receiving topology and compare the finite sum with the actual bounded operator.
- DirichletPadicLFunctions:L1 rational psi requests: Supply generic rational-series averaging and finite partial fractions to the existing Dirichlet proof. Bernoulli formulas and the smoothed rational input remain in the consumer.
- ColemanPowerSeries:L1 and LocallyAnalyticDistributions:L1: Provide the bounded reference identity; recipients own their finite-free trace or locally analytic comparison. There is no reverse prerequisite.

Unit tests:

- `IwasawaAveraging.Tests.translation_zero` (degenerate): For p=2, ζ=−1 and i=1, τ_i(0)=0.
- `IwasawaAveraging.Tests.translation_variable` (computation): For p=2, ζ=−1 and i=1, τ_i(T)=−2−T. Omitting the translated constant term fails this test.
- `IwasawaAveraging.Tests.translation_odd_power` (computation): For p=2, ζ=−1 and i=1, τ_i((1+T)^3)=−(1+T)^3.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Root translation as topological evaluation

`PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation` — lemma.

For integral F, τ_i(F)=eval₂(C∘j,C(ζ^i)(1+T)−1,F).

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Unfold root-translation and use the pinned evaluation-homomorphism coercion formula. The evaluation uses the genuine complete linear topology established in the construction.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation`, `mathlib:PowerSeries.coe_eval₂Hom`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Continuity of root translation

`PadicMeasuresIwasawaAlgebras:L2/root-translation-continuous` — lemma.

For fixed ζ and i, τ_i:ℤ_p[[T]]→O[[T]] is continuous in the coefficientwise p-adic topologies.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Apply the pinned continuity theorem for topological evaluation to the continuous coefficient map and the HasEval argument supplied above.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-convergence`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous`, `mathlib:PowerSeries.continuous_eval₂`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Polynomial agreement of root translation

`PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial` — lemma.

For P∈ℤ_p[T], τ_i(P)=P evaluated with coefficient map C∘j at C(ζ^i)(1+T)−1.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Apply eval₂_coe to the actual evaluation formula. Only polynomial evaluation appears on the right, so it needs no infinite formal substitution.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation`, `mathlib:PowerSeries.eval₂_coe`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Root translation on natural powers

`PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers` — lemma.

For i,n∈ℕ, τ_i((1+T)^n)=C(ζ^(in))(1+T)^n.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The polynomial agreement maps 1+T to C(ζ^i)(1+T).
2. The ring-homomorphism law preserves nth powers. Commute the two factors and combine the powers of ζ.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The convergent series defining root translation

`PadicMeasuresIwasawaAlgebras:L2/root-translation-sum` — lemma.

For integral F, the series Σ_n C(j(coeff_n F))·(C(ζ^i)(1+T)−1)^n has sum τ_i(F) in O[[T]].

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Use the exact pinned hasSum_eval₂ theorem with the continuous coefficient map and the proven topological nilpotence.
2. The coefficient ring is O, whose topology is linear and complete. This result is not an evaluation theorem for arbitrary unbounded ℂ_p-valued coefficient sequences.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-convergence`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous`, `mathlib:PowerSeries.hasSum_eval₂`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The identity root translation

`PadicMeasuresIwasawaAlgebras:L2/root-translation-zeroth` — lemma.

For every integral F, τ_0(F)=map(j,F).

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. At i=0 the argument is T. For every polynomial P the two maps agree by polynomial evaluation.
2. Both maps are continuous for the coefficientwise topology; the coefficient map is continuous and polynomial inclusion has dense image. The equality therefore extends to every F.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-continuous`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous`, `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries`, `mathlib:DenseRange.equalizer`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Finite root orthogonality

`PadicMeasuresIwasawaAlgebras:L2/primitive-root-power-sum` — lemma.

For a commutative domain R, ζ∈R primitive of order p and n∈ℕ, Σ_{i<p} ζ^(in) is p if p divides n, and zero otherwise.

Hypotheses: R is a commutative domain; ζ has exact order p; n is a natural number.

Proof outline:

1. If p divides n, ζ^n=1 and every summand is 1.
2. Otherwise ζ^n≠1 by the primitive-root divisibility criterion. Multiplying the geometric sum by ζ^n−1 gives (ζ^n)^p−1=0. The first factor is nonzero; cancellation in the domain gives a zero sum.
3. No inverse of p is introduced. The formula also holds in receiving integral rings.

Prerequisites: `mathlib:IsPrimitiveRoot.pow_eq_one_iff_dvd`, `mathlib:geom_sum_mul`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Root averaging of polynomial transforms

`PadicMeasuresIwasawaAlgebras:L2/root-average-polynomial` — lemma.

For ζ∈O primitive of order p and P∈ℤ_p[T], p·map(j,φ(psiSeries P))=Σ_{i<p}τ_i(P) in O[[T]].

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. First take P=(1+T)^n. The left side is p times that power exactly when p divides n, by phi-psi-natural-powers.
2. The right side has the same value by root-translation-natural-powers and primitive-root-power-sum.
3. Every polynomial P(T) is a finite ℤ_p-linear combination of powers of 1+T: expand P(U−1) in U and then put U=1+T. Both sides are ℤ_p-linear through j, so the identity extends to P.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-psi-natural-powers`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers`, `PadicMeasuresIwasawaAlgebras:L2/primitive-root-power-sum`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Integral root averaging for bounded psi

`PadicMeasuresIwasawaAlgebras:L2/root-average` — theorem.

For ζ∈O primitive of order p and every F∈ℤ_p[[T]], p·map(j,φ(psiSeries F))=Σ_{i<p}τ_i(F) in O[[T]].

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The left side is continuous by phi-psi-series-continuous, coefficientwise continuity of map(j), and multiplication by the constant p.
2. The right side is a finite sum of continuous root translations. O[[T]] is Hausdorff.
3. The maps agree on the dense image of ℤ_p[T] by root-average-polynomial, hence everywhere. This compares the actual bounded Amice-transported psi; no trace comparison or alternate operator is assumed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-average-polynomial`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi-series-continuous`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-continuous`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous`, `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries`, `mathlib:DenseRange.equalizer`.

Unit tests:

- `IwasawaAveraging.Tests.average_variable_two` (computation): For p=2 and ζ=−1, τ_0(T)+τ_1(T)=−2; φψ(T)=−1, so the factor p cannot be omitted.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Unique integral descent of the root average

`PadicMeasuresIwasawaAlgebras:L2/root-average-integral-descent` — theorem.

For each integral F and primitive ζ∈O, there is a unique G∈ℤ_p[[T]] satisfying p·map(j,φ(G))=Σ_{i<p}τ_i(F). The unique G is psiSeries F.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Existence is root-average with G=psiSeries F.
2. For uniqueness, cancel the nonzero constant p in the domain O[[T]]. Cancel the injective coefficient map using PowerSeries.map_injective.
3. Finally φ is injective because psiSeries∘φ=id. No division by p is performed in O or ℤ_p, and the integral value is independent of the chosen primitive root.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-average`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-injective`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`, `mathlib:PowerSeries.map_injective`.

Acceptance: The unique integral G is ψF by root-average. Uniqueness implies independence of the choice of primitive root. No inverse of p is introduced in O.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Nonvanishing translated polynomial denominators

`PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-nonzero` — lemma.

For nonzero Q∈ℤ_p[T] and nonzero ζ∈ℂ_p, Q(ζY−1) is nonzero in Frac(ℂ_p[[T]]), where Y=1+T and coefficients use the canonical embedding.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. The coefficient embedding is injective, so the polynomial Q remains nonzero over ℂ_p.
2. Substitution T↦ζT+(ζ−1) has inverse T↦ζ⁻¹T+(ζ⁻¹−1); equivalently undo ζY−1 by (T+1)/ζ−1. Therefore it cannot send a nonzero polynomial to zero. These are polynomial compositions, not infinite substitutions.
3. The inclusions from polynomials to formal series and then to their fraction field are injective. The resulting rational denominator is consequently nonzero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-injective`, `mathlib:PowerSeries.map_injective`, `mathlib:IsFractionRing.injective`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Root translation of an integral rational series

`PadicMeasuresIwasawaAlgebras:L2/root-translation-rational` — comparison.

Let P,Q∈ℤ_p[T], Q(0) a unit, and F∈ℤ_p[[T]] with QF=P. After mapping τ_i(F) to Frac(ℂ_p[[T]]), its value is P(ζ^iY−1)/Q(ζ^iY−1).

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. Apply the actual root-translation ring homomorphism to QF=P. Polynomial agreement identifies its two polynomial factors.
2. Q(0) a unit implies Q≠0. Since ζ^p=1, each ζ^i is nonzero; translated-polynomial-nonzero proves the denominator nonzero.
3. Map the equality into the receiving fraction field and divide by this denominator. Nothing applies psi to an individual pole, and no arbitrary formal series is evaluated at ζ−1.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial`, `PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-nonzero`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-coe`, `mathlib:IsFractionRing.injective`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Rational-series averaging for the bounded operator

`PadicMeasuresIwasawaAlgebras:L2/rational-root-average` — theorem.

For ζ∈ℂ_p primitive of order p, P,Q∈ℤ_p[T] with Q(0) a unit, and integral F satisfying QF=P, one has p·J(φ(psiSeries F))=Σ_{i<p}P(ζ^iY−1)/Q(ζ^iY−1) in Frac(ℂ_p[[T]]). Here J is the canonical coefficient/series inclusion and Y=1+T.

Hypotheses: p is a prime, including 2; Z=ℤ_p, B=Z[[T]], Y=1+T and b=Y^p−1. A is the pinned integral Amice equivalence, φ is substitution by b, and ψ is the existing AbstractMeasure.psiSeries, with ψφ=id and φψ the pZ restriction projector. C_p is the pinned PadicComplex field, O is its existing valuation integer ring with the induced topology, and j₀:Z→C_p is the composite through ℚ_p. Power series carry the coefficientwise p-adic topology, not the uniform coefficient norm topology. Write j:Z→O for integral-coefficient-map and τ_i for root-translation whenever they occur.

Proof outline:

1. A root of unity has norm 1 by the pinned finite-order norm theorem. Thus ζ lies in the existing integer ring O; injectivity of O→ℂ_p reflects its primitive-root property.
2. Apply root-average in O[[T]], then map the identity through ℂ_p[[T]] into its fraction field.
3. Replace each translated integral series by its rational expression using root-translation-rational. The canonical coefficient-map comparison identifies the left side with J of the original integral series.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-average`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-rational`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-coe`, `mathlib:IsOfFinOrder.norm_eq_one`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### The finite-root partial-fraction denominators

`PadicMeasuresIwasawaAlgebras:L2/root-denominator-nonzero` — lemma.

For a characteristic-zero field K, ζ∈K primitive of order p and y∈K with y^p≠1, every ζ^i y−1 is nonzero, for all i∈ℕ.

Hypotheses: K is a characteristic-zero field; ζ has exact order p; y^p≠1.

Proof outline:

1. If ζ^i y=1, take pth powers. Since ζ^p=1, the left side becomes y^p, contradicting the hypothesis.

Prerequisites: `mathlib:IsPrimitiveRoot.pow_eq_one_iff_dvd`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, Lemma 4.7, printed p.137 / PDF38; collated with arXiv v2 PDF27. Expands the finite partial-fraction step as an algebraic field identity with every denominator nonzero. It does not extend bounded ψ to the individual pole 1/T; the Dirichlet source-domain finding E6 remains in its owner packet.

### The finite-root partial-fraction identity

`PadicMeasuresIwasawaAlgebras:L2/root-partial-fractions` — theorem.

For a characteristic-zero field K, ζ primitive of order p and y^p≠1, Σ_{i<p}1/(ζ^i y−1)=p/(y^p−1).

Hypotheses: K is a characteristic-zero field; ζ has exact order p; y^p≠1.

Proof outline:

1. All displayed denominators are nonzero by root-denominator-nonzero and y^p≠1.
2. The geometric-sum identity gives 1/(ζ^i y−1)=(Σ_{k<p}(ζ^i y)^k)/(y^p−1).
3. Interchange the two finite sums. The inner sum of ζ^(ik) is zero for 0<k<p and p for k=0 by primitive-root-power-sum. Only the constant term survives, giving the claimed factor p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/root-denominator-nonzero`, `PadicMeasuresIwasawaAlgebras:L2/primitive-root-power-sum`, `mathlib:geom_sum_mul`.

Unit tests:

- `IwasawaAveraging.Tests.partial_fractions_two` (computation): For p=2, ζ=−1 and y=2 over ℚ, the finite sum is 1−1/3=2/3.

Acceptance: At p=2, ζ=−1, y=2 the sum is 2/3. The condition y^p≠1 is essential; y=1 is excluded.

Source: RJW-published, Lemma 4.7, printed p.137 / PDF38; collated with arXiv v2 PDF27. Expands the finite partial-fraction step as an algebraic field identity with every denominator nonzero. It does not extend bounded ψ to the individual pole 1/T; the Dirichlet source-domain finding E6 remains in its owner packet.

### Translated denominators over an embedded coefficient field

`PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-descent-nonzero` — lemma.

Let K be a characteristic-zero field, j_K:ℤ_p→K and e:K→ℂ_p ring maps with e∘j_K=j₀. For Q∈ℤ_p[T] nonzero and ζ∈K nonzero, Q(ζY−1) is nonzero in Frac(K[[T]]).

Hypotheses: K is a characteristic-zero field; e∘j_K equals the canonical ℤ_p→ℂ_p map.

Proof outline:

1. The field embedding e is injective, so PowerSeries.map e is injective. Compose it with inclusion into Frac(ℂ_p[[T]]).
2. The existing fraction-ring lift gives an embedding of Frac(K[[T]]) into Frac(ℂ_p[[T]]). It maps the denominator to the one over ℂ_p with root e(ζ).
3. The latter is nonzero by translated-polynomial-nonzero. Therefore the original denominator is nonzero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-nonzero`, `mathlib:PowerSeries.map_injective`, `mathlib:IsFractionRing.lift`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Rational averaging over the cyclotomic coefficient field

`PadicMeasuresIwasawaAlgebras:L2/rational-root-average-descent` — theorem.

For K,j_K,e as in translated-polynomial-descent-nonzero, ζ∈K primitive of order p, P,Q∈ℤ_p[T] with Q(0) a unit, and integral F with QF=P, the same identity p·J_K(φ(psiSeries F))=Σ_{i<p}P(ζ^iY−1)/Q(ζ^iY−1) holds in Frac(K[[T]]), with its canonical maps J_K and Y=1+T.

Hypotheses: K is a characteristic-zero field; e∘j_K equals the canonical ℤ_p→ℂ_p map.

Proof outline:

1. Map both sides along the injective fraction-ring lift induced by e. It respects polynomial evaluation and nonzero denominators.
2. The image identity is rational-root-average for e(ζ), whose primitive order follows from injectivity. Coefficient compatibility is exactly e∘j_K=j₀. Injectivity reflects the equality.
3. A concrete receiving field is the existing intermediate-field adjoin K=ℚ_p(ζ)⊂ℂ_p. A primitive root exists by algebraic closedness; it satisfies X^p−1, so this is a finite algebraic cyclotomic extension. Use the existing intermediate-field inclusion and the composite ℤ_p→ℚ_p→K. No new valued-field carrier or finite-free trace is constructed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/rational-root-average`, `PadicMeasuresIwasawaAlgebras:L2/translated-polynomial-descent-nonzero`, `mathlib:PowerSeries.map_injective`, `mathlib:IsFractionRing.lift`, `mathlib:HasEnoughRootsOfUnity.exists_primitiveRoot`, `mathlib:IntermediateField.adjoin`.

Acceptance: Includes the prime 2. The stated coefficient carrier, topology and operator are retained in the suggested signature; no trace-defined replacement of bounded ψ is assumed.

Source: RJW-published, §3.5.3–5, equations (3-5), (3-6), (3-9), printed pp.127–129 / PDF28–30; collated with arXiv v2 PDF20–22. The source motivates the bounded root-averaging identity. This node is an explicit library-level decomposition for integral ℤ_p coefficients. The receiving integer ring, topological evaluation, uniform Mahler tails and density proof are worker elaborations using the listed pinned declarations; the source does not state these Lean-level continuity lemmas.

### Summability of a bounded Mahler pairing

`PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-summable` — lemma.

For a bounded sequence c:N->R and f in C(Z_p,R), the series sum_n a_n(f)c_n is summable, where a_n(f) is the coefficient supplied by the existing general Mahler isometry.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Use the existing BoundedContinuousFunction(N,R) for c and the existing Mahler isometry into functions vanishing at infinity for a(f). Thus |c_n|<=||c|| and |a_n(f)| tends to zero.
2. Submultiplicativity bounds |a_n(f)c_n| by ||c|| |a_n(f)|, so the terms tend to zero. Completeness and the ultrametric series criterion give summability. Boundedness of c is essential; mere formal power-series coefficients do not provide it.

Prerequisites: `mathlib:PadicInt.mahlerEquiv`, `mathlib:ZeroAtInftyContinuousMap`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`, `mathlib:NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### The bounded Mahler pairing

`PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing` — construction.

For c in BoundedContinuousFunction(N,R), define the R-linear map I_c:C(Z_p,R)->R by I_c(f)=sum_n a_n(f)c_n. The space of test functions and the coefficient sequence are existing library objects.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Define the function by the convergent sum of bounded-mahler-summable.
2. Additivity follows from additivity of the existing Mahler coefficients and summable addition. Although the bundled Mahler isometry is Z_p-linear, its coefficients are R-linear in f: use a_n(f)=Delta^n f(0) and the pinned iterated forward-difference constant-scalar identity. This proves I_c(r f)=r I_c(f) by multiplication through the convergent sum.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-summable`, `mathlib:PadicInt.mahlerEquiv`, `mathlib:fwdDiff_iter_const_smul`, `mathlib:AbstractMeasure.invTransform_apply`.

API:

- `boundedMahlerPairing_apply` (characterisation): I_c(f)=sum_n a_n(f)c_n.
- `boundedMahlerPairing_add` (simp): I_c(f+g)=I_c(f)+I_c(g).
- `boundedMahlerPairing_smul` (structure): I_c(r f)=r I_c(f) for r in R.
- `boundedMahlerPairing_bound` (relation): |I_c(f)| <= ||c|| ||f||.
- `boundedMahlerPairing_integral` (compatibility): For R=Z_p and c_n=coeff_n(F), I_c(f) equals the pinned invTransform(F)(f).

Uses:

- PadicMeasuresIwasawaAlgebras:L2/bounded-inverse: Its norm estimate constructs a genuine continuous R-linear functional.
- RJW Theorem 3.25: The displayed series is the inverse formula.

Unit tests:

- `boundedMahlerPairing_constant` (computation): Over Q_3, the constant sequence c_n=1/3 gives I_c(1)=1/3.
- `boundedMahlerPairing_zero` (degenerate): The zero coefficient sequence gives I_0(f)=0 for every test function.
- `boundedMahlerPairing_integral` (compatibility): For an integral formal series F and its bounded coefficient sequence, I_c(f)=AbstractMeasure.invTransform(F)(f).

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### The Mahler pairing norm bound

`PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing-bound` — lemma.

|I_c(f)| <= ||c|| ||f|| for every bounded c and continuous f.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. The existing Mahler isometry gives |a_n(f)|<=||f||. The bounded-sequence norm gives |c_n|<=||c||.
2. Submultiplicativity bounds every summand by ||c|| ||f||. Apply the ultrametric norm bound for an infinite sum. This is a bound on values of the functional; it does not install an operator-norm topology on the measure type.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing`, `mathlib:PadicInt.mahlerEquiv`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### The bounded-coefficient inverse Amice transform

`PadicMeasuresIwasawaAlgebras:L2/bounded-inverse` — construction.

Define boundedInvTransform as the R-linear map from BoundedContinuousFunction(N,R) to the existing measure type D(Z_p,R), sending c to the continuous functional f->I_c(f). In particular its value is a measure, not a new carrier of formal power series.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Apply LinearMap.mkContinuous to I_c with the bound ||c|| proved above. Transport it through the existing AbstractMeasure.toCLMEquiv.
2. The pairing is additive and R-linear in c: distribute each term and use the already proved convergence. Thus these continuous functionals form an R-linear map in c.
3. Evaluation is the original Mahler series. The coefficient and uniqueness lemmas below identify it with the existing integral inverse when R=Z_p. The input is bounded sequences, not all formal series over a field.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing`, `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing-bound`, `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-summable`, `mathlib:LinearMap.mkContinuous`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:AbstractMeasure.invTransform`, `mathlib:IsBoundedSMul.of_norm_smul_le`, `mathlib:PadicInt.norm_def`.

API:

- `boundedInvTransform_apply` (characterisation): boundedInvTransform(c)(f)=I_c(f).
- `boundedInvTransform_mahler` (simp): Its value on the R-valued nth Mahler function is c_n.
- `amiceTransform_boundedInvTransform` (compatibility): Its existing Amice transform equals PowerSeries.mk(c).
- `boundedInvTransform_unique` (extensionality): A measure with that Amice transform is boundedInvTransform(c).
- `boundedInvTransform_zero` (simp): boundedInvTransform(0)=0.
- `boundedInvTransform_add` (structure): The inverse preserves addition of bounded coefficient sequences.
- `boundedInvTransform_smul` (structure): The inverse is R-linear in the coefficient sequence.
- `boundedInvTransform_integral` (compatibility): For R=Z_p and c_n=coeff_n(F), boundedInvTransform(c)=the pinned invTransform(F).
- `boundedInvTransform_bound` (relation): |boundedInvTransform(c)(f)| <= ||c|| ||f||.

Uses:

- PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension: Constructs an actual R-valued measure from the bounded image of integral coefficients.
- ColemanIntegration:L3/geometric-measure: Bounded O_K coefficient series require a genuine inverse, with the receiving ring hypotheses established separately.

Unit tests:

- `boundedInvTransform_nonintegral` (computation): Over Q_3 the constant bounded sequence 1/3 gives value 1/3 on the constant function 1; nonintegral bounded coefficients are allowed.
- `boundedInvTransform_zero` (degenerate): The zero sequence gives the zero existing measure.
- `boundedInvTransform_integral` (compatibility): For R=Z_p, coefficients of an integral formal series give exactly the pinned invTransform, by the pinned Amice injectivity.
- `boundedInvTransform_unbounded` (non-example): The sequence c_n=3^(-n) in Q_3 cannot be an input bounded sequence: its norms are 3^n. Pairing it with Mahler coefficients 3^n gives terms identically 1 and therefore a divergent series.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Mahler values of the bounded inverse

`PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-mahler` — lemma.

For every n, boundedInvTransform(c) applied to the nth Mahler function with values in R equals c_n.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. The coefficient a_i of the R-valued nth Mahler function is 1 when i=n and zero otherwise. Compute a_i by iterated forward differences, commute the Z_p-valued function times 1_R through those differences by induction, and use the pinned finite binomial difference formula and natural-value formula for mahler.
2. Only the nth term of the convergent pairing remains. This proves the exact coefficient with no change of sign or factorial normalization.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse`, `mathlib:PadicInt.mahlerEquiv`, `mathlib:fwdDiff_iter_choose_zero`, `mathlib:fwdDiff_iter_eq_sum_shift`, `mathlib:mahler_natCast_eq`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### The Amice transform of the bounded inverse

`PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice` — lemma.

The existing amiceTransform of boundedInvTransform(c) is PowerSeries.mk(c).

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Use coefficient extensionality of the existing power series. The pinned coeff_amiceTransform reduces each coefficient to bounded-inverse-mahler.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-mahler`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:PowerSeries.coeff_mk`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Uniqueness of the bounded inverse

`PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-unique` — lemma.

If an existing measure mu in D(Z_p,R) has Amice transform PowerSeries.mk(c), then mu=boundedInvTransform(c).

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Apply the pinned injectivity of the general Amice transform and the preceding coefficient equality. The existing injectivity has precisely the complete ultrametric ring and bounded Z_p-action hypotheses used here.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Bounded images of integral coefficients

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-image-bound` — lemma.

For z in Z_p, |algebraMap(z)| <= |1_R|.

Hypotheses: p is prime; R is a normed commutative Z_p-algebra with bounded scalar action. Completeness and ultrametricity are not needed for this bound.

Proof outline:

1. Write algebraMap(z)=z times 1_R via the algebra scalar action. Its norm is at most |z| |1_R| by the bounded-action hypothesis, and |z|<=1 by the pinned integral norm bound.

Prerequisites: `mathlib:Algebra.algebraMap_eq_smul_one`, `mathlib:PadicInt.norm_le_one`, `mathlib:norm_smul_le`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### The bounded image coefficient sequence

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence` — construction.

For an integral measure mu, integralAmiceCoefficients(mu) is the existing bounded sequence n->algebraMap(coeff_n(A_mu)) in R, with the uniform bound |1_R|.

Hypotheses: p is prime; R is a normed commutative Z_p-algebra with bounded scalar action.

Proof outline:

1. Use BoundedContinuousFunction.ofNormedAddCommGroupDiscrete on the discrete natural numbers and the displayed coefficient function. integral-coefficient-image-bound proves the common norm bound.
2. Evaluation is the displayed coefficient formula. Its supremum norm is at most |1_R| by the existing bounded-function norm criterion. Zero, addition and scalar rules follow coefficientwise from the existing linear Amice transform and the coefficient homomorphism.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-image-bound`, `mathlib:BoundedContinuousFunction.ofNormedAddCommGroupDiscrete`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:AbstractMeasure.amiceTransform`.

API:

- `integralAmiceCoefficients_apply` (projection): The nth value is algebraMap(coeff_n(A_mu)).
- `integralAmiceCoefficients_norm` (relation): The supremum norm is at most |1_R|.
- `integralAmiceCoefficients_zero` (simp): The zero measure has the zero sequence.
- `integralAmiceCoefficients_add` (structure): The coefficient sequence is additive in mu.
- `integralAmiceCoefficients_smul` (structure): Multiplication of mu by a in Z_p multiplies the sequence by algebraMap(a).
- `integralAmiceCoefficients_self` (compatibility): For R=Z_p this is the original Amice coefficient sequence.

Uses:

- PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension: Supplies the bounded input to the inverse without assuming every R-valued formal series bounded.

Unit tests:

- `integralAmiceCoefficients_dirac_zero` (computation): For delta_0 the zeroth coefficient is 1 and the first coefficient is 0, including over Q_3.
- `integralAmiceCoefficients_zero` (degenerate): For the zero integral measure every image coefficient is zero.
- `integralAmiceCoefficients_self` (compatibility): For R=Z_p, the nth coefficient is exactly coeff_n(A_mu), using the standard identity algebra structure.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Extension of integral measures on Z_p

`PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension` — construction.

Define extendIntegralCoefficients(mu) in D(Z_p,R) as boundedInvTransform(integralAmiceCoefficients(mu)). Its Amice transform is the coefficient image of A_mu, and its value on the R-valued image of an integral test f is algebraMap(mu(f)). This extends coefficients of the actual measure on Z_p.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. The coefficient-sequence construction supplies a bounded input with norm at most |1_R|; apply the bounded inverse.
2. The Amice and test-function identities are the separate lemmas below, and uniqueness follows from the existing general Mahler injectivity. Addition and the Z_p scalar rule follow from those identities. For R=Z_p, coefficient identity and pinned injectivity give the identity map.
3. The pairing norm estimate and the coefficient norm bound give |extendIntegralCoefficients(mu)(f)| <= |1_R| ||f|| for all R-valued continuous f. In particular the bound is ||f|| when |1_R|=1. This assertion neither gives arbitrary-profinite-space scalar extension nor identifies weak and norm topologies.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse`, `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing-bound`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence`.

API:

- `extendIntegralCoefficients_apply` (characterisation): Evaluation on f is sum_n a_n(f) algebraMap(coeff_n(A_mu)).
- `amiceTransform_extendIntegralCoefficients` (compatibility): The Amice transform is PowerSeries.map(algebraMap)(A_mu).
- `extendIntegralCoefficients_test` (compatibility): On algebraMap composed with an integral test f the value is algebraMap(mu(f)).
- `extendIntegralCoefficients_unique` (universal-property): Agreement on all these integral test functions uniquely characterizes the extended measure.
- `extendIntegralCoefficients_zero` (simp): The zero integral measure extends to zero.
- `extendIntegralCoefficients_add` (structure): Extension is additive.
- `extendIntegralCoefficients_smul` (structure): Extension of a mu is algebraMap(a) times the extension of mu, for a in Z_p.
- `extendIntegralCoefficients_self` (compatibility): Extension to Z_p with its identity algebra structure is the original measure.
- `extendIntegralCoefficients_bound` (relation): The extended value on any R-valued f has norm at most |1_R| ||f||.
- `extendIntegralCoefficients_dirac` (simp): Extension sends the actual integral delta_x to the actual R-valued delta_x.
- `extendIntegralCoefficients_map` (functoriality): Extension commutes with pushforward along every continuous map Z_p->Z_p.
- `extendIntegralCoefficients_weight` (compatibility): For an integral-valued continuous weight g, extension of weight(g,mu) equals weight(algebraMap composed with g,extend(mu)).

Uses:

- ColemanIntegration:L3/rotated-smoothed-amice: Supplies the Z_p-to-R coefficient-extension portion of the bounded rotation request. The rotation identity and receiver instances remain separate obligations.
- PadicMeasuresIwasawaAlgebras:L0: Provides the Z_p-domain case of coefficient extension. The general profinite-domain and completed-tensor targets remain unproved.
- DirichletPadicLFunctions:L1/smoothed-measure: Its integral arithmetic measure can be extended to an eligible coefficient ring without redefining that measure.

Unit tests:

- `extendIntegralCoefficients_square` (computation): Over Q_3, extension of the integral delta_2 applied to x->x^2 is 4.
- `extendIntegralCoefficients_zero` (degenerate): Extension of the zero integral measure is zero.
- `extendIntegralCoefficients_self` (compatibility): Over Z_p this extension equals the original measure, with no alternate carrier.
- `extendIntegralCoefficients_pushforward` (compatibility): Over Q_3, extending the pushforward of delta_1 under x->2x gives delta_2.
- `extendIntegralCoefficients_weight` (compatibility): Over Q_2, extension of the weight x on delta_3 is 3 times the Q_2-valued delta_3; the dyadic prime is allowed.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Amice compatibility of coefficient extension

`PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice` — lemma.

A_(extendIntegralCoefficients(mu))=PowerSeries.map(algebraMap)(A_mu).

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Use bounded-inverse-amice and the coefficient formula for integralAmiceCoefficients. Coefficient extensionality and the pinned coeff_map formula give the equality.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `mathlib:PowerSeries.coeff_map`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Agreement on integral test functions

`PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function` — lemma.

For f in C(Z_p,Z_p), extension of mu applied to algebraMap composed with f equals algebraMap(mu(f)).

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. The Mahler coefficient of algebraMap composed with f is algebraMap(a_n(f)): write this composition as f times 1_R, commute pointwise scalar multiplication through iterated forward differences, and evaluate at zero.
2. The inverse pairing therefore has terms algebraMap(a_n(f) coeff_n(A_mu)). The original integral pairing is summable by bounded-mahler-summable. The coefficient homomorphism is continuous by the bounded scalar action, so its map commutes with this convergent sum.
3. For R=Z_p, coefficient-extension-amice and the existing Amice injectivity identify the bounded inverse of these coefficients with mu. Hence the original sum is exactly mu(f).

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice`, `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-summable`, `mathlib:PadicInt.mahlerEquiv`, `mathlib:continuous_algebraMap`, `mathlib:Multipliable.map_tprod`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Uniqueness of coefficient extension

`PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-unique` — lemma.

An R-valued measure nu equals extendIntegralCoefficients(mu) if nu(algebraMap composed with f)=algebraMap(mu(f)) for every integral continuous test f.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. In particular the two measures agree on the R-valued images of all integral Mahler basis functions. Their Amice coefficients agree by the pinned extraction formula and coefficient-extension-test-function. Apply pinned general Amice injectivity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.injective_amiceTransform`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Dirac compatibility of coefficient extension

`PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-dirac` — lemma.

For x in Z_p, extendIntegralCoefficients(delta_x over Z_p)=delta_x over R.

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. The existing R-valued Dirac measure evaluates the image of an integral test f to algebraMap(f(x)). This is exactly the required integral Dirac evaluation; apply coefficient-extension-unique.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-unique`, `mathlib:AbstractMeasure.dirac_apply`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Example 3.24 and Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Pushforward compatibility of coefficient extension

`PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-pushforward` — lemma.

For a continuous map g:Z_p->Z_p, extension of map(g,mu) equals map(g,extendIntegralCoefficients(mu)).

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Use coefficient-extension-unique and test on an integral f. The pinned pushforward formula evaluates the right side on the image of f composed with g.
2. Coefficient embedding commutes pointwise with precomposition, so coefficient-extension-test-function identifies this with algebraMap(mu(f composed with g)), the required integral pushforward value.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-unique`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, arXiv v2 p.18 The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### Weight compatibility of coefficient extension

`PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-weight` — lemma.

For g in C(Z_p,Z_p), extension of weight(g,mu) equals weight(algebraMap composed with g,extendIntegralCoefficients(mu)).

Hypotheses: p is prime; R is a complete ultrametric normed commutative ring with a Z_p-algebra structure whose scalar action satisfies |a r| <= |a| |r|. No multiplicative-norm, discrete-valuation or compactness assumption on R is imposed.

Proof outline:

1. Use the actual previously planned weight construction and its evaluation formula. On the image of an integral test f, the product of the two coefficient images is the image of g f because algebraMap is a ring homomorphism.
2. Coefficient-extension-test-function therefore gives algebraMap(mu(g f)). The integral weight has the same value by its evaluation formula. Apply coefficient-extension-unique. In particular this applies to the existing clopen restriction weights and the continuous total inverse weight; it does not assert multiplicativity of the inclusion of unit-group measures.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-unique`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function`, `PadicMeasuresIwasawaAlgebras:L2/weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: Use the existing AbstractMeasure, continuous-function and bounded-sequence carriers. All convergence and coefficient hypotheses must be retained.

Source: RJW-v2, Theorem 3.25, p.18 and §3.5.1, p.19 (arXiv v2) The source proves the inverse by pairing vanishing Mahler coefficients with bounded integral coefficients. This node is a worker-derived generalization or compatibility of that construction under its displayed norm hypotheses; it does not claim the convolution-algebra or topology comparison.

### The p-adic unit locus is clopen

`PadicMeasuresIwasawaAlgebras:L2/clopen-unit-locus` — lemma.

The set V={x∈ℤ_p : IsUnit x} is clopen, for every prime p.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. The earlier clopen-pmultiples node proves pℤ_p clopen. PadicInt.not_isUnit_iff and norm_lt_one_iff_dvd identify its complement with V. Complements preserve clopenness.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples`, `mathlib:PadicInt.not_isUnit_iff`, `mathlib:PadicInt.norm_lt_one_iff_dvd`.

Acceptance: At p=2 the locus contains −1 and 1 and excludes 0 and 2. It is not replaced by 1+4ℤ₂.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Native p-adic units and the unit locus

`PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism` — construction.

Define PadicInt.unitsHomeomorphIsUnit p : (ℤ_p)ˣ ≃ₜ V, sending u to its underlying element with its unit proof; its inverse sends (x,hx) to hx.unit.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. The underlying bijection uses Units.isUnit, IsUnit.unit and IsUnit.unit_spec. Unit extensionality proves the two inverse identities.
2. The forward map is continuous by Units.continuous_val and the subtype criterion. Native units have their topology induced from u↦(u,u⁻¹), not an assumed subtype topology.
3. The native compactness instance follows from Units.isClosedEmbedding_embedProduct into the compact product Z×Z and Topology.IsClosedEmbedding.compactSpace. The target V is Hausdorff as a subspace of Z. Continuous.homeoOfEquivCompactToT2 therefore gives the continuous inverse. This supplies the actual comparison between the two topologies.

Prerequisites: `mathlib:Units.isUnit`, `mathlib:IsUnit.unit`, `mathlib:IsUnit.unit_spec`, `mathlib:Units.continuous_val`, `mathlib:Units.isClosedEmbedding_embedProduct`, `mathlib:Topology.IsClosedEmbedding.compactSpace`, `mathlib:Continuous.homeoOfEquivCompactToT2`, `mathlib:PadicInt.compactSpace`.

API:

- `PadicInt.unitsHomeomorphIsUnit_apply` (coercion): The underlying value of h(u) is u; promoted to unit-domain-homeomorphism-evaluation.
- `PadicInt.unitsHomeomorphIsUnit_symm_apply` (coercion): For x∈V, the value of h⁻¹(x) as a p-adic integer is x.
- `Homeomorph.apply_symm_apply` (relation): Native inherited inverse API: The two inverse identities come from the inherited homeomorphism; equality can be checked on underlying p-adic values.

Uses:

- RJW Corollary 3.32 and Remark 3.33: Identify the intrinsic unit-group carrier with the actual kernel of the existing ψ operator.
- DirichletPadicLFunctions:L1 and L4: Provide the generic inclusion and restriction interfaces for arithmetic unit measures; their arithmetic remains with the consumer.
- ColemanPowerSeries:L2 and LocallyAnalyticDistributions:L1: Provide the integral bounded reference carrier for the recipient comparisons, without identifying bounded, locally analytic or period-ring ψ operators.

Unit tests:

- `SuggestedTests.Clopen.units_homeomorph_one` (computation): At p=3, the value of h(1) is 1.
- `SuggestedTests.Clopen.units_homeomorph_dyadic_sign` (computation): At p=2, the value of h(−1) is −1.
- `SuggestedTests.Clopen.units_homeomorph_inverse` (compatibility): At p=2, h⁻¹ of the unit-subtype point 1 is the unit 1.
- `SuggestedTests.Clopen.units_homeomorph_excludes_zero` (non-example): For every u∈ℤ₃ˣ, the underlying value of h(u) is nonzero.

Acceptance: The native unit group is retained at p=2, including its torsion element −1. No choice of a procyclic generator occurs.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### The unit-locus comparison preserves the underlying value

`PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism-evaluation` — lemma.

For u∈(ℤ_p)ˣ, the underlying p-adic integer of unitsHomeomorphIsUnit p u equals u.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Unfold the underlying equivalence. Continuous.homeoOfEquivCompactToT2 preserves that forward function.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism`.

Acceptance: The composite of this homeomorphism with subtype inclusion is exactly native Units.val.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Restriction to the native p-adic unit group

`PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction` — construction.

Define AbstractMeasure.restrictUnits p R : D(ℤ_p,R) →ₗ[R] D((ℤ_p)ˣ,R) as arrowCongrLeft(h⁻¹)∘r_V, where h=unitsHomeomorphIsUnit p. Write j_U for native pushforward along Units.val.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Use clopen-unit-locus as the input to generic clopen-restriction. Transport the result along h⁻¹ using the existing AbstractMeasure.arrowCongrLeft.
2. Compose the R-linear maps. Native arrowCongrLeft_apply shows that evaluation at f on U is μ(z_V(f∘h⁻¹)).
3. On a unit atom the native map_dirac and the homeomorphism inverse identities give the same atom on U. Every nonunit atom restricts to zero by the clopen evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/clopen-unit-locus`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:AbstractMeasure.arrowCongrLeft`, `mathlib:AbstractMeasure.arrowCongrLeft_apply`, `mathlib:AbstractMeasure.map_dirac`, `mathlib:AbstractMeasure.dirac_apply`.

API:

- `AbstractMeasure.restrictUnits_eq_transport` (characterisation): r_Uμ=arrowCongrLeft(h⁻¹)(r_Vμ).
- `AbstractMeasure.restrictUnits_apply` (characterisation): r_Uμ(f)=μ(z_V(f∘h⁻¹)); promoted to intrinsic-unit-restriction-evaluation.
- `AbstractMeasure.restrictUnits_map_val` (relation): r_U(j_Uν)=ν; promoted to intrinsic-unit-restriction-section.
- `AbstractMeasure.map_val_restrictUnits` (compatibility): j_U(r_Uμ)=unitRestriction p R μ; promoted to intrinsic-unit-extension-projector.
- `AbstractMeasure.restrictUnits_dirac` (simp): For u∈U, r_Uδ_u=δ_u on U.
- `AbstractMeasure.restrictUnits_dirac_nonunit` (simp): For a nonunit x∈Z, r_Uδ_x=0.
- `AddHomClass.map_add` (structure): Native inherited API: The inherited linear-map structure gives zero, additivity and R-scalar compatibility.

Uses:

- RJW Corollary 3.32 and Remark 3.33: Identify the intrinsic unit-group carrier with the actual kernel of the existing ψ operator.
- DirichletPadicLFunctions:L1 and L4: Provide the generic inclusion and restriction interfaces for arithmetic unit measures; their arithmetic remains with the consumer.
- ColemanPowerSeries:L2 and LocallyAnalyticDistributions:L1: Provide the integral bounded reference carrier for the recipient comparisons, without identifying bounded, locally analytic or period-ring ψ operators.

Unit tests:

- `SuggestedTests.Clopen.intrinsic_units_mixed_atoms` (computation): Over ℤ₃, restricting δ₁+2δ₃ gives δ₁ on ℤ₃ˣ.
- `SuggestedTests.Clopen.intrinsic_units_zero_atom` (degenerate): Over ℤ₃, restricting δ₀ gives zero.
- `SuggestedTests.Clopen.intrinsic_units_nonzero_nonunit` (non-example): Over ℤ₃, restricting δ₃ gives zero although 3 is nonzero.
- `SuggestedTests.Clopen.intrinsic_units_dyadic_sign` (computation): Over ℤ₂, restricting δ_(−1)−δ₀ gives δ_(−1) on the actual unit group.

Acceptance: Its codomain is the native multiplicative unit group, not the ambient space of all p-adic integers.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Evaluation on an intrinsic unit-group test function

`PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation` — lemma.

For μ∈D(Z,R) and f∈C(U,R), restrictUnits p R μ(f)=μ(z_V(f∘h⁻¹)).

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Expand the composite defining intrinsic restriction. Apply native arrowCongrLeft_apply and generic clopen-restriction-evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `mathlib:AbstractMeasure.arrowCongrLeft_apply`.

Acceptance: The inverse homeomorphism transports f from the group of units to the clopen subtype before extension.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Intrinsic restriction retracts unit inclusion

`PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section` — lemma.

For every ν∈D(U,R), r_U(j_Uν)=ν; hence j_U is injective.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Test on f∈C(U,R). The intrinsic evaluation and native map_apply give ν(u↦z_V(f∘h⁻¹)(u)).
2. Use clopen-zero-extension-inside and unit-domain-homeomorphism-evaluation to rewrite this function as f by h⁻¹h=id. Extensionality proves the identity and then injectivity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: A unit atom is preserved with coefficient one, with no factor p or 1/p.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Intrinsic unit restriction gives the ambient unit projector

`PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector` — comparison.

For every μ∈D(Z,R), j_U(r_Uμ)=unitRestriction p R μ.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Test on g∈C(Z,R). Native map_apply and intrinsic-unit-restriction-evaluation evaluate the left side on the extension by zero of g restricted to V.
2. The homeomorphism value lemma and its inverse identities identify the transported test function with g|V. The generic clopen projector formula gives μ(χ_V g).
3. The complement of V is pZ by the clopen-unit-locus proof. Thus χ_V=1−χ_(pZ) pointwise. Compare with the earlier unit-restriction-evaluation formula and use extensionality.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/clopen-unit-locus`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-projector`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation`, `mathlib:PadicInt.not_isUnit_iff`, `mathlib:PadicInt.norm_lt_one_iff_dvd`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: This discharges the earlier intrinsic-versus-ambient distinction. The result is an equality of R-linear operations, not a statement about convolution.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Unit-group measures as the kernel of psi

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence` — construction.

Define AbstractMeasure.unitsMeasureEquivKerPsi p R : D(U,R) ≃ₗ[R] ker(psiMeasure p R), with forward value j_Uν and inverse r_U on the ambient value of a kernel element.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. For ν, intrinsic-unit-restriction-section and intrinsic-unit-extension-projector give E(j_Uν)=j_Uν. The earlier unit-support-psi theorem gives ψ(j_Uν)=0, so native pushforward lands in the existing LinearMap.ker.
2. For μ in that kernel, unit-support-psi gives Eμ=μ. The projector comparison then gives j_U(r_Uμ)=μ. The other inverse identity is intrinsic-unit-restriction-section; both maps are R-linear.
3. The convolution non-example uses the native prodMk and map evaluation formulas: at p=2, additive convolution of δ₁ with itself pushes the pair (1,1) to δ₂, while multiplicative unit convolution gives δ₁. Their ambient measures differ by evaluation on x.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector`, `PadicMeasuresIwasawaAlgebras:L2/unit-support-psi`, `mathlib:LinearMap.ker`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.prodMk`, `mathlib:AbstractMeasure.prodMk_apply`, `mathlib:AbstractMeasure.contractFst_apply`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:AbstractMeasure.map_apply`.

API:

- `AbstractMeasure.unitsMeasureEquivKerPsi_apply` (coercion): The underlying ambient measure is native j_Uν; promoted to unit-measure-kernel-evaluation.
- `AbstractMeasure.unitsMeasureEquivKerPsi_symm_apply` (projection): The inverse is restrictUnits applied to the ambient value; promoted to unit-measure-kernel-inverse.
- `LinearEquiv.injective` (extensionality): Native inherited API: Unit-group measures are equal if their ambient pushforwards are equal.
- `LinearEquiv.apply_symm_apply` (relation): Native inherited inverse API: Both round trips are the identities by the inherited linear equivalence.

Uses:

- RJW Corollary 3.32 and Remark 3.33: Identify the intrinsic unit-group carrier with the actual kernel of the existing ψ operator.
- DirichletPadicLFunctions:L1 and L4: Provide the generic inclusion and restriction interfaces for arithmetic unit measures; their arithmetic remains with the consumer.
- ColemanPowerSeries:L2 and LocallyAnalyticDistributions:L1: Provide the integral bounded reference carrier for the recipient comparisons, without identifying bounded, locally analytic or period-ring ψ operators.

Unit tests:

- `SuggestedTests.Clopen.units_kernel_zero` (degenerate): At p=3 with integral coefficients, the zero measure gives the zero kernel element.
- `SuggestedTests.Clopen.units_kernel_atom` (compatibility): At p=3, the underlying measure of the image of intrinsic δ₁ is ambient δ₁.
- `SuggestedTests.Clopen.units_kernel_dyadic_sign` (computation): At p=2, intrinsic δ_(−1) maps to ambient δ_(−1).
- `SuggestedTests.Clopen.units_kernel_different_convolutions` (non-example): Using native product measures and pushforwards, additive δ₁*δ₁ on ℤ₂ is δ₂, whereas extension of multiplicative δ₁*δ₁ on ℤ₂ˣ is δ₁. Evaluation on x distinguishes them.

Acceptance: No new support carrier is defined: the target is the actual kernel submodule. Neither an algebra equivalence nor an identification of weak and norm topologies is part of this construction.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Underlying measure of the unit-kernel equivalence

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-evaluation` — lemma.

For ν∈D(U,R), the ambient value of unitsMeasureEquivKerPsi p R ν is j_Uν.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Unfold the forward map of the linear equivalence; the kernel membership proof does not change the underlying measure.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence`.

Acceptance: The ambient measure uses exactly the native Units.val pushforward.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Inverse of the unit-kernel equivalence

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-inverse` — lemma.

For μ∈ker(psiMeasure p R), the inverse of unitsMeasureEquivKerPsi p R at μ is restrictUnits p R applied to its ambient value.

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers.

Proof outline:

1. Unfold the inverse of the linear equivalence.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence`.

Acceptance: The kernel hypothesis is needed for the forward-after-inverse round trip to recover μ.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

### Integral unit measures as the kernel of series psi

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence` — construction.

Define AbstractMeasure.unitsMeasureAmiceEquiv p : D((ℤ_p)ˣ,ℤ_p) ≃ₗ[ℤ_p] ker(psiSeries p) by ν↦A(j_Uν). Its inverse sends F∈ker(psiSeries p) to r_U(A⁻¹F).

Hypotheses: p is any prime, including 2; Z=ℤ_p has its pinned topology and U=Zˣ is the existing units type with its existing topology. R is a normed commutative ring. E=unitRestriction p R and ψ=psiMeasure p R are the earlier ambient operators. Measures retain the existing AbstractMeasure carriers. For this comparison the coefficient ring is exactly ℤ_p; A is the pinned integral Amice linear equivalence and ψSeries is its earlier transported bounded operator.

Proof outline:

1. Use the earlier unit-measure-kernel-equivalence at integral coefficients. The pinned amiceTransformEquiv is an actual linear equivalence between D(Z,Z) and Z[[T]].
2. The existing planned psi-series-intertwining identity gives ψSeries(Aμ)=A(ψμ). Injectivity of A therefore identifies the two kernel conditions. Restrict A and A⁻¹ to those existing kernel submodules and compose with the unit-measure equivalence.
3. The value and inverse formulas follow from unit-measure-kernel-evaluation and unit-measure-kernel-inverse. Their inverse identities follow from those of the two linear equivalences.
4. The Dirac tests use native coeff_amiceTransform, dirac_apply and mahler_apply. For positive natural atoms use amice-dirac-natural. The first coefficient at −1 is −1 by Ring.choose_one_right, and the zeroth coefficient is total mass by Ring.choose_zero_right.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-inverse`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/amice-dirac-natural`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:mahler_apply`, `mathlib:Ring.choose_one_right`, `mathlib:Ring.choose_zero_right`.

API:

- `AbstractMeasure.unitsMeasureAmiceEquiv_apply` (characterisation): The underlying series is A(j_Uν), with no additional scalar or derivative.
- `AbstractMeasure.unitsMeasureAmiceEquiv_symm_apply` (constructor): The inverse is r_U(A⁻¹F) for a series in the existing kernel.
- `LinearEquiv.injective` (extensionality): Native inherited API: Two integral unit-group measures agree if their included Amice transforms agree.
- `LinearEquiv.apply_symm_apply` (relation): Native inherited inverse API: The kernel hypothesis makes the two inverse identities hold, by the inherited linear equivalence.

Uses:

- RJW Corollary 3.32 and Remark 3.33: Identify the intrinsic unit-group carrier with the actual kernel of the existing ψ operator.
- DirichletPadicLFunctions:L1 and L4: Provide the generic inclusion and restriction interfaces for arithmetic unit measures; their arithmetic remains with the consumer.
- ColemanPowerSeries:L2 and LocallyAnalyticDistributions:L1: Provide the integral bounded reference carrier for the recipient comparisons, without identifying bounded, locally analytic or period-ring ψ operators.

Unit tests:

- `SuggestedTests.Clopen.units_amice_zero` (degenerate): At p=3, the zero unit measure gives the zero series-kernel element.
- `SuggestedTests.Clopen.units_amice_one_atom` (compatibility): At p=3, the series for intrinsic δ₁ is 1+T.
- `SuggestedTests.Clopen.units_amice_dyadic_first_moment` (computation): At p=2, the first coefficient for intrinsic δ_(−1) is −1.
- `SuggestedTests.Clopen.units_amice_two_atoms_mass` (computation): At p=3, the zeroth coefficient for intrinsic δ₁+δ_(−1) is 2.

Acceptance: The equivalence is integral and includes p=2. It is not an inverse Amice equivalence for arbitrary unbounded field-coefficient series, and it is not multiplicative for the ambient additive power-series product.

Source: RJW-published, §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, printed pp.127–129 / physical PDF28–30; arXiv v2 pp.20–21. Makes the source inclusion, retraction and kernel identification explicit on the native units type. The integral Amice comparison uses the existing equivalence. Coefficients R in the measure-level statements are a worker generalization of the displayed precomposition formulas; no comparison of the two convolution products is asserted.

## L3: algebraic pseudomeasures and admissible evaluation

Here G is a group, R a commutative ring, δ:G→R a monoid homomorphism and Q its existing total quotient ring. R need not be a domain, and Q is not assumed a field. Writing c_g=δ(g)−1, a pseudomeasure is an element z of Q for which every c_g z is integral. The existing submodule quotient supplies the carrier; it need not be a ring. For example, with integer units mapped to ℤ, 1/2 is a pseudomeasure in ℚ but its square 1/4 is not.

The unique integral numerator n_g(z) satisfies ι(n_g(z))=ι(c_g)z. For an R-algebra A, evaluation using g requires the image of c_g to be a unit in A, not merely nonzero. Dividing its numerator image by that unit is independent of the admissible g, agrees with evaluation of integral elements, and is the unique R-linear extension on the pseudomeasure module. Coefficient change follows by applying an algebra map to the defining equation.

There is no unrestricted character homomorphism on all of Q: a character can kill a regular denominator. The completed group algebra, its actual Dirac homomorphism, continuous-character integral and the identification with its augmentation ideal require their own constructions and comparisons. They are not hypotheses silently asserted to exist by this algebraic subgraph.


### Pseudomeasures

`PadicMeasuresIwasawaAlgebras:L3/pseudomeasures` — definition.

Define Iwasawa.pseudomeasures δ Q : Submodule R Q to be (1 : Submodule R Q) / Submodule.span R (range (g ↦ ι(δ(g)−1))). This uses the existing submodule quotient. It is an R-module; it is not asserted to be a subring, a fractional ideal in the domain-specific sense, or a topological completion.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Use the existing total quotient ring and Submodule.div. The unit submodule is the image of R by Submodule.one_eq_range.
2. Take the span of the Dirac differences and the quotient of the unit submodule by that span. All additive and R-module structure is inherited.
3. Subtype extensionality is routine. If δ(g)=1 for every g, the span is zero and the defining membership condition holds for every q ∈ Q.

Prerequisites: `mathlib:IsFractionRing`, `mathlib:FractionRing`, `mathlib:Submodule.one_eq_range`, `mathlib:Submodule.span`, `mathlib:Submodule.mem_div_iff_forall_mul_mem`.

API:

- `Iwasawa.mem_pseudomeasures_iff` (characterisation): z belongs iff for every g there exists r ∈ R with ι(r)=ι(c_g)z; promoted to its own lemma node.
- `Iwasawa.pseudomeasure_ext` (extensionality): Two pseudomeasures with equal underlying elements of Q are equal.
- `Iwasawa.pseudomeasures_eq_top_of_trivial` (characterisation): If δ(g)=1 for all g, pseudomeasures δ Q is the top submodule. This prevents the inverse-of-zero convention for FractionalIdeal from being substituted.

Uses:

- Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element.
- DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures.
- IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Unit tests:

- `SuggestedTests.trivial_half` (degenerate): For G=PUnit, δ=1 : G →* ℤ and Q=ℚ, 1/2 is a pseudomeasure.
- `SuggestedTests.integer_three` (compatibility): For δ=Units.coeHom ℤ and Q=ℚ, 3 is a pseudomeasure.
- `SuggestedTests.half_not_quarter` (non-example): For δ=Units.coeHom ℤ and Q=ℚ, 1/2 belongs but 1/4 does not. Thus pseudomeasures need not be closed under multiplication.

Acceptance: The suggested signature elaborates against the pinned libraries; the mathematical argument uses only the listed inputs.

Source: RJW-published, §3.6, Definition 3.34, printed p. 129 / PDF 30 Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

Atlas planet: Pseudomeasures.

### Integrality by Dirac differences

`PadicMeasuresIwasawaAlgebras:L3/pseudomeasure-membership` — lemma.

For z ∈ Q, z ∈ pseudomeasures δ Q iff ∀ g : G, ∃ r : R, ι(r)=ι(c_g)z.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Unfold the carrier and apply Submodule.mem_div_iff_forall_mul_mem.
2. The forward implication tests each generator of the span and uses Submodule.mem_one.
3. Conversely use Submodule.span_induction: integrality is preserved by zero, addition and R-scalar multiplication. Commutativity exchanges zι(c_g) with ι(c_g)z.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/pseudomeasures`, `mathlib:Submodule.mem_div_iff_forall_mul_mem`, `mathlib:Submodule.mem_one`, `mathlib:Submodule.span_induction`.

Acceptance: For δ=Units.coeHom ℤ, the generator g=−1 requires −2z ∈ ℤ, whereas g=1 gives no condition. Thus z=1/2 passes and z=1/4 fails.

Source: RJW-published, §3.6, Definition 3.34, printed p. 129 / PDF 30 Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Integral inclusion

`PadicMeasuresIwasawaAlgebras:L3/integral-pseudomeasure` — construction.

Define Iwasawa.integral δ Q : R →ₗ[R] pseudomeasures δ Q by r ↦ ι(r).

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. For every g, ι(c_g)ι(r)=ι(c_g r), so the membership lemma applies.
2. Restrict the codomain of the scalar linear map to the pseudomeasure submodule. The ring-map laws give linearity.
3. Injectivity is inherited from IsFractionRing.injective.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/pseudomeasure-membership`, `mathlib:IsFractionRing.injective`.

API:

- `Iwasawa.coe_integral` (coercion): The underlying element of integral δ Q r is ι(r); promoted to its own lemma.
- `Iwasawa.integral_zero` (simp): The integral inclusion sends zero to zero.
- `Iwasawa.integral_injective` (characterisation): The integral inclusion is injective.

Uses:

- Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element.
- DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures.
- IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Unit tests:

- `SuggestedTests.integral_three` (computation): For δ=Units.coeHom ℤ and Q=ℚ, the underlying value of integral 3 is 3.
- `SuggestedTests.integral_zero` (degenerate): In the same example the underlying value of integral 0 is 0.
- `SuggestedTests.integral_one_ne_zero` (non-example): In the same example integral 1 ≠ integral 0.

Acceptance: The suggested signature elaborates against the pinned libraries; the mathematical argument uses only the listed inputs.

Source: RJW-published, §3.6, Definition 3.34, printed p. 129 / PDF 30 Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Underlying integral element

`PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value` — lemma.

For r ∈ R, the underlying element of integral δ Q r in Q is ι(r).

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Unfold the codomain restriction defining integral; the equality is definitional.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/integral-pseudomeasure`.

Acceptance: For R=ℤ, Q=ℚ and δ=Units.coeHom ℤ, the underlying values of integral 0 and integral 3 are 0 and 3 respectively.

Source: RJW-published, §3.6, Definition 3.34, printed p. 129 / PDF 30 Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Cleared numerator

`PadicMeasuresIwasawaAlgebras:L3/cleared-numerator` — construction.

For g ∈ G define Iwasawa.numerator δ Q g : pseudomeasures δ Q →ₗ[R] R by the unique n_g(z) satisfying ι(n_g(z))=ι(c_g)z.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Existence is exactly pseudomeasure-membership. Uniqueness follows from IsFractionRing.injective.
2. Choose the unique preimage. Apply injectivity to prove addition and scalar multiplication laws using the defining equality; this yields one R-linear map.
3. For integral r its numerator is c_g r, by integral-inclusion-value. For g=1 the factor vanishes and injectivity forces numerator zero.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/pseudomeasure-membership`, `PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value`, `mathlib:IsFractionRing.injective`.

API:

- `Iwasawa.algebraMap_numerator` (characterisation): ι(n_g(z))=ι(c_g)z; promoted to its own lemma.
- `Iwasawa.numerator_unique` (universal-property): If ι(r)=ι(c_g)z then n_g(z)=r.
- `Iwasawa.numerator_integral` (simp): n_g(integral r)=c_g r.
- `Iwasawa.numerator_one` (simp): n_1(z)=0.

Uses:

- Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element.
- DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures.
- IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Unit tests:

- `SuggestedTests.numerator_identity` (degenerate): For δ=Units.coeHom ℤ and any pseudomeasure z in ℚ, n_1(z)=0.
- `SuggestedTests.numerator_integral_two` (computation): For δ=Units.coeHom ℤ, n_{−1}(integral 2)=−4.
- `SuggestedTests.numerator_half` (computation): For δ=Units.coeHom ℤ, the cleared numerator n_{−1}(1/2) is −1.

Acceptance: The suggested signature elaborates against the pinned libraries; the mathematical argument uses only the listed inputs.

Source: RJW-published, §3.6, Definition 3.34, printed p. 129 / PDF 30 Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

Atlas planet: Cleared numerator.

### Numerator specification

`PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec` — lemma.

For every g and pseudomeasure z, ι(numerator δ Q g z)=ι(c_g)z.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Apply the property of the unique preimage used in the numerator construction.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator`.

Acceptance: For R=ℤ, Q=ℚ, δ=Units.coeHom ℤ, g=−1 and z=1/2, the equality reads ι(−1)=ι(−2)(1/2). The opposite sign for the numerator fails this check.

Source: RJW-published, §3.6, Definition 3.34, printed p. 129 / PDF 30 Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Commuting cleared numerators

`PadicMeasuresIwasawaAlgebras:L3/cross-multiplied-numerators` — lemma.

For g,h ∈ G and a pseudomeasure z, c_h n_g(z)=c_g n_h(z) in R.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Apply IsFractionRing.injective.
2. Map both sides to Q and replace the two numerators by cleared-numerator-spec. Commutativity and associativity identify both products with ι(c_h)ι(c_g)z.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec`, `mathlib:IsFractionRing.injective`.

Acceptance: Taking g=1 forces both sides to zero, using n_1=0; taking g=h gives the reflexive identity. For two admissible factors the identity must survive every coefficient homomorphism.

Source: RJW-published, Equation (3-11), independence calculation, printed p. 130 / PDF 31 This is the algebraic equality behind the two clearing-factor calculation, before applying the character map. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Admissible pseudomeasure evaluation

`PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation` — construction.

For g ∈ G with hg : IsUnit (f(c_g)), define Iwasawa.evalAt δ Q A g hg : pseudomeasures δ Q →ₗ[R] A by z ↦ u⁻¹ f(n_g(z)), where u is the unit represented by hg. The requirement is a unit in A, not merely a nonzero element.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)).

Proof outline:

1. Compose the numerator R-linear map with the scalar map R → A.
2. Multiply by the inverse of the unit supplied by hg. Since A is commutative this multiplication is R-linear.
3. The inverse-unit identities establish the evaluation equation. No map Q → A is assumed or constructed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator`.

API:

- `Iwasawa.evalAt_spec` (characterisation): f(c_g) evalAt_g(z)=f(n_g(z)); promoted to its own lemma.
- `Iwasawa.evalAt_eq` (compatibility): Two admissible clearing elements give equal R-linear evaluation maps; promoted.
- `Iwasawa.evalAt_integral` (simp): evalAt_g(integral r)=f(r); promoted.
- `Iwasawa.evalAt_unique` (universal-property): Every R-linear extension of f along integral is evalAt_g; promoted.
- `Iwasawa.evalAt_map` (functoriality): For an R-algebra map A → B, the evaluation values commute with that map whenever the clearing factor is admissible; promoted. Identity and composition follow by function evaluation.

Uses:

- Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element.
- DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures.
- IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Unit tests:

- `SuggestedTests.evaluation_zero` (degenerate): For δ=Units.coeHom ℤ, Q=A=ℚ, g=−1 and hg asserting the unit condition, evaluation of zero is zero.
- `SuggestedTests.evaluation_integral_three` (compatibility): With these data, evaluation of integral 3 is 3.
- `SuggestedTests.evaluation_half` (computation): With these data and the membership proof for 1/2, its evaluation is 1/2.

Acceptance: The suggested signature elaborates against the pinned libraries; the mathematical argument uses only the listed inputs.

Source: RJW-published, Equation (3-11), printed pp. 129–130 / PDF 30–31 Generalizes the field-valued formula to a commutative target algebra under exactly the invertibility hypothesis used by division. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

Atlas planet: Admissible evaluation.

### Evaluation equation

`PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec` — lemma.

For an admissible g and every pseudomeasure z, f(c_g) evalAt_g(z)=f(n_g(z)).

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)).

Proof outline:

1. Unfold evaluation and cancel the unit with its chosen inverse.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation`.

Acceptance: For R=ℤ, Q=A=ℚ, δ=Units.coeHom ℤ, g=−1 and z=1/2, the equation is (−2)(1/2)=−1.

Source: RJW-published, Equation (3-11), printed pp. 129–130 / PDF 30–31 The source division formula is expressed as a multiplicative equation. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Independence of clearing factor

`PadicMeasuresIwasawaAlgebras:L3/independence-of-clearing-factor` — theorem.

If f(c_g) and f(c_h) are units, evalAt δ Q A g hg = evalAt δ Q A h hh as R-linear maps.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)); hh : IsUnit (f(c_h)).

Proof outline:

1. Apply f to cross-multiplied-numerators.
2. Substitute the two evaluation equations. Commutativity gives f(c_h)f(c_g)evalAt_g(z)=f(c_h)f(c_g)evalAt_h(z).
3. Cancel the two units with IsUnit.mul_left_cancel. Extensionality of linear maps gives the result. This also removes any dependence on the witness of IsUnit.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cross-multiplied-numerators`, `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec`, `mathlib:IsUnit.mul_left_cancel`.

Acceptance: With g=h the result identifies any two witnesses of the same IsUnit condition. With distinct g,h the proof must use the cross-numerator relation and cancellation of units, and must not assume a ring homomorphism from Q to A.

Source: RJW-published, Independence calculation following equation (3-11), printed p. 130 / PDF 31 Follows the source two-factor argument, correcting the last occurrence of μ to λ. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

Atlas planet: Independence of clearing factor.

### Evaluation of integral measures

`PadicMeasuresIwasawaAlgebras:L3/evaluation-on-integral-elements` — lemma.

For every r ∈ R and admissible g, evalAt_g(integral r)=f(r).

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)).

Proof outline:

1. Map the numerator specification for integral r to Q and use integral-inclusion-value; injectivity identifies the numerator with c_g r.
2. Use the evaluation equation and cancel f(c_g) with IsUnit.mul_left_cancel.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec`, `PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value`, `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec`, `mathlib:IsFractionRing.injective`, `mathlib:IsUnit.mul_left_cancel`.

Acceptance: For R=ℤ, Q=A=ℚ, δ=Units.coeHom ℤ and g=−1, evaluation of integral 3 is 3. The result also holds for r=0 and r=1.

Source: RJW-published, Definition 3.34 and equation (3-11), printed pp. 129–130 / PDF 30–31 Checks that the extended expression agrees with the original character integral. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Uniqueness of admissible evaluation

`PadicMeasuresIwasawaAlgebras:L3/uniqueness-of-evaluation` — theorem.

Let g be admissible. If L : pseudomeasures δ Q →ₗ[R] A satisfies L(integral r)=f(r) for every r, then L=evalAt_g.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)); L is R-linear and extends f on the integral inclusion.

Proof outline:

1. For each z, prove c_g • z = integral(n_g(z)) by subtype extensionality, integral-inclusion-value and cleared-numerator-spec.
2. Apply L and use R-linearity and the extension condition to obtain f(c_g)L(z)=f(n_g(z)).
3. Compare with admissible-evaluation-spec and cancel the unit.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value`, `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec`, `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec`, `mathlib:IsUnit.mul_left_cancel`.

Acceptance: For R=ℤ, Q=A=ℚ and δ=Units.coeHom ℤ, every ℤ-linear extension of integer inclusion must send 1/2 to 1/2, since doubling that element gives integral 1. No multiplicative structure on the pseudomeasure carrier is assumed.

Source: RJW-published, Equation (3-11) and Remark 3.35, printed p. 130 / PDF 31 This is the corrected uniqueness statement for a linear extension on pseudomeasures. It does not assert a ring homomorphism on all of Q(G). The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Evaluation under coefficient change

`PadicMeasuresIwasawaAlgebras:L3/coefficient-change-evaluation` — lemma.

Let k : A →ₐ[R] B with B a commutative R-algebra. For g admissible in A and in B, k(evalAt_g^A(z))=evalAt_g^B(z). The second admissibility follows automatically from IsUnit.map and the algebra-map compatibility of k.

Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. B is a commutative R-algebra; k : A →ₐ[R] B; g has unit factor in A (hence also in B).

Proof outline:

1. Map the evaluation equation from A to B using k.
2. The R-algebra law identifies k(f_A(c_g)) with f_B(c_g), and likewise for n_g(z).
3. Compare with the evaluation equation in B and cancel its unit. Identity and composition compatibility follow by specializing k and evaluating composed functions.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec`, `mathlib:IsUnit.map`, `mathlib:IsUnit.mul_left_cancel`.

Acceptance: For k=id_A the equality is reflexive; applying it successively along A→B→C gives the same equality as the composite. In particular it transports the rational value 1/2 along ℚ→ℝ in the integer-units example.

Source: RJW-published, Equation (3-11), printed pp. 129–130 / PDF 30–31 Functorial consequence of the source formula needed for coefficient specializations; not stated separately in the paper. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Obstruction to total quotient evaluation

`PadicMeasuresIwasawaAlgebras:L3/obstruction-to-fraction-extension` — lemma.

Let f : R →+* A with A a nontrivial commutative ring. If s ∈ nonZeroDivisors R and f(s)=0, there is no F : Q →+* A with F.comp (algebraMap R Q)=f.

Hypotheses: R,Q are commutative rings, Q is an R-algebra with IsFractionRing R Q. A is a nontrivial commutative ring; f : R →+* A; s is a non-zero-divisor of R killed by f.

Proof outline:

1. IsLocalization.map_units makes ι(s) a unit in Q.
2. If F existed, IsUnit.map would make F(ι(s))=f(s)=0 a unit in A, contradicting not_isUnit_zero.
3. The existing IsLocalization.lift has the stronger denominator hypothesis needed to extend a map on all of Q. It supplies no such lift merely because f is a character integral.

Prerequisites: `mathlib:IsFractionRing`, `mathlib:IsLocalization.map_units`, `mathlib:IsUnit.map`, `mathlib:not_isUnit_zero`, `mathlib:IsLocalization.lift`.

Acceptance: For R=ℚ[X], evaluation at 0 kills the regular element X, so it cannot extend to FractionRing R. For R=ℚ[X], evaluation at 3 kills the regular element X−3; nonzero evaluation points do not resolve the obstruction. The condition that 2 ≠ 0 in ℤ does not make 2 invertible; general-target evaluation must require IsUnit.

Source: RJW-published, Remark 3.35, printed p. 130 / PDF 31; correction recorded as E1 Counterexample criterion correcting the asserted whole-total-quotient extension. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

## Coverage ledger

All eight gaps remain explicit. The supplied subgraphs terminate in recorded baseline declarations, but they do not exhaust the scoped stages. No supplier request is currently open.

### PadicMeasuresIwasawaAlgebras:L0 — partial

- Clopen restriction/extension, support, complementary decomposition and restriction-pushforward naturality are supplied, with weak continuity and closed embeddings and field-valued strong/norm comparisons, on the native scalar-valued continuous dual for compact X and normed commutative R. Complete the general profinite measure decomposition: clopen density and dense extension from the pinned baseline, finitely additive clopen data with the necessary boundedness, and the precise integral-lattice/field-valued comparisons.
- Read and decompose coefficient/lattice sources, finite free integral lattices, scaling and scalar extension with the required value-group hypotheses, orthonormal bases, and completed coefficient tensors. Use the native weak and field-valued strong topology definitions: clopen decomposition and supported inclusion comparisons are now supplied. Establish the remaining completeness, integral-lattice/field-scaling, weak compactness and norm noncompactness statements with their exact hypotheses. The strong topology comparison for integral measures still requires its explicit field-lattice identification.

### PadicMeasuresIwasawaAlgebras:L0a — not_read

- Read and decompose the continuous character functor and its parameter spaces using the existing partial ℤ_p-character library. Keep family distribution actions at LocallyAnalyticDistributions:L4 under accepted RS-16; do not add a reverse prerequisite.

### PadicMeasuresIwasawaAlgebras:L1 — not_read

- Read and decompose joint adic/finite-group completed group algebras, bounded-measure comparison and convolution. Import the ℤ_p completed group algebra from ProfiniteProPGroups:Layer9 rather than rebuilding it. Resolve the RS-16 topology gate: finite-quotient kernels ((1+T)^(p^n)−1), with p-power coefficient reduction, are not the pure T-adic kernels.

### PadicMeasuresIwasawaAlgebras:L2 — partial

- The bounded-sequence inverse and the actual Z_p-to-R extension of measures on Z_p are supplied for complete ultrametric normed commutative Z_p-algebras with bounded scalar action. Establish the bounded-coefficient characterization of all field-valued measures, the receiving finite-extension integer-ring instances and the integral-lattice/scaling comparisons. Prove coefficient-tower, convolution, multivariable and norm/weak-topology comparisons on their actual domains; no surjectivity onto all field-valued formal series is asserted. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; coefficient-norm, integral-lattice and broader coefficient comparisons remain separate.
- The integral inverse weight and inverse Mahler derivative on kerψ, together with inverse-factor covariance under the existing unit-dilation pushforward, are supplied. Generic clopen restriction, the comparison with native unit-group measures, and the linear identifications with the ambient and integral-series ψ kernels are supplied by the L0 clopen and L2 intrinsic-unit nodes. Decompose multiplication by z^x with genuine convergence hypotheses. Prove the unit-dilation/formal-binomial-substitution comparison and import the P7 cyclotomic action after identifying its coefficients and topology; the raw pushforward identity alone does not identify an arithmetic Galois action. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; coefficient-norm, integral-lattice and broader coefficient comparisons remain separate.
- The integral ℤ_p prime-root averaging identity, unique integral descent, finite partial fractions, and rational-series comparison over C_p or an embedded cyclotomic field are supplied. Use the supplied bounded inverse and Z_p coefficient extension, but establish the remaining coefficient-lattice and coefficient-general operator comparisons before claiming the full §3.5.3–5 formulas; decompose arbitrary residue classes modulo p^n and multiplication by z^x with their convergence hypotheses. ColemanPowerSeries:L1 owns the finite-free normalized-trace comparison; locally analytic and period-ring recipients own their comparisons. Keep all these edges directed from the bounded supplier to its consumers. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; coefficient-norm, integral-lattice and broader coefficient comparisons remain separate.
- Import completed-algebra/procyclic coordinates from L1 and ProfiniteProPGroups Layer9 and compare them with the pinned Amice equivalence. Preserve the joint adic/finite-quotient topology gate; finite-group kernels are ((1+T)^(p^n)−1), with coefficient reduction, not pure T-adic kernels. The native integral Amice and unit-kernel equivalences now have weak/coefficientwise homeomorphism comparisons; coefficient-norm, integral-lattice and broader coefficient comparisons remain separate.

### PadicMeasuresIwasawaAlgebras:L3 — partial

- Identify this generic algebraic δ with the Dirac homomorphism into the actual completed group algebra supplied by L1/ProfiniteProPGroups:Layer9, and identify the scalar map f with continuous-character integration. The present declarations take those data explicitly.
- Compare the R-span of all Dirac differences with the completed augmentation kernel, with the required closure and topology stated; do not silently identify algebraic span with a closed ideal.
- Decompose Lemma 3.36(i) positive-moment uniqueness via Mahler/ψ, (ii) moment nonvanishing implies regularity, and (iii) pseudomeasure uniqueness. Choose an infinite-order integer a (e.g. p+1) in the proof, as explained in E3.
- Decompose the procyclic augmentation-kernel/principal-generator argument and prove the chosen denominator regular before forming the Lemma 3.38 fraction. Keep the dyadic ℤ₂ˣ ≅ C₂ × ℤ₂ case separate; ℤ₂[C₂] is not an integral product of character components.
- Construct admissible character specializations, including their varying-character loci and any topology actually required by downstream L-functions. The generic algebraic evaluation map alone does not supply analytic families.

### PadicMeasuresIwasawaAlgebras:L4 — not_read

- Read/decompose one- and multivariable Iwasawa module structure, characteristic ideals/divisors, regular-local dimension hypotheses and coefficient specialization. Reuse existing Weierstrass preparation, Noetherian/UFD facts and the Fitting owner tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.

### PadicMeasuresIwasawaAlgebras:L5 — not_read

- Read/decompose determinant functors and compact inverse-limit exactness with their hypotheses. Import generic perfect-complex theory from SchemeKTheoryOperations:S.1 and complete-local input from DeformationAndDerivedPatchingAlgebra:P7; plan only the remaining Iwasawa-specific structures. For the compact inverse-limit step, reject the finite-generation-to-Mittag–Leffler implication in RJW Proposition13.13 (E6): prove the compact Hausdorff exactness argument or the actual tower hypothesis. Reading that local passage does not decompose this layer.

### PadicMeasuresIwasawaAlgebras:L6 — not_read

- Read/decompose Gorenstein order duality, exterior biduals and their integral comparison and base-change maps; retain this ownership under RS-16. Import Fitting facts; Euler/Kolyvagin system contractions remain at their separate ES6–8 owners.

## Source corrections

The thirteen findings below are pending independent review. The seven inherited findings are preserved. E8–E13 arise from the newly read introduction and measure preliminaries. No correspondence has been sent to the authors. Corrections qualify the planned statements and are not counted as additional source decomposition of the unprocessed layers.

### PadicMeasuresIwasawaAlgebras/E1: error

Remark 3.35, published printed p. 130 / PDF 31; same assertion in arXiv v2 PDF 22.

Correction: A continuous character integral extends to a localization only when every inverted element has unit image. A pseudomeasure can instead be evaluated by (3-11) once one Dirac difference has nonzero character value. It does not generally extend to all of Q(G).

Reason: Take p=3, G=ℤ₃ with generator γ, and R=ℤ₃[[T]] with [γ]=1+T. The continuous nontrivial character χ(x)=4^x gives the convergent evaluation T↦3. The nonzero regular series T−3 maps to zero, so no extension to Q(R) exists: its inverse would force 0=1. This example meets the remark’s nontrivial-character hypothesis. Separately, augmentation T↦0 kills T. The generic obstruction node and the two polynomial test cases isolate the same algebraic failure. Accepted RS-16 already warns against whole-fraction augmentation; no published erratum was found in the listed search.

Affects: a stated result.

### PadicMeasuresIwasawaAlgebras/E2: misprint

Final term in the independence calculation after (3-11), published printed p. 130 / PDF 31; arXiv v2 PDF 22.

Correction: The last integrand must use λ, the pseudomeasure occurring in the other two terms of the calculation.

Reason: The calculation compares two clearing factors applied to one fixed pseudomeasure λ. No second pseudomeasure μ is introduced there. Replacing the final μ by λ yields the cross-multiplied-numerator identity and the valid independence proof.

Affects: nothing.

### PadicMeasuresIwasawaAlgebras/E3: error

Proof of Lemma 3.36(iii), published printed p. 131 / PDF 32; arXiv v2 PDF 23.

Correction: Choose an integer a>1 prime to p, for example p+1; more generally choose a of infinite order, so a^k−1≠0 for every positive k.

Reason: The stated choice of an integer a≠1 prime to p allows a=−1. Its even moments vanish, so [a]−[1] does not satisfy part (ii), contrary to the proof’s next claim. Indeed ([−1]−[1])([−1]+[1])=0. The two factors are nonzero for the characteristic-zero coefficient ring, as seen in a finite quotient distinguishing ±1. Taking a=p+1 repairs this step and leaves the lemma intact.

Affects: the proof.

### PadicMeasuresIwasawaAlgebras/E4: misprint

§3.5.5, calculation proving ψ∘φ=id, penultimate integral; published printed p.128 / PDF29, also arXiv v2 PDF21.

Correction: After replacing the integration variable by px, label the intermediate integral with μ: ∫ 1_(pZ_p)(px) f(x) · μ. The displayed conclusion ψφ=id is unchanged.

Reason: The defining pushforward formula is φμ(g)=μ(g∘m_p). For p=3, μ=δ₁ and f=x, the printed intermediate integral against φμ evaluates to 3 while both outside terms evaluate to 1. This is visible in the rendered publication, so it is not an extraction artifact. The corrected proof is node psi-phi.

Affects: the proof.

### PadicMeasuresIwasawaAlgebras/E5: misprint

Proof of Corollary 13.14, published printed p.193 / PDF94; arXiv v2 PDF68.

Correction: Reverse numerator and denominator in both quotients: Gal(M⁺∞/L⁺∞) ≅ U⁺∞,1/E⁺∞,1 ≅ (U⁺∞,1/C⁺∞,1)/(E⁺∞,1/C⁺∞,1).

Reason: Proposition 13.13 immediately above has kernel E inside U, and Definition 13.12 defines E as the closure of global units inside local units. The first isomorphism theorem therefore gives U/E. Since C⊆E⊆U, the third isomorphism theorem then gives (U/C)/(E/C). The printed E/U is not the required quotient; merely changing the first quotient leaves the second one reversed. The corollary’s stated exact sequence has the correct orientation and is unchanged.

Affects: the proof.

### PadicMeasuresIwasawaAlgebras/E6: error

Last sentence of the proof of Proposition 13.13, published printed p.193 / PDF94; arXiv v2 PDF68.

Correction: Justify inverse-limit exactness using compact Hausdorff modules and continuous transition maps, or prove the required Mittag–Leffler condition for this particular tower. Finite generation over Z_p alone does not imply stabilization of transition images.

Reason: Take M_n=Z_p and transition M_(n+1)→M_n equal to multiplication by p. Every term is free of rank 1, but the images in M_0 are p^mZ_p, a strictly decreasing chain: p^m is not in p^(m+1)Z_p since cancellation would make p a unit. Thus this inverse system is not Mittag–Leffler. This counterexample rejects only the stated general implication, not a separately proved ML claim for the paper’s actual unit tower. For the displayed finite-level exact sequences, compactness provides the repair: fibres over a compatible quotient element are nonempty compact spaces; the transition-compatibility equations are closed and have the finite-intersection property, so a compatible lift exists. The paper already records compactness of these unit modules in §9, printed p.163. Class-field-theory identifications remain separate inputs; the proposition’s conclusion is not refuted.

Affects: the proof.

### PadicMeasuresIwasawaAlgebras/E7: misprint

Leopoldt paragraph immediately after Definition 13.12, published printed p.193 / PDF94; arXiv v2 PDF67. Compare §9 notation, published p.161 / PDF62.

Correction: The numerical rank is pⁿ⁻¹(p−1)/2−1. Retain the source’s r₁+r₂−1 on the left.

Reason: Here p is odd and F_n=Q(μ_(p^n)) by §9, so r₁=0 and r₂=p^(n−1)(p−1)/2. Subtracting 1 is required by the displayed expression itself. At p=3,n=1, F_1 is the imaginary quadratic field Q(ζ₃), whose global units form the finite group μ₆; its closure has Z₃-rank 0, whereas the printed numerical formula gives 1. This corrects the numerical assertion, not Leopoldt’s conjecture or the use of its known abelian case.

Affects: a stated result.

### PadicMeasuresIwasawaAlgebras/E8: misprint

Definition 2.10, published printed p.114 / physical PDF15; arXiv v2 p.10.

Correction: The ideles form a topological group under multiplication, with the displayed restricted product topology.

Reason: The displayed factors are multiplicative unit groups. The ideles 1 and −1 have componentwise sum zero, which is not an idele. Thus componentwise addition does not make this carrier a ring. The following idele-class-group statement uses the group structure and is unaffected. This is a source correction recorded during navigation to the measure chapter, not a new idele construction in this roadmap.

Affects: nothing.

### PadicMeasuresIwasawaAlgebras/E9: error

Definition 3.5, strong-topology bullet, published printed p.119 / PDF20; arXiv v2 p.14.

Correction: The operator-norm topology gives uniform convergence on the unit ball, equivalently on each norm-bounded set; it does not give uniform convergence on all of B.

Reason: Take B=L=ℚ_p and μ_n(x)=p^n x. The operator norm is p^(−n), tending to zero. On all of B, however, taking x=p^(−n) gives μ_n(x)=1 for every n, so uniform convergence to zero fails. The displayed dual-valuation construction remains the intended one; its convergence description needs the bounded-domain qualification. The campaign already states that qualification.

Affects: a stated result.

### PadicMeasuresIwasawaAlgebras/E10: error

Remark 3.6, first sentence, published printed p.119 / PDF20; arXiv v2 p.14.

Correction: Retain norm completeness of the Banach dual. Do not claim completeness of the entire continuous dual for pointwise convergence; compact integral or bounded subsets require their own hypotheses and completeness statements.

Reason: Take B=c₀(ℕ,ℚ_p). Extend the algebraic functional e_n↦p^(−n) from the finite-support span to an algebraic linear functional ℓ on B using a vector-space basis. It is discontinuous because ‖e_n‖=1 while |ℓ(e_n)|=p^n. For each finite subset F of B, a finite set J of coordinates is injective on span(F): coordinate kernels separate points, and a descending chain of subspaces of that finite-dimensional space stabilizes. Extend ℓ|span(F) through the injection into ℚ_p^J to a linear functional on ℚ_p^J. Composing with coordinate projection yields a continuous functional ℓ_F on B agreeing with ℓ on F. Ordered by inclusion of F, these ℓ_F are eventually equal to ℓ at every fixed vector. Hence the net is Cauchy for pointwise convergence, but any weak limit would equal the discontinuous ℓ and could not belong to B*. This concerns completeness for nets, not a claim that every pointwise Cauchy sequence fails. The campaign already rejects unrestricted weak completeness.

Affects: a stated result.

### PadicMeasuresIwasawaAlgebras/E11: error

Remark 3.9, published printed p.120 / PDF21; arXiv v2 p.14.

Correction: The unchanged supremum-norm Banach-space definition applies to compact subsets (in particular closed or clopen subsets). On a general noncompact subset, specify a space of bounded continuous functions or a different topology before taking its continuous dual.

Reason: For G=ℤ_p, X=ℤ_p∖{0} and L=ℚ_p, the function f(x)=x^(−1) is continuous on X but |f(p^n)|=p^n is unbounded. Thus the proposed supremum norm on all C(X,L) is not finite. The clopen restriction nodes in this checkpoint retain compactness and avoid this failure. The campaign already makes the noncompact-space qualification.

Affects: a stated result.

### PadicMeasuresIwasawaAlgebras/E12: gap

Remark 3.11, displayed locally constant truncations, published printed p.120 / PDF21; arXiv v2 p.15.

Correction: For an arbitrary profinite G, approximate using a finite clopen partition on which the oscillation of φ is small; for a profinite group one can refine to cosets of an open normal subgroup. The displayed residue-class formula only treats ℤ_p, after choosing representatives.

Reason: The chapter allows an arbitrary profinite abelian group G, which has no specified points indexed by ℤ/p^nℤ and no specified subsets a+p^nℤ_p. In particular the formula does not define an approximation on G=ℤ_p×ℤ_p. Compactness and continuity give a finite clopen refinement of small-oscillation neighbourhoods, providing the missing general argument; the density conclusion is retained. Native clopen approximation is already in the reviewed baseline, and is not re-planned as a new declaration here.

Affects: the proof.

### PadicMeasuresIwasawaAlgebras/E13: error

Remark 2.18, published printed p.117 / PDF18; arXiv v2 p.12.

Correction: Applying a congruence of test functions modulo p^m requires an integral bounded measure. For the trivial character the zeta object is a pseudomeasure; first clear its denominator with a smoothing factor, or state and prove the valid branch restrictions for an unsmoothed Kummer congruence.

Reason: Take p=3, m=1, η trivial, k=2 and ℓ=4. The exponents are congruent modulo p−1. Yet (1−3)ζ(−1)=1/6 and (1−27)ζ(−3)=−13/60, whose difference is 23/60 and has 3-adic valuation −1, not at least 1. Thus the blanket congruence, explicitly applied to the Riemann zeta function in the next sentence, is false. Clearing by [2]−[1] multiplies these two values by 2²−1 and 2⁴−1; the difference becomes 15/4, of valuation 1, as expected from the integral smoothed measure. No counterexample to the interpolation theorems or correctly qualified Kummer congruences is claimed. Arithmetic repairs belong to DirichletPadicLFunctions; this finding records the shared source distinction between bounded measures and pseudomeasures.

Affects: a stated result.

Correction search for E8–E13:

- 27 September 2026: collated the exact passages in the published PDF (SHA-256 78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6) and arXiv v2 (efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4), extracting no more than three physical pages per call. The arXiv listing https://arxiv.org/abs/2309.15692 still lists v2, 19 December 2024, as latest.
- 27 September 2026: title/authors plus errata, arXiv identifier plus correction, and title plus Remark 3.6 searches found the article and older lecture notes but no identified correction. This bounded search does not establish historical priority.
- 27 September 2026: authors’ article entries at https://sites.google.com/site/joaquinrj/home and https://chriswilliams1404.wixsite.com/website/publications-preprints link the publication and preprint; neither page contains an erratum entry for it. The journal landing page https://msp.org/ent/2025/4-1/p03.xhtml returned a browser internal error; the version-of-record PDF was available in the verified source cache.
- The current atlas source-issue register and the nine Dirichlet source findings were screened; no existing finding with these locators was found. The PMIA campaign and accepted RS-16 already qualify the general-subset, approximation and topology claims, so those observations are not new to the atlas. The seven inherited PMIA findings are preserved unchanged.

## Sources and validation

- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.

Reading record:

- PDF 30–32, printed 129–131: Corollary 3.32, Remark 3.33, §3.6, Definition 3.34, equation (3-11), Remark 3.35, Lemma 3.36 and its proof, Definition 3.37, Lemma 3.38 and its proof. PDF 33: Remark 3.39 and surrounding locally analytic context were also read to check evaluation inside the open unit disc. This is not an all-paper reading.
- Continuation codex-a71f92: published PDF 26–28, printed 125–127, Remark 3.28, §3.5.1–2, Lemma 3.29 and Corollary 3.30; PDF 37–38, printed 136–137, Lemma 4.3 and use in Proposition 4.6. Formal operator/moment portion only; no all-paper reading claim.
- Continuation codex-7e92bd: printed126–129 / PDF27–30 of the publication, read in full; matching v2 PDF20–21 collated for the restriction and phi/psi passage. The published p128 display was also rendered and visually checked for finding E4. No all-paper reading claim.
- Unit inverse continuation, 27 September2026: printed pp138–139 and179–180, equation(4-3) and full Proposition12.5 proof; pp138/179 visually checked. Additionally read/rendered printed193/PDF94 for Definition13.12, Proposition13.13 and Corollary13.14; source notation checked on printed161 and compactness paragraph163. Collated v2 PDF28,58–59 and67–68. No all-paper or L5 source-decomposition claim.
- Root-averaging continuation, 27 September 2026: freshly fetched publication printed127–129/PDF28–30 and printed137/PDF38, and arXiv v2 PDF20–22 and27, read in full and collated. The same edition hashes were verified. No all-paper reading or arbitrary-coefficient bounded Amice theorem is claimed.
- Clopen/intrinsic-unit continuation, 27 September 2026: published physical PDF14–16,18–23,28–30 (printed113–115,117–122,127–129) read in batches of at most three pages; corresponding v2 physical pages10–15,20–22 collated. Focus: Definitions3.7–3.8, Remarks3.9–3.12,3.31,3.33 and Corollary3.32. Six source findings E8–E13 record passages encountered in the introduction/preliminaries, with bounded correction search. No all-paper reading or full L0 decomposition is claimed.

- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), arXiv:2309.15692v2, 19 December 2024. SHA-256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.

Reading record:

- PDF 21–23, including §3.6, Definitions 3.34/3.37, Remarks 3.33/3.35, Lemmas 3.36/3.38 with proofs, collated against the published passage.
- Continuation codex-a71f92: matching §3.5.1–2 on PDF 19–20 and Lemma 4.3/Proposition 4.6 on PDF 27, collated against the publication.
- Continuation codex-7e92bd: printed126–129 / PDF27–30 of the publication, read in full; matching v2 PDF20–21 collated for the restriction and phi/psi passage. The published p128 display was also rendered and visually checked for finding E4. No all-paper reading claim.
- Root-averaging continuation, 27 September 2026: freshly fetched publication printed127–129/PDF28–30 and printed137/PDF38, and arXiv v2 PDF20–22 and27, read in full and collated. The same edition hashes were verified. No all-paper reading or arbitrary-coefficient bounded Amice theorem is claimed.
- 27 September 2026 bounded-coefficient follow-up: fresh public arXiv v2 hash matched; pp.17–19, especially the full proof of Theorem 3.25 and Remark 3.28, read. The bounded-sequence ring generalization and Z_p-domain coefficient-extension compatibilities are worker derivations checked against the pinned general Mahler basis. No convolution-algebra or weak/strong-topology equivalence is inferred from the linear inverse.
- Clopen/intrinsic-unit continuation, 27 September 2026: published physical PDF14–16,18–23,28–30 (printed113–115,117–122,127–129) read in batches of at most three pages; corresponding v2 physical pages10–15,20–22 collated. Focus: Definitions3.7–3.8, Remarks3.9–3.12,3.31,3.33 and Corollary3.32. Six source findings E8–E13 record passages encountered in the introduction/preliminaries, with bounded correction search. No all-paper reading or full L0 decomposition is claimed.

The preceding clopen-topology checkpoint had 157 unchecked nodes, 141 API items, 109 packet tests (99 on definitions/constructions), 120 typed suggested examples, 13 planets and 157 baseline references. Three planets belong to L0, six to L2 and four to L3. All existing planets, 142 predecessor node objects and thirteen source findings are preserved. Eight gaps remain and no stage is closed.

## Topology comparisons for the existing measure maps

Mathlib already defines both AbstractMeasure.WeakTopology and
AbstractMeasure.StrongTopology. Neither is a global instance. Every theorem
below selects its topology explicitly on the existing continuous-dual carrier.
WeakTopology is pointwise convergence against continuous tests and is available
for normed commutative ring coefficients, including integral p-adic coefficients.
The pinned StrongTopology and continuous-dual operator norm require a
nontrivially normed coefficient field. Their identification with an integral
lattice is a separate remaining comparison.

Weak continuity of pushforward and restriction follows by evaluating at a
fixed test function. The section identity then gives a closed embedding of
intrinsic clopen measures into ambient measures. This uses the Hausdorff weak
topology, without assuming compactness or completeness of the whole dual.
The supported image is the existing annihilator condition on all test functions
vanishing on the subset. The complementary decomposition is a homeomorphism.

For field-valued measures, pushforward and restriction have operator norm at
most one. The section identity proves equality of norms for clopen inclusion.
The inverse of the complementary decomposition is bounded by the sum of its
two input norms, at most twice their maximum. An isometry for that product
would require an ultrametric argument; the statements here allow archimedean
fields and keep the appropriate bound.

On the actual p-adic unit group, the existing kernel equivalence is a
homeomorphism in each of the separately specified topologies. For integral
coefficients, the actual Amice equivalence is a homeomorphism between weak
measure topology and coefficientwise power-series topology. Forward continuity
uses fixed Mahler evaluations; inverse continuity imports the existing uniform
tail argument. Its restriction gives the unit-series kernel comparison needed
by Coleman. These facts do not identify the coefficient supremum topology with
the coefficientwise topology or supply the general integral-lattice theorem.

### Weak continuity of measure pushforward

`PadicMeasuresIwasawaAlgebras:L0/pushforward-weak-continuous` — `AbstractMeasure.continuous_map_weak` (lemma).

For a continuous map q:X to Y between compact spaces, native pushforward q_*:D(X,R) to D(Y,R) is continuous for the native weak topologies.

**Hypotheses:** X is compact, s is a clopen subset, and R is a normed commutative ring. The topology on every existing AbstractMeasure carrier is the native AbstractMeasure.WeakTopology, selected explicitly. No field, completeness, ultrametricity, nonempty-domain or Hausdorff-domain hypothesis is imposed. Write z_s for the existing zero extension of continuous test functions, r_s for the existing intrinsic clopen restriction and j_s for native pushforward along the subtype inclusion. No new measure carrier or topology is defined. Y is also compact and q is an existing continuous map.

**Proof outline:**

1. Identify the native weak topology with the evaluation-induced topology on the existing weak dual; this is a reduction of definitions, not a new equivalence carrier.
2. For each continuous test f on Y, evaluate q_*mu at f. The native map_apply formula gives mu(f composed with q), which is a fixed evaluation and hence continuous.
3. The native weak-dual evaluation criterion gives continuity. Neither convergence of integrals uniform in f nor any domain compactness argument beyond the selected test spaces is used.

**Prerequisites:** `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.WeakTopology`, `mathlib:WeakDual.continuous_of_continuous_eval`, `mathlib:WeakDual.eval_continuous`.

**Tests:**

- `ClopenTopologyTests.weak_scaled_dirac` (computation): For every continuous q:Z_3 to Z_3, q_* applied to 3^n times the unit Dirac mass converges weakly to zero.

**Acceptance:** The underlying pushforward is unchanged and preserves native Dirac measures.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak continuity of clopen restriction

`PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-weak-continuous` — `AbstractMeasure.continuous_restrictClopen_weak` (lemma).

The existing intrinsic restriction r_s:D(X,R) to D(s,R) is continuous for the native weak topologies.

**Hypotheses:** X is compact, s is a clopen subset, and R is a normed commutative ring. The topology on every existing AbstractMeasure carrier is the native AbstractMeasure.WeakTopology, selected explicitly. No field, completeness, ultrametricity, nonempty-domain or Hausdorff-domain hypothesis is imposed. Write z_s for the existing zero extension of continuous test functions, r_s for the existing intrinsic clopen restriction and j_s for native pushforward along the subtype inclusion. No new measure carrier or topology is defined.

**Proof outline:**

1. For fixed f in C(s,R), the restriction formula is r_s(mu)(f)=mu(z_s(f)).
2. The zero extension z_s(f) is one fixed continuous test on X. Evaluation at it is weakly continuous.
3. Apply the native pointwise continuity criterion. This works also when s is empty.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `mathlib:AbstractMeasure.WeakTopology`, `mathlib:WeakDual.continuous_of_continuous_eval`, `mathlib:WeakDual.eval_continuous`.

**Acceptance:** Restriction continuity is established on the actual subtype measure, not just on the ambient projector.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak closed embedding of clopen measures

`PadicMeasuresIwasawaAlgebras:L0/clopen-inclusion-weak-closed-embedding` — `AbstractMeasure.isClosedEmbedding_map_subtype_weak` (theorem).

Native inclusion pushforward j_s:D(s,R) to D(X,R) is a closed embedding for the weak topologies. Its range is the already characterized subspace of measures annihilating all tests that vanish on s.

**Hypotheses:** X is compact, s is a clopen subset, and R is a normed commutative ring. The topology on every existing AbstractMeasure carrier is the native AbstractMeasure.WeakTopology, selected explicitly. No field, completeness, ultrametricity, nonempty-domain or Hausdorff-domain hypothesis is imposed. Write z_s for the existing zero extension of continuous test functions, r_s for the existing intrinsic clopen restriction and j_s for native pushforward along the subtype inclusion. No new measure carrier or topology is defined.

**Proof outline:**

1. The native weak dual is Hausdorff because the normed coefficient ring is Hausdorff and evaluation separates continuous linear maps. Transport this instance to the definitionally identical evaluation topology.
2. The existing section says r_s composed with j_s is the identity. Both maps are weakly continuous by the preceding lemmas.
3. Apply the pinned closed-embedding theorem for a continuous section/retraction in a Hausdorff ambient space. Import the existing support characterization to identify the range; do not redefine support as support of a real measure.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/pushforward-weak-continuous`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-weak-continuous`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-section`, `PadicMeasuresIwasawaAlgebras:L0/clopen-support-characterization`, `mathlib:WeakDual.instT2Space`, `mathlib:Function.LeftInverse.isClosedEmbedding`.

**Acceptance:** No compactness of the full dual and no weak completeness assumption is used.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak topological clopen decomposition

`PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-weak-homeomorphism` — `AbstractMeasure.isHomeomorph_clopenDecomposition_weak` (comparison).

The existing linear equivalence clopenDecomposition from D(X,R) to D(s,R) times D(complement s,R) is a homeomorphism for the native weak topologies and their product topology.

**Hypotheses:** X is compact, s is a clopen subset, and R is a normed commutative ring. The topology on every existing AbstractMeasure carrier is the native AbstractMeasure.WeakTopology, selected explicitly. No field, completeness, ultrametricity, nonempty-domain or Hausdorff-domain hypothesis is imposed. Write z_s for the existing zero extension of continuous test functions, r_s for the existing intrinsic clopen restriction and j_s for native pushforward along the subtype inclusion. No new measure carrier or topology is defined.

**Proof outline:**

1. Each forward coordinate is a weakly continuous restriction, so the product map is continuous.
2. The existing inverse is (nu,eta) maps to j_s(nu)+j_complement(eta). Each test evaluates this as the sum of two continuous evaluations, so the inverse is weakly continuous.
3. Use the native criterion for a linear equivalence to be a homeomorphism. All inverse identities are imported from the existing decomposition.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-equivalence`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-weak-continuous`, `PadicMeasuresIwasawaAlgebras:L0/pushforward-weak-continuous`, `mathlib:AbstractMeasure.WeakTopology`, `mathlib:WeakDual.continuous_of_continuous_eval`, `mathlib:WeakDual.eval_continuous`, `mathlib:LinearEquiv.isHomeomorph_iff`.

**Acceptance:** The maps retain the empty/full clopen cases and use the product, not a discrete topology.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Pushforward contracts the measure norm

`PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound` — `AbstractMeasure.norm_map_le` (lemma).

For q:X to Y continuous between compact spaces and every mu in D(X,K), the operator norm of q_*mu is at most the operator norm of mu.

**Hypotheses:** X is compact, s is clopen, and K is a nontrivially normed field. Every measure norm means the operator norm of its image under the native AbstractMeasure.toCLMEquiv; the strong topology is the native AbstractMeasure.StrongTopology. These hypotheses do not include completeness or ultrametricity. The compact subtype s may be empty. All maps are the existing restriction and native pushforward. This field-valued assertion does not install an operator norm on integral ring-valued measures; the integral-lattice comparison remains separate. Y is compact and q:X to Y is continuous.

**Proof outline:**

1. For f in C(Y,K), the supremum norm of f composed with q is at most the norm of f: bound each value by the supremum norm and use the compact-domain norm criterion.
2. Native evaluation gives |q_*mu(f)|=|mu(f composed with q)|, at most norm(mu) times norm(f).
3. Apply the pinned operator-norm bound. This only asserts an inequality for a general q; collapsing distinct points can cause cancellation.

**Prerequisites:** `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:ContinuousMap.norm_le`, `mathlib:ContinuousMap.norm_coe_le_norm`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`.

**Acceptance:** No surjectivity or injectivity of q is assumed.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Clopen restriction contracts the measure norm

`PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-operator-norm-bound` — `AbstractMeasure.norm_restrictClopen_le` (lemma).

For every mu in D(X,K), the operator norm of r_s(mu) is at most the operator norm of mu.

**Hypotheses:** X is compact, s is clopen, and K is a nontrivially normed field. Every measure norm means the operator norm of its image under the native AbstractMeasure.toCLMEquiv; the strong topology is the native AbstractMeasure.StrongTopology. These hypotheses do not include completeness or ultrametricity. The compact subtype s may be empty. All maps are the existing restriction and native pushforward. This field-valued assertion does not install an operator norm on integral ring-valued measures; the integral-lattice comparison remains separate.

**Proof outline:**

1. The existing zero-extension norm theorem gives norm(z_s(f))=norm(f), including the empty subtype.
2. The restriction evaluation formula and the native functional bound give |r_s(mu)(f)| at most norm(mu) times norm(f).
3. Apply the native operator-norm criterion. This is contractivity, not an assertion that every restriction preserves norm.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-norm`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`.

**Tests:**

- `ClopenTopologyTests.empty_restriction` (degenerate): The restriction of every Q_3-valued measure to the empty clopen has operator norm zero.
- `ClopenTopologyTests.dropped_atom` (non-example): Restricting the Q_3-valued Dirac mass at zero to the empty clopen strictly decreases its norm from one to zero.

**Acceptance:** A Dirac mass outside s restricts to zero and prevents an isometry claim.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Clopen inclusion preserves the measure norm

`PadicMeasuresIwasawaAlgebras:L0/clopen-inclusion-operator-norm` — `AbstractMeasure.norm_map_subtype` (lemma).

For every nu in D(s,K), the operator norm of j_s(nu) equals the operator norm of nu. Hence native inclusion is an isometry on the continuous-dual norm models.

**Hypotheses:** X is compact, s is clopen, and K is a nontrivially normed field. Every measure norm means the operator norm of its image under the native AbstractMeasure.toCLMEquiv; the strong topology is the native AbstractMeasure.StrongTopology. These hypotheses do not include completeness or ultrametricity. The compact subtype s may be empty. All maps are the existing restriction and native pushforward. This field-valued assertion does not install an operator norm on integral ring-valued measures; the integral-lattice comparison remains separate.

**Proof outline:**

1. Pushforward contractivity gives norm(j_s(nu)) at most norm(nu).
2. Apply restriction contractivity to j_s(nu) and rewrite r_s(j_s(nu))=nu to obtain the reverse inequality.
3. For the distance assertion apply the norm equality to a difference and use the existing linearity. No extension theorem for arbitrary closed subsets is asserted.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-section`, `mathlib:AbstractMeasure.toCLMEquiv`.

**Tests:**

- `ClopenTopologyTests.full_inclusion` (compatibility): Inclusion from the full clopen of Z_3 preserves every Q_3-valued measure norm.

**Acceptance:** The result uses a clopen retraction on tests and needs no Hahn-Banach theorem.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Strong closed embedding of clopen measures

`PadicMeasuresIwasawaAlgebras:L0/clopen-inclusion-strong-closed-embedding` — `AbstractMeasure.isClosedEmbedding_map_subtype_strong` (theorem).

Native inclusion j_s:D(s,K) to D(X,K) is a closed embedding for the native strong topologies.

**Hypotheses:** X is compact, s is clopen, and K is a nontrivially normed field. Every measure norm means the operator norm of its image under the native AbstractMeasure.toCLMEquiv; the strong topology is the native AbstractMeasure.StrongTopology. These hypotheses do not include completeness or ultrametricity. The compact subtype s may be empty. All maps are the existing restriction and native pushforward. This field-valued assertion does not install an operator norm on integral ring-valued measures; the integral-lattice comparison remains separate.

**Proof outline:**

1. Transport the existing linear maps to their continuous-linear-map norm models using the native toCLMEquiv. Their norm inequalities yield Lipschitz constant one and strong continuity by the native bounded linear-map constructor.
2. The ambient normed continuous dual is Hausdorff even when K is incomplete.
3. Apply the continuous section/retraction closed-embedding theorem with r_s composed with j_s equal to the identity. Completeness and compactness of either measure space are unnecessary.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-section`, `mathlib:AbstractMeasure.StrongTopology`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:LinearMap.mkContinuous`, `mathlib:Function.LeftInverse.isClosedEmbedding`.

**Acceptance:** Closed range follows from the continuous retraction, not from an unjustified completeness hypothesis.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Strong topological clopen decomposition

`PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-strong-homeomorphism` — `AbstractMeasure.isHomeomorph_clopenDecomposition_strong` (comparison).

The existing clopenDecomposition is a homeomorphism for the native strong topologies and the product topology.

**Hypotheses:** X is compact, s is clopen, and K is a nontrivially normed field. Every measure norm means the operator norm of its image under the native AbstractMeasure.toCLMEquiv; the strong topology is the native AbstractMeasure.StrongTopology. These hypotheses do not include completeness or ultrametricity. The compact subtype s may be empty. All maps are the existing restriction and native pushforward. This field-valued assertion does not install an operator norm on integral ring-valued measures; the integral-lattice comparison remains separate.

**Proof outline:**

1. The two restrictions are bounded linear maps by their norm bounds, hence the forward product map is continuous in the strong topology.
2. The inverse is the sum of the two bounded inclusion maps. The ordinary triangle inequality bounds its norm by the sum of the two input norms, and hence by twice the maximum product norm.
3. Apply the homeomorphism criterion to the existing linear equivalence. An isometry of the product decomposition is not asserted for arbitrary normed fields; it would require a separate ultrametric argument.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-equivalence`, `PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-operator-norm-bound`, `mathlib:AbstractMeasure.StrongTopology`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:LinearMap.mkContinuous`, `mathlib:LinearEquiv.isHomeomorph_iff`.

**Acceptance:** The product estimate is valid for archimedean fields as well as p-adic fields.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak continuity of intrinsic unit restriction

`PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-weak-continuous` — `AbstractMeasure.continuous_restrictUnits_weak` (lemma).

The existing map restrictUnits p R from D(Z,R) to D(U,R) is weakly continuous.

**Hypotheses:** p is any prime, including 2; Z=Z_p with its pinned topology and U=Z_p units with its native units topology. R is a normed commutative ring. Every measure carrier has the explicitly selected native weak topology; kernel submodules carry the induced topology. Use the actual unit-domain homeomorphism, intrinsic restriction, native inclusion pushforward and existing psi operators. No identification of additive and multiplicative convolution is made.

**Proof outline:**

1. The existing unit-domain homeomorphism identifies U with the clopen unit locus V.
2. The defining restriction is clopen restriction to V followed by native pushforward along the inverse homeomorphism.
3. Both maps are weakly continuous by the exact generic lemmas; their composition is the existing restrictUnits map.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-weak-continuous`, `PadicMeasuresIwasawaAlgebras:L0/pushforward-weak-continuous`, `mathlib:AbstractMeasure.arrowCongrLeft`.

**Acceptance:** The statement uses native units and includes p=2.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak topology on the unit-measure kernel

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-weak-homeomorphism` — `AbstractMeasure.isHomeomorph_unitsMeasureEquivKerPsi_weak` (comparison).

The existing unitsMeasureEquivKerPsi p R is a homeomorphism from D(U,R) with its native weak topology to the native kernel of psiMeasure with the induced ambient weak topology.

**Hypotheses:** p is any prime, including 2; Z=Z_p with its pinned topology and U=Z_p units with its native units topology. R is a normed commutative ring. Every measure carrier has the explicitly selected native weak topology; kernel submodules carry the induced topology. Use the actual unit-domain homeomorphism, intrinsic restriction, native inclusion pushforward and existing psi operators. No identification of additive and multiplicative convolution is made.

**Proof outline:**

1. The forward ambient map is native inclusion pushforward, weakly continuous by the generic pushforward lemma. Its already proved kernel membership allows continuous subtype packaging.
2. The inverse is the continuous intrinsic unit restriction applied to the ambient value of a kernel element.
3. Apply the native linear-equivalence criterion. No topological assumption about convolution is needed.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-inverse`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-weak-continuous`, `PadicMeasuresIwasawaAlgebras:L0/pushforward-weak-continuous`, `mathlib:LinearEquiv.isHomeomorph_iff`.

**Acceptance:** The kernel is psi=0, whereas the Coleman norm-fixed logarithmic derivative takes values in psi=1; these targets remain distinct.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak topology and integral Amice coefficients

`PadicMeasuresIwasawaAlgebras:L2/integral-amice-weak-homeomorphism` — `AbstractMeasure.isHomeomorph_amiceTransformEquiv_weak` (comparison).

The pinned integral amiceTransformEquiv is a homeomorphism from D(Z_p,Z_p) with its native weak topology to Z_p[[T]] with the coefficientwise p-adic topology.

**Hypotheses:** p is any prime, including 2; coefficients are exactly Z_p. The measure topology is native WeakTopology and the series topology is native PowerSeries.WithPiTopology. The actual pinned integral Amice equivalence and previously specified inverse continuity are used.

**Proof outline:**

1. Each coefficient of the native Amice transform is evaluation at a fixed Mahler test function, so it is weakly continuous.
2. The pinned coefficientwise convergence criterion gives continuity of the forward transform by checking each coefficient at each point.
3. The existing inverse-Amice-evaluation-continuous node supplies continuity of the inverse against every fixed continuous integral test. The weak-dual evaluation criterion gives continuity of the actual inverse map.
4. Apply the native homeomorphism criterion to the already existing linear equivalence. The inverse continuity is specific to uniformly bounded integral coefficients; do not substitute the unrestricted field-valued formal-series space.

**Prerequisites:** `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.WeakTopology`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`, `mathlib:WeakDual.continuous_of_continuous_eval`, `mathlib:WeakDual.eval_continuous`, `mathlib:LinearEquiv.isHomeomorph_iff`, `PadicMeasuresIwasawaAlgebras:L2/inverse-amice-evaluation-continuous`.

**Tests:**

- `ClopenTopologyTests.amice_monomials` (computation): The inverse integral Amice measures of T^n converge weakly to zero over Z_3.

**Acceptance:** This comparison asserts neither uniform coefficient-norm convergence nor weak completeness of all field-valued measures.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Weak topology on the unit Amice kernel

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-weak-homeomorphism` — `AbstractMeasure.isHomeomorph_unitsMeasureAmiceEquiv_weak` (comparison).

The existing unitsMeasureAmiceEquiv p is a homeomorphism from D(U,Z_p) with its weak topology to the native kernel of psiSeries with its induced coefficientwise topology.

**Hypotheses:** p is any prime, including 2; Z=Z_p with its pinned topology and U=Z_p units with its native units topology. R is a normed commutative ring. Every measure carrier has the explicitly selected native weak topology; kernel submodules carry the induced topology. Use the actual unit-domain homeomorphism, intrinsic restriction, native inclusion pushforward and existing psi operators. No identification of additive and multiplicative convolution is made. For this comparison R=Z_p and the series kernel has the coefficientwise p-adic topology.

**Proof outline:**

1. Use psi-series-intertwining to restrict the integral Amice homeomorphism and its inverse to the already identified kernel submodules.
2. Subtype topologies preserve continuity of both restricted maps. Compose with the existing unit-measure kernel homeomorphism.
3. The existing unit-measure-amice-kernel-equivalence formulas identify the composite with unitsMeasureAmiceEquiv, so no new linear equivalence or carrier is built.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-weak-homeomorphism`, `PadicMeasuresIwasawaAlgebras:L2/integral-amice-weak-homeomorphism`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `mathlib:LinearEquiv.isHomeomorph_iff`.

**Tests:**

- `ClopenTopologyTests.dyadic_unit_kernel` (compatibility): At p=2, the inverse of unitsMeasureAmiceEquiv is continuous from the coefficientwise psi kernel to the weakly topologized native unit-group measures.

**Acceptance:** This is the topological intrinsic-versus-supported integral measure interface needed by Coleman.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Unit inclusion preserves the measure norm

`PadicMeasuresIwasawaAlgebras:L2/unit-inclusion-operator-norm` — `AbstractMeasure.norm_map_units_val` (lemma).

For a K-valued measure nu on U, native pushforward along Units.val has the same operator norm as nu.

**Hypotheses:** p is any prime, U=Z_p units with its native topology, and K is a nontrivially normed field. Norms are the native continuous-dual operator norms. Compactness of U follows from the existing homeomorphism to the closed unit locus in compact Z_p.

**Proof outline:**

1. Pushforward along the unit-domain homeomorphism preserves norm: apply the generic contraction bound to it and its inverse, using native map_map and map_id for the reverse inequality.
2. Native pushforward along Units.val factors through this homeomorphism and inclusion of the clopen unit locus.
3. Apply the clopen-inclusion norm equality and then the homeomorphism norm equality. The prime p never enters a normalization factor.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/clopen-inclusion-operator-norm`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism-evaluation`, `mathlib:AbstractMeasure.map_map`, `mathlib:AbstractMeasure.map_id`.

**Tests:**

- `ClopenTopologyTests.unit_atom_norm` (computation): At p=2, inclusion of the Q_2-valued Dirac mass at the unit one has operator norm one.

**Acceptance:** No scalar extension from Z_p-valued measures to K-valued measures is assumed.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Strong topology on the unit-measure kernel

`PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-strong-homeomorphism` — `AbstractMeasure.isHomeomorph_unitsMeasureEquivKerPsi_strong` (comparison).

For K a nontrivially normed field, the existing unitsMeasureEquivKerPsi p K is a homeomorphism from strongly topologized D(U,K) to the psiMeasure kernel with its induced ambient strong topology.

**Hypotheses:** p is any prime, U=Z_p units, K is a nontrivially normed field, and the topologies on both ambient measure carriers are native StrongTopology. The kernel has the induced subtype topology.

**Proof outline:**

1. The unit inclusion is norm-preserving by the preceding lemma, hence continuous in the native strong topology; package its existing kernel membership.
2. The inverse is clopen restriction followed by pushforward along the inverse unit-domain homeomorphism. Both maps are contractive in their continuous-dual norm models, so the inverse is strongly continuous.
3. Apply the existing linear-equivalence homeomorphism criterion. Keep the coefficient field requirement explicit; no integral-lattice theorem follows from this field statement alone.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-inverse`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/unit-inclusion-operator-norm`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound`, `mathlib:AbstractMeasure.StrongTopology`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:LinearMap.mkContinuous`, `mathlib:LinearEquiv.isHomeomorph_iff`.

**Acceptance:** Weak and strong homeomorphisms are proved separately, without identifying their topologies.

**Sources:** RJW-published, Definition3.5 and Definitions3.7-3.8, printed119/PDF20; Remark3.31, printed127/PDF28; Corollary3.32 and Remark3.33, printed129/PDF30. The source provides the two topologies and intrinsic/ambient restriction formulas. This is a worker decomposition of their topology comparison on existing library carriers, with the stated compact-space and coefficient hypotheses; the source does not separately state every lemma. Existing source findings E9-E11 retain the uniform-convergence, completeness and noncompact-domain qualifications.

### Source and validation scope

The continuation freshly read full published RJW PDF20–22 / printed119–121
and PDF28–30 / printed127–129 on 27 September2026. The downloaded PDF matches
the recorded SHA256. Definitions3.5,3.7–3.8, Remark3.31 and Corollary3.32 /
Remark3.33 supply the topology and restriction context. The exact comparisons
and general compact-space/normed-ring or field hypotheses are worker derivations,
with the paper's existing qualifications recorded by E9–E11. All thirteen
source findings are preserved; no new finding is asserted.

At the preceding clopen-topology checkpoint, the full suggested file compiled
with zero errors and 339 expected placeholder
warnings only. All 2,737 reached Mathlib source modules match the pin. Two
complete scratch Lean proofs establish weak continuity and field-valued
operator-norm contractivity of native pushforward, with no errors, warnings
or placeholders. The reader, packet and suggested signatures agree; all
implementation statuses remain unchecked.

Exact rational calculations pass 32,336 assertions for p=2,3,5,7, on signed
atomic measures with weights from −p,−1,0,1,1/p. They exhaust the clopens of a
three-point space and its maps to a two-point space, checking both p-adic and
archimedean operator norms. Controls exclude an isometry for arbitrary
pushforward, an isometry for every restriction, and an archimedean isometry
of the product decomposition. Monomial coefficients distinguish pointwise
coefficient convergence from the coefficient supremum norm. These finite
checks do not prove infinite-dimensional topology or compactness statements.

The L0 and L2 coverage lists identify the remaining work precisely: bounded
finitely additive clopen data, finite-extension lattices and scaling, general profinite/finite-extension
integral-field comparisons, coefficient towers and tensors, and qualified
completeness/compactness. The other layer targets remain unchanged. Native
profinite-group and completed-algebra carriers retain their upstream ownership.


## The bounded Amice norm and the rational integral lattice

The n-th Mahler test has supremum norm one. Evaluating a continuous functional
on those tests bounds every Amice coefficient by its operator norm. Conversely,
the existing bounded inverse pairs a bounded sequence with the vanishing Mahler
coefficients of a continuous test. The ultrametric sum bound gives the reverse
norm inequality. Together these identify the native field-valued continuous
dual isometrically with the native bounded sequence space.

This is a comparison of linear normed spaces. The range inside K[[T]] consists
exactly of the series with uniformly bounded coefficients. For example,
coefficients p^(−n) over Q_p are unbounded and are outside that range. The
supremum norm on bounded coefficients also differs from coefficientwise
topology: the coefficient sequence of T^n has norm one for every n, even though
it converges coefficientwise to zero.

For Q_p coefficients, integral measures on Z_p enter through the actual
coefficient-extension map already constructed. Its image is exactly the closed
unit ball of the native rational continuous dual. A series with all coefficient
norms at most one lifts through the existing Z_p subring and the native
PowerSeries.toSubring construction; the pinned integral Amice inverse recovers
its unique integral measure. No new norm instance on the integral measure
carrier is needed for this comparison.

Every rational measure can be multiplied by a sufficiently large power of p
to enter that unit ball. The denominator exponent depends on the measure. This
common-denominator assertion is proved for the actual Z_p domain and Q_p field;
finite-extension integer rings and arbitrary profinite domains retain their
separate generality obligations. The completed-group-algebra and convolution
comparisons remain distinct targets.

### Amice coefficients are bounded by the dual norm

`PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-bound` — `norm_coeff_amiceTransform_le` (lemma).

For every K-valued measure μ on Z_p and n≥0, ‖coeff_n(A_μ)‖≤‖toCLMEquiv(μ)‖.

**Hypotheses:** p is prime. K is a nontrivially normed field with a Z_p-algebra structure and bounded Z_p scalar action. Norms of measures mean the native continuous-dual operator norm through AbstractMeasure.toCLMEquiv; no topology or norm instance is imposed on integral measures.

**Proof outline:**

1. Use the existing coeff_amiceTransform formula. Its test is the scalar-valued Mahler function multiplied by the constant one in K.
2. Identify this test with the native mahlerTerm(1,n). Its exact supremum norm is one by norm_mahlerTerm. The native pointwise operator-norm bound gives the result.

**Prerequisites:** `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:PadicInt.norm_mahlerTerm`, `mathlib:ContinuousLinearMap.le_opNorm`.

**Acceptance:** No completeness or ultrametric assumption is needed for this coefficient bound. The measure norm is taken on the native field-dual model.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Bounded Amice coefficient sequence

`PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-sequence` — `boundedAmiceCoefficients` (construction).

Define boundedAmiceCoefficients:D(Z_p,K)→ₗ[K] BoundedContinuousFunction(N,K) by μ↦(n↦coeff_n(A_μ)). The sequence has its native supremum norm.

**Hypotheses:** p is prime. K is a nontrivially normed field with a Z_p-algebra structure and bounded Z_p scalar action. Norms of measures mean the native continuous-dual operator norm through AbstractMeasure.toCLMEquiv; no topology or norm instance is imposed on integral measures.

**Proof outline:**

1. Apply field-amice-coefficient-bound to package the actual coefficient function using the native bounded-function constructor on discrete N.
2. The existing Amice transform and each coefficient map are linear. Pointwise equality of native bounded functions bundles the map as K-linear.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-bound`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:BoundedContinuousFunction.ofNormedAddCommGroupDiscrete`, `mathlib:BoundedContinuousFunction.norm_le`.

**Uses:**

- field-bounded-amice-isometry and field-amice-range: Packages every measure into the exact domain of the previously planned bounded inverse.
- rational-integral-image: Detects the integral coefficient lattice by the closed unit ball.

**API:**

- `boundedAmiceCoefficients_apply` (simp): For every μ,n, boundedAmiceCoefficients(μ)(n)=coeff_n(A_μ).
- `boundedAmiceCoefficients_zero` (simp): The bounded coefficient sequence of the zero measure is zero.
- `boundedAmiceCoefficients_add` (functoriality): The bounded coefficient sequence of μ+ν is the sum of their bounded coefficient sequences.
- `boundedAmiceCoefficients_smul` (functoriality): The bounded coefficient sequence of aμ is a times the bounded coefficient sequence of μ, for a∈K.
- `boundedAmiceCoefficients_norm_le` (compatibility): The supremum norm of boundedAmiceCoefficients(μ) is at most the continuous-dual operator norm of μ.

**Unit tests:**

- `bounded_coefficients_dirac_zero` (computation): For δ₀ over Q_3, bounded coefficient zero is one and coefficient one is zero.
- `bounded_coefficients_nonintegral` (non-example): For (1/3)δ₀ over Q_3, bounded coefficient zero is 1/3; bounded measures need not be integral.
- `bounded_coefficients_zero` (degenerate): Over Q_2 the zero measure has the zero bounded coefficient sequence.

**Acceptance:** The carrier is the existing bounded sequence space. It is not all K[[T]], and its norm topology is not coefficientwise topology.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Exact norm of the bounded inverse

`PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-norm` — `norm_boundedInvTransform` (lemma).

For every native bounded sequence c:N→K, ‖toCLMEquiv(boundedInvTransform(c))‖=‖c‖.

**Hypotheses:** p is prime. K is a nontrivially normed field with a Z_p-algebra structure and bounded Z_p scalar action. Norms of measures mean the native continuous-dual operator norm through AbstractMeasure.toCLMEquiv; no topology or norm instance is imposed on integral measures. K is complete and ultrametric.

**Proof outline:**

1. The existing boundedInvTransform_bound bounds every test value by ‖c‖‖f‖. Apply the native operator-norm criterion to obtain the upper bound.
2. The existing bounded-inverse-mahler identity recovers c_n on a test of norm one. Apply field-amice-coefficient-bound and the native bounded-function norm criterion to obtain the reverse inequality.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse`, `PadicMeasuresIwasawaAlgebras:L2/bounded-mahler-pairing-bound`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-mahler`, `PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-bound`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:BoundedContinuousFunction.norm_le`.

**Acceptance:** The equality is with the actual continuous functional constructed earlier. Boundedness of c is part of its input type.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Recover a measure from its bounded coefficients

`PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-coefficient-retraction` — `boundedInvTransform_boundedAmiceCoefficients` (lemma).

For every μ∈D(Z_p,K), boundedInvTransform(boundedAmiceCoefficients(μ))=μ.

**Hypotheses:** p is prime. K is a nontrivially normed field with a Z_p-algebra structure and bounded Z_p scalar action. Norms of measures mean the native continuous-dual operator norm through AbstractMeasure.toCLMEquiv; no topology or norm instance is imposed on integral measures. K is complete and ultrametric.

**Proof outline:**

1. The bounded-inverse-amice formula gives the power series whose coefficients are boundedAmiceCoefficients(μ).
2. The sequence evaluation formula identifies this series with A_μ coefficientwise. Apply the pinned injectivity of the Amice transform under the complete ultrametric hypotheses.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-sequence`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `mathlib:AbstractMeasure.injective_amiceTransform`.

**Acceptance:** This is the missing surjectivity step onto bounded coefficient sequences; it does not give all formal series.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Bounded Amice isometry

`PadicMeasuresIwasawaAlgebras:L2/field-bounded-amice-isometry` — `boundedAmiceEquiv` (comparison).

There is a canonical K-linear isometric equivalence boundedAmiceEquiv:(C(Z_p,K)→L[K]K)≃ₗᵢ[K]BoundedContinuousFunction(N,K). Forward, transport the native dual through toCLMEquiv inverse and take its Amice coefficients; inverse, take toCLMEquiv of boundedInvTransform.

**Hypotheses:** p is prime. K is a nontrivially normed field with a Z_p-algebra structure and bounded Z_p scalar action. Norms of measures mean the native continuous-dual operator norm through AbstractMeasure.toCLMEquiv; no topology or norm instance is imposed on integral measures. K is complete and ultrametric.

**Proof outline:**

1. Use the native toCLMEquiv to identify the field-valued dual model with the existing measure carrier. The bounded coefficient and bounded inverse maps are linear.
2. One inverse identity is bounded-inverse-coefficient-retraction. The other is the coefficient formula of bounded-inverse-amice and extensionality of bounded sequences.
3. The forward bound is field-amice-coefficient-bound and the bounded-function norm characterization. The inverse bound is bounded-inverse-norm. Apply the native LinearIsometryEquiv.ofBounds. This also supplies the strong/norm-topology homeomorphism.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-sequence`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-coefficient-retraction`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-norm`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:LinearIsometryEquiv.ofBounds`.

**API:**

- `boundedAmiceEquiv_apply` (comparison): boundedAmiceEquiv(toCLMEquiv(μ))=boundedAmiceCoefficients(μ).
- `boundedAmiceEquiv_symm_apply` (comparison): The inverse of boundedAmiceEquiv sends c to toCLMEquiv(boundedInvTransform(c)).
- `boundedAmiceCoefficients_norm` (compatibility): For every μ, ‖boundedAmiceCoefficients(μ)‖=‖toCLMEquiv(μ)‖.

**Unit tests:**

- `bounded_isometry_dirac` (computation): The bounded Amice image of δ₁ over Q_2 has norm one.
- `bounded_isometry_nonintegral` (non-example): The bounded Amice image of (1/3)δ₀ over Q_3 has norm three.
- `bounded_isometry_constant_inverse` (compatibility): The inverse of the constant bounded sequence 1/3 over Q_3 evaluates the constant test one to 1/3.

**Acceptance:** The topology on the field dual is exactly native strong topology. The bounded sequence space has the supremum norm. No claim is made that this topology is coefficientwise topology or that the equivalence preserves an unconstructed convolution product.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### The bounded-series range of Amice

`PadicMeasuresIwasawaAlgebras:L2/field-amice-range` — `mem_range_amiceTransform_iff` (theorem).

For F∈K[[T]], there exists a measure μ with A_μ=F if and only if there is C≥0 such that ‖coeff_n(F)‖≤C for every n.

**Hypotheses:** p is prime. K is a nontrivially normed field with a Z_p-algebra structure and bounded Z_p scalar action. Norms of measures mean the native continuous-dual operator norm through AbstractMeasure.toCLMEquiv; no topology or norm instance is imposed on integral measures. K is complete and ultrametric.

**Proof outline:**

1. Necessity is field-amice-coefficient-bound with C equal to the measure operator norm.
2. For sufficiency package the coefficient function in the native bounded sequence space using the displayed C. Apply boundedInvTransform and bounded-inverse-amice. Coefficient extensionality identifies its transform with F.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-bound`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `mathlib:BoundedContinuousFunction.ofNormedAddCommGroupDiscrete`.

**Acceptance:** For K=Q_p the formal series with coefficients p^(−n) is excluded: their norms p^n are unbounded. This is a range theorem, not an identification with all K[[T]].

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Integral coefficient extension is injective

`PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-injective` — `extendIntegralCoefficients_injective` (lemma).

The existing coefficient extension D(Z_p,Z_p)→D(Z_p,Q_p) is injective.

**Hypotheses:** p is prime; the coefficient field is the existing Q_p, with its canonical Z_p-algebra structure and bounded scalar action. The domain is Z_p. Integral measures are the existing AbstractMeasure(Z_p,Z_p,Z_p), and extension is the previously planned actual extendIntegralCoefficients map.

**Proof outline:**

1. Equal extended measures have equal Amice series. The existing coefficient-extension-amice formula identifies those series with coefficientwise images under Z_p→Q_p.
2. This map is the native subtype inclusion into the field, hence injective. Compare each coefficient and use the pinned injectivity of the integral Amice transform.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice`, `mathlib:PadicInt.algebraMap_apply`, `mathlib:AbstractMeasure.injective_amiceTransform`.

**Acceptance:** This compares the actual integral and field measure carriers via the already constructed extension.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Norm of an extended integral measure

`PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-norm` — `norm_extendIntegralCoefficients` (lemma).

For μ∈D(Z_p,Z_p), ‖toCLMEquiv(extendIntegralCoefficients(μ))‖=‖integralAmiceCoefficients(μ)‖ in the Q_p-valued bounded sequence space.

**Hypotheses:** p is prime; the coefficient field is the existing Q_p, with its canonical Z_p-algebra structure and bounded scalar action. The domain is Z_p. Integral measures are the existing AbstractMeasure(Z_p,Z_p,Z_p), and extension is the previously planned actual extendIntegralCoefficients map.

**Proof outline:**

1. By definition the actual integral extension is boundedInvTransform applied to integralAmiceCoefficients.
2. Apply bounded-inverse-norm over Q_p. This also bounds the extended measure by one using the existing integral coefficient bound and ‖1‖=1.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-norm`.

**Acceptance:** The norm on the right is a native bounded-function norm. No native norm on D(Z_p,Z_p) is presumed.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Integral measures are the rational dual unit ball

`PadicMeasuresIwasawaAlgebras:L2/rational-integral-image` — `integral_extension_iff_norm_le_one` (theorem).

For ν∈D(Z_p,Q_p), there is a unique μ∈D(Z_p,Z_p) with extendIntegralCoefficients(μ)=ν if and only if ‖toCLMEquiv(ν)‖≤1.

**Hypotheses:** p is prime; the coefficient field is the existing Q_p, with its canonical Z_p-algebra structure and bounded scalar action. The domain is Z_p. Integral measures are the existing AbstractMeasure(Z_p,Z_p,Z_p), and extension is the previously planned actual extendIntegralCoefficients map.

**Proof outline:**

1. An extended integral measure has norm at most one by rational-integral-extension-norm and the existing uniform integral coefficient bound.
2. Conversely, field-amice-coefficient-bound puts every coefficient of A_ν in the existing subring PadicInt.subring p. Use the native PowerSeries.toSubring construction to obtain G∈Z_p[[T]], with the coefficient inclusion formula supplied by coeff_toSubring.
3. Apply the pinned integral inverse Amice transform to G. The existing coefficient-extension-amice formula and the pinned field Amice injectivity show that its extension is ν. Uniqueness is rational-integral-extension-injective.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-norm`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence`, `PadicMeasuresIwasawaAlgebras:L2/field-amice-coefficient-bound`, `PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-injective`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice`, `mathlib:PadicInt.subring`, `mathlib:PowerSeries.toSubring`, `mathlib:PowerSeries.coeff_toSubring`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.injective_amiceTransform`.

**Unit tests:**

- `unit_ball_excludes_nonintegral_dirac` (non-example): There is no integral measure whose Q_3 coefficient extension is (1/3)δ₀.

**Acceptance:** The coefficient ring is Q_p and the domain is Z_p. Arbitrary profinite domains and finite-extension integer rings retain their separate L0 gap. In particular (1/p)δ₀ is outside this image.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### The rational integral lattice has closed image

`PadicMeasuresIwasawaAlgebras:L2/rational-integral-image-closed` — `isClosed_range_integral_extension` (lemma).

The range of μ↦toCLMEquiv(extendIntegralCoefficients(μ)) is closed in the normed Q_p-valued continuous dual C(Z_p,Q_p)→L[Q_p]Q_p.

**Hypotheses:** p is prime; the coefficient field is the existing Q_p, with its canonical Z_p-algebra structure and bounded scalar action. The domain is Z_p. Integral measures are the existing AbstractMeasure(Z_p,Z_p,Z_p), and extension is the previously planned actual extendIntegralCoefficients map.

**Proof outline:**

1. Use rational-integral-image to identify this range with the set of native dual maps of norm at most one.
2. The norm is continuous, so this sublevel set is closed by the native isClosed_le criterion. This does not prove norm compactness or assert agreement with the integral weak topology.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/rational-integral-image`, `mathlib:isClosed_le`.

**Acceptance:** The topology is the strong operator-norm topology on the actual field dual. Integral coefficientwise topology is not silently substituted.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Rational measures admit an integral power scaling

`PadicMeasuresIwasawaAlgebras:L2/rational-measure-integral-scaling` — `exists_integral_power_scaling` (theorem).

For every ν∈D(Z_p,Q_p) there are n≥0 and μ∈D(Z_p,Z_p) such that ν=p^(−n)·extendIntegralCoefficients(μ).

**Hypotheses:** p is prime; the coefficient field is the existing Q_p, with its canonical Z_p-algebra structure and bounded scalar action. The domain is Z_p. Integral measures are the existing AbstractMeasure(Z_p,Z_p,Z_p), and extension is the previously planned actual extendIntegralCoefficients map.

**Proof outline:**

1. The native Q_p norm satisfies ‖p‖<1. Thus ‖p^n‖‖toCLMEquiv(ν)‖ tends to zero; choose n so this product is at most one. This also handles ν=0.
2. The native normed-space scalar norm identity puts p^nν in the unit ball. Apply rational-integral-image to obtain its unique integral antecedent μ.
3. Since p is nonzero in Q_p, multiply the equality by the inverse of p^n. This is existence of a common denominator for this measure, not a topology or localization equivalence.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/rational-integral-image`, `mathlib:Padic.norm_p_lt_one`, `mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `mathlib:norm_smul`.

**Unit tests:**

- `dyadic_integral_scaling` (computation): Over Q_2, (1/2)δ₁ is 2^(−1) times the coefficient extension of the integral δ₁.

**Acceptance:** The exponent may depend on ν. There is no assertion that an arbitrary unbounded Q_p formal series has a common integral denominator. The p=2 case is included.

**Sources:** RJW-published, Definitions3.5,3.8,3.23; Theorem3.21 and proof of Theorem3.25; Remark3.28(1),(3), printed119,123–126/PDF20,24–27 Worker derivation from the stated orthonormal Mahler basis and coefficient pairing. The source treats finite p-adic extensions; the displayed field-general hypotheses suffice for the bounded linear isometry. The rational lattice specialization is Q_p only. No convolution-algebra or completed-group-ring equivalence is inferred.

### Validation and exact continuation

The full suggested file compiles with zero errors and 367 expected placeholder
warnings only, reaching 2,737 byte-verified Mathlib source modules. No Tau Ceti
module is imported. All 157 predecessor node objects, 157 baseline references,
13 source findings, 13 planets and previous suggested-file bytes are preserved.
The packet has 168 nodes: 2 definitions,26 constructions,103 lemmas,23 theorems
and14 comparisons. Definitions/constructions account for146 API entries and
102 tests; total API entries are149, packet tests117 and typed examples128.

Eight complete scratch lemmas, a native bounded coefficient construction and
a proved canonical scalar-action instance compile with no errors, warnings or
placeholders. They prove the basis norm, coefficient bound and boundedness,
scalar Mahler-term formula, actual dual pairing bound, exact norm and unique
integral lifting of coefficients. They use only the pinned library; in
particular the full coefficient/dual norm equality is proved without assuming
any proposed inverse or norm theorem. The scratch proof reaches2,020 verified
Mathlib modules. All roadmap implementation statuses remain unchecked.

Exact finite arithmetic passes55,894 assertions across3,360 binomial-transform
systems, dimensions1–5 and primes2,3,5,7. The inverse triangular transform,
finite-difference pairing, dual/coefficient norm, integral image, common
denominator and Mahler norm attainment are checked with exact rational p-adic
norms. Controls reject norm detection by total mass, inclusion of nonintegral
Dirac measures in the unit ball, and an insufficient denominator. Monomial
and unbounded-prefix controls distinguish the two coefficient topologies and
the bounded range. These finite checks are not infinite-dimensional proofs.

The public published RJW PDF was freshly fetched and hash-verified. Full
PDF20,24–27 / printed119,123–126 was read. The new field-general and rational
lattice statements are deductions under explicit hypotheses from the Mahler
basis and coefficient pairing. All thirteen prior source findings remain;
no new source finding or whole-source reading is claimed.

Resume L0 with general profinite and finite-extension integral lattices,
bounded finitely additive clopen data, coefficient tensors and qualified
completeness/compactness. For L2, extend the actual coefficient-tower and
finite-extension comparisons, convolution and multivariable theory, residue
classes and convergent unit-dilation substitutions. L1 retains the upstream
completed-algebra owner and joint adic/finite-quotient topology gate. The
remaining character-space, pseudomeasure, Weierstrass, determinant, exactness
and order-duality targets are unchanged. Eight gaps remain; no requests or
closed stages are added.


## Integral measures on the native p-adic unit group

Let Z=Z_p and U=Z units, carrying their native topologies. Write j for inclusion
of unit-domain measures into ambient measures by pushforward along Units.val,
r for intrinsic restriction to U, and E=jr for the ambient unit projector.
The existing maps satisfy rj=id. Coefficient extension on the ambient domain
is already provided by the bounded Amice inverse. For a complete ultrametric
normed Z-algebra R with bounded scalar action, the new unit-domain extension
is the concrete composite r_R I_R j_Z. Its data are existing measure maps.

The first compatibility is I_R E_Z=E_R I_R. It follows from the existing
coefficient-extension weighting theorem applied to the integral indicator of
units. This makes the inclusion square commute. Evaluating the composite on
an integral continuous unit test gives the coefficient image of the original
integral evaluation: zero extension commutes pointwise with the coefficient
map. The ambient uniqueness theorem then determines the unit-domain extension
from these integral test values, using inclusion and its restriction retraction.

These identities give the restriction square as well. With Q_p coefficients,
inclusion preserves the native operator norm. A unit-domain rational measure
has norm at most one precisely when its ambient inclusion does, hence the
existing ambient integral-image theorem gives an integral preimage. Restrict
that preimage back to U and apply the restriction square. The ambient
injectivity theorem and rj=id give uniqueness.

Consequently the actual integral unit extension has closed image equal to the
rational dual unit ball. Its norm is exactly the bounded integral Amice
coefficient norm of the ambient inclusion. Every rational unit measure admits
a common p-power denominator by restricting the ambient scaling formula.
Restriction contracts this induced rational norm; inclusion preserves it.

No norm is installed on the native integral measure carrier. Closedness refers
to the rational normed dual. The preceding weak compactness and Dirac
separation results remain intact: they distinguish the weak subspace topology
from operator-norm topology. The two convolution products also remain distinct,
because U is a multiplicative group and the ambient Z is an additive group.

### Coefficient extension preserves unit support

`PadicMeasuresIwasawaAlgebras:L2/integral-extension-unit-projector` — `AbstractMeasure.extendIntegralCoefficients_unitRestriction` (lemma).

For every integral measure μ on Z, I_R(E_Z μ)=E_R(I_R μ).

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced.

**Proof outline:**

1. Let e be the integral characteristic function of the unit locus, namely one minus the characteristic function of pZ. The supplied evaluation identity identifies E_Z with weighting by e.
2. Apply the existing coefficient-extension-weight theorem. Its R-valued multiplier is the coefficient image of e, which equals the R-valued unit indicator pointwise because the algebra map preserves zero and one.
3. The same evaluation identity over R identifies the result with E_R(I_R μ). This uses the actual support projector, not a newly defined psi operator.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-weight`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation`, `mathlib:LocallyConstant.charFn`, `mathlib:LocallyConstant.coe_charFn`.

**Acceptance:** The characteristic function cuts out units, not merely nonzero elements. For example the point p is removed.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Integral coefficient extension on the unit domain

`PadicMeasuresIwasawaAlgebras:L2/integral-unit-coefficient-extension` — `AbstractMeasure.extendIntegralUnitCoefficients` (construction).

For μ∈D(U,Z), define I_U,R(μ)=r_R(I_R(j_Z μ))∈D(U,R), on the native unit-domain measure carrier.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced.

**Proof outline:**

1. Include μ into the ambient integral measure space using native pushforward along the continuous Units.val map. Apply the already constructed bounded coefficient extension I_R, then the existing intrinsic unit restriction.
2. Zero, additivity and scalar compatibility follow from the existing linear maps and the corresponding API of I_R. The Z-scalar a acts after extension through algebraMap(a).
3. For R=Z, the ambient self-extension identity and r_Z j_Z=id give I_U,Z=id. For a Dirac mass at a unit, native pushforward, coefficient-extension-dirac and intrinsic restriction give the same Dirac mass with coefficients R.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-dirac`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.map_dirac`.

**Uses:**

- ColemanPowerSeries:L2 and its PMIA L0/L2 requests: Supplies the actual integral unit-domain coefficient extension and its comparison with ambient rational measures, without constructing the Coleman map.
- DirichletPadicLFunctions:L1 and L4: Gives the canonical coefficient extension for the existing arithmetic measures on the native unit domain.
- RJW Remark3.31 and Remark3.33: Makes the integral/rational meaning of restricting to units compatible with ambient inclusion.

**API:**

- `AbstractMeasure.extendIntegralUnitCoefficients_eq` (characterisation): I_U,R(μ)=r_R(I_R(j_Z μ)).
- `AbstractMeasure.extendIntegralUnitCoefficients_zero` (simp): I_U,R(0)=0.
- `AbstractMeasure.extendIntegralUnitCoefficients_add` (structure): I_U,R(μ+ν)=I_U,R(μ)+I_U,R(ν).
- `AbstractMeasure.extendIntegralUnitCoefficients_smul` (compatibility): I_U,R(aμ)=algebraMap(a)I_U,R(μ) for a∈Z.
- `AbstractMeasure.extendIntegralUnitCoefficients_self` (compatibility): I_U,Z is the identity on D(U,Z).
- `AbstractMeasure.extendIntegralUnitCoefficients_dirac` (simp): I_U,R(δ_u)=δ_u with coefficients R for every u∈U.

**Unit tests:**

- `UnitIntegralTests.zero` (degenerate): The rational extension of the zero integral unit measure is zero.
- `UnitIntegralTests.dirac_one` (computation): The integral Dirac mass at the unit one extends to the rational Dirac mass at one.
- `UnitIntegralTests.native_self` (compatibility): Extending an integral unit measure to Z coefficients gives that same native measure.

**Acceptance:** The domain is actual unit-group measures, and the output uses the same native group. No convolution or arbitrary profinite scalar-extension theorem is claimed.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Coefficient extension commutes with unit inclusion

`PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-inclusion` — `AbstractMeasure.map_val_extendIntegralUnitCoefficients` (lemma).

For μ∈D(U,Z), j_R(I_U,R μ)=I_R(j_Z μ).

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced.

**Proof outline:**

1. Unfold the unit-domain extension and apply j_R r_R=E_R to write the left side as E_R(I_R(j_Z μ)).
2. Move E through I by integral-extension-unit-projector. The input j_Z μ is fixed by E_Z because E_Z j_Z=j_Z r_Z j_Z=j_Z.
3. This gives the displayed equality in the existing ambient R-valued measure space. It is the exact inclusion square required by the rational lattice comparison.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-unit-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/integral-extension-unit-projector`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`.

**Acceptance:** The inclusion commutes with scalar extension as a linear measure map. Its multiplicative-unit and additive-ambient convolution structures remain different.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Integral test functions on units

`PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-test-function` — `AbstractMeasure.extendIntegralUnitCoefficients_test` (lemma).

For μ∈D(U,Z) and f∈C(U,Z), I_U,R(μ)(f_R)=algebraMap(μ(f)), where f_R is the pointwise coefficient image, expressed as f times the constant R-valued one.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced.

**Proof outline:**

1. Use the intrinsic restriction evaluation formula: I_U,R(μ)(f_R) is I_R(j_Z μ) evaluated on the R-valued zero extension of f_R from the clopen unit locus.
2. Coefficient change commutes pointwise with this zero extension. On the unit locus both functions equal the coefficient image of f, and outside both are zero. Apply continuous-function extensionality.
3. The ambient integral-test formula now gives algebraMap of j_Z μ applied to the integral zero extension. Native pushforward restricts that test back to f on U, proving the required equality.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-unit-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-test-function`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-inside`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension-outside`, `mathlib:AbstractMeasure.map_apply`.

**Acceptance:** The actual integral test is used; no field-linearity or operator-norm instance on D(U,Z) is presumed.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Uniqueness from integral unit tests

`PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-unique` — `AbstractMeasure.extendIntegralUnitCoefficients_unique` (lemma).

Let μ∈D(U,Z) and ν∈D(U,R). If ν(f_R)=algebraMap(μ(f)) for every f∈C(U,Z), then ν=I_U,R μ.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced.

**Proof outline:**

1. Push ν forward along Units.val. For each integral test on Z, its restriction to U is an integral continuous test. The hypothesis and native map_apply show that j_R ν satisfies the ambient integral-test characterization for j_Z μ.
2. The existing ambient uniqueness theorem gives j_R ν=I_R(j_Z μ). Rewrite the latter as j_R(I_U,R μ) by integral-unit-extension-inclusion.
3. Apply r_R and use r_R j_R=id on both sides. This gives uniqueness on the actual unit-domain carrier, without adding a new density theorem.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-unique`, `PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-inclusion`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`, `mathlib:AbstractMeasure.map_apply`.

**Acceptance:** Equality on integral tests determines an R-valued measure under the same completeness and bounded-scalar hypotheses as the existing ambient uniqueness theorem.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Coefficient extension commutes with restriction

`PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-restriction` — `AbstractMeasure.extendIntegralUnitCoefficients_restrict` (lemma).

For every μ∈D(Z,Z), I_U,R(r_Z μ)=r_R(I_R μ).

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced.

**Proof outline:**

1. The left side is r_R I_R j_Z r_Z μ=r_R I_R E_Z μ by the supplied inclusion/restriction relation.
2. Commute the projector through coefficient extension to obtain r_R E_R I_R μ. Since E_R=j_R r_R and r_R j_R=id, r_R E_R=r_R.
3. Conclude the exact square between integral restriction, rational or eligible-R coefficient extension and R-valued restriction.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-unit-coefficient-extension`, `PadicMeasuresIwasawaAlgebras:L2/integral-extension-unit-projector`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-extension-projector`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`.

**Unit tests:**

- `UnitIntegralTests.mixed_restriction` (computation): Extending the intrinsic restriction of δ_1+δ_p from Z to Q_p gives δ_1 on U.
- `UnitIntegralTests.nonunit_restriction` (non-example): Extending the restriction of δ_p gives zero on U, even though p is nonzero.

**Acceptance:** For δ_1+δ_p, only the unit atom remains. The claim includes p=2 and keeps the entire unit domain.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Injectivity on integral unit measures

`PadicMeasuresIwasawaAlgebras:L2/rational-unit-extension-injective` — `AbstractMeasure.extendIntegralUnitCoefficients_injective` (lemma).

The actual rational coefficient extension I_U,Q_p:D(U,Z)→D(U,Q_p) is injective.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced. For this rational comparison R=Q_p, with the canonical bounded Z_p-scalar action. Every displayed measure norm is the operator norm after the native toCLMEquiv. The integral carrier is not assigned the native field norm or an implicit topology.

**Proof outline:**

1. Apply j_Q_p to equality of two unit extensions and use the inclusion square.
2. Injectivity of the existing ambient I_Q_p gives equality of j_Z μ and j_Z ν. Apply r_Z and its section relation to recover μ=ν.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-inclusion`, `PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-injective`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`.

**Acceptance:** This is injectivity of the actual coefficient-extension function. It does not follow just from injectivity of the scalar ring map without the measure comparison.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### The rational norm of an integral unit measure

`PadicMeasuresIwasawaAlgebras:L2/rational-unit-extension-norm` — `AbstractMeasure.norm_extendIntegralUnitCoefficients` (lemma).

For μ∈D(U,Z), the operator norm of I_U,Q_p μ equals the supremum norm of the Q_p-valued integral Amice coefficient sequence of j_Z μ.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced. For this rational comparison R=Q_p, with the canonical bounded Z_p-scalar action. Every displayed measure norm is the operator norm after the native toCLMEquiv. The integral carrier is not assigned the native field norm or an implicit topology.

**Proof outline:**

1. The existing norm equality for native unit inclusion identifies the norm of I_U,Q_p μ with that of j_Q_p(I_U,Q_p μ).
2. Use the inclusion square to rewrite that ambient measure as I_Q_p(j_Z μ). The existing ambient integral-extension norm theorem gives exactly the specified bounded coefficient norm.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-inclusion`, `PadicMeasuresIwasawaAlgebras:L2/unit-inclusion-operator-norm`, `PadicMeasuresIwasawaAlgebras:L2/rational-integral-extension-norm`.

**Unit tests:**

- `UnitIntegralTests.supported_norm` (compatibility): The rational operator norm of the unit extension of μ equals the rational operator norm of the ambient extension of its native inclusion.

**Acceptance:** The Amice coefficients are those of the ambient included measure. No transform on U with a different basis and no norm on the integral carrier is invented.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Integral unit measures form the rational unit ball

`PadicMeasuresIwasawaAlgebras:L2/rational-unit-integral-image` — `AbstractMeasure.unit_integral_extension_iff_norm_le_one` (comparison).

For ν∈D(U,Q_p), there is a unique μ∈D(U,Z) with I_U,Q_p μ=ν if and only if the native operator norm of ν is at most one.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced. For this rational comparison R=Q_p, with the canonical bounded Z_p-scalar action. Every displayed measure norm is the operator norm after the native toCLMEquiv. The integral carrier is not assigned the native field norm or an implicit topology.

**Proof outline:**

1. If ν=I_U,Q_p μ, its norm is the bounded integral Amice coefficient norm, at most one by integral-coefficient-sequence and the norm of one in Q_p.
2. Conversely, include ν into D(Z,Q_p). Its norm is unchanged, so the ambient integral-image theorem supplies μ_0∈D(Z,Z) with I_Q_p μ_0=j_Q_p ν.
3. Set μ=r_Z μ_0. The restriction square gives I_U,Q_p μ=r_Q_p I_Q_p μ_0=r_Q_p j_Q_p ν=ν.
4. Uniqueness is the preceding rational-unit-extension-injective theorem. No compactness or false weak-to-norm continuity inference is used.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/rational-unit-extension-injective`, `PadicMeasuresIwasawaAlgebras:L2/rational-unit-extension-norm`, `PadicMeasuresIwasawaAlgebras:L2/rational-integral-image`, `PadicMeasuresIwasawaAlgebras:L2/unit-inclusion-operator-norm`, `PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-restriction`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-sequence`.

**Unit tests:**

- `UnitIntegralTests.nonintegral_atom` (non-example): The rational unit-domain measure p^(-1)δ_1 is not the extension of any integral unit measure.

**Acceptance:** The unit ball is closed and has radius one centered at zero in the native rational dual. A p^(-1)-scaled Dirac mass at the unit one lies outside it.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Closedness of the integral unit lattice

`PadicMeasuresIwasawaAlgebras:L2/rational-unit-integral-image-closed` — `AbstractMeasure.isClosed_range_unit_integral_extension` (lemma).

The range of μ↦toCLMEquiv(I_U,Q_p μ) is closed in the native normed dual C(U,Q_p)→L[Q_p]Q_p.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced. For this rational comparison R=Q_p, with the canonical bounded Z_p-scalar action. Every displayed measure norm is the operator norm after the native toCLMEquiv. The integral carrier is not assigned the native field norm or an implicit topology.

**Proof outline:**

1. By the integral-image characterization, the range is exactly the set of native dual functionals with norm at most one. The native linear equivalence toCLMEquiv is onto.
2. This set is closed by continuity of the norm and isClosed_le. The claim concerns the codomain norm topology and does not identify it with the integral weak topology.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/rational-unit-integral-image`, `mathlib:AbstractMeasure.toCLMEquiv`, `mathlib:isClosed_le`.

**Acceptance:** Closedness of the image does not assert that the extension is continuous from the weak integral topology into the rational norm topology.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### A common denominator on the unit domain

`PadicMeasuresIwasawaAlgebras:L2/rational-unit-integral-scaling` — `AbstractMeasure.exists_unit_integral_power_scaling` (theorem).

Every ν∈D(U,Q_p) has the form p^(−n) I_U,Q_p μ for some n≥0 and μ∈D(U,Z). The same n works for all continuous tests.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced. For this rational comparison R=Q_p, with the canonical bounded Z_p-scalar action. Every displayed measure norm is the operator norm after the native toCLMEquiv. The integral carrier is not assigned the native field norm or an implicit topology.

**Proof outline:**

1. Apply the existing ambient common-denominator theorem to j_Q_p ν. It gives n and μ_0 with j_Q_p ν=p^(−n) I_Q_p μ_0.
2. Apply the Q_p-linear restriction r_Q_p. Its section identity recovers ν on the left and its scalar linearity retains the one common denominator.
3. Use the coefficient-extension restriction square and set μ=r_Z μ_0. The integer n depends on the measure, not on an individual test function.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/rational-measure-integral-scaling`, `PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-restriction`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction-section`.

**Acceptance:** The zero measure admits n=0. The construction uses the same prime power as the ambient norm estimate, including at p=2.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Integral restriction is a rational norm contraction

`PadicMeasuresIwasawaAlgebras:L2/rational-integral-unit-restriction-bound` — `AbstractMeasure.norm_extendIntegral_restrictUnits_le` (lemma).

For μ∈D(Z,Z), the rational operator norm of I_U,Q_p(r_Z μ) is at most that of I_Q_p μ.

**Hypotheses:** p is any prime, including2; Z=Z_p and U=Z units with its native topology. Measures are the existing AbstractMeasure continuous duals. Let j_R:D(U,R)→D(Z,R) be native pushforward along Units.val, r_R the existing intrinsic unit restriction and E_R the existing ambient unitRestriction. Thus r_R j_R=id and j_R r_R=E_R. R is a complete ultrametric normed commutative Z-algebra with bounded Z-scalar action. I_R denotes the existing coefficient extension on measures with domain Z. No new measure carrier or norm instance on integral measures is introduced. For this rational comparison R=Q_p, with the canonical bounded Z_p-scalar action. Every displayed measure norm is the operator norm after the native toCLMEquiv. The integral carrier is not assigned the native field norm or an implicit topology.

**Proof outline:**

1. Use the restriction square to replace the left measure by r_Q_p(I_Q_p μ).
2. Factor intrinsic restriction into restriction to the clopen unit locus followed by transport along the existing homeomorphism to U. Generic clopen restriction is a contraction in the native rational dual norm.
3. Native pushforward along the homeomorphism is also a contraction by the existing generic pushforward estimate. Combining the two estimates proves the desired inequality.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/integral-unit-extension-restriction`, `PadicMeasuresIwasawaAlgebras:L2/intrinsic-unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/unit-domain-homeomorphism`, `PadicMeasuresIwasawaAlgebras:L0/clopen-restriction-operator-norm-bound`, `PadicMeasuresIwasawaAlgebras:L0/pushforward-operator-norm-bound`.

**Acceptance:** The bound has constant one. Together with rational-unit-extension-norm it supplies the requested inclusion/restriction compatibility for the induced rational operator norm.

**Sources:** RJW-published, Definition3.5 and Definitions3.7–3.8, printed119 / PDF20; §3.5.2–5, Remark3.31, Corollary3.32 and Remark3.33, printed126–129 / PDF27–30. Worker derivation of the integral coefficient comparison on the native unit domain from the source restriction/inclusion formulas and the preceding bounded Amice/rational lattice results. The paper does not separately state these compatibility lemmas. The coefficient and topology hypotheses are explicit; E9–E11 retain their earlier qualifications.

### Current validation and exact continuation

All179 predecessor node objects,185 baseline records,14 source findings,
13 planets and predecessor suggested-file bytes remain intact. The12 new
nodes comprise one construction,nine lemmas,one comparison and one theorem;
the construction has six API entries and three typed tests, with four further
typed tests on the comparison lemmas. Totals are191 nodes,155 API entries,
131 packet tests and142 typed examples. Definitions/constructions account for
152 API entries and105 tests. Eight gaps remain, with no requests and no closed
stages. All implementation statuses remain unchecked.

The complete suggested file compiles with zero errors and411 expected
placeholder warnings only, reaching2,775 byte-verified pinned Mathlib sources
and no Tau Ceti or planned supplier module. Seven complete scratch lemmas and
one continuous test-function constructor compile without errors, warnings or
placeholders against1,903 pinned Mathlib sources. They prove preservation of
the integral test norm under rational inclusion, the unit bound for integral
tests, integral values of rational unit-ball functionals and their unique
native Z_p lifts, exact Dirac norm and the exclusion of p^(-1)δ_1 from the
unit-domain rational ball. These are native functional-analytic checks, not
an implementation claim for the proposed extension.

Finite exact arithmetic passes16,879 assertions across640 atomic-measure
systems for p=2,3,5,7 and integer lifts of residues modulo p and p². Unit
projection, restriction/inclusion squares, integral tests, coefficient norm,
common denominators and uniqueness through clopen indicator tests are checked
with exact rational p-adic norms. Controls detect nonintegral unit atoms,
insufficient denominators, nonunit atoms and cancellation of total mass.
They do not replace the infinite-dimensional comparison proofs.

Fresh source reading covers published RJW PDF20,27–30 / printed119,126–129
and arXivv2 PDF20. Both fresh downloads match the recorded hashes. Published127
was checked as an image: its displayed (1+T)z has z as a multiplier, so the
ambiguous extracted text introduces no additional finding. All14 preceding
findings, including the Example3.19 finding from the weak/norm checkpoint,
are preserved without a new review verdict.

The unit-domain integral/rational lattice and its inclusion/restriction norm
compatibilities can now be consumed by the Coleman roadmap. Resume the generic
profinite and finite-extension coefficient/lattice comparison in L0, including
qualified completeness, coefficient towers and completed tensors. In L2,
the unit-dilation/formal-binomial-substitution comparison, convergent z^x
weighting and arbitrary residue-class operators remain exact obligations.
Convolution and the completed-algebra comparison still require the joint
adic/finite-quotient topology gate; no pure T-adic replacement is justified.
