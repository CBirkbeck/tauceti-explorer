# Profinite and pro-p groups, Part II: p-adic measures and Iwasawa algebras

First prerequisite: [Profinite and pro-p groups](../../../content/tau-ceti/ProfiniteProPGroups/README.md),
especially its Layer 9 prerequisites. This roadmap extends that work under accepted RS-16. It imports the
existing profinite groups, inverse limits, ℤ_p completed group algebra, Dirac map and procyclic/dyadic
coordinates. It starts with bounded measures and the coefficient, analytic and module-theoretic comparisons
beyond those constructions. The shared finite-presentation Fitting carrier remains with StableReduction,
Layer 1; general perfect-complex comparisons remain with SchemeKTheoryOperations:S.1 and the
complete-Noetherian-local specialization input with DeformationAndDerivedPatchingAlgebra:P7.

**Partial checkpoint, 27 September 2026.** All eight campaign layers remain in scope. The source
decomposition below covers the weighting/moment and bounded Frobenius/psi chains of L2 and one coherent algebraic part of L3. It does not construct the completed group
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
coefficient from an iterated derivative also exist. In this first L2 tranche, weighting, the multiplier (1+T), and the
comparison proofs between these existing objects are new. The following operator tranche extends it.

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

## L2: bounded Frobenius, its left inverse and unit support

The measure operators below use the existing continuous dual D(ℤ_p,R) for a normed
commutative coefficient ring R. This includes the integral p-adic rings occurring in
the source, and its construction does not require a field or completeness of R.
All claims about the full formal power-series carrier use R=ℤ_p and the pinned
integral Amice equivalence. Continuity of a measure as a functional is part of its
existing carrier; continuity of an operator on a chosen topology on the space of
measures is a separate L0/L2 comparison still named in the gaps.

Write U=pℤ_p, χ=1_U, q(x)=x/p on U and q(x)=0 outside U. The core identities are

- φμ(f)=μ(x↦f(px)).
- ψμ(f)=μ(x↦χ(x)f(q(x))).
- ψφ=id and φψ=P, where Pμ(f)=μ(χf).
- E=id−P is restriction to units on the ambient carrier, and Eμ=μ iff ψμ=0.

These formulas divide the argument of a test function on pℤ_p, where the quotient
is integral. In particular ψδ_p=δ₁, with no division of a measure value by p.
The proof of ψφ=id uses μ after changing variables in φμ; E4 records the printed
measure-label error in that calculation.

For B=ℤ_p⟦T⟧, b=(1+T)^p−1 and the existing Amice equivalence A, a finite
Mahler coefficient calculation proves Aφμ=(Aμ)(b). The series operator is
ψ_B=AψA⁻¹. Its left-inverse law and the unit projector follow on that exact carrier.
It is not multiplicative: at p=2, ψ_B(1+T)=0 but ψ_B((1+T)²)=1+T.

Accepted RS-16 gives these bounded operators to this layer. ColemanPowerSeries:L1
must compare its normalized finite-free trace with this ψ_B; its norm, root-of-unity
coefficient extension and arithmetic interpolation are separate constructions.
LocallyAnalyticDistributions:L1 and PhiGammaModulesAndIwasawaCohomology:PG.4 must
prove their own carrier and topology comparisons. None is a prerequisite of this
bounded construction. Generic clopen-subtype restriction belongs to L0; P and E
are its specialized ambient formulas using the existing L2 weighting operator.

### The clopen subset pZ_p

`PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples` — `AbstractMeasure.isClopen_pMultiples` (lemma).

U=pZ is clopen in Z.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. By norm_lt_one_iff_dvd, U is the inverse image of the open interval (−∞,1) under the norm, hence open.
2. U is the image of compact Z under the continuous map m_p. This image is compact and hence closed in the metric space Z. Equality with the divisibility set is the definition of divisibility.

Prerequisites: `mathlib:PadicInt.norm_lt_one_iff_dvd`, `mathlib:PadicInt.compactSpace`.

Acceptance: For p=2, zero and 2 lie in U and 1 does not.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Exact division on pZ_p

`PadicMeasuresIwasawaAlgebras:L2/divide-by-p` — `AbstractMeasure.divideByP` (construction).

Define divideByP : C(Z,Z) by q(px)=x and q(y)=0 for y outside U.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Multiplication by the nonzero scalar p in the characteristic-zero domain Z gives a continuous bijection Z→U. Surjectivity is divisibility; injectivity is cancellation. Bundle its ordinary inverse as an equivalence.
2. Use Continuous.homeoOfEquivCompactToT2 to make this equivalence a homeomorphism. Its inverse is continuous on the subspace U.
3. Extend the inverse by zero off U. On the closed set U it is continuous by the subtype criterion, and on the closed complement it is constant. The frontier is empty, so continuous_piecewise pastes these maps without a boundary condition. Bundle the resulting continuous function.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples`, `mathlib:Continuous.homeoOfEquivCompactToT2`, `mathlib:continuous_piecewise`, `mathlib:PadicInt.compactSpace`.

API:

- `AbstractMeasure.divideByP_mul` (simp): q(px)=x; promoted to divide-by-p-mul.
- `AbstractMeasure.mul_divideByP` (characterisation): For x∈U, pq(x)=x; promoted to mul-divide-by-p.
- `AbstractMeasure.divideByP_of_not_dvd` (simp): For x∉U, q(x)=0.

Unit tests:

- `SuggestedTests.divide_zero` (degenerate): q(0)=0 over ℤ₃.
- `SuggestedTests.divide_six` (computation): q(6)=2 over ℤ₃; rejects the identically-zero function.
- `SuggestedTests.divide_unit` (non-example): q(1)=0 over ℤ₃; it is not multiplication by a ring inverse of 3.
- `SuggestedTests.divide_dyadic` (computation): q(6)=3 over ℤ₂.

Uses:

- `PadicMeasuresIwasawaAlgebras:L2/psi-measure`: Rescales the argument only after restriction to pZ_p, without dividing a measure value by p.

Acceptance: The extension convention is zero off U, not an inverse for the ring operation p in Z.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Division after multiplication

`PadicMeasuresIwasawaAlgebras:L2/divide-by-p-mul` — `AbstractMeasure.divideByP_mul` (lemma).

For every x∈Z, q(px)=x.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. px belongs to U. The inverse of the multiplication homeomorphism used in divide-by-p sends px to x.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/divide-by-p`.

Acceptance: At p=3 and x=2 the value is 2.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Multiplication after division on pZ_p

`PadicMeasuresIwasawaAlgebras:L2/mul-divide-by-p` — `AbstractMeasure.mul_divideByP` (lemma).

For x∈U, pq(x)=x.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Use the opposite inverse identity of the multiplication homeomorphism at the element (x,hx) of U.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/divide-by-p`.

Acceptance: The membership hypothesis cannot be dropped: at x=1 the left side is zero.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Restriction to pZ_p

`PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples` — `AbstractMeasure.restrictMultiples` (construction).

Define restrictMultiples : D(Z,R)→ₗ[R]D(Z,R) to be weight χ. It is restriction followed by extension by zero on the ambient Z carrier.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. clopen-pmultiples supplies U to LocallyConstant.charFn R; its existing toContinuousMap gives χ. Reuse weight χ directly.
2. The characteristic-function values give χ²=χ pointwise. The existing weight-multiplication law gives idempotence. Evaluation on a Dirac measure gives the stated cases; no nontriviality hypothesis on R is needed.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/clopen-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/weight-multiplication`, `mathlib:LocallyConstant.charFn`, `mathlib:LocallyConstant.toContinuousMap`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.dirac_apply`.

API:

- `AbstractMeasure.restrictMultiples_eq_weight` (compatibility): restrictMultiples=weight χ, using the existing weight carrier.
- `AbstractMeasure.restrictMultiples_apply` (characterisation): Pμ(f)=μ(χf); promoted to restriction-evaluation.
- `AbstractMeasure.restrictMultiples_dirac` (simp): Pδ_x=δ_x if x∈U, and zero otherwise.
- `AbstractMeasure.restrictMultiples_idem` (relation): P(Pμ)=Pμ.

Unit tests:

- `SuggestedTests.restrict_zero_atom` (degenerate): Pδ₀=δ₀ over ℤ₃, since 0 belongs to 3ℤ₃.
- `SuggestedTests.restrict_unit_atom` (non-example): Pδ₁=0 over ℤ₃.
- `SuggestedTests.restrict_three_atom` (computation): Pδ₃=δ₃ over ℤ₃; restriction does not rescale the atom.

Uses:

- `ColemanPowerSeries:L1`: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- `LocallyAnalyticDistributions:L1`: Supplies bounded operators that the recipient must compare with its different test-function topology.

Acceptance: Generic clopen-subtype measures and their comparison remain L0 work; this construction specializes the existing weighting operator.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Evaluation after restriction

`PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation` — `AbstractMeasure.restrictMultiples_apply` (lemma).

Pμ(f)=μ(χf).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Apply weight-evaluation to the definition P=weight χ.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/restriction-pmultiples`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`.

Acceptance: Taking f=1 computes the mass on pZ_p.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Frobenius on bounded measures

`PadicMeasuresIwasawaAlgebras:L2/phi-measure` — `AbstractMeasure.phiMeasure` (construction).

Define phiMeasure=AbstractMeasure.map m_p as an R-linear endomorphism of D(Z,R). Denote it φ.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Multiplication by p is continuous on Z. Apply the existing pushforward map to that continuous map.
2. Pushforward evaluation and its Dirac compatibility give the immediate API. The injectivity API is justified by the separately promoted psi-phi theorem; it is not an input to this data construction.

Prerequisites: `mathlib:AbstractMeasure.map`, `mathlib:AbstractMeasure.map_apply`, `mathlib:AbstractMeasure.map_dirac`.

API:

- `AbstractMeasure.phiMeasure_eq_map` (compatibility): φ equals the pinned pushforward along m_p.
- `AbstractMeasure.phiMeasure_apply` (characterisation): φμ(f)=μ(f∘m_p); promoted to phi-evaluation.
- `AbstractMeasure.phiMeasure_dirac` (simp): φδ_x=δ_(px).
- `AbstractMeasure.phiMeasure_injective` (characterisation): φ is injective; proof supplied by psi-phi.

Unit tests:

- `SuggestedTests.phi_zero` (degenerate): φ(0)=0 over ℤ₃.
- `SuggestedTests.phi_two_atom` (computation): φδ₂=δ₆ over ℤ₃.
- `SuggestedTests.phi_mass` (compatibility): φμ(1)=μ(1) over ℤ₃; rejects an extra factor p.

Uses:

- `ColemanPowerSeries:L1`: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- `LocallyAnalyticDistributions:L1`: Supplies bounded operators that the recipient must compare with its different test-function topology.

Acceptance: The map sends atoms forward and preserves total mass.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Evaluation after Frobenius

`PadicMeasuresIwasawaAlgebras:L2/phi-evaluation` — `AbstractMeasure.phiMeasure_apply` (lemma).

φμ(f)=μ(f∘m_p).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Use the exact existing AbstractMeasure.map_apply statement at m_p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-measure`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: The first ordinary moment is multiplied by p.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The left inverse of Frobenius

`PadicMeasuresIwasawaAlgebras:L2/psi-measure` — `AbstractMeasure.psiMeasure` (construction).

Define psiMeasure=(AbstractMeasure.map q)∘restrictMultiples as an R-linear endomorphism of D(Z,R). Denote it ψ.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

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

Unit tests:

- `SuggestedTests.psi_zero_atom` (degenerate): ψδ₀=δ₀ over ℤ₃.
- `SuggestedTests.psi_six_atom` (computation): ψδ₆=δ₂ over ℤ₃; no scalar 1/3 occurs.
- `SuggestedTests.psi_unit_atom` (non-example): ψδ₁=0 over ℤ₃; bare pushforward by q would give δ₀.
- `SuggestedTests.psi_dyadic` (computation): ψδ₆=δ₃ over ℤ₂.

Uses:

- `ColemanPowerSeries:L1`: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- `LocallyAnalyticDistributions:L1`: Supplies bounded operators that the recipient must compare with its different test-function topology.

Acceptance: ψδ₀=δ₀ and ψδ₁=0 distinguish restriction before rescaling.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Evaluation after the left inverse

`PadicMeasuresIwasawaAlgebras:L2/psi-evaluation` — `AbstractMeasure.psiMeasure_apply` (lemma).

ψμ(f)=μ(χ(f∘q)).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Apply map_apply, then restriction-evaluation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:AbstractMeasure.map_apply`.

Acceptance: The total mass is μ(χ), not μ(1)/p.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The left inverse identity

`PadicMeasuresIwasawaAlgebras:L2/psi-phi` — `AbstractMeasure.psiMeasure_phiMeasure` (theorem).

ψ(φμ)=μ for every μ∈D(Z,R).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Test on an arbitrary continuous f. Use psi-evaluation and then phi-evaluation to obtain μ(x↦χ(px)f(q(px))).
2. Here χ(px)=1 by divisibility and q(px)=x by divide-by-p-mul. The test function is f; continuous-dual extensionality gives the result.
3. The change of variables leaves μ as the integrating measure in this intermediate expression. This is the correction in source finding E4.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/divide-by-p-mul`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.toCLMEquiv`.

Acceptance: At p=3, μ=δ₁ and f=x, both sides evaluate to 1; keeping φμ in the intermediate integral incorrectly gives 3.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Frobenius after its left inverse

`PadicMeasuresIwasawaAlgebras:L2/phi-psi` — `AbstractMeasure.phiMeasure_psiMeasure` (theorem).

φ(ψμ)=Pμ for every μ∈D(Z,R).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Test on f and apply phi-evaluation and psi-evaluation: the integrand is χ(x)f(pq(x)).
2. For x∈U, mul-divide-by-p replaces pq(x) by x. Outside U, χ is zero; hence the test function is χf everywhere.
3. Use restriction-evaluation and extensionality. No identity pq(x)=x is asserted outside U.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/psi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/mul-divide-by-p`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.toCLMEquiv`.

Acceptance: φψδ₁=0, so φψ is a projector rather than the identity on all measures.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Restriction to units

`PadicMeasuresIwasawaAlgebras:L2/unit-restriction` — `AbstractMeasure.unitRestriction` (construction).

Define unitRestriction=id−P as an R-linear endomorphism of D(Z,R), denoted E. Its test-function multiplier is 1−χ, the characteristic function of Z×.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

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

Unit tests:

- `SuggestedTests.unit_one_atom` (compatibility): Eδ₁=δ₁ over ℤ₃.
- `SuggestedTests.unit_zero_atom` (degenerate): Eδ₀=0 over ℤ₃.
- `SuggestedTests.unit_three_atom` (non-example): Eδ₃=0 over ℤ₃; a nonzero atom need not be on units.

Uses:

- `ColemanPowerSeries:L1`: Supplies the bounded reference for its finite-free normalized trace comparison; no norm or trace theorem is assumed here.
- `LocallyAnalyticDistributions:L1`: Supplies bounded operators that the recipient must compare with its different test-function topology.

Acceptance: A unit atom survives; both δ₀ and δ_p vanish.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Evaluation after restriction to units

`PadicMeasuresIwasawaAlgebras:L2/unit-restriction-evaluation` — `AbstractMeasure.unitRestriction_apply` (lemma).

Eμ(f)=μ((1−χ)f).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Expand E=id−P and use restriction-evaluation and linearity.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`.

Acceptance: For f=1, total unit mass is μ(1−χ).

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Test-function support on units

`PadicMeasuresIwasawaAlgebras:L2/unit-restriction-support` — `AbstractMeasure.unitRestriction_eq_self_iff` (theorem).

Eμ=μ iff μ(χf)=0 for every f∈C(Z,R). Equivalently, μ annihilates every continuous function vanishing outside U.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. Eμ=μ is equivalent to Pμ=0 by subtraction in the additive group of measures.
2. Use restriction-evaluation and continuous-dual extensionality. Functions χf vanish outside U. Conversely any continuous g vanishing off U equals χg pointwise, giving the asserted support interpretation.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/restriction-evaluation`, `mathlib:LocallyConstant.coe_charFn`, `mathlib:AbstractMeasure.toCLMEquiv`.

Acceptance: This is a continuous-dual support condition, not MeasureTheory.support for real-valued measures.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Unit support and the kernel of psi

`PadicMeasuresIwasawaAlgebras:L2/unit-support-psi` — `AbstractMeasure.unitRestriction_eq_self_iff_psi_eq_zero` (theorem).

Eμ=μ iff ψμ=0.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, U={x∈Z : p divides x}=pZ. R is a normed commutative ring and D(Z,R) is the existing AbstractMeasure continuous dual. χ is the existing LocallyConstant.charFn of U, coerced to C(Z,R); m_p(x)=px. No topology is imposed on D(Z,R).

Proof/construction:

1. If Eμ=μ then Pμ=0. Since ψ=(map q)∘P, linearity gives ψμ=0.
2. If ψμ=0, phi-psi gives Pμ=φ0=0, so Eμ=μ. The statement holds without dividing coefficients by p.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`.

Acceptance: δ₁ is killed by ψ and fixed by E; δ₀ is fixed by ψ and killed by E.

Source: Rodrigues Jacinto–Williams, Corollary 3.32, printed p.129 / PDF30; equations (3-7)–(3-8), printed p.128 / PDF29. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Mahler expansion under dilation

`PadicMeasuresIwasawaAlgebras:L2/mahler-frobenius` — `AbstractMeasure.mahler_mul_prime` (lemma).

For n≥0 and x∈Z, mahler_n(px)=Σ_(0≤k≤n) coeff_n(b^k) mahler_k(x).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof/construction:

1. At x=m a natural number, expand (1+T)^(pm)=(1+b)^m by add_pow. Coefficients of (1+T)^(pm) are binomial(pm,n), using Polynomial.coeff_one_add_X_pow and Polynomial.coeff_coe. The right side has coefficient Σ_k binomial(m,k) coeff_n(b^k).
2. Since constantCoeff b=0, le_order_pow_of_constantCoeff_eq_zero and coeff_of_lt_order give coeff_n(b^k)=0 for k>n. Terms k>m also vanish by the natural binomial convention. Thus both finite ranges can be replaced by 0≤k≤n. mahler_natCast_eq identifies the claimed natural-point identity.
3. Both sides are continuous functions of x: the left is a continuous Mahler function composed with multiplication by p; the right is a finite linear combination of continuous Mahler functions. Apply denseRange_natCast and DenseRange.equalizer to extend to all Z.

Prerequisites: `mathlib:mahler`, `mathlib:mahler_natCast_eq`, `mathlib:PadicInt.denseRange_natCast`, `mathlib:DenseRange.equalizer`, `mathlib:add_pow`, `mathlib:Polynomial.coeff_one_add_X_pow`, `mathlib:Polynomial.coeff_coe`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`.

Acceptance: At p=3,n=2: binomial(3x,2)=3 binomial(x,1)+9 binomial(x,2), checked by the suggested example.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker finite-coefficient proof of equation (3-7), replacing informal integration of a formal series by a finite identity on each coefficient.

### Frobenius and the Amice transform

`PadicMeasuresIwasawaAlgebras:L2/amice-phi` — `AbstractMeasure.amiceTransform_phiMeasure` (comparison).

A(φμ)=PowerSeries.subst b (Aμ) for integral Z-valued μ.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof/construction:

1. Take coefficient n. coeff_amiceTransform and phi-evaluation identify the left side with μ(x↦mahler_n(px)).
2. Apply mahler-frobenius as an equality of continuous test functions. Move the finite sum and scalar coefficients through the Z-linear functional μ.
3. On the right use coeff_subst' with HasSubst supplied by constantCoeff b=0. As in mahler-frobenius, the order bound kills all indices k>n, reducing its finite-support sum to the same finite sum. Power-series extensionality finishes.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/phi-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/mahler-frobenius`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`.

Acceptance: The constant coefficient is preserved. For δ₂ at p=3 the series is (1+T)^6.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Exact integral-carrier comparison for source equation (3-7). The substitution operator itself is already in Mathlib.

### Psi on integral power series

`PadicMeasuresIwasawaAlgebras:L2/psi-series` — `AbstractMeasure.psiSeries` (construction).

Define psiSeries=A∘ψ∘A⁻¹ : B→ₗ[Z]B. This is a linear operator, not a ring homomorphism.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof/construction:

1. Use the existing amiceTransformEquiv and its inverse; compose their linear maps with psiMeasure. No new Amice carrier or inverse theorem is introduced.
2. The composite is Z-linear by the three existing linear-map structures. The promoted intertwining and left-inverse declarations prove its comparison API independently of this data construction.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-measure`, `mathlib:AbstractMeasure.amiceTransformEquiv`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.dirac_apply`, `mathlib:mahler_natCast_eq`.

API:

- `AbstractMeasure.psiSeries_eq_transport` (compatibility): psiSeries=A∘ψ∘A⁻¹ as linear maps.
- `AbstractMeasure.psiSeries_amiceTransform` (compatibility): psiSeries(Aμ)=A(ψμ); promoted to psi-series-intertwining.
- `AbstractMeasure.psiSeries_phi` (relation): psiSeries(subst b F)=F; promoted to psi-series-phi.
- `AbstractMeasure.psiSeries_one` (simp): psiSeries(1)=1.
- `AbstractMeasure.psiSeries_one_add_X` (simp): psiSeries(1+T)=0.

Unit tests:

- `SuggestedTests.psi_series_zero` (degenerate): psiSeries(0)=0 for p=3.
- `SuggestedTests.psi_series_one` (computation): psiSeries(1)=1 for p=3; rejects a zero operator.
- `SuggestedTests.psi_series_unit` (non-example): psiSeries(1+T)=0 for p=3.
- `SuggestedTests.psi_series_cube` (compatibility): psiSeries((1+T)^3)=1+T for p=3.
- `SuggestedTests.psi_series_dyadic` (computation): psiSeries((1+T)^2)=1+T for p=2.

Uses:

- `ColemanPowerSeries:L1`: The normalized finite-free trace must be proved equal to this integral bounded ψ; no trace formula is assumed in this construction.
- `ColemanPowerSeries:L2`: Forms F−φψF on the bounded-series carrier before the recipient logarithmic-derivative comparison.

Acceptance: At p=2 the images of Y and Y² show that the operator is not multiplicative. For the constant and linear tests, Aδ₀=1 and Aδ₁=1+T follow coefficientwise from coeff_amiceTransform, dirac_apply and mahler_natCast_eq. The Dirac formula for ψ then gives psiSeries(1)=1 and psiSeries(1+T)=0. The psi-series-phi theorem gives psiSeries((1+T)^p)=1+T.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### Psi and the Amice transform

`PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining` — `AbstractMeasure.psiSeries_amiceTransform` (comparison).

psiSeries(Aμ)=A(ψμ).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof/construction:

1. Expand transport and cancel A⁻¹A using the linear equivalence.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Acceptance: On δ_p both sides equal 1+T.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The power-series left inverse

`PadicMeasuresIwasawaAlgebras:L2/psi-series-phi` — `AbstractMeasure.psiSeries_phi` (theorem).

psiSeries(PowerSeries.subst b F)=F for every F∈B.

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof/construction:

1. Write F=Aμ using the integral equivalence. Replace subst b Aμ by Aφμ using amice-phi; then use psi-series-intertwining and psi-phi.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/amice-phi`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/psi-phi`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

Acceptance: At F=1+T and p=2, psiSeries((1+T)^2)=1+T.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

### The Amice unit projector

`PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction` — `AbstractMeasure.amiceTransform_unitRestriction` (comparison).

A(Eμ)=Aμ−PowerSeries.subst b (psiSeries(Aμ)).

Hypotheses and conventions: p is any prime, including 2; Z=ℤ_p, B=Z⟦T⟧, b=(1+T)^p−1. A is the pinned integral Z-linear Amice equivalence. Formal substitution at b has zero constant term; no analytic evaluation or field-coefficient inverse is asserted.

Proof/construction:

1. E=id−P and phi-psi give Eμ=μ−φψμ. Apply the linear Amice transform, then amice-phi and psi-series-intertwining.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L2/unit-restriction`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi`, `PadicMeasuresIwasawaAlgebras:L2/amice-phi`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `mathlib:AbstractMeasure.amiceTransform`.

Acceptance: For μ=δ₁ the correction term is zero; for μ=δ₀ it removes all of Aμ.

Source: Rodrigues Jacinto–Williams, §3.5.5, printed p.128 / PDF29; arXiv v2 PDF21, with the pZ_p restriction from §3.5.3, printed p.127 / PDF28. Worker decomposition of the cited integral bounded-operator argument using the pinned continuous dual. The normed-commutative-ring generality of measure operations follows from the displayed precomposition and weighting construction; the source treats integral p-adic coefficient rings.

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

**PadicMeasuresIwasawaAlgebras/E4** (misprint; affects the proof), §3.5.5, calculation proving ψ∘φ=id, penultimate integral; published printed p.128 / PDF29, also arXiv v2 PDF21. The printed measure label is ϕ(µ). After replacing the integration variable by px, label the intermediate integral with μ: ∫ 1_(pZ_p)(px) f(x) · μ. The displayed conclusion ψφ=id is unchanged. The defining pushforward formula is φμ(g)=μ(g∘m_p). For p=3, μ=δ₁ and f=x, the printed intermediate integral against φμ evaluates to 3 while both outside terms evaluate to 1. This is visible in the rendered publication, so it is not an extraction artifact. The corrected proof is node psi-phi.

The publication and v2 display were collated on 27 September 2026, including a rendered check of the publication. A bounded search of the version listing, exact-title correction queries and the two authors’ publication entries found no correction to this display. The journal HTML route was unavailable in this continuation. The input register’s 17 PMIA/Coleman/Dirichlet records did not contain it. The marker “new” means no identified published correction, without a priority claim.

## Remaining layers and ownership

### PadicMeasuresIwasawaAlgebras:L0 — not_read

- Decompose the bounded profinite measure theory using existing AbstractMeasure, clopen approximations and dense extension. Read the coefficient/lattice sources; construct integral lattices and scalar extension with value-group hypotheses, norm and weak topologies, and the exact comparison maps.

### PadicMeasuresIwasawaAlgebras:L0a — not_read

- Read and decompose the continuous character functor and its parameter spaces using the existing partial ℤ_p-character library. Keep family distribution actions at LocallyAnalyticDistributions:L4 under accepted RS-16; do not add a reverse prerequisite.

### PadicMeasuresIwasawaAlgebras:L1 — not_read

- Read and decompose joint adic/finite-group completed group algebras, bounded-measure comparison and convolution. Import the ℤ_p completed group algebra from ProfiniteProPGroups:Layer9 rather than rebuilding it. Resolve the RS-16 topology gate: finite-quotient kernels ((1+T)^(p^n)−1), with p-power coefficient reduction, are not the pure T-adic kernels.

### PadicMeasuresIwasawaAlgebras:L2 — partial

- Extend the integral ℤ_p Amice equivalence to the actual bounded-series carriers for general coefficient rings or fields, with integral lattice, coefficient, norm and weak-topology comparisons; do not assert surjectivity onto all field-valued formal series.
- Construct the generic clopen-subtype restriction/extension comparison in L0 and its precise comparison with the ambient pZ_p/unit projectors supplied here. Decompose multiplication by z^x with genuine convergence hypotheses, unit dilations, inverse weighting on units and their operator relations.
- Prove the coefficient-extension and root-of-unity averaging formulas in §3.5.3–5, with convergence and descent explicit. ColemanPowerSeries:L1 owns comparison with the finite-free normalized trace; locally analytic and period-ring recipients own their respective comparisons. This packet supplies bounded references without reverse dependencies.
- Import completed-algebra/procyclic coordinates from L1 and ProfiniteProPGroups Layer9 and compare them with the pinned Amice equivalence. Preserve the joint adic/finite-quotient topology gate; finite-group kernels are ((1+T)^(p^n)−1), with coefficient reduction, not pure T-adic kernels.

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

L2 has six proposed planets: Weighted measures, Mahler derivation, Ordinary moments
of the Amice transform, Frobenius on measures, Left inverse of Frobenius and
Restriction to units. L3 retains its four planets: Pseudomeasures, Cleared numerator,
Admissible evaluation and Independence of clearing factor. Adding L2 planets
requires a justified sub-layer proposal; the layer is already at its limit.

The packet contains 54 nodes, 60 API entries and 41 definition/construction tests.
The suggested file also has ten additional comparison or boundary examples, for
51 typed examples in total. All implementation statuses remain unchecked;
signature elaboration does not implement the roadmap.

## Sources and scope of reading

- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), no. 1, 101–216; DOI 10.2140/ent.2025.4.101. PDF 30–32, printed 129–131: Corollary 3.32, Remark 3.33, §3.6, Definition 3.34, equation (3-11), Remark 3.35, Lemma 3.36 and its proof, Definition 3.37, Lemma 3.38 and its proof. PDF 33: Remark 3.39 and surrounding locally analytic context were also read to check evaluation inside the open unit disc. This is not an all-paper reading. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`; accessed 2026-09-26.
- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), arXiv:2309.15692v2, 19 December 2024. PDF 21–23, including §3.6, Definitions 3.34/3.37, Remarks 3.33/3.35, Lemmas 3.36/3.38 with proofs, collated against the published passage. SHA-256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`; accessed 2026-09-26.

The preceding continuation additionally read and collated published PDF 26–28 (printed 125–127), especially
§3.5.1–2, Lemma 3.29 and Corollary 3.30, and PDF 37–38 (printed 136–137), Lemma 4.3 and its
use in Proposition 4.6; the matching v2 passages are PDF 19–20 and 27. The three inherited source
findings are retained without changes. The present continuation adds E4.

Pinned library statements were read in the exact files and line ranges listed in the packet; names alone were not treated as evidence.

The present continuation read the publication’s printed pp.126–129 / PDF27–30 in
full and collated v2 PDF20–21 for restriction and phi/psi, on 27 September 2026.
The SHA-256 digests above are unchanged. The larger reading ranges attributed to
preceding workers remain their provenance; this is not an all-paper reading claim.
The reviewed audit, all touching link entries and the accepted RS-16 bounded
operator ownership and topology gate were rechecked before constructing these nodes.
