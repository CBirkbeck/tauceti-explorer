# Automorphic L-functions and local factors

The analytic L-function is characterized by its local integrals, their common denominators and their functional equations. This roadmap builds those characterizations from Fourier analysis through Tate's thesis, standard GLₙ factors and Rankin–Selberg factors. It then compares them with unramified L-group factors and supplies the finite Euler corrections used in critical-value and p-adic interpolation formulas. A factor comparison includes its measures, Fourier character, representation normalization and range of analytic validity.

The arithmetic carriers come from GlobalNumberFields and ClassFieldTheory; the restricted adelic products and quotient measures come from AdelesAndIdeles. SmoothRepresentationsOfPadicGroups supplies smooth local representations, nonarchimedean Schwartz functions, normalized Satake theory, derivatives and generic newforms. AutomorphicFormsOnReductiveGroups supplies the archimedean Weil parameters and Casselman–Wallach models, global cuspidal representations, classification and rapid decay. General L-groups belong to ReductiveGroups, Part II; the spherical Satake comparison belongs to IntegralHeckeAndGeometricSatake. ArithmeticDirichletSeries supplies Dirichlet series and convergence criteria. FunctionFieldArithmetic and GlobalShtukasAndLanglands supply cohomological rationality, degrees, duality and purity. General Hadamard product theory belongs to AnalyticNumberTheory.

The local matrix and Whittaker integral comparisons, GLₙ Fourier expansion, and mirabolic Eisenstein series occur here. Isobaric and residual classification and solvable base change are inputs from AutomorphicForms, including its classification extension. Whittaker/cohomological rational structures are hypotheses of the rational-period comparison; that comparison supplies AutomorphicForms' algebraicity layer, so it cannot depend on that layer's final algebraicity theorem. The GL₂/Q period and primitive-character dictionary comes from ModularSymbolsPadicLFunctions. This roadmap compares their analytic factors; period algebraicity and construction of p-adic measures retain their own owners.

## Conventions

A finite local field F has ring of integers O, maximal ideal P, uniformizer ϖ and residue cardinality q. The absolute value satisfies |ϖ|=q⁻¹. At real places it is the usual absolute value; at complex places |z|_ℂ=z z̄. Powers of a positive real norm use exp(s log|x|). The standard rational additive character is exp(2πix) at infinity and exp(−2πi fracₚ(x)) at p. For a completion Kᵥ it is pulled back by the local trace. Its largest trivial fractional ideal is the inverse different P⁻ᵈᵥ.

The source Fourier transform has the positive kernel ψ(xy). Mathlib's vector Fourier transform has the negative kernel ψ(−xy); positive transform at y is negative transform at −y. With self-dual additive measure the square of either transform is reflection. The trace character gives additive volumes μ(O)=q⁻ᵈᵥ⁄², μ_ℝ=dx and μ_ℂ=2 dxdy. Replacing ψ by ψₐ multiplies the self-dual measure by |a|¹⁄².

Tate's finite multiplicative measure is (1−q⁻¹)⁻¹ dx/|x| and gives O× volume q⁻ᵈᵥ⁄². Kudla's finite multiplicative measure gives O× volume 1. The change is a constant at finitely many places; it cancels from normalized local distributions and epsilon ratios, but rescales the global norm-one idele-class volume by √|D_K|. A statement about that global volume must choose one convention.

All standard GLₙ representations and Satake roots use unitary normalization, with normalized parabolic induction containing δ_B¹⁄². Write Γ_ℝ(s)=π⁻ˢ⁄²Γ(s/2) and Γ_ℂ(s)=2(2π)⁻ˢΓ(s). A real character sgnᵃ|·|ᵗ has canonical factor Γ_ℝ(s+t+a); a complex character (z/|z|)ᵏ|·|_ℂᵗ has Γ_ℂ(s+t+|k|/2). Kudla's complex Gaussian integral is πΓ_ℂ(s), and his nonunitary normal form x⁻ᵃ has a different parameter shift from sgnᵃ. These distinctions persist in every comparison.

An Euler product is first used in its absolute-convergence half-plane. A continued L-function is then characterized as a meromorphic function. A displayed equality at a pole is a meromorphic identity, not an equality of totalized finite values. The normalized integral at a singular point is the value of its proved entire continuation. For function fields the variable z is formal before rationality is proved; specialization z=q⁻ˢ follows afterward.

## AL.0 — Fourier and Schwartz–Bruhat analysis

This layer connects Mathlib's additive characters, subgroup carriers, Schwartz maps, tempered distributions and Fourier integrals to local-field and adelic conventions. At a finite place compact-open support and period levels reduce Fourier inversion to indicators of lattice cosets. At infinity native Schwartz-map Fourier theory is transported through the real or complex trace pairing. Parameter estimates retain a strict convergence margin on compact parameter sets. The Bessel and partial Fourier interfaces provide the normalizations used by Gross–Zagier and arithmetic orbital integrals.

### Annihilator for a bilinear character pairing

**Declaration.** TauCeti.LocalFourier.pairingAnnihilator (AutomorphicLFunctionsAndLocalFactors:AL.0/pairing-annihilator).

**Construction.** Construct U⊥={w∈W | ψ(L(u,w))=1 for every u∈U} as an AddSubgroup W. It is generally not an R-submodule. Its data is exactly this carrier and the inherited additive subgroup operations.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data.

**Public interface.**

- TauCeti.LocalFourier.pairingAnnihilator_bot: The annihilator of the zero additive subgroup is the full subgroup W.
- TauCeti.LocalFourier.pairingAnnihilator_zero: For the zero bilinear pairing the annihilator of every U is W.
- TauCeti.LocalFourier.pairingAnnihilator_antitone: U⊆U′ implies (U′)⊥⊆U⊥ for the same ψ and L.
- TauCeti.LocalFourier.pairingAnnihilator_comap: For a linear T:W′→W, the annihilator for (v,w′)↦L(v,Tw′) equals the native comap of U⊥ along T. This uses native LinearMap.compl₂.

**Discriminating examples.**

- TauCeti.LocalFourier.pairingAnnihilator_zmod_two: For R=V=W=Z/2, the standard ZMod.toCircle character, multiplication pairing and U=V, the annihilator is zero.
- TauCeti.LocalFourier.pairingAnnihilator_trivial_character: For ψ=1 and every L,U, the annihilator is W.
- TauCeti.LocalFourier.pairingAnnihilator_zmultiples_eq_kernel: For V=W=R, multiplication pairing and U the additive subgroup generated by 1, U⊥ equals the native kernel of ψ.toAddMonoidHom. U cannot be replaced by all of R in this assertion.
- TauCeti.LocalFourier.pairingAnnihilator_not_real_submodule: For R=V=W=R-real, ψ(x)=exp(2πix), multiplication pairing and U=Z·1, the annihilator contains 1 and does not contain 1/2. Thus it is not stable under real scalar multiplication.

**Uses.** Tate §2.5, physical p.24: Express the frequencies on which a subgroup indicator has nonzero transform and the translated frequency support of its modulations. Kudla 2004 p.122; AL.0 and MetaplecticAutomorphicForms:MP.0: Track the support and measure factors in nonarchimedean Schwartz-function and oscillator-model Fourier calculations. FunctionFieldArithmetic:FA.2: Reuse the same local pairing calculation for residue characters after that owner supplies its local-field and global-residue constructions.

**Direct inputs.** mathlib:AddChar; mathlib:AddChar.map_zero_eq_one; mathlib:AddChar.map_add_eq_mul; mathlib:LinearMap.compl₂; mathlib:AddChar.toAddMonoidHom; mathlib:ZMod.toCircle; mathlib:ZMod.injective_toCircle; mathlib:Real.fourierChar; mathlib:Subgroup.zpowers.

**Proof route.** Use the displayed carrier inside the existing AddSubgroup type. For zero use bilinearity and AddChar.map_zero_eq_one; for addition use bilinearity and AddChar.map_add_eq_mul; for negation use the additive-character inverse identity obtained from ψ(x+−x)=1. No analytic or duality theorem is used.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Membership in the character annihilator

**Declaration.** TauCeti.LocalFourier.mem_pairingAnnihilator (AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator).

**Lemma.** For every w, w∈U⊥ if and only if ψ(L(u,w))=1 for all u∈U.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/pairing-annihilator.

**Acceptance checks.** At w=0 every character value is one.

**Proof route.** Unfold only the carrier field of pairingAnnihilator. Export this as a separate lemma because the remaining nodes use it.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Closedness of the character annihilator

**Declaration.** TauCeti.LocalFourier.isClosed_pairingAnnihilator (AutomorphicLFunctionsAndLocalFactors:AL.0/closed-annihilator).

**Lemma.** If W is a topological space and w↦ψ(L(v,w)) is continuous for each v∈V, then U⊥ is closed in W.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. W is topological; each displayed one-variable circle-valued map is continuous.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator; mathlib:isClosed_eq; mathlib:isClosed_iInter.

**Acceptance checks.** For the real pairing and U=Z, U⊥ is closed but not open; this theorem alone gives no openness.

**Proof route.** By mem-pairing-annihilator express U⊥ as the intersection over u∈U of the equality loci ψ(L(u,w))=1. Each locus is closed by isClosed_eq, since Circle is Hausdorff. Apply isClosed_iInter.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Openness of a compact subgroup annihilator

**Declaration.** TauCeti.LocalFourier.isOpen_pairingAnnihilator (AutomorphicLFunctionsAndLocalFactors:AL.0/open-annihilator).

**Theorem.** Suppose V,W are topological spaces, U is compact as a subset of V, and (v,w)↦ψ(L(v,w)) is jointly locally constant. Then U⊥ is open in W.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V,W are topological; U is compact; the joint circle-valued pairing is IsLocallyConstant.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator; mathlib:IsLocallyConstant.isOpen_fiber; mathlib:generalized_tube_lemma.

**Acceptance checks.** Over a finite discrete module the hypothesis holds for every pairing. The real character is not locally constant, so the Z⊂R example does not satisfy these hypotheses.

**Proof route.** The fiber of 1 under the joint pairing is open by IsLocallyConstant.isOpen_fiber. For w∈U⊥, the compact product U×{w} lies in that fiber by the membership lemma. Apply generalized_tube_lemma to obtain an open neighborhood O of w with U×O in the fiber. Every point of O belongs to U⊥; openness follows from its pointwise open neighborhoods. This proof does not take an infinite intersection of open sets.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), p.115, local constancy and compact support; p.122, Fourier transforms.

### Fourier vanishing from a nontrivial period

**Declaration.** TauCeti.LocalFourier.fourierIntegral_eq_zero_of_period (AutomorphicLFunctionsAndLocalFactors:AL.0/vanishing-from-period).

**Lemma.** If f(v+u)=f(v) for every v and ψ(L(u,w))≠1, then Ff(w)=0.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition.

**Direct inputs.** mathlib:VectorFourier.fourierIntegral_comp_add_right.

**Acceptance checks.** For the constant function on Z/2 and counting measure, the transform at the nonzero frequency is zero.

**Proof route.** Apply native fourierIntegral_comp_add_right to the supplied period u and rewrite its left side using the period hypothesis. The resulting equality z=ψ(L(u,w))•z in C forces z=0, because the circle scalar has complex value different from 1.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Fourier support lies in the period annihilator

**Declaration.** TauCeti.LocalFourier.support_fourierIntegral_subset (AutomorphicLFunctionsAndLocalFactors:AL.0/fourier-support).

**Lemma.** If every u∈U is a period of f, then ordinary support(Ff)⊆U⊥.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator; AutomorphicLFunctionsAndLocalFactors:AL.0/vanishing-from-period.

**Acceptance checks.** For U=0 the conclusion is support(Ff)⊆W, imposing no false compactness.

**Proof route.** Outside U⊥, the membership lemma gives some u∈U with nontrivial phase. Apply vanishing-from-period. This controls ordinary support; compactness of its closure is a separate node.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Fourier transform of a subgroup indicator

**Declaration.** TauCeti.LocalFourier.fourierIntegral_indicator (AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-transform).

**Theorem.** If U is measurable, then F(1_U)=μ.real(U)·1_(U⊥). The theorem uses native totalized Bochner integrals. On finite-measure compact-open U with continuous pairing it is the usual convergent Fourier calculation.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. U is measurable. No unit-volume assumption and no self-duality identification are imposed.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator; AutomorphicLFunctionsAndLocalFactors:AL.0/fourier-support; mathlib:VectorFourier.fourierIntegral; mathlib:MeasureTheory.integral_indicator_const; mathlib:MeasureTheory.integral_congr_ae.

**Acceptance checks.** For U=Z/2 and counting measure, the result is twice the indicator of {0}. For μ=0 both sides vanish. If μ(U)=∞, μ.real(U)=0; this is only the native totalized identity, not a convergence assertion.

**Proof route.** At w∈U⊥, the Fourier integrand equals 1_U pointwise; use membership and the character inverse identity. Apply integral_indicator_const to obtain μ.real(U). At w∉U⊥, 1_U has every u∈U as a period by subgroup membership. Apply fourier-support to obtain zero. Combine the two cases as the displayed equality of functions.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Fourier transform of a coset indicator

**Declaration.** TauCeti.LocalFourier.fourierIntegral_coset_indicator (AutomorphicLFunctionsAndLocalFactors:AL.0/coset-transform).

**Lemma.** For measurable U and a∈V, the transform of v↦1_U(v−a) equals w↦ψ(−L(a,w))·μ.real(U)·1_(U⊥)(w).

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. U is measurable; a∈V.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-transform; mathlib:VectorFourier.fourierIntegral_comp_add_right.

**Acceptance checks.** For counting measure on Z/4, the indicator of {1} transforms at frequency 1 to −i, not +i.

**Proof route.** Apply native translation covariance with translation parameter −a. Substitute indicator-transform and bilinearity L(−a,w)=−L(a,w). The phase has a minus sign because the input uses v−a.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Fourier transform of a character modulation

**Declaration.** TauCeti.LocalFourier.fourierIntegral_modulation (AutomorphicLFunctionsAndLocalFactors:AL.0/modulation).

**Lemma.** For every w₀, the transform of v↦ψ(L(v,w₀))·f(v) equals w↦Ff(w−w₀). No invariance of μ is needed.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

**Direct inputs.** mathlib:VectorFourier.fourierIntegral; mathlib:AddChar.map_add_eq_mul; mathlib:MeasureTheory.integral_congr_ae.

**Acceptance checks.** For counting measure on Z/3, the standard character transforms to 3 times the indicator of frequency 1, rather than frequency −1.

**Proof route.** Expand the native Fourier integrand. Combine the two character values using AddChar.map_add_eq_mul and scalar associativity. Bilinearity gives −L(v,w)+L(v,w₀)=−L(v,w−w₀); the integrands agree pointwise, so apply integral_congr_ae.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Frequency periods from support containment

**Declaration.** TauCeti.LocalFourier.fourierIntegral_add_of_support (AutomorphicLFunctionsAndLocalFactors:AL.0/frequency-periods).

**Lemma.** If ordinary support(f)⊆U and a∈U⊥, then Ff(w+a)=Ff(w) for all w. No invariance of μ is needed.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator; mathlib:VectorFourier.fourierIntegral; mathlib:AddChar.map_add_eq_mul; mathlib:MeasureTheory.integral_congr_ae.

**Acceptance checks.** If f is supported at zero, its Fourier integral is constant in the frequency, consistent with U=0 and U⊥=W.

**Proof route.** Compare the two integrands. Off U the value f(v) is zero by the support hypothesis. On U, the membership lemma gives ψ(L(v,a))=1, so the extra phase is one. Use bilinearity, the character addition identity and integral_congr_ae.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation.

### Local constancy of the Fourier transform

**Declaration.** TauCeti.LocalFourier.isLocallyConstant_fourierIntegral (AutomorphicLFunctionsAndLocalFactors:AL.0/locally-constant-transform).

**Theorem.** Suppose V is topological, W is a topological additive group, U is compact, the joint character pairing is locally constant, and support(f)⊆U. Then Ff is locally constant.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. W is an IsTopologicalAddGroup; U is compact in V; the joint pairing is locally constant.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/open-annihilator; AutomorphicLFunctionsAndLocalFactors:AL.0/frequency-periods; mathlib:IsLocallyConstant.iff_exists_open.

**Acceptance checks.** For a finite discrete group this recovers local constancy of every finite Fourier transform. The assertion requires a compact subgroup containing the support, not merely an arbitrary compact support set.

**Proof route.** Apply open-annihilator to see that U⊥ is open. By frequency-periods, Ff is constant on every additive coset w+U⊥. Translation in the topological group makes this coset an open neighborhood of w. Apply IsLocallyConstant.iff_exists_open.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), p.122, Fourier transforms of Schwartz–Bruhat functions.

### Compact support from a compact period annihilator

**Declaration.** TauCeti.LocalFourier.hasCompactSupport_fourierIntegral (AutomorphicLFunctionsAndLocalFactors:AL.0/compact-support-transform).

**Theorem.** If W is Hausdorff, every u∈U is a period of f, and U⊥ is compact, then Ff has compact support in the native sense.

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. W is a Hausdorff topological space; U⊥ is compact. This compactness is an explicit input, not inferred from openness of U.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/fourier-support; mathlib:HasCompactMulSupport.of_mulSupport_subset_isCompact.

**Acceptance checks.** A trivial character on a noncompact W has U⊥=W; the required compactness does not follow from compactness or openness of U.

**Proof route.** Apply fourier-support. Use the generated additive counterpart of HasCompactMulSupport.of_mulSupport_subset_isCompact: the closure of a subset of a compact set is compact in a Hausdorff space.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), p.122, Fourier transforms of Schwartz–Bruhat functions.

### Fourier inversion for a subgroup indicator

**Declaration.** TauCeti.LocalFourier.fourierIntegral_fourierIntegral_indicator (AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-inversion).

**Theorem.** Put A=U⊥. Suppose U and A are measurable, μ on V and ν on W are translation invariant, the annihilator of A for the transposed pairing equals U, and μ.real(U)ν.real(A)=1. Then F_(ν,Lᵗ)(F_(μ,L)(1_U))(v)=1_U(−v).

**Hypotheses and conventions.** R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. W has measurable addition and ν is right-translation invariant. U,A are measurable. The double-annihilator equality and the volume-product equality are supplied explicitly.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-transform; mathlib:VectorFourier.fourierIntegral_const_smul; mathlib:LinearMap.flip.

**Acceptance checks.** Counting measure on both copies of Z/2 has volume product 2, so its double transform is 2f(−v), not f(−v). For U=Z/2, μ=count and ν=(1/2)count, the hypotheses give the correctly normalized indicator identity. This is not a proof of Fourier inversion for every Schwartz function or existence/uniqueness of self-dual Haar measure.

**Proof route.** Apply indicator-transform to U. Rewrite its output as the complex scalar μ.real(U) times 1_A. Use native fourierIntegral_const_smul, then apply indicator-transform to A with L.flip and ν. Rewrite the double annihilator as U and the product of real volume factors as 1. A subgroup contains v iff it contains −v, giving the reflected indicator.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), p.122, self-dual measure and Fourier inversion.

### The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions

**Declaration.** TauCeti.SchwartzBruhat.LocalSpace (AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space).

**Definition.** For F nonarchimedean, S(F) is the complex vector space of functions f : F → ℂ for which there is r ≥ 0 with supp f ⊆ P^{−r} and f constant on cosets of P^r (SR.1's locally constant compactly supported carrier over ℂ); S(F)′ is its algebraic dual. For F = ℝ, ℂ, S(F) is Mathlib's Schwartz space 𝓢(F, ℂ) (F viewed as a real vector space) and S(F)′ = 𝓢′(F, ℂ) is Mathlib's TemperedDistribution. F^× acts by r(a)f(x) = f(xa) and on distributions by ⟨r′(a)λ, f⟩ = ⟨λ, r(a^{−1})f⟩. δ₀ is ⟨δ₀, f⟩ = f(0).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Kudla p. 115: tempered distributions at a finite place are arbitrary ℂ-linear functionals; at ℝ, ℂ they are the continuous functionals on the Fréchet space.

**Public interface.**

- TauCeti.SchwartzBruhat.LocalSpace: S(F): SR.1's carrier for F nonarchimedean, 𝓢(F, ℂ) for F = ℝ, ℂ.
- TauCeti.SchwartzBruhat.LocalSpace.act: r(a)f(x) = f(xa), a group action of F^× by linear maps.
- TauCeti.SchwartzBruhat.LocalSpace.act_apply: (r(a)f)(x) = f(xa).
- TauCeti.SchwartzBruhat.LocalSpace.Dual: S(F)′: algebraic dual (finite place) or 𝓢′(F, ℂ) (infinite place), with r′.
- TauCeti.SchwartzBruhat.LocalSpace.delta: δ₀, agreeing with TemperedDistribution.delta 0 at infinite places.
- TauCeti.SchwartzBruhat.LocalSpace.mem_iff_nonarch: f ∈ S(F) iff ∃ r, supp f ⊆ P^{−r} ∧ f is P^r-periodic.

**Discriminating examples.**

- TauCeti.SchwartzBruhat.LocalSpace.indicator_integers_mem: 1_O ∈ S(F) with r = 0; 1_{O^×} ∈ S(F) with r = 1.
- TauCeti.SchwartzBruhat.LocalSpace.gaussian_mem: e^{−πx²} ∈ S(ℝ) and e^{−2πxx̄} ∈ S(ℂ).
- TauCeti.SchwartzBruhat.LocalSpace.delta_invariant: r′(a)δ₀ = δ₀ for all a ∈ F^×.
- TauCeti.SchwartzBruhat.LocalSpace.const_not_mem: The constant function 1 on F is not in S(F): its support is not compact (finite place) and it does not decay (ℝ).

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1: the domain of the local zeta integrals z(s, ω; f) and of the eigendistribution spaces S′(ω) AutomorphicLFunctionsAndLocalFactors:AL.2: the matrix-space Schwartz functions of Godement–Jacquet generalise S(F) = S(M_1(F))

**Direct inputs.** SmoothRepresentationsOfLocalGroups:SR.1; mathlib:SchwartzMap; mathlib:TemperedDistribution; mathlib:TemperedDistribution.delta; AutomorphicLFunctionsAndLocalFactors:AL.0/locally-constant-transform.

**Proof route.** Nonarchimedean: take SR.1's carrier on the additive group of F; the characterisation "support in P^{−r}, constant on P^r-cosets" is the AL.0 remaining item (compact open subgroups P^r form a basis and exhaust F). Archimedean: use 𝓢(F, ℂ) and 𝓢′(F, ℂ); r(a) is composition with the real-linear automorphism x ↦ xa, which preserves 𝓢. r is a representation (r(ab) = r(a)r(b), since F^× is commutative) and r′ is its contragredient.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, printed p. 115 (physical p. 7).

### The standard additive character

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter (AutomorphicLFunctionsAndLocalFactors:AL.0/standard-additive-character).

**Definition.** Fix ψ_Q,∞(x)=exp(2πix) and ψ_Q,p(x)=exp(−2πi frac_p(x)); on a completion K_v use ψ_v=ψ_Q,w∘Tr_{K_v/Q_w}. Their restricted product is trivial on the diagonal K. The finite conductor is the inverse different D_v^(−1)=P_v^(−d_v), while the archimedean characters are exp(2πix) and exp(2πi(z+z̄)).

**Hypotheses and conventions.** K number field; frac_p(x) denotes the rational p-primary part modulo Z. These are Kudla’s positive infinity characters, the inverse of Tate’s opposite global choice.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.trace: ψ_v(x)=ψ_Q,w(Tr x).
- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.conductor: The largest trivial fractional ideal is P^(−d_v).
- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.diagonal: ∏_vψ_v(a)=1 for a∈K.
- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.nontrivial: Each ψ_v is continuous and nontrivial.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.rational_unramified: For Q_p the different exponent is0 and ψ is trivial on Z_p but not p^(−1)Z_p.
- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.real_one: ψ_R(1)=1 and ψ_R(1/2)=−1.
- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.complex_imaginary: ψ_C(i)=1 although i≠0; nontriviality does not mean an injective character.

**Uses.** AL.0/self-dual-haar: Fix the arithmetic character used for Fourier normalization. AL.1/global-epsilon-factor: Use diagonal triviality to prove global character independence.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/pairing-annihilator; mathlib:AddChar.compAddMonoidHom.

**Proof route.** Import finite local traces, inverse different and the adele diagonal from GlobalNumberFields. Define the trace pullback of the actual continuous character; conductor follows from the trace-dual lattice identity. The rational product formula and trace transitivity give diagonal triviality.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3 (3.30), §4 global character; Tate §2.2.

### The additive local-field duality map

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap (AutomorphicLFunctionsAndLocalFactors:AL.0/additive-duality-map).

**Definition.** For a local field F and continuous nontrivial additive character ψ, define ι_ψ(y)(x)=ψ(xy), taking values in native PontryaginDual(Multiplicative F). It is a continuous group homomorphism from Multiplicative F. The local-field self-duality theorem upgrades this particular map to a topological group isomorphism.

**Hypotheses and conventions.** Use multiplication in F and compact-open topology on the native continuous-character group; do not replace the dual by a new carrier.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.apply: ι_ψ(y)(x)=ψ(xy).
- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.add: ι_ψ(y+z)=ι_ψ(y)ι_ψ(z).
- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.scale_character: ι_(ψ_a)(y)=ι_ψ(ay).
- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.annihilator: ι_ψ identifies the native character annihilator of U with pairingAnnihilator ψ mul U.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.zero: ι_ψ(0) is the trivial character.
- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.real_half: For ψ_R and y=1/2, the character has value−1 at x=1.
- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.finite_field_two: Over F₂ with the nontrivial character, the map identifies the two elements with the two characters.
- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.trivial_character: For trivial ψ the map is constant and cannot be a duality isomorphism.

**Uses.** AL.0/local-additive-self-duality: Use the actual map in the self-duality theorem. AL.0/pairing-annihilator: Compare lattice annihilators with character annihilators.

**Direct inputs.** mathlib:PontryaginDual; mathlib:AddChar; mathlib:ContinuousMonoidHom; AutomorphicLFunctionsAndLocalFactors:AL.0/standard-additive-character.

**Proof route.** Currying the jointly continuous field product and ψ gives a continuous character for each y. Use additivity of ψ to obtain the group-homomorphism law in y. Apply compact-open continuity for the parameterized character map.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.2 local self-duality.

### Self-duality of a local additive group

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.LocalAdditiveSelfDuality (AutomorphicLFunctionsAndLocalFactors:AL.0/local-additive-self-duality).

**Theorem.** For F=R,C or a nonarchimedean local field, a continuous nontrivial additive ψ gives a bijective ι_ψ:F→PontryaginDual(Multiplicative F), and its inverse is continuous. Thus open-lattice annihilators are compact and their double annihilators equal the original lattice.

**Hypotheses and conventions.** Nonarchimedean F includes the stated completions; topology is compact-open, not a discrete character set.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/additive-duality-map; AutomorphicLFunctionsAndLocalFactors:AL.0/fractional-ideal-annihilator.

**Acceptance checks.** For R the character y=1/2 evaluates to−1 at x=1. A trivial additive character makes the map constant and cannot give an isomorphism.

**Proof route.** At R and C classify continuous characters and compare the trace pairing. At a finite place use fractional-ideal annihilators and duals of finite lattice quotients; compatible quotient characters reconstruct a unique field element. Establish continuity of the inverse from the compact-open neighbourhoods defined by compact lattices. Tate invokes general LCA duality; a complete finite-place inverse proof is a recorded refinement.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.2 additive local-field duality.

### The trace annihilator of a fractional ideal

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.FractionalIdealAnnihilator (AutomorphicLFunctionsAndLocalFactors:AL.0/fractional-ideal-annihilator).

**Theorem.** For the trace character ψ_v and fractional ideal A=P^m, A⊥={y:∀x∈A,ψ_v(xy)=1}=P^(−m−d_v). Consequently (A⊥)⊥=A and every such annihilator is compact open.

**Hypotheses and conventions.** Nonarchimedean completion of a number field; inverse different exponent d_v.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/standard-additive-character; AutomorphicLFunctionsAndLocalFactors:AL.0/pairing-annihilator.

**Acceptance checks.** For d=0, O⊥=O; for d=2, O⊥=P⁻². Applying the exponent transformation m↦−m−d twice returns m.

**Proof route.** Identify the character kernel on trace pairings with the trace-dual ideal. Use D^(−1)A^(−1) and the valuation description of fractional ideals. Apply the same formula twice; use the imported topology of local fractional ideals.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.2–2.3, trace-dual ideal calculation.

### Self-dual local additive Haar measure

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar (AutomorphicLFunctionsAndLocalFactors:AL.0/self-dual-haar).

**Definition.** The ψ_v-self-dual additive Haar is normalized by μ(O)=q^(−d_v/2), μ_R=dx and μ_C=2 dxdy for the standard trace characters. For ψ_a(x)=ψ(ax), μ_{ψ_a}=|a|^(1/2)μ_ψ. For A=P^m, μ(A)μ(A⊥)=1. This additive normalization is distinct from prescribing multiplicative O×-volume1.

**Hypotheses and conventions.** a∈F×; Haar positive; d_v is the trace different exponent.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.unit_volume: μ(O)=q^(−d/2).
- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.dual_volume: μ(A)μ(A⊥)=1.
- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.character_scale: Changing ψ to ψ_a multiplies μ by |a|^(1/2).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.unramified: d=0 gives μ(O)=1.
- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.different_two: d=2 gives μ(O)=q^(−1), and μ(P^(−2))=q.
- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.scaled_character: For |a|=q^(−1), the new Haar is q^(−1/2)μ, not q^(−1)μ.
- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.complex_trace: The complex trace pairing needs2 dxdy, not dxdy.

**Uses.** AL.1/local-gauss-sum: The q^((ν+c)/2) factor uses this additive measure. AL.0/local-fourier-inversion: Supply the dual-volume hypothesis of the inherited Fourier component.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/fractional-ideal-annihilator; AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-inversion; AdelicAlgebraicGroups:AA.0/local-normalized-haar.

**Proof route.** Scale any additive Haar using the positive compact-open volume. Combine the annihilator formula with μ(P^m)=q^(−m)μ(O). Finite lattice Fourier inversion fixes the square-root normalization; at infinity compare standard Gaussian Fourier transforms.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3 Fourier inversion, (3.29)–(3.30); Tate §2.2.

### Finite-place Schwartz levels

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.FiniteSchwartzPeriodLevel (AutomorphicLFunctionsAndLocalFactors:AL.0/finite-schwartz-period-level).

**Theorem.** A locally constant compactly supported complex function on a nonarchimedean local field is supported in P^(−M) and invariant under translation by P^N for some integers M,N. Thus it is a finite linear combination of coset indicators on P^(−M)/P^N, where N≥−M.

**Hypotheses and conventions.** Import SR.1’s generic carrier; the ambient group is an actual local field, not an arbitrary LCA group.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.0/coset-transform; AutomorphicLFunctionsAndLocalFactors:AL.0/fractional-ideal-annihilator.

**Acceptance checks.** The O indicator has support and period level0. The indicator of a coset in P⁻ᴹ/Pᴺ is allowed only with N≥−M; this ensures a finite quotient.

**Proof route.** Use compact support and a finite cover by balls on which the function is constant. Take a common sufficiently small period ball; outside a compact-open containing support the function is zero. Use boundedness of compact subsets in a local field and the finite lattice quotient to expand in cosets.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, p.115, finite Schwartz description.

### Finite-place Schwartz Fourier inversion

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.FiniteFourierInversion (AutomorphicLFunctionsAndLocalFactors:AL.0/finite-fourier-inversion).

**Theorem.** The Fourier transform carries SR.1’s finite-place Schwartz carrier into itself and its square is f(x)↦f(−x), with the self-dual Haar. For the positive kernel use F⁺f(x)=F⁻f(−x) where F⁻ is the native transform with the same ψ.

**Hypotheses and conventions.** Every function has a finite coset decomposition; the actual integrals are integrable.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/finite-schwartz-period-level; AutomorphicLFunctionsAndLocalFactors:AL.0/self-dual-haar; AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-inversion; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.

**Acceptance checks.** At a place with different exponent2, the indicator O transforms to q⁻¹ times the indicator P⁻² and transforms back to1_O. For a translated indicator the second transform reflects the translate; it does not return the same translate without reflection.

**Proof route.** Use the finite period-level description to reduce to coset indicators. Apply the inherited negative-phase coset calculation and dual lattice volumes. Extend by finite linearity justified by integrability; prove the positive/negative comparison explicitly.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, p.122, Fourier inversion.

### Archimedean Schwartz Fourier comparison

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.ArchimedeanFourierComparison (AutomorphicLFunctionsAndLocalFactors:AL.0/archimedean-fourier-comparison).

**Theorem.** At R use native SchwartzMap Fourier with the positive source transform F⁺f(ξ)=F⁻f(−ξ). At C identify C≃R² and the trace pairing Tr(zw)=2(Re z Re w−Im z Im w); with self-dual2dxdy, F⁺ preserves SchwartzMap and F⁺²f(x)=f(−x). The Gaussian exp(−2π|z|²) is fixed by this transform.

**Hypotheses and conventions.** The complex absolute value for Tate is|z|²; the native Euclidean norm remains|z|. The trace pairing differs from the Hermitian inner product.

**Direct inputs.** mathlib:SchwartzMap.fourierTransformCLM; mathlib:fourierIntegral_gaussian; AutomorphicLFunctionsAndLocalFactors:AL.0/self-dual-haar.

**Acceptance checks.** The real Gaussian exp(−πx²) and complex Gaussian exp(−2π|z|²) are fixed in their stated self-dual measures. Using dxdy rather than2dxdy at C introduces an erroneous factor1/2.

**Proof route.** Use native real-vector-space Schwartz Fourier preservation and inversion. Change the real coordinates by the trace-pairing matrix diag(2,−2). Apply the determinant Jacobian and positive/negative reflection comparison; compute the Gaussian.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3 archimedean Fourier normalization.

### Local Fourier transform, self-dual measure and inversion on S(F)

**Declaration.** TauCeti.SchwartzBruhat.fourier_fourier (AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion).

**Theorem.** Fix a nontrivial additive character ψ of F and identify F with its dual by y ↦ (x ↦ ψ(xy)). For f ∈ S(F), f̂(x) = ∫_F f(y)ψ(xy)dy lies in S(F), and f ↦ f̂ is a linear isomorphism of S(F). There is a unique Haar measure dx, the self-dual measure for ψ, with f̂̂(x) = f(−x). For β ∈ F^× and ψ_β(x) = ψ(βx), the self-dual measure for ψ_β is |β|^{1/2}dx, and the ψ_β-transform of f is |β|^{1/2}r(β)f̂. For F nonarchimedean the conductor ν(ψ) is the largest ν with ψ trivial on P^{−ν}. Distributions: ⟨λ̂, f⟩ = ⟨λ, f̂⟩.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Kudla's convention ψ(x) = e(x) = e^{2πix} on ℝ and e(x + x̄) on ℂ (3.30) has positive sign; Mathlib's 𝓕 uses e^{−2πi⟨x, w⟩}, so f̂_Kudla(x) = 𝓕f(−x) at ℝ, and at ℂ one also rescales by 2 through the trace pairing.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-transform; AutomorphicLFunctionsAndLocalFactors:AL.0/coset-transform; AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-inversion; mathlib:SchwartzMap.fourierTransformCLM; mathlib:fourierIntegral_gaussian; mathlib:Real.fourierChar.

**Acceptance checks.** Check that the Gaussian is self-dual at ℝ: e^{−πx²} is its own transform for ψ = e(x) (Tate p. 20; Mathlib fourierIntegral_gaussian). Check that 1_O is self-dual when ν(ψ) = 0 (Kudla p. 124) and that for ν(ψ) = 0 the transform of 1_{P^r} is q^{−r}1_{P^{−r}}.

**Proof route.** Nonarchimedean: every f ∈ S(F) is a finite combination of coset indicators 1_{a + P^r}; their transforms are computed by the existing AL.0 nodes (indicator-transform, coset-transform) and inverted by indicator-inversion, and the self-dual volume is fixed by the double-annihilator equality (P^r)^⊥ = P^{−r−ν}. Archimedean: transport Mathlib's Schwartz Fourier transform and its inverse along the sign and trace conventions; Lebesgue measure (resp. twice Lebesgue on ℂ) is self-dual for e(x) (resp. e(x + x̄)). Change of character: substitute y ↦ β^{−1}y in the defining integral and use the uniqueness of the self-dual measure.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "Fourier transforms", printed p. 122 (physical p. 14).

### Domination for Schwartz parameter integrals

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.SchwartzParameterDomination (AutomorphicLFunctionsAndLocalFactors:AL.0/schwartz-parameter-domination).

**Theorem.** A holomorphic Schwartz-valued family bounded in the relevant Schwartz seminorms on every compact parameter set gives locally uniform integrable bounds for its Mellin or Fourier parameter derivatives in the stated convergence strip. Hence integration and parameter differentiation commute there. For Mellin families, endpoint power exponents must leave a strict margin around the compact s-set.

**Hypotheses and conventions.** Use native SchwartzMap on finite-dimensional real spaces; a mere pointwise holomorphic family is insufficient.

**Direct inputs.** mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le; mathlib:mellin_differentiableAt_of_isBigO_rpow; AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space.

**Acceptance checks.** A compact order-parameter set in the K integral remains dominated after insertion of every fixed power of log u. Endpoint Mellin exponents equal to the edge of a compact s-set do not supply the strict margin needed by the differentiation theorem.

**Proof route.** Bound all needed derivatives by a common Schwartz seminorm on the compact parameter set. Split the Mellin integral at1; use a strict power margin to absorb logarithmic derivatives. Apply the checked native dominated differentiation and Mellin strip theorem.

**Source.** [Hervé Jacquet, Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), §2 analytic families and §3 compact-parameter estimates.

### Tempered distributions supported at a point

**Declaration.** TauCeti.SchwartzBruhat.eq_sum_deriv_delta_of_dsupport_subset (AutomorphicLFunctionsAndLocalFactors:AL.0/point-supported-distributions).

**Theorem.** Let E = ℝⁿ. A tempered distribution λ ∈ 𝓢′(E, ℂ) with dsupport λ ⊆ {0} is a finite linear combination Σ_{|α|≤N} c_α ∂^αδ₀. For n = 1 (F = ℝ) the F^×-finite ones are ⊕_k ℂ·D^kδ₀; for n = 2 written in x, x̄ (F = ℂ) they are ⊕_{k,l} ℂ·D^kD̄^lδ₀, D = ∂/∂x, D̄ = ∂/∂x̄.

**Hypotheses and conventions.** E = ℝⁿ with Mathlib's 𝓢(E, ℂ), 𝓢′(E, ℂ) = TemperedDistribution and dsupport.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; mathlib:TemperedDistribution; mathlib:TemperedDistribution.delta; mathlib:Distribution.dsupport; mathlib:SchwartzMap.

**Acceptance checks.** Check that δ₀ has dsupport {0} (Mathlib dsupport_delta) and that Dδ₀ is not a multiple of δ₀.

**Proof route.** Continuity on 𝓢 bounds |λ(f)| by finitely many seminorms, so λ has finite order N. If ∂^αf(0) = 0 for |α| ≤ N, then λ(f) = 0: approximate f by (1 − χ(x/ε))f with a cutoff χ equal to 1 near 0; the error is O(ε) in the order-N seminorms. Hence λ factors through the jet f ↦ (∂^αf(0))_{|α|≤N}, a finite-dimensional quotient, giving the linear combination.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Lemma 3.3 (ii)–(iii) and footnote 8, printed pp. 116–117 (physical pp. 8–9).

### The adelic Schwartz–Bruhat space S(𝔸) and its standard functions

**Declaration.** TauCeti.SchwartzBruhat.AdelicSpace (AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space).

**Construction.** S(𝔸_K) is the locally convex inductive limit over finite-place compact-open support/period levels of SchwartzMap(K_∞,ℂ) tensor the corresponding finite-dimensional spaces of finite-adelic functions. Equivalently the archimedean tensor product is completed; finite linear combinations of products of one-place functions are dense. They need not exhaust S(𝔸_K) when several archimedean places occur. Distinguished finite-place tensors are 1_{O_v} almost everywhere. Fourier transform and tensor distributions extend continuously from these dense products. Tate’s conditions 𝔷1–𝔷3 are analytic properties to prove for this space, not its definition.

**Hypotheses and conventions.** k a number field; 𝔸 its adele ring with the restricted-product topology; ψ = ∏_v ψ_v a nontrivial character of 𝔸 trivial on k.

**Public interface.**

- TauCeti.SchwartzBruhat.AdelicSpace: S(𝔸) is the locally convex inductive limit of finite-place support/period levels tensored with SchwartzMap(K∞,ℂ); the archimedean tensor factors are completed.
- TauCeti.SchwartzBruhat.AdelicSpace.pure: The factorizable function ⊗_v f_v, given f_v ∈ S(k_v) with f_v = f_v^o outside a finite set.
- TauCeti.SchwartzBruhat.AdelicSpace.pure_apply: (⊗ f_v)(x) = ∏_v f_v(x_v), a finite product for each x.
- TauCeti.SchwartzBruhat.AdelicSpace.fourier_pure: The global transform of ⊗ f_v is ⊗ f̂_v.
- TauCeti.SchwartzBruhat.AdelicSpace.tateClass: Every f ∈ S(𝔸) satisfies 𝔷1–𝔷3.
- TauCeti.SchwartzBruhat.AdelicSpace.span_pure_dense: Finite linear combinations of one-place factorizable functions are dense in S(𝔸); no algebraic spanning equality is asserted when several archimedean factors occur.

**Discriminating examples.**

- TauCeti.SchwartzBruhat.AdelicSpace.standard_mem: f^o = ⊗_{v<∞} 1_{O_v} ⊗ ⊗_{v|∞} Gaussian lies in S(𝔸).
- TauCeti.SchwartzBruhat.AdelicSpace.theta_rat: For k = ℚ and f = 1_Ẑ ⊗ e^{−πx²}, Σ_{ξ∈ℚ} f(tξ) = Σ_{n∈ℤ} e^{−πt²n²} for t > 0.
- TauCeti.SchwartzBruhat.AdelicSpace.pure_eq_zero: If one local factor f_v is 0, then ⊗f_v = 0.
- TauCeti.SchwartzBruhat.AdelicSpace.not_restricted: The product ∏_p 1_{pℤ_p} is not in S(𝔸): infinitely many factors differ from f_p^o, and it is the indicator of the compact but not open set ∏_p pℤ_p ⊂ 𝔸_f, so it is not locally constant.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral: the domain of the global zeta integral z(s, ω; f) AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation: the functions to which Poisson summation applies

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; AdelicAlgebraicGroups:AA.0; mathlib:SchwartzMap.

**Proof route.** Use SR.1 finite-place support and period levels, each finite-dimensional, and native SchwartzMap on the whole real vector space K_∞. Identify SchwartzMap on a product with the completed projective tensor product of the archimedean Schwartz spaces; the required nuclear-space theorem is recorded as a gap. Use AA.0 restricted product topology and measures; extend the component Fourier maps continuously and verify Tate’s summability/integrability conditions by Schwartz estimates.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, printed p. 125 (physical p. 17); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4, physical p. 49, conditions 𝔷1–𝔷3; §4.5, physical pp. 56 and 58.

### Adelic Poisson summation and Tate's Riemann–Roch theorem

**Declaration.** TauCeti.SchwartzBruhat.poisson_summation (AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation).

**Theorem.** Let k be a number field and ψ a nontrivial character of 𝔸/k with the self-dual measure on 𝔸. (i) The annihilator of k in 𝔸 under (x, y) ↦ ψ(xy) is k (Tate Theorem 4.1.4), and 𝔸/k has volume 1 (Tate p. 43). (ii) Poisson: if f is continuous and integrable, Σ_{ξ∈k} f(x + ξ) converges uniformly in x and Σ_{ξ∈k} |f̂(ξ)| converges, then Σ_{ξ∈k} f̂(ξ) = Σ_{ξ∈k} f(ξ) (Lemma 4.2.4). (iii) Riemann–Roch: if f satisfies 𝔷1–𝔷3 (for instance f ∈ S(𝔸)), then for every idele 𝔞, (1/|𝔞|) Σ_{ξ∈k} f̂(ξ/𝔞) = Σ_{ξ∈k} f(𝔞ξ) (Theorem 4.2.1).

**Hypotheses and conventions.** Tate's conditions: continuity and integrability of f and f̂ on 𝔸, uniform convergence of the periodised sums, absolute convergence of Σ f̂.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; AdelicAlgebraicGroups:AA.0; mathlib:Real.tsum_exp_neg_mul_int_sq.

**Acceptance checks.** Check the case k = ℚ with f = 1_Ẑ ⊗ e^{−πx²} and 𝔞 = t ∈ ℝ_{>0}: (iii) becomes θ(1/t²) = t θ(t²) for θ(y) = Σ e^{−πyn²}, Mathlib's Real.tsum_exp_neg_mul_int_sq.

**Proof route.** Discreteness of k and compactness of 𝔸/k (GlobalNumberFields Layer 5); k^* ⊇ k and k^*/k is a finite k-vector space, hence k^* = k. Lemma 4.2.1: for continuous periodic φ, ∫_D φ = the Haar integral on 𝔸/k normalised to volume 1; the Fourier coefficients of φ are indexed by k. Lemma 4.2.2: Fourier inversion on the compact group 𝔸/k when the coefficients are summable. Lemma 4.2.3: the coefficients of Σ_ξ f(x + ξ) are f̂(ξ). Combine at x = 0 for (ii). For (iii) apply (ii) to g(x) = f(𝔞x), whose transform is |𝔞|^{−1}f̂(x/𝔞) by the change of variables y ↦ y/𝔞. The volume of D is 1: running the argument with an unknown volume μ(D) and iterating gives μ(D)² = 1 (Tate p. 43).

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.2, physical pp. 40–43, Lemmas 4.2.1–4.2.4 and Theorem 4.2.1; [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, printed p. 128 (physical p. 20).

### Partial Fourier transformation

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform (AutomorphicLFunctionsAndLocalFactors:AL.0/partial-fourier-transform).

**Definition.** For a product X×V and an admitted Schwartz function Φ, define F_V⁺Φ(x,w)=∫_VΦ(x,v)ψ(B(v,w))dv with the ψ-self-dual measure. The transform acts only in V and preserves the appropriate Schwartz carrier. On a product f⊗g it is f⊗F⁺g.

**Hypotheses and conventions.** X is a finite-dimensional local vector space for the carrier comparison; applications on an affine variety use the supplied Schwartz realization, not a newly invented intrinsic carrier.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.product: F_V(f⊗g)=f⊗Fg.
- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.square: F_V²Φ(x,v)=Φ(x,−v).
- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.commute: Transforms in two disjoint factors commute.
- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.negative_kernel: F_V⁺Φ(x,w)=F_V⁻Φ(x,−w).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.pure_tensor: A Gaussian in V leaves the factor f(x) unchanged.
- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.zero_v_space: In dimension0 the partial transform is the identity with point mass1.
- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.first_factor_fixed: A nonconstant f(x) is not Fourier transformed when only V is selected.

**Uses.** Zhang §11.2: The Weil action uses the V-coordinate transform. GrossZagier IV§3: Separate Mellin and Fourier variables in parameter integrals.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space.

**Proof route.** Use the one-variable Fourier map on each slice. Prove seminorm continuity and preservation using Fubini and the finite/archimedean estimates. Extend the pure-tensor identity by continuity on the completed space.

**Source.** [Wei Zhang, Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), §11.1–11.2 pp.933–934.

### The K-Bessel kernel

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.BesselK (AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-k).

**Definition.** For c>0 and ν∈ℂ, K_ν(c) = (1/2)∫₀∞ exp(−c(u+u⁻¹)/2) exp(ν log u) du/u. Use the ordinary real logarithm on positive u; the function at c≤0 is outside this interface.

**Hypotheses and conventions.** c is a positive real number; integration is with respect to Lebesgue measure on (0,∞).

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL0.BesselK.integral: K_ν(c) is the displayed convergent integral for c>0.
- TauCeti.AutomorphicLFunctions.AL0.BesselK.even: K_{−ν}(c)=K_ν(c).
- TauCeti.AutomorphicLFunctions.AL0.BesselK.entire_order: ν↦K_ν(c) is entire; its j-th derivative inserts (log u)^j.
- TauCeti.AutomorphicLFunctions.AL0.BesselK.half: K_{1/2}(c)=sqrt(π/(2c)) exp(−c).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL0.BesselK.half_at_one: K_{1/2}(1)=sqrt(π/2)/e.
- TauCeti.AutomorphicLFunctions.AL0.BesselK.negative_half: K_{−1/2}(2)=K_{1/2}(2)=sqrt(π/4)e⁻².
- TauCeti.AutomorphicLFunctions.AL0.BesselK.zero_order_positive: K_0(c)>0 for c>0, including c=1.
- TauCeti.AutomorphicLFunctions.AL0.BesselK.not_even_in_argument: The integral diverges at c=0, ν=0: the positivity restriction cannot be dropped.

**Uses.** GrossZagierAndArithmeticHeights:GZ.6: Rewrite the u-integral in IV§3 without changing its normalization. Zhang2021 §12.4: Evaluate split real orbital integrals and their order derivatives.

**Direct inputs.** mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le; mathlib:mellin_differentiableAt_of_isBigO_rpow.

**Proof route.** At infinity use exp(−cu/2) times a power of u; after u↦1/u the same bound controls zero, uniformly when ν ranges over a compact set. Every ν-derivative inserts (log u)^j, still dominated by an integrable function on compact parameter sets. Use the checked parametric-integral theorem; substitution u↦1/u proves evenness in ν.

**Source.** [Wei Zhang, Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), §12.4, p.942, definition preceding Lemma12.3.

### The half-order derivative of K

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.BesselHalfOrderDerivative (AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-half-order-derivative).

**Theorem.** For c>0, ∂_νK_ν(c)|_{ν=1/2}=−sqrt(π/2) exp(c)c^(−1/2) Ei(−2c), where Ei(−r)=−∫ᵣ∞ exp(−t)dt/t for r>0.

**Hypotheses and conventions.** c>0; both integrals use real Lebesgue measure.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-k; mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le.

**Acceptance checks.** For c>0, Ei(−2c)<0, so the displayed half-order derivative is positive. The factor exp(c), the exponent c⁻¹⁄² and the leading minus sign are all retained.

**Proof route.** Differentiate the absolutely convergent K integral using compact-parameter logarithmic domination. Use the half-order Gaussian substitution and integration by parts to reduce the logarithmic integral to the displayed exponential integral. Check the boundary terms vanish at both ends; Zhang cites Oberhettinger [35] for the last identity, whose original proof is a recorded source gap.

**Source.** [Wei Zhang, Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), §12.4, p.943, last display in proof of Lemma12.3.

### The Bessel–Laplace Mellin identity

**Declaration.** TauCeti.AutomorphicLFunctions.AL0.BesselLaplaceMellin (AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-laplace-mellin).

**Theorem.** For m>0 and real t with 0<t<Re(s), the integral of y^(s−1/2)K_(t+1/2)(2πmy)exp(−2πmy) over y>0 is sqrt(π)Γ(s+t+1)Γ(s−t)/(Γ(s+1)(4πm)^(s+1/2)). Both sides extend holomorphically to t=0 for Re(s)>0.

**Hypotheses and conventions.** Complex power uses the real logarithm of positive y and4πm; t may be complex in the continued neighbourhood of0.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-k; AutomorphicLFunctionsAndLocalFactors:AL.0/schwartz-parameter-domination.

**Acceptance checks.** At t=0 and Re(s)>0 the half-order K formula recovers the stated gamma quotient. The boundary Re(s)=t is excluded from the initial integral theorem, and m must be positive.

**Proof route.** Insert the absolutely convergent K integral; exponential bounds justify Fubini. Integrate y first using the native gamma integral; the substitution u↦u/(1+u) yields the beta integral. Use compact-parameter domination to extend to t=0 and differentiate near0.

**Source.** [Benedict H. Gross and Don B. Zagier, Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), IV§6 p.299 (6.2).

## AL.1 — Tate's thesis and Hecke L-functions

The local zeta distribution is first defined where its integral converges. Restriction to the punctured line and the point-supported distribution calculation give the eigenline theorem, including the exceptional invariant character. Normalized standard test functions then characterize the local factors and their Fourier ratios. The global argument uses the adelic Poisson formula and the norm-one idele-class volume to continue the zeta integral and derive the Hecke functional equation. CM completions and logarithmic gamma corrections fix the character conventions consumed by height formulas.

### Local quasi-characters, unramified characters and the conductor exponent

**Declaration.** TauCeti.TateZeta.QuasiChar (AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor).

**Definition.** A quasi-character of F^× is a continuous homomorphism ω : F^× → ℂ^×; it is a character if |ω| = 1. There is a unique real σ (the exponent) with |ω(x)| = |x|^σ, so ω = ω_u·ω_σ with ω_u a character. For F nonarchimedean, ω is unramified if ω is trivial on O^×; the unramified quasi-characters are exactly x ↦ t^{ord x} = |x|^s with t = q^{−s} ∈ ℂ^×, s determined modulo 2πi/log q (Tate Lemma 2.3.1). For ramified ω the conductor exponent c(ω) is the smallest integer c ≥ 1 with ω trivial on 1 + P^c; put c(ω) = 0 for unramified ω. For F = ℝ every quasi-character is ωω_s with ω(x) = x^{−a}, a ∈ {0, 1} (Kudla (3.18)); for F = ℂ it is ωω_s with ω(x) = x^{−a}x̄^{−b}, a, b ∈ ℤ, min(a, b) = 0 (Kudla (3.20)). The conductor is an analytic adapter of the attained characterConductorExp supplied by ClassFieldTheory Layer7; its arithmetic construction is imported.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. The archimedean normal forms are Kudla's (after Weil); they differ from the common sgn^a normalisation: sgn(x) = x^{−1}|x|, so sgn = x^{−1}·ω_1.

**Public interface.**

- TauCeti.TateZeta.QuasiChar: Continuous homomorphisms F^× →* ℂ^× (ContinuousMonoidHom).
- TauCeti.TateZeta.QuasiChar.exponent: The real σ with |ω(x)| = |x|^σ.
- TauCeti.TateZeta.QuasiChar.absPow: ω_s(x) = |x|^s.
- TauCeti.TateZeta.QuasiChar.IsUnramified: ω trivial on O^× (finite places).
- TauCeti.TateZeta.QuasiChar.isUnramified_iff: ω unramified iff ω = ω_s for some s, unique modulo 2πi/log q.
- TauCeti.TateZeta.QuasiChar.conductor: c(ω) ∈ ℕ: 0 if unramified, otherwise the least c ≥ 1 with ω|_{1+P^c} = 1.
- TauCeti.TateZeta.QuasiChar.conductor_mul_absPow: c(ωω_s) = c(ω).
- TauCeti.TateZeta.QuasiChar.archNormalForm: At ℝ, ℂ: ω = x^{−a}(x̄^{−b})·ω_s with the stated constraints, uniquely.

**Discriminating examples.**

- TauCeti.TateZeta.QuasiChar.absPow_isUnramified: ω_s is unramified with c = 0, and ω_s(ϖ) = q^{−s}.
- TauCeti.TateZeta.QuasiChar.conductor_dirichlet: For p odd and χ a primitive Dirichlet character mod p^n, the induced ω on ℚ_p^× (ω(p) = 1) has c(ω) = n.
- TauCeti.TateZeta.QuasiChar.sgn_normalForm: At ℝ, sgn = x^{−1}·ω_1: a = 1 and s = 1 in (3.18).
- TauCeti.TateZeta.QuasiChar.one_conductor: The trivial character has exponent 0 and conductor 0.
- TauCeti.TateZeta.QuasiChar.not_unramified_teichmuller: The Teichmüller-type character of ℤ_p^× (p odd) extended by ω(p) = 1 is ramified with conductor 1, although it is trivial on 1 + pℤ_p.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral: the characters integrated against AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors: conductor exponents in the ε-factor formula GL2AutomorphicRepresentationsAndTransfer:R16.2: local characters of GL₁ and their conductors in principal series EndoscopicTransferAndUnitaryTraceComparison:ET.6: GL₁ local constants of Weil–Deligne characters

**Direct inputs.** mathlib:ContinuousMonoidHom; AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

**Proof route.** Exponent: |ω| is a continuous homomorphism to ℝ_{>0}, trivial on the compact group O^× (resp. {±1}, the unit circle), hence |x|^σ. Unramified quasi-characters factor through ord : F^× → ℤ, so they are t^{ord x}; write t = q^{−s}. Conductor: the subgroups 1 + P^c form a basis of neighbourhoods of 1 in O^×, and ω|_{O^×} is continuous into ℂ^×, which has no small subgroups, so ω is trivial on some 1 + P^c. Archimedean normal forms: import the classification of continuous characters of ℝ^× and ℂ^× (GlobalNumberFields Layer 10) and rewrite sgn^ε|x|^s and (z/|z|)^n|z|^s in Kudla's monomials.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "The ramified local theory", printed p. 120 (physical p. 12); [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "The archimedean case", printed p. 121 (physical p. 13).

### The local Tate zeta integral z(s, ω; f)

**Declaration.** TauCeti.TateZeta.zetaIntegral (AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral).

**Definition.** For a character ω of F^×, s ∈ ℂ with Re s > 0 and f ∈ S(F), z(s, ω; f) = ∫_{F^×} f(x)ω(x)|x|^s d^×x converges absolutely (Kudla (3.3)); s ↦ z(s, ω; f) is holomorphic on Re s > 0 (Tate Lemma 2.4.1, differentiation under the integral), and f ↦ z(s, ω; f) is a nonzero element z(s, ω) ∈ S′(ωω_s). In Tate's notation, ζ(f, c) = ∫ f(α)c(α)d^×α for quasi-characters c of exponent > 0, and z(s, ω; f) = ζ(f, ωω_s). The integral satisfies z(s, ωω_t; f) = z(s + t, ω; f) and z(s, ω; r(a)f) = (ωω_s)(a)^{−1}z(s, ω; f).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}; the two differ by a positive constant at finitely many places, which cancels from every normalised object below (z₀, ε, γ). ω unitary; the quasi-character case is the twist ω_t.

**Public interface.**

- TauCeti.TateZeta.zetaIntegral: z(s, ω; f) = ∫_{F^×} f(x)ω(x)|x|^s d^×x.
- TauCeti.TateZeta.zetaIntegral_integrable: Absolute convergence for Re s > 0.
- TauCeti.TateZeta.differentiableOn_zetaIntegral: s ↦ z(s, ω; f) is holomorphic on Re s > 0.
- TauCeti.TateZeta.zetaIntegral_twist: z(s, ωω_t; f) = z(s + t, ω; f).
- TauCeti.TateZeta.zetaIntegral_act: z(s, ω; r(a)f) = (ωω_s)(a)^{−1} z(s, ω; f).
- TauCeti.TateZeta.zetaDistribution: z(s, ω) ∈ S′(ωω_s), linear in f.

**Discriminating examples.**

- TauCeti.TateZeta.zetaIntegral_unramified_standard: ω(ϖ) = t: z(s, ω; 1_O) = (1 − tq^{−s})^{−1}.
- TauCeti.TateZeta.zetaIntegral_gaussian_real: z(s, 1; e^{−πx²}) = Complex.Gammaℝ s at ℝ.
- TauCeti.TateZeta.zetaIntegral_gaussian_complex: z(s, 1; e^{−2πxx̄}) = (2π)^{1−s}Γ(s) = π·Complex.Gammaℂ s at ℂ (twice-Lebesgue dx).
- TauCeti.TateZeta.zetaIntegral_ramified_integers: ω ramified: z(s, ω; 1_O) = 0, since ∫_{O^×} ω d^×x = 0 on every annulus.
- TauCeti.TateZeta.zetaIntegral_not_convergent: ω = 1, f = 1_O, s = 0: Σ_{n≥0} q^{−n·0} diverges, so the half-plane Re s > 0 is sharp.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory: factored as L(s, ω)z₀(s, ω) AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral: the local factors of the global integral AutomorphicLFunctionsAndLocalFactors:AL.2: the n = 1 case of the Godement–Jacquet zeta integral PeriodsAndSpecialValues:PS.7: GL₁ local factors and their normalisations (RS-13)

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor; AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; AdelicAlgebraicGroups:AA.0; mathlib:Complex.Gammaℝ; mathlib:Complex.Gammaℂ; mathlib:Complex.integral_cpow_mul_exp_neg_mul_Ioi; mathlib:mellin.

**Proof route.** Convergence: at a finite place f is bounded with compact support and equals f(0) near 0, so the integral is a finite sum of annulus integrals plus f(0)Σ_{n≥N} q^{−n Re s}; at ℝ, ℂ use rapid decay at ∞ and |x|^{Re s − 1} integrable near 0. Holomorphy: dominated differentiation in s on Re s > δ > 0. Eigen-property: substitute x ↦ xa^{−1} and use invariance of d^×x.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "Zeta integrals", printed p. 117 (physical p. 9); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.4, physical pp. 16–17, Definition 2.4.1 and Lemma 2.4.1.

### The spaces S′(ω) of ω-eigendistributions

**Declaration.** TauCeti.TateZeta.eigenSpace (AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space).

**Definition.** For a quasi-character ω of F^×, S′(ω) = {λ ∈ S(F)′ : r′(a)λ = ω(a)λ for all a ∈ F^×} (Kudla Definition 3.1). Restriction along C_c^∞(F^×) ⊂ S(F) gives an exact sequence 0 → S′(ω)₀ → S′(ω) → C_c^∞(F^×)′(ω) (3.2), where S′(ω)₀ is the space of ω-eigendistributions supported at 0 (vanishing on C_c^∞(F^×)); here C_c^∞(F^×) means locally constant compactly supported functions at a finite place.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. At ℝ, ℂ, C_c^∞(F^×) ⊂ 𝓢(F, ℂ) consists of smooth functions with compact support in F^×.

**Public interface.**

- TauCeti.TateZeta.eigenSpace: S′(ω) as a submodule of S(F)′.
- TauCeti.TateZeta.mem_eigenSpace: λ ∈ S′(ω) ↔ ∀ a, r′(a)λ = ω(a)λ.
- TauCeti.TateZeta.eigenSpaceZero: S′(ω)₀: eigendistributions vanishing on C_c^∞(F^×).
- TauCeti.TateZeta.eigenSpace_restrict_exact: The left exact sequence (3.2).
- TauCeti.TateZeta.zetaDistribution_mem: z(s, ω) ∈ S′(ωω_s) for Re s > 0.

**Discriminating examples.**

- TauCeti.TateZeta.delta_mem_eigenSpace_one: δ₀ ∈ S′(1).
- TauCeti.TateZeta.haar_restrict_mem: f ↦ ∫ f(x)ω(x)d^×x on C_c^∞(F^×) is an ω-eigendistribution.
- TauCeti.TateZeta.delta_not_mem: For ω ≠ 1, δ₀ ∉ S′(ω), since r′(a)δ₀ = δ₀.
- TauCeti.TateZeta.zetaDistribution_mem_eigenSpace: z(s, ω) ∈ S′(ωω_s) for Re s > 0: its eigencharacter is ωω_s, not ω.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem: dim S′(ω) = 1 AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors: the ε-factor compares two vectors of S′(ωω_s)

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor.

**Proof route.** F = {0} ∪ F^× gives C_c^∞(F^×) ⊂ S(F), and dualising gives (3.1); take ω-eigenspaces (left exactness of eigenspaces).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Definition 3.1, printed p. 115 (physical p. 7).

### Eigendistributions on C_c^∞(F^×) are multiples of ω(x)d^×x (Lemma 3.2)

**Declaration.** TauCeti.TateZeta.eigen_restrict_eq_smul_haar (AutomorphicLFunctionsAndLocalFactors:AL.1/restriction-to-punctured-line).

**Lemma.** The space C_c^∞(F^×)′(ω) of ω-eigendistributions on C_c^∞(F^×) is one-dimensional, spanned by ω(x)d^×x. Hence for λ ∈ S′(ω) there is c ∈ ℂ with ⟨λ, f⟩ = c∫_{F^×} f(x)ω(x)d^×x for all f with compact support in F^×.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; mathlib:MeasureTheory.Measure.IsHaarMeasure.

**Acceptance checks.** Check that ω(x)d^×x itself is ω-eigen: ∫ f(xa^{−1})ω(x)d^×x = ω(a)∫ f(y)ω(y)d^×y.

**Proof route.** Multiplying by ω^{−1} identifies ω-eigendistributions on F^× with F^×-invariant ones. Finite place: C_c^∞(F^×) is spanned by indicators of cosets aU of compact open U ⊆ O^×; invariance gives ⟨λ, 1_{aU}⟩ = ⟨λ, 1_U⟩ and λ(1_U) = [U : V]λ(1_V), so λ is a multiple of Haar measure. ℝ^×, ℂ^×: a translation-invariant distribution on a Lie group has zero derivatives along the Lie algebra and is a multiple of Haar measure.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Lemma 3.2, printed p. 116 (physical p. 8).

### Eigendistributions supported at 0 (Lemma 3.3)

**Declaration.** TauCeti.TateZeta.eigenSpaceZero_eq (AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistributions-supported-at-zero).

**Lemma.** (i) F nonarchimedean: the distributions supported at 0 are ℂ·δ₀, and δ₀ ∈ S′(ω₀) for the trivial ω₀; S′(ω)₀ = 0 for ω ≠ ω₀. (ii) F = ℝ, D = d/dx: the F^×-finite distributions supported at 0 are ⊕_{k≥0} ℂ·D^kδ₀, and S′(ω)₀ = ℂ·D^kδ₀ if ω(x) = x^{−k}, 0 otherwise. (iii) F = ℂ, D = ∂/∂x, D̄ = ∂/∂x̄: they are ⊕_{k,l≥0} ℂ·D^kD̄^lδ₀, and S′(ω)₀ = ℂ·D^kD̄^lδ₀ if ω(x) = x^{−k}x̄^{−l}, 0 otherwise.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. In (ii), (iii) only F^×-finite distributions are classified (Kudla footnote 8).

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; AutomorphicLFunctionsAndLocalFactors:AL.0/point-supported-distributions.

**Acceptance checks.** Check the eigencharacter of Dδ₀ at ℝ: ⟨Dδ₀, r(a^{−1})f⟩ = −a^{−1}f′(0), so Dδ₀ ∈ S′(x^{−1}).

**Proof route.** (i): if λ vanishes on C_c^∞(F^×), then for f constant on P^r, f − f(0)1_{P^r} ∈ C_c^∞(F^×), so λ(f) = f(0)λ(1_{P^r}), and λ(1_{P^r} − 1_{P^{r+1}}) = 0 makes λ(1_{P^r}) independent of r. (ii), (iii): the structure theorem for distributions supported at a point (finite combinations of derivatives of δ₀; requested), then compute r′(a)D^kδ₀ = a^{−k}D^kδ₀ from ⟨D^kδ₀, f⟩ = (−1)^k f^{(k)}(0).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Lemma 3.3, printed pp. 116–117 (physical pp. 8–9).

### Unramified local theory: z(s, ω) = L(s, ω)z₀(s, ω)

**Declaration.** TauCeti.TateZeta.zetaIntegral_eq_L_mul_normalized (AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory).

**Theorem.** Let F be nonarchimedean and ω unramified with ω(ϖ) = t; put L(s, ω) = (1 − tq^{−s})^{−1}. For τ = [1] − [ϖ^{−1}] ∈ ℤ[F^×] and f ∈ S(F), r(τ)f = f − r(ϖ^{−1})f has compact support in F^×, so ⟨z₀(s, ω), f⟩ = ∫_{F^×}(r(τ)f)(x)ωω_s(x)d^×x (3.5) is entire in s and z₀(s, ω) ∈ S′(ωω_s). For Re s > 0, z(s, ω) = L(s, ω)z₀(s, ω) (3.6), which continues z(s, ω) meromorphically to ℂ. With f^o = 1_O, ⟨z₀(s, ω), f^o⟩ = 1 for all s (3.8); so z₀(s, ω) is never zero, z(s, ω; f)/L(s, ω) is entire for every f, and for each s some f (namely f^o) makes it nonzero: L(s, ω) is the greatest common denominator of the zeta integrals (3.9).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}; the two differ by a positive constant at finitely many places, which cancels from every normalised object below (z₀, ε, γ).

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; mathlib:tsum_geometric_of_norm_lt_one.

**Acceptance checks.** Check the proportionality constant: z(s, ω; f^o) = L(s, ω), in agreement with the local-zeta-integral test. Check the Euler factor for k = ℚ: L(s, 1) at p is (1 − p^{−s})^{−1}, the p-th Euler factor of ζ.

**Proof route.** If f is constant on P^r, then (r(τ)f)(x) = f(x) − f(xϖ^{−1}) = 0 for x ∈ P^{r+1}; so r(τ)f ∈ C_c^∞(F^×) and (3.5) is a finite sum. r(τ) commutes with r(a), so z₀(s, ω) is ωω_s-eigen. For Re s > 0 split the integral and substitute: ⟨z₀, f⟩ = (1 − ωω_s(ϖ))z(s, ω; f) = (1 − tq^{−s})z(s, ω; f). r(τ)f^o = 1_{O^×}, whose integral is vol(O^×) = 1.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "The unramified local theory", printed pp. 118–119 (physical pp. 10–11), (3.4)–(3.9); [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, printed p. 119 (physical p. 11).

### The invariant distributions: S′(ω₀) is one-dimensional

**Declaration.** TauCeti.TateZeta.eigenSpace_one_eq_span_delta (AutomorphicLFunctionsAndLocalFactors:AL.1/invariant-distributions-exceptional-case).

**Lemma.** At a finite place, the F^×-invariant distributions S′(ω₀) form the line ℂ·δ₀, although (3.11) only bounds the dimension by 2. The distribution ⟨λ₀, f⟩ = ⟨d^×x, f − f(0)f^o⟩ (3.12) is an O^×-invariant preimage of d^×x with ⟨λ₀, f^o⟩ = 0, and r′(ϖ)λ₀ = λ₀ − δ₀ (3.13). So F^× acts on the span of δ₀, λ₀ through x ↦ [[1, −ord x], [0, 1]] (3.14), a non-semisimple representation whose invariants are ℂ·δ₀; d^×x does not extend to an F^×-invariant distribution on S(F).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. f^o = 1_O; the matrix (3.14) is written in the ordered basis (δ₀, λ₀).

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistributions-supported-at-zero; AutomorphicLFunctionsAndLocalFactors:AL.1/restriction-to-punctured-line; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory.

**Acceptance checks.** Check that the matrices ρ(x) = [[1, −ord x], [0, 1]] multiply as ρ(xy) = ρ(x)ρ(y) (suggested file). Check that the uniqueness argument does not use only dim ≤ 2: it needs the nonzero off-diagonal entry c = −1.

**Proof route.** f − f(0)f^o vanishes near 0, so λ₀ is defined, restricts to d^×x and is O^×-invariant; ⟨λ₀, f^o⟩ = 0. r′(ϖ)λ₀ − λ₀ vanishes on C_c^∞(F^×), hence equals cδ₀ by Lemma 3.3(i). c = ⟨r′(ϖ)λ₀ − λ₀, f^o⟩ = −⟨λ₀, r(τ)f^o⟩ = −⟨d^×x, 1_{O^×}⟩ = −⟨z₀(0, ω₀), f^o⟩ = −1 (3.13). An invariant vector aδ₀ + bλ₀ satisfies b = 0, so S′(ω₀) = ℂ·δ₀.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Example, printed pp. 119–120 (physical pp. 11–12), (3.10)–(3.14).

### Ramified local theory: z(s, ω) is entire and L(s, ω) = 1

**Declaration.** TauCeti.TateZeta.zetaIntegral_entire_of_ramified (AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory).

**Theorem.** Let F be nonarchimedean and ω ramified with conductor c. For f ∈ S(F), ∫_{F^× − P^n} f(x)ωω_s(x)d^×x is independent of n for n large, which continues z(s, ω; f) to an entire function; z₀(s, ω) := z(s, ω) is a basis vector of S′(ωω_s) for every s (3.15), and L(s, ω) := 1 (3.16). The standard function f^o = ω^{−1}·1_{O^×} (3.17) has ⟨z₀(s, ω), f^o⟩ = 1, so the gcd property (3.9) holds.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}; the two differ by a positive constant at finitely many places, which cancels from every normalised object below (z₀, ε, γ).

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; AutomorphicLFunctionsAndLocalFactors:AL.1/restriction-to-punctured-line; AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistributions-supported-at-zero; AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor.

**Acceptance checks.** Check the degenerate value z(s, ω; 1_O) = 0 against the standard value ⟨z₀, ω^{−1}1_{O^×}⟩ = 1.

**Proof route.** If f is constant on P^n, the contribution of each annulus ϖ^kO^× ⊆ P^n is f(0)q^{−ks}ω(ϖ^k)∫_{O^×}ω d^×u = 0, as ω is nontrivial on O^×. S′(ωω_s)₀ = 0 (Lemma 3.3(i)) and Lemma 3.2 give dim ≤ 1; z₀ ≠ 0 since ⟨z₀, f^o⟩ = ∫_{O^×}ω^{−1}ω d^×x = 1.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "The ramified local theory", printed p. 120 (physical p. 12).

### Archimedean local theory: Γ-factors and the standard functions (Proposition 3.5)

**Declaration.** TauCeti.TateZeta.archimedean_normalized_entire (AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory).

**Theorem.** F = ℝ: for ω(x) = x^{−a}, a ∈ {0, 1}, put L(s, ω) = π^{−s/2}Γ(s/2) (3.19) and f^o = f_a = x^a e^{−πx²}. F = ℂ: for ω(x) = x^{−a}x̄^{−b}, min(a, b) = 0, put L(s, ω) = (2π)^{1−s}Γ(s) (3.21) and f^o = f_{a,b} = x^a x̄^b e^{−2πxx̄}. Then (i) z₀(s, ω) := L(s, ω)^{−1}z(s, ω) continues to an entire function of s and is a basis vector of S′(ωω_s) for every s; (ii) ⟨z₀(s, ω), f^o⟩ = 1. (iii) z(s, ω) is meromorphic with simple poles exactly at the poles of L(s, ω): at F = ℝ, s = −r with r ∈ 2ℤ_{≥0}, residue a nonzero multiple of D^{a+r}δ₀ ∈ S′(ωω_{−r}); at F = ℂ, s = −r with r ∈ ℤ_{≥0}, residue a nonzero multiple of D^{a+r}D̄^{b+r}δ₀. At a pole the constant term of the Laurent expansion extends ωω_{−r}(x)d^×x to S(F) but not to an element of S′(ωω_{−r}). (For the corrected real residues see AutomorphicLFunctionsAndLocalFactors/E4.)

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. Measures as in Kudla: at a finite place d^×x gives O^× volume 1; at ℝ and ℂ, d^×x = |x|^{−1}dx with dx Lebesgue (resp. twice Lebesgue) measure. Tate instead gives O^× the volume N𝔡^{−1/2}; the two differ by a positive constant at finitely many places, which cancels from every normalised object below (z₀, ε, γ). Kudla's normalisations are Weil's: L(s, ω) does not depend on a (resp. a, b), unlike the sgn^a normalisation.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; AutomorphicLFunctionsAndLocalFactors:AL.1/restriction-to-punctured-line; AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistributions-supported-at-zero; AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor; mathlib:Complex.Gammaℝ; mathlib:Complex.Gammaℂ; mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one; mathlib:Complex.integral_cpow_mul_exp_neg_mul_Ioi.

**Acceptance checks.** Check z(s, x^{−1}; x e^{−πx²}) = Γ_ℝ(s): the odd standard function has the same L-factor as the even one in this normalisation. Check the complex factor against Mathlib: (2π)^{1−s}Γ(s) = π·Complex.Gammaℂ s, since Gammaℂ s = 2(2π)^{−s}Γ(s) (suggested file).

**Proof route.** (ii): z(s, ω; f_a) = ∫ e^{−πx²}|x|^s d^×x = 2∫_0^∞ e^{−πx²}x^{s−1}dx = π^{−s/2}Γ(s/2) (Tate p. 20); at ℂ, polar coordinates give 2π∫_0^∞ e^{−2πu}u^{s−1}du = (2π)^{1−s}Γ(s) (Tate p. 23). (i) Continuation for general f: either Kudla's route, subtracting the Taylor polynomial of f at 0 (integration by parts), or Tate's: for 0 < Re s < 1, z(s, ω; f) = ρ(ωω_s)z(1 − s, ω^{−1}; f̂) with ρ the explicit meromorphic ratio of §2.5 (local-functional-equation), and the right side is holomorphic for Re s < 1. Basis: z₀ ≠ 0 by (ii); dim S′(ωω_s) ≤ 1 away from the poles by Lemmas 3.2–3.3. (iii) Taylor expansion: the term f^{(k)}(0)x^k/k! contributes ∫_{|x|<1} x^{k−a}|x|^{s−1}dx, nonzero only for k ≡ a mod 2, with a simple pole at s = a − k; eigen-property of the residue from Lemma 3.3(ii), (iii).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, "The archimedean case", Proposition 3.5 and (3.22), printed pp. 121–122 (physical pp. 13–14); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, "k real" and "k complex", physical pp. 20–23.

### Local uniqueness: dim S′(ω) = 1 (Theorem 3.4)

**Declaration.** TauCeti.TateZeta.finrank_eigenSpace_eq_one (AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem).

**Theorem.** For every quasi-character ω of F^×, the space S′(ω) of ω-eigendistributions on S(F) is one-dimensional. Writing ω = ω′ω_s with ω′ a character (or an archimedean normal form), it is spanned by z₀(s, ω′).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; AutomorphicLFunctionsAndLocalFactors:AL.1/restriction-to-punctured-line; AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistributions-supported-at-zero; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/invariant-distributions-exceptional-case; AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory.

**Acceptance checks.** Check the finite-place exceptional case: at ω = ω₀ the dimension bound from (3.11) is 2, and uniqueness needs the nonsplit action (3.14). Check that for ω ramified, S′(ωω_s)₀ = 0 for all s, so only existence is at stake (Kudla, Example on p. 117).

**Proof route.** By (3.2), Lemma 3.2 and Lemma 3.3, dim S′(ω) ≤ 1 when S′(ω)₀ = 0 and ≤ 2 otherwise. Existence: z₀(s, ω′) is a nonzero element (unramified, ramified and archimedean nodes). Exceptional parameters with S′(ω)₀ ≠ 0: finite place, ω = ω₀ — the invariant-distributions lemma; ℝ, ℂ — the constant term at a pole is not an eigendistribution (archimedean node (iii)), so the eigenspace is the residue line.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Theorem 3.4, printed p. 117 (physical p. 9); [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, printed p. 120 (physical p. 12).

### The Fourier transform of an ω-eigendistribution (Lemma 3.6)

**Declaration.** TauCeti.TateZeta.fourier_mem_eigenSpace (AutomorphicLFunctionsAndLocalFactors:AL.1/fourier-transform-eigendistribution).

**Lemma.** If λ ∈ S′(ω), then λ̂ ∈ S′(ω^{−1}ω₁), where ω₁(x) = |x| and ⟨λ̂, f⟩ = ⟨λ, f̂⟩. Consequently ẑ₀(s, ω) is a multiple of z₀(1 − s, ω^{−1}).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. f̂ is taken with the self-dual measure for a fixed nontrivial ψ.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem.

**Acceptance checks.** Check on δ₀ at a finite place with ν(ψ) = 0: δ̂₀ = (f ↦ f̂(0) = ∫f) is the additive Haar measure, which lies in S′(ω₁).

**Proof route.** For f ∈ S(F), (r(a^{−1})f)^(x) = ∫ f(ya^{−1})ψ(xy)dy = |a| f̂(xa) = |a|(r(a)f̂)(x) (substitute y ↦ ya). Then ⟨r′(a)λ̂, f⟩ = ⟨λ, (r(a^{−1})f)^⟩ = |a|⟨λ, r(a)f̂⟩ = |a|ω(a)^{−1}⟨λ̂, f⟩. z₀(s, ω) ∈ S′(ωω_s) gives ẑ₀(s, ω) ∈ S′(ω^{−1}ω_{1−s}); uniqueness (Theorem 3.4) makes it a multiple of z₀(1 − s, ω^{−1}).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Lemma 3.6, printed p. 122 (physical p. 14).

### The local ε- and γ-factors ε(s, ω, ψ) and γ(s, ω, ψ)

**Declaration.** TauCeti.TateZeta.epsilonFactor (AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors).

**Definition.** For a character ω, a nontrivial ψ and the self-dual dx, ε(s, ω, ψ) ∈ ℂ^× is the unique constant with ẑ₀(1 − s, ω^{−1}) = ε(s, ω, ψ)z₀(s, ω) (3.23), and γ(s, ω, ψ) = ε(s, ω, ψ)L(1 − s, ω^{−1})/L(s, ω) (3.26). Properties: ε(s, ω, ψ) = ⟨z₀(1 − s, ω^{−1}), f̂^o⟩ for the standard f^o (3.27); ε(s, ωω_t, ψ) = ε(s + t, ω, ψ) (3.28); ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ) (3.29); ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1); |ε(1/2, ω, ψ)| = 1. Tate's factor is ρ(ωω_s) = 1/γ(s, ω, ψ) (for ψ = e^{2πiΛ}).

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ω a character; archimedean ω in Kudla's normal form; L(1 − s, ω^{−1}) is read after rewriting ω^{−1} in normal form times ω_t. The norm identity at1/2 assumes ω unitary. General quasi-character identities are obtained by twists; the assertion of unit norm is not made for all twists.

**Public interface.**

- TauCeti.TateZeta.epsilonFactor: ε(s, ω, ψ) ∈ ℂ^×, defined by (3.23).
- TauCeti.TateZeta.gammaFactor: γ(s, ω, ψ) = ε L(1 − s, ω^{−1})/L(s, ω), meromorphic in s.
- TauCeti.TateZeta.epsilonFactor_eq_standard: (3.27): ε = ⟨z₀(1 − s, ω^{−1}), f̂^o⟩.
- TauCeti.TateZeta.epsilonFactor_twist: (3.28): ε(s, ωω_t, ψ) = ε(s + t, ω, ψ).
- TauCeti.TateZeta.epsilonFactor_smul_char: (3.29): ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ).
- TauCeti.TateZeta.epsilonFactor_mul_inv: ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1).
- TauCeti.TateZeta.norm_epsilonFactor_half: |ε(1/2, ω, ψ)| = 1.

**Discriminating examples.**

- TauCeti.TateZeta.epsilonFactor_unramified_zero: ω unramified, ν(ψ) = 0: ε(s, ω, ψ) = 1, as f̂^o = f^o.
- TauCeti.TateZeta.epsilonFactor_real_sign: F = ℝ, ω = x^{−1}, ψ = e: ε = i and γ(s, x^{−1}, e) = iΓ_ℝ(3 − s)/Γ_ℝ(s) (ω^{−1} = x = x^{−1}ω₂).
- TauCeti.TateZeta.gammaFactor_real_trivial: F = ℝ, ω = 1, ψ = e: 1/γ(s) = Γ_ℝ(s)/Γ_ℝ(1 − s) = Complex.Gammaℂ s · cos(πs/2).
- TauCeti.TateZeta.epsilonFactor_trivial_twist: ε(s, ω_t, ψ) = ε(s + t, 1, ψ) with the same ψ.
- TauCeti.TateZeta.epsilonFactor_depends_on_psi: ε is not independent of ψ: at a finite place ε(s, 1, ψ_ϖ) = q^{1/2−s}ε(s, 1, ψ) by (3.29).

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation: the constant in the local functional equation AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor: the local factors of ε(s, ω) EndoscopicTransferAndUnitaryTraceComparison:ET.6: GL₁ local constants for the Weil–Deligne side PeriodsAndSpecialValues:PS.1: Tate analytic ε- and γ-factors in the admitted GL₁ cases (RS-13)

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem; AutomorphicLFunctionsAndLocalFactors:AL.1/fourier-transform-eigendistribution; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.

**Proof route.** Existence and uniqueness of ε: Lemma 3.6 and Theorem 3.4, with z₀(s, ω) ≠ 0. (3.27): evaluate (3.23) at f^o. (3.28): z₀(s, ωω_t) = z₀(s + t, ω) and f^o is unchanged by ω_t. (3.29): the ψ_β-transform with its self-dual measure is |β|^{1/2}r(β)f̂; insert in (3.27). ε(s)ε(1 − s, ω^{−1}) = ω(−1): transform (3.23) twice and use f̂̂ = r(−1)f (Tate Lemma 2.4.3(1)). |ε(1/2)| = 1: complex conjugation swaps ω and ω^{−1} at s = 1/2 (Tate Lemma 2.4.3(2), Corollary 2.4.1).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Corollary 3.7 and (3.23)–(3.29), printed p. 123 (physical p. 15); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.4, Lemma 2.4.3 and Corollary 2.4.1, physical p. 19.

### Tate's local functional equation (Corollary 3.7)

**Declaration.** TauCeti.TateZeta.zetaIntegral_fourier_one_sub (AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation).

**Theorem.** For every f ∈ S(F), as meromorphic functions of s, z(1 − s, ω^{−1}; f̂) = γ(s, ω, ψ)z(s, ω; f) (3.25); equivalently z(1 − s, ω^{−1}; f̂)/L(1 − s, ω^{−1}) = ε(s, ω, ψ)·z(s, ω; f)/L(s, ω) (3.24), both sides entire. In Tate's form (Theorem 2.4.1): every ζ-function continues to all quasi-characters by ζ(f, c) = ρ(c)ζ(f̂, ĉ), ĉ = |·|c^{−1}, with ρ independent of f.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ω a character; f̂ for ψ with the self-dual measure.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors; AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion.

**Acceptance checks.** Check at a finite place with ω unramified, ν(ψ) = 0 and f = f^o = f̂^o: both sides of (3.24) equal 1. Check at ℝ with f = e^{−πx²}: Γ_ℝ(1 − s) = γ(s, 1, e)Γ_ℝ(s), i.e. Tate's ρ(|·|^s) = Γ_ℝ(s)/Γ_ℝ(1 − s).

**Proof route.** Kudla's route: (3.23) with z(s, ω) = L(s, ω)z₀(s, ω) at s and 1 − s. Tate's route: for 0 < Re s < 1, Lemma 2.4.2 gives ζ(f, c)ζ(ĝ, ĉ) = ζ(f̂, ĉ)ζ(g, c) (Fubini on F^× × F^× after the shear (α, β) ↦ (α, αβ), and the symmetry of ∫∫ f(ξ)g(η)ψ(ξβη)dξdη); fix g = f_C, the special function of §2.5, to define ρ(c) = ζ(f_C, c)/ζ(f̂_C, ĉ), then continue. Both sides are meromorphic: the left by continuation in 1 − s, the right by the unramified/ramified/archimedean nodes.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Corollary 3.7 and (3.24)–(3.25), printed p. 123 (physical p. 15); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.4, Lemma 2.4.2 and Theorem 2.4.1, physical pp. 17–19.

### The local Gauss sum 𝔤(ω, ψ)

**Declaration.** TauCeti.TateZeta.localGaussSum (AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum).

**Definition.** For F nonarchimedean, ω ramified with conductor c and ψ of conductor ν, 𝔤(ω, ψ) = q^{(ν+c)/2}∫_{O^×} ω^{−1}(y)ψ(ϖ^{−ν−c}y)dy with dy self-dual for ψ. Then the transform of the standard function f^o = ω^{−1}1_{O^×} is f̂^o(x) = 𝔤(ω, ψ)q^{−(ν+c)/2}·conj(f^o(ϖ^{ν+c}x)) (3.31), vanishing unless ord x = −ν − c; and 𝔤(ω, ψ)·conj(𝔤(ω, ψ)) = 1. The product ω(ϖ^{ν+c})𝔤(ω, ψ) does not depend on the choice of ϖ.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ω a character (unitary), ramified.

**Public interface.**

- TauCeti.TateZeta.localGaussSum: 𝔤(ω, ψ) = q^{(ν+c)/2}∫_{O^×}ω^{−1}(y)ψ(ϖ^{−ν−c}y)dy.
- TauCeti.TateZeta.fourier_standard_ramified: (3.31): f̂^o(x) = 𝔤 q^{−(ν+c)/2} conj(f^o(ϖ^{ν+c}x)).
- TauCeti.TateZeta.localGaussSum_mul_conj: 𝔤(ω, ψ)·conj 𝔤(ω, ψ) = 1.
- TauCeti.TateZeta.localGaussSum_uniformizer: ω(ϖ^{ν+c})𝔤(ω, ψ) is independent of ϖ.
- TauCeti.TateZeta.localGaussSum_eq_gaussSum: For c = 1 it is q^{−1/2} times Mathlib's gaussSum of the residue characters.

**Discriminating examples.**

- TauCeti.TateZeta.localGaussSum_padic_conductor_one: F = ℚ_p, c = 1, ν = 0: 𝔤 = p^{−1/2}·gaussSum(χ^{−1}, ψ₁) with χ = ω|_{ℤ_p^×} on 𝔽_p^× and ψ₁(a) = ψ(a/p).
- TauCeti.TateZeta.norm_localGaussSum: |𝔤(ω, ψ)| = 1, recovering |gaussSum| = √p for c = 1.
- TauCeti.TateZeta.fourier_standard_support: f̂^o(x) = 0 whenever ord x ≠ −ν − c.
- TauCeti.TateZeta.localGaussSum_wrong_shift: With ϖ^(−ν−c+1) the integral vanishes. For c>1 use the last nontrivial principal-unit quotient; for c=1 the additive phase is constant on O× and the nontrivial residue character sums to0.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors: the ramified ε-factor DirichletPadicLFunctions:L0: primitive-character Gauss sums in the Dirichlet functional equation

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; mathlib:gaussSum; mathlib:gaussSum_mul_gaussSum_eq_card.

**Proof route.** f̂^o(x) = ∫_{O^×}ω^{−1}(y)ψ(xy)dy vanishes unless ord x = −ν − c: for ord x ≥ −ν it is ∫_{O^×}ω^{−1} = 0, and for −ν > ord x > −ν − c break O^× into cosets of 1 + P^{−ν−ord x}, on which ψ(x·) is constant and ω^{−1} integrates to 0 (Tate p. 25, cases 1 and 2). For ord x = −ν − c substitute y ↦ yu to get (3.31). Apply (3.31) twice with f̂̂(x) = f(−x) to get 𝔤·conj 𝔤 = 1 (Kudla p. 125). Replacing ϖ by ϖu multiplies ω(ϖ^{ν+c}) by ω(u)^{ν+c} and, after the substitution y ↦ u^{ν+c}y, the integral by ω(u)^{−(ν+c)}; so ω(ϖ^{ν+c})𝔤 is unchanged.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Proposition 3.8(ii) and (3.31)–(3.32), printed pp. 124–125 (physical pp. 16–17); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, "k 𝔭-adic", physical pp. 24–26.

### Explicit local ε-factors (Proposition 3.8)

**Declaration.** TauCeti.TateZeta.epsilonFactor_explicit (AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors).

**Theorem.** (i) F nonarchimedean, ω unramified, ν(ψ) = ν: ε(s, ω, ψ) = ω(ϖ^ν)q^{(1/2−s)ν}. (ii) ω ramified with conductor c: ε(s, ω, ψ) = ω(ϖ^{ν+c})q^{(1/2−s)(ν+c)}𝔤(ω, ψ). (iii) F = ℝ, ω(x) = x^{−a}, a ∈ {0, 1}, ψ = e: ε(s, ω, ψ) = i^a. (iv) F = ℂ, ω(x) = x^{−a}x̄^{−b}, min(a, b) = 0, ψ = e(x + x̄): ε(s, ω, ψ) = i^{max(a,b)}. In Tate's normalisation (ψ with conductor 𝔡^{−1}, so ν = ord 𝔡): ρ(|·|^s) = N𝔡^{s−1/2}(1 − q^{s−1})/(1 − q^{−s}) and ρ(c|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(c) for ramified c with conductor 𝔣 and c(π) = 1.

**Hypotheses and conventions.** F is a completion k_v of a number field k. Nonarchimedean: ring of integers O, maximal ideal P = ϖO, q = #O/P, |ϖ| = q^{−1}, ord : F^× → ℤ. Archimedean: F = ℝ with the usual |x|, or F = ℂ with |x| = x·x̄. ω_s(x) = |x|^s. ψ standard at ℝ, ℂ as in (3.30); at a finite place (3.28) and (3.29) reduce to ν = 0 and a fixed ω.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors; AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor.

**Acceptance checks.** Check (i) against Tate's unramified ρ: 1/γ(s) = q^{(s−1/2)d}(1 − q^{s−1})/(1 − q^{−s}) with ν = d = ord 𝔡. Check (iii) against Tate's real table: 1/γ(s + 1, x^{−1}, e) = ρ(±|·|^s) = −i 2^{1−s}π^{−s}sin(πs/2)Γ(s) (Tate p. 21). Check the product over places for k = ℚ, ω = 1: all local ε-factors are 1.

**Proof route.** (i): for ν = 0, f̂^o = f^o, so ε = 1 by (3.27); general ν by (3.29) with ψ = ψ₀(ϖ^ν·). (ii): (3.27) and the Gauss-sum node's (3.31); conj f^o is the standard function for ω^{−1}. (iii): f̂_a = i^a f_a by (2πi)^{−a}D_x^a applied to the Gaussian transform (3.33), and f_a is standard for ω^{−1} = ωω₂. (iv): f̂_{a,b} = i^{a+b}f_{b,a} (3.34), f_{b,a} standard for ω^{−1}, and a + b = max(a, b). Tate p. 22 proves f̂_n = i^{|n|}f_n by induction with 𝒟 = (1/4πi)(∂_x + i∂_y).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §3, Proposition 3.8 and its proof, printed pp. 124–125 (physical pp. 16–17); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §2.5, physical pp. 20–27.

### Canonical archimedean factors

**Declaration.** TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor (AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor).

**Definition.** For unitary-normalized characters, L_R(s,sgn^a|·|^t)=Γ_R(s+t+a), a∈{0,1}, and L_C(s,(z/|z|)^κ|·|_C^t)=Γ_C(s+t+|κ|/2). For a real discrete-series block D_k⊗|det|^t use Γ_C(s+t+(k−1)/2), k≥2. General GL_n archimedean factors multiply over the imported Weil constituents. Kudla’s complex Gaussian zeta normalization is πΓ_C, so its distribution is rescaled to the canonical factor.

**Hypotheses and conventions.** Γ_R=π^(−s/2)Γ(s/2); Γ_C=2(2π)^(−s)Γ(s); |z|_C=zz̄.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.real: Real factors are Γ_R(s+t+a).
- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.complex: Complex factors are Γ_C(s+t+|κ|/2).
- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.discrete_series: The weight-k block has Γ_C(s+t+(k−1)/2).
- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.direct_sum: Weil direct sums multiply the gamma factors.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.real_trivial: a=t=0 gives Γ_R(s).
- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.complex_negative_weight: κ=−3,t=0 gives Γ_C(s+3/2), equal to κ=3.
- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.weight_two: D₂ has Γ_C(s+1/2).
- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.kudla_conversion: Kudla’s complex Gaussian integral is πΓ_C(s); equating it to Γ_C(s) losesπ.

**Uses.** AL.2/standard-local-l-factor: Supply canonical higher-rank archimedean factors. ChenevierTaibi §2.1: Tensor the real Weil blocks for explicit-formula gamma factors.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln.

**Proof route.** Use AL.1 Gaussian Mellin calculations and native gamma duplication. Import AF.1 Weil parameter classification; decompose into real characters and two-dimensional induced blocks. Track the complex-place factorπ in Kudla’s multiplicative Haar normalization.

**Source.** [Peter Humphries, Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), §2.4.2–2.4.3 (2.7), (2.10), (2.13).

### Factorizable distributions and global uniqueness (Lemma 4.1, Theorem 4.2)

**Declaration.** TauCeti.TateZeta.finrank_globalEigenSpace_eq_one (AutomorphicLFunctionsAndLocalFactors:AL.1/global-eigendistributions).

**Theorem.** A restricted family of continuous local distributions normalized on almost every standard vector defines a continuous restricted-tensor distribution. A nonzero global ω-eigendistribution factors into the local eigenlines and the global eigenline has dimension1. No factorization converse is asserted for arbitrary distributions: a sum of two independent product distributions need not be decomposable.

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory.

**Acceptance checks.** Check that the product ∏⟨z₀(s, ω_v), f_v^o⟩ = 1 for the standard f^o = ⊗f_v^o, so ⟨z₀(s, ω), f^o⟩ = 1. A sum of two independent pure-tensor functionals has tensor rank2 and fails the unqualified converse; the corrected eigenline statement excludes this example.

**Proof route.** Extend the product distribution on each finite-place level using the completed archimedean tensor product and continuous multilinear universal property. For an ω-eigendistribution, local eigenline uniqueness forces decomposability, then use density and continuity to recover the global distribution. Check normalization on a product of standard local test functions; the arbitrary-distribution converse in Kudla Lemma4.1 requires the eigencondition.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, Lemma 4.1 and Theorem 4.2, printed p. 126 (physical p. 18); [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, printed p. 126 (physical p. 18).

### The global Tate zeta integral z(s, ω; f)

**Declaration.** TauCeti.TateZeta.globalZetaIntegral (AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral).

**Definition.** For a character ω of 𝔸^×/k^× and f ∈ S(𝔸), z(s, ω; f) = ∫_{𝔸^×} f(x)ωω_s(x)d^×x (4.1) converges absolutely for Re s > 1; for factorizable f it is ∏_v z(s, ω_v; f_v) (4.2), and as distributions z(s, ω) = Λ(s, ω)z₀(s, ω) (4.3) there. In Tate's form (Definition 4.4.1), ζ(f, c) = ∫ f(𝔞)c(𝔞)d^×𝔞 for quasi-characters c trivial on k^× of exponent > 1, with Tate's measure d^×𝔞 = ∏_v d^×𝔞_v.

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. d^×x = ∏_v d^×x_v with vol(O_v^×) = 1 at almost all v (Kudla) or N𝔡_v^{−1/2} (Tate).

**Public interface.**

- TauCeti.TateZeta.globalZetaIntegral: z(s, ω; f) = ∫_{𝔸^×} f(x)ω(x)|x|^s d^×x.
- TauCeti.TateZeta.globalZetaIntegral_integrable: Absolute convergence for Re s > 1.
- TauCeti.TateZeta.globalZetaIntegral_pure: (4.2): for f = ⊗f_v, z(s, ω; f) = ∏_v z(s, ω_v; f_v).
- TauCeti.TateZeta.globalZetaIntegral_eq_completed_mul: (4.3): z(s, ω; f) = Λ(s, ω)⟨z₀(s, ω), f⟩ for Re s > 1.
- TauCeti.TateZeta.globalZetaIntegral_act: z(s, ω; r(a)f) = (ωω_s)(a)^{−1}z(s, ω; f), and = z(s, ω; f) for a ∈ k^×.

**Discriminating examples.**

- TauCeti.TateZeta.globalZetaIntegral_rat_standard: k = ℚ, ω = 1, f^o = 1_Ẑ ⊗ e^{−πx²}: z(s, 1; f^o) = completedRiemannZeta s for Re s > 1.
- TauCeti.TateZeta.globalZetaIntegral_unramified_factor: At v ∉ S the factor of z(s, ω; f^o) is (1 − ω_v(ϖ_v)q_v^{−s})^{−1}.
- TauCeti.TateZeta.globalZetaIntegral_zero: z(s, ω; 0) = 0.
- TauCeti.TateZeta.globalZetaIntegral_not_convergent: For k = ℚ, ω = 1, f = f^o the integral diverges at s = 1 (the pole of ζ): Re s > 1 cannot be relaxed.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation: the function continued and satisfying ζ(f, c) = ζ(f̂, ĉ) BorelRegulators:R.5: Dedekind zeta functions and their leading terms DirichletPadicLFunctions:KU-zeta: the completed Dedekind zeta function

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/global-eigendistributions; AdelicAlgebraicGroups:AA.0.

**Proof route.** Integrability: for factorizable f the integral is a product (AA.0 Fubini for restricted products; Tate Theorem 3.3.1); for v outside a finite set S the factor is L_v(s, ω_v) (unramified node) and ∏_{v∉S}(1 − q_v^{−σ})^{−1} converges for σ > 1. Linear combinations of factorizable functions span S(𝔸). (4.3): compare (4.2) with ⊗z₀(s, ω_v) place by place.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, (4.1)–(4.5), printed pp. 126–127 (physical pp. 18–19); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4, Definition 4.4.1, physical p. 49.

### The completed Hecke L-function Λ(s, ω)

**Declaration.** TauCeti.TateZeta.completedHeckeL (AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function).

**Definition.** For a character ω of 𝔸^×/k^×, Λ(s, ω) = ∏_v L_v(s, ω_v) (4.4) over all places, with the unramified, ramified (L = 1) and archimedean factors; L^S(s, ω) = ∏_{v∉S}L_v(s, ω_v) for a finite set S containing the archimedean and ramified places. Both converge absolutely for Re s > 1. For S ⊇ S_∞ ∪ {ramified v}, L^S(s, ω) = Σ_{𝔞 prime to S} χ(𝔞)N𝔞^{−s}, where χ(𝔭_v) = ω_v(ϖ_v) is the associated ideal character (Kudla §5; Tate §4.5).

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

**Public interface.**

- TauCeti.TateZeta.completedHeckeL: Λ(s, ω) = ∏_v L_v(s, ω_v), Re s > 1, then continued.
- TauCeti.TateZeta.partialHeckeL: L^S(s, ω) = ∏_{v∉S} L_v(s, ω_v).
- TauCeti.TateZeta.partialHeckeL_eq_LSeries: L^S(s, ω) = Σ_{(𝔞, S) = 1} χ(𝔞)N𝔞^{−s} for Re s > 1.
- TauCeti.TateZeta.completedHeckeL_eq_mul: Λ(s, ω) = ∏_{v∈S}L_v(s, ω_v)·L^S(s, ω).
- TauCeti.TateZeta.completedHeckeL_eq_globalZeta: Λ(s, ω) = z(s, ω; f^o) for the standard f^o.

**Discriminating examples.**

- TauCeti.TateZeta.completedHeckeL_rat_one: k = ℚ, ω = 1: Λ(s, 1) = completedRiemannZeta s.
- TauCeti.TateZeta.completedHeckeL_dirichlet: k = ℚ, ω attached to a primitive Dirichlet character χ: L_∞ = Γ_ℝ(s) (χ even) or Γ_ℝ(s + 1) (χ odd, ω_∞ = sgn = x^{−1}ω₁), which is Mathlib's DirichletCharacter.gammaFactor, and Λ(s, ω) = gammaFactor χ s · LFunction χ s.
- TauCeti.TateZeta.partialHeckeL_trivial_char: ω = 1: L^{S_∞}(s, 1) is the Dedekind zeta function NumberField.dedekindZeta.
- TauCeti.TateZeta.completedHeckeL_not_product_over_ideals: Λ(s, ω) is not Σ χ(𝔞)N𝔞^{−s} alone: the archimedean factors and the ramified factors L_v = 1 are part of it.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation: the function satisfying Λ(s, ω) = ε(s, ω)Λ(1 − s, ω^{−1}) AnalyticNumberTheory:AN.4: completed Hecke and Dedekind L-functions for the class-number formula and Chebotarev PeriodsAndSpecialValues:PS.7: GL₁ functional equations and pole conventions (RS-13)

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory; AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral.

**Proof route.** Absolute convergence from ∏_v(1 − q_v^{−σ})^{−1}, σ > 1 (Tate p. 56). Expand each Euler factor as a geometric series and multiply out (unique factorisation of ideals; ArithmeticDirichletSeries Layer 3).

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, (4.4), printed p. 127 (physical p. 19); [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §5, printed p. 129 (physical p. 21).

### The volume κ of the norm-one idele class group (Tate Lemma 4.3.1, Theorem 4.3.2)

**Declaration.** TauCeti.TateZeta.volume_fundamentalDomain_eq (AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume).

**Lemma.** With Tate's measures (d^×α = (N𝔭/(N𝔭 − 1))|α|^{−1}dα at finite v, so vol(O_v^×) = N𝔡_v^{−1/2}; dα/|α| at real v; 2r dr dθ/r² at complex v), the product decomposition 𝔸^× = T × J (T ≅ ℝ_{>0} at a chosen archimedean place, dt/t) and d^×𝔞 = dt·d^×𝔟, the fundamental domain E for J/k^× built from the units and h ideal-class representatives satisfies (1) J = ⊔_{α∈k^×}αE and (2) vol(E) = κ = 2^{r₁}(2π)^{r₂}hR/(w√|d|), where R is the regulator, h the class number, w the number of roots of unity and d the discriminant. κ agrees with the arithmetic expression defining native NumberField.dedekindZeta_residue K; Mathlib already proves its real one-sided residue identification via NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT. The extra analytic task is its comparison with this adelic measure and the full complex Tate continuation. Discreteness and compactness are imported from GlobalNumberFields, not reproved here. A change to finite multiplicative unit-volume1 rescales κ by sqrt(|d|).

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures, not Kudla's: the value of κ depends on vol(O_v^×) = N𝔡_v^{−1/2}.

**Direct inputs.** mathlib:NumberField.dedekindZeta_residue; mathlib:NumberField.Units.regulator; mathlib:NumberField.classNumber; mathlib:NumberField.Units.torsionOrder; mathlib:NumberField.discr; AdelicAlgebraicGroups:AA.0; mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT.

**Acceptance checks.** Check k = ℚ: r₁ = 1, r₂ = 0, h = R = 1, w = 2, d = 1, so κ = 1.

**Proof route.** Lemma 4.3.1: ℓ : J_{S_∞} → ℝ^r, 𝔟 ↦ (log|𝔟_v|)_{v ≠ v₀}; the preimage of the unit parallelotope P has volume R·vol(ℓ^{−1}(Q)) and vol(ℓ^{−1}(Q)) = 2^{r₁}(2π)^{r₂}/√|d| from the local volumes 2 (real), 2π (complex) and ∏N𝔡_v^{−1/2} = |d|^{−1/2}. Theorem 4.3.2: E = ⊔_i E₀𝔟^{(i)} with E₀ the part of ℓ^{−1}(P) with 0 ≤ arg 𝔟_{v₀} < 2π/w; divide by the ideal class, then by units and roots of unity. Compare the resulting expression with Mathlib's dedekindZeta_residue_def. Import the native real one-sided Dedekind residue theorem; identify its arithmetic residue with κ in the self-dual measure convention. Complex continuation is supplied by the global Tate theorem, not re-proved by the native real limit.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.3, Lemma 4.3.1, Definition 4.3.2, Theorem 4.3.2 and Corollary 4.3.1, physical pp. 44–48; [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4, Main Theorem 4.4.1, physical p. 50.

### Tate's Lemma A: the functional equation of ζ_t

**Declaration.** TauCeti.TateZeta.zetaSlice_add_eq (AutomorphicLFunctionsAndLocalFactors:AL.1/tate-lemma-a).

**Lemma.** For f ∈ S(𝔸) (or Tate's class 𝔷), a quasi-character c of 𝔸^×/k^× and t > 0, put ζ_t(f, c) = ∫_J f(t𝔟)c(t𝔟)d^×𝔟. Then ζ_t(f, c) + f(0)∫_E c(t𝔟)d^×𝔟 = ζ_{1/t}(f̂, ĉ) + f̂(0)∫_E ĉ(𝔟/t)d^×𝔟, with ĉ = |·|c^{−1}.

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures; E the fundamental domain of idele-class-volume.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation; AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space.

**Acceptance checks.** Check k = ℚ, f = f^o, c = |·|^s: Lemma A becomes Riemann's θ-relation behind completedRiemannZeta_one_sub.

**Proof route.** ζ_t(f, c) + f(0)∫_E c(t𝔟) = Σ_{α∈k^×}∫_{αE} … + f(0)∫_E … = ∫_E [Σ_{ξ∈k} f(ξt𝔟)]c(t𝔟)d^×𝔟, using J = ⊔αE, the invariance of d^×𝔟 and c(α) = 1, and uniform convergence on the relatively compact E (condition 𝔷2). Riemann–Roch: Σ_ξ f(ξt𝔟) = |t𝔟|^{−1}Σ_ξ f̂(ξ/(t𝔟)); then 𝔟 ↦ 𝔟^{−1} and reverse the steps for f̂, ĉ.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4, Lemma A, physical pp. 50–51.

### Tate's Lemma B: ∫_E c(t𝔟)d^×𝔟

**Declaration.** TauCeti.TateZeta.integral_fundamentalDomain_char (AutomorphicLFunctionsAndLocalFactors:AL.1/tate-lemma-b).

**Lemma.** For a quasi-character c of 𝔸^×/k^× and t > 0: ∫_E c(t𝔟)d^×𝔟 = κt^s if c = |·|^s on 𝔸^× (c trivial on J), and 0 if c is nontrivial on J.

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume.

**Acceptance checks.** Check c = |·|^{it}: the integral is κt^{it}, the case that produces the poles.

**Proof route.** ∫_E c(t𝔟) = c(t)∫_E c(𝔟); the latter is the integral over the compact group J/k^× of the character induced by c, which is vol(E) = κ or 0; and c(t) = t^s when c = |·|^s.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4, Lemma B, physical p. 51.

### Tate's global functional equation (Main Theorem 4.4.1; Kudla Theorem 4.3)

**Declaration.** TauCeti.TateZeta.globalZeta_functional_equation (AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation).

**Theorem.** For f ∈ S(𝔸) (more generally f ∈ 𝔷), ζ(f, c) continues from exponent > 1 to a meromorphic, single-valued function on every class {c₀|·|^s} of quasi-characters of 𝔸^×/k^×. It is holomorphic except, when c₀ is trivial on J (c = |·|^s), for simple poles at s = 0 and s = 1 with residues −κf(0) and κf̂(0). It satisfies ζ(f, c) = ζ(f̂, ĉ), ĉ = |·|c^{−1}; explicitly ζ(f, c) = ∫_1^∞ζ_t(f, c)dt/t + ∫_1^∞ζ_t(f̂, ĉ)dt/t + [κf̂(0)/(s − 1) − κf(0)/s], the bracket present only when c = |·|^s. In distributions (Kudla Theorem 4.3): z(s, ω) continues meromorphically and ẑ(1 − s, ω^{−1}) = z(s, ω).

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s. Tate's measures in the residue formula; κ from idele-class-volume.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/tate-lemma-a; AutomorphicLFunctionsAndLocalFactors:AL.1/tate-lemma-b; AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space; mathlib:completedRiemannZeta_eq; mathlib:completedRiemannZeta_residue_one.

**Acceptance checks.** Check k = ℚ, f = f^o, c = |·|^s: the formula becomes completedRiemannZeta s = completedRiemannZeta₀ s − 1/s − 1/(1 − s) with residues −1 at 0 and +1 at 1 (κ = 1, f(0) = f̂(0) = 1): Mathlib completedRiemannZeta_eq and completedRiemannZeta_residue_one. Check that the poles occur only for c trivial on J: for ω nontrivial on J the bracket is absent and z(s, ω; f) is entire.

**Proof route.** Split ζ(f, c) = ∫_0^∞ζ_t(f, c)dt/t at t = 1; ∫_1^∞ converges for every c since |𝔞| ≥ 1 there. Rewrite ∫_0^1 by Lemma A and Lemma B, substitute t ↦ 1/t, and evaluate ∫_0^1 κt^{s−1}dt/t etc. to get the bracket (for Re s > 1). The two ∫_1^∞ integrals are entire in s; the expression is symmetric under (f, c) ↦ (f̂, ĉ), since ĉ = |·|^{1−s} when c = |·|^s.

**Source.** [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4, Main Theorem 4.4.1 and its proof, physical pp. 50–52; [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, Theorem 4.3, printed p. 128 (physical p. 20).

### The global ε-factor ε(s, ω)

**Declaration.** TauCeti.TateZeta.globalEpsilon (AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor).

**Definition.** For a character ω of 𝔸^×/k^× and a nontrivial ψ = ∏ψ_v of 𝔸/k, ε(s, ω) = ∏_v ε_v(s, ω_v, ψ_v) (4.6), a finite product since ε_v = 1 when v is finite, ω_v is unramified and ν(ψ_v) = 0. It does not depend on ψ, and ẑ₀(1 − s, ω^{−1}) = ε(s, ω)z₀(s, ω) (4.7). By Proposition 3.8, ε(s, ω) = ε(1/2, ω)·(|d_k|N𝔣(ω))^{1/2−s} for the standard ψ, with 𝔣(ω) = ∏𝔭_v^{c(ω_v)} and |ε(1/2, ω)| = 1.

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

**Public interface.**

- TauCeti.TateZeta.globalEpsilon: ε(s, ω) = ∏_v ε_v(s, ω_v, ψ_v).
- TauCeti.TateZeta.globalEpsilon_indep: ε(s, ω) is the same for every nontrivial ψ trivial on k.
- TauCeti.TateZeta.globalEpsilon_eq_conductor: ε(s, ω) = ε(1/2, ω)(|d_k|N𝔣(ω))^{1/2−s}.
- TauCeti.TateZeta.norm_globalEpsilon_half: |ε(1/2, ω)| = 1.
- TauCeti.TateZeta.fourier_globalNormalized: (4.7): ẑ₀(1 − s, ω^{−1}) = ε(s, ω)z₀(s, ω).

**Discriminating examples.**

- TauCeti.TateZeta.globalEpsilon_rat_one: k = ℚ, ω = 1: ε(s, 1) = 1.
- TauCeti.TateZeta.globalEpsilon_dirichlet: k = ℚ, ω attached to a primitive Dirichlet character of conductor N: ε(s, ω) = N^{1/2−s}ε(1/2, ω), the N-power in Mathlib's DirichletCharacter.IsPrimitive.completedLFunction_one_sub; ε(1/2, ω) is the product of the p | N Gauss-sum factors and i^a at ∞, to be matched with rootNumber through the ω ↔ χ^{±1} dictionary of GlobalNumberFields Layer 9.
- TauCeti.TateZeta.globalEpsilon_unramified_everywhere: ω unramified everywhere and k = ℚ: ε(s, ω) = i^{a} with a from ω_∞.
- TauCeti.TateZeta.localEpsilon_not_global: A single local factor ε_v(s, ω_v, ψ_v) does depend on ψ_v (3.29); only the product over all places is independent.

**Uses.** AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation: the constant in Λ(s, ω) = ε(s, ω)Λ(1 − s, ω^{−1}) DirichletPadicLFunctions:L0: root numbers of Dirichlet characters

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors; AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors; AutomorphicLFunctionsAndLocalFactors:AL.1/global-eigendistributions; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation.

**Proof route.** Every nontrivial character of 𝔸/k is ψ_β, β ∈ k^× (Tate Theorem 4.1.4); by (3.29) ε changes by ∏_v|β|_v^{s−1/2}ω_v(β) = 1 (product formula and ω(β) = 1). Almost all factors are 1 by Proposition 3.8(i) with ν = 0; (4.7) is the product of the local (3.23). The s-dependence: q_v^{(1/2−s)(ν_v + c_v)} at finite v, with Σν_v log q_v = log|d_k| for the standard ψ.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, (4.6)–(4.7), printed p. 128 (physical p. 20); [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, printed p. 128 (physical p. 20).

### Continuation and functional equation of Hecke L-functions (Kudla Corollary 4.4)

**Declaration.** TauCeti.TateZeta.completedHeckeL_one_sub (AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation).

**Theorem.** For a character ω of 𝔸^×/k^×, Λ(s, ω) continues to a meromorphic function on ℂ with Λ(s, ω) = ε(s, ω)Λ(1 − s, ω^{−1}). Λ(s, ω) is entire unless ω = |·|^{iu} for some real u, in which case its only poles are simple, at s = −iu and s = 1 − iu. Equivalently (Tate §4.5) Hecke's ζ(s, χ) = Σ_{(𝔞,S)=1}χ(𝔞)N𝔞^{−s} continues and satisfies ζ(1 − s, χ^{−1}) = ∏_{v∈S}ρ_v(c̃_v|·|^{s+it_v})·∏_{v∉S}χ(𝔡_v)N𝔡_v^{s−1/2}·ζ(s, χ).

**Hypotheses and conventions.** k a number field, 𝔸 = 𝔸_k, 𝔸^× the ideles with |x| = ∏|x_v|_v, J = {|x| = 1}; ω = ⊗ω_v a character of 𝔸^×/k^× (a Hecke character in the sense of GlobalNumberFields Layer 9); ω_s(x) = |x|^s.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor; AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function; AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/global-eigendistributions; AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation; mathlib:completedRiemannZeta_one_sub; mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub.

**Acceptance checks.** Check k = ℚ, ω = 1: Λ(s, 1) = completedRiemannZeta s and the equation is completedRiemannZeta_one_sub (ε = 1). Check k = ℚ, ω attached to a primitive Dirichlet character: the shape agrees with DirichletCharacter.IsPrimitive.completedLFunction_one_sub. Work Kudla's exercise for k = ℚ(√5): the unramified Hecke character with ω_∞(x₁, x₂) = |x₁/x₂|^{−iπ/log ε} (trivial on O_k^× = ±ε^ℤ) and its conductor-√5 variants; check that the units ≡ 1 mod √5 are generated by −ε², and that ω_5(ε) = i for ω_∞ = sgn(x₁)|x₁/x₂|^{−iπ/(4 log ε)}.

**Proof route.** (4.8): Λ(1 − s, ω^{−1})ẑ₀(1 − s, ω^{−1}) = ẑ(1 − s, ω^{−1}) = z(s, ω) = Λ(s, ω)z₀(s, ω), by (4.3) and Theorem 4.3. Insert (4.7) to get (4.9), and cancel z₀(s, ω), which is nowhere zero (⟨z₀(s, ω), f^o⟩ = 1). Poles: Λ(s, ω) = z(s, ω; f^o) up to a nonzero constant, so they are those of Tate's theorem, present only when ωω_s is trivial on J.

**Source.** [Stephen S. Kudla, Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), §4, Corollary 4.4 and (4.8)–(4.9), printed p. 128 (physical p. 20); [John Tate, Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, physical pp. 53–59.

### The normalized quadratic orbital Tate comparison

**Declaration.** TauCeti.AutomorphicLFunctions.AL1.QuadraticOrbitalTateComparison (AutomorphicLFunctionsAndLocalFactors:AL.1/quadratic-orbital-tate-comparison).

**Comparison.** For the quadratic idele-class character η in Zhang, the zero-orbit integrals are Orb(0+,Φ,s)=Λ(s,η)∏_v Z_v(s,η,Φ_v(·,0))/L_v(s,η) and Orb(0−,Φ,s)=Λ(−s,η)∏_v Z_v(−s,η,Φ_v(0,·))/L_v(−s,η). Each normalized local integral is entire and equals1 at unramified standard data.

**Hypotheses and conventions.** Use Zhang’s stated local measures and L-factors. The second orbit has−s from inversion, not s; η=η^(−1).

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function; AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem.

**Acceptance checks.** At an unramified standard place each normalized local quotient is1. The two zero orbits use s and−s respectively; changing both to s breaks the source functional equation.

**Proof route.** Use the displayed zero-orbit definitions and change g↦g^(−1) in the second integral. Apply Tate’s Euler factorization in Re(s)>1 for the first orbit, then continue. Apply normalized local holomorphy and identify the almost-everywhere standard factor1.

**Source.** [Wei Zhang, Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), §12.5 pp.946–947 (12.15)–(12.19).

### The CM quadratic Hecke completion

**Declaration.** TauCeti.AutomorphicLFunctions.AL1.CmQuadraticCompletion (AutomorphicLFunctionsAndLocalFactors:AL.1/cm-quadratic-completion).

**Theorem.** For E/F CM quadratic, F totally real of degree g, let η be the nontrivial quadratic idele-class character, Q=|D_F|N(f_η)=|D_E|/|D_F|. The canonical conductor-balanced completion is Λ_η(s)=Q^(s/2)Γ_R(s+1)^g L_f(s,η), entire of order at most1, with Λ_η(s)=W_ηΛ_η(1−s), W_η=1. The unbalanced completion L_η(s)=Γ_R(s+1)^gL_f(s,η) satisfies L_η(s)=Q^(1/2−s)L_η(1−s).

**Hypotheses and conventions.** Use conductor-discriminant theorem from GlobalNumberFields; the quadratic root number1 follows from the Dedekind zeta quotient.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor.

**Acceptance checks.** The conductor parameter is |D_E|/|D_F|, not |D_E| alone. The balanced completion has root number1; removing Qˢ⁄² produces exactly Q¹⁄²⁻ˢ in the functional equation.

**Proof route.** Apply Tate continuation; η is nontrivial on the norm-one idele class group and its infinity parity is odd at every real place. Use the arithmetic conductor-discriminant formula and the ζ_E/ζ_F completion comparison to fix W=1. Growth of truncated Tate integrals gives order≤1; the detailed sharp growth proof is an explicit source refinement.

**Source.** [Jesse Thorner and Asif Zaman, An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), §2B p.1141 (2-3)–(2-7).

### The CM gamma logarithmic correction

**Declaration.** TauCeti.AutomorphicLFunctions.AL1.CmLogarithmicGammaCorrection (AutomorphicLFunctionsAndLocalFactors:AL.1/cm-logarithmic-gamma-correction).

**Theorem.** For the unbalanced CM completion L_η=Γ_R(s+1)^gL_f, L_η′(0)/L_η(0)=L_f′(0)/L_f(0)−(g/2)(γ+log(4π)). Its functional equation gives L_η′(0)/L_η(0)+L_η′(1)/L_η(1)=−log Q. Balancing adds (1/2)log Q to each logarithmic derivative.

**Hypotheses and conventions.** η CM quadratic; L_f(0) and L_f(1) nonzero; γ Euler’s constant.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/cm-quadratic-completion; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor.

**Acceptance checks.** For g=1 the archimedean logarithmic derivative at0 is−(γ+log4π)/2. Balancing changes each logarithmic derivative by(log Q)/2, and the two unbalanced endpoint derivatives sum to−log Q.

**Proof route.** Differentiate the displayed nonzero gamma factor at0 using ψ(1/2)=−γ−2log2. Logarithmically differentiate the unbalanced functional equation near0. Use the explicit conductor-balancing exponential; no branch choice of log L is needed since the quotient L′/L is used.

**Source.** [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §7.1 p.590, displayed gamma correction.

## AL.2 — Standard factors and analytic properties

The matrix integral has exponent s+(n−1)/2, so rank one is exactly Tate's integral. Finite-place common denominators are principal fractional ideals over the Laurent polynomial ring; the archimedean factor is a product of gamma factors of Weil constituents. Their equality with normalized integrals is a theorem. Global continuation, strict unitary Satake bounds and vertical-strip estimates support the order bound and the application of Hadamard theory. Superpositivity requires an entire completion and, over number fields, RH. The trivial function-field character requires its own polynomial pole clearer. Classical holomorphic cusp-form continuation is imported from Tau Ceti's ModularForms library rather than planned again; the Maass specialization records its distinct Fourier normalization.

### The Godement–Jacquet zeta integral

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral).

**Definition.** For n≥1, an irreducible admissible π of GL_n(F), matrix coefficient β(g)=ℓ(π(g)v), and Φ∈S(Mat_n(F)), put Z(s,β,Φ)=∫_{GL_n(F)}β(g)Φ(g)|det g|_F^(s+(n−1)/2)dg in its absolute-convergence half-plane. dg gives GL_n(O) volume1 at an unramified finite place.

**Hypotheses and conventions.** F is a local field; at infinity π is a Casselman–Wallach representation and ℓ a continuous contragredient vector.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.integral: Z is the displayed integral in its convergence domain.
- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.bilinear: Z is linear in β and Φ where the integrals converge.
- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.twist: Z(s,β⊗|det|^t,Φ)=Z(s+t,β,Φ).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.rank_one: For n=1 the exponent is s and Z is the Tate integral.
- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.rank_two_shift: For n=2 the determinant exponent is s+1/2.
- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.zero_test: Φ=0 gives Z=0, including after continuation.
- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.haar_scale: Replacing dg by c dg multiplies Z by c; the L-factor normalization is independent of this choice.

**Uses.** HumphriesGJ Theorem1.2: Identify the newform integral with the standard local L-factor. AL.2/global-godement-jacquet: Unfold the adelic matrix integral.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; SmoothRepresentationsOfLocalGroups:SR.3; AutomorphicFormsOnReductiveGroups:AF.1/sf-representation; AdelicAlgebraicGroups:AA.0/local-normalized-haar.

**Proof route.** Import the representation, contragredient and Schwartz carriers, then form the measurable integrand. Prove convergence from matrix-coefficient asymptotics and Schwartz decay before identifying the totalized integral with the analytic family.

**Source.** [Peter Humphries, Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), §2.3 (2.1).

### Convergence of the matrix zeta integral

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.GodementJacquetConvergence (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-convergence).

**Theorem.** For fixed π,β,Φ the Godement–Jacquet integral converges absolutely for Re(s)>c_π, locally uniformly there with every s-derivative obtained by insertion of powers of log|det g|.

**Hypotheses and conventions.** Use finite-place admissibility and archimedean moderate growth; no universal Re(s)>0 bound is asserted.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral; mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le.

**Acceptance checks.** At n=1 the unitary character case recovers Tate convergence in Re(s)>0. A norm twist shifts the convergence abscissa; no representation-independent Re(s)>0 assertion is permitted.

**Proof route.** Use Cartan/Iwasawa decomposition and SR.3 asymptotic estimates near singular matrices. Schwartz decay dominates infinity; on compact s-sets determinant powers control every logarithmic derivative. Apply native dominated differentiation.

**Source.** [Peter Humphries, Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), §2.3 after (2.1).

### The standard local L-factor

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor (AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor).

**Definition.** At a finite place the C[q^s,q^(−s)]-span of all continued Z(s,β,Φ) is the principal fractional ideal generated by L(s,π)=P_π(q^(−s))^(−1), P_π(0)=1. At infinity L is the product of Γ_R/Γ_C factors of the archimedean Langlands parameter, imported from AF.1; these are distinct constructions with a comparison theorem.

**Hypotheses and conventions.** π irreducible admissible; archimedean parameters use unitary normalization.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.constant: P_π(0)=1 at a finite place.
- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.normalized_zeta: Every Z/L is entire; at each s₀ some quotient is nonzero.
- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.unramified: For Satake roots α_i, L(s,π)=∏_i(1−α_i q^(−s))^(−1).
- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.twist: L(s,π⊗|det|^t)=L(s+t,π).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.trivial_gl1: L(s,1_F)=(1−q^(−s))^(−1).
- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.ramified_gl1: A ramified rank-one character has L=1 rather than a degree-one unramified factor.
- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.real_sign: L(s,sgn)=Γ_R(s+1), not Γ_R(s).
- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.complex_angular: For (z/|z|)^κ |z|_C^t, L=Γ_C(s+t+|κ|/2).

**Uses.** AL.4/l-group-local-factor: Compare with the standard representation of the dual group. AL.3/rs-local-factor: Fix the rank-one tensor comparison.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-convergence; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln; AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory.

**Proof route.** Prove finite rationality and bounded common denominators; the Laurent ring is a PID and fixes the constant term. Import AF.1 classification and evaluate the parameter gamma factors. Prove Z/L extends holomorphically and that the quotients have no common zero.

**Source.** [Peter Humphries, Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), §2.4.1–2.4.3.

### The Godement–Jacquet functional equation

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.GodementJacquetFunctionalEquation (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation).

**Theorem.** With positive trace Fourier transform Φ̂(Y)=∫Φ(X)ψ(tr(XY))dX and self-dual additive measure, Z(1−s,β̌,Φ̂)/L(1−s,π∨)=ε(s,π,ψ)Z(s,β,Φ)/L(s,π), β̌(g)=β(g^(−1)). ε is a nonzero monomial in q^(−s) at finite places.

**Hypotheses and conventions.** Haar and ψ conventions agree with AL.1; convert explicitly from native negative Fourier kernel.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation.

**Acceptance checks.** At rank one the formula is the positive-kernel Tate functional equation. The quotient is interpreted by its entire continuation at a pole of L, not by totalized division.

**Proof route.** Use the local matrix distribution functional equation. At finite places exploit the principal fractional ideal; at infinity use the Langlands gamma comparison. Normalize γ=ε L(1−s,π∨)/L(s,π); verify the rank-one Tate reduction.

**Source.** [Peter Humphries, Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2), §2.4.4 (2.15).

### A ramified Godement–Jacquet test vector

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.GodementJacquetNewformTest (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-newform-test).

**Theorem.** Let π be a ramified generic representation of GL_n(F), F nonarchimedean, with conductor c>0, normalized newvectors v°,v̌° and β(g)=⟨π(g)v°,v̌°⟩, β(1)=1. Let Φ(X)=ω_π(X_nn)^(−1)/vol K₀(P^c) when X∈Mat_n(O), X_nj∈P^c for j<n, X_nn∈O×, and 0 otherwise. Then Z(s,β,Φ)=L(s,π).

**Hypotheses and conventions.** Use the newform theorem in SR.5 including c(ω_π)≤c; dg(K)=1.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral; AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor; SmoothRepresentationsOfLocalGroups:SR.5; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test.

**Acceptance checks.** For n=1 and a ramified character the integral reduces to its standard unit-supported test and gives L=1. The factor vol K₀(Pᶜ)⁻¹ and inverse central character on X_nn are retained; replacing Φ by 1_Mat(O) does not give the ramified theorem.

**Proof route.** Express Φ using the normalized newform projector. Insert the spherical Whittaker propagation formula (Humphries Lemma4.1) into the equal-rank RS test integral. Fold the last-row integration and identify the remaining GL_{n−1} test integral; cancel the nonzero meromorphic common factor.

**Source.** [Peter Humphries, Test vectors for nonarchimedean Godement–Jacquet zeta integrals](https://arxiv.org/pdf/1903.02031v2), Theorem1.2, §§4–5.

### The global standard L-function

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.GlobalGodementJacquet (AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet).

**Theorem.** For a unitary cuspidal π of GL_n(𝔸_K), the finite standard Euler product converges absolutely for Re(s)>1. The completed Λ(s,π)=∏_v L(s,π_v) has meromorphic continuation and Λ(s,π)=ε(s,π)Λ(1−s,π∨). If n≥2 it is entire. For n=1 its only possible poles are the Tate norm-character poles. The product of local epsilon factors is independent of the global additive character.

**Hypotheses and conventions.** K is a number field; π is unitary cuspidal. The initial matrix-integral construction gives a sufficiently far-right half-plane; the Re(s)>1 Euler-product boundary additionally uses the self-pair Rankin–Selberg mean-square coefficient argument.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay; AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure; AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products.

**Acceptance checks.** Rank-one trivial character specializes to completed ζ with its two poles; rank≥2 cuspidal inputs are entire. The global epsilon factor is the product in the same positive-character and self-dual measure convention as the local equations.

**Proof route.** Integrate the adelic matrix theta kernel against a cuspidal matrix coefficient. Apply AL.0 Poisson on Mat_n(𝔸), then split by determinant norm. Unfold full-rank matrices; cusp integration kills lower-rank orbits when n≥2. Factor pure tensors and use local normalized nonvanishing to recover Λ; retain the n=1 polar terms. For the unramified self-pair finite product, the Cauchy/Schur identity gives nonnegative coefficients and a prime coefficient |tr(t_v)|². Use RS continuation/poles and ADS Layer8 Landau positivity to obtain absolute convergence in Re(s)>1. Cauchy–Schwarz and the convergent prime norm sum give sum_v |tr(t_v)|q_v^(−σ)<∞ for σ>1. For powers j≥2 use |α_v,i|<q_v^(1/2) to dominate by sum_v q_v^(−(2σ−1)); this proves absolute convergence of the standard logarithmic Euler product. The full original JS coefficient/abscissa proof is a recorded refinement.

**Source.** [Armand Borel, Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), §14, pp.52–53, standard representation case.

### The Jacquet–Shalika Satake bound

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.JacquetShalikaSatakeBound (AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound).

**Theorem.** For an irreducible unitary generic unramified representation of GL_n(F), every unitary-normalized Satake root satisfies q^(−1/2)<|α_i|<q^(1/2). Hence a unitary global cusp form has these bounds at all unramified places. This does not assert temperedness over a number field.

**Hypotheses and conventions.** Genericity is imported from the cuspidal realization; finite local field F.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form.

**Acceptance checks.** For rank one a unitary character has |α|=1, strictly between q⁻¹⁄² and q¹⁄². The spherical nongeneric trivial GL₂ representation has roots q±¹⁄² and fails strictness; genericity cannot be deleted.

**Proof route.** The spherical self-pair integral converges at every Re(s)≥1 by SR.3 unitary generic asymptotics. The unramified denominator includes 1−|α_i|²q^(−s), so it cannot vanish in that region. Apply the same argument to the contragredient to obtain the strict lower bound.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Corollary7.1.2 and proof, pp.58–59.

### The spherical matrix test vector

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.GodementJacquetSphericalTest (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-spherical-test).

**Theorem.** For unramified irreducible π of GL_n(F), choose K-fixed v,ℓ with ℓ(v)=1 and Φ=1_Mat_n(O). With K-volume1 and unitary Satake roots α_i, Z(s,β,Φ)=∏_i(1−α_iq^(−s))^(−1). For n=1 this is the Tate geometric series.

**Hypotheses and conventions.** Finite place; normalized parabolic induction uses δ_B^(1/2); matrix exponent s+(n−1)/2.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral; AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients.

**Acceptance checks.** For n=1 the characteristic function of O and normalized spherical coefficient give (1−αq⁻ˢ)⁻¹. For n=2 normalized induction and exponent s+1/2 produce roots α₁,α₂ without an extra q¹⁄² shift.

**Proof route.** Decompose integral matrices into Cartan double cosets. Evaluate spherical coefficients using the normalized Satake transform supplied by IHG.3. Sum the Schur-polynomial generating series; compare with the native reversed characteristic polynomial.

**Source.** [Peter Humphries, Test vectors for nonarchimedean Godement–Jacquet zeta integrals](https://arxiv.org/pdf/1903.02031v2), §1 (1.1), discussion preceding Theorem1.2.

### Real coefficients of unitary self-dual factors

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.UnitarySelfDualRealFactors (AutomorphicLFunctionsAndLocalFactors:AL.2/unitary-self-dual-real-factors).

**Theorem.** If a local irreducible admissible π is unitary and self-dual, its finite-place normalized Euler polynomial has real coefficients. At infinity its gamma shifts are real or occur in conjugate pairs of the same gamma type. Consequently its local factor is positive at all sufficiently large real s.

**Hypotheses and conventions.** Both unitarity and self-duality are required; positivity is only asserted away from gamma poles and sufficiently far right.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor; AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor.

**Acceptance checks.** The real sign block has Γ_R(s+1), positive for real s>0. A paired pair of gamma shifts t and conjugate(t) gives a positive real product sufficiently far right; individual shifts need not be real.

**Proof route.** Conjugation sends a unitary matrix coefficient β(g) to a coefficient of π∨ by Hermitian invariance. Conjugate the matrix zeta integrals; the uniquely normalized local factor is conjugated. Self-duality identifies the factors; gamma pairs and constant polynomial coefficient1 give positivity far right.

**Source.** [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), Appendix B LemmaB.3 and proof pp.904–905.

### Growth of the centered entire standard completion

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.StandardOrderOne (AutomorphicLFunctionsAndLocalFactors:AL.2/standard-order-one).

**Theorem.** For unitary cuspidal π over a number field whose standard completion is entire, its conductor-balanced centered function φ(z)=Λ(1/2+z,π) is an entire function of order at most1: for every ε>0, |φ(z)|≤exp(C_ε(1+|z|)^(1+ε)). Over a function field an entire standard L-function is a polynomial in q^(−s) times a real exponential, hence has order at most1.

**Hypotheses and conventions.** The rank-one norm/degree characters with poles are excluded by the explicit entirety hypothesis.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-vertical-strip-bounds; GlobalShtukasAndFunctionFieldLanglands:GS.6.

**Acceptance checks.** For a degree-d function-field polynomial in q⁻ˢ, the elementary exponential estimate gives order at most1. A rank-one norm character with poles is outside the entirety hypothesis.

**Proof route.** Use the finite Euler-series bound in a right half-plane and Stirling estimates for the canonical archimedean factors. Transfer the bound to the left by the functional equation; interpolate across bounded strips using the supplied growth theorem. For function fields use GS.6 polynomiality and the finite exponential-polynomial expression. The general number-field strip-growth proof remains a recorded source refinement.

**Source.** [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), TheoremB.2 proof p.904; RemarkB.4 p.905.

### Super-positivity of the standard completion

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.StandardSuperpositivity (AutomorphicLFunctionsAndLocalFactors:AL.2/standard-superpositivity).

**Theorem.** Let π be unitary, self-dual and cuspidal, with entire completed standard L-function. Under RH in the number-field case, every derivative of the real conductor-balanced Λ at1/2 is nonnegative. If centered Λ is non-polynomial, a nonzero derivative of order r forces every derivative of order r+2j to be positive. A constant centered function has positive zeroth derivative and zero higher derivatives.

**Hypotheses and conventions.** Use the unitary normalization, global root number±1, order≤1, and positivity sufficiently far right. Over function fields use GS.6 RH, not an assumed number-field RH.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/unitary-self-dual-real-factors; AutomorphicLFunctionsAndLocalFactors:AL.2/standard-order-one; AnalyticNumberTheory:AN.2; GlobalShtukasAndFunctionFieldLanglands:GS.6.

**Acceptance checks.** For an odd functional equation the zeroth central derivative vanishes and all even central derivatives vanish. The genus-zero constant centered function has positive zeroth derivative and zero positive-order derivatives; strict propagation therefore needs non-polynomiality.

**Proof route.** Import AN.2’s single Hadamard product supplier; pair the imaginary centered zeros to write C z^m∏(1+z²/t_i²), C>0. Compare Taylor coefficients through locally uniform convergent products; infinitely many zero pairs give strict propagation. Alternatively over function fields pair unit-circle roots into cosh factors, with denominator(2j)! in their Taylor series; treat degree0 separately.

**Source.** [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), Appendix B corrected PropositionB.1, TheoremB.2, RemarkB.4 pp.902–906.

### Clearing the trivial function-field poles

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.TrivialFunctionFieldPoleClearer (AutomorphicLFunctionsAndLocalFactors:AL.2/trivial-function-field-pole-clearer).

**Theorem.** For the trivial character over X/F_q, let ζ_X(s)=P_X(q^(−s))/((1−q^(−s))(1−q^(1−s))) and Λ(1,s)=q^((g−1)(s−1/2))ζ_X(s). Then q^(s−1/2)(1−q^(−s))(1−q^(1−s))Λ(1,s)=q^(g(s−1/2))P_X(q^(−s)) is entire and symmetric under s↦1−s. Its central derivatives are nonnegative by the paired-root argument; for g=0 it is1.

**Hypotheses and conventions.** FA.5 supplies the zeta numerator and its functional equation/RH. The number-field factor s(s−1) does not remove the periodic function-field poles.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/standard-superpositivity; FunctionFieldArithmetic:FA.5.

**Acceptance checks.** For X=P¹ the cleared centered function is exactly1. The factors (1−q⁻ˢ)(1−q¹⁻ˢ) remove all periodic zeta poles; s(s−1) removes only the real representatives and fails.

**Proof route.** Substitute the supplier rational zeta formula. Use deg P=2g, reciprocal roots and purity to center the finite exponential polynomial. Pair conjugate reciprocal roots as in the corrected RemarkB.4; check P=1 for genus0.

**Source.** [Zhiwei Yun and Wei Zhang, Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), RemarkB.5 p.906, corrected PAPER-YUN-ZHANG-17/E17.

### The normalized Maass standard L-function

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction (AutomorphicLFunctionsAndLocalFactors:AL.2/maass-standard-l-function).

**Definition.** For a level-one Hecke–Maass cusp eigenform of parity ε∈{0,1}, spectral parameter r and a(1)=1, use φ(z)=2sqrt(y)∑_{m≠0}a(m)K_(ir)(2π|m|y)e(mx), a(−m)=(−1)^εa(m). Define L_f(s)=∑_{m≥1}a(m)m^(−s), with Euler polynomial1−a(p)T+T². The canonical completion is Γ_R(s+ε+ir)Γ_R(s+ε−ir)L_f(s). Duke’s completion π^(−s)Γ((s+ε+ir)/2)Γ((s+ε−ir)/2)L_f(s) is π^ε times this canonical one.

**Hypotheses and conventions.** Import the Maass eigenform, cuspidality and Hecke relations from AF/ModularForms; unitary normalization.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.euler: The p factor is(1−a(p)p^(−s)+p^(−2s))^(−1).
- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.completion: The canonical completion has the displayed two Γ_R factors.
- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.duke: Duke’s completion is π^ε times the canonical one.
- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.twist: The primitive quadratic twist replaces a(m) by χ_d(m)a(m).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.first_coefficient: a(1)=1; no extra factor2 occurs in the Dirichlet series.
- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.odd_completion: For ε=1 Duke’s completion isπ times the canonical completion.
- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.prime_square: a(p²)=a(p)²−1, by the reciprocal quadratic polynomial.
- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.eisenstein_excluded: Replacing the cusp form by an Eisenstein series can introduce poles; entirety is not then asserted.

**Uses.** Duke §5: Use the normalized L-values in cycle and spectral comparisons. AL.3/maass-norm-comparison: Relate a(1)=1 to L² normalization.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-k; AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor; AutomorphicFormsOnReductiveGroups:AF.0.

**Proof route.** Import the form and coefficients; use the native Dirichlet-series carrier. Identify its local polynomial with the GL₂ standard Satake factor. Take the vertical Mellin integral using the K-kernel to compute gamma factors and parity.

**Source.** [William Duke, Özlem Imamoğlu and Árpád Tóth, Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5.2 pp.962–963 (5.7)–(5.9).

### The Maass standard functional equation

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.MaassStandardFunctionalEquation (AutomorphicLFunctionsAndLocalFactors:AL.2/maass-standard-functional-equation).

**Theorem.** The canonical completion of the normalized level-one Maass cusp form is entire and satisfies Λ(s)=(-1)^εΛ(1−s).

**Hypotheses and conventions.** Same hypotheses and gamma convention as maass-standard-l-function.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/maass-standard-l-function; AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet.

**Acceptance checks.** Parity0 has root number+1 and parity1 has root number−1; the latter forces the central value to vanish. Duke’s extra constant π^ε does not change the functional equation but cannot be discarded in norm or period comparisons.

**Proof route.** Take the even or odd vertical Mellin integral. Use modular inversion of the cusp form and exponential cusp decay to continue. Compare with AL.2’s global standard completion; the constant π^ε does not change the sign.

**Source.** [William Duke, Özlem Imamoğlu and Árpád Tóth, Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5.2 p.963 (5.9).

### The archimedean standard epsilon factor

**Declaration.** TauCeti.AutomorphicLFunctions.AL2.ArchimedeanStandardEpsilon (AutomorphicLFunctionsAndLocalFactors:AL.2/archimedean-standard-epsilon).

**Theorem.** For the positive standard Tate character, a real Weil constituent1 has epsilon1, sgn has epsilon i, and I_w=Ind_(W_C)^(W_R)(z/|z|)^w, w≥1, has epsilon i^(w+1). A weight-k discrete-series constituent therefore has epsilon i^k. Over C an angular character of weightκ has epsilon i^|κ|. Direct sums multiply these factors; norm twists do not change these archimedean constants.

**Hypotheses and conventions.** I_0=1⊕sgn is reducible and gives epsilon i by multiplication. The convention is the one in Chenevier–Taïbi footnote6; a negative Fourier character requires the central-character(-1) comparison.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln.

**Acceptance checks.** The real sign block has epsilon i and the reducible I₀=1⊕sgn has epsilon i, whereas D₂ has epsilon −1. Changing to the negative additive character is compared using the central character at −1; it is not silently identified with the positive convention.

**Proof route.** Import AF.1 real/complex Weil constituent classification. Apply the GL₁ Tate constants and the real induced-block epsilon comparison. Multiply over constituents and check the I_0 boundary and discrete-series weight conversion.

**Source.** [Gaëtan Chenevier, Olivier Taïbi, Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §2.1 p.274, footnote6 and epsilon formula.

## AL.3 — Rankin–Selberg factors, periods and function-field products

Opposite Whittaker characters cancel on the unipotent quotient. For unequal ranks there is a whole family of block integrals, indexed by j, and its functional equation pairs opposite indices. At infinity the continuity statement uses completed projective tensor products; finite sums of K-finite vectors realize the exact factor only under the specified equal or adjacent rank hypotheses. Global unfolding uses the cuspidal Fourier expansion and mirabolic Eisenstein functional equation. The resulting pole and boundary theorems support multiplicity one and central periods. Function-field residual products and scalar normalizations are rational-function calculations after the correspondence supplies the cuspidal polynomial and its purity.

### The Whittaker realization

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.WhittakerModel (AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model).

**Definition.** Given generic π of GL_n(F) and a nonzero Whittaker functional λ with λ(π(u)v)=ψ_N(u)λ(v), its Whittaker model is the image v↦W_v, W_v(g)=λ(π(g)v). At infinity use the continuous functional on the Casselman–Wallach globalization; at finite places use the smooth model.

**Hypotheses and conventions.** ψ_N(u)=ψ(Σ_{i=1}^{n−1}u_{i,i+1}); π generic and irreducible.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.equivariance: W(ug)=ψ_N(u)W(g).
- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.right_action: W_{π(h)v}(g)=W_v(gh).
- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.ext: Equality at every g is equality in the model.
- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.realization: The generic irreducible realization is a representation isomorphism onto its image.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.rank_one: For n=1, N is trivial and W(g)=χ(g)W(1).
- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.generic_nonzero: λ≠0 gives a nonzero W; the zero functional cannot define the model.
- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.opposite_character: A model for ψ^(−1) has the inverse unipotent phase and is required for the second RS factor.

**Uses.** AL.3/rs-local-integrals: The integrands pair opposite Whittaker characters. Yu §5.3: Normalize the global factorizable Whittaker vector.

**Direct inputs.** SmoothRepresentationsOfLocalGroups:SR.5; AutomorphicFormsOnReductiveGroups:AF.1/sf-representation; AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization.

**Proof route.** Import smooth/Casselman–Wallach representations and the Whittaker functional uniqueness theorem from SR.5/AF.1 interfaces. Take the linear image into actual functions and prove equivariance and injectivity by irreducibility. Transport the globalization topology, rather than silently giving the image the compact-open topology.

**Source.** [Hervé Jacquet, Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), §1.2–1.3.

### Uniform archimedean Whittaker estimates

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.WhittakerCompactParameterEstimates (AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-compact-parameter-estimates).

**Theorem.** For a compact parameter set Ω in a fixed induced Casselman–Wallach family, there is M such that for every enveloping-algebra differential operator X there is a continuous seminorm ν_X with |ρ(X)W_{u,f}(g)|≤||g||^Mν_X(f) for u∈Ω. Sharper torus estimates give arbitrary decay in the simple-root directions after the prescribed moderate-growth factors.

**Hypotheses and conventions.** Use fixed compact-picture Fréchet carrier; λ_u varies continuously/holomorphically in u.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model; AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization.

**Acceptance checks.** A compact parameter set uses one common growth exponent M while each differential operator has its own continuous seminorm. Pointwise bounds for separately chosen parameter vectors do not prove the uniform family statement.

**Proof route.** Cover Ω by finitely many neighbourhoods controlling λ_u by seminorms. Apply Jacquet Lemma3.12 to π_u(g)dπ_u(X) uniformly on Ω. For sharpened decay apply nontrivial ψ equivariance repeatedly in root directions; the full Proposition3.3 proof is a recorded source refinement.

**Source.** [Hervé Jacquet, Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), §3 Lemma3.12 and Proposition3.2.

### The local Rankin–Selberg integrals

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-integrals).

**Definition.** For generic π_n,π_m with n>m≥1, opposite Whittaker models and 0≤j≤n−m−1, Ψ_j(s,W,W′)=∫_{N_m\GL_m}∫_{Mat_{j,m}}W([[g,0,0],[x,I_j,0],[0,0,I_{n−m−j}]])W′(g)|det g|^(s−(n−m)/2)dx dg. For n=m use Ψ(s,W,W′,Φ)=∫_{N_n\GL_n}W(g)W′(g)Φ(e_ng)|det g|^s dg.

**Hypotheses and conventions.** Local field F, quotient Haar supplied by AA.2; Φ∈S(F^n).

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.equal_rank: The n=m formula includes Φ(e_ng) and exponent s.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.j_range: The unequal-rank family has j=0,…,n−m−1.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.bilinear: Ψ_j is bilinear on convergent inputs; equal rank is also linear in Φ.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.twist: Twisting π_n by |det|^t shifts s to s+t.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.two_by_one: n=2,m=1,j=0 gives ∫F×W(diag(a,1))χ(a)|a|^(s−1/2)d×a.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.equal_rank_one: n=m=1 gives the Tate integral for the product character with Φ.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.rank_gap_three: n=m+3 has three j values 0,1,2; omitting the x-integrals loses the FE partners.

**Uses.** AL.3/global-rs-unfolding: Local factors of the global period. HumphriesGJ §5: The equal-rank newform integral produces the matrix test.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model; AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space; AdelicAlgebraicGroups:AA.2/quotient-measure.

**Proof route.** Opposite unipotent phases make the integrands descend to N_m\GL_m. Use the displayed block embedding and the quotient measure; initially restrict s to absolute convergence. At infinity extend bilinearly to the completed projective tensor product after proving continuity.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture6 §1, Lecture8 §1.

### Local convergence and continuity

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsLocalConvergence (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence).

**Theorem.** For fixed generic π_n,π_m, all Ψ_j converge absolutely in a right half-plane, locally uniformly in s; at infinity they are jointly continuous bilinear forms on the smooth Fréchet models, extending to the completed projective tensor product.

**Hypotheses and conventions.** Parameters in compact sets require the uniform seminorm estimates; a K-finite algebraic tensor statement alone is insufficient.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-integrals; AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-compact-parameter-estimates; SmoothRepresentationsOfLocalGroups:SR.3.

**Acceptance checks.** For n=2,m=1 the formula has exponent s−1/2 and the usual one-variable Whittaker estimate. At infinity continuity is tested on the smooth Fréchet carriers, not inferred solely from algebraic K-finite tensors.

**Proof route.** Apply Iwasawa decomposition and the Whittaker torus asymptotics from SR.3 and AL.3. Control compact parameter sets with common exponents and continuous seminorms. Use dominated differentiation, then the universal property of completed projective tensor products.

**Source.** [Hervé Jacquet, Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), Theorems2.1–2.3; §§3–5.

### The Rankin–Selberg local L-factor

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor).

**Definition.** At a finite place the Laurent-polynomial span of the Ψ_j (and Φ when n=m) is generated by L(s,π_n×π_m)=P(q^(−s))^(−1), P(0)=1. At infinity use L(s,σ_n⊗σ_m) for the imported archimedean Weil parameters and prove that all Ψ/L are entire, with no common zero at any point.

**Hypotheses and conventions.** Generic irreducible inputs; finite fractional ideals and archimedean holomorphic modules are distinct.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.normalize: Ψ/L is entire for every permitted test input.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.nonvanishing: At each s₀ some normalized test input has nonzero value.
- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.unramified: L(s,π×π′)=∏_{i,j}(1−α_iβ_jq^(−s))^(−1).
- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.rank_one: For m=1 the factor is the standard L-factor of the character twist of π.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.one_by_one: Two unramified characters give (1−αβq^(−s))^(−1).
- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.two_by_one: Satake roots (2,3), β=5 give denominator (1−10T)(1−15T).
- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.ramified_product: Two ramified characters can have unramified product; multiplying their separate standard L-factors does not compute the tensor L-factor.

**Uses.** AL.3/global-rs-continuation: Normalized local nonvanishing detects every global pole. Liu2022 §1.1: The completed tensor-product factor at the unitary central point.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-integrals; SmoothRepresentationsOfLocalGroups:SR.3; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln; AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence.

**Proof route.** Finite places: prove rationality, common denominator and independence of j using mirabolic derivatives from SR.3. Infinite places: compare gamma products under AF.1 classification and analyze polar parts of Schwartz Mellin transforms. Minimality uses nonvanishing test tensors, including completed tensors where needed.

**Source.** [Hervé Jacquet, Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), §2 Theorems2.3–2.7; §12.1.

### The local Rankin–Selberg functional equation

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsLocalFunctionalEquation (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation).

**Theorem.** There is a unique γ(s,π_n×π_m,ψ) such that the dual Ψ_{n−m−1−j}(1−s,R(w_{n,m})W̃,W̃′) equals ω_{π_m}(−1)^(n−1)γ(s,π_n×π_m,ψ)Ψ_j(s,W,W′). At equal rank include the self-dual Fourier transform Φ̂. Put γ=ε L(1−s,π_n∨×π_m∨)/L(s,π_n×π_m).

**Hypotheses and conventions.** W̃(g)=W(w_n t(g^(−1))); use the source Weyl matrix convention and positive Fourier kernel consistently.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion; SmoothRepresentationsOfLocalGroups:SR.3.

**Acceptance checks.** For n=m+1 the index0 is its own partner; for n=m+3 the indices0 and2 are paired and index1 is fixed. The factor ω_πm(−1)^(n−1) is retained locally and cancels only after the global product.

**Proof route.** Use equivariant bilinear functional uniqueness, outside finitely many exceptional parameter values, from the mirabolic derivative filtration. Continue the identity meromorphically to every s. Normalize by local L factors; check the central-character sign against rank-one Tate and the opposite ψ model.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture6 §2, Lecture8 §1.

### Archimedean realization of holomorphic multiples

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsArchimedeanRealization (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-archimedean-realization).

**Theorem.** For induced representations of Whittaker type, every holomorphic multiple h(s)L(s,σ⊗σ′) is represented by the appropriate completed-tensor RS integral in Jacquet Theorem2.6. If the induced representations are irreducible and m=n−1 or m=n, L itself is a finite sum of K-finite test integrals (Gaussian-type Φ when n=m). The finite K-finite statement is not extended to arbitrary rank gap or reducible induced inputs.

**Hypotheses and conventions.** Use the ordering and compact-picture models in Jacquet §2; h entire as in Theorem2.6.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln.

**Acceptance checks.** The irreducible equal-rank and adjacent-rank cases admit the exact L-factor as a finite K-finite sum. The completed-tensor theorem covers general rank gaps, but the finite K-finite assertion is not extended to them.

**Proof route.** Prove inclusion in the gamma-factor polar-part space from analytic continuation. Use Borel prescribed-jet lemma and Schwartz Mellin transforms to realize allowed polar parts. Induct on the Langlands blocks and extend continuous tensor forms; the full §12–§16 induction remains a recorded proof-source refinement.

**Source.** [Hervé Jacquet, Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf), Theorems2.6–2.7, Remark2.8; §12.1.

### The unramified Rankin–Selberg test

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsUnramifiedTest (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test).

**Theorem.** For finite F, ψ of conductor O, normalized spherical W°,W′° with value1 at identity, and Φ°=1_{O^n} at equal rank, Ψ_0(s,W°,W′°)=L(s,π×π′). At equal rank use Ψ(s,W°,W′°,Φ°). At ramified π and spherical π′ the essential/newform test uses the conductor-dependent Φ of Humphries (3.10), not blindly 1_{O^n}.

**Hypotheses and conventions.** Satake roots in unitary normalization; spherical/essential Whittaker functions imported from SR.5.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; SmoothRepresentationsOfLocalGroups:SR.5; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients.

**Acceptance checks.** For n=m=1 the reciprocal polynomial is1−αβT. For n=2,m=1 and roots2,3 with β=5 it is(1−10T)(1−15T), with the local Haar and W(1)=1 normalization.

**Proof route.** Use Casselman–Shalika and Iwasawa to write the spherical integral as a sum of Schur polynomials. Apply the Cauchy identity for the product ∏(1−α_iβ_jT)^(−1). For the newform version use the SR.5 essential vector theorem and explicit K₀-volume normalization.

**Source.** [Peter Humphries, Test vectors for nonarchimedean Godement–Jacquet zeta integrals](https://arxiv.org/pdf/1903.02031v2), §3 Theorems3.7,3.9 and formula(3.10).

### Global Whittaker factorization

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.GlobalWhittakerFactorization (AutomorphicLFunctionsAndLocalFactors:AL.3/global-whittaker-factorization).

**Theorem.** For a cuspidal π of GL_n(𝔸), W_φ(g)=∫_{N(K)\N(𝔸)}φ(ug)ψ_N(u)^(−1)du. With quotient volume1, local uniqueness and a fixed restricted tensor realization, a factorizable φ has W_φ=∏_v W_v; almost all W_v are normalized spherical. General archimedean vectors require continuous extension from dense tensors.

**Hypotheses and conventions.** The irreducible π is globally generic; arithmetic/global representation tensor decomposition belongs to AF.3.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form; AdelicAlgebraicGroups:AA.2/quotient-measure.

**Acceptance checks.** At an unramified place with conductor-zero character the normalized spherical factor has W_v(1)=1. At several infinite places dense tensor extension is required; arbitrary global distributions are not assumed decomposable.

**Proof route.** Compactness of the unipotent quotient gives the coefficient integral. Import Flath factorization; successive local Whittaker uniqueness identifies the tensor functional up to one scalar. Fix that scalar using a nonzero pure tensor and normalized spherical components.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §5.3.1 pp.36–38.

### The GL(n) cuspidal Fourier expansion

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.GlnFourierExpansion (AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion).

**Theorem.** For a smooth cuspidal φ of GL_n(𝔸), n≥2, φ(g)=Σ_{γ∈N_{n−1}(K)\GL_{n−1}(K)}W_φ(diag(γ,1)g), with locally uniform absolute convergence in the smooth cuspidal setting. The vanished constant terms are essential; this is not an expansion for arbitrary automorphic functions.

**Hypotheses and conventions.** Use AF.3 rapid decay and the global nontrivial additive character.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/global-whittaker-factorization; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay.

**Acceptance checks.** For n=2 this is the usual nonconstant Fourier expansion on the GL₁ quotient. An Eisenstein constant term is not killed by cuspidality, so the theorem is not asserted for arbitrary automorphic functions.

**Proof route.** Expand successively along the last-row unipotent subgroups by AL.0 Poisson/Fourier inversion on compact adelic quotients. Cuspidality kills the trivial character at each step. Identify nonzero character orbits and their stabilizers; AF.3 decay justifies regrouping.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture4, Fourier expansion.

### The mirabolic Eisenstein series

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries (AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-series).

**Definition.** For Φ∈S(𝔸^n), unitary idele-class character η and Re(s)>1, E(g,s,Φ,η)=|det g|^s∫_{K×\𝔸×}Σ_{ξ∈K^n\{0}}Φ(aξg)|a|^(ns)η(a)d×a. Equivalently E is the sum over P_{n−1,1}(K)\GL_n(K) of the section f(g,s)=|det g|^s∫_{𝔸×}Φ(ae_ng)|a|^(ns)η(a)d×a.

**Hypotheses and conventions.** n≥1; self-dual additive Haar and a specified multiplicative Haar; Schwartz topology uses the completed archimedean factors.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.theta: E is the displayed nonzero theta Mellin integral.
- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.parabolic_sum: E equals the sum of the displayed section over the maximal-parabolic quotient.
- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.central: E(zg,s,Φ,η)=η(z)^(−1)E(g,s,Φ,η).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.rank_one: For n=1, GL₁(K)\GL₁(𝔸) unfolding recovers the Tate integral.
- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.zero_schwartz: Φ=0 gives E=0.
- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.nontrivial_normone: A character nontrivial on the norm-one class group has no theta zero-mode poles; merely calling it nontrivial is insufficient for norm twists.

**Uses.** AL.3/global-rs-unfolding: The equal-rank global period includes E with η=ω_π ω_π′. AL.3/rs-global-poles: Its two zero-mode residues determine the self-pair poles.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space; AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral; AdelicAlgebraicGroups:AA.2/quotient-measure.

**Proof route.** Use the theta integral and Schwartz summability. Decompose nonzero rational row vectors into projective lines to obtain the parabolic sum. Prove section covariance E(zg)=η(z)^(−1)E(g), which matches the central-character product in the global RS integral.

**Source.** [James W. Cogdell, L-functions and converse theorems for GL(n)](https://people.math.osu.edu/cogdell.1/columbia-www.pdf), §1.1.3, pp.4–5.

### Continuation and residues of mirabolic Eisenstein series

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinFunctionalEquation (AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-functional-equation).

**Theorem.** E(g,s,Φ,η)=E(t(g^(−1)),1−s,Φ̂,η^(−1)) meromorphically. If η=|·|^(−inσ), the only possible simple poles are s=iσ and1+iσ. For η=1 and κ=vol(K×\𝔸¹) with Tate measures, the zero-mode terms are −κ|det g|^sΦ(0)/(ns)+κ|det g|^(s−1)Φ̂(0)/(n(s−1)); otherwise the norm-one character integral vanishes.

**Hypotheses and conventions.** Positive Fourier kernel, additive self-duality; n-fold quotient covolume normalized1.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-series; AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation; AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume.

**Acceptance checks.** For η=1, g=1, the polar zero modes are−κΦ(0)/(ns)+κΦ̂(0)/(n(s−1)). For η=|·|⁻ⁱⁿσ with σ≠0 the poles move to iσ and1+iσ although η is nontrivial; norm-one nontriviality is the criterion that removes them.

**Proof route.** Split the a norm at1 and apply Poisson to the small-norm theta sum. Integrate the two zero terms separately: the exponent ns gives the factor1/n. The two truncated theta integrals are entire by rapid decay; twist s by iσ for the norm-character case.

**Source.** [James W. Cogdell, L-functions and converse theorems for GL(n)](https://people.math.osu.edu/cogdell.1/columbia-www.pdf), §1.1.3, p.5.

### Global Rankin–Selberg unfolding

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.GlobalRsUnfolding (AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding).

**Theorem.** For unitary cuspidal π_n,π_m and pure tensors, the unequal-rank projected cusp integral and the equal-rank integral ∫_{Z_n(𝔸)GL_n(K)\GL_n(𝔸)}φ(g)φ′(g)E(g,s,Φ,ω_πω_π′)dg unfold to ∏_v Ψ_v(s). For n>m project φ along the unipotent radical of (m+1,1,…,1), with factor |det|^(−(n−m−1)/2), then integrate against φ′|det|^(s−1/2).

**Hypotheses and conventions.** Initially Re(s)≫0; global character product trivial on K×. Adjacent rank needs no preliminary projection.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion; AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-series; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-integrals; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay; AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure.

**Acceptance checks.** For n=m the Schwartz function remains in the unfolded local factors. For n=m+1 the projection has no extra norm exponent from n−m−1, leaving s−1/2.

**Proof route.** Apply the GL_n Fourier expansion and identify the mirabolic orbit. Unfold the parabolic Eisenstein sum in the equal-rank case; cusp terms remove all non-open orbits. Use rapid decay for absolute convergence and AA Fubini for pure-factor product decomposition.

**Source.** [James W. Cogdell, L-functions and converse theorems for GL(n)](https://people.math.osu.edu/cogdell.1/columbia-www.pdf), §1.1.2–§1.1.3 pp.3–5.

### Continuation and the Rankin–Selberg pole criterion

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsGlobalPoles (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles).

**Theorem.** For unitary cuspidal π_n,π_m the completed Λ(s,π_n×π_m) continues meromorphically. It is entire if n≠m. If n=m, its only poles are simple at s=iσ and1+iσ for real σ with π_n∨≅π_m⊗|det|^(iσ). In particular Λ(s,π×π∨) has simple poles at0 and1, and Λ(s,π×π′∨) has a pole at1 iff π≅π′.

**Hypotheses and conventions.** Holomorphic normalized local quotients have no common zero; all archimedean factors included.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-functional-equation; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay.

**Acceptance checks.** For a unitary cuspidal self-pair π×π∨ the poles at0 and1 are simple. A same-rank pair unrelated by a unitary norm twist is entire; different ranks are entire.

**Proof route.** The unequal-rank global integral is entire by cuspidal decay. Equal-rank residues are the Petersson pairing times the mirabolic theta zero terms. Local minimality permits test inputs nonvanishing at any prescribed point, so global poles are exactly those of the completed factor.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture9 §3, pp.71–72.

### The global Rankin–Selberg functional equation

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsGlobalFunctionalEquation (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation).

**Theorem.** Λ(s,π×π′)=ε(s,π×π′)Λ(1−s,π∨×π′∨), with ε the finite product of the local factors at ramified/archimedean places. Central-character signs disappear because ∏_vω_{π′_v}(−1)=ω_{π′}(−1)=1. The global product is independent of the chosen global additive character.

**Hypotheses and conventions.** Use unitary cuspidal representations and consistent quotient measures.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles.

**Acceptance checks.** The product of local central-character(−1) signs is1 because−1 is a rational diagonal element. Rank-one inputs reduce to the same Hecke-character functional equation and conductor-power convention as AL.1.

**Proof route.** Apply the global integral change of variables g↦t(g^(−1)). Apply every local RS functional equation to the factorizable integrals. Cancel a nonzero normalized test product meromorphically; use the product formula for the signs and additive-character changes.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture9 §4, p.72.

### Rankin–Selberg vertical-strip bounds

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsVerticalStripBounds (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-vertical-strip-bounds).

**Theorem.** The completed Λ(s,π×π′) for unitary cuspidal inputs is bounded on finite vertical strips away from its polar points. For m=n or n−1, finite K-finite test realization reduces this to the global-integral bounds. For arbitrary rank gaps use the general Gelbart–Shahidi theorem with its normalized-intertwining-operator hypothesis verified for GL(n).

**Hypotheses and conventions.** This is a completed-function bound, not a uniform boundedness assertion for the finite Dirichlet series with gamma factors removed.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-archimedean-realization; AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay; AutomorphicFormsOnReductiveGroups:AF.1.

**Acceptance checks.** Strips through a pole must exclude its neighborhood; the raw completed function is not bounded at that point. Equal/adjacent-rank K-finite integral bounds are distinguished from the general-rank Gelbart–Shahidi input.

**Proof route.** Special ranks: express Λ as a finite sum of globally rapidly decaying RS integrals and use their strip estimates. General ranks: import the Eisenstein/intertwining hypothesis from AF.1 classification and invoke Gelbart–Shahidi. Cogdell explicitly leaves the alternative completed-tensor global proof unwritten; the original general proof and its GL(n) hypothesis check remain a recorded source gap.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture9 §5, pp.72–73.

### The analytic proof of strong multiplicity one

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.StrongMultiplicityOne (AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one).

**Theorem.** If cuspidal π₁,π₂ of GL_n(𝔸_K) have isomorphic local components at all finite places outside a finite set, then π₁≅π₂ globally, including every omitted finite and infinite place; with the AF global multiplicity-one theorem their cusp realizations coincide.

**Hypotheses and conventions.** Unitarize the central characters consistently; every excluded finite and archimedean local factor is nonzero and finite at s=1, by the local unitary bounds and gamma calculation. Agreement at infinity is a conclusion.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound; AutomorphicFormsOnReductiveGroups:AF.3.

**Acceptance checks.** The self-pair partial product has a simple pole at1 while the unrelated pair has none; deleting finitely many places preserves that distinction. Equality of unramified Hecke data is used through Satake, not as equality of unrelated chosen spherical vectors.

**Proof route.** Use the local unitary convergence bounds and gamma-factor nonvanishing to compare poles of full and partial self-pair products at1. Almost-everywhere equality identifies the partial cross-pair with the partial self-pair. Apply the RS pole criterion; global multiplicity one is a separate AF supplier.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Theorem9.3 and proof, pp.74–75.

### Strong multiplicity one for isobaric sums

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.IsobaricStrongMultiplicityOne (AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one).

**Theorem.** Given AF’s existence/classification of isobaric sums π=⊞_iτ_i, equality of unramified components almost everywhere determines the multiset of cuspidal constituents τ_i, including multiplicities and norm twists. Thus two isobaric representations with those components are isomorphic. For arbitrary automorphic constituents the conclusion is equality of cuspidal support, not an unproved assertion that every constituent is itself the same representation.

**Hypotheses and conventions.** Cuspidal support and normalized induction are supplied by AF.1/AF.3, with no duplicate classification here.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicFormsOnReductiveGroups:AF.1; AutomorphicFormsOnReductiveGroups:AF.3.

**Acceptance checks.** Repeated identical cusp constituents are recovered with their multiplicity. For a general automorphic constituent the conclusion is equality of cuspidal support unless the supplied classification identifies the representation itself.

**Proof route.** Factor partial pair L-functions over the cuspidal constituents. Their polar locations detect the norm shifts and multiplicities; compare against one constituent at a time. Remove matching constituents inductively and use the supplier uniqueness of the isobaric quotient.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Theorem9.4, pp.75–76.

### Ramakrishnan’s degree-one comparison

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RamakrishnanDegreeOne (AutomorphicLFunctionsAndLocalFactors:AL.3/ramakrishnan-degree-one).

**Theorem.** Let K/F be an extension of number fields admitting a tower F=K₀⊂K₁⊂…⊂K_r=K with every K_j/K_{j−1} normal. If isobaric π,π′ of GL_n(𝔸_K) agree outside finitely many primes of K having relative degree1 over F, then π≅π′. In particular, for quadratic E/F, agreement above almost all split F-primes suffices.

**Hypotheses and conventions.** Do not weaken the normal-tower hypothesis to an arbitrary finite extension; the solvable-normal-closure case is the separate CorollaryB.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles.

**Acceptance checks.** For quadratic E/F, almost-all split F-primes give the relative-degree1 set of E-primes. A normal tower is explicit; the theorem is not asserted for an arbitrary extension with no such tower.

**Proof route.** Use Luo–Rudnick–Sarnak’s uniform exponent 1/2−1/(n²+1) to control omitted high-degree Euler factors. Use class-field duality to construct solvable extensions increasing relative residue degrees while splitting an auxiliary finite set. Apply refined multiplicity one after solvable base change, then descend using self-twist control. The full auxiliary-extension and descent proofs remain source refinements.

**Source.** [Dinakar Ramakrishnan, A mild Tchebotarev theorem for GL(n)](https://arxiv.org/pdf/1806.08429v1), TheoremA, pp.1–2; proof strategy pp.2–4.

### The normalized adjacent-rank period

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod (AutomorphicLFunctionsAndLocalFactors:AL.3/normalized-rs-period).

**Definition.** For generic π_m⊠π_{m+1}, put λ_v(s,W)=∫_{N_m\GL_m}W(diag(h,1),h)|det h|^s dh and λ_v♮(W)=(λ_v(s,W)/L(s+1/2,π_m×π_{m+1}))|_{s=0}. This is a nonzero continuous H_v-invariant functional, unique up to scalar on the generic representation. For tempered inputs the integral converges for Re(s)>−1/2.

**Hypotheses and conventions.** Take opposite Whittaker characters; normalized quotient entire even if the raw value at0 needs continuation.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.entire: λ_v(s)/L(s+1/2) is entire.
- TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.invariant: λ_v♮ is H_v invariant.
- TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.unramified: λ_v♮(W°)=1 with the conductor-zero character and stated Haar.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.spherical: For two unramified inputs and W° the normalized value is1.
- TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.tempered_half_plane: Re(s)=0 is in the tempered convergence region, while the boundary −1/2 is excluded.
- TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.continued_value: A raw integral that fails to converge at0 is evaluated through the entire quotient, not declared zero by totalization.

**Uses.** Leslie Proposition8.3: Factor the global H period at the central point. AutomorphicPadicLFunctions:L1: Supply the analytic scalar in a rationally normalized period line.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test.

**Proof route.** Identify λ_v with the shifted RS integral and use normalized holomorphy/nonvanishing. At s=0 its covariance is H_v invariance. Local period multiplicity one is a separate supplier requirement; compute the unramified value1 with the spherical test.

**Source.** [Spencer Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/pdf/1911.07907v3), §8.2 pp.58–59, (8.3).

### Central Rankin–Selberg period factorization

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.GlobalCentralPeriod (AutomorphicLFunctionsAndLocalFactors:AL.3/global-central-period).

**Theorem.** For unitary cuspidal Π_m⊠Π_{m+1} and a factorizable cusp vector φ, ∫_{GL_m(K)\GL_m(𝔸)}φ_m(h)φ_{m+1}(diag(h,1))dh=L(1/2,Π_m×Π_{m+1})∏_vλ_v♮(W_v). A quadratic idele-class twist gives the same identity with Π_m⊗η and the twisted local functionals.

**Hypotheses and conventions.** The product uses spherical value1 almost everywhere; quotient measures are those of Leslie §8.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/normalized-rs-period; AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay.

**Acceptance checks.** A spherical unramified local normalized period contributes1. The quadratic twist changes both the global tensor L-function and the corresponding local functionals, in the same character direction.

**Proof route.** Apply adjacent-rank global RS unfolding and normalized local holomorphy. Use rapid cusp decay to evaluate the global period at the unitary centre. Twist the smaller factor before unfolding; preserve the shift s+1/2.

**Source.** [Spencer Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/pdf/1911.07907v3), Proposition8.3 and Corollary8.4 pp.59–60.

### The function-field pair Euler product

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct (AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-rs-euler-product).

**Definition.** For everywhere-unramified discrete Π₁,Π₂ over the function field of a smooth geometrically connected projective curve X/F_q, define L(Π₁×Π₂∨,z)=∏_v∏_{i,j}(1−α_{v,i}β_{v,j}^(−1)z^(deg v))^(−1) first as a formal series with constant term1. Its rationality follows after the cuspidal/residual comparisons, rather than being part of a formal infinite-product definition.

**Hypotheses and conventions.** Finite field q>1; finite number of points of each degree; β nonzero.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.constant: The formal series has constant term1.
- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.local: The v factor is the determinant for α_v⊗β_v^(−1), with z raised to deg v.
- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.unitary_conjugate: For unitary Π₂ replace inverse Satake roots by conjugates as multisets.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.rank_one: At degree d with α=2,β=3 the factor is (1−(2/3)z^d)^(−1).
- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.degree_two: A degree2 place contributes first in z², not z.
- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.self_pair: A rank-one self-pair has local factor (1−z^d)^(−1).

**Uses.** Yu §6.1: Count roots and poles of residual pair factors. Yu §5.1.2: Build the scalar normalizing factors for AA intertwining operators.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor; GlobalShtukasAndFunctionFieldLanglands:GS.6/local-factors-purity-and-multiplicity; AutomorphicFormsOnReductiveGroups:AF.1.

**Proof route.** Define coefficients by finite products through degree N; prove stabilization. Use unitary conjugation only for unitary Π₂, when inverse and complex-conjugate multisets agree. Compare with the GS.6 cohomological factor in the cusp case and then with the AF residual decomposition.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §5.1.2 p.30, §6.1.

### Cuspidal pair degrees and poles over a function field

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.FunctionFieldCuspidalPolynomial (AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-cuspidal-polynomial).

**Theorem.** Let π₁,π₂ be unitary everywhere-unramified cuspidal of ranks n₁,n₂, g=genus X, and write L=P/Q with P(0)=Q(0)=1 and P,Q coprime. If ranks differ or π₁,π₂ are not inertially equivalent then Q=1 and deg P=(2g−2)n₁n₂. In the self-pair rank n case, with d=|Fix(π)|, Q=(1−z^d)(1−(qz)^d) and deg P=(2g−2)n²+2d; ε=q^((g−1)n²). Unit-modulus inertial twists rotate z.

**Hypotheses and conventions.** Inertial equivalence means twisting by an unramified degree character; not literal equality.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-rs-euler-product; GlobalShtukasAndFunctionFieldLanglands:GS.6/the-global-correspondence-for-gl-r; GlobalShtukasAndFunctionFieldLanglands:GS.6/local-factors-purity-and-multiplicity.

**Acceptance checks.** For a rank-one self-pair, Q=(1−z)(1−qz) and deg P=2g. A pair of equal rank without inertial equivalence has Q=1; equality of rank alone does not create the self-pair pole factor.

**Proof route.** Use GS.6 correspondence and the cohomological L-function of the tensor local system. Schur’s lemma computes H⁰; Poincaré duality computes H²; Frobenius cyclically permutes the d components. Use the compact Euler characteristic (2−2g)n₁n₂ for H¹ dimension and purity to ensure numerator and denominator coprime.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Proposition6.1.1 and proof pp.42–43.

### The self-pair polynomial reflection

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.FunctionFieldSelfPairReflection (AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-self-pair-reflection).

**Theorem.** For the self-pair numerator P above, D=(2g−2)n²+2d, P(z)=q^(D/2)z^D P(1/(qz)); every root has modulus q^(−1/2). The H¹ alternating pairing has similitude q and pairs Frobenius eigenvalues with product q.

**Hypotheses and conventions.** Use GS purity, geometric Poincaré duality and the chosen complex embedding; this is not a new proof of global function-field Langlands.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-cuspidal-polynomial; GlobalShtukasAndFunctionFieldLanglands:GS.6/local-factors-purity-and-multiplicity.

**Acceptance checks.** For a rank-one self-pair the degree is2g and the reflection is P(z)=q^g z^(2g)P(1/qz). The H¹ eigenvalues pair with product q, and every numerator root has modulus q⁻¹⁄².

**Proof route.** The cup-product pairing is alternating in degree1 and Frobenius scales it by q. Compare the paired eigenvalue determinant to obtain the polynomial reflection with constant term1. Apply the supplier purity theorem to each complex embedding; the resulting root radius belongs to the analytic comparison.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Proposition6.1.1 proof p.43 and (6.2.5) p.46.

### The residual Rankin–Selberg product

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.ResidualRsProduct (AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-product).

**Theorem.** Given AF’s discrete residual Π₁=π₁⊠ν₁ and Π₂=π₂⊠ν₂ in unitary normalization, L(Π₁×Π₂∨,z)=∏_{i=1}^{ν₁}∏_{j=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2+1−i−j)z). The ranks of Π_k are n_kν_k, where n_k is the cusp rank.

**Hypotheses and conventions.** ν₁,ν₂ positive integers; everywhere-unramified function-field representations. Residual classification belongs to AF, not AL.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-rs-euler-product; AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-cuspidal-polynomial; AutomorphicFormsOnReductiveGroups:AF.1.

**Acceptance checks.** For ν₁=ν₂=1 there is no q shift. For ν₁=2,ν₂=1 the two cusp factors have shifts q¹⁄² and q⁻¹⁄².

**Proof route.** At each place substitute the AF residual Satake shifts (ν+1)/2−i. Multiply the finite tensor roots and regroup the formal Euler factors. Apply rationality of the cusp pair factors to continue the formal identity rationally.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Lemma6.1.3, pp.43–44.

### Telescoping the residual normalizing quotient

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.ResidualRsTelescoping (AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-telescoping).

**Theorem.** If ν₁≥ν₂, L(Π₁×Π₂∨,z)/L(Π₁×Π₂∨,q^(−1)z)=∏_{i=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2−i)z)/∏_{i=1}^{ν₂}L(π₁×π₂∨,q^(−(ν₁+ν₂)/2+i−1)z).

**Hypotheses and conventions.** Equality of nonzero rational functions; the two products include their possible cancellations.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-product.

**Acceptance checks.** For ν₁=ν₂=1 the quotient is L(z)/L(q⁻¹z). For ν₁=2,ν₂=1 the surviving numerator shift is q¹⁄² and denominator shift q⁻³⁄².

**Proof route.** Expand the residual product on both sides. Cancel the inner rectangular array of shifts. Reindex the surviving boundary rows; verify ν₁=ν₂=1 gives L(z)/L(q^(−1)z).

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), (6.1.5), p.44.

### The open-disc zero–pole index

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex (AutomorphicLFunctionsAndLocalFactors:AL.3/open-disc-zero-pole-index).

**Definition.** For nonzero P,Q∈ℂ[z], define I(P/Q)=Σ_{a∈P.roots, |a|<1}1−Σ_{b∈Q.roots, |b|<1}1, counting multiplicities. This is independent of the rational presentation, since common roots cancel. It is N(f)−P(f) in the open unit disc; boundary roots are excluded. Use native meromorphic divisor/order APIs for the comparison.

**Hypotheses and conventions.** P,Q are nonzero; the zero function is excluded and roots carry multiplicity.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.presentation: PQ′=P′Q implies equal indices for nonzero denominators.
- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.mul: I(fg)=I(f)+I(g) for nonzero rational functions.
- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.inv: I(1/f)=−I(f).
- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.divisor: I(f) equals the sum of its finite native divisor in |z|<1.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.coordinate: I(z)=1.
- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.inverse_coordinate: I(1/z)=−1.
- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.boundary_excluded: I(z−1)=0 since1 lies on the boundary.
- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.cancelled_presentation: I(z/z)=0, despite a zero in each presentation polynomial.

**Uses.** Yu Corollary6.1.2: Compute the residual normalizing quotient index. Yu Proposition5.1.1(c): Supply the scalar logarithmic-derivative winding count.

**Direct inputs.** mathlib:MeromorphicOn.divisor; mathlib:MeromorphicOn.divisor_fun_mul; mathlib:MeromorphicOn.divisor_fun_inv.

**Proof route.** Use native Polynomial.roots and filter by the strict norm inequality. Prove presentation independence by cross-multiplication and root-multiset additivity. Compare the root count to the finite sum of the native divisor on the open disc; no arbitrary meromorphic infinite zero count is introduced.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Corollary6.1.2, p.43.

### The residual zero–pole index

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.ResidualRsIndex (AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-index).

**Theorem.** For unitary everywhere-unramified Π₁=π₁⊠ν₁,Π₂=π₂⊠ν₂ with ν₁≥ν₂, the open-disc index of L(z)/L(q^(−1)z) is ν₂(2g−2)n₁n₂ plus d=|Fix(π₁)| precisely when Π₁ and Π₂ are inertially equivalent (equivalently ν₁=ν₂ and π₁ inertially equivalent to π₂); otherwise there is no d term.

**Hypotheses and conventions.** Correct the equality sign in Yu Corollary6.1.2 as recorded by PAPER-YU-23/E15; inertial twists have unit-modulus degree parameter.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-telescoping; AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-self-pair-reflection; AutomorphicLFunctionsAndLocalFactors:AL.3/open-disc-zero-pole-index.

**Acceptance checks.** For ν₁=ν₂=1 and inertially equivalent cusps the extra term is d. For unequal residual lengths there is no d term, even when the underlying cusps are inertially equivalent.

**Proof route.** Use the telescoped quotient and the purity radius to place all numerator cusp zeros inside and all denominator cusp zeros outside the unit disc. Count the self-pair poles at1 and q^(−1); cancel boundary poles only when the residual lengths match. Rotate by the unitary inertial twist and observe the index is unchanged.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Corollary6.1.2 and proof pp.43–44.

### The Rankin–Selberg normalizing scalar

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-normalizing-scalar).

**Definition.** For a positive root β joining residual blocks Π_i,Π_j of ranks N_i,N_j over X/F_q, put n_β(z)=q^((1−g)N_iN_j)L(Π_i×Π_j∨,z)/L(Π_i×Π_j∨,q^(−1)z). The scalar for a Weyl element is the product over its positive inversion roots, with the corresponding character ratios substituted for z. The actual intertwining operators remain with AA/AF.

**Hypotheses and conventions.** Nonzero rational factors; equality is meromorphic/rational, not a value formula at poles.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.root: The single-root scalar is the displayed shifted-L quotient.
- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.identity_weyl: The empty inversion product is1.
- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.weyl_product: For length-additive Weyl products, inversion factors compose after character substitution.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.genus_one: At g=1 the q prefactor is1.
- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.one_root: A simple reflection has exactly one root factor.
- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.pole_not_value: If the numerator has a pole at z=1, the scalar is compared as a rational function, not by substituting a totalized pole value.

**Uses.** Yu Proposition5.3.4: Identify the scalar spherical action of the AA intertwiner. Yu §6.2.2: Reflect the self-pair normalizer.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-telescoping; AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-rs-euler-product.

**Proof route.** Use the residual Euler factors and the stated volume normalization. Form the root-indexed finite product. Compare the scalar cocycle with AA/AF’s operator normalization only after their interface is supplied.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §5.1.2 (5.1.1)–(5.1.3) pp.29–30.

### Reflection of the self-pair normalizer

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.SelfPairNormalizerReflection (AutomorphicLFunctionsAndLocalFactors:AL.3/self-pair-normalizer-reflection).

**Theorem.** For Π=π⊠ν, cusp rank r, f=|Fix(π)| and self-pair numerator P, define F(z)=∏_{i=1}^ν P(q^(−i)z)∏_{i=1}^ν(1−(q^iz)^f)∏_{i=1}^{ν−1}(1−(q^iz)^f). Then n_β(z)=−z^E F(1/z)/F(z), E=((2g−2)r²+4f)ν−f. F is a polynomial in z^f with no roots on |z|=1.

**Hypotheses and conventions.** ν≥1; q>1 and the self-pair reflection/purity theorem. E is an integer, so this is a rational monomial identity.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-normalizing-scalar; AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-self-pair-reflection.

**Acceptance checks.** For ν=1 the exponent is(2g−2)r²+3f and F=P(q⁻¹z)(1−(qz)^f). The two geometric-factor products have lengths ν andν−1, respectively; their unit-circle roots remain excluded.

**Proof route.** Substitute the telescoped self-pair quotient and cancel the Q factors. Apply P(z)=q^(deg P/2)z^(deg P)P(1/(qz)) to each numerator factor. Collect the q powers, signs and z powers; purity places the roots of P(q^(−i)z) at radius q^(i−1/2)>1, and the remaining factors at q^(−i)<1.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), (6.2.5)–(6.2.6), p.46.

### Spherical Whittaker normalization at nonzero conductor

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.WhittakerConductorShift (AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-conductor-shift).

**Theorem.** Let ψ_v be trivial on P_v^(−n_v) but not P_v^(−n_v−1), and t_v=diag(ϖ_v^(−(n−1)n_v),…,ϖ_v^(−n_v),1). Then W↦(g↦W(t_vg)) identifies the spherical ψ_v model with the conductor-zero ψ_v(ϖ_v^(−n_v)·) model. For a nonzero spherical W, W(t_v)≠0. For the differential-defined global character, Σ_v n_v deg v=2g−2.

**Hypotheses and conventions.** Import the differential/residue character and canonical divisor from FunctionFieldArithmetic; no new differential theory is planned.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test.

**Acceptance checks.** At n_v=0 the diagonal t_v is the identity. At rank2, t_v=diag(ϖ⁻ⁿᵥ,1), and ψ_v(ϖ⁻ⁿᵥ·) has conductor0.

**Proof route.** Conjugation by t_v multiplies every simple-root coordinate by ϖ_v^(−n_v). Apply the conductor-zero spherical Whittaker formula with its nonzero value at identity. Use the supplier canonical-divisor degree; keep its sign aligned with the largest-trivial-ideal convention.

**Source.** [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Lemma5.3.3 proof pp.37–38.

### The Maass Fourier and Petersson normalization

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.MaassNormComparison (AutomorphicLFunctionsAndLocalFactors:AL.3/maass-norm-comparison).

**Theorem.** For a level-one Hecke–Maass cusp eigenform with the Duke expansion and a(1)=1, ∫_(SL₂(Z)\H)|φ|² dxdy/y²=2L(1,Ad φ)/cosh(πr). In the W_(0,ir)(4π|n|y) convention, ρ(1)λ(n)=sqrt(n)ρ(n) and W_(0,ir)(x)=sqrt(x/π)K_(ir)(x/2), so the Duke normalization is exactlyρ(1)=1. L²-unit normalization therefore has |ρ(1)|²=cosh(πr)/(2L(1,Ad φ)).

**Hypotheses and conventions.** Level1 and standard hyperbolic measure of volumeπ/3; coefficients normalized as above. No unspecified Petersson scalar is allowed.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/maass-standard-l-function; AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicLFunctionsAndLocalFactors:AL.0/bessel-k.

**Acceptance checks.** Duke’s expansion hasρ(1)=1 in the W_(0,ir) convention, despite its visible factor2. For L²-normalization the first coefficient squared is cosh(πr)/(2L(1,Ad φ)); reversing this ratio is incorrect.

**Proof route.** Use W-to-K comparison and the Hecke coefficient relation to identify the two expansions. Unfold the rank-two diagonal Rankin–Selberg integral and take the simple pole at1. Evaluate the archimedean integral and the Eisenstein residue; retain the factor2 in the published norm formula.

**Source.** [Peter Humphries and Asbjørn Christian Nordentoft, Sparse equidistribution of geometric invariants of real quadratic fields](https://arxiv.org/pdf/2211.05890v2), §4.1.1 (4.2)–(4.6) pp.21–22.

### Rankin–Selberg nonvanishing on the boundary

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RsBoundaryNonvanishing (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing).

**Theorem.** For unitary cuspidal π₁,π₂ over a number field, the finite partial Rankin–Selberg L^S(s,π₁×π₂) has no zeros on Re(s)≥1; its poles there occur only at1+it where π₂≅π₁∨⊗|det|^(−it), and are simple. The statement is meromorphic at a pole, not a finite-value assertion.

**Hypotheses and conventions.** S contains ramified and archimedean places; all finite removed factors are nonzero and regular on this boundary by the strict local exponent bound.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound.

**Acceptance checks.** For trivial rank-one inputsζ(s) has a pole at1 and no zero on the asserted boundary. A pole at1+it is treated meromorphically; deleting local factors is justified by their regular nonzero boundary behavior.

**Proof route.** The absolutely convergent Euler product gives nonvanishing for Re(s)>1. On the boundary use the positive auxiliary self-pair of an isobaric sum and Landau’s lemma; handle equivalent imaginary twists with their simple pole. The general Shahidi/Eisenstein argument and complete proof of the positivity boundary step remain an explicitly located source gap.

**Source.** [Peter Sarnak, Nonvanishing of L-functions on Re(s)=1](https://web.math.princeton.edu/sarnak/ShalikaBday2002.pdf), §1 p.3 (5), discussion of Shahidi.

### The motivic versus unitary Rankin–Selberg centre

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.MotivicUnitaryShift (AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift).

**Comparison.** For pure realizations of weights w₀,w₁ whose unramified eigenvalues are q^(w_i/2) times the unitary Satake roots, the motivic tensor factor at s equals the unitary Rankin–Selberg factor at s−(w₀+w₁)/2. In Liu’s Sym^(n−1)H¹⊗Sym^nH¹ case the tensor weight is2n−1 and the motivic central point n corresponds to unitary1/2.

**Hypotheses and conventions.** Require the supplier local-global identification at every place compared; do not infer motivic purity or Galois compatibility from the analytic factor.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test; AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison.

**Acceptance checks.** For weights0 and1 the motivic center1 is the unitary center1/2. For Symⁿ⁻¹H¹⊗SymⁿH¹, weight2n−1 moves the motivic center n to1/2.

**Proof route.** Substitute the two scalar shifts into the tensor Euler polynomial. Match canonical archimedean factors under the same normalization. Import the motivic realization and period convention from the motivic owners.

**Source.** [Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §1.1 pp.109–112, Rankin–Selberg motive normalization.

### The rational-period comparison after choosing structures

**Declaration.** TauCeti.AutomorphicLFunctions.AL3.RationalPeriodComparison (AutomorphicLFunctionsAndLocalFactors:AL.3/rational-period-comparison).

**Comparison.** Given the supplier Whittaker and cohomological E-rational structures for a cohomological cuspidal Π and a permissible real-place signature ε, and a fixed nonzero infinity cohomology vector defining F_Π^ε, normalize F_Π^ε by p^ε(Π)^(−1) to preserve those structures. The period is in C×/E×. Scaling the infinity vector by c scales the comparison and period by c; changing rational bases changes a representative by E×. Twisting by algebraic ξ changes the period class by G(ξ_f)^(n(n−1)/2) with the signature ε·ε_ξ.

**Hypotheses and conventions.** This comparison is conditional on actual supplied rational structures and twisting theorem, not a new construction of automorphic cohomology or a proof of algebraicity. Under σ∈Aut(C), keep the permissible signature action specified by the supplier; do not use an undefined σ ε.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model; AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum.

**Acceptance checks.** Rescaling the infinity generator by c rescales the period by c, while an E-rational basis change alters its class only by E×. At n=2 the twist exponent n(n−1)/2 is1, and the permissible signature is multiplied by the twist signature.

**Proof route.** Use the supplier normalized comparison map and its Aut(C)-equivariance. Apply scalar changes to the fixed infinity vector and rational bases. Import the supplier Gauss-period twisting law (2.39) and use it to translate the normalized analytic RS value.

**Source.** [A. Raghuram, Critical values of Rankin–Selberg L-functions for GL_n×GL_(n−1) and the symmetric cube L-functions for GL₂](https://repository.ias.ac.in/105986/1/GL%28n%29xGL%28n-1%29-revised.pdf), §2.5.2 pp.24–25 (2.37)–(2.39).

### The GL(n) converse theorem with twists through rank n−1

**Declaration.** `TauCeti.AutomorphicLFunctions.AL3.gln_converse_full_rank` (`AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-full-rank`).

**Theorem.** For n≥2, under the stated niceness hypotheses for every cuspidal automorphic twist of each rank 1≤m≤n−1, Π is cuspidal automorphic. At n=2 the twisting family consists of all idele-class quasicharacters; R16.5 retains its separately checked growth and archimedean hypotheses.

**Hypotheses and conventions.** F is a number field; Π is an irreducible admissible restricted tensor representation of GL_n(𝔸_F), spherical almost everywhere, with idele-class central character and Euler products convergent in a right half-plane. Local factors, duals, additive character and archimedean conventions are fixed by AL.2–AL.3. For every indicated cuspidal twist τ, both completed L(s,Π×τ) and its contragredient partner have entire continuations bounded on finite vertical strips and the matching functional equation; these conditions are hypotheses, not consequences of automorphy of τ alone.

**Proof route.**

1. First justify the reduction to generic Π in the original converse proof. Then construct the two opposite-mirabolic Whittaker sums, with their convergence and invariance. The existing cuspidal Fourier expansion fixes conventions, but does not construct these sums for arbitrary Π.
2. Use local functional equations and Mellin/spectral inversion on SL_(n−1) to compare the two sums.
3. Recover rational GL_n invariance and cuspidality from the full twisting family. The missing proof interiors are recorded in G16.

**Direct inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`; `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion`.

**Acceptance checks.** All ranks in the specified twisting family and all analytic hypotheses are retained. Changing the family changes the conclusion. The GL₃ reduced-rank theorem is not silently specialized to GL₂.

**Source.** [James W. Cogdell, Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §2; §3 Theorem3.1, pp.5–8. The statements and survey outline were read on 7 October 2026; G16 retains the original proof decomposition and missing native Lean signatures.

### The GL(n) converse theorem with twists through rank n−2

**Declaration.** `TauCeti.AutomorphicLFunctions.AL3.gln_converse_reduced_rank` (`AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank`).

**Theorem.** For n≥3 and a finite set S of finite places, assume niceness for every cuspidal twist of rank 1≤m≤n−2 unramified at S. If S is empty, Π is cuspidal automorphic; otherwise an automorphic representation agrees with Π outside S. For n=3 these are GL₁ twists. This theorem gives no rank-two conclusion and no highly ramified-twist variant.

**Hypotheses and conventions.** F is a number field; Π is an irreducible admissible restricted tensor representation of GL_n(𝔸_F), spherical almost everywhere, with idele-class central character and Euler products convergent in a right half-plane. Local factors, duals, additive character and archimedean conventions are fixed by AL.2–AL.3. For every indicated cuspidal twist τ, both completed L(s,Π×τ) and its contragredient partner have entire continuations bounded on finite vertical strips and the matching functional equation; these conditions are hypotheses, not consequences of automorphy of τ alone.

**Proof route.**

1. First justify the reduction to generic Π in the original converse proof. Then construct the two opposite-mirabolic Whittaker sums, with their convergence and invariance. The existing cuspidal Fourier expansion fixes conventions, but does not construct these sums for arbitrary Π.
2. Use local functional equations and Mellin/spectral inversion to compare the sums; in the reduced-rank variant apply the additional Fourier inversion and local vanishing construction.
3. Recover rational GL_n invariance and cuspidality; for nonempty S use essential vectors and weak approximation. The missing proof interiors are recorded in G16.

**Direct inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`; `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion`.

**Acceptance checks.** All ranks in the specified twisting family and all analytic hypotheses are retained. Changing the family changes the conclusion. The GL₃ reduced-rank theorem is not silently specialized to GL₂.

**Source.** [James W. Cogdell, Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §2; §3 Theorem3.3, pp.5–6,9. The statements and survey outline were read on 7 October 2026; G16 retains the original proof decomposition and missing native Lean signatures.

## AL.4 — Unramified L-group factors

A supplied L-group representation r and normalized Satake class t give the native reversed characteristic polynomial of r(t). The new interface is its independence of representative and basis and its agreement with the Hecke normalization. Eigenvalue bounds give a right half-plane of absolute convergence. Arbitrary r has no automatic global continuation or functional equation. Ramified factors require an actual compatible parameter; the spherical polynomial alone does not define them. Transfer comparisons assume the actual established transfer and specify each constituent's arithmetic shift.

### The unramified L-group Euler factor

**Declaration.** TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor (AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor).

**Definition.** Given unramified G/F, a semisimple Satake conjugacy class t in the Frobenius coset of the L-group, and a finite-dimensional complex representation r of that L-group, P_{t,r}(T)=det(1−T r(t)) and L(s,t,r)=P_{t,r}(q^(−s))^(−1). Use native Matrix.charpolyRev for the polynomial; the planned work is the independence and Satake normalization interface.

**Hypotheses and conventions.** Finite residue cardinality q>1; r(t) acts on a finite-dimensional space.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.constant: P(0)=1.
- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.conjugacy: Conjugate Satake parameters give the same polynomial.
- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.direct_sum: P_{r⊕r′}=P_r P_{r′}.
- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.standard_gln: For GL_n standard r, P=∏(1−α_iT).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.zero_dimensional: The zero representation gives P=1 and L=1.
- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.one_dimensional: r(t)=a gives P=1−aT.
- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.tensor_not_product: Scalars a=2,b=3 give tensor P=1−6T, whereas the direct sum gives 1−5T+6T².
- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.gln2_integral_shift: Integral Hecke roots are q^(1/2) times the unitary GL₂ Satake roots.

**Uses.** Borel §13: Define the partial global Euler product without assuming functoriality. BCGP §1.8.25: Compare exterior-power factors after an actual automorphic transfer.

**Direct inputs.** AutomorphicFormsOnReductiveGroups:AF.1; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients; mathlib:Matrix.charpolyRev; mathlib:Matrix.charpolyRev; ReductiveGroupsPartII:RG2.5; SmoothRepresentationsOfLocalGroups:SR.4.

**Proof route.** Import the L-group/root datum and Satake parameter from AF/IHG owners. Choose a basis and use native reversed characteristic polynomial. Prove conjugacy/basis invariance and compare the normalized Satake convention.

**Source.** [Armand Borel, Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), §13.1 pp.49–50.

### Convergence of partial automorphic Euler products

**Declaration.** TauCeti.AutomorphicLFunctions.AL4.PartialLProductConvergence (AutomorphicLFunctionsAndLocalFactors:AL.4/partial-l-product-convergence).

**Theorem.** For a unitarizable automorphic π and finite-dimensional r as in Borel13.2, excluding ramified places gives L^S(s,π,r)=∏_{v∉S}P_{t_v,r}(q_v^(−s))^(−1), absolutely convergent for Re(s)>c(π,r). No general continuation or functional equation follows for arbitrary r.

**Hypotheses and conventions.** Use a uniform Satake eigenvalue bound |eigenvalue r(t_v)|≤q_v^a and sum_v q_v^(−σ)<∞ for σ>1.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products.

**Acceptance checks.** If each r(t_v) eigenvalue has size≤q_v^a then Re(s)>a+1 is a valid product half-plane. The zero-dimensional representation gives the identically1 product.

**Proof route.** Obtain a from the weights of r and the unitarizability bound in the positive chamber. Bound log determinants by a convergent geometric series for Re(s)>a+1. Apply the arithmetic prime-norm summability supplier.

**Source.** [Armand Borel, Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), Theorem13.2 pp.50–51.

### Compatibility of local analytic factors with parameters

**Declaration.** TauCeti.AutomorphicLFunctions.AL4.LocalParameterComparison (AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison).

**Comparison.** For GL_n standard factors and GL_n×GL_m tensor factors, whenever the supplier supplies the local Langlands correspondence with L/ε compatibility, the analytic factors from AL.2/AL.3 equal the Weil–Deligne factors. At an unramified place this reduces to P=det(1−T Fr). For a general L-group r, ramified factors require an actual parameter and are not defined from a spherical class.

**Hypotheses and conventions.** At infinity import the proved AF.1 archimedean LLC; at finite places the complete parameter-compatibility theorem is a supplier request.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln.

**Acceptance checks.** An unramified standard GL₂ parameter with roots α,β gives1−(α+β)T+αβT². The ramified compatibility theorem requires its supplier and does not follow by substituting the unramified polynomial.

**Proof route.** Use unramified Satake parameter comparison. At infinity compare Γ_R/Γ_C products on irreducible real/complex Weil constituents. Use the finite-place correspondence compatibility theorem only when supplied; do not infer it from an unramified equality.

**Source.** [Armand Borel, Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), §12, pp.48–49.

### Functorial operations on unramified factors

**Declaration.** TauCeti.AutomorphicLFunctions.AL4.SatakeFactorOperations (AutomorphicLFunctionsAndLocalFactors:AL.4/satake-factor-operations).

**Comparison.** For invertible semisimple Satake operators with eigenvalues α_i and β_j, direct sum multiplies P, tensor product has P(T)=∏_(i,j)(1−α_iβ_jT), dual has P(T)=∏_i(1−α_i^(−1)T), and scalar twist c has P_c(T)=P(cT). Coefficient embeddings commute with these polynomial identities. These are factor comparisons, not assertions of automorphic transfers.

**Hypotheses and conventions.** Actual L-group representations and normalized Satake classes are supplied; dual requires invertibility.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor; mathlib:Matrix.charpolyRev.

**Acceptance checks.** Scalar roots2 and3 have tensor polynomial1−6T but direct-sum polynomial1−5T+6T². A dual scalar2 has root1/2, and scalar twist c substitutes cT in the Euler polynomial.

**Proof route.** Reduce each finite-dimensional operation to an eigenbasis. Use native determinant and reversed characteristic polynomial identities. Descend basis independence through conjugacy; apply coefficient embeddings to the finite polynomial identities.

**Source.** [Armand Borel, Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), §13.1 pp.49–50, local representation factor.

### Exterior-power factors after an established transfer

**Declaration.** TauCeti.AutomorphicLFunctions.AL4.ExteriorPowerTransferComparison (AutomorphicLFunctionsAndLocalFactors:AL.4/exterior-power-transfer-comparison).

**Comparison.** Given an established exterior-power transfer Π^(j) of Π with unramified parameter wedge^j(t_v), its partial standard factor equals ∏_v∏_(I⊂{1,…,n},|I|=j)(1−(∏_(i∈I)α_(v,i))q_v^(−s))^(−1). For BCGP’s H¹ decomposition into GL_(n_i) constituents, arithmetic shifts are(1−n_i)/2 separately on each constituent; their exterior-power decompositions inherit those shifts.

**Hypotheses and conventions.** The actual exterior-square/symmetric-square transfers and any tensor transfer used must be imported from their owners; no all-rank exterior transfer is assumed.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.4/satake-factor-operations; AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison.

**Acceptance checks.** For a two-dimensional standard parameter, its exterior square has root α₁α₂. BCGP constituents of distinct ranks use distinct shifts(1−n_i)/2, rather than one shift for the total H¹ rank.

**Proof route.** Use the exterior eigenvalue formula for each unramified operator. Compare with the supplied transfer’s local-global compatibility. Apply the H¹ arithmetic shift constituent by constituent before taking exterior powers and finite products.

**Source.** [Armand Borel, Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf), §14 pp.51–53; BCGP §1.8.25 external comparison.

## AL.5 — Finite Euler factors and critical values

Deleting finitely many places multiplies the continued function by a finite product of Euler polynomials. Holomorphy permits value comparison; meromorphic order permits zero and pole comparison. An exceptional zero retains its leading coefficient rather than being canceled at a zero denominator. The ordinary GL₂ factor distinguishes a chosen refinement, the good-prime primitive newform and its p-level stabilization. Critical-value algebraicity and periods are supplied inputs; the comparison transports those values through the nonzero gamma and period scalars. The root-number argument is an ordinary complex Taylor-series statement.

### Finite Euler corrections at critical points

**Declaration.** TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection (AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction).

**Definition.** For a finite set S and local polynomials P_v(T), define E_S(s)=∏_{v∈S}P_v(q_v^(−s)). The imprimitive value is L^S(s)=E_S(s)L(s) as a meromorphic identity. It can be evaluated at s₀ only with the relevant holomorphy/limit hypotheses.

**Hypotheses and conventions.** q_v>1, P_v(0)=1; L includes the specified archimedean normalization.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.empty: E_∅=1.
- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.union: For disjoint S,T, E_{S∪T}=E_S E_T.
- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.value: If both terms are holomorphic at s₀, L^S(s₀)=E_S(s₀)L(s₀).
- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.orders: ord_{s₀}(L^S)=ord_{s₀}(E_S)+ord_{s₀}(L).

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.empty_set: Removing no places preserves the value.
- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.simple_exceptional_zero: If E=1−p^(−s), then E(0)=0; division by E(0) cannot recover L(0).
- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.double_exceptional_zero: E=(1−p^(−s))² has order2 at0 and E″(0)=2(log p)².

**Uses.** AutomorphicPadicLFunctions:L1: Separate primitive analytic critical values from local interpolation corrections. ModularSymbolsPadicLFunctions:L4: Track the ordinary Euler factors and exceptional zeros.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.4/l-group-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; mathlib:meromorphicOrderAt_mul.

**Proof route.** Use the Euler-factor identity in its convergence half-plane. Continue the finite product identity meromorphically. Apply local orders, not division by E_S(s₀), at exceptional zeros.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture9 §7, finite-product comparison.

### The critical-value and period interface

**Declaration.** TauCeti.AutomorphicLFunctions.AL5.CriticalValuePeriodInterface (AutomorphicLFunctionsAndLocalFactors:AL.5/critical-value-period-interface).

**Comparison.** For a GL₂/F cohomological cuspidal representation with supplied period line and critical-value algebraicity theorem, pass the completed analytic value to the normalized finite value by dividing the nonzero archimedean gamma value and the supplied period. This interface respects the chosen embedding, character conductor, parity and motivic/unitary shift. It proves no new algebraicity theorem and constructs no p-adic measure.

**Hypotheses and conventions.** Period chosen nonzero; critical point avoids poles of both gamma factors; algebraicity supplied by ModularSymbols/PS/AF owner.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; ModularSymbolsPadicLFunctions:L1.

**Acceptance checks.** For GL₂/Q the source character is matched with the exact χ orχ⁻¹, period sign and Gauss sum used by ModularSymbols L1. The gamma factor and period must both be nonzero before the normalized finite value is formed.

**Proof route.** Use AL.2/AL.3 completion and local factor identities. Apply the supplier critical-value theorem with its exact sign, Gauss sum and factorial. Express the result as an element of the period line, proving inverse scaling under a basis change.

**Source.** [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), AppendixB TheoremB.1 pp.207–209.

### The functional-equation sign at the centre

**Declaration.** TauCeti.AutomorphicLFunctions.AL5.CentralSignVanishing (AutomorphicLFunctionsAndLocalFactors:AL.5/central-sign-vanishing).

**Theorem.** If the conductor-balanced completed L-function is holomorphic at1/2, self-dual, and satisfies Λ(s)=−Λ(1−s), then Λ(1/2)=0. More generally its first nonzero Taylor term at the centre has parity determined by the root number. If the gamma value is finite and nonzero, the same vanishing order holds for the finite L-function.

**Hypotheses and conventions.** Self-duality identifies both sides without an extra conjugation or twisting; the root number is ±1.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation.

**Acceptance checks.** An odd functional equation forces the central value and every even Taylor coefficient to vanish. An even equation permits a nonzero central value; gamma poles are excluded from the claim that the finite L-function has the same order.

**Proof route.** Evaluate the functional equation at1/2 in characteristic0. Compare Taylor coefficients after z↦−z. Use multiplication by the nonzero holomorphic gamma/conductor factor to preserve orders.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture9 §4.

### The leading term of a finite Euler correction

**Declaration.** TauCeti.AutomorphicLFunctions.AL5.EulerCorrectionLeadingTerm (AutomorphicLFunctionsAndLocalFactors:AL.5/euler-correction-leading-term).

**Theorem.** Let E and L be holomorphic near s₀, E have finite vanishing order m and L have finite order r. Then EL has order m+r and leading Taylor coefficient the product of the two leading coefficients. In particular if E(s₀)=0, E′(s₀)≠0 and L(s₀)≠0, (EL)′(s₀)=E′(s₀)L(s₀). For E(s)=1−a q^(−s) with a q^(−s₀)=1, E′(s₀)=log q.

**Hypotheses and conventions.** q>1; zero functions require separate infinite-order cases. This is complex analytic comparison, not a p-adic exceptional-zero formula.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction; mathlib:MeromorphicOn.divisor_fun_mul; mathlib:meromorphicOrderAt_mul.

**Acceptance checks.** For E=1−q⁻ˢ at s₀=0, E′(0)=log q and (EL)′(0)=log q·L(0). For E=(1−q⁻ˢ)² the second derivative at0 is2(log q)²; a simple-zero rule would fail.

**Proof route.** Use native local meromorphic orders and analytic Taylor expansions. Multiply the first nonzero Taylor terms; no division by a vanishing value. Differentiate the actual finite exponential factor to obtain log q.

**Source.** [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture9 finite-factor identities; analytic consequence.

### The ordinary GL₂ interpolation factor

**Declaration.** TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor (AutomorphicLFunctionsAndLocalFactors:AL.5/ordinary-gl2-euler-factor).

**Definition.** For a good prime p, weight k+2, nebentypus ε and chosen nonzero refinement α with β=ε(p)p^(k+1)/α, define E_p(χ,j)=(1−χ(p)p^j/α)(1−χ^(−1)(p)ε(p)p^(k−j)/α), 0≤j≤k. A ramified p-power character is extended byχ(p)=χ^(−1)(p)=0, so E_p=1. The conductor-normalized prefactor α^(−ν) for condχ=p^ν is separate.

**Hypotheses and conventions.** Use the exact character/period/Gauss dictionary from ModularSymbolsPadicLFunctions:L1; the two-factor expression uses the good-prime newform, whereas the p-level eigenform has the first factor only.

**Public interface.**

- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.ramified: For ν>0 both local character values are0 and E_p=1.
- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.unramified: For χ=1 use the displayed two-factor product.
- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.refinement: Changing α changes β and the Euler correction; the unrefined form alone does not determine E_p.
- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.newform: The p-level eigenform formula has only the first factor; the primitive newform adds the second factor after the character dictionary.

**Discriminating examples.**

- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.trivial_weight_two: k=j=0,χ=1,ε(p)=1 gives(1−1/α)².
- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.ramified_weight_two: A conductor-p character gives E_p=1, with the separate prefactorα^(−1).
- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.exceptional: α=1,k=j=0 gives E_p=0; it cannot be canceled.
- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.different_roots: For p=3,k=j=0, ε(p)=1 and Hecke polynomial X²+3, the refinements α=±i√3 are both valid roots and give distinct corrections (1−1/α)².

**Uses.** ModularSymbolsPadicLFunctions:L4: Compare primitive and p-stabilized interpolation. AutomorphicPadicLFunctions:L2: Specialize the GL₂/F normalization to F=Q.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction; ModularSymbolsPadicLFunctions:L1; ModularSymbolsPadicLFunctions:L2.

**Proof route.** Form the two finite factors in the coefficient field and evaluate under the chosen complex embedding. Import the supplier stabilization comparison L(f_α,χ^(−1),s)=(1−βχ^(−1)(p)p^(−s))L(f,χ^(−1),s), after matching the analytic inverse-character convention. Match the supplier inverse-character convention before substituting s=j+1; do not silently identify χ andχ^(−1).

**Source.** [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Appendix B TheoremB.1 p.208, with supplier newform comparison.

### Conductor and test-vector compatibility

**Declaration.** TauCeti.AutomorphicLFunctions.AL5.LocalConductorTestVectorComparison (AutomorphicLFunctionsAndLocalFactors:AL.5/local-conductor-test-vector-comparison).

**Comparison.** For generic irreducible π of GL_n(F) with conductor-zero ψ, the degree in q^(−s) of the standard epsilon monomial is c_π, the imported generic newform conductor. The GJ normalized newform integral realizes L(s,π). At a good GL₂ place, twisting an unramified π by a ramified character χ of conductorν>0 gives L(s,π⊗χ)=1 and conductor2ν. At rank1 it gives L=1 and conductorν.

**Hypotheses and conventions.** The GL₂ twist assertion uses an unramified generic representation; it is not a formula for arbitrary already-ramified π. Nonzero newform normalization and compatible measures are required.

**Direct inputs.** AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-newform-test; AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum; AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison; SmoothRepresentationsOfLocalGroups:SR.5.

**Acceptance checks.** At an unramified GL₂ place a character of conductorν has twisted conductor2ν and L=1. At rank one the corresponding conductor isν, and neither formula is asserted for arbitrary already-ramified inputs.

**Proof route.** Compare the AKY epsilon definition with the conductor supplied by SR.5’s generic newform theorem. Use the actual GJ newform projector theorem; keep its ramified Schwartz test rather than a spherical vector. For an unramified Weil parameter twisted by ramifiedχ, inertia invariants vanish and Artin conductor multipliesν by rank, using the supplier local compatibility.

**Source.** [Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://arxiv.org/pdf/2110.09070v4), Introduction pp.2–3 epsilon conductor; generic-newform application.

## Library comparisons and supplier boundaries

The native additive-character and vector Fourier declarations supply the algebraic subgroup and integral calculations. The annihilator remains an additive subgroup: for the real integer lattice it contains 1 but not 1/2, and it is therefore not a real submodule. Native SchwartzMap is used at infinity. Native TemperedDistribution is a continuous dual equipped with pointwise convergence; a uniform-bound argument must refer to Schwartz seminorms and its own compact parameter estimates, rather than silently substituting a stronger dual topology. Matrix.charpolyRev supplies det(1−TX); meromorphic orders and divisors supply multiplicities and cancellation. The analytic wrappers compare these objects, and do not duplicate them.

Mathlib's real one-sided Dedekind zeta residue theorem already proves the arithmetic class-number expression as s approaches 1 from the right. The adelic volume comparison identifies that expression in the chosen Haar convention. The full complex continuation and functional equation follow from Tate's global argument. For primitive Dirichlet characters, native completedLFunction already has its conductor-power functional equation; its rootNumber is compared only after matching the idele character with the character or its inverse.

Tau Ceti's CuspForm.abscissaOfAbsConv_qExpansion_coeff_le gives the holomorphic cusp-form bound k/2+1. CuspForm.LSeries_qExpansion_coeff_eq identifies the coefficient series with the width-scaled ModularForm.L in that half-plane, and CuspForm.hasEntireExtension_qExpansion_coeff supplies the positive-weight entire continuation. These are supplier theorems for the classical specialization. The Maass completion, Whittaker coefficient normalization and adjoint norm identity have separate hypotheses and comparisons.

Finite-place complex GLₙ local Langlands compatibility for all ramified L and epsilon factors is an explicit supplier input. Archimedean compatibility comes from AutomorphicForms; arithmetic local–global compatibility applies only in its stated range. A determinant equality at unramified places supplies no proof of the general ramified comparison. Likewise, the strict q±¹⁄² Satake bounds supply no number-field Ramanujan assertion, and an exterior-power polynomial identity supplies no automorphic transfer.

## Mathematical refinements at the boundaries

**actual arithmetic/representation interfaces.** SR.1 supplies the local-field Schwartz carrier and scaling action; AA.0 supplies the restricted adelic carrier, tensor completion and Fourier product. AA.2 supplies the invariant quotient measure. Each theorem using these inputs depends on their continuity, measurability and normalization comparisons, rather than only the existence of the underlying set.

**local-field inverse duality proof.** Local self-duality requires surjectivity and continuity of the inverse Pontryagin map. At finite places the proof uses compatible finite lattice quotients and the inverse-different pairing, together with compact-open annihilators. The native character-space type supplies the target of this map; it does not supply the inverse theorem.

**point-supported distributions.** Point support and continuity give finite order, and finite order gives factorization through a finite jet space. The resulting polynomial jet dual is the finite span of delta derivatives. Distribution support and F×-finiteness are distinct inputs: finite support alone does not specify the permitted eigencharacters.

**K-Bessel order derivative proof.** The half-order K derivative requires differentiation under the integral with logarithmic domination, a Gaussian substitution and integration by parts. The boundary terms at zero and infinity vanish for c>0. The remaining tabulated identity has the precise negative exponential-integral normalization Ei(−2c).

**nonarchimedean Godement–Jacquet proof source.** The finite matrix-integral theory needs rationality, a bounded common denominator, minimality of the normalized generator and the global matrix-space continuation proof. An unramified test alone supplies none of those conclusions. The Re(s)>1 global Euler-product boundary additionally uses the self-pair Schur-positivity coefficient comparison and ArithmeticDirichletSeries Layer8's theorem at the actual finite convergence abscissa.

**finite-place Rankin–Selberg proof refinement.** The SR.5 derivative filtration must supply the steps giving local Rankin–Selberg rationality, a common denominator, j-independence and uniqueness of the equivariant bilinear functional away from finitely many exceptional parameters. Continued normalized test functions then give the exact factor and its local epsilon equation.

**archimedean Rankin–Selberg proof refinement.** Archimedean continuation uses Jacquet's majorization, prescribed jets, polar parts and induction. The estimates must hold on the fixed compact-picture Fréchet carriers and extend through their completed projective tensor product. The finite K-finite realization theorem retains its irreducibility and equal/adjacent rank conditions.

**general vertical-strip boundedness.** The general Gelbart–Shahidi strip bound requires its normalized-intertwining-operator hypothesis for GLₙ. The special equal/adjacent-rank K-finite global integral bounds and native rank-one gamma estimates are separate inputs. A strip containing a polar point requires an explicit puncture or pole subtraction.

**classification and solvable base change.** AutomorphicForms' classification extension supplies residual and isobaric constituents, their uniqueness and the solvable-base-change/self-twist inputs used by Ramakrishnan. The normal extension tower and the construction of fields controlling relative-degree primes remain in that argument. GL₂ transfer alone cannot supply these all-rank classification statements.

**global boundary nonvanishing proof.** The boundary nonvanishing argument uses a positive auxiliary Rankin–Selberg product and its meromorphic pole orders. Absolute convergence in Re(s)>1 proves nonvanishing only in the open half-plane; it does not prove the boundary statement. The deleted local factors must also be regular and nonzero at the boundary under the strict local exponent bounds.

**function-field cohomological degree and duality.** GS.6 supplies the correspondence and purity, and FA.5 supplies tensor Artin rationality, the compact cohomological degree and the alternating H¹ duality pairing. These inputs determine the exact degree, reflection constant and root radii of the cuspidal numerator. Residual shifts and inertial equivalence are retained when those facts are transported to the normalization scalar.

**rational structures and primitive-character dictionary.** The rational-period theorem assumes actual Whittaker and cohomological E-structures and a permissible infinity generator. The GL₂/Q specialization also requires ModularSymbols L1/L2's exact χ versus χ⁻¹, Gauss-sum, period-sign and primitive versus p-level dictionary. A general GL₂/F or higher-rank critical-value theorem requires its own supplied algebraicity statement.

**finite-place parameter compatibility.** The ramified finite-place comparison requires a complex GLₙ local Langlands supplier with monodromy invariants and L/epsilon compatibility. AF.1 supplies the archimedean comparison; R19.4 supplies arithmetic local–global compatibility in its stated scope. Neither an unramified determinant identity nor an arithmetic compatibility theorem outside that scope supplies the general ramified theorem.

**general Hadamard owner refinement.** AnalyticNumberTheory's single Hadamard supplier supplies the entire order-at-most-one RH theorem with real normalization and a non-polynomial hypothesis for strict propagation. The application here verifies entirety, order, positivity in a far-right real interval and the correct completion. The constant centered function remains a separate boundary case.

## Source corrections governing the statements

The conductor divisibility condition is N₀ dividing M: characters at a modulus divisible by their conductor pull back to the same profinite-unit character (E1). The lecture preprint's bibliographic placeholder is Valenza and Ramakrishnan in the published chapter (E2). Kudla's epsilon discussion points to equation (3.23) and Proposition 3.8 (E3). In his real convention ω(x)=x⁻ᵃ, the poles are at even s=−r and the residue is a scalar multiple of Dᵃ⁺ʳδ₀; the alternative parity statement belongs to the sgnᵃ convention (E4). Tate's displayed inverse-different Fourier calculation has N𝔡⁺¹⁄²N𝔭ⁿ, in agreement with the self-dual lattice volume (E5). These identifiers have the prefix AutomorphicLFunctionsAndLocalFactors/.

A restricted tensor distribution factors on product test functions when it is constructed from local distributions. An arbitrary continuous distribution need not be such a tensor: on two independent two-dimensional test subspaces, the coefficient matrix of e₀⊗e₀+e₁⊗e₁ has rank two. The factorization converse in Kudla's published Lemma 4.1 therefore requires a decomposability hypothesis or restriction to an eigendistribution. The global eigenline statement uses the latter restriction. The correction is recorded as AutomorphicLFunctionsAndLocalFactors/E6; the rank-two test distinguishes it from the unqualified converse.

The function-field residual index has the extra stabilizer term d precisely in the inertial-equivalence case, including equality of residual lengths. The corrected condition is PAPER-YU-23/E15. In the superpositivity argument, the r-th derivative and the even-series factorial use the corrected exponents and (2j)! denominator, PAPER-YUN-ZHANG-17/E1 and E2. Entirety is explicit because rank-one norm or degree characters have poles (E15). Strict propagation assumes a non-polynomial centered function (E16), and the function-field trivial-character pole clearer is qˢ⁻¹⁄²(1−q⁻ˢ)(1−q¹⁻ˢ), not s(s−1) (E17). A constant centered function is the boundary case with all positive-order derivatives zero.

## Sources

- John Tate. [Fourier Analysis in Number Fields and Hecke’s Zeta-Functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf). Princeton doctoral thesis, May 1950; original thesis scan, not the 1967 reprint.
- Stephen S. Kudla. [Tate’s Thesis](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf). Chapter 6, An Introduction to the Langlands Program, Birkhäuser 2004, pp.109–131; published chapter scan.
- Stephen S. Kudla. [Tate’s Thesis](https://u.cs.biu.ac.il/~reznikov/courses/kudla-1.pdf). Nineteen-page lecture preprint, expanded from March 2001 Jerusalem lectures; distinct from the published chapter.
- Wei Zhang. [Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf). Annals 193 (2021), 863–978; published PDF.
- Spencer Leslie. [The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/pdf/1911.07907v3). arXiv:1911.07907v3; published Annals201 (2025).
- Dinakar Ramakrishnan. [A mild Tchebotarev theorem for GL(n)](https://arxiv.org/pdf/1806.08429v1). arXiv:1806.08429v1.
- Hongjie Yu. [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5). arXiv:1807.04659v5, 18 July2022; journal pagination not used.
- Zhiwei Yun and Wei Zhang. [Shtukas and the Taylor expansion of L-functions](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf). Annals186 (2017), 767–911; published author PDF.
- Jesse Thorner and Asif Zaman. [An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf). Algebra & Number Theory11 (2017), 1135–1197.
- Benedict H. Gross and Don B. Zagier. [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Inventiones84 (1986),225–320; published scan.
- Xinyi Yuan and Shou-Wu Zhang. [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals187 (2018),533–638; published PDF.
- William Duke, Özlem Imamoğlu and Árpád Tóth. [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Annals184 (2016),949–990; published PDF.
- Peter Humphries and Asbjørn Christian Nordentoft. [Sparse equidistribution of geometric invariants of real quadratic fields](https://arxiv.org/pdf/2211.05890v2). arXiv:2211.05890v2.
- Peter Sarnak. [Nonvanishing of L-functions on Re(s)=1](https://web.math.princeton.edu/sarnak/ShalikaBday2002.pdf). Author manuscript dated January21,2004.
- A. Raghuram. [Critical values of Rankin–Selberg L-functions for GL_n×GL_(n−1) and the symmetric cube L-functions for GL₂](https://repository.ias.ac.in/105986/1/GL%28n%29xGL%28n-1%29-revised.pdf). Author revised manuscript; Forum Mathematicum28 (2016),457–489.
- Joaquín Rodrigues Jacinto and Chris Williams. [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf). Essential Number Theory4 (2025),101–216; published PDF.
- Hiraku Atobe, Satoshi Kondo and Seidai Yasuda. [Local newforms for the general linear groups over a non-archimedean local field](https://arxiv.org/pdf/2110.09070v4). arXiv:2110.09070v4; Forum Math.Pi10 (2022),e22.
- Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu. [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones mathematicae 228 (2022), 107–375; published PDF.
- Gaëtan Chenevier, Olivier Taïbi. [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHÉS 131 (2020), 261–323 (published online 5 March 2020); published PDF.
- Jacob Tsimerman. [The Andre-Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Annals of Mathematics 187 (2018), no. 2, 379-390; published PDF.
- Wee Teck Gan and Atsushi Ichino. [The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3). Annals of Mathematics 188 (2018), no. 3, 965–1016; arXiv1705.10106v3.
- Ana Caraiani and Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals186 (2017),649–766; published PDF.
- Patrick B. Allen et al.. [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals197 (2023),897–1113; published author PDF.
- Frank Calegari and David Geraghty, with an appendix by Frank Calegari, David Geraghty and Michael Harris. [Minimal modularity lifting for nonregular symplectic representations](https://math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Mathematical Journal 169 (2020), no. 5, 801–896; Duke advance-publication author copy, printed pp.1–96 (journal pp.801–896).
- Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor. [The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf). Publications mathématiques de l'IHÉS 135 (2022), 183–336; published PDF.
- George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. [Modularity theorems for abelian surfaces](https://math.uchicago.edu/~fcale/papers/Modular.pdf). Author manuscript corresponding to arXiv2502.20645v1.
- James W. Cogdell. [Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf). Author Fields Institute lecture notes, 2004.
- James W. Cogdell. [L-functions and converse theorems for GL(n)](https://people.math.osu.edu/cogdell.1/columbia-www.pdf). Author Columbia lecture notes.
- Peter Humphries. [Archimedean newform theory for GL(n)](https://arxiv.org/pdf/2008.12406v2). arXiv:2008.12406v2.
- Peter Humphries. [Test vectors for nonarchimedean Godement–Jacquet zeta integrals](https://arxiv.org/pdf/1903.02031v2). arXiv:1903.02031v2.
- Hervé Jacquet. [Archimedean Rankin–Selberg integrals](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf). Contemporary Mathematics 489 (2009), 57–172, author manuscript.
- Armand Borel. [Automorphic L-functions](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf). Corvallis II, PSPM33 (1979), 27–61, published scan.

### Converse source version

Cogdell’s public survey: [author PDF](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf). Read §§2–3 (pp.5–9) on 7 October 2026. SHA-256 `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe`. The original JPSS and Cogdell–Piatetski-Shapiro proof interiors were not acquired in this round.

## Round-3 closure boundaries

### G16: generic converse proof interiors and native signatures

The owner contracts are now explicit. Decompose the reduction from an arbitrary irreducible admissible Π to the generic case and the opposite-mirabolic sums for an arbitrary admissible Π (including convergence), the weak SL_(n−1)/SL_(n−2) spectral inversion, rational-generation argument, reduced-rank local Fourier vanishing construction, and essential-vector/weak-approximation modification at S from the original JPSS and Cogdell–Piatetski-Shapiro proofs. The survey gives statements and an outline, not these full proofs. Identify exact independent analytic suppliers before importing a whole AS stage, which could depend on AL.3. Native global admissible GL_n tensor and completed twisted L/epsilon carriers are required for the two Lean signatures. No arbitrary Prop stand-in is used. Gelbart–Jacquet’s highly ramified T-twist variant is a separate acquisition obligation.

Needed by: `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-full-rank`; `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank`.


## Round-3 structural proposals

### RT-AREA-automorphic-1/1: generic converse theory has a single analytic owner; the GL₃ theorem cannot supply the rank-two theorem by specializing n.

Extract an AL.3b converse prefix containing AL.3/gln-converse-full-rank and AL.3/gln-converse-reduced-rank after their independent local/integral and spectral-inversion suppliers and before R16.5 and R17.4a. Until integration, these nodes realise AL.3. The prefix imports neither GL₂ consumer. R16.5 compares its separately checked n=2 full-twist theorem with the full-rank node; R17.4a uses the n=3 reduced-rank node and the existing AL.3 pole criterion. Keep the highly ramified T-twist variant and original proof decomposition open in G16.
