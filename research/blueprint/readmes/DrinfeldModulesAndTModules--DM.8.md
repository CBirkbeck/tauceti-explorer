# DM.8: rigid analytic motives, periods and Carlitz logarithms

This layer builds a reusable comparison between difference equations, their solution torsors and the Betti fibre functor of rigid analytically trivial motives. Its principal arithmetic result is the equality between the transcendence degree of an eligible period matrix at θ and the dimension of its motivic Galois group. Its Carlitz application says that a finite family of logarithms with algebraic exponentials, linearly independent over F_q(θ), is algebraically independent over the algebraic closure of that field.

The layer is planned at target level. The packet has 48 nodes: the nine fixed-vector results from the earlier checkpoint and 39 additional targets and necessary constructions. All mathematical statements below are specifications, not implemented results. Each of the eleven definition or construction nodes has an API derived from its uses and three tests. The accompanying [suggested file](../suggested/DrinfeldModulesAndTModules--DM.8.lean) gives native Lean forms for those definitions, their 43 API items and their 33 tests. It also retains twelve acceptance examples for the fixed-vector component. Supplier-dependent theorem signatures that cannot yet be stated are listed explicitly below.

The stage is **planned**, with three gaps and eight supplier requests; it is not closed. No result about algebraic independence for arbitrary higher-rank Drinfeld modules is asserted. The scope is the generic-characteristic Carlitz and dual-motive setting of Papanikolas, together with the shared difference-equation inputs used by the routed multizeta papers. Their specialized multizeta objects and independence theorems remain with their own owners.

## Fields, twists and coordinate conventions

Fix a prime p and q=p^m with m≥1. Let A=F_q[θ], k=F_q(θ), k̄ an algebraic closure of k, and k∞ the completion at infinity normalized by |θ|∞=q. The field C∞ is the completion of a chosen algebraic closure of k∞. These objects, their embeddings and the Carlitz exponential come from DM.2 and FA.0. The analytic variable t is independent of the coefficient θ. In particular, evaluation at θ specializes t; it does not identify the two variables throughout the difference equation.

Write σ for inverse coefficient q-Frobenius: σ(a)^q=a and σ(t)=t. The source notation f^(n) means the n-fold positive coefficient q-Frobenius for n>0, so σ(f)=f^(−1). Every field, polynomial, series and matrix map must preserve this distinction. An existing τ-motive interface cannot be used without the DM.4 dualization and convention reconciliation. No additional motive type is defined here.

Use T for the radius-one restricted-series ring in C∞[[t]], L for its fraction field, K=k̄(t), and F=F_q(t). The exact fixed field is F. Use E for the algebraic entire-series subring specified below, retaining the finite coefficient-extension condition over k∞. The broader ring of all analytic entire series is not silently substituted for E in the ABP criterion.

For a motive basis column m, the equation is σ(m)=Φm. A fundamental matrix satisfies σ(Ψ)=ΦΨ. Its columns describe the solution space of that vector equation. The motive's fixed basis is instead Ψ^−1m. This inversion is necessary for the functorial action and tensor comparison. The difference torsor uses D=Ψ_1^−1Ψ_2 and right multiplication. The notation C in the Carlitz targets denotes the rank-one Carlitz object; C∞ always denotes the coefficient field. We normalize its period by π̃=−1/Ω(θ), as in the chosen Papanikolas convention; other source normalizations must be transported through DM.2.

## Existing objects and ownership

Mathlib already supplies fixed submodules, submodule inclusions and their tensor base-change maps, formal and restricted power series, matrix units, generated subalgebras, intermediate fields, polynomial evaluation, ideals, Hopf algebras, algebraic independence and transcendence degree. The plan uses these objects directly. It introduces predicates and the specific solution/degree constructions, rather than parallel fixed-space, tensor, Tate-algebra or affine-group definitions.

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The 54 cited declaration statements were checked at those commits. In particular, Mathlib's algebraic separability class forces an extension to be algebraic. The general separability required for L/K is expressed by its geometric-reducedness class, with the field-theoretic equivalence and p-basis criterion requested from FA.0. For finite-type groups, Tau Ceti supplies the implication from geometric reducedness to smoothness of the native commutative Hopf algebra. There is no corresponding assertion for arbitrary schemes.

Current TauCetiRoadmap main 070dc2becd74419e76303ede84b465ed4a69461f and current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were inspected read-only. Current Tate Gauss-norm and completeness work in the MvPowerSeries/TateAlgebra library postdates the pin and is existing work, not a construction to plan again. AdicSpaces owns general preparation; JacobianChallenge owns the curve Riemann–Roch interface. Current ReductiveGroupsPartII RG2.3.7 and its Lang.lang_surjective signature own the general finite-field Lang theorem. This layer needs only its GL_r coefficient-Frobenius specialization and transport. The current GrothendieckEulerForms and JacobianChallenge readers were read in full as models for the interfaces and target density.

DM.4 owns dual Anderson motives, pre-t-motives, rationalization and the abelian tensor category. MC.6 owns arbitrary-field neutral Tannakian reconstruction and tensor-generation machinery. The needed base field F_q(t) is imperfect of positive characteristic: the characteristic-zero MC.3 interface is insufficient. Existing Hopf-comodule reconstruction begins with a given Hopf algebra and does not itself construct the group of an arbitrary neutral category. DM.8 owns the rigid-triviality predicate, its Betti comparison, the particular difference torsor, the comparison with the supplied motivic group and the arithmetic specialization theorem.

## The target dependency chain

The construction proceeds from the analytic constant field and native fixed-vector descent to the Betti comparison. Exactness and tensor compatibility give the actual rigid-trivial neutral category. Independently, an admissible difference equation gives its solution ring and comparison algebra. Ideal descent, simplicity and the three-factor cocycle give a group scheme and torsor. Relative algebraic closure and general separability give geometric integrality, the group smoothness theorem and its dimension. The invariant-field and subobject arguments identify this group with the motivic one. ABP then lifts specialized linear relations; bounded monomial spans turn that linear statement into equality of transcendence degrees. The Carlitz logarithm extension has a scalar-action kernel, whose linear equations identify Galois dimension with the dimension of a k-linear logarithm span.

This ordering keeps the two ideal-descent results separate. Descent over the ambient field is used to prove solution-ring simplicity. Descent over the solution ring is proved after simplicity and is then used for the torsor. The source's arguments are not encoded as a circular single declaration.

## Native fixed-vector descent

The nine inherited statements are retained with their ids and their native mathematical content. Here F⊂L are arbitrary fields, V is an L-vector space, σ is an F-algebra automorphism of L with exact fixed field F, and f is F-linear with f(av)=σ(a)f(v). The distinction between exact constants and a merely fixed subfield is visible already in the real/complex examples. Finite-dimensionality is assumed over L only where stated; it is not imposed over F on the ambient space.

### Coefficients of a fixed linear combination

Target `fixed-coefficients` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.fixed_coefficients`.

For a finite index type I, let v_i∈V be fixed by f and L-linearly independent. If c_i∈L and the vector Σ_i c_i·v_i is fixed by f, then σ(c_i)=c_i for every i. Equality of the constant field with F is not needed for this lemma.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.

Proof route: Apply f to the finite sum and use additivity, semilinearity and fixedness of each v_i to get Σ_i σ(c_i)·v_i=Σ_i c_i·v_i. Subtract the two sums. Apply the finite-relation criterion for L-linear independence to the coefficients σ(c_i)−c_i.

Sources: PAP-v2, Lemma 3.3.7, pp.12–13.

Direct inputs: `mathlib:linearIndependent_iff'`.

Acceptance: With the singleton vector 1 in C and conjugation, a fixed coefficient is real. The empty family gives a vacuous conclusion. Independence is necessary: with two copies of 1, the zero combination i·1+(−i)·1 is fixed although neither coefficient is fixed.

### Descent of the span of an independent fixed family

Target `fixed-span-descent` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.fixed_mem_span_iff`.

Assume exact constants. For a finite L-linearly independent family v_i fixed by f and a fixed vector w, w lies in the L-span of the v_i if and only if it lies in their F-span.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

Proof route: For the forward implication use Submodule.mem_span_range_iff_exists_fun to choose L-coefficients of w. The fixed-coefficients lemma makes each coefficient σ-fixed. Use exact constants to choose coefficients in F. Scalar-tower compatibility turns the same finite sum into an F-linear expression for w. For the reverse implication, map the F-coefficients into L and use scalar-tower compatibility.

Sources: PAP-v2, Lemma 3.3.7, pp.12–13.

Direct inputs: `fixed-coefficients`, `mathlib:Submodule.mem_span_range_iff_exists_fun`.

Acceptance: Conjugation on C with the singleton family 1 gives precisely the real axis. With the empty family, a fixed w belongs to either span exactly when w=0. For σ=id on C with F=R and v=1, w=i is fixed and in the C-span but outside the R-span, demonstrating the exact-constants requirement.

### Independence descent for finite fixed families

Target `finite-fixed-independence` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.linearIndependent_fin_of_fixed`.

Assume exact constants. If v:Fin(n)→V is F-linearly independent and each v_i is fixed by f, then v is L-linearly independent, for every n≥0.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

Proof route: Induct on n. The empty family has no nonzero relation. Use linearIndependent_finSucc over F to separate the tail and its first vector. By induction the fixed tail is L-linearly independent. If the first vector were in the L-span of the tail, fixed-span descent would put it in the F-span, contradicting the F-independence criterion. Apply linearIndependent_finSucc over L.

Sources: PAP-v2, Lemma 3.3.7, pp.12–13.

Direct inputs: `fixed-span-descent`, `mathlib:linearIndependent_finSucc`.

Acceptance: n=0 and n=1 are included; in the singleton case independence means the vector is nonzero. The pair (1,1) over Q is rejected at the independence premise. The R-independent pair (1,i) is not a fixed family for conjugation, and must not pass as a C-independent family.

### Linear independence of fixed vectors

Target `fixed-independence` (theorem); proposed declaration `TauCeti.Difference.FixedVectors.linearIndependent_of_fixed`.

Assume exact constants. For any index type I, an F-linearly independent family v:I→V whose members satisfy f(v_i)=v_i is L-linearly independent.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

Proof route: Use linearIndependent_iff_finset_linearIndependent to reduce the conclusion to an arbitrary finite subfamily. Restrict F-independence and fixedness to it. Reindex that finite set by Fin(card) and apply finite-fixed-independence. Transport independence back along the bijection.

Sources: PAP-v2, Lemma 3.3.7, pp.12–13.

Direct inputs: `finite-fixed-independence`, `mathlib:linearIndependent_iff_finset_linearIndependent`.

Acceptance: The theorem has no finite-dimensional hypothesis on V and no finite-order hypothesis on σ. Exact constants and the fixed-vector premise are independently necessary: σ=id on C fails the former for F=R; conjugation fixes the latter field but not i. The theorem supplies independence of an arbitrary F-basis of the fixed submodule before its finiteness is known.

### Injectivity of the Betti comparison map

Target `betti-comparison-injective` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.bettiComparison_injective`.

Assume exact constants. Set W=f.fixedSubmodule, using the native F-submodule. The native L-linear map κ=(W.subtype).liftBaseChange L:L⊗_F W→V, given by κ(a⊗w)=a·w, is injective. No finite-dimensional hypothesis is required.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

Proof route: Choose an F-basis b of W using Module.Free.chooseBasis. Its image in V is F-linearly independent by the native injective inclusion and LinearIndependent.map'. Every image vector is fixed. Apply fixed-independence to conclude that the image family is L-linearly independent. Use the native scalar-extended basis b.baseChange L of L⊗_F W. Its i-th vector is 1⊗b_i, whose κ-image is the same image vector. Identify κ with the linear map prescribed on that basis and apply Module.Basis.injective_constr_of_linearIndependent.

Sources: PAP-v2, Lemma 3.3.7 and Proposition 3.3.8, pp.12–13.

Direct inputs: `fixed-independence`, `mathlib:LinearMap.fixedSubmodule`, `mathlib:LinearMap.mem_fixedSubmodule_iff`, `mathlib:Submodule.subtype`, `mathlib:Submodule.subtype_injective`, `mathlib:LinearIndependent.map'`, `mathlib:Module.Free.chooseBasis`, `mathlib:Module.Basis.linearIndependent`, `mathlib:Module.Basis.baseChange`, `mathlib:Module.Basis.baseChange_apply`, `mathlib:LinearMap.liftBaseChangeEquiv`, `mathlib:LinearMap.liftBaseChange_tmul`, `mathlib:Module.Basis.injective_constr_of_linearIndependent`.

Acceptance: For conjugation on C the map C⊗_R R→C is bijective. For f=2·id on Q the fixed space is zero and κ is injective but not surjective. For the zero vector space κ is the map between zero spaces.

### Finite dimensionality of the fixed submodule

Target `fixed-space-finite` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.finite_fixedSubmodule`.

Assume exact constants and that V is finite-dimensional over L. Then the native fixed submodule W=f.fixedSubmodule is finite-dimensional over F; V itself is not assumed finite-dimensional over F.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a. V is finite-dimensional over L.

Proof route: Choose an F-basis b of W; include it into V as in betti-comparison-injective. Use fixed-independence to make it an L-independent family in the finite-dimensional L-space V. LinearIndependent.finite makes its index type finite. Apply Module.Basis.finiteDimensional_of_finite to the original F-basis of W. This establishes finiteness before any finrank equality criterion is used.

Sources: PAP-v2, Proposition 3.3.8, pp.12–13.

Direct inputs: `fixed-independence`, `mathlib:LinearMap.fixedSubmodule`, `mathlib:LinearMap.mem_fixedSubmodule_iff`, `mathlib:Submodule.subtype`, `mathlib:Submodule.subtype_injective`, `mathlib:LinearIndependent.map'`, `mathlib:Module.Free.chooseBasis`, `mathlib:Module.Basis.linearIndependent`, `mathlib:LinearIndependent.finite`, `mathlib:Module.Basis.finiteDimensional_of_finite`.

Acceptance: Conjugation on C has fixed space of real dimension 1. Multiplication by 2 on Q has zero-dimensional fixed space. Finite-dimensionality is proved, not inferred from the numerical value of finrank, which is zero for infinite-dimensional spaces.

### The dimension bound for fixed vectors

Target `fixed-dimension-bound` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.finrank_fixedSubmodule_le`.

Assume exact constants and finite-dimensionality of V over L. Then dim_F(f.fixedSubmodule)≤dim_L(V).

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a. V is finite-dimensional over L.

Proof route: Use betti-comparison-injective and the native dimension bound for an injective map into V. Rewrite the dimension of L⊗_F W using Module.finrank_baseChange. The fixed-space-finite lemma separately certifies that this is the dimension of a finite space.

Sources: PAP-v2, Proposition 3.3.8, pp.12–13.

Direct inputs: `betti-comparison-injective`, `fixed-space-finite`, `mathlib:LinearMap.finrank_le_finrank_of_injective`, `mathlib:Module.finrank_baseChange`.

Acceptance: Conjugation on C realizes equality 1≤1. The invertible operator 2·id on Q realizes the strict inequality 0<1. For the zero space both sides are zero.

### The dimension criterion for the Betti comparison

Target `betti-comparison-dimension` (theorem); proposed declaration `TauCeti.Difference.FixedVectors.bettiComparison_bijective_iff`.

Assume exact constants and finite-dimensionality of V over L. The native comparison κ:L⊗_F f.fixedSubmodule→V is bijective if and only if dim_F(f.fixedSubmodule)=dim_L(V). In the pre-t-motive application this is the numerical criterion for rigid analytic triviality, once the actual scalar field and operator are supplied.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a. V is finite-dimensional over L.

Proof route: Establish finite-dimensionality of W by fixed-space-finite; a finite F-basis extends to a finite L-basis of L⊗_F W. The forward implication packages κ as a linear equivalence and uses finrank invariance and Module.finrank_baseChange. For the reverse implication, base-change dimension makes source and target have equal finite dimension. Use betti-comparison-injective and LinearMap.injective_iff_surjective_of_finrank_eq_finrank to prove surjectivity.

Sources: PAP-v2, Proposition 3.3.8, pp.12–13.

Direct inputs: `betti-comparison-injective`, `fixed-space-finite`, `mathlib:Module.Basis.baseChange`, `mathlib:Module.Basis.finiteDimensional_of_finite`, `mathlib:Module.finrank_baseChange`, `mathlib:LinearEquiv.finrank_eq`, `mathlib:LinearMap.injective_iff_surjective_of_finrank_eq_finrank`.

Acceptance: Identity on Q and conjugation on C have bijective comparison maps. The zero-dimensional object is admitted. The invertible operator 2·id on Q has no nonzero fixed vector and fails surjectivity; invertibility alone does not imply triviality. The actual DM.8 applicability check still needs L^σ=F_q(t) and the supplied analytic field; this generic criterion does not establish either.

### Constant coordinates in a fixed basis

Target `fixed-basis-coordinates` (lemma); proposed declaration `TauCeti.Difference.FixedVectors.fixed_iff_existsUnique_coordinates`.

Assume exact constants. Let b:I→V be an L-basis indexed by a finite type, with f(b_i)=b_i. For w∈V, f(w)=w if and only if there is a unique family c:I→F with Σ_i algebraMap(c_i)·b_i=w.

Additional hypotheses: F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made. V is an L-vector space, also an F-vector space by a compatible scalar tower. σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated. The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a. b is an L-basis indexed by a finite type; every basis vector is fixed.

Proof route: A basis spans V, so express w with L-coefficients. If w is fixed, fixed-coefficients and exact constants lift each coefficient uniquely to F, the latter uniqueness using injectivity of a field embedding. L-independence of b makes the lifted coefficient family unique by subtracting two expansions. Conversely, an F-coefficient combination of fixed vectors is fixed by F-linearity.

Sources: PAP-v2, Lemma 4.1.6, p.22, with Lemma 3.3.7.

Direct inputs: `fixed-coefficients`, `mathlib:Module.Basis.linearIndependent`, `mathlib:Module.Basis.span_eq`, `mathlib:Submodule.mem_span_range_iff_exists_fun`, `mathlib:linearIndependent_iff'`.

Acceptance: The singleton basis 1 of C with conjugation has exactly real fixed coordinates. For the empty basis and zero space the unique coefficient function is empty. This is the coordinate step in the fundamental-solution argument; no analytic matrix or general solution space is newly defined here.

## The analytic coefficient interface

The restricted-series carrier is existing library material. The new work specifies its coefficient twist, the exact arithmetic entire subring, and the constant-field and separability statements needed by motives. Entire evaluation at θ is legitimate despite |θ|>1 because E is restricted at every positive radius. A fraction of restricted series and an arbitrary formal Laurent series have different fixed fields and cannot be exchanged in the proof.

### Coefficient Frobenius twist

Target `coefficient-twist` (construction); proposed declaration `TauCeti.Difference.Periods.twistSeries`.

For a perfect coefficient field C of characteristic p, q=p^m with m≥1, σ_C is the inverse of the m-fold p-Frobenius. Its coefficientwise extension to C[[t]] is a ring automorphism fixing t. Write f^(n)=σ^(−n)(f) for n∈Z. Extend it entrywise to matrices and to the σ-stable polynomial, entire and restricted-series rings and their fraction fields. In particular twisting never raises the variable t to a q-th power.

Proof route: Use the native iterated Frobenius equivalence and its inverse on coefficients. Apply the native power-series coefficient map and prove its inverse by coefficient extensionality. Restrictedness is preserved because coefficient norms are raised to the positive power 1/q; fraction-ring extension is by its universal property.

Sources: PAP-v2, §2.2.5 pp.7–8; ABP-v1, §2.2 p.6; IKLNP-v2, §2.1 p.26.

Direct inputs: `mathlib:iterateFrobeniusEquiv`, `mathlib:PowerSeries.map`.

The API and its consumers:

- CCM §4.1 p.13; IKLNP §2.1 p.26: Provides one shared twist interface for every displayed difference equation.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.twist_coeff` | simp | The n-th coefficient of σ(f) is σ_C of the n-th coefficient of f. |
| `TauCeti.Difference.Periods.twist_X` | simp | σ(t)=t. |
| `TauCeti.Difference.Periods.twist_C` | simp | σ(C(a))=C(σ_C(a)). |
| `TauCeti.Difference.Periods.twist_mul` | compatibility | σ(fg)=σ(f)σ(g), and entrywise twist commutes with matrix multiplication. |
| `TauCeti.Difference.Periods.twist_inverse` | equivalence | The coefficient map of σ_C inverse is inverse to σ on series. |

Definition tests:

- `TauCeti.Difference.Periods.test_coefficient_twist_1`: The series t is fixed, including in positive characteristic.
- `TauCeti.Difference.Periods.test_coefficient_twist_2`: For an element a not fixed by σ_C, the constant series C(a) is not fixed.
- `TauCeti.Difference.Periods.test_coefficient_twist_3`: The coefficient twist of (t−a)(t−b) is (t−σ_C(a))(t−σ_C(b)); this distinguishes coefficient twist from substituting t^q.

### Algebraic entire series

Target `entire-series` (construction); proposed declaration `TauCeti.Difference.Periods.entireSubring`.

Let C=C∞, k=F_q(θ), and k∞=F_q((1/θ)) with the specified embeddings. E is the subring of C[[t]] consisting of f=Σ a_n t^n whose coefficients are algebraic over k, for which Σ converges at every finite radius, and for which k∞(a_n:n≥0) is finite-dimensional over k∞. The convergence condition is equivalently: for every real r>0, ||a_n|| r^n tends to zero. Evaluation at z∈C is the sum Σ a_n z^n. E embeds in the native radius-one restricted-series subring T.

Proof route: The finite coefficient-field condition is retained separately from entire convergence. A compositum of two finite coefficient fields controls sums and products. Use native restrictedness at each positive radius, and completeness plus the ultrametric summability criterion to obtain evaluation as a ring homomorphism. Algebraicity of each coefficient over k is required for ABP. The larger analytic entire ring in Papanikolas can be distinguished, but this plan uses the ABP subring throughout specialization.

Sources: PAP-v2, §2.2.3–2.2.4 p.7; ABP-v1, §2.4 p.7.

Direct inputs: `DrinfeldModulesAndTModules:DM.2`, `mathlib:PowerSeries.IsRestricted.subring`, `mathlib:IntermediateField.adjoin`.

The API and its consumers:

- ABP Theorem3.1.1 pp.7–8; PAP Theorem5.2.2 p.33: Ensures specialization is defined at θ outside the unit disk and that the arithmetic auxiliary-function estimates apply.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.entire_mem` | characterisation | Membership is exactly coefficient algebraicity, restrictedness at every positive radius, and finite dimension of the coefficient-generated field over k∞. |
| `TauCeti.Difference.Periods.entire_eval` | projection | Evaluation E→C sends f to Σ a_n z^n and is a ring homomorphism. |
| `TauCeti.Difference.Periods.entire_polynomial` | constructor | Every polynomial with algebraic-over-k coefficients lies in E. |
| `TauCeti.Difference.Periods.entire_restricted` | compatibility | The inclusion E→C[[t]] factors through the native restricted subring at radius one. |
| `TauCeti.Difference.Periods.entire_eval_polynomial` | simp | Entire evaluation agrees with polynomial evaluation, including evaluation of t at z. |

Definition tests:

- `TauCeti.Difference.Periods.test_entire_series_1`: Zero is in E and evaluates to zero.
- `TauCeti.Difference.Periods.test_entire_series_2`: Every constant with an algebraic-over-k coefficient is in E and evaluates to that coefficient.
- `TauCeti.Difference.Periods.test_entire_series_3`: The series Σ t^n over the chosen C is excluded: its coefficients do not tend to zero at radius one.

### The one-variable analytic interface

Target `tate-analytic-interface` (comparison); proposed declaration `TauCeti.Difference.Periods.tate_analytic_interface`.

T is the existing radius-one restricted-series subring of C∞[[t]], equipped with its Gauss norm; L is its fraction field. The norm is complete, ultrametric and multiplicative. A nonzero f∈T has a finite zero divisor on |t|≤1, and f=λ·P·u with P the monic polynomial of those zeros, u=1+Σ_{n≥1}b_n t^n, sup||b_n||<1 and b_n→0. The corresponding signed divisor gives the same factorization for a nonzero element of L. Thus T is a principal ideal domain, and its maximal ideals are (t−a) with ||a||≤1. These are adaptations of existing restricted-series and Weierstrass theory, not a new Tate-algebra definition.

Proof route: Import the Gauss norm and completeness already present in current Tau Ceti, and the rank-one Weierstrass preparation milestone from Adic Spaces layer 0.5. Over algebraically closed C∞, factor the distinguished polynomial into linear factors. Unit normalization isolates a constant and a strict-norm tail. Pass to fractions to obtain a finite signed zero/pole divisor. Check the pinned/current discrepancy recorded in the audit before implementation; generic restricted-series theory remains with its existing owner.

Sources: PAP-v2, §2.2.4 p.7.

Direct inputs: `mathlib:PowerSeries.IsRestricted.subring`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`, `DrinfeldModulesAndTModules:DM.2`.

Acceptance: A factor t−a is a unit exactly when ||a||>1. A nonzero determinant in L does not imply it is a unit in T. The constant 1 has no zero divisor and Gauss norm 1.

### Limits under positive Frobenius twists

Target `twisting-limit` (theorem); proposed declaration `TauCeti.Difference.Periods.twisting_limit`.

For f∈T with Gauss norm at most 1 there exist s≥1 and a polynomial P with coefficients in the algebraic closure of F_q inside C∞ such that f^(ns) tends to P in Gauss norm as n→∞. Moreover P≠0 exactly when ||f||=1. At coefficient level, a with ||a||<1 tends to 0 under a↦a^(q^(ns)); if ||a||=1, an s can be chosen so its residue is fixed and the sequence tends to its unique constant residue representative. The limiting coefficients need not lie in F_q itself.

Proof route: Use that the residue field is the algebraic closure of F_q; choose a finite common Frobenius period for the finitely many residues in the normalized factorization. The strict-norm unit tail tends to 1 uniformly. Norm<1 forces the constant factor to 0; norm 1 preserves a nonzero constant factor.

Sources: PAP-v2, Lemmas 2.2.6–2.2.7 p.8.

Direct inputs: `coefficient-twist`, `tate-analytic-interface`, `FunctionFieldArithmetic:FA.0`.

Acceptance: For a constant in F_{q^2} not in F_q the limit lies in F_{q^2}, so s=2 can be needed. A strict-norm series tends to 0. A radius-one unit of norm 1 has a nonzero polynomial limit.

### Exact analytic constant fields

Target `analytic-fixed-fields` (theorem); proposed declaration `TauCeti.Difference.Periods.analytic_fixed_fields`.

For inverse coefficient q-Frobenius σ, T^σ=F_q[t] and L^σ=F_q(t), with the natural polynomial and rational-function embeddings. Also the σ-fixed elements of k̄(t) are F_q(t), and F_q(t)∩T=F_q[t]. The same assertions for σ^n replace F_q by F_{q^n}. These assertions concern the actual C∞ Tate fraction field, not the full formal Laurent-series field, whose constants are F_q((t)).

Proof route: A fixed restricted series has coefficients in finite F_q and tending to 0; only finitely many are nonzero. For a fixed fraction the finite polar divisor is σ-stable. Its monic denominator has coefficients in F_q. Multiplying clears poles and reduces to the restricted-series statement. For a rational function use its normalized numerator/denominator, or compare a monic minimal polynomial for the algebraic-constant extension. Repeat for σ^n.

Sources: PAP-v2, Lemma 3.3.2 p.12; §2.2.5 pp.7–8; CCM-v2, §4.1 p.13.

Direct inputs: `coefficient-twist`, `tate-analytic-interface`, `mathlib:RatFunc`, `FunctionFieldArithmetic:FA.0`.

Acceptance: t and 1/(t−1) are fixed fractions. A fixed formal series with infinitely many nonzero finite-field coefficients is not in T. F_q(t)∩T contains no element with a pole in the closed disk.

### Separability of the analytic fraction field

Target `analytic-separability` (theorem); proposed declaration `TauCeti.Difference.Periods.analytic_separability`.

The triple F_q(t)⊂k̄(t)⊂L is σ-admissible: σ fixes F_q(t), its restrictions to k̄(t) and L have exact constants F_q(t), and L/k̄(t) is separable in the general field-extension sense. It is not asserted to be finite or algebraic.

Proof route: The constant-field claims come from analytic-fixed-fields. Use the characteristic-p separability criterion with the p-basis {t} of k̄(t): in the ambient Laurent series field no p-th root of t exists, since its order would be 1/p. This proves linear disjointness from k̄(t^(1/p)), hence separability. Record the exact criterion as an FA.0 request.

Sources: PAP-v2, §4.1.1 p.21.

Direct inputs: `analytic-fixed-fields`, `DrinfeldModulesAndTModules:DM.2`, `FunctionFieldArithmetic:FA.0`, `mathlib:Algebra.IsGeometricallyReduced`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

## Betti comparison and the rigid-trivial category

The comparison map is the native scalar extension of the fixed-submodule inclusion. It is always injective in the exact-constant semilinear setting. Rigid triviality adds surjectivity, which is equivalent to equality of dimensions. Invertibility of the original difference operator alone does not give this condition. The chosen category T is generated by the rational images of rigid-trivial dual Anderson motives; it must be distinguished both from all effective dual motives and from the larger category R of every rigid-trivial pre-t-motive.

### Rigid analytic triviality

Target `rigid-triviality` (definition); proposed declaration `TauCeti.Difference.Periods.IsRigidTrivial`.

For a pre-t-motive M supplied by DM.4, let V=L⊗_{k̄(t)}M with its induced semilinear σ operator f, viewed as an F_q(t)-linear endomorphism. Set M^B=fixedSubmodule(f). M is rigid analytically trivial precisely when the native comparison L⊗_{F_q(t)}M^B→V, a⊗v↦av, is bijective. This condition includes surjectivity; an injective comparison is automatic and alone is insufficient.

Proof route: Reuse native fixedSubmodule and subtype scalar extension; introduce only the bijectivity predicate. DM.4 supplies the actual motive scalar extension and compatibility with its τ convention; this predicate is meaningful without a new copy of the motive type.

Sources: PAP-v2, §3.3.1 p.12; Proposition 3.3.8 p.13.

Direct inputs: `betti-comparison-dimension`, `DrinfeldModulesAndTModules:DM.4`, `analytic-fixed-fields`.

The API and its consumers:

- PAP Proposition 3.3.9 pp.13–15: The bijective comparison is equivalent to a fundamental matrix and supplies the integral trivialization criterion.
- PAP Propositions 3.3.11–3.3.14 pp.15–16: Closure under subquotients, tensor products and duals makes Betti realization an exact faithful tensor functor.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.rigid_iff` | characterisation | Rigid triviality is equivalent to bijectivity of the native lifted fixed-submodule inclusion. |
| `TauCeti.Difference.Periods.rigid_finrank` | characterisation | For finite-dimensional V with exact constants, rigid triviality is equivalent to dim_F V^f=dim_L V. |
| `TauCeti.Difference.Periods.rigid_invariant` | compatibility | An L-linear equivalence intertwining the semilinear operators preserves and reflects rigid triviality. |

Definition tests:

- `TauCeti.Difference.Periods.test_rigid_triviality_1`: The identity on Q has bijective comparison and is rigid trivial.
- `TauCeti.Difference.Periods.test_rigid_triviality_2`: The zero-dimensional identity is rigid trivial.
- `TauCeti.Difference.Periods.test_rigid_triviality_3`: Multiplication by 2 on Q is invertible but is not rigid trivial, since its fixed space is zero.

### Fundamental solution matrix

Target `fundamental-matrix` (definition); proposed declaration `TauCeti.Difference.Periods.IsFundamental`.

For fields F⊂K⊂L with σ-admissible structure and Φ∈GL_r(K), a fundamental matrix is Ψ∈GL_r(L) satisfying σ(Ψ)=ΦΨ, after embedding Φ in L. A rigid analytic trivialization over T is such a matrix in GL_r(T), with equation read in T. A matrix with determinant merely nonzero in L does not meet the integral condition.

Proof route: Use the native general linear group (matrix units) and an explicit entrywise equation. The generic definition applies to any coefficient automorphism; the analytic specialization uses inverse q-Frobenius.

Sources: PAP-v2, §4.1.6 p.22; Proposition 3.3.9 p.13; NGO-HAL, §4.1 printedp.17; §5.2 printedpp.20–21.

Direct inputs: `coefficient-twist`, `mathlib:Matrix.GeneralLinearGroup`.

The API and its consumers:

- Ngo Dac §5.2 pp.20–21; CCM Lemma5.1.1 proof pp.23–24; IKLNP Theorem2.4 proof p.33: Turns a second block solution into a constant matrix, including rectangular solutions.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.fundamental_equation` | characterisation | Fundamentality is exactly the entrywise equation σ(Ψ)=ΦΨ. |
| `TauCeti.Difference.Periods.fundamental_change_basis` | compatibility | Changing the motive basis by B sends Φ to σ(B)Φ B^−1 and Ψ to B Ψ. |
| `TauCeti.Difference.Periods.fundamental_right_constant` | constructor | Right multiplication by C∈GL_r(F) preserves fundamentality. |
| `TauCeti.Difference.Periods.fundamental_unique` | characterisation | If X is any rectangular solution of σ(X)=Φ X, there is a unique constant matrix C over F with X=Ψ C; if X is square invertible then C is invertible. |

Definition tests:

- `TauCeti.Difference.Periods.test_fundamental_matrix_1`: For Φ=1 the identity matrix is fundamental.
- `TauCeti.Difference.Periods.test_fundamental_matrix_2`: The empty identity matrix is fundamental for rank 0.
- `TauCeti.Difference.Periods.test_fundamental_matrix_3`: Under σ=id over Q, no invertible scalar matrix is fundamental for Φ=2.

### Fundamental matrices and Betti bases

Target `fundamental-betti-basis` (comparison); proposed declaration `TauCeti.Difference.Periods.fundamental_betti_basis`.

For M of k̄(t)-dimension r with column basis m and σ(m)=Φ m, M is rigid trivial iff Φ has a fundamental matrix in GL_r(L). If Ψ is one, the entries of Ψ^−1m form an F_q(t)-basis of M^B. The columns of Ψ form an F_q(t)-basis of the vector solution space σ(v)=Φ v; these are two different coordinate conventions.

Proof route: An inverse fundamental matrix turns the motive basis into fixed vectors. Conversely a fixed L-basis gives a matrix whose inverse solves the equation. Apply fixed-basis-coordinates for exact constants and uniqueness. Do not identify column solutions with the motive-basis rows without inversion.

Sources: PAP-v2, Proposition 3.3.9(a, b) p.13; §4.1.6 p.22.

Direct inputs: `fundamental-matrix`, `rigid-triviality`, `fixed-basis-coordinates`, `DrinfeldModulesAndTModules:DM.4`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Integral analytic trivializations

Target `integral-trivialization` (theorem); proposed declaration `TauCeti.Difference.Periods.integral_trivialization`.

If a rigid-trivial pre-t-motive has a polynomial σ matrix Φ∈Mat_r(k̄[t]) with det Φ=c(t−θ)^s, c∈k̄^× and s≥0, it has a fundamental matrix Ψ∈GL_r(T). For the corresponding integral DM.4 dual Anderson motive, its T-fixed module is free over F_q[t] of rank r, its basis gives Ψ^−1m, and the integral and rational notions of rigid triviality agree.

Proof route: Clear denominators of fixed vectors by σ-fixed polynomials, giving an integral fixed lattice with rationalization M^B. The determinant of a lattice basis is a constant times Ω^s times a polynomial over F_q. If that polynomial has positive degree, a normalized polynomial relation modulo it, its Frobenius limits and a finite-field trace give a smaller-degree fixed relation, contradicting the lattice basis. Hence the determinant is a T-unit. Use DM.2 Ω and DM.4 freeness/rationalization interfaces.

Sources: PAP-v2, Proposition 3.3.9(c) pp.13–15; Proposition 3.4.7 p.19.

Direct inputs: `fundamental-betti-basis`, `twisting-limit`, `analytic-fixed-fields`, `tate-analytic-interface`, `DrinfeldModulesAndTModules:DM.4`, `DrinfeldModulesAndTModules:DM.2`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Exact tensor Betti comparison

Target `betti-exact-tensor` (theorem); proposed declaration `TauCeti.Difference.Periods.betti_exact_tensor`.

For an exact sequence 0→P→Q→R→0 of pre-t-motives, rigid triviality of Q implies rigid triviality of P and R. On rigid-trivial objects Betti realization is exact and faithful, and the canonical maps P^B⊗_F Q^B→(P⊗_K Q)^B and (P^B)^∨→(P^∨)^B are isomorphisms. Here F=F_q(t), K=k̄(t); tensoring Betti spaces uses F and tensoring motives uses K.

Proof route: Use left exactness of fixed vectors and scalar-extension exactness. An isomorphism for Q forces the comparisons for the subobject and quotient to be isomorphisms, by injectivity and dimensions. For faithfulness, a morphism zero on a spanning Betti basis is zero on the scalar extension and therefore on the motive. Kronecker products of fundamental matrices supply tensor comparison; inverse transposes supply dual comparison. The natural maps, not just equal dimensions, must be identified.

Sources: PAP-v2, Propositions 3.3.11–3.3.14 pp.15–16.

Direct inputs: `rigid-triviality`, `fundamental-betti-basis`, `betti-comparison-injective`, `DrinfeldModulesAndTModules:DM.4`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### The neutral category of rigid-trivial motives

Target `neutral-category` (theorem); proposed declaration `TauCeti.Difference.Periods.neutral_category`.

The strictly full subcategory R of the DM.4 pre-t-motive category consisting of rigid-trivial objects is rigid, abelian and F_q(t)-linear; its unit has endomorphism field F_q(t), and ω(M)=M^B is an exact faithful F_q(t)-linear tensor functor to finite-dimensional vector spaces. Thus R is neutral Tannakian over the imperfect field F_q(t). Let T be the strictly full tensor subcategory generated by the rational images of rigid-trivial dual Anderson motives; it too has this fibre functor. T is this generated subcategory, not all effective dual motives and not an assumption that every t-module is trivial.

Proof route: Import the rigid abelian motive category, its unit, tensor and dual constructions from DM.4. Closure and exactness come from betti-exact-tensor. Identify End(1) using exact constants, then use the arbitrary-field neutral-category interface of MC.6. Define T by the generic tensor-generation construction supplied with MC.6; its chosen generating family is the DM.4 rational image. The effective Frobenius modules of IKLNP are supplied by DM.4 and are not automatically Anderson-free over k̄[σ].

Sources: PAP-v2, Theorem 3.3.15 pp.16–17; Definition 3.4.10 p.19.

Direct inputs: `betti-exact-tensor`, `fixed-space-finite`, `analytic-fixed-fields`, `DrinfeldModulesAndTModules:DM.4`, `MotivesAndAlgebraicCycles:MC.6`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

## Solution algebras, the group and the torsor

These targets apply first to an arbitrary admissible field triple. The coordinate algebra of the solution scheme includes the inverse determinant. The comparison algebra lives in a tensor ring that can have zero divisors, so none of its definitions assumes a field or domain structure there. A Hopf structure is the output of descent, not extra data inserted into the comparison-algebra definition. Its structure maps and the torsor identity must be checked as algebra/scheme maps on all base algebras, rather than as assertions only about rational points.

### Admissible difference fields

Target `admissible-fields` (definition); proposed declaration `TauCeti.Difference.Periods.IsAdmissible`.

A σ-admissible triple consists of field embeddings F⊂K⊂L, an F-algebra automorphism σ_K of K and an F-algebra automorphism σ_L of L compatible with K→L, exact fixed fields K^σ=L^σ=F, and a separable extension L/K. F is fixed pointwise. No algebraic closure of F, finite extension or characteristic-zero hypothesis is included.

Proof route: Package only the complete mathematical predicate on specified field and automorphism data. The embeddings and algebra towers are native. Compatibility is an equation, exact constants are the two explicit range equalities, and separability is expressed by the native geometric-reducedness property for the field extension. It is not Algebra.IsSeparable, which would incorrectly force algebraicity.

Sources: PAP-v2, §4.1.1 p.21.

Direct inputs: `mathlib:Algebra.IsGeometricallyReduced`, `mathlib:AlgEquiv`, `mathlib:IsScalarTower`.

The API and its consumers:

- PAP §§4.2–4.3 pp.22–27: Exact constants control invariant-ideal descent and uniqueness; general separability supplies geometric reducedness for the solution group.
- PAP §4.4 pp.27–28: The power-admissible algebraic-closure instances identify the geometric fixed field without assuming density of rational points over F.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.admissible_compat` | projection | σ_L(algebra Map K L a)=algebra Map K L(σ_K a). |
| `TauCeti.Difference.Periods.admissible_constants` | projection | σ_L a=a iff a is in the image of F; the same holds in K. |
| `TauCeti.Difference.Periods.admissible_separable` | projection | L/K is geometrically reduced, the native formulation of general separability here. |

Definition tests:

- `TauCeti.Difference.Periods.test_admissible_fields_1`: F=K=L=Q with identity automorphisms is admissible.
- `TauCeti.Difference.Periods.test_admissible_fields_2`: F=K=R, L=C with identity on R and conjugation on C is admissible.
- `TauCeti.Difference.Periods.test_admissible_fields_3`: The same tower with identity on C is not admissible, because its fixed field is too large.

### The solution space of a difference system

Target `solution-space` (construction); proposed declaration `TauCeti.Difference.Periods.solutionSpace`.

For σ-admissible F⊂K⊂L and Φ∈Mat_r(K), Sol(Φ) is the native F-submodule of L^r cut out by σ_L(v)=Φ v. It has F-dimension at most r. If Φ is invertible and Ψ fundamental, every solution is uniquely Ψ c with c∈F^r. For rectangular solution matrices the same description holds columnwise.

Proof route: The coefficient twist and matrix multiplication are F-linear, so their equalizer is an F-submodule. For invertible Φ rewrite the equation as fixedness for Φ^−1σ; apply the existing fixed-vector chain. The singular case follows by the same minimal-relation proof, without needing to invert Φ.

Sources: PAP-v2, §4.1.3–4.1.6 pp.21–22.

Direct inputs: `admissible-fields`, `fundamental-matrix`, `fixed-independence`, `mathlib:Submodule`.

The API and its consumers:

- PAP §4.1.6 p.22: A fundamental matrix gives a constant-coordinate basis for all solutions, including rectangular solution matrices.
- CCM Lemma 5.1.1 proof pp.23–24: The same solution-coordinate statement turns an auxiliary block solution into a constant matrix before denominator descent.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.solution_mem` | characterisation | v lies in Sol(Φ) iff σ(v)=Φ v. |
| `TauCeti.Difference.Periods.solution_finrank` | structure | Sol(Φ) is finite-dimensional over F and its dimension is at most r. |
| `TauCeti.Difference.Periods.solution_coordinates` | universal-property | A fundamental Ψ identifies F^r linearly with Sol(Φ), c↦Ψ c. |

Definition tests:

- `TauCeti.Difference.Periods.test_solution_space_1`: With σ=id, Φ=1 over Q the solution submodule is the whole space.
- `TauCeti.Difference.Periods.test_solution_space_2`: With σ=id, Φ=2 in rank 1 over Q the solution submodule is zero.
- `TauCeti.Difference.Periods.test_solution_space_3`: A repeated nonzero solution column is linearly dependent even though each column is a solution.

### The solution ring and field

Target `solution-ring` (construction); proposed declaration `TauCeti.Difference.Periods.solutionRing`.

Fix an admissible triple, Φ∈GL_r(K) and Ψ∈GL_r(L) fundamental. Define Σ=K[Ψ_ij, det(Ψ)^−1] as the native K-subalgebra of L generated by these elements, Λ=K(Ψ_ij) as the native intermediate field, and Z=Spec Σ, a closed K-subscheme of GL_r. The evaluation homomorphism K[X_ij, det(X)^−1]→L has image Σ and kernel the defining ideal of Z. Λ is the fraction field of Σ.

Proof route: Use native adjoin, matrix determinant, localization and spectrum; include the inverse determinant among generators. The difference equation makes Σ stable under σ and σ inverse. The field generated by matrix entries already contains the inverse determinant. The generator evaluation gives the quotient/image dictionary and its fraction field.

Sources: PAP-v2, §4.2.1 p.22.

Direct inputs: `fundamental-matrix`, `admissible-fields`, `mathlib:Algebra.adjoin`, `mathlib:IntermediateField.adjoin`, `mathlib:Matrix.det`, `SchemeAndStackFoundations:SF.1`.

The API and its consumers:

- PAP Theorem 4.2.11 p.26: The ring is the coordinate algebra of the particular solution torsor; its tensor-square is compared with the group coordinate ring.
- PAP Lemma 4.5.2 and Theorem 4.5.3 pp.28–29: It contains fundamental matrices for tensor subquotients of the chosen generator and makes their Betti comparisons available over every F-algebra.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.solutionRing_entry` | constructor | Every entry Ψ_ij and det(Ψ)^−1 belongs to Σ. |
| `TauCeti.Difference.Periods.solutionRing_le` | universal-property | Σ≤A iff a K-subalgebra A contains all entries and the inverse determinant. |
| `TauCeti.Difference.Periods.solutionField_fraction` | compatibility | Λ is the fraction field of the native generated subalgebra Σ. |
| `TauCeti.Difference.Periods.solutionRing_twist` | structure | σ restricts to a semilinear ring automorphism of Σ. |

Definition tests:

- `TauCeti.Difference.Periods.test_solution_ring_1`: For Ψ=1 in rank 1, Σ=K and Λ=K.
- `TauCeti.Difference.Periods.test_solution_ring_2`: For the empty identity matrix, Σ=K, with empty determinant 1.
- `TauCeti.Difference.Periods.test_solution_ring_3`: For a transcendental scalar z in rank 1, Σ=K[z, z^−1]; omitting det^−1 gives the wrong ring.

### The comparison coordinate algebra

Target `comparison-algebra` (construction); proposed declaration `TauCeti.Difference.Periods.comparisonAlgebra`.

In L⊗_K L form Ψ_1=(Ψ_ij⊗1), Ψ_2=(1⊗Ψ_ij), and D=Ψ_1^−1Ψ_2. Define Δ=F[D_ij, det(D)^−1], a native F-subalgebra of L⊗_K L. Let Γ=Spec Δ. The diagonal σ action fixes D entrywise, but L⊗_K L need not be a domain. Γ is initially a closed subscheme of GL_r/F; its group structure is a theorem, not part of this definition.

Proof route: Map native matrix units along the two tensor-product algebra maps, invert the first and multiply by the second. The equation σΨ=ΦΨ cancels Φ in σ(D). Apply native F-algebra generation in the tensor ring; retain determinant inversion.

Sources: PAP-v2, §4.2.1–4.2.2 p.22.

Direct inputs: `solution-ring`, `mathlib:Algebra.TensorProduct.includeLeft`, `mathlib:Algebra.TensorProduct.includeRight`, `mathlib:Algebra.adjoin`.

The API and its consumers:

- PAP Propositions 4.2.8–4.2.10 pp.25–26: The three-factor comparison cocycle descends multiplication, inversion and the identity to its spectrum.
- PAP §6.2 pp.35–36: Computing the comparison matrix of the logarithm extension places its group in the scalar-action triangular subgroup.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.comparisonMatrix_formula` | data | D is Ψ_1^−1Ψ_2, in that order. |
| `TauCeti.Difference.Periods.comparisonAlgebra_le` | universal-property | Δ is the least F-subalgebra containing the entries of D and det(D)^−1. |
| `TauCeti.Difference.Periods.comparisonMatrix_fixed` | relation | The diagonal coefficient automorphism fixes D. |
| `TauCeti.Difference.Periods.comparisonMatrix_cocycle` | relation | In the three-fold tensor product, D_12 D_23=D_13. |

Definition tests:

- `TauCeti.Difference.Periods.test_comparison_algebra_1`: For Ψ=1, D=1 and Δ consists of scalar constants.
- `TauCeti.Difference.Periods.test_comparison_algebra_2`: For the empty identity, D is the empty identity and Δ consists of constants.
- `TauCeti.Difference.Periods.test_comparison_algebra_3`: For a scalar z, D=z^−1⊗z; its order distinguishes right multiplication from the reversed torsor convention.

### Invariant ideals descend to constants

Target `invariant-ideal-descent` (theorem); proposed declaration `TauCeti.Difference.Periods.invariant_ideal_descent`.

In L[X_ij, det(X)^−1] let σ_0 act on coefficients and fix the variables. Extension and contraction give inverse bijections between ideals over F and σ_0-stable ideals over L.

Proof route: Choose a finite-support expression in an F-basis and normalize one coefficient to 1. Subtract twists to reduce support; exact constants complete induction.

Sources: PAP-v2, Lemma 4.2.3 p.23.

Direct inputs: `admissible-fields`, `mathlib:Ideal.map`, `mathlib:Ideal.comap`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Difference simplicity of the solution ring

Target `solution-ring-simple` (theorem); proposed declaration `TauCeti.Difference.Periods.solution_ring_simple`.

The solution ring Σ has no proper nonzero ideal stable under σ; equivalently the kernel of generator evaluation is maximal among proper σ_1-stable ideals, where σ_1 applies coefficient σ and sends X to Φ X. Stability by inclusion suffices because the coordinate ring is noetherian.

Proof route: Translate by Ψ to turn σ_1 into coefficient σ_0. Extend a putative invariant ideal to a maximal ideal over constants, obtaining a finite field extension E/F and a second fundamental matrix. Its ratio to Ψ lies in GL_r(E). Noetherian stabilization and faithful flatness of scalar extension force the old defining ideal and the larger one to coincide. Only the L-valued invariant-ideal clause is used here; the Σ clause is proved afterward, avoiding a logical cycle.

Sources: PAP-v2, Corollary 4.2.5 p.24.

Direct inputs: `solution-ring`, `invariant-ideal-descent`, `SchemeAndStackFoundations:SF.1`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Ideal descent over the solution ring

Target `solution-invariant-ideal-descent` (theorem); proposed declaration `TauCeti.Difference.Periods.solution_invariant_ideal_descent`.

Every coefficient-σ-stable ideal in Σ[X_ij, det(X)^−1] is generated by its intersection with F[X_ij, det(X)^−1]. Extension and contraction are inverse on these ideals. This is asserted for the σ-simple solution ring Σ, not for an arbitrary difference algebra.

Proof route: Use a minimal nonzero support modulo the contracted ideal. Its leading-coefficient ideal is σ-stable and nonzero, so simplicity supplies coefficient 1. Subtract twists and apply exact constants to contradict minimal support.

Sources: PAP-v2, Lemma 4.2.7 p.25.

Direct inputs: `solution-ring-simple`, `invariant-ideal-descent`, `mathlib:Ideal.map`, `mathlib:Ideal.comap`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### The difference Galois group and its torsor

Target `difference-torsor` (theorem); proposed declaration `TauCeti.Difference.Periods.difference_torsor`.

For every admissible triple and fundamental Ψ, Δ admits the Hopf structure inherited from GL_r, with comultiplication D_ij↦Σ_k D_ik⊗D_kj, counit D_ij↦δ_ij and antipode D↦D^−1. Therefore Γ=Spec Δ is a closed F-subgroup scheme of GL_r. Z=Spec Σ is a right Γ_K-torsor: the map (u, v)↦(u, u^−1v) induces Z×_K Z≅Z×_K Γ_K, equivalently an isomorphism Σ⊗_K Σ≅Σ⊗_F Δ. Also Z_L≅Γ_L via u↦Ψ^−1u. These are scheme and coordinate-ring isomorphisms, not just bijections on rational points.

Proof route: Conjugate defining ideals by the translation X↦Ψ^−1X and use invariant-ideal descent over L and Σ. The cocycle formula on three tensor factors gives multiplication; identity and factor swap give counit and inverse. Descend the resulting diagrams by faithful flatness. The field inclusions make Σ faithfully flat over K and F; use the supplier affine descent interface to prove the torsor statement.

Sources: PAP-v2, Propositions 4.2.4 and 4.2.8 pp.23–25; Theorem 4.2.11 p.26.

Direct inputs: `comparison-algebra`, `invariant-ideal-descent`, `solution-invariant-ideal-descent`, `solution-ring-simple`, `SchemeAndStackFoundations:SF.1`, `mathlib:CommHopfAlgCat`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

## Dimension and motivic identification

The analytic field triple supplies the additional relative-algebraic-closure hypothesis. This is a statement about K inside its solution field, not a claim that K itself is algebraically closed. The fixed-field theorem uses the appropriate algebraic closures and all powers of σ. Over imperfect F, the proof cannot replace the specified geometric action by an unsupported rational-point density assertion. Full faithfulness and subobject descent are required for the Tannakian identification; matching ranks or a faithful representation by itself would not identify the group scheme.

### Relative algebraic closure in the analytic solution field

Target `relative-algebraic-closure` (theorem); proposed declaration `TauCeti.Difference.Periods.relative_algebraic_closure`.

For the actual analytic triple (F_q(t), k̄(t), L), k̄(t) is algebraically closed in Λ=k̄(t)(Ψ). Namely every element of Λ algebraic over k̄(t) lies in k̄(t). This is a relative-algebraic-closure assertion, not that k̄(t) is an algebraically closed field.

Proof route: Adjoin all twists of a relatively algebraic element; the resulting intermediate field H is finite and separable over k̄(t), since Λ is finitely generated. Use the function-field/curve correspondence and a σ-invariant effective divisor above infinity. Riemann–Roch supplies a finite-dimensional stable space of functions generating H. Apply Lang to GL_m over F_q, base changed to k̄, to produce a σ-fixed basis. Exact constants put every basis function in F_q(t), forcing H=k̄(t).

Sources: PAP-v2, Proposition 4.3.3 pp.26–27.

Direct inputs: `solution-ring`, `analytic-separability`, `analytic-fixed-fields`, `FunctionFieldArithmetic:FA.0`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `SchemeAndStackFoundations:SF.3`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Smoothness and dimension of the difference group

Target `difference-smooth-dimension` (theorem); proposed declaration `TauCeti.Difference.Periods.difference_smooth_dimension`.

If K is relatively algebraically closed in Λ for an admissible triple, Γ is geometrically integral and smooth over F, Z is geometrically integral and smooth over K, and dim_F Γ=trdeg_K Λ. In the analytic triple the extra hypothesis follows from relative-algebraic-closure. The proof of smoothness uses the finite-type group structure: geometric reducedness alone is not a smoothness criterion for arbitrary schemes.

Proof route: Separability and relative algebraic closure imply geometric integrality of Σ. Transfer geometric reducedness and irreducibility across the torsor after an algebraically closed extension. Apply the native finite-type Hopf-algebra smoothness criterion to Γ; smoothness of Z follows by the torsor local trivialization and descent. Use dimension invariance under field extension and the affine-domain dimension/transcendence theorem for Σ.

Sources: PAP-v2, Theorem 4.3.1 p.26; Corollary 4.3.4 p.27.

Direct inputs: `difference-torsor`, `relative-algebraic-closure`, `tauceti:TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced`, `SchemeAndStackFoundations:SF.1`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### The difference Galois action and its fixed field

Target `difference-invariants` (theorem); proposed declaration `TauCeti.Difference.Periods.difference_invariants`.

Right multiplication gives Γ(F)≅Aut_σ(Σ/K)≅Aut_σ(Λ/K). For geometric fixed-field assertions choose an extension of σ to an algebraic closure of L, write F_n for its σ^n-fixed field and assume (F_n, K̄, L̄) is σ^n-admissible for every n and F̄=⋃F_n. On the corresponding geometrically integral solution field Λ̃, the elements fixed by Γ(F̄) are precisely K̄, and Λ∩Λ̃^{Γ(F̄)}=K. The analytic triple has this property. No density of Γ(F) over the imperfect F is assumed.

Proof route: A σ-commuting automorphism sends Ψ to Ψγ; exact constants imply γ∈GL_r(F), and preserving the solution ring gives γ∈Γ(F). For a geometric invariant rational function, use density of geometric points of the smooth group and the torsor identity to equate its two pullbacks. It is constant. Use relative algebraic closure to descend the intersection with Λ. Do not replace the union-of-fixed-fields hypotheses by a claim about rational points over F.

Sources: PAP-v2, §4.4.1–4.4.5 pp.27–28; Theorem 4.4.6 p.28.

Direct inputs: `difference-torsor`, `difference-smooth-dimension`, `analytic-fixed-fields`, `SchemeAndStackFoundations:SF.1`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Identification with the motivic Galois group

Target `tannakian-identification` (comparison); proposed declaration `TauCeti.Difference.Periods.tannakian_identification`.

For M∈T with chosen Φ and fundamental Ψ, Γ_Ψ is isomorphic over F_q(t) to Γ_M=Aut^⊗(ω|⟨M⟩). Every N∈⟨M⟩ has a fundamental matrix over Σ; hence Σ_R⊗_F N^B→Σ_R⊗_K N is bijective for every F-algebra R. The induced tensor functor⟨M⟩→Rep_F(Γ_Ψ) is fully faithful, realizes every stable Betti subspace as a submotive, and tensor-generates the representation category. The induced homomorphism is faithfully flat and a closed immersion, hence an isomorphism of group schemes.

Proof route: Construct the action using Ψ→Ψγ on Σ and the Betti basis Ψ^−1m. Check functoriality on arbitrary F-algebras, not just geometric points. For fullness reduce Hom(P, N) to Hom(1, Hom(P, N)); invariant coefficient functions descend to K by difference-invariants. For stable subspaces row-reduce defining equations; uniqueness forces their coefficients to be invariant, hence in K. The block matrix gives a rigid-trivial submotive. The faithful generator M^B supplies all representations as tensor subquotients. Import MC.6 faithfully-flat and closed-immersion criteria.

Sources: PAP-v2, Lemma 4.5.2 and Theorem 4.5.3 pp.28–29; Propositions 4.5.6–4.5.9 pp.30–31; Theorem 4.5.10 p.32.

Direct inputs: `neutral-category`, `difference-torsor`, `difference-invariants`, `MotivesAndAlgebraicCycles:MC.6`, `DrinfeldModulesAndTModules:DM.4`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

## Specialization of algebraic relations

ABP begins with linear relations in an entire solution vector and a polynomial determinant whose only possible root is θ. It does not directly lift every polynomial relation on matrix entries in one application. The bounded tensor-monomial system supplies the necessary linearization at each degree. Its coordinate count is a finite sum, so the proof includes rank-one and empty matrices without dividing by r²−1. The arithmetic estimates and analytic zero estimates are part of the proof chain and have exact supplier contracts below.

### Restricted solutions become entire

Target `entire-from-equation` (theorem); proposed declaration `TauCeti.Difference.Periods.entire_from_equation`.

If Φ∈Mat_r(k̄[t]), det Φ(0)≠0, and ψ∈T^r satisfies σ(ψ)=Φψ, then every component of ψ lies in E, including coefficient algebraicity and the finite coefficient-field condition. This requires invertibility at 0; the determinant-only-at θ condition implies it because θ≠0.

Proof route: Use Lang on Φ(0) to normalize its constant term to 1. The coefficient recursion makes every coefficient algebraic over k. On the sufficiently small coefficient tail solve inverse-Frobenius differences by convergent sums of positive twists. The fixed difference is zero because it is strictly small. This bounds the coefficient field over k∞. The same recursion, multiplied by arbitrary C^n, bounds C^n||a_n|| for every C>1, giving infinite radius.

Sources: ABP-v1, Proposition 3.1.3 pp.9–10; PAP-v2, Proposition 5.1.3 p.32.

Direct inputs: `entire-series`, `coefficient-twist`, `tate-analytic-interface`, `SchemeAndStackFoundations:SF.1`, `FunctionFieldArithmetic:FA.0`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Arithmetic estimates for relation lifting

Target `abp-estimates` (theorem); proposed declaration `TauCeti.Difference.Periods.abp_estimates`.

Let k⊂K_0⊂K⊂k̄ with K_0/k finite separable of degree d, K the perfect closure of K_0 inside k̄, and O its integral closure of A=F_q[θ]. Let size(x) be the maximum of the infinite-place norms of its k-conjugates; use coefficient maxima for matrices and polynomials. Nonzero x∈O satisfies ||x||∞≥size(x)^(1−d). For a nonzero f=Σ a_i z^i∈O[z], any nonzero root λ of multiplicity ν satisfies ||λ||∞^ν≥(max_i size(a_i))^(−d). For C>1 and 0<r<s, a matrix M∈Mat_{r×s}(O), or M∈Mat_{r×s}(O[t]), with size(M)<C has a nonzero kernel vector x over the same ring with size(x)<C^(r/(s−r)). The polynomial statement imposes no fixed degree bound on x.

Proof route: The product of conjugates of an integral element bounds its distinguished norm; perfect-closure extraction transports the estimate. Translate a polynomial by λ and use its first nonzero term for the multiplicity-sensitive Liouville bound. Riemann–Roch counts bounded integral elements in O_0 and gives the growth rate of bounded elements in O_0^{q^(−n)}. Pigeonhole produces a small nonzero kernel vector. For polynomial matrices write the bounded-degree multiplication map in coefficient bases; increase the source degree until its row/column ratio is close to r/s, then apply the matrix estimate.

Sources: ABP-v1, ABP §§3.2–3.3 pp.10–13, especially Lemmas 3.3.3–3.3.6.

Direct inputs: `FunctionFieldArithmetic:FA.0`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Anderson–Brownawell–Papanikolas lifting

Target `abp-lifting` (theorem); proposed declaration `TauCeti.Difference.Periods.abp_lifting`.

Let Φ∈Mat_r(k̄[t]) have determinant c(t−θ)^s with c∈k̄^×, s≥0. Let ψ∈E^r satisfy σ(ψ)=Φψ. For every row ρ∈k̄^r with ρψ(θ)=0, there exists a polynomial row P∈k̄[t]^r such that P ψ=0 as an entire function and P(θ)=ρ. The determinant is nonzero and has no roots apart from θ. The coefficients of P need not be constant or lie in F_q[t].

Proof route: For rank 1 propagate a zero along the distinct inverse-Frobenius orbit of θ; bounded-disk analytic zero finiteness forces the entire function to vanish. For larger rank clear arithmetic denominators and use the small-kernel estimate to construct bounded-size polynomial rows with a long interval of prescribed orbit zeros. Obtain a bounded-size scalar difference equation for the auxiliary function. If the auxiliary function never vanishes identically, its leading coefficient has a uniform lower bound by Liouville; Schwarz–Jensen gives an exponentially decreasing upper bound. Contradiction. Twist a vanishing auxiliary row through adjugate matrices. Its nonzero value at θ lies on the specified ρ-line; rescale to make that value exactly ρ.

Sources: ABP-v1, Theorem 3.1.1 pp.7–8; proof §3.4 pp.13–16; PAP-v2, Theorem 5.1.1 p.32; CCM-v2, Theorem 4.1.1 p.13; IKLNP-v2, Theorem 2.2 p.26.

Direct inputs: `entire-series`, `abp-estimates`, `coefficient-twist`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Specialization preserves relation rank

Target `specialization-rank` (theorem); proposed declaration `TauCeti.Difference.Periods.specialization_rank`.

Under ABP hypotheses, the k̄[t]-rank of the submodule of E generated by the components of ψ equals the k̄-dimension of their specialized span at θ. Equivalently the k̄-dimension of the specialized relation space equals the k̄(t)-dimension of the rational-function relation space. Evaluation of polynomial relation rows is surjective onto all specialized relations.

Proof route: The polynomial relation kernel is saturated in a finite free module over k̄[t], because its quotient embeds in the domain E and is torsion-free. Thus it is a direct summand; its basis specializes to independent rows. ABP supplies all specialized relations, giving equality of kernel dimensions and then equality of generated-span dimensions. The statement is about finite free relation modules; arbitrary specialization of ranks is not claimed.

Sources: PAP-v2, Proposition 5.1.5 pp.32–33.

Direct inputs: `abp-lifting`, `mathlib:Module.finrank`, `mathlib:Submodule.span`, `DrinfeldModulesAndTModules:DM.4`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Bounded monomial spans

Target `degree-span` (construction); proposed declaration `TauCeti.Difference.Periods.degreeSpan`.

For a finite family x:I→A in an F-algebra and d≥0, define D_d(x) as the native F-submodule spanned by products∏_i x_i^{e_i} with e:I→N and Σ_i e_i≤d. This includes the constant monomial 1. It is the image of the degree-at-most-d multivariate-polynomial subspace under evaluation, is finite-dimensional, and D_d⊆D_{d+1}. For all entries of Ψ, the vector formed by 1 and all columns of tensor powers Ψ^{⊗n}, 1≤n≤d, spans exactly D_d over K; its specialization spans D_d(Ψ(θ)) over k̄.

Proof route: Use native polynomial evaluation and exponent functions; repetitions among tensor-entry monomials do not change the span. The block system is [1] plus Φ^{⊗n} repeated r^n times, with exactly 1+Σ_{n=1}^d r^{2n} coordinates. This formula also works for r=1 and rank 0, avoiding the preprint geometric-series division.

Sources: PAP-v2, Theorem 5.2.2 proof p.33.

Direct inputs: `mathlib:Submodule.span`, `mathlib:MvPolynomial.aeval`, `fundamental-matrix`.

The API and its consumers:

- PAP Theorem 5.2.2 proof p.33: ABP applies to the block system of all bounded tensor-entry monomials, so specialization preserves each filtered span dimension.
- DM.8/period-transcendence: The imported degree-growth criterion converts equality of these filtered dimensions into equality of function-field transcendence degrees.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.degreeSpan_zero` | simp | D_0(x) is the F-span of 1. |
| `TauCeti.Difference.Periods.degreeSpan_mono` | relation | d≤e implies D_d(x)≤D_e(x). |
| `TauCeti.Difference.Periods.degreeSpan_polynomial` | compatibility | D_d is the image of degree-at-most-d multivariate polynomials under evaluation. |
| `TauCeti.Difference.Periods.degreeSpan_finite` | structure | For finite I, D_d is finite-dimensional over F. |

Definition tests:

- `TauCeti.Difference.Periods.test_degree_span_1`: D_0 contains 1 even for an empty family.
- `TauCeti.Difference.Periods.test_degree_span_2`: For the singleton x=0, every D_d is the span of 1.
- `TauCeti.Difference.Periods.test_degree_span_3`: For a transcendental singleton x, 1, x, x² have dimension 3 in D_2; constants or repeated coordinates alone cannot give this dimension.

### Period transcendence degree and Galois dimension

Target `period-transcendence` (theorem); proposed declaration `TauCeti.Difference.Periods.period_transcendence`.

Let M∈T have σ matrix Φ∈Mat_r(k̄[t])∩GL_r(k̄(t)) with det Φ=c(t−θ)^s, c≠0, s≥0. Let Ψ∈GL_r(T) have entries in E and σΨ=ΦΨ. Then trdeg_{k̄} k̄(Ψ_ij(θ))=dim_{F_q(t)}Γ_M. Equivalently this equals trdeg_{k̄(t)}k̄(t)(Ψ_ij). Polynomial determinant plus rigid triviality ensures an eligible Ψ exists by integral-trivialization and entire-from-equation. The theorem does not apply to a pre-t-motive lacking such a trivialization.

Proof route: Construct the bounded tensor-monomial block system. Its determinant remains a nonzero constant times a power of t−θ; its entries are entire. Specialization-rank equates dim_K D_d(Ψ) and dim_{k̄}D_d(Ψ(θ)) for every d. The degree-growth theorem for finitely generated domains equates their Krull dimensions and field transcendence degrees. Difference-smooth-dimension and tannakian-identification identify this dimension with Γ_M. No algebraic-independence conclusion for arbitrary matrix entries is inferred merely from a dimension equality.

Sources: PAP-v2, Theorem 5.2.2 p.33.

Direct inputs: `degree-span`, `specialization-rank`, `entire-from-equation`, `integral-trivialization`, `tannakian-identification`, `difference-smooth-dimension`, `SchemeAndStackFoundations:SF.1`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

## Carlitz logarithms and shared denominator descent

The deformation L_α is initially defined only for the principal small Carlitz logarithm. Arbitrary logarithms are handled by division points and the period lattice. In particular, logarithms with exponential zero require their own period case. The stated independence hypothesis is over k, while the conclusion is over k̄. The last denominator target is the shared difference-equation input used in the routed multizeta papers; their own block systems import it rather than creating additional copies of the definitions in this layer.

### Deformations of small Carlitz logarithms

Target `carlitz-deformation` (construction); proposed declaration `TauCeti.Difference.Periods.carlitzDeformation`.

For α∈k̄ with ||α||<q^(q/(q−1)), define L_α(t)=Σ_{i≥0} α^(q^i)/∏_{j=1}^i(t−θ^(q^j)), the empty denominator being 1. It defines a restricted series and converges on ||t||<q^q. It satisfies σ(L_α)=σ(α)+L_α/(t−θ) and L_α(θ)=log_C(α), where log_C is the chosen local inverse supplied by DM.2. L_α itself need not be entire; Ω L_α is entire once its difference system is used.

Proof route: Each denominator factor has nonzero constant coefficient, so use native formal power-series inversion for its expansion. The norm bound gives coefficientwise and disk convergence of the sum. Shift the summation index after inverse twist to prove the functional equation; specialization gives the Carlitz logarithm series from DM.2.

Sources: PAP-v2, §6.1.1 p.34.

Direct inputs: `entire-series`, `coefficient-twist`, `DrinfeldModulesAndTModules:DM.2`, `FunctionFieldArithmetic:FA.0`.

The API and its consumers:

- PAP §6.1.2 and Proposition 6.1.3 pp.34–35: Its Frobenius equation gives the lower-left logarithm-system entries; multiplication by Omega produces entire entries.
- PAP Theorem 6.3.2 pp.36–37: Evaluation at theta turns the linear torsor equations into relations among the period and the small principal logarithms.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.carlitzDeformation_zero` | simp | L_0=0. |
| `TauCeti.Difference.Periods.carlitzDeformation_add` | relation | L_{α+β}=L_α+L_β whenever all arguments are in the small disk; it is F_q-linear there. |
| `TauCeti.Difference.Periods.carlitzDeformation_twist` | relation | σ(L_α)=σ(α)+L_α/(t−θ). |
| `TauCeti.Difference.Periods.carlitzDeformation_value` | compatibility | At θ its convergent sum agrees with log_C(α). |

Definition tests:

- `TauCeti.Difference.Periods.test_carlitz_deformation_1`: The zero argument produces the zero series.
- `TauCeti.Difference.Periods.test_carlitz_deformation_2`: For β in the small disk, L_{−β}=−L_β.
- `TauCeti.Difference.Periods.test_carlitz_deformation_3`: For nonzero α in the small disk, L_α has nonzero constant coefficient; the source excludes zero when using the logarithmic extension.

### The Carlitz logarithm extension matrices

Target `logarithm-matrices` (construction); proposed declaration `TauCeti.Difference.Periods.logPhi`.

For r small algebraic arguments α_i, use index {0}⊔Fin r and define Φ by Φ_00=t−θ, Φ_i0=σ(α_i)(t−θ), Φ_ii=1 for i>0, with all remaining entries zero. Define Ψ by Ψ_00=Ω, Ψ_i0=Ω L_{α_i}, Ψ_ii=1 for i>0 and zeros elsewhere. Then det Φ=t−θ, det Ψ=Ω, σΨ=ΦΨ and Ψ∈GL_{r+1}(T) has entire entries. The represented pre-t-motive X fits 0→C→X→1^r→0 in the column-basis convention.

Proof route: Construct the matrices by native block constructors and verify their entries, determinant and equation using the Ω and L equations. Use entire-from-equation to prove Ω L entries are entire, instead of asserting L itself entire. DM.4 realizes the invertible rational matrix as a pre-t-motive.

Sources: PAP-v2, §6.1.2–Proposition 6.1.3 pp.34–35.

Direct inputs: `carlitz-deformation`, `entire-from-equation`, `DrinfeldModulesAndTModules:DM.2`, `DrinfeldModulesAndTModules:DM.4`.

The API and its consumers:

- PAP Proposition 6.1.3 pp.34–35: The explicit matrix realizes the Carlitz extension; tensoring with Carlitz supplies an effective lattice and proves membership in T.
- PAP §6.2 pp.35–36; Theorem 6.3.2 pp.36–37: The comparison matrix constrains the Galois group, whose linear equations determine the logarithm-span dimension.

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.Difference.Periods.logPhi_entries` | simp | Φ has the displayed first column and identity lower-right block. |
| `TauCeti.Difference.Periods.logPsi_entries` | simp | Ψ has first column (Ω, Ω L_i) and identity lower-right block. |
| `TauCeti.Difference.Periods.logMatrices_det` | relation | det Φ=t−θ and det Ψ=Ω. |
| `TauCeti.Difference.Periods.logMatrices_equation` | compatibility | The Ω and L equations imply σΨ=ΦΨ. |

Definition tests:

- `TauCeti.Difference.Periods.test_logarithm_matrices_1`: With r=0, Φ=t−θ and Ψ=Ω give the Carlitz object.
- `TauCeti.Difference.Periods.test_logarithm_matrices_2`: With one zero argument the matrices split as Carlitz plus unit.
- `TauCeti.Difference.Periods.test_logarithm_matrices_3`: Two copies of the same argument give equal off-diagonal entries; this setup cannot certify their linear independence.

### Membership of the logarithm extension in T

Target `logarithm-motive-membership` (theorem); proposed declaration `TauCeti.Difference.Periods.logarithm_motive_membership`.

For the logarithm matrices, X is an object of the chosen category T, not merely of R. Indeed C⊗X is the rationalization of a rigid-trivial dual Anderson motive M over k̄[t], with σ matrix (t−θ)Φ. It lies in 0→C^{⊗2}→M→C^r→0; it is finite free over k̄[t] and k̄[σ], and (t−θ)^n M⊂σ M for n≥2. Since T contains C^∨ and is closed under tensor products, X∈T.

Proof route: The explicit σ matrix gives the exact sequence and the power-annihilation condition. Import DM.4 finite generation and freeness over k̄[σ] for this lattice, including ABP Proposition 4.3.2; do not manufacture freeness from the polynomial rank alone. The fundamental matrix and integral/rational criterion give rigid triviality; tensor with C^∨ yields X.

Sources: PAP-v2, Proposition 6.1.3 pp.34–35; ABP-v1, Proposition 4.3.2 p.21.

Direct inputs: `logarithm-matrices`, `neutral-category`, `DrinfeldModulesAndTModules:DM.4`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### The Carlitz motivic Galois group

Target `carlitz-group` (theorem); proposed declaration `TauCeti.Difference.Periods.carlitz_group`.

For the Carlitz object C with σ matrix t−θ and fundamental Ω, Hom_T(C(m), C(n)) is F_q(t) for m=n and zero otherwise, and Γ_C≅G_m over F_q(t). The distinction between weights uses Ω∉C∞(t), which follows from its infinitely many zeros. In particular the Carlitz period π̃=−1/Ω(θ) is transcendental over k̄ by period-transcendence.

Proof route: The one-dimensional difference equation for Hom(C(m), C(n)) has solutions constant times Ω^{m−n}. A nontrivial power of Ω has infinitely many zeros or poles, so is not rational. The generated category is the integer-weight graded finite-dimensional category; import its G_m reconstruction from MC.6. Apply period-transcendence to the eligible rank-one Carlitz matrix.

Sources: PAP-v2, Lemma 3.5.3 and Theorem 3.5.4 pp.20–21; ABP-v1, §3.1.2 p.8.

Direct inputs: `neutral-category`, `analytic-fixed-fields`, `DrinfeldModulesAndTModules:DM.2`, `MotivesAndAlgebraicCycles:MC.6`, `period-transcendence`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### The linear Carlitz logarithm kernel

Target `logarithm-group-linear` (theorem); proposed declaration `TauCeti.Difference.Periods.logarithm_group_linear`.

For the logarithm object X, Γ_X is a smooth geometrically connected closed subgroup of G={[[a, 0], [v, I_r]]:a invertible}. The projection a gives a faithfully flat homomorphism π:Γ_X→G_m. Its kernel V is a vector subspace of G_a^r over F_q(t), as a group scheme, and π is smooth. A proof must establish separability of this particular projection before claiming V is smooth. This does not follow for an arbitrary surjective morphism of smooth groups. Consequently if F_1, …, F_s are homogeneous linear forms defining V and γ=(b_0, b)∈Γ_X(F) with b_0∉F_q, the ideal of Γ_X is generated by G_i=(b_0−1)F_i(v)−F_i(b)(a−1).

Proof route: The comparison matrix places Γ_X in G; the subobject C makes π faithfully flat. Scalar conjugation preserves V. Over a perfect closure, verify the particular scalar-action projection is separable. Then V is smooth, its geometric points are stable under all scalars, and their closure is a linear space. Descend its linear ideal. The verification of separability is recorded as an explicit gap rather than treating all smooth group surjections as smooth. With V vectorial, additive Hilbert 90 gives a rational γ over F. Its cyclic closure and translation by V generate Γ_X, providing the linear G_i equations.

Sources: PAP-v2, §6.2.1–6.2.4 and Propositions 6.2.3, 6.2.5 pp.35–36.

Direct inputs: `logarithm-motive-membership`, `carlitz-group`, `tannakian-identification`, `difference-smooth-dimension`, `SchemeAndStackFoundations:SF.1`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Linear relations and logarithm group dimension

Target `logarithm-linear-relations` (theorem); proposed declaration `TauCeti.Difference.Periods.logarithm_linear_relations`.

Let N be the k=F_q(θ)-linear span of π̃, log_C(α_1), …, log_C(α_r) for small algebraic arguments. Then dim_F Γ_X=dim_k N. More precisely each linear form F=Σ c_i v_i defining V and γ=(b_0, b_i) as above yields (b_0(θ)−1)Σ c_i(θ)log_C(α_i)−Σ c_i(θ)b_i(θ)π̃=0, and these span all k-linear relations. Evaluation F_q(t)→F_q(θ) is denominator-safe since θ is transcendental over F_q; the auxiliary rational torsor coefficient is separately proved regular at θ.

Proof route: The linear G_i equations translate to torsor equations H_i=G_i−f_i a. A σ equation propagates any putative pole of f_i at θ along an infinite twist orbit; hence f_i and its twist are regular there. Divide the torsor equation by Ω and evaluate using π̃=−1/Ω(θ). Independent linear forms provide r+1−dim Γ_X independent k-linear relations. Conversely trdeg≤linear-span dimension, while period-transcendence gives this trdeg=dim Γ_X. Equality proves completeness of the relations.

Sources: PAP-v2, §6.3.1 and Theorem 6.3.2 pp.36–37.

Direct inputs: `logarithm-group-linear`, `period-transcendence`, `carlitz-deformation`, `DrinfeldModulesAndTModules:DM.2`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Reduction to small algebraic logarithms

Target `logarithm-division` (theorem); proposed declaration `TauCeti.Difference.Periods.logarithm_division`.

For λ∈C∞ with exp_C(λ)∈k̄^×, there exist n≥0, α∈k̄^× with ||α||<q^(q/(q−1)), and f∈F_q[θ] such that λ=θ^n log_C(α)+f π̃. If exp_C(λ)=0, λ itself lies in F_q[θ]π̃. Thus any finite family of logarithms with algebraic exponentials is contained in the k-linear span of π̃ and finitely many small principal algebraic logarithms.

Proof route: If the exponential is already small, take it as α and n=0; otherwise solve θ x+x^q=β repeatedly in k̄. Newton polygon bounds shrink division points until the local inverse applies. Carlitz equivariance gives exp_C(θ^n log_C(α))=exp_C(λ); the kernel period lattice gives f π̃. Handle exp_C(λ)=0 separately; the printed nonzero-exponential lemma alone cannot cover such λ.

Sources: PAP-v2, Lemma 6.4.1 pp.37–38; §1.2 pp.3–4.

Direct inputs: `DrinfeldModulesAndTModules:DM.2`, `FunctionFieldArithmetic:FA.0`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

### Algebraic independence of Carlitz logarithms

Target `carlitz-logarithm-independence` (theorem); proposed declaration `TauCeti.Difference.Periods.carlitz_logarithm_independence`.

Let λ_1, …, λ_r∈C∞ with exp_C(λ_i)∈k̄ for all i. If this family is linearly independent over k=F_q(θ), it is algebraically independent over k̄. The linear field is k, not k̄. There is no fixed choice of principal branch for arbitrary λ_i. A nonzero period with exponential zero is eligible. The result is only for Carlitz logarithms, not for all higher-rank Drinfeld modules.

Proof route: Reduce to a finite-dimensional k-space N generated by the period and small principal logarithms. The previous two theorems give trdeg_{k̄}k̄(N)=dim_k N. Choose a k-basis of N; its size equals the transcendence degree, so it is algebraically independent over k̄. Extend the given independent family to such a basis using an invertible k-linear change of coordinates. Discarding extra basis vectors preserves algebraic independence. This argument handles zero-exponential periods and avoids an incorrect nonzero-only reduction.

Sources: PAP-v2, Theorem 6.4.2 p.38; Theorem 1.2.6 p.4.

Direct inputs: `logarithm-division`, `logarithm-linear-relations`, `period-transcendence`, `mathlib:AlgebraicIndependent`, `mathlib:Algebra.trdeg`, `FunctionFieldArithmetic:FA.0`.

Acceptance: A single nonzero Carlitz logarithm with algebraic exponential is transcendental, including π̃. The pair(λ, λ) fails the linearity hypothesis and has polynomial relation X_1−X_2. An invertible pre-t-motive with no analytic trivialization cannot be used to assert period independence.

### Frobenius-invariant common denominators

Target `constant-denominator` (theorem); proposed declaration `TauCeti.Difference.Periods.constant_denominator`.

Let Φ_i∈Mat_{r_i}(k̄[t]) have det Φ_i=c_i(t−θ)^{s_i}, c_i≠0, s_i≥0, i=1, 2. If B∈Mat_{r_1×r_2}(k̄(t)) satisfies σ(B)Φ_2=Φ_1B, its monic least common denominator belongs to F_q[t]. Thus a nonzero polynomial over F_q clears all entries. The matrix B is rational; the polynomial domain printed in CPY Proposition 2.2.1 is treated by the existing extraction correction.

Proof route: The denominator of σ(B) divides den(B)(t−θ)^{s_2}. If it has a pole at θ, repeated Frobenius shifts force infinitely many distinct poles, using both determinant conditions. Therefore the monic denominator is σ-fixed and lies in F_q[t]. This also proves rationalized Hom compatibility for DM.4 without redefining the motives.

Sources: PAP-v2, Proposition 3.4.5 pp.18–19; CPY-v2, Proposition 2.2.1 p.6; CCM-v2, Lemma 5.1.1 proof p.24.

Direct inputs: `coefficient-twist`, `analytic-fixed-fields`, `DrinfeldModulesAndTModules:DM.4`, `mathlib:RatFunc`.

Acceptance: Check every field, scalar extension and twist convention in the statement.

## Acceptance cases and mathematical boundaries

The twelve inherited fixed-vector examples test complex conjugation with constant field R, its one-dimensional real fixed space, and the scalar-extension isomorphism to C. Identity on Q and the zero-dimensional identity are positive cases. Multiplication by 2 on Q is an invertible operator with no nonzero fixed vectors, so its comparison is not surjective. Identity on C with proposed constants R fails exact constants; the R-independent pair 1,i becomes C-dependent. The conjugation argument also rejects i as a fixed vector and rejects repeated vectors as an independent family. These examples guard the hypotheses used by every subsequent comparison.

The logarithm theorem gives transcendence for one nonzero eligible logarithm, including a nonzero Carlitz period whose exponential is zero. A pair consisting of the same logarithm twice fails k-linear independence and has the polynomial relation X₁−X₂. An invertible pre-t-motive without an analytic trivialization is ineligible for the period theorem. The suggested file's native comparison test makes that last failure explicit rather than supplying a vacuous field-valued period matrix.

There is one substantive source-proof verification still required in the logarithm chain. A surjective morphism between smooth groups can be inseparable in positive characteristic. Thus smoothness of Γ_X and of G_m does not by itself imply smoothness of its kernel. The particular scalar-action projection in Papanikolas Proposition 6.2.3 must have its Lie-algebra/separability verification established before descending the vector-subspace kernel. The node states the intended theorem, and its proof route and gap identify that exact point. The subsequent dimension and independence results depend on it; none is recorded as implemented or closed.

## Supplier contracts

Each request is an imported dependency, with consumers attached in the packet. Existing general theories stay with their owners. No tier move or new competing owner is proposed here.

### DrinfeldModulesAndTModules:DM.2

Supply the chosen completion C_infinity of an algebraic closure of F_q((1/θ)), the Carlitz exponential and its kernel F_q[θ]·π̃, its local inverse on |α|<q^(q/(q−1)), and compatible period normalization π̃=−1/Ω(θ). These are inputs to the actual analytic field, the rank-one test and the arbitrary-logarithm reduction, not assumptions on a generic Prop-valued object.

Consumers: `entire-series`, `tate-analytic-interface`, `analytic-separability`, `integral-trivialization`, `carlitz-deformation`, `logarithm-matrices`, `carlitz-group`, `logarithm-linear-relations`, `logarithm-division`.

### DrinfeldModulesAndTModules:DM.4

Supply the motive types and rationalization with explicit reconciliation between the campaign contravariant τ convention and Papanikolas dual Anderson σ convention σ(c)=c^(1/q), σ(t)=t. Export the invertible semilinear pre-t-motive operator, its L-scalar extension and the F_q(t)-linear underlying map, Hom compatibility, and the appropriate abelian dual-motive image. Do not assert all t-modules are rigid analytically trivial.

Consumers: `rigid-triviality`, `fundamental-betti-basis`, `integral-trivialization`, `betti-exact-tensor`, `neutral-category`, `tannakian-identification`, `specialization-rank`, `logarithm-matrices`, `logarithm-motive-membership`, `constant-denominator`.

### MotivesAndAlgebraicCycles:MC.6

For a rigid abelian neutral Tannakian category over an arbitrary field F (especially the imperfect positive-characteristic field F_q(t)) and an exact faithful F-linear tensor fibre functor to finite vector spaces, supply affine tensor-automorphism representability, reconstruction, tensor-generator finite type, fibre-functor isomorphism torsors, and the fully-faithful/subobject versus faithfully-flat and tensor-generation versus closed-immersion criteria. Current MC.6/tensor-automorphism-group and pro-algebraic-approximation require a specified diagram category and coalgebra; MC.3/tannakian-category assumes characteristic zero. None supplies the needed general input as stated. Reuse native Hopf-comodule reconstruction, then add the missing general interface in MC.6.

Consumers: `neutral-category`, `tannakian-identification`, `carlitz-group`.

### FunctionFieldArithmetic:FA.0

Supply the chosen rational function field F_q(θ), exact constant field and its infinite-place normalization, and the smooth projective curve corresponding to a finite separable extension of the one-variable field over the perfect constant field bar(k). Export compatibility of the field/curve correspondence with the coefficient Frobenius automorphism, as needed in Papanikolas Proposition 4.3.3. Keep the analytic completion at DM.2 and the difference-field constant calculation at DM.8. For arbitrary field extensions, supply the equivalence of separability with native geometric reducedness and the characteristic-p p-basis/linear-disjointness criterion. Algebra.IsSeparable is algebraic separability and must not replace this general extension property. Import current TauCetiRoadmap ReductiveGroupsPartII RG2.3.7 Lang.lang_surjective and export its semilinear GL_r matrix specialization; the general Lang theorem is already owned upstream.

Consumers: `twisting-limit`, `analytic-fixed-fields`, `analytic-separability`, `relative-algebraic-closure`, `entire-from-equation`, `abp-estimates`, `carlitz-deformation`, `logarithm-division`, `carlitz-logarithm-independence`.

### SchemeAndStackFoundations:SF.3

Through the existing AlgebraicCurves/JacobianChallenge owner, supply Riemann–Roch for a smooth projective curve over bar(k) and a sufficiently large effective divisor above infinity: its L(D) is finite-dimensional and contains field generators. Export functorial transport by the coefficient automorphism for Papanikolas Proposition 4.3.3. Do not re-plan the underlying curve/Riemann–Roch theory in DM.8.

Consumers: `relative-algebraic-closure`.

### SchemeAndStackFoundations:SF.1

Supply effective faithfully flat descent and detection for affine morphism equality, isomorphisms and torsor action diagrams: DM.8 constructs Σ=K[Ψ,det(Ψ)^−1] and must descend the explicit Z×Z≅Z×Γ_K relation and the group structure from faithfully flat scalar extension. This is scheme-level descent over imperfect fields, not a criterion using only rational points. Generic fibre-functor torsors remain MC.6. Also export the affine-domain dimension/transcendence equality and bounded-generator degree-growth formulation, including invariance under field extension.

Consumers: `solution-ring`, `solution-ring-simple`, `difference-torsor`, `difference-smooth-dimension`, `difference-invariants`, `entire-from-equation`, `period-transcendence`, `logarithm-group-linear`.

### tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras

Layer0.5 restricted-series/Weierstrass interface: normalized one-variable zero/pole factorization over complete algebraically closed rank-one C∞ and zero-count/growth (Schwarz–Jensen) for an entire function on a bounded disk. Generic Tate theory is already owned here; instantiate its native restricted-series carrier rather than define a second one.

Consumers: `tate-analytic-interface`, `abp-lifting`.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

Use the current roadmap Riemann–Roch targets for smooth projective curves: sufficiently large divisors above infinity give finite-dimensional function spaces containing field generators; the arithmetic version gives bounded integral-element counts used by ABP. Supply the compatibility with the coefficient Frobenius transport through the FA.0 curve interface.

Consumers: `relative-algebraic-closure`, `abp-estimates`.

## Suggested-file correspondence and omissions

Every one of the eleven definitions/constructions, all 43 API names and all 33 test names appears in the suggested file. Tests are marked by their packet names immediately before native examples. The native fundamental-matrix predicate permits commutative coefficient rings as well as fields, so the integral T-valued condition is not forced into a nonexistent field instance. The generic solution-space construction accepts a matrix over L; matrices over K enter through the specified embedding. The comparison algebra uses the determinant of the inverse matrix, which equals the inverse determinant in its tensor ring.

The fixed-vector nine-node component has all its named signatures. Additional full or native formulations include coefficient twist, entire evaluation, rigid triviality, admissible fields, fundamental matrices and coordinates, solution-ring simplicity, the coordinate torsor and Hopf structure, the dimension/group-smoothness forms, both ideal-descent theorems, ABP lifting, specialization rank, denominator clearing and Carlitz logarithm independence. The Carlitz exponential in the last theorem is a native additive map characterized by its exact DM.2 series. It is not a new exponential definition or an arbitrary map with a theorem assumed about it.

The period signature states the equivalent specialization equality with t among the function generators: the transcendence degree over k̄ of k̄(t,Ψ_ij) equals one plus the transcendence degree of k̄(Ψ_ij(θ)). This uses a canonical scalar map into the native fraction ring. The packet's equality over k̄(t), and its identification with the dimension of Γ_M, remain the definitive mathematical statements.

The following signatures require supplied interfaces and are omitted or limited explicitly:

- The Tate Gauss-norm/preparation comparison and twisting-limit theorem require the current norm instance and the chosen residue-field identification. Analytic separability and the fraction-field/higher-power parts of exact constants require the actual analytic field and its canonical rational-function algebra tower. The restricted-series fixed-polynomial part is already stated.
- Fundamental matrices versus motive Betti bases, the integral lattice/trivialization theorem, exact tensor Betti comparison and the neutral category require DM.4's dual-σ motive category, scalar extension and rationalization. Their category-valued parts cannot be represented by opaque motive types. MC.6 must supply reconstruction over the actual imperfect field.
- Relative algebraic closure requires the analytic field instantiation and FA.0's curve/Frobenius transport. The geometric invariant-field theorem requires the actual σ-power algebraic-closure fields and the action on the base-changed solution field. Tannakian identification requires the actual tensor functor and its group scheme.
- ABP's arithmetic estimates require the normalized infinite-place size and integral/perfect-closure interfaces in FA.0. The period signature supplies the specialization field equality, while its full group-dimension form still requires the motive/category interfaces.
- Membership of the logarithm extension, the Carlitz group, its linear kernel and the linear-relations theorem require actual motives and affine groups. The kernel additionally retains the separability verification described above. The division theorem needs the normalized period and local inverse from DM.2. Denominator clearing is stated natively; its monic least-denominator refinement requires the matching polynomial denominator API.

These are concrete missing interfaces, not generic proposition fields, hidden conditions or substituted characteristic-zero assumptions. All their mathematical statements, sources and proof routes are present in the target specifications. The three recorded gaps group these exact omissions and the kernel verification, and coverage.remaining identifies the work needed to close the stage. Elaboration of the signatures does not prove the mathematical results.

## Source versions and source-use audit

The statements and proof routes are written for these targets in our own words. No source passages or sequential source summaries are stored in the deliverables. Page numbers refer to the downloaded preprint unless explicitly marked printed. The full Papanikolas preprint was read, and the full ABP criterion proof and restricted-to-entire argument were read, not only the criterion's citation in Papanikolas. The multizeta readings identify consumers of the shared interface; they do not transfer their specialized motives to DM.8.

- **PAP-v2**: Matthew A. Papanikolas, *Tannakian duality for Anderson–Drinfeld motives and algebraic independence of Carlitz logarithms*. arXiv math/0506078v2, 29 June 2007; preprint of Invent. Math. 171 (2008), 123–174. [PAP-v2](https://arxiv.org/pdf/math/0506078v2). Read: Entire preprint pp.1–39; target proof chain §§2–6 checked. Existing visual and source-issue audits from the checkpoint are retained as attributed evidence.. SHA-256: `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.

- **ABP-v1**: G. W. Anderson, W. D. Brownawell, M. A. Papanikolas, *Determination of the algebraic relations among special Γ-values in positive characteristic*. arXiv math/0207168v1; preprint of Annals160(2004),237–313. [ABP-v1](https://arxiv.org/pdf/math/0207168v1). Read: §§2.1–2.5 pp.6–7; §3 pp.7–16, including the full proof of Theorem3.1.1 and Proposition3.1.3; Proposition4.3.2 p.21. SHA-256: `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2`.

- **NGO-HAL**: Tuan Ngo Dac, *On Zagier–Hoffman’s conjectures in positive characteristic*. HAL hal-03298790, version accessed2026-10-10. [NGO-HAL](https://hal.science/hal-03298790/document). Read: §§4.1–4.3 printedpp.17–18 and §5.2 printedpp.20–21; selected use in §6. SHA-256: `f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d`.

- **CCM-v2**: Chieh-Yu Chang, Yen-Tsung Chen, Yoshinori Mishiba, *On Thakur’s basis conjecture for multiple zeta values in positive characteristic*. arXiv2205.09929v2. [CCM-v2](https://arxiv.org/pdf/2205.09929v2). Read: §4.1 p.13; Lemma5.1.1 proof pp.22–24. SHA-256: `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b`.

- **IKLNP-v2**: B.-H. Im, H. Kim, K. N. Le, T. Ngo Dac, L. H. Pham, *Zagier–Hoffman’s conjectures in positive characteristic*. arXiv2205.07165v2 (10June2024). [IKLNP-v2](https://arxiv.org/pdf/2205.07165v2). Read: §2.1 and Theorem2.2 p.26; selected §2.2 p.27 and proof use p.33. SHA-256: `74a40b2e45b54760765247a010811d278e48f0b30f361bf3d9ca8cb92fd4b43e`.

- **CPY-v2**: Chieh-Yu Chang, Matthew A. Papanikolas, Jing Yu, *An effective criterion for Eulerian multizeta values in positive characteristic*. arXiv1411.0124v2. [CPY-v2](https://arxiv.org/pdf/1411.0124v2). Read: Proposition2.2.1 and proof p.6. SHA-256: `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549`.

The earlier checkpoint recorded six notation/indexing issues in the Papanikolas preprint. They remain attributed to that version and await independent review. The previous worker inspected publication metadata but did not obtain and collate the version of record; this continuation does not upgrade those findings to claims about the published paper. Their records are paraphrased and the corrections retain the dimensions or coefficient-field information needed by this plan.

- `DrinfeldModulesAndTModules/E-DM8-1`, arXiv math/0506078v2 (29 June 2007), Proposition 3.3.14 proof, p.16: Use Ψ_P∈GL_r(L), Ψ_Q∈GL_s(L) for the independently chosen ranks r and s; their tensor matrix has size rs. The proposition permits P and Q of different ranks; choosing ranks 1 and 2 makes the shared r annotation incorrect. The tensor/dual argument itself is unchanged.

- `DrinfeldModulesAndTModules/E-DM8-2`, arXiv math/0506078v2 (29 June 2007), §3.4.1, p.17, and Proposition 3.4.7, p.19: The representing matrix is r×r. It multiplies the r×1 basis column, and its determinant is used immediately. For r=2 the printed matrix product and determinant have the wrong types.

- `DrinfeldModulesAndTModules/E-DM8-3`, arXiv math/0506078v2 (29 June 2007), Theorem 3.5.4 proof, p.21: The coefficient field of the graded-vector-space category in this argument is F_q(t). Lemma 3.5.3 gives endomorphisms of each Carlitz tensor power equal to F_q(t), and the fibre functor in the same sentence takes values in Vec(F_q(t)); a bar(k)(t)-linear equivalence would change that endomorphism field.

- `DrinfeldModulesAndTModules/E-DM8-4`, arXiv math/0506078v2 (29 June 2007), Lemma 4.5.7 proof, p.30: The displayed basis-column matrix has size s×(s−m). C has m rows and s−m columns. Stacking −C above I_{s−m} gives s rows and s−m columns and makes its product with [I_m,C] defined.

- `DrinfeldModulesAndTModules/E-DM8-5`, arXiv math/0506078v2 (29 June 2007), Theorem 5.2.2 proof, p.33: Use N=Σ_{n=0}^d r^(2n); the quotient expression is only for r≠1, and N=d+1 for r=1. The proof includes rank-one motives. At r=1 the printed quotient is 0/0, whereas the concatenated vector has d+1 entries. This changes no theorem hypothesis.

- `DrinfeldModulesAndTModules/E-DM8-6`, arXiv math/0506078v2 (29 June 2007), Proposition 6.1.3 proof, p.34: Use m=[m_0,m_1,…,m_r]^tr in the equation σm=(t−θ)Φm. The module has rank r+1 and Φ is an (r+1)×(r+1) matrix; the printed vector omits its first coordinate. The subsequent submodule C tensor C is generated in that coordinate.

## Baseline correspondence

The declaration names below identify existing objects/results at the recorded pins. Each provides the indicated native input; they do not certify the planned targets. In particular, the Hopf-comodule points/tensor-automorphism isomorphism is a useful existing reconstruction component, not the missing arbitrary neutral-category theorem.

| Baseline declaration | Input supplied |
|---|---|

| `mathlib:LinearMap.fixedSubmodule` | For an F-linear endomorphism f, the native F-submodule of vectors v satisfying f(v)=v. |

| `mathlib:LinearMap.mem_fixedSubmodule_iff` | Membership is exactly the equation f(v)=v. |

| `mathlib:LinearMap.fixedSubmodule_eq_ker` | The fixed submodule is the kernel of f−id. |

| `mathlib:LinearMap.fixedSubmodule_eq_top_iff` | The fixed submodule is all of V exactly when f=id. |

| `mathlib:Submodule.subtype` | The native linear inclusion of a submodule. |

| `mathlib:Submodule.subtype_injective` | The inclusion of a submodule is injective. |

| `mathlib:LinearMap.liftBaseChangeEquiv` | F-linear maps W→V correspond to L-linear maps L⊗_F W→V when V is an L-module. The native abbreviation liftBaseChange applies this equivalence. |

| `mathlib:LinearMap.liftBaseChange_tmul` | The scalar extension of j sends a⊗w to a·j(w). |

| `mathlib:LinearMap.range_liftBaseChange` | The image of the lifted map is the L-linear span of the original image. |

| `mathlib:Submodule.mem_span_range_iff_exists_fun` | For a finite family, membership in its span is equivalent to a finite coefficient expansion. |

| `mathlib:linearIndependent_iff'` | Linear independence is equivalent to every finite relation having zero coefficients. |

| `mathlib:linearIndependent_finSucc` | A Fin(n+1)-family is independent iff its tail is independent and its first vector is outside the tail span. |

| `mathlib:linearIndependent_iff_finset_linearIndependent` | An arbitrary family is independent iff all finite subfamilies are independent. |

| `mathlib:LinearIndependent.restrict_scalars'` | Independence descends from L to F under faithful scalar restriction, the reverse direction to the new fixed-vector theorem. |

| `mathlib:LinearIndependent.map'` | A linear map with zero kernel preserves linear independence. |

| `mathlib:Module.Free.chooseBasis` | A basis indexed by ChooseBasisIndex for a free module; vector spaces are free. |

| `mathlib:Module.Basis.linearIndependent` | The family supplied by a basis is linearly independent. |

| `mathlib:Module.Basis.span_eq` | The range of a basis spans the whole module. |

| `mathlib:Module.Basis.injective_constr_of_linearIndependent` | The map prescribed on a basis is injective when the prescribed images are independent. |

| `mathlib:Module.Basis.baseChange` | An F-basis gives the L-basis of L⊗_F W by scalar extension. |

| `mathlib:Module.Basis.baseChange_apply` | The scalar-extended basis vector is 1⊗b_i. |

| `mathlib:LinearIndependent.finite` | An independent family in a finite module has finite index type. |

| `mathlib:Module.Basis.finiteDimensional_of_finite` | A basis indexed by a finite type proves finite dimensionality. |

| `mathlib:Module.finrank_baseChange` | The L-dimension of L⊗_F W equals the F-dimension of W. |

| `mathlib:LinearMap.finrank_le_finrank_of_injective` | An injective linear map into a finite module bounds the domain finrank by the codomain finrank. |

| `mathlib:LinearMap.injective_iff_surjective_of_finrank_eq_finrank` | For finite-dimensional spaces of equal dimension, a linear map is injective iff surjective. |

| `mathlib:LinearEquiv.finrank_eq` | A linear equivalence preserves finrank. |

| `mathlib:Complex.conjAe` | Complex conjugation as an R-algebra automorphism, with its R-linear map for acceptance examples. |

| `mathlib:Complex.basisOneI` | The real basis 1,I of C; supplies a counterexample when exact constants or fixedness is omitted. |

| `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | Audit boundary only: for an existing commutative Hopf algebra over a field, the point functor is naturally isomorphic to the tensor-automorphism functor of its finite comodules. It does not reconstruct a Hopf algebra from an arbitrary neutral category. |

| `mathlib:iterateFrobeniusEquiv` | Iterated p-Frobenius equivalence on a perfect characteristic-p ring; its inverse supplies the inverse coefficient q-twist. |

| `mathlib:PowerSeries.map` | Coefficientwise ring homomorphism on formal power series, leaving the variable unchanged. |

| `mathlib:PowerSeries.IsRestricted.subring` | Native radius-c restricted power-series subring of a normed ring. |

| `mathlib:IntermediateField.adjoin` | Native intermediate field generated by a set in an extension field. |

| `mathlib:RatFunc` | Native rational-function type, equivalent to the fraction ring of a polynomial ring. |

| `mathlib:Algebra.IsGeometricallyReduced` | Native geometric-reducedness class; over a field it means reducedness after algebraic-closure scalar extension and expresses general field-extension separability. |

| `mathlib:Matrix.GeneralLinearGroup` | Native general linear group as units of the square matrix ring. |

| `mathlib:AlgEquiv` | Native algebra equivalence with compatibility with the specified scalar map. |

| `mathlib:IsScalarTower` | Compatibility of successive scalar actions, used for the field and tensor towers. |

| `mathlib:Submodule` | Native submodule of a module, used for solution and degree spans. |

| `mathlib:Algebra.adjoin` | Least native subalgebra containing a specified generator set. |

| `mathlib:Matrix.det` | Determinant of a finite square matrix over a commutative ring. |

| `mathlib:Algebra.TensorProduct.includeLeft` | The left tensor-product algebra map sending a to a tensor 1. |

| `mathlib:Algebra.TensorProduct.includeRight` | The right tensor-product algebra map sending b to 1 tensor b. |

| `mathlib:Ideal.map` | Extension of an ideal along a ring homomorphism. |

| `mathlib:Ideal.comap` | Contraction of an ideal along a ring homomorphism. |

| `mathlib:CommHopfAlgCat` | Native category of commutative Hopf algebras, used only after the Hopf structure is proved. |

| `tauceti:TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced` | Finite-type geometrically reduced commutative Hopf algebras over a field are smooth; this is a group criterion, not a general scheme criterion. |

| `mathlib:Module.finrank` | Natural-valued finite rank of a module, used only with explicit finite-dimensional hypotheses. |

| `mathlib:Submodule.span` | Native scalar span of a set. |

| `mathlib:MvPolynomial.aeval` | Multivariate-polynomial algebra evaluation into a specified algebra. |

| `mathlib:AlgebraicIndependent` | Injectivity of multivariate-polynomial evaluation, the native notion of algebraic independence. |

| `mathlib:Algebra.trdeg` | Cardinal-valued transcendence degree of an algebra. |

| `mathlib:ringKrullDim` | Krull dimension of a commutative ring, valued in the extended natural numbers with bottom. |


## Coverage and atlas presentation

The six planets are Rigid analytic triviality, Neutral Tannakian category, Difference Galois torsor, ABP lifting criterion, Period transcendence degree and Carlitz logarithm independence. They mark the constructions and named results at the center of the layer. Smaller proof steps remain inside their proof routes; the retained fixed-vector component is the only inherited lemma-level portion.

Every DM.8 target is represented in the packet. The stage remains planned until its supplier exports, the particular logarithm-kernel separability verification and the listed full signatures are discharged. Independent review should check that the exact analytic hypotheses, the imperfect-field reconstruction contract, the group-scheme argument and the principal/arbitrary logarithm distinction agree across all four deliverables. Implementation status is unchecked throughout.
