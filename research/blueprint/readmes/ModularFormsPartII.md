# Modular forms — Hecke theory, newforms, and L-functions, Part II: noncongruence subgroups and the unbounded denominators theorem

This continuation starts with weakly holomorphic modular forms on arbitrary finite-index subgroups of SL₂(ℤ). It constructs the modular λ coordinate and the fields of bounded-denominator and congruence modular functions. A quantitative holonomy bound and Ihara leveraging identify those fields and prove that one integral Fourier expansion forces congruence. The application layers treat differential equations, selected components of vector-valued forms, quasimodular examples, arithmetic coefficient growth, and the connected cuspal modular model.

The base is [Modular forms — Hecke theory, newforms, and L-functions](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/ModularForms), roadmap `tauceti:TauCetiRoadmap/ModularForms`. Its characters, parity, graded rings, Hecke theory, eigenforms, newforms and L-functions are inputs. The general finite-index valence formula, cusp widths and ordinary holomorphic form carrier are library inputs. This continuation does not construct them again. The atlas extraction calls this direction `NoncongruenceModularForms`; its issue and file identifier is `ModularFormsPartII`.

Four other atlas roadmaps already plan parts of the argument, and this roadmap imports them rather than planning them again. QSeriesPartitionsAndMockModularForms (QM.3) owns the space M^!\_k(Γ) of weakly holomorphic forms. ModularCurvesPartII (R14.4; TauCetiRoadmap pull request #913, Layer 15) owns congruence classes, the principal-level SL₂ amalgam, the congruence subgroup property of SL₂(ℤ[1/p]), the abelian and enhanced Ihara lemmas, and the congruence-invariance criterion together with the whole cohomological calculation of CDT §4.5. DiophantineApproximationAndTranscendencePartII (AA.4) owns the integral holonomic ring and the corrected rank bound of CDT Corollary 2.0.5. ConformalMappingPartII owns the uniformization of ℂ∖μ\_N, its conformal radius (CDT Theorem 5.1.4) and the uniform mean-growth estimate (CDT Theorem 6.0.1).

## Conventions and boundaries

Write E={±I}, T=[[1,1],[0,1]], Γ(N)=ker(SL₂(ℤ)→SL₂(ℤ/N)), Γ₀(p) for lower-left divisibility, and Γ₁(p) for diagonal entries one and lower-left zero modulo p. A group is congruence when it contains some Γ(N), with N positive; it need not contain E. Analytic weight-k slash actions use the existing determinant-normalized carrier. Unless a target says otherwise, k is an arbitrary integer and finite index is a hypothesis.

A weak form is an element of the imported space M^!\_k(Γ) for a finite-index Γ≤SL₂(ℤ): holomorphic on ℍ and meromorphic at every rational cusp, with finite principal part (W1/weak-form). A meromorphic function with an interior pole is not a weak form. Strict cusp widths specify honest translation periods. Signed widths specify the projective geometric ramification and can be half a strict width when E is absent. All statements using signed principal groups retain this distinction. A nonzero odd-weight form on Γ(2) requires a character; θ₃² uses χ₋₄(d).

The Fourier conventions are q=exp(πiτ), Q=q²=exp(2πiτ), t=q^(1/N), and x=λ/16. Thus t has strict period 2N, the library `UpperHalfPlane.qExpansion (2N)` gives its Taylor coefficients only for the corresponding analytic periodic germ, λ=16q+…, and Δ=q²+…. Bounded denominators means one scalar clears every coefficient. It is stronger than having coefficients in a ring with finitely many primes inverted. In the derivative layer θ\_q=q d/dq=(1/πi)d/dτ=2D, where D=(1/2πi)d/dτ. Consequently θ\_qΔ=2E₂Δ.

The Laurent fields M₂N and R₂N sit in one specified ℚ((t)). They are defined as ℚ(λ)-linear spans. Their generators are holomorphic away from cusps; scalar rational functions in λ can introduce interior poles in general span elements. Finiteness precedes the proof that each span is a field and the selection of a finite basis. The constant field is ℚ. Complex scalar extension and rational cusp-model descent are separate proof steps.

Vector-valued forms in W7 use projective representations and therefore have even weight when nonzero. The ambient local system has rank n over ℂ. The continuation space of one component has rank at most n and need not be irreducible. Only the span of the values of a form is detected by its coefficients. The whole representation has a congruence kernel only when this span is the whole space.

Arithmetic algebraization, punctured-plane uniformization, covering spaces, congruence cohomology, G-function arithmetic, and regular modular-curve models retain their owners, named above and in the targets. The holonomic rank bound is used for the ℚ(λ)-span W of integral holonomic germs, not for the larger span V: for the nonintegral λ-root coordinate the printed V bound can fail (E24).

## Layer order and milestones

The Ihara group theory (W4) precedes leveraging (W5), and the application layer is separated into differential equations and components, quasimodular and arithmetic growth, and the arithmetic fundamental group. This order follows the proof dependencies.

| Layer | Targets | Atlas planets | Mathematical output |
| --- | ---: | ---: | --- |
| W1 — Weak forms and geometric levels | 8 | 5 | Characterize weak forms on finite-index subgroups of SL₂(ℤ) by meromorphic cusp germs, importing the weakly holomorphic carrier of QSeriesPartitionsAndMockModularForms QM.3. Pin strict and signed widths, bounded denominators and geometric Wohlfahrt level. Prove intersection, normal-core and p-scaling laws and the signed Wohlfahrt theorem; clear cusp poles by Δ. |
| W2 — The modular λ coordinate | 7 | 5 | Construct λ by the existing η function, identify X(2) with ℙ¹ and λ as its three-punctured covering coordinate, prove integral inverse reparametrization and Kummer normalization, and the hypergeometric–theta identity with its character. Connect the N=2 and N=3 punctured-plane acceptance examples. |
| W3 — Bounded-denominator fields and holonomy rank | 8 | 5 | Define the ℚ(λ)-spans M₂N and R₂N in rational Laurent series, prove inclusion, multiplication and field structure, construct the normal stabilizer with exact level, place R₂N in the ℚ(λ)-span W of integral holonomic germs for the λ-root coordinate, and derive finiteness and the quantitative rank bound from the corrected holonomic rank theorem of DiophantineApproximationAndTranscendencePartII and the uniformization of ℂ∖μ\_N of ConformalMappingPartII. |
| W4 — The nonabelian Ihara lemma and the generation identity | 3 | 2 | From the principal-level amalgam, the congruence subgroup property of SL₂(ℤ[1/p]) and the enhanced Ihara lemma of ModularCurvesPartII R14.4, prove nonabelian Ihara surjectivity, triple surjectivity on the unsigned domain with its corrected reduction kernel, and the generation identity used by leveraging. |
| W5 — Leveraging and degree doubling | 5 | 2 | Establish the field intersection and degree-preserving base change, p-scaling separation, degree doubling, the congruence degree formula and the Chebyshev contradiction. |
| W6 — The unbounded denominators theorem | 8 | 4 | Assemble R₂N=M₂N from the rank bound, the ConformalMappingPartII radius and mean-growth estimates and leveraging; reduce arbitrary integral weight to weight zero; deduce congruence from one integral Fourier expansion, its rational bounded-denominator form, and its algebraic-integer form with number-field descent. Verify the j cube root, h roots, and Fermat tests. |
| W7 — Differential equations and vector-valued forms | 14 | 5 | Apply the corrected holonomic rank theorem to integral three-point ODE solutions with finite monodromy at zero. Define vector-valued forms and continuation spaces of individual components, build the minimal operator of a component by Wronskians, descend it to ℚ(x), and apply the G-function inputs to componentwise congruence and the corrected effective-span Mason corollary. |
| W8 — Quasimodular and arithmetic growth applications | 7 | 5 | Define weakly holomorphic quasimodular forms using E₂ and Δ localization and prove derivative minimality with the q normalization fixed. Verify the elliptic-integral and Catalan identities. Define deficient places and state their congruence and effective arithmetic-component consequences with the necessary detection hypotheses. |
| W9 — The arithmetic fundamental-group application | 3 | 2 | On the connected cusp component of the smooth locus of a regular X(N) model, derive the split étale fundamental-group isomorphism from the arithmetic finite-cover criterion and algebraic-integer unbounded denominators; specify model and cover-descent inputs explicitly. |

The packet contains 63 targets (2 constructions, 9 definitions, 52 theorems), with 47 API items and 45 discriminating unit tests. All nine layers are planned at target level. The 5 exact input gaps and 14 request entries are part of the specification; none of the targets is claimed implemented. Each target below gives its hypotheses in the statement, its direct dependencies, source match, proof or construction, and acceptance checks. API and test names are proposed declaration names; the target id is the stable cross-reference for a theorem without a separate Lean spelling. Proposed modules are `TauCeti/NumberTheory/ModularForms/Noncongruence/W1.lean` through `W9.lean`, under namespace `TauCeti.ModularForms.Noncongruence`.

## Library baseline and imported contracts

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following existing declarations supply the stated functionality. They are citations, not targets of this continuation.

| Existing declaration | Module | Functionality used |
| --- | --- | --- |
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
| `mathlib:jacobiTheta` | `Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable` | θ₃(τ)=Σ\_{n∈ℤ} exp(πin²τ). |
| `mathlib:jacobiTheta_S_smul` | `Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable` | The principal square-root S transformation of θ₃; branch is retained. |
| `mathlib:jacobiTheta_T_sq_smul` | `Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable` | θ₃ is invariant under τ↦τ+2. |
| `mathlib:Subgroup.normalCore` | `Mathlib.Algebra.Group.Subgroup.Basic` | Largest subgroup of H normal in the ambient group, with conjugate-membership definition. |
| `mathlib:Subgroup.goursat_surjective` | `Mathlib.GroupTheory.Goursat` | A subdirect product determines isomorphic quotient groups; arithmetic obstruction remains to prove here. |
| `mathlib:Chebyshev.theta_ge` | `Mathlib.NumberTheory.Chebyshev` | θ(n)≥n log2−log(n+1)−2√n log n, enough for a positive linear lower bound eventually. |
| `mathlib:Chebyshev.theta_le_log4_mul_x` | `Mathlib.NumberTheory.Chebyshev` | θ(x)≤(log4)x for x≥0; bounds log of primorials without PNT. |
| `tauceti:TauCeti.Subgroup.integerCuspWidth` | `TauCeti.NumberTheory.ModularForms.Cusps.Basic` | Smallest positive strict integral translation period for finite relative index; geometric signed width is distinguished here. |
| `tauceti:TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` | `TauCeti.NumberTheory.ModularForms.Parity` | Nonzero character space requires χ(−1)=(−1)^k. |
| `mathlib:MeromorphicAt` | `Mathlib.Analysis.Meromorphic.Basic` | Finite-order pole condition on a punctured neighbourhood; actual value at the pole is irrelevant. |
| `mathlib:CongruenceSubgroup.Gamma0` | `Mathlib.NumberTheory.ModularForms.CongruenceSubgroups` | Integral matrices whose lower-left entry vanishes modulo N. |
| `mathlib:CongruenceSubgroup.Gamma1` | `Mathlib.NumberTheory.ModularForms.CongruenceSubgroups` | Integral matrices with bottom row (0,1) modulo N, equivalently diagonal entries 1 and lower-left 0. |
| `mathlib:EisensteinSeries.E2` | `Mathlib.NumberTheory.ModularForms.EisensteinSeries.E2.Defs` | The existing normalized weight-two Eisenstein function, used in the quasimodular polynomial ring. |
| `mathlib:Derivative.serreDerivativeMF` | `Mathlib.NumberTheory.ModularForms.Derivative` | Serre derivative sends ModularForm Γ k to weight k+2 when Γ≤SL₂(ℤ), for every integer k. |
| `mathlib:Derivative.normalizedDerivOfComplex_E₂` | `Mathlib.NumberTheory.ModularForms.RamanujanFormula` | D E₂=(E₂²−E₄)/12 for D=(1/(2πi))d/dτ; supplies derivative closure after adjoining E₂. |

Stage-level citations of other roadmaps carry the following request entries. R11–R13 ask for Part IIs of roadmaps that are already Tau Ceti pull requests or merged; the others cite Tau Ceti stages as they stand and add nothing to them.

**R1: `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.** Cited as it stands: the character eigenspaces, the parity convention χ(−I)=(−1)^k and the integral-weight graded ring of modular forms of the parent. Nothing is added to the parent.

Consumers: `ModularFormsPartII:W7/vector-valued-form`, `ModularFormsPartII:W7/induced-scalar`, `ModularFormsPartII:W8/weak-quasimodular`, `ModularFormsPartII:W8/congruence-no-deficiency`.

**R2: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`.** Cited as it stands: the level-one quotient X(1) with the normalized j-function and its q-expansion consumed from ModularForms, used with j=E₄³/Δ in the cube-root example.

Consumers: `ModularFormsPartII:W6/j-cube-root`.

**R3: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.** Cited as it stands: the presentation of PSL₂(ℤ) as the (2,3,∞) triangle group ⟨S,R | S²=R³=1⟩ (Layer 2, item 6), used to define the representation σ of the invisible-summand test.

Consumers: `ModularFormsPartII:W7/invisible-summand-test`.

**R4: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.** Cited as it stands: cusp orbits, normalized cusp data with primitive width, q-coordinates and the Laurent/q-expansion criterion (Layer 3, items 1–5). These are projective; the signed-width bookkeeping is done in W1.

Consumers: `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W1/wohlfahrt-level`, `ModularFormsPartII:W1/clear-cusp-poles`.

**R5: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.** Cited as it stands: the compactified quotient X(Γ), its cusp charts, and the extension of finite-index quotient maps over the cusps with ramification w\_{Γ′}/w\_Γ.

Consumers: `ModularFormsPartII:W2/lambda-covering`.

**R6: `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.** Cited as it stands: degree of finite holomorphic maps, the degree-one biholomorphism theorem and descent of invariant meromorphic functions to the compactification. The identification X(2)≅ℙ¹ by λ is W2's own target.

Consumers: `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W2/small-uniformizations`, `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`.

**R7: `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`.** Cited as it stands: Schwarz reflection and the monodromy theorem, which the parent's L4 description names as the input of the modular λ-covering; W2 builds the covering.

Consumers: `ModularFormsPartII:W2/lambda-covering`.

**R8: `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.** Cited as it stands: the lifting criterion and the Galois correspondence between covers and subgroups with the deck group, used for the λ covering and for the local system of ρ.

Consumers: `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W7/complex-local-system`.

**R9: `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`.** Cited as it stands: algebraization of finite analytic three-point covers with their meromorphic function fields. The descent of a distinguished Fourier germ is the separate gap NF.

Consumers: `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W6/number-field-variant`.

**R10: `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.** Cited as it stands: the classification of finite covers of the thrice-punctured sphere by permutation triples, with deck transformations and regular covers.

Consumers: `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

**R11: `ModularCurvesPartII:R12.6`.** Part II (ModularCurvesPartII, Part II: rational cusps of twisted models and all-prime cuspal models; not yet designed). ModularCurvesPartII is TauCetiRoadmap pull request #913 (README at head 2f3a763). R13.4a/twisted-coarse-curve, R12.4/twisted-analytic-comparison, R12.4/twisted-geometric-irreducibility, R12.3/cusp-fields-and-component-labels and R12.6/canonical-generic-fibre-descent are cited as they stand. Needed beyond them: for V=ℤ/m⊕μ\_m with its standard pairing and m≥3, the cusp ∞ of X(V) is ℚ-rational and split with Tate parameter q^{1/m}, compatibly with the analytic comparison, so that the rational functions on X(V) are exactly the meromorphic functions on X(m) with rational q^{1/m}-expansion at ∞. See gap MODEL.

Consumers: `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`.

**R12: `ModularCurvesPartII:R13.5`.** Part II (the same ModularCurvesPartII Part II; not yet designed). Pull request #913 §11 constructs regular resolutions and semistable models for Γ₀ levels at primes p>3 and for the listed mixed and Cartan levels; these are cited as they stand. Needed beyond them: for N≥1 and K/ℚ(μ\_N) finite, the minimal regular model of X(N) over O\_K at every prime including p∣N, the extension of the ∞ cusp to a section through the smooth locus, the fibrewise component through it, and compatibility with finite base change. See gap NERON.

Consumers: `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

**R13: `DiophantineApproximationAndTranscendence:DT.5`.** Part II (DiophantineApproximationAndTranscendence, Part II: G-operators and global nilpotence; not yet designed, and distinct from the designed DiophantineApproximationAndTranscendencePartII on arithmetic algebraization). DiophantineApproximationAndTranscendence is merged into TauCetiRoadmap main (#855, head 0d1c47b); DT.5/g-function and DT.5/chudnovsky-galochkin-condition are cited as they stand. Needed beyond them: the Bombieri–André theorem that Galochkin's condition implies global nilpotence, and Katz's theorem that a globally nilpotent operator over ℚ̄(x) is regular singular with quasi-unipotent local monodromy at every point of ℙ¹. See gap GLOCAL.

Consumers: `ModularFormsPartII:W7/arithmetic-component`.

**R14: `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.** Cited as it stands: character decomposition, the eigenform and newform bases and oldform reindexing, which with Deligne's bound extend the prime-coefficient bound to all coefficients of a cusp form.

Consumers: `ModularFormsPartII:W8/congruence-no-deficiency`.

Node-level imports from other atlas roadmaps are exact supplier nodes; they need no request.

| Imported node | Consumers |
| --- | --- |
| `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison` | `W6/number-field-variant` |
| `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application` | `W3/congruence-inclusion`, `W6/h-root-test`, `W6/fermat-test`, `W8/congruence-no-deficiency` |
| `AutomorphicGaloisRepresentations:R19.3/hilbert-ramanujan-conjecture` | `W8/congruence-no-deficiency` |
| `ConformalMappingPartII:M0/uniform-mean-growth` | `W6/field-equality` |
| `ConformalMappingPartII:O0/meromorphic-basis-monodromy` | `W3/holonomy-embedding`, `W7/ode-algebraicity` |
| `ConformalMappingPartII:O0/path-continuation` | `W7/regular-singular-component` |
| `ConformalMappingPartII:R0/conformal-radius-formula` | `W2/small-uniformizations` |
| `ConformalMappingPartII:R0/positive-radius-expansion` | `W3/finite-rank`, `W6/field-equality`, `W7/ode-algebraicity` |
| `ConformalMappingPartII:U0/roots-cover` | `W2/small-uniformizations`, `W3/finite-rank`, `W3/quantitative-rank`, `W7/ode-algebraicity` |
| `DiophantineApproximationAndTranscendence:DT.5/chudnovsky-galochkin-condition` | `W7/arithmetic-component` |
| `DiophantineApproximationAndTranscendence:DT.5/g-function` | `W7/arithmetic-component` |
| `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-closure` | `W7/ode-algebraicity` |
| `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring` | `W3/holonomy-embedding`, `W7/ode-algebraicity` |
| `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-spans` | `W3/holonomy-embedding` |
| `DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound` | `W3/finite-rank`, `W3/quantitative-rank`, `W7/ode-algebraicity` |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group` | `W9/cuspal-model`, `W9/arithmetic-cover-criterion`, `W9/arithmetic-pi1` |
| `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels` | `W9/cuspal-model`, `W9/arithmetic-cover-criterion` |
| `ModularCurvesPartII:R12.4/twisted-analytic-comparison` | `W5/field-base-change` |
| `ModularCurvesPartII:R12.4/twisted-geometric-irreducibility` | `W5/field-base-change` |
| `ModularCurvesPartII:R13.4a/twisted-coarse-curve` | `W5/field-base-change`, `W5/congruence-degree` |
| `ModularCurvesPartII:R14.4/congruence-classes` | `W4/triple-surjectivity` |
| `ModularCurvesPartII:R14.4/congruence-subgroup-property` | `W4/nonabelian-ihara` |
| `ModularCurvesPartII:R14.4/enhanced-ihara` | `W4/triple-surjectivity` |
| `ModularCurvesPartII:R14.4/modular-amalgam` | `W4/nonabelian-ihara` |
| `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity` | `W2/lambda`, `W6/h-root-test`, `W6/fermat-test`, `W8/elliptic-integral-test`, `W8/catalan-tests` |
| `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity` | `W2/lambda`, `W6/h-root-test`, `W6/fermat-test`, `W8/elliptic-integral-test`, `W8/catalan-tests` |
| `QSeriesPartitionsAndMockModularForms:QM.0/theta-two-product-identity` | `W2/lambda`, `W6/fermat-test`, `W8/elliptic-integral-test`, `W8/catalan-tests` |
| `QSeriesPartitionsAndMockModularForms:QM.1/dedekind-eta-multiplier` | `W6/weight-reduction`, `W6/j-cube-root`, `W7/vv-weight-normalization` |
| `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation` | `W2/lambda`, `W6/weight-reduction`, `W6/j-cube-root`, `W6/fermat-test`, `W7/vv-weight-normalization`, `W8/elliptic-integral-test`, `W8/catalan-tests` |
| `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-triple-product-analytic` | `W2/lambda`, `W6/fermat-test`, `W8/elliptic-integral-test`, `W8/catalan-tests` |
| `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation` | `W2/lambda`, `W2/jacobi-hypergeometric`, `W6/weight-reduction`, `W7/vv-weight-normalization`, `W8/elliptic-integral-test`, `W8/catalan-tests` |
| `QSeriesPartitionsAndMockModularForms:QM.3/weakly-holomorphic-laurent-expansion` | `W1/weak-form` |
| `QSeriesPartitionsAndMockModularForms:QM.3/weakly-holomorphic-modular-form` | `W1/weak-form` |

## W1. Weak forms and geometric levels

Characterize weak forms on finite-index subgroups of SL₂(ℤ) by meromorphic cusp germs, importing the weakly holomorphic carrier of QSeriesPartitionsAndMockModularForms QM.3. Pin strict and signed widths, bounded denominators and geometric Wohlfahrt level. Prove intersection, normal-core and p-scaling laws and the signed Wohlfahrt theorem; clear cusp poles by Δ.

**Layer dependencies:** `QSeriesPartitionsAndMockModularForms:QM.3`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Planets:** Bounded denominators; Wohlfahrt level; Normal core and level; Level under scaling; Wohlfahrt’s theorem.

### W1.1. Weak forms on finite-index subgroups: the cusp-germ characterization

**Target:** `ModularFormsPartII:W1/weak-form` (theorem).

Let Γ≤SL₂(ℤ) have finite index, regarded in GL₂(ℝ) through the existing coercion, and let k∈ℤ. The space M^!\_k(Γ) of weakly holomorphic modular forms is imported from QSeriesPartitionsAndMockModularForms:QM.3/weakly-holomorphic-modular-form: functions holomorphic on ℍ, invariant under the weight-k slash action of Γ, with exponential growth at every cusp. A function f:ℍ→ℂ lies in M^!\_k(Γ) if and only if it is holomorphic on ℍ, Γ-invariant, and for every g∈SL₂(ℤ) the slash f|ₖg is periodic with some positive strict period h and its cusp function in q\_h is meromorphic at q\_h=0, so that its Laurent series has finite principal part. The elements with no negative Laurent term at any cusp are exactly the existing ModularForm Γ k. M^!\_k(Γ) is preserved by restriction to a finite-index subgroup, and products add weights. In this roadmap a weak form is an element of M^!\_k(Γ) for a finite-index Γ≤SL₂(ℤ), and a weak modular function is the case k=0. Character-valued forms keep the parent character carrier and are not folded into this trivial-character space.

**Direct dependencies:** `QSeriesPartitionsAndMockModularForms:QM.3/weakly-holomorphic-modular-form`, `QSeriesPartitionsAndMockModularForms:QM.3/weakly-holomorphic-laurent-expansion`, `mathlib:ModularForm`, `mathlib:UpperHalfPlane.cuspFunction`, `mathlib:MeromorphicAt`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 1.0.1, p.627; Definition 4.2.1, p.655; Definition 7.4.3, p.692. The main theorem and the later definitions work with functions holomorphic on the upper half-plane and meromorphic at every cusp. The target identifies that convention with the exponential-growth carrier owned by QSeriesPartitionsAndMockModularForms QM.3.

**Construction and proof.**

1. For g∈SL₂(ℤ), f|ₖg is weakly holomorphic for the finite-index conjugate g⁻¹Γg, which is arithmetic with determinant one. Apply the imported Laurent-expansion theorem QM.3/weakly-holomorphic-laurent-expansion at its cusp ∞: exponential growth there is equivalent to a Laurent series with finite principal part, that is, to meromorphy of the cusp function at q\_h=0.
2. Every rational cusp is g∞ for some g∈SL₂(ℤ), so the condition for all g is exponential growth at every cusp. Changing g inside its coset of the cusp stabilizer, or replacing h by a positive multiple, changes the Laurent variable by a root of unity or a power and preserves the condition. Nonnegative Laurent support at every cusp is boundedness at every cusp (FuchsianOrbifolds Layer 3, item 5), the existing ModularForm condition.
3. A cusp of a finite-index subgroup is a cusp of Γ, and growth at a cusp does not depend on the group, which gives restriction. For determinant-one matrices the slash of a product is the product of the slashes, and principal parts multiply.

**Acceptance checks.**

- The constant 1 lies in M^!\_0(SL₂(ℤ)); Δ⁻¹ lies in M^!\_{−12}(SL₂(ℤ)), its expansion begins with Q⁻¹, and it is not an existing ModularForm.
- For a∈ℂ, (j−a)⁻¹ is rejected because j−a has a zero on ℍ: weak forms have no interior poles; a pole at a rational cusp is allowed.
- Changing the scaling matrix or replacing a strict period by a positive multiple preserves the cusp-germ condition.

### W1.2. Bounded denominators of a Fourier germ

**Target:** `ModularFormsPartII:W1/bounded-denominators` (definition).

For an embedded number field K⊆ℂ and a Laurent series a(t)∈K((t)), bounded denominators means there is one nonzero d∈O\_K with d a\_n∈O\_K for every coefficient, including the finite principal part. Over ℚ use one integer D≥1. This is scalar denominator clearing, not substitution t↦t/M. For a holomorphic germ f with positive strict period 2N, its Taylor series is UpperHalfPlane.qExpansion (2N) f in t=e^{πiτ/N}. Integral coefficients mean every coefficient lies in the embedded ℤ, or O\_K, as appropriate.

**Direct dependencies:** `mathlib:UpperHalfPlane.qExpansion`, `ModularFormsPartII:W1/weak-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 1.0.1, p.627; Definition 4.2.1(2), p.655; Remarks 6.3.1–6.3.2, pp.685–686. The arithmetic condition is one scalar clearing all Fourier coefficients. The number-field remarks use algebraic integers; this does not follow just from allowing a finite set of denominator primes.

**Construction and proof.**

1. Use coefficientwise membership in the image of O\_K and quantify a single clearing scalar.
2. Addition and convolution preserve a common clearing scalar after multiplying denominators; finite Laurent support below zero permits the same argument.

**Uses that determine the API.**

- W3 R₂N: Defines the arithmetic restriction on generators.
- W6 rational and number-field variants: Converts bounded denominators to integral coefficients by a single scalar.
- W6 h-root and Fermat tests: A bounded-denominator root of an integral unit series is integral, which decides the exponents.

**API.**

- `HasBoundedDenominators.iff_exists_scalar` (characterisation): Membership is equivalent to one scalar clearing every coefficient.
- `HasBoundedDenominators.add_mul` (structure): Sums and products preserve the predicate with the product of the clearing scalars.
- `HasBoundedDenominators.reindex` (functoriality): Substitution t↦t^m for m>0 preserves and reflects the predicate.
- `HasBoundedDenominators.qExpansion_compat` (compatibility): For an analytic 2N-periodic cusp germ, coefficients are precisely those of the existing qExpansion (2N).
- `HasBoundedDenominators.integral_of_pow` (relation): If a∈1+tℚ[[t]] has bounded denominators and a^n is integral for some n≥1, then a is integral: reduce ℓ^c·a modulo ℓ in the domain 𝔽\_ℓ[[t]].

**Unit tests.**

- `bd_rational_constant` (computation): The constant 1/2 is bounded, with D=2, and is not integral.
- `bd_unbounded_prime` (non-example): Σ\_{n≥0}t^n/2^n has unbounded denominators although every coefficient lies in ℤ[1/2].
- `bd_integral_unit_inverse` (compatibility): An integral power series with constant term ±1 has integral inverse, hence bounded denominators.
- `bd_exp` (non-example): Σ t^n/n! fails every common denominator.
- `bd_root_integral` (characterisation): If a∈1+tℚ[[t]] has bounded denominators and a^n∈ℤ[[t]] for some n≥1, then a∈ℤ[[t]]; hence (1−16t)^{1/16}, whose t²-coefficient is −15/2, has unbounded denominators.

**Acceptance checks.**

- Never infer bounded denominators from membership in O\_K[1/S][[t]].
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

**Layer completion checks.** Every target above must be proved with the stated imported contracts. This layer has no open input gap.

## W2. The modular λ coordinate

Construct λ by the existing η function, identify X(2) with ℙ¹ and λ as its three-punctured covering coordinate, prove integral inverse reparametrization and Kummer normalization, and the hypergeometric–theta identity with its character. Connect the N=2 and N=3 punctured-plane acceptance examples.

**Layer dependencies:** `QSeriesPartitionsAndMockModularForms:QM.1`, `ModularFormsPartII:W1`, `QSeriesPartitionsAndMockModularForms:QM.0`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`, `ConformalMappingPartII:U0`, `ConformalMappingPartII:R0`.

**Planets:** Modular λ function; Modular λ covering; Integral λ reparametrization; Jacobi’s hypergeometric identity; Modular uniformization examples.

### W2.1. The modular λ function

**Target:** `ModularFormsPartII:W2/lambda` (definition).

Using the pinned η on ℂ, set x(τ)=(η(τ/2)η(2τ)²/η(τ)³)^8 and λ(τ)=16x(τ). On ℍ the denominator is nonzero. Pin q=e^{πiτ}: x=q∏\_{n≥1}((1+q^{2n})/(1+q^{2n−1}))^8. The associated formal series is the integral q-adic product; agreement with the analytic product is a theorem, not a choice of a formal expansion. Its λ-normalization sends the three Γ(2)-cusps ∞,0,1 to 0,1,∞.

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

For N≥1 and t=q^{1/N}, there is a unique x\_N(t)∈t+t²ℚ[[t]] with x\_N(t)^N=x(t^N). It belongs to t+t²ℤ[1/N][[t]], and x\_N^N is integral. Branches are fixed by x\_N/t→1. No claim is made that x\_N itself is integral for arbitrary N. Pulling back x=λ/16 by u↦u^N leaves possible singularities at 16^{−1/N}μ\_N and ∞; width dividing 2N removes monodromy at u=0.

**Direct dependencies:** `ModularFormsPartII:W2/inverse-integrality`, `ModularFormsPartII:W1/wohlfahrt-level`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (3.0.2) and proof of Proposition 3.0.1, p.650. The holonomy embedding takes a normalized N-th root of lambda/16. The proof needs its N-th power integral, and does not require the root itself to have integral coefficients.

**Construction and proof.**

1. Write x(t^N)=t^N times an integral unit with constant term 1 and solve for its normalized N-th root over ℤ[1/N].
2. Use the cusp local monodromy order bound to remove the apparent singularity at zero after this pullback.

**Acceptance checks.**

- N=1 recovers x.
- For N=3, x\_N=t−(8/3)t⁴+⋯, so general integral-root claims fail.

### W2.6. Jacobi’s hypergeometric identity with character

**Target:** `ModularFormsPartII:W2/jacobi-hypergeometric` (theorem).

Let K₀(x)=Σ\_{n≥0}binom(2n,n)²x^n = ₂F₁(1/2,1/2;1;16x). Then K₀(x(τ))=θ₃(τ)². This is weight 1 on Γ(2) with χ(γ)=χ\_{−4}(dγ), and is a trivial-character form on H′={γ∈Γ(2):dγ≡1 mod4}. The series is integral and transcendental over ℚ(x); its equation x(1−16x)y″+(1−32x)y′−4y=0 has nontrivial unipotent local monodromy at 0, despite this particular holomorphic branch.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `mathlib:jacobiTheta`, `mathlib:jacobiTheta_S_smul`, `mathlib:jacobiTheta_T_sq_smul`, `tauceti:TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`, `ModularFormsPartII:W2/lambda-covering`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equations (1.1.4)–(1.1.5), p.631; Remark 7.2.3 and (7.2.4), p.688; corrected character in extraction E12. The Jacobi identity identifies the integral hypergeometric series with theta-three squared. The target restores its weight-one character and keeps the infinite unipotent monodromy that prevents the algebraicity theorem from applying.

**Construction and proof.**

1. Compare the normalized analytic solution of the hypergeometric equation with the theta product.
2. Square the imported theta transformation, retaining χ\_{−4}(d). Obtain logarithmic continuation at 0 from the second independent solution to prove infinite monodromy.

**Acceptance checks.**

- Constant coefficient 1 excludes the zero solution.
- −I acts by −1 in weight 1; a trivial Γ(2) character would contradict parity.

### W2.7. Two modular uniformization checks

**Target:** `ModularFormsPartII:W2/small-uniformizations` (theorem).

With C(z)=i(1−z)/(1+z), F₂(z)=2λ(C(z))−1 universally covers ℂ∖{±1}, sends 0 to 0, and |F₂′(0)|=Γ(1/4)^4/(4π²)>4. The supplier’s N=3 normalized covering has |F₃′(0)|=Γ(1/6)^3/(12π^{3/2})>16^{1/3}; its η-quotient in Example 5.1.22 agrees with that covering after the chosen rotation. Among N≥2, ℂ∖μ\_N is isomorphic to Y(N) only for N=2,3.

**Direct dependencies:** `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W2/lambda`, `ConformalMappingPartII:U0/roots-cover`, `ConformalMappingPartII:R0/conformal-radius-formula`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Example 5.1.22, p.673; Theorem 5.1.4, pp.667–668. The example evaluates the N=2 and N=3 covering radii using gamma values and eta quotients. These are acceptance cases for the imported punctured-plane theorem, not a new general uniformization theory.

**Construction and proof.**

1. Compose the λ covering with the Cayley transform and the affine map u↦2u−1; F₂ is a pointed universal covering of ℂ∖{±1}.
2. Specialize ConformalMappingPartII:R0/conformal-radius-formula at N=2 and N=3; for N=2 the pointed cover is unique up to rotation (ConformalMappingPartII:U0/roots-cover), so |F₂′(0)| is the stated Gamma value. Match the η-quotient of CDT Example 5.1.22 at N=3 with the normalized cover by its value and derivative at 0.
3. For the last assertion compare punctures and genus: ℂ∖μ\_N is the sphere minus N+1 points, Y(2) and Y(3) are spheres minus 3 and 4 points with the matching cross-ratio, Y(4) and Y(5) have 6 and 12 cusps, and Y(N) has positive genus for N≥6.

**Acceptance checks.**

- F₂(0)=0 and its target omits exactly ±1.
- The N=2 derivative is about 4.37687923 and the N=3 derivative about 2.5810565.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. This layer has no open input gap.

## W3. Bounded-denominator fields and holonomy rank

Define the ℚ(λ)-spans M₂N and R₂N in rational Laurent series, prove inclusion, multiplication and field structure, construct the normal stabilizer with exact level, place R₂N in the ℚ(λ)-span W of integral holonomic germs for the λ-root coordinate, and derive finiteness and the quantitative rank bound from the corrected holonomic rank theorem of DiophantineApproximationAndTranscendencePartII and the uniformization of ℂ∖μ\_N of ConformalMappingPartII.

**Layer dependencies:** `ModularFormsPartII:W1`, `ModularFormsPartII:W2`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`, `DiophantineApproximationAndTranscendencePartII:AA.4`, `ConformalMappingPartII:O0`, `ConformalMappingPartII:U0`, `ConformalMappingPartII:R0`.

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
- `M2N_map_dvd` (functoriality): If N∣M then t\_N↦t\_M^(M/N) embeds M₂N into M₂M.
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

For N≥1 let U\_N=ℂ∖16^{−1/N}μ\_N, t=q^{1/N}, let χ=x\_N(t) be the normalized Kummer coordinate of W2/kummer-coordinate and p(u)=u^N, so that p(χ(t))=x(t^N)=λ/16 is integral and ℚ(p)=ℚ(λ). Read through the formal inverse of χ, every element of R₂N lies in the ℚ(p)-span W(U\_N,χ,p) of the integral holonomic ring H(U\_N,χ,ℤ) of DiophantineApproximationAndTranscendencePartII:AA.4. Each generator enters H after multiplication by a nonzero integer clearing its denominators and by a power of p clearing its pole at ∞; general elements are ℚ(λ)-combinations of these. The containment is in W and not only in the larger ℚ(u)-span V, because χ is not integral for N≥2.

**Direct dependencies:** `ModularFormsPartII:W3/bounded-field`, `ModularFormsPartII:W2/kummer-coordinate`, `ModularFormsPartII:W2/lambda-covering`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-spans`, `ConformalMappingPartII:O0/meromorphic-basis-monodromy`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Proposition 3.0.1, pp.650–651; Definition 2.0.4, pp.635–636. The proof places a basis of R₂N in the arithmetic holonomic ring for the λ-root coordinate and then bounds the larger span V. The target records the containment in the ℚ(λ)-span W, to which the corrected rank theorem applies; see E24.

**Construction and proof.**

1. A generator f of R₂N is invariant under a finite-index H containing E with cusp widths dividing 2N, so it is a rational function on the algebraic curve Y(H), finite étale over Y(2) (W2/lambda-covering, BelyiMaps Layer 9). Its continuations along paths in ℂ∖{0,1} are the finitely many conjugate functions on Y(H), so its minimal operator over ℚ̄(λ) has a full meromorphic local basis, in the sense of ConformalMappingPartII:O0/meromorphic-basis-monodromy, at every point of ℂ∖{0,1}.
2. Pull back along u↦16u^N. Because every cusp width of H divides 2N, a local coordinate at each cusp above λ=0 is a positive power of u, so the pulled-back operator also has a full meromorphic local basis at u=0. Its remaining finite singularities lie in 16^{−1/N}μ\_N, outside U\_N.
3. Multiply f by an integer clearing its common denominator and by a power of p clearing its pole at ∞. The product has χ-pullback in ℤ[[t]], so it lies in H(U\_N,χ,ℤ). The multipliers lie in ℚ(p)^×, so the ℚ(λ)-span R₂N lies in W(U\_N,χ,p).

**Acceptance checks.**

- Do not infer trivial monodromy of an entire operator from one single-valued solution.
- p(χ(t))=x(t^N) is integral; χ itself need not be (for N=3, χ=t−(8/3)t⁴+⋯).
- The containment is stated for W. The printed bound for V over ℚ(p) fails for nonintegral χ (DiophantineApproximationAndTranscendencePartII/E1), so the rank argument runs on W.

### W3.5. Finiteness of the bounded-denominator field

**Target:** `ModularFormsPartII:W3/finite-rank` (theorem).

For each N≥1, R₂N is finite-dimensional over ℚ(λ). For N≥2 this follows from a holomorphic map φ, defined near the closed unit disc with image in U\_N, φ(0)=0 and |φ′(0)|>1. Since R₂⊆R₄ under t↦t², the case N=1 follows from N=2; U₁=ℂ∖{1/16} is not hyperbolic and is not treated by a universal covering.

**Direct dependencies:** `ModularFormsPartII:W3/holonomy-embedding`, `ConformalMappingPartII:U0/roots-cover`, `ConformalMappingPartII:R0/positive-radius-expansion`, `DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.2, p.655; §1.1.6, p.632. The field lemma uses a uniformization radius greater than one to obtain finite rank from the arithmetic holonomy bound. The target orders this before any finite-basis construction and treats the smallest level separately.

**Construction and proof.**

1. Fix N≥2 and the normalized covering F\_N of ℂ∖μ\_N (ConformalMappingPartII:U0/roots-cover). By ConformalMappingPartII:R0/positive-radius-expansion |F\_N′(0)|=γ\_N>16^{1/N}. Choose r<1 with rγ\_N16^{−1/N}>1 and set φ(z)=16^{−1/N}F\_N(rz).
2. Apply DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound with p(u)=u^N and χ=x\_N: W(U\_N,χ,p) is finite-dimensional over ℚ(p)=ℚ(λ), and it contains R₂N by W3/holonomy-embedding.
3. For N=1 use R₂⊆R₄. The λ-root disc map u=x\_N(t) has derivative one at 0 and is not a covering, so the Schwarz equality case (ConformalMappingPartII:U0/radius-schwarz) also gives the strict inequality without the explicit radius.

**Acceptance checks.**

- Finiteness is proved before selecting a finite basis of R₂N.
- The strict inequality |F\_N′(0)|>16^{1/N} is needed; a disc map with derivative exactly one does not suffice.

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

Let F\_N:𝔻→ℂ∖μ\_N be the normalized coverings of ConformalMappingPartII:U0/roots-cover. Suppose that for all sufficiently large N, |F\_N′(0)|≥16^{1/N}(1+A/N³) for some A>0, and that for each fixed B>0 their circle means at r=1−B/N³ satisfy ∫log⁺|F\_N(re^{iθ})|dθ/(2π)≤C\_B(log N)/N. Then [R₂N:ℚ(λ)]≤C N³ log(2N) for all N≥1, after enlarging C for finitely many small levels.

**Direct dependencies:** `ModularFormsPartII:W3/holonomy-embedding`, `ModularFormsPartII:W3/finite-rank`, `ModularFormsPartII:W2/kummer-coordinate`, `ConformalMappingPartII:U0/roots-cover`, `DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proposition 3.0.1, pp.649–651; Corollary 2.0.5, p.636; §6.3, p.685. The proposition combines a covering derivative gain of order N to the minus third power with a logarithmic boundary mean estimate. The target isolates those two inputs and obtains the uniform cubic-logarithmic field bound.

**Construction and proof.**

1. Set φ(z)=16^{−1/N}F\_N(rz) with r=1−A/(2N³). For N large, log|φ′(0)|≥log(1+A/N³)+log r≥cN⁻³ with c=A/3.
2. Use p(u)=u^N, so p∘χ=x(t^N) is integral. DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound bounds dim\_{ℚ(p)}W(U\_N,χ,p) by e·∫log⁺|p∘φ|/log|φ′(0)|. Since log⁺|F^N/16|≤N log⁺|F|, the hypothesis with B=A/2 makes the numerator O(log N), so the bound is O(N³log N); R₂N⊆W by W3/holonomy-embedding.
3. Absorb all small N into C using W3/finite-rank; log(2N) avoids the zero bound that log N would give at N=1.

**Acceptance checks.**

- All constants in the final bound are independent of N.
- The mean estimate, not a supremum estimate exponential in N, is essential.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. This layer has no open input gap.

## W4. The nonabelian Ihara lemma and the generation identity

From the principal-level amalgam, the congruence subgroup property of SL₂(ℤ[1/p]) and the enhanced Ihara lemma of ModularCurvesPartII R14.4, prove nonabelian Ihara surjectivity, triple surjectivity on the unsigned domain with its corrected reduction kernel, and the generation identity used by leveraging.

**Layer dependencies:** `ModularFormsPartII:W1`, `ModularCurvesPartII:R14.4`.

**Planets:** Nonabelian Ihara lemma; Triple Ihara surjectivity.

### W4.1. Nonabelian Ihara surjectivity

**Target:** `ModularFormsPartII:W4/nonabelian-ihara` (theorem).

Let N≥3, let E≤G≤⟨E,Γ(N)⟩ with G normal of finite index in SL₂(ℤ) and L(G)=N, and let p∤N be prime. Put S=⟨E,Γ(N)⟩/G, A=diag(p,1), D±=⟨E,Γ(N)⟩∩Γ₀(p) and D=Γ(N)∩Γ₀(p). The map D±→S×S, g↦(gG,AgA⁻¹G), is surjective, and so is its restriction to D. For g∈D± the conjugate AgA⁻¹ lies in ⟨E,Γ(N)⟩ and has upper-right entry divisible by p; conjugation by A does not preserve Γ₀(p).

**Direct dependencies:** `ModularFormsPartII:W1/wohlfahrt`, `ModularFormsPartII:W1/wohlfahrt-level`, `ModularCurvesPartII:R14.4/modular-amalgam`, `ModularCurvesPartII:R14.4/congruence-subgroup-property`, `mathlib:Subgroup.goursat_surjective`, `mathlib:CongruenceSubgroup.Gamma0`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.4.1, pp.658–659. The nonabelian lemma uses Goursat, an arithmetic amalgam and the congruence subgroup property of SL₂(ℤ[1/p]) to rule out a common quotient. The target works on the unsigned domain, where the amalgam of ModularCurvesPartII applies, and corrects the codomain of conjugation by diag(p,1) (E17).

**Construction and proof.**

1. Since E≤G, S≅Γ(N)/(G∩Γ(N)), so it suffices to treat the unsigned domain D=Γ(N)∩A⁻¹Γ(N)A. If the image were proper, Goursat (mathlib:Subgroup.goursat\_surjective) would give a nontrivial common quotient Δ of S and maps g₁:Γ(N)→Δ, g₂:A⁻¹Γ(N)A→Δ agreeing on D.
2. By ModularCurvesPartII:R14.4/modular-amalgam (N≥3, p∤N), Γ\_N(ℤ[1/p]) is the amalgam of Γ(N) and A⁻¹Γ(N)A over D, so g₁ and g₂ extend to one homomorphism Γ\_N(ℤ[1/p])→Δ. By ModularCurvesPartII:R14.4/congruence-subgroup-property its kernel contains the principal congruence kernel of some level m prime to p, so K=ker(Γ(N)→Δ) is a congruence subgroup containing G∩Γ(N).
3. ⟨E,K⟩ is congruence and contains E and G, so its signed level divides L(G)=N. W1/wohlfahrt gives Γ(N)≤⟨E,K⟩; since −I∉Γ(N) for N≥3, Γ(N)≤K, so Δ is trivial, a contradiction.

**Acceptance checks.**

- If S is trivial, the result is the unique map onto the one-point product.
- For N≤2 the cited amalgam is not asserted; the leveraging argument uses only levels 2N≥4.

### W4.2. Triple surjectivity with the correct kernel

**Target:** `ModularFormsPartII:W4/triple-surjectivity` (theorem).

Under the preceding hypotheses with N≥3, let D=Γ(N)∩Γ₀(p), and let B be the upper triangular subgroup of SL₂(𝔽p). The map D→S×S×B given by the two quotient maps and reduction modulo p is surjective. On this unsigned domain the reduction kernel is Γ(Np).

**Direct dependencies:** `ModularFormsPartII:W4/nonabelian-ihara`, `ModularCurvesPartII:R14.4/enhanced-ihara`, `ModularCurvesPartII:R14.4/congruence-classes`, `ModularFormsPartII:W1/wohlfahrt`, `mathlib:Subgroup.goursat_surjective`, `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.4.4, pp.659–660, corrected unsigned domain. The triple map adds the diagonal reduction character to the two noncongruence quotients. The target computes its reduction kernel on the unsigned principal-level domain before restoring the signs.

**Construction and proof.**

1. Because E⊆G, restricting from the signed to the unsigned domain leaves the S×S image unchanged (W4/nonabelian-ihara). The level-N unipotent [[1,N],[0,1]] lies in both quotient kernels and reduces onto the unipotent radical U of B.
2. Any proper image then comes, by Goursat, from a common quotient of S×S and the torus B/U, hence from a prime-order character. Restricted to Γ(N)∩Γ₁(p) it gives a pair of characters of S in the kernel of the enhanced Ihara map, which are congruence classes by ModularCurvesPartII:R14.4/enhanced-ihara.
3. A congruence class factoring through S has kernel containing G∩Γ(N) and some Γ(M); the signed closure of that kernel is congruence of level dividing N, so W1/wohlfahrt and N≥3 force the character to vanish. Reduction modulo p on Γ(N)∩Γ₀(p) has kernel Γ(Np) by CRT; E is adjoined only after this computation.

**Acceptance checks.**

- −I is not silently identified with I modulo Np.

### W4.3. The group generation identity

**Target:** `ModularFormsPartII:W4/generation` (theorem).

With N≥3 and the same G,p,A, the subgroup generated by E, G∩Γ(Np), and A⁻¹GA∩Γ₀(p) equals ⟨E,Γ(N)⟩∩Γ₀(p).

**Direct dependencies:** `ModularFormsPartII:W4/triple-surjectivity`, `mathlib:CongruenceSubgroup.Gamma0`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (4.4.9), p.660. The generation formula follows by comparing images and kernels in the triple-surjectivity map. Its two generating subgroups and its intersection with Gamma-zero are retained exactly.

**Construction and proof.**

1. In the triple product, the images of ker(f₁,π) and ker(f₂) generate the product and both contain the full triple kernel. Their preimages therefore generate D.
2. On D these two kernels are G∩Γ(Np) and A⁻¹GA∩D. Adjoin E to recover the signed domain.

**Acceptance checks.**

- This formulation remains correct when the signed reduction kernel is larger than Γ(Np).

**Layer completion checks.** Every target above must be proved with the stated imported contracts. This layer has no open input gap.

## W5. Leveraging and degree doubling

Establish the field intersection and degree-preserving base change, p-scaling separation, degree doubling, the congruence degree formula and the Chebyshev contradiction.

**Layer dependencies:** `ModularFormsPartII:W3`, `ModularFormsPartII:W1`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R12.4`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `ModularFormsPartII:W4`, `ModularFormsPartII:W2`.

**Planets:** Leveraging by p-scaling; Degree doubling.

### W5.1. Geometric intersection and degree-preserving base change

**Target:** `ModularFormsPartII:W5/field-base-change` (theorem).

For p∤2N, R₂N∩M₂Np=M₂N and [R₂N M₂Np:M₂Np]=[R₂N:M₂N], with every field embedded by the stated q parameter. The second equality is a linear-disjointness assertion; it is not a formal consequence of the intersection for arbitrary extensions.

**Direct dependencies:** `ModularFormsPartII:W3/field-structures`, `ModularFormsPartII:W3/normal-stabilizer`, `ModularFormsPartII:W1/wohlfahrt`, `ModularCurvesPartII:R13.4a/twisted-coarse-curve`, `ModularCurvesPartII:R12.4/twisted-analytic-comparison`, `ModularCurvesPartII:R12.4/twisted-geometric-irreducibility`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Theorem 4.3.2, pp.656–657; model statement in Lemma 4.2.3, p.656. The degree proof uses a congruence intersection statement together with geometric base change over rational cusp models. The target separates these assertions because intersection alone does not imply linear disjointness.

**Construction and proof.**

1. Intersection: an f in R₂N∩M₂Np is invariant under G₂N (W3/normal-stabilizer) and under Γ(2Np), so its stabilizer is a congruence subgroup containing E of signed level dividing 2N, and W1/wohlfahrt gives invariance under Γ(2N). By the rational-cusp model (MODEL) the rational-coefficient functions on X(2N) are exactly M₂N.
2. Complex scalars change no degree: ℚ((t)) and ℂ are linearly disjoint over ℚ inside ℂ((t)) (compare coefficients), so for finite extensions K⊆L of subfields of ℚ((t)), L⊗\_K ℂK is a field mapping isomorphically onto ℂL and [ℂL:ℂK]=[L:K].
3. Over ℂ, MODEL identifies ℂM₂m with the function field of X(m). ℂM₂Np is Galois over ℂM₂N, with group a quotient of ⟨E,Γ(2N)⟩/⟨E,Γ(2Np)⟩, and ℂR₂N∩ℂM₂Np=ℂM₂N by the argument of the first step. A Galois extension is linearly disjoint from any extension meeting it only in the base, which gives the degree identity over ℂ and hence over ℚ.

**Acceptance checks.**

- A field-intersection equality without the Galois linear-disjointness step is insufficient.
- The descent from ℂ to ℚ is formal; the only modular input is the rational ∞-cusp model.

### W5.2. p-scaling separates a noncongruence function

**Target:** `ModularFormsPartII:W5/scaling-separation` (theorem).

For N≥1 and p∤2N, if a weight-zero function f∈R₂N is not invariant under any congruence subgroup, then f(pτ) is not in the M₂Np-algebra generated by R₂N. Consequently f(pτ)∈R₂Np supplies a genuinely new field element.

**Direct dependencies:** `ModularFormsPartII:W4/generation`, `ModularFormsPartII:W3/normal-stabilizer`, `ModularFormsPartII:W1/level-scaling`, `ModularFormsPartII:W5/field-base-change`, `mathlib:CongruenceSubgroup.Gamma0`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 4.3.1, p.656, proof (4.4.6)–(4.4.10), p.660. The leveraging theorem says that p-scaling a noncongruence modular function creates an element outside the old-level compositum. The corrected generation formula is the group-theoretic obstruction to such an expression.

**Construction and proof.**

1. Any polynomial or rational expression in the compositum of R₂N and M₂Np is fixed by Γ(2Np)∩G₂N. The assumed expression for f(pτ) is also fixed by A⁻¹G₂NA∩SL₂(ℤ), whose level divides 2Np by W1/level-scaling.
2. Apply W4/generation at the level 2N≥4; if the starting level is 2, first pass to 4, which keeps f noncongruence since R₂⊆R₄ and M₂p⊆M₄p. The two groups generate ⟨E,Γ(2N)⟩∩Γ₀(p); unwinding the conjugation shows that f is invariant under a congruence subgroup, a contradiction.

**Acceptance checks.**

- The initial f belongs to R₂N, correcting the inconsistent level in the printed degree proof.

### W5.3. Degree doubling

**Target:** `ModularFormsPartII:W5/degree-doubling` (theorem).

If [R₂N:M₂N]>1 and p∤2N is prime, then [R₂Np:M₂Np]≥2[R₂N:M₂N].

**Direct dependencies:** `ModularFormsPartII:W5/scaling-separation`, `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W3/field-structures`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 4.3.2, pp.656–657. The degree theorem combines separation of the scaled function with degree-preserving base change. The counterexample is chosen at the old level, correcting an inconsistent field label in the proof.

**Construction and proof.**

1. Choose a generating weak modular function in R₂N outside M₂N and clear its common denominator and its pole at ∞. By Wohlfahrt it cannot be a congruence function at another level.
2. Its p-scaling lies outside the compositum, so the extension above that compositum has degree at least two. Use the degree-preserving base-change identity and the tower law.

**Acceptance checks.**

- The chosen generator is at the old level; the new field is produced by scaling.

### W5.4. The congruence degree comparison

**Target:** `ModularFormsPartII:W5/congruence-degree` (theorem).

For N>1, [M₂N:ℚ(λ)]=(2N)³/12·∏\_{p∣2N}(1−p⁻²)>4N³/π². For N=1 the degree is 1. The formula uses the projective index: −I∈Γ(2) and −I∉Γ(2N) for N>1.

**Direct dependencies:** `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W3/congruence-field`, `ModularCurvesPartII:R13.4a/twisted-coarse-curve`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (4.3.3), p.657. The index formula supplies the cubic lower bound for the congruence field. The target uses the projective index and separates N=1, where the displayed generic formula does not apply.

**Construction and proof.**

1. By MODEL, ℂM₂N is the function field of X(2N); so [M₂N:ℚ(λ)] is the degree of X(2N)→X(2), which is the projective index [Γ(2):±Γ(2N)] (FuchsianOrbifolds Layer 5, W2/lambda-covering). Linear disjointness of ℚ((t)) and ℂ over ℚ transfers the degree to ℚ.
2. Count SL₂(ℤ/m) by prime-power reduction and CRT, then divide the Γ(2)-relative index by two since −I∈Γ(2) and −I∉Γ(2N) for N>1.
3. Bound the finite Euler product below by 1/ζ(2)=6/π².

**Acceptance checks.**

- N=2 yields degree 4; substituting N=1 into the generic formula would incorrectly yield 1/2.

### W5.5. Leveraging contradicts logarithmic normalized degree

**Target:** `ModularFormsPartII:W5/leveraging-contradiction` (theorem).

If [R₂N:ℚ(λ)]≤C N³ log(2N) for a constant C and all N≥1, then R₂N=M₂N for every N.

**Direct dependencies:** `ModularFormsPartII:W5/degree-doubling`, `ModularFormsPartII:W5/congruence-degree`, `mathlib:Chebyshev.theta_ge`, `mathlib:Chebyshev.theta_le_log4_mul_x`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proposition 4.3.5 and (4.3.6)–(4.3.7), pp.657–658. The proposition iterates degree doubling along primes until it exceeds the cubic-logarithmic bound after normalization. The target uses the pinned Chebyshev estimates, which suffice in place of the stronger prime number theorem.

**Construction and proof.**

1. A counterexample at N yields normalized degree at least 2 to the number of primes ≤X not dividing 2N, by repeated doubling.
2. Chebyshev’s lower bound gives at least cX/log X such primes eventually, while the upper bound gives log of their product O(X). The hypothesized normalized degree is O(X).
3. Taking logarithms contradicts cX/log X≤O(log X). The prime number theorem used in the source is stronger than necessary.

**Acceptance checks.**

- Uniformity of C in N is essential.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: MODEL.

## W6. The unbounded denominators theorem

Assemble R₂N=M₂N from the rank bound, the ConformalMappingPartII radius and mean-growth estimates and leveraging; reduce arbitrary integral weight to weight zero; deduce congruence from one integral Fourier expansion, its rational bounded-denominator form, and its algebraic-integer form with number-field descent. Verify the j cube root, h roots, and Fermat tests.

**Layer dependencies:** `ModularFormsPartII:W3`, `ModularFormsPartII:W5`, `ConformalMappingPartII:R0`, `ConformalMappingPartII:M0`, `ModularFormsPartII:W2`, `ModularFormsPartII:W1`, `QSeriesPartitionsAndMockModularForms:QM.1`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`, `AlgebraicModularFormsAndSerreWeights:R15.1`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `QSeriesPartitionsAndMockModularForms:QM.0`.

**Planets:** Equality R₂N = M₂N; Unbounded denominators theorem; Algebraic-integer unbounded denominators; Root denominator tests.

### W6.1. Equality of the bounded and congruence fields

**Target:** `ModularFormsPartII:W6/field-equality` (theorem).

For every N≥1 the embedded fields R₂N and M₂N coincide.

**Direct dependencies:** `ModularFormsPartII:W3/quantitative-rank`, `ModularFormsPartII:W5/leveraging-contradiction`, `ConformalMappingPartII:R0/positive-radius-expansion`, `ConformalMappingPartII:M0/uniform-mean-growth`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §6.3, pp.685–686, assembling Proposition 3.0.1 with Theorems 5.1.4 and 6.0.1. The final proof combines the analytic rank bound with leveraging to identify the bounded-denominator and congruence fields at every level.

**Construction and proof.**

1. ConformalMappingPartII:R0/positive-radius-expansion gives |F\_N′(0)|=γ\_N≥16^{1/N}(1+ζ(3)/(2N³)) for every N≥2, which is the first hypothesis of W3/quantitative-rank with A=ζ(3)/2.
2. ConformalMappingPartII:M0/uniform-mean-growth with p(x)=x^N and r=1−B/N³ bounds ∫log⁺|F\_N^N| by C log(N⁴/B). Dividing by N gives the second hypothesis, with C\_B depending only on B.
3. W3/quantitative-rank then gives [R₂N:ℚ(λ)]≤CN³log(2N) for all N, and W5/leveraging-contradiction gives R₂N=M₂N.

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

If a weak modular form of integer weight has an expansion at ∞ in O\_K[[q^{1/N}]] for a number field K⊆ℂ, then it is a congruence weak form. The same conclusion holds for an expansion in the algebraic integers Q̄ with the common-number-field and conjugation bridge NF supplied. One scalar denominator over O\_K and finitely many negative exponents are also allowed.

**Direct dependencies:** `ModularFormsPartII:W6/unbounded-denominators`, `ModularFormsPartII:W6/weight-reduction`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-9-algebraic-belyi-pairs-and-algebraization`, `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Remarks 6.3.1–6.3.2, pp.685–686. The remarks extend the conclusion to algebraic-integer coefficients using number-field conjugates. The target identifies the noncongruence germ-descent step that must precede that trace argument.

**Construction and proof.**

1. After reducing weight and making the algebraic modular-function model explicit, realize coefficientwise conjugates as weak modular functions on finite-index groups.
2. For an integral basis α\_i of O\_K, take coefficientwise Tr(α\_i f); these have integral rational expansions and are weak on intersections of finitely many conjugate groups. Apply the rational theorem and invert the nondegenerate trace matrix.
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

Set h=λ(1−λ)/16=q∏\_{n≥1}((1+q^{2n})/(1+q^n))^{24}=q∏\_{m odd}(1+q^m)^{−24}. It is a nowhere-vanishing weak modular function for the theta group ⟨Γ(2),S⟩, the conjugate of Γ₀(2) containing S. For n≥1, the branch h^{1/n} with leading term q^{1/n} has bounded denominators if and only if n∣24, and is a congruence weak modular function if and only if n∣24.

**Direct dependencies:** `ModularFormsPartII:W2/lambda`, `ModularFormsPartII:W1/weak-form`, `ModularFormsPartII:W1/bounded-denominators`, `ModularFormsPartII:W6/rational-contrapositive`, `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application`, `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Equation (1.0.4) and its group-theoretic discussion, p.629. The example distinguishes the roots of lambda times one minus lambda by divisibility of their exponent into twenty-four. The special congruence abelianization or a direct denominator calculation remains an explicit proof input.

**Construction and proof.**

1. Write h=q·u with u=∏\_{m odd}(1+q^m)^{−24}∈1+qℤ[[q]], using λ=(θ₂/θ₃)⁴, 1−λ=(θ₄/θ₃)⁴ and the theta product identities. If n∣24 every factor of u^{1/n} has integral exponent, so h^{1/n}=q^{1/n}u^{1/n} has integral coefficients.
2. Conversely let u^{1/n} have bounded denominators, let ℓ be prime and let c be minimal with ℓ^c u^{1/n}∈ℤ\_(ℓ)[[q]]. If c≥1, the reduction of ℓ^c u^{1/n} modulo ℓ is nonzero while its n-th power ℓ^{cn}u reduces to 0, impossible in the domain 𝔽\_ℓ[[q]]. So u^{1/n} is integral, and its q-coefficient −24/n is an integer.
3. S maps λ to 1−λ, so h is invariant under ⟨Γ(2),S⟩; it has no zeros on ℍ, so h^{1/n} is a weak modular function on the kernel of the induced character to ℤ/n. Bounded denominators give congruence by W6/rational-contrapositive, and congruence gives bounded denominators by the congruence bounded-denominator theorem.

**Acceptance checks.**

- n=24 is integral after its monomial shift, while n=5 is not bounded: the coefficients of u^{1/5} have denominators 5, 25, 125, ….
- With q=e^{πiτ}, T sends q to −q and h is not T-invariant; the invariance group is ⟨Γ(2),S⟩, not Γ₀(2) itself (E22).

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

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: NF.

## W7. Differential equations and vector-valued forms

Apply the corrected holonomic rank theorem to integral three-point ODE solutions with finite monodromy at zero. Define vector-valued forms and continuation spaces of individual components, build the minimal operator of a component by Wronskians, descend it to ℚ(x), and apply the G-function inputs to componentwise congruence and the corrected effective-span Mason corollary.

**Layer dependencies:** `DiophantineApproximationAndTranscendencePartII:AA.4`, `ConformalMappingPartII:U0`, `ConformalMappingPartII:R0`, `ConformalMappingPartII:O0`, `ModularFormsPartII:W6`, `ModularFormsPartII:W2`, `ModularFormsPartII:W1`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `DiophantineApproximationAndTranscendence:DT.5`, `QSeriesPartitionsAndMockModularForms:QM.1`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**Planets:** Integral ODE algebraicity; Congruence for integral ODE solutions; Vector-valued modular forms; Integral vector-valued component theorem; Mason’s effective-span corollary.

### W7.1. Algebraicity for integral three-point ODE solutions

**Target:** `ModularFormsPartII:W7/ode-algebraicity` (theorem).

Let f∈ℤ[[x]] solve a nonzero linear differential operator over ℚ̄(x), with no genuine singularities outside {0,1/16,∞}, and with finite local monodromy at 0 in the supplier’s meromorphic-after-finite-ramification sense. Apparent singularities are allowed only when every local solution is meromorphic. Then f is algebraic over ℚ(x). In the regular-singular case the stated finite-monodromy condition is the usual finite-order local monodromy condition.

**Direct dependencies:** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-closure`, `DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound`, `ConformalMappingPartII:U0/roots-cover`, `ConformalMappingPartII:R0/positive-radius-expansion`, `ConformalMappingPartII:O0/meromorphic-basis-monodromy`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.2.1 and footnote 4, pp.687–688; Definition 2.0.4 convention, p.635. The theorem applies the arithmetic rank bound to all powers of an integral solution after a ramified pullback at zero. The target retains the source's meromorphic local-monodromy convention and its restriction on apparent singularities.

**Construction and proof.**

1. Let N be the order of the local monodromy at 0, replaced by 2N if N=1, so that N≥2. The pullback g(u)=f(u^N) is integral and is annihilated by the pulled-back operator. That operator has a full meromorphic local basis at u=0 and at every apparent singularity, in the sense of ConformalMappingPartII:O0/meromorphic-basis-monodromy; its genuine finite singularities lie in 16^{−1/N}μ\_N. So g∈H(U\_N,t,ℤ) (DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring).
2. Take φ(z)=16^{−1/N}F\_N(rz) with |φ′(0)|>1, using ConformalMappingPartII:R0/positive-radius-expansion. All powers g^k lie in the ring H (AA.4/holonomic-closure), so they span a subspace of W(U\_N,t,u) of finite dimension over ℚ(u) by AA.4/rank-bound.
3. Hence g is algebraic over ℚ(u), and f(x)=g(x^{1/N}) is algebraic over ℚ(x). The meromorphic-basis convention matters: bare single-valuedness does not exclude an essential singularity.

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

For n≥0, k∈ℤ, a vector-valued form consists of ρ:PSL₂(ℤ)→GL\_n(ℂ) and a holomorphic F:ℍ→ℂⁿ with F|ₖγ=ρ(γ)F after pullback to SL₂(ℤ), semisimple ρ(T), and the following growth: for every real a<b and C>0 there are A,B>0 such that each |F\_j(τ)|≤A exp(B Im τ) when a≤Re τ≤b and Im τ≥C. Since ρ(−I)=1, nonzero such forms have even weight. The SL₂ version with central character is a separate imported parity convention.

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

In a basis diagonalizing ρ(T), each component has a convergent expansion Q^μ Σ\_{m≥m₀}a\_m Q^m, Q=e^{2πiτ}, where exp(2πiμ) is its T-eigenvalue and μ may be complex. Conversely such expansions with finite lower support give the required moderate exponential strip growth. There are no logarithms; rational exponents or finite-order T are not asserted.

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

For a weight-zero vector-valued form, let L\_ρ be the rank-n complex local system on Y(2)=ℙ¹∖{0,1/16,∞} associated to ρ restricted to Γ(2)/E. Build it by descent of the trivial bundle on ℍ with its flat connection. It has this specified rank independently of linear relations between component functions. This does not define an integral free module or an arithmetic connection.

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

For a fixed weight-zero component f=F\_j, let W\_j be the complex vector space of its analytic continuation germs at a fixed ordinary point of Y(2). The slash transformation expresses each branch as a constant linear combination of the n component functions, so dim W\_j≤n. Use the resulting monodromy subquotient of L\_ρ, retaining the actual scalar germ and all its linear relations. Do not assert irreducibility.

**Direct dependencies:** `ModularFormsPartII:W7/complex-local-system`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Proof of Theorem 7.3.3, pp.690–691, corrected component system. The component proof needs the span of the actual branches of one scalar function. The target quotients all component relations and records its rank bound without assuming irreducibility.

**Construction and proof.**

1. Take the span of continuations inside the space of scalar germs. Continuation transports relations, so monodromy descends to this span.
2. Identify it as the quotient of the cyclic dual representation generated by the selected coordinate functional; its dimension can be smaller than n.

**Uses that determine the API.**

- W7 arithmetic equation: Only W\_j needs arithmetic descent.
- W7 component theorem: No invisible summand is used in the G-function argument.

**API.**

- `componentContinuation_rank_le` (relation): dim W\_j≤n.
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

### W7.8. The minimal operator of a component germ

**Target:** `ModularFormsPartII:W7/regular-singular-component` (theorem).

With x=λ/16, the continuation space W\_j of a weight-zero component f=F\_j is the full solution space, at an ordinary point, of a unique monic operator L\_j∈ℂ(x)[∂] of order dim W\_j. L\_j is the minimal operator of the germ f. It is regular singular, has no genuine singularities outside {0,1/16,∞}, and has apparent singularities only at points of ℍ where all its local solutions are holomorphic. Its local monodromies are those of W\_j, hence semisimple.

**Direct dependencies:** `ModularFormsPartII:W7/component-continuation`, `ModularFormsPartII:W7/generalized-expansion`, `ModularFormsPartII:W2/lambda-covering`, `ConformalMappingPartII:O0/path-continuation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.3.3 proof, pp.690–691. The component proof needs a differential equation for the selected scalar germ with regular singularities and the local monodromy of the component. The target constructs it from the continuation space by Wronskians instead of the rank-6n bundle of the printed proof (E13).

**Construction and proof.**

1. Choose a basis w₁,…,w\_m of W\_j and set L\_j(y)=Wr(y,w₁,…,w\_m)/Wr(w₁,…,w\_m), with Wronskians in x. Continuation multiplies both Wronskians by the same determinant, so the coefficients of L\_j are single-valued on Y(2). They are meromorphic on ℍ because x is a local coordinate there (W2/lambda-covering).
2. Each w\_i is a constant combination of the components of F, which have moderate growth at the cusps (W7/generalized-expansion). So the coefficients have moderate growth at the three cusps, extend meromorphically to X(2)≅ℙ¹ and lie in ℂ(x). Moderate growth of all solutions gives regular singularities by Fuchs' criterion.
3. Every operator annihilating f annihilates all its continuations, so L\_j right-divides it; L\_j is the minimal operator of f. Zeros of the Wronskian on ℍ are apparent singularities with holomorphic local solutions. Local monodromy on W\_j is the action of the semisimple cusp monodromy on an invariant subquotient (W7/component-continuation).

**Acceptance checks.**

- An abstract Riemann–Hilbert existence statement without the actual scalar germ is insufficient.
- For f=1 the operator is ∂, of order one.

### W7.9. Arithmetic descent and finite component monodromy

**Target:** `ModularFormsPartII:W7/arithmetic-component` (theorem).

If the selected weight-zero component has an integral x-series f∈ℤ[[x]], then its minimal operator L\_j has coefficients in ℚ(x), f is a G-function, the companion system of L\_j satisfies Galochkin's condition, L\_j is globally nilpotent and its local monodromies are quasi-unipotent. Together with semisimplicity, every local monodromy of W\_j has finite order.

**Direct dependencies:** `ModularFormsPartII:W7/regular-singular-component`, `ModularFormsPartII:W2/inverse-integrality`, `DiophantineApproximationAndTranscendence:DT.5/g-function`, `DiophantineApproximationAndTranscendence:DT.5/chudnovsky-galochkin-condition`, `DiophantineApproximationAndTranscendence:DT.5`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.3.3 proof, pp.690–691. The proof applies the Chudnovsky, Bombieri–André and Katz theorems to obtain quasi-unipotent and hence finite local monodromy. The target applies them to the minimal operator of the selected integral series, after proving that operator is defined over ℚ(x).

**Construction and proof.**

1. For σ∈Aut(ℂ/ℚ), applying σ to the coefficients of L\_j gives a monic operator of the same order that still annihilates the formal series f, whose coefficients are rational. By minimality it equals L\_j, so the coefficients of L\_j are fixed by Aut(ℂ/ℚ) and lie in ℚ(x).
2. f converges near 0, since its q-expansion converges on the unit disc and x is a local coordinate at the cusp, and its coefficients are integers; with the equation of the previous step it is a G-function (DiophantineApproximationAndTranscendence:DT.5/g-function), and so are its derivatives. By minimality f,f′,…,f^{(m−1)} are linearly independent over ℚ̄(x) and solve the companion system, which therefore satisfies Galochkin's condition (DT.5/chudnovsky-galochkin-condition).
3. Galochkin's condition implies global nilpotence (Bombieri–André), and a globally nilpotent operator has quasi-unipotent local monodromy at every point (Katz). These two theorems are the request GLOCAL. Quasi-unipotent and semisimple local monodromy has finite order.

**Acceptance checks.**

- A theorem for a ℚ̄(x)-linearly independent vector of G-functions is applied to the companion system of the minimal operator of f, not to an unspecified ambient system.
- The descent to ℚ(x) uses only that f has rational coefficients; no arithmetic model of the representation is needed.

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

Let (F,ρ) be as defined above and let F\_j have an actual expansion in ℤ[[q]], q=e^{πiτ}. Then F\_j is a classical weight-k weak form on some Γ(M). No assertion is made about an unused summand of ρ.

**Direct dependencies:** `ModularFormsPartII:W7/vv-weight-normalization`, `ModularFormsPartII:W7/arithmetic-component`, `ModularFormsPartII:W7/ode-congruence`, `ModularFormsPartII:W7/vector-valued-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.3.3, pp.690–691, with its proof bridges explicitly supplied. The component theorem concerns a selected integral Fourier expansion. The target routes it through the weight-zero arithmetic equation and integral ODE theorem without making a claim about unused representation summands.

**Construction and proof.**

1. Normalize weight and use integral λ reparametrization. Apply the arithmetic component result to obtain finite local monodromy at 0.
2. Use the three-point ODE congruence theorem, then undo the scalar congruence factor. Zero components are immediate.

**Acceptance checks.**

- F=1 gives the rank-one constant equation; the proof never forces its ambient system to be irreducible.

### W7.12. Mason’s corollary on the effective value span

**Target:** `ModularFormsPartII:W7/effective-mason` (theorem).

Suppose each component of F becomes an integral Fourier series after multiplication by a nonzero scalar and enlargement of its strict period. Put V\_F=span\_ℂ{F(τ):τ∈ℍ}. Then V\_F is ρ-stable and Γ(M) acts identically on V\_F for some M. If V\_F=ℂⁿ, ker ρ contains Γ(M) and ρ has finite image. Without spanning, the conclusion applies only to ρ|V\_F.

**Direct dependencies:** `ModularFormsPartII:W7/component-congruence`, `ModularFormsPartII:W7/vector-valued-form`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Corollary 7.3.4, p.691, corrected effective-span statement. The corollary is valid on the span detected by the values of the modular form. The target adds the spanning hypothesis exactly where a conclusion about the whole ambient kernel is drawn.

**Construction and proof.**

1. If a component F\_j has, after a scalar, an integral expansion in Q^{1/M}, replace τ by Mτ: τ↦F(Mτ) is a vector-valued form for the finite-index group SL₂(ℤ)∩diag(M,1)⁻¹SL₂(ℤ)diag(M,1), and inducing it to SL₂(ℤ) keeps T semisimple and the strip growth. Its component F\_j(Mτ) has an integral expansion in Q, so the component theorem applies, and congruence of F\_j(Mτ) gives congruence of F\_j.
2. Intersect the finitely many congruence groups. The vector slash law then fixes every value F(τ), hence its span.
3. Finite index gives finite image only for the representation restricted to that span.

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

Let h be a nonzero congruence form of positive integer weight k, modular on Γ′, and express it as a germ in x=λ/16 on the finite étale cover Y(Γ′∩Γ(2))→Y(2). Its continuation space is spanned by τ^i h for 0≤i≤k, so its minimal operator has order exactly k+1. The monodromy on this space is Sym^k of the standard representation, has infinite image, and is unipotent and nontrivial at every cusp. Apparent singularities on ℍ occur exactly at the zeros of h. If h has an actual expansion in ℤ[[q]], integral inverse λ reparametrization gives an integral x-series; for a fractional q-expansion the corresponding Puiseux germ is retained, and integrality after a fractional change is not asserted without checking its unit root.

**Direct dependencies:** `ModularFormsPartII:W2/inverse-integrality`, `ModularFormsPartII:W2/lambda-covering`, `ModularFormsPartII:W7/component-continuation`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Remark 7.2.3, p.688, citing Stiller (1984) and Zagier (2008), §5.4. The remark contrasts finite-local-monodromy algebraicity with the differential equation of a positive-weight classical form. The target specifies the symmetric-power monodromy and its local-system proof input.

**Construction and proof.**

1. Continuing h along a loop that represents γ=[[a,b],[c,d]]∈Γ′ replaces it by (cτ+d)^k h. Since Γ′ is Zariski dense in SL₂, these span all of {P(τ)h : deg P≤k}, of dimension k+1; this is the continuation space, so the minimal operator has order k+1.
2. The Wronskian of h,τh,…,τ^k h in x is a nonzero constant times h^{k+1}(dτ/dx)^{k(k+1)/2}, and dτ/dx has no zeros or poles on ℍ. So the singular points of the operator on ℍ are the zeros of h, where all local solutions are holomorphic.
3. The monodromy acts on polynomials of degree at most k in τ through Sym^k of the standard representation of Γ′; parabolic elements act unipotently and nontrivially for k≥1, and the image is infinite.

**Acceptance checks.**

- This is the positive-weight boundary example: its local monodromy at 0 is infinite, so the finite-monodromy ODE theorem does not apply.
- For Δ (k=12) the operator has order 13 on Y(2), with apparent singularities only where Δ vanishes, which is nowhere on ℍ.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: GLOCAL.

## W8. Quasimodular and arithmetic growth applications

Define weakly holomorphic quasimodular forms using E₂ and Δ localization and prove derivative minimality with the q normalization fixed. Verify the elliptic-integral and Catalan identities. Define deficient places and state their congruence and effective arithmetic-component consequences with the necessary detection hypotheses.

**Layer dependencies:** `ModularFormsPartII:W1`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `ModularFormsPartII:W2`, `QSeriesPartitionsAndMockModularForms:QM.1`, `QSeriesPartitionsAndMockModularForms:QM.0`, `ModularFormsPartII:W7`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `AutomorphicGaloisRepresentations:R19.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `ModularFormsPartII:W6`.

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

With θ\_q=(1/πi)d/dτ and q=e^{πiτ}, M̃!(Γ) is the smallest ℂ-subalgebra of holomorphic functions on ℍ containing M!(Γ) and closed under θ\_q. In this normalization θ\_qΔ=2E₂Δ, so E₂=(θ\_qΔ)/(2Δ). For D=(1/2πi)d/dτ, DΔ=E₂Δ.

**Direct dependencies:** `ModularFormsPartII:W8/weak-quasimodular`, `ModularFormsPartII:W1/clear-cusp-poles`, `mathlib:ModularForm.logDeriv_eta_eq_E2`, `mathlib:ModularForm.discriminant_ne_zero`, `mathlib:Derivative.serreDerivativeMF`, `mathlib:Derivative.normalizedDerivOfComplex_E₂`, `mathlib:EisensteinSeries.E2`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 7.4.4, pp.692–693, with derivative normalization corrected. The lemma characterizes weak quasimodular forms as the differential closure of weak modular forms. The target corrects the factor of two forced by the paper's exponential-pi parameter.

**Construction and proof.**

1. Use the pinned Serre derivative of ordinary modular forms and Ramanujan’s derivative formula for E₂ to prove derivative closure of M(Γ)[E₂]. These are baseline inputs, not new derivative targets.
2. Differentiate Δ⁻m h by the quotient rule. Conversely derivative closure and Δ⁻¹ give E₂ using the factor 2 formula, hence the whole localized polynomial ring.

**Acceptance checks.**

- Leading terms: Δ=q²+⋯, θ\_qΔ=2q²+⋯, E₂Δ=q²+⋯.

### W8.3. The elliptic integral of the second kind

**Target:** `ModularFormsPartII:W8/elliptic-integral-test` (theorem).

Let K₀(x)=Σ binom(2n,n)²x^n and E₀(x)=₂F₁(−1/2,1/2;1;16x). Then E₀=(1−16x)K₀+8∫₀ˣK₀(t)dt. At x=λ/16, E₀=(θ₃θ₄⁴+4θ\_qθ₃)/θ₃³ belongs to M̃!(Γ(12)) and has q-series 1−4q+20q²−64q³+164q⁴−392q⁵+⋯.

**Direct dependencies:** `ModularFormsPartII:W2/jacobi-hypergeometric`, `ModularFormsPartII:W8/derivative-minimality`, `QSeriesPartitionsAndMockModularForms:QM.1/theta-gamma-two-transformation`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-three-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/theta-two-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.0/gauss-theta-four-product-identity`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-triple-product-analytic`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-quotient-transformation`, `mathlib:Derivative.normalizedDerivOfComplex_E₂`, `mathlib:Derivative.serreDerivativeMF`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §7.4.2, p.693, corrected E–K sign. The example writes the second elliptic integral as a theta derivative quotient. The target corrects the sign in its relation to the first elliptic integral and verifies its own level and multiplier.

**Construction and proof.**

1. Check the hypergeometric coefficient recurrence with the chosen constant term; derive the corrected integral identity coefficientwise.
2. Use theta derivative and product identities to obtain the displayed quotient, including its multiplier kernel and cusp-pole bound.

**Acceptance checks.**

- At x=0 both sides are 1; the printed opposite sign would give −1.

### W8.4. Catalan integral and theta quotient checks

**Target:** `ModularFormsPartII:W8/catalan-tests` (theorem).

The series I₁(x)=Σ binom(2n,n)²x^(n+1)/(n+1) and I₂(x)=Σ C\_n²x^(n+1), C\_n=binom(2n,n)/(n+1), are integral. Their derivatives satisfy I₁′=K₀ and xI₂′=I₁. Moreover Σ C\_n²(λ/16)^n=(4/θ₂⁴)(4θ₃² θ\_qθ₂/θ₂+4θ₃ θ\_qθ₃−θ₃⁴) belongs to M̃!(Γ(12)).

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

Fix a number field K⊆ℂ and a representation ρ. Let S\_k(ρ;K) be the K-space of cuspidal vector-valued forms whose components have actual expansions in tK[[t]] for t=q^(1/N), some common N. A normalized place v of K is deficient if some such component Σ\_{m≥1}a\_m t^m has unbounded |a\_m|\_v at a finite v, or unbounded |a\_m|\_v/m^((k−1)/2+ε) for some ε>0 at an archimedean v. An archimedean place uses its usual modulus, not its square. The source's version is K=ℚ; the number-field version specializes to it.

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

- `deficient_zero_space` (degenerate): If every S\_k(ρ;K) is zero, the deficient-place set is empty regardless of an undetected ambient summand.
- `deficient_common_scalar` (compatibility): One scalar denominator bounds coefficients at every finite place; it creates no finite-place witness.
- `deficient_local_denominator` (non-example): The coefficient sequence p^(−m) is unbounded at p even though all coefficients lie in K[1/p]. This tests the growth predicate, without asserting that the series is a modular component.
- `deficient_parameter` (compatibility): Zero-inserting by t↦t² preserves both the finite-place test and the exponent threshold at infinity.

**Acceptance checks.**

- Noncongruence of an invisible summand is not a witness form in this definition.

### W8.6. Congruence kernels have no deficient places

**Target:** `ModularFormsPartII:W8/congruence-no-deficiency` (theorem).

If ker ρ contains a principal congruence subgroup, then every Σ\_K(ρ) is empty. At finite places a common scalar denominator bounds the coefficients. At every archimedean place the coefficients of a weight-k cuspidal component satisfy |a\_m|≪\_ε m^((k−1)/2+ε) for every ε>0.

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

1. If every v∈S were bounded, their finitely many bounds could be cleared by a single element of O\_K. Places outside S are already integral, giving a global common denominator.
2. The component congruence theorem contradicts the noncongruence witness. Without finite S use precisely the missing LOCALGLOBAL bridge, not a false inference from globally unbounded denominators alone.

**Acceptance checks.**

- An infinite ambient summand on which F vanishes gives no such arithmetic component.
- For ρ=1⊕σ of W7/invisible-summand-test every element of S\_k(ρ;K) has zero σ-part, because σ(T)^M−1 is invertible; so the deficient set is empty although ker ρ is not congruence (E19).

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: LOCALGLOBAL.

## W9. The arithmetic fundamental-group application

On the connected cusp component of the smooth locus of a regular X(N) model, derive the split étale fundamental-group isomorphism from the arithmetic finite-cover criterion and algebraic-integer unbounded denominators; specify model and cover-descent inputs explicitly.

**Layer dependencies:** `ModularCurvesPartII:R13.5`, `ModularCurvesPartII:R12.3`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `ModularFormsPartII:W6`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.

**Planets:** Connected cuspal modular model; Arithmetic modular-model fundamental group.

### W9.1. The connected cuspal smooth model

**Target:** `ModularFormsPartII:W9/cuspal-model` (construction).

For N≥1 and a finite extension K/ℚ(μ\_N), start with a minimal regular model of X(N) over O\_K and the extension ε of its rational ∞ cusp. Let 𝒳\_cusp(N) denote the smooth open selecting the connected fibre component through ε at each finite place, with the same generic fibre. Require existence, uniqueness and compatibility of this selection as the model contract NERON. This pins the intended connected Néron model; it does not confuse a global connected component of an irreducible total space with a component in each fibre.

**Direct dependencies:** `ModularCurvesPartII:R13.5`, `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.4.10, p.696, connected-model convention. The final theorem uses the connected cuspal smooth part of a regular modular-curve model. The target pins the fibrewise connected-component selection and cusp section rather than using global connectedness of the total space.

**Construction and proof.**

1. Import the regular-model and cusp-section existence contracts, then form the specified smooth cuspal open.
2. Check the fibre-component selection and its compatibility with the finite covers used in the proof.

**Uses that determine the API.**

- W9 fundamental groups: The cusp section supplies the splitting and base point.
- W9 arithmetic cover criterion: Good and bad fibres both enter the no-geometric-cover claim.

**API.**

- `cuspalModel_genericFibre` (compatibility): The generic fibre is the specified X(N)\_K.
- `cuspalModel_smooth` (structure): The structure morphism to Spec O\_K is smooth with the selected connected fibres.
- `cuspalModel_cuspSection` (constructor): ε is a section through the smooth cuspal component.
- `cuspalModel_basePoint` (functoriality): Every geometric η on the base gives ε(η) and π∘ε=id.

**Unit tests.**

- `cuspal_level_one` (computation): For X(1)=ℙ¹ with its usual smooth model, the cuspal model is ℙ¹\_{O\_K}.
- `cuspal_section_identity` (compatibility): The maps induced by π∘ε=id compose to the identity on the base π₁.
- `cuspal_bad_fibre` (non-example): A different connected component in a bad special fibre is not retained merely because the total regular model is globally connected.
- `cuspal_field_requirement` (non-example): The claimed distinguished cusp section is not silently descended to a field not containing its field of definition.

**Acceptance checks.**

- No group-scheme Néron mapping property is assumed for a curve merely because of the source’s terminology.

### W9.2. The arithmetic finite-cover criterion

**Target:** `ModularFormsPartII:W9/arithmetic-cover-criterion` (theorem).

Every finite étale cover of 𝒳\_cusp(N) is the pullback of a finite étale cover of Spec O\_K, with morphisms descending uniquely. This statement includes all primes dividing N. It is the precise arithmetic geometric input to the fundamental-group theorem.

**Direct dependencies:** `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W6/number-field-variant`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `ModularCurvesPartII:R13.5`, `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-6-finite-covers-and-their-triples`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Sketch of Theorem 7.4.10, p.696, citing Ihara (1994), §4 p.252 and Theorem 1 pp.248–249. The proof sketch invokes Ihara to descend all finite etale covers from this model to the integer base. The target states that precise missing input at bad primes and checks the lambda coordinate's level doubling.

**Construction and proof.**

1. Read and adapt the arithmetic formal-rationality/cover criterion in IHARA94, with its model assumptions retained. A finite étale cover gives an algebraic-integer expansion along the cuspal section; W6 forces its modular germ to be congruence.
2. Prove that étaleness over the selected smooth model at every finite place forces this congruence cover to be arithmetically constant, then descend it over O\_K. The exact missing input is NERON.
3. Use λ(τ/N)/16 as a parameter only after the appropriate level doubling or formal cover: its leading term is exp(πiτ/N), whereas the usual width-N X(N) parameter is exp(2πiτ/N). Prove the resulting formal descent.

**Acceptance checks.**

- The theorem is not justified merely by the existence of a rational cusp or by an isomorphism on generic-fibre fundamental groups.

### W9.3. The fundamental group of the connected cuspal model

**Target:** `ModularFormsPartII:W9/arithmetic-pi1` (theorem).

For N≥1, K/ℚ(μ\_N) finite and every geometric η of Spec O\_K, the maps π\_\*:π₁(𝒳\_cusp(N),ε(η))→π₁(Spec O\_K,η) and ε\_\* in the opposite direction are mutually inverse isomorphisms.

**Direct dependencies:** `ModularFormsPartII:W9/arithmetic-cover-criterion`, `ModularFormsPartII:W9/cuspal-model`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`.

**Source:** [CDT25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Theorem 7.4.10, p.696. The theorem identifies the two pointed etale fundamental groups by the structural morphism and its cusp section. The target derives it from an equivalence of finite-cover categories at every geometric base point.

**Construction and proof.**

1. The finite-cover criterion identifies the two pointed Galois categories, so the induced maps on automorphism groups are inverse.
2. The section checks π\_\*ε\_\*=id and fixes the base-point ambiguity.

**Acceptance checks.**

- The result is stated for every geometric base point, including points over finite primes.

**Layer completion checks.** Every target above must be proved with the stated imported contracts. Exact additional inputs for this layer: NERON, NF.

## Worked acceptance calculations

These small cases fix normalizations used across the layers and distinguish the intended definitions from tempting alternatives.

1. The integral coordinate is x=q−8q²+44q³−192q⁴+718q⁵+O(q⁶); the inverse is q=x+8x²+84x³+992x⁴+12514x⁵+O(x⁶). Both compositions are the identity through degree five. By contrast the normalized cube root in t=q^(1/3) is t−(8/3)t⁴+…, so its cube is integral while the root need not be.
2. For H′={γ∈Γ(2):dγ≡1 mod4}, E is absent and Γ(4) is contained, but its signed level is two. This tests the conclusion Γ(L(G))≤⟨G,E⟩ and rejects the same conclusion into G without the sign hypothesis. The theta-square character becomes trivial precisely after such a restriction.
3. At level 2N=4, the function-field degree over ℚ(λ) is four. At 2N=2 it is one. Applying the generic projective-index formula at N=1 would give one half, so this boundary must be split off.
4. For n=2^a>1, the coefficient of x^m in (1−16x)^(1/n) has 2-adic valuation (4−a)m−v₂(m!). The exponents a=1,2,3 give bounded denominators, while a=4 gives valuations tending to minus infinity. An odd prime dividing n also gives unbounded valuations. This is the arithmetic distinction between the Fermat exponents 1,2,4,8 and all others.
5. For a constant vector F=(1,0,0), use ρ=1⊕σ with S=diag(1,−1), R=[[2,1],[−7,−3]], and T=SR=[[2,1],[7,3]]. Direct multiplication gives S²=R³=I. The characteristic polynomial of T is X²−5X−1; its two roots are distinct and one has modulus greater than one. The ambient image is infinite, but the value span is one-dimensional and trivial. This tests both the rank of component continuation and the effective-span formulation of Mason's corollary.
6. At the first two q-coefficients, Δ=q²+…, θ\_qΔ=2q²+…, and E₂Δ=q²+…. The normalized elliptic integral E₀ has constant term one, as does (1−16x)K₀+8∫₀ˣK₀. Negating that expression fails already at the constant term.
7. The degree-two theta monomial θ₂θ₃ changes sign under T¹², although T¹² lies in Γ(12). A common Γ(12) claim for every even-degree theta Laurent monomial therefore fails. The specific quotients in W8 require their own multiplier checks.
8. With u=∏\_{m odd}(1+q^m)^{−24}, the coefficients of u^{1/5} have denominators 5, 25, 125, 625, …, while u^{1/24}=∏\_{m odd}(1+q^m)^{−1} is integral. A root of u with bounded denominators is integral (reduce modulo ℓ in the domain 𝔽\_ℓ[[q]]), so its linear coefficient −24/n must be an integer.
9. With q=e^{πiτ}, T sends h=λ(1−λ)/16=q+⋯ to −q+⋯, so h is not Γ₀(2)-invariant; S sends λ to 1−λ and fixes h. The invariance group is the theta group ⟨Γ(2),S⟩.

## Exact additional proof inputs

These inputs have identified owners or mathematical boundaries. They must be supplied before a proof plan can be marked closed. The targets above remain in scope with the specified statements.

### MODEL. Rational ∞ cusp of the ℤ/m⊕μ\_m model

ModularCurvesPartII (TauCetiRoadmap pull request #913, head 2f3a763) constructs the compactified twisted curve X(V) over ℚ for a rank-two V with alternating pairing to μ\_m (R13.4a/twisted-coarse-curve, §5.14), its analytic comparison and geometric irreducibility (R12.4, §§6.4–6.5), the cusp fields of fixed-pairing curves (R12.3, §6.3) and descent of sections from a split K-rational cusp by q-expansion (R12.6, §8.1); these are cited as they stand. Not stated there: for V=ℤ/m⊕μ\_m with its standard pairing and m≥3, the cusp ∞ of X(V) is ℚ-rational and split, with Tate parameter q^{1/m} (q=e^{2πiτ}) compatible with the analytic comparison, so that ℚ(X(V)) is exactly the field of meromorphic functions on X(m) whose q^{1/m}-expansion at ∞ is rational. W5 uses this to identify ℂM₂m with the function field of X(m); the rest of the degree comparison is formal (W5/field-base-change). Requested from a Part II of ModularCurvesPartII.

Required by `ModularFormsPartII:W5/field-base-change`, `ModularFormsPartII:W5/congruence-degree`.

### NF. Arithmetic descent of noncongruence Fourier germs

Supply a number-field model and q-germ for an arbitrary finite-index modular function with algebraic coefficients; show all coefficients lie in one number field, and coefficientwise Galois conjugation produces finite-index weak modular functions with compatible cusp parameters. Reduce arbitrary weight via the explicit congruence factor. Belyi existence alone does not identify its distinguished Fourier germ, and the congruence q-expansion comparison alone does not cover a noncongruence group. This is the precise missing bridge in the short trace proof of Remark 6.3.2.

Required by `ModularFormsPartII:W6/number-field-variant`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

### GLOCAL. Bombieri–André and Katz for G-operators

DiophantineApproximationAndTranscendence is merged into TauCetiRoadmap main (pull request #855, head 0d1c47b). Its DT.5 G-functions (§5.2), the Galochkin condition for ℚ̄(z)-independent G-function solutions of a system (Chudnovsky, §5.3) and the regularity at 0 of the minimal operator of a G-function are cited as they stand. Not stated there: (a) the Bombieri–André theorem that Galochkin's condition implies Bombieri's condition and global nilpotence of the connection; (b) Katz's theorem that a globally nilpotent operator over ℚ̄(x) is regular singular with quasi-unipotent local monodromy at every point of ℙ¹. Requested from a Part II of DiophantineApproximationAndTranscendence in the G-function direction; the designed DiophantineApproximationAndTranscendencePartII (arithmetic algebraization, AA.0–AA.5) does not contain them.

Required by `ModularFormsPartII:W7/arithmetic-component`.

### LOCALGLOBAL. Deficient-place converse needs an arithmetic witness

The unconditional ambient converse asserted on CDT25 p.695 requires (i) noncongruence to be detected by an actual arithmetic cuspidal component and (ii) a theorem converting the relevant all-place local bounds into one global common denominator. Neither follows merely from the component theorem or from noncongruence of an invisible summand. W8 proves the precise finite-denominator-support witness version. The unrestricted archimedean and finiteness questions remain questions, not roadmap theorem targets. Selberg’s asserted bound also needs its primary hypothesis/normalization check before use. The printed converse is false as stated: for ρ=1⊕σ of W7/invisible-summand-test the deficient set is empty although ker ρ is not congruence (E19).

Required by `ModularFormsPartII:W8/noncongruence-witness`.

### NERON. All-prime cuspal-model cover descent

The source gives only a sketch referring to Ihara (1994), Horizontal divisors on arithmetic surfaces associated with Belyi uniformizations, Theorem 1 pp.248–249 and §4 p.252 (DOI 10.1017/CBO9780511569302.011). No lawful full text was available from the cleared library or official publisher/author endpoints checked. Supply and read that proof, fix the fibrewise connected-model convention, verify the smooth cusp section and regular-model hypotheses for every N and all bad primes, and prove the λ(τ/N)/16 formal-coordinate/level-doubling descent. The existing modular-curve and étale π₁ suppliers do not state this arithmetic criterion. ModularCurvesPartII (pull request #913) §11 (R13.5) builds regular resolutions and semistable models for Γ₀ levels at primes p>3 and for the listed mixed and Cartan levels; it is cited as it stands and does not cover X(N) at every prime, including p∣N.

Required by `ModularFormsPartII:W9/cuspal-model`, `ModularFormsPartII:W9/arithmetic-cover-criterion`.

## Source corrections used by the targets

Every description here is a paraphrase. The packet's `printed` field also contains only a paraphrase and is marked accordingly. These observations govern the target statements; they do not assert the existence of a published erratum. Each was checked at its locator by the independent review, whose verdict follows.

**ModularFormsPartII/E1 — misprint, affecting the proof.** CDT25 published offprint; Lemma 4.5.11, second displayed line, p.663 (the same in the arXiv version).

Source wording, paraphrased: The level-five invariant dimension is stated for H¹(Γ(5),𝔽₃) with SL₂(𝔽₅) acting.

Correction: Use 𝔽₅ coefficients, as in the application at ℓ=5 in the proof of Theorem 4.5.2.

Check: Inflation–restriction injects H¹(SL₂(ℤ),𝔽₃)=𝔽₃ into H¹(Γ(5),𝔽₃)^{SL₂(𝔽₅)}, because SL₂(𝔽₅) is perfect, so the printed dimension zero is false over 𝔽₃.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Corrected locator: the misprint is in Lemma 4.5.11 on p.663, not in the proof of Lemma 4.5.6. Over 𝔽₃ the level-five claim fails: inflation–restriction gives an injection H¹(SL₂(ℤ),𝔽₃)=𝔽₃ into H¹(Γ(5),𝔽₃)^{SL₂(𝔽₅)}, since SL₂(𝔽₅) is perfect. The proof of Theorem 4.5.2 uses ℓ=5 at level 5. The lemma is now owned by ModularCurvesPartII §15.9, whose README records the same correction.

**ModularFormsPartII/E4 — misprint, affecting the proof.** CDT25 published offprint; Lemma 4.1.7 proof, second cusp case, p.654.

Source wording, paraphrased: The displayed correcting diagonal has the reciprocal entries reversed.

Correction: Use diag(1/p,p) in the factorization of C; the translation exponent is Np.

Check: Multiplying the preceding matrix by this diagonal gives C=(a/p,b;c,pd) and determinant one.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.654: the displayed C=(A⁻¹BA)·diag(p,1/p) does not have determinant one; right multiplication by diag(1/p,p) gives (a/p,b;c,pd) and the translation exponent np.

**ModularFormsPartII/E5 — misprint, affecting the proof.** CDT25 published offprint; Theorem 4.3.2 proof, p.656.

Source wording, paraphrased: The selected old-level counterexample is placed in R₂Np.

Correction: Select it in R₂N outside M₂N before applying p-scaling.

Check: Theorem 4.3.1 takes the old-level input.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.656: the proof selects f in R₂Np although Theorem 4.3.1 is applied to an element of R₂N.

**ModularFormsPartII/E6 — error, affecting the proof.** CDT25 published offprint; Reduction map preceding Lemma 4.4.4, p.659.

Source wording, paraphrased: The signed-domain reduction kernel is identified with Γ(Np).

Correction: Compute on D=Γ(N)∩Γ₀(p), whose reduction kernel is Γ(Np), then adjoin E for the generation formula.

Check: For N>2, a matrix congruent to −I modulo N and I modulo p lies in the signed kernel but not Γ(Np).

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.659: on ⟨E,Γ(N)⟩∩Γ₀(p) a matrix congruent to −I mod N and to I mod p lies in the reduction kernel but not in Γ(Np) when N≥3. W4 computes on the unsigned domain.

**ModularFormsPartII/E7 — gap, affecting the proof.** CDT25 published offprint; Lemma 4.2.3 proof, p.656.

Source wording, paraphrased: The core of the generator stabilizers is said to have exact geometric level 2N without an added level constraint.

Correction: Intersect also with ⟨E,Γ(2N)⟩ before taking the core.

Check: For R₂=M₂ the basis {1} by itself gives the full-group stabilizer of level one. The additional intersection forces exact level two.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.656: the normal core of the generator stabilizers need not fix ℚ(λ) nor lie in ⟨E,Γ(2N)⟩ (for R₂=M₂ the basis {1} gives SL₂(ℤ)). Intersecting with ⟨E,Γ(2N)⟩ first gives exact level 2N.

**ModularFormsPartII/E10 — error, affecting a stated result.** CDT25 published offprint; E–K relation, §7.4.2, p.693.

Source wording, paraphrased: The elliptic integral is expressed as the negative of the normalized intended expression.

Correction: Use E₀=(1−16x)K₀+8∫₀ˣK₀.

Check: Both normalized integrals have constant coefficient one; the printed right side has constant coefficient minus one.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Recomputed with exact arithmetic: (1−16x)K₀+8∫₀ˣK₀ agrees with ₂F₁(−1/2,1/2;1;16x) through x¹³, and the printed expression is its negative.

**ModularFormsPartII/E11 — gap, affecting the proof.** CDT25 published offprint; Lemma 4.5.6, p.662.

Source wording, paraphrased: The elementary H¹ calculation suppresses the p=2 abelianization proof.

Correction: Compute SL₂(ℤ₂)^ab=C₄ directly before the H² argument.

Check: Deriving it from the final H² lemma would create a dependency cycle.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.662: the proof of Lemma 4.5.6 assumes p>2, so the n=1 claim at p=ℓ=2 is not proved there; SL₂(ℤ₂)^ab≅ℤ/4 supplies it. The lemma is now owned by ModularCurvesPartII §15.9.

**ModularFormsPartII/E12 — error, affecting a stated result.** CDT25 published offprint; Equation (1.1.5), p.631, and (7.2.4), p.688.

Source wording, paraphrased: The theta-square example is treated as weight one with trivial Γ(2) character.

Correction: Retain χ(γ)=χ₋₄(dγ), or restrict to its kernel d≡1 mod4.

Check: −I belongs to Γ(2), but a nonzero odd-weight trivial-character form cannot be invariant under −I.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at pp.631 and 688. Since −I∈Γ(2), a nonzero weight-one form with trivial character on Γ(2) is impossible; θ₃² transforms with χ₋₄(d). The intended meaning is clear, so the result is unaffected in substance.

**ModularFormsPartII/E13 — gap, affecting the proof.** CDT25 published offprint; Local-system construction and Theorem 7.3.3 proof, pp.690–691.

Source wording, paraphrased: Six cosets times the components are asserted to form a free integral rank-6n bundle, and the selected system is treated as irreducible with arithmetic coefficients.

Correction: Use rank-n complex Lρ and the actual continuation space W\_j of dimension at most n; separately prove regular-singular realization, arithmetic descent and minimal-operator compatibility.

Check: Slash translates are constant linear combinations of the original components. For F=1 the scalar equation is f′=0, of rank one. Neither integral freeness nor irreducibility follows.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.690: the slash translates F\_j|γ are constant combinations of F₁,…,F\_n, so their span has rank at most n, and replacing the system by an irreducible one can lose the selected component. W7 constructs the minimal operator of the component by Wronskians instead.

**ModularFormsPartII/E14 — error, affecting a stated result.** CDT25 published offprint; Corollary 7.3.4, p.691.

Source wording, paraphrased: Integrality of all components is used to force a congruence kernel for the full ambient representation.

Correction: Conclude congruence on V\_F; conclude it on the ambient representation only if V\_F=ℂⁿ.

Check: The explicit nonzero example F=(1,0,0),ρ=1⊕σ in W7 has integral coefficients and an invisible infinite-image summand.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Verified: σ(S)=diag(1,−1) and σ(R)=[[2,1],[−7,−3]] satisfy S²=R³=I, σ(T)=[[2,1],[7,3]] has distinct eigenvalues (5±√29)/2, and F=(1,0,0) with ρ=1⊕σ has integral components while ρ has infinite image.

**ModularFormsPartII/E17 — misprint, affecting the proof.** CDT25 published offprint; Second map in §4.4, p.658.

Source wording, paraphrased: Conjugation by diag(p,1) is described as preserving Γ₀(p).

Correction: Its codomain here is the full ⟨E,Γ(N)⟩, and its Γ₀(p) image instead satisfies an upper-right divisibility condition.

Check: The lower unipotent with entry Np is sent to one with entry N, which is outside Γ₀(p) when p∤N.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.658: conjugation by diag(p,1) maps ⟨E,Γ(N)⟩∩Γ₀(p) into ⟨E,Γ(N)⟩∩Γ⁰(p); [[1,0],[Np,1]] goes to [[1,0],[N,1]], which is not in Γ₀(p).

**ModularFormsPartII/E18 — misprint, affecting the proof.** CDT25 published offprint; θ convention and Lemma 7.4.4, pp.692–693.

Source wording, paraphrased: The displayed θ=(1/πi)d/dτ is combined with θΔ=E₂Δ.

Correction: For that θ use θΔ=2E₂Δ and E₂=θΔ/(2Δ), or use D=(1/2πi)d/dτ throughout.

Check: The pinned η logarithmic derivative gives d log Δ/dτ=2πi E₂; Δ starts at q² for q=e^{πiτ}.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at pp.692–693: with q=e^{πiτ}, θ=q d/dq=(1/πi)d/dτ, and Ramanujan's DΔ=E₂Δ for D=(1/2πi)d/dτ gives θΔ=2E₂Δ. The lemma's conclusion is unaffected.

**ModularFormsPartII/E19 — error, affecting a stated result.** CDT25 published offprint; Deficient-place converse, §7.4.8, p.695.

Source wording, paraphrased: A finite deficient place is asserted from noncongruence of the ambient representation alone.

Correction: Require an arithmetic noncongruence component detecting the effective representation, and a local-to-global denominator theorem or finite denominator support.

Check: The definition quantifies arithmetic cuspidal forms; invisible summands supply no witness. Global unbounded denominators do not by themselves identify one unbounded finite place. Counterexample: for ρ=1⊕σ of W7/invisible-summand-test every element of S\_k(ρ) has zero σ-part, because σ(T)^M−1 is invertible, so Σ(ρ)=∅ while ker ρ is not congruence.

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Strengthened to an error: for ρ=1⊕σ of W7/invisible-summand-test, a cuspidal form with rational Puiseux expansion has σ-part g with (σ(T)^M−1)g=0, so g=0; hence Σ(ρ)=∅ although ker ρ is not congruence.

**ModularFormsPartII/E20 — error, affecting a stated result.** CDT25 published offprint; Theta monomial congruence-level assertion, §7.4.2, p.693.

Source wording, paraphrased: One level Γ(12) is proposed for every even-degree theta Laurent monomial.

Correction: Check each multiplier kernel; Γ(12) can be used for the particular displayed quotients only after verification, and is not a universal level for all such monomials.

Check: θ₂θ₃ has degree two but changes sign under T¹²: θ₂(τ+12)=−θ₂(τ), while θ₃(τ+12)=θ₃(τ). T¹² lies in Γ(12).

Correction status: No correction located in the bounded checks on 2026-10-19; the published offprint still has this wording.

Review: confirmed. Checked at p.693 with q=e^{πiτ}: θ₂(τ+12)=−θ₂(τ) and θ₃(τ+12)=θ₃(τ), so θ₂θ₃ is not invariant under T¹²∈Γ(12). The quotients actually used in W8 have the character χ₋₄(d), trivial on Γ(4).

**ModularFormsPartII/E21 — misprint, affecting the proof.** KSV10 arXiv:0905.4798v4, §3, Proposition 3 proof, p.6, factorization of L following equation (1).

Source wording, paraphrased: The further expression of L as a conjugate of a translation uses the two transpose-translation factors in the opposite order.

Correction: For T=[[1,1],[0,1]] and L=[[a,a−1],[1−a,2−a]], use L=(Tᵗ)⁻¹ T^(a−1) Tᵗ.

Check: At a=2 the intended L is [[2,1],[−1,0]], whereas the product in that line is [[0,1],[−1,2]]. Direct multiplication gives the corrected identity. Equation (1) itself has the correct outside exponent.

Correction status: No correction located in the bounded author/arXiv/publisher searches on 2026-10-19. The finding is checked in arXiv v4; the published journal formula was not compared.

Review: confirmed. Checked in arXiv:0905.4798v4 p.6: the printed factorization L=T′T^{a−1}T′⁻¹ fails at a=2; L=(T′)⁻¹T^{a−1}T′ holds by direct multiplication.

**ModularFormsPartII/E22 — misprint, affecting nothing.** CDT25 published offprint; equation (1.0.4) and the following paragraph, p.629.

Source wording, paraphrased: The function h=λ(1−λ)/16 is described as having level Γ₀(2).

Correction: With q=e^{πiτ}, h is invariant under the theta group ⟨Γ(2),S⟩, which is conjugate to Γ₀(2) in SL₂(ℤ) but different from it. The abelianization statements are invariant under conjugation and stand.

Check: S sends λ to 1−λ and fixes h, while T∈Γ₀(2) sends q to −q and changes the sign of the leading term of h=q+⋯.

Correction status: new

Review: confirmed. Added by this review; checked with exact q-series arithmetic.

**ModularFormsPartII/E23 — misprint, affecting nothing.** CDT25 published offprint; Proposition 3.0.1, p.650, and Proposition 4.3.5, p.657.

Source wording, paraphrased: The rank bound is written as C N³ log N for all N.

Correction: Write C N³ log(2N), or restrict to N≥2.

Check: R₂ contains ℚ(λ), so [R₂:ℚ(λ)]≥1 while C·1³·log 1=0; read literally for all integers N, the hypothesis of Proposition 4.3.5 can never hold.

Correction status: new

Review: confirmed. Added by this review.

**ModularFormsPartII/E24 — gap, affecting the proof.** CDT25 published offprint; proof of Proposition 3.0.1, (3.0.5), p.650.

Source wording, paraphrased: R₂N is placed in the larger span V(U,x(t),ℤ), and the dimension of V over ℚ(x^N) is bounded by Corollary 2.0.5 for the nonintegral coordinate x(t)=(λ/16)^{1/N}.

Correction: Bound instead the ℚ(x^N)-span W of H(U,x(t),ℤ). It contains R₂N, because the generators enter H after clearing by integers and by powers of λ/16, both in ℚ(x^N); the corrected rank theorem applies to W.

Check: For a nonintegral coordinate the printed V bound over ℚ(p) can fail by the factor [ℚ(x):ℚ(p)] (DiophantineApproximationAndTranscendencePartII/E1). Here that factor is N, which would spoil the N³log N bound that Proposition 4.3.5 needs.

Correction status: The correction to Corollary 2.0.5 is DiophantineApproximationAndTranscendencePartII/E1; its consequence for Proposition 3.0.1 is new here.

Review: confirmed. Added by this review after reading DiophantineApproximationAndTranscendencePartII AA.4.

## Suggested Lean coverage

[The suggested file](../suggested/ModularFormsPartII.lean) is provisional and nonexhaustive; this document is definitive. It contains light definitions of weak holomorphy (a stand-in for the QSeriesPartitionsAndMockModularForms QM.3 carrier, which is not at the pins), integral Fourier expansion, bounded rational denominators, the actual eta-quotient λ, and the vector slash law over carriers available at the pins. It states selected closure, λ, unbounded-denominator, effective-span and derivative milestones, with representative examples. Its predicates keep analytic cusp-germ and period hypotheses explicit. The vector slash statement uses SL₂ and starts after scalar component modularity; the README's projective and growth hypotheses enter the component theorem before that linear-algebra milestone.

Field-span carriers with their analytic comparison, the imported holonomic spans, the minimal operators of components, the full vector-valued and quasimodular bundles, deficient-place witnesses and arithmetic models are specified above with their complete API and tests. Their construction requires mathematics beyond the pinned carriers and belongs in the implementation directed by this document. They are not replaced by unspecified proposition fields or unimplemented data in the compact prototype. Existing derivatives, theta functions and modular-form carriers remain imports.

## Source and route inventory

The published article is used for the modular targets and applications, with its analytic tools imported from their atlas owners. The elementary signed Wohlfahrt argument has a separate primary source. Page numbers below are the source's printed page numbers; the CDT25 PDF begins at journal page 627. All mathematical statements and source descriptions in this document are written in our own words.

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

The paper extraction is a routing lead, not an independent proof source. All 60 items in its `NoncongruenceModularForms` route are accounted for below. Items whose mathematics another roadmap already plans list that owner's node; Lemma 4.5.12 is not planned here. The questions about logarithmic vector-valued forms, archimedean deficient places and finiteness of deficient-place sets are not asserted as theorems.

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
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.4.1` | `ModularFormsPartII:W4/nonabelian-ihara` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.4.4` | `ModularFormsPartII:W4/triple-surjectivity` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/generation-4.4.9` | `ModularFormsPartII:W4/generation` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/def-4.5.1` | `ModularCurvesPartII:R14.4/congruence-classes` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/completed-h1` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/thm-4.5.2` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/cor-4.5.3` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.4` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.5` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.6-h1` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.6-h2` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.9-isomorphisms` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.9-vanishing` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/diagram-4.5.10` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.11` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.5.12` | not planned (see packet note) |
| `PAPER-CALEGARI-DIMITROV-TANG-25/sl2z-cohomology` | `ModularCurvesPartII:R14.4/congruence-invariance` |
| `PAPER-CALEGARI-DIMITROV-TANG-25/lemma-4.6.3` | `ModularCurvesPartII:R14.4/enhanced-ihara` |
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
