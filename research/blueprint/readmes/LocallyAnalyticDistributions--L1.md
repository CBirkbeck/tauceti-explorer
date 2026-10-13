# Locally analytic distributions — L1

This part plans **Amice’s unbounded transform** and the analytic operations that use it. It continues the [parent packet](../packets/LocallyAnalyticDistributions.json), whose accepted L1 declarations retain their identifiers and ownership. The new [part packet](../packets/LocallyAnalyticDistributions--L1.json) supplies 19 necessary definitions, constructions, comparisons and key estimates. A target already in the parent is imported, rather than assigned another copy of its node.

The planning pass is complete and L1 is **planned**, with implementation unchecked. Two recorded gaps concern native analytic carriers and the precise L0 topology interface. They do not become assumptions hidden in an ersatz distribution structure. In particular, the topology of the locally constant kernel is an explicit supplier request; general compact-type functional analysis remains in L0. The [suggested Lean file](../suggested/LocallyAnalyticDistributions--L1.lean) has 128 lines and elaborates at the pins with only its intended theorem-placeholder warnings. It states native scalar milestones and light real-bodied definitions, following WORKERS.md’s 12 October 2026 shape. The global definitions, APIs and tests below are the definitive targets.

## Fields, radii and ownership

Fix a prime p, including p=2, and a finite extension K of Q_p. Use the absolute value extending |p|=p⁻¹. A torsion computation may take place in a **finite** extension L/K with its extending absolute value. This part does not infer a completed scalar-extension theorem for an arbitrary field containing C_p, and does not claim arbitrary affinoid coefficients.

A norm radius r is a positive real number. A series Σa_n(T−a)^n on a closed disc of norm radius r satisfies |a_n|rⁿ→0. Colmez’s valuation radius u corresponds to r=p⁻ᵘ. This conversion matters in the transform estimates: increasing h decreases u_h and increases the corresponding norm radius towards one.

The Mathlib pin is 082e2d37e8b0463410cdb532e111cd43d5a66174 and the Tau Ceti pin is f790474821cf4256814db967cb154e7af3d0c369. Native `PowerSeries`, `IsRestricted`, `gaussNorm`, `derivative` and `log` already supply the coefficient objects. The real Gauss supremum is used only after coefficient boundedness is established; a conditional real supremum on an unbounded coefficient family is not a norm. Native `AbstractMeasure.amiceTransform` is a bounded-measure transform on continuous tests, and does not define the locally analytic strong dual.

The imported L0 objects are `LA_h`, its inductive-limit space `LA`, and its strong dual `D`. In `LA_h`, use residue discs a+pʰZ_p and normalized coordinate (x−a)/pʰ with their maximum Gauss norm. Write ‖μ‖_h for the norm of μ restricted to that Banach stage. L0 owns the factorial Mahler basis, the compact-type and strong-dual topology, chart pullbacks and general tensor results. L1 applies them to Z_p and does not replan their general theory.

`PadicMeasuresIwasawaAlgebras:L2` owns the bounded inverse Amice transform, integral weighting, φ, ψ, unit restriction and inverse weighting. It also owns the Mahler derivation ∂=(1+T)D_T. The formula below is used inline; it is not a competing definition. The current upstream `AdicSpaces` roadmap owns weighted Gauss/Tate geometry and general open-disc geometry. `ProfiniteArithmetic` supplies the surrounding profinite arithmetic direction. Neither upstream `OperatorTheory` nor the current Tau Ceti real/complex locally convex modules replace the nonarchimedean L0 interface.

The current upstream README and suggested files for AdicSpaces, ProfiniteArithmetic and OperatorTheory, and the current Tau Ceti sources, were checked alongside the reviewed audit and RS-16 ownership boundary. No ownership move or change to those read-only roadmaps is proposed.

## The inherited layer targets

The following are imports from the parent’s L1; the suffix in the first column completes `LocallyAnalyticDistributions:L1/`. Their full signatures remain in that packet. This part supplies the quantitative inputs and proof contracts listed in the sections below.

| Imported target | Exact role here |
| --- | --- |
| `amice-transform` | Rodrigues Jacinto–Williams Theorem 3.43, p. 25, and Colmez Theorem II.2.2, p. 30: D≅R⁺ as Fréchet spaces, with bounded agreement. |
| `distribution-pushforward` | For an analytic compact-manifold map f, f_*μ(g)=μ(g∘f); apply its continuous strong transpose on Z_p. |
| `distribution-multiply` | gμ(f)=μ(gf), with multiplication by a fixed locally analytic function continuous. |
| `distribution-convolution`, `amice-convolution` | On additive Z_p, (λ*μ)(f)=μ(y↦λ(x↦f(x+y))); transform becomes ordinary series multiplication. |
| `amice-dirac` | Aδ_a=(1+T)ᵃ. Natural Dirac masses span a dense subspace of D. |
| `amice-multiply-x` | A(xμ)=∂Aμ; this is coordinate multiplication, not the distribution derivative. |
| `amice-character-twist` | A(zˣμ)=Aμ(z(1+T)−1) when ‖z−1‖<1, using convergent analytic substitution. |
| `amice-ball-restriction` | A(1_(b+pᵐZ_p)μ)=p⁻ᵐΣ_(η^(pᵐ)=1)η⁻ᵇAμ(η(1+T)−1), with finite coefficient extension and descent. |
| `amice-derivative` | Positive transpose dμ(f)=μ(f′) gives A(dμ)=log(1+T)Aμ. |
| `amice-dilation` | A((x↦ax)_*μ)=Aμ((1+T)ᵃ−1), a∈Z_p. Unit dilation is σ_a and a=p gives φ. |
| `psi-unit-projector` | ψμ(f)=μ(1_(pZ_p)(x)f(x/p)); ψφ=1, φψ=restriction to pZ_p and 1−φψ=unit restriction. |
| `division-on-units` | Unique continuous coordinate division on unit-supported distributions; unrestricted ambiguity is Kδ_0. |
| `analytic-local-primitives` | Primitives exist on smaller balls and on LA; their function-side freedom is LC, not one global constant. |
| `derivative-nonsplitting`, `logarithm-extension-nonsplitting` | No continuous LA primitivation and no continuous splitting of R⁺→R⁺/log(1+T)R⁺. |
| `logarithm-apparent-poles` | For ν=dμ, the quotient Aν/log(1+T) extends as Aμ throughout the open disc. |
| `open-disc-native-radius`, `open-disc-summability`, `open-disc-uniform-tail`, `open-disc-evaluation-analytic`, `open-disc-evaluation-mul`, `open-disc-evaluation-map` | Native scalar analytic evaluation and radius adapters, used within their open-disc domains. |
| `distribution-operations` | The composite toolbox target, supported here by actual continuity and substitution estimates. |
| `division-by-x-and-primitives` | The division/negative-moment portions are supplied below. Its Cʳ primitive and closure-of-LC clause is imported from L2 and is not a claim about the analytic kernel. |

The consuming stage edges are ColemanIntegration:L0, DirichletPadicLFunctions:L3, LocallyAnalyticDistributions:L2 and PadicHodgeRegulators:L3. Coleman continuation and integration normalization, Cʳ growth spaces, and regulators remain with those owners. L1 supplies only the elementary locally analytic input and its correct support/radius conditions.

## Amice’s theorem and the operation dictionary

For f(x)=Σa_n(f)binomial(x,n) and μ∈D, define Aμ(T)=Σμ(binomial(x,n))Tⁿ. Put d_h(n)=⌊n/pʰ⌋! and u_h=1/((p−1)pʰ). L0’s orthonormal basis is d_h(n)binomial(x,n), so its Banach dual corresponds to **bounded** normalized values d_h(n)b_n. The test coefficients a_n(f)/d_h(n) tend to zero. A Banach dual is not required to be a c₀ family.

For F∈R⁺, a strict interior valuation radius s<u_h and the factorial asymptotic v_p(d_h(n))=nu_h−O(log(n+1)) establish boundedness of d_h(n)b_n. The pairing Σa_n(f)b_n then defines the inverse distribution. Its values on every Mahler polynomial identify it uniquely. Colmez’s inequalities are

v_(p^(-u_h))(Aμ) ≥ v_h(μ) ≥ v_(p^(-u_(h+1)))(Aμ)−1.

Here v_h(μ)=−log_p‖μ‖_h, and the Gauss valuation is inf_n(v_p(b_n)+nu). Zero is assigned +∞. These inequalities compare cofinal seminorm families and prove continuity in both directions. The lower uniform bound by itself does not prove coefficient divergence; the strict interior radius supplies that step. The parent theorem and its quantitative estimates are imported, and the inverse construction’s API below records how to use them.

The inverse of F=1 is δ_0. The inverse of F=T is δ_1−δ_0. The inverse of F=log(1+T) is f↦f′(0). The latter is a distribution but cannot be a bounded measure: at indices n=pᵐ, its coefficient norm is pᵐ. Conversely Σp⁻ⁿTⁿ has radius p⁻¹ and is not an Amice transform of a distribution on all LA.

Keep these three derivatives separate:

| Operation | Transform/result | Freedom or obstruction |
| --- | --- | --- |
| Coordinate multiplication xμ | ∂Aμ=(1+T)D_TAμ | Division has ambiguity Kδ_0; unit support selects a unique solution. |
| Function differentiation f↦f′ | LA→LA, kernel LC | Local primitives exist; a continuous global linear section does not. |
| Positive distribution transpose dμ | log(1+T)Aμ | Injective with a proper closed range; a general distribution has no d-primitive. |

For example, x(dδ_0)=δ_0, whereas dδ_0 itself has transform log(1+T). Ordinary T-integration on R⁺ is a continuous operation after input radius loss. This fact does not give a section of function differentiation and does not make multiplication by log(1+T) surjective.

## Imported constructors: API and tests

These APIs belong to the parent. They are restated here as reader contracts, without creating duplicate packet nodes or native substitute carriers.

**Pushforward.** `distributionPushforward` takes an analytic compact-manifold map and transposes its continuous pullback; `distributionPushforward_apply` evaluates it as μ(g∘f); `distributionPushforward_comp` gives (g∘f)_*=g_*f_*. Its tests are identity pushforward, zero distribution, and a constant map with value y giving μ(1)δ_y. These distinguish the true transpose from merely relocating atoms. On Z_p, also check δ_a↦δ_(pa) under φ.

**Multiplication.** `distributionMultiply` uses a fixed g∈LA; `distributionMultiply_apply` gives μ(gf); `distributionMultiply_assoc` gives (g₁g₂)μ=g₁(g₂μ). Check 1μ=μ, gδ_x=g(x)δ_x, and equality with bounded-measure weighting wherever the bounded input and analytic multiplier overlap. A clopen mask gives restriction; the unit mask kills δ_0.

**Convolution.** `distributionConvolution`, `distributionConvolution_apply`, and `distributionConvolution_assoc` use iterated analytic evaluation and the group multiplication map. On additive Z_p check δ_a*δ_b=δ_(a+b), δ_0*μ=μ and equality with bounded-measure convolution. These are the parent’s group-general APIs specialized to the additive identity zero. The new Banach estimate below verifies intermediate analyticity and joint continuity; a formal double integral without that check is not a construction.

Source locators for these imports are Colmez §II.4.1–II.4.6, pp. 34–37, with Lemma II.4.2 and its proof on pp. 36–37 providing the analytic intermediate evaluation.

## New target contracts

Each identifier below completes `LocallyAnalyticDistributions:L1/`. Names in an API have prefix `TauCeti.AnalyticDistributions.`. Names in Check lists have prefix `L1Tests.` and are intended future theorem/test names. A Check whose carrier is absent at the pins is stated here, rather than simulated with a supplied conclusion-shaped predicate in Lean.

### 1. The open-disc Frechet algebra

**Node:** `open-disc-frechet-carrier` (definition).

Define R+(K) as the subalgebra of native PowerSeries K with IsRestricted r F for every real 0<r<1. Equip it with the topology generated by q_r, not the coefficient product topology or the radius-one norm. It is a complete Hausdorff metrizable locally convex K-algebra; every cofinal increasing sequence of radii tending to one gives the same topology. Polynomials are dense.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Take the intersection of native restricted subrings; each coefficient projection is bounded by r^(-n)q_r.
2. Realize this topological algebra as the compatible inverse limit of weighted Gauss c0 Banach algebras on a cofinal countable set of radii; completeness is coordinatewise completeness plus Gauss convergence. These Banach carriers are imported from L0.
3. Truncation converges in every q_r by restrictedness. No identity with all analytic point functions or new rigid disc geometry is needed.

**Direct inputs:** `LocallyAnalyticDistributions:L0/disc-analytic-functions`, `mathlib:PowerSeries.IsRestricted`, `mathlib:PowerSeries.gaussNorm`, `mathlib:PowerSeries.HasGaussNorm`.

**Uses:** LocallyAnalyticDistributions:L1/amice-transform: Exact target and topology for unbounded Amice. LocallyAnalyticDistributions:L3: Unbounded scalar Mellin evaluation without rebuilding rigid geometry.

**API.**

| Declaration | Contract |
| --- | --- |
| `openDiscSeries` | Native restricted-power-series subalgebra with the Gauss Frechet topology. |
| `openDiscMem` | Membership iff ∀0<r<1, IsRestricted r F. |
| `openDiscSeries_coeff` | Coefficient projections are continuous and bounded by r^(-n)q_r. |
| `openDiscSeries_complete` | The Gauss topology is complete; it is not the ambient coefficient topology. |

**Checks.**

- `geometric_open` (example): Σ_(n≥0)T^n lies in R+; it is not restricted at r=1.
- `shrinking_radius_counter` (non-example): Σ_(n≥0)p^(-n)T^n does not lie in R+.
- `log_unbounded` (compatibility): Native PowerSeries.log K lies in R+ but has unbounded coefficients, witnessed by n=p^m.
- `monomial_topology` (characterisation): q_r(T^n)=r^n for every 0<r<1, hence T^n→0 in R+.

**Acceptance:** The geometric series belongs to R+ but is not restricted at radius one. Convergence of T^n to zero in each q_r is compatible with dense polynomials; it gives no uniform radius-one convergence.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.1, p. 29; Theorem II.2.2, p. 30. Open-disc coefficient growth and the Frechet Gauss topology; the inverse-limit adapter is worker planning.

### 2. Unbounded inverse Amice pairing

**Node:** `inverse-amice-stage-pairing` (construction).

For F=Σb_nT^n∈R+, construct μ_F(f)=Σa_n(f)b_n on LA(Z_p,K). At stage h, put d_h(n)=floor(n/p^h)! and c_n=a_n(f)/d_h(n); c_n→0. The values d_h(n)b_n are bounded, so the pairing is summable and |μ_F(f)|≤sup_n|d_h(n)b_n| ||f||_h. The maps agree on nested stages and μ_F(binomial(x,n))=b_n. Conversely any distribution is determined by these values.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Import Amice’s orthonormal basis d_h(n)binomial(x,n) from L0. Its dual is bounded coefficient families, not c0.
2. For every h choose valuation radius s with 0<s<u_h, u_h=1/((p-1)p^h). Since v_p(d_h(n))=n u_h−O(log(n+1)), the Gauss bound at p^(-s) gives v_p(d_h(n)b_n)→+∞; boundedness already suffices for the dual pairing.
3. The normalized test coefficients tend to zero, so their products with bounded dual values tend to zero. Complete ultrametric summability, uniqueness of Mahler coefficients and density of polynomials give compatibility and both inverse identities.
4. For an arbitrary distribution, the basis dual bound gives |b_n|≤||μ||_H/|d_H(n)|. For each 0<r<1 choose H with r<p^(-u_H); exponential radius decay dominates the factorial logarithmic error and gives native IsRestricted r. The inherited norm inequalities then compare cofinal Gauss radii and stage dual norms.

**Direct inputs:** `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `LocallyAnalyticDistributions:L0/amice-mahler-basis`, `LocallyAnalyticDistributions:L0/locally-analytic-distributions`, `mathlib:NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`.

**Uses:** LocallyAnalyticDistributions:L1/amice-transform: Supplies the inverse map and its radius-dependent norm estimates. LocallyAnalyticDistributions:L2: Distinguishes arbitrary distributions from bounded-coefficient measures.

**API.**

| Declaration | Contract |
| --- | --- |
| `inverseAmice` | The compatible continuous Mahler pairing on LA. |
| `inverseAmice_apply` | Evaluation is the summable Mahler coefficient pairing. |
| `inverseAmice_mahler` | Its nth Mahler value is coeff n F. |
| `inverseAmice_unique` | A distribution with the same Mahler values is equal to inverseAmice F. |
| `inverseAmice_radius` | With u_h=1/((p−1)p^h), the imported Amice inequalities v_(p^(-u_h))(Aμ)≥v_h(μ)≥v_(p^(-u_(h+1)))(Aμ)−1 give continuity of the pairing inverse and forward transform. These are the inherited theorem’s estimates, not a second theorem. |

**Checks.**

- `inverse_constant` (computation): F=1 gives δ_0, since only a_0(f)=f(0) contributes.
- `inverse_linear` (computation): F=T gives δ_1−δ_0, not differentiation at zero.
- `inverse_log` (compatibility): F=log(1+T) gives f↦f′(0), using the positive transpose convention.
- `inverse_bounded` (compatibility): For bounded (b_n), μ_F is the inclusion of the PMIA bounded inverse transform.

**Acceptance:** A normalized basis vector has pairing d_h(n)b_n. The forward transform of μ_F equals F coefficientwise.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Theorem I.4.7/Corollary I.4.8, p. 15; Theorem II.2.2 and proof, p. 30. Factorial normalization and the inverse pairing; the strict interior radius explains boundedness without imposing a false c0 condition on every Banach dual.

### 3. Topology of the bounded-measure inclusion

**Node:** `bounded-inclusion-topology` (comparison). Named declaration: `boundedMeasureInclusion_continuous_dense`.

The canonical inclusion ι:M(Z_p,K)→D(Z_p,K) from bounded measures, equipped with their continuous-test Banach-dual norm, is continuous and injective, with ||ιμ||_h≤||μ|| for every h. Its image consists precisely of bounded Amice coefficient sequences, is dense in D for its strong Frechet topology, and is not closed. The coefficient square with native AbstractMeasure.amiceTransform commutes. This uses the inherited unbounded Amice isomorphism and the existing bounded inverse; it does not define a second bounded transform or replan the isomorphism.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. The norm-decreasing restriction LA_h→C(Z_p,K) gives the displayed transpose estimate. A zero restriction makes every Mahler value zero; native injective_amiceTransform then gives the zero bounded measure, proving injectivity without a new continuous-function Mahler theorem.
2. Native coeff_amiceTransform and the inherited distribution coefficient formula agree on every Mahler test. The PMIA bounded inverse identifies bounded coefficients with precisely the bounded-measure image; for finite K this is O_K[[T]]⊗_(O_K)K.
3. The inherited amice-dirac result and Gauss density of polynomials make the span of natural Dirac measures dense in D. Native log lies in R+ with unbounded coefficients, so the bounded image is proper and hence not closed. The Gauss/dual norm equivalence comes from the imported Amice theorem, not a new declaration.

**Direct inputs:** `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L1/amice-dirac`, `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `PadicMeasuresIwasawaAlgebras:L2/bounded-inverse-amice`, `mathlib:AbstractMeasure.amiceTransform`, `mathlib:AbstractMeasure.coeff_amiceTransform`, `mathlib:AbstractMeasure.injective_amiceTransform`.

**Acceptance:** Aδ_0=1 and Aδ_1=1+T give genuine bounded-measure points of the inclusion. dδ_0 transforms to log(1+T), outside the inclusion although in its closure. The norm topology of bounded measures is not identified with the Frechet topology on the whole distribution space.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.1, p. 29; Theorem II.2.2, p. 30; §II.4.1, p. 34. Bounded coefficient subspace, unbounded transform and density of natural Dirac masses. The inclusion norm estimate and nonclosed-image conclusion are worker deductions.

### 4. Analytic affine substitution

**Node:** `analytic-affine-substitution` (construction).

For F=Σb_nT^n∈R+, a,b∈K with |a|<1 and |b|≤1, define C_(a,b)(F)=Σ_n b_n(a+bT)^n by convergence in every smaller Gauss algebra. Its kth coefficient is Σ_(n≥k)b_n binomial(n,k)a^(n-k)b^k. For 0<r<1 and max(|a|,|b|r)<s<1, q_r(C_(a,b)F)≤q_s(F). This is a continuous K-algebra homomorphism R+→R+; evaluation is E(CF,t)=E(F,a+bt) when |t|<1. It coincides with native formal substitution when a=0, and polynomial substitution for polynomials.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Choose the strict intermediate s. The nth summand has q_r norm at most |b_n|s^n (max(|a|,|b|r)/s)^n; complete ultrametric Gauss convergence constructs the series.
2. Pass coefficient projections and native analytic evaluation through this convergent sum; polynomial identities pass by dense truncations.
3. The displayed norm inequality proves continuity. Nonzero a is handled by the infinite convergent sum, never by an unsupported formal HasSubst.

**Direct inputs:** `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `LocallyAnalyticDistributions:L1/open-disc-uniform-tail`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-analytic`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-mul`.

**Uses:** LocallyAnalyticDistributions:L1/amice-character-twist: Gives actual meaning to F(z(1+T)−1). LocallyAnalyticDistributions:L1/amice-ball-restriction: Allows each finite torsion translate before averaging.

**API.**

| Declaration | Contract |
| --- | --- |
| `analyticAffineSubstitution` | Convergent Gauss-algebra affine substitution. |
| `analyticAffineSubstitution_coeff` | The coefficient is the convergent binomial coefficient sum. |
| `analyticAffineSubstitution_eval` | Analytic evaluation equals E(F,a+bt) on the open disc. |
| `analyticAffineSubstitution_continuous` | q_r(CF)≤q_s(F) for the specified intermediate radius. |

**Checks.**

- `affine_identity` (degenerate): C_(0,1)(F)=F.
- `affine_constant` (computation): C_(a,0)(F) is the constant E(F,a).
- `affine_polynomial` (compatibility): C_(a,b)(T^2)=a^2+2abT+b^2T^2.
- `affine_geometric` (computation): C_(a,1)(ΣT^n) has constant term (1−a)^(-1) and kth coefficient (1−a)^(-(k+1)); coefficients receive infinitely many outer terms.

**Acceptance:** For character twist use a=z−1,b=z with |z−1|<1; then |z|=1 and all stated domains hold. No map is asserted if |a|=1.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.3 and Proposition II.4.1, p. 35. The character-twist and restriction substitutions; the general affine Gauss bound is a worker deduction supplying their convergence.

### 5. Finite coefficient extension and descent

**Node:** `finite-coefficient-descent` (comparison). Named declaration: `finiteCoefficientDescent`.

For a finite extension L/K, scalar extension gives D(Z_p,L)≅L⊗_K D(Z_p,K) and R+(L)≅L⊗_K R+(K) as topological L-vector spaces, with Amice commuting with coefficient inclusion. These are finite-dimensional coefficient comparisons using a finite K-basis of L, not arbitrary completed tensor identities. If L/K is Galois, an element with invariant coefficients descends uniquely to K. Thus the finite root averages in inherited ball restriction descend to K even when individual roots are not in K.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Use a finite K-basis and equivalence of the coefficient norms to compare each LA_h(L) with a finite product of LA_h(K); L0 owns the scalar stage comparison.
2. Taking continuous duals and finite products gives the distribution comparison. The same finite-basis bounds compare all Gauss seminorms on R+.
3. The Amice coefficient equality gives compatibility; Galois permutes the roots and corresponding character terms, making the average invariant. Descent is coefficientwise with the same radius bounds.

**Direct inputs:** `LocallyAnalyticDistributions:L0/disc-analytic-functions`, `LocallyAnalyticDistributions:L0/locally-analytic-radius`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`, `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `LocallyAnalyticDistributions:L1/inverse-amice-stage-pairing`, `LocallyAnalyticDistributions:L1/analytic-affine-substitution`.

**Acceptance:** For L=K all maps are identity. At n=0 the restriction average consists only of F and requires no extension. For a rational Dirac distribution the root average has K-coefficients and equals either its transform or zero.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Corollary I.4.6, p. 15; Proposition II.4.1, p. 35. Finite coefficient extension of analytic stages and the restriction formula; dual and Galois adapters are worker deductions.

### 6. Differentiation and dilation on the open disc

**Node:** `derivative-gauss-control` (theorem). Named declaration: `derivative_gauss_control`.

For F∈R+ and 0<r<1, D_TF and ∂F lie in R+ and q_r(D_TF)≤r^(-1)q_r(F), q_r(∂F)≤r^(-1)q_r(F). Both are continuous. For a∈Z_p, U_a(T)=(1+T)^a−1 has zero constant and q_r(U_a)≤r, so native formal substitution F(U_a) belongs to R+ and q_r(F(U_a))≤q_r(F). For a=p, q_r(U_p)≤max(p^(-1)r,r^p). The inherited dilation transform and PMIA Mahler derivation are used without redefining either.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Native coefficient differentiation and |n|≤1 give the derivative bound and restricted tail decay. Since q_r(1+T)=1, multiplication gives the ∂ estimate.
2. Integral binomial coefficients of a∈Z_p give U_a’s norm and zero constant. Summation of b_n U_a^n converges in the radius-r Gauss algebra, agreeing with native formal substitution.
3. For U_p use p divisibility of the intermediate binomial coefficients and retain the leading T^p coefficient.

**Direct inputs:** `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `mathlib:PowerSeries.derivative`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:Padic.norm_int_le_one`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation`, `LocallyAnalyticDistributions:L1/amice-dilation`.

**Acceptance:** a=0 gives F(U_0)=F(0), not F. For a=1 the substitution is the identity. ∂T=1+T, whereas D_TT=1.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.2 and §II.4.4–II.4.5, pp. 34–36. Coordinate differentiation and dilation identities; these quantitative Gauss bounds are worker deductions.

### 7. Normalized primitive on the open disc

**Node:** `normalized-series-primitive` (construction).

Define normalizedSeriesPrimitive F by constant coefficient zero and coefficient n+1 equal to b_n/(n+1). For F∈R+ it lies in R+ and D_T(IF)=F. For 0<r<s<1, q_r(IF)≤r(1−r/s)^(-2)q_s(F), so I:R+→R+ is continuous. Among R+ series it is the unique primitive with zero constant; all ordinary T-primitives differ by a K-constant.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. The real-bodied definition uses native PowerSeries.mk and division in the coefficient field.
2. In normalized p-adic norm, |1/(n+1)|≤n+1. Let ρ=r/s: each weighted integrated coefficient is at most r q_s(F)(n+1)ρ^n, and sup_n(n+1)ρ^n≤(1−ρ)^(-2). Using a still larger radius proves tail decay.
3. Native coeff_derivative proves the inverse equation, while derivative.ext supplies uniqueness. These Gauss bounds depend on a larger input radius.

**Direct inputs:** `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.derivative`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:PowerSeries.derivative.ext`.

**Uses:** LocallyAnalyticDistributions:L1/division-on-units: Provides existence of a ∂-primitive before selecting its support. LocallyAnalyticDistributions:L1/local-ball-primitive-map: The same coefficient estimate works in a normalized ball coordinate.

**API.**

| Declaration | Contract |
| --- | --- |
| `normalizedSeriesPrimitive` | Zero-constant coefficientwise primitive on native PowerSeries K. |
| `normalizedSeriesPrimitive_derivative` | D_T(IF)=F. |
| `normalizedSeriesPrimitive_radius` | The stated r<s Gauss estimate and R+ membership. |
| `normalizedSeriesPrimitive_unique` | D_TG=F and G(0)=0 imply G=IF. |

**Checks.**

- `primitive_one` (computation): I(1)=T.
- `primitive_linear_two` (computation): At p=2, coefficient 2 of I(T) is 1/2, not zero or one.
- `primitive_geometric` (compatibility): I(ΣT^n)=−log(1−T) coefficientwise, belonging to R+.
- `primitive_zero_normalization` (degenerate): I(0)=0; a nonzero constant is not the normalized primitive of zero.

**Acceptance:** I(1)=T and I(T)=T^2/2, including p=2. This is ordinary T-integration, not function-side d_x primitivation.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.2, p. 35. Power-series primitives used for division by x; the explicit radius-loss estimate and normalization are worker deductions.

### 8. Hasse differentiation in an analytic stage

**Node:** `hasse-stage-estimate` (theorem). Named declaration: `hasseStageEstimate`.

For f∈LA_h, ||p^(hj) f^(j)/j!||_h≤||f||_h for every j≥0, and these normalized Hasse derivatives tend to zero in LA_h as j→∞. In particular ||d_x f||_h≤p^h||f||_h, and d_x:LA→LA is continuous. The estimate is stated on test functions; its transpose is bounded with ||dμ||_h≤p^h||μ||_h.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. In residue-disc coordinate u=(x-a)/p^h, Hasse differentiation multiplies the shifted coefficients by integral binomial coefficients.
2. The supremum of coefficients with index at least j tends to zero, proving the asserted decay without dividing norm inequalities by a small factorial.
3. Apply the LF universal continuity property to the fixed-stage maps and transpose with the L0 strong-dual bounded-set interface.

**Direct inputs:** `LocallyAnalyticDistributions:L0/disc-analytic-functions`, `LocallyAnalyticDistributions:L0/locally-analytic-radius`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Acceptance:** j=0 recovers f with its exact norm. For f(x)=x, d_x f=1; there is no negative transpose sign. A locally constant indicator has derivative zero in any stage resolving its conductor.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Lemma II.4.2 and proof, p. 36. The Hasse estimates used to make convolution’s intermediate evaluation analytic.

### 9. Convolution continuity on Z_p

**Node:** `convolution-banach-control` (theorem). Named declaration: `convolutionStageEstimate`.

For f∈LA_h and λ∈D, y↦λ(x↦f(x+y)) is in LA_h with norm at most ||λ||_h ||f||_h. Consequently ||λ*μ||_h≤||λ||_h||μ||_h, and convolution on D(Z_p,K) is jointly continuous in its strong Frechet topology. Under inherited Amice it is multiplication on R+. This specializes the inherited general compact-group construction; no product tensor space is replanned.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Expand f(x+y) in each residue pair of normalized coordinates; translating by integral residue representatives does not increase the Gauss norm.
2. Use the Hasse stage estimates to expand the intermediate λ evaluation into a convergent normalized power series in y; applying the Banach dual bound gives the inequality.
3. Apply μ to that analytic test. The family of dual seminorm inequalities proves joint continuity, and evaluate characters to obtain the inherited convolution transform.

**Direct inputs:** `LocallyAnalyticDistributions:L1/hasse-stage-estimate`, `LocallyAnalyticDistributions:L1/distribution-convolution`, `LocallyAnalyticDistributions:L1/amice-convolution`, `LocallyAnalyticDistributions:L0/locally-analytic-distributions`.

**Acceptance:** δ_a*δ_b=δ_(a+b); δ_0 is the additive unit. For dδ_0*dδ_0 the transform is log(1+T)^2, which is outside the bounded-measure subcase.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Lemma II.4.2 and Proposition II.4.3, p. 36. Analytic intermediate evaluation and multiplication of transforms; the stage inequalities are read from that proof.

### 10. Restriction, twist, dilation and psi continuity

**Node:** `operator-stage-control` (theorem). Named declaration: `distributionOperatorStageControl`.

For g,f∈LA_h, ||gf||_h≤||g||_h||f||_h and ||gμ||_h≤||g||_h||μ||_h. For U=b+p^nZ_p, restriction is multiplication by 1_U and has dual norm ≤1 at every h≥n. For z with |z−1|<1, choose h with z^x∈LA_h; multiplication by this fixed character is continuous on LA and D, and transforms through analyticAffineSubstitution_(z−1,z). Unit dilation σ_a is a stage isometry. For φ from x↦px, ||φμ||_h≤||μ||_h. The masked pullback Qf(x)=1_(pZ_p)(x)f(x/p) satisfies ||Qf||_(h+1)=||f||_h, hence ||ψμ||_h≤||μ||_(h+1). All these transposes are continuous for the strong topology; the inherited psi-projector identities therefore hold as continuous identities.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Multiplication and resolved clopen masks obey coefficient Gauss bounds. Use a common finer stage when the multiplier is not in the test stage. A continuous linear test operator sends bounded sets to bounded sets, which controls its strong transpose.
2. For characters, the Mahler series gives membership at an admitted radius; analytic-affine-substitution proves the transform formula. Pullback by a unit permutes normalized discs and acts by an integral invertible affine coordinate.
3. For dilation use the norm-decreasing affine chart map. For Q use the exact normalized chart identity of Colmez I.6.1; its zero extension is valid because pZ_p is clopen. Evaluate ψφ and φψ on analytic tests, importing their inherited definitions.

**Direct inputs:** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/distribution-pushforward`, `LocallyAnalyticDistributions:L1/analytic-affine-substitution`, `LocallyAnalyticDistributions:L1/psi-unit-projector`, `LocallyAnalyticDistributions:L1/amice-character-twist`, `LocallyAnalyticDistributions:L1/amice-ball-restriction`, `LocallyAnalyticDistributions:L1/amice-dilation`, `LocallyAnalyticDistributions:L0/analytic-chart-pullback`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Acceptance:** ψδ_p=δ_1, ψδ_1=0, φδ_1=δ_p. The case μ=δ_0 satisfies φψμ=μ and is not unit supported. The ψ estimate changes h to h+1; no unsupported same-stage division-by-p bound is asserted.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Lemma I.6.1, p. 27; §II.4.2–II.4.5, pp. 34–36. Multiplier, clopen restriction, dilation and the exact radius shift for masked inverse dilation.

### 11. Locally analytic reciprocal on units

**Node:** `analytic-unit-inverse` (construction).

Let ι(x)=x^(-1) for x∈Z_p^× and ι(x)=0 for x∈pZ_p. This is in LA_1, with ||ι||_1≤1 and xι=1_(Z_p^×). Define Jμ=ιμ on unit-supported distributions. It is continuous on that closed subspace, supported on units, and xJμ=μ=J(xμ). Its underlying function is the inclusion into K of the PMIA extended PadicInt.inv, including zero on every nonunit.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. On a unit residue disc a+pZ_p expand (a+pu)^(-1)=a^(-1)Σ_(j≥0)(−p/a)^j u^j; its coefficients decay and are bounded by one. On pZ_p take zero.
2. Transpose this fixed analytic multiplier using inherited distribution-multiply and operator-stage-control.
3. The identity xι=unit indicator proves both inverse equations on the supported subspace. These two equations give uniqueness directly; on bounded inputs the same underlying reciprocal is the imported inverseWeight. The construction does not assume the inherited unit-division theorem that it supports.

**Direct inputs:** `LocallyAnalyticDistributions:L1/distribution-multiply`, `LocallyAnalyticDistributions:L1/operator-stage-control`, `PadicMeasuresIwasawaAlgebras:L2/inverse-weight`, `LocallyAnalyticDistributions:L0/disc-analytic-functions`.

**Uses:** LocallyAnalyticDistributions:L1/division-on-units: Unique supported solution of coordinate division. DirichletPadicLFunctions:L3: Negative moments on the unit domain without evaluating a pole.

**API.**

| Declaration | Contract |
| --- | --- |
| `analyticUnitInverse` | The zero-on-nonunits locally analytic reciprocal. |
| `analyticUnitInverse_mul_coordinate` | xι=1_(Z_p^×). |
| `unitDistributionDivision` | Multiply a unit-supported distribution by ι. |
| `unitDistributionDivision_inverse` | It inverts coordinate multiplication on unit-supported distributions. |
| `analyticUnitInverse_bounded` | Underlying continuous function agrees with the supplier PadicInt.inv. |

**Checks.**

- `unit_inverse_one` (computation): Jδ_1=δ_1.
- `unit_inverse_minus_one` (computation): Jδ_(−1)=−δ_(−1), including p=2.
- `unit_inverse_nonunit` (non-example): ι(0)=ι(p)=0; the extension is not the field reciprocal at p.
- `unit_inverse_bounded` (compatibility): On a unit-supported bounded measure J agrees with PMIA inverseWeight.

**Acceptance:** This does not provide x^(-1) at zero. For arbitrary μ, multiplying Jμ by x gives the unit restriction, not μ.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.2, p. 35. Support-sensitive division by x; the explicit unit-ball geometric expansion is the worker construction.

### 12. Coordinate division and its ambiguity

**Node:** `coordinate-division-ambiguity` (theorem). Named declaration: `coordinateDivision_kernel`.

Coordinate multiplication x:D→D is surjective, its kernel is exactly Kδ_0, and all solutions of xλ=μ differ by Kδ_0. In transform coordinates solve ∂G=F by G=I(F/(1+T))+c, where division by the formal unit 1+T preserves R+. For a unit-supported μ, the analytic-unit-inverse solution is the unique unit-supported one and agrees with inherited division-on-units.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. The geometric series for (1+T)^(-1) lies in R+; multiply F by it and use the normalized primitive.
2. Amice identifies coordinate multiplication with the supplier Mahler derivation, so its kernel consists of constants by native derivative.ext. Constants transform back to Kδ_0.
3. Alternatively decompose every test as f(x)=f(0)+xg(x) with g locally analytic, proving the kernel directly. Unit support excludes δ_0 and selects J.

**Direct inputs:** `LocallyAnalyticDistributions:L1/normalized-series-primitive`, `LocallyAnalyticDistributions:L1/amice-transform`, `LocallyAnalyticDistributions:L1/amice-multiply-x`, `LocallyAnalyticDistributions:L1/analytic-unit-inverse`, `mathlib:PowerSeries.derivative.ext`.

**Acceptance:** xδ_0=0. ∂log(1+T)=1, so a solution of xλ=δ_0 is λ=dδ_0; it is not unit supported. For δ_1 the support-selected solution is δ_1.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.2, p. 35. Division by x corresponds to a primitive and has Dirac-at-zero ambiguity.

### 13. Primitives on smaller balls

**Node:** `local-ball-primitive-map` (construction).

For a closed disc B(a,R) and a chosen strictly smaller concentric norm radius 0<r<R, define I_(a;R,r)(f) by coefficient integration with value zero at a. It is a continuous linear map from An(B(a,R),K) to An(B(a,r),K), satisfies d_x I(f)=f on the smaller disc, and ||I(f)||_r≤r(1−r/R)^(-2)||f||_R. In normalized residue coordinates u=(x-a)/p^h, a primitive on a smaller disc has an extra factor p^h. On LA_h choose primitives separately, normalized at each centre of residue discs modulo p^(h+1); this produces a continuous stage map LA_h→LA_(h+1). These maps are not asserted compatible as h varies.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Integrate coefficients in x-a, using the same p-adic reciprocal-integer and geometric-decay bound as the series primitive.
2. Restrict f from the original disc to a smaller disc around each new residue centre, then integrate in its normalized coordinate; the coordinate scaling gives the p^h factor where appropriate.
3. The finite clopen refinement patches these local primitives into LA_(h+1). If two primitives have equal derivative, their local analytic difference has no positive coefficients in characteristic zero, hence is locally constant. This supplies the inherited analytic-local-primitives theorem rather than assuming it.

**Direct inputs:** `LocallyAnalyticDistributions:L1/normalized-series-primitive`, `LocallyAnalyticDistributions:L0/disc-analytic-functions`, `LocallyAnalyticDistributions:L0/locally-analytic-radius`.

**Uses:** LocallyAnalyticDistributions:L1/derivative-nonsplitting: Supplies surjectivity but does not postulate a global continuous section. ColemanIntegration:L0: The elementary local analytic primitive input; path continuation and Coleman normalization remain with their owner.

**API.**

| Declaration | Contract |
| --- | --- |
| `ballPrimitive` | A radius-loss primitive normalized at the chosen centre. |
| `ballPrimitive_derivative` | Its derivative is f on the admitted smaller disc. |
| `ballPrimitive_norm` | The exact r<R estimate including the actual coordinate scale. |
| `stagePrimitive` | A finite-residue stage map LA_h→LA_(h+1), normalized separately on the finer discs. |
| `localPrimitive_difference` | Equal derivatives on LA imply that the difference lies in LC. |

**Checks.**

- `ball_primitive_constant` (computation): I_(a;R,r)(1)=x−a.
- `ball_primitive_scaled` (computation): For f=((x−a)/p^h)^j the normalized primitive is p^h((x−a)/p^h)^(j+1)/(j+1).
- `primitive_lc_freedom` (non-example): 0 and 1_(pZ_p) have the same derivative but do not differ by a global constant.
- `primitive_fixed_radius_fail` (non-example): The sparse series above has no primitive analytic on the original radius-one closed disc, since every primitive has the same nondecaying positive coefficients.

**Acceptance:** A primitive of 1 normalized at a is x−a. For f=0, another primitive may be 1_(pZ_p), which is not a global constant. Sparse f(T)=Σ_(m≥1)p^m T^(p^m−1) is restricted at radius one, but its zero-constant primitive has coefficient one at each p^m and is not restricted at radius one.

**Sources:** [KOHLHAASE-2011](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), Corollary 4.3, p. 21. Surjective function differentiation with locally constant kernel; the quantitative ball construction is a worker deduction.; [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §I.4.1–I.4.2, pp. 13–15. The Gauss disc and finite residue-stage carriers used in the construction.

### 14. The topology of locally constant functions

**Node:** `locally-constant-topology-input` (comparison). Named declaration: `locallyConstant_inductiveTopology`.

For finite K, LC=ker(d_x:LA→LA) with its induced topology is the strict locally convex inductive limit of LC_h≅K^(Z_p/p^hZ_p). Every bounded subset of LC lies in some LC_h, and each LC_h is closed in LC. The sequence 0→LC→LA→LA→0 is strictly exact; all three spaces are of compact type and reflexive. This is the Z_p application of L0 compact-type closed-subspace, exact-duality and strict-limit interfaces, not ownership of their general theory.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Hasse-stage-estimate makes d_x continuous and coefficientwise characteristic-zero differentiation identifies its kernel as LC.
2. Apply the requested L0 closed-subspace/inductive-limit comparison to the kernel: its intersection with LA_h is precisely LC_h, since an analytic function with zero derivative on a residue disc is constant there.
3. The L0 strict LF bounded-set theorem confines each bounded set to a finite level. Radius-loss primitives prove surjectivity; use the L0 open-mapping/strict quotient comparison for the compact-type spaces.

**Direct inputs:** `LocallyAnalyticDistributions:L1/hasse-stage-estimate`, `LocallyAnalyticDistributions:L1/local-ball-primitive-map`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`, `LocallyAnalyticDistributions:L0`.

**Acceptance:** 1_(p^nZ_p) belongs to LC_n, but not LC_(n−1) for n≥1. The unit balls in all LC_h do not form one bounded total subset of LC.

**Sources:** [KOHLHAASE-2011](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), Proof of Proposition 4.2 and Corollary 4.3, pp. 20–21. The induced smooth-function topology is the strict finite-level limit, and differentiation has smooth kernel.; [ST-DISTRIBUTIONS-1999](https://arxiv.org/pdf/math/9912073v1), Theorem 1.1 and Proposition 1.2, p. 3; Corollary 1.4, p. 4. Compact-type reflexivity, closed subspaces and strict duality. These statements alone do not construct the missing native kernel-limit comparison.

### 15. The bounded total set obstruction

**Node:** `bounded-total-obstruction` (theorem). Named declaration: `locallyAnalytic_noSurjectionToLocallyConstant`.

Let B be the image in LA of the norm-unit ball of LA_0. It is a bounded O_K-submodule whose K-linear span is dense in LA, since every polynomial lies in LA_0 and polynomials are dense in every LA_h. There is no continuous K-linear surjection LA→LC. Consequently there is no continuous projection LA→LC restricting to the identity on LC, and d_x has no continuous K-linear right inverse.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Continuity of LA_0→LA preserves boundedness, and K-linear scaling spans LA_0. Amice’s stage basis consists of polynomial functions, yielding density at every stage.
2. A continuous surjection q would send B to a bounded set with dense K-span in LC. The requested strict-limit bounded-set theorem puts q(B) in one closed finite-dimensional LC_h, contradicting the increasing conductor functions.
3. If S is a right inverse of d_x then P=1−S d_x maps into LC, is identity on LC and is continuous as an LA-valued map; the subspace topology makes it continuous as an LC-valued surjection. This contradicts the preceding obstruction.

**Direct inputs:** `LocallyAnalyticDistributions:L1/locally-constant-topology-input`, `LocallyAnalyticDistributions:L0/amice-mahler-basis`, `LocallyAnalyticDistributions:L0/locally-analytic-radius`.

**Acceptance:** A conductor-n indicator outside LC_(n−1) witnesses infinite dimension. Existence of continuous stagePrimitive maps does not supply compatible global S.

**Sources:** [KOHLHAASE-2011](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), Proof of Proposition 4.2 and Corollary 4.3, pp. 20–21. The bounded total lattice versus finite-level boundedness obstruction. The worker specializes to Z_p and finite K, using its ordinary Mahler basis; the paper’s general-group scalar-extension reduction is not needed.

### 16. Duality and the logarithm quotient

**Node:** `dual-log-exact-sequence` (comparison). Named declaration: `logarithmQuotient_strict_nonsplit`.

Under Amice and the positive transpose derivative, the strong dual of 0→LC→LA→LA→0 is 0→R+ --multiplication by t--> R+→LC′_b→0, with t=log(1+T). It is strictly exact, tR+ is closed, and R+/tR+≅LC′_b topologically. The quotient sequence has no continuous K-linear section. Multiplication by t is injective with inverse continuous on its image; it is not surjective onto R+.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Import strict compact-type duality and reflexivity from L0; the locally-constant comparison supplies the strictly exact function sequence.
2. Use inherited amice-derivative to identify the positive transpose with t multiplication. Strictness identifies the image topology, closed image and strong-dual quotient.
3. A continuous quotient section would give a complementary projection and, after transpose and bidual identification, a continuous projection LA→LC; bounded-total-obstruction rules it out. No coefficient extension to Cp or unsupported general completed tensor theorem is inserted.

**Direct inputs:** `LocallyAnalyticDistributions:L1/locally-constant-topology-input`, `LocallyAnalyticDistributions:L1/bounded-total-obstruction`, `LocallyAnalyticDistributions:L1/amice-derivative`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

**Acceptance:** t has zero constant, so 1 is not in tR+. The range tR+ has its subspace topology, not a guessed single Gauss norm. The normalized ordinary T-primitive does not split this logarithm quotient.

**Sources:** [COLMEZ-NIZIOL-2025](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Remark A.6, p. 59. The function and Frechet logarithm exact sequences and their nonsplitting.; [KOHLHAASE-2011](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf), Proposition 4.2 and Corollary 4.3, pp. 20–21. The smooth quotient and derivative nonsplitting.; [ST-DISTRIBUTIONS-1999](https://arxiv.org/pdf/math/9912073v1), Proposition 1.2, p. 3; Corollary 1.4, p. 4. The strict strong-dual and reflexive transfer inputs.

### 17. Logarithm on torsion-translated discs

**Node:** `torsion-log-domain` (theorem). Named declaration: `torsionLogarithm_identity`.

The native formal t=PowerSeries.log K lies in R+. For z∈L with |z−1|<1 and ξ^(p^n)=1, |ξ−1|<1, log ξ=0 and E(t,ξz−1)=E(t,z−1); equivalently analyticAffineSubstitution_(ξ−1,ξ)(t)=t. The actual function in the layer is log(ξ(1+T)), not log applied to a formal expression without convergence. At T_0=ξ−1, log(1+T) has a simple zero: its derivative there is ξ^(-1)≠0.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. The nth logarithm coefficient has norm at most n, so n r^n→0 for r<1; native derivative_log_mul_one_add_X determines the derivative of its analytic evaluation.
2. Every p-power root reduces to one in the residue field, hence has |ξ−1|<1. The convergent logarithm is additive on 1+the open unit ball, as in Colmez I.6; p^n logξ=log1=0 and characteristic zero gives logξ=0.
3. The convergent affine substitution domain is valid since |ξ|=1. The logarithm identity follows pointwise and also coefficientwise by differentiating the analytic substitution and evaluating its constant; use coefficient uniqueness rather than identifying arbitrary point functions with rigid sections.

**Direct inputs:** `LocallyAnalyticDistributions:L1/open-disc-frechet-carrier`, `LocallyAnalyticDistributions:L1/analytic-affine-substitution`, `LocallyAnalyticDistributions:L1/finite-coefficient-descent`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-analytic`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.derivative_log_mul_one_add_X`.

**Acceptance:** ξ=1 gives zero at T=0 and derivative 1. p=2, ξ=−1 gives zero at T=−2 inside the 2-adic open disc. At |T|=1 no logarithm convergence is claimed.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §I.6, p. 27; §II.4.2–II.4.3 and Proposition II.4.1, p. 35. The convergent logarithm law, its vanishing on torsion, and the torsion translate formulas; simple-zero conclusion is a worker deduction.

### 18. Removal of logarithmic apparent poles

**Node:** `log-local-cancellation` (theorem). Named declaration: `logarithmQuotient_localExtension_iff`.

For F∈R+(K), after a finite extension containing ξ of p-power order, let T_0=ξ−1. Locally near T_0, F/log(1+T) extends analytically iff E(F,T_0)=0, because the denominator has a simple zero; the extended value is ξ times the local derivative of F at T_0. In the guaranteed global case F=Aν with ν=dμ, F=tAμ, the quotient extends on the entire open disc as Aμ, including every such point. No assertion that arbitrary F vanishing at all torsion points is globally divisible is required here.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Expand both analytic functions in the local coordinate T−T_0. The logarithm is (T−T_0) times a local unit with constant coefficient ξ^(-1).
2. A zero value of F makes its local expansion divisible by T−T_0; the converse follows by evaluation. This local unit inversion can be obtained by a smaller-disc geometric series, without an unproved global Weierstrass divisor theorem.
3. For ν=dμ use the inherited exact transform identity, so Aμ is already the analytic extension globally. Descent uses the finite coefficient comparison.

**Direct inputs:** `LocallyAnalyticDistributions:L1/torsion-log-domain`, `LocallyAnalyticDistributions:L1/amice-derivative`, `LocallyAnalyticDistributions:L1/logarithm-apparent-poles`, `LocallyAnalyticDistributions:L1/open-disc-evaluation-mul`, `LocallyAnalyticDistributions:L0/disc-analytic-functions`.

**Acceptance:** F=t has quotient 1 and extended value 1 at every torsion zero. F=1 has a pole at T=0. F=T has local quotient value 1 at zero but, for p=2, is nonzero at T=−2 and cannot have a global quotient in R+.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), §II.4.2–II.4.3, p. 35. Logarithmic derivative and torsion evaluations; the local simple-zero cancellation criterion is a worker deduction.

### 19. Negative moments and primitive ambiguity

**Node:** `negative-moment-independence` (theorem). Named declaration: `negativeMoment_primitiveIndependent`.

For m≥1, k≥1, and b∉p^mZ_p, let U=b+p^mZ_p. If H is any k-fold ∂-primitive of Aμ in R+ (∂^kH=Aμ), then μ(1_U x^(−k))=p^(−m)Σ_(η^(p^m)=1)η^(−b)E(H,η−1). The test 1_U x^(−k) is extended by zero off U and is locally analytic, even when U consists of nonzero nonunits. Any two choices of H differ by a polynomial of degree ≤k−1 in t=log(1+T); the root average annihilates this ambiguity. The formula is not asserted for a ball containing zero.

**Hypotheses:** Standing normalized finite-extension field, radius and topology conventions.

**Proof contract.**

1. Repeated coordinate division constructs a ∂^k-preimage; in a neighbourhood of zero use t as a local coordinate with ∂t=1, so ker(∂^k) consists of degree<k polynomials in t. Subtract this polynomial globally and use coefficient uniqueness (or inductively use ker∂=K) for the global assertion.
2. Apply inherited ball restriction to x^kλ=μ where Aλ=H. On U the factor x is invertible and 1_U x^(−k) is locally analytic, so the desired moment is λ(1_U).
3. At each torsion root t evaluates to zero. Only the constant ambiguity remains; the finite root character sum vanishes because b is nonzero modulo p^m. Use the supplier prime-root-power-sum iteratively, or the same finite geometric identity for p^m.

**Direct inputs:** `LocallyAnalyticDistributions:L1/coordinate-division-ambiguity`, `LocallyAnalyticDistributions:L1/torsion-log-domain`, `LocallyAnalyticDistributions:L1/amice-ball-restriction`, `LocallyAnalyticDistributions:L1/finite-coefficient-descent`, `PadicMeasuresIwasawaAlgebras:L2/primitive-root-power-sum`.

**Acceptance:** For μ=δ_1, U=1+p^mZ_p and k=1, the negative moment is 1. For p=2, U=2+4Z_2, μ=δ_2 and k=1, the moment is 1/2; avoiding zero is weaker than unit support. For U=p^mZ_p the test x^(-1) is undefined at zero and the constant ambiguity survives.

**Sources:** [COLMEZ-FONCTIONS-2010](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf), Proposition II.4.1 and §II.4.2–II.4.3, p. 35. Finite-root moment formula and independence of logarithmic primitive ambiguities on balls avoiding zero.

## Worked support and logarithm examples

For μ=δ_1, the supported division Jμ is δ_1. For p=2 and μ=δ_2, the unit projector kills μ. Nevertheless the negative moment on U=2+4Z_2 is meaningful and equals 1/2: the entire ball avoids zero. A ∂-primitive of (1+T)² is H=(1+T)²/2. At fourth roots η, the average 4⁻¹Ση⁻²H(η−1) equals 1/2. Thus “supported on units” is the condition for the bounded-norm unit inverse, whereas “ball avoiding zero” is the broader condition for the negative-moment formula.

For k-fold ∂-primitives the ambiguity is a polynomial of degree below k in t=log(1+T). At a torsion evaluation η−1 every positive power of t is zero. Its constant contributes p⁻ᵐΣη⁻ᵇ, which vanishes exactly for the nonzero residue b required in the formula. On a ball containing zero that constant can survive, and a reciprocal test has a pole. The formula carries its support condition in its signature.

At p=2, the logarithm has a zero at T=−2 as well as at zero, since −1 is 2-power torsion and |−2|_2<1. Its derivative at −2 is −1. F=T gives a removable quotient F/t at zero with value one, but F(−2)≠0, so F/t has a pole at −2. This is a concrete failure of treating a zero at T=0 as sufficient for a global quotient. When F=tAμ, division removes every apparent pole globally because Aμ is already the required analytic extension.

For local integration, take f(T)=Σ_(m≥1)pᵐT^(pᵐ−1). Its nonzero coefficients have norms p⁻ᵐ→0, so it is analytic on the closed unit disc. Integrating gives coefficient pᵐ/pᵐ=1 at every positive index pᵐ. No constant of integration repairs that nondecay. Restriction to any strictly smaller norm radius absorbs it. The radius change in `ballPrimitive` is therefore essential even though every locally analytic function has a primitive on a finite finer partition.

## Closure, supplier request and implementation boundary

L1 is **planned**, and the packet is **complete**, meaning that every stage target has a target-level contract and a backward chain to native facts, inherited nodes or an exact request. It is not marked closed. The two gaps are:

1. **L0 topology interface.** Supply the native closed-kernel comparison identifying the induced topology on LC=ker(d_x) with strict ind_h LC_h, bounded-set confinement to one finite level, strictness/open mapping for d_x:LA→LA, and strict strong-dual exactness and reflexive transpose of splittings. The parent L0 compact-type dual node gives the surrounding theory, but its statement alone does not prove the kernel-limit comparison. Kohlhaase Proposition 4.2, pp. 20–21, and Schneider–Teitelbaum Theorem 1.1/Proposition 1.2, p. 3, and Corollary 1.4, p. 4, identify the necessary supplier contracts. General nonarchimedean functional analysis is imported from L0, rather than assigned to another new layer here.
2. **Global signatures.** Native power series and scalar evaluation exist at the pins, but the glued LA stages, their LF/strong-dual carriers and the R⁺ Gauss Fréchet topology do not. The global constructor APIs and their 24 discriminating tests stay in this definitive reader. They require those actual carriers before they can become Lean statements. The current real/complex locally convex framework is not substituted for them.

The finite-K, Z_p nonsplitting proof deliberately uses the ordinary Mahler basis: LA_0’s unit ball has dense K-span in LA, whereas every bounded subset of LC lies in a finite conductor level. It does not invoke Kohlhaase’s general-group reduction via completed coefficient extension to a field containing C_p. No source error is asserted, and no restricted textbook was used.

The compact suggested file retains `openDiscMem`, the native coefficient primitive, the Q_p primitive and differentiation estimates, affine coefficient summability, convergence of the native logarithm, existence/uniqueness of a normalized ∂-primitive and scalar evaluation summability. It also checks small primitive values and two open-disc boundary examples. The scalar primitive formula is defined over native fields; its radius milestones are specialized to Q_p, with the general normalized finite-extension version a reader target. It does not supply `openDiscSeries`’s topological carrier, a distribution, a locally constant LF space, a support subtype or an analytic-substitution homomorphism. No data definition is a theorem placeholder.

The generated additive summability theorem was resolved directly in the compiled file. The source-based pinned declaration index records its multiplicative source `NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`; the packet explains the generated additive counterpart used for the pairing.

## Sources and validation

All source statements above are in the worker’s own words and organized by the layer’s targets. No source passages are reproduced. The packet records URLs, SHA-256 hashes and fresh reading dates for six public primary sources:

- Pierre Colmez, *Fonctions d’une variable p-adique*, author PDF, pp. 13–16, 27–30 and 34–37; particularly Theorem I.4.7, Lemma II.2.1, Theorem II.2.2, Proposition II.4.1 and Lemma II.4.2.
- Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2, §§3.7–3.8, pp. 23–26, particularly Theorem 3.43.
- Peter Schneider and Jeremy Teitelbaum, *p-adic Fourier theory*, arXiv:math/0102012v1, §1, pp. 3–6.
- Peter Schneider and Jeremy Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL2*, arXiv:math/9912073v1, §§1–2 up to Lemma 2.1, pp. 1–6.
- Jan Kohlhaase, *The cohomology of locally analytic representations*, author PDF, §4, pp. 19–22, particularly Proposition 4.2 and Corollary 4.3 with their proofs.
- Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture*, author PDF, Appendix A, pp. 58–59, particularly Remark A.6.

Local validation: the blueprint checker reports zero errors and zero warnings against the pinned declaration index. The 128-line suggested file exits successfully through `lean-check`, with 13 intended theorem/example placeholder warnings and no other warnings. Its final native summability example uses the actual imported proof. Compilation establishes signature elaboration, not the planned mathematics or the remaining global topology input.

Exact-arithmetic verification also passed 11,958 checks over p=2,3,5: factorial/Gauss bounds, reciprocal-integer growth, normalized primitives, unit reciprocal expansions, the positive transpose coefficients of the logarithm, and finite-root Dirac moment averages in cyclotomic quotient rings. These checks validate the finite examples and estimates; they do not replace the L0 topology proof.
