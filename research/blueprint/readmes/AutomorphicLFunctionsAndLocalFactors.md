# Automorphic L-functions and local factors

## Purpose and scope

This roadmap constructs the analytic local and global factors used in the atlas’s automorphic programme. Its starting point is arithmetic harmonic analysis: local additive characters, test functions, Haar measures and Fourier transforms. Tate’s rank-one integrals turn these into local factors and a global functional equation. The matrix-space construction of Godement–Jacquet and the Whittaker integrals of Rankin–Selberg then supply the standard and tensor-product factors for general linear groups. The final two layers organize unramified factors and the exact comparison formulas consumed by p-adic interpolation. Each passage needs actual convergence and normalization results; a formal Euler polynomial does not supply these analytic theorems.

The present packet is a partial checkpoint covering the original six-stage scope AL.0–AL.5. It contains thirteen declaration-sized items inside AL.0: one construction, seven lemmas and five theorems. They give the character annihilator of an additive subgroup, its elementary topology, the Fourier transform of a subgroup or coset indicator, the effect of character modulation, the exchange between periods and support, and indicator inversion under a stated dual-measure condition. The construction has four API items and four unit tests. Five nodes are selected as planets. No stage is closed, and the remaining work is recorded explicitly for all six stages.

This component is useful before the full local-field infrastructure is available because every statement is already expressible using native library objects. The functions are ordinary complex-valued functions, the pairing is a native bilinear map, the annihilator is a native additive subgroup, and the integral is Mathlib’s existing Fourier integral. A proof of the conditional indicator identity does not create a self-dual Haar measure, and a support bound conditional on a compact annihilator does not establish that annihilator’s compactness. The distinction is part of the signatures and dependency graph, rather than a qualification attached only to the prose.

The roadmap extends the analytic content of the arithmetic and automorphic suppliers without replacing their carriers. GlobalNumberFields supplies places, completions, normalized absolute values, adeles and Hecke characters. SmoothRepresentationsOfLocalGroups supplies its generic smooth-function and representation objects. AutomorphicFormsOnReductiveGroups supplies archimedean representation foundations. The accepted RS-13 restructuring keeps all six AL layers and assigns the motivic period adapters to PS.1. Thus the analytic Tate theory remains in AL.1 and the GL₂/Rankin interpolation corrections remain in AL.5. This packet neither constructs motivic period objects nor changes those ownership decisions.

## Conventions and native objects

Let R be a commutative ring, V and W additive commutative groups carrying R-module structures, and L:V×W→R an R-bilinear pairing. Let ψ:R→Circle be an additive character, so ψ(0)=1 and ψ(a+b)=ψ(a)ψ(b). These are the hypotheses used by the native VectorFourier.fourierIntegral. In particular, this starting point does not require a field, nontrivial character or nondegenerate pairing. Those stronger hypotheses must be supplied when a local-field theorem needs them.

For a measure μ on V and a complex-valued function f, write

Ff(w) = ∫_V ψ(−L(v,w)) f(v) dμ(v).

The minus sign is fixed throughout the packet. Complex multiplication by the value of a circle character agrees with the native circle action on C. An ordinary support consists of the points where f is nonzero; compact support means compactness of the closure of this set. These two notions are used at different points of the argument. In particular, support containment in an arbitrary set does not justify a claim about its closure without the required topology.

The notation μ.real(U) denotes the library’s real-valued measure of a set. When μ(U) is finite it is the familiar nonnegative real volume. The native Bochner integral is totalized, and μ.real(U) is zero when μ(U) is infinite. The measurable-subgroup indicator identity is valid with that convention and can therefore be stated without a finiteness hypothesis. Its intended compact-open application uses a Haar measure finite on compact sets and a continuous character pairing, for which the integrals really converge. A totalized equality is not advertised as an integrability theorem. This matters because the general Fourier operator is not additive on arbitrary nonintegrable inputs; the established native additivity theorem has integrability hypotheses.

Kudla’s published chapter uses the positive kernel ψ(xy) in its Fourier transform. To interpret that transform through the negative native kernel, replace the native character by the inverse of Kudla’s character, or evaluate the negative transform at the opposite frequency. The annihilator itself is unchanged by inverting the character. Translation and modulation phases are affected, and must be converted before comparing epsilon factors. Tate’s original thesis uses exp(−2πiΛ(xy)), with its own standard local Λ. In particular its real Λ has the opposite sign from the real coordinate. The packet’s formulas use a named ψ and the native sign rather than silently identifying every source’s standard character.

At complex places the number-field normalized absolute value is z·conj(z), the square of the usual complex modulus. This arithmetic normalization is distinct from the complex norm used in analytic estimates. GlobalNumberFields Layer 0 supplies the normalized local absolute values, and Layer 10 classifies continuous archimedean characters with genuinely complex parameters. AL.1 must state the conversion between a modulus exponent and a normalized-absolute-value exponent. Replacing those parameters by integer infinity types would exclude continuous characters required by Tate’s analytic family.

For a native additive subgroup U of V define

U⊥ = {w in W : ψ(L(u,w))=1 for every u in U}.

This is an additive subgroup, with no assertion of R-linearity. The real multiplication pairing and ψ(x)=exp(2πix) make the issue concrete: for U=Z·1, the annihilator contains 1 and excludes 1/2. A real submodule containing 1 would contain 1/2. The annihilator of the additive subgroup generated by 1 is the kernel of the additive-homomorphism view of ψ; the annihilator of all of R generally is not that kernel. This distinction is enforced by the compatibility and non-example tests.

## What the pinned libraries already supply

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every one of the packet’s thirty cited declarations was read in its pinned source file and the source bytes were checked against the pinned tree. The declaration index was used for discovery and checking names, not as evidence for an unread statement. The reviewed AUDIT-14 rows for all six AL layers were read before planning, together with their independent review.

The most important baseline result here is broader than a real-only Fourier library. VectorFourier.fourierIntegral already accepts a bilinear map over any commutative ring and a circle-valued additive character. Its translation theorem requires measurable addition and right-translation-invariant measure, and says that translating the input by +u multiplies the transform by ψ(L(u,w)). The packet uses that theorem to deduce vanishing at a nontrivial frequency; it does not propose a second translation theorem or a new Fourier integral. The same file already gives scalar compatibility, the norm bound, and continuity and integrability comparisons with their topological hypotheses.

The additive-character carrier and its homomorphism views are already available. Native linear maps provide transposition and precomposition in the second variable. Native local constancy, compact support, measurable indicators and Bochner integrals are used directly. For compact support the explicit source declaration is the multiplicative-support theorem with its generated additive counterpart; this is recorded transparently because the declaration index lists the explicit source name. It is not a proposal to use multiplicative support for complex functions.

The finite Fourier transform on Z/N also already exists. ZMod.toCircle is the standard character exp(2πij/N), and ZMod.dft_eq_fourier identifies the existing finite transform with the Fourier integral against counting measure. The finite examples in this packet test the new interfaces against that baseline. They do not create another discrete Fourier theory. Similarly, PontryaginDual already supplies the compact-open character-space carrier and some topological instances. Reading its actual file does not reveal a local-field self-duality theorem or a general double-annihilator equality. Those remain genuine missing inputs to the full AL.0 target.

Tau Ceti’s compact-representation invariant theory was also screened. Its integral-of-character statement identifies a finite-dimensional representation’s character integral against normalized compact-group Haar probability with the dimension of invariant vectors. This is useful background but has a different input and normalization from an arbitrary-measure subgroup-indicator calculation. The present argument instead applies the existing native Fourier translation law and elementary cancellation in C. It does not reproduce Schur orthogonality or representation-theoretic averaging.

## Ownership and reuse

SR.1 explicitly owns the generic space of locally constant compactly supported functions over coefficient rings and its convolution theory. AL.0 requests that carrier’s complex specialization, coercion, linear operations, translations and support comparison. The local-field identification with the Schwartz–Bruhat conditions and the additive Fourier theory belong here. This avoids a duplicate subtype or module wrapper whose only purpose would be to repackage the same functions. A rescope proposal records this boundary; no supplier’s file is edited by the present job.

AF.0 constructs adelic smooth test functions using finite locally constant compactly supported factors and archimedean smooth compactly supported factors, then develops growth conditions. Its archimedean family is not identical to the Schwartz family needed for Tate’s Fourier theory. The restricted tensor-product mechanism and shared finite factors must be compared through the existing carriers. The difference in infinite-place families is not a reason to duplicate a generic tensor-product construction. The packet records that comparison as part of the remaining AL.0 work without identifying the two function spaces.

AA.0 owns the topology and Haar measures of restricted products, including almost-everywhere normalization and Fubini. GlobalNumberFields owns the full adele ring and its discrete, cocompact diagonal field. These imports provide the arithmetic and measure-theoretic setting for Poisson summation; AL.0 still needs the global character pairing, its annihilator theorem, and the quotient-volume normalization. Compactness of the quotient is not a proof that a particular Haar normalization gives volume one.

FunctionFieldArithmetic FA.2 constructs residue characters from a rational differential and the global residue pairing. The generic local calculations in this component are reusable there, while the differential, degree and function-field adelic comparisons remain with FA.2. The upstream OneParameterSemigroups Part C owns positive-definite functions and Bochner representation results; this packet constructs neither. GL₂ R16.1 already imports its generic test-function and representation carriers. These ownership checks ensure that a familiar local calculation is built once at the common Fourier level rather than copied into each automorphic or theta application.

## The proof architecture

The dependency graph has two short analytic branches after the annihilator construction. One starts with an input period: native translation covariance forces Fourier vanishing wherever that period has nontrivial character value. Requiring every element of U to be a period puts the ordinary Fourier support inside U⊥. If that annihilator is known to be compact and W is Hausdorff, the closure of the support is compact. This branch needs translation invariance of the measure.

The other branch starts with support contained in U. It compares integrands directly and proves that every element of U⊥ is a frequency period. When U is compact and the joint character pairing is locally constant, the annihilator is open. Its frequency cosets are open constant neighborhoods for the transform, which proves local constancy. This branch does not need translation invariance of the measure. It does need an actual compact additive subgroup containing the support, a property to prove in the local-field specialization rather than assume for every locally compact group.

The topology of the annihilator also has two distinct proofs. Closedness follows by intersecting closed character fibers. Openness cannot follow by intersecting open fibers, because an infinite intersection of open sets need not be open. Instead, fix w in the annihilator and apply the generalized tube lemma to the compact product U×{w} inside the open fiber of 1 for the joint pairing. The resulting frequency neighborhood stays inside the annihilator. The hypotheses are deliberately stated on the joint pairing, so the local-field application must prove the joint local constancy using its actual continuous bilinear map and locally constant additive character.

Indicator inversion is a small final calculation with two substantial explicit inputs. After transforming 1_U, the second transform involves the annihilator of U⊥ for the transposed pairing. The hypothesis identifies that double annihilator with U. A second hypothesis identifies the product of the two subgroup volumes with one. Native scalar compatibility then gives the reflected indicator. Proving these hypotheses for local fields, and extending inversion to all test functions, are separate tasks. The component therefore exposes exactly where the general duality and normalization arguments enter.

## Declaration-by-declaration plan

The following entries give the exact statements, dependencies and proof steps. Their proposed names live in TauCeti.LocalFourier. The source match is a declaration-sized abstraction of the compact-subgroup calculation in Tate §2.5 and the Schwartz-preservation/inversion discussion in Kudla p.122. Neither source is being credited with the exact general Lean signature.
### Annihilator for a bilinear character pairing

Proposed declaration: TauCeti.LocalFourier.pairingAnnihilator.

Construct U⊥={w∈W | ψ(L(u,w))=1 for every u∈U} as an AddSubgroup W. It is generally not an R-submodule. Its data is exactly this carrier and the inherited additive subgroup operations.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data.

Proof: Use the displayed carrier inside the existing AddSubgroup type. For zero use bilinearity and AddChar.map_zero_eq_one; for addition use bilinearity and AddChar.map_add_eq_mul; for negation use the additive-character inverse identity obtained from ψ(x+−x)=1. No analytic or duality theorem is used.

Dependencies: mathlib:AddChar, mathlib:AddChar.map_zero_eq_one, mathlib:AddChar.map_add_eq_mul, mathlib:LinearMap.compl₂, mathlib:AddChar.toAddMonoidHom, mathlib:ZMod.toCircle, mathlib:ZMod.injective_toCircle, mathlib:Real.fourierChar, mathlib:Subgroup.zpowers.

The reusable API is:

- TauCeti.LocalFourier.pairingAnnihilator_bot: The annihilator of the zero additive subgroup is the full subgroup W.
- TauCeti.LocalFourier.pairingAnnihilator_zero: For the zero bilinear pairing the annihilator of every U is W.
- TauCeti.LocalFourier.pairingAnnihilator_antitone: U⊆U′ implies (U′)⊥⊆U⊥ for the same ψ and L.
- TauCeti.LocalFourier.pairingAnnihilator_comap: For a linear T:W′→W, the annihilator for (v,w′)↦L(v,Tw′) equals the native comap of U⊥ along T. This uses native LinearMap.compl₂.

The definition tests are:

- TauCeti.LocalFourier.pairingAnnihilator_zmod_two (computation): For R=V=W=Z/2, the standard ZMod.toCircle character, multiplication pairing and U=V, the annihilator is zero.
- TauCeti.LocalFourier.pairingAnnihilator_trivial_character (degenerate): For ψ=1 and every L,U, the annihilator is W.
- TauCeti.LocalFourier.pairingAnnihilator_zmultiples_eq_kernel (compatibility): For V=W=R, multiplication pairing and U the additive subgroup generated by 1, U⊥ equals the native kernel of ψ.toAddMonoidHom. U cannot be replaced by all of R in this assertion.
- TauCeti.LocalFourier.pairingAnnihilator_not_real_submodule (non-example): For R=V=W=R-real, ψ(x)=exp(2πix), multiplication pairing and U=Z·1, the annihilator contains 1 and does not contain 1/2. Thus it is not stable under real scalar multiplication.

Acceptance: Do not require ψ nontrivial: a trivial character has full annihilator. Use an additive subgroup, so the real integer-lattice example is admitted.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Membership in the character annihilator

Proposed declaration: TauCeti.LocalFourier.mem_pairingAnnihilator.

For every w, w∈U⊥ if and only if ψ(L(u,w))=1 for all u∈U.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data.

Proof: Unfold only the carrier field of pairingAnnihilator. Export this as a separate lemma because the remaining nodes use it.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/pairing-annihilator.

Acceptance: At w=0 every character value is one.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Closedness of the character annihilator

Proposed declaration: TauCeti.LocalFourier.isClosed_pairingAnnihilator.

If W is a topological space and w↦ψ(L(v,w)) is continuous for each v∈V, then U⊥ is closed in W.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. W is topological; each displayed one-variable circle-valued map is continuous.

Proof: By mem-pairing-annihilator express U⊥ as the intersection over u∈U of the equality loci ψ(L(u,w))=1. Each locus is closed by isClosed_eq, since Circle is Hausdorff. Apply isClosed_iInter.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator, mathlib:isClosed_eq, mathlib:isClosed_iInter.

Acceptance: For the real pairing and U=Z, U⊥ is closed but not open; this theorem alone gives no openness.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Openness of a compact subgroup annihilator

Proposed declaration: TauCeti.LocalFourier.isOpen_pairingAnnihilator.

Suppose V,W are topological spaces, U is compact as a subset of V, and (v,w)↦ψ(L(v,w)) is jointly locally constant. Then U⊥ is open in W.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V,W are topological; U is compact; the joint circle-valued pairing is IsLocallyConstant.

Proof: The fiber of 1 under the joint pairing is open by IsLocallyConstant.isOpen_fiber. For w∈U⊥, the compact product U×{w} lies in that fiber by the membership lemma. Apply generalized_tube_lemma to obtain an open neighborhood O of w with U×O in the fiber. Every point of O belongs to U⊥; openness follows from its pointwise open neighborhoods. This proof does not take an infinite intersection of open sets.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator, mathlib:IsLocallyConstant.isOpen_fiber, mathlib:generalized_tube_lemma.

Acceptance: Over a finite discrete module the hypothesis holds for every pairing. The real character is not locally constant, so the Z⊂R example does not satisfy these hypotheses.

Source: Kudla2004, p.115, local constancy and compact support; p.122, Fourier transforms. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Fourier vanishing from a nontrivial period

Proposed declaration: TauCeti.LocalFourier.fourierIntegral_eq_zero_of_period.

If f(v+u)=f(v) for every v and ψ(L(u,w))≠1, then Ff(w)=0.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition.

Proof: Apply native fourierIntegral_comp_add_right to the supplied period u and rewrite its left side using the period hypothesis. The resulting equality z=ψ(L(u,w))•z in C forces z=0, because the circle scalar has complex value different from 1.

Dependencies: mathlib:VectorFourier.fourierIntegral_comp_add_right.

Acceptance: For the constant function on Z/2 and counting measure, the transform at the nonzero frequency is zero.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Fourier support lies in the period annihilator

Proposed declaration: TauCeti.LocalFourier.support_fourierIntegral_subset.

If every u∈U is a period of f, then ordinary support(Ff)⊆U⊥.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition.

Proof: Outside U⊥, the membership lemma gives some u∈U with nontrivial phase. Apply vanishing-from-period. This controls ordinary support; compactness of its closure is a separate node.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator, AutomorphicLFunctionsAndLocalFactors:AL.0/vanishing-from-period.

Acceptance: For U=0 the conclusion is support(Ff)⊆W, imposing no false compactness.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Fourier transform of a subgroup indicator

Proposed declaration: TauCeti.LocalFourier.fourierIntegral_indicator.

If U is measurable, then F(1_U)=μ.real(U)·1_(U⊥). The theorem uses native totalized Bochner integrals. On finite-measure compact-open U with continuous pairing it is the usual convergent Fourier calculation.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. U is measurable. No unit-volume assumption and no self-duality identification are imposed.

Proof: At w∈U⊥, the Fourier integrand equals 1_U pointwise; use membership and the character inverse identity. Apply integral_indicator_const to obtain μ.real(U). At w∉U⊥, 1_U has every u∈U as a period by subgroup membership. Apply fourier-support to obtain zero. Combine the two cases as the displayed equality of functions.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator, AutomorphicLFunctionsAndLocalFactors:AL.0/fourier-support, mathlib:VectorFourier.fourierIntegral, mathlib:MeasureTheory.integral_indicator_const, mathlib:MeasureTheory.integral_congr_ae.

Acceptance: For U=Z/2 and counting measure, the result is twice the indicator of {0}. For μ=0 both sides vanish. If μ(U)=∞, μ.real(U)=0; this is only the native totalized identity, not a convergence assertion.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Fourier transform of a coset indicator

Proposed declaration: TauCeti.LocalFourier.fourierIntegral_coset_indicator.

For measurable U and a∈V, the transform of v↦1_U(v−a) equals w↦ψ(−L(a,w))·μ.real(U)·1_(U⊥)(w).

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. U is measurable; a∈V.

Proof: Apply native translation covariance with translation parameter −a. Substitute indicator-transform and bilinearity L(−a,w)=−L(a,w). The phase has a minus sign because the input uses v−a.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-transform, mathlib:VectorFourier.fourierIntegral_comp_add_right.

Acceptance: For counting measure on Z/4, the indicator of {1} transforms at frequency 1 to −i, not +i.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Fourier transform of a character modulation

Proposed declaration: TauCeti.LocalFourier.fourierIntegral_modulation.

For every w₀, the transform of v↦ψ(L(v,w₀))·f(v) equals w↦Ff(w−w₀). No invariance of μ is needed.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

Proof: Expand the native Fourier integrand. Combine the two character values using AddChar.map_add_eq_mul and scalar associativity. Bilinearity gives −L(v,w)+L(v,w₀)=−L(v,w−w₀); the integrands agree pointwise, so apply integral_congr_ae.

Dependencies: mathlib:VectorFourier.fourierIntegral, mathlib:AddChar.map_add_eq_mul, mathlib:MeasureTheory.integral_congr_ae.

Acceptance: For counting measure on Z/3, the standard character transforms to 3 times the indicator of frequency 1, rather than frequency −1.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Frequency periods from support containment

Proposed declaration: TauCeti.LocalFourier.fourierIntegral_add_of_support.

If ordinary support(f)⊆U and a∈U⊥, then Ff(w+a)=Ff(w) for all w. No invariance of μ is needed.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions.

Proof: Compare the two integrands. Off U the value f(v) is zero by the support hypothesis. On U, the membership lemma gives ψ(L(v,a))=1, so the extra phase is one. Use bilinearity, the character addition identity and integral_congr_ae.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/mem-pairing-annihilator, mathlib:VectorFourier.fourierIntegral, mathlib:AddChar.map_add_eq_mul, mathlib:MeasureTheory.integral_congr_ae.

Acceptance: If f is supported at zero, its Fourier integral is constant in the frequency, consistent with U=0 and U⊥=W.

Source: Tate1950, §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Declaration-sized abstraction of the indicated calculation, with all extra hypotheses stated; the source does not name this general declaration.

### Local constancy of the Fourier transform

Proposed declaration: TauCeti.LocalFourier.isLocallyConstant_fourierIntegral.

Suppose V is topological, W is a topological additive group, U is compact, the joint character pairing is locally constant, and support(f)⊆U. Then Ff is locally constant.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. W is an IsTopologicalAddGroup; U is compact in V; the joint pairing is locally constant.

Proof: Apply open-annihilator to see that U⊥ is open. By frequency-periods, Ff is constant on every additive coset w+U⊥. Translation in the topological group makes this coset an open neighborhood of w. Apply IsLocallyConstant.iff_exists_open.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/open-annihilator, AutomorphicLFunctionsAndLocalFactors:AL.0/frequency-periods, mathlib:IsLocallyConstant.iff_exists_open.

Acceptance: For a finite discrete group this recovers local constancy of every finite Fourier transform. The assertion requires a compact subgroup containing the support, not merely an arbitrary compact support set.

Source: Kudla2004, p.122, Fourier transforms of Schwartz–Bruhat functions. One half of the nonarchimedean preservation assertion, conditional on an actual compact subgroup containing the support and a locally constant pairing.

### Compact support from a compact period annihilator

Proposed declaration: TauCeti.LocalFourier.hasCompactSupport_fourierIntegral.

If W is Hausdorff, every u∈U is a period of f, and U⊥ is compact, then Ff has compact support in the native sense.

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. W is a Hausdorff topological space; U⊥ is compact. This compactness is an explicit input, not inferred from openness of U.

Proof: Apply fourier-support. Use the generated additive counterpart of HasCompactMulSupport.of_mulSupport_subset_isCompact: the closure of a subset of a compact set is compact in a Hausdorff space.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/fourier-support, mathlib:HasCompactMulSupport.of_mulSupport_subset_isCompact.

Acceptance: A trivial character on a noncompact W has U⊥=W; the required compactness does not follow from compactness or openness of U.

Source: Kudla2004, p.122, Fourier transforms of Schwartz–Bruhat functions. The compact-support half of preservation, with the dual compactness theorem displayed as an input instead of assumed.

### Fourier inversion for a subgroup indicator

Proposed declaration: TauCeti.LocalFourier.fourierIntegral_fourierIntegral_indicator.

Put A=U⊥. Suppose U and A are measurable, μ on V and ν on W are translation invariant, the annihilator of A for the transposed pairing equals U, and μ.real(U)ν.real(A)=1. Then F_(ν,Lᵗ)(F_(μ,L)(1_U))(v)=1_U(−v).

Hypotheses: R is a commutative ring; V and W are additive commutative groups and R-modules. ψ is a native AddChar R Circle; L:V×W→R is R-bilinear; U is a native additive subgroup of V. No topology, nontriviality or nondegeneracy is built into this data. V has a measurable-space structure; μ is a measure on V; f takes values in C. All Fourier expressions use the existing native Bochner integral, including its totalized convention for nonintegrable functions. Addition on V is measurable and μ is invariant under right addition. W has measurable addition and ν is right-translation invariant. U,A are measurable. The double-annihilator equality and the volume-product equality are supplied explicitly.

Proof: Apply indicator-transform to U. Rewrite its output as the complex scalar μ.real(U) times 1_A. Use native fourierIntegral_const_smul, then apply indicator-transform to A with L.flip and ν. Rewrite the double annihilator as U and the product of real volume factors as 1. A subgroup contains v iff it contains −v, giving the reflected indicator.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0/indicator-transform, mathlib:VectorFourier.fourierIntegral_const_smul, mathlib:LinearMap.flip.

Acceptance: Counting measure on both copies of Z/2 has volume product 2, so its double transform is 2f(−v), not f(−v). For U=Z/2, μ=count and ν=(1/2)count, the hypotheses give the correctly normalized indicator identity. This is not a proof of Fourier inversion for every Schwartz function or existence/uniqueness of self-dual Haar measure.

Source: Kudla2004, p.122, self-dual measure and Fourier inversion. A precise conditional specialization to subgroup indicators. The source’s full Schwartz-space inversion and self-dual measure theorem remain gaps.

## Concrete normalization checks

The subgroup-indicator example on Z/2 uses counting measure and the full subgroup. Its annihilator is {0}, so the value at frequency zero is 2 and the value at the other frequency is zero. An erroneous unit-volume assumption would produce 1 at zero and fail this test. Applying counting-measure Fourier transformation twice gives 2f(−x), consistently with the existing finite transform. Inversion requires a compensating dual measure or a square-root normalization, not simply an appeal to finiteness of the group.

Signs need examples beyond exponent two. On Z/4 the indicator of {1} transforms at frequency 1 to −i under the native negative kernel. The positive kernel gives +i, so this example distinguishes the conventions. On Z/3, multiplying the constant function by the standard positive character moves its transform to frequency +1. A mistaken plus in the frequency shift would move it to −1. These two examples accompany the coset and modulation statements in the suggested file.

The real-lattice non-example serves a different purpose. It prevents the character annihilator from being encoded as an R-submodule merely because L is R-bilinear. The character need only be additive. The construction’s domain is therefore an AddSubgroup and its output is an AddSubgroup. The API’s pullback in the frequency variable uses the native additive comap of a linear map; no scalar-stability law is claimed for the subgroup itself.

## Source extraction and version discipline

The primary local calculation is Tate’s original 1950 thesis, physical p.24, printed page (2.17). The page was rendered because the scan’s text extraction loses important exponents. Tate integrates a character over a compact fractional-ideal subgroup. Its transform is the subgroup’s measure when the character is trivial on that subgroup and zero otherwise; the surrounding modulation produces a translated frequency support. The packet isolates the subgroup calculation from the arithmetic assertion identifying the particular annihilator with a fractional ideal. That arithmetic assertion depends on the standard local character and the different, and remains outside the current component.

Tate physical pp.1–24 were read, including the introductory harmonic-analysis assumptions, the local-field self-duality discussion, measure normalization, quasicharacters, local zeta functions and the beginning of the special-function calculations. Physical pp.25–60 are unread. The thesis invokes general locally compact abelian duality in its local proof. The roadmap cannot replace that invocation with the existence of a character-space type. It needs a verified duality argument or a precise supplying theorem. The original thesis is also a different document from the 1967 published reprint, which was not collated here.

Kudla’s published chapter was read through printed p.123, physical pp.1–15. It provides a useful decomposition of the local zeta argument into distributions, the scaling action, support at zero, and normalized eigendistributions. The distinction between finite and infinite places is substantive: finite-place test functions are locally constant with compact support, while the archimedean objects carry Schwartz estimates and distributional derivatives. The proof of the exceptional unramified parameter must track the nontrivial extension of the distribution supported at zero; merely bounding an eigenspace by dimension two does not prove the asserted uniqueness.

The Fourier section on p.122 was rendered and inspected. Its full preservation theorem states that the Fourier transform maps Schwartz–Bruhat functions to Schwartz–Bruhat functions and becomes an isomorphism, with a self-dual measure giving reflection after two transforms. The present packet proves conditional ingredients and an indicator specialization, not that full assertion. Lemma 3.6, Corollary 3.7 and the following character-change formulas have been read as source targets but have not been decomposed into nodes. Their exact parameter conventions, the distribution action and the missing archimedean proof sources must be established before they are prototyped.

The nineteen-page lecture preprint was read through p.9 for comparison. The published chapter and preprint have different pagination and some different text. The packet records hashes, URLs, access date and exact reading boundaries for all three documents. Published pp.124–131 and preprint pp.10–19 are unread. Formula fragments lost by OCR are not reported as source errors.

Two source findings are recorded. Published p.110 reverses the divisibility direction in the sentence describing characters induced from a conductor N₀: the modulus M must be divisible by N₀. The earlier paragraph’s projection maps and the nontrivial primitive character modulo 3 give direct checks. This is a misprint with no effect on the intended mathematics. The author’s research page, publisher chapter page and focused correction searches were checked without finding an addressing correction; independent review is required. The similarly titled recent Springer chapter is by another author and was not treated as a revised Kudla text.

The lecture preprint’s bibliographic placeholder for the coauthor of Ramakrishnan is already corrected to Valenza on published p.110. That finding is attributed only to the preprint and explicitly marked as a known published correction. The packet does not accuse the published chapter of retaining that placeholder. No source finding is sent to an author; the programme’s review and errata pipeline handles the record.

## Coverage of the six layers

The list below is the binding work boundary. A partially read proof source is not counted as a completed decomposition, and none of the broad targets is represented by an unspecified predicate or a theorem whose own conclusion is an input. Each item describes concrete mathematics to establish, with the carrier or supplying roadmap identified where it is known.

### AutomorphicLFunctionsAndLocalFactors:AL.0 — partial

- Import SR.1’s actual locally constant compact-support carrier over C and its function coercion. Prove the additive-local-field characterization used on Kudla p.115: support in a large fractional ideal and invariance by a small fractional ideal. Establish uniform translation invariance from compact support and local constancy, and containment of compact sets in compact additive subgroups for the local fields in scope; these properties are not automatic on all topological groups.
- Construct the standard additive local-field characters, prove continuity, nontriviality and local constancy at finite places, and the annihilator of each fractional ideal using the inverse different. Prove local additive self-duality, compactness of annihilators of open lattices and double-annihilator equality. Tate §2.2 assumes general LCA duality: the existing PontryaginDual carrier is not that theorem. Record the exact duality proof or supplier before closing this step.
- Construct and normalize self-dual additive Haar measures, prove finite and positive compact-open volume, the dual volume product and all character/measure changes. Combine the finite-place carrier, period and annihilator results with the present component to obtain actual Fourier preservation and inversion on every Schwartz–Bruhat function. Handle translation and modulation of general finite linear combinations without assuming additivity of nonintegrable Bochner integrals.
- At real and complex places import native SchwartzMap and its established Fourier theorems after reading their exact statements; prove the norm, trace and character convention comparisons. Construct the adelic restricted tensor product with distinguished almost-everywhere unit indicators, its relation to local Fourier transforms, the diagonal character pairing and Poisson summation using the GlobalNumberFields diagonal lattice and AA.0 product-measure interfaces; prove the required quotient-volume normalization. AF.0’s archimedean compactly supported C∞ test functions are not identical to the Schwartz family.
- Read and decompose the remaining local and global analytic sources. Extract holomorphic parameter integrals, dominated differentiability, Mellin comparison and vertical/decay estimates from actual proofs, using the native analytic APIs identified by AUDIT-14 only after statement checks. Physical Tate pp.25–60 and published Kudla pp.124–131 remain unread.

### AutomorphicLFunctionsAndLocalFactors:AL.1 — partial

- Use GlobalNumberFields Layers 0, 5, 9–10 and ArithmeticDirichletSeries Layer 3 for local components, conductors, unitary/norm twists and real/complex character classifications. Specify additive and multiplicative measure conventions separately: Kudla normalizes multiplicative unit volume to one, while Tate’s original §2.3 normalization depends on the different.
- Decompose every local assertion read in Kudla pp.115–123: the scaling action on actual test functions and distributions; support-at-zero classification; extension from F×; Lemmas 3.2–3.3 and the one-dimensional eigendistribution Theorem 3.4; half-plane convergence; the unramified difference operator and geometric factor; ramified stabilization and test vectors; normalized zeta distributions and their entire dependence. The residue and exceptional-parameter extension argument must retain its nonsplit scaling action rather than infer uniqueness from an upper bound of two.
- Read the missing proof sources for the archimedean distribution and integration-by-parts arguments, state the gamma factors with the normalized complex absolute value, and split Proposition 3.5, Lemma 3.6 and Corollary 3.7 into typed parameter identities. Define epsilon and gamma with the source’s positive Fourier convention or prove conversion to the native negative convention. Complete (3.27)–(3.29), the unread explicit epsilon/Gauss calculations and conductor dependence.
- Read Tate’s global chapters and Kudla’s global section, then prove global convergence, product factorization with justified Fubini, meromorphic continuation and the functional equation using Poisson. Separate unitary from general norm-twisted characters and retain the trivial/norm-character poles. The generic Euler-product theorem in ArithmeticDirichletSeries does not provide analytic continuation.

### AutomorphicLFunctionsAndLocalFactors:AL.2 — not_read

- Read the Godement–Jacquet sources and decompose matrix-space Schwartz functions, determinant powers, matrix coefficients, local integrability and rationality, fractional ideals, test vectors and the local functional equation over nonarchimedean fields. Import smooth representations; do not invent a new admissible-representation carrier.
- Separately read the archimedean globalization and Schwartz estimates. Import AF.1’s actual finite-length admissible Casselman–Wallach realization, build the parameter-integral estimates and gamma-factor comparison. A Laurent-polynomial gcd is not an archimedean construction.
- Prove spherical/unramified computation and its exact Satake normalization, adelic unfolding for cuspidal GL_n, justified Euler factorization, continuation and functional equation. Retain the n=1 exceptional pole and export normalization/bound estimates; the matrix-space proof does not establish zeta integrals for arbitrary reductive groups.

### AutomorphicLFunctionsAndLocalFactors:AL.3 — not_read

- Import the exact complex specialization of SR.5’s Whittaker/derivative interfaces with its coefficient hypotheses. Read the nonarchimedean Rankin–Selberg integral proofs, convergence, rationality, fractional ideal, functional equation and unramified calculations separately for the n,m regimes.
- Read Jacquet, Archimedean Rankin–Selberg Integrals §§2–16, and decompose actual Whittaker functionals and uniqueness/continuity on AF.1 globalizations, completed tensor products, holomorphic multiples, vertical strips, gamma factors and functional equations. These arguments cannot be replaced by finite-place gcd normalization.
- Prove global cuspidal unfolding and products with convergence; retain contragredient/twist poles and only the established nonvanishing regions. Compare rational structures, Gauss sums and complex periods with their actual scalar ambiguity and the chosen cohomological convention.

### AutomorphicLFunctionsAndLocalFactors:AL.4 — not_read

- Read the actual Satake and L-group suppliers and compare native characteristic-polynomial conventions before defining the unramified Euler polynomial. Separate conjugacy invariance, direct sums, tensor products, duality and coefficient extension with all normalizations.
- Import the generic ArithmeticDirichletSeries Euler-product theorem and supply its eigenvalue bound to prove the exact half-plane of convergence. Prove comparison with AL.1–3 and with Weil–Deligne factors only under an established local-compatibility theorem. No generic continuation or local Langlands correspondence is supplied by a characteristic polynomial.

### AutomorphicLFunctionsAndLocalFactors:AL.5 — not_read

- Read the precise GL_2/Rankin interpolation families in AutomorphicPadicLFunctions. Construct finite-set removal and reinsertion as formal polynomial identities and complex evaluation identities, retaining the exceptional zero case without dividing by a vanishing factor.
- Prove conductor/test-vector/twist compatibility, critical-value normalization, functional-equation signs and the algebraicity comparisons required by those families. RS-13 keeps these analytic corrections in AL.5 and the motivic period adapters in PS.1. Establish the required limiting or derivative theorem at each vanishing factor; no general p-adic L-function construction belongs here.

## Supplier contracts

### SmoothRepresentationsOfLocalGroups:SR.1

Supply the single generic carrier of locally constant compactly supported functions over C, its function coercion, extensionality, linear operations, translations and agreement with ordinary/closed support. AL.0 supplies its additive Fourier transform and local-field period/annihilator comparisons. The current thirteen nodes are statements on actual functions and native subgroups, so do not hide an unavailable carrier.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.0, AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicLFunctionsAndLocalFactors:AL.2, AutomorphicLFunctionsAndLocalFactors:AL.3.

### AdelicAlgebraicGroups:AA.0

Supply local compactness and compact-open cylinders for restricted products, product Haar measures with almost-everywhere unit volumes, change-of-finite-set compatibility and Fubini with explicit integrability. AL.0 supplies additive character compatibility and Poisson, rather than treating restricted-product topology alone as measure theory.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.0, AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicLFunctionsAndLocalFactors:AL.2, AutomorphicLFunctionsAndLocalFactors:AL.3.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters

Supply the canonical continuous idele-class character, local components, finite conductor, real norm shift/unitary part and conductor/parity-compatible Q-to-Dirichlet dictionary. AL.1 constructs analytic zeta integrals on those existing arithmetic objects.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.1.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Supply the continuous real/complex character classification with complex norm exponents and the precise conversion between continuous, algebraic and finite-order infinity types. AL.1 converts the modulus convention to normalized |z|_C=z·conj(z); it does not replace continuous parameters by integer exponents.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.1.

### AutomorphicFormsOnReductiveGroups:AF.1

Supply actual finite-length admissible real (g,K)-modules and their smooth moderate-growth Frechet globalizations, uniqueness/exactness and derivative actions. AL.2–3 must prove their Schwartz/Whittaker parameter estimates on those carriers.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.2, AutomorphicLFunctionsAndLocalFactors:AL.3.

### SmoothRepresentationsOfLocalGroups:SR.5

Supply the integral GL_n derivative/Whittaker constructions and their stated base-change/exactness and coefficient hypotheses, with a valid complex specialization. AL.3 supplies its complex analytic integral and comparison, not an assertion that every family is co-Whittaker.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.3.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula

Supply the uniform finite/infinite completion API, real/complex topological identifications and normalized local absolute values, including the squared complex norm and the product formula. AL.0 supplies additive characters and self-dual measure; AL.1 uses those arithmetic normalizations in its integrals.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.0, AutomorphicLFunctionsAndLocalFactors:AL.1.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient

Supply the native full adele ring, continuous diagonal embedding, discreteness of K and compactness of the additive quotient, with the Q fundamental-domain comparison. AL.0 must prove its character annihilator and quotient-volume normalization; these do not follow merely from compactness.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.0.

### tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products

Supply the single generic ideal Euler-product framework, finite factorization and passage to infinite products under absolute convergence, with the precise zero-free hypotheses for logarithms and reciprocals. AL.1, AL.2, AL.4 and AL.5 provide their own local factors, multiplicativity, bounds and finite bad-set comparisons; this supplier does not give continuation.

Consumers: AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicLFunctionsAndLocalFactors:AL.2, AutomorphicLFunctionsAndLocalFactors:AL.4, AutomorphicLFunctionsAndLocalFactors:AL.5.

## Validation and continuation

The packet’s indexed blueprint check reports zero errors and zero warnings. Its thirteen-node graph is acyclic and all component dependencies terminate in the thirty checked baseline declarations or other nodes of this component. There are six explicit stage gaps and nine open supplier requests. A request aimed at an unconstructed full-stage target is not a hidden premise of a current conditional Fourier lemma.

The suggested file elaborates at Lean 4.34.0-rc2 with zero errors and exactly twenty-five intentional placeholder warnings. It contains the thirteen node signatures, four API signatures, four named construction tests and four additional finite Fourier acceptance examples. Its 8,482 transitive Mathlib source imports were checked byte-for-byte against the pinned source tree before using their matching compiled cache. No Tau Ceti module is needed by these particular signatures. Elaboration verifies the proposed types, names and import boundary; it does not prove any planned theorem.

The intake check reports four files and zero problems; source-issue/version validation also passes, and all proposed node/API/test names match. The publication guard found sixty-nine research input paths unchanged on current main and verified the newly merged MP.0 supplier byte-for-byte against the fully read Heisenberg submission.

The four deliverables are the packet, this reader, the suggested file and the handoff. The handoff records the claim, source-reading boundaries, checks and exact restart point. The next mathematical component begins with the actual SR.1 carrier and the finite local-field period/annihilator lemmas, then proves the dual volume product and general test-function preservation. Its proof must use the standard character and inverse different rather than reuse a conditional hypothesis as if it were an established local-field fact. The remaining source reading and the full AL.1–AL.5 extraction are part of the same six-stage job.

## Sources

- John Tate, *Fourier Analysis in Number Fields and Hecke’s Zeta-Functions*, Princeton doctoral thesis, 1950. [Original thesis scan](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf). Read physical pp.1–24; p.24 rendered.
- Stephen S. Kudla, *Tate’s Thesis*, Chapter 6 in *An Introduction to the Langlands Program*, 2004, pp.109–131. [Published scan](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf), [publisher record](https://link.springer.com/chapter/10.1007/978-0-8176-8226-2_6). Read pp.109–123; pp.110 and 122 rendered.
- Stephen S. Kudla, *Tate’s Thesis*, lecture preprint from the March 2001 Jerusalem lectures. [Nineteen-page preprint](https://u.cs.biu.ac.il/~reznikov/courses/kudla-1.pdf). Read pp.1–9; used as a separate version for collation.
