# Hodge classes realizing the Jacquet–Langlands correspondence

The goal is an invertible Hodge correspondence between the quaternionic multiplicity realizations of one cuspidal GL₂ representation. Its two quaternion algebras have the same archimedean ramification, but their finite ramification can differ. The correspondence is a rational cohomology class with coefficients, and its induced map is an isomorphism of Hodge structures. With the specific unitary-similitude Kottwitz conjecture stated in JL.9, one class also induces Galois-equivariant isomorphisms in every ℓ-adic realization. Algebraicity of the class and an unconditional form of that conjectural Galois conclusion are separate questions.

The construction passes through a rank-three quaternionic skew-hermitian space obtained from the second exterior power of a four-dimensional hermitian space. Its exceptional projective identification with a unitary group connects a theta class to a unitary cohomological eigenspace. Explicit restrictions of the Schwartz forms give nonzero pairings on every tensor sign line. A rational Hecke space then contains an invertible correspondence because its determinant is a nonzero polynomial. The coefficient-normalized Hodge calculation makes all rational vectors in that Hecke space Hodge vectors. The component parameter is chosen in the actual Galois-invariant subspace of degree-zero cohomology.

The main source is Atsushi Ichino and Kartik Prasanna, *Hodge classes and the Jacquet–Langlands correspondence*, Forum of Mathematics, Pi **11** (2023), e22, pp. 1–135, [DOI 10.1017/fmp.2023.20](https://doi.org/10.1017/fmp.2023.20). Citations below use the printed pages of this published version, which agree with its PDF page numbers. The theorem statements and proof routes are paraphrased. The organization follows the objects and their dependencies: it does not reproduce the paper’s section order. The precise final targets are Theorem 3.2, p. 20, and Theorem 12.4, pp. 98–99; the constant-coefficient rational specialization is Theorem 1, p. 5.

## Conventions and objects

Fix a totally real number field F of degree n and quaternion algebras B₁,B₂ split at exactly the real places Σ. Write d=|Σ| and impose d<n. A cuspidal representation π of GL₂(A_F), with trivial central character and even weights k_v≥2, has the specified Jacquet–Langlands transfers π_i. The field L=Q(π) contains the weight field Q(k). For unitary normalization r=0, the algebraic representation is the tensor product of Nrd_v^((2−k_v)/2) Sym^(k_v−2), and its dual defines the local system. When d=0 use finite compact Shimura sets with the trivial-cocharacter constant model over Q; a compact Q-adjoint group is not required to satisfy strict Deligne SV3 in this boundary case. Its rank-one type-(0,0) Hodge correspondence is immediate. The multiplicity realization is in degree d; finite automorphic representation factors are retained when reconstructing full isotypic cohomology. A multiplicity space is not the whole isotypic summand at finite level.

An L-Hodge structure means a rational Hodge structure with L-action. A statement about complexification retains all embeddings of L. This avoids treating complex conjugation as if it preserved an arbitrary nonreal coefficient embedding. Tate twist (m) changes Hodge type by (−m,−m) and weight by −2m, agreeing with the pinned Tau Ceti convention. Each V_i has weight d and satisfies V_i≅V_i∨(−d). Thus V₁⊗V₂(d) identifies with Hom_L(V₁,V₂). Under geometric Künneth and Poincaré duality, contraction is the operator x↦p₂,*(ξ∪p₁*x).

The class in the final theorem has type (0,0) after twist (d). This is stronger than merely having equal total weights. For example, at a split real place the local cochain degrees (1,0),(0,1) have actual coefficient-normalized Hodge types (k_v/2,1−k_v/2) and its reverse. Tensor sign labels must survive even when their total Hodge types coincide. For two weight-two split places, four sign lines give types (2,0),(1,1),(1,1),(0,2); a nonzero pairing on one of them cannot establish an isomorphism.

For the distinct-algebra branch the quaternion Brauer product B is division and split at every real place. The equal-algebra branch uses the identity correspondence. Choose a CM quadratic E/F embedded in both B_i and write B_i=E⊕Ej_i, j_i²=J_i. All hermitian forms are conjugate-linear in their first variable. A right quaternion module has form ⟨xβ,yγ⟩=β*⟨x,y⟩γ. On a four-dimensional hermitian space use the ordered exterior basis 12,13,14,23,24,34 and top trivialization d_U(e₁∧e₂∧e₃∧e₄)=−1. These choices fix the signs of the semilinear exterior operator. The coordinate calculations at split real places use the separate explicit local basis of the source; an orientation change must be transported rather than suppressed.

Write U=B₁⊥B₂. Its exterior space is a rank-three right B-module. Its mixed summand W=B₁⊗_E B₂ has B-rank two; the two diagonal wedge lines together form W₀ of B-rank one. The group G=(B₁××B₂×)/{(t,t⁻¹)} uses the anti-diagonal scalar quotient. Equal-multiplier fiber products, identity components and projective quotients carry distinct notation in each target. The exterior map squares the similitude multiplier. Its kernel μ₂ is scheme-theoretic; an algebraic isogeny does not imply a surjection on F-points.

For theta integrals this document uses the IP23 convention θ_IP(f)=∫Θ(g,h)f(h)dh. It is linear in the automorphic input. The supplier `MetaplecticAutomorphicForms:MP.5/global-theta-lift` integrates the complex conjugate of its input, so use θ_MP(bar f) when importing it. Locally θ_IP(τ) is attached to the maximal τ∨-isotypic oscillator quotient. In particular the source τ above Σ is antiholomorphic of weight −k_v−1, while the nonzero product in the seesaw has the dual holomorphic weight k_v+1. Backward lifting requires the conjugation shown in JL.6. This convention change leaves the stated archimedean source types intact.

The norm-support group H_N⁺ consists of h∈B×(A_F) with Nrd(h)∈N(A_E×). The subgroup H_∞⁺ imposes positivity only at real places. Finite local norm obstructions distinguish them. The index-two assertion used in zero extension is for rational saturation, namely A_F×/(F×N(A_E×)); the unsaturated idele norm subgroup need not have index two. Normalized central trace is to the actual adelic image, followed by zero extension where specified, and compact averages have volume one.

Harmonic coefficients use the kernel of trace contraction on symmetric tensors, with the symmetric bilinear pairing containing the sum over all permutations and no factorial denominator. Accordingly the isotropic vector entering a restriction formula is e^ℓ/ℓ!. The Fourier character at infinity is ψ(x)=exp(2πix), and the real Schwartz construction assumes p,q even. The harmonic projection is an operator on the existing symmetric-power carrier. The algebraic Fock space corresponds to polynomial-times-Gaussian Schwartz vectors; it is not all Schwartz functions.

## Ownership and build order

The roadmap owns the explicit hermitian exterior construction and its block restrictions, the numerical weight comparisons, the harmonic Schwartz forms and restriction computations, the specific quaternionic theta/packet calculations, the normalized restriction correspondence and rational descent. Generic spin and Clifford constructions remain in the current Tau Ceti `OrthogonalSpinGroups` direction and its stated `AlgebrasWithInvolution` boundary. The exterior-square comparison here has additional hermitian, volume, multiplier and block data; it does not introduce another general Spin/D₃ theory.

Pure Hodge structures, Tate twists and internal Hom already exist at the pinned Tau Ceti baseline. Exterior powers and the determinant pairing use Mathlib’s carriers. General hermitian classification and quaternion embeddings come from GN.2. Current Tau Ceti already supplies norm changes of quaternion symbols and common-slot tensor/Brauer identities; reuse these instead of planning them again. The pinned square-rescaling citation covers only square changes, so the JL.1 proof also records the general generator transport explicitly. Global Brauer invariants, reciprocity and norm theorems come from Tau Ceti’s `ClassFieldTheory`. Weak approximation, finite-idele class quotients, ray-class finiteness and Hecke characters come from its current `GlobalNumberFields` roadmap. Automorphic, local-theta, canonical-model and Weil-cohomology foundations are imported from their owners below.

The eleven layers are in build order. JL.4 constructs harmonic carriers before JL.5 compares the rational coefficient systems. JL.6 establishes the near-equivalence tool; JL.7 constructs the common nonvanishing class; JL.8 proves Hodge purity. JL.9 supplies the conditional Galois conclusion and is an input only to the all-prime part of JL.10. The unconditional Hodge theorem has no dependency on JL.9. Within JL.10 the CM support-place choice, restriction map, complex invertibility, invariant component space and rational determinant argument have their own explicit prerequisites.

| Layer | Purpose |
| --- | --- |
| JL.0 | Quaternionic realizations and the correspondence target |
| JL.1 | The hermitian exterior construction |
| JL.2 | Block restrictions of the exceptional maps |
| JL.3 | Local models, weights and cohomological theta modules |
| JL.4 | Harmonic Schwartz forms |
| JL.5 | Shimura data, coefficients and component characters |
| JL.6 | Quaternionic theta transfer and near equivalence |
| JL.7 | Simultaneous nonvanishing of restricted theta classes |
| JL.8 | The unitary eigenspace and its Hodge type |
| JL.9 | The conditional Galois calculation |
| JL.10 | Rational descent and the main theorems |

## Verified library baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each following statement was read in that pinned source. Current Tau Ceti source and current roadmap main were inspected separately to avoid replanning newer work. A newer file location is not used as evidence that a declaration existed at the pin.

- `tauceti:TauCeti.Hodge.HodgeStructureOn` (TauCeti/Geometry/Hodge/Structure.lean): Pure Hodge structures with specified conjugation and opposed filtrations; used as the Hodge carrier.
- `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist` (TauCeti/Geometry/Hodge/Tate/Twist.lean): A Tate twist by m shifts F by m and changes weight n to n−2m.
- `tauceti:TauCeti.Hodge.HodgeStructureOn.internalHom` (TauCeti/Geometry/Hodge/InternalHom.lean): The pure Hodge structure on complex-linear maps with weight n₂−n₁.
- `mathlib:exteriorPower.map` (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Induced maps of exterior powers over a commutative ring.
- `mathlib:exteriorPower.pairingDual` (Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean): The determinant pairing from an exterior power of the dual to the dual exterior power.
- `tauceti:exteriorPower.map_top_eq_det_smul` (TauCeti/LinearAlgebra/ExteriorPower.lean): An endomorphism of a free rank-n module acts on its top exterior power by its determinant.
- `tauceti:TauCeti.QuaternionAlgebra.rescaleJEquiv` (TauCeti/Algebra/Quaternion/SymbolEquiv.lean): Square rescaling of the second quaternion symbol, with generator formulas; general norm changes still require the indicated coordinate argument.
- `mathlib:MvPolynomial.IsHomogeneous.eq_zero_of_forall_eval_eq_zero` (Mathlib/RingTheory/MvPolynomial/Homogeneous.lean): A homogeneous polynomial over an infinite integral domain vanishing on all rational points is zero.

The suggested file contains only real-bodied coordinate helpers for JL.1, JL.3 and JL.8, together with the matrix determinant-descent milestone of JL.10. It uses actual functions, fields and matrices from the pin. The reader states all heavy objects, APIs and tests; their missing carriers are not replaced by assumed structures in Lean. Elaborating these suggested statements checks their types, not their mathematical proofs or the realization of the roadmap.

## JL.0. Quaternionic realizations and the correspondence target

The target is first fixed at the level of multiplicity realizations, so the tensor, trace and coefficient conventions have a stable meaning throughout the construction. The division hypothesis is introduced only after the equal-algebra case has been removed.

Layer inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `MotivesAndAlgebraicCycles:MC.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `AutomorphicFormsOnReductiveGroups:AF.4`.

### Jacquet–Langlands Hodge data

Target `HodgeClassesForJacquetLanglands:JL.0/data`; proposed declaration `TauCeti.JacquetLanglandsHodge.data` (definition).

Fix a totally real field F of degree n, quaternion algebras B₁,B₂ with the same set Σ of split real places, d=|Σ|<n, and a cuspidal GL₂(A_F) representation π with trivial central character, even weights k_v≥2, and transfers π_i to B_i×. Put L=Q(π), containing Q(k). Use the unitary normalization r=0 and the coefficient representation τ_k=⊗_v Nrd_v^{(2−k_v)/2} Sym^{k_v−2}(τ_v), with its dual local system. F_Σ is the fixed field of automorphisms preserving Σ. An L-Hodge structure means a rational Hodge structure with L-action; equivalently use every embedding of L, rather than assuming conjugation preserves one arbitrary L-embedding. When d=0 use the finite compact Shimura set and its trivial-cocharacter constant model over Q; do not require Deligne’s exclusion of compact Q-adjoint factors for this degenerate case.

Construction or proof: 1. Obtain the quaternionic data and coefficient systems from the requested quaternionic extension of the Shimura supplier. 2. Apply cohomological rationality and self-duality; keep coefficient and unitary normalizations explicit.

Direct inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`, `tauceti:TauCeti.Hodge.HodgeStructureOn`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`.

Source: IP23, §§2.1, 3.1–3.2, pp. 14–19; Theorem 3.2, p. 20.

API:

- `TauCeti.JacquetLanglandsHodge.data.coefficient` (data): The coefficient is the dual of τ_k, with even exponents integral.
- `TauCeti.JacquetLanglandsHodge.data.reflexField` (characterisation): The reflex field is determined by the stabilizer of Σ. For Σ empty its reflex field is Q.
- `TauCeti.JacquetLanglandsHodge.data.coefficientConjugation` (compatibility): The L-action is by Hodge endomorphisms on the underlying rational structure; conjugate embeddings permute k.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.data.weightTwo` (computation): For every k_v=2, τ_k is trivial.
- `TauCeti.JacquetLanglandsHodge.data.definite` (degenerate): For Σ empty, d=0 and the Shimura variety is a finite set.
- `TauCeti.JacquetLanglandsHodge.data.oddWeight` (non-example): A weight k_v=3 is incompatible with trivial central character in this normalization.

Uses: Theorem 3.2: Supplies the precise domain of the final assertion. §12.2.3: Fixes the parity needed for harmonic similitude coefficients.

Check: Accept d=0 and reject d=n under this theorem’s compactness hypothesis.

### The division-algebra reduction

Target `HodgeClassesForJacquetLanglands:JL.0/brauer-reduction`; proposed declaration `TauCeti.JacquetLanglandsHodge.brauerReduction` (theorem).

For Jacquet–Langlands Hodge data, if B₁≅B₂ the identity on the multiplicity realization supplies the desired class through Poincaré duality. Otherwise the product Brauer class [B₁]+[B₂] has a quaternion division representative B. It is split at every real place, since B₁ and B₂ have identical real ramification. The theta construction below is used only in this second case.

Construction or proof: 1. Use the local invariant description and global Brauer theorem requested from ClassFieldTheory Layer 10; GN.2 supplies the quaternion arithmetic interface. 2. Separate the zero Brauer class before imposing division in the analytic argument.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/data`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

Source: IP23, §4.1, pp. 20–21; §10.1, p. 65; §12.2.1, p. 94.

Check: For B₁=B₂ use the diagonal correspondence; do not impose division on a zero Brauer class.

### Quaternionic multiplicity realizations

Target `HodgeClassesForJacquetLanglands:JL.0/multiplicity-realization`; proposed declaration `TauCeti.JacquetLanglandsHodge.multiplicityRealization` (comparison).

For data as above let V_i be the L-rational π_i,f multiplicity space in H^d(Sh_{B_i},V_{k,i}). It is independent of sufficiently small level, has L-dimension 2^d, and is pure of weight d with this normalization. Its Betti and all étale realizations form an object of M_{F_Σ}^L. The self-dual coefficient pairing and Poincaré duality identify V_i with V_i∨(−d). The cohomological degree here is d, correcting the printed 2d on p. 19.

Construction or proof: 1. Use the requested arbitrary-Σ quaternionic Matsushima and local-system realizations. 2. Take the Hecke multiplicity Hom, not the entire finite-level isotypic summand. 3. Apply the coefficient duality and trace pairing at compatible levels.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/data`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`.

Source: IP23, §2.2.2, p. 16; §3.3, p. 19; §12.3, p. 98.

Check: Check d=1 gives a rank-two multiplicity space in H¹.

### Archimedean sign lines

Target `HodgeClassesForJacquetLanglands:JL.0/sign-lines`; proposed declaration `TauCeti.JacquetLanglandsHodge.signLines` (theorem).

For V_i of multiplicity-realization, its complexification decomposes into 2^d one-dimensional tensor sign lines indexed by signs at v∈Σ. At a split v the two cochain contributions have bidegrees (1,0) and (0,1); their actual coefficient-normalized Hodge types are (k_v/2,1−k_v/2) and the reversed pair. Outside Σ the degree-zero coefficient line contributes (0,0). Equal total Hodge types can have multiplicity, so retain the full tensor-sign indexing. The duality pairs opposite signs.

Construction or proof: 1. Apply the GL₂ discrete-series calculation at split real places and compact invariants elsewhere. 2. Tensor the individual lines and track the coefficient pairing.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/multiplicity-realization`, `AutomorphicFormsOnReductiveGroups:AF.4/vogan-zuckerman`.

Source: IP23, §3.3, p. 19; Proposition 12.3, p. 98.

Check: For d=2 and both split weights equal to two, four sign lines give a two-dimensional type-(1,1) space. With split weights two and four, the four types are (3,−1),(2,0),(0,2),(−1,3), so there is no type-(1,1) line.

### The cohomological correspondence operator

Target `HodgeClassesForJacquetLanglands:JL.0/tensor-correspondence`; proposed declaration `TauCeti.JacquetLanglandsHodge.tensorCorrespondence` (comparison).

Poincaré duality yields an L-linear identification V₁⊗_L V₂(d)≅Hom_L(V₁,V₂). On geometric cohomology it sends ξ to x↦p₂,*(ξ∪p₁*x), using the coefficient pairing. Under this identification a rational type-(0,0) tensor is a Hodge morphism; a tensor fixed in every étale realization gives G_{F_Σ}-equivariant maps for every ℓ. No assertion that every Hodge class is algebraic is used.

Construction or proof: 1. Specialize the supplied Künneth and trace formalism to the π₁⊠π₂ multiplicity summand. 2. Identify tensor contraction with the push-cup-pull formula, retaining the twist d.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/multiplicity-realization`, `MotivesAndAlgebraicCycles:MC.2/weil-pushforward`, `MotivesAndAlgebraicCycles:MC.2/pushforward-along-projection`, `tauceti:TauCeti.Hodge.HodgeStructureOn.internalHom`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`.

Source: IP23, §1.1, pp. 4–5; §3.3, pp. 19–20; §12.3, p. 98.

Check: For ξ the diagonal on equal factors the operator is the identity.

## JL.1. The hermitian exterior construction

The volume and its inverse norm-rescaling law determine the quaternion symbol. The wedge pairing supplies an intrinsic semilinear operator; basis computations check it without replacing the exterior-power carrier. Its square and skew identities are exactly the relations needed for the right B-action.

Layer inputs: `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

### Hermitian volume

Target `HodgeClassesForJacquetLanglands:JL.1/volume`; proposed declaration `TauCeti.JacquetLanglandsHodge.volume` (definition).

Let E/F be quadratic number fields, H a nondegenerate hermitian form on an n-dimensional right E-space U, conjugate-linear in the first argument, and d_U:∧^n_E U≅E. On exterior powers use the determinant pairing. For w=d_U⁻¹(1), define vol(H,d_U)=H_top(w,w)∈F×. Replacing d_U by αd_U multiplies volume by N_{E/F}(α)⁻¹.

Construction or proof: 1. Transport the determinant pairing along the top exterior trivialization. 2. Nondegeneracy makes the scalar nonzero and hermitian symmetry fixes it under conjugation.

Direct inputs: `mathlib:exteriorPower.pairingDual`, `mathlib:exteriorPower.map`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`.

Source: IP23, Proposition 5.1 and equations (5.1)–(5.3), pp. 25–26; Definition 5.2, p. 28.

API:

- `TauCeti.JacquetLanglandsHodge.volume.diagonal` (simp): If d_U(e₁∧…∧e_n)=c, volume is (∏a_i)/N(c).
- `TauCeti.JacquetLanglandsHodge.volume.rescale` (relation): vol(H,αd_U)=N(α)⁻¹vol(H,d_U).
- `TauCeti.JacquetLanglandsHodge.volume.determinantClass` (compatibility): Its class in F×/N(E×) is the determinant invariant of the supplied hermitian-space classification.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.volume.unitDiagonal` (computation): For H=diag(1,1,1,1) and d_U(wedge)=−1, volume is 1.
- `TauCeti.JacquetLanglandsHodge.volume.twoPlaneSign` (computation): For diag(1,−J₁,1,−J₂), volume is J₁J₂.
- `TauCeti.JacquetLanglandsHodge.volume.scaleTwo` (non-example): Scaling d_U by 2 divides volume by 4, rather than multiplying it by 4.

Uses: Proposition 5.3: Determines the square of the semilinear exterior operator. Proposition 5.7: Controls the choice dependence of the quaternion presentation.

Check: For an orthogonal basis normalized by d_U(wedge)=1, volume is the product of its diagonal coefficients.

### The determinant norm identity

Target `HodgeClassesForJacquetLanglands:JL.1/determinant-norm`; proposed declaration `TauCeti.JacquetLanglandsHodge.determinantNorm` (theorem).

For H nondegenerate of dimension n over E/F and g∈GU_E(H) of multiplier ν, N_{E/F}(det_E g)=ν^n. On ∧^r_E U the determinant hermitian pairing has multiplier ν^r.

Construction or proof: 1. Apply the determinant pairing to a top exterior generator. 2. Compare the action by det g with the multiplier ν^n.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/volume`, `tauceti:exteriorPower.map_top_eq_det_smul`, `mathlib:exteriorPower.map`.

Source: IP23, Proposition 5.1, p. 25; equations (5.1)–(5.3), p. 26.

Check: For scalar α, both sides are N(α)^n.

### The semilinear exterior operator

Target `HodgeClassesForJacquetLanglands:JL.1/exterior-star`; proposed declaration `TauCeti.JacquetLanglandsHodge.exteriorStar` (construction).

For dim_E U=4 and d_U as in volume, let φ:U→U∨ be the conjugate-linear map defined by H, ι:∧²U∨→(∧²U)∨ the determinant dual pairing, and ψ:∧²U→(∧²U)∨ the symmetric perfect wedge pairing followed by d_U. Define L=ψ⁻¹ι(∧²φ). Then L(xα)=L(x)bar α. If an orthogonal basis has coefficients a₁,…,a₄ and d_U(e₁₂₃₄)=−1, its images on (e₁₂,e₁₃,e₁₄,e₂₃,e₂₄,e₃₄) are (−a₁a₂e₃₄,a₁a₃e₂₄,−a₁a₄e₂₃,−a₂a₃e₁₄,a₂a₄e₁₃,−a₃a₄e₁₂).

Construction or proof: 1. Build ψ from the existing exterior multiplication and top trivialization. 2. Regard the conjugate-linear hermitian dual map as an E-linear map out of the conjugate E-module before applying exteriorPower.map. Use the conjugate-module exterior identification and finite-free perfectness of the determinant pairing to obtain the semilinear operator on ∧²U.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/volume`, `mathlib:exteriorPower.pairingDual`, `mathlib:exteriorPower.map`.

Source: IP23, §5.2, equations (5.4)–(5.5), pp. 26–29.

API:

- `TauCeti.JacquetLanglandsHodge.exteriorStar.conjugateLinear` (structure): L is additive and conjugate-linear for E/F.
- `TauCeti.JacquetLanglandsHodge.exteriorStar.basisImages` (simp): The six orthogonal-basis formulas in the statement hold with their signs.
- `TauCeti.JacquetLanglandsHodge.exteriorStar.rescale` (compatibility): Replacing d_U by αd_U replaces L by α⁻¹L; the underlying exterior carrier is Mathlib’s exterior power.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.exteriorStar.positiveDiagonal` (computation): For all a_i=1, L(e₁₂)=−e₃₄ and L(e₁₃)=e₂₄.
- `TauCeti.JacquetLanglandsHodge.exteriorStar.imaginaryScalar` (non-example): For trace-zero i∈E, L(e₁₂ i)=−L(e₁₂)i, so L is not E-linear.
- `TauCeti.JacquetLanglandsHodge.exteriorStar.orientationChange` (compatibility): Replacing d_U by −d_U negates L but leaves L² unchanged.

Uses: Propositions 5.3 and 5.6: Defines the quaternion generator and tests equivariance. Example 5.14: Computes the tensor-block quaternion action.

Check: Check all six basis images with the chosen orientation.

### The square of the exterior operator

Target `HodgeClassesForJacquetLanglands:JL.1/exterior-square`; proposed declaration `TauCeti.JacquetLanglandsHodge.exteriorSquare` (theorem).

For exterior-star, L²=J·id with J=vol(H,d_U). Thus every diagonal-coordinate square is a₁a₂a₃a₄ when d_U(e₁₂₃₄)=−1.

Construction or proof: 1. Compose the paired basis images, then descend the identity by basis independence.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/exterior-star`, `HodgeClassesForJacquetLanglands:JL.1/volume`.

Source: IP23, Proposition 5.3, pp. 28–29.

Check: For diag(1,−J₁,1,−J₂) the square is J₁J₂.

### Exterior skew-pairing identities

Target `HodgeClassesForJacquetLanglands:JL.1/skew-identities`; proposed declaration `TauCeti.JacquetLanglandsHodge.skewIdentities` (theorem).

Choose trace-zero i∈E× and let b=iH_{∧²}. For exterior-star with J=vol, b(Lx,y)=b(Ly,x) and overline(b(Lx,Ly))=−J b(x,y). The second identity follows from the first and L²=J. These are identities for the E-valued skew-hermitian pairing b, before extension to B.

Construction or proof: 1. Check the first identity on complementary exterior basis pairs. 2. Use conjugate-linearity and the square relation to deduce the second identity.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/exterior-square`.

Source: IP23, Lemma 5.4 and Remark 5.5, pp. 29–30.

Check: The first identity is symmetric in x,y; the plane case in JL.2 has the opposite sign.

### The quaternionic exterior space

Target `HodgeClassesForJacquetLanglands:JL.1/quaternion-exterior`; proposed declaration `TauCeti.JacquetLanglandsHodge.quaternionExterior` (construction).

Put B=E⊕Ej with j²=J=vol(H,d_U), αj=j bar α, and canonical involution *. On ∧²_E U set xj=Lx, giving a rank-three right B-module. With b=iH_{∧²}, set ⟨x,y⟩=b(x,y)−J⁻¹ j b(Lx,y). This is a nondegenerate B-skew-hermitian form. Rescaling d_U gives an isomorphic B-space through the corresponding change of quaternion generator. The carrier B is an existing quaternion algebra; this target supplies its action and form, not another quaternion-algebra foundation.

Construction or proof: 1. Use L² and conjugate-linearity to verify the quaternion relations. 2. Apply the skew identities to prove B-sesquilinearity and skew symmetry. 3. Prove nondegeneracy via its E-component. For d′_U=αd_U one has L′=α⁻¹L and J′=J/N(α); use j′↦jα⁻¹ (equivalently bar α⁻¹j) to compare the quaternion presentations, and verify transport of the action and form. Reuse current TauCeti.QuaternionAlgebra.normMulEquiv for this algebra equivalence when available; the pinned square-rescaling citation alone does not cover general α.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/skew-identities`, `tauceti:TauCeti.QuaternionAlgebra.rescaleJEquiv`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`.

Source: IP23, Equation (5.6), p. 30; §5.2, pp. 26–31.

API:

- `TauCeti.JacquetLanglandsHodge.quaternionExterior.actionJ` (simp): The existing exterior vector x has right j-action Lx.
- `TauCeti.JacquetLanglandsHodge.quaternionExterior.form` (characterisation): Its E-component is b and its j-component is −J⁻¹b(Lx,y) with the displayed multiplication order.
- `TauCeti.JacquetLanglandsHodge.quaternionExterior.changeVolume` (equivalence): Norm changes of J induce an isometry after the corresponding quaternion algebra equivalence.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.quaternionExterior.rank` (computation): E-rank six becomes B-rank three.
- `TauCeti.JacquetLanglandsHodge.quaternionExterior.sesquilinearity` (compatibility): ⟨xβ,yγ⟩=β*⟨x,y⟩γ for β,γ∈B.
- `TauCeti.JacquetLanglandsHodge.quaternionExterior.zeroVector` (degenerate): The zero vector pairs to zero; nondegeneracy asserts that it is the only vector pairing to zero with every y.

Uses: Propositions 5.6–5.7: Provides the target of the exceptional maps. §10.3: Provides the skew-hermitian member of the global theta pair.

Check: Verify right multiplication order in the j-term.

### The exceptional exterior isogeny

Target `HodgeClassesForJacquetLanglands:JL.1/exceptional-isogeny`; proposed declaration `TauCeti.JacquetLanglandsHodge.exceptionalIsogeny` (theorem).

Let GSU_E(U)={g∈GU_E(U):det_E g=ν(g)²}. The exterior action gives an algebraic F-group isogeny GSU_E(U)→GU_B(∧²U)^0 with kernel μ₂. The multiplier on the target is ν(g)². For general g, L∘∧²g=(ν(g)²/det g)(∧²g)∘L. The identity component and the scheme-theoretic central kernel are part of the statement.

Construction or proof: 1. Derive the L-intertwining identity from the wedge pairing. 2. Verify B-linearity on GSU and the squared multiplier. 3. Compute kernel on geometric points and differential; use connectedness and equal dimension sixteen in characteristic zero.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/quaternion-exterior`, `HodgeClassesForJacquetLanglands:JL.1/determinant-norm`, `tauceti:exteriorPower.map_top_eq_det_smul`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

Source: IP23, Proposition 5.6, equations (5.7)–(5.10), pp. 30–31.

Check: For scalar t∈F×, the exterior action is t² and the target multiplier t⁴.

### The exceptional projective isomorphism

Target `HodgeClassesForJacquetLanglands:JL.1/exceptional-projective`; proposed declaration `TauCeti.JacquetLanglandsHodge.exceptionalProjective` (theorem).

The exterior construction induces an algebraic F-group isomorphism PGU_E(U)≅PGU_B(∧²U)^0. For g, choose β∈E× with β/bar β=ν(g)²/det g and send x to (∧²g)(x)β modulo the central F×. The class is independent of β and of the central E× representative of g. This agrees with exceptional-isogeny when det g=ν(g)².

Construction or proof: 1. Use the norm identity and Hilbert 90 from the supplier to choose β. 2. Verify independence modulo F× and compatibility after splitting the groups. 3. Descend the geometric algebraic-group isomorphism; do not infer surjectivity on F-points from an isogeny alone.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/exceptional-isogeny`, `HodgeClassesForJacquetLanglands:JL.1/determinant-norm`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Source: IP23, Proposition 5.7 and Remarks 5.8–5.9, p. 31.

Check: Changing β to βt, t∈F×, has no projective effect.

## JL.2. Block restrictions of the exceptional maps

The mixed and diagonal wedge summands connect the exceptional map to the product of the two original quaternion groups. Their kernels, multipliers and quotient directions must agree before the diagram is used on adelic points. The three-plus-one comparison is a bounded additional routed target.

Layer inputs: `HodgeClassesForJacquetLanglands:JL.1`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

### Quaternionic hermitian planes

Target `HodgeClassesForJacquetLanglands:JL.2/quaternion-planes`; proposed declaration `TauCeti.JacquetLanglandsHodge.quaternionPlanes` (definition).

For E/F quadratic embedded in B_i, write B_i=E⊕Ej_i with j_i²=J_i. On U_i=B_i as a right E-plane put H_i(a+j_i b,c+j_i d)=bar a c−J_i bar b d. Left-right multiplication x↦βxα⁻¹ identifies GU_E(U_i) with (B_i××E×)/diag F×; its multiplier is Nrd(β)/N(α), and determinant Nrd(β)α⁻². For a general orthogonal plane diag(a₁,a₂) with top trivialization one, the analogous semilinear map has L₁e₁=−a₁e₂, L₁e₂=a₂e₁, square −a₁a₂; its pairing identity has the opposite symmetry from the four-dimensional case.

Construction or proof: 1. Use the quaternion involution and E-basis (1,j_i) to compute the form. 2. Identify the scalar kernel of the left-right action and its dimension. 3. Compute the alternating plane duality separately from the symmetric degree-two wedge pairing.

Direct inputs: `tauceti:TauCeti.QuaternionAlgebra.rescaleJEquiv`, `HodgeClassesForJacquetLanglands:JL.1/volume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`.

Source: IP23, §4.1, pp. 20–21; Lemma 5.12 and equations (5.14)–(5.15), p. 33; explicit model in §5.3.1, pp. 35–36.

API:

- `TauCeti.JacquetLanglandsHodge.quaternionPlanes.similitude` (simp): The action of (β,α) has multiplier Nrd(β)/N(α).
- `TauCeti.JacquetLanglandsHodge.quaternionPlanes.determinant` (simp): Its E-determinant is Nrd(β)α⁻².
- `TauCeti.JacquetLanglandsHodge.quaternionPlanes.quotientKernel` (characterisation): The action is trivial exactly for (β,α)=(t,t), t∈F×.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.quaternionPlanes.diagonalScalar` (computation): For (β,α)=(t,t), the action and determinant are the identity and one.
- `TauCeti.JacquetLanglandsHodge.quaternionPlanes.rightScalar` (non-example): For β=1 the multiplier is N(α)⁻¹, not N(α).
- `TauCeti.JacquetLanglandsHodge.quaternionPlanes.planeSquare` (compatibility): For diag(1,−J_i), L₁²=J_i, whereas volume of that plane is −J_i.

Uses: Proposition 5.13: Identifies the two quaternionic blocks. §12.2.2: Supplies the Shimura data on the block subgroup.

Check: Track the inverse α in the action.

### The two-plane exterior decomposition

Target `HodgeClassesForJacquetLanglands:JL.2/block-exterior`; proposed declaration `TauCeti.JacquetLanglandsHodge.blockExterior` (construction).

For U=U₁⊥U₂ with dim_E U_i=2, decompose ∧²U into W=U₁⊗_E U₂ and W₀=∧²U₁⊕∧²U₂ through the ordered wedge inclusions. The operator L preserves both summands, so they have B-ranks two and one and form an orthogonal decomposition of the quaternionic exterior space. The embedding of the equal-multiplier block group is compatible with this splitting.

Construction or proof: 1. Use exterior powers of a direct sum and identify the mixed term by u₁⊗u₂↦u₁∧u₂. 2. Check L on the two diagonal wedge lines and on the four mixed basis elements.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/quaternion-exterior`, `HodgeClassesForJacquetLanglands:JL.2/quaternion-planes`, `mathlib:exteriorPower.map`.

Source: IP23, Equation (5.11) and Proposition 5.10, p. 32.

API:

- `TauCeti.JacquetLanglandsHodge.blockExterior.mixedInclusion` (constructor): u₁⊗u₂ maps to u₁∧u₂ in that order.
- `TauCeti.JacquetLanglandsHodge.blockExterior.ranks` (structure): W has B-rank two and W₀ has B-rank one.
- `TauCeti.JacquetLanglandsHodge.blockExterior.orthogonal` (compatibility): The splitting agrees with the existing exterior direct-sum decomposition after forgetting the B-action.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.blockExterior.dimensions` (computation): The E-dimensions are four and two, summing to six.
- `TauCeti.JacquetLanglandsHodge.blockExterior.wedgeOrder` (non-example): Interchanging u₁,u₂ changes the mixed wedge sign.
- `TauCeti.JacquetLanglandsHodge.blockExterior.rankOne` (compatibility): The line ∧²U₁ alone is generally not L-stable: L exchanges the two diagonal wedge lines.

Uses: Propositions 5.10–5.11: Restricts the exceptional maps. Propositions 8.1–8.2: Determines the restriction subspace of the Schwartz forms.

Check: The decomposition is both L-stable and orthogonal.

### The block exterior isogeny

Target `HodgeClassesForJacquetLanglands:JL.2/block-isogeny`; proposed declaration `TauCeti.JacquetLanglandsHodge.blockIsogeny` (theorem).

Let H=GSU_E(U)∩G(U_E(U₁)×U_E(U₂)), where G means equal similitudes. The exterior isogeny restricts to H→G(U_B(W)×U_B(W₀))^0, a central algebraic isogeny with kernel μ₂. Its source and target have dimension eight.

Construction or proof: 1. Restrict the L-equivariant exterior action to the stable summands. 2. Use the central kernel already computed and compare dimensions of connected groups.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/block-exterior`, `HodgeClassesForJacquetLanglands:JL.1/exceptional-isogeny`.

Source: IP23, Proposition 5.10, equation (5.12), p. 32.

Check: The target is the identity component of the equal-multiplier subgroup.

### The projective block isomorphism

Target `HodgeClassesForJacquetLanglands:JL.2/block-projective`; proposed declaration `TauCeti.JacquetLanglandsHodge.blockProjective` (theorem).

The exceptional projective map restricts to G(U_E(U₁)×U_E(U₂))/E×≅G(U_B(W)×U_B(W₀))^0/F×. For U_i=B_i, write g=([b₁,α₁],[b₂,α₂]) with equal multipliers. Its image is [[b₁,b₂],Nrd(b₁)α₁⁻¹α₂]; this also equals the expression using det(g₁)α₁α₂. The quotient of B₁××B₂× uses t↦(t,t⁻¹).

Construction or proof: 1. Use the same Hilbert-90 scalar on both stable blocks. 2. Substitute the plane determinant formula and check invariance under all central representatives.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/block-isogeny`, `HodgeClassesForJacquetLanglands:JL.1/exceptional-projective`, `HodgeClassesForJacquetLanglands:JL.2/quaternion-planes`.

Source: IP23, Proposition 5.11, equation (5.13), p. 32; explicit formulas in §5.3.1, pp. 35–36.

Check: Test the anti-diagonal F× quotient explicitly.

### The quaternionic block groups

Target `HodgeClassesForJacquetLanglands:JL.2/block-groups`; proposed declaration `TauCeti.JacquetLanglandsHodge.blockGroups` (comparison).

For the two-plane exterior construction with B_i as above, GU_B(W)^0≅(B₁××B₂×)/{(t,t⁻¹)}, with multiplier Nrd(b₁)Nrd(b₂), and GU_B(W₀)^0≅E× with multiplier N_{E/F}. The second assertion is about the identity component; the full rank-one group also has an involution-normalizer component.

Construction or proof: 1. Compute the rank-one block action on a B-generator coming from ∧²U₁. 2. Identify left multiplication by B₁× and B₂× on the tensor block and its anti-diagonal kernel.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/quaternion-planes`, `HodgeClassesForJacquetLanglands:JL.2/block-exterior`, `HodgeClassesForJacquetLanglands:JL.2/block-projective`.

Source: IP23, §5.3.1, pp. 32–34; Proposition 5.13, p. 34.

Check: A normalizer element outside E× is not identified with an element of the identity component.

### The explicit quaternion tensor model

Target `HodgeClassesForJacquetLanglands:JL.2/tensor-model`; proposed declaration `TauCeti.JacquetLanglandsHodge.tensorModel` (comparison).

For U=B₁⊥B₂ and ordered E-basis (1,j₁,1,j₂), H has diagonal (1,−J₁,1,−J₂) and J=J₁J₂. On W in order (e₁₃,e₂₃,e₁₄,e₂₄), L sends those vectors to (e₂₄,J₁e₁₄,J₂e₂₃,J₁J₂e₁₃). The E-hermitian form on W is diag(1,−J₁,−J₂,J₁J₂), and [B]=[B₁]+[B₂]. This identifies the exterior block with the quaternion tensor model used for periods.

Construction or proof: 1. Substitute the diagonal coefficients into all six exterior formulas. 2. Compare the B-action and form with the tensor product model. Reuse current TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix and TauCeti.BrauerGroup.quaternionClass_mul for the common-slot algebra/Brauer identity; retain the requested global arithmetic interface separately.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/block-groups`, `HodgeClassesForJacquetLanglands:JL.1/exterior-square`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

Source: IP23, Example 5.14, pp. 36–37.

Check: The displayed four-by-four semilinear matrix squares to J₁J₂ times the identity.

### The three-plus-one restriction

Target `HodgeClassesForJacquetLanglands:JL.2/three-one`; proposed declaration `TauCeti.JacquetLanglandsHodge.threeOne` (comparison).

If U=U₃⊥U₄ has dimensions three and one, put W=U₃⊗_E U₄, embedded as the mixed wedge summand. The B-action identifies the quaternionic exterior space with W⊗_E B; its skew form extends the E-skew form on W. The exceptional map restricts to G(U_E(U₃)×U_E(U₄))/E×≅GU_E(W)/F×. This is the bounded additional restriction comparison routed to this roadmap; the final theta construction uses the two-plus-two restriction.

Construction or proof: 1. Show W and Wj are complementary using the two exterior blocks. 2. Check extension of the form and compare connected groups and their central kernels.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.1/exceptional-projective`, `HodgeClassesForJacquetLanglands:JL.1/quaternion-exterior`.

Source: IP23, Equation (5.16), p. 37; Proposition 5.15, p. 38.

Check: Verify E-rank three becomes B-rank three after tensor extension.

### The exceptional group diagram

Target `HodgeClassesForJacquetLanglands:JL.2/group-diagram`; proposed declaration `TauCeti.JacquetLanglandsHodge.groupDiagram` (construction).

Write U=B₁⊥B₂, U~=GU_E(U), H~=G(U_E(B₁)×U_E(B₂)), G~=GU_B(∧²U)^0, and H~_B=G(U_B(W)×U_B(W₀))^0. Form the inclusions H~→U~, H~_B→G~, central quotients U~/E× and G~/F×, and the projective exceptional isomorphisms. Under block-groups write H~_B={(g,α)∈G×E×:ν(g)=Nα}, G=(B₁××B₂×)/anti F×. The diagram commutes as algebraic groups before restriction of scalars to Q.

Construction or proof: 1. Assemble the already identified maps; compute both composites on (b_i,α_i). 2. Use central-quotient functoriality from ReductiveGroups.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/block-projective`, `HodgeClassesForJacquetLanglands:JL.2/block-groups`.

Source: IP23, §4.1, pp. 20–22; Propositions 5.7, 5.11, pp. 31–32.

API:

- `TauCeti.JacquetLanglandsHodge.groupDiagram.commutes` (relation): Block inclusion followed by projectivization agrees with the exceptional projective map followed by quaternionic block inclusion.
- `TauCeti.JacquetLanglandsHodge.groupDiagram.equalMultiplier` (characterisation): H~_B is exactly the fiber product ν(g)=Nα.
- `TauCeti.JacquetLanglandsHodge.groupDiagram.restrictionOfScalars` (functoriality): All arrows commute with Res_{F/Q} and extension to local fields.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.groupDiagram.centralQuotients` (compatibility): The E-side kills E×; the B-side kills F×.
- `TauCeti.JacquetLanglandsHodge.groupDiagram.antiDiagonal` (non-example): The scalar (t,t) in B₁××B₂× is not the kernel used to define G; (t,t⁻¹) is.
- `TauCeti.JacquetLanglandsHodge.groupDiagram.rankOneLabel` (computation): The rank-one block is a B-unitary group, correcting the E-label in the rotated diagram.

Uses: §12.2.5–12.2.10: Organizes the pullback and normalized trace sequence. §4.2: Transports the specified Shimura data.

Check: Every arrow names its kernel and source component.

## JL.3. Local models, weights and cohomological theta modules

Localizing the explicit model fixes the real signatures, compact tori and character lattice. Archimedean cohomology is relative Lie-algebra cohomology at this stage; its indices acquire their geometric Hodge interpretation in JL.8.

Layer inputs: `HodgeClassesForJacquetLanglands:JL.2`, `HodgeClassesForJacquetLanglands:JL.1`, `MetaplecticAutomorphicForms:MP.3`, `AutomorphicFormsOnReductiveGroups:AF.4`.

### Local quadratic models

Target `HodgeClassesForJacquetLanglands:JL.3/morita-models`; proposed declaration `TauCeti.JacquetLanglandsHodge.moritaModels` (comparison).

Localize the exterior construction at a characteristic-zero local field, allowing quadratic étale E. When B is split choose the paper’s matrix units and a primitive idempotent e. Imported Morita transfer of forms identifies a skew-hermitian B-space X of rank m with the quadratic F-space X†=Xe of dimension 2m and GU_B(X)^0 with GSO(X†). For the exterior space at real places, the signatures are (4,2) above Σ and (0,6) elsewhere; for W they are (2,2) and (0,4), and for W₀ (2,0) and (0,2). The tensor symplectic space and Weil splittings must agree under Morita, not just the abstract groups.

Construction or proof: 1. Import the general Morita transfer and splitting comparison requested from MP.3. 2. Compute the real quadratic diagonal in the explicit matrix-unit basis; distinguish the local top-trivialization convention from the global one.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/tensor-model`, `HodgeClassesForJacquetLanglands:JL.1/exceptional-projective`, `MetaplecticAutomorphicForms:MP.3/harris-kudla-morita-comparison`.

Source: IP23, §6.1, p. 38; §6.3, pp. 42–44; §10.3, p. 66.

Check: The real exterior model has four positive and two negative directions above Σ.

### The split exceptional torus map

Target `HodgeClassesForJacquetLanglands:JL.3/split-torus`; proposed declaration `TauCeti.JacquetLanglandsHodge.splitTorus` (comparison).

For the split local model of §6.2, parametrize the unitary maximal torus by (t₁,t₂,ν)∈E××E××F×, with central z represented by (z,z,Nz). Parametrize the quadratic torus by (s₁,s₂,α)∈F××F××E×, modulo its center (z,z,z), z∈F×. The exceptional map is (t₁,t₂,ν)↦(N(t₁t₂),νN(t₁),νt₁bar t₂) modulo that center.

Construction or proof: 1. Apply the exterior action to the explicit hyperbolic basis and then the Morita basis. 2. Cancel the central scalar when reading the three torus coordinates.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.3/morita-models`, `HodgeClassesForJacquetLanglands:JL.1/exceptional-projective`.

Source: IP23, Lemma 6.1, p. 41.

Check: A central unitary element maps to a central quadratic element.

### The real exceptional torus map

Target `HodgeClassesForJacquetLanglands:JL.3/real-torus`; proposed declaration `TauCeti.JacquetLanglandsHodge.realTorus` (comparison).

For the real maximal compact tori of §6.3 write z_i=y_i² with z_i,y_i∈C¹. In projective coordinates the map sends (diag(z₁,z₂,z₃,z₄),r) to (y₁y₃/(y₂y₄), y₁y₄/(y₂y₃), y₁y₂/(y₃y₄), r²) modulo the real scalar center. Changing any square root changes the triple by a common central sign, so the projective result is well-defined.

Construction or proof: 1. Compute exterior eigenvalues and express them in the real quadratic rotation basis. 2. Check the independent sign changes of the square roots after projectivization.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.3/morita-models`, `HodgeClassesForJacquetLanglands:JL.1/exceptional-isogeny`.

Source: IP23, Lemma 6.2, p. 44.

Check: The radial coordinate is squared, agreeing with the similitude calculation.

### The exceptional weight map

Target `HodgeClassesForJacquetLanglands:JL.3/weight-map`; proposed declaration `TauCeti.JacquetLanglandsHodge.weightMap` (construction).

On the integral lattice {(l₁,l₂,l₃)∈Z³:l₁+l₂+l₃ is even}, pullback of characters is (l₁,l₂,l₃)↦((l₁+l₂+l₃)/2,(−l₁−l₂+l₃)/2,(l₁−l₂−l₃)/2,(−l₁+l₂−l₃)/2). The four coordinates sum to zero. Its inverse on the sum-zero lattice is (k₁,k₂,k₃,k₄)↦(k₁+k₃,k₁+k₄,k₁+k₂).

Construction or proof: 1. Pair the three rotation characters with the torus formula. 2. Solve the four linear equations and identify the parity sublattice.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.3/real-torus`.

Source: IP23, Corollary 6.3, p. 45.

API:

- `TauCeti.JacquetLanglandsHodge.weightMap.sumZero` (relation): The image has zero coordinate sum.
- `TauCeti.JacquetLanglandsHodge.weightMap.inverse` (equivalence): The stated inverse gives a bijection of the two integral lattices.
- `TauCeti.JacquetLanglandsHodge.weightMap.dominantCoefficient` (compatibility): For l=(k−2,0,0), k even, the torus-order result is ((k−2)/2,−(k−2)/2,(k−2)/2,−(k−2)/2). Reorder the one-based coordinates as (1,3,2,4) to obtain the §11.3 Borel-dominant coefficient weight ((k−2)/2,(k−2)/2,−(k−2)/2,−(k−2)/2).

Unit tests:

- `TauCeti.JacquetLanglandsHodge.weightMap.firstAxis` (computation): (2,0,0) maps to (1,−1,1,−1).
- `TauCeti.JacquetLanglandsHodge.weightMap.thirdAxis` (computation): (0,0,2) maps to (1,1,−1,−1).
- `TauCeti.JacquetLanglandsHodge.weightMap.oddSum` (non-example): (1,0,0) gives half-integral coordinates and is outside the domain lattice.

Uses: §11.3 and §12.2.3: Compares harmonic and unitary coefficient representations.

Check: Check integrality rather than silently using integer division on arbitrary Z³.

### The cohomological theta module

Target `HodgeClassesForJacquetLanglands:JL.3/archimedean-theta`; proposed declaration `TauCeti.JacquetLanglandsHodge.archimedeanTheta` (comparison).

For even k≥2 the real theta lift from SL₂(R) of the antiholomorphic discrete series D⁻_{k+1} to O(4,2) restricts to A_{q₁}(k−2,0,0) on SO(4,2)^0. Its lowest K-type is (k,0,0), and cohomology with harmonic coefficient H^{k−2} has dimensions one in (1,1) and (3,3), two in (2,2), and zero elsewhere. The holomorphic D⁺_{k+1} gives the holomorphic q₀ module. At O(0,6) the holomorphic lift is the compact representation of highest weight (k−2,0,0), while the antiholomorphic lift vanishes.

Construction or proof: 1. Import the explicit archimedean theta correspondence from the requested MP.3 interface. 2. Apply Vogan–Zuckerman’s formula to the displayed q₁ roots and coefficient.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.3/weight-map`, `AutomorphicFormsOnReductiveGroups:AF.4/vogan-zuckerman`, `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3`.

Source: IP23, §7.2.1–§7.2.2, pp. 47–48.

Check: At k=2 the q₁ cohomology remains nonzero in degree two and has middle dimension two.

## JL.4. Harmonic Schwartz forms

The harmonic coefficient carrier, its pairing and Fock normalization precede the global coefficient comparison. The restriction computations test orientation, factorial and negative-signature signs directly. Both formulas are needed because the real place set has compact and noncompact factors.

Layer inputs: `AutomorphicFormsOnReductiveGroups:AF.4`, `MetaplecticAutomorphicForms:MP.0`, `MetaplecticAutomorphicForms:MP.2`, `HodgeClassesForJacquetLanglands:JL.3`.

### Harmonic symmetric tensors

Target `HodgeClassesForJacquetLanglands:JL.4/harmonics`; proposed declaration `TauCeti.JacquetLanglandsHodge.harmonics` (definition).

For a nondegenerate real quadratic space X of signature (p,q), let H^ℓX be the kernel of contraction C:Sym^ℓX_C→Sym^{ℓ−2}X_C, C(v₁…v_ℓ)=Σ_{i<j}(v_i,v_j)∏_{r≠i,j}v_r, and C=0 for ℓ<2. Equip Sym^ℓ with the bilinear pairing Σ_{σ∈S_ℓ}∏_i(v_i,w_{σi}), with no division by ℓ!. Use the canonical orthogonal projection Sym^ℓ→H^ℓ from the harmonic decomposition.

Construction or proof: 1. Import symmetric-power representation and highest-weight theory from AF.4. 2. Use trace contraction and its complementary quadratic-multiplication summands to construct the harmonic projector.

Direct inputs: `mathlib:exteriorPower.map`, `AutomorphicFormsOnReductiveGroups:AF.4`.

Source: IP23, §§8.1–8.2, pp. 48–50; equation (8.1), p. 50.

API:

- `TauCeti.JacquetLanglandsHodge.harmonics.contraction` (simp): C(v²)=(v,v), and C=0 in degrees zero and one.
- `TauCeti.JacquetLanglandsHodge.harmonics.projector` (projection): The harmonic projection is the identity on ker C and kills its orthogonal complement.
- `TauCeti.JacquetLanglandsHodge.harmonics.isotropicPower` (compatibility): For an isotropic e, e^ℓ is harmonic; its pairing with w^ℓ is ℓ!(e,w)^ℓ.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.harmonics.degreeZero` (degenerate): H⁰X=C with projector identity.
- `TauCeti.JacquetLanglandsHodge.harmonics.degreeOne` (compatibility): H¹X=X_C with its original bilinear form.
- `TauCeti.JacquetLanglandsHodge.harmonics.factorial` (computation): In degree two, ⟨v²,w²⟩=2(v,w)², which excludes the divided-power convention.

Uses: §8.4: Supplies the coefficient of the Schwartz forms. §12.2.3: Supplies the rational coefficient comparison.

Check: Record the factorial normalization of the pairing.

### The polynomial Fock comparison

Target `HodgeClassesForJacquetLanglands:JL.4/fock-comparison`; proposed declaration `TauCeti.JacquetLanglandsHodge.fockComparison` (comparison).

For the real quadratic model and ψ(x)=exp(2πix), identify the polynomial-times-Gaussian subspace of the Schrödinger model with C[z₁,…,z_m], sending φ₀(x)=exp(−πΣx_i²) to one. On a positive coordinate i, creation x_i−(2π)⁻¹∂_i corresponds to (2πi)⁻¹z_i and annihilation x_i+(2π)⁻¹∂_i to 2i∂/∂z_i. On a negative coordinate j the corresponding operators are −(2πi)⁻¹z_j and −2i∂/∂z_j. These are the four conventions of (8.2); the comparison does not identify all Schwartz functions with polynomials.

Construction or proof: 1. Import the Schrödinger and Fock Weil models from MP.0–MP.3. 2. Check the comparison on the Gaussian and each creation/annihilation generator using the fixed Fourier convention.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.4/harmonics`, `MetaplecticAutomorphicForms:MP.0/schroedinger-model`, `MetaplecticAutomorphicForms:MP.2`.

Source: IP23, §8.3 and equation (8.2), pp. 50–51.

Check: A general Schwartz function outside the algebraic Gaussian subspace has no polynomial preimage.

### Harmonic Schwartz forms

Target `HodgeClassesForJacquetLanglands:JL.4/schwartz-form`; proposed declaration `TauCeti.JacquetLanglandsHodge.schwartzForm` (construction).

Let p,q be nonnegative even integers, p+q=m, and ℓ≥0. For p>0 define φ_{q,ℓ}=(4πi)^{−(q+ℓ)}Σ_{α∈{1,…,p}^q,β∈{1,…,p}^ℓ} z_αz_β⊗ω_α⊗e_β in the Fock model, where ω_α=ω_{α₁,p+1}∧…∧ω_{α_q,p+q}. Project the symmetric coefficient to H^ℓX to get φ′_{q,ℓ}. It is K-invariant, closed for relative Lie algebra cohomology and has K′ weight ℓ+m/2. For p=0 use φ_ℓ=(4πi)^{−ℓ}Σ_{β∈{1,…,m}^ℓ}z_β⊗e_β and its harmonic projection; it is G-invariant and has weight −ℓ−m/2. The first formula includes the source’s factor 2^{−q/2} relative to the original Funke–Millson normalization.

Hypotheses: p,q are nonnegative even integers; the quadratic form is nondegenerate; ℓ is a nonnegative integer; ψ(x)=exp(2πix).

Construction or proof: 1. Write the tensor-valued polynomial with the stated ordered wedge factors. 2. Apply the harmonic projector and compare the differential and compact-group actions with the imported Weil operators.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.4/fock-comparison`, `HodgeClassesForJacquetLanglands:JL.4/harmonics`, `AutomorphicFormsOnReductiveGroups:AF.4/vogan-zuckerman`.

Source: IP23, §8.4, pp. 51–52.

API:

- `TauCeti.JacquetLanglandsHodge.schwartzForm.closed` (structure): The relative-cohomology differential of φ′_{q,ℓ} is zero.
- `TauCeti.JacquetLanglandsHodge.schwartzForm.compactWeight` (relation): Its K′ character is ℓ+m/2 for p≥1 and −ℓ−m/2 in the compact case.
- `TauCeti.JacquetLanglandsHodge.schwartzForm.harmonicCoefficient` (projection): The coefficient lies in ker C, and forgetting the projection recovers φ_{q,ℓ} modulo the trace summands.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.schwartzForm.ellZero` (degenerate): For ℓ=0 the harmonic projection is identity and the tensor coefficient is scalar.
- `TauCeti.JacquetLanglandsHodge.schwartzForm.compactZero` (computation): For p=0 and ℓ=0, φ′₀=φ₀ and its K′ weight is −m/2.
- `TauCeti.JacquetLanglandsHodge.schwartzForm.weightTwoCase` (compatibility): For (p,q)=(4,2), ℓ=0, the form has degree two and weight three, agreeing with D⁻₃ in the theta pairing.

Uses: §10.4: Its global theta lift defines a closed cohomology class. Propositions 8.1–8.2: Its contractions produce nonzero minimal-weight vectors.

Check: Keep the compact p=0 formula separate from the empty positive-index sum.

### The harmonic restriction map

Target `HodgeClassesForJacquetLanglands:JL.4/harmonic-restriction`; proposed declaration `TauCeti.JacquetLanglandsHodge.harmonicRestriction` (comparison).

In the six-dimensional quadratic model take X=span(e₁,e₂,e₅,e₆), X₀=span(e₃,e₄). Compose H^ℓ(X⊕X₀)⊂Sym^ℓ(X⊕X₀)→Sym^ℓX→H^ℓX; this is an O(X)-equivariant retraction of the harmonic inclusion. For relative forms also project the cotangent exterior factor. Writing r for symmetric restriction and P for harmonic projection, the diagram in Proposition 8.1 means P_X∘r=harmRestrict∘P_{X⊕X₀}; raw restriction need not preserve harmonic tensors.

Construction or proof: 1. Use the symmetric restriction and harmonic decomposition, checking the vanishing of the complementary trace summands. 2. Identify contraction against harmonic vectors before and after projecting.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.4/harmonics`, `HodgeClassesForJacquetLanglands:JL.3/morita-models`.

Source: IP23, §8.5, equation (8.3), pp. 52–54.

Check: A harmonic tensor supported in X is fixed by the composite.

### The noncompact Schwartz restriction formula

Target `HodgeClassesForJacquetLanglands:JL.4/restriction-split`; proposed declaration `TauCeti.JacquetLanglandsHodge.restrictionSplit` (theorem).

For signature (4,2), normalize ω₁₅∧ω₂₅∧ω₁₆∧ω₂₆↦1. Let ω^ε=(ω₁₅+εiω₂₅)∧(ω₁₆+εiω₂₆) and v^ε=(e₁+εie₂)^ℓ/ℓ!, ε=±1. Contract the restricted φ′_{2,ℓ} using wedge with ω^ε and the bilinear coefficient pairing. The resulting Schwartz function is (x₁+εix₂)^{ℓ+2}φ₀(x).

Construction or proof: 1. Move the harmonic projection across the contraction using the retraction diagram. 2. Compute the wedge and factorial-normalized symmetric pairing, then apply the Fock comparison.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.4/schwartz-form`, `HodgeClassesForJacquetLanglands:JL.4/harmonic-restriction`.

Source: IP23, Proposition 8.1, pp. 54–55.

Check: For ℓ=0 the result is a quadratic polynomial times the Gaussian, rather than a constant.

### The compact Schwartz restriction formula

Target `HodgeClassesForJacquetLanglands:JL.4/restriction-compact`; proposed declaration `TauCeti.JacquetLanglandsHodge.restrictionCompact` (theorem).

For signature (0,6), with the same X and v^ε=(e₁+εie₂)^ℓ/ℓ!, coefficient contraction of the restricted compact φ′_ℓ is (−1)^ℓ(x₁+εix₂)^ℓφ₀(x). The application has ℓ=k_v−2 even, but the comparison retains the sign for arbitrary ℓ.

Construction or proof: 1. Remove the harmonic projection by orthogonality and evaluate the negative-signature bilinear pairing.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.4/schwartz-form`, `HodgeClassesForJacquetLanglands:JL.4/harmonic-restriction`.

Source: IP23, Proposition 8.2, p. 55.

Check: For ℓ=1 the result has a minus sign; for ℓ=0 it is the Gaussian.

## JL.5. Shimura data, coefficients and component characters

The group diagram becomes a diagram of specified Shimura data. The torus map constructs the component character by pullback, without assuming a bijection of connected-component sets. The rational coefficient comparison connects the harmonic and quaternionic local systems.

Layer inputs: `HodgeClassesForJacquetLanglands:JL.0`, `HodgeClassesForJacquetLanglands:JL.2`, `ShimuraVarieties:V8`, `ShimuraVarieties:V6`, `ShimuraVarieties:V4`, `HodgeClassesForJacquetLanglands:JL.3`, `HodgeClassesForJacquetLanglands:JL.4`.

### The Shimura diagram

Target `HodgeClassesForJacquetLanglands:JL.5/shimura-diagram`; proposed declaration `TauCeti.JacquetLanglandsHodge.shimuraDiagram` (construction).

Apply Res_{F/Q} to group-diagram. At v∈Σ take h_U(z)=diag(z,z,bar z,bar z) in the unitary realization, with block-plane h_i(z)=diag(z,bar z); outside Σ use the identity. On the quaternionic exterior realization use h_B(z)=diag(z²,zbar z,zbar z) in the paper’s B-basis. The projective maps identify these data and the block arrows are datum morphisms. Their reflex field is F_Σ; the block products and central quotients are taken with their specified data, not arbitrary Shimura data on isomorphic abstract groups. The strict Deligne-data assertion here uses d>0. For d=0 interpret the construction on finite compact Shimura sets with the trivial cocharacter and constant canonical models, as specified in JL.0; the final rank-one correspondence is immediate in this case.

Construction or proof: 1. Verify the Deligne cocharacters in the explicit real bases and transport through the exterior map. 2. Compute the Galois stabilizer of the real-place subset. 3. Import canonical models and functoriality for these abelian-type data.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/data`, `HodgeClassesForJacquetLanglands:JL.2/group-diagram`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V6/abelian-canonical`.

Source: IP23, §4.2, p. 23; §12.2.2, pp. 94–95.

API:

- `TauCeti.JacquetLanglandsHodge.shimuraDiagram.reflex` (characterisation): Every displayed datum is based over F_Σ with the indicated compatible base changes.
- `TauCeti.JacquetLanglandsHodge.shimuraDiagram.projectiveCompatibility` (relation): The two real cocharacters agree after the exceptional projective isomorphism.
- `TauCeti.JacquetLanglandsHodge.shimuraDiagram.canonicalMaps` (functoriality): Compatible compact opens give maps of canonical models over F_Σ, agreeing with analytic double-quotient maps.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.shimuraDiagram.outsideSigma` (degenerate): At a real place outside Σ every h is the identity.
- `TauCeti.JacquetLanglandsHodge.shimuraDiagram.complexDimension` (computation): The quaternionic product has complex dimension 2d and the exterior unitary variety has dimension 4d.
- `TauCeti.JacquetLanglandsHodge.shimuraDiagram.squaredCoordinate` (non-example): Replacing z² by z in h_B fails compatibility with the exterior representation.

Uses: §12.2.5–12.2.10: Ensures all operations defining Res are over the common reflex field.

Check: Both paths around the projective diagram agree as Shimura datum maps.

### The component torus

Target `HodgeClassesForJacquetLanglands:JL.5/component-torus`; proposed declaration `TauCeti.JacquetLanglandsHodge.componentTorus` (definition).

For H~_B in group-diagram its derived group is (B₁¹×B₂¹)/μ₂ and its abelian quotient is T={([t₁,t₂],α):t₁t₂=Nα}, where (t₁,t₂) is modulo (t,t⁻¹). Its center is Z={(t,α):t²=Nα}, mapping to T by (t,α)↦([t²,1],α)=([t,t],α). The induced Shimura morphism Sh_{H~_B}→Sh_T defines pullback of component functions. It is not asserted to identify the sets of connected components.

Construction or proof: 1. Compute the derived subgroup from the norm-one factors. 2. Take its abelian quotient and compute the restriction of the center.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.2/block-groups`, `HodgeClassesForJacquetLanglands:JL.5/shimura-diagram`, `ShimuraVarieties:V8/datum-functoriality`.

Source: IP23, §4.3, pp. 23–24, with correction E4.

API:

- `TauCeti.JacquetLanglandsHodge.componentTorus.centerMap` (simp): The two displayed representatives [t²,1] and [t,t] agree modulo the anti-diagonal.
- `TauCeti.JacquetLanglandsHodge.componentTorus.datumMap` (functoriality): The map to T is a morphism of Shimura data over F_Σ.
- `TauCeti.JacquetLanglandsHodge.componentTorus.cocharacterFactor` (characterisation): The torus cocharacter factors through j:Res_{F/Q}G_m→T, j(s)=([s,s],s), with components zbar z at Σ and one elsewhere.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.componentTorus.centerRelation` (computation): Nα=t² gives t₁t₂=Nα for ([t,t],α).
- `TauCeti.JacquetLanglandsHodge.componentTorus.kernel` (characterisation): The kernel of Z→T is generated by (−1,1).
- `TauCeti.JacquetLanglandsHodge.componentTorus.componentFiber` (non-example): Non-simply-connected derived groups can leave multiple component classes above the same torus class; a bijection is not an API theorem.

Uses: §10.4: Supplies the central character twist. Theorem 12.4, corrected descent: Controls Galois action on the component function.

Check: Use only the component-to-torus morphism; do not assume the unproved component bijection. Non-simple-connectedness alone does not disprove that bijection.

### The component character class

Target `HodgeClassesForJacquetLanglands:JL.5/component-class`; proposed declaration `TauCeti.JacquetLanglandsHodge.componentClass` (construction).

Let η be a finite-order Hecke character of A_E×/E×A_F×, with trivial archimedean component. On T put η_T([t₁,t₂],α)=η((t₁t₂)⁻¹α)=η(α). Its pullback on Z is η(t⁻¹α). The locally constant automorphic character on Sh_T pulls back to c_η∈H⁰(Sh_{H~_B},Q(η)). Use a sufficiently small finite level where η is trivial on the level subgroup.

Construction or proof: 1. Evaluate the full idele-class character, rather than a norm-one character on an element outside its domain. 2. Descend to the finite component quotient and pull back its degree-zero class.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.5/component-torus`, `ShimuraVarieties:V4/reciprocity-finite-action`.

Source: IP23, §4.3, pp. 23–24; §10.4, pp. 68–69, with correction E5.

API:

- `TauCeti.JacquetLanglandsHodge.componentClass.centerRestriction` (simp): On (t,α)∈Z the value is η(t⁻¹α).
- `TauCeti.JacquetLanglandsHodge.componentClass.changeLevel` (functoriality): Pullback along smaller levels preserves c_η.
- `TauCeti.JacquetLanglandsHodge.componentClass.characterField` (compatibility): The class has coefficients Q(η), and Galois permutation of components acts on its values by pullback, leaving coefficient scalars fixed.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.componentClass.trivialCharacter` (degenerate): For η=1 the class is the constant function one.
- `TauCeti.JacquetLanglandsHodge.componentClass.centralFidele` (computation): η_T(j(s))=η(s⁻¹)=1 for every s∈A_F×.
- `TauCeti.JacquetLanglandsHodge.componentClass.domain` (non-example): The argument (t₁t₂)⁻¹α need not have norm one; evaluating a character defined only on A_E¹ would be ill-typed.

Uses: §12.2.7: Cancels the η-component before descent to G. Theorem 12.4: Provides the component parameter in the determinant argument.

Check: The value does not depend on representatives in T.

### Rational harmonic coefficients

Target `HodgeClassesForJacquetLanglands:JL.5/coefficient-structure`; proposed declaration `TauCeti.JacquetLanglandsHodge.coefficientStructure` (comparison).

Put ℓ_v=k_v−2. The harmonic representation H^{ℓ_v} on the real quadratic model extends to its connected similitude group by ν^{−ℓ_v/2}; since ℓ_v is even this is algebraic with trivial center. The exterior weight comparison identifies its pullback with the four-dimensional unitary representation of highest weight ((k_v−2)/2,(k_v−2)/2,−(k_v−2)/2,−(k_v−2)/2) in the Borel order of §11.3. The resulting global coefficient has a Q(k)-form unique up to homothety. Its block restriction has a rational equivariant projection to τ_k∨⊠τ_k∨.

Construction or proof: 1. Permute the weight coordinates to the chosen unitary Borel. 2. Use the requested Tits rational-descent and coefficient-restriction interface. 3. Fix the projection normalization by the harmonic inclusion and pairing, not by an arbitrary complex scalar.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.3/weight-map`, `HodgeClassesForJacquetLanglands:JL.5/shimura-diagram`, `HodgeClassesForJacquetLanglands:JL.4/harmonics`.

Source: IP23, §11.3, pp. 83–85; Proposition 12.2 and §12.2.3, pp. 95–96.

Check: For k_v=2 all coefficients are trivial; for odd ℓ the half-multiplier twist is not an algebraic character.

## JL.6. Quaternionic theta transfer and near equivalence

The two lower-rank lifts identify the scalar periods. The rank-three backward lift is the input that constrains a nearly equivalent automorphic representation. Its doubled residue is kept separate from a positive-range inner-product formula.

Layer inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `MetaplecticAutomorphicForms:MP.5`, `HodgeClassesForJacquetLanglands:JL.0`, `MetaplecticAutomorphicForms:MP.3`, `HodgeClassesForJacquetLanglands:JL.2`, `HodgeClassesForJacquetLanglands:JL.3`, `MetaplecticAutomorphicForms:MP.6`.

### Toric theta lifting and automorphic induction

Target `HodgeClassesForJacquetLanglands:JL.6/toric-theta`; proposed declaration `TauCeti.JacquetLanglandsHodge.toricTheta` (theorem).

Let B/F be quaternion division and split at all real places, E/F CM embedded in B, and η a finite-order Hecke character of E×∖A_E× trivial on A_F×. If η_v does not factor through N_{E_v/F_v} at every place where B is ramified, its theta lift from E× to B× is nonzero, irreducible and is the B× transfer of AI_{E/F}(η). The similitude lift is first defined on the norm-multiplier subgroup H_N^+ and extended by zero to its rational saturation when required. Throughout this packet θ_IP(f) integrates Θ(g,h)f(h), without complex conjugation. Relative to MP.5/global-theta-lift, θ_IP(f)=θ_MP(bar f); at the representation level use θ_MP(bar τ). The corresponding local convention takes the maximal τ∨-isotypic oscillator quotient.

Construction or proof: 1. Use the requested local toric-theta nonvanishing and the appropriate Rallis formula; retain its character and measure conventions. 2. Identify unramified parameters with automorphic induction and apply strong multiplicity one.

Direct inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `HodgeClassesForJacquetLanglands:JL.0/brauer-reduction`, `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`, `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`.

Source: IP23, §9.2, pp. 56–57; Lemma 9.1, p. 57.

Check: A norm-factorizing character at a ramified place is excluded from the nonzero-lift assertion.

### Quaternionic product theta lifting

Target `HodgeClassesForJacquetLanglands:JL.6/product-theta`; proposed declaration `TauCeti.JacquetLanglandsHodge.productTheta` (theorem).

Let B=B₁·B₂ be the division quaternion algebra, and let σ_i be irreducible unitary automorphic representations of B_i× with the same central character, for which the cuspidal JL transfers π_i exist. The theta lift from (B₁××B₂×)/anti F× to B× is zero unless π₁≅π₂; when they agree it is the nonzero transfer π_B of that representation. Its local archimedean components and central character use the fixed Weil splitting. Throughout this packet θ_IP(f) integrates Θ(g,h)f(h), without complex conjugation. Relative to MP.5/global-theta-lift, θ_IP(f)=θ_MP(bar f); at the representation level use θ_MP(bar τ). The corresponding local convention takes the maximal τ∨-isotypic oscillator quotient.

Construction or proof: 1. Compare the unramified theta parameters and use strong multiplicity one for the necessity. 2. For the converse import the quaternionic product-period/nonvanishing interface requested from the metaplectic extension.

Direct inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `HodgeClassesForJacquetLanglands:JL.2/tensor-model`, `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`, `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta`.

Source: IP23, §9.3, pp. 57–58; Lemma 9.2, p. 58.

Check: If the two cuspidal GL₂ transfers differ, every resulting theta period is zero.

### The backward-lift doubling point

Target `HodgeClassesForJacquetLanglands:JL.6/doubling-point`; proposed declaration `TauCeti.JacquetLanglandsHodge.doublingPoint` (theorem).

In the anisotropic rank-three quaternionic setup of Proposition 9.5, use the doubled space and I_v(s) with Levi transformation |Nrd(a)|^(s+5/2). Put a_v(s)=ζ_v(2s)ζ_v(2s−2)ζ_v(2s−4) and b_v(s)=ζ_v(2s+1)ζ_v(2s+3)ζ_v(2s+5). The normalized intertwiner M_v*(s)=(b_v(s)/a_v(s))M_v(s):I_v(s)→I_v(−s) is holomorphic for Re(s)≥0 and has image R(W_v)⊂I_v(−3/2) at s=3/2. For each v there exist a holomorphic section and matrix-coefficient vectors for which the unnormalized local doubling integral Z_v(s) is holomorphic and nonzero at 3/2; no holomorphy for all data is asserted. For normalized unramified data the global factor is L^S(s+1/2,ad τ⊗ξ_E)ζ^S(s+3/2)ζ^S(s+1/2)ζ^S(s−1/2)/[ζ^S(2s+1)ζ^S(2s+3)ζ^S(2s+5)], multiplied by ∏_{v∈S}Z_v(s). Suitable data give a nonzero simple residue at s=3/2.

Construction or proof: 1. Import the doubled section and intertwining theory with its exact normalization. 2. At nonarchimedean places compare the two composition factors in Lemma 9.7; at real split places use the explicit theta model. 3. Use the local functional equation and the unramified calculation to control the stated point.

Direct inputs: `MetaplecticAutomorphicForms:MP.3/howe-duality`, `HodgeClassesForJacquetLanglands:JL.3/morita-models`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta`, `MetaplecticAutomorphicForms:MP.3`.

Source: IP23, Lemma 9.7, p. 63; Lemma 9.8 and §9.5.3, pp. 63–64.

Check: Do not use a positive-range Rallis value formula at this residue without checking its range and pole.

### Nonvanishing of the backward lift

Target `HodgeClassesForJacquetLanglands:JL.6/backward-lift`; proposed declaration `TauCeti.JacquetLanglandsHodge.backwardLift` (theorem).

Let E/F be quadratic embedded in a division quaternion algebra B split at infinity. Let X be a rank-three skew-hermitian B-space with U(X) F-anisotropic, G=GU_B(X)^0, and H_N^+={h∈B×(A_F):Nrd(h)∈N(A_E×)}. Let τ be an irreducible unitary automorphic representation of H_N^+ whose forward theta lift Π to G is nonzero and cuspidal. If Π′ is an irreducible unitary automorphic representation of G nearly equivalent to Π, then θ_IP(bar Π′) to H_N^+ is nonzero. The proof uses the nonzero residue of the doubled integral at s=3/2 and the Siegel–Weil identity with the normalization of §9.5. Throughout this packet θ_IP(f) integrates Θ(g,h)f(h), without complex conjugation. Relative to MP.5/global-theta-lift, θ_IP(f)=θ_MP(bar f); at the representation level use θ_MP(bar τ). The corresponding local convention takes the maximal τ∨-isotypic oscillator quotient.

Construction or proof: 1. Factor the doubling integral away from a finite set and use the simple global pole. 2. Choose the finitely many local sections and matrix-coefficient vectors whose unnormalized integrals are holomorphic and nonzero at 3/2, as in Lemma 9.8. 3. Apply the required Siegel–Weil residue identity and the theta pairing to deduce backward nonvanishing.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.6/doubling-point`, `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`.

Source: IP23, Lemma 9.6, pp. 61–64.

Check: Near equivalence is cofinite equality of local components, not equality at a single place.

### Near-equivalence rigidity of theta lifts

Target `HodgeClassesForJacquetLanglands:JL.6/near-equivalence`; proposed declaration `TauCeti.JacquetLanglandsHodge.nearEquivalence` (theorem).

Under the hypotheses of backward-lift, every irreducible unitary automorphic Π′ of G nearly equivalent to θ_IP(τ) is θ_IP(τ′) for an irreducible unitary automorphic representation τ′ of H_N^+ nearly equivalent to τ. Take τ′=bar θ_IP(bar Π′), using backward nonvanishing, local Howe duality and unramified parameter recovery. The assertion concerns these rank-three anisotropic lifts, not strong multiplicity one for all unitary automorphic representations or a lift from the full group B×(A_F).

Construction or proof: 1. Take the complex conjugate of the irreducible nonzero backward lift θ_IP(bar Π′); this is the candidate τ′, rather than the unconjugated backward lift. 2. Use local Howe uniqueness and the parameter formula to recover its forward lift. 3. Compare the source components away from finitely many places.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.6/backward-lift`, `MetaplecticAutomorphicForms:MP.3/howe-duality`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `MetaplecticAutomorphicForms:MP.3`.

Source: IP23, Proposition 9.5, p. 61; §9.5.4, p. 64.

Check: Retain anisotropy and nonzero cuspidality of the original theta lift.

## JL.7. Simultaneous nonvanishing of restricted theta classes

The same finite data, character and auxiliary representation must work for every sign. The finite support-place argument puts the scalar theta form on the norm subgroup; an adelic translation then makes its product with the toric lift nonzero before spectral projection.

Layer inputs: `HodgeClassesForJacquetLanglands:JL.0`, `HodgeClassesForJacquetLanglands:JL.2`, `HodgeClassesForJacquetLanglands:JL.3`, `HodgeClassesForJacquetLanglands:JL.4`, `MetaplecticAutomorphicForms:MP.3`, `AutomorphicFormsOnReductiveGroups:AF.3`, `HodgeClassesForJacquetLanglands:JL.5`, `MetaplecticAutomorphicForms:MP.5`, `MetaplecticAutomorphicForms:MP.6`, `HodgeClassesForJacquetLanglands:JL.6`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `AutomorphicSpectralTheory:AS.4`.

### Global theta data

Target `HodgeClassesForJacquetLanglands:JL.7/global-theta-data`; proposed declaration `TauCeti.JacquetLanglandsHodge.globalThetaData` (definition).

In the distinct-algebra case of JL.0 choose a common CM subfield E⊂B_i, write B_i=E⊕Ej_i, and take the spaces and groups of the exceptional diagram. Put H=B×, H_N^+={h∈H(A_F):Nrd(h)∈N(A_E×)}, and H_∞^+={h:Nrd(h_v)>0 for every real v}. These subgroups serve different purposes. Set ℓ_v=k_v−2 and take the Schwartz form φ′_{2,ℓ_v} at v∈Σ and φ′_{ℓ_v} elsewhere, with a pure-tensor finite Schwartz vector. For an irreducible unitary automorphic τ on H_N^+ use central character ξ_E, antiholomorphic minimal type of weight k_v+1 at Σ and holomorphic type outside Σ. The exterior isometry group is F-anisotropic: because d<n, at least one real localization is compact O(0,6), which excludes an F-split torus. Its adelic quotient modulo the center is compact. All theta-integral convergence claims use this fact. Throughout this packet θ_IP(f) integrates Θ(g,h)f(h), without complex conjugation. Relative to MP.5/global-theta-lift, θ_IP(f)=θ_MP(bar f); at the representation level use θ_MP(bar τ). The corresponding local convention takes the maximal τ∨-isotypic oscillator quotient.

Construction or proof: 1. Import compatible quaternionic similitude splittings from MP.3, including the central transformation of Proposition A.1. 2. Keep the norm-support subgroup distinct from the subgroup defined just by real signs. 3. Use the compact real localization to rule out F-split tori, then the anisotropic adelic-quotient theorem from the automorphic supplier.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/brauer-reduction`, `HodgeClassesForJacquetLanglands:JL.2/group-diagram`, `HodgeClassesForJacquetLanglands:JL.3/archimedean-theta`, `HodgeClassesForJacquetLanglands:JL.4/schwartz-form`, `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`, `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`, `AutomorphicFormsOnReductiveGroups:AF.3/anisotropic-cuspidal`.

Source: IP23, §§10.1–10.3, pp. 65–68; §12.2.4, p. 96.

API:

- `TauCeti.JacquetLanglandsHodge.globalThetaData.archimedeanTypes` (data): At Σ use D⁻_{k_v+1}; outside Σ use D⁺_{k_v+1}.
- `TauCeti.JacquetLanglandsHodge.globalThetaData.normSupport` (characterisation): H_N^+ is determined by the idele norm condition; it lies in H_∞^+ but they are not identified.
- `TauCeti.JacquetLanglandsHodge.globalThetaData.schwartzTensor` (compatibility): The total form degree is 2d and its coefficient is the Q(k)-rational harmonic system.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.globalThetaData.oneSplitPlace` (computation): For real quadratic F and |Σ|=1, the global form has degree two.
- `TauCeti.JacquetLanglandsHodge.globalThetaData.allDefinite` (degenerate): For d=0 every archimedean factor is the compact Schwartz form.
- `TauCeti.JacquetLanglandsHodge.globalThetaData.finiteNormObstruction` (non-example): Positive real reduced norms do not by themselves imply membership in N(A_E×).

Uses: §10.4: Defines the theta cohomology class. §12.2.4: Matches the auxiliary Hilbert form to the source representation.

Check: All archimedean K-types pair with the specified Schwartz forms.

### The theta cohomology class

Target `HodgeClassesForJacquetLanglands:JL.7/theta-class`; proposed declaration `TauCeti.JacquetLanglandsHodge.thetaClass` (construction).

For global-theta-data and a minimal-type vector φ∈τ, theta lifting the tensor-valued Schwartz form gives a closed 2d-form θ_{φ~}(φ) on the quaternionic exterior Shimura variety, with the harmonic coefficient of JL.5. The central transformation rule in Proposition A.1 cancels τ’s ξ_E character, so the form has trivial central character. Denote its cohomology class by ξ_τ. Dependence on the finite Schwartz vector and φ is linear with the convention for conjugation fixed in the theta integral. Explicitly its integrand is Θ(g,h)φ(h), so it is linear in φ; the MP.5 supplier is applied to bar φ to match its conjugated-input convention.

Construction or proof: 1. Use theta integral convergence in the compact-mod-center quotient and the imported adelic product formula for the splitting. 2. Commute the relative differential with the theta integral using Schwartz decay and compactness. 3. Compute the center action before passing to the coefficient cohomology class.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/global-theta-data`, `HodgeClassesForJacquetLanglands:JL.5/coefficient-structure`, `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`.

Source: IP23, §10.4, pp. 68–69; Proposition A.1, p. 101.

API:

- `TauCeti.JacquetLanglandsHodge.thetaClass.closedRepresentative` (constructor): The theta integral has a closed tensor-valued differential-form representative.
- `TauCeti.JacquetLanglandsHodge.thetaClass.finiteLevel` (functoriality): Every smooth finite adelic input defines the class at a sufficiently small level, compatibly with pullback.
- `TauCeti.JacquetLanglandsHodge.thetaClass.linearity` (structure): The class is linear in both the Schwartz vector and the automorphic vector under the IP23 integral convention; translate to MP.5 by conjugating its automorphic input.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.thetaClass.zeroInput` (degenerate): A zero Schwartz or automorphic vector gives the zero class.
- `TauCeti.JacquetLanglandsHodge.thetaClass.degree` (computation): For d=1 the representative has degree two.
- `TauCeti.JacquetLanglandsHodge.thetaClass.centerCancellation` (compatibility): The splitting character ξ_E raised to the odd rank-three exponent cancels the source central character ξ_E.

Uses: Proposition 10.1: Supplies the class whose restrictions pair nontrivially. Theorem 12.4: Supplies the rational Hecke space containing an invertible class.

Check: The central character of the resulting class is trivial, not ξ_E.

### Central projection and normalized descent

Target `HodgeClassesForJacquetLanglands:JL.7/eta-projection`; proposed declaration `TauCeti.JacquetLanglandsHodge.etaProjection` (construction).

Restrict ξ_τ to H~_B. For the center Z={(z,α):z²=Nα}, use p(z,α)=z⁻¹α∈E¹ and project by the normalized integral ∫_{Z(G~)(A)Z(F)∖Z(A)} ξ_τ(zg)(η∘p)(z)dz, with quotient volume one. Multiply the resulting η⁻¹-equivariant form by c_η. For g∈G(A)^+ choose α_g with Nα_g=ν(g) and evaluate at (g,α_g), multiplied by η(α_g). This is independent of α_g. Descend by normalized trace, extend by zero off G(F)G(A)^+, and average over K using volume one.

Construction or proof: 1. Use Fourier projection on the compact central quotient with its specified character direction. 2. Verify cancellation with c_η and independence under changing α_g. 3. Apply the requested trace-to-image construction and level-volume normalization.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/theta-class`, `HodgeClassesForJacquetLanglands:JL.5/component-class`, `HodgeClassesForJacquetLanglands:JL.2/group-diagram`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`.

Source: IP23, §10.4, pp. 68–70; Remark 2.2, p. 17.

API:

- `TauCeti.JacquetLanglandsHodge.etaProjection.characterProjection` (characterisation): The projected form transforms under the relevant center by (η∘p)⁻¹.
- `TauCeti.JacquetLanglandsHodge.etaProjection.normLiftIndependence` (relation): The product ξ_η(g,α_g)η(α_g) is independent of the chosen α_g.
- `TauCeti.JacquetLanglandsHodge.etaProjection.levelNormalization` (functoriality): Normalized trace and K-average agree under level change; traces are to the actual image followed by zero extension.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.etaProjection.etaOne` (degenerate): For η=1 this is projection to central invariants.
- `TauCeti.JacquetLanglandsHodge.etaProjection.constantAverage` (computation): A K-invariant form is unchanged by averaging with volume one.
- `TauCeti.JacquetLanglandsHodge.etaProjection.missingCoset` (non-example): The unextended formula is not evaluated on an adelic component with no norm lift.

Uses: Proposition 10.1: Defines the K-invariant class entering all sign pairings. §12.2.7–12.2.8: Makes the analytic descent agree with the cohomological trace map.

Check: Changing the auxiliary norm lift α_g does not change the descended form.

### The restricted theta seesaw

Target `HodgeClassesForJacquetLanglands:JL.7/scalar-seesaw`; proposed declaration `TauCeti.JacquetLanglandsHodge.scalarSeesaw` (theorem).

For the projected and descended form and the vectors f₁^ε⊠f₂^ε of Proposition 10.1, pairing against their coefficient and differential factors equals the scalar theta integral of Lemma 10.2. The compatible-splitting seesaw rewrites it as the triple product integral over H_N^+: θ_{φ^ε}(f^ε)·θ_{φ₀}(η)·φ. Use the central quotient and measures of §10.4, with absolute convergence from the compact quotient and cusp input. The seesaw is equation (10.7), p. 72; equation (10.8) is a later K-type identity.

Construction or proof: 1. Contract the Schwartz tensor using Propositions 8.1–8.2. 2. Apply Fubini only after establishing convergence and matching central quotients. 3. Use the imported seesaw identity with the same local splittings on both sides.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/eta-projection`, `HodgeClassesForJacquetLanglands:JL.4/restriction-split`, `HodgeClassesForJacquetLanglands:JL.4/restriction-compact`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`, `MetaplecticAutomorphicForms:MP.3/quaternionic-see-saw-compatibility`.

Source: IP23, Lemma 10.2, p. 71; equation (10.7), p. 72.

Check: All signs use the same finite Schwartz data.

### The simultaneous sign theta vectors

Target `HodgeClassesForJacquetLanglands:JL.7/sign-theta`; proposed declaration `TauCeti.JacquetLanglandsHodge.signTheta` (theorem).

For each ε∈{±1}^{Σ∞}, choose the archimedean Schwartz factor (x₁+ε_vi x₂)^{k_v}φ₀ above Σ and (x₁+ε_vi x₂)^{k_v−2}φ₀ elsewhere. For the Proposition 10.1 vectors, finite Schwartz data can be chosen once so that θ_{φ^ε}(f^ε) is nonzero for every ε and belongs to π_B, of minimal weights +k_v at Σ and −k_v elsewhere. The archimedean Whittaker coefficient is nonzero and its ε-dependence disappears for the even exponents. Rescale the f^ε so these lifts agree as one nonzero automorphic form.

Construction or proof: 1. Evaluate the Gaussian/Bessel coefficient in §10.6, retaining the Gamma and powers of i until parity is applied. 2. Choose common finite data with a nonzero product lift and normalize the archimedean vectors.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.6/product-theta`, `HodgeClassesForJacquetLanglands:JL.4/restriction-split`, `HodgeClassesForJacquetLanglands:JL.4/restriction-compact`, `HodgeClassesForJacquetLanglands:JL.7/global-theta-data`.

Source: IP23, Lemma 10.3 and equations (10.9)–(10.12), pp. 73–76.

Check: Do not choose a different finite Schwartz function for each sign.

### Moving theta support to the norm subgroup

Target `HodgeClassesForJacquetLanglands:JL.7/norm-support`; proposed declaration `TauCeti.JacquetLanglandsHodge.normSupport` (theorem).

Assume there is a finite place v₀ at which E/F is ramified, B₁ and B₂ are split, and the finite level is hyperspecial. For the common nonzero sign theta form of sign-theta, its restriction to H_N^+ is nonzero after the permitted translation. Use a unit at v₀ outside the local norm group and the block-group element whose image fixes the prescribed hyperspecial vectors to exchange the two norm-support cosets.

Construction or proof: 1. Use the ramified local norm character on units to choose the coset switch. 2. Lift the switch through the split quaternionic blocks and use hyperspecial invariance.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/sign-theta`, `HodgeClassesForJacquetLanglands:JL.2/block-groups`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

Source: IP23, Lemma 10.4, pp. 75–76.

Check: The ramification and hyperspecial assumptions at v₀ are retained.

### The auxiliary finite-order character

Target `HodgeClassesForJacquetLanglands:JL.7/auxiliary-character`; proposed declaration `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter` (construction).

There exists a finite-order η of A_E×/E×A_F×, trivial at infinity, whose local component does not factor through the norm at every finite place ramified in B. Choose local characters χ_v on E_v¹ with χ_v²≠1, extend their product to A_E¹/E¹, and define η(x)=χ(x/bar x). Keep the square condition: merely choosing χ_v nontrivial need not suffice.

Construction or proof: 1. Use compactness and character extension for the norm-one idele quotient, requested from the theta supplier. 2. Prescribe the finite set of local restrictions and pull back along x↦x/bar x.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/global-theta-data`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

Source: IP23, Lemma 10.5, p. 76.

API:

- `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter.trivialF` (relation): η is trivial on A_F× and on E×.
- `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter.localNonnorm` (characterisation): At every ramified B-place η_v does not factor through N_{E_v/F_v}.
- `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter.centralCharacter` (compatibility): The AI representation of η has central character ξ_E because η restricts trivially to A_F×.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter.realPlace` (computation): At every real place η_v is the trivial character of C×.
- `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter.quadraticLocalTrap` (non-example): If χ_v is nontrivial of order two, η_v|E_v¹=χ_v² is trivial; this choice is rejected.
- `TauCeti.JacquetLanglandsHodge.auxiliaryCharacter.Fidele` (compatibility): For x∈A_F×, x/bar x=1 and η(x)=1.

Uses: Lemma 10.6: Ensures nonzero toric theta lifting. Theorem 12.4, corrected component descent: Its triviality on A_F× kills the reflex-norm image.

Check: At a ramified place η_v remains nontrivial on E_v¹.

### The auxiliary toric theta vector

Target `HodgeClassesForJacquetLanglands:JL.7/toric-test-vector`; proposed declaration `TauCeti.JacquetLanglandsHodge.toricTestVector` (theorem).

For auxiliary-character there is finite Schwartz data φ₀ with archimedean Gaussian factors, normalized by φ₀,v(0)=1, such that θ_{φ₀}(η) is nonzero on H_N^+. Its real weights are +1 at v∈Σ and −1 elsewhere, with the scalar quadratic-space conventions fixed by the block decomposition.

Construction or proof: 1. Apply the nonzero toric lift and evaluate its real Gaussian model. 2. Choose finite data making a nonzero vector in the irreducible theta representation.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.6/toric-theta`, `HodgeClassesForJacquetLanglands:JL.7/auxiliary-character`, `HodgeClassesForJacquetLanglands:JL.4/fock-comparison`.

Source: IP23, Lemma 10.6 and equation (10.12), pp. 76–77.

Check: At each real place the Gaussian value at zero is exactly one.

### The minimal triple-product type

Target `HodgeClassesForJacquetLanglands:JL.7/triple-product-type`; proposed declaration `TauCeti.JacquetLanglandsHodge.tripleProductType` (theorem).

If the pointwise product θ_{φ^ε}(f^ε)θ_{φ₀}(η) is nonzero, then at each real place it generates the minimal discrete-series type of weight k_v+1: holomorphic at Σ and antiholomorphic outside Σ. Thus its contragredient is the archimedean type required for τ in global-theta-data.

Construction or proof: 1. Use the tensor-product decomposition of two holomorphic, respectively two antiholomorphic, discrete series and identify the lowest K-type.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/sign-theta`, `HodgeClassesForJacquetLanglands:JL.7/toric-test-vector`.

Source: IP23, Lemma 10.7, p. 77.

Check: The product at Σ has weight k_v+1, not k_v−1.

### Simultaneous nonvanishing of the restriction

Target `HodgeClassesForJacquetLanglands:JL.7/all-sign-nonvanishing`; proposed declaration `TauCeti.JacquetLanglandsHodge.allSignNonvanishing` (theorem).

Let f₁^ε⊠f₂^ε have opposite archimedean weights ±k_v above Σ and ±(k_v−2) elsewhere, the same finite vector for all ε, and be K-fixed. Under the v₀ hypothesis of norm-support, there is a single choice of τ, φ, η and Schwartz data for which the descended theta class pairs nontrivially with every one of these 2^n sign vectors. The finite data and auxiliary representation are common to all signs.

Construction or proof: 1. Use finite adelic translation to put the two nonzero theta forms on a common connected real quotient. 2. Their real-analytic nonzero restrictions have a nonzero pointwise product. 3. Project the product on the compact-mod-center quotient onto a nonzero irreducible automorphic summand; take its contragredient τ and a vector giving a nonzero period. 4. Use the sign normalization from sign-theta to obtain this one choice for every ε.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/scalar-seesaw`, `HodgeClassesForJacquetLanglands:JL.7/norm-support`, `HodgeClassesForJacquetLanglands:JL.7/triple-product-type`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`, `AutomorphicSpectralTheory:AS.4/compact-quotient-spectrum`.

Source: IP23, Lemma 10.8 and §10.9, pp. 77–78; Proposition 10.1, p. 70.

Check: A statement of the form “for every sign there exists separate data” fails acceptance.

## JL.8. The unitary eigenspace and its Hodge type

The rational Hecke space contains all coefficient conjugates. Degree selection isolates the local q₁ contribution. The coefficient-normalized Hodge table proves actual type (d,d), rather than inferring it from relative cochain bidegrees alone.

Layer inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `ModularityAndLanglandsExtensions:ML.4`, `HodgeClassesForJacquetLanglands:JL.7`, `AutomorphicFormsOnReductiveGroups:AF.4`, `HodgeClassesForJacquetLanglands:JL.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `HodgeClassesForJacquetLanglands:JL.6`, `HodgeClassesForJacquetLanglands:JL.3`, `ShimuraData:D3`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

### The theta Arthur parameter

Target `HodgeClassesForJacquetLanglands:JL.8/arthur-parameter`; proposed declaration `TauCeti.JacquetLanglandsHodge.arthurParameter` (theorem).

Choose an irreducible unitary cuspidal σ on GL₂(A_F), with central character ξ_E, whose B× Jacquet–Langlands transfer restricts to H_N^+ with a constituent τ. Its quadratic base change σ_E is independent of this choice and is conjugate-orthogonal. The subgroup representation τ itself is not an input to the usual GL₂ transfer. If cuspidal, it gives the elliptic U(4) parameter ψ=σ_E⊠Sym¹; if noncuspidal, write σ_E=χ⊞χ⁻¹, where χ is conjugate-orthogonal and χ²≠1, and interpret ψ as the corresponding sum of two simple blocks. The sign follows from As⁺∘BC=Sym²⊕(∧²⊗ξ_E), so L(s,As⁺σ_E)=L(s,Sym²σ)ζ_F(s). This σ is the auxiliary central-character-ξ_E representation, distinct from the initial central-character-one π.

Construction or proof: 1. Import quadratic base change and the adjoint/Asai factorization in the required normalization. 2. Use the pole criterion for conjugate orthogonality, treating the noncuspidal base-change case separately.

Direct inputs: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `ModularityAndLanglandsExtensions:ML.4`, `HodgeClassesForJacquetLanglands:JL.7/global-theta-data`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

Source: IP23, Equation (11.1) and Lemma 11.1, pp. 79–80; §11.4, p. 86.

Check: Do not assume base change is cuspidal in the dihedral case.

### The U(2,2) Adams–Johnson packet

Target `HodgeClassesForJacquetLanglands:JL.8/adams-johnson`; proposed declaration `TauCeti.JacquetLanglandsHodge.adamsJohnson` (theorem).

For even k≥2 consider ψ∞=(χ_{k/2}⊠Sym¹)⊕(χ_{−k/2}⊠Sym¹) and coefficient highest weight λ=(k/2−1,k/2−1,−k/2+1,−k/2+1). Its packet on U(2,2) has q₀,q₁,q₂ representatives indexed by 1,(23),(13)(24). With the dual coefficient, q₀ has cohomology of dimension one in (4,0), q₁ dimensions one, two, one in (1,1),(2,2),(3,3), and q₂ dimension one in (0,4); every other bidegree is zero. The identification with the relevant local Arthur packet is imported with its precise real-classification hypotheses.

Construction or proof: 1. Use the requested local Adams–Johnson/Arthur packet comparison. 2. Enumerate the three double-coset representatives and apply Vogan–Zuckerman to each θ-stable parabolic.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.8/arthur-parameter`, `AutomorphicFormsOnReductiveGroups:AF.4/vogan-zuckerman`, `ModularityAndLanglandsExtensions:ML.4`.

Source: IP23, §11.2, pp. 81–83; Proposition 11.2, p. 83.

Check: At k=2 the three cohomological supports remain distinct.

### The negative-similitude involution

Target `HodgeClassesForJacquetLanglands:JL.8/negative-similitude`; proposed declaration `TauCeti.JacquetLanglandsHodge.negativeSimilitude` (theorem).

The real similitude δ exchanging the two signature blocks of U(2,2), with multiplier −1, acts on the packet by interchanging q₀ and q₂ and preserving q₁. Thus passing from the unitary group to the full relevant real similitude group does not introduce a different degree-two type.

Construction or proof: 1. Conjugate the chosen diagonal Cartan and the three θ-stable parabolics by the block-switch matrix.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.8/adams-johnson`, `HodgeClassesForJacquetLanglands:JL.5/shimura-diagram`.

Source: IP23, Lemma 11.3, p. 83.

Check: The unique degree-two cohomological constituent remains q₁.

### The rational theta Hecke space

Target `HodgeClassesForJacquetLanglands:JL.8/hecke-eigenspace`; proposed declaration `TauCeti.JacquetLanglandsHodge.heckeEigenspace` (construction).

Let Π=θ(τ) on the exterior quaternionic group and transport it through the central/projective diagram to the unitary group with coefficient V_k. For sufficiently large S and small level K, let I be the kernel of the away-S rational Hecke action on Π_f^K. The Q(k)-space H^{2d}(Sh_K,V_k)[I] complexifies to the sum of all coefficient-conjugate Π^σ eigenspaces, not only one chosen complex eigenspace. Each summand has the Matsushima decomposition over representations nearly equivalent to Π^σ.

Construction or proof: 1. Use the requested rational Hecke decomposition and central-isogeny cohomology comparisons. 2. Take the rational kernel ideal and retain all coefficient conjugates after extension to C.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.5/coefficient-structure`, `HodgeClassesForJacquetLanglands:JL.7/theta-class`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`.

Source: IP23, §4.4, pp. 24–25; §11.3, pp. 83–86; proof of Theorem 12.4, p. 99.

API:

- `TauCeti.JacquetLanglandsHodge.heckeEigenspace.complexification` (compatibility): After C-extension the rational Hecke kernel decomposes into the distinct conjugate eigenspaces.
- `TauCeti.JacquetLanglandsHodge.heckeEigenspace.levelMap` (functoriality): Level pullbacks and normalized traces preserve the rational Hecke space.
- `TauCeti.JacquetLanglandsHodge.heckeEigenspace.containsTheta` (characterisation): The class ξ_τ belongs to its complexification, since its away-S eigenvalues are those of Π.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.heckeEigenspace.rationalEigenvalues` (computation): For a rational Hecke character the conjugate-character orbit has size one.
- `TauCeti.JacquetLanglandsHodge.heckeEigenspace.nonrationalEigenvalues` (non-example): A single complex eigenspace with a nonrational Hecke character is not by itself a Q(k)-subspace.
- `TauCeti.JacquetLanglandsHodge.heckeEigenspace.zeroKernel` (degenerate): A Hecke ideal with no matching character contributes the zero space.

Uses: Theorem 12.4: Provides a coefficient-rational vector space on which the determinant is evaluated. Propositions 11.4–11.9: Separates individual nearly equivalent representations in the eigenpacket.

Check: Its scalar extension contains ξ_τ and every Hecke conjugate needed for rational descent.

### Degree selection in the theta eigenspace

Target `HodgeClassesForJacquetLanglands:JL.8/degree-selection`; proposed declaration `TauCeti.JacquetLanglandsHodge.degreeSelection` (theorem).

In degree 2d of hecke-eigenspace, each v∈Σ contributes degree two and the q₁ module, while every real place outside Σ contributes degree zero. Thus the relative cochain bidegree is (d,d). One proof uses the packet and negative-similitude calculation. A second uses near-equivalence rigidity and the explicit archimedean theta module, as in Remark 11.5; it avoids depending on the global packet classification. This is a relative-cochain statement; actual Hodge types require hodge-weight-comparison.

Construction or proof: 1. Apply Matsushima and the local cohomology support. 2. Every split-place degree is at least two, so their sum 2d forces the minimum at each place. 3. Use either the packet support or the backward-lift recovery to identify that minimum.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.8/hecke-eigenspace`, `HodgeClassesForJacquetLanglands:JL.8/negative-similitude`, `HodgeClassesForJacquetLanglands:JL.6/near-equivalence`, `HodgeClassesForJacquetLanglands:JL.3/archimedean-theta`.

Source: IP23, Proposition 11.4 and equation (11.2), pp. 85–86; Remark 11.5, p. 87.

Check: Middle-degree q₁ cohomology in local degree four cannot enter total degree 2d.

### Coefficient and cochain Hodge weights

Target `HodgeClassesForJacquetLanglands:JL.8/hodge-weight-comparison`; proposed declaration `TauCeti.JacquetLanglandsHodge.hodgeWeightComparison` (comparison).

For the U(2,2) coefficient at even k≥2, use the standard geometric coefficient with fiber weight 2k−4 and the six Kostant representatives of Proposition 11.6. The cochain positions (0,4),(1,1),(2,2),(2,2),(3,3),(4,0) have actual untwisted Hodge types (0,2k),(k−1,k−1),(k,k),(k,k),(k+1,k+1),(2k,0). Add (2−k,2−k) for the unitary coefficient normalization. In particular the cochain (1,1) term has actual type (1,1) after normalization, for every k. This calculation compares the homogeneous variation and its automorphic unitary normalization.

Construction or proof: 1. Import the homogeneous-variation Hodge-degree rule requested from automorphic cohomology. 2. Evaluate the six Weyl weights w(λ+ρ)−ρ and their center characters. 3. Apply the specified coefficient twist only after the geometric Hodge types are computed.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.8/degree-selection`, `ShimuraData:D3/kostant-representatives`, `ShimuraData:D3/variation`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`.

Source: IP23, Proposition 11.6, pp. 87–90.

Check: For k=4 the cochain (1,1) term has type (3,3) before the shift and (1,1) afterwards.

### Purity of the theta Hecke space

Target `HodgeClassesForJacquetLanglands:JL.8/pure-hodge-space`; proposed declaration `TauCeti.JacquetLanglandsHodge.pureHodgeSpace` (theorem).

The degree-2d Π^S eigenspace on the unitary Shimura variety, and its counterpart on the quaternionic exterior variety, is purely of actual Hodge type (d,d). The same holds for every coefficient conjugate in hecke-eigenspace. After twist (d), the entire Q(k)-rational Hecke space is type (0,0). This uses the coefficient-normalized degree selection, not an identification of relative cochain indices with Hodge indices in general.

Construction or proof: 1. Tensor the normalized (1,1) contributions at Σ and degree-zero contributions elsewhere. 2. Transport along the projective/central cohomology comparisons and repeat for each coefficient conjugate.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.8/hodge-weight-comparison`, `HodgeClassesForJacquetLanglands:JL.8/hecke-eigenspace`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`.

Source: IP23, Proposition 11.6 and Corollary 11.7, pp. 87–90; Theorem 12.4 proof, p. 99.

Check: Purity is established on the whole rational Hecke space used for descent.

## JL.9. The conditional Galois calculation

The Kottwitz hypothesis is specified degree by degree and the exterior-square dual representation fixes its normalization. Integer Tate twists replace formal half-powers before any ℓ-adic carrier is introduced. A geometric unipotent-extension argument upgrades trivial semisimplification to a trivial representation.

Layer inputs: `HodgeClassesForJacquetLanglands:JL.5`, `HodgeClassesForJacquetLanglands:JL.8`, `ModularityAndLanglandsExtensions:ML.4`, `AutomorphicGaloisRepresentations:R19.2`, `PadicHodgeTheory:R06.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `PadicHodgeRegulators:L1`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`.

### The cocharacter representation

Target `HodgeClassesForJacquetLanglands:JL.9/kottwitz-representation`; proposed declaration `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation` (construction).

For the unitary similitude group over F use dual group GL₄×G_m with nontrivial Gal(E/F) action (g,ν)↦(θ₄(g),νdet g). Let r=(∧²std⊗ν)∨, normalized by the cocharacter’s extreme weight −μ. Extend through Gal(E/F) by the unique intertwiner fixing a highest-weight vector. For Res_{F/Q} take r₀=⊗_{v∈Σ}r_v and extend to G_{F_Σ} by the ordinary tensor-permutation action with the prescribed local intertwiners. The tensor factors are not graded objects, so no Koszul signs are introduced.

Construction or proof: 1. Read the dual cocharacter from the real datum and identify the exterior representation with its central twist and dual. 2. Fix the semidirect-product extension by the highest-weight normalization. 3. Use tensor induction across the embeddings in Σ.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.5/shimura-diagram`, `HodgeClassesForJacquetLanglands:JL.8/arthur-parameter`, `mathlib:exteriorPower.map`, `ModularityAndLanglandsExtensions:ML.4`.

Source: IP23, §11.5, pp. 91–93.

API:

- `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation.centralAction` (simp): The central dual coordinate ν acts by ν⁻¹.
- `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation.galoisPermutation` (structure): G_{F_Σ} permutes the Σ-indexed ordinary tensor factors with the specified local intertwining action.
- `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation.extremeWeight` (characterisation): The extreme weight is −μ, determining the Kottwitz normalization.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation.singleFactor` (computation): For d=1, r₀ has dimension six.
- `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation.emptyTensor` (degenerate): For d=0 the tensor representation is the trivial line.
- `TauCeti.JacquetLanglandsHodge.kottwitzRepresentation.noSign` (non-example): Swapping two one-dimensional extreme-weight factors acts by +1, not by a graded sign.

Uses: Proposition 11.9: Controls the semisimplified étale eigenspace.

Check: The representation is dual exterior-square times the dual central character, not bare ∧²std.

### Conditional trivial semisimplification

Target `HodgeClassesForJacquetLanglands:JL.9/galois-semisimplification`; proposed declaration `TauCeti.JacquetLanglandsHodge.galoisSemisimplification` (theorem).

Assume Kottwitz’s conjectural description in the precise degree-wise form of §11.5 for these unitary similitude Shimura varieties: H^i_et[Π^S]^ss embeds in a finite sum of r_ℓ^{i−4d}(ψ₀), with its fixed cocharacter and coefficient normalization. For ψ=(σ_E⊠Sym¹,1), the twisted degree-2d eigenspace H^{2d}_et[Π^S](d)^ss is trivial under G_{F_Σ}. Indeed the single-factor bottom Arthur weight is V^{−2}=|·|⁻¹; the total weight −2d uses only these lines, and twist (d) cancels the tensor character including its permutation action.

Construction or proof: 1. For an algebraic auxiliary normalization (k_v+1,w), w odd, take the supplied arithmetic representation ρ_ar with det ρ_ar=ξ_E ε_ℓ^{−w−1}. Define ρ₀=ρ_ar⊗ε_ℓ^{(w+1)/2}, so det ρ₀=ξ_E. The exponent is integral. This replaces the hypothetical Langlands group. 2. Compute the graded exterior square directly with integer twists: V²=ε_ℓ^{−3}, V⁰=(1⊕Sym²ρ₀)⊗ε_ℓ^{−2}, V^{−2}=ε_ℓ^{−1}. Formal half-norm twists cancel before an ℓ-adic carrier is introduced. Verify the Gal(E/F) intertwiner normalization so no extra quadratic character remains on the extreme lines. 3. Use the stated conjectural degree-wise embedding with i=2d, and identify its bottom graded piece after Tate twist.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.9/kottwitz-representation`, `AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation`, `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`, `ModularityAndLanglandsExtensions:ML.4`.

Source: IP23, Proposition 11.9, p. 90; §11.5, pp. 91–93.

Check: An alternating Euler-characteristic identity alone is not the conjectural input asserted here.

### Triviality of geometric unipotent extensions

Target `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`; proposed declaration `TauCeti.JacquetLanglandsHodge.unipotentSplitting` (theorem).

Let k be a number field, ℓ a prime, and W a finite-dimensional Q_ℓ-representation of G_k, unramified outside finitely many places and de Rham at v|ℓ. If W^ss is trivial, W is trivial. The special extension group needed is H¹_g(k,Q_ℓ)=0: local class field theory identifies a de Rham extension of the trivial representation by itself at v|ℓ with a homomorphism k_v×/O_v×→Q_ℓ; away from ℓ every continuous additive Q_ℓ-character is unramified. The global class factors through the finite ideal class group and vanishes. Induct on a filtration with trivial quotients.

Construction or proof: 1. Import the precise Bloch–Kato local calculation for Q_ℓ from the period-functor supplier. 2. Use global reciprocity and finiteness of the ideal class group to kill each global extension. 3. Induct on the length of W, observing that subquotients of a geometric de Rham representation remain de Rham.

Direct inputs: `PadicHodgeTheory:R06.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `PadicHodgeRegulators:L1`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`.

Source: IP23, Remark 11.10, p. 90.

Check: Without the de Rham hypothesis the cyclotomic logarithm gives a nontrivial unipotent extension.

### Conditional trivial Galois action

Target `HodgeClassesForJacquetLanglands:JL.9/galois-triviality`; proposed declaration `TauCeti.JacquetLanglandsHodge.galoisTriviality` (theorem).

Under the Kottwitz hypothesis of galois-semisimplification, the full degree-2d étale Π^S eigenspace after twist (d) has trivial G_{F_Σ}-action for every ℓ. Apply unipotent-splitting to the geometric cohomology representation, and transport the conclusion to the quaternionic exterior group and to every coefficient-conjugate summand of hecke-eigenspace.

Construction or proof: 1. Forget coefficient scalars temporarily and use trivial semisimplification over Q_ℓ. 2. Apply the geometric unipotent-extension argument, then restore coefficients and the compatible comparisons.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.9/galois-semisimplification`, `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`, `HodgeClassesForJacquetLanglands:JL.8/hecke-eigenspace`.

Source: IP23, Proposition 11.8 and Remark 11.10, p. 90; Theorem 12.4 proof, p. 99.

Check: Trivial semisimplification is not substituted for triviality of the actual representation.

## JL.10. Rational descent and the main theorems

The restriction construction is compatible with every realization and depends bilinearly on a theta class and a component parameter. Complex invertibility supplies a nonzero determinant polynomial. Reciprocity puts the special component character in the invariant rational parameter space, where two successive rational choices preserve its nonvanishing.

Layer inputs: `HodgeClassesForJacquetLanglands:JL.7`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `HodgeClassesForJacquetLanglands:JL.0`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `HodgeClassesForJacquetLanglands:JL.5`, `MotivesAndAlgebraicCycles:MC.2`, `ShimuraVarieties:V4`, `ShimuraVarieties:V8`, `HodgeClassesForJacquetLanglands:JL.8`, `MotivesAndAlgebraicCycles:MC.7`, `HodgeClassesForJacquetLanglands:JL.9`.

### The auxiliary Hilbert representation

Target `HodgeClassesForJacquetLanglands:JL.10/auxiliary-hilbert-form`; proposed declaration `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm` (construction).

The τ chosen by all-sign-nonvanishing comes from a cohomological cuspidal GL₂(A_F) representation obtained from a holomorphic Hilbert modular form of weights k_v+1 and an odd algebraic norm weight r, with finite central character ξ_E. After the prescribed norm twist and JL transfer to B×, its restriction contains the required source representation: antiholomorphic above Σ and holomorphic outside Σ. Track restriction first to the positive-infinity subgroup and then to the norm subgroup; do not identify these two subgroups.

Construction or proof: 1. Use the discrete-series signs of τ to identify the algebraic Hilbert weight and its common odd parity. 2. Apply JL and the precise restriction/Clifford-theory interface requested from R16.6.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.7/all-sign-nonvanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/cohomological-rationality`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

Source: IP23, §12.2.4, pp. 96–97; §10.2, pp. 65–66.

API:

- `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm.parity` (characterisation): The auxiliary weights k_v+1 are odd and admit a common odd r.
- `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm.sourceRestriction` (compatibility): After unitary normalization a constituent on H_N^+ is the τ of global-theta-data.
- `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm.coefficientConjugates` (functoriality): Coefficient conjugation permutes weights and yields the corresponding auxiliary conjugate systems.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm.weightTwoInput` (computation): If k_v=2, the auxiliary Hilbert weight is three.
- `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm.normTwist` (compatibility): The scalar norm twist changes the algebraic normalization while preserving the prescribed unitary discrete-series signs.
- `TauCeti.JacquetLanglandsHodge.auxiliaryHilbertForm.signRestriction` (non-example): Restriction to positive real norms alone does not impose the finite idele norm condition.

Uses: Theorem 12.4: Supplies arithmetic coefficient conjugation for the theta eigenspace. Proposition 11.9: Allows the actual Hilbert ℓ-adic representation to replace the hypothetical Langlands parameter.

Check: The required infinity type has weight k_v+1, not k_v.

### The common CM field with a support place

Target `HodgeClassesForJacquetLanglands:JL.10/auxiliary-cm`; proposed declaration `TauCeti.JacquetLanglandsHodge.auxiliaryCm` (theorem).

For distinct B₁,B₂ choose a finite place v₀ outside their ramification and the prescribed finite bad set, and a CM quadratic E/F ramified at v₀, nonsplit at every finite place ramified in either B_i. Then E embeds into both B_i, and sufficiently small levels can be chosen hyperspecial at v₀ while preserving the desired finite automorphic vectors. This supplies the additional local hypothesis used in Proposition 10.1.

Construction or proof: 1. Choose the local quadratic square classes by weak approximation, with negative signs at all real embeddings. 2. Use the quaternion embedding criterion and choose v₀ away from the fixed ramified and level places.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/brauer-reduction`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`.

Source: IP23, §12.2.1, p. 94; Proposition 10.1, p. 70; Proposition 12.3 proof, p. 98.

Check: Ramification of E at v₀ is compatible with split B_i and unramified hyperspecial automorphic vectors there.

### The realization-compatible restriction map

Target `HodgeClassesForJacquetLanglands:JL.10/restriction-correspondence`; proposed declaration `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence` (construction).

For a fixed finite level on the exterior variety and a component parameter c, define Res_c:H^{2d}(Sh_{G~},V~)(d)→V₁⊗_L V₂(d)≅Hom_L(V₁,V₂). In order: pull back to the block subgroup; apply the rational harmonic coefficient projection; multiply by c; take the normalized central trace to the projective quaternionic block group; average at a compatible level; pull back from G to the product B₁××B₂×; apply the L-rational π₁⊠π₂ projector; contract the chosen L-rational finite representation vectors. The map is Q(k)-linear in the source and Q-linear in c, with target coefficients L. Its construction is in compatible Betti/étale realizations over F_Σ whenever c is Galois invariant.

Construction or proof: 1. Compose the supplied cohomological maps in the stated order and normalize the trace as in Remark 2.2. 2. Use the L-rational Hecke projector and fixed rational finite vectors; keep their nonzero rescaling freedoms. 3. Compare its complex realization on ξ_τ and c_η with the analytic restriction in Proposition 10.1.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.0/tensor-correspondence`, `HodgeClassesForJacquetLanglands:JL.5/coefficient-structure`, `HodgeClassesForJacquetLanglands:JL.5/component-class`, `HodgeClassesForJacquetLanglands:JL.7/eta-projection`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`.

Source: IP23, §12.2.5–§12.2.11, pp. 96–98; Theorem 12.4 proof, p. 99.

API:

- `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence.complexTheta` (compatibility): For c=c_η, its value on ξ_τ(d) is the correspondence constructed analytically in §10.
- `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence.bilinearParameters` (structure): Res_c(x) is bilinear over Q(k) after extending the Q-component parameter space.
- `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence.realizationCompatibility` (functoriality): For a Galois-invariant c the Betti map commutes with every ℓ-adic comparison and G_{F_Σ}-action.

Unit tests:

- `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence.zeroComponent` (degenerate): For c=0 the correspondence is zero.
- `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence.identityCase` (compatibility): The equal-algebra branch uses the diagonal and gives the identity on V₁.
- `TauCeti.JacquetLanglandsHodge.restrictionCorrespondence.traceImage` (non-example): Trace to a missing adelic component contributes zero; it is not an isomorphism induced by a globally surjective covering.

Uses: Proposition 12.3: Translates the all-sign pairings into an invertible operator. Theorem 12.4: Supplies the determinant family and its compatible realizations.

Check: Do not assume central quotient maps are surjective on all adelic points.

### Invertibility of the theta correspondence

Target `HodgeClassesForJacquetLanglands:JL.10/complex-invertibility`; proposed declaration `TauCeti.JacquetLanglandsHodge.complexInvertibility` (theorem).

There is complex auxiliary data for which Res_{c_η}(ξ_τ(d)):V₁,C→V₂,C is an isomorphism. In the tensor sign bases it has a nonzero entry on each matching line and no other entries: the coefficient pairings and restriction fix the individual archimedean signs, and all-sign-nonvanishing makes each allowed entry nonzero. Thus its rank is 2^d. Nonzero of one matrix coefficient would not suffice.

Construction or proof: 1. Choose the required CM field and support place. 2. Use the simultaneous Proposition 10.1 data and identify the sign pairings with the individual tensor coefficients. 3. Apply opposite-sign Poincaré pairing to obtain the diagonal operator with all entries nonzero.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.10/restriction-correspondence`, `HodgeClassesForJacquetLanglands:JL.0/sign-lines`, `HodgeClassesForJacquetLanglands:JL.7/all-sign-nonvanishing`, `HodgeClassesForJacquetLanglands:JL.10/auxiliary-cm`.

Source: IP23, Proposition 12.3, p. 98.

Check: For d=1 acceptance requires both diagonal entries to be nonzero.

### Galois-invariant component parameters

Target `HodgeClassesForJacquetLanglands:JL.10/component-galois-invariants`; proposed declaration `TauCeti.JacquetLanglandsHodge.componentGaloisInvariants` (theorem).

At a fixed finite level let W_Q=H⁰(Sh_{H~_B},Q)^{G_{F_Σ}}, where the action is the actual finite permutation action on components. For the character η of auxiliary-character, c_η belongs to W_Q⊗Q(η). To prove this, factor the torus datum cocharacter through j:Res_{F/Q}G_m→T, j(s)=([s,s],s). Functoriality of the reflex norm places its finite-idele image in j(A_{F,f}×). Since η_T(j(s))=η(s⁻¹)=1, torus reciprocity fixes c_η; pullback is equivariant. Invariants commute with scalar extension because this is a finite permutation representation. No triviality of the entire component action is asserted.

Construction or proof: 1. Factor the explicit cocharacter through the indicated F-torus, with reflex field F_Σ. 2. Use reflex-norm functoriality and the character’s triviality on A_F×. 3. Take kernels of the finite permutation matrices over Q and extend scalars.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.5/component-torus`, `HodgeClassesForJacquetLanglands:JL.5/component-class`, `HodgeClassesForJacquetLanglands:JL.7/auxiliary-character`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/plan/reflex-norm-functoriality`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V8/datum-functoriality`.

Source: IP23, §4.3, pp. 23–24; Theorem 12.4 proof, p. 99, corrected E8.

Check: Choose rational sums of Galois orbits, not arbitrary rational individual component classes.

### Rational determinant descent

Target `HodgeClassesForJacquetLanglands:JL.10/rational-determinant-descent`; proposed declaration `TauCeti.JacquetLanglandsHodge.rationalDeterminantDescent` (theorem).

Let H be the Q(k)-rational Hecke space of hecke-eigenspace and W_Q the invariant component space of component-galois-invariants. Fix L-rational finite representation parameters as in restriction-correspondence. The determinant of Res_c(x) is a polynomial in coordinates of x∈H and c∈W_Q, with coefficients in L. Complex-invertibility and c_η∈W_Q⊗C give a complex point where it is nonzero. Since Q(k) and Q are infinite, choose x∈H and c∈W_Q at which it remains nonzero, treating the two parameter blocks successively. The resulting tensor ξ₀ has coefficients L, is Hodge by purity of every conjugate summand, and is invertible.

Construction or proof: 1. Write the determinant of the bilinear family in finite-dimensional bases; nonzero at a complex point means it is not the zero polynomial. 2. For the theta block, expand the finitely many L-valued coefficients over Q(k) and choose a nonzero coordinate polynomial. Apply homogeneous polynomial nonvanishing over Q(k), leaving a nonzero polynomial in c. Then expand its coefficients over Q and apply the same argument over Q to the component block. This is not averaging. 3. Use purity of every coefficient conjugate to make the rational theta vector a Hodge vector, then apply the Hodge-compatible restriction map.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.10/complex-invertibility`, `HodgeClassesForJacquetLanglands:JL.10/component-galois-invariants`, `HodgeClassesForJacquetLanglands:JL.8/pure-hodge-space`, `HodgeClassesForJacquetLanglands:JL.8/hecke-eigenspace`, `mathlib:MvPolynomial.IsHomogeneous.eq_zero_of_forall_eval_eq_zero`.

Source: IP23, Theorem 12.4 proof, p. 99, corrected E8.

Check: Averaging an arbitrary invertible operator need not remain invertible, so cannot replace the determinant argument.

### Hodge classes for Jacquet–Langlands

Target `HodgeClassesForJacquetLanglands:JL.10/main-hodge`; proposed declaration `TauCeti.JacquetLanglandsHodge.mainHodge` (theorem).

For Jacquet–Langlands Hodge data there exists ξ₀∈V₁⊗_L V₂(d) of Hodge type (0,0) whose correspondence operator is an isomorphism V₁≅V₂ of L-Hodge structures. This is unconditional. It is the assertion of Theorem 12.4(i), hence Theorem 3.2(i); the equal-algebra branch is supplied by the identity correspondence. The statement constructs a Hodge class, without claiming it is an algebraic cycle or an absolute Hodge class.

Construction or proof: 1. Use only the Hodge part of rational-determinant-descent; the conditional Galois conclusion is not an input to this implication. 2. Interpret the rational type-(0,0) tensor as the Hodge isomorphism by Poincaré duality. 3. For d=0 the multiplicity realizations are rank-one pure type-(0,0) L-spaces, and any nonzero L-linear identification is a Hodge isomorphism; this treats the finite Shimura-set boundary directly.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.10/rational-determinant-descent`, `HodgeClassesForJacquetLanglands:JL.0/brauer-reduction`, `HodgeClassesForJacquetLanglands:JL.0/tensor-correspondence`, `MotivesAndAlgebraicCycles:MC.7/hodge-class`.

Source: IP23, Theorem 12.4(i), pp. 98–99; Theorem 3.2(i), p. 20.

Check: For d=0 this is an isomorphism of weight-zero rank-one multiplicity realizations.

### Conditional Hodge–Tate correspondence

Target `HodgeClassesForJacquetLanglands:JL.10/main-hodge-tate`; proposed declaration `TauCeti.JacquetLanglandsHodge.mainHodgeTate` (theorem).

Assume the unitary-similitude Kottwitz conjecture in galois-semisimplification. The ξ₀ of main-hodge can be chosen in HT(V₁⊗_L V₂(d)): it is a rational Hodge tensor whose image is G_{F_Σ}-fixed in every ℓ-adic realization. Its induced isomorphisms V₁⊗Q_ℓ≅V₂⊗Q_ℓ are G_{F_Σ}-equivariant simultaneously for all rational primes ℓ. Here HT is the compatible-realization notion of §12.1, not the local p-adic Hodge–Tate condition alone.

Construction or proof: 1. Choose the same rational data from determinant descent with invariant component class. 2. Use the realization-compatible restriction map and the triviality of every ℓ-adic source eigenspace.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.10/main-hodge`, `HodgeClassesForJacquetLanglands:JL.10/rational-determinant-descent`, `HodgeClassesForJacquetLanglands:JL.9/galois-triviality`.

Source: IP23, §12.1, pp. 93–94; Theorem 12.4(ii), pp. 98–99; Theorem 3.2(ii), p. 20.

Check: One class works for every ℓ; no ℓ-dependent choice of ξ₀ is allowed.

### The rational weight-two correspondence

Target `HodgeClassesForJacquetLanglands:JL.10/weight-two-corollary`; proposed declaration `TauCeti.JacquetLanglandsHodge.weightTwoCorollary` (application).

When all k_v=2 and Q(π)=Q, the local systems are constant and the final class is represented in the π₁⊠π₂ summand of H^{2d}(X₁×X₂,Q)(d) at suitable finite levels. The map x↦p₂,*(ξ₀∪p₁*x) is an isomorphism of the degree-d rational Hodge multiplicity spaces. Under the explicit Kottwitz hypothesis it induces G_{F_Σ}-equivariant isomorphisms in all ℓ-adic realizations. Finite-level representation factors are retained when translating from multiplicity spaces to the full isotypic summands.

Construction or proof: 1. Set every harmonic degree to zero and specialize L=Q. 2. Use the Künneth and trace formula while retaining the finite representation factors.

Direct inputs: `HodgeClassesForJacquetLanglands:JL.10/main-hodge`, `HodgeClassesForJacquetLanglands:JL.10/main-hodge-tate`, `HodgeClassesForJacquetLanglands:JL.0/tensor-correspondence`.

Source: IP23, Theorem 1(i)–(ii) and equations (1.4)–(1.5), p. 5.

Check: For a real quadratic F with d=1 the class lies in degree two and acts on H¹ multiplicity spaces.

## The normalized Hodge calculation

The numerical table in JL.8 is useful for checking the coefficient convention independently. Its rows follow the six relevant Kostant representatives in Proposition 11.6, pp. 87–90. Both middle rows are retained because they are distinct cochain contributions.

| Relative cochain position | Geometric type, fiber weight 2k−4 | Type after shift (2−k,2−k) |
| --- | --- | --- |
| (0,4) | (0,2k) | (2−k,k+2) |
| (1,1) | (k−1,k−1) | (1,1) |
| (2,2), first | (k,k) | (2,2) |
| (2,2), second | (k,k) | (2,2) |
| (3,3) | (k+1,k+1) | (3,3) |
| (4,0) | (2k,0) | (k+2,2−k) |

For k=4 the degree-two term is (3,3) geometrically and (1,1) after normalization. This excludes identifying the cochain indices with actual Hodge types before the coefficient shift. In total degree 2d, local degree at least two at each v∈Σ forces degree exactly two at every such place. The compact factors have degree zero. Consequently every coefficient-conjugate summand used by determinant descent is type (d,d).

## Component reciprocity and rational descent

At a fixed finite level the actual Galois action on components is a finite permutation action. Its invariant space W_Q has a rational basis consisting of sums over Galois orbits. Tensoring W_Q with a coefficient field commutes with invariants, because the invariants are the common kernels of finitely many rational permutation matrices minus the identity. No individual component needs to be rational over the reflex field.

The torus datum cocharacter factors through j:Res_{F/Q}G_m→T, j(s)=([s,s],s). At each embedding the cocharacter is the product of the z and bar z contributions over Σ and is trivial away from Σ, so its reflex field is F_Σ. Reflex-norm functoriality puts the reciprocity image in j(A_{F,f}×). The full Hecke character η is trivial on A_F×, and hence η_T(j(s))=1. The function c_η pulled back from the torus is G_{F_Σ}-fixed even though other functions on components can be moved. This gives the complex witness in W_Q⊗C needed by the determinant argument.

Choose finite-dimensional rational theta and invariant-component parameter spaces at a compatible level, then choose their bases. Res_c(x) is a matrix with L-valued entries bilinear in the two sets of coordinates. Its determinant is homogeneous separately in each set. Complex invertibility gives a point where it is nonzero. To choose the theta coordinates over Q(k), expand the finite set of coefficients over a basis of their Q(k)-span and choose a nonzero coordinate polynomial. Polynomial nonvanishing over an infinite field supplies a Q(k)-point at which the remaining polynomial in the component coordinates is nonzero. Repeat the finite coefficient-span argument over Q to choose the component coordinates rationally. This works with coefficients in a field larger than either parameter field. It does not require the determinant to start with rational coefficients.

The theta vector is Hodge because the whole rational Hecke space has pure normalized type. The component parameter is invariant by construction. Under the explicit Kottwitz hypothesis the theta vector is fixed in every ℓ-adic realization, and the same rational restriction construction produces the all-prime class. Averaging an invertible complex matrix would not prove this: an average can be singular. The nonzero polynomial is what preserves invertibility during both rational choices.

## Supplier interfaces and unresolved closure

Every layer has a target-level plan. The following four interfaces keep the prerequisite closure open; they name mathematical inputs, not implementation status. The three Part II roadmap identifiers suggested by the paper route have no registered stage ids, so they are not used as fictitious dependencies. These precise interfaces must be assigned nodes by their owners before the roadmap can be closed.

### Quaternionic Shimura realization interface

The proposed HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic has no registered stages or exact nodes yet. Needed: arbitrary real split subset Σ, the dual τ_k local systems and their L-models, Matsushima multiplicity realizations of degree d and rank 2^d, Poincaré pairings and compatible Betti/all-ℓ models over F_Σ. Include the finite compact Shimura-set/constant-model interpretation when Σ is empty, without imposing strict Deligne SV3 on a compact Q-adjoint group. V6/V8 provide canonical varieties/maps, not these cohomology theorems. IP23 §§2–3, pp. 14–20, and §12.2.11, p. 98 specify the consumer interface.

Consumers: `HodgeClassesForJacquetLanglands:JL.0/data`, `HodgeClassesForJacquetLanglands:JL.0/multiplicity-realization`, `HodgeClassesForJacquetLanglands:JL.0/sign-lines`, `HodgeClassesForJacquetLanglands:JL.10/restriction-correspondence`.

### Automorphic cohomology and rational coefficient descent interface

The proposed ShimuraVarietiesPartIIAutomorphicCohomology has no registered stage/node. Needed: compact Matsushima with rational Hecke projectors including all coefficient conjugates; pullback and normalized trace to the actual image for central quotients, compatible with Hodge/étale realizations; homogeneous-variation Hodge-degree computation from Kostant weights; and the Tits/Schur rational-descent interface giving the harmonic coefficient Q(k)-form and block projection. D3/variation constructs a variation, and V8 supplies canonical-model maps, but neither supplies these cohomology comparisons. The self-dual quaternionic L-rational multiplicity model needs its own special argument rather than assuming every field of rationality is a field of definition. IP23 §4.4, pp. 24–25, §11.3, pp. 83–90, Proposition 12.2, pp. 95–96, and §12.2.5–12.2.11, pp. 96–98 are the precise required specializations.

Consumers: `HodgeClassesForJacquetLanglands:JL.5/coefficient-structure`, `HodgeClassesForJacquetLanglands:JL.7/eta-projection`, `HodgeClassesForJacquetLanglands:JL.8/hecke-eigenspace`, `HodgeClassesForJacquetLanglands:JL.8/degree-selection`, `HodgeClassesForJacquetLanglands:JL.8/hodge-weight-comparison`, `HodgeClassesForJacquetLanglands:JL.8/pure-hodge-space`, `HodgeClassesForJacquetLanglands:JL.9/galois-triviality`, `HodgeClassesForJacquetLanglands:JL.10/restriction-correspondence`.

### Quaternionic theta period and residue interface

The proposed MetaplecticAutomorphicFormsPartIIShimuraWaldspurger has no registered stage/node. MP.3 already owns quaternionic splittings, Morita comparison and unramified theta, so none is replanned. Needed in addition: the toric and quaternionic product-period nonvanishing identities of IP23 Lemmas 9.1–9.2, pp. 57–58; the normalized intertwiner image at s=3/2 and existence of holomorphic nonzero local zeta data in Lemmas 9.7–9.8, pp. 63–64; the compatible anisotropic quaternionic Siegel–Weil residue yielding backward nonvanishing in Lemma 9.6, pp. 61–64; the local test-vector statement of Lemma 10.6, pp. 76–77; the compact norm-one idele quotient character-extension statement of Lemma 10.5, p. 76, with trivial archimedean restriction and finite-order conclusion; and the tensor-product discrete-series decomposition used by Lemma 10.7, p. 77. MP.6/rallis-inner-product is a GQT positive-range value formula with first-occurrence hypotheses; it cannot silently replace this residue identity.

Consumers: `HodgeClassesForJacquetLanglands:JL.6/toric-theta`, `HodgeClassesForJacquetLanglands:JL.6/product-theta`, `HodgeClassesForJacquetLanglands:JL.6/doubling-point`, `HodgeClassesForJacquetLanglands:JL.6/backward-lift`, `HodgeClassesForJacquetLanglands:JL.6/near-equivalence`, `HodgeClassesForJacquetLanglands:JL.7/toric-test-vector`, `HodgeClassesForJacquetLanglands:JL.7/auxiliary-character`, `HodgeClassesForJacquetLanglands:JL.7/triple-product-type`.

### Compatible-realization category and Hodge–Tate tensors

MC.2/classical-weil-cohomology supplies abstract Künneth and Poincaré formalism. The category M_k^L of §2.1.2, pp. 14–15, and the HT subset of §12.1, pp. 93–94, additionally needs finite-dimensional L-Betti realizations with rational Hodge structure, every ℓ-adic realization with G_k-action, comparison maps, tensor/dual/Tate operations and the simultaneous fixed-tensor subset HT. It is not a local p-adic Hodge–Tate representation condition. Extend MotivesAndAlgebraicCycles in its own direction, with the geometric comparison supplied by the Shimura cohomology extension, rather than inventing a new realization carrier here.

Consumers: `HodgeClassesForJacquetLanglands:JL.0/multiplicity-realization`, `HodgeClassesForJacquetLanglands:JL.0/tensor-correspondence`, `HodgeClassesForJacquetLanglands:JL.10/restriction-correspondence`, `HodgeClassesForJacquetLanglands:JL.10/main-hodge-tate`.

The following requests use existing stage ids. Each stage’s scope and the finer available packet nodes were read before selecting this boundary. Exact supplier nodes already sufficient for the need appear directly in the target inputs above.

### Requested from GeometryOfNumbersAndQuadraticArithmetic:GN.2

Quaternion embedding criterion for E in B and local/global quaternion classification, with the placewise nonsplitting condition used in IP23 §12.2.1, p. 94. Norm changes of quaternion symbols are already supplied by current TauCeti.QuaternionAlgebra.normMulEquiv and are not requested as new foundations.

Consumers: `HodgeClassesForJacquetLanglands:JL.10/auxiliary-cm`.

### Requested from AutomorphicFormsOnReductiveGroups:AF.4

Harmonic symmetric tensor representations over a real quadratic space, contraction and harmonic decomposition with the un-divided factorial pairing, and the associated highest-weight functoriality used in IP23 §8.2, pp. 49–50. The harmonic kernel is defined in this packet; the generic symmetric-power representation and highest-weight machinery remain here.

Consumers: `HodgeClassesForJacquetLanglands:JL.4/harmonics`.

### Requested from MetaplecticAutomorphicForms:MP.3

Archimedean local theta identification of D⁻_{k+1} with A_q1(k−2,0,0) on SO(4,2)^0 and D⁺_{k+1} with the compact SO(6) harmonic module, including vanishing of the opposite compact lift, and the qualified quaternionic local Howe uniqueness needed in Proposition 9.5. Generic nonarchimedean orthogonal/unitary Howe duality is not by itself this real/quaternionic statement. IP23 §§7.1–7.2, pp. 46–48; §9.5.4, p. 64.

Consumers: `HodgeClassesForJacquetLanglands:JL.3/archimedean-theta`, `HodgeClassesForJacquetLanglands:JL.6/doubling-point`, `HodgeClassesForJacquetLanglands:JL.6/near-equivalence`.

### Requested from MetaplecticAutomorphicForms:MP.2

Real algebraic Gaussian/Fock comparison with ψ(x)=exp(2πix), the creation/annihilation constants and negative-coordinate signs of IP23 equation (8.2), pp. 50–51. The nonarchimedean generator-operator node does not supply this real comparison.

Consumers: `HodgeClassesForJacquetLanglands:JL.4/fock-comparison`.

### Requested from ModularityAndLanglandsExtensions:ML.4

Global classical/unitary Arthur classification with every stabilization hypothesis retained, the parameter (σ_E⊠Sym¹,1), its local packets, multiplicity and conjugation behavior; the packet calculations in IP23 §§11.1–11.3, pp. 79–87 specialize this input. No unconditional Kottwitz statement is requested: the exact degree-wise cohomology conjecture remains an explicit hypothesis in JL.9.

Consumers: `HodgeClassesForJacquetLanglands:JL.8/arthur-parameter`, `HodgeClassesForJacquetLanglands:JL.8/adams-johnson`, `HodgeClassesForJacquetLanglands:JL.9/kottwitz-representation`, `HodgeClassesForJacquetLanglands:JL.9/galois-semisimplification`.

### Requested from PadicHodgeTheory:R06.2

Exactness and subquotient stability of geometric de Rham representations, and de Rham comparison for the smooth proper Shimura cohomology in use. IP23 Remark 11.10, p. 90 uses these to pass from semisimplification to actual triviality.

Consumers: `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`.

### Requested from PadicHodgeRegulators:L1

For any finite k_v/Q_ℓ, H¹_g(k_v,Q_ℓ)=Hom(k_v×/O_v×,Q_ℓ) under local reciprocity. This is the trivial-coefficient local Bloch–Kato calculation, not a regulator nonvanishing conjecture; IP23 Remark 11.10, p. 90 refers to Bloch–Kato Example 3.9.

Consumers: `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`.

### Requested from tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences

Mixed finite/infinite weak approximation for the local square classes of a CM quadratic field, negative signs at every real place, and a prescribed ramified finite support place (IP23 §12.2.1, p. 94).

Consumers: `HodgeClassesForJacquetLanglands:JL.10/auxiliary-cm`.

### Requested from tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters

Canonical Hecke-character carrier, local components, finite-order and open-kernel/ray-class factorization used by the auxiliary η (IP23 Lemma 10.5, p. 76). Character extension on the norm-one torus is the separate theta-extension gap.

Consumers: `HodgeClassesForJacquetLanglands:JL.7/auxiliary-character`.

### Requested from tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles

Finite-idele/ideal-class quotient comparison identifying A_k×/(k×k_∞× O_hat×) with the ideal class group, used in IP23 Remark 11.10, p. 90.

Consumers: `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`.

### Requested from tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers

Finiteness of the trivial-modulus ray class group and its equivalence with the ordinary ideal class group, used in IP23 Remark 11.10, p. 90.

Consumers: `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`.

### Requested from tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Global reciprocity, used to annihilate unramified additive Q_ℓ-characters in IP23 Remark 11.10, p. 90.

Consumers: `HodgeClassesForJacquetLanglands:JL.9/unipotent-splitting`.

### Requested from tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Quaternion Brauer invariants, their global reciprocity sum and uniqueness of the quaternion representative of a nonzero product class. Equal real ramification cancels, as used in IP23 §12.2.1, p. 94.

Consumers: `HodgeClassesForJacquetLanglands:JL.0/brauer-reduction`, `HodgeClassesForJacquetLanglands:JL.2/tensor-model`.

### Requested from tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Hilbert 90 and local/global norm subgroups for a quadratic extension, including an integral non-norm unit at a ramified finite place, as used for the projective exceptional map (Proposition 5.7, p. 31) and support switching (Lemma 10.4, pp. 75–76).

Consumers: `HodgeClassesForJacquetLanglands:JL.1/exceptional-projective`, `HodgeClassesForJacquetLanglands:JL.7/norm-support`.

### Requested from tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components

Algebraic central quotients and identity components of reductive groups, characteristic-zero central isogenies with μ₂ kernel and descent of morphisms; used by the exterior isogeny of IP23 Proposition 5.6, pp. 30–31.

Consumers: `HodgeClassesForJacquetLanglands:JL.1/exceptional-isogeny`.

### Requested from GL2AutomorphicRepresentationsAndTransfer:R16.6

Automorphic restriction/extension for the norm-multiplier subgroup H_N^+ of B×(A_F): realize the relevant irreducible unitary source τ as a constituent of a full B× cuspidal representation and its GL₂ transfer σ, prove quadratic base change σ_E is independent of that choice, and compare restriction through H_∞^+ with the odd algebraic Hilbert weight and its unitary norm twist. IP23 §11.4, p. 86 and §12.2.4, pp. 96–97. The existing hilbert-algebraic-weights node supplies parity conventions, not this restriction/Clifford-theory statement.

Consumers: `HodgeClassesForJacquetLanglands:JL.8/arthur-parameter`, `HodgeClassesForJacquetLanglands:JL.10/auxiliary-hilbert-form`.

## Source corrections and verification

The targets use the following corrected formulations. Descriptions of the printed material are paraphrases. These findings were already identified in the paper extraction and its independent review and were rechecked for this design. The packet records the searches for published corrections; none was located on 19 October 2026. Independent review confirmed the invariant-component descent and narrowed E4 to a missing component justification; it does not assert that the component bijection is false.

### E1: IP23, published 2023 version, §2.1, p. 14

Independent verdict: confirmed.

The single-embedding coefficient-field Hodge convention implicitly treats complex conjugation as preserving one L-embedding. Use a rational Hodge structure with L-action; equivalently retain the conjugate-embedding family, or require L totally real when using one embedding. Complex conjugation takes an embedding ι to bar ι. A nonreal L-embedding is not fixed; the final self-dual setting uses a totally real coefficient field. Reach: nothing.

### E2: IP23, published 2023 version, §3.3, p. 19

Independent verdict: confirmed.

The displayed degree used for the quaternionic multiplicity realization is 2d. Use cohomological degree d. A quaternionic Shimura variety with d split real factors has dimension d and the discrete-series contribution is degree one at each such factor. Reach: nothing.

### E3: IP23, published 2023 version, Rotated group diagram, p. 22

Independent verdict: confirmed.

The rank-one group on the quaternionic side carries an E-unitary label. Use U_B(V₀ sharp), with the notation of that diagram. The summand is a rank-one B-module and the adjacent arrows are B-linear isometry-group arrows. Reach: nothing.

### E4: IP23, published 2023 version, §4.3, p. 24

Independent verdict: confirmed as a gap; no claim of a false bijection.

The component set is identified with the torus Shimura variety without a separate component argument. Use only the Shimura morphism to the component torus and pullback of its degree-zero functions. The derived group is (B₁¹×B₂¹)/μ₂ and is not simply connected, so the usual simply-connected sufficient criterion is unavailable. This alone is not a counterexample to the component bijection. Record the missing justification; the weaker Shimura morphism and pullback of torus functions suffice for c_η. Reach: the proof.

### E5: IP23, published 2023 version, §4.3, p. 24

Independent verdict: confirmed.

The character is described on the norm-one ideles but is evaluated on a general E-idele in the torus formula. Use the full finite-order Hecke character of A_E×/E×A_F×, restricting it to E¹ only where needed. The norm of the displayed argument need not be one. Triviality on A_F× gives the required representative independence and the restriction to the center. Reach: the proof.

### E6: IP23, published 2023 version, Proposition A.1(i), p. 101

Independent verdict: confirmed.

The second denominator factor in the local splitting cocycle quotient is written without the place subscript v. The quotient is s_v(g₁g₂)/(s_v(g₁)s_v(g₂)). Both arguments belong to the same local group G_v, so both denominator values must use the local cochain s_v. The omission is a subscript error, not a missing multiplicative factor. Reach: nothing.

### E7: IP23, published 2023 version, Proof of Proposition 11.6, p. 88

Independent verdict: confirmed.

The Hodge-type pair for the cochain (1,1) term has an unmatched closing delimiter. Read its untwisted Hodge type as (k−1,k−1). The adjoining Kostant-weight calculation and the final twist on p. 90 give precisely this pair. Reach: nothing.

### E8: IP23, published 2023 version, Proof of Theorem 12.4, p. 99

Independent verdict: confirmed.

Rationality of a degree-zero component parameter is used as if it implied trivial Galois action on that parameter. Restrict component parameters to W_Q=H⁰(Q)^{G_{F_Σ}}. Show c_η lies in W_Q⊗Q(η) using the cocharacter factorization through j(s)=([s,s],s), reflex-norm functoriality and η_T(j(s))=1. Perform the determinant nonvanishing argument in the two parameter spaces H and W_Q. Canonical-model reciprocity can permute connected components, so a rational component basis need not be fixed. The character is nevertheless fixed because its value is trivial on the reflex-norm image. Finite permutation invariants commute with scalar extension; polynomial nonvanishing over the infinite rational coefficient fields then gives a fixed rational parameter without averaging an invertible operator. Reach: the proof.

The routed extraction has two additional locator/model corrections: its item 092 points to equation (10.8), whereas the seesaw is (10.7), p. 72; its item 042 must use W=U₃⊗U₄ from (5.16), p. 37. These are corrections to the extraction, rather than new errors attributed to the published paper. All 62 items routed to this roadmap occur in the packet’s routed-item map.

The source work read the published paper’s theorem on pp. 4–5, its definitions and proof chain on pp. 14–99 and Proposition A.1 on p. 101. Auxiliary general theorems are imported through the verified supplier interfaces or are named in the four gaps; no claim is made here to have read every paper in IP23’s bibliography. No restricted source is needed for this plan.

Independent review by Codex (codex-dpm5k1) checked all 71 targets and the eight pinned declarations; the report is [REV-DESIGN-HodgeClassesForJacquetLanglands](../reviews/REV-DESIGN-HodgeClassesForJacquetLanglands.md). Current-library reuse was checked at Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and roadmap ownership at 0d144d044dacebca17b654695b6f1ad58f159b27. In particular `TauCeti/Algebra/Quaternion/SymbolEquiv.lean` supplies `normMulEquiv`, `TensorProduct.lean` supplies `tensorAlgEquivTensorMatrix`, and `BrauerClass.lean` supplies `quaternionClass_mul`; these newer bodies are reuse inputs, not additions to the pinned baseline.

The packet is a complete target-level planning pass with all eleven layers planned. Each layer’s coverage record specifies its supplier refinements; none is marked closed. Definition and construction APIs each have at least three discriminating tests. The suggested file and the reader use the same orientation, character-weight map, Hodge normalization and determinant-descent hypotheses. Implementing the mathematical targets and proving the suggested statements are Tau Ceti work; every packet node remains unchecked.
