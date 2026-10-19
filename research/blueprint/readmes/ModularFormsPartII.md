# Modular forms — Hecke theory, newforms, and L-functions, Part II: noncongruence subgroups and the unbounded denominators theorem

This continuation starts with weakly holomorphic modular forms on arbitrary finite-index subgroups of SL₂(ℤ). It constructs the modular λ coordinate and the fields of bounded-denominator and congruence modular functions. A quantitative holonomy bound and Ihara leveraging identify those fields and prove that one integral Fourier expansion forces congruence. The application layers treat differential equations, selected components of vector-valued forms, quasimodular examples, arithmetic coefficient growth, and the connected cuspal modular model.

The base is [Modular forms — Hecke theory, newforms, and L-functions](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/ModularForms), roadmap `tauceti:TauCetiRoadmap/ModularForms`. Its characters, parity, graded rings, Hecke theory, eigenforms, newforms and L-functions are inputs. The general finite-index valence formula, cusp widths and ordinary holomorphic form carrier are already library inputs. This continuation does not construct them again. The atlas extraction calls this direction `NoncongruenceModularForms`; its issue and file identifier is `ModularFormsPartII`.

## Conventions and boundaries

Write E={±I}, T=[[1,1],[0,1]], Γ(N)=ker(SL₂(ℤ)→SL₂(ℤ/N)), Γ₀(p) for lower-left divisibility, and Γ₁(p) for diagonal entries one and lower-left zero modulo p. A group is congruence when it contains some Γ(N), with N positive; it need not contain E. Analytic weight-k slash actions use the existing determinant-normalized carrier. Unless a target says otherwise, k is an arbitrary integer and finite index is a hypothesis.

A weak form is holomorphic on ℍ and meromorphic at every rational cusp, with finite principal part. A meromorphic function with an interior pole is not a weak form. Strict cusp widths specify honest translation periods. Signed widths specify the projective geometric ramification and can be half a strict width when E is absent. All statements using signed principal groups retain this distinction. A nonzero odd-weight form on Γ(2) requires a character; θ₃² uses χ₋₄(d).

The Fourier conventions are q=exp(πiτ), Q=q²=exp(2πiτ), t=q^(1/N), and x=λ/16. Thus t has strict period 2N, the library `UpperHalfPlane.qExpansion (2N)` gives its Taylor coefficients only for the corresponding analytic periodic germ, λ=16q+…, and Δ=q²+…. Bounded denominators means one scalar clears every coefficient. It is stronger than having coefficients in a ring with finitely many primes inverted. In the derivative layer θ_q=q d/dq=(1/πi)d/dτ=2D, where D=(1/2πi)d/dτ. Consequently θ_qΔ=2E₂Δ.

The Laurent fields M₂N and R₂N sit in one specified ℚ((t)). They are defined as ℚ(λ)-linear spans. Their generators are holomorphic away from cusps; scalar rational functions in λ can introduce interior poles in general span elements. Finiteness precedes the proof that each span is a field and the selection of a finite basis. The constant field is ℚ. Complex scalar extension and rational cusp-model descent are separate proof steps.

Vector-valued forms in W7 use projective representations and therefore have even weight when nonzero. The ambient local system has rank n over ℂ. The continuation space of one component has rank at most n and need not be irreducible. Only the span of the values of a form is detected by its coefficients. The whole representation has a congruence kernel only when this span is the whole space.

Generic analytic algebraization, punctured-plane uniformization, covering spaces, profinite cohomology, Lazard theory, differential arithmetic, and regular modular-curve models retain their established owners. The two analytic continuations have proposed names but no registered stage ids in the atlas; their exact contracts appear under ALG and UNI. No identifier is invented to make a dependency appear closed.

## Layer order and milestones

The cohomology layer precedes the enhanced Ihara argument. The broad application layer is separated into differential equations and components, quasimodular and arithmetic growth, and the arithmetic fundamental group. This order follows the proof dependencies.

| Layer | Targets | Atlas planets | Mathematical output |
| --- | ---: | ---: | --- |
| W1 — Weak forms and geometric levels | 8 | 6 | Extend the existing slash-invariant carrier to functions holomorphic on ℍ and meromorphic at every rational cusp. Pin strict and signed widths, bounded denominators and geometric Wohlfahrt level. Prove intersection, normal-core and p-scaling laws and the signed Wohlfahrt theorem; clear cusp poles by Δ. |
| W2 — The modular λ coordinate | 7 | 5 | Construct λ by the existing η function, identify X(2) with ℙ¹ and λ as its three-punctured covering coordinate, prove integral inverse reparametrization and Kummer normalization, and the hypergeometric–theta identity with its character. Connect the N=2 and N=3 punctured-plane acceptance examples. |
| W3 — Bounded-denominator fields and holonomy rank | 8 | 5 | Define the ℚ(λ)-spans M₂N and R₂N in rational Laurent series, prove inclusion, multiplication and field structure, construct the normal stabilizer with exact level, and supply the λ-root holonomy embedding and quantitative rank bound from the two analytic supplier contracts. |
| W4 — Congruence cohomology and invariant vectors | 17 | 5 | Define congruence classes and the all-level direct limit of H¹. Compute finite and p-adic SL₂ cohomology through Hochschild–Serre, Lazard, adjoint H¹ and certified small-level linear algebra; prove absence of invariant vectors, the congruence-difference criterion, and the final p-adic H² calculation. |
| W5 — Ihara generation and leveraging | 10 | 5 | Prove the nonabelian Ihara and triple-surjectivity statements with the corrected reduction kernel, the generation identity and enhanced abelian lemma. Establish field-intersection and base-change degree identities, p-scaling separation, degree doubling, and the Chebyshev contradiction. |
| W6 — The unbounded denominators theorem | 8 | 4 | Assemble R₂N=M₂N, reduce arbitrary integral weight to weight zero, and deduce congruence from one integral Fourier expansion, its rational bounded-denominator form, and its algebraic-integer form with number-field descent. Verify the j cube root, h roots, and Fermat tests. |
| W7 — Differential equations and vector-valued forms | 14 | 5 | Apply strict overconvergence to integral three-point ODE solutions with finite monodromy at zero. Define vector-valued forms and continuation spaces of individual components, separate their analytic and arithmetic differential-module realizations, and apply exact G-function inputs to componentwise congruence and the corrected effective-span Mason corollary. |
| W8 — Quasimodular and arithmetic growth applications | 7 | 5 | Define weakly holomorphic quasimodular forms using E₂ and Δ localization and prove derivative minimality with the q normalization fixed. Verify the elliptic-integral and Catalan identities. Define deficient places and state their congruence and effective arithmetic-component consequences with the necessary detection hypotheses. |
| W9 — The arithmetic fundamental-group application | 3 | 2 | On the connected cusp component of the smooth locus of a regular X(N) model, derive the split étale fundamental-group isomorphism from the arithmetic finite-cover criterion and algebraic-integer unbounded denominators; specify model and cover-descent inputs explicitly. |

The packet contains 82 targets: 12 definitions, 3 constructions and 67 theorems, with 63 API items and 59 discriminating unit tests. All nine layers are planned at target level. The 13 exact input gaps and 16 supplier contracts are part of the specification; none of the targets is claimed implemented. Each target below gives its hypotheses in the statement, its direct dependencies, source match, proof or construction, and acceptance checks. API and test names are proposed declaration names; the target id is the stable cross-reference for a theorem without a separate Lean spelling. Proposed modules are `TauCeti/NumberTheory/ModularForms/Noncongruence/W1.lean` through `W9.lean`, under namespace `TauCeti.ModularForms.Noncongruence`.

## Library baseline and imported contracts

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following existing declarations supply the stated functionality. They are citations, not targets of this continuation.

| Existing declaration | Module | Functionality used |
| --- | --- | --- |
| `mathlib:SlashInvariantForm` | `Mathlib.NumberTheory.ModularForms.SlashInvariantForms` | Functions on ℍ with the existing determinant-normalized slash invariance; no cusp or holomorphy condition. |
| `mathlib:ModularForm` | `Mathlib.NumberTheory.ModularForms.Basic` | Holomorphic slash-invariant functions bounded at every group cusp; used as the pole-free comparison, not as a weak-form carrier. |
| `mathlib:CongruenceSubgroup.Gamma` | `Mathlib.NumberTheory.ModularForms.CongruenceSubgroups` | Kernel of reduction SL₂(ℤ)→SL₂(ℤ/N). |
| `mathlib:CongruenceSubgroup.IsCongruenceSubgroup` | `Mathlib.NumberTheory.ModularForms.CongruenceSubgroups` | Contains Γ(N) for some N≠0, without a −I hypothesis. |
| `mathlib:UpperHalfPlane.cuspFunction` | `Mathlib.NumberTheory.ModularForms.QExpansion` | Local q-coordinate function with arbitrary value filled at q=0; strict period h uses exp(2πiτ/h). |
| `mathlib:UpperHalfPlane.qExpansion` | `Mathlib.NumberTheory.ModularForms.QExpansion` | Taylor coefficients at 0 of cuspFunction h f; for a holomorphic cusp germ, the actual Fourier series. |
| `mathlib:ModularForm.eta` | `Mathlib.NumberTheory.ModularForms.DedekindEta` | Dedekind η as a complex analytic infinite product; the argument is in ℂ. |
| `mathlib:ModularForm.eta_ne_zero` | `Mathlib.NumberTheory.ModularForms.DedekindEta` | η z≠0 when Im z>0. |
| `mathlib:ModularForm.logDeriv_eta_eq_E2` | `Mathlib.NumberTheory.ModularForms.DedekindEta` | logDeriv η(τ)=(πi/12)E₂(τ), fixing the derivative normalization. |
| `mathlib:ModularForm.discriminant` | `Mathlib.NumberTheory.ModularForms.Discriminant` | Δ(τ)=η(τ)^24, hence Δ starts at q² in the CDT q parameter. |
| `mathlib:ModularForm.discriminant_ne_zero` | `Mathlib.NumberTheory.ModularForms.Discriminant` | Δ is nowhere zero on ℍ. |
| `mathlib:CuspForm.discriminant` | `Mathlib.NumberTheory.ModularForms.Discriminant` | The existing weight-12 full modular cusp form with underlying function Δ. |
| `mathlib:jacobiTheta` | `Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable` | θ₃(τ)=Σ_{n∈ℤ} exp(πin²τ). |
| `mathlib:jacobiTheta_S_smul` | `Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable` | The principal square-root S transformation of θ₃; branch is retained. |
| `mathlib:jacobiTheta_T_sq_smul` | `Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable` | θ₃ is invariant under τ↦τ+2. |
| `mathlib:Subgroup.normalCore` | `Mathlib.Algebra.Group.Subgroup.Basic` | Largest subgroup of H normal in the ambient group, with conjugate-membership definition. |
| `mathlib:Subgroup.goursat_surjective` | `Mathlib.GroupTheory.Goursat` | A subdirect product determines isomorphic quotient groups; arithmetic obstruction remains to prove here. |
| `mathlib:Chebyshev.theta_ge` | `Mathlib.NumberTheory.Chebyshev` | θ(n)≥n log2−log(n+1)−2√n log n, enough for a positive linear lower bound eventually. |
| `mathlib:Chebyshev.theta_le_log4_mul_x` | `Mathlib.NumberTheory.Chebyshev` | θ(x)≤(log4)x for x≥0; bounds log of primorials without PNT. |
| `tauceti:TauCeti.Subgroup.integerCuspWidth` | `TauCeti.NumberTheory.ModularForms.Cusps.Basic` | Smallest positive strict integral translation period for finite relative index; geometric signed width is distinguished here. |
| `tauceti:TauCeti.ModularForm.valence_formula_finiteIndex` | `TauCeti.NumberTheory.ModularForms.Norm.Cusps` | Already-proved general finite-index valence formula, with cusp translation orbits and rational orders; no replanning. |
| `tauceti:TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` | `TauCeti.NumberTheory.ModularForms.Parity` | Nonzero character space requires χ(−1)=(−1)^k. |
| `mathlib:MeromorphicAt` | `Mathlib.Analysis.Meromorphic.Basic` | Finite-order pole condition on a punctured neighbourhood; actual value at the pole is irrelevant. |
| `mathlib:CongruenceSubgroup.Gamma0` | `Mathlib.NumberTheory.ModularForms.CongruenceSubgroups` | Integral matrices whose lower-left entry vanishes modulo N. |
| `mathlib:CongruenceSubgroup.Gamma1` | `Mathlib.NumberTheory.ModularForms.CongruenceSubgroups` | Integral matrices with bottom row (0,1) modulo N, equivalently diagonal entries 1 and lower-left 0. |
| `mathlib:EisensteinSeries.E2` | `Mathlib.NumberTheory.ModularForms.EisensteinSeries.E2.Defs` | The existing normalized weight-two Eisenstein function, used in the quasimodular polynomial ring. |
| `mathlib:Derivative.serreDerivativeMF` | `Mathlib.NumberTheory.ModularForms.Derivative` | Serre derivative sends ModularForm Γ k to weight k+2 when Γ≤SL₂(ℤ), for every integer k. |
| `mathlib:Derivative.normalizedDerivOfComplex_E₂` | `Mathlib.NumberTheory.ModularForms.RamanujanFormula` | D E₂=(E₂²−E₄)/12 for D=(1/(2πi))d/dτ; supplies derivative closure after adjoining E₂. |

Stage-level imports with no exact supplier node have the following required contracts. Node-level imports are named directly in the consuming targets. A contract requests the specified mathematics from its owner; it does not assert that the owner already supplies an additional missing bridge.

**Supplier contract 1: `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.** Retain the parent character eigenspace and χ(−I)=(−1)^k parity convention; use the existing modular-form graded ring rather than rebuilding it.

Consumers: `ModularFormsPartII:W7/vector-valued-form`, `ModularFormsPartII:W7/induced-scalar`, `ModularFormsPartII:W8/weak-quasimodular`, `ModularFormsPartII:W8/congruence-no-deficiency`.

**Supplier contract 2: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`.** Supply the parent’s lower level-one j/E₄/Δ identity and q normalization used by the cube-root example; its normalized j inputs are separate from the higher dimension-formula module.

Consumers: `ModularFormsPartII:W6/j-cube-root`.

**Supplier contract 3: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.** Supply finite polygon/Schreier presentations and torsion-free freeness for Γ(N), N≥3, with its S,T coset action and rank; no arithmetic congruence subgroup property is assumed.

Consumers: `ModularFormsPartII:W4/sl2z-cohom`, `ModularFormsPartII:W4/hs-comparison`, `ModularFormsPartII:W4/small-level-invariants`, `ModularFormsPartII:W7/invisible-summand-test`.

**Supplier contract 4: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.** Supply finite rational cusp representatives, scaling charts, strict translation widths and order comparison with boundedness; irregular cusp signs remain visible.

Consumers: `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W1/wohlfahrt-level`, `ModularFormsPartII:W1/clear-cusp-poles`.

**Supplier contract 5: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.** Supply the compactified analytic quotient X(Γ), cusp local charts and extension of cusp-meromorphic functions.

Consumers: `ModularFormsPartII:W2/lambda-covering`.

**Supplier contract 6: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.** Supply degree/index and ramification for finite holomorphic maps of compactified quotients, including projective stabilizers and X(2) degree-one identification.

Consumers: `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W2/small-uniformizations`, `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`.

**Supplier contract 7: `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`.** Supply Schwarz reflection and monodromy continuation to identify the λ fundamental-domain map, not an already constructed λ function.

Consumers: `ModularFormsPartII:W2/lambda-covering`.

**Supplier contract 8: `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.** Supply universal-cover lifting and the covering/monodromy correspondence, with effective deck group; holomorphic descent and local systems use its analytic refinement.

Consumers: `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W7/complex-local-system`.

**Supplier contract 9: `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`.** Supply algebraicity and number-field models for finite three-point covers. The distinguished Fourier-germ descent is the additional NF gap.

Consumers: `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W6/number-field-variant`.

**Supplier contract 10: `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.** Supply finite-cover and function-field correspondence for three-point covers, including compactification and meromorphic branching.

Consumers: `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

**Supplier contract 11: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.** Supply continuous finite-coefficient cohomology, filtered-colimit comparisons and smooth actions. FIN and COEFF separately identify periodic/amalgam and compact-integral extensions not already in this stage.

Consumers: `ModularFormsPartII:W4/congruence-class`, `ModularFormsPartII:W4/completed-h1`, `ModularFormsPartII:W4/uniform-kernels`, `ModularFormsPartII:W4/local-h1`, `ModularFormsPartII:W4/integral-local-h2`.

**Supplier contract 12: `ModularCurvesPartII:R12.4`.** Supply the specific geometrically connected symplectic-twist modular curve over ℚ with E[m]≃ℤ/m⊕μ_m and a rational ∞ cusp, as an extension of the fixed-pairing contract; see MODEL.

Consumers: `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`, `ModularFormsPartII:W6/number-field-variant`, `ModularFormsPartII:W9/cuspal-model`.

**Supplier contract 13: `ModularCurvesPartII:R13.5`.** Supply regular models and smooth cuspal sections at all levels and all finite primes, plus base-change compatibility needed by the connected cuspal model. NERON records what the present level-raising contract does not cover.

Consumers: `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

**Supplier contract 14: `ModularCurvesPartII:R14.4`.** Extend the Ihara owner with the level-N arithmetic amalgam in SL₂(ℤ[1/p]) and its precise congruence subgroup property, including signs; see CSP.

Consumers: `ModularFormsPartII:W5/abelian-ihara`, `ModularFormsPartII:W5/nonabelian-ihara`.

**Supplier contract 15: `DiophantineApproximationAndTranscendence:DT.5`.** Supply the minimal G-operator/global nilpotence/quasi-unipotence theorem at every singularity, for the actual descended possibly reducible cyclic component module; see GLOCAL.

Consumers: `ModularFormsPartII:W7/arithmetic-component`.

**Supplier contract 16: `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.** Supply character decomposition at principal level, an eigenform/newform basis and oldform reindexing, including coefficient recurrences needed to extend Deligne’s prime bound to all cusp coefficients.

Consumers: `ModularFormsPartII:W8/congruence-no-deficiency`.

## W1. Weak forms and geometric levels

Extend the existing slash-invariant carrier to functions holomorphic on ℍ and meromorphic at every rational cusp. Pin strict and signed widths, bounded denominators and geometric Wohlfahrt level. Prove intersection, normal-core and p-scaling laws and the signed Wohlfahrt theorem; clear cusp poles by Δ.

**Layer dependencies:** `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Planets:** Weakly holomorphic modular forms; Bounded denominators; Wohlfahrt level; Normal core and level; Level under scaling; Wohlfahrt’s theorem.

### W1.1. Weakly holomorphic modular forms

**Target:** `ModularFormsPartII:W1/weak-form` (definition).

For k∈ℤ and finite-index Γ≤SL₂(ℤ), a weak form is a function f:ℍ→ℂ holomorphic on ℍ, invariant under the existing weight-k slash action of Γ, whose slash f|ₖg has a meromorphic germ at q_h=0 for every g∈SL₂(ℤ) and some positive strict translation period h. The local Laurent series has finite principal part. A weak modular function has k=0. The holomorphic-at-all-cusps subspace is the existing ModularForm carrier, not a second holomorphic-form definition. Character-valued forms retain the parent character carrier and are not folded into this trivial-character definition.

**Direct dependencies:** `mathlib:SlashInvariantForm`, `mathlib:ModularForm`, `mathlib:UpperHalfPlane.cuspFunction`, `mathlib:MeromorphicAt`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 1.0.1, p.627; Definition 4.2.1, p.655; Definition 7.4.3, p.692. The main theorem allows holomorphy on the upper half-plane with finite cusp principal parts; the field and quasimodular definitions use that same weak form convention. The target expresses it through the existing slash and cusp-germ carriers.

**Construction and proof.**

1. Use the existing slash action and MDifferentiable predicate. Express the new condition using MeromorphicAt of cuspFunction after a slash; allow any positive strict period.
2. Prove equivalence with a finite Laurent principal part using the punctured-disc cusp chart; compare nonnegative Laurent support with the existing boundedness-at-cusps condition.

**Uses that determine the API.**

- W3 and CDT25 Definition 4.2.1: Weight-zero generators have poles only at cusps.
- W6 and CDT25 Theorem 1.0.1: The main theorem accepts every integral weight and finite principal parts.

**API.**

- `WeakModularForm.ext` (extensionality): Equality is pointwise equality on ℍ.
- `WeakModularForm.ofModularForm` (coercion): The existing ModularForm embeds injectively with the same slash action and function.
- `WeakModularForm.restrict` (functoriality): For H≤Γ of finite index, restriction changes the group and preserves the function; restriction composes.
- `WeakModularForm.mul` (structure): Weights add under pointwise multiplication; weight zero is a ℂ-algebra.
- `WeakModularForm.mem_iff_cuspLaurent` (characterisation): Membership is holomorphy, slash invariance, and a finite Laurent principal part in every cusp chart.

**Unit tests.**

- `weak_constant` (degenerate): The constant 1 belongs in weight zero for SL₂(ℤ).
- `weak_inverse_delta` (non-example): Δ⁻¹ is weak of weight −12 and is not an existing holomorphic modular form, since its expansion starts at Q⁻¹.
- `weak_existing_comparison` (compatibility): A weak form with no negative Laurent terms at every cusp corresponds uniquely to ModularForm Γ k.
- `weak_no_interior_poles` (non-example): For a∈ℂ, (j−a)⁻¹ is rejected whenever j−a has a zero on ℍ.

**Acceptance checks.**

- No pole on ℍ is allowed; a pole at a rational cusp is allowed.
- Changing the scaling matrix or replacing a strict period by a positive multiple preserves membership.

### W1.2. Bounded denominators of a Fourier germ

**Target:** `ModularFormsPartII:W1/bounded-denominators` (definition).

For an embedded number field K⊆ℂ and a Laurent series a(t)∈K((t)), bounded denominators means there is one nonzero d∈O_K with d a_n∈O_K for every coefficient, including the finite principal part. Over ℚ use one integer D≥1. This is scalar denominator clearing, not substitution t↦t/M. For a holomorphic germ f with positive strict period 2N, its Taylor series is UpperHalfPlane.qExpansion (2N) f in t=e^{πiτ/N}. Integral coefficients mean every coefficient lies in the embedded ℤ, or O_K, as appropriate.

**Direct dependencies:** `mathlib:UpperHalfPlane.qExpansion`, `ModularFormsPartII:W1/weak-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 1.0.1, p.627; Definition 4.2.1(2), p.655; Remarks 6.3.1–6.3.2, pp.685–686. The arithmetic condition is one scalar clearing all Fourier coefficients. The number-field remarks use algebraic integers; this does not follow just from allowing a finite set of denominator primes.

**Construction and proof.**

1. Use coefficientwise membership in the image of O_K and quantify a single clearing scalar.
2. Addition and convolution preserve a common clearing scalar after multiplying denominators; finite Laurent support below zero permits the same argument.

**Uses that determine the API.**

- W3 R₂N: Defines the arithmetic restriction on generators.
- W6 rational and number-field variants: Converts bounded denominators to integral coefficients by a single scalar.

**API.**

- `HasBoundedDenominators.iff_exists_scalar` (characterisation): Membership is equivalent to one scalar clearing every coefficient.
- `HasBoundedDenominators.add_mul` (structure): Sums and products preserve the predicate with the product of the clearing scalars.
- `HasBoundedDenominators.reindex` (functoriality): Substitution t↦t^m for m>0 preserves and reflects the predicate.
- `HasBoundedDenominators.qExpansion_compat` (compatibility): For an analytic 2N-periodic cusp germ, coefficients are precisely those of the existing qExpansion (2N).

**Unit tests.**

- `bd_rational_constant` (computation): The constant 1/2 is bounded, with D=2, and is not integral.
- `bd_unbounded_prime` (non-example): Σ_{n≥0}t^n/2^n has unbounded denominators although every coefficient lies in ℤ[1/2].
- `bd_integral_unit_inverse` (compatibility): An integral power series with constant term ±1 has integral inverse, hence bounded denominators.
- `bd_exp` (non-example): Σ t^n/n! fails every common denominator.

**Acceptance checks.**

- Never infer bounded denominators from membership in O_K[1/S][[t]].
- State the period separately: existence of Taylor coefficients alone does not identify a Fourier germ.

### W1.3. Geometric Wohlfahrt level

**Target:** `ModularFormsPartII:W1/wohlfahrt-level` (definition).

Write E={±I}, Γᵖ=⟨Γ,E⟩. At g∞ define the signed width wᵍ(Γ) to be the least m>0 with either gT^m g⁻¹ or −gT^m g⁻¹ in Γ. Define L(Γ) as the lcm over the finitely many Γᵖ-cusps of these widths. This equals L(Γᵖ). For E≤Γ, signed width agrees with the existing integerCuspWidth of the conjugate group. Without E≤Γ a strict width may be twice a signed width; odd weights then retain the associated sign in the local parameter.

**Direct dependencies:** `mathlib:CongruenceSubgroup.Gamma`, `tauceti:TauCeti.Subgroup.integerCuspWidth`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Definition 4.1.2 and Lemmas 4.1.3–4.1.4, p.653. The level is the common multiple of geometric cusp ramification orders. Passing to the projective closure makes the sign convention explicit and distinguishes this from a strict translation width.

**Construction and proof.**

1. Import cusp representatives and the strict translation subgroup from FuchsianOrbifolds. Pass to the projective closure before taking the lcm.
2. Prove representative independence using the signed stabilizer and positive generator of its translation image.

**Uses that determine the API.**

- W3 Definition 4.2.1: A fixed level bounds every cusp ramification order.
- W5 Ihara and scaling: Wohlfahrt converts congruence closure plus a geometric bound into a principal-subgroup inclusion.

**API.**

- `wohlfahrtLevel_eq_lcm` (characterisation): L is the lcm of the signed cusp widths of any complete finite cusp representative family.
- `cuspWidth_dvd_wohlfahrtLevel` (relation): Every signed cusp width divides L.
- `wohlfahrtLevel_projectiveClosure` (compatibility): Adjoining E leaves L unchanged; for E≤Γ the signed width is the pinned integer strict width after conjugation.
- `wohlfahrtLevel_conjugate` (functoriality): Integral unimodular conjugation preserves L.

**Unit tests.**

- `level_full` (computation): L(SL₂(ℤ))=1.
- `level_gamma_two` (computation): All three Γ(2) cusp widths are 2, hence L(Γ(2))=2.
- `level_sign_kernel` (non-example): H′={γ∈Γ(2):aγ≡1 mod4} has L(H′)=2 and excludes −I, despite containing Γ(4).
- `level_strict_distinction` (compatibility): At a cusp whose stabilizer has −T^h but not T^h, the signed width is h and the strict width is 2h.

**Acceptance checks.**

- This level is geometric; it does not mean the subgroup is congruence.
- Level is positive for finite-index groups and is unchanged by adjoining −I.

### W1.4. Clearing cusp poles with Δ

**Target:** `ModularFormsPartII:W1/clear-cusp-poles` (theorem).

For f weak of weight k on finite-index Γ, there exists m≥0 such that fΔ^m is an existing holomorphic ModularForm Γ (k+12m). Multiplication by Δ^m is injective, since Δ has no zero on ℍ. At each cusp the order of Δ is positive. This statement includes irregular cusps and does not assume −I∈Γ.

**Direct dependencies:** `ModularFormsPartII:W1/weak-form`, `mathlib:ModularForm.discriminant_ne_zero`, `mathlib:CuspForm.discriminant`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.2, p.655; Lemma 7.4.4, pp.692–693. The containment argument multiplies a weak modular function by a sufficiently large power of the discriminant. Its positive order at every cusp and absence of zeros on the upper half-plane justify this reduction.

**Construction and proof.**

1. There are finitely many cusps. For each choose m to offset the finite negative Laurent order using the positive local order of Δ.
2. Take the maximum; retain the slash multiplier in an irregular cusp chart and compare boundedness with ModularForm.

**Acceptance checks.**

- Δ⁻¹ becomes the constant 1 after one multiplication.
- The construction preserves all interior holomorphy conditions.

### W1.5. Level of an intersection

**Target:** `ModularFormsPartII:W1/level-intersection` (theorem).

If E≤G,H and both have finite index, the signed cusp width of G∩H at each rational cusp is lcm(w(G),w(H)); consequently L(G∩H)=lcm(L(G),L(H)). In particular L(G),L(H)∣N implies L(G∩H)∣N.

**Direct dependencies:** `ModularFormsPartII:W1/wohlfahrt-level`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.1.3, p.653. The intersection lemma computes geometric level after intersecting subgroups. The target retains the central sign hypothesis needed for equality of cusp stabilizer translation subgroups.

**Construction and proof.**

1. With E included, membership of a translation in both stabilizers is exactly divisibility by both positive generators.
2. Take the lcm over a common refinement of cusp representatives.

**Acceptance checks.**

- Do not apply the unsigned equality to two groups that exclude −I.

### W1.6. Geometric level of the normal core

**Target:** `ModularFormsPartII:W1/level-normal-core` (theorem).

For finite-index G≤SL₂(ℤ) containing E, the existing ambient normal core G.normalCore has finite index, contains E, and has exactly L(G).

**Direct dependencies:** `ModularFormsPartII:W1/level-intersection`, `mathlib:Subgroup.normalCore`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.1.4, p.653. The core lemma retains geometric level under the finite intersection of conjugates. Finite index turns the ambient normal core into that finite intersection.

**Construction and proof.**

1. The coset action has finite image, so the core is an intersection of finitely many conjugates.
2. Each conjugate has the same level; combine the intersection formula with core≤G.

**Acceptance checks.**

- Taking a core cannot silently erase the E hypothesis.

### W1.7. Level after p-scaling

**Target:** `ModularFormsPartII:W1/level-scaling` (theorem).

Let H contain E, have finite index and L(H)=N. For p prime, A=diag(p,1), set Hᴀ=A⁻¹HA∩SL₂(ℤ). Then Hᴀ has finite index, contains E and L(Hᴀ)∣Np. A does not lie in SL₂(ℤ); conjugation is performed in GL₂(ℚ) before intersection.

**Direct dependencies:** `ModularFormsPartII:W1/wohlfahrt-level`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Notation 4.1.5 and Lemma 4.1.7, pp.653–655. The scaling lemma bounds the new geometric level by the old level times p. The target corrects the diagonal in the second primitive-column case and performs conjugation in rational matrices.

**Construction and proof.**

1. Represent a cusp by a primitive integer column and split according to divisibility of its entries by p.
2. Compute the conjugated parabolic explicitly in each case. In the second case the correcting diagonal is diag(1/p,p); the final translation exponent is Np.

**Acceptance checks.**

- A cusp with a p-divisible primitive coordinate exercises the corrected second case.

### W1.8. Wohlfahrt’s theorem with signs

**Target:** `ModularFormsPartII:W1/wohlfahrt` (theorem).

If a finite-index congruence G contains E, then Γ(L(G))≤G. For an arbitrary congruence G, the conclusion is Γ(L(G))≤⟨G,E⟩. Thus a congruence subgroup containing E and with geometric level dividing N contains Γ(N).

**Direct dependencies:** `ModularFormsPartII:W1/wohlfahrt-level`, `mathlib:CongruenceSubgroup.IsCongruenceSubgroup`, `mathlib:CongruenceSubgroup.Gamma`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Lemma 4.4.1, p.659, citing Wohlfahrt Theorem 2; Definition 4.1.2, p.653. The nonabelian Ihara proof invokes Wohlfahrt to turn geometric level into a principal subgroup inclusion. KSV10 supplies the primary elementary proof; adjoining the central sign is essential to the stated general version.

**Source:** [KSV10](https://arxiv.org/pdf/0905.4798), §3, Lemma 7, Proposition 3 proof and Remark 8, pp.4–6. The elementary matrix reduction proves the signed version and explains exactly why an unsigned lift can require twice the geometric level.

**Construction and proof.**

1. Apply KSV10 Proposition 3 and Remark 8 with the translations gT^N g⁻¹ available because E≤G. First modify a matrix of Γ(N) by elementary N-transvections so its lower-right entry is coprime to an existing congruence level ν. CRT avoiding one residue for each prime dividing ν suffices in place of Dirichlet.
2. Clear the off-diagonal entries modulo ν. In KSV10 equation (1) use M=(T^(1−d))ᵗ L T^(d−1), L=[[a,a−1],[1−a,2−a]]. Its correct further factorization is L=(Tᵗ)⁻¹ T^(a−1) Tᵗ; the displayed line on p.6 reverses these conjugating signs. Reduction leaves an element of Γ(ν)≤G. Adjoin E for the general case.

**Acceptance checks.**

- H′ at level 2 gives a counterexample to removing E from the first conclusion.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. The supplier contracts remain explicit even where this layer has no separate input gap.

## W2. The modular λ coordinate

Construct λ by the existing η function, identify X(2) with ℙ¹ and λ as its three-punctured covering coordinate, prove integral inverse reparametrization and Kummer normalization, and the hypergeometric–theta identity with its character. Connect the N=2 and N=3 punctured-plane acceptance examples.

**Layer dependencies:** `ModularFormsPartII:W1`, `QSeriesPartitionsAndMockModularForms:QM.1`, `QSeriesPartitionsAndMockModularForms:QM.0`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.

**Planets:** Modular λ function; Modular λ covering; Integral λ reparametrization; Jacobi’s hypergeometric identity; Modular uniformization examples.

### W2.1. The modular λ function

**Target:** `ModularFormsPartII:W2/lambda` (definition).

Using the pinned η on ℂ, set x(τ)=(η(τ/2)η(2τ)²/η(τ)³)^8 and λ(τ)=16x(τ). On ℍ the denominator is nonzero. Pin q=e^{πiτ}: x=q∏_{n≥1}((1+q^{2n})/(1+q^{2n−1}))^8. The associated formal series is the integral q-adic product; agreement with the analytic product is a theorem, not a choice of a formal expansion. Its λ-normalization sends the three Γ(2)-cusps ∞,0,1 to 0,1,∞.

**Direct dependencies:** `mathlib:ModularForm.eta`, `mathlib:ModularForm.eta_ne_zero`, `mathlib:jacobiTheta`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `ModularFormsPartII:W1/weak-form`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-two-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-triple-product-analytic`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (1.0.2), p.628; §1.1.3, p.631; §7.4.2, p.693. The eta product defines the coordinate with leading term 16q. Its theta expression, integral normalization and cusp values fix which of the six usual lambda normalizations is used.

**Construction and proof.**

1. Build the analytic function from the existing η and prove its product identity by separating even and odd factors.
2. Use the imported theta/eta identities to obtain λ=(θ₂/θ₃)^4, the S and T transformations, and its cusp limits.

**Uses that determine the API.**

- W3 holonomy embedding: x and x^(1/N) provide the integral and analytic coordinates.
- W7 ODE pullback: The distinguished singular point is x=1/16, not x=1.

**API.**

- `lambda_eta_eq` (characterisation): λ is 16 times the indicated η quotient to the eighth power.
- `lambda_theta_eq` (compatibility): λ=(θ₂/θ₃)^4 with the theta supplier’s conventions.
- `lambda_slash_gamma_two` (relation): λ is invariant under Γ(2).
- `lambda_S_T` (relation): λ(−1/τ)=1−λ(τ) and λ(τ+1)=λ(τ)/(λ(τ)−1).
- `lambda_holomorphic` (structure): λ is holomorphic on ℍ and its values avoid 0 and 1.

**Unit tests.**

- `lambda_i` (computation): λ(i)=1/2.
- `lambda_leading` (computation): x=q−8q²+44q³−192q⁴+718q⁵ modulo q⁶.
- `lambda_not_j` (non-example): λ(τ+1) is λ/(λ−1), not λ; full-level invariance is rejected.
- `lambda_q_period` (compatibility): UpperHalfPlane.qExpansion 2 x has linear coefficient 1, whereas λ has linear coefficient 16.

**Acceptance checks.**

- The analytic λ is holomorphic and avoids 0 and 1 on ℍ.
- The coefficient of q in λ is 16; the integral coordinate x has coefficient 1.

### W2.2. The λ covering and three cusp values

**Target:** `ModularFormsPartII:W2/lambda-covering` (theorem).

λ:ℍ→ℂ∖{0,1} is a holomorphic universal covering with effective deck group Γ(2)/E. It extends to a biholomorphism X(2)≃ℙ¹ sending ∞,0,1 to 0,1,∞. For every finite-index H≤Γ(2) containing E, Y(H)→Y(2) is finite unramified, and the compactified map is branched only above these three values; finite covers are read using the imported covering correspondence.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Introduction p.628; proof of Proposition 3.0.1, p.650; comparison with upstream FuchsianOrbifolds Layers 3–5. The modular pullback uses lambda as the universal covering of the twice-punctured plane. The target derives the compactified degree-one coordinate from the imported quotient and covering geometry.

**Construction and proof.**

1. Show λ separates the Γ(2) fundamental domain using theta transformations, cusp values and reflection.
2. Use the degree-one meromorphic map X(2)→ℙ¹ and the imported degree theorem. Identify deck transformations projectively and use universal-cover lifting.

**Acceptance checks.**

- −I acts trivially, so Γ(2) itself is not the effective deck group.
- Disc lifts used in W3 are holomorphic on Y(H).

### W2.3. The level-two modular-function ring

**Target:** `ModularFormsPartII:W2/lambda-function-ring` (theorem).

The ring of complex weight-zero weak forms on Γ(2) is ℂ[λ,λ⁻¹,(1−λ)⁻¹]. Its subring with rational Fourier coefficients at ∞ is ℚ[λ,λ⁻¹,(1−λ)⁻¹]; its fraction field is ℚ(λ). A rational q expansion forces a rational function in λ to have rational coefficients by the integral inverse coordinate and uniqueness of a reduced rational function.

**Direct dependencies:** `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W1/weak-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §4.2, p.655; equation (1.0.2), p.628. The field definition uses rational functions of lambda as scalars. Identifying the compactification with the projective line gives the allowed pole ring, and the rational Fourier germ descends its coefficients.

**Construction and proof.**

1. On ℙ¹ a function with poles only at 0,1,∞ is a rational function in the coordinate with precisely these allowed denominators.
2. Apply the rational germ criterion at 0 to descend constants from ℂ to ℚ.

**Acceptance checks.**

- λ⁻¹ and (1−λ)⁻¹ are required; ℚ[λ] alone misses cusp poles.

### W2.4. Integral λ reparametrization

**Target:** `ModularFormsPartII:W2/inverse-integrality` (theorem).

The formal x(q)=λ(q)/16 has a unique compositional inverse q(x) in x+x²ℤ[[x]]. Substitution gives mutually inverse ℤ-algebra maps ℤ[[q]]≃ℤ[[x]], and similarly over ℚ and any coefficient ring obtained by scalar extension. Its first terms are q=x+8x²+84x³+992x⁴+12514x⁵ modulo x⁶.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §1.1.3, p.631; equation (3.0.2), p.650. The argument changes from q to lambda/16 without introducing denominators, because the normalized series has linear coefficient one. The target includes the inverse coefficients and two-sided substitution identities.

**Construction and proof.**

1. The linear term is the unit 1. Solve successively for the coefficient of the inverse without division by any nonunit.
2. Pass from truncated inverse identities to equality of power series and to analytic germs in a small disc.

**Acceptance checks.**

- Compute compositions through degree five in both orders.
- This asserts a formal change of variable, not an equality of two independently named formal indeterminates.

### W2.5. The normalized Kummer coordinate

**Target:** `ModularFormsPartII:W2/kummer-coordinate` (theorem).

For N≥1 and t=q^{1/N}, there is a unique x_N(t)∈t+t²ℚ[[t]] with x_N(t)^N=x(t^N). It belongs to t+t²ℤ[1/N][[t]], and x_N^N is integral. Branches are fixed by x_N/t→1. No claim is made that x_N itself is integral for arbitrary N. Pulling back x=λ/16 by u↦u^N leaves possible singularities at 16^{−1/N}μ_N and ∞; width dividing 2N removes monodromy at u=0.

**Direct dependencies:** `ModularFormsPartII:W2/inverse-integrality`, `ModularFormsPartII:W1/wohlfahrt-level`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (3.0.2) and proof of Proposition 3.0.1, p.650. The holonomy embedding takes a normalized N-th root of lambda/16. The proof needs its N-th power integral, and does not require the root itself to have integral coefficients.

**Construction and proof.**

1. Write x(t^N)=t^N times an integral unit with constant term 1 and solve for its normalized N-th root over ℤ[1/N].
2. Use the cusp local monodromy order bound to remove the apparent singularity at zero after this pullback.

**Acceptance checks.**

- N=1 recovers x.
- For N=3, x_N=t−(8/3)t⁴+⋯, so general integral-root claims fail.

### W2.6. Jacobi’s hypergeometric identity with character

**Target:** `ModularFormsPartII:W2/jacobi-hypergeometric` (theorem).

Let K₀(x)=Σ_{n≥0}binom(2n,n)²x^n = ₂F₁(1/2,1/2;1;16x). Then K₀(x(τ))=θ₃(τ)². This is weight 1 on Γ(2) with χ(γ)=χ_{−4}(dγ), and is a trivial-character form on H′={γ∈Γ(2):dγ≡1 mod4}. The series is integral and transcendental over ℚ(x); its equation x(1−16x)y″+(1−32x)y′−4y=0 has nontrivial unipotent local monodromy at 0, despite this particular holomorphic branch.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `mathlib:jacobiTheta`, `mathlib:jacobiTheta_S_smul`, `mathlib:jacobiTheta_T_sq_smul`, `tauceti:TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`, `ModularFormsPartII:W2/lambda-covering`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equations (1.1.4)–(1.1.5), p.631; Remark 7.2.3 and (7.2.4), p.688; corrected character in extraction E12. The Jacobi identity identifies the integral hypergeometric series with theta-three squared. The target restores its weight-one character and keeps the infinite unipotent monodromy that prevents the algebraicity theorem from applying.

**Construction and proof.**

1. Compare the normalized analytic solution of the hypergeometric equation with the theta product.
2. Square the imported theta transformation, retaining χ_{−4}(d). Obtain logarithmic continuation at 0 from the second independent solution to prove infinite monodromy.

**Acceptance checks.**

- Constant coefficient 1 excludes the zero solution.
- −I acts by −1 in weight 1; a trivial Γ(2) character would contradict parity.

### W2.7. Two modular uniformization checks

**Target:** `ModularFormsPartII:W2/small-uniformizations` (theorem).

With C(z)=i(1−z)/(1+z), F₂(z)=2λ(C(z))−1 universally covers ℂ∖{±1}, sends 0 to 0, and |F₂′(0)|=Γ(1/4)^4/(4π²)>4. The supplier’s N=3 normalized covering has |F₃′(0)|=Γ(1/6)^3/(12π^{3/2})>16^{1/3}; its η-quotient in Example 5.1.22 agrees with that covering after the chosen rotation. Among N≥2, ℂ∖μ_N is isomorphic to Y(N) only for N=2,3.

**Direct dependencies:** `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W2/lambda`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Example 5.1.22, p.673; Theorem 5.1.4, pp.667–668. The example evaluates the N=2 and N=3 covering radii using gamma values and eta quotients. These are acceptance cases for the imported punctured-plane theorem, not a new general uniformization theory.

**Construction and proof.**

1. Compose the λ covering with the Cayley transform and the affine map u↦2u−1.
2. Use the imported gamma formula at N=2,3 and the η transformation identities for the printed F₃. For the last assertion compare genus and cusp counts from the parent geometric theory.

**Acceptance checks.**

- F₂(0)=0 and its target omits exactly ±1.
- The N=2 derivative is about 4.37687923 and the N=3 derivative about 2.5810565.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: UNI.

## W3. Bounded-denominator fields and holonomy rank

Define the ℚ(λ)-spans M₂N and R₂N in rational Laurent series, prove inclusion, multiplication and field structure, construct the normal stabilizer with exact level, and supply the λ-root holonomy embedding and quantitative rank bound from the two analytic supplier contracts.

**Layer dependencies:** `ModularFormsPartII:W1`, `ModularFormsPartII:W2`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`.

**Planets:** Congruence modular-function field; Bounded-denominator modular-function field; Modular holonomy embedding; Normal stabilizer of R₂N; Holonomy rank bound.

### W3.1. The field M₂N

**Target:** `ModularFormsPartII:W3/congruence-field` (definition).

For N≥1 take t=q^{1/N}, x=λ/16 and the common ambient Laurent field ℚ((t)). M₂N is the ℚ(λ)-linear span of q expansions of weight-zero weak forms on ⟨E,Γ(2N)⟩ with rational coefficients at ∞. Each generating function is holomorphic on Y(2N); poles at cusps are permitted. The embedded ℚ(λ) is specified by the λ series. Its field structure is proved below rather than included as an axiom.

**Direct dependencies:** `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W2/lambda-function-ring`, `ModularFormsPartII:W2/inverse-integrality`, `mathlib:CongruenceSubgroup.Gamma`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Definition 4.2.1(1), p.655. The first field is defined as a rational-function span of rational weak modular functions at principal level. Field structure is a subsequent result, rather than part of an unverified definition.

**Construction and proof.**

1. Map actual analytic functions to their Laurent expansions, using injectivity of the expansion germ.
2. Form the linear span over the explicitly embedded rational-function field.

**Uses that determine the API.**

- W5 degree growth: The congruence comparison field changes with N.
- W6 main theorem: Equality with R₂N is the weight-zero target.

**API.**

- `mem_M2N_of_modularFunction` (constructor): A rational-coefficient weight-zero weak form on Γ(2N) maps into M₂N.
- `M2N_one` (simp): M₂ is the specified ℚ(λ) subspace.
- `M2N_map_dvd` (functoriality): If N∣M then t_N↦t_M^(M/N) embeds M₂N into M₂M.
- `M2N_qExpansion_injective` (compatibility): The analytic-to-Laurent map is injective and agrees with the pinned qExpansion after clearing the principal part.

**Unit tests.**

- `M2_base` (computation): λ,λ⁻¹,(1−λ)⁻¹ belong to M₂ and generate its fraction field.
- `M2_constants` (non-example): An irrational constant such as √2 does not belong to M₂ as a rational Laurent series.
- `M4_degree` (computation): [M₄:M₂]=4, using projective Γ(4).
- `M2_poles` (compatibility): λ⁻¹ is a generator with a cusp pole and must not be discarded.

**Acceptance checks.**

- For N=1, M₂=ℚ(λ).
- No arbitrary complex constants enter the rational coefficient field.

### W3.2. The field R₂N

**Target:** `ModularFormsPartII:W3/bounded-field` (definition).

Inside the same ℚ((q^{1/N})), R₂N is the ℚ(λ)-linear span of expansions at ∞ of rational-coefficient weight-zero weak forms invariant under some finite-index group H containing E with every cusp width dividing 2N, and having one common denominator. Equivalently choose an admissible H for each generator. A generator can have finitely many negative terms; multiplication by a power of λ makes it holomorphic at ∞ without changing the span. The ℚ(λ)-span itself can introduce interior poles through rational functions of λ.

**Direct dependencies:** `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W1/bounded-denominators`, `ModularFormsPartII:W1/wohlfahrt-level`, `ModularFormsPartII:W2/lambda-function-ring`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Definition 4.2.1(2), p.655; Proposition 3.0.1, p.650. The second span permits finite-index stabilizers with bounded geometric level and bounded rational Fourier denominators. The target specifies the ambient Laurent field and distinguishes its generators from arbitrary scalar combinations.

**Construction and proof.**

1. Use the union of admissible generating sets, not a fixed group asserted in advance.
2. Separate holomorphic generators from the scalar span so that field division does not impose false interior holomorphy.

**Uses that determine the API.**

- W3 Proposition 3.0.1: Holonomy gives a uniform rank estimate.
- W5 leveraging: p-scaling yields new generators at the multiplied level.

**API.**

- `mem_R2N_of_bounded` (constructor): An admissible rational weak modular function with bounded denominators defines a generator.
- `R2N_map_dvd` (functoriality): If N∣M, reindexing the Laurent variable embeds R₂N into R₂M.
- `R2N_mul_generator` (structure): Products of generators are admissible on the intersection group.
- `R2N_shift_lambda` (compatibility): Multiplying a generator by λ^m clears its pole at ∞ for m large and does not change its ℚ(λ)-span.

**Unit tests.**

- `R2_constants` (computation): Every rational constant belongs to R₂; 1/2 is accepted.
- `R2_bad_denominators` (non-example): A series is not admitted solely because it lies in ℤ[1/2]((q)); a uniform exponent bound is still required.
- `R4_inclusion` (compatibility): Every rational Γ(4) modular function belongs to R₄ by the all-prime congruence denominator theorem.
- `R_span_interior_poles` (non-example): An element of the scalar span may have interior poles; demanding that every span element be holomorphic changes the definition.

**Acceptance checks.**

- The admissible group is existential and can vary with the generator.
- A fixed finite denominator is required.

### W3.3. Congruence functions have bounded denominators

**Target:** `ModularFormsPartII:W3/congruence-inclusion` (theorem).

For all N≥1, M₂N⊆R₂N as subspaces in the specified Laurent field.

**Direct dependencies:** `ModularFormsPartII:W3/congruence-field`, `ModularFormsPartII:W3/bounded-field`, `ModularFormsPartII:W1/clear-cusp-poles`, `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.2, p.655. The inclusion uses the congruence bounded-denominator theorem after clearing cusp poles by the discriminant. It needs a bound at every prime, including primes dividing the level.

**Construction and proof.**

1. Apply the exact all-prime bounded-denominator supplier to fΔ^m, not just a lattice over ℤ[1/(2N)].
2. Divide by the integral unit-times-monomial expansion Δ^m=q^{2m}∏(1−q^{2n})^{24m}; principal level gives every width dividing 2N.

**Acceptance checks.**

- The primes dividing 2N are included in the denominator conclusion.

### W3.4. The modular holonomy embedding

**Target:** `ModularFormsPartII:W3/holonomy-embedding` (theorem).

For N≥1, U_N=ℂ∖16^{−1/N}μ_N, t=q^{1/N} and u(t)=x_N(t), the reparametrized field R₂N embeds in V(U_N,u(t),ℤ) over ℚ(u^N)=ℚ(λ). The H and V carriers and their monodromy convention are imported from the proposed arithmetic-algebraization owner. Generators enter after denominator and principal-part clearing; arbitrary elements enter the rational-function span.

**Direct dependencies:** `ModularFormsPartII:W3/bounded-field`, `ModularFormsPartII:W2/kummer-coordinate`, `ModularFormsPartII:W2/lambda-covering`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Proposition 3.0.1, pp.650–651; Definition 2.0.4, pp.635–636. The proposition pulls modular functions back along the lambda root and places their span in the arithmetic holonomy space. The target states the whole-operator local monodromy condition and imports the H/V theory from its owner.

**Construction and proof.**

1. Use the finite cover Y(H)→Y(2) and its algebraic function field to obtain a differential equation for a generator.
2. Pull back by u↦u^N; its whole algebraic solution space has trivial monodromy away from the omitted punctures and at 0 because all cusp widths divide 2N.
3. Clear apparent poles with a polynomial and the generator denominator, then use the defining ℚ(u)-span V.

**Acceptance checks.**

- Do not infer trivial monodromy of an entire operator from one single-valued solution.
- u(t)^N is integral; u(t) need not be.

### W3.5. Finiteness of the bounded-denominator field

**Target:** `ModularFormsPartII:W3/finite-rank` (theorem).

For each N≥1, dim_{ℚ(λ)}R₂N is finite. The qualitative argument uses a pointed disc map to U_N with derivative 1 which is not a universal covering; comparison with the universal covering makes the uniformization radius strictly greater than 1. The N=1 case can instead be embedded into N=2.

**Direct dependencies:** `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W2/lambda-covering`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.2, p.655; §1.1.6, p.632. The field lemma uses a uniformization radius greater than one to obtain finite rank from the arithmetic holonomy bound. The target orders this before any finite-basis construction and treats the smallest level separately.

**Construction and proof.**

1. Apply Corollary 2.0.5 to the holonomy embedding and a pointed uniformization of radius >1.
2. For N≥2 strictness follows because the λ-root disc map is not a covering; the Schwarz equality case rules out equality of radii. Use the exact quantitative supplier as an alternative.

**Acceptance checks.**

- Finiteness is proved before selecting a finite basis of R₂N.

### W3.6. The two spans are fields

**Target:** `ModularFormsPartII:W3/field-structures` (theorem).

M₂N and R₂N are finite-dimensional ℚ(λ)-subalgebras of the domain ℚ((t)); thus each is a field, with the inclusions ℚ(λ)→M₂N→R₂N injective.

**Direct dependencies:** `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W3/congruence-inclusion`, `ModularFormsPartII:W1/level-intersection`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.3, pp.655–656. The two spans are algebras inside a Laurent-series field. Finite-dimensionality then turns multiplication by a nonzero element into an invertible linear map, producing field inverses.

**Construction and proof.**

1. Products of admissible generators have the common denominator product and the intersection group with the same level bound.
2. Multiplication by a nonzero element is an injective endomorphism of a finite-dimensional vector space, hence surjective; solve for its inverse.

**Acceptance checks.**

- The constant field is still ℚ; field structure does not add √2.

### W3.7. A normal stabilizer at exact geometric level

**Target:** `ModularFormsPartII:W3/normal-stabilizer` (theorem).

There is a normal finite-index subgroup G₂N of SL₂(ℤ) with E≤G₂N≤⟨E,Γ(2N)⟩, L(G₂N)=2N, and every function of R₂N invariant under G₂N. For N=1 the upper group is Γ(2), whose signed level is 2.

**Direct dependencies:** `ModularFormsPartII:W3/field-structures`, `ModularFormsPartII:W3/congruence-inclusion`, `ModularFormsPartII:W1/level-normal-core`, `ModularFormsPartII:W1/level-intersection`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.3, pp.655–656, with extraction correction E7. The field lemma selects finitely many modular generators and takes a normal core. Adding the signed principal subgroup before taking the core repairs the unsupported exact-level claim.

**Construction and proof.**

1. Choose finitely many weak modular function generators spanning R₂N. Intersect their stabilizers AND ⟨E,Γ(2N)⟩ before taking the ambient normal core.
2. Each initial group has level dividing 2N and the included principal group forces the reverse level divisibility. All rational combinations remain invariant.

**Acceptance checks.**

- For R₂=M₂ a basis {1} alone must not produce the full SL₂(ℤ) stabilizer.

### W3.8. The modular holonomy rank bound

**Target:** `ModularFormsPartII:W3/quantitative-rank` (theorem).

Suppose normalized coverings F_N:𝔻→ℂ∖μ_N satisfy, for all sufficiently large N, |F_N′(0)|≥16^{1/N}(1+A/N³) for some A>0, and for each fixed B>0 their circle means at r=1−B/N³ satisfy ∫log⁺|F_N(re^{iθ})|dθ/(2π)≤C_B(log N)/N. Then [R₂N:ℚ(λ)]≤C N³ log(2N) for all N≥1, after enlarging C for finitely many small levels.

**Direct dependencies:** `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W2/kummer-coordinate`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proposition 3.0.1, pp.649–651; Corollary 2.0.5, p.636; §6.3, p.685. The proposition combines a covering derivative gain of order N to the minus third power with a logarithmic boundary mean estimate. The target isolates those two inputs and obtains the uniform cubic-logarithmic field bound.

**Construction and proof.**

1. Set φ(z)=16^{−1/N}F_N(rz) with r=1−A/(2N³), adjusting the fixed constant for sufficiently large N. Its log derivative at 0 is bounded below by c/N³.
2. Use p(u)=u^N, p(u(t))=x(t^N) integral. The numerator e∫log⁺|φ^N| is O(log N), so Corollary 2.0.5 gives O(N³log N).
3. Absorb all small N into C using finite rank; log(2N) avoids the meaningless zero bound at N=1.

**Acceptance checks.**

- All constants in the final bound are independent of N.
- The mean estimate, not a supremum estimate exponential in N, is essential.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: ALG, UNI.

## W4. Congruence cohomology and invariant vectors

Define congruence classes and the all-level direct limit of H¹. Compute finite and p-adic SL₂ cohomology through Hochschild–Serre, Lazard, adjoint H¹ and certified small-level linear algebra; prove absence of invariant vectors, the congruence-difference criterion, and the final p-adic H² calculation.

**Layer dependencies:** `ModularFormsPartII:W1`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `NoncommutativeAndEquivariantIwasawa:NE.0`, `ArithmeticGaloisDuality:D7`, `ArithmeticGaloisDuality:R02.2`, `ArithmeticGaloisRepresentations:G7`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**Planets:** Congruence cohomology classes; All-level modular cohomology; Vanishing of all-level invariants; Congruence-difference criterion; Low-degree p-adic SL₂ cohomology.

### W4.1. Congruence cohomology classes

**Target:** `ModularFormsPartII:W4/congruence-class` (definition).

For a finite-index Γ≤SL₂(ℤ) and a finite trivial coefficient module A, H¹_cong(Γ,A) is the union of the kernels of restriction H¹(Γ,A)→H¹(Γ∩Γ(m),A), m≥1. Equivalently these are continuous homomorphisms from the congruence completion Γ̂=lim Γ/(Γ∩Γ(m)). The completion is the closure of Γ inside SL₂(ℤ̂), not its full profinite completion.

**Direct dependencies:** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `mathlib:CongruenceSubgroup.Gamma`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Definition 4.5.1, p.660. The definition distinguishes congruence characters by their vanishing on a deeper principal-level intersection. The target makes their relation to the congruence completion, rather than the full profinite completion, explicit.

**Construction and proof.**

1. Use the imported continuous H¹ and inverse-limit carriers; a finite-valued homomorphism factors through a congruence quotient exactly when its kernel contains a principal-level intersection.

**Uses that determine the API.**

- W4 invariant theorem: Remove exactly the congruence submodule.
- W5 enhanced Ihara: The conclusion says classes become zero after congruence restriction.

**API.**

- `congruenceClass_iff_kernel` (characterisation): A class is congruence iff its kernel contains Γ∩Γ(m) for some m.
- `congruenceClass_completion` (compatibility): Inflation identifies H¹_cont(Γ̂,A) with this submodule.
- `congruenceClass_restrict` (functoriality): Restriction to finite-index subgroups preserves the predicate.
- `congruenceClass_add` (structure): Congruence classes form an A-submodule when A is a finite field.

**Unit tests.**

- `cong_principal_reduction` (computation): Any homomorphism factoring through Γ/(Γ∩Γ(m)) is congruence.
- `cong_zero` (degenerate): The zero class is congruence, already at m=1.
- `cong_not_profinite` (non-example): Being continuous for the full profinite topology alone does not imply congruence.
- `cong_restrict_zero` (compatibility): A congruence class has zero image in the all-level direct limit.

**Acceptance checks.**

- An arbitrary finite quotient need not be congruence.

### W4.2. The all-level H¹ module

**Target:** `ModularFormsPartII:W4/completed-h1` (definition).

For A=𝔽ℓ or ℚ/ℤ, put H̃¹(A)=colim_m H¹(Γ(m),A), with restriction maps for divisibility of positive levels. Its smooth SL₂(ℤ̂)-action extends conjugation by SL₂(ℤ). For finite A the kernel of H¹(Γ(m),A)→H̃¹(A) is exactly H¹_cong. For ℚ/ℤ, take the filtered union of finite torsion coefficient groups. This is an all-level direct limit, not a fixed-prime completed cohomology object.

**Direct dependencies:** `ModularFormsPartII:W4/congruence-class`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 4.5.2 and construction preceding (4.5.10), pp.660,663–664. The invariant argument passes through the direct limit of first cohomology over all principal levels. The target fixes the indexing, smooth action and kernel of the map from a level class.

**Construction and proof.**

1. Normal congruence levels make the action on each finite set of classes factor through a finite quotient after sufficiently deep restriction.
2. Use exactness of filtered colimits and the finite generation of each Γ(m) to identify the kernel and commute finite coefficient limits.

**Uses that determine the API.**

- W4 Theorem 4.5.2: The invariant space is the central vanishing target.
- W4 Corollary 4.5.3: An almost invariant class maps to an invariant vector here.

**API.**

- `allLevelH1_ofLevel` (constructor): Every level class has a canonical direct-limit image.
- `allLevelH1_kernel` (characterisation): The image is zero exactly for congruence classes.
- `allLevelH1_action` (structure): The smooth action restricts to ordinary conjugation and is compatible with coefficient maps.
- `allLevelH1_torsion_union` (compatibility): H̃¹(ℚ/ℤ) is the filtered coefficient union of finite torsion modules.

**Unit tests.**

- `limit_cong_killed` (computation): Every character obtained from reduction modulo an integer vanishes in H̃¹.
- `limit_level_one_h1` (degenerate): H¹(SL₂(ℤ),𝔽ℓ) maps to zero, as its characters factor through level 12.
- `limit_all_levels` (non-example): A limit using only m=ℓ^a is not substituted for the divisibility limit over all m.
- `limit_action` (compatibility): The action on an image from level m agrees with conjugation after passing to a common normal level.

**Acceptance checks.**

- Do not confuse the limit with H¹ of the full profinite completion.

### W4.3. Uniform principal p-adic kernels

**Target:** `ModularFormsPartII:W4/uniform-kernels` (construction).

For p prime let G_p(p^a)=ker(SL₂(ℤ_p)→SL₂(ℤ/p^a)). For odd p and a≥1, and for p=2 and a≥2, these are torsion-free uniform pro-p groups of dimension 3. The map g↦(g−I)/p^a mod p identifies G_p(p^a)/G_p(p^{a+1}) with sl₂(𝔽_p), equivariantly under conjugation by SL₂(ℤ_p).

**Direct dependencies:** `NoncommutativeAndEquivariantIwasawa:NE.0/lazard-exterior-cohomology`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Lemma 4.5.6 and Lemma 4.5.9, pp.661–663. The local calculation uses Lazard theory on sufficiently deep principal p-adic kernels. The target checks the uniformity ranges, excluding the level-two kernel containing central two-torsion.

**Construction and proof.**

1. Check the determinant expansion, successive p-power maps and commutator valuation directly, retaining the stronger 2-adic bound.
2. Invoke the generic Lazard theorem only after proving the special kernel satisfies its hypotheses.

**Uses that determine the API.**

- W4 local H²: Identify H¹ and exterior H² with the adjoint representation.
- W4 restriction at 2: Restriction G₂(4)→G₂(8) kills H¹ and therefore H².

**API.**

- `principalPadicKernel_quotient` (characterisation): The successive quotient is the additive trace-zero matrix module.
- `principalPadicKernel_uniform` (structure): The specified odd and 2-adic ranges are uniform of rank 3.
- `principalPadicKernel_conjugation` (compatibility): The quotient identification respects the reduced adjoint action.
- `principalPadicKernel_restriction` (relation): Restriction to the next p-power kernel is zero on H¹(−,𝔽_p).

**Unit tests.**

- `kernel_rank_three` (computation): H¹(G_p(p^a),𝔽_p) has dimension 3 in the stated range.
- `kernel_two_torsion` (non-example): −I lies in G₂(2), contradicting torsion-freeness at a=1.
- `kernel_restriction_two` (compatibility): H²(G₂(4),𝔽₂)→H²(G₂(8),𝔽₂) is zero by the exterior algebra and vanishing H¹ restriction.

**Acceptance checks.**

- G₂(2) contains −I and is excluded from the uniform claim.

### W4.4. The Schur multiplier of SL₂ over a prime field

**Target:** `ModularFormsPartII:W4/finite-schur` (theorem).

For every prime p, H₂(SL₂(𝔽_p),ℤ)=0. This is finite-group integral homology, not integral cohomology.

**Direct dependencies:** `ArithmeticGaloisDuality:D7/finite-group-uct-sylow`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.4, pp.660–661. The lemma proves vanishing of the integral Schur multiplier by Sylow detection and periodic groups. The target handles the prime-two cyclic Sylow case separately and distinguishes homology from cohomology.

**Construction and proof.**

1. Use Sylow restriction to detect primary Schur-multiplier classes. Odd Sylow subgroups are cyclic; for odd p the 2-Sylow subgroups are generalized quaternion.
2. Apply the cyclic and generalized-quaternion integral homology calculation; treat SL₂(𝔽₂)≃S₃ directly, since its 2-Sylow is cyclic, not quaternion. The periodic-cohomology input is recorded in FIN.

**Acceptance checks.**

- Test p=2 and p=3 independently of the generic perfect-group range.

### W4.5. Finite SL₂ low-degree cohomology

**Target:** `ModularFormsPartII:W4/finite-low-cohom` (theorem).

For primes p,ℓ and n=1,2, Hⁿ(SL₂(𝔽_p),𝔽ℓ)≃𝔽ℓ when p=ℓ∈{2,3}, and is zero otherwise.

**Direct dependencies:** `ModularFormsPartII:W4/finite-schur`, `ArithmeticGaloisDuality:D7/finite-group-uct-sylow`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.5, p.661. The finite-group lemma deduces degree-one and degree-two mod-prime cohomology from abelianization and the Schur multiplier. Only the matching primes two and three survive.

**Construction and proof.**

1. Compute the abelianizations S₃^ab=C₂, SL₂(𝔽₃)^ab=C₃, and trivial abelianization for p≥5 by elementary transvections.
2. Apply the finite-group UCT, duality and the zero integral Schur multiplier.

**Acceptance checks.**

- p=5 has zero H² here; the exceptional adjoint H¹ at 5 occurs in the p-adic calculation.

### W4.6. The p-adic abelianization without a cohomology cycle

**Target:** `ModularFormsPartII:W4/local-abelianization` (theorem).

The continuous abelianization of SL₂(ℤ_p) is C₄ for p=2, C₃ for p=3 and zero for p≥5. At p=2 the quotient factors through level 4, and at p=3 through level 3.

**Direct dependencies:** `ModularFormsPartII:W4/uniform-kernels`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.6 proof, p.662; Lemma 4.5.12, p.665. The local first-cohomology argument requires the p-adic abelianization, with a special order-four answer at two. The target supplies this directly before using local second cohomology, removing a possible cycle.

**Construction and proof.**

1. Compute elementary-transvection commutators and close the derived subgroup. For p≥5 a diagonal unit with u²−1 invertible kills each transvection.
2. At 2 use the explicit abelianization of SL₂(ℤ/4); at 3 use SL₂(𝔽₃). Show deeper elementary kernels lie in the closed commutator subgroup. This direct calculation precedes every H² use.

**Acceptance checks.**

- The mod-2 abelianization is C₂; replacing the 2-adic answer C₄ by C₂ loses a character.

### W4.7. Continuous H¹ of p-adic SL₂

**Target:** `ModularFormsPartII:W4/local-h1` (theorem).

For all primes p,ℓ, H¹_cont(SL₂(ℤ_p),𝔽ℓ) has dimension 1 when p=ℓ∈{2,3} and dimension 0 otherwise.

**Direct dependencies:** `ModularFormsPartII:W4/local-abelianization`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.6, p.661–662. The first part of the local lemma computes continuous additive characters. The independently computed abelianization gives precisely the two exceptional one-dimensional cases.

**Construction and proof.**

1. Identify H¹ with continuous additive characters of the abelianization computed independently above.

**Acceptance checks.**

- At p=2 this does not appeal forward to Lemma 4.5.12.

### W4.8. The preliminary local H² bound

**Target:** `ModularFormsPartII:W4/local-h2-preliminary` (theorem).

H²_cont(SL₂(ℤ_p),𝔽ℓ)=0 unless p=ℓ∈{2,3,5}. For odd p, the Hochschild–Serre filtration injects this H² into an extension of H²(SL₂(𝔽_p),𝔽_p) by H¹(SL₂(𝔽_p),sl₂(𝔽_p)), with no invariant exterior-square contribution. No dimension claim at 2 is made here.

**Direct dependencies:** `ModularFormsPartII:W4/finite-low-cohom`, `ModularFormsPartII:W4/uniform-kernels`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `NoncommutativeAndEquivariantIwasawa:NE.0/lazard-exterior-cohomology`, `ArithmeticGaloisRepresentations:G7/h1-of-sl2-with-adjoint-coefficients`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.6 and (4.5.8), pp.661–662; source correction E1. The preliminary second-cohomology argument combines the finite quotient, Lazard exterior powers and adjoint first cohomology. It leaves the possible exceptional primes two, three and five for the invariant argument.

**Construction and proof.**

1. For ℓ≠p, the pro-p kernel has no positive cohomology with ℓ-primary coefficients, so use the finite quotient.
2. For odd p identify the dual adjoint module by trace, H² of the kernel with its exterior square, and prove its invariant space zero. The imported adjoint H¹ is nonzero only at p=5.
3. The p=2 case remains for the invariant argument.

**Acceptance checks.**

- The exceptional adjoint group at p=5 is over 𝔽₅, not 𝔽₃.

### W4.9. Localization of product H²

**Target:** `ModularFormsPartII:W4/product-h2` (theorem).

Projection induces H²_cont(SL₂(ℤ̂),𝔽ℓ)≃H²_cont(SL₂(ℤℓ),𝔽ℓ). Also H²_cont(Γ̂(ℓ^a),𝔽ℓ)≃H²_cont(G_ℓ(ℓ^a),𝔽ℓ) for a≥1.

**Direct dependencies:** `ModularFormsPartII:W4/local-h1`, `ModularFormsPartII:W4/local-h2-preliminary`, `ArithmeticGaloisDuality:D7/profinite-product-kunneth`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.9, pp.662–663. The comparison lemma isolates the coefficient prime in degree-two cohomology of the product of all p-adic factors. Degree-one cross terms vanish because only one local factor can contribute.

**Construction and proof.**

1. Use the product decomposition SL₂(ℤ̂)=∏_p SL₂(ℤ_p) and its principal-level variant.
2. In degree two, cross terms use two nonzero H¹ factors, impossible since only the ℓ factor can contribute. Continuous cochains with finite coefficients reduce to finite products.

**Acceptance checks.**

- The ℓ=2 and ℓ=3 factors remain, rather than being discarded by perfectness.

### W4.10. Deep principal restriction kills H²

**Target:** `ModularFormsPartII:W4/restriction-h2` (theorem).

For odd ℓ the restriction H²_cont(SL₂(ℤ̂),𝔽ℓ)→H²_cont(Γ̂(ℓ^a),𝔽ℓ) is zero for a≥1. For ℓ=2 it is zero for a≥3.

**Direct dependencies:** `ModularFormsPartII:W4/product-h2`, `ModularFormsPartII:W4/uniform-kernels`, `ModularFormsPartII:W4/local-h2-preliminary`, `NoncommutativeAndEquivariantIwasawa:NE.0/lazard-exterior-cohomology`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.9, p.663. The restriction part of the comparison lemma kills degree two after passing to a principal kernel. At two the proof needs an extra restriction from level four to level eight.

**Construction and proof.**

1. For odd ℓ the restriction lands in invariant exterior-square cohomology, which is zero.
2. At 2 first restrict to G₂(4); restriction onward to G₂(8) is zero on H¹ and hence on its exterior algebra.

**Acceptance checks.**

- The 2-adic threshold asserted here is 8, not 2.

### W4.11. Integral modular-group comparison

**Target:** `ModularFormsPartII:W4/sl2z-cohom` (theorem).

For n>0, Hⁿ(SL₂(ℤ),ℤ) is ℤ/12 in positive even degree and zero in odd degree. The abelianization is C₁₂ and the map H¹_cont(SL₂(ℤ̂),𝔽ℓ)→H¹(SL₂(ℤ),𝔽ℓ) is an isomorphism for every ℓ.

**Direct dependencies:** `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `ModularFormsPartII:W4/local-h1`, `ArithmeticGaloisDuality:D7/profinite-product-kunneth`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equations (4.5.10) and (4.5.14), pp.664–665. The comparison diagram uses the modular group's abelianization and integral cohomology, obtained from its cyclic amalgam presentation. Congruence level twelve detects its additive finite characters.

**Construction and proof.**

1. Use the presentation C₄ *_{C₂} C₆ and the amalgam cohomology sequence, including the maps induced by the central inclusions.
2. The abelianization C₁₂ is detected by congruence level 12, and product H¹ has the same primary characters. The exact generic amalgam cohomology input is part of FIN.

**Acceptance checks.**

- H¹(SL₂(ℤ),ℤ)=0 does not say its abelianization is zero.

### W4.12. The all-level Hochschild–Serre diagram

**Target:** `ModularFormsPartII:W4/hs-comparison` (theorem).

There is a natural exact row 0→H¹(SL₂(ℤ̂),𝔽ℓ)→H¹(SL₂(ℤ),𝔽ℓ)→H̃¹(𝔽ℓ)^{SL₂(ℤ̂)}→H²(SL₂(ℤ̂),𝔽ℓ)→H²(SL₂(ℤ),𝔽ℓ). For N≥3 the corresponding row for Γ(N) ends with H²(Γ(N),𝔽ℓ)=0, and restriction gives the commutative comparison diagram.

**Direct dependencies:** `ModularFormsPartII:W4/completed-h1`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (4.5.10), p.664. The diagram is the all-level Hochschild–Serre five-term comparison between the modular group and its congruence completion. At torsion-free principal levels the discrete degree-two term is zero.

**Construction and proof.**

1. Apply the finite-level Hochschild–Serre five-term sequences, then the filtered-colimit comparison giving the all-level module.
2. Use the torsion-free finite-rank freeness of Γ(N), N≥3. Prove compatibility of both rows and transgression under restriction.

**Acceptance checks.**

- The free-group assertion is not applied to Γ(2), which contains −I.

### W4.13. Certified small-level invariant calculations

**Target:** `ModularFormsPartII:W4/small-level-invariants` (theorem).

The SL₂(ℤ/N)-invariants in H¹(Γ(N),𝔽ℓ) have dimension 0 for (N,ℓ)=(3,3),(5,5), and dimension 1 for (N,ℓ)=(4,2),(8,2),(16,2). In the first two cases even the semisimplification has no invariant constituent. At N=4 the semisimplification invariant dimension is also 1. At N=4,8,16 the invariant line is congruence and factors through Γ(N)/Γ(2N).

**Direct dependencies:** `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `ModularFormsPartII:W4/congruence-class`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.11 and final part of Theorem 4.5.2 proof, pp.664–665. The proof reduces the remaining primes to invariant calculations at levels three, five, four, eight and sixteen. The target replaces software output by verifiable Schreier, row-reduction and composition-factor certificates.

**Construction and proof.**

1. Produce a Schreier basis from the S,T coset action and exact matrices for conjugation on its abelianization. The respective free ranks are 3,11,5,33,257 when listed as levels 3,5,4,8,16.
2. Certify invariant dimensions by row reduction of stacked S−I,T−I over the finite field; certify the semisimplified claims by explicit composition-factor filtrations at levels 3,5,4.
3. For N=4,8,16 the character g↦a+b+c mod2, where (g−I)/N≡[[a,b],[c,a]], gives the nonzero congruence invariant. Its invariance follows from conjugation by S and T.

**Acceptance checks.**

- Supply finite certificates and their verification; a Magma dimension printout alone is not the planned proof.

### W4.14. No invariant all-level classes

**Target:** `ModularFormsPartII:W4/all-level-invariants` (theorem).

For A=𝔽ℓ, every prime ℓ, and for A=ℚ/ℤ, H̃¹(A)^{SL₂(ℤ̂)}=0.

**Direct dependencies:** `ModularFormsPartII:W4/hs-comparison`, `ModularFormsPartII:W4/sl2z-cohom`, `ModularFormsPartII:W4/restriction-h2`, `ModularFormsPartII:W4/small-level-invariants`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 4.5.2, p.660, proof pp.664–665. The theorem proves that the all-level direct limit has no invariant classes. The proof combines the comparison diagram, deep restriction and the small-level calculations before returning to final local cohomology.

**Construction and proof.**

1. For ℓ>5 the preliminary local H² vanishes, and H¹ comparison kills the invariant term. For ℓ=3,5 restrict to the corresponding principal level and use its zero invariants.
2. For ℓ=2 restrict to level 8; the possible invariant is congruence and can be subtracted. Its image at level 16 is again the unique congruence line, hence zero in the direct limit.
3. For ℚ/ℤ reduce any nonzero invariant torsion element to an invariant of prime order, using finite generation at its representing level.

**Acceptance checks.**

- No use of the final local H² calculation is permitted before this proof.

### W4.15. The congruence-difference criterion

**Target:** `ModularFormsPartII:W4/difference-criterion` (theorem).

Let N≥1, let A=𝔽ℓ or ℚ/ℤ, and ψ∈H¹(Γ(N),A). If ψ^g−ψ is a congruence class for every g∈SL₂(ℤ), then ψ is congruence.

**Direct dependencies:** `ModularFormsPartII:W4/all-level-invariants`, `ModularFormsPartII:W4/completed-h1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Corollary 4.5.3, p.660. The corollary says that a character whose conjugation differences are all congruence is itself congruence. Its image in the all-level limit is invariant and hence zero.

**Construction and proof.**

1. Its image in the smooth all-level module is fixed by the dense SL₂(ℤ), hence by SL₂(ℤ̂). Use vanishing and the kernel characterization.

**Acceptance checks.**

- The conclusion is congruence after deeper restriction, not ψ=0 at its original level.

### W4.16. The final p-adic H² computation

**Target:** `ModularFormsPartII:W4/local-h2-final` (theorem).

For all primes p,ℓ and n=1,2, Hⁿ_cont(SL₂(ℤ_p),𝔽ℓ) has dimension 1 if p=ℓ∈{2,3}, and 0 otherwise.

**Direct dependencies:** `ModularFormsPartII:W4/all-level-invariants`, `ModularFormsPartII:W4/hs-comparison`, `ModularFormsPartII:W4/sl2z-cohom`, `ModularFormsPartII:W4/product-h2`, `ModularFormsPartII:W4/local-abelianization`, `ArithmeticGaloisDuality:D7/finite-group-uct-sylow`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.12 and (4.5.14), p.665. The final local lemma removes the preliminary prime-five exception using invariant vanishing. At primes two and three the independently computed abelianization supplies the matching lower bound.

**Construction and proof.**

1. All-level vanishing injects product H² into H²(SL₂(ℤ),𝔽ℓ), whose dimension is at most one exactly at ℓ=2,3.
2. Local abelianization and UCT give the matching lower bound in these two cases. The p=5 exception in the preliminary bound disappears.

**Acceptance checks.**

- Check both p=2 and p=5; a proof assuming perfectness throughout misses the former.

### W4.17. The integral homology conclusion with a coefficient contract

**Target:** `ModularFormsPartII:W4/integral-local-h2` (theorem).

In the continuous completed-bar homology theory with compact ℤ̂ coefficients, H₂(SL₂(ℤ_p),ℤ̂)=0 for every p. This is the precise compact-coefficient interpretation required for the integral homology clause of Lemma 4.5.12; no assertion about abstract discrete homology is made.

**Direct dependencies:** `ModularFormsPartII:W4/local-h2-final`, `ModularFormsPartII:W4/local-abelianization`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.5.12 and (4.5.13), p.665. The lemma includes an integral homology conclusion whose continuous coefficient theory is not specified there. The target fixes compact completed coefficients and records the UCT and finite-generation bridge that must justify it.

**Construction and proof.**

1. Use the compact-coefficient UCT and finite-generation/completion contract COEFF. The H₂-to-mod-ℓ quotient is zero because all mod-ℓ degree-two classes are already accounted for by torsion in H₁.
2. Apply topological Nakayama to each primary compact homology module, with the supplier ensuring finite generation and compatibility.

**Acceptance checks.**

- The symbol ℤ in the source must not silently switch between ordinary and compact continuous coefficients.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: FIN, COEFF.

## W5. Ihara generation and leveraging

Prove the nonabelian Ihara and triple-surjectivity statements with the corrected reduction kernel, the generation identity and enhanced abelian lemma. Establish field-intersection and base-change degree identities, p-scaling separation, degree doubling, and the Chebyshev contradiction.

**Layer dependencies:** `ModularFormsPartII:W1`, `ModularFormsPartII:W2`, `ModularFormsPartII:W3`, `ModularFormsPartII:W4`, `ModularCurvesPartII:R14.4`, `ModularCurvesPartII:R12.4`, `ModularCurvesPartII:R13.5`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Planets:** Enhanced Ihara lemma; Nonabelian Ihara lemma; Triple Ihara surjectivity; Leveraging by p-scaling; Degree doubling.

### W5.1. Abelian Ihara lemma at principal level

**Target:** `ModularFormsPartII:W5/abelian-ihara` (theorem).

For N≥3 and primes p,q with p∤N, set D=Γ(N)∩Γ₀(p), A=diag(p,1). The kernel of H¹(Γ(N),𝔽q)²→H¹(D,𝔽q), (ψ,φ)↦ψ|D−φ∘Ad_A, lies in H¹_cong(Γ(N),𝔽q)².

**Direct dependencies:** `ModularFormsPartII:W4/congruence-class`, `ModularCurvesPartII:R14.4`, `mathlib:Subgroup.goursat_surjective`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.6.2, p.666. The ordinary Ihara lemma controls pairs of characters with equal restrictions under the two degeneracy maps. The target retains every coefficient prime and isolates the arithmetic amalgam/CSP input.

**Construction and proof.**

1. Dualize the two restriction maps to the maximal elementary q-abelian quotient. A failure of product surjectivity gives a common quotient by Goursat.
2. The common quotient extends to the arithmetic amalgam SL₂(ℤ[1/p])(N). Its congruence subgroup property makes both characters congruence. The exact arithmetic amalgam/CSP input is recorded in CSP.

**Acceptance checks.**

- The source imposes no restriction q∤Np; keep torsion coefficient primes.

### W5.2. Enhanced Ihara lemma

**Target:** `ModularFormsPartII:W5/enhanced-ihara` (theorem).

For N≥3, p∤N and any prime q, the kernel of the same difference map followed by restriction to Γ(N)∩Γ₁(p) is contained in H¹_cong(Γ(N),𝔽q)².

**Direct dependencies:** `ModularFormsPartII:W5/abelian-ihara`, `ModularFormsPartII:W4/difference-criterion`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.6.3, p.666. The enhanced lemma replaces the intermediate group by its Gamma-one subgroup. Applying the congruence-difference criterion to the two characters upgrades the ordinary lemma.

**Construction and proof.**

1. Conjugation by the level-N quotient preserves the kernel of the second restriction. For a kernel pair, subtract each conjugate pair; it now lies in the ordinary Ihara kernel.
2. Both differences are congruence by ordinary Ihara, so Corollary 4.5.3 applies separately to ψ and φ.

**Acceptance checks.**

- The target group is Γ₁(p), not Γ(p).

### W5.3. Nonabelian Ihara surjectivity

**Target:** `ModularFormsPartII:W5/nonabelian-ihara` (theorem).

Let E≤G≤⟨E,Γ(N)⟩, with G normal of finite index in SL₂(ℤ), L(G)=N, and p∤N prime. Put S=⟨E,Γ(N)⟩/G and D±=⟨E,Γ(N)⟩∩Γ₀(p). The map D±→S×S, g↦(gG,AgA⁻¹G), is surjective. The second conjugate belongs to ⟨E,Γ(N)⟩; conjugation does not preserve Γ₀(p).

**Direct dependencies:** `ModularFormsPartII:W1/wohlfahrt`, `ModularFormsPartII:W1/wohlfahrt-level`, `ModularCurvesPartII:R14.4`, `mathlib:Subgroup.goursat_surjective`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.4.1, pp.658–659. The nonabelian lemma uses Goursat and the arithmetic congruence subgroup property to rule out a common quotient. The target corrects the codomain of diagonal conjugation and retains central signs.

**Construction and proof.**

1. Goursat turns a proper subdirect product into a common nontrivial quotient. The two maps extend across the arithmetic amalgam, using the corrected conjugation codomain.
2. The CSP supplier makes its restriction a congruence quotient. Its kernel contains G and E, hence has geometric level dividing N; Wohlfahrt forces the entire ⟨E,Γ(N)⟩ into this kernel, contradiction.

**Acceptance checks.**

- If S is trivial, the result is the unique map onto the one-point product.

### W5.4. Triple surjectivity with the correct kernel

**Target:** `ModularFormsPartII:W5/triple-surjectivity` (theorem).

Under the preceding hypotheses with N≥3, let D=Γ(N)∩Γ₀(p), and let B be the upper triangular subgroup of SL₂(𝔽p). The map D→S×S×B given by the two quotient maps and reduction modulo p is surjective. On this unsigned domain the reduction kernel is Γ(Np).

**Direct dependencies:** `ModularFormsPartII:W5/nonabelian-ihara`, `ModularFormsPartII:W5/enhanced-ihara`, `ModularFormsPartII:W1/wohlfahrt`, `mathlib:Subgroup.goursat_surjective`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.4.4, pp.659–660, corrected unsigned domain. The triple map adds the diagonal reduction character to the two noncongruence quotients. The target computes its reduction kernel on the unsigned principal-level domain before restoring the signs.

**Construction and proof.**

1. Because E⊆G, restricting from the signed to unsigned domain leaves the S×S image unchanged. The level-N unipotent lies in both quotient kernels and reduces onto the unipotent radical of B.
2. Any common nontrivial quotient now comes from the torus B/U, hence has a prime-order character. Enhanced Ihara makes its two S-characters congruence; Wohlfahrt and the exact level of G kill them.
3. Use CRT to identify the reduction kernel on Γ(N); adjoining E is done only after this computation.

**Acceptance checks.**

- −I is not silently identified with I modulo Np.

### W5.5. The group generation identity

**Target:** `ModularFormsPartII:W5/generation` (theorem).

With N≥3 and the same G,p,A, the subgroup generated by E, G∩Γ(Np), and A⁻¹GA∩Γ₀(p) equals ⟨E,Γ(N)⟩∩Γ₀(p).

**Direct dependencies:** `ModularFormsPartII:W5/triple-surjectivity`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (4.4.9), p.660. The generation formula follows by comparing images and kernels in the triple-surjectivity map. Its two generating subgroups and its intersection with Gamma-zero are retained exactly.

**Construction and proof.**

1. In the triple product, the images of ker(f₁,π) and ker(f₂) generate the product and both contain the full triple kernel. Their preimages therefore generate D.
2. On D these two kernels are G∩Γ(Np) and A⁻¹GA∩D. Adjoin E to recover the signed domain.

**Acceptance checks.**

- This formulation remains correct when the signed reduction kernel is larger than Γ(Np).

### W5.6. Geometric intersection and degree-preserving base change

**Target:** `ModularFormsPartII:W5/field-base-change` (theorem).

For p∤2N, R₂N∩M₂Np=M₂N and [R₂N M₂Np:M₂Np]=[R₂N:M₂N], with every field embedded by the stated q parameter. The second equality is a separate linear-disjointness assertion, not a formal consequence of intersection for arbitrary extensions.

**Direct dependencies:** `ModularFormsPartII:W3/field-structures`, `ModularFormsPartII:W3/normal-stabilizer`, `ModularFormsPartII:W1/wohlfahrt`, `ModularCurvesPartII:R12.4`, `ModularCurvesPartII:R13.5`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Theorem 4.3.2, pp.656–657; model statement in Lemma 4.2.3, p.656. The degree proof uses a congruence intersection statement together with geometric base change over rational cusp models. The target separates these assertions because intersection alone does not imply linear disjointness.

**Construction and proof.**

1. Over ℂ, use finite Galois covers arising from principal subgroups and the normal stabilizer. Intersecting a congruence stabilizer with G preserves the level bound, so any congruence function in R₂N descends to level 2N by Wohlfahrt.
2. Prove the geometric Galois linear-disjointness statement, then descend the degree through geometrically connected ℚ-models with the distinguished rational cusp and faithful q-expansion embedding. MODEL records the exact descent contract absent from the named supplier stages.

**Acceptance checks.**

- A field-intersection equality without the geometric Galois/base-change argument is insufficient.

### W5.7. p-scaling separates a noncongruence function

**Target:** `ModularFormsPartII:W5/scaling-separation` (theorem).

For N≥1 and p∤2N, if a weight-zero function f∈R₂N is not invariant under any congruence subgroup, then f(pτ) is not in the M₂Np-algebra generated by R₂N. Consequently f(pτ)∈R₂Np supplies a genuinely new field element.

**Direct dependencies:** `ModularFormsPartII:W5/generation`, `ModularFormsPartII:W3/normal-stabilizer`, `ModularFormsPartII:W1/level-scaling`, `ModularFormsPartII:W5/field-base-change`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 4.3.1, p.656, proof (4.4.6)–(4.4.10), p.660. The leveraging theorem says that p-scaling a noncongruence modular function creates an element outside the old-level compositum. The corrected generation formula is the group-theoretic obstruction to such an expression.

**Construction and proof.**

1. Any polynomial or rational expression in the compositum is fixed by Γ(2Np)∩G₂N. The assumed expression for f(pτ) is also fixed by A⁻¹G₂NA.
2. Apply the generation identity with the harmless passage to a multiple of 2N≥4; unwind conjugation to obtain congruence invariance of f, contradiction. If the starting level is 2, first enlarge to 4 and retain noncongruence.

**Acceptance checks.**

- The initial f belongs to R₂N, correcting the inconsistent level in the printed degree proof.

### W5.8. Degree doubling

**Target:** `ModularFormsPartII:W5/degree-doubling` (theorem).

If [R₂N:M₂N]>1 and p∤2N is prime, then [R₂Np:M₂Np]≥2[R₂N:M₂N].

**Direct dependencies:** `ModularFormsPartII:W5/scaling-separation`, `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W3/field-structures`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 4.3.2, pp.656–657. The degree theorem combines separation of the scaled function with degree-preserving base change. The counterexample is chosen at the old level, correcting an inconsistent field label in the proof.

**Construction and proof.**

1. Choose a generating weak modular function in R₂N outside M₂N and clear its common denominator and its pole at ∞. By Wohlfahrt it cannot be a congruence function at another level.
2. Its p-scaling lies outside the compositum, so the extension above that compositum has degree at least two. Use the degree-preserving base-change identity and the tower law.

**Acceptance checks.**

- The chosen generator is at the old level; the new field is produced by scaling.

### W5.9. The congruence degree comparison

**Target:** `ModularFormsPartII:W5/congruence-degree` (theorem).

For N>1, [M₂N:ℚ(λ)]=(2N)³/12·∏_{p∣2N}(1−p⁻²)>4N³/π². For N=1 the degree is 1. The formula uses the projective index: −I∈Γ(2) and −I∉Γ(2N) for N>1.

**Direct dependencies:** `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W3/congruence-field`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `ModularCurvesPartII:R12.4`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (4.3.3), p.657. The index formula supplies the cubic lower bound for the congruence field. The target uses the projective index and separates N=1, where the displayed generic formula does not apply.

**Construction and proof.**

1. Count SL₂(ℤ/m) by prime-power reduction and CRT, then divide the Γ(2)-relative index by two.
2. Bound the finite Euler product below by 1/ζ(2); use the classical ζ(2)=π²/6 value.

**Acceptance checks.**

- N=2 yields degree 4; substituting N=1 into the generic formula would incorrectly yield 1/2.

### W5.10. Leveraging contradicts logarithmic normalized degree

**Target:** `ModularFormsPartII:W5/leveraging-contradiction` (theorem).

If [R₂N:ℚ(λ)]≤C N³ log(2N) for a constant C and all N≥1, then R₂N=M₂N for every N.

**Direct dependencies:** `ModularFormsPartII:W5/degree-doubling`, `ModularFormsPartII:W5/congruence-degree`, `mathlib:Chebyshev.theta_ge`, `mathlib:Chebyshev.theta_le_log4_mul_x`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proposition 4.3.5 and (4.3.6)–(4.3.7), pp.657–658. The proposition iterates degree doubling along primes until it exceeds the cubic-logarithmic bound after normalization. The target uses the pinned Chebyshev estimates, which suffice in place of the stronger prime number theorem.

**Construction and proof.**

1. A counterexample at N yields normalized degree at least 2 to the number of primes ≤X not dividing 2N, by repeated doubling.
2. Chebyshev’s lower bound gives at least cX/log X such primes eventually, while the upper bound gives log of their product O(X). The hypothesized normalized degree is O(X).
3. Taking logarithms contradicts cX/log X≤O(log X). The prime number theorem used in the source is stronger than necessary.

**Acceptance checks.**

- Uniformity of C in N is essential.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: CSP, MODEL.

## W6. The unbounded denominators theorem

Assemble R₂N=M₂N, reduce arbitrary integral weight to weight zero, and deduce congruence from one integral Fourier expansion, its rational bounded-denominator form, and its algebraic-integer form with number-field descent. Verify the j cube root, h roots, and Fermat tests.

**Layer dependencies:** `ModularFormsPartII:W2`, `ModularFormsPartII:W3`, `ModularFormsPartII:W5`, `QSeriesPartitionsAndMockModularForms:QM.1`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`, `AlgebraicModularFormsAndSerreWeights:R15.1`, `ModularCurvesPartII:R12.4`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `QSeriesPartitionsAndMockModularForms:QM.0`.

**Planets:** Equality R₂N = M₂N; Unbounded denominators theorem; Algebraic-integer unbounded denominators; Root denominator tests.

### W6.1. Equality of the bounded and congruence fields

**Target:** `ModularFormsPartII:W6/field-equality` (theorem).

For every N≥1 the embedded fields R₂N and M₂N coincide.

**Direct dependencies:** `ModularFormsPartII:W3/quantitative-rank`, `ModularFormsPartII:W5/leveraging-contradiction`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §6.3, pp.685–686, assembling Proposition 3.0.1 with Theorems 5.1.4 and 6.0.1. The final proof combines the analytic rank bound with leveraging to identify the bounded-denominator and congruence fields at every level.

**Construction and proof.**

1. Import the exact derivative boost and integrated mean-growth estimates of UNI into W3. Choose the fixed radius loss proportional to N⁻³.
2. Apply the uniform rank bound and leveraging contradiction.

**Acceptance checks.**

- The conclusion is equality in the chosen rational Laurent field, not merely an abstract field isomorphism.

### W6.2. Integral reduction to weight zero

**Target:** `ModularFormsPartII:W6/weight-reduction` (theorem).

Let h₀(τ)=λ(τ)/(16η(τ/2)²). It is holomorphic and nonzero on ℍ, has weight −1 on a congruence subgroup, and its normalized expansion is q^(11/12) times an integral unit with constant term 1. Its inverse has the same integral-unit property after the opposite monomial shift. Thus for any integer k, f↦f h₀^k changes weight k to weight zero on a finite-index group and preserves bounded denominators after enlarging the strict period. A power of λ can clear the remaining pole at ∞.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W1/bounded-denominators`, `mathlib:ModularForm.eta`, `mathlib:ModularForm.eta_ne_zero`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-eta-multiplier`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Reduction following (1.0.2), p.628. The introductory reduction uses a fixed eta-lambda weight-minus-one form with integral unit expansion after a monomial shift. The target includes the inverse needed for negative weights and a common finite congruence kernel.

**Construction and proof.**

1. Compute the η products with the q=e^{πiτ} convention; use the theta/eta multiplier supplier to find a congruence character kernel.
2. Integral products and their unit inverses preserve the arithmetic condition. The multiplier is killed by restriction to a congruence subgroup, with period enlarged to include 12.

**Acceptance checks.**

- Negative k requires the inverse unit, not just the forward product.

### W6.3. The unbounded denominators theorem

**Target:** `ModularFormsPartII:W6/unbounded-denominators` (theorem).

Let N≥1, k∈ℤ and Γ≤SL₂(ℤ) have finite index. If f is a weight-k weak form on Γ, holomorphic at ∞ with strict period 2N, and every coefficient of its actual q^{1/N} expansion is in ℤ, then there exists a congruence subgroup Γ′ on which f is a weight-k weak form. Poles at other cusps are allowed.

**Direct dependencies:** `ModularFormsPartII:W6/field-equality`, `ModularFormsPartII:W6/weight-reduction`, `ModularFormsPartII:W1/wohlfahrt-level`, `ModularFormsPartII:W3/bounded-field`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 1.0.1, p.627; weight reduction p.628; §6.3, pp.685–686. The main theorem turns one integral cusp expansion of an arbitrary finite-index weak form into congruence invariance. It does not assert that the original stabilizer subgroup is congruence.

**Construction and proof.**

1. Reduce to weight zero and enlarge the level to the lcm of all signed cusp widths, including the strict period and the multiplier kernel.
2. The transformed rational integral germ lies in R₂M=M₂M. It is a congruence modular function. Divide by the nonzero congruence factor and undo the principal-part shift.

**Acceptance checks.**

- The conclusion asserts existence of a congruence group; it does not say the original Γ is congruence.

### W6.4. Rational bounded denominators force congruence

**Target:** `ModularFormsPartII:W6/rational-contrapositive` (theorem).

A rational Fourier expansion of a weak modular form, with one common denominator and a finite principal part, belongs to a congruence weak form. Equivalently a rational-coefficient weak form that is not invariant under any congruence subgroup has unbounded denominators at every cusp where its expansion is rational.

**Direct dependencies:** `ModularFormsPartII:W6/unbounded-denominators`, `ModularFormsPartII:W1/bounded-denominators`, `ModularFormsPartII:W1/clear-cusp-poles`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 1.0.1 and its discussion, pp.627–628. A single rational clearing scalar reduces bounded denominators to the integral main theorem. Its contrapositive applies to a noncongruence function, rather than merely a function presented on a noncongruence group.

**Construction and proof.**

1. Clear cusp poles by Δ and the single scalar denominator, apply the integral theorem, and divide by Δ.
2. Move another rational cusp to ∞ using the slash action; retain its strict translation width.

**Acceptance checks.**

- A noncongruence subgroup can carry congruence forms; the hypothesis concerns the form itself.

### W6.5. Algebraic-integer Fourier coefficients

**Target:** `ModularFormsPartII:W6/number-field-variant` (theorem).

If a weak modular form of integer weight has an expansion at ∞ in O_K[[q^{1/N}]] for a number field K⊆ℂ, then it is a congruence weak form. The same conclusion holds for an expansion in the algebraic integers Q̄ with the common-number-field and conjugation bridge NF supplied. One scalar denominator over O_K and finitely many negative exponents are also allowed.

**Direct dependencies:** `ModularFormsPartII:W6/unbounded-denominators`, `ModularFormsPartII:W6/weight-reduction`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`, `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`, `ModularCurvesPartII:R12.4`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Remarks 6.3.1–6.3.2, pp.685–686. The remarks extend the conclusion to algebraic-integer coefficients using number-field conjugates. The target identifies the noncongruence germ-descent step that must precede that trace argument.

**Construction and proof.**

1. After reducing weight and making the algebraic modular-function model explicit, realize coefficientwise conjugates as weak modular functions on finite-index groups.
2. For an integral basis α_i of O_K, take coefficientwise Tr(α_i f); these have integral rational expansions and are weak on intersections of finitely many conjugate groups. Apply the rational theorem and invert the nondegenerate trace matrix.
3. For Q̄ coefficients first prove the single-number-field assertion in NF; it is not a property of arbitrary algebraic-integer power series.

**Acceptance checks.**

- The proof needs modularity of coefficientwise conjugates, not only integrality of their traces.

### W6.6. The integral cube root of j

**Target:** `ModularFormsPartII:W6/j-cube-root` (theorem).

In the standard parameter Q=e^{2πiτ}, the branch j^(1/3)=E₄/η⁸=Q^(−1/3)(1+248Q+4124Q²+34752Q³+⋯) has integral Laurent coefficients and is a weak modular function on a level-3 congruence subgroup. Multiplying it by Δ brings it within the holomorphic-at-∞ hypothesis of W6.

**Direct dependencies:** `ModularFormsPartII:W6/unbounded-denominators`, `ModularFormsPartII:W1/clear-cusp-poles`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`, `mathlib:ModularForm.eta`, `mathlib:ModularForm.discriminant`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-eta-multiplier`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (1.0.3) and discussion, pp.628–629. The introductory example gives an integral fractional-power branch of the cube root of j. Its eta expression identifies a weight-zero congruence function after the appropriate character kernel restriction.

**Construction and proof.**

1. Use the parent j identity j=E₄³/Δ and the integral product η⁻⁸. Fix the branch by its leading term.
2. Apply the main theorem after clearing the cusp pole, and verify the level-3 character directly from the η multiplier.

**Acceptance checks.**

- Here Q is q²; the exponent −1/3 is in Q, not in q.

### W6.7. The h-root denominator test

**Target:** `ModularFormsPartII:W6/h-root-test` (theorem).

Set h=λ(1−λ)/16=q∏_{n≥1}((1+q^{2n})/(1+q^n))^{24}. For n≥1, the branch h^(1/n) with leading q^(1/n) has bounded denominators if and only if n∣24, and is a congruence weak modular function if and only if n∣24.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `ModularFormsPartII:W6/rational-contrapositive`, `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application`, `ModularFormsPartII:W1/bounded-denominators`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (1.0.4) and its group-theoretic discussion, p.629. The example distinguishes the roots of lambda times one minus lambda by divisibility of their exponent into twenty-four. The special congruence abelianization or a direct denominator calculation remains an explicit proof input.

**Construction and proof.**

1. If n∣24 the product has integral unit coefficients. For the converse, compute a prime-adic obstruction to a bounded common denominator of the normalized root product, or compute the congruence abelianization of Γ₀(2).
2. The special Γ₀(2) computation needed for that second proof is ROOT; it is not the abelianization of the full modular group. Apply both directions of the bounded-denominator criterion.

**Acceptance checks.**

- n=24 is integral after its monomial shift, while n=5 is not bounded.

### W6.8. The Fermat-cover test

**Target:** `ModularFormsPartII:W6/fermat-test` (theorem).

The cover u^n+v^n=1 above λ=u^n, for n≥1, is congruence precisely for n∈{1,2,4,8}. Its normalized branch (1−16x)^(1/n), x=λ/16, has bounded denominators precisely for those n.

**Direct dependencies:** `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W6/rational-contrapositive`, `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application`, `ModularFormsPartII:W2/inverse-integrality`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-two-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-triple-product-analytic`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Introduction p.628; §1.1.3, p.631. The Fermat example gives exactly exponents one, two, four and eight. The target uses the binomial valuation obstruction and checks the second cover coordinate, not just one radical.

**Construction and proof.**

1. For p odd dividing n, the p-adic valuations of the binomial coefficients go to −∞. If n=2^a, valuations after the factor 16^m are (4−a)m−v₂(m!) when a>0, so boundedness holds exactly for a≤3; handle n=1 directly.
2. The branch u=λ^(1/n) is an integral unit after its monomial shift for n=1,2,4,8; prove this by the λ product or a theta/eta identity. The two branches then give congruence by W6, and the converse follows from the imported congruence denominator theorem.

**Acceptance checks.**

- n=8 passes and n=16 fails. Odd n>1 fails at an odd prime divisor.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: MODEL, NF, ROOT.

## W7. Differential equations and vector-valued forms

Apply strict overconvergence to integral three-point ODE solutions with finite monodromy at zero. Define vector-valued forms and continuation spaces of individual components, separate their analytic and arithmetic differential-module realizations, and apply exact G-function inputs to componentwise congruence and the corrected effective-span Mason corollary.

**Layer dependencies:** `ModularFormsPartII:W2`, `ModularFormsPartII:W6`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `DiophantineApproximationAndTranscendence:DT.5`, `QSeriesPartitionsAndMockModularForms:QM.1`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**Planets:** Integral ODE algebraicity; Congruence for integral ODE solutions; Vector-valued modular forms; Integral vector-valued component theorem; Mason’s effective-span corollary.

### W7.1. Algebraicity for integral three-point ODE solutions

**Target:** `ModularFormsPartII:W7/ode-algebraicity` (theorem).

Let f∈ℤ[[x]] solve a nonzero linear differential operator over ℚ̄(x), with no genuine singularities outside {0,1/16,∞}, and with finite local monodromy at 0 in the supplier’s meromorphic-after-finite-ramification sense. Apparent singularities are allowed only when every local solution is meromorphic. Then f is algebraic over ℚ(x). In the regular-singular case the stated finite-monodromy condition is the usual finite-order local monodromy condition.

**Direct dependencies:** `ModularFormsPartII:W2/kummer-coordinate`, `ModularFormsPartII:W2/lambda-covering`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.2.1 and footnote 4, pp.687–688; Definition 2.0.4 convention, p.635. The theorem applies the arithmetic rank bound to all powers of an integral solution after a ramified pullback at zero. The target retains the source's meromorphic local-monodromy convention and its restriction on apparent singularities.

**Construction and proof.**

1. Choose an exponent N≥2 killing the local monodromy at 0, taking a multiple when its order is one. The pullback g(u)=f(u^N) is integral and belongs to the imported holonomy ring on ℂ∖16^{−1/N}μ_N.
2. Clear meromorphic apparent poles if necessary. The strict conformal radius boost of UNI and the ALG bound give finite dimension for all powers of g. Their algebraic dependence makes g, and hence f, algebraic.
3. The meromorphic-after-ramification convention must be checked before applying the holonomy ring input; bare single-valuedness does not remove an irregular essential singularity.

**Acceptance checks.**

- The Jacobi K₀ series is integral and transcendental; its entire local solution space has infinite unipotent monodromy at 0.

### W7.2. The congruence refinement for ODE solutions

**Target:** `ModularFormsPartII:W7/ode-congruence` (theorem).

Under W7/ode-algebraicity, the distinguished continuation f(λ(τ)/16) is invariant under Γ(M) for some M≥1. If the scalar solution has apparent poles on ℍ, it is a meromorphic congruence modular function; if it has none, it is weakly holomorphic.

**Direct dependencies:** `ModularFormsPartII:W7/ode-algebraicity`, `ModularFormsPartII:W6/unbounded-denominators`, `ModularFormsPartII:W2/inverse-integrality`, `ModularFormsPartII:W2/lambda-covering`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.2.1, pp.687–688. The same theorem refines algebraicity to congruence under the modular lambda pullback. The target clears apparent interior poles before applying the weak-form theorem and divides back afterwards.

**Construction and proof.**

1. The algebraic germ has finitely many branches and gives a finite-index stabilizer under the Γ(2) covering.
2. Multiply by an integral polynomial in λ clearing apparent interior poles and a monomial clearing the cusp principal part. Its Fourier expansion remains integral; apply W6 and divide back.

**Acceptance checks.**

- Do not silently call a function with an apparent interior pole a weak form.

### W7.3. Vector-valued modular forms

**Target:** `ModularFormsPartII:W7/vector-valued-form` (definition).

For n≥0, k∈ℤ, a vector-valued form consists of ρ:PSL₂(ℤ)→GL_n(ℂ) and a holomorphic F:ℍ→ℂⁿ with F|ₖγ=ρ(γ)F after pullback to SL₂(ℤ), semisimple ρ(T), and the following growth: for every real a<b and C>0 there are A,B>0 such that each |F_j(τ)|≤A exp(B Im τ) when a≤Re τ≤b and Im τ≥C. Since ρ(−I)=1, nonzero such forms have even weight. The SL₂ version with central character is a separate imported parity convention.

**Direct dependencies:** `ModularFormsPartII:W1/weak-form`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Definition 7.3.1, pp.688–689. The definition combines a complex representation, slash equivariance, semisimple translation monodromy and exponential strip growth. The target permits zero and nonspanning forms and keeps projective parity explicit.

**Construction and proof.**

1. Use the pinned finite-dimensional complex vector spaces, general linear group and componentwise holomorphy/slash action.
2. State exponential growth on every vertical strip and retain semisimplicity as an actual hypothesis, not a conclusion of growth.

**Uses that determine the API.**

- W7 component theorem: One selected arithmetic component is studied.
- W7 Mason corollary: The value span is the representation actually detected.

**API.**

- `VectorValuedForm.component_holomorphic` (projection): Every coordinate is holomorphic on ℍ.
- `VectorValuedForm.changeBasis` (functoriality): Conjugating ρ and changing coordinates transports F and preserves growth and semisimplicity.
- `VectorValuedForm.restrict` (functoriality): Restriction preserves the slash law and growth; local semisimplicity holds for powers of T.
- `VectorValuedForm.valueSpan_stable` (structure): The span of the values of F is ρ-stable.
- `VectorValuedForm.odd_weight_zero` (compatibility): For the projective representation convention, odd k forces F=0.

**Unit tests.**

- `vv_constant` (degenerate): F=1,ρ=1,k=0 is a one-dimensional form.
- `vv_induced_scalar` (compatibility): A scalar even-weight weak form induces a finite permutation representation on cosets; its identity component is the original form.
- `vv_jordan_rejected` (non-example): A nonsemisimple T with a logarithmic term is excluded even if its growth is polynomial.
- `vv_invisible_summand` (non-example): F=(1,0,0) with ρ=1⊕σ is accepted although the values do not span ℂ³.

**Acceptance checks.**

- Dimension zero and the zero vector are allowed; no spanning assumption is hidden in the definition.

### W7.4. Generalized Fourier expansions without logarithms

**Target:** `ModularFormsPartII:W7/generalized-expansion` (theorem).

In a basis diagonalizing ρ(T), each component has a convergent expansion Q^μ Σ_{m≥m₀}a_m Q^m, Q=e^{2πiτ}, where exp(2πiμ) is its T-eigenvalue and μ may be complex. Conversely such expansions with finite lower support give the required moderate exponential strip growth. There are no logarithms; rational exponents or finite-order T are not asserted.

**Direct dependencies:** `ModularFormsPartII:W7/vector-valued-form`, `mathlib:UpperHalfPlane.cuspFunction`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Remark 7.3.2, p.689. The expansion remark follows by diagonalizing translation and twisting each eigencomponent to be periodic. Complex exponents are permitted; the arithmetic conclusion cannot be assumed in this analytic step.

**Construction and proof.**

1. Twist an eigencomponent by exp(−2πiμτ) to make it 1-periodic. Descend to a punctured disc and use the exponential growth to bound its pole order.
2. Recover growth from the finite principal part and a convergent holomorphic remainder.

**Acceptance checks.**

- An eigenvalue of modulus different from one gives a nonreal μ and is still permitted.

### W7.5. Inducing a scalar weak form

**Target:** `ModularFormsPartII:W7/induced-scalar` (theorem).

For E≤Γ of finite index and even k, a weak scalar form on Γ yields a vector-valued form with finite-image coset permutation representation, whose components are f|ₖγ for coset representatives and whose identity component is f. For groups excluding E or odd weight use the parent SL₂ central-character convention.

**Direct dependencies:** `ModularFormsPartII:W7/vector-valued-form`, `ModularFormsPartII:W1/weak-form`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Remark 7.3.2, p.689. The remark includes scalar weak forms among vector-valued forms by finite coset induction. The target states its sign and parity conventions and tests the right slash-action composition.

**Construction and proof.**

1. Use the finite induced representation with the right-action convention fixed by the slash law. Cusp Laurent expansions give exponential strip growth.
2. Finite-order permutation T is semisimple over ℂ.

**Acceptance checks.**

- The coset convention must be tested against (f|γ)|δ=f|(γδ).

### W7.6. The complex local system of ρ

**Target:** `ModularFormsPartII:W7/complex-local-system` (construction).

For a weight-zero vector-valued form, let L_ρ be the rank-n complex local system on Y(2)=ℙ¹∖{0,1/16,∞} associated to ρ restricted to Γ(2)/E. Build it by descent of the trivial bundle on ℍ with its flat connection. It has this specified rank independently of linear relations between component functions. This does not define an integral free module or an arithmetic connection.

**Direct dependencies:** `ModularFormsPartII:W7/vector-valued-form`, `ModularFormsPartII:W2/lambda-covering`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Passage before Theorem 7.3.3, pp.689–690, corrected rank. The proof associates a local system to the vector-valued transformation law. The corrected construction is a rank-n complex system and does not manufacture an integral lattice or multiply the rank by six.

**Construction and proof.**

1. Apply the covering/local-system correspondence to the effective deck representation. Descend the trivial analytic flat bundle using constant transition maps.

**Uses that determine the API.**

- W7 component continuation: The selected germ is a matrix coefficient of this monodromy representation.
- W7 regular-singular realization: The analytic flat bundle is the input, not a pre-existing ℤ-model.

**API.**

- `rhoLocalSystem_rank` (characterisation): Its fibre has dimension n.
- `rhoLocalSystem_monodromy` (compatibility): The monodromy is the restricted ρ with the chosen left/right convention.
- `rhoLocalSystem_directSum` (functoriality): Direct sums of representations give direct sums of local systems.
- `rhoLocalSystem_restriction` (functoriality): Passing to a finite modular cover restricts monodromy.

**Unit tests.**

- `rho_trivial_rank` (computation): For ρ=1 the rank is 1, not 6.
- `rho_zero_rank` (degenerate): The zero-dimensional representation has the zero local system.
- `rho_invisible_rank` (non-example): For 1⊕σ the ambient rank is 3 even when F=(1,0,0) detects only rank 1.
- `rho_monomial` (compatibility): A finite permutation representation agrees with the local system of its finite covering.

**Acceptance checks.**

- A rank-n local system is distinguished from the scalar continuation span below.

### W7.7. The continuation space of a component

**Target:** `ModularFormsPartII:W7/component-continuation` (definition).

For a fixed weight-zero component f=F_j, let W_j be the complex vector space of its analytic continuation germs at a fixed ordinary point of Y(2). The slash transformation expresses each branch as a constant linear combination of the n component functions, so dim W_j≤n. Use the resulting monodromy subquotient of L_ρ, retaining the actual scalar germ and all its linear relations. Do not assert irreducibility.

**Direct dependencies:** `ModularFormsPartII:W7/complex-local-system`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Theorem 7.3.3, pp.690–691, corrected component system. The component proof needs the span of the actual branches of one scalar function. The target quotients all component relations and records its rank bound without assuming irreducibility.

**Construction and proof.**

1. Take the span of continuations inside the space of scalar germs. Continuation transports relations, so monodromy descends to this span.
2. Identify it as the quotient of the cyclic dual representation generated by the selected coordinate functional; its dimension can be smaller than n.

**Uses that determine the API.**

- W7 arithmetic equation: Only W_j needs arithmetic descent.
- W7 component theorem: No invisible summand is used in the G-function argument.

**API.**

- `componentContinuation_rank_le` (relation): dim W_j≤n.
- `componentContinuation_germ` (constructor): The selected f is a specified element of the continuation fibre.
- `componentContinuation_monodromy` (structure): Continuation acts linearly and realizes the selected scalar branches.
- `componentContinuation_quotient` (compatibility): Linear relations among the components are quotiented before taking the rank.

**Unit tests.**

- `component_one` (computation): For f=1, W has rank 1 with scalar equation f′=0.
- `component_zero` (degenerate): For f=0, W=0.
- `component_invisible` (non-example): For F=(1,0,0),ρ=1⊕σ, W₁ has rank 1 rather than ambient rank 3 or claimed rank 18.
- `component_reducible` (non-example): The sum of two independent one-dimensional characters can generate a reducible rank-2 continuation space; cyclic does not imply irreducible.

**Acceptance checks.**

- A cyclic differential module can be reducible.

### W7.8. Regular-singular realization preserving the component germ

**Target:** `ModularFormsPartII:W7/regular-singular-component` (theorem).

The complex continuation system W_j admits a regular-singular algebraic differential-module realization over ℂ(x), with no genuine singularities outside {0,1/16,∞}, and with the specified scalar germ f as a cyclic matrix coefficient. Its local monodromies are semisimple, inherited as subquotients of the cusp monodromies of L_ρ. Scalar cyclic equations may introduce only meromorphic apparent singularities.

**Direct dependencies:** `ModularFormsPartII:W7/component-continuation`, `ModularFormsPartII:W7/generalized-expansion`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.3.3 proof, pp.690–691, regular-singular bridge required before arithmetic descent. The component proof needs an algebraic regular-singular realization preserving the selected scalar germ. The target separates this analytic bridge from arithmetic descent and allows meromorphic apparent poles in a cyclic equation.

**Construction and proof.**

1. Apply the exact analytic-to-algebraic regular-singular realization contract of UNI to the component system, using strip growth at all cusps after conjugation.
2. Preserve the scalar matrix coefficient through the realization; distinguish its minimal scalar operator from an arbitrarily enlarged ambient operator.

**Acceptance checks.**

- A Riemann–Hilbert existence theorem without the actual scalar germ is insufficient.

### W7.9. Arithmetic descent and finite component monodromy

**Target:** `ModularFormsPartII:W7/arithmetic-component` (theorem).

If the selected weight-zero component has an integral x-series, then its minimal scalar annihilator descends to ℚ̄(x), realizes its actual continuation space, is a G-operator in the sense needed by DT.5, and has quasi-unipotent local monodromy. Together with the preceding semisimplicity this makes every local monodromy of W_j finite order.

**Direct dependencies:** `ModularFormsPartII:W7/regular-singular-component`, `DiophantineApproximationAndTranscendence:DT.5/g-function`, `DiophantineApproximationAndTranscendence:DT.5/chudnovsky-galochkin-condition`, `DiophantineApproximationAndTranscendence:DT.5`, `ModularFormsPartII:W2/inverse-integrality`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.3.3 proof, pp.690–691; extraction E13 arithmetic bridge. The argument uses G-function differential arithmetic to obtain finite-order cusp monodromy. The target spells out descent of the minimal scalar annihilator and its compatibility with the actual continuation system before invoking quasi-unipotence.

**Construction and proof.**

1. Obtain positive convergence radius from the holomorphic cusp germ; integral coefficients give the arithmetic growth and denominator bounds for a G-function.
2. Prove descent and compatibility of the minimal scalar operator with W_j before using Galochkin/Bombieri–André/Katz. These are the exact missing contracts ARITH and GLOCAL.
3. Apply the local quasi-unipotence theorem to the minimal arithmetic module, then use its semisimple monodromies.

**Acceptance checks.**

- A theorem for a Q̄(x)-linearly independent vector of G-functions cannot be applied to an unspecified complex ambient system containing one integral component.

### W7.10. Arithmetic normalization of a vector-valued component

**Target:** `ModularFormsPartII:W7/vv-weight-normalization` (theorem).

For a nonzero even-weight vector-valued form of weight k, choose an integral scalar congruence form g of weight k′≥0 with 12∣k+k′. Multiply F by g·(λ/(16Δ(τ/2)))^((k+k′)/12), choosing the branch with leading term 1. This has weight zero after restriction to a finite congruence cover, preserves an integral selected Fourier germ, and has only finite-order additional monodromy. Division back recovers congruence of the original selected component.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `mathlib:ModularForm.discriminant`, `mathlib:ModularForm.discriminant_ne_zero`, `ModularFormsPartII:W7/vector-valued-form`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `ModularFormsPartII:W1/bounded-denominators`, `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-eta-multiplier`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), First reduction in Theorem 7.3.3 proof, p.690. The proof first removes the weight by a scalar congruence factor whose expansion is an integral unit. The target retains the eta argument, branch normalization and finite multiplier kernel needed to undo that factor.

**Construction and proof.**

1. Choose k′ from weights 4 and 6 with the needed congruence; negative k is allowed by taking k′ large. The ratio λ/(16Δ(τ/2)) is an integral unit with constant term 1.
2. Validate the multiplier and weight −12 of the ratio; the exponent is integral. Restrict to a common congruence kernel. Zeros of g are permitted: at the end use the known holomorphy of the original quotient.

**Acceptance checks.**

- The normalization starts with 1 in q; a mistaken Δ argument introduces a fractional leading monomial.

### W7.11. Congruence of an integral vector-valued component

**Target:** `ModularFormsPartII:W7/component-congruence` (theorem).

Let (F,ρ) be as defined above and let F_j have an actual expansion in ℤ[[q]], q=e^{πiτ}. Then F_j is a classical weight-k weak form on some Γ(M). No assertion is made about an unused summand of ρ.

**Direct dependencies:** `ModularFormsPartII:W7/vv-weight-normalization`, `ModularFormsPartII:W7/arithmetic-component`, `ModularFormsPartII:W7/ode-congruence`, `ModularFormsPartII:W7/vector-valued-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.3.3, pp.690–691, with its proof bridges explicitly supplied. The component theorem concerns a selected integral Fourier expansion. The target routes it through the weight-zero arithmetic equation and integral ODE theorem without making a claim about unused representation summands.

**Construction and proof.**

1. Normalize weight and use integral λ reparametrization. Apply the arithmetic component result to obtain finite local monodromy at 0.
2. Use the three-point ODE congruence theorem, then undo the scalar congruence factor. Zero components are immediate.

**Acceptance checks.**

- F=1 gives the rank-one constant equation; the proof never forces its ambient system to be irreducible.

### W7.12. Mason’s corollary on the effective value span

**Target:** `ModularFormsPartII:W7/effective-mason` (theorem).

Suppose each component of F becomes an integral Fourier series after multiplication by a nonzero scalar and enlargement of its strict period. Put V_F=span_ℂ{F(τ):τ∈ℍ}. Then V_F is ρ-stable and Γ(M) acts identically on V_F for some M. If V_F=ℂⁿ, ker ρ contains Γ(M) and ρ has finite image. Without spanning, the conclusion applies only to ρ|V_F.

**Direct dependencies:** `ModularFormsPartII:W7/component-congruence`, `ModularFormsPartII:W7/vector-valued-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Corollary 7.3.4, p.691, corrected effective-span statement. The corollary is valid on the span detected by the values of the modular form. The target adds the spanning hypothesis exactly where a conclusion about the whole ambient kernel is drawn.

**Construction and proof.**

1. Apply the component theorem after each scalar clearing and intersect the finitely many congruence groups. The vector slash law then fixes every value F(τ), hence its span.
2. Finite index gives finite image only for the representation restricted to that span.

**Acceptance checks.**

- For ρ=1⊕σ and F=(1,0,0), the effective representation is trivial while σ can have infinite image.

### W7.13. An invisible infinite-image summand

**Target:** `ModularFormsPartII:W7/invisible-summand-test` (theorem).

Set σ(S)=diag(1,−1), σ(R)=[[2,1],[−7,−3]] for the presentation PSL₂(ℤ)=⟨S,R:S²=R³=1⟩, and T=SR. Then σ(T)=[[2,1],[7,3]] is semisimple of infinite order. The pair ρ=1⊕σ, F=(1,0,0), k=0 satisfies the vector-valued definition with integral coefficients but ρ has infinite image.

**Direct dependencies:** `ModularFormsPartII:W7/vector-valued-form`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Counterexample to the unrestricted reading of Corollary 7.3.4, p.691; verified matrix relations. The printed ambient corollary admits an unused summand. The target supplies explicit matrices defining an infinite-image semisimple-translation representation alongside the constant integral form that detects only the trivial summand.

**Construction and proof.**

1. Verify S²=I and R³=I. The T characteristic polynomial is X²−5X−1, with distinct roots and a real root greater than one.
2. The constant first coordinate transforms trivially and the others vanish, so the strip growth and slash identity hold.

**Acceptance checks.**

- The example is nonzero; excluding the zero form does not repair the unrestricted ambient statement.

### W7.14. Positive-weight forms and infinite monodromy

**Target:** `ModularFormsPartII:W7/stiller-zagier` (theorem).

For a nonzero congruence form h of positive integer weight k, its germ expressed in x=λ/16 satisfies, on a finite étale cover of Y(2), a linear scalar equation of order at most k+1 associated with Sym^k of the standard rank-2 modular local system. The cyclic system has infinite monodromy; the full symmetric-power system has nontrivial unipotent local monodromy at cusps. If h has an actual expansion in ℤ[[q]], integral inverse λ reparametrization gives an integral x-series. For a fractional q-expansion retain the corresponding Puiseux germ; integrality after a fractional change is not asserted without checking its unit root. The precise order-equality and scalar apparent-singularity statement require SZ.

**Direct dependencies:** `ModularFormsPartII:W2/inverse-integrality`, `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W7/component-continuation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Remark 7.2.3, p.688, citing Stiller (1984) and Zagier (2008), §5.4. The remark contrasts finite-local-monodromy algebraicity with the differential equation of a positive-weight classical form. The target specifies the symmetric-power monodromy and its local-system proof input.

**Construction and proof.**

1. Use the k+1 translates coming from the degree-k automorphy factor, and descend derivatives in the modular coordinate to the finite cover.
2. Identify the symmetric-power monodromy and its cusp unipotent. Irreducibility on a Zariski-dense congruence subgroup gives infinite monodromy for the nonzero cyclic system.

**Acceptance checks.**

- This provides the positive-weight boundary example; it is not an application of the finite-monodromy ODE theorem.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: ALG, UNI, NF, ARITH, GLOCAL, SZ.

## W8. Quasimodular and arithmetic growth applications

Define weakly holomorphic quasimodular forms using E₂ and Δ localization and prove derivative minimality with the q normalization fixed. Verify the elliptic-integral and Catalan identities. Define deficient places and state their congruence and effective arithmetic-component consequences with the necessary detection hypotheses.

**Layer dependencies:** `ModularFormsPartII:W2`, `ModularFormsPartII:W6`, `ModularFormsPartII:W7`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `QSeriesPartitionsAndMockModularForms:QM.1`, `QSeriesPartitionsAndMockModularForms:QM.0`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `AutomorphicGaloisRepresentations:R19.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Planets:** Weakly holomorphic quasimodular forms; Differential closure of weak forms; Elliptic-integral quasimodular identity; Deficient places; No deficient places for congruence kernels.

### W8.1. Weakly holomorphic quasimodular forms

**Target:** `ModularFormsPartII:W8/weak-quasimodular` (definition).

For a finite-index Γ≤SL₂(ℤ), use its integral-weight modular-form ring M(Γ) from the parent, retaining its central-character convention. If E≤Γ, only even weights contribute. Set M̃(Γ)=M(Γ)[E₂] and M̃!(Γ)=M̃(Γ)[Δ⁻¹] inside holomorphic functions on ℍ. Equivalently M̃!=M!(Γ)[E₂]. Weights and quasimodular depth are retained as filtrations. The existing E₂ is used; this is not a new definition of the Eisenstein series.

**Direct dependencies:** `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W1/clear-cusp-poles`, `mathlib:ModularForm.discriminant`, `mathlib:ModularForm.logDeriv_eta_eq_E2`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `mathlib:EisensteinSeries.E2`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Definition 7.4.3, p.692; Lemma 7.4.4, pp.692–693. The definition describes weak quasimodular forms by adjoining E-two and inverting the discriminant. The target uses the parent's actual graded ring and retains its integral-weight and central-character conventions.

**Construction and proof.**

1. Embed the parent graded modular ring into functions, adjoin the pinned E₂, and localize at the nowhere-vanishing Δ.
2. Use cusp-pole clearing to identify the alternate description and retain the grading/depth filtration rather than treating a fixed weight as a ring.

**Uses that determine the API.**

- W8 derivative minimality: This is the ring generated by weak forms under the differential operation.
- W8 logarithmic examples: The explicit theta quotients lie in this ring.

**API.**

- `weakQuasimodular_ofWeakForm` (coercion): M!(Γ) embeds in M̃!(Γ) as depth zero.
- `weakQuasimodular_E2` (constructor): E₂ has weight 2 and depth at most 1.
- `weakQuasimodular_localization` (characterisation): Every element is Δ⁻m times a polynomial in E₂ with coefficients in M(Γ).
- `weakQuasimodular_restrict` (functoriality): Finite-index subgroup restriction preserves weights and depth and the underlying function.

**Unit tests.**

- `quasi_inverse_delta` (computation): Δ⁻¹ is admitted with weight −12 and depth zero.
- `quasi_E2_not_modular` (non-example): E₂ belongs at depth 1 and is not a full-group weight-2 modular form.
- `quasi_constant` (degenerate): 1 is weight 0 and depth 0.
- `quasi_pole_free` (compatibility): Depth-zero elements without cusp poles agree with the existing modular-form ring.

**Acceptance checks.**

- The ring includes Δ⁻¹; holomorphic-at-cusps quasimodular forms alone are too small.

### W8.2. The differential ring generated by weak forms

**Target:** `ModularFormsPartII:W8/derivative-minimality` (theorem).

With θ_q=(1/πi)d/dτ and q=e^{πiτ}, M̃!(Γ) is the smallest ℂ-subalgebra of holomorphic functions on ℍ containing M!(Γ) and closed under θ_q. In this normalization θ_qΔ=2E₂Δ, so E₂=(θ_qΔ)/(2Δ). For D=(1/2πi)d/dτ, DΔ=E₂Δ.

**Direct dependencies:** `ModularFormsPartII:W8/weak-quasimodular`, `ModularFormsPartII:W1/clear-cusp-poles`, `mathlib:ModularForm.logDeriv_eta_eq_E2`, `mathlib:ModularForm.discriminant_ne_zero`, `mathlib:Derivative.serreDerivativeMF`, `mathlib:Derivative.normalizedDerivOfComplex_E₂`, `mathlib:EisensteinSeries.E2`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 7.4.4, pp.692–693, with derivative normalization corrected. The lemma characterizes weak quasimodular forms as the differential closure of weak modular forms. The target corrects the factor of two forced by the paper's exponential-pi parameter.

**Construction and proof.**

1. Use the pinned Serre derivative of ordinary modular forms and Ramanujan’s derivative formula for E₂ to prove derivative closure of M(Γ)[E₂]. These are baseline inputs, not new derivative targets.
2. Differentiate Δ⁻m h by the quotient rule. Conversely derivative closure and Δ⁻¹ give E₂ using the factor 2 formula, hence the whole localized polynomial ring.

**Acceptance checks.**

- Leading terms: Δ=q²+⋯, θ_qΔ=2q²+⋯, E₂Δ=q²+⋯.

### W8.3. The elliptic integral of the second kind

**Target:** `ModularFormsPartII:W8/elliptic-integral-test` (theorem).

Let K₀(x)=Σ binom(2n,n)²x^n and E₀(x)=₂F₁(−1/2,1/2;1;16x). Then E₀=(1−16x)K₀+8∫₀ˣK₀(t)dt. At x=λ/16, E₀=(θ₃θ₄⁴+4θ_qθ₃)/θ₃³ belongs to M̃!(Γ(12)) and has q-series 1−4q+20q²−64q³+164q⁴−392q⁵+⋯.

**Direct dependencies:** `ModularFormsPartII:W2/jacobi-hypergeometric`, `ModularFormsPartII:W8/derivative-minimality`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-two-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-triple-product-analytic`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`, `mathlib:Derivative.normalizedDerivOfComplex_E₂`, `mathlib:Derivative.serreDerivativeMF`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §7.4.2, p.693, corrected E–K sign. The example writes the second elliptic integral as a theta derivative quotient. The target corrects the sign in its relation to the first elliptic integral and verifies its own level and multiplier.

**Construction and proof.**

1. Check the hypergeometric coefficient recurrence with the chosen constant term; derive the corrected integral identity coefficientwise.
2. Use theta derivative and product identities to obtain the displayed quotient, including its multiplier kernel and cusp-pole bound.

**Acceptance checks.**

- At x=0 both sides are 1; the printed opposite sign would give −1.

### W8.4. Catalan integral and theta quotient checks

**Target:** `ModularFormsPartII:W8/catalan-tests` (theorem).

The series I₁(x)=Σ binom(2n,n)²x^(n+1)/(n+1) and I₂(x)=Σ C_n²x^(n+1), C_n=binom(2n,n)/(n+1), are integral. Their derivatives satisfy I₁′=K₀ and xI₂′=I₁. Moreover Σ C_n²(λ/16)^n=(4/θ₂⁴)(4θ₃² θ_qθ₂/θ₂+4θ₃ θ_qθ₃−θ₃⁴) belongs to M̃!(Γ(12)).

**Direct dependencies:** `ModularFormsPartII:W8/weak-quasimodular`, `ModularFormsPartII:W8/derivative-minimality`, `ModularFormsPartII:W2/lambda`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-two-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-triple-product-analytic`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`, `mathlib:Derivative.normalizedDerivOfComplex_E₂`, `mathlib:Derivative.serreDerivativeMF`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §7.4.2, pp.693–694, Zudilin identity. The examples integrate the first elliptic integral once and twice and give a theta quotient for squared Catalan numbers. The target keeps the two integral series and the coefficient normalization distinct.

**Construction and proof.**

1. Use the Catalan integrality formula and formal differentiation/integration to identify the two series.
2. Derive the theta quotient from the elliptic differential equation and the theta identities; verify the constant term after cancellation of the apparent θ₂⁴ denominator.

**Acceptance checks.**

- The constant coefficient of the final quotient is 1.
- These examples support Question 7.4.5; they do not prove it for all logarithmic vector-valued forms.

### W8.5. Cuspidal arithmetic components and deficient places

**Target:** `ModularFormsPartII:W8/deficient-places` (definition).

Fix a number field K⊆ℂ and a representation ρ. Let S_k(ρ;K) be the K-space of cuspidal vector-valued forms whose components have actual expansions in tK[[t]] for t=q^(1/N), some common N. For each normalized place v of K declare it deficient if some such component Σ_{m≥1}a_m t^m has unbounded |a_m|_v at a finite v, or unbounded |a_m|_v/m^((k−1)/2+ε) for some ε>0 at an archimedean v. An archimedean place uses its usual modulus, not its square. The source’s Q̄-version is obtained by ranging over finite coefficient fields and chosen extensions of places.

**Direct dependencies:** `ModularFormsPartII:W7/vector-valued-form`, `ModularFormsPartII:W7/generalized-expansion`, `ModularFormsPartII:W1/bounded-denominators`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §7.4.8, pp.694–695. The definition tests finite-place denominator growth and archimedean cuspidal growth for actual arithmetic components. The target fixes a finite coefficient field, cusp parameter and absolute-value convention before forming witnesses.

**Construction and proof.**

1. Quantify actual cuspidal arithmetic forms and their components before their coefficient-growth witnesses. Fix the expansion parameter and absolute-value normalization.
2. Use the cofinal parameter changes t↦t^r to show that changing the common denominator of exponents only changes growth constants.

**Uses that determine the API.**

- W8 congruence growth: Package Shimura and Ramanujan–Petersson as no deficient place.
- W8 noncongruence test: A finite-place witness needs an actual arithmetic noncongruence component.

**API.**

- `deficientPlace_iff_witness` (characterisation): Membership is witnessed by a weight, a cuspidal arithmetic form, a component and the specified unbounded sequence.
- `deficientPlace_reindex` (compatibility): Replacing t by t^r preserves the witness after zero insertion and changes only constants.
- `deficientPlace_scalar` (relation): Multiplication by a fixed nonzero K scalar preserves boundedness or unboundedness.
- `deficientPlace_baseExtension` (functoriality): A witness transports to a finite field extension and a place above v, with compatible modulus normalization.

**Unit tests.**

- `deficient_zero_space` (degenerate): If every S_k(ρ;K) is zero, the deficient-place set is empty regardless of an undetected ambient summand.
- `deficient_common_scalar` (compatibility): One scalar denominator bounds coefficients at every finite place; it creates no finite-place witness.
- `deficient_local_denominator` (non-example): The coefficient sequence p^(−m) is unbounded at p even though all coefficients lie in K[1/p]. This tests the growth predicate, without asserting that the series is a modular component.
- `deficient_parameter` (compatibility): Zero-inserting by t↦t² preserves both the finite-place test and the exponent threshold at infinity.

**Acceptance checks.**

- Noncongruence of an invisible summand is not a witness form in this definition.

### W8.6. Congruence kernels have no deficient places

**Target:** `ModularFormsPartII:W8/congruence-no-deficiency` (theorem).

If ker ρ contains a principal congruence subgroup, then every Σ_K(ρ) is empty. At finite places a common scalar denominator bounds the coefficients. At every archimedean place the coefficients of a weight-k cuspidal component satisfy |a_m|≪_ε m^((k−1)/2+ε) for every ε>0.

**Direct dependencies:** `ModularFormsPartII:W8/deficient-places`, `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application`, `AutomorphicGaloisRepresentations:R19.3/hilbert-ramanujan-conjecture`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §7.4.8, p.695. The congruence direction combines scalar denominator bounds with Ramanujan–Petersson coefficient estimates. The target includes eigenform decomposition, all coefficients and archimedean embeddings rather than just a prime coefficient bound.

**Construction and proof.**

1. Restrict each component to a common principal level and apply the all-prime Shimura denominator theorem over its coefficient field.
2. Use the parent character/eigenform and oldform decomposition, Deligne’s F=ℚ bound including its tempered bad-prime form, and the divisor bound to pass from eigenform prime coefficients to all coefficients and all linear combinations. Projective nonzero cusp weights are even and at least 2.

**Acceptance checks.**

- The exponent statement is for cusp forms; Eisenstein coefficients are not substituted.

### W8.7. A finite deficient place from an arithmetic witness

**Target:** `ModularFormsPartII:W8/noncongruence-witness` (theorem).

Let a cuspidal component f over K be noncongruence. If its coefficient denominators are supported on a finite set S of finite places, then at least one v∈S is deficient. More generally the same conclusion follows from a supplied local-to-global denominator theorem for this component class. Thus an ambient representation conclusion additionally needs arithmetic forms detecting its noncongruence effective representation. These two hypotheses are not omitted.

**Direct dependencies:** `ModularFormsPartII:W8/deficient-places`, `ModularFormsPartII:W7/component-congruence`, `ModularFormsPartII:W6/number-field-variant`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Noncongruence discussion in §7.4.8, p.695, with detection and denominator bridge made explicit. The converse discussion needs a noncongruence arithmetic component and a way to find one finite unbounded place. The target states the finite-denominator-support implication and records the two missing ingredients in an unrestricted ambient converse.

**Construction and proof.**

1. If every v∈S were bounded, their finitely many bounds could be cleared by a single element of O_K. Places outside S are already integral, giving a global common denominator.
2. The component congruence theorem contradicts the noncongruence witness. Without finite S use precisely the missing LOCALGLOBAL bridge, not a false inference from globally unbounded denominators alone.

**Acceptance checks.**

- An infinite ambient summand on which F vanishes gives no such arithmetic component.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: LOCALGLOBAL.

## W9. The arithmetic fundamental-group application

On the connected cusp component of the smooth locus of a regular X(N) model, derive the split étale fundamental-group isomorphism from the arithmetic finite-cover criterion and algebraic-integer unbounded denominators; specify model and cover-descent inputs explicitly.

**Layer dependencies:** `ModularFormsPartII:W6`, `ModularCurvesPartII:R13.5`, `ModularCurvesPartII:R12.4`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.

**Planets:** Connected cuspal modular model; Arithmetic modular-model fundamental group.

### W9.1. The connected cuspal smooth model

**Target:** `ModularFormsPartII:W9/cuspal-model` (construction).

For N≥1 and a finite extension K/ℚ(μ_N), start with a minimal regular model of X(N) over O_K and the extension ε of its rational ∞ cusp. Let 𝒳_cusp(N) denote the smooth open selecting the connected fibre component through ε at each finite place, with the same generic fibre. Require existence, uniqueness and compatibility of this selection as the model contract NERON. This pins the intended connected Néron model; it does not confuse a global connected component of an irreducible total space with a component in each fibre.

**Direct dependencies:** `ModularCurvesPartII:R13.5`, `ModularCurvesPartII:R12.4`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.4.10, p.696, connected-model convention. The final theorem uses the connected cuspal smooth part of a regular modular-curve model. The target pins the fibrewise connected-component selection and cusp section rather than using global connectedness of the total space.

**Construction and proof.**

1. Import the regular-model and cusp-section existence contracts, then form the specified smooth cuspal open.
2. Check the fibre-component selection and its compatibility with the finite covers used in the proof.

**Uses that determine the API.**

- W9 fundamental groups: The cusp section supplies the splitting and base point.
- W9 arithmetic cover criterion: Good and bad fibres both enter the no-geometric-cover claim.

**API.**

- `cuspalModel_genericFibre` (compatibility): The generic fibre is the specified X(N)_K.
- `cuspalModel_smooth` (structure): The structure morphism to Spec O_K is smooth with the selected connected fibres.
- `cuspalModel_cuspSection` (constructor): ε is a section through the smooth cuspal component.
- `cuspalModel_basePoint` (functoriality): Every geometric η on the base gives ε(η) and π∘ε=id.

**Unit tests.**

- `cuspal_level_one` (computation): For X(1)=ℙ¹ with its usual smooth model, the cuspal model is ℙ¹_{O_K}.
- `cuspal_section_identity` (compatibility): The maps induced by π∘ε=id compose to the identity on the base π₁.
- `cuspal_bad_fibre` (non-example): A different connected component in a bad special fibre is not retained merely because the total regular model is globally connected.
- `cuspal_field_requirement` (non-example): The claimed distinguished cusp section is not silently descended to a field not containing its field of definition.

**Acceptance checks.**

- No group-scheme Néron mapping property is assumed for a curve merely because of the source’s terminology.

### W9.2. The arithmetic finite-cover criterion

**Target:** `ModularFormsPartII:W9/arithmetic-cover-criterion` (theorem).

Every finite étale cover of 𝒳_cusp(N) is the pullback of a finite étale cover of Spec O_K, with morphisms descending uniquely. This statement includes all primes dividing N. It is the precise arithmetic geometric input to the fundamental-group theorem.

**Direct dependencies:** `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W6/number-field-variant`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `ModularCurvesPartII:R13.5`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Sketch of Theorem 7.4.10, p.696, citing Ihara (1994), §4 p.252 and Theorem 1 pp.248–249. The proof sketch invokes Ihara to descend all finite etale covers from this model to the integer base. The target states that precise missing input at bad primes and checks the lambda coordinate's level doubling.

**Construction and proof.**

1. Read and adapt the arithmetic formal-rationality/cover criterion in IHARA94, with its model assumptions retained. A finite étale cover gives an algebraic-integer expansion along the cuspal section; W6 forces its modular germ to be congruence.
2. Prove that étaleness over the selected smooth model at every finite place forces this congruence cover to be arithmetically constant, then descend it over O_K. The exact missing input is NERON.
3. Use λ(τ/N)/16 as a parameter only after the appropriate level doubling or formal cover: its leading term is exp(πiτ/N), whereas the usual width-N X(N) parameter is exp(2πiτ/N). Prove the resulting formal descent.

**Acceptance checks.**

- The theorem is not justified merely by the existence of a rational cusp or by an isomorphism on generic-fibre fundamental groups.

### W9.3. The fundamental group of the connected cuspal model

**Target:** `ModularFormsPartII:W9/arithmetic-pi1` (theorem).

For N≥1, K/ℚ(μ_N) finite and every geometric η of Spec O_K, the maps π_*:π₁(𝒳_cusp(N),ε(η))→π₁(Spec O_K,η) and ε_* in the opposite direction are mutually inverse isomorphisms.

**Direct dependencies:** `ModularFormsPartII:W9/arithmetic-cover-criterion`, `ModularFormsPartII:W9/cuspal-model`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.4.10, p.696. The theorem identifies the two pointed etale fundamental groups by the structural morphism and its cusp section. The target derives it from an equivalence of finite-cover categories at every geometric base point.

**Construction and proof.**

1. The finite-cover criterion identifies the two pointed Galois categories, so the induced maps on automorphism groups are inverse.
2. The section checks π_*ε_*=id and fixes the base-point ambiguity.

**Acceptance checks.**

- The result is stated for every geometric base point, including points over finite primes.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: MODEL, NF, NERON.

## Worked acceptance calculations

These small cases fix normalizations used across the layers and distinguish the intended definitions from tempting alternatives.

1. The integral coordinate is x=q−8q²+44q³−192q⁴+718q⁵+O(q⁶); the inverse is q=x+8x²+84x³+992x⁴+12514x⁵+O(x⁶). Both compositions are the identity through degree five. By contrast the normalized cube root in t=q^(1/3) is t−(8/3)t⁴+…, so its cube is integral while the root need not be.
2. For H′={γ∈Γ(2):dγ≡1 mod4}, E is absent and Γ(4) is contained, but its signed level is two. This tests the conclusion Γ(L(G))≤⟨G,E⟩ and rejects the same conclusion into G without the sign hypothesis. The theta-square character becomes trivial precisely after such a restriction.
3. At level 2N=4, the function-field degree over ℚ(λ) is four. At 2N=2 it is one. Applying the generic projective-index formula at N=1 would give one half, so this boundary must be split off.
4. For n=2^a>1, the coefficient of x^m in (1−16x)^(1/n) has 2-adic valuation (4−a)m−v₂(m!). The exponents a=1,2,3 give bounded denominators, while a=4 gives valuations tending to minus infinity. An odd prime dividing n also gives unbounded valuations. This is the arithmetic distinction between the Fermat exponents 1,2,4,8 and all others.
5. For a constant vector F=(1,0,0), use ρ=1⊕σ with S=diag(1,−1), R=[[2,1],[−7,−3]], and T=SR=[[2,1],[7,3]]. Direct multiplication gives S²=R³=I. The characteristic polynomial of T is X²−5X−1; its two roots are distinct and one has modulus greater than one. The ambient image is infinite, but the value span is one-dimensional and trivial. This tests both the rank of component continuation and the effective-span formulation of Mason's corollary.
6. At the first two q-coefficients, Δ=q²+…, θ_qΔ=2q²+…, and E₂Δ=q²+…. The normalized elliptic integral E₀ has constant term one, as does (1−16x)K₀+8∫₀ˣK₀. Negating that expression fails already at the constant term.
7. The degree-two theta monomial θ₂θ₃ changes sign under T¹², although T¹² lies in Γ(12). A common Γ(12) claim for every even-degree theta Laurent monomial therefore fails. The specific quotients in W8 require their own multiplier checks.

## Exact additional proof inputs

These inputs have identified owners or mathematical boundaries. They must be supplied before a proof plan can be marked closed. The targets above remain in scope with the specified statements.

### ALG. Unregistered arithmetic holonomy supplier

The extraction proposes ArithmeticAlgebraizationAndHolonomyBounds, but no roadmap, packet or reserved stage exists at this baseline. Needed: Definition 2.0.4 H/V including meromorphic trivial-monodromy singularities, and Corollary 2.0.5 with p nonconstant, p(u(t)) integral, φ holomorphic near the closed disc, |φ′(0)|>1 and its mean-log dimension bound over ℚ(p). This is the exact external input to W3 and W7; no fictitious supplier id is used. Register the proposed Part II of DiophantineApproximationAndTranscendence and import its final layer.

Required by `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W3/quantitative-rank`, `ModularFormsPartII:W7/ode-algebraicity`.

### UNI. Unregistered punctured-plane supplier

The extraction proposes PuncturedPlaneUniformizationAndValueDistribution, but it has no registered roadmap or packet here. Needed: complex ODE continuation and regular singularities; normalized universal covers F_N for N≥2; Theorem 5.1.4 gamma formula and positive N⁻³ derivative boost; Theorem 6.0.1 mean log⁺|F_N^N|≪log(N/(1−r)); Schwarz equality and holomorphic uniformization radius. Own the generic results there as Part II of ConformalMapping. N=1 is treated by a small-level embedding, not the hyperbolic formula.

Required by `ModularFormsPartII:W2/small-uniformizations`, `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W3/quantitative-rank`, `ModularFormsPartII:W7/ode-algebraicity`, `ModularFormsPartII:W7/regular-singular-component`.

### FIN. Finite periodic and amalgam cohomology inputs

The finite UCT/Sylow supplier supplies detection, but not the integral H₂ computations for cyclic and generalized-quaternion groups, their primary Sylow classification inside SL₂(𝔽_p), or the C₄ *_{C₂} C₆ cohomology sequence. Plan these as a ProfiniteCohomology extension, with the finite S₃ case separate. The special SL₂ calculations stay here.

Required by `ModularFormsPartII:W4/finite-schur`, `ModularFormsPartII:W4/sl2z-cohom`.

### COEFF. Continuous integral homology conventions

Specify and supply the completed-bar compact ℤ̂ coefficient theory, UCT with finite discrete coefficients, primary finite generation, and Nakayama used to pass from zero mod-ℓ H₂ quotients to zero compact H₂. CDT25 p.665 does not spell out this interface. Do not read it as a proof of abstract-group integral homology vanishing.

Required by `ModularFormsPartII:W4/integral-local-h2`.

### CSP. The arithmetic amalgam and congruence subgroup property

ModularCurvesPartII:R14.4 owns an Ihara application but not the exact group-theoretic input used here. Required: the two level-N copies of SL₂(ℤ) in SL₂(ℤ[1/p]) form the stated amalgam over Γ₀(p), and every finite quotient of the relevant arithmetic subgroup is congruence away from p, with central signs and N≥3 variants. Supply a read primary proof (CDT25 cites Berger, Serre and Mennicke) and extend that owner. This is not generic Goursat and is not supplied by a cohomological Ihara injectivity theorem alone.

Required by `ModularFormsPartII:W5/abelian-ihara`, `ModularFormsPartII:W5/nonabelian-ihara`.

### MODEL. Rational cusp models and geometric degree descent

Supply the specific geometrically connected ℚ-model of Y(m) classifying an elliptic curve with symplectic identification E[m]≃ℤ/m⊕μ_m, its rational ∞ cusp, and coefficientwise Galois-compatible Fourier germ. The existing ModularCurvesPartII:R12.4 fixed-pairing model and R13.5 level-raising contracts do not explicitly give this twist and cusp. Prove the geometric Galois base-change step for R₂N M₂Np; field intersection alone is not enough.

Required by `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`, `ModularFormsPartII:W6/number-field-variant`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

### NF. Arithmetic descent of noncongruence Fourier germs

Supply a number-field model and q-germ for an arbitrary finite-index modular function with algebraic coefficients; show all coefficients lie in one number field, and coefficientwise Galois conjugation produces finite-index weak modular functions with compatible cusp parameters. Reduce arbitrary weight via the explicit congruence factor. Belyi existence alone does not identify its distinguished Fourier germ, and the congruence q-expansion comparison alone does not cover a noncongruence group. This is the precise missing bridge in the short trace proof of Remark 6.3.2.

Required by `ModularFormsPartII:W6/number-field-variant`, `ModularFormsPartII:W7/arithmetic-component`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

### ROOT. Special congruence abelianization for Γ₀(2)

The h-root example can be completed by an explicit denominator calculation, or by proving that the congruence completion of Γ₀(2) has abelianization ℤ/24⊕ℤ/2 and identifying the h-cover character. CDT25 p.629 states this computation without proof. Supply the local elementary-matrix computation and identify the order-2 factor, rather than confusing it with SL₂(ℤ_p)^ab.

Required by `ModularFormsPartII:W6/h-root-test`.

### ARITH. Arithmetic equation for the actual selected component

Prove that the regular-singular complex realization of W_j with its chosen integral germ descends to ℚ̄(x), and that the minimal arithmetic scalar operator realizes precisely this continuation module, including reducible cases and apparent poles. A rank-n complex local system, rational Taylor coefficients, or a bare Riemann–Hilbert existence assertion alone does not prove this. This special modular bridge belongs to W7; the generic arithmetic G-function theory remains in DT.5.

Required by `ModularFormsPartII:W7/arithmetic-component`.

### GLOCAL. Exact G-operator local-monodromy input

DT.5 supplies the definition of a G-function and a Chudnovsky–Galochkin condition for a linearly independent system, but its regular-singularity node only controls the specified point. Needed here: the minimal operator of one G-function, compatibility with the descended possibly reducible cyclic module, and the global nilpotence/quasi-unipotence theorem at every singularity. Request this precise extension of DT.5; semisimplicity then yields finite order.

Required by `ModularFormsPartII:W7/arithmetic-component`.

### SZ. Primary Stiller–Zagier differential-equation proof

CDT25 Remark 7.2.3 cites the positive-weight differential equation without proving its scalar order and singularity claims. Read the primary Stiller (1984) or Zagier (2008), §5.4 proof, and pin the finite cover, cyclic order, apparent poles and symmetric-power identification. The target uses order at most k+1 until those hypotheses are supplied.

Required by `ModularFormsPartII:W7/stiller-zagier`.

### LOCALGLOBAL. Deficient-place converse needs an arithmetic witness

The unconditional ambient converse asserted on CDT25 p.695 requires (i) noncongruence to be detected by an actual arithmetic cuspidal component and (ii) a theorem converting the relevant all-place local bounds into one global common denominator. Neither follows merely from the component theorem or from noncongruence of an invisible summand. W8 proves the precise finite-denominator-support witness version. The unrestricted archimedean and finiteness questions remain questions, not roadmap theorem targets. Selberg’s asserted bound also needs its primary hypothesis/normalization check before use.

Required by `ModularFormsPartII:W8/noncongruence-witness`.

### NERON. All-prime cuspal-model cover descent

The source gives only a sketch referring to Ihara (1994), Horizontal divisors on arithmetic surfaces associated with Belyi uniformizations, Theorem 1 pp.248–249 and §4 p.252 (DOI 10.1017/CBO9780511569302.011). No lawful full text was available from the cleared library or official publisher/author endpoints checked. Supply and read that proof, fix the fibrewise connected-model convention, verify the smooth cusp section and regular-model hypotheses for every N and all bad primes, and prove the λ(τ/N)/16 formal-coordinate/level-doubling descent. The existing modular-curve and étale π₁ suppliers do not state this arithmetic criterion.

Required by `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

## Source corrections used by the targets

Every description here is a paraphrase. The packet's legacy `printed` field also contains only a paraphrase and is marked accordingly. These observations govern the target statements; they do not assert the existence of a published erratum. The bounded checks recorded in the packet distinguish what was inspected from historical checks attributed to the extraction.

**ModularFormsPartII/E1 — misprint, affecting the proof.** CDT25 published offprint; Lemma 4.5.6 proof, p.663.

Source wording, paraphrased: The p=5 adjoint cohomology exception is labelled with 𝔽₃.

Correction: Use 𝔽₅.

Check: The representation and the exceptional adjoint H¹ are over the field of characteristic p.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E4 — misprint, affecting the proof.** CDT25 published offprint; Lemma 4.1.7 proof, second cusp case, p.654.

Source wording, paraphrased: The displayed correcting diagonal has the reciprocal entries reversed.

Correction: Use diag(1/p,p) in the factorization of C; the translation exponent is Np.

Check: Multiplying the preceding matrix by this diagonal gives C=(a/p,b;c,pd) and determinant one.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E5 — misprint, affecting the proof.** CDT25 published offprint; Theorem 4.3.2 proof, p.656.

Source wording, paraphrased: The selected old-level counterexample is placed in R₂Np.

Correction: Select it in R₂N outside M₂N before applying p-scaling.

Check: Theorem 4.3.1 takes the old-level input.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E6 — error, affecting the proof.** CDT25 published offprint; Reduction map preceding Lemma 4.4.4, p.659.

Source wording, paraphrased: The signed-domain reduction kernel is identified with Γ(Np).

Correction: Compute on D=Γ(N)∩Γ₀(p), whose reduction kernel is Γ(Np), then adjoin E for the generation formula.

Check: For N>2, a matrix congruent to −I modulo N and I modulo p lies in the signed kernel but not Γ(Np).

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E7 — gap, affecting the proof.** CDT25 published offprint; Lemma 4.2.3 proof, p.656.

Source wording, paraphrased: The core of the generator stabilizers is said to have exact geometric level 2N without an added level constraint.

Correction: Intersect also with ⟨E,Γ(2N)⟩ before taking the core.

Check: For R₂=M₂ the basis {1} by itself gives the full-group stabilizer of level one. The additional intersection forces exact level two.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E10 — error, affecting a stated result.** CDT25 published offprint; E–K relation, §7.4.2, p.693.

Source wording, paraphrased: The elliptic integral is expressed as the negative of the normalized intended expression.

Correction: Use E₀=(1−16x)K₀+8∫₀ˣK₀.

Check: Both normalized integrals have constant coefficient one; the printed right side has constant coefficient minus one.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E11 — gap, affecting the proof.** CDT25 published offprint; Lemma 4.5.6, p.662.

Source wording, paraphrased: The elementary H¹ calculation suppresses the p=2 abelianization proof.

Correction: Compute SL₂(ℤ₂)^ab=C₄ directly before the H² argument.

Check: Deriving it from the final H² lemma would create a dependency cycle.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E12 — error, affecting a stated result.** CDT25 published offprint; Equation (1.1.5), p.631, and (7.2.4), p.688.

Source wording, paraphrased: The theta-square example is treated as weight one with trivial Γ(2) character.

Correction: Retain χ(γ)=χ₋₄(dγ), or restrict to its kernel d≡1 mod4.

Check: −I belongs to Γ(2), but a nonzero odd-weight trivial-character form cannot be invariant under −I.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E13 — gap, affecting the proof.** CDT25 published offprint; Local-system construction and Theorem 7.3.3 proof, pp.690–691.

Source wording, paraphrased: Six cosets times the components are asserted to form a free integral rank-6n bundle, and the selected system is treated as irreducible with arithmetic coefficients.

Correction: Use rank-n complex Lρ and the actual continuation space W_j of dimension at most n; separately prove regular-singular realization, arithmetic descent and minimal-operator compatibility.

Check: Slash translates are constant linear combinations of the original components. For F=1 the scalar equation is f′=0, of rank one. Neither integral freeness nor irreducibility follows.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E14 — error, affecting a stated result.** CDT25 published offprint; Corollary 7.3.4, p.691.

Source wording, paraphrased: Integrality of all components is used to force a congruence kernel for the full ambient representation.

Correction: Conclude congruence on V_F; conclude it on the ambient representation only if V_F=ℂⁿ.

Check: The explicit nonzero example F=(1,0,0),ρ=1⊕σ in W7 has integral coefficients and an invisible infinite-image summand.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E17 — misprint, affecting the proof.** CDT25 published offprint; Second map in §4.4, p.658.

Source wording, paraphrased: Conjugation by diag(p,1) is described as preserving Γ₀(p).

Correction: Its codomain here is the full ⟨E,Γ(N)⟩, and its Γ₀(p) image instead satisfies an upper-right divisibility condition.

Check: The lower unipotent with entry Np is sent to one with entry N, which is outside Γ₀(p) when p∤N.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E18 — misprint, affecting the proof.** CDT25 published offprint; θ convention and Lemma 7.4.4, pp.692–693.

Source wording, paraphrased: The displayed θ=(1/πi)d/dτ is combined with θΔ=E₂Δ.

Correction: For that θ use θΔ=2E₂Δ and E₂=θΔ/(2Δ), or use D=(1/2πi)d/dτ throughout.

Check: The pinned η logarithmic derivative gives d log Δ/dτ=2πi E₂; Δ starts at q² for q=e^{πiτ}.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E19 — gap, affecting a stated result.** CDT25 published offprint; Deficient-place converse, §7.4.8, p.695.

Source wording, paraphrased: A finite deficient place is asserted from noncongruence of the ambient representation alone.

Correction: Require an arithmetic noncongruence component detecting the effective representation, and a local-to-global denominator theorem or finite denominator support.

Check: The definition quantifies arithmetic cuspidal forms; invisible summands supply no witness. Global unbounded denominators do not by themselves identify one unbounded finite place.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E20 — error, affecting a stated result.** CDT25 published offprint; Theta monomial congruence-level assertion, §7.4.2, p.693.

Source wording, paraphrased: One level Γ(12) is proposed for every even-degree theta Laurent monomial.

Correction: Check each multiplier kernel; Γ(12) can be used for the particular displayed quotients only after verification, and is not a universal level for all such monomials.

Check: θ₂θ₃ has degree two but changes sign under T¹²: θ₂(τ+12)=−θ₂(τ), while θ₃(τ+12)=θ₃(τ). T¹² lies in Γ(12).

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

**ModularFormsPartII/E21 — misprint, affecting the proof.** KSV10 arXiv:0905.4798v4, §3, Proposition 3 proof, p.6, factorization of L following equation (1).

Source wording, paraphrased: The further expression of L as a conjugate of a translation uses the two transpose-translation factors in the opposite order.

Correction: For T=[[1,1],[0,1]] and L=[[a,a−1],[1−a,2−a]], use L=(Tᵗ)⁻¹ T^(a−1) Tᵗ.

Check: At a=2 the intended L is [[2,1],[−1,0]], whereas the product in that line is [[0,1],[−1,2]]. Direct multiplication gives the corrected identity. Equation (1) itself has the correct outside exponent.

Correction status: No correction located in the bounded author/arXiv/publisher searches on 2026-10-19. The finding is checked in arXiv v4; the published journal formula was not compared.

## Suggested Lean coverage

[The suggested file](../suggested/ModularFormsPartII.lean) is provisional and nonexhaustive; this document is definitive. It contains light definitions of weak holomorphy, integral Fourier expansion, bounded rational denominators, the actual eta-quotient λ, and the vector slash law over carriers available at the pins. It states selected closure, λ, unbounded-denominator, effective-span and derivative milestones, with representative examples. Its predicates keep analytic cusp-germ and period hypotheses explicit. The vector slash statement uses SL₂ and starts after scalar component modularity; the README's projective and growth hypotheses enter the component theorem before that linear-algebra milestone.

Field-span carriers with their analytic comparison, continuous cohomology, arithmetic H/V, regular-singular differential modules, the full vector-valued and quasimodular bundles, deficient-place witnesses and arithmetic models are specified above with their complete API and tests. Their construction requires mathematics beyond the pinned carriers and belongs in the implementation directed by this document. They are not replaced by unspecified proposition fields or unimplemented data in the compact prototype. Existing derivatives, theta functions and modular-form carriers remain imports.

## Source and route inventory

The published article is used for the modular targets and applications, with its analytic tools imported by exact contracts. The elementary signed Wohlfahrt argument has a separate primary source. Page numbers below are the source's printed page numbers; the CDT25 PDF begins at journal page 627. All mathematical statements and source descriptions in this document are written in our own words.

- **CDT25:** Frank Calegari, Vesselin Dimitrov and Yunqing Tang, [The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), J. Amer. Math. Soc. 38 (2025), 627–702; published author offprint.
  SHA-256: `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`.
  Reading boundary: Theorem 1.0.1 and §1.1, pp.627–632; Definition 2.0.4 and Corollary 2.0.5, pp.635–636 (input contract only); §§3–4.6, pp.649–666; Theorem 5.1.4, pp.667–668, and Example 5.1.22, p.673 (input contracts and acceptance examples); §6.3, pp.685–686; §§7.2–7.4.9 and Theorem 7.4.10, pp.687–696.
- **upstream-modular:** Tau Ceti contributors, [Modular forms — Hecke theory, newforms, and L-functions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/ModularForms/README.md), TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27.
  Reading boundary: README complete; Suggested opening and carrier interfaces; Layers 0, 1, 8G and 10 used for ownership.
- **upstream-fuchsian:** Tau Ceti contributors, [Fuchsian groups, orbifolds and compactified quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/FuchsianOrbifolds/README.md), TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27.
  Reading boundary: README complete; Suggested quotient and cusp interfaces.
- **upstream-conformal:** Tau Ceti contributors, [Conformal mapping and the geometric theory of holomorphic functions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/ConformalMapping/README.md), TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27.
  Reading boundary: README complete, especially L4 and modular λ ownership.
- **KSV10:** Ian Kiming, Matthias Schütt and Helena A. Verrill, [Lifts of projective congruence groups](https://arxiv.org/pdf/0905.4798), arXiv:0905.4798v4, 20 July 2010.
  SHA-256: `47b1b84db45e4e774a8705d75df323558352885c7a81e3f786b9cd0168d55ef6`.
  Reading boundary: §3, Lemma 7, proof of Proposition 3, equation (1) and Remark 8, pp.4–6.

The paper extraction is a routing lead, not an independent proof source. All 60 items in its `NoncongruenceModularForms` route are accounted for below by the stable target ids. One route item can require several targets when a proof bridge has to be separated. Imported generic theories remain with their suppliers. The questions about logarithmic vector-valued forms, archimedean deficient places and finiteness of deficient-place sets are not asserted as theorems.

| Extraction item | Targets |
| --- | --- |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-1.0.1` | `ModularFormsPartII:W6/unbounded-denominators` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-algebraic-integers` | `ModularFormsPartII:W6/number-field-variant` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/modular-forms-finite-index` | `ModularFormsPartII:W1/weak-form` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lambda-function` | `ModularFormsPartII:W2/lambda` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lambda-covering` | `ModularFormsPartII:W2/lambda-covering` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lambda-inverse-integrality` | `ModularFormsPartII:W2/inverse-integrality` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/jacobi-hypergeometric-theta` | `ModularFormsPartII:W2/jacobi-hypergeometric` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/example-j-cube-root` | `ModularFormsPartII:W6/j-cube-root` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/example-h-roots` | `ModularFormsPartII:W6/h-root-test` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/example-fermat-klein` | `ModularFormsPartII:W6/fermat-test` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/prop-3.0.1` | `ModularFormsPartII:W3/quantitative-rank` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/r2n-in-v` | `ModularFormsPartII:W3/holonomy-embedding` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-4.1.2` | `ModularFormsPartII:W1/wohlfahrt-level` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.1.3` | `ModularFormsPartII:W1/level-intersection` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.1.4` | `ModularFormsPartII:W1/level-normal-core` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.1.7` | `ModularFormsPartII:W1/level-scaling` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/wohlfahrt-theorem` | `ModularFormsPartII:W1/wohlfahrt` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-4.2.1-m2n` | `ModularFormsPartII:W3/congruence-field` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-4.2.1-r2n` | `ModularFormsPartII:W3/bounded-field` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.2.2-containment` | `ModularFormsPartII:W3/congruence-inclusion` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.2.2-finiteness` | `ModularFormsPartII:W3/finite-rank` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.2.3-fields` | `ModularFormsPartII:W3/field-structures` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.2.3-normal-subgroup` | `ModularFormsPartII:W3/normal-stabilizer` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-4.3.1` | `ModularFormsPartII:W5/scaling-separation` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-4.3.2` | `ModularFormsPartII:W5/degree-doubling` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/index-formula-4.3.3` | `ModularFormsPartII:W5/congruence-degree` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/prop-4.3.5` | `ModularFormsPartII:W5/leveraging-contradiction` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.4.1` | `ModularFormsPartII:W5/nonabelian-ihara` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.4.4` | `ModularFormsPartII:W5/triple-surjectivity` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/generation-4.4.9` | `ModularFormsPartII:W5/generation` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-4.5.1` | `ModularFormsPartII:W4/congruence-class` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/completed-h1` | `ModularFormsPartII:W4/completed-h1` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-4.5.2` | `ModularFormsPartII:W4/all-level-invariants` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/cor-4.5.3` | `ModularFormsPartII:W4/difference-criterion` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.4` | `ModularFormsPartII:W4/finite-schur` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.5` | `ModularFormsPartII:W4/finite-low-cohom` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.6-h1` | `ModularFormsPartII:W4/local-h1` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.6-h2` | `ModularFormsPartII:W4/local-h2-preliminary` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.9-isomorphisms` | `ModularFormsPartII:W4/product-h2` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.9-vanishing` | `ModularFormsPartII:W4/restriction-h2` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/diagram-4.5.10` | `ModularFormsPartII:W4/hs-comparison` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.11` | `ModularFormsPartII:W4/small-level-invariants` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.12` | `ModularFormsPartII:W4/local-h2-final`, `ModularFormsPartII:W4/integral-local-h2` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/sl2z-cohomology` | `ModularFormsPartII:W4/sl2z-cohom` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.6.3` | `ModularFormsPartII:W5/enhanced-ihara` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/example-5.1.22` | `ModularFormsPartII:W2/small-uniformizations` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-7.2.1-algebraicity` | `ModularFormsPartII:W7/ode-algebraicity` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-7.2.1-congruence` | `ModularFormsPartII:W7/ode-congruence` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/stiller-zagier` | `ModularFormsPartII:W7/stiller-zagier` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-7.3.1` | `ModularFormsPartII:W7/vector-valued-form` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/remark-7.3.2` | `ModularFormsPartII:W7/generalized-expansion` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/vvmf-connection` | `ModularFormsPartII:W7/complex-local-system`, `ModularFormsPartII:W7/component-continuation`, `ModularFormsPartII:W7/regular-singular-component`, `ModularFormsPartII:W7/arithmetic-component` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-7.3.3` | `ModularFormsPartII:W7/component-congruence` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/cor-7.3.4` | `ModularFormsPartII:W7/effective-mason` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-7.4.3` | `ModularFormsPartII:W8/weak-quasimodular` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-7.4.4` | `ModularFormsPartII:W8/derivative-minimality` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/examples-7.4.2` | `ModularFormsPartII:W8/elliptic-integral-test`, `ModularFormsPartII:W8/catalan-tests` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-deficient-places` | `ModularFormsPartII:W8/deficient-places` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/deficient-places-theorem` | `ModularFormsPartII:W8/congruence-no-deficiency`, `ModularFormsPartII:W8/noncongruence-witness` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-7.4.10` | `ModularFormsPartII:W9/arithmetic-pi1` |
