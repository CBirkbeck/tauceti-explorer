# Profinite and pro-p groups, Part II: p-adic measures and Iwasawa algebras

First prerequisite: [Profinite and pro-p groups](../../../content/tau-ceti/ProfiniteProPGroups/README.md),
especially its Layer 9 prerequisites. This roadmap extends that work under accepted RS-16. It imports the
existing profinite groups, inverse limits, ℤ_p completed group algebra, Dirac map and procyclic/dyadic
coordinates. It starts with bounded measures and the coefficient, analytic and module-theoretic comparisons
beyond those constructions. The shared finite-presentation Fitting carrier remains with StableReduction,
Layer 1; general perfect-complex comparisons remain with SchemeKTheoryOperations:S.1 and the
complete-Noetherian-local specialization input with DeformationAndDerivedPatchingAlgebra:P7.

**Partial checkpoint, 26 September 2026.** All eight campaign layers remain in scope. The source
decomposition below covers the integral operator/moment chain of L2 and one coherent algebraic part of L3. It does not construct the completed group
algebra, its topology, or the continuous-character integral. Those appear as explicit data in the conditional
algebraic statements. L2 and L3 are partial; the other six layers have not received source decomposition here. The campaign
specification and accepted RS-16 decisions remain binding for the unprocessed targets.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed AUDIT-26 entries for all eight layers were read.
`IsFractionRing` already denotes the localization at all non-zero-divisors, including for a ring with zero
divisors. `Submodule.div` already constructs the quotient of submodules by multiplication. Neither operation
is new work. This packet gives their particular pseudomeasure specialization and its evaluation API.

## L2: weighting, Mahler derivation and ordinary moments

This continuation specializes the source's bounded operator calculus to Mathlib's actual
`D(ℤ_[p], ℤ_[p])` carrier. Both `AbstractMeasure.amiceTransform` and its integral linear
equivalence already exist. The formal derivative and the identity extracting a factorial times a
coefficient from an iterated derivative also exist. Only weighting, the multiplier (1+T), and the
comparison proofs between these existing objects are new.

Let x denote the identity continuous function on ℤ_p, A the existing Amice transform, and
∂=(1+T)D. The proof chain is

    μ(x^k) = constantCoeff(∂^[k] Aμ)
    (μ(x^k) : ℚ_p) = k! coeff_k((map ℤ_p→ℚ_p Aμ)(exp T−1)).

The first equality stays integral. For the second, embed only the value and the coefficients; the
measure stays in the existing integral carrier. The exponential substitution is formal over ℚ_p,
with zero constant term in exp(T)−1. There is no claim of convergence of p-adic exp on all ℤ_p,
no ℚ-algebra structure on ℤ_p, and no field-coefficient inverse Amice theorem assumed. These
hypothesis distinctions are required even for p=2.

The generic comparison is supplied at `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp`.
The consumer `DirichletPadicLFunctions:L1/measure-ordinary-moment` can use that node for its
specific smoothing measure. Bernoulli numbers, zeta values and the actual Dirichlet measure remain
with their owner: there is no dependency from this generic supplier back to that consumer.
LocallyAnalyticDistributions:L1 imports the bounded reference and proves its own unbounded-carrier
comparison. Coleman's logarithmic derivative additionally divides ∂F by a unit F and is not
redefined here.

RJW §3.5.1, Lemma 3.29 and Corollary 3.30 give the measure/derivative identities; §3.5.2 gives
general continuous-function weighting; §4.1, Lemma 4.3 supplies the change-of-variable motivation.
The compact-X, normed-commutative-ring weighting and the formal commutative-ℚ-algebra statements
are explicitly worker generalizations. Their hypotheses are checked against the concrete pinned APIs.

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

Unit tests:

- `SuggestedTests.weight_zero_atom`: Over ℤ₃, weight x δ₀=0 although δ₀≠0, as evaluation on 1 shows. Weighting by x is not injective.
- `SuggestedTests.weight_one_atom`: Over ℤ₃, weight x δ₁=δ₁.
- `SuggestedTests.weight_two_atom`: Over ℤ₃, weight x δ₂=2δ₂; this rejects ignoring g.

Acceptance: The construction itself was independently checked by a complete scratch Lean proof; the suggested deliverable remains an unchecked plan.

Consumers: DirichletPadicLFunctions:L1/measure-ordinary-moment: Use the generic ℚ_p coefficient formula for the particular integral measure. Bernoulli and zeta arithmetic remain Dirichlet-owned; this supplier has no reverse dependency. LocallyAnalyticDistributions:L1: Import the bounded reference operator; its extension to a different test-function topology needs the recipient's comparison. ColemanPowerSeries:L2/logarithmic-derivative: The numerator is (1+T)D; dividing by a series unit and the norm/trace comparison remain distinct Coleman constructions.

Source: Rodrigues Jacinto–Williams, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20. Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Evaluation of a weighted measure

`PadicMeasuresIwasawaAlgebras:L2/weight-evaluation` — lemma.

For f : C(X,R), (weight g μ)(f)=μ(gf).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Unfold the transported composition and AbstractMeasure.toCLMEquiv. The equality is definitional.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight`.

Acceptance: At g=1 this gives μ(f); at g=0 it gives μ(0)=0.

Source: Rodrigues Jacinto–Williams, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20. Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Composition of weights

`PadicMeasuresIwasawaAlgebras:L2/weight-multiplication` — lemma.

For g,h : C(X,R), weight (gh) μ=weight g (weight h μ).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Use measure extensionality and weight-evaluation twice. The right side at f is μ(h(gf)); associativity and commutativity identify it with μ((gh)f).

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: The inner evaluation is h(gf), not evaluation of g at a point.

Source: Rodrigues Jacinto–Williams, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20. Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Projection formula for weights

`PadicMeasuresIwasawaAlgebras:L2/weight-pushforward` — lemma.

For compact Y, h : C(X,Y), g : C(Y,R), AbstractMeasure.map h (weight (g.comp h) μ)=weight g (AbstractMeasure.map h μ).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Evaluate at f : C(Y,R). The existing map_apply and weight-evaluation reduce both sides to μ((g∘h)(f∘h)). No new pushforward is defined.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: For h constant with value a the scalar weight is g(a), with g defined on Y.

Source: Rodrigues Jacinto–Williams, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20. Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

### Iterated weighting

`PadicMeasuresIwasawaAlgebras:L2/weight-iteration` — lemma.

For k∈ℕ and f : C(X,R), ((weight g)^[k] μ)(f)=μ(g^k f).

Hypotheses: X is a compact topological space; R is a normed commutative ring; g : C(X,R), μ : D(X,R). No topology is newly imposed on AbstractMeasure.

Proof outline:

1. Induct on k. At zero, μ(f)=μ(1f). At the successor step apply weight-evaluation and the induction hypothesis at gf, then use g^k(gf)=g^(k+1)f. Weight-multiplication records the same action identity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`.

Acceptance: At k=0 the multiplier is 1 even if g vanishes; this is needed for the zero-th moment.

Source: Rodrigues Jacinto–Williams, §3.5.2, printed pp. 126–127 / PDF 27–28; collated with v2 PDF 20. Specializes the continuous-function weighting action to the pinned continuous dual. The extension to compact X and a normed commutative coefficient ring is a worker generalization using continuous multiplication, not a field-valued extension theorem.

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

Unit tests:

- `SuggestedTests.mahler_constant`: Over ℤ, ∂(C 7)=0.
- `SuggestedTests.mahler_X`: Over ℤ, ∂T=1+T; D and TD both fail this test.
- `SuggestedTests.mahler_square`: Over ℤ, ∂((1+T)^2)=2(1+T)^2.
- `SuggestedTests.mahler_char_three`: Over ZMod 3, ∂(T^3)=0 although T^3≠0.

Acceptance: Valid over every commutative ring, including positive characteristic. Its kernel is not claimed to consist only of constants.

Consumers: DirichletPadicLFunctions:L1/measure-ordinary-moment: Use the generic ℚ_p coefficient formula for the particular integral measure. Bernoulli and zeta arithmetic remain Dirichlet-owned; this supplier has no reverse dependency. LocallyAnalyticDistributions:L1: Import the bounded reference operator; its extension to a different test-function topology needs the recipient's comparison. ColemanPowerSeries:L2/logarithmic-derivative: The numerator is (1+T)D; dividing by a series unit and the norm/trace comparison remain distinct Coleman constructions.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Explicit Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value` — lemma.

PowerSeries.mahlerDerivation R F=(1+T)*PowerSeries.derivative R F.

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Unfold the definition, apply Derivation.smul_apply and the self-module action on the power-series ring.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation`, `mathlib:Derivation.smul_apply`.

Acceptance: The multiplier is 1+T, not T or 1.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Coefficients of the Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients` — lemma.

For n∈ℕ, coeff_n(∂F)=(n+1)coeff_(n+1)F+n coeff_n F.

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Expand (1+T)DF=DF+TDF using mahler-derivation-value.
2. The first coefficient is (n+1)coeff_(n+1)F by coeff_derivative. At n=0 the second term is zero. At n=m+1, coeff_mul_X_pow makes it coeff_m DF=(m+1)coeff_(m+1)F. Combine by commutativity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:PowerSeries.coeff_mul_X_pow`.

Acceptance: For F=T, coefficients 0 and 1 are both 1. A shifted factor on the second summand fails.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Coefficient change for the Mahler derivation

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-map` — lemma.

For a ring homomorphism f : R →+* S between commutative rings, PowerSeries.map f (∂F)=mahlerDerivation S (PowerSeries.map f F).

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Use power-series extensionality, the coefficient formula, coeff_map and preservation of addition, multiplication and natural casts. No unlisted derivative-map theorem is assumed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`.

Acceptance: Reduction ℤ→ZMod 3 commutes with ∂, including ∂T^3=0.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Coefficient change for iterated derivations

`PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-iterate-map` — lemma.

For f : R →+* S and k∈ℕ, map f (∂^[k] F)=(mahlerDerivation S)^[k] (map f F).

Hypotheses: R is a commutative ring; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R.

Proof outline:

1. Induct on k. The zero case is reflexive; at the successor step use mahler-derivation-map and the induction hypothesis.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-map`.

Acceptance: At k=0 the map is the original coefficient map with no derivative.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

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

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

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

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Amice transform of iterated weighting

`PadicMeasuresIwasawaAlgebras:L2/amice-iterate-weight` — lemma.

A((weight x)^[k] μ)=∂^[k](Aμ) for every k∈ℕ.

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. Induct on k, applying amice-weight to the iterated measure in the successor step. The zero case applies no derivative.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-weight`.

Acceptance: At k=0 the output is Aμ, without a positive-k restriction.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

### Ordinary moments from the Amice transform

`PadicMeasuresIwasawaAlgebras:L2/ordinary-moment` — theorem.

For k∈ℕ, μ(x^k)=constantCoeff(∂^[k](Aμ)) in ℤ_p.

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. For any ν, the constant coefficient of Aν is ν(mahler 0)=ν(1), by coeff_amiceTransform, mahler_apply and Ring.choose_zero_right.
2. Apply this to ν=(weight x)^[k] μ. Use amice-iterate-weight on the series and weight-iteration at f=1 on its evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-iterate-weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-iteration`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:mahler_apply`, `mathlib:Ring.choose_zero_right`.

Acceptance: δ₀ has zero-th moment 1. The third moment of δ₂ is 8 although coeff₃(Aδ₂)=0.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned.

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

Source: Rodrigues Jacinto–Williams, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27. Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### Iterated exponential coordinate change

`PadicMeasuresIwasawaAlgebras:L2/exp-iterate` — lemma.

D^[k](F(h))=(∂^[k] F)(h) for every k∈ℕ.

Hypotheses: R is a commutative ℚ-algebra; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R. E=PowerSeries.exp R and h=E−1; constantCoeff h=0, so formal substitution at h is defined. No analytic convergence hypothesis or inverse substitution is asserted.

Proof outline:

1. Induct on k. In the successor step rewrite by the induction hypothesis and apply exp-conjugacy to ∂^[k] F. No new analytic differentiability assertion is needed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/exp-conjugacy`.

Acceptance: At k=0 both sides equal F(h), not F.

Source: Rodrigues Jacinto–Williams, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27. Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### Factorial-normalized exponential coefficients

`PadicMeasuresIwasawaAlgebras:L2/exp-coefficient` — lemma.

constantCoeff(∂^[k] F)=k! coeff_k(F(h)) for every k∈ℕ.

Hypotheses: R is a commutative ℚ-algebra; F : R⟦T⟧. D is the existing formal derivative; ∂ is mahlerDerivation R. E=PowerSeries.exp R and h=E−1; constantCoeff h=0, so formal substitution at h is defined. No analytic convergence hypothesis or inverse substitution is asserted.

Proof outline:

1. Take constant coefficients in exp-iterate. Since h has zero constant coefficient, constantCoeff_subst_of_constantCoeff_zero gives constantCoeff(∂^[k] F) on the right.
2. On the left apply the existing constantCoeff_iterate_derivative; the factorial identity is baseline, not new work. Reverse the equality.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/exp-iterate`, `mathlib:PowerSeries.constantCoeff_subst_of_constantCoeff_zero`, `mathlib:PowerSeries.constantCoeff_iterate_derivative`.

Acceptance: For F=(1+T)^2 and k=3, coeff₃(F(exp T−1))=4/3, and 3!*(4/3)=8.

Source: Rodrigues Jacinto–Williams, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27. Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

### Ordinary moments as exponential coefficients

`PadicMeasuresIwasawaAlgebras:L2/ordinary-moment-exp` — theorem.

For μ : D(ℤ_p,ℤ_p) and k∈ℕ, (μ(x^k) : ℚ_p) = (k! : ℚ_p) * coeff_k(PowerSeries.subst (PowerSeries.exp ℚ_p−1) (PowerSeries.map (algebraMap ℤ_p ℚ_p) Aμ)).

Hypotheses: p is prime; μ : D(ℤ_p,ℤ_p) is the existing integral AbstractMeasure; Aμ is its existing Amice transform. Write x for ContinuousMap.id ℤ_p.

Proof outline:

1. Embed ordinary-moment into ℚ_p. The coefficient-zero instance of coeff_map commutes the constant coefficient with the embedding.
2. Use mahler-derivation-iterate-map for algebraMap ℤ_p ℚ_p to move the coefficient map inside ∂^[k].
3. Apply exp-coefficient over ℚ_p. Only the evaluated integral and series coefficients are embedded: μ remains integral. No missing inverse Amice equivalence over ℚ_p, measure scalar-extension theorem, or Bernoulli arithmetic is assumed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/ordinary-moment`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-iterate-map`, `PadicMeasuresIwasawaAlgebras:L2/exp-coefficient`, `mathlib:PowerSeries.coeff_map`.

Acceptance: Includes k=0 and p=2. Formal exp is over ℚ_p, never over an assumed ℚ-algebra structure on ℤ_p.

Consumers: DirichletPadicLFunctions:L1/measure-ordinary-moment: Use the generic ℚ_p coefficient formula for the particular integral measure. Bernoulli and zeta arithmetic remain Dirichlet-owned; this supplier has no reverse dependency. LocallyAnalyticDistributions:L1: Import the bounded reference operator; its extension to a different test-function topology needs the recipient's comparison. ColemanPowerSeries:L2/logarithmic-derivative: The numerator is (1+T)D; dividing by a series unit and the norm/trace comparison remain distinct Coleman constructions.

Source: Rodrigues Jacinto–Williams, §3.5.1, Lemma 3.29 and Corollary 3.30, printed p. 126 / PDF 27; collated with v2 PDF 19. Integral specialization of the source identities on pinned measure and Mahler carriers. The formal operator is packaged as a multiple of the existing derivative; no new Mahler expansion or inverse Amice transform is planned. Rodrigues Jacinto–Williams, §4.1, Lemma 4.3 and its use in Proposition 4.6, printed pp. 136–137 / PDF 37–38; v2 PDF 27. Worker formal-algebra decomposition of the source change of variables over commutative ℚ-algebras. This asserts neither convergence of p-adic exp on all ℤ_p nor an analytic measure scalar-extension theorem.

## L3: algebraic pseudomeasures and evaluation

Let G be a group, R a commutative ring, δ : G →* R a specified Dirac homomorphism, and Q an R-algebra with
`IsFractionRing R Q`. Write ι : R → Q for the injective scalar map and c_g = δ(g)−1. In the arithmetic
application G will be profinite abelian and R will be the completed group algebra, but no topological
assumption is needed for the algebra below. No arbitrary placeholder proposition stands in for a missing
completed-group-ring construction.

The pseudomeasure submodule is

    P(δ,Q) = (image of R in Q) / span_R {ι(c_g) | g ∈ G},

where the slash is the existing **submodule quotient**: z belongs when its product with every element of
the denominator submodule lies in the numerator submodule. Equivalently, every c_g clears z into R.
This is exactly Definition 3.34's integrality condition after the Dirac map is supplied. It is not an assertion
that the algebraic span equals the completed augmentation kernel. In particular, when δ is trivial the
condition is vacuous and P=Q. The inverse-of-zero convention for fractional ideals would give the wrong
answer here. For R=ℤ and δ : ℤˣ → ℤ, P=(1/2)ℤ inside ℚ; it contains 1/2 but not 1/4, so it need not be a ring.

For each g, membership and injectivity determine the integral numerator n_g(z) by
ι(n_g(z))=ι(c_g)z. These numerators form R-linear maps and satisfy
c_h n_g(z)=c_g n_h(z). For a commutative R-algebra A with scalar map f, evaluation at an admissible g is

    ev_g(z) = f(c_g)⁻¹ f(n_g(z)),        f(c_g) a unit in A.

Over a field, this means f(c_g)≠0. Over a general coefficient ring it really requires a unit: 2≠0 in ℤ does
not suffice. The two-factor identity proves independence of g, compatibility with integral elements,
uniqueness as an R-linear extension and functoriality along R-algebra maps. None of these arguments
requires a ring map Q → A. This distinction is essential: a regular element killed by f prevents such a map.

The following nodes each propose a single declaration. API lemmas used by another node are promoted and
linked explicitly. The suggested file supplies their signatures and twelve named definition/construction
examples, plus three boundary checks; its unproved signatures make no implementation claim.

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

Unit tests:

- `SuggestedTests.trivial_half`: For G=PUnit, δ=1 : G →* ℤ and Q=ℚ, 1/2 is a pseudomeasure.
- `SuggestedTests.integer_three`: For δ=Units.coeHom ℤ and Q=ℚ, 3 is a pseudomeasure.
- `SuggestedTests.half_not_quarter`: For δ=Units.coeHom ℤ and Q=ℚ, 1/2 belongs but 1/4 does not. Thus pseudomeasures need not be closed under multiplication.

Consumers: Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element. DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures. IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Source: Rodrigues Jacinto–Williams, §3.6, Definition 3.34, printed p. 129 / PDF 30. Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Source: Rodrigues Jacinto–Williams, §3.6, Definition 3.34, printed p. 129 / PDF 30. Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Unit tests:

- `SuggestedTests.integral_three`: For δ=Units.coeHom ℤ and Q=ℚ, the underlying value of integral 3 is 3.
- `SuggestedTests.integral_zero`: In the same example the underlying value of integral 0 is 0.
- `SuggestedTests.integral_one_ne_zero`: In the same example integral 1 ≠ integral 0.

Consumers: Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element. DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures. IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Source: Rodrigues Jacinto–Williams, §3.6, Definition 3.34, printed p. 129 / PDF 30. Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Underlying integral element

`PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value` — lemma.

For r ∈ R, the underlying element of integral δ Q r in Q is ι(r).
Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Unfold the codomain restriction defining integral; the equality is definitional.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/integral-pseudomeasure`.

Acceptance: For R=ℤ, Q=ℚ and δ=Units.coeHom ℤ, the underlying values of integral 0 and integral 3 are 0 and 3 respectively.

Source: Rodrigues Jacinto–Williams, §3.6, Definition 3.34, printed p. 129 / PDF 30. Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Unit tests:

- `SuggestedTests.numerator_identity`: For δ=Units.coeHom ℤ and any pseudomeasure z in ℚ, n_1(z)=0.
- `SuggestedTests.numerator_integral_two`: For δ=Units.coeHom ℤ, n_{−1}(integral 2)=−4.
- `SuggestedTests.numerator_half`: For δ=Units.coeHom ℤ, the cleared numerator n_{−1}(1/2) is −1.

Consumers: Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element. DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures. IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Source: Rodrigues Jacinto–Williams, §3.6, Definition 3.34, printed p. 129 / PDF 30. Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Numerator specification

`PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec` — lemma.

For every g and pseudomeasure z, ι(numerator δ Q g z)=ι(c_g)z.
Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Apply the property of the unique preimage used in the numerator construction.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator`.

Acceptance: For R=ℤ, Q=ℚ, δ=Units.coeHom ℤ, g=−1 and z=1/2, the equality reads ι(−1)=ι(−2)(1/2). The opposite sign for the numerator fails this check.

Source: Rodrigues Jacinto–Williams, §3.6, Definition 3.34, printed p. 129 / PDF 30. Specializes the source integrality condition. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Commuting cleared numerators

`PadicMeasuresIwasawaAlgebras:L3/cross-multiplied-numerators` — lemma.

For g,h ∈ G and a pseudomeasure z, c_h n_g(z)=c_g n_h(z) in R.
Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field.

Proof outline:

1. Apply IsFractionRing.injective.
2. Map both sides to Q and replace the two numerators by cleared-numerator-spec. Commutativity and associativity identify both products with ι(c_h)ι(c_g)z.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec`, `mathlib:IsFractionRing.injective`.

Acceptance: Taking g=1 forces both sides to zero, using n_1=0; taking g=h gives the reflexive identity. For two admissible factors the identity must survive every coefficient homomorphism.

Source: Rodrigues Jacinto–Williams, Equation (3-11), independence calculation, printed p. 130 / PDF 31. This is the algebraic equality behind the two clearing-factor calculation, before applying the character map. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Unit tests:

- `SuggestedTests.evaluation_zero`: For δ=Units.coeHom ℤ, Q=A=ℚ, g=−1 and hg asserting the unit condition, evaluation of zero is zero.
- `SuggestedTests.evaluation_integral_three`: With these data, evaluation of integral 3 is 3.
- `SuggestedTests.evaluation_half`: With these data and the membership proof for 1/2, its evaluation is 1/2.

Consumers: Rodrigues Jacinto–Williams §3.6, equation (3-11) and Lemma 3.38: Clear Dirac differences, retain the integral numerator, and evaluate independently of the clearing element. DirichletPadicLFunctions:L1: The downstream smoothing construction needs a pseudomeasure with well-defined admissible character values and compatibility with integral measures. IntegralIwasawaTheory:I.1: Supply the algebraic evaluation interface after the completed Iwasawa algebra and character specialization maps have been constructed by their owners.

Source: Rodrigues Jacinto–Williams, Equation (3-11), printed pp. 129–130 / PDF 30–31. Generalizes the field-valued formula to a commutative target algebra under exactly the invertibility hypothesis used by division. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Evaluation equation

`PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec` — lemma.

For an admissible g and every pseudomeasure z, f(c_g) evalAt_g(z)=f(n_g(z)).
Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)).

Proof outline:

1. Unfold evaluation and cancel the unit with its chosen inverse.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation`.

Acceptance: For R=ℤ, Q=A=ℚ, δ=Units.coeHom ℤ, g=−1 and z=1/2, the equation is (−2)(1/2)=−1.

Source: Rodrigues Jacinto–Williams, Equation (3-11), printed pp. 129–130 / PDF 30–31. The source division formula is expressed as a multiplicative equation. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Source: Rodrigues Jacinto–Williams, Independence calculation following equation (3-11), printed p. 130 / PDF 31. Follows the source two-factor argument, correcting the last occurrence of μ to λ. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

### Evaluation of integral measures

`PadicMeasuresIwasawaAlgebras:L3/evaluation-on-integral-elements` — lemma.

For every r ∈ R and admissible g, evalAt_g(integral r)=f(r).
Hypotheses: G is a group; R is a commutative ring; δ : G →* R is given. No topological hypotheses are needed for this algebraic subproblem. Q is a commutative R-algebra with IsFractionRing R Q. The canonical map ι : R → Q is injective; Q means the total quotient ring, not an assumed field. A is a commutative R-algebra. Write f = algebraMap R A and c_g = δ(g)−1. hg : IsUnit (f(c_g)).

Proof outline:

1. Map the numerator specification for integral r to Q and use integral-inclusion-value; injectivity identifies the numerator with c_g r.
2. Use the evaluation equation and cancel f(c_g) with IsUnit.mul_left_cancel.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L3/cleared-numerator-spec`, `PadicMeasuresIwasawaAlgebras:L3/integral-inclusion-value`, `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation-spec`, `mathlib:IsFractionRing.injective`, `mathlib:IsUnit.mul_left_cancel`.

Acceptance: For R=ℤ, Q=A=ℚ, δ=Units.coeHom ℤ and g=−1, evaluation of integral 3 is 3. The result also holds for r=0 and r=1.

Source: Rodrigues Jacinto–Williams, Definition 3.34 and equation (3-11), printed pp. 129–130 / PDF 30–31. Checks that the extended expression agrees with the original character integral. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Source: Rodrigues Jacinto–Williams, Equation (3-11) and Remark 3.35, printed p. 130 / PDF 31. This is the corrected uniqueness statement for a linear extension on pseudomeasures. It does not assert a ring homomorphism on all of Q(G). The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Source: Rodrigues Jacinto–Williams, Equation (3-11), printed pp. 129–130 / PDF 30–31. Functorial consequence of the source formula needed for coefficient specializations; not stated separately in the paper. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

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

Source: Rodrigues Jacinto–Williams, Remark 3.35, printed p. 130 / PDF 31; correction recorded as E1. Counterexample criterion correcting the asserted whole-total-quotient extension. The formulation over an explicit δ into an arbitrary commutative ring is a worker generalization of the source argument; the paper specializes to completed group algebras.

## Published-source corrections

The version of record is [Rodrigues Jacinto–Williams, Essential Number Theory 4 (2025), 101–216](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf).
The corresponding passage was collated with [arXiv v2](https://arxiv.org/pdf/2309.15692v2). These are
worker findings awaiting independent verification, not published errata or completed independent reviews.

- **PadicMeasuresIwasawaAlgebras/E1** (error; affects a stated result), Remark 3.35, published printed p. 130 / PDF 31; same assertion in arXiv v2 PDF 22. A continuous character integral extends to a localization only when every inverted element has unit image. A pseudomeasure can instead be evaluated by (3-11) once one Dirac difference has nonzero character value. It does not generally extend to all of Q(G). Take p=3, G=ℤ₃ with generator γ, and R=ℤ₃[[T]] with [γ]=1+T. The continuous nontrivial character χ(x)=4^x gives the convergent evaluation T↦3. The nonzero regular series T−3 maps to zero, so no extension to Q(R) exists: its inverse would force 0=1. This example meets the remark’s nontrivial-character hypothesis. Separately, augmentation T↦0 kills T. The generic obstruction node and the two polynomial test cases isolate the same algebraic failure. Accepted RS-16 already warns against whole-fraction augmentation; no published erratum was found in the listed search.
- **PadicMeasuresIwasawaAlgebras/E2** (misprint; affects nothing), Final term in the independence calculation after (3-11), published printed p. 130 / PDF 31; arXiv v2 PDF 22. The last integrand must use λ, the pseudomeasure occurring in the other two terms of the calculation. The calculation compares two clearing factors applied to one fixed pseudomeasure λ. No second pseudomeasure μ is introduced there. Replacing the final μ by λ yields the cross-multiplied-numerator identity and the valid independence proof.
- **PadicMeasuresIwasawaAlgebras/E3** (error; affects the proof), Proof of Lemma 3.36(iii), published printed p. 131 / PDF 32; arXiv v2 PDF 23. Choose an integer a>1 prime to p, for example p+1; more generally choose a of infinite order, so a^k−1≠0 for every positive k. The stated choice of an integer a≠1 prime to p allows a=−1. Its even moments vanish, so [a]−[1] does not satisfy part (ii), contrary to the proof’s next claim. Indeed ([−1]−[1])([−1]+[1])=0. The two factors are nonzero for the characteristic-zero coefficient ring, as seen in a finite quotient distinguishing ±1. Taking a=p+1 repairs this step and leaves the lemma intact.

The publication and arXiv version listing, the two authors' publication pages and Crossref update relations
were checked on 26 September 2026; no correction was located there. The packet records the exact URLs,
version hashes, locators and bounded search. Nothing has been sent to the authors.

## Remaining layers and ownership

### PadicMeasuresIwasawaAlgebras:L0 — not_read

- Decompose the bounded profinite measure theory using existing AbstractMeasure, clopen approximations and dense extension. Read the coefficient/lattice sources; construct integral lattices and scalar extension with value-group hypotheses, norm and weak topologies, and the exact comparison maps.

### PadicMeasuresIwasawaAlgebras:L0a — not_read

- Read and decompose the continuous character functor and its parameter spaces using the existing partial ℤ_p-character library. Keep family distribution actions at LocallyAnalyticDistributions:L4 under accepted RS-16; do not add a reverse prerequisite.

### PadicMeasuresIwasawaAlgebras:L1 — not_read

- Read and decompose joint adic/finite-group completed group algebras, bounded-measure comparison and convolution. Import the ℤ_p completed group algebra from ProfiniteProPGroups:Layer9 rather than rebuilding it. Resolve the RS-16 topology gate: finite-quotient kernels ((1+T)^(p^n)−1), with p-power coefficient reduction, are not the pure T-adic kernels.

### PadicMeasuresIwasawaAlgebras:L2 — partial

- Extend the integral ℤ_p Amice comparison to the actual bounded-series carriers for more general coefficients; give coefficient, lattice, norm and weak-topology comparisons instead of asserting surjectivity onto every series over a field.
- Decompose clopen restriction, multiplication by z^x with genuine convergence hypotheses, unit actions, phi and psi, support on ℤ_pˣ and the power-series/finite-free trace formulas. Weighting by x and ordinary moments do not supply these operators.
- Import completed-algebra/procyclic coordinates from L1 and ProfiniteProPGroups Layer 9 and compare them with the pinned Amice transform. Retain the joint adic/finite-quotient topology gate.
- Export the bounded operator reference to Coleman and locally analytic distributions; each recipient owns its norm/trace, logarithmic-derivative or unbounded-topology comparison. No reverse dependency is added.

### PadicMeasuresIwasawaAlgebras:L3 — partial

- Identify this generic algebraic δ with the Dirac homomorphism into the actual completed group algebra supplied by L1/ProfiniteProPGroups:Layer9, and identify the scalar map f with continuous-character integration. The present declarations take those data explicitly.
- Compare the R-span of all Dirac differences with the completed augmentation kernel, with the required closure and topology stated; do not silently identify algebraic span with a closed ideal.
- Decompose Lemma 3.36(i) positive-moment uniqueness via Mahler/ψ, (ii) moment nonvanishing implies regularity, and (iii) pseudomeasure uniqueness. Choose an infinite-order integer a (e.g. p+1) in the proof, as explained in E3.
- Decompose the procyclic augmentation-kernel/principal-generator argument and prove the chosen denominator regular before forming the Lemma 3.38 fraction. Keep the dyadic ℤ₂ˣ ≅ C₂ × ℤ₂ case separate; ℤ₂[C₂] is not an integral product of character components.
- Construct admissible character specializations, including their varying-character loci and any topology actually required by downstream L-functions. The generic algebraic evaluation map alone does not supply analytic families.

### PadicMeasuresIwasawaAlgebras:L4 — not_read

- Read/decompose one- and multivariable Iwasawa module structure, characteristic ideals/divisors, regular-local dimension hypotheses and coefficient specialization. Reuse existing Weierstrass preparation, Noetherian/UFD facts and the Fitting owner tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.

### PadicMeasuresIwasawaAlgebras:L5 — not_read

- Read/decompose determinant functors and compact inverse-limit exactness with their hypotheses. Import generic perfect-complex theory from SchemeKTheoryOperations:S.1 and complete-local input from DeformationAndDerivedPatchingAlgebra:P7; plan only the remaining Iwasawa-specific structures.

### PadicMeasuresIwasawaAlgebras:L6 — not_read

- Read/decompose Gorenstein order duality, exterior biduals and their integral comparison and base-change maps; retain this ownership under RS-16. Import Fitting facts; Euler/Kolyvagin system contractions remain at their separate ES6–8 owners.

The accepted RS-16 topology restriction is retained. Finite cyclic group quotients correspond to
((1+T)^(p^n)−1); with coefficient reduction the compact topology is controlled by p and T. The pure T-adic
and finite-group-quotient topologies must not be identified without a valid comparison. Completeness alone
does not imply compactness. The dyadic C₂ factor must remain integral until an explicitly justified scalar
extension; ℤ₂[C₂] does not split into a product of integral character rings.

There are no external prerequisite edges or requests in this first algebraic subgraph: its inputs are the
explicit δ, Q and R-algebra A, and its proofs end in the pinned baseline. This is not roadmap closure. The
eight gaps retain every unprocessed target and the necessary arithmetic comparisons. A continuation that
adds those comparison nodes must obtain their exact supplier nodes, or add precise stage requests when no
finer supplier exists. It must not rebuild the ProfiniteProPGroups anchor, locally analytic distribution
actions, Fitting ideals, or generic perfect-complex machinery here.

L2 has three proposed planets: Weighted measures, Mahler derivation, and Ordinary moments of the Amice
transform. L3 retains its four planets: Pseudomeasures, Cleared numerator, Admissible evaluation,
and Independence of clearing factor. A continuation may add at most two further L3 planets or propose
sub-layers if justified; it must not promote every API lemma into a planet.

The suggested file now contains 19 definition/construction tests, three inherited boundary examples,
three new moment/coefficient examples and a definitional substitution-notation check. All implementation
statuses remain unchecked; successful signature elaboration is not an implementation of the roadmap.

## Sources and scope of reading

- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101. PDF 30–32, printed 129–131: Corollary 3.32, Remark 3.33, §3.6, Definition 3.34, equation (3-11), Remark 3.35, Lemma 3.36 and its proof, Definition 3.37, Lemma 3.38 and its proof. PDF 33: Remark 3.39 and surrounding locally analytic context were also read to check evaluation inside the open unit disc. This is not an all-paper reading. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`; accessed 2026-09-26.
- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), arXiv:2309.15692v2, 19 December 2024. PDF 21–23, including §3.6, Definitions 3.34/3.37, Remarks 3.33/3.35, Lemmas 3.36/3.38 with proofs, collated against the published passage. SHA-256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`; accessed 2026-09-26.

The continuation additionally reads and collates published PDF 26–28 (printed 125–127), especially
§3.5.1–2, Lemma 3.29 and Corollary 3.30, and PDF 37–38 (printed 136–137), Lemma 4.3 and its
use in Proposition 4.6; the matching v2 passages are PDF 19–20 and 27. The three inherited source
findings are retained; this continuation reports no new source error.

Pinned library statements were read in the exact files and line ranges listed in the packet; names alone were not treated as evidence.
