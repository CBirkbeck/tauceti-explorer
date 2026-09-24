# Grothendieck groups, Cartan maps, and Euler forms, Part II: explicit ring and curve K₀

This part develops the tensor, exterior, determinant and arithmetic calculus of degree-zero algebraic K-theory. It extends the existing GrothendieckEulerForms roadmap and uses its actual categorical carriers. It neither reconstructs categorical Grothendieck groups nor treats a library audit as a proof of a theorem's full hypotheses. The companion packet is a plan: every declaration remains unchecked as an implementation.

The four assigned layers are Z.3, tensor/exterior/determinant operations; Z.4, Dedekind domains and S-integers; Z.5, vector bundles and regular curves; and Z.6, degree-zero comparison maps and computations. This is a partial checkpoint. The coverage entries and the final section distinguish the completed declaration outline from proof inputs and portions which still require decomposition. A successfully elaborated suggested signature does not resolve any of those mathematical obligations.

## Carriers and conventions

For a commutative unital ring R, including the zero ring, the module carrier is the existing full subcategory given by TauCeti.finiteProjectiveModules. Its exact structure is already proved equal to the split structure. We use the existing SplitK0 of that category as a convenient presentation of ring K₀, with its canonical comparison to ExactK0. Z.1 owns the explicit ring presentation, object-class induction, stable equality, scalar extension and Morita interface. This part instantiates its operations; it does not introduce a competing quotient. In the suggested file FP, K0 and cls are abbreviations for these pinned objects and their class map.

Addition is induced by direct sum and multiplication by tensor product over R. The existing SplitK0 commutative-ring theorem already proves the categorical ring laws. The new closure theorem checks that the finite-projective property contains the tensor unit and is closed under the ModuleCat tensor product, after which Mathlib restricts the monoidal structure. The associated unit is [R]. The product rule on classes is the existing of_mul_of theorem, rather than a new axiom about an abstract ring.

A finite projective has a natural-valued rank at each prime. Z.2 owns the extension of this rank to an integer-valued locally constant function for a virtual class. Thus H⁰ here means LocallyConstant(Spec R, ℤ). A disconnected spectrum does not have one distinguished integer rank. Every later use of a rank map must carry its normalization on actual projective classes and its scalar-extension compatibility. The suggested file accepts exactly that supplier map as a parameter for the augmentation and γ-filtration signatures. It does not replace a missing rank theorem by a proposition-valued structure field.

The Picard group is Mathlib's CommRing.Pic, written multiplicatively. Its elements have actual invertible-module representatives. Determinant is a group homomorphism from additive K₀ to this multiplicative group; the Lean homomorphism uses the Additive type synonym. There is no independent ring multiplication on Pic in this plan. When rank and determinant form coordinates, any multiplication formula must retain the interaction of rank with tensor powers of invertible classes.

Exterior powers mean the existing alternating quotient, in every characteristic. In particular, projectivity is established using a retract of a free module and functoriality of exterior powers. Dividing antisymmetrization by n! would incorrectly restrict the coefficient rings. The free exterior basis and its binomial rank formula already belong to Mathlib. The degree-zero exterior power is R and the first exterior power is the original module.

## Source and ownership discipline

Weibel's author-hosted Chapter I supplies projective modules, invertible modules, exterior powers and the componentwise determinant recipe. Chapter II supplies the group-completion construction of virtual exterior operations, the distinction between pre-λ and special-λ identities, and the γ-filtration. Their chapter-local pagination differs from the combined August 2013 draft. The packet records exact locators and short source excerpts, and public source hashes identify the versions read. The 2013 draft is used to check whether apparent slips in the earlier chapters were already corrected.

Two upstream documents, GrothendieckEulerForms and JacobianChallenge, were read in full. The reviewed Z.3–Z.6 library audit and accepted RS-18 restructuring govern scope. In particular, early ring tensor/λ/determinant/γ theory is owned by Z.3. SchemeKTheoryOperations S.6 and S.7 consume its normalization. They do not supply a backward prerequisite for defining the same ring operations. General regular-curve rank and determinant belongs to Z.5; the origin-dependent elliptic specialization belongs to EllipticKTheory E.2 and is imported late by Z.6. General projective bundles belong to S.5, while Z.6 owns the explicit P¹ change-of-basis comparison.

A significant proof boundary remains in the special-λ identities. Weibel II8.8.1 proves injectivity of pullback to a flag bundle by iterating the projective-bundle theorem II8.5, and II8.8.3 then obtains the special-λ structure of ring K₀. An unrestricted dependency from Z.3 to the whole later scheme stage would conceal a possible cycle. The continuation must identify an independently scheduled degree-zero projective-bundle prefix or give a separately decomposed algebraic proof, while preserving S.5's ownership. The convolution identities below require only the pre-λ construction and do not claim that this issue has been settled.

## How to read the declaration plan

Every item below represents one declaration. A construction includes its use-derived API and tests; an API fact used by a later proof has its own lemma item. Prerequisites use stable node IDs or pinned library names. The detailed mathematical statements are authoritative; the suggested Lean file proposes their carrier and signature choices, with proofs deliberately unimplemented.

The first completed block starts from tensor closure and exterior projectivity. It passes through the exterior direct-sum formula to the unit-valued total power series, so that virtual negative classes are handled by series inversion. The identity λ²(−[R])=[R] is a useful guard against truncating a negative virtual class as if it were an actual module. The degree-one coefficient is identified with the identity map by the existing K₀ universal property.

Determinants are assembled over the finite clopen rank partition. The rank-zero factor contributes the scalar module on that component, ensuring that a zero summand does not remove a component from the resulting invertible module. The local proof uses the pinned bijectivity and zero-module criteria. The finite-projective dual comparison is an explicit lemma reducing to the pinned dual–tensor–Hom equivalence; exterior vanishing above local rank is another explicit lemma. The remaining rank-partition and local-freeness contract is assigned to Z.2. The plan does not infer a global identification of line bundles merely because all their stalks are free of rank one.

The γ-operation is the shifted exterior coefficient γⁿ(x)=λⁿ(x+(n−1)[R]) for positive n. Its finite expansion makes the substitution t/(1−t) explicit. The filtration is the ideal span of finite products of positive γ-coefficients of rank-zero classes, with total operation degree at least the filtration index. Weight is not the number of factors. The empty product gives F⁰=K₀; the normalized rank formula gives F¹=ker(rank); concatenation of weighted products proves multiplicativity. Agreement of this ideal span with the source additive-subgroup filtration is an explicit gap, especially on disconnected spectra. The F²/determinant comparison requires further declarations and is not supplied by the F¹ argument.

The Dedekind block starts with the library's fractional-ideal approximation theorem. Its specialization produces a coprime representative; the split sum map gives the coprime two-ideal identity; the pinned tensor/product comparison transports that identity back to arbitrary nonzero ideals. The Steinitz induction uses the existing finite-free retract and successively projects to an ideal in one coordinate. Finite torsion-free projectivity is already the composition of flatness over Dedekind domains, finite presentation over Noetherian rings, and projectivity of finitely presented flat modules. These inputs are reused rather than replanned.

The zero projective is a separate branch of Steinitz. The additive rank–Pic equivalence has inverse (n,L)↦(n−1)[R]+[L], valid for every integer n. Thus its zero case is −[R]+[R], and it handles negative virtual rank without a fictitious negative-dimensional module. Ideal representatives enter only through their existing Pic classes. The source's full one-dimensional Noetherian classification is more general than the Dedekind theorem planned here; the packet does not silently claim that additional generality.


## KTheoryLowDegrees:Z.3


### Exterior powers preserve projectivity

`KTheoryLowDegrees:Z.3/projective-exterior-power`

For any projective R-module M and n ≥ 0, Λⁿ_R M is projective. Finiteness of M is not needed for this assertion. For finite M, the existing exteriorPower.instFinite supplies finiteness separately.

Proof plan: Choose a free module F and maps i:M→F and s:F→M with si=id using Projective.iff_split. Apply exteriorPower.map to i and s. The baseline composition and identity formulas give a retraction of ΛⁿF onto ΛⁿM. Use exteriorPower.instFree for ΛⁿF and Projective.of_split. This argument works in all characteristics and never divides by n!.

Prerequisites: `mathlib:Module.Projective.iff_split`, `mathlib:Module.Projective.of_split`, `mathlib:exteriorPower.instFree`, `mathlib:exteriorPower.map_id`, `mathlib:exteriorPower.map_comp`.

Acceptance: For R=ℤ/2ℤ and n=2 the assertion still holds; no antisymmetrization denominator is allowed. The n=0 and n=1 cases agree with the baseline zeroEquiv and oneEquiv.

Source: Kbook.I, §3, p.16, exterior powers of projectives. Provides the projectivity assertion; the retract proof sharpens the stated finite-projective application using the pinned functorial API.


### Tensor closure of finite projectives

`KTheoryLowDegrees:Z.3/finite-projective-monoidal`

The existing object property finiteProjectiveModules R contains the tensor unit and is closed under the existing ModuleCat tensor product. Hence its full subcategory inherits the existing symmetric monoidal, monoidal preadditive structure, and the baseline SplitK0 commutative ring applies.

Proof plan: The unit R is finite free. If M and N are generated by finite sets, their pairwise pure tensors generate M⊗N, by tensor-product induction. Apply Module.Projective.tensorProduct; package the two closure facts as ObjectProperty.IsMonoidal. Use the existing full-subcategory restriction and SplitK0 ring instances, including of_mul_of. Do not build a second Grothendieck ring presentation.

Prerequisites: `tauceti:TauCeti.finiteProjectiveModules`, `mathlib:Module.Projective.tensorProduct`, `mathlib:CategoryTheory.ObjectProperty.fullMonoidalSubcategory`, `tauceti:TauCeti.SplitK0.instCommRing`, `mathlib:Module.Finite.tensorProduct`.

Acceptance: [R]·[P]=[P] and [0]·[P]=0. The canonical split/exact comparison sends this tensor product to the same object class.

Source: Kbook.II, §2, p.5, commutative-ring multiplication. The new declaration supplies only the finite-projective closure needed to instantiate the existing categorical construction.


### Exterior powers of a direct sum

`KTheoryLowDegrees:Z.3/exterior-direct-sum`

For arbitrary R-modules M,N and n≥0 there is an R-linear isomorphism Λⁿ(M⊕N) ≅ ⨁_{i=0}ⁿ ΛⁱM⊗Λⁿ⁻ⁱN. The summand (i,n−i) maps by exterior multiplication, placing the M factors before the N factors.

Proof plan: Construct the map from each tensor summand using the universal alternating maps and the inclusions into M⊕N; exterior multiplication concatenates the M and N lists. Construct the inverse on a wedge of pairs by multilinearly expanding into subsets of positions. Use the shuffle sign to move M positions before N positions. In the two composites, the universal alternating relations eliminate repeated positions and the signed shuffle expansion gives the identity. This is an integral identity, with no factorial denominator.

Prerequisites: `mathlib:exteriorPower.map_id`, `mathlib:exteriorPower.map_comp`, `mathlib:exteriorPower.alternatingMapLinearEquiv`.

Acceptance: For n=1 the isomorphism is the standard M⊕N decomposition. For M=N=R and n=2 the unique mixed term is R and its generator is (1,0)∧(0,1).

Source: Kbook.I, §3, p.16, exterior direct-sum formula. The displayed direct-sum decomposition supplies the relation used by virtual λ-operations.


### Exterior-class convolution

`KTheoryLowDegrees:Z.3/exterior-class-sum`

For finite projectives P,Q, [Λⁿ(P⊕Q)] = Σ_{i=0}ⁿ [ΛⁱP]·[Λⁿ⁻ⁱQ] in the existing ring K₀(R).

Proof plan: All summands are finite projective by the exterior-power lemma and tensor closure. Apply class invariance to exterior-direct-sum, then iterate the existing biproduct relation and use of_mul_of on every term.

Prerequisites: `KTheoryLowDegrees:Z.3/projective-exterior-power`, `KTheoryLowDegrees:Z.3/finite-projective-monoidal`, `KTheoryLowDegrees:Z.3/exterior-direct-sum`, `mathlib:exteriorPower.instFinite`, `tauceti:TauCeti.SplitK0.of_congr`, `tauceti:TauCeti.SplitK0.of_biprod`, `tauceti:TauCeti.SplitK0.of_mul_of`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, Example 4.1.2, p.25. Object-level input to the group-completion argument.


### Total exterior operation on virtual classes

`KTheoryLowDegrees:Z.3/total-lambda`

Define λₜ:K₀(R)→(1+tK₀(R)[[t]], multiplication) as the unique additive-to-multiplicative homomorphism taking [P] to Σₙ[ΛⁿP]tⁿ. Represent its target inside the units of the existing power-series ring, with constant term 1. Negative virtual classes use the inverse power series; they are not truncated exterior polynomials.

Proof plan: The object series has constant coefficient [R]=1, hence is a unit. Exterior functoriality makes it invariant under isomorphism. exterior-class-sum and the power-series Cauchy-product coefficient formula show that a biproduct maps to a product. Apply the baseline SplitK0 universal property with the additive form of the multiplicative unit group. The inverse formula and uniqueness follow from the additive-group homomorphism laws.

Prerequisites: `KTheoryLowDegrees:Z.3/exterior-class-sum`, `tauceti:TauCeti.SplitK0.liftEquiv`, `mathlib:exteriorPower.zeroEquiv`, `mathlib:exteriorPower.map_comp`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:PowerSeries.coeff_mul`.

API:

- `TauCeti.RingK0.lambdaTotal_constant`: Every λₜ(x) has constant coefficient 1.
- `TauCeti.RingK0.lambdaTotal_of`: The coefficient of tⁿ in λₜ([P]) is [ΛⁿP].
- `TauCeti.RingK0.lambdaTotal_unique`: An additive-to-multiplicative map with these values on finite-projective classes equals λₜ.

Tests:

- `TauCeti.RingK0.lambdaTotal_zero_test`: λₜ(0)=1.
- `TauCeti.RingK0.lambdaTotal_unit_test`: λₜ([R])=1+t.
- `TauCeti.RingK0.lambdaTotal_neg_unit_test`: For every n, the tⁿ coefficient of λₜ(−[R]) is (−1)ⁿ[R].

Uses: KTheoryLowDegrees:Z.3; Weibel II§4 — Coefficient extraction defines virtual exterior operations and negative classes.; SchemeKTheoryOperations:S.6 — Fixes the integral degree-zero normalization for higher operations..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, Example 4.1.2 and preceding virtual extension, p.25. Integral group-completion construction; no special-λ identities are assumed.


### Constant coefficient of the total operation

`KTheoryLowDegrees:Z.3/total-lambda-constant`

For all x∈K₀(R), coeff₀(λₜ(x))=1.

Proof plan: The object series has constant term one. The constant coefficient is multiplicative, and products and inverses of such series retain constant term one.

Prerequisites: `KTheoryLowDegrees:Z.3/total-lambda`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, p.25. Evaluation property of the specified total operation.


### Total operation on a projective class

`KTheoryLowDegrees:Z.3/total-lambda-of`

For every finite projective P and n≥0, coeffₙ λₜ([P])=[ΛⁿP].

Proof plan: Evaluate the baseline universal additive lift on the object P.

Prerequisites: `KTheoryLowDegrees:Z.3/total-lambda`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, Example 4.1.2, p.25. Evaluation property of the specified total operation.


### Virtual exterior coefficients

`KTheoryLowDegrees:Z.3/lambda`

For n≥0 and x∈K₀(R), define λⁿ(x) as the coefficient of tⁿ in λₜ(x).

Proof plan: Extract the n-th coefficient of the unit-valued total operation.

Prerequisites: `KTheoryLowDegrees:Z.3/total-lambda`.

API:

- `TauCeti.RingK0.lambda_zero`: λ⁰(x)=1.
- `TauCeti.RingK0.lambda_one`: λ¹(x)=x.
- `TauCeti.RingK0.lambda_of`: λⁿ([P])=[ΛⁿP] for every finite projective P.

Tests:

- `TauCeti.RingK0.lambda_rank_two_test`: λ²(2[R])=[R].
- `TauCeti.RingK0.lambda_neg_unit_test`: λ²(−[R])=[R], despite the negative virtual rank.
- `TauCeti.RingK0.lambda_zero_class_test`: λⁿ(0)=0 for every n>0.

Uses: KTheoryLowDegrees:Z.3, determinant and γ-operations — Top exterior coefficients give constant-rank determinant and shifted coefficients give γ.; SchemeKTheoryOperations:S.6 — The degree-zero part of the higher operations must agree on every projective class..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, opening definition and Example 4.1.2, p.25. Coefficient convention agrees with actual exterior powers.


### Zeroth virtual exterior coefficient

`KTheoryLowDegrees:Z.3/lambda-zero`

λ⁰(x)=1 for every virtual class x.

Proof plan: Unfold coefficient extraction and use total-lambda-constant.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda`, `KTheoryLowDegrees:Z.3/total-lambda-constant`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, opening definition and Example 4.1.2, p.25. The specified coefficient identities.


### First virtual exterior coefficient

`KTheoryLowDegrees:Z.3/lambda-one`

λ¹(x)=x for every virtual class x.

Proof plan: For series with constant term one, their first coefficient is additive under multiplication. Thus coeff₁λₜ is an additive homomorphism. On each object class, total-lambda-of and exteriorPower.oneEquiv give the identity. Apply the uniqueness clause of the existing K₀ universal property.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda`, `KTheoryLowDegrees:Z.3/total-lambda-constant`, `KTheoryLowDegrees:Z.3/total-lambda-of`, `mathlib:exteriorPower.oneEquiv`, `tauceti:TauCeti.SplitK0.liftEquiv`, `mathlib:PowerSeries.coeff_one_mul`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, opening definition and Example 4.1.2, p.25. The specified coefficient identities.


### Virtual operation on an actual module

`KTheoryLowDegrees:Z.3/lambda-of`

λⁿ([P])=[ΛⁿP] for finite projective P.

Proof plan: Unfold coefficient extraction and use total-lambda-of.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda`, `KTheoryLowDegrees:Z.3/total-lambda-of`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, opening definition and Example 4.1.2, p.25. The specified coefficient identities.


### Exterior convolution for virtual sums

`KTheoryLowDegrees:Z.3/lambda-add`

For every x,y∈K₀(R) and n≥0, λⁿ(x+y)=Σ_{i=0}ⁿ λⁱ(x)λⁿ⁻ⁱ(y).

Proof plan: The total operation sends addition to multiplication. Take the n-th coefficient and apply the finite Cauchy-product formula.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda`, `KTheoryLowDegrees:Z.3/total-lambda`, `mathlib:PowerSeries.coeff_mul`.

Acceptance: λ²(x+y)=λ²x+xy+λ²y, using λ⁰=1 and λ¹=id.

Source: Kbook.II, §4, opening definition, p.25. The identity holds for all virtual classes, not only positive classes.


### Positive exterior powers of the zero class

`KTheoryLowDegrees:Z.3/lambda-zero-class`

λⁿ(0)=0 whenever n>0.

Proof plan: The homomorphism λₜ takes zero to the multiplicative unit power series. Every positive coefficient of that series is zero.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda`, `KTheoryLowDegrees:Z.3/total-lambda`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, opening definition, p.25. Degenerate virtual-class normalization.


### Integral inverse-series recursion

`KTheoryLowDegrees:Z.3/lambda-neg-recursion`

For n>0, λⁿ(−x)=−Σ_{i=0}^{n−1} λⁿ⁻ⁱ(x)λⁱ(−x). The recursion is integral and determines the negative operation from lower coefficients.

Proof plan: Apply lambda-add to x+(−x)=0. The n-th coefficient is zero. Separate the i=n term containing λ⁰(x)=1 and rearrange. Reindex the remaining finite sum.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda-add`, `KTheoryLowDegrees:Z.3/lambda-zero`, `KTheoryLowDegrees:Z.3/lambda-zero-class`.

Acceptance: For n=1, λ¹(−x)=−x. For n=2, λ²(−x)=x²−λ²(x).

Source: Kbook.II, §4, virtual extension, p.25. Coefficient form of the inverse series.


### Exterior coefficients of finite free modules

`KTheoryLowDegrees:Z.3/lambda-free`

For all m,n≥0, λⁿ(m[R])=choose(m,n)[R].

Proof plan: Identify m[R] with the class of R^m using the existing biproduct relation. Use the finite-free exterior basis and its binomial cardinality, then identify the resulting free-module class. Handle the zero ring separately, where all classes vanish.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda-of`, `mathlib:exteriorPower.finrank_eq`, `mathlib:exteriorPower.instFree`, `tauceti:TauCeti.SplitK0.of_congr`, `tauceti:TauCeti.SplitK0.of_biprod`.

Acceptance: λ²(3[R])=3[R]. λ³(2[R])=0.

Source: Kbook.II, §4, Example 4.1.1 and positive structure, pp.25–26. Integral binomial normalization on free projectives.


### Exterior powers commute with scalar extension

`KTheoryLowDegrees:Z.3/exterior-base-change`

For a commutative R-algebra S, every R-module M and n≥0, S⊗RΛⁿ_RM ≅ Λⁿ_S(S⊗RM). The comparison sends 1⊗(m₁∧…∧mₙ) to (1⊗m₁)∧…∧(1⊗mₙ).

Proof plan: Apply the alternating-map universal property and extension-of-scalars universal property to construct the indicated comparison. For an S-module N, both sides represent R-multilinear alternating maps Mⁿ→N. The two universal factorizations give mutually inverse maps; uniqueness proves naturality.

Prerequisites: `mathlib:exteriorPower.alternatingMapLinearEquiv`.

Acceptance: Specializing to n=0 gives S⊗R R≅S. Specializing to n=1 gives the identity base-change comparison.

Source: Kbook.I, §3, p.16, item (ii). The base-change statement is valid for all modules and all commutative algebra maps.


### The top exterior power is invertible

`KTheoryLowDegrees:Z.3/constant-rank-top-invertible`

If P is a finite projective R-module with rankAtStalk(P,p)=n for every prime p, then ΛⁿP is invertible in the existing Module.Invertible sense.

Proof plan: Use the finite-projective local-freeness and constant-rank interface supplied by Z.2. The base-change comparison and free exterior basis show that ΛⁿP is locally free of rank one. By projective-dual-base-change, localizing the dual evaluation map identifies it with evaluation for a free rank-one module. That evaluation is an isomorphism. Apply bijective_of_isLocalized_maximal and package its inverse as a linear equivalence. Package this actual dual evaluation equivalence as the existing Module.Invertible structure. Local freeness is used only through the explicit Z.2 supplier contract.

Prerequisites: `KTheoryLowDegrees:Z.3/projective-exterior-power`, `KTheoryLowDegrees:Z.3/exterior-base-change`, `mathlib:exteriorPower.instFinite`, `mathlib:exteriorPower.finrank_eq`, `KTheoryLowDegrees:Z.2`, `KTheoryLowDegrees:Z.3/projective-dual-base-change`, `mathlib:bijective_of_isLocalized_maximal`.

Acceptance: For a rank-zero finite projective, Λ⁰P=R is invertible. For a rank-one projective P, its determinant is P.

Source: Kbook.I, §3, p.16, determinant construction. Top exterior degree must use the actual constant rank.


### Componentwise determinant of a projective

`KTheoryLowDegrees:Z.3/determinant-projective`

For finite projective P, partition Spec R into its finitely many clopen rank fibres U_r. Let R≅∏_rR_r be the corresponding canonical idempotent decomposition and P_r=R_r⊗RP. Define detProjective(P)∈Pic(R) as the class of the R-module ∏_rΛʳ_{R_r}P_r. The rank-zero factor contributes R_r. Refinement of the partition does not change this class.

Proof plan: Import the clopen rank/idempotent decomposition from Z.2; on each component use constant-rank-top-invertible. The finite product of these component modules has a tensor inverse given componentwise by their duals. Apply the existing Pic constructor. Compare two decompositions on their common idempotent refinement using exterior-base-change; regroup the finite products. This proves independence, including ranks which occur on no component.

Prerequisites: `KTheoryLowDegrees:Z.3/constant-rank-top-invertible`, `KTheoryLowDegrees:Z.3/exterior-base-change`, `mathlib:CommRing.Pic`, `KTheoryLowDegrees:Z.2`, `mathlib:CommRing.Pic.mk`.

API:

- `TauCeti.RingK0.detProjective_congr`: Isomorphic finite projectives have the same determinant class.
- `TauCeti.RingK0.detProjective_free`: The determinant class of a finite free module is 1.
- `TauCeti.RingK0.detProjective_line`: An invertible module has determinant equal to its existing Pic class.

Tests:

- `TauCeti.RingK0.detProjective_zero_test`: The zero module has determinant class 1.
- `TauCeti.RingK0.detProjective_rank_two_test`: The determinant of R² is the trivial invertible class.
- `TauCeti.RingK0.detProjective_nontrivial_line_test`: If L is a nontrivial Pic class then det(L)≠1.

Uses: KTheoryLowDegrees:Z.4 — Distinguishes a nonprincipal invertible ideal from a free module of the same rank.; KTheoryLowDegrees:Z.3; Weibel II2.6 — Its biproduct multiplicativity descends to an additive K₀→Pic homomorphism..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.I, §3, pp.16–17, componentwise determinant recipe. Uses every rank fibre, without choosing a global rank on disconnected spectra.


### Determinant isomorphism invariance

`KTheoryLowDegrees:Z.3/determinant-congr`

For an R-linear equivalence P≅Q of finite projectives, detProjective(P)=detProjective(Q).

Proof plan: An isomorphism preserves the rank fibres. Its top exterior map is an isomorphism on every component. The assembled modules are isomorphic, so their Pic classes agree.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-projective`, `mathlib:exteriorPower.oneEquiv`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.I, §3, pp.16–17. Consequences of the componentwise construction.


### Determinant of a free module

`KTheoryLowDegrees:Z.3/determinant-free`

The determinant class of every finite free R-module is 1.

Proof plan: Choose a finite basis and use its top exterior basis on every component. The product of the scalar component modules is R.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-projective`, `mathlib:exteriorPower.oneEquiv`, `tauceti:exteriorPower.topEquiv`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.I, §3, pp.16–17. Consequences of the componentwise construction.


### Determinant of an invertible module

`KTheoryLowDegrees:Z.3/determinant-line`

For invertible L, detProjective(L)=Pic.mk(L).

Proof plan: Every component has rank one, and the pinned exteriorPower.oneEquiv identifies its determinant with L.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-projective`, `mathlib:exteriorPower.oneEquiv`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.I, §3, pp.16–17. Consequences of the componentwise construction.


### Determinant of a direct sum

`KTheoryLowDegrees:Z.3/determinant-sum`

For finite projective P,Q, det(P⊕Q)=det(P)⊗det(Q) as invertible-module classes.

Proof plan: Refine the clopen rank decompositions until P,Q have constant ranks m,n. Use the exterior-direct-sum formula in degree m+n. All terms except i=m vanish because the corresponding exterior degree exceeds the rank of P or Q; prove that vanishing by the free local model and the local zero-module criterion. The surviving term is ΛᵐP⊗ΛⁿQ. Reassemble the components and use Pic.mk_tensor.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-projective`, `KTheoryLowDegrees:Z.3/exterior-direct-sum`, `mathlib:CommRing.Pic.mk_tensor`, `KTheoryLowDegrees:Z.2`, `KTheoryLowDegrees:Z.3/exterior-above-rank`.

Acceptance: Adding a rank-zero component preserves the determinant.

Source: Kbook.II, Proposition 2.6 and proof, p.11. Correct the transposed P/Q factors in the draft as recorded in sourceIssues.


### Determinant homomorphism on K₀

`KTheoryLowDegrees:Z.3/determinant-hom`

Define detHom:K₀(R)→Pic(R) as an additive-group homomorphism, writing the operation in Pic multiplicatively. On [P] it is detProjective(P); hence det([P]−[Q])=det(P)det(Q)⁻¹.

Proof plan: View the existing multiplicative Pic group additively. Isomorphism invariance and determinant-sum supply a SplitK0.AdditiveInvariant. Use the existing universal property to obtain the homomorphism. The group laws give the subtraction formula and uniqueness. No ring structure on Pic is introduced.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-congr`, `KTheoryLowDegrees:Z.3/determinant-sum`, `tauceti:TauCeti.SplitK0.liftEquiv`.

API:

- `TauCeti.RingK0.detHom_of`: det([P])=detProjective(P).
- `TauCeti.RingK0.det_add`: det(x+y)=det(x)det(y).
- `TauCeti.RingK0.det_neg`: det(−x)=det(x)⁻¹.

Tests:

- `TauCeti.RingK0.det_zero_test`: det(0)=1.
- `TauCeti.RingK0.det_free_test`: det(n[R])=1 for all n≥0.
- `TauCeti.RingK0.det_line_test`: det([L])=L for every element L of the existing Pic group.

Uses: KTheoryLowDegrees:Z.4 — Forms the determinant coordinate of the Steinitz equivalence and transfer formula.; KTheoryLowDegrees:Z.3 — Identifies the second γ-filtration kernel after the requisite determinant identities are proved..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, Proposition 2.6, p.11. The group homomorphism, with tensor product as the Pic group law.


### Determinant of an object class

`KTheoryLowDegrees:Z.3/determinant-hom-of`

For every finite projective P, detHom([P]) is its componentwise determinant class.

Proof plan: Evaluate the existing universal additive lift on P.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-hom`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, Proposition 2.6, p.11. The generator evaluation of the homomorphism.


### Surjectivity of the determinant

`KTheoryLowDegrees:Z.3/determinant-surjective`

Every Pic class is the determinant of its own finite-projective class in K₀. In particular detHom is surjective.

Proof plan: Represent a Pic element by its existing invertible module. It is finite projective, and determinant-line identifies its determinant with the original Pic element.

Prerequisites: `KTheoryLowDegrees:Z.3/determinant-hom-of`, `KTheoryLowDegrees:Z.3/determinant-line`.

Acceptance: A nonprincipal invertible ideal remains visible under determinant.

Source: Kbook.II, Proposition 2.6, p.11. Use the actual invertible representative, not a set-theoretic dummy preimage.


### Gamma operations

`KTheoryLowDegrees:Z.3/gamma`

For x∈K₀(R), define γ⁰(x)=1 and, for n≥1, γⁿ(x)=λⁿ(x+(n−1)[R]). Equivalently γₜ(x)=λ_{t/(1−t)}(x); the substitution is formal and integral.

Proof plan: Use coefficient extraction of the substituted power series, or the displayed shifted-coefficient expression. The equivalence of these descriptions is a separate lemma.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda`.

API:

- `TauCeti.RingK0.gamma_zero`: γ⁰(x)=1.
- `TauCeti.RingK0.gamma_one`: γ¹(x)=x.
- `TauCeti.RingK0.gamma_two`: γ²(x)=λ²(x)+x.

Tests:

- `TauCeti.RingK0.gamma_unit_test`: γⁿ([R])=[R] for every n≥0.
- `TauCeti.RingK0.gamma_neg_unit_test`: γ²(−[R])=0 whereas λ²(−[R])=[R].
- `TauCeti.RingK0.gamma_zero_class_test`: γⁿ(0)=0 for every positive n.

Uses: KTheoryLowDegrees:Z.3 — Weighted products on rank-zero classes define the algebraic γ-filtration.; SchemeKTheoryOperations:S.7 — Supplies the early ring normalization to which the later geometric filtration must restrict..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, Formula 4.5, p.29. The shift uses virtual addition, and is not λⁿ(x) without the shift.


### Gamma substitution identity

`KTheoryLowDegrees:Z.3/gamma-series`

For every n≥1, γⁿ(x)=Σ_{j=1}ⁿ choose(n−1,j−1)λʲ(x). Thus Σγⁿ(x)tⁿ=λ_{t/(1−t)}(x).

Proof plan: Expand λⁿ(x+(n−1)) by lambda-add and use lambda-free on the integer summand. The j=0 term vanishes and the remaining binomial coefficients are choose(n−1,j−1). These are exactly the coefficients of (t/(1−t))ʲ.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma`, `KTheoryLowDegrees:Z.3/lambda-add`, `KTheoryLowDegrees:Z.3/lambda-free`, `KTheoryLowDegrees:Z.3/lambda-zero`.

Acceptance: For n=2 this recovers γ²(x)=λ²(x)+x.

Source: Kbook.II, Formula 4.5, p.29. Expanded finite-sum form makes the formal substitution explicit.


### First gamma operation

`KTheoryLowDegrees:Z.3/gamma-one`

γ¹(x)=x.

Proof plan: The shift is zero in degree one. Apply lambda-one.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma`, `KTheoryLowDegrees:Z.3/lambda-one`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, γ-operations, p.29. The first operation fixes the first filtration step.


### Gamma convolution

`KTheoryLowDegrees:Z.3/gamma-add`

For all n≥0 and x,y∈K₀(R), γⁿ(x+y)=Σ_{i=0}ⁿγⁱ(x)γⁿ⁻ⁱ(y).

Proof plan: Substitution t↦t/(1−t) preserves multiplication of power series because the substituted series has zero constant term. Apply the additive-to-multiplicative property of lambdaTotal and take coefficients. The degree-zero case uses λ⁰=1.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma-series`, `KTheoryLowDegrees:Z.3/total-lambda`, `KTheoryLowDegrees:Z.3/lambda-zero`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, γ-operations, p.29. No special-λ identity is needed for the additive convolution.


### Augmentation ideal

`KTheoryLowDegrees:Z.3/augmentation`

Let ρ:K₀(R)→H⁰(Spec R,ℤ) be the virtual rank ring homomorphism supplied by Z.2, normalized by ρ([P])(p)=rankAtStalk(P,p). Define I_R=ker ρ as an ideal of the existing K₀ ring.

Proof plan: Take the kernel ideal of the specified ring homomorphism. Keep its locally constant function target; neither connectedness nor a single global integer rank is assumed.

Prerequisites: `KTheoryLowDegrees:Z.3/finite-projective-monoidal`, `KTheoryLowDegrees:Z.2`.

API:

- `TauCeti.RingK0.mem_augmentation`: x belongs to I_R exactly when its virtual rank function is zero.
- `TauCeti.RingK0.augmentation_map_zero`: Every element of the kernel ideal has zero rank function.

Tests:

- `TauCeti.RingK0.augmentation_zero_test`: The zero virtual class belongs to the augmentation ideal.
- `TauCeti.RingK0.augmentation_unit_test`: For a nonzero ring R the unit [R] does not belong to the augmentation ideal.
- `TauCeti.RingK0.augmentation_line_test`: For every invertible module L, [L]−[R] belongs to the augmentation ideal, by the Z.2 rank-one normalization.

Uses: KTheoryLowDegrees:Z.3; Weibel II4.5–4.7 — Only rank-zero classes are allowed as inputs of the weighted γ-generators.; SchemeKTheoryOperations:S.7 — The affine degree-zero rank filtration must use the same ideal..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §2.3, p.8, and §4, p.30. The rank kernel is the augmentation ideal used by the γ-filtration.


### Rank-zero membership

`KTheoryLowDegrees:Z.3/augmentation-membership`

x∈I_R if and only if ρ(x)=0 in H⁰(Spec R,ℤ).

Proof plan: Unfold the kernel ideal.

Prerequisites: `KTheoryLowDegrees:Z.3/augmentation`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §2.3, p.8. The kernel membership formula.


### Rank of virtual exterior coefficients

`KTheoryLowDegrees:Z.3/rank-lambda`

At every prime p and for every virtual class x and n≥0, ρ(λⁿx)(p)=choose(ρ(x)(p),n), with the integral generalized binomial coefficient for an integer upper argument.

Proof plan: For an actual projective class, localize at p and use the free exterior basis and the normalized virtual rank map. Apply ρ coefficientwise to lambdaTotal. The object-level identity says the resulting series is (1+t) raised to the local rank. Multiplication and inversion extend this identity from positive projectives to virtual differences, giving generalized integer binomial coefficients; no rationalization of K₀ is involved.

Prerequisites: `KTheoryLowDegrees:Z.3/lambda-of`, `KTheoryLowDegrees:Z.3/exterior-base-change`, `mathlib:exteriorPower.finrank_eq`, `KTheoryLowDegrees:Z.3/total-lambda`, `KTheoryLowDegrees:Z.2`, `mathlib:Ring.choose`.

Acceptance: At local rank −1, the coefficient rank is (−1)ⁿ. At local rank zero, every positive exterior coefficient has rank zero.

Source: Kbook.II, Example 4.1.2, p.25. Extends the source rank compatibility to virtual coefficients via its group-completion argument.


### Positive gamma coefficients have rank zero

`KTheoryLowDegrees:Z.3/gamma-rank-zero`

If x∈I_R and n>0, then γⁿ(x)∈I_R.

Proof plan: At every prime, the rank of x+(n−1) is n−1. By rank-lambda the n-th coefficient has rank choose(n−1,n)=0. Use extensionality of the rank function and augmentation-membership.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma`, `KTheoryLowDegrees:Z.3/rank-lambda`, `KTheoryLowDegrees:Z.3/augmentation-membership`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, γ-filtration, p.30. Explains why weighted γ-generators stay inside the rank kernel.


### Weighted gamma filtration

`KTheoryLowDegrees:Z.3/gamma-filtration`

For n≥0, define Fⁿ_γK₀(R) to be the ideal generated by finite products ∏_{j=1}ᵐγ^{k_j}(x_j), where x_j∈I_R, k_j≥1, and Σk_j≥n. Allow the empty product, which occurs only when n=0 and gives F⁰=K₀. This uniform formula also gives F¹=I_R. This is the ideal-generated version; agreement with the source additive-subgroup filtration is an explicit proof gap.

Proof plan: Use the existing ideal span of the specified set of finite weighted products. The generator data consist of a finite index set, positive natural degrees and elements of the actual augmentation ideal.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma`, `KTheoryLowDegrees:Z.3/augmentation`.

API:

- `TauCeti.RingK0.gamma_generator_mem`: A weighted product with total weight at least n belongs to Fⁿ_γ.
- `TauCeti.RingK0.gammaFiltration_antitone`: Fⁿ⁺¹_γ⊆Fⁿ_γ for all n≥0.

Tests:

- `TauCeti.RingK0.gammaFiltration_zero_test`: F⁰_γ is the unit ideal, using the empty product.
- `TauCeti.RingK0.gammaFiltration_weight_two_test`: γ²(x) lies in F²_γ for rank-zero x; weight is not merely factor count.
- `TauCeti.RingK0.gammaFiltration_product_test`: For rank-zero x,y the product xy belongs to F²_γ.

Uses: KTheoryLowDegrees:Z.3 — The first two steps are compared to rank and determinant kernels.; SchemeKTheoryOperations:S.7 — Higher geometric/Chow comparisons consume this algebraic normalization..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, γ-filtration definition, p.30. The weights are the operation degrees, not the number of factors. The source uses additive subgroup generation. The ideal-span comparison remains open and is not asserted here.


### Membership of a weighted generator

`KTheoryLowDegrees:Z.3/gamma-filtration-generators`

Every defining weighted product with total degree at least n belongs to Fⁿ_γ.

Proof plan: Apply the existing subset-of-ideal-span inclusion to the displayed witness.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma-filtration`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, γ-filtration definition, p.30. The generator inclusion used for the filtration computations.


### Zeroth filtration ideal

`KTheoryLowDegrees:Z.3/gamma-filtration-zero`

F⁰_γ=K₀(R).

Proof plan: The empty product is 1 and its empty total weight is 0. An ideal containing 1 is the whole ring.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma-filtration-generators`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, §4, γ-filtration definition, p.30. The empty-generator convention.


### First filtration ideal

`KTheoryLowDegrees:Z.3/gamma-filtration-one`

For the normalized virtual rank map, F¹_γ=I_R.

Proof plan: A positive-weight product has at least one factor, and every positive γ-coefficient of a rank-zero class belongs to I_R by gamma-rank-zero. The ideal-span universal property gives F¹_γ⊆I_R. For x∈I_R, the one-factor product γ¹(x)=x is a weight-one generator, giving the reverse inclusion.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma-filtration`, `KTheoryLowDegrees:Z.3/gamma-rank-zero`, `KTheoryLowDegrees:Z.3/gamma-one`, `KTheoryLowDegrees:Z.3/gamma-filtration-generators`.

Acceptance: Over a field, the normalized rank map is an isomorphism and F¹_γ=0.

Source: Kbook.II, §4, γ-filtration definition, p.30. The uniform weighted-product definition agrees with the source first step.


### Multiplicativity of the gamma filtration

`KTheoryLowDegrees:Z.3/gamma-filtration-mul`

For all i,j≥0, Fⁱ_γ Fʲ_γ⊆Fⁱ⁺ʲ_γ.

Proof plan: A product of defining generators is represented by concatenating their finite index sets. Their positive degrees add, so its total weight is at least i+j. Extend from generators using multiplication of ideal spans and distributivity.

Prerequisites: `KTheoryLowDegrees:Z.3/gamma-filtration`, `KTheoryLowDegrees:Z.3/gamma-filtration-generators`.

Acceptance: In particular I_R²⊆F²_γ after gammaFiltration_one.

Source: Kbook.II, §4, after the γ-filtration definition, p.30. The proof needs no splitting principle.


### Dual base change for finite projectives

`KTheoryLowDegrees:Z.3/projective-dual-base-change`

For every commutative R-algebra S and finite projective M, there is an S-linear equivalence S⊗RHom_R(M,R) ≅ Hom_S(S⊗RM,S), taking s⊗f to the functional t⊗m ↦ st f(m).

Proof plan: Commute the tensor factors and apply the existing dualTensorHomEquiv with N=S. This gives an R-linear equivalence with Hom_R(M,S). Use the scalar-extension adjunction to identify Hom_R(M,S) with Hom_S(S⊗RM,S). The displayed pure-tensor formula shows that the composite and its inverse respect the S-action. The formula also proves compatibility with dual evaluation, which is the precise local input to the top-exterior determinant proof.

Prerequisites: `mathlib:dualTensorHomEquiv`.

Acceptance: For M=R the comparison is the ordinary scalar multiplication functional. No flatness hypothesis on R→S is imposed.

Source: Kbook.I, §3, p.15, dual and tensor closure; p.16, determinant. The finite-projective base-change comparison extends the pinned dualTensorHomEquiv; the finite-free-only dual base-change theorem does not suffice on its own.


### Exterior powers above local rank vanish

`KTheoryLowDegrees:Z.3/exterior-above-rank`

For finite projective M and n≥0, if rankAtStalk(M,p)<n for every prime p, then ΛⁿM is the zero module.

Proof plan: Localize at a maximal ideal. The Z.2 local-freeness interface and exterior-base-change identify the localization with the exterior power of a finite free module of rank below n. Its exterior basis has no n-element subsets, so it is the zero module. Apply the pinned local zero-module criterion.

Prerequisites: `KTheoryLowDegrees:Z.3/exterior-base-change`, `mathlib:exteriorPower.finrank_eq`, `mathlib:exteriorPower.instFree`, `mathlib:Module.subsingleton_of_localization_maximal`, `KTheoryLowDegrees:Z.2`.

Acceptance: For a rank-one line L, Λ²L=0. The strict inequality is necessary: Λ⁰0=R for a nonzero ring.

Source: Kbook.II, Proposition 2.6 proof, p.11. The vanishing step is made explicit with its local-rank hypothesis.


## KTheoryLowDegrees:Z.4


### Coprime representative of an ideal class

`KTheoryLowDegrees:Z.4/coprime-ideal-representative`

For nonzero ideals I,J in a Dedekind domain, there is a nonzero integral ideal J′ coprime to I and R-linearly isomorphic to J.

Proof plan: If I=R, use J itself. Otherwise apply the pinned fractional-ideal theorem exists_add_spanSingleton_mul_eq to a=I, b=J and c=R. It gives I+αJ=R inside Frac(R). The equality implies αJ⊆R. Pull this submodule back along the injective algebra map to obtain an integral ideal J′. The same equality gives I+J′=R. Since I≠R, α cannot be zero. Multiplication by α is an R-linear equivalence from J to J′: the baseline mem_singleton_mul gives its surjectivity, and cancellation in the fraction field gives injectivity. Thus J′ is nonzero. This proof uses the existing general fractional-ideal approximation theorem and requires no new CRT or valuation-support machinery.

Prerequisites: `mathlib:IsDedekindDomain.exists_add_spanSingleton_mul_eq`, `mathlib:FractionalIdeal.mem_singleton_mul`.

Acceptance: When I=R, J itself is a valid representative. The representative is required to remain nonzero.

Source: Cohen, Corollary 1.2.11, printed p.5; Lemma 1.2.20 proof, p.9. Preserves the isomorphism class while obtaining coprimality.


### The coprime ideal sum identity

`KTheoryLowDegrees:Z.4/coprime-ideal-sum`

For coprime ideals I,J of any commutative ring, I⊕J ≅ R⊕IJ. The map to the first factor is (x,y)↦x+y.

Proof plan: Choose i∈I,j∈J with i+j=1. The sum map f:I⊕J→R has the explicit section r↦(ri,rj). Its kernel is identified with I∩J by z↦(z,−z). The inverse splitting sends v to (f(v),v−section(f(v))). Use the pinned equality I∩J=IJ to obtain the displayed isomorphism. This argument does not need Dedekind hypotheses.

Prerequisites: `mathlib:Ideal.isCoprime_iff_exists`, `mathlib:Ideal.mul_eq_inf_of_isCoprime`, `mathlib:LinearMap.exists_rightInverse_of_surjective`.

Acceptance: I=R,J=0 gives R⊕0≅R⊕0. For I=2ℤ and J=3ℤ the kernel is identified with 6ℤ.

Source: Cohen, Lemma 1.2.20 proof, printed p.9. The constructive split-kernel argument.


### The two-ideal Steinitz identity

`KTheoryLowDegrees:Z.4/ideal-sum`

For nonzero ideals I,J of a Dedekind domain R, I⊕J ≅ R⊕IJ.

Proof plan: Choose a coprime J′ and an R-linear equivalence J≅J′. Apply coprime-ideal-sum to I,J′. Identify each nonzero integral ideal with its image in Frac(R) along the injective algebra map. FractionalIdeal.mk0 and unitsMulEquivSubmodule make those images invertible submodules. The pinned tensorEquivMul identifies I⊗J with IJ and I⊗J′ with IJ′. Tensor the given equivalence by I and compose these comparisons. This supplies IJ≅IJ′ for an arbitrary module equivalence; no chosen scalar witness is required.

Prerequisites: `KTheoryLowDegrees:Z.4/coprime-ideal-representative`, `KTheoryLowDegrees:Z.4/coprime-ideal-sum`, `mathlib:FractionalIdeal.mk0`, `mathlib:FractionalIdeal.unitsMulEquivSubmodule`, `mathlib:Submodule.tensorEquivMul`.

Acceptance: For J=R this reduces to swapping the two summands. For a nonprincipal ideal I, I⊕I⁻¹ is free of rank two after using fractional-ideal representatives.

Source: Cohen, Lemma 1.2.20, printed p.9. The required rank-two identity, with nonzero ideal hypotheses.


### Decomposition into invertible ideals

`KTheoryLowDegrees:Z.4/projective-ideal-summands`

Every finite projective P over a Dedekind domain is isomorphic to a finite direct sum of nonzero integral ideals; the empty sum is allowed and represents P=0.

Proof plan: Use the pinned Module.Finite.exists_comp_eq_id_of_projective presentation to embed P in R^N. Induct on N, using the projection onto one coordinate. If the projection image is zero, P embeds in R^(N−1). Otherwise its image is a nonzero integral ideal I. This ideal is finite and torsion-free, hence projective by the three pinned baseline facts. Split P→I. The kernel embeds in R^(N−1) and is a direct summand of P, hence finite projective. Apply the induction hypothesis to the kernel and append I. No Bass cancellation theorem is used.

Prerequisites: `mathlib:Module.Finite.exists_comp_eq_id_of_projective`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.finitePresentation_of_finite`, `mathlib:Module.Flat.projective_of_finitePresentation`, `mathlib:LinearMap.exists_rightInverse_of_surjective`.

Acceptance: The zero module has n=0, with no artificial nonzero ideal. A nonzero invertible ideal itself gives a one-summand decomposition.

Source: Kbook.I, §3, Dedekind-domain discussion, p.18. Projective ideal summands obtained by coordinate projection and splitting.


### Steinitz classification of projectives

`KTheoryLowDegrees:Z.4/steinitz`

Every finite projective P over a Dedekind domain is either zero or isomorphic to Rⁿ⊕I for some n≥0 and a nonzero invertible ideal I. Its positive rank is n+1. The ideal class of I is determined by det(P).

Proof plan: Start with projective-ideal-summands. If the family is empty the module is zero. For a nonempty family, repeatedly apply ideal-sum to combine the ideal factors while producing one additional copy of R. Apply the already specified determinant formulas to identify the resulting ideal class. The rank is obtained after extending to the fraction field, where each nonzero ideal becomes a one-dimensional vector space.

Prerequisites: `KTheoryLowDegrees:Z.4/projective-ideal-summands`, `KTheoryLowDegrees:Z.4/ideal-sum`, `KTheoryLowDegrees:Z.3/determinant-sum`, `KTheoryLowDegrees:Z.3/determinant-line`, `KTheoryLowDegrees:Z.3/determinant-free`.

Acceptance: The first disjunct handles the actual zero module. A rank-one nonprincipal ideal lies in the n=0 positive-rank case and is not declared free.

Source: Cohen, Theorem 1.2.19 and proof, printed pp.9–10; Corollary 1.2.24, p.11. State positive rank separately; the proof explicitly handles rank zero before the inductive step.


### Additive class formula for tensor products of lines

`KTheoryLowDegrees:Z.4/line-class-product`

Over a Dedekind domain, [L⊗M]=[L]+[M]−[R] for all invertible modules L,M. Equivalently, the product of the two reduced classes [L]−1 and [M]−1 is zero.

Proof plan: Represent L,M by nonzero integral ideals, using the pinned invertible-module-to-ideal comparison. Transport ideal-sum to L⊕M≅R⊕(L⊗M). Apply the existing biproduct and tensor class relations and rearrange. The equivalent reduced-product formula follows by distributivity.

Prerequisites: `KTheoryLowDegrees:Z.4/ideal-sum`, `mathlib:Module.Invertible.exists_linearEquiv_ideal`, `mathlib:Submodule.tensorEquivMul`, `mathlib:FractionalIdeal.unitsMulEquivSubmodule`, `mathlib:FractionalIdeal.mk0`, `mathlib:CommRing.Pic.mul_eq_tensor`, `tauceti:TauCeti.SplitK0.of_congr`, `tauceti:TauCeti.SplitK0.of_biprod`, `tauceti:TauCeti.SplitK0.of_mul_of`.

Acceptance: L=M=1 gives [R]=[R]+[R]−[R]. A nontrivial line class can have nonzero reduction while its reduced square is zero.

Source: Kbook.II, Corollaries 2.6.2–2.6.3, p.11. Dedekind specialization proved by the concrete ideal identity, without importing the full dimension-one theorem.


### Rank and determinant normal form

`KTheoryLowDegrees:Z.4/projective-class-normal-form`

For a finite projective P over a Dedekind domain, [P]=(rank P−1)[R]+[det P], including P=0. Here rank is the fraction-field rank, extended additively to K₀.

Proof plan: In the zero case rank(P)=0 and det(P)=1, so the expression is −[R]+[R]=0. In the positive case Steinitz gives P≅Rⁿ⊕I. The biproduct relation gives [P]=n[R]+[I]. The rank normalization gives rank(P)=n+1, and the determinant formulas identify the Pic class of I with det(P). Use mk_eq_mk_iff to transport the module class.

Prerequisites: `KTheoryLowDegrees:Z.4/steinitz`, `KTheoryLowDegrees:Z.3/determinant-free`, `KTheoryLowDegrees:Z.3/determinant-line`, `KTheoryLowDegrees:Z.3/determinant-sum`, `mathlib:CommRing.Pic.mk_eq_mk_iff`, `tauceti:TauCeti.SplitK0.of_biprod`, `KTheoryLowDegrees:Z.2`.

Acceptance: For P=0 the integer coefficient is −1 and the line contribution is +1. For a rank-one nonprincipal ideal I the formula is [I]=[I], not [I]=1.

Source: Kbook.II, Corollary 2.6.3, p.11. Explicit inverse formula for the Dedekind special case.


### Rank and Picard group classification

`KTheoryLowDegrees:Z.4/rank-pic-equivalence`

For a Dedekind domain R, rank and determinant give an additive equivalence K₀(R) ≃ ℤ⊕Pic(R). Pic is written multiplicatively. The inverse sends (n,L) to (n−1)[R]+[L], for every integer n, including negative n.

Proof plan: Combine the normalized rank and determinant homomorphisms. Define the inverse by (n,L)↦(n−1)[R]+[L]. line-class-product proves its additivity; normalized rank and determinant-line prove that the forward composite is the identity. The reverse composite is an additive endomorphism of K₀. projective-class-normal-form proves the identity on every object class, and the existing universal property proves it globally.

Prerequisites: `KTheoryLowDegrees:Z.4/line-class-product`, `KTheoryLowDegrees:Z.4/projective-class-normal-form`, `KTheoryLowDegrees:Z.3/determinant-hom`, `KTheoryLowDegrees:Z.3/determinant-hom-of`, `KTheoryLowDegrees:Z.3/determinant-line`, `tauceti:TauCeti.SplitK0.liftEquiv`, `KTheoryLowDegrees:Z.2`.

API:

- `TauCeti.RingK0.rankPicEquiv_apply`: The forward map is x↦(rank x,det x).
- `TauCeti.RingK0.rankPicEquiv_symm`: The inverse is (n,L)↦(n−1)[R]+[L] for all n∈ℤ.
- `TauCeti.RingK0.rankPicEquiv_ext`: Two virtual classes agree exactly when their ranks and determinants agree.

Tests:

- `TauCeti.RingK0.rankPic_zero_test`: The zero virtual class has coordinates (0,1).
- `TauCeti.RingK0.rankPic_negative_test`: The coordinate (−1,1) maps to −[R].
- `TauCeti.RingK0.rankPic_nontrivial_test`: For L≠1 in Pic(R), the rank-zero class [L]−[R] is nonzero.

Uses: KTheoryLowDegrees:Z.4, Weibel II2.6.3 — Computes the group with an explicit inverse and retains its ideal-class coordinate.; KTheoryLowDegrees:Z.6 — Supplies nonprincipal-ideal and fraction-field comparison tests..

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, Corollary 2.6.3, p.11. Dedekind domains have connected spectrum, so H⁰ is ℤ.


### Coordinates of a virtual class

`KTheoryLowDegrees:Z.4/rank-pic-apply`

The rank/Pic equivalence sends x to (rank x,det x).

Proof plan: Unfold the specified equivalence and its inverse.

Prerequisites: `KTheoryLowDegrees:Z.4/rank-pic-equivalence`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, Corollary 2.6.3, p.11. Evaluation formula of the explicit equivalence.


### Inverse rank/Pic coordinates

`KTheoryLowDegrees:Z.4/rank-pic-inverse`

The inverse equivalence sends (n,L) to (n−1)[R]+[L], with n an arbitrary integer.

Proof plan: Unfold the specified equivalence and its inverse.

Prerequisites: `KTheoryLowDegrees:Z.4/rank-pic-equivalence`.

Acceptance: The statement retains the displayed hypotheses and the actual module/K₀ carriers.

Source: Kbook.II, Corollary 2.6.3, p.11. Evaluation formula of the explicit equivalence.


## KTheoryLowDegrees:Z.5

Source and ownership research has begun. Declaration decomposition for this layer is incomplete; the continuation requirements below retain its full scope.


## KTheoryLowDegrees:Z.6

Source and ownership research has begun. Declaration decomposition for this layer is incomplete; the continuation requirements below retain its full scope.


## Coverage and precise continuation requirements


### KTheoryLowDegrees:Z.3

- Prove that the ideal-span gamma filtration equals the source additive-subgroup filtration, including disconnected rank; the checkpoint only proves F⁰, F¹ and multiplicativity for its explicitly defined ideal span.
- Construct the canonical exterior filtration of an extension, with associated graded ΛⁱP⊗Λⁿ⁻ⁱQ; the present direct-sum equivalence alone does not provide the functorial nonsplit sheaf construction.
- Decompose scalar-extension naturality of lambda and determinant, determinant tensor/exterior identities, and F²_gamma=ker(rank,det).
- Resolve the noncircular splitting-principle supplier for special-lambda product/iteration polynomials, then give its declarations and the integral Newton-recursion Adams normalization. Higher operations remain owned by S.6–S.7.

### KTheoryLowDegrees:Z.4

- Add the rank/Pic multiplication law (m,L)(n,M)=(mn,L^n M^m) and the explicit comparison with the pinned ClassGroup.equivPic; the additive classification is already decomposed.
- Decompose actual localization, its class-group quotient by inverted prime classes, the number-field S-integer ring identification, and extension of number fields.
- Decompose the normalized norm and finite-flat restriction formula det_R(Res P)=Norm(det_S P)·det_R(S)^rank_S(P), including varying-rank hypotheses and the algebra determinant term.

### KTheoryLowDegrees:Z.5

- Instantiate the existing ExactK0 for actual finite locally free sheaves, with the genuine exact structure, and identify the supplier vector-bundle interface.
- Establish the precise global finite-resolution hypotheses for K/G comparison on a connected regular Noetherian curve, including the ample-family argument or an appropriately qualified replacement.
- Extend the upstream smooth proper/projective divisor/line dictionaries to the full general-curve scope; prove rank/determinant classification and structure, divisor and skyscraper class formulas. Import the origin-dependent elliptic Pic computation from E.2 only for the specialization.

### KTheoryLowDegrees:Z.6

- Import the generic pi0 comparison and prove equality of the actual maps on projectives and perfect-complex Euler classes; compare to the existing Cartan map.
- Give actual field, integer, product-of-two-fields and nonprincipal-ideal examples, rather than only conditional nontrivial-Pic tests.
- Import S.5 for P¹ and prove the rank/degree change of basis (r,d)↦(r+d,−d) relative to (1,O(−1)); import E.2 late for the elliptic origin-dependent test.

## Open proof inputs

Special-lambda splitting without a backward dependency: Weibel II8.8.1–8.8.3 uses the projective-bundle theorem II8.5 to prove an injective flag-bundle splitting map. Before adding the full special-lambda identities, identify an independently scheduled degree-zero prefix of SchemeKTheoryOperations:S.5 or decompose a separate algebraic proof. Do not add a coarse S.5→Z.3 request if it closes a cycle through early Z.3 operations.

General regular-curve resolution and divisor dictionary: The source and RS-18 boundary require more than the upstream smooth proper/projective curve APIs. A proof via an ample family from complements of affine opens still needs the exact locally Noetherian, separation and resolution-property hypotheses checked against a primary source. Regularity in arbitrary dimension alone does not supply global vector-bundle resolutions. No curve equivalence is asserted in this checkpoint.

Actual S-integer localization and transfer: The number-field S-integer localization needs a precise ring isomorphism and ideal-class quotient, using class-group finiteness where principal powers of S-primes are chosen. A valuation overring of an arbitrary Dedekind domain must not be silently identified with an element localization. The finite-flat determinant norm formula and its algebra-determinant factor still need declaration-level proof suppliers.

Agreement with the additive gamma filtration: The source defines additive subgroups generated by weighted gamma products. This checkpoint packages their ideal span so it can prove ideal multiplication directly. Show that the source additive subgroup is already stable under arbitrary K₀ coefficients, using the clopen rank/idempotent decomposition and compatibility of gamma with restriction to those components. For connected rank, write each coefficient as an integer plus a rank-zero class; for disconnected rank the component argument is essential. Until this comparison is decomposed, do not claim that the chosen ideal span is the source filtration.

Supplier `KTheoryLowDegrees:Z.2`: The existing finite-projective carrier with finite clopen rank fibres, their orthogonal-idempotent product decomposition, local freeness and the virtual ring homomorphism rank:K₀(R)→LocallyConstant(Spec R,ℤ), natural under scalar extension and normalized on every object class. Keep the early module inputs independent of Z.3 and higher K-theory. For a Dedekind domain, provide the integer-valued specialization normalized by fraction-field dimension.


## Corrections to the sources

`KTheoryLowDegrees/E1` — Kbook.I, September 2012 Chapter I, Exercise 3.8(b), p.25; compared with combined August 2013 draft, printed p.29/PDF p.37. With the single prime element s specified in (b), the final factor is ℤ. Every unit has a unique expression u s^m. The integer n occurs in part (a), which inverts n nonassociate primes, but is absent from the hypotheses of (b). Correction status: Corrected in the author-hosted 29 August 2013 combined draft, I Exercise 3.8(b), printed p.29: final factor ℤ..

`KTheoryLowDegrees/E2` — Kbook.II, September 2012 Chapter II, Proposition 2.6 proof, p.11; combined draft, printed p.74/PDF p.82. The summand must be (ΛⁱP)⊗(ΛʲQ), consistent with rank(P)=m, rank(Q)=n and the following i>m or j>n vanishing argument. For P=R and Q=0, m=1,n=0, the transposed summand indexed (0,1) is nonzero despite j>n. The corrected exterior direct-sum formula gives the claimed surviving term. Correction status: new.

`KTheoryLowDegrees/E3` — Kbook.II, September 2012 Chapter II, Proposition 4.9, p.32; combined draft printed p.97/PDF p.105. Replace the sign by (−1)^{k−1}. The last line of the printed proof gives precisely this correction. At k=1, λ¹ is the identity, whereas the displayed statement gives its negative on the associated graded. Correction status: new.

`KTheoryLowDegrees/E4` — Kbook.II, September 2012 Chapter II, Example 2.5.4, p.11. The author erratum locates the printed-edition correction at p.80 line 15. For a characteristic-zero field, the number n of simple factors need not equal the number c of conjugacy classes. Add the algebraically closed hypothesis to conclude n=c and K₀(k[G])≅ℤ^c. For k=ℚ and G=C₃, ℚ[G]≅ℚ×ℚ(ζ₃), so K₀ has rank two, whereas C₃ has three conjugacy classes. Correction status: Author K-book errata, p.80 line 15, explicitly replaces c by n and adds the algebraically closed hypothesis; verified in cached author errata text. Full PDF unavailable at the linked URL..

`KTheoryLowDegrees/E5` — Kbook.II, September 2012 Chapter II, Example 4.5.4, p.29; combined draft printed p.95/PDF p.103. For a commutative Noetherian ring of finite Krull dimension d, use rank at most d in the reduced projective representative. The asserted gamma-dimension bound at most d is unchanged. A Dedekind domain with a nonprincipal invertible ideal I has dimension one and a nonzero reduced class [I]−1 detected by determinant. Rank strictly below one would force the projective representative to be zero, contradicting that class. Correction status: new.

`KTheoryLowDegrees/E6` — Cohen, Author manuscript version 11 July 2001, Lemma 1.2.20 proof, printed p.9/PDF p.23. Require k≠0 when scaling a nonzero fractional ideal. For R=ℤ and I=ℤ, k=0 gives kI=0, which is not isomorphic to I. Every denominator-clearing scalar used in the proof can and must be chosen nonzero. Correction status: new.

`KTheoryLowDegrees/E7` — Kbook.II, September 2012 Chapter II, Theorem 4.10(2)–(3) and proof, p.32; same omission in combined draft printed p.98/PDF p.106. Restrict the single-Adams eigenspace description and its independence to integers k>1. The k=1 operation is the identity and cannot distinguish weights. Take the binomial lambda-ring K=ℤ. Its augmentation ideal is zero, so the weight-one associated graded is zero. The ψ¹-eigenspace for 1¹ is all ℚ, while the ψ²-eigenspace for 2¹ is zero. The proof also uses distinct numbers 1,k,k²,…, which fails at k=1. Correction status: new.

`KTheoryLowDegrees/E8` — Kbook-published, Combined author draft dated 29 August 2013, II4.11(CC1), printed p.98/PDF p.106. Use n>ε(p) in the dimension-vanishing axiom. A line bundle can have a nonzero first Chern class. With p a positive line element and n=1, the printed inequality would force every first Chern class to vanish. The top Chern class is allowed to be nonzero. Correction status: new.

`KTheoryLowDegrees/E9` — Kbook-published, Combined author draft dated 29 August 2013, Theorem II4.10 proof, printed p.98/PDF p.106. Use the minimal polynomial in the divisibility assertion; fix k>1 as in E7. An annihilating square-free product implies that the minimal polynomial divides that product and proves diagonalizability. It does not constrain eigenvalue multiplicities in the characteristic polynomial: for example, the identity on a two-dimensional space is annihilated by t−1 but has characteristic polynomial (t−1)². The source supplies no one-dimensionality assertion for its weight spaces, and diagonalizability needs only the minimal-polynomial conclusion. Correction status: new.

`KTheoryLowDegrees/E10` — Kbook.II, September 2012 Chapter II, Example 4.11.2, p.33. Use the convolution c_i(p+q)=Σ_{a+b=i} c_a(p)c_b(q). Only c₁ is additive in general. Extend the total Chern series multiplicatively to virtual classes. The displayed preceding axiom CC2 contains the missing mixed terms. For two copies of O(1) on projective 2-space, c₂(L⊕L)=c₁(L)² is nonzero while c₂(L)+c₂(L)=0. Correction status: new.

`KTheoryLowDegrees/E11` — Kbook.II, September 2012 Chapter II, Example 4.11.2, p.33. The rank-zero restriction is necessary for a torsion-kernel assertion about the total Chern class. A full K₀ comparison must retain rank as an additional coordinate. Any cokernel assertion must specify the multiplicative positive-degree target and its completion. Axiom CC0 makes c(n[R])=1 for every integer n. Already for the binomial lambda-ring K=ℤ, the total Chern map kills all of ℤ, so its kernel is not torsion. Correction status: new.

`KTheoryLowDegrees/E12` — Kbook.II, September 2012 Chapter II, Example 4.11.2, p.33, coefficient of c_n on weight n. For n≥1 the coefficient is (−1)^{n−1}(n−1)!. At weight one, the defining class c₁(x)=γ¹(x)=x in F¹/F² is the identity, whereas the printed coefficient is −1. Newton identities give the corrected sign in every positive weight. Correction status: new.

The source-issue records include the searches for prior corrections. The current Weibel errata PDF could not be fetched; only its indexed opening-page text was available. No finding is presented as independently reviewed.


## Sources and versions

- [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), Charles A. Weibel. Author-hosted September 2012 chapter PDF; page numbers are chapter-local. Compared with the author-hosted 29 August 2013 combined draft where indicated. Accessed 2026-09-24. SHA-256: `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76`.
- [The K-book, Chapter II: The Grothendieck group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), Charles A. Weibel. Author-hosted September 2012 chapter PDF; page numbers are chapter-local. Compared with the author-hosted 29 August 2013 combined draft where indicated. Accessed 2026-09-24. SHA-256: `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`.
- [Advanced Topics in Computational Number Theory](https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf), Henri Cohen. Author manuscript Advanced Computational Algebraic Number Theory, version 11 July 2001, hosted by the University of Toronto; corresponding to GTM 193. PDF page 15 starts printed page 1. Accessed 2026-09-24. SHA-256: `0b01c8f1755378c216c563c7d75e05edbf1c3a95843524f4ede6f0216a1cb159`.
- [The K-book: an introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Charles A. Weibel. Author-hosted combined draft dated 29 August 2013; not asserted identical to the printed edition. Accessed 2026-09-24. SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- [Algebraic K-theory of rings of integers, in Handbook of K-theory](https://www.maths.ed.ac.uk/~v1ranick/papers/handktheory.pdf), Charles A. Weibel. Handbook I.5, §5.2, printed pp.143–144; PDF pp.157–158. Accessed 2026-09-24. SHA-256: `688664d1309f053fae66a6616138a5ad7e486260ea478b625637c7c60db8e421`.
- [Errata et Addenda to the First Printing of Advanced Topics in Computational Number Theory](https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi), Henri Cohen. DVI headed 20000615 Version, three pages. Accessed 2026-09-24. SHA-256: `210e6dcbb0bbfc1c673c26fd73e6c1e45ab39b78202196813c06a1e624f3c350`.

The packet remains partial. No stage is closed, and every declaration retains implementationStatus unchecked. Signature elaboration validates the proposed types, not their unimplemented mathematical proofs.
