# Residually reducible deformation rings: the weak-primitive generic theorem

This continuation supplies generic restriction and Hecke-kernel containment with weak primitivity over the normalized residue field, in every rank prime to the residual characteristic and with any finite number of Schur constituents. The coefficient-descent question for the printed arbitrary finite-k generic theorem remains explicit. It builds on the fifteen PL.6 targets of the parent reader. Eight theorems are added; no definitions or constructions are introduced. The existing APIs and discriminating tests for Schur representations, primitivity, connectedness, pseudodeformations, reducibility ideals and generic primes remain those of their owners.

## Conventions and imported objects

A residual representation is **weakly primitive** if it is not actual induction from a proper open subgroup. **Strong primitivity** excludes the semisimplification of induction. These predicates are different. The parent small-rank comparison is useful for 0<n<l over a fixed coefficient field; none of the new generic arguments invokes it. Field enlargement is a separate question: the S₃ standard representation over 𝔽₅ is primitive over 𝔽₅ and induced over 𝔽₂₅. Testing weak primitivity over an algebraic closure, or from the outset over a common splitting field for all subgroups of the finite residual image, gives the coefficient convention used by the general lifting interfaces.

A polarized representation of Γ=Δ⋊⟨c⟩ with multiplier μ is described by a representation ρ of Δ and a perfect form B satisfying B(ρ(δ)x,ρ(δᶜ)y)=μ(δ)B(x,y). We use μ(c)=−1, hence B is symmetric. A Schur residual representation has distinct absolutely irreducible constituents, each individually conjugate self-dual, and is semisimple. The forbidden top/bottom configuration in its definition is essential when changing integral lattices.

Equal-characteristic coefficients are A=k[[T]] and E=k((T)), with k finite. Normalize v_T(T)=1. A norm has α(av)=v_T(a)+α(v), α(v+w)≥min(α(v),α(w)), and α(v)=∞ precisely at zero. Its zero ball is an A-lattice. Arithmetic polarization exchanges δ with δᶜ in the dual-norm calculation.

P=P_𝒮 is the closed characteristic-polynomial subring of R=R^univ_𝒮. Its residual block-sign group is H=μ₂^d; P=Rᴴ. The diagonal μ₂ acts trivially. At absolutely irreducible generic points the effective action is free and the full action is transitive on the fibre. There is a map P→T to the ordinary Hecke algebra; a map R→T need not exist. J denotes ker(P→T), and the conclusion concerns JR.

A generic prime has dim(R/p)=1 and characteristic l, with absolutely irreducible generic representation, distinct ordinary inertial characters at every l-adic place, and multiplicatively ℤ-independent values at one inertia element. The ordinary local residual representation is trivial in the generic R=T setup. Ratios of its inertial characters therefore lie in the torsion-free group 1+T A, so finite-index inertia restriction preserves distinctness at every place.

The parent nodes imported below retain their own API and test contracts. The determinant partition ideal remains owned by current upstream IntegralHeckeAndGaloisDeterminants IHG.1 §1.4. The GL norm-building carrier is already planned in current ReductiveGroupsPartII RG2.2. LocalGaloisGroups supplies the local group presentations used by the ordinary flag-ring owner, and ProfiniteArithmetic supplies the profinite foundations. The current upstream documents and Tau Ceti library were checked before assigning new targets.

## PL.6 targets

These statements are definitive. The suggested file proposes Lean names and the parts of the signatures expressible with the pinned libraries. Its comments identify hypotheses or conclusions that are not yet expressible. Those omissions are signature boundaries; they do not change the mathematical statements here.

### 1. Schur reduction detects polarized imprimitivity

Node `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-imprimitivity-detected-in-reduction`.

Let k be finite of odd characteristic, A=k[[T]], E=k((T)), Γ=Δ⋊⟨c⟩ profinite, and r:Γ→𝒢_n(A) continuous with r⁻¹(𝒢_n⁰)=Δ, n>0, and multiplier μ satisfying μ(c)=−1. Assume the reduction r̄ is Schur. Let N⊂Δ be open and normal in Γ. Suppose ρ_E=r|Δ⊗E restricts to N as a direct sum of t pairwise non-isomorphic absolutely E-irreducible subspaces V_i, and Δ permutes these subspaces transitively. If t>1, then ρ̄=r̄|Δ is actually induced from a continuous representation over k of the proper open block stabilizer H={δ:δV₁=V₁}. In particular weak primitivity of ρ̄ forces t=1. This is a deduction in the polarized setting; it does not identify weak and strong primitivity for arbitrary residual representations.

**Proof and dependency chain.**

1. The perfect symmetric form B from the polarized representation pairs each N-simple block with precisely one c-dual block: the Hom spaces between distinct absolutely irreducible N-constituents vanish. Thus B-duality preserves the subspace of norms adapted to ⊕V_i.
2. Use the stable-lattice theorem on H acting on V₁, then transport the lattice through Δ/H. This gives an integral, Δ-fixed norm α adapted to the block decomposition. Define its B-dual by α#(v)=inf_{w≠0}(v_T(B(v,w))−α(w)). The formula shows (α#)#=α and that B-duality is affine on segments (duality negates the weights in the paired dual basis). The identity B(ρ(δ)v,ρ(δ^c)w)=μ(δ)B(v,w), with μ(δ) a unit, makes α# Δ-fixed.
3. By the common-splitting-basis and affine-segment contract of RG2.2, take γ to be the midpoint of α and α#. Duality exchanges the endpoints, so γ#=γ. Both endpoints are block-adapted; choose a common basis inside each block, so γ stays block-adapted. Endpoint weights are integral; midpoint weights lie in (1/2)ℤ.
4. Pass to A′=k[[u]], T=u², a totally ramified quadratic extension with unchanged residue field, and double the norm weights. They are integral. The zero ball Λ of this norm is a Δ-stable, selfdual lattice which splits across all t nonzero blocks. Consequently Λ/uΛ is actual finite-index induction from the H-action on the first block lattice.
5. All stable integral models have the same reduced characteristic polynomials, hence the same semisimplification by Brauer–Nesbitt. The Jordan–Hölder factors of Λ/uΛ are therefore distinct, absolutely irreducible and individually conjugate self-dual, as for ρ̄. Its reduced pairing is perfect. In the forbidden Schur configuration, a top quotient and a disjoint bottom constituent would be isomorphic, forcing a composition factor twice. Hence the new polarized reduction is Schur, and Schur semisimplicity makes its underlying Δ-representation isomorphic to ρ̄. This upgrades the induced reduction to actual induction of ρ̄.

**Source.** Tho15, §3.1, Definitions 3.2 and Lemmas 3.1, 3.3, pp.12–13; §5.2, proof of Proposition 5.3, p.58. Supplies the polarization dictionary and Schur semisimplicity. The block-adapted selfdual-lattice argument is the present deduction filling the reduction step of Proposition 5.3; it is not stated in this source. Sk13, §3, Definition 3.1 and Remark 3.2, p.519. Gives the dual norm formula, common splitting bases, and basis-independent affine interpolation used in the deduction.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`.
- `ArithmeticGaloisRepresentations:G7/polarized-representation`.
- `ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices`.
- `ArithmeticGaloisRepresentations:R01.1/continuous-induction`.
- `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`.
- `ReductiveGroupsPartII:RG2.2`.

**Acceptance checks.**

- The coefficient extension is totally ramified and has residue k, so no assumption that primitivity survives residue-field extension is used.
- A direct-sum decomposition must be permuted transitively to give proper induction; an invariant orthogonal direct sum alone is not excluded by weak primitivity.
- A residual Jordan block with repeated trivial factors fails the Schur hypothesis; semisimplified induction in that case is not upgraded by this argument.

### 2. Weak-primitive generic restriction

Node `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-restriction`.

In the full setup of Thorne §5.2, let F/F⁺ be CM, S a finite set of split places containing all l-adic places, k finite of characteristic l>3, A=k[[T]], E=k((T)), and r:G_{F⁺,S}→𝒢_n(A) continuous with preimage G_{F,S} of the identity component. Assume: ρ_E=r|G_{F,S}⊗E is absolutely irreducible; ζ_l∉F; r̄|G_{F⁺(ζ_l)} is Schur; r̄|G_F is weakly primitive; r̄(G_{F(ζ_l)}) has no nontrivial l-power quotient; some σ₀∈G_{F,S} has n split unit eigenvalues in A× with no nonzero multiplicative ℤ-relation; l∤n; and μ(c)=−1. Then for every open N⊂G_F, ρ_E|N is absolutely irreducible. The restriction conclusion also holds with the cyclotomic-image quotient assumption removed: the proof of this node does not use that assumption. In the trivial-residual ordinary local setup of ANT §4.2, a generic prime stays generic after allowed finite field restriction: the ratios of distinct inertial characters take values in the torsion-free group 1+T A, and the independent values remain independent after a positive power. The image and quotient assumptions are retained to match the source theorem, although the imprimitivity part of this proof does not use them.

**Proof and dependency chain.**

1. Replace N by an open subgroup N₀ normal in Γ=G_{F⁺} and contained in N. Clifford restriction over Ē is semisimple with a transitive set of isotypic constituents.
2. A positive power σ₀^a lies in N₀. Multiplicative independence makes its eigenvalues distinct and they are already in E. Every invariant subspace over Ē is a sum of its E-defined eigenlines, so every N₀-simple constituent descends to E and remains absolutely irreducible. Distinct eigenvalues also exclude multiplicities. No coefficient extension with a changed residue field is necessary.
3. The cyclotomic index for G_{F⁺(ζ_l)} is prime to l. Semisimplicity of the restricted residual representation descends by averaging. Each original simple factor has pairwise distinct absolutely irreducible restricted factors, so its commuting algebra is k. The Schur hypothesis means the cyclotomic subgroup has an odd coset relative to G_{F(ζ_l)}; choose τ in that coset, its duality fixes each restricted factor. On original Δ-constituents its conjugation differs from c by inner conjugation, so each original factor is individually c-polarized. This does not presume c itself belongs to the cyclotomic subgroup. The original r̄ is therefore Schur.
4. If more than one N₀-constituent exists, apply polarized-imprimitivity-detected-in-reduction to its transitive block system. Actual residual induction contradicts weak primitivity. Thus ρ_E|N₀, and therefore ρ_E|N, is absolutely irreducible.
5. For ordinary genericity in the trivial-residual setup, every inertial character has values in 1+T A. This group is torsion free in equal characteristic. A ratio which became trivial on a finite-index subgroup would have finite image, hence was already trivial. This proves distinctness separately at every l-adic place, including places where independence is not assumed. Raise the chosen inertia element at the independent place to a positive power lying in the restricted inertia image; independence persists.

**Source.** Tho15, §5.2, hypotheses (1)–(6) and Proposition 5.3, pp.57–58. States absolute irreducibility on every open subgroup with actual-induction primitivity. The proof here supplies the polarized integral reduction step and avoids the unproved residue-field-extension assertion. ANT20, §3.3, Definition 3.7, p.2411; §4.2, proof of Theorem 4.1, p.2415. Genericity supplies split multiplicatively independent ordinary eigenvalues; the generic theorem uses Thorne’s restriction result.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-imprimitivity-detected-in-reduction`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime`.
- `ArithmeticGaloisRepresentations:R01.1/clifford-restriction-semisimple`.
- `ArithmeticGaloisRepresentations:R01.1/clifford-isotypic-decomposition`.
- `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`.

**Acceptance checks.**

- No rank inequality n<l or strong primitivity appears.
- In the rank range 0<n<l this agrees with the parent weak/strong comparison, but does not use that comparison.
- The independent eigenvalues guarantee distinct eigenvalues for every positive power; mere regular semisimplicity of σ₀ is insufficient.

### 3. Weak primitivity is invariant under image-preserving restriction

Node `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-image-invariance`.

Let k be any field, Γ a profinite group, and ρ:Γ→GL_k(V) a continuous representation with finite image and 0<dim_k V<∞. Let Γ₁⊂Γ be an open subgroup with ρ(Γ₁)=ρ(Γ). Then ρ is weakly primitive if and only if ρ|Γ₁ is weakly primitive. Weak primitivity means that there is no isomorphism with actual induction of a nonzero continuous finite-dimensional k-representation from a proper open subgroup. There is no semisimplification in this statement and no restriction on characteristic or rank.

**Proof and dependency chain.**

1. If ρ≅Ind_H^Γ U, the kernel K=ker ρ fixes every nonzero coset block. Hence K⊂⋂γγHγ⁻¹⊂H, and its action on U is trivial. The induction therefore descends to actual induction from the proper subgroup H/K of the finite image Γ/K.
2. Conversely inflation from Γ/K of any actual induction gives induction from the inverse-image open subgroup of Γ. Thus weak primitivity depends only on the finite-image representation.
3. The image-preserving subgroup Γ₁ has the same quotient image and the same image representation. Apply the preceding equivalence to Γ and Γ₁. In particular, disjoint good CM extensions in ANT Lemma 5.2 preserve the weak hypothesis needed by generic restriction and R=T.

**Source.** ANT20, §5, Lemma 5.2 and proof, pp.2416–2417. Good extensions have the same residual image and are claimed to preserve primitive representations. The kernel-on-coset-block argument supplies the precise actual-induction justification, without the separate strong-primitivity argument. Tho15, §5.2, hypothesis (2), p.58. Fixes the actual-induction convention that the image-preserving bridge must preserve.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`.
- `ArithmeticGaloisRepresentations:R01.1/continuous-induction`.
- `ArithmeticGaloisRepresentations:R01.1/mackey-decomposition`.

**Acceptance checks.**

- The trivial one-dimensional representation is weakly primitive in every characteristic, by the induction dimension formula.
- Image equality is essential: over an algebraically closed field of characteristic zero, the two-dimensional S₃ standard representation is Ind_{C₃}^{S₃} χ for χ nontrivial, while its restriction χ⊕χ⁻¹ to C₃ is weakly primitive since no proper subgroup has index dividing 2.
- The proof uses that kernel elements act as the identity on the entire induced representation; it does not replace this by identity on its semisimplification.

### 4. Weak primitivity over a splitting coefficient field

Node `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

Let k be finite, G a finite group, and V a nonzero finite-dimensional semisimple k-representation of G. Suppose that for every subgroup H⊂G, all simple k[H]-modules are absolutely irreducible. For every field extension K/k, V is weakly primitive over k if and only if K⊗k V is weakly primitive over K. In particular this applies after choosing a finite common splitting field for the finite residual image and all its subgroups. It does not assert that a representation primitive over an arbitrary smaller field remains primitive on enlargement. Weak primitivity over an algebraic closure of k is equivalent to weak primitivity after every finite extension of k.

**Proof and dependency chain.**

1. Scalar extension of an actual induction is the induction of the scalar extension, so induction over k implies induction over K.
2. Suppose K⊗k V is Ind_H^G U. Since V is semisimple, U must be semisimple: for any H-submodule W⊂U, a G-linear retraction of Ind W⊂Ind U restricts to an H-linear retraction U→W by inclusion and projection at the identity coset. The splitting-field hypothesis then makes every simple summand of U a scalar extension of a simple k[H]-module. Descend its multiplicities and obtain U₀ over k.
3. Ind_H^G U₀ becomes isomorphic to V over K. Since both are semisimple, the split simple multiplicities or Brauer–Nesbitt descend this isomorphism to k. Thus induction over K implies induction over k.
4. A finite group has finitely many subgroups. For each, finitely many absolutely simple modules have matrix coefficients in a finite extension of k. Their compositum is a common finite splitting field. This is a legitimate coefficient convention before testing primitivity; it cannot be imposed after assuming primitivity over a smaller field.
5. For the algebraic-closure clause, every induced decomposition uses only finitely many matrix coefficients, so it is defined over a finite extension. The finite-image descent of weak-primitivity-image-invariance reduces the continuous profinite formulation to this finite statement.

**Source.** NT21, §5, definition before Lemma 5.1, p.66. The primitive predicate is over the stated field k. The coefficient-stability deduction here adds a precise splitting-field condition; this condition is not in that definition. ANT20, §1, Theorem 1.1, pp.2399–2401; §6, Theorems 6.1–6.2, pp.2418–2421. The main lifting representations have residual coefficients in an algebraic closure of the residue field. Their weak hypothesis therefore survives every finite coefficient extension. The finite-k generic theorem requires the separate normalization check described below.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-image-invariance`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation`.
- `ArithmeticGaloisRepresentations:R01.1/continuous-induction`.
- `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`.

**Acceptance checks.**

- Over k=𝔽₅, the absolutely irreducible two-dimensional S₃ standard representation is not actual induction from a proper subgroup: only C₃ has index dividing 2 and it has no nontrivial one-dimensional k-character. Over 𝔽₂₅ it is Ind_{C₃}^{S₃}χ for a character of order three. This disproves coefficient invariance without the splitting-field hypothesis, even for semisimple rank n<l.
- The zero representation is excluded, so induction from a proper subgroup cannot be manufactured with a zero inducing module.
- Image-preserving restriction and coefficient enlargement are separate operations; the former needs no splitting-field condition.

### 5. Generic relative cotangent control for Schur deformations

Node `PotentialAutomorphyInfrastructurePartII:PL.6/general-schur-relative-cotangent`.

Let F/F⁺ be CM with [F⁺:ℚ]>1, and let 𝒮 be the polarized ordinary deformation problem used in Thorne §3.7, with a Schur residual representation having any finite number d≥1 of absolutely irreducible constituents, and local conditions invariant under H=μ₂^d. Put R=R^univ_𝒮 and P=P_𝒮=R^H. Let p⊂R have dimension one and characteristic l>2, with absolutely irreducible generic representation, q=p∩P, and A the normalization of R/p, a complete equal-characteristic DVR with fraction field E. Assume Λ→A is finite and enlarge O so its residue field equals that of A. Make the finite faithfully flat coefficient change Λ→Λ̃ of Proposition 3.37 (geometrically integral component rings, separable generic normalization and a map Λ̃→A), and choose compatible primes p̃, q̃. For every fixed-order Taylor–Wiles extension 𝒮_N and compatible primes, the A-module p̃_N/(q̃_N+p̃_N²) is finite with cardinality bounded by a constant independent of N and the chosen auxiliary data. If Frac(R/p)=Frac(P/q), the primes of R⊗ΛΛ̃ lying over the chosen q̃ correspond bijectively to the primes of R lying over q, and the natural map P̃^∧_{q̃}→R̃^∧_{p̃} is an isomorphism. Here q̃_N denotes its extended ideal in R̃_N; the completions are of the localized rings.

**Proof and dependency chain.**

1. ANT Proposition 3.2, already exported by the parent pseudodeformation-subring node, gives R^H=P, generic étaleness, and transitivity on all primes above q. The diagonal μ₂ acts trivially; there is no freeness claim for the full H.
2. Identify the dual relative cotangent with polarized square-zero deformations over A⊕ε(E/A) whose determinant remains fixed. For the order B=A[ρ(G_F)]⊂M_n(A), absolute irreducibility gives T^sM_n(A)⊂B for some s. The trace pairing on M_n(E) bounds the kernel of the infinitesimal comparison; derivations of the matrix algebra are inner. After multiplication by a fixed power of T, every such cocycle is a coboundary. A bounded number of global generators bounds the resulting finite module. These order and generator bounds do not involve d=2.
3. The multiplier-preserving extension from Δ to Γ uses division by 2. The bound persists at auxiliary levels of fixed order; multiply by the fixed additional denominator bound for the chosen generators.
4. After tensoring with E the relative cotangent vanishes. When the residue fraction fields agree, complete-local Nakayama gives surjectivity of each localized completed P-to-R map. The finite H-action identifies all completed factors above q, and finite étaleness plus faithful flatness gives injectivity. These are the only places the two-block group in Thorne’s proof is used; replace it by H and apply the parent ANT invariant-ring theorem.

**Source.** Tho15, §3.7, Proposition 3.37 and proof, pp.28–30. Proves the bounded relative-cotangent and completed comparison for two constituents. The matrix-order estimate is independent of the number of residual blocks. ANT20, §3.2, Proposition 3.2, pp.2407–2408; §4.2, proof of Theorem 4.1, p.2415. Supplies invariants and generic fibre transitivity for any d, and identifies the replacement needed in the Thorne argument. The detailed general-d proof is spelled out here.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation`.
- `GlobalGaloisDeformations:G7`.
- `DeformationAndDerivedPatchingAlgebra:R03.5`.
- `mathlib:IsLocalRing`.

**Acceptance checks.**

- For d=2 the statements are Proposition 3.37, with the same coefficient-change and fixed-order hypotheses.
- For d=3 the acting group has eight elements and the effective quotient four; the denominator in Reynolds averaging is a fixed unit, independent of N.
- The fraction-field equality is not automatic; twisting is applied before the completed-isomorphism part is used.

### 6. Taylor–Wiles cotangent control with weak primitivity

Node `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-taylor-wiles-cotangent`.

Retain the entire Galois setup and six hypotheses of weak-primitive-generic-restriction, with n≥2 as in the patching application. Put a=n(n−1)[F⁺:ℚ]/2, and take the ordinary deformation problem of Thorne §4.6 with T=S and the stated framed local conditions. There exist q_TW≥a and C>0 such that for each N≥1 there are Taylor–Wiles data Q_N of cardinality q_TW and level N satisfying: for every m≥1, H¹_{𝒮_N^⊥,T}(G_{F⁺,S_N},ad r(1)⊗A A/T^m) is finite of cardinality ≤C; H¹_{𝒮_N,T}(G_{F⁺,S_N},ad r⊗A E/A)≅(E/A)^{q_TW−a}⊕T(N), with T(N) finite of cardinality ≤C. The cocycle/framings map identifies this last module with Hom_A(p̃_N/(P̃^loc+p̃_N²),E/A), where p̃_N is the prime associated to the fixed A-valued lifting and P̃^loc is the extension of the corresponding local prime. Consequently the framed relative cotangent is A^{q_TW−a}⊕a finite A-module of uniformly bounded cardinality, precisely hypothesis (1) of Theorem 4.19. The number of residual Schur constituents is unrestricted. A second form replaces the cyclotomic residual-image no-l-power-quotient assumption by an element η∈G_F with ε̄_l(η)≠1 and scalar ρ̄(η), retaining the other hypotheses. The same conclusions follow; this is the form provided by the auxiliary S_a place in ANT. The full residual-image no-order-l-quotient assumption in ANT is retained in the final generic theorem but is not used as a substitute for the cyclotomic condition.

**Proof and dependency chain.**

1. Weak generic restriction supplies strong absolute irreducibility of the characteristic-l lifting on every open subgroup. Use the requested T-adic adjoint-control interface (Tho Proposition 5.1 and Lemma 5.2) to obtain constants K₀,K₁ uniform in the cyclotomic layer and m. Lemma 5.5 then gives bounded inflation kernels and trace-zero submodule saturation; its scalar cyclotomic H¹ is zero by the nontrivial conjugation character.
2. Poitou–Tate with the actual framed local conditions gives the comparison of primal and dual Selmer groups in Proposition 5.4. Its Euler correction is a, and adding each auxiliary prime changes it by one. The finite-coefficient duality is imported; the A-module direct-limit and corank comparison is requested from ArithmeticGaloisDuality D8.
3. Follow Lemma 5.6: if the divisible dual Selmer corank has not yet been removed, choose an auxiliary Frobenius whose generalized eigenprojector detects a class of sufficiently high T-order. On ad⁰, use K₀,K₁ and the nondegenerate trace pairing (l∤n). For scalars, under Thorne’s hypothesis ker φ surjects onto the cyclotomic residual image. In the scalar-detection variant, put D=G_{F(ζ_{l^N})}, K=D∩ker ρ̄, and W=φ(D)/φ(K). Conjugation by η acts trivially on the residual image since ρ̄(η) is scalar, hence trivially on W; cocycle equivariance acts on W by ε̄_l(η). Since ε̄_l(η)−1 is a unit in A, W=0. Thus φ(K)=φ(D), which again makes ker φ surject onto ρ̄(D). This supplies exactly the same eigenprojector detection and does not infer a subgroup quotient condition from a group quotient condition. Chebotarev imposes cyclotomic level N. Each choice cuts a divisible corank and leaves a uniformly bounded finite part. Fix the resulting order and pad uniformly as in the source.
4. To identify the cotangent, write a square-zero lifting as (1+εφ)r and the framed matrices as α_v+εψ_v. Strict conjugation changes these by a coboundary; the fixed local maps impose the framed Selmer condition. This construction works on the direct union of finite square-zero modules although A⊕ε(E/A) is not an object of the complete-Noetherian-local coefficient category. Apply the exact G7 extension request, rather than a representability assertion for that non-Noetherian ring.
5. Matlis duality over A identifies the free cotangent summands with the divisible E/A summands and preserves the finite length/cardinality. This is the Corollary 5.7 input to patching, and does not depend on d.

**Source.** Tho15, §5.1, Proposition 5.1 and Lemma 5.2, pp.53–57; §5.2, Proposition 5.4, Lemmas 5.5–5.6 and Corollary 5.7, pp.59–63. Gives the uniform adjoint bounds, auxiliary-prime construction, framed Selmer calculation and cotangent identification. The only weak-primitivity use occurs through Proposition 5.3, repaired by the preceding node. ANT20, §4.2, proof of Theorem 4.1, p.2415. Uses Corollary 5.7 for the generic lifting; no two-constituent hypothesis enters that Galois-theoretic result.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-restriction`.
- `PotentialAutomorphyInfrastructurePartII:PL.3/thorne-taylor-wiles-datum`.
- `ArithmeticGaloisRepresentations:G7`.
- `ArithmeticGaloisRepresentations:G7/followup-generalized-eigenprojector`.
- `ArithmeticGaloisDuality:R02.4/poitou-tate`.
- `ArithmeticGaloisDuality:D8`.
- `GlobalGaloisDeformations:G7`.
- `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Acceptance checks.**

- The same constant bounds every m and N; an auxiliary-prime existence theorem only modulo T does not supply this statement.
- The corank is q_TW−a, not q_TW and not a fixed-zero Selmer assertion.
- The scalar-detection variant uses ε̄_l(η)≠1, not merely η outside an arbitrary subgroup. The auxiliary-place Frobenius provides that exact condition. The source proof for n=2 uses the second elementary symmetric coefficient and the adjacent-entry argument; its third-coefficient step has no triples and is vacuous. No n≥3 assumption is introduced.

### 7. Block-sign equivariant patched comparison

Node `PotentialAutomorphyInfrastructurePartII:PL.6/block-sign-equivariant-patched-comparison`.

For the polarized arithmetic deformation rings and ordinary Hecke modules of Thorne §4.6, replace the two-block residual representation by a Schur representation with d≥1 constituents and the action μ₂² by H=μ₂^d. Keep all other hypotheses of Theorem 4.19, including its cotangent condition, local genericity, triviality/scalar conditions at the finite auxiliary places and equality of the residue fraction fields. Patch the P_N⊂R_N diagrams and framed modules equivariantly at fixed Taylor–Wiles order. In the resulting diagram S_∞→A_∞→P̃_𝒮 and R_∞→B_∞→R̃_𝒮, the ring B_∞ is finite over A_∞ with nilpotent kernel A_∞→B_∞. For compatible generic primes q_∞⊂A_∞, p_∞⊂B_∞ arising from p, the map (A_∞)^∧_{q_∞}→(B_∞)^∧_{p_∞} is surjective with nilpotent kernel. The patched ordinary module has full support after the distinct-character patching and special-fibre transfer, so the completed P̃_𝒮-to-Hecke map at q̃ has nilpotent kernel. There is no asserted map R^univ_𝒮→Hecke.

**Proof and dependency chain.**

1. Invoke the R03.5 simultaneous equivariant patching contract on all rings, modules and character variations. H is finite and fixed; make the compact diagonal choices for all its elements at once. Local deformation ideals are stable under block signs. The patched diagram identifies B∞/q∞ with R̃_𝒮/q̃ equivariantly, so ANT transitivity on the latter fibre supplies transitivity on the former, rather than assuming it for an arbitrary inverse limit. Odd characteristic makes the invariant functor exact and its fixed denominator 2^d is independent of N.
2. The finite maps P_N→R_N are faithful with uniformly bounded module generators. Hence the appropriate finite-level Fitting ideal is zero. Compatibility of bounded presentations makes Fitt_{A∞}(B∞)=0 in the patched limit. If r generators suffice, (Ann_{A∞} B∞)^r⊂Fitt=0. This proves nilpotence of the kernel; it is not a consequence merely of finite generation.
3. The general-Schur relative cotangent bound becomes zero after inverting T at the generic prime. With equal residue fraction fields, complete-local Nakayama gives surjectivity. Since H acts transitively on the finite fibre above q∞, all completed local maps have the same kernel; nilpotence of the kernel to their product implies nilpotence at the chosen factor. This explains both the transitivity and equivariance requirements of Lemma 4.22.
4. For pairwise distinct local characters at R, the local generic ring is geometrically irreducible, with dimension matching dim S∞. The patched module is nonzero free over S∞ and hence has maximal depth on those components. Apply R03.6/maximal-cm-support-top-components and the explicit dimension equality to obtain full support.
5. Identify the different character choices modulo λ. Use the completed-tensor local geometry: λ-flat components, geometric integrality and a unique characteristic-zero component above each special-fibre minimal prime. The R03.6 near-faithful-lift theorem transfers full support to the trivial-character problem, with λ-regularity inherited from S∞-freeness. Generic reducedness of R_v¹ is unnecessary and false in the source’s older statement.
6. Apply the R03.6 nilpotent-kernel theorem to P̃ and its faithful Hecke action on the localized module. This is Thorne Theorem 4.19’s conclusion, now with arbitrary d. The sign-group size changes bounded constants but not any depth or dimension formula.

**Source.** Tho15, §4.6, Theorem 4.19 and Lemmas 4.22–4.23, pp.47–52. Supplies the patched comparison, Fitting argument and character-change support proof for d=2. The proof here isolates the group-independent steps and uses the arbitrary-d invariant/transitivity input. ANT20, §3.1, erratum, pp.2405–2406; §3.2, Proposition 3.2, pp.2407–2408; §4.2, proof of Theorem 4.1, p.2415. Corrects the local nilpotents and provides the finite block-sign action for arbitrary d. Its sketch is expanded to an equivariant patching contract here.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/general-schur-relative-cotangent`.
- `PotentialAutomorphyInfrastructurePartII:PL.2/ordinary-forms-free-over-lambda`.
- `PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness`.
- `GlobalGaloisDeformations:G7/polarized-presentation`.
- `LocalGaloisDeformationRings:L7/trivial-residual-flag-ring`.
- `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`.
- `LocalGaloisDeformationRings:R08.2/steinberg-condition`.
- `LocalGaloisDeformationRings:R08.2`.
- `DeformationAndDerivedPatchingAlgebra:R03.5`.
- `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-support-top-components`.
- `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-lift-from-special-fibre`.
- `DeformationAndDerivedPatchingAlgebra:R03.6/r-to-t-kernel-nilpotent`.

**Acceptance checks.**

- For d=3 all eight sign actions are patched simultaneously; transitivity is required on the whole generic fibre, not only on the chosen prime.
- A maximal-Cohen–Macaulay module supported on just one of several components is not enough: irreducibility for distinct characters and special-fibre transfer establish the full support used here.
- An unbounded-generator inverse limit cannot justify the Fitting step. The fixed-order patching hypotheses explicitly supply a uniform bound.

### 8. Weak-primitive generic R=T theorem

Node `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-hecke-kernel`.

Let L/L⁺ be CM, everywhere unramified, with [L⁺:ℚ] even, and let n≥2, l>3 with l∤n. Let B/L be central simple of dimension n² with involution of the second kind, split outside the finite set S(B), division at its places, and giving a unitary group G compact at every real place and quasi-split at finite places outside S(B). The set S(B) may be empty; if n is even, |S(B)| is even. Let T=S=S_l⊔R⊔S(B)⊔S_a consist of places split in L, with S_a nonempty, odd-residue-characteristic, absolutely unramified and not split in L(ζ_l), and [L⁺_v:ℚ_l]>n(n−1)/2+1 at S_l. Take level U hyperspecial at inert places, maximal at S(B), Iwahori at R, principal congruence at S_a, and full integral at S_l and split places outside T. For the trivial-character ordinary Hecke algebra let m have residue k, with semisimple ρ̄_m trivial at S_l∪R∪S(B), unramified with scalar Frobenius at S_a, and q_v≡1 mod l at R∪S(B). Require ρ̄_m=⊕_{i=1}^dρ̄_i with distinct absolutely irreducible, individually conjugate-self-dual factors of multiplier ε^{1−n}. Choose its Schur extension r̄_m with multiplier ε^{1−n}δ_{L/L⁺}^n, and the ordinary global problem 𝒮₁ with rings R=R^univ_{𝒮₁}, P=P_{𝒮₁}, local conditions ordinary at S_l, trivial-character at R, reduced flat Steinberg at S(B), unrestricted framed at S_a. Put J=ker(P→T₁(U(l^∞),O)_m). Let p⊂R be a prime with dim(R/p)=1 and l=0 in R/p. Assume JR⊂p; r_p is generic in the parent PL.6 sense (absolutely irreducible at Frac(R/p), ordinary diagonal characters distinct at every l-adic place, and multiplicatively independent values on some inertia element); r_p is trivial at v∈R and l^{N_v}>n where l^{N_v}∥q_v−1; r_p is unramified with scalar Frobenius at v∈S(B); ρ̄_m is weakly primitive; ζ_l∉L, r̄_m|G_{L⁺(ζ_l)} is Schur, and ρ̄_m(G_{L,S}) has no quotient of order l. Let k_p be the residue field of the normalization of R/p. Assume explicitly that k_p⊗kρ̄_m is weakly primitive. This extra coefficient condition is automatic when ρ̄_m is weakly primitive over k̄, or when k is a splitting field for every subgroup of its finite image. Then JR⊂Q for every prime Q⊂p, equivalently JR_p is nilpotent. After the twist arranging equal fraction fields, the stronger local statement after the stipulated Λ̃ coefficient change is that the completed map P̃^∧_{q̃}→T̃₁^∧_{q̃}, q=p∩P, has nilpotent kernel. This conclusion is a generic Hecke-kernel containment theorem. The printed finite-k statement without the normalization coefficient condition remains the explicit coefficient-descent gap. No global R=T equality or global R→T map is asserted.

**Proof and dependency chain.**

1. Compactness of G(L⁺_∞) makes G anisotropic over L⁺: an L⁺-split torus or nontrivial unipotent would give a noncompact real subgroup. Import AA.3 class-number finiteness and compactness to obtain a finite adelic double quotient and finite stabilizers. At S_a, the principal congruence group is torsion free: absolute unramifiedness identifies its faithful ℚ_p-linear realization with a subgroup of 1+pM_D(ℤ_p), p odd. AA.4’s one-prime neat criterion applies. Thus each stabilizer is trivial. This proof works also when B is globally split and S(B)=∅.
2. PL.2 exactness/freeness now applies: forms are finite sums of coefficient modules; normal Taylor–Wiles level coverings have free Δ_Q action, group-ring-free form modules, and trace identifies coinvariants with base level. The ordinary idempotent and the established inverse-limit construction give the Λ-free modules needed for patching. No global-division hypothesis is invoked in this extension of the arithmetic setup.
3. Use the parent twisting theorem to arrange Frac(R/p)=Frac(P/q), without changing the minimal primes below p or the kernel-containment question. Finiteness over Λ follows from the finite R/P extension and the finite Λ-algebra P/J.
4. Normalize R/p as k_p[[T]]. Apply weak-primitivity-splitting-field-base-change when its splitting-field condition holds; otherwise use the explicit weak hypothesis over k_p. Schur and absolute-constituent conditions survive this scalar extension. The generic inertia eigenvalues are split and independent, supplying the restriction and adjoint-control hypotheses. At any v∈S_a, an unramified Frobenius η has scalar residual image and ε̄_l(η)≠1 because v is not split in L(ζ_l). Use the scalar-detection variant of the cotangent theorem; no assertion that the full-image quotient condition passes to a subgroup is made. Apply the quotient-independent restriction conclusion of weak-primitive-generic-restriction and the scalar-detection form of weak-primitive-taylor-wiles-cotangent to provide hypothesis (1) of Theorem 4.19.
5. Apply block-sign-equivariant-patched-comparison, with H=μ₂^d, the imported local geometry and the stated auxiliary conditions. It gives nilpotent completed P-to-Hecke kernel for the trivial-character problem.
6. The general-Schur completed P-to-R comparison transfers this to nilpotence of JR in the chosen completed localization after coefficient change. Faithful flatness of the coefficient change and of Noetherian local completion descends nilpotence to JR_p. A prime Q⊂p corresponds to a prime of R_p, so nilpotence implies JR⊂Q. Conversely containment in every such Q is containment in the nilradical of the Noetherian ring R_p, which is nilpotent.

**Source.** ANT20, §4.1–4.2, standing setup and Theorem 4.1 with proof, pp.2412–2415. The published arbitrary-constituent theorem uses weak primitivity and permits S(B) empty. This node states the arithmetic setup and proves the form with weak primitivity over the normalized residue field, expanding the reduction and scalar bridges. The unqualified finite-k coefficient descent is recorded as a gap. Tho15, §4.6, Theorem 4.19 and Corollary 4.20, pp.47–52; §5.2, Corollary 5.7, pp.62–63. Supplies the patched nilpotent-kernel and localization descent argument; its two-block scope is removed by the preceding general-Schur and block-sign nodes. The scalar Frobenius variant of its scalar Selmer step is proved explicitly above.

**Direct prerequisites.**

- `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-restriction`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-taylor-wiles-cotangent`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/block-sign-equivariant-patched-comparison`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/general-schur-relative-cotangent`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change`.
- `PotentialAutomorphyInfrastructurePartII:PL.2/big-ordinary-hecke-algebra`.
- `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms`.
- `PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness`.
- `PotentialAutomorphyInfrastructurePartII:PL.2/ordinary-forms-free-over-lambda`.
- `AdelicAlgebraicGroups:AA.3/class-number-finite`.
- `AdelicAlgebraicGroups:AA.3/compactness-anisotropic`.
- `AdelicAlgebraicGroups:AA.4/neat-criterion-one-prime`.
- `AdelicAlgebraicGroups:AA.4/rational-stabilizer-finite`.
- `AdelicAlgebraicGroups:AA.4/level-action-free-at-neat`.
- `mathlib:Ideal.minimalPrimes`.
- `mathlib:ringKrullDim`.

**Acceptance checks.**

- For two constituents the conclusion specializes to Thorne Corollary 4.20 with its Galois cotangent hypotheses supplied.
- For d≥3 and n≥l with l∤n the same target is stated; no small-rank primitivity bridge is used.
- The S(B)=∅ case keeps the definite real group and small auxiliary level; finite quotient and exactness are proved independently of division at finite places.
- The conclusion concerns J⊂P extended to R. Substituting ker(R→T) would presuppose a map that this reducible-residual setup does not construct.

## Corrections and source scope

The polarized midpoint, splitting-field descent and scalar-Frobenius detection arguments are deductions given here. Neither is attributed as an explicit lemma of a source. Actual induction follows only after constructing a selfdual lattice and applying Schur semisimplicity. Semisimplifying an arbitrary induced reduction would not suffice. Likewise, a full group's lack of an order-l quotient does not imply that condition for a subgroup of prime-to-l index. The scalar Frobenius at S_a supplies the Selmer projection through its nontrivial cyclotomic value.

Thorne's Proposition 3.15 asserts generic reducedness of the trivial-character local special fibre. ANT §3.1 corrects this. Our support transfer uses the nilreduction, geometric component topology and unique specialization, with flatness and a regular coefficient parameter. ANT Theorem 4.1 gives an indication for arbitrary d; the relative cotangent, finite H-equivariance and bounded-presentation steps above expand that indication into a target-level proof plan.

Thorne was read in the Cambridge accepted manuscript of 16 April 2014. The author-page copy has the same hash. The AMS published PDF returned HTTP 403, so findings against Thorne are scoped to the manuscript. ANT and Skodlerack were read in their versions of record. The bibliography gives reproducible URLs, dates and hashes.

The source-issue register has five entries, all described in our own words:

- **E27**, Thorne §5.2, Proposition 5.3 proof, manuscript p.58: actual residual induction needs the polarized selfdual lattice and Schur semisimplicity. The present argument repairs this step over an already normalized coefficient field and does not change its residue field.
- **E31**, ANT §4.2, Theorem 4.1 proof, p.2415: the arbitrary-d invariant-ring substitution needs the expanded relative cotangent and equivariant bounded-patching contracts.
- **E74**, Thorne Proposition 3.15(1), manuscript p.18, corrected by ANT §3.1, pp.2405–2406: discard generic reducedness of the trivial-character local special fibre; retain the corrected component topology.
- **E75**, ANT Theorem 4.1 proof, p.2415, against Thorne §5.2, pp.58,62: the full-image quotient hypothesis is different from the cyclotomic-image hypothesis. The scalar Frobenius at S_a proves precisely the projection needed for the scalar Selmer step.
- **E76**, ANT Theorem 4.1 proof, p.2415, against Thorne's normalization convention on manuscript p.28: normalization can enlarge the finite residue field. Weak primitivity over the original field need not survive that enlargement. No descent argument from the full arithmetic hypotheses was established here. Require it over the normalized residue field, over an algebraic closure, or under the stated splitting-field convention. This remains the packet's one mathematical gap.

E27 and E31 retain the accepted parent's identifiers. E74 is a published correction. E75 and E76 have no correction in the author listings, arXiv history and title-specific searches inspected on 10 October 2026; these findings and the proposed repairs await independent review.

## Interfaces to lifting and finiteness

PL.7 imports `weak-primitive-generic-restriction`, `weak-primitivity-image-invariance`, `weak-primitivity-splitting-field-base-change` and `weak-primitive-generic-hecke-kernel`. The image-preserving bridge applies to ANT's good soluble CM extensions because disjointness preserves the residual image. It uses actual induction and has no rank bound. These interfaces supply the weak hypothesis used in ANT Theorems 6.1–6.2 and their finite-ring consequences outside the parent's small-rank range, when primitivity is tested over an algebraic closure as in those main lifting statements. For finite-k Theorem 5.1 and Corollary 5.4, retain weak primitivity over the normalization residue field, a common splitting-field convention, or the coefficient-descent gap; do not silently transfer the predicate on enlarging k. The lifting and finiteness targets retain their PL.7 ownership.

ANT's published Theorem 5.1 has a separate numerical refinement. Its proof on pp.2417–2418 applies the |R|n² cut to a component intersection that need not be in characteristic l. Passing to the special fibre can cost another dimension: the available lower bound is n[L⁺:ℚ]−|R|n(n+1)−3. The printed thresholds d₀,d_l>|R|n(n+1)+2 need a sharper argument; thresholds with +3 justify the existing proof. This is the parent's E32, checked here against the published text. Theorems 6.1–6.2 allow auxiliary extension degrees to be arbitrarily large. Their application is unaffected, but the exact Theorem 5.1 threshold must not be advertised as repaired by weak primitivity.

Newton–Thorne Theorem 5.2 and Proposition 5.6 consume these interfaces through PL.7. Its character-ratio criterion (Lemma 5.1, p.66) proves primitivity after every coefficient extension, because character orders are unchanged, so that application has no additional coefficient-descent issue. A rank-one block in the reducible-locus proof requires the parent's global rank-one ordinary character-ring finiteness request: Theorem 5.2 assumes n≥2. This continuation imports that ownership and does not substitute an n≥2 result for the character case.

## Supplier contracts and coverage

The layer is planned at target level. Eight new theorems and fifteen imported parent nodes cover its targets, with one unresolved coefficient-descent gap for the literal arbitrary finite-k generic theorem. The fixed-normalization, geometric-weak and common-splitting-field forms are established by the stated proof plans. It is not closed: the precise supplier contracts below remain. The arithmetic arguments identify their hypotheses and outputs; supplying them does not require another PL.6 definition.

- **ReductiveGroupsPartII:RG2.2:** Import the existing extended GL building as splittable norms over a complete discretely valued field, common splitting bases, basis-independent affine segments, equivariant group action, lattice balls and normalized finite-extension scaling. Specialize to k((T)) and T=u² with e=2. No new building or norm definition is requested; the arithmetic B-duality midpoint deduction is the PL.6 theorem.
- **GlobalGaloisDeformations:G7:** Extend the existing polarized tangent/obstruction comparison to the explicit direct union of square-zero coefficient modules A⊕ε(A/T^m), hence A⊕ε(E/A), with actual cocycles, multiplier-preserving strict conjugacy, fixed framed local maps and determinant-fixed relative cotangent. Do not claim that A⊕ε(E/A) lies in C_Λ or is represented there. Supply the identification Hom_A(p̃_N/(P̃^loc+p̃_N²),E/A)≅H¹_{𝒮_N,T}(ad r⊗E/A), compatible with block signs and finite levels (Tho Corollary 5.7, pp.62–63). Prop 3.9’s generator/relation count itself is already the imported G7/polarized-presentation node.
- **ArithmeticGaloisRepresentations:G7:** Add the equal-characteristic generic-image extension of the dimension-general adjoint API: under Tho §5.1’s strongly absolutely irreducible-on-every-open-subgroup, split independent σ₀, l>3, l∤n and symmetric polarization hypotheses, for Δ₀ normal with abelian Δ/Δ₀ prove the projective image open of finite index, the uniform adjoint saturation T^{a+K₀}ad⁰/T^m⊂M when M contains an element of exact order m−a, and, if μ|Δ₀=1 and c normalizes Δ₀, T^{K₁}H¹(r(Δ₀),ad⁰r/T^m)^{c=−1}=0. Constants are uniform in m; derive the uniform cyclotomic bounds of Lemma 5.5. Sources: Tho Prop 5.1, Lemma 5.2, pp.53–57 and Lemma 5.5, pp.60–61. Keep this distinct from characteristic-zero enormous image or residual adequacy. This extends G7’s direction, with the Part II placement proposal in restructure.
- **ArithmeticGaloisDuality:D8:** For the finite coefficients ad r⊗A A/T^m over a number field, use the existing finite Poitou–Tate theorem and the exact framed local-condition maps to prove Tho Prop 5.4’s Euler/corank comparison after the direct limit A/T^m→E/A. Include the frame H⁰ correction, a=n(n−1)[F⁺:ℚ]/2 for the odd multiplier, one-unit local contribution at each selected generalized-eigenvalue TW prime, and the A-module decomposition (E/A)^{q_TW−a} plus uniformly bounded finite torsion when the dual groups are uniformly bounded. This is equal-characteristic torsion-coefficient duality, not the existing ℤ_p-lattice rationalization theorem.
- **LocalGaloisDeformationRings:R08.2:** Import Prop 3.15 from R08.2/ihara-avoidance-components and Prop 3.17 from the Steinberg nodes, and supplement them with the completed-tensor topology/connectedness interface of Tho Prop 3.16, pp.18–20 and Lemma 3.20, pp.21–22. For the specified ordinary/trivial-character/reduced-Steinberg/unrestricted factors, after splitting the weight components and enlarging coefficients, supply geometric integrality, flatness, common special fibres under character variation, and uniqueness of a generic component over each special-fibre minimal prime. The full generic-reducedness assertion for R_v¹ is excluded by ANT §3.1; nilreduction has the required topology. Ordinary Prop 3.14 is already L7/trivial-residual-flag-ring. No additional flag-ring definition is requested.
- **DeformationAndDerivedPatchingAlgebra:R03.5:** Supply the simultaneous finite-group-equivariant ordinary Taylor–Wiles patching contract for the explicit P_N⊂R_N, framed local-ring and finite free S_N-module diagrams, with bounded presentations, fixed auxiliary-prime order, coefficient normalization and all χ-variants identified modulo λ. Preserve a fixed finite H-action and the equivariant identification B∞/q∞≅R̃_𝒮/q̃; transfer finite-level transitivity through this identification, not through an unrestricted inverse limit. Include continuity of Fitting ideals for these bounded presentations, nilpotence from faithful finite-level rings, complete-local Nakayama for zero relative cotangent plus equal residue fields, and Matlis duality for finite/free A-cotangent modules. This is the abstract ring/module input of Tho Prop 3.37 and Lemma 4.22, not a new arithmetic R=T target. Depth, component support and near-faithful lifting remain the existing R03.6 nodes.

The equal-characteristic projective-image/adjoint extension belongs in ArithmeticGaloisRepresentations, Part II, extending G7. Its existing G7 request is the routing address. This differs from characteristic-zero enormous image and residual adequacy.

At assembly the new generic Hecke-kernel theorem supplies the existing **Generic R=T theorem** planet. Replace that parent planet and retain its other five; the assembled layer has six planets.

## Imported parent targets

- `PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/character-sums-primitive`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/small-rank-primitivity`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/strong-primitivity-image-invariance`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/connectedness-dimension`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/pseudodeformation-restriction-finite`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/reducibility-ideal`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-locus-dimension`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/large-quotients-contain-generic-primes`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/genericity-under-restriction`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change`.
- `PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime-r-equals-t`.

## Sources

- **Tho15:** Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations*. Accepted manuscript, 16 April 2014; 74 numbered pages. JAMS 28 (2015), 785–870; manuscript page numbers used here. [Read source](https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download), accessed 2026-10-10. SHA-256 `76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928`.
- **ANT20:** Patrick B. Allen, James Newton and Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*. Version of record, Compositio Mathematica 156 (2020), 2399–2422; published page numbers. [Read source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/91B814A109E34CC8DA2A5689BFA5CFA4/S0010437X20007484a.pdf/automorphy_lifting_for_residually_reducible_ladic_galois_representations_ii.pdf), accessed 2026-10-10. SHA-256 `9f338fa9f7f66b51bb05756f1409a832370de3105e435616f3827a52a68b72e6`.
- **Sk13:** Daniel Skodlerack, *On centralizers of classical groups and buildings*. Annales de l’Institut Fourier 63 (2013), 515–546; version of record. [Read source](https://www.numdam.org/article/AIF_2013__63_2_515_0.pdf), accessed 2026-10-10. SHA-256 `bb279d12b17e97a5213084abab378d3786e0e234ede50342c9b84bf9b4c3132c`.
- **NT21:** James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms*. arXiv:1912.11261v3; numbered manuscript pages. [Read source](https://arxiv.org/pdf/1912.11261v3), accessed 2026-10-10. SHA-256 `6d50b558a6182a8d1515a6715529a33079807bf405c8db775e4ed252f5a2f379`.
