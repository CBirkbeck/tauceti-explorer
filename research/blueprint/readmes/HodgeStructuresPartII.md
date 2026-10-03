# Affine common-parameter tensor and pullback

For two preconnections D,C with the same parameter λ, the native equivalence u:S⊗_R(E⊗_R F)≅(S⊗_R E)⊗_S(S⊗_R F) intertwines the actual pullback of D⊗C with the tensor of their actual pullbacks. Pullback of the unit connection identifies under the native right-unitor with f(λ)dΓ. The derivative term appears once. The proof first tensors actual semilinearly horizontal maps, then uses the scalar-unit comparison and uniqueness of affine pullback. All module and coefficient carriers are native and arbitrary.

The structural comparisons and their two horizontal directions hold without d₀λ=0, flatness, bases or projectivity. Extended differentials and additive curvature commute with the same equivalences. The flatness equivalence compares two S-connections; it does not detect curvature over R. The separate test transporting flat factors assumes dΩλ=0.

Two concrete computations check the boundary: the ℤ→ℤ[x] pullback of two λ=2 unit lines gives coefficient2, with2≠4; the actual nonflat quotient ℤ→ℤ/2 erases the tensor Higgs operator’s source value2. These are operator computations, not a sheaf-gluing or curvature-reflection assertion. Six further typed tests cover the parameter, Higgs specialization, inverse scalar formula, flat factors, zero section and unit derivative.

Actual affine pullback now respects the common-λ tensor and unit through native distribBaseChange and rid, with structural equalities, both horizontal directions, exterior-extension and curvature comparisons and equivalent flatness of the two S-connections. No d₀λ=0, flatness, basis or projectivity is needed for those comparisons. This does not reflect source curvature or prove global monoidal coherence. Universal exterior-power base-change, identity/three-step categorical pullback coherence, dual comparison and E1 sheaf tensor/restriction, equality detection and effective gluing remain. The reserved global key,149 routed items,35 omissions, five requests, eleven gaps, determinant/Tate/period adapters, arbitrary-Q tensor-valued shuffle and H.1–H.8 remain open. Previous frontier text is checkpoint history.

The14 new lemmas and8 examples compile in a separate native proof file without admissions; its132 axiom audits use only the standard kernel axioms. The complete Mathlib-only canonical suggested file is checked with admission warnings only. All implementation statuses remain unchecked and all nine stage statuses retain their previous values. Public evidence and exact checks are in the handoff.

Fresh source conventions: [Esnault–Groechenig, author printed23–24](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf) and [Stacks §60.15](https://stacks.math.columbia.edu/tag/07J5). The exact arbitrary-ring tensor/pullback comparison is an authored deduction. The inherited EG20/E10 issue/version envelope and all route obligations remain unchanged.

## Semilinear transport of the first tensor summand

HodgeStructuresPartII:H.0/semilinear-tensor-right-comm. Proposed declaration: `TwoForms.Morphism.tensor_rightComm`.

For a calculus morphism m over f:R→S, f-semilinear h:E→E′ and j:F→F′, x∈E⊗_R W and y∈F, rightComm_S((h⊗m.one)x⊗j(y))=((h⊗j)⊗m.one)(rightComm_R(x⊗y)). All maps are actual native semilinear tensor maps.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism, mathlib:TensorProduct.map, mathlib:TensorProduct.rightComm, mathlib:TensorProduct.induction_on.

Proof outline:

- Induct on the actual tensor x. Additivity handles zero/sums; native map_tmul and rightComm_tmul give the pure-tensor case.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Semilinear transport of the second tensor summand

HodgeStructuresPartII:H.0/semilinear-tensor-assoc-inverse. Proposed declaration: `TwoForms.Morphism.tensor_assoc_symm`.

For the same m,h,j, x∈E and y∈F⊗_R W, assoc_S⁻¹(h(x)⊗(j⊗m.one)y)=((h⊗j)⊗m.one)(assoc_R⁻¹(x⊗y)). The comparison crosses actual coefficient rings.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism, mathlib:TensorProduct.map, mathlib:TensorProduct.assoc, mathlib:TensorProduct.induction_on.

Proof outline:

- Induct on y. The pure-tensor component is the native associator inverse evaluation; sums follow by additivity.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Tensoring horizontal maps across coefficient rings

HodgeStructuresPartII:H.0/semilinear-tensor-horizontal. Proposed declaration: `Preconnection.semilinearHorizontal_affineTensor`.

If h is semilinearly horizontal from D to D′ over m and j is semilinearly horizontal from C to C′ over m, then the actual h⊗j is semilinearly horizontal from D.affineTensor(C) to D′.affineTensor(C′). D and C share λ, and the target pair shares f(λ); there is one common parameter.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-horizontal, HodgeStructuresPartII:H.0/affine-parameter-tensor, HodgeStructuresPartII:H.0/semilinear-tensor-right-comm, HodgeStructuresPartII:H.0/semilinear-tensor-assoc-inverse.

Proof outline:

- Induct on E⊗_R F. Expand the two tensor-connection summands on a pure tensor.
- Substitute the given horizontal equations and apply the two native cross-ring permutation comparisons. No linearity of the connection operator is asserted.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Scalar units under tensor distribution

HodgeStructuresPartII:H.0/scalar-unit-tensor-distribution. Proposed declaration: `scalarUnit_distribBaseChange`.

For every x∈E⊗_R F, the existing distribBaseChange equivalence sends η(x) to (η_E⊗η_F)(x), where η(e)=1⊗e. The equality is on the actual tensor carriers.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/scalar-extension-unit, mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange, mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul.

Proof outline:

- Induct on x and use the existing equivalence evaluation on a pure tensor.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## The differential coefficient comparison

HodgeStructuresPartII:H.0/scalar-unit-tensor-distribution-forms. Proposed declaration: `scalarUnit_distribBaseChange_tensor`.

Let u=distribBaseChange:R-algebra extension S⊗_R(E⊗_R F)≅(S⊗_R E)⊗_S(S⊗_R F). For every x∈(E⊗_R F)⊗_R W, (u⁻¹⊗id_V)(((η_E⊗η_F)⊗m.one)x)=(η_(E⊗F)⊗m.one)x.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/scalar-unit-tensor-distribution, HodgeStructuresPartII:H.0/calculus-ring-morphism, mathlib:TensorProduct.map.

Proof outline:

- Induct on x. Rewrite the inner pair of scalar units using tensor distribution and cancel the actual native equivalence with its inverse.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Tensor pullback as equality of preconnections

HodgeStructuresPartII:H.0/affine-pullback-tensor-equality. Proposed declaration: `Preconnection.affinePullback_tensor_eq`.

Transporting the actual tensor D_S.affineTensor(C_S) by u⁻¹ gives exactly (D.affineTensor(C))_S as a Preconnection structure, where D_S=D.affinePullback(m) and u is the native distribBaseChange equivalence. This holds for arbitrary λ, E,F and R→S without d₀λ=0, flatness, projectivity, bases or injectivity.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback, HodgeStructuresPartII:H.0/affine-pullback-unique, HodgeStructuresPartII:H.0/affine-pullback-unit-horizontal, HodgeStructuresPartII:H.0/semilinear-tensor-horizontal, HodgeStructuresPartII:H.0/scalar-unit-tensor-distribution-forms, HodgeStructuresPartII:H.0/affine-coordinate-transport.

Proof outline:

- Apply the existing uniqueness of affine pullback to the transported tensor connection.
- Check horizontality of the scalar-extension unit using the semilinear tensor theorem for η_E,η_F.
- The preceding differential coefficient comparison identifies the two actual target maps; uniqueness yields equality of structures.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## The inverse tensor comparison is horizontal

HodgeStructuresPartII:H.0/affine-pullback-tensor-horizontal-inverse. Proposed declaration: `Preconnection.affinePullback_tensor_horizontal_inv`.

For x∈(S⊗_R E)⊗_S(S⊗_R F), (D⊗C)_S(u⁻¹x)=(u⁻¹⊗id_V)((D_S⊗C_S)(x)). This uses the actual inverse native module equivalence.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tensor-equality, HodgeStructuresPartII:H.0/coordinate-transport-horizontal.

Proof outline:

- Rewrite by the equality of preconnection structures and use the native module-transport horizontal law.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## The forward tensor comparison is horizontal

HodgeStructuresPartII:H.0/affine-pullback-tensor-horizontal. Proposed declaration: `Preconnection.affinePullback_tensor_horizontal`.

For x∈S⊗_R(E⊗_R F), (D_S⊗C_S)(u(x))=(u⊗id_V)((D⊗C)_S(x)). Thus the existing native tensor-distribution equivalence intertwines the constructed operators.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tensor-horizontal-inverse, HodgeStructuresPartII:H.0/affine-parameter-horizontal-inverse.

Proof outline:

- Apply the existing inverse-horizontal theorem to u⁻¹ and the preceding equation.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Tensor pullback commutes with exterior extension

HodgeStructuresPartII:H.0/affine-pullback-tensor-extension. Proposed declaration: `Preconnection.affinePullback_tensor_extend`.

The actual degree-one extended differentials commute with u⊗id_V on input and u⊗id_Y on output. Both compared connections and both extended operators are over S and the supplied calculus Γ.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tensor-horizontal, HodgeStructuresPartII:H.0/extension-horizontal.

Proof outline:

- Apply the existing extended-differential naturality to the actual forward horizontal map u. This compares supplied forms over S, not universal exterior powers across R→S.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Tensor pullback commutes with curvature

HodgeStructuresPartII:H.0/affine-pullback-tensor-curvature. Proposed declaration: `Preconnection.affinePullback_tensor_curvature`.

For every x∈S⊗_R(E⊗_R F), κ_(D_S⊗C_S)(u(x))=(u⊗id_Y)(κ_((D⊗C)_S)(x)). No relatively constant parameter is needed for this additive curvature naturality.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tensor-horizontal, HodgeStructuresPartII:H.0/curvature-horizontal.

Proof outline:

- Apply the existing curvature naturality to the actual module equivalence u and its forward horizontal equation.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Equivalent flatness of the two target connections

HodgeStructuresPartII:H.0/affine-pullback-tensor-flatness. Proposed declaration: `Preconnection.affinePullback_tensor_flat_iff`.

The pulled-back tensor (D⊗C)_S has zero curvature on every section if and only if the tensor of pullbacks D_S⊗C_S has zero curvature on every section. Both sides are S-connections. This does not reflect curvature back to R or assert flatness of either factor.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tensor-equality, HodgeStructuresPartII:H.0/coordinate-flatness-equivalence.

Proof outline:

- Rewrite the pulled-back tensor using the structural equality and apply flatness invariance under the actual module equivalence.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Pulling back the unit connection

HodgeStructuresPartII:H.0/affine-pullback-unit-connection-equality. Proposed declaration: `Preconnection.affinePullback_unitConnection_eq`.

Let v:S⊗_R R≅S be the existing native AlgebraTensorModule.rid. Transporting unit(Γ,f(λ)) by v⁻¹ gives exactly unit(Ω,λ).affinePullback(m). The target operator is f(λ)dΓ, including derivatives of new target scalars.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/unit-connection, HodgeStructuresPartII:H.0/affine-pullback-unique, HodgeStructuresPartII:H.0/affine-coordinate-transport, mathlib:TensorProduct.AlgebraTensorModule.rid, mathlib:TensorProduct.AlgebraTensorModule.rid_symm_apply.

Proof outline:

- Use affine pullback uniqueness. Evaluate transport and the unit operator at η(r).
- Use dΓ(f(r))=m.one(dΩ(r)), the native right-unitor evaluations and scalar compatibility.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## The inverse unit comparison is horizontal

HodgeStructuresPartII:H.0/affine-pullback-unit-connection-horizontal-inverse. Proposed declaration: `Preconnection.affinePullback_unitConnection_horizontal_inv`.

For s∈S, the pulled-back unit evaluated at v⁻¹(s)=s⊗1 equals (v⁻¹⊗id_V)(f(λ)(1⊗dΓ(s))). The actual new derivative is retained.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-unit-connection-equality, HodgeStructuresPartII:H.0/coordinate-transport-horizontal.

Proof outline:

- Rewrite using the unit structural equality and apply the module-transport horizontal law.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## The forward unit comparison is horizontal

HodgeStructuresPartII:H.0/affine-pullback-unit-connection-horizontal. Proposed declaration: `Preconnection.affinePullback_unitConnection_horizontal`.

For x∈S⊗_R R, unit(Γ,f(λ))(v(x))=(v⊗id_V)(unit(Ω,λ)_S(x)). This identifies the actual affine monoidal unit comparison in the forward direction.

Hypotheses: k,R,S are arbitrary commutative rings with specified k-algebra structures. E,F and all degree-one/two coefficient modules have independent universes and additive commutative group structures. No finite generation, basis, projectivity, characteristic or flatness hypothesis is imposed. Ω and Γ are the existing supplied TwoForms calculi; m is an actual calculus morphism with native semilinear degree-one/two maps respecting d₀,d₁ and wedge. Compatible k-module scalar towers are retained wherever the preconnection APIs require them. D and C have the same arbitrary parameter λ. For affine pullback S is an R-algebra and f=algebraMap R S. The comparison theorems require no d₀λ=0; a separate flat-source preservation test explicitly supplies that hypothesis. Generic semilinear naturality uses an arbitrary ring map f. These are affine native tensor/module comparisons. They do not identify sheaf tensor sections with tensors of global sections, construct universal exterior forms, reflect source curvature along nonfaithful extensions, or establish global monoidal functor coherence.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-unit-connection-horizontal-inverse, HodgeStructuresPartII:H.0/affine-parameter-horizontal-inverse.

Proof outline:

- Use the actual inverse-horizontal theorem for v⁻¹ to obtain the forward equation.

Source: Author printed23–24, §4.2 convention and complete printed Lemma4.9 proof; Complete §60.15 and Lemma60.15.1 proof. Motivates the parameter Leibniz convention; these arbitrary-module native comparison equations are authored deductions.

## Consumed API and unit tests

API additions to HodgeStructuresPartII:H.0/semilinear-horizontal:

- Preconnection.semilinearHorizontal_affineTensor: If h is semilinearly horizontal from D to D′ over m and j is semilinearly horizontal from C to C′ over m, then the actual h⊗j is semilinearly horizontal from D.affineTensor(C) to D′.affineTensor(C′). D and C share λ, and the target pair shares f(λ); there is one common parameter.

API additions to HodgeStructuresPartII:H.0/affine-pullback:

- Preconnection.affinePullback_tensor_eq: Transporting the actual tensor D_S.affineTensor(C_S) by u⁻¹ gives exactly (D.affineTensor(C))_S as a Preconnection structure, where D_S=D.affinePullback(m) and u is the native distribBaseChange equivalence. This holds for arbitrary λ, E,F and R→S without d₀λ=0, flatness, projectivity, bases or injectivity.
- Preconnection.affinePullback_tensor_horizontal_inv: For x∈(S⊗_R E)⊗_S(S⊗_R F), (D⊗C)_S(u⁻¹x)=(u⁻¹⊗id_V)((D_S⊗C_S)(x)). This uses the actual inverse native module equivalence.
- Preconnection.affinePullback_tensor_horizontal: For x∈S⊗_R(E⊗_R F), (D_S⊗C_S)(u(x))=(u⊗id_V)((D⊗C)_S(x)). Thus the existing native tensor-distribution equivalence intertwines the constructed operators.
- Preconnection.affinePullback_tensor_extend: The actual degree-one extended differentials commute with u⊗id_V on input and u⊗id_Y on output. Both compared connections and both extended operators are over S and the supplied calculus Γ.
- Preconnection.affinePullback_tensor_curvature: For every x∈S⊗_R(E⊗_R F), κ_(D_S⊗C_S)(u(x))=(u⊗id_Y)(κ_((D⊗C)_S)(x)). No relatively constant parameter is needed for this additive curvature naturality.
- Preconnection.affinePullback_tensor_flat_iff: The pulled-back tensor (D⊗C)_S has zero curvature on every section if and only if the tensor of pullbacks D_S⊗C_S has zero curvature on every section. Both sides are S-connections. This does not reflect curvature back to R or assert flatness of either factor.
- Preconnection.affinePullback_unitConnection_eq: Let v:S⊗_R R≅S be the existing native AlgebraTensorModule.rid. Transporting unit(Γ,f(λ)) by v⁻¹ gives exactly unit(Ω,λ).affinePullback(m). The target operator is f(λ)dΓ, including derivatives of new target scalars.
- Preconnection.affinePullback_unitConnection_horizontal_inv: For s∈S, the pulled-back unit evaluated at v⁻¹(s)=s⊗1 equals (v⁻¹⊗id_V)(f(λ)(1⊗dΓ(s))). The actual new derivative is retained.
- Preconnection.affinePullback_unitConnection_horizontal: For x∈S⊗_R R, unit(Γ,f(λ))(v(x))=(v⊗id_V)(unit(Ω,λ)_S(x)). This identifies the actual affine monoidal unit comparison in the forward direction.

Test additions to HodgeStructuresPartII:H.0/affine-pullback:

- MonoidalPullbackTests.same_parameter: The tensor of actual pullbacks obeys the target Leibniz rule with exactly one coefficient f(λ).
- MonoidalPullbackTests.higgs_specialization: The actual tensor-distribution horizontal equation also holds for the λ=0 Higgs specialization.
- MonoidalPullbackTests.inverse_actual_scalars: The inverse comparison sends (s⊗e)⊗(t⊗f) to st⊗(e⊗f), and its horizontal equation retains both target scalar factors.
- MonoidalPullbackTests.constant_flat_factors: For dΩλ=0 and flat D,C, the actual tensor of pullbacks is flat on every section; the proof combines the monoidal flatness comparison with the existing source tensor and pullback results.
- MonoidalPullbackTests.zero_section: The tensor connection comparison sends the actual zero section to zero.
- MonoidalPullbackTests.unit_new_derivative: Under the native unitor, pullback of the unit evaluates at s⊗1 to f(λ)(1⊗dΓs), retaining new target derivatives.
- MonoidalPullbackTests.polynomial_one_parameter: Construct the actual ℤ→ℤ[x] zero-to-polynomial calculus map and D=unit(2). D is zero over ℤ, but the tensor of two pullbacks evaluated at (x⊗1)⊗(1⊗1) gives2 under the native multiplication/unit identifications, and2≠4.
- MonoidalPullbackTests.nonflat_operator_erasure: For the actual nonflat quotient ℤ→ℤ/2 and scalar Higgs operator1 on each source line, the tensor operator evaluates to2 over ℤ, whereas the tensor of pullbacks evaluates to0 over ℤ/2. This tests operator erasure, not curvature reflection or global descent.

# Affine parameter pullback along ring towers

For a compatible commutative algebra tower R→S→T and genuine supplied calculus maps m:Ω→Γ and n:Γ→Δ, construct the actual iterated pullback on T⊗_S(S⊗_R E). Only g(f(λ)) is rewritten as λ_T; the existing additive operator is retained.

Use the existing native c=TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E. It sends t⊗(s⊗e) to (s•t)⊗e; its inverse sends t⊗e to t⊗(1⊗e). Scalar units compose through c. Tensor induction gives the actual one-form comparison. The transported iterated connection has horizontal direct scalar unit, so the existing uniqueness theorem proves equality with direct pullback as structures, not just on generators. Native transport and its actual inverse give both horizontal directions, then the inherited extension/curvature theorems give their compatibility. The two T-connections are flat simultaneously, without requiring d₀λ=0 or faithful scalar extension. This is not reflection of source curvature from T back to R.

The constructed ℤ→ℤ[x]→ℤ[x] test has identity second step. Zero source derivation and D=unit(2) give a zero source operator, but the derivative on x⊗1 is 2. Native cancellation preserves it and the iterated operator is nonzero. This is not a ramified second-step test; the incoming genuine x↦x² calculus-map test remains unchanged in native evidence.

The new tower results are authored algebraic deductions. Fresh background reading: [Esnault–Groechenig author copy](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), printed pp.23–24 including the full printed Lemma4.9 proof, and [Stacks tag07J5](https://stacks.math.columbia.edu/tag/07J5), full §60.15 including Lemma60.15.1 proof. Neither states the arbitrary-ring tower theorem. No whole-paper reading, new published-version collation or rendered-PDF inspection is claimed.

Native declarations were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174: TensorProduct/Tower.lean 431–453 (c and pure-tensor equations), Algebra/Algebra/Tower.lean 127–132 (tower algebra maps), Ring/CompTypeclasses.lean 64–67 (composition triple), and TensorProduct/Map.lean 53–61 (semilinear tensor map). All four reviewed Hodge AUDIT-02 rows and REV-AUDIT-02 are retained; no parent Hodge object is redefined.

### Calculus composition along an algebra tower

`TwoForms.Morphism.towerComp`

Construct the calculus map at native algebraMap R T: its degree-one/two maps are n.one∘m.one and n.two∘m.two and preserve d₀,d₁ and wedge.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Supply RingHomCompTriple from the actual algebra-tower equation. Compose semilinear maps and the two differential and wedge compatibility equations. No new calculus is chosen.

Dependencies: `HodgeStructuresPartII:H.0/calculus-ring-composition`, `mathlib:IsScalarTower.algebraMap_eq`, `mathlib:RingHomCompTriple`.

API `TwoForms.Morphism.towerComp_one`: (n.towerComp(m)).one(ω)=n.one(m.one(ω)) for every ω∈W.

API `TwoForms.Morphism.towerComp_two`: (n.towerComp(m)).two(η)=n.two(m.two(η)) for every η∈Z.

API `TwoForms.Morphism.towerComp_d0`: dΔ,₀(f_RT(r))=n.one(m.one(dΩ,₀r)) for every r∈R.

Test `TwoForms.Morphism.towerComp.test_one` (compatibility): The degree-one map is actual composition at every ω.

Test `TwoForms.Morphism.towerComp.test_two` (compatibility): The degree-two map is actual composition at every η.

Test `TwoForms.Morphism.towerComp.test_differential` (compatibility): dΔ,₀(f_RT(r))=n.one(m.one(dΩ,₀r)) at every scalar.

### Degree-one tower composition

`TwoForms.Morphism.towerComp_one`

(n.towerComp(m)).one(ω)=n.one(m.one(ω)) for every ω∈W.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Unfold the actual composition; the equation is definitional.

Dependencies: `HodgeStructuresPartII:H.0/tower-calculus-composition`.

### Degree-two tower composition

`TwoForms.Morphism.towerComp_two`

(n.towerComp(m)).two(η)=n.two(m.two(η)) for every η∈Z.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Unfold the actual degree-two composition; the equation is definitional.

Dependencies: `HodgeStructuresPartII:H.0/tower-calculus-composition`.

### Degree-zero tower differential

`TwoForms.Morphism.towerComp_d0`

dΔ,₀(f_RT(r))=n.one(m.one(dΩ,₀r)) for every r∈R.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Apply the actual d₀_map equation of the composed calculus map.

Dependencies: `HodgeStructuresPartII:H.0/tower-calculus-composition`.

### Twice-pulled-back parameter connection

`Preconnection.affinePullbackTower`

Construct D_twice on native T⊗_S(S⊗_R E) with exactly the additive map (D.affinePullback(m)).affinePullback(n). Rewrite only g(f(λ)) as λ_T. Its Leibniz correction is one λ_T, not 2λ_T.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Keep the existing twice-pulled-back additive operator. Rewrite the parameter in its proved Leibniz rule by the tower equation. No existential choice or stored horizontality oracle is used.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback`, `mathlib:IsScalarTower.algebraMap_apply`.

API `Preconnection.affinePullbackTower_apply`: D_twice(x)=((D.affinePullback(m)).affinePullback(n))(x) for every x∈T⊗_S(S⊗_R E).

API `Preconnection.affinePullback_tower_eq`: Transport of D_twice along native c equals D_direct=D.affinePullback(n.towerComp(m)) as preconnection structures, not merely on elementary tensors.

API `Preconnection.affinePullback_tower_horizontal`: D_direct(c(x))=(c⊗id_P)D_twice(x) for every x∈T⊗_S(S⊗_R E).

API `Preconnection.affinePullback_tower_horizontal_symm`: D_twice(c⁻¹(x))=(c⁻¹⊗id_P)D_direct(x) for every x∈T⊗_R E.

API `Preconnection.affinePullback_tower_extend`: D_direct,₁((c⊗id_P)x)=(c⊗id_Q)D_twice,₁(x) for every x∈(T⊗_S(S⊗_R E))⊗_T P.

API `Preconnection.affinePullback_tower_curvature`: κ_direct(c(x))=(c⊗id_Q)κ_twice(x) for every x∈T⊗_S(S⊗_R E), without a constant-parameter hypothesis.

API `Preconnection.affinePullback_tower_flat_iff`: κ_direct=0 everywhere if and only if κ_twice=0 everywhere. No faithful-flatness or d₀λ=0 premise is needed to compare these two T-connections.

Test `Preconnection.affinePullbackTower.test_actual_operator` (compatibility): The tower additive operator equals actual successive pullback on every element.

Test `Preconnection.affinePullbackTower.test_single_parameter` (compatibility): D_twice(t x)=tD_twice(x)+λ_T x⊗dΔ,₀t, with one parameter correction.

Test `scalarUnit_cancelBaseChange.test_unit` (compatibility): Nested scalar units cancel to the direct scalar unit.

Test `Preconnection.affinePullbackTower.test_structure_equality` (compatibility): Cancellation transports D_twice to D_direct as structures.

Test `Preconnection.affinePullbackTower.test_inverse` (compatibility): The inverse equation uses c⁻¹(t⊗e)=t⊗(1⊗e).

Test `Preconnection.affinePullbackTower.test_extension` (compatibility): The actual exterior extension commutes with cancellation.

Test `Preconnection.affinePullbackTower.test_curvature` (compatibility): Curvature commutes with cancellation for arbitrary λ.

Test `Preconnection.affinePullbackTower.test_flatness_equivalence` (compatibility): The two T-connections have equivalent flatness without faithful scalar extension.

Test `Preconnection.affinePullbackTower.test_zero_higgs` (degenerate): At λ=0 direct pullback has no derivative correction.

Test `Preconnection.affinePullbackTower.test_polynomial_derivative_survives` (computation): Construct the actual tower ℤ→ℤ[x]→ℤ[x] with identity second step, zero source derivation, target polynomial derivative and D=unit(2). D is zero, but the direct operator at c(1⊗(x⊗1)) equals 2((1⊗1)⊗1), and the twice-pulled-back operator there is nonzero. This is not a ramified second-step example.

### Underlying twice-pulled-back operator

`Preconnection.affinePullbackTower_apply`

D_twice(x)=((D.affinePullback(m)).affinePullback(n))(x) for every x∈T⊗_S(S⊗_R E).

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: The underlying additive-map equation is definitional.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower`.

### Scalar units under tower cancellation

`scalarUnit_cancelBaseChange`

For native c=AlgebraTensorModule.cancelBaseChange R S T T E, c(η_ST(η_RS(e)))=η_RT(e) for every e.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Apply the native pure-tensor formula to 1⊗(1⊗e). It gives (1•1)⊗e=1⊗e. Do not redefine c.

Dependencies: `HodgeStructuresPartII:H.0/scalar-extension-unit`, `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`, `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul`.

### Composed one-form scalar unit

`scalarUnit_tower_tensor`

(c⊗id_P)((η_ST⊗n.one)((η_RS⊗m.one)x))=(η_RT⊗(n.towerComp(m)).one)x for every x∈E⊗_R W.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Tensor induction reduces to e⊗ω. Apply scalar-unit cancellation and actual degree-one composition. Additivity handles zero and sums.

Dependencies: `HodgeStructuresPartII:H.0/scalar-unit-tower-cancellation`, `HodgeStructuresPartII:H.0/tower-calculus-one`, `mathlib:TensorProduct.map`, `mathlib:TensorProduct.induction_on`.

### Tower pullback connection equality

`Preconnection.affinePullback_tower_eq`

Transport of D_twice along native c equals D_direct=D.affinePullback(n.towerComp(m)) as preconnection structures, not merely on elementary tensors.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Apply direct-pullback uniqueness. The inverse cancellation sends η_RT(e) to η_ST(η_RS(e)). Successive unit horizontality and the one-form tensor comparison prove the unit equation. Uniqueness including proof irrelevance yields structure equality.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower`, `HodgeStructuresPartII:H.0/scalar-unit-tower-tensor`, `HodgeStructuresPartII:H.0/affine-pullback-unique`, `HodgeStructuresPartII:H.0/affine-pullback-unit-horizontal`, `HodgeStructuresPartII:H.0/affine-coordinate-transport`, `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_symm_tmul`.

### Horizontal tower cancellation

`Preconnection.affinePullback_tower_horizontal`

D_direct(c(x))=(c⊗id_P)D_twice(x) for every x∈T⊗_S(S⊗_R E).

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Rewrite direct pullback by structure equality and use transport horizontality. No surjectivity of a scalar unit is assumed.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower-equality`, `HodgeStructuresPartII:H.0/coordinate-transport-horizontal`.

### Horizontal inverse tower cancellation

`Preconnection.affinePullback_tower_horizontal_symm`

D_twice(c⁻¹(x))=(c⁻¹⊗id_P)D_direct(x) for every x∈T⊗_R E.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Apply inherited inverse horizontality to the actual linear equivalence c and its genuine inverse.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower-horizontal`, `HodgeStructuresPartII:H.0/affine-parameter-horizontal-inverse`.

### Tower exterior-extension compatibility

`Preconnection.affinePullback_tower_extend`

D_direct,₁((c⊗id_P)x)=(c⊗id_Q)D_twice,₁(x) for every x∈(T⊗_S(S⊗_R E))⊗_T P.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Apply horizontal-extension naturality to T-linear c and its proved horizontal equation. Both sides use the same supplied target calculus Δ.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower-horizontal`, `HodgeStructuresPartII:H.0/extension-horizontal`.

### Tower curvature compatibility

`Preconnection.affinePullback_tower_curvature`

κ_direct(c(x))=(c⊗id_Q)κ_twice(x) for every x∈T⊗_S(S⊗_R E), without a constant-parameter hypothesis.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Apply same-ring curvature naturality. Curvature is the defined exterior-extension composite, never the ill-typed D∘D.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower-horizontal`, `HodgeStructuresPartII:H.0/curvature-horizontal`.

### Tower flatness equivalence

`Preconnection.affinePullback_tower_flat_iff`

κ_direct=0 everywhere if and only if κ_twice=0 everywhere. No faithful-flatness or d₀λ=0 premise is needed to compare these two T-connections.

Hypotheses: k,R,S,T are arbitrary commutative rings, R,S,T are k-algebras, and R→S→T is a compatible algebra tower with its native IsScalarTower equation. No injectivity, flatness, field, characteristic, smoothness or nontrivial-ring hypothesis is imposed. E is an arbitrary R-module in an independent universe. Ω,Γ,Δ are the supplied affine TwoForms calculi on independent degree-one/two module universes. m,n are their actual semilinear calculus maps. No universal exterior algebra or sheaf carrier is constructed. D is the actual additive λ-preconnection, for arbitrary λ∈R; the tower parameter is the single λ_T=algebraMap R T λ. The degree-one k scalar towers support the inherited extension/curvature/transport interfaces. No d₀λ=0 premise is needed to compare the two T-connections. This is not reflection of source curvature from T back to R.

Proof: Rewrite by structure equality and use transport-flatness equivalence along c. The degree-two map c⊗id_Q has the actual inverse c⁻¹⊗id_Q; this is unlike a general source-to-target scalar unit.

Dependencies: `HodgeStructuresPartII:H.0/affine-pullback-tower-equality`, `HodgeStructuresPartII:H.0/coordinate-flatness-equivalence`.

## Required frontier

Actual affine iterated scalar extension agrees with direct pullback under native AlgebraTensorModule.cancelBaseChange as preconnection structures, in both horizontal directions and on extended differentials, curvature and flatness. This works for arbitrary λ and arbitrary modules over every compatible commutative algebra tower, with no basis, projectivity, flatness or injectivity hypothesis. It compares two T-connections and does not reflect curvature back to R. Still supply monoidal common-λ and universal exterior-power base-change comparisons, identity and three-step categorical pullback coherence, and genuine E1 sheaf tensor/restriction, equality detection and effective gluing. The reserved general finite-locally-free ringed-site key, all149 routed source obligations, five supplier requests, determinant/Tate/period adapters, arbitrary-Q tensor-valued shuffle and H.1–H.8 retain their open status. Previous frontier prose is checkpoint history.

All321 incoming node objects,149 routes,35 typed omissions, five supplier requests, nine stage statuses, eleven gaps and the existing EG20/E10 source issue/version envelope are retained. The affine native evidence does not implement the atlas plan. All nodes remain unchecked. The complete canonical suggested file remains Mathlib-only; its admitted theorem/test bodies are planning signatures. The inherited reader below is unchanged checkpoint history.

# Balanced affine pullback of parameter connections

For f:R→S and a supplied compatible map of differential calculi (β₁,β₂), this continuation constructs the target connection on the actual native tensor module S⊗_R E. With η(e)=1⊗e, the formula is

    D_S(s⊗e) = s·(η⊗β₁)D(e) + f(λ)·(η(e)⊗dΓ,₀s).

Both inputs are additive. Expanding the derivation and source Leibniz rules proves R-balancing, so the native additive tensor lift defines D_S. The product rule proves its S-Leibniz identity with one copy of f(λ). Its unit η is horizontal, and those two conditions characterize it uniquely. Native extension of a horizontal R-linear map stays horizontal. The source and target modules need no basis, projectivity or flatness.

Curvature on η(e) follows from the previous semilinear extension theorem. To reach all target elements, dΩ,₀λ=0 is transported to dΓ,₀f(λ)=0, making target curvature S-linear. Every elementary tensor is sη(e), and tensor induction reaches arbitrary sums. Thus source flatness implies target flatness even when η is not surjective. Reflection retains injectivity of the actual degree-two map η⊗β₂; the coefficient ring map alone does not justify it.

The worked example extends ℤ to ℤ[x]. The source calculus has zero derivation, the target has formal derivative, and the one-form comparison is zero. The source unit(2) connection vanishes, yet its pullback sends x⊗1 to the nonzero tensor 2((1⊗1)⊗1), while remaining flat. Native right unitors detect that value. A separate coefficient calculation proves η is not surjective. The zero-parameter test removes precisely the derivative correction. These checks exercise the newly added coefficient directions as well as the abstract balancing and uniqueness equations.

Sources are the freshly reread parameter convention in Esnault–Groechenig's author pp.23–24 and the complete Stacks §60.15 connection/extension section, at the recorded byte hashes. These arbitrary-ring results are authored deductions from the stated axioms and tensor universal property. The published-version receipt and EG20/E10 source finding are retained unchanged; the cited Simpson arguments are not newly checked here.

The balanced affine pullback on the actual S⊗_R E now exists, with its single f(λ) Leibniz term, horizontal unit, uniqueness and native horizontal map extension. Constant source parameter and source flatness imply flatness on the whole target by tensor generation, without surjectivity of η or flatness of S. Reflection still needs injectivity of η⊗β₂. Still prove monoidal/exterior-power and iterated-base-change coherence, and genuine E1 sheaf tensor/restriction, equality detection and effective gluing. The reserved finite locally free ringed-site key, all five supplier requests, all149 routed obligations, determinant/Tate/period adapters, arbitrary-Q tensor-valued shuffle and H.1–H.8 remain open.

Earlier frontier paragraphs below record their own checkpoint boundaries. Their full contracts and reader text remain available unchanged.

## Semilinear scalar-extension unit

**scalarUnit** — The native f-semilinear map η:E→S⊗_R E is η(e)=1⊗e, for f=algebraMap R S. No surjectivity or injectivity is asserted.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: mathlib:TensorProduct.mk.

Proof: Use the actual tensor 1⊗e. Additivity is tensor additivity; balancing identifies 1⊗ae with f(a)⊗e=f(a)η(e).

API:

- **scalarUnit_apply**: For every e, η(e)=1⊗e.
- **scalarUnit_baseChange**: For every native R-linear h:E→F, h.baseChange(S)(η_E(e))=η_F(h(e)).
- **scalarUnit_tensor_natural**: For R-linear h:E→F and x∈E⊗_R W, (h_S⊗id_V)((η_E⊗β₁)x)=(η_F⊗β₁)((h⊗id_W)x).

Tests:

- **scalarUnit.test_semilinear**: η(ae)=f(a)η(e) with the actual native semilinear map.
- **scalarUnit.test_baseChange**: For arbitrary modules and R-linear h, h.baseChange(S)(η(e))=η(h(e)).
- **scalarUnit.test_not_surjective**: For ℤ→ℤ[x] and E=ℤ, η is not surjective: x⊗1 cannot equal 1⊗n, as coefficient one detects after the native right unitor.

## Scalar-extension unit evaluation

**scalarUnit_apply** — For every e, η(e)=1⊗e.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/scalar-extension-unit.

Proof: Unfold the concrete semilinear map.

## Biadditive affine pullback formula

**Preconnection.pullbackPair** — For supplied m=(β₁,β₂), define B(s,e)=s·(η⊗β₁)D(e)+f(λ)·(η(e)⊗dΓ,₀s) as an actual biadditive map S→+(E→+((S⊗_R E)⊗_S V)).

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/scalar-extension-unit, HodgeStructuresPartII:H.0/calculus-ring-morphism, HodgeStructuresPartII:H.0/intrinsic-preconnection, mathlib:TensorProduct.map.

Proof: Build both additive-homomorphism structures from additivity of D,d₀,η,β₁ and each tensor factor; reorder the four summands.

API:

- **Preconnection.pullbackPair_apply**: B(s,e)=s·(η⊗β₁)D(e)+f(λ)·(η(e)⊗dΓ,₀s).
- **Preconnection.pullback_balanced**: For a∈R,s∈S,e∈E, B(a·s,e)=B(s,a·e). No flatness or projectivity is required.
- **Preconnection.affinePullback**: Construct D_S on the native S-module S⊗_R E by descending B through TensorProduct.liftAddHom. It is a preconnection for Γ with parameter f(λ): D_S(sx)=sD_S(x)+f(λ)x⊗dΓ,₀s for every x.

Tests:

- **Preconnection.pullbackPair.test_balance**: The actual biadditive formula satisfies B(a·s,e)=B(s,a·e).
- **Preconnection.pullbackPair.test_add_left**: B(s+t,e)=B(s,e)+B(t,e).
- **Preconnection.pullbackPair.test_add_right**: B(s,e+f)=B(s,e)+B(s,f).

## Pullback-pair evaluation

**Preconnection.pullbackPair_apply** — B(s,e)=s·(η⊗β₁)D(e)+f(λ)·(η(e)⊗dΓ,₀s).

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-pair.

Proof: Evaluate the actual biadditive map.

## Balancing the parameter pullback

**Preconnection.pullback_balanced** — For a∈R,s∈S,e∈E, B(a·s,e)=B(s,a·e). No flatness or projectivity is required.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-pair-apply.

Proof: Expand dΓ,₀(f(a)s) and D(ae). The differential compatibility dΓ,₀(f(a))=β₁(dΩ,₀a), semilinearity and tensor balancing match all three terms, including the single coefficient f(λ).

## Actual affine parameter pullback

**Preconnection.affinePullback** — Construct D_S on the native S-module S⊗_R E by descending B through TensorProduct.liftAddHom. It is a preconnection for Γ with parameter f(λ): D_S(sx)=sD_S(x)+f(λ)x⊗dΓ,₀s for every x.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-balanced, mathlib:TensorProduct.liftAddHom, mathlib:TensorProduct.induction_on.

Proof: Descend the balanced biadditive map. Prove S-Leibniz by tensor induction: the pure-tensor case is the derivation product rule for dΓ,₀(as); addition and zero follow from the additive lift.

API:

- **Preconnection.affinePullback_tmul**: D_S(s⊗e)=s·(η⊗β₁)D(e)+f(λ)·(η(e)⊗dΓ,₀s).
- **Preconnection.affinePullback_unit**: The actual η is semilinearly horizontal: D_S(η(e))=(η⊗β₁)D(e) for every e.
- **Preconnection.affinePullback_curvature_unit**: For arbitrary λ, κ_DS(η(e))=(η⊗β₂)κ_D(e).
- **Preconnection.affinePullback_curvature_tmul**: If dΩ,₀λ=0, then κ_DS(s⊗e)=s·(η⊗β₂)κ_D(e) for every s,e.
- **Preconnection.affinePullback_flat**: If dΩ,₀λ=0 and κ_D(e)=0 for every e, then κ_DS(x)=0 for every x∈S⊗_R E. η need not be surjective.
- **Preconnection.affinePullback_unique**: Every preconnection C for Γ,f(λ) on S⊗_R E whose scalar-extension unit is horizontal equals D_S.
- **Preconnection.affinePullback_flat_iff**: If dΩ,₀λ=0 and η⊗β₂:E⊗_R Z→(S⊗_R E)⊗_S Y is injective, then κ_DS=0 if and only if κ_D=0.
- **Preconnection.affinePullback_horizontal**: If C(h(e))=(h⊗id_W)D(e) for every e, then C_S(h.baseChange(S)(x))=(h.baseChange(S)⊗id_V)D_S(x) for every x∈S⊗_R E.

Tests:

- **Preconnection.affinePullback.test_leibniz**: For every x∈S⊗_R E, D_S(sx)=sD_S(x)+f(λ)x⊗dΓ,₀s.
- **Preconnection.affinePullback.test_zero_higgs**: At λ=0 the derivative correction vanishes: D_S(s⊗e)=s(η⊗β₁)D(e).
- **Preconnection.affinePullback.test_unit_horizontal**: The constructed scalar-extension unit is semilinearly horizontal.
- **Preconnection.affinePullback.test_flat_arbitrary_sum**: With d₀λ=0 and flat D, curvature vanishes on (s⊗e)+(t⊗f) for arbitrary scalars and sections.
- **Preconnection.affinePullback.test_uniqueness**: Any target preconnection with horizontal η equals the constructed affine pullback.
- **Preconnection.affinePullback.test_reflection**: With constant parameter and injective η⊗β₂, source and pullback flatness are equivalent.
- **Preconnection.affinePullback.test_horizontal_map**: Every horizontal R-linear h induces a horizontal native h.baseChange(S).
- **Preconnection.affinePullback.test_new_polynomial_direction**: Construct Ω on ℤ with d₀=0 and Γ on ℤ[x] with formal derivative, genuine zero degree-two modules, m with β₁=β₂=0, and D=unit(2). Then D=0, D_S is flat everywhere, but D_S(x⊗1)=2((1⊗1)⊗1)≠0. The added coefficient direction must be differentiated.

## Pullback on elementary tensors

**Preconnection.affinePullback_tmul** — D_S(s⊗e)=s·(η⊗β₁)D(e)+f(λ)·(η(e)⊗dΓ,₀s).

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback, mathlib:TensorProduct.liftAddHom_tmul.

Proof: Use the defining evaluation equation of the additive tensor lift.

## Horizontal scalar-extension unit

**Preconnection.affinePullback_unit** — The actual η is semilinearly horizontal: D_S(η(e))=(η⊗β₁)D(e) for every e.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tmul, HodgeStructuresPartII:H.0/semilinear-horizontal.

Proof: Evaluate the pullback formula at s=1 and use dΓ,₀1=0.

## Curvature on the extension unit

**Preconnection.affinePullback_curvature_unit** — For arbitrary λ, κ_DS(η(e))=(η⊗β₂)κ_D(e).

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-unit-horizontal, HodgeStructuresPartII:H.0/semilinear-curvature.

Proof: Apply the already constructed semilinear curvature naturality to the proved unit horizontality.

## Curvature on generating tensors

**Preconnection.affinePullback_curvature_tmul** — If dΩ,₀λ=0, then κ_DS(s⊗e)=s·(η⊗β₂)κ_D(e) for every s,e.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-curvature-unit, HodgeStructuresPartII:H.0/calculus-ring-constant-parameter, HodgeStructuresPartII:H.0/curvature-linearity.

Proof: Write s⊗e=sη(e). The calculus comparison sends dΩ,₀λ=0 to dΓ,₀f(λ)=0; target curvature is S-linear, so pull out s and apply the unit equation.

## Flat pullback on the whole extended module

**Preconnection.affinePullback_flat** — If dΩ,₀λ=0 and κ_D(e)=0 for every e, then κ_DS(x)=0 for every x∈S⊗_R E. η need not be surjective.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-curvature-tmul, mathlib:TensorProduct.induction_on.

Proof: Induct on x. The generating-tensor equation gives zero on every s⊗e, and additive curvature gives zero on sums and zero. This uses S-generation by η(E), not function-surjectivity of η.

## Uniqueness of the pullback connection

**Preconnection.affinePullback_unique** — Every preconnection C for Γ,f(λ) on S⊗_R E whose scalar-extension unit is horizontal equals D_S.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tmul, HodgeStructuresPartII:H.0/affine-pullback-unit-horizontal, mathlib:TensorProduct.induction_on.

Proof: On sη(e), the S-Leibniz rule of C and horizontality force the displayed formula. Tensor induction proves equality of additive maps, and proof irrelevance identifies the preconnection structures.

## Flatness equivalence with degree-two detection

**Preconnection.affinePullback_flat_iff** — If dΩ,₀λ=0 and η⊗β₂:E⊗_R Z→(S⊗_R E)⊗_S Y is injective, then κ_DS=0 if and only if κ_D=0.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-flat, HodgeStructuresPartII:H.0/affine-pullback-unit-horizontal, HodgeStructuresPartII:H.0/semilinear-flat-reflection.

Proof: Use injectivity of the actual degree-two comparison for reflection; combine with the all-target flatness theorem. Injectivity of f or η alone does not supply the stated tensor injectivity.

## Scalar-extension unit and native map extension

**scalarUnit_baseChange** — For every native R-linear h:E→F, h.baseChange(S)(η_E(e))=η_F(h(e)).

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/scalar-extension-unit, mathlib:LinearMap.baseChange, mathlib:LinearMap.baseChange_tmul.

Proof: Evaluate both native maps on 1⊗e.

## One-form comparison and extended maps

**scalarUnit_tensor_natural** — For R-linear h:E→F and x∈E⊗_R W, (h_S⊗id_V)((η_E⊗β₁)x)=(η_F⊗β₁)((h⊗id_W)x).

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/scalar-unit-base-change, HodgeStructuresPartII:H.0/calculus-ring-morphism, mathlib:TensorProduct.induction_on.

Proof: Induct on tensors. Both sides send e⊗ω to (1⊗h(e))⊗β₁(ω); additivity handles zero and sums.

## Pullback preserves horizontal linear maps

**Preconnection.affinePullback_horizontal** — If C(h(e))=(h⊗id_W)D(e) for every e, then C_S(h.baseChange(S)(x))=(h.baseChange(S)⊗id_V)D_S(x) for every x∈S⊗_R E.

Hypotheses: k,R,S are arbitrary commutative rings; R,S are k-algebras and S is an R-algebra with f=algebraMap R S. E,F are arbitrary R-modules with additive commutative groups, in independent universes. No finite generation, basis, projectivity, flatness, smoothness, field or characteristic assumption is added. Ω=(d₀,d₁,∧) and Γ are the existing supplied affine TwoForms calculi on independent degree-one/two modules. The native m:TwoForms.Morphism f Ω Γ supplies semilinear β₁,β₂ and both differential and wedge compatibility equations. Compatible k-module scalar towers are used where inherited curvature theorems require them. No universal differential forms or sheaf carrier is redefined. D is the actual additive λ-preconnection over Ω; pullback constructs the target f(λ)-preconnection. The definition, balancing, unit curvature, uniqueness and horizontal map theorem do not require d₀λ=0. Curvature on all generating tensors, all-target flatness and the flatness equivalence explicitly require dΩ,₀λ=0. Reflection additionally requires injectivity of the actual degree-two tensor comparison.

Prerequisites: HodgeStructuresPartII:H.0/affine-pullback-tmul, HodgeStructuresPartII:H.0/scalar-unit-tensor-natural, mathlib:LinearMap.baseChange_tmul.

Proof: Induct on the native tensor. Substitute the two pullback formulas, use source horizontality and tensor naturality for the first term, and the scalar-unit equation for the derivative term.

# Coefficient-ring transport for parameter connections

This continuation develops actual maps of the supplied affine differential calculi over a coefficient-ring homomorphism. The map on one-forms and the map on two-forms are native semilinear maps, with explicit equations for both differentials and wedge. They are not independent naturality flags. The generic global differential calculus remains the CR.1 supplier's work. These adapters isolate the affine equations needed by the existing pullback and restriction contracts.

For f:R→S, the target parameter is f(λ). A horizontal semilinear map h:E→F satisfies C(h(e))=(h⊗β₁)D(e). Expanding the actual degree-one extension on e⊗ω gives D(e)∧ω+λe⊗d₁ω. The wedge comparison and d₁ comparison identify its image with the target extension. Semilinearity is essential: the last coefficient becomes f(λ). Tensor induction proves the equation on arbitrary tensors. Applying it to D(e) proves curvature naturality for arbitrary λ, including variable parameters. When d₀λ=0, the calculus equation supplies d₀f(λ)=0 and identifies the actual linear curvature maps.

The degree-zero/one/two comparison has native identity and composition. Composing two horizontal maps is horizontal over the actual composite ring map because the native tensor map composes on elementary tensors and therefore on every tensor. This prepares compatibility of restriction chains; it does not construct genuine module-sheaf restrictions.

Flatness transport keeps its quantifiers. Flatness of D gives zero target curvature on the image of h. A surjective h gives zero target curvature everywhere. Reflection uses injectivity of h⊗β₂ itself, rather than injectivity of h or f alone. Neither faithful scalar extension nor source curvature detection follows from an arbitrary change of coefficients. The scalar-extension unit E→S⊗_R E is generally not surjective, so the surjective theorem is not a proof that a pullback connection is flat. The balanced construction of that connection and the additional target-generation argument remain mandatory next steps.

The worked ramified example uses A=ℤ[x], f(a)=a(x²), the native formal derivative, and the genuine zero degree-two module. Its one-form map is β₁(a)=2x·a(x²). It sends 1 to 2x, which is not1; the full polynomial chain rule proves d₀f(a)=β₁d₀a for every polynomial. The actual f-semilinear map is horizontal between the unit(2) and unit(f(2)) preconnections. Replacing the differential comparison by an identity would fail this computed value. The tests also cover the zero horizontal map, both identity degrees, and composition. No basis of the connection module is used.

The source convention is Esnault–Groechenig's author-hosted44-page preprint, §4.2 author pp.23–24, and the entire [Stacks connection section](https://stacks.math.columbia.edu/tag/07J5). Both texts were freshly read at the recorded source hashes. The cross-ring arbitrary-module statements below are authored deductions from their equations and native tensor universal properties, not quotations of source theorems. The inherited published-version receipt and EG20/E10 finding remain unchanged; no new version-independent assertion about rigid moduli or the cited Simpson results is made.

The nine-stage plan retains its scope. All149 routed source items and all five supplier requests remain. The reserved definition is still finite locally free on a ringed differential site. Actual sheaf tensor restrictions, equality detection and effective descent are required before globalizing these affine identities. The following declaration-sized specifications extend that frontier; the complete preceding roadmap follows unchanged.

## Maps of supplied affine differential calculi

**TwoForms.Morphism** — For a ring homomorphism f:R→S, Morphism(f,Ω,Γ) consists of native f-semilinear maps β₁:W→V and β₂:Z→Y with dΓ,₀(f(a))=β₁(dΩ,₀a), dΓ,₁(β₁ω)=β₂(dΩ,₁ω), and β₁ω∧Γβ₁α=β₂(ω∧Ωα). The equations specify the actual degree-zero/one/two comparison, not an arbitrary naturality oracle.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection.

Proof outline: Bundle the two native semilinear maps and the three explicit compatibility equations. This is an adapter between supplied calculi; it neither constructs universal forms nor duplicates the global CR.1 calculus supplier.

API:

- **TwoForms.Morphism.one**: The actual f-semilinear map W→V.
- **TwoForms.Morphism.two**: The actual f-semilinear map Z→Y.
- **TwoForms.Morphism.d0_map**: dΓ,₀(f(a))=β₁(dΩ,₀a).
- **TwoForms.Morphism.d1_map**: dΓ,₁(β₁ω)=β₂(dΩ,₁ω).
- **TwoForms.Morphism.wedge_map**: β₁ω∧Γβ₁α=β₂(ω∧Ωα).

Unit tests:

- **TwoForms.Morphism.test_balanced**: For m, a and ω, β₁(aω)=f(a)β₁ω.
- **TwoForms.Morphism.test_wedge**: For m, ω and α, wedgeΓ(β₁ω,β₁α)=β₂(wedgeΩ(ω,α)).
- **TwoForms.Morphism.test_ramified_chain_rule**: For A=ℤ[x], ordinary formal derivative, zero degree-two module and f(a)=a(x²), construct β₁(a)=2x·a(x²) and β₂=0. Then β₁(1)=2x≠1, d₀f(a)=β₁d₀a for every a, and f is horizontal from unit(2) to unit(f(2)). This is a nonidentity coefficient-ring map with its nontrivial differential correction.

## Identity differential-calculus comparison

**TwoForms.Morphism.refl** — The identity comparison over id_R has β₁=id_W and β₂=id_Z. Its three differential/wedge equations are the reflexive equations on the supplied calculus Ω.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism.

Proof outline: Use native identity linear maps as identity-semilinear maps and reflexivity for all three defining equations.

API:

- **TwoForms.Morphism.refl_one**: The degree-one map of refl(Ω) sends every ω∈W to ω.
- **TwoForms.Morphism.refl_two**: The degree-two map of refl(Ω) sends every η∈Z to η.
- **Preconnection.semilinearHorizontal_refl**: The identity module map is horizontal from D to D over refl(Ω).

Unit tests:

- **TwoForms.Morphism.refl.test_degree_one**: The identity comparison sends ω to ω in degree one.
- **TwoForms.Morphism.refl.test_degree_two**: The identity comparison sends η to η in degree two.
- **TwoForms.Morphism.refl.test_differential**: The identity ring map and identity one-form map commute with d₀ on every a.

## Identity on one-forms

**TwoForms.Morphism.refl_one** — The degree-one map of refl(Ω) sends every ω∈W to ω.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-identity.

Proof outline: Evaluate the actual identity map.

## Identity on two-forms

**TwoForms.Morphism.refl_two** — The degree-two map of refl(Ω) sends every η∈Z to η.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-identity.

Proof outline: Evaluate the actual identity map.

## Constant parameters survive calculus comparison

**TwoForms.Morphism.constant_parameter** — For m:Morphism(f,Ω,Γ), dΩ,₀λ=0 implies dΓ,₀(f(λ))=0.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism.

Proof outline: Apply the degree-zero differential equation to λ and preservation of zero by β₁.

## Composition of coefficient-ring comparisons

**TwoForms.Morphism.comp** — For m:Morphism(f,Ω,Γ) and n:Morphism(g,Γ,Δ), n.comp(m) is the actual comparison over g∘f, with one-form map n₁∘m₁ and two-form map n₂∘m₂. Every differential/wedge equation follows by composition of the corresponding two equations.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism, mathlib:LinearMap.comp, mathlib:RingHomCompTriple.

Proof outline: Use the native semilinear composition and the reflexive ring-hom composition witness. Substitute the first comparison equation into the second in each of the three defining laws.

API:

- **TwoForms.Morphism.comp_one**: The degree-one map of n.comp(m) sends ω to n₁(m₁ω).
- **TwoForms.Morphism.comp_two**: The degree-two map of n.comp(m) sends η to n₂(m₂η).
- **Preconnection.semilinearHorizontal_comp**: If h is horizontal from D to C over m and i is horizontal from C to B over n, then i∘h is horizontal from D to B over n.comp(m). The final parameter is (g∘f)(λ).

Unit tests:

- **TwoForms.Morphism.comp.test_left_identity**: Composing m with the target identity leaves its one-form map unchanged on ω.
- **TwoForms.Morphism.comp.test_right_identity**: Composing m with the source identity leaves its two-form map unchanged on η.
- **TwoForms.Morphism.comp.test_differential**: The left identity composite commutes with d₀ at the actual composite coefficient-ring map.

## Composed one-form evaluation

**TwoForms.Morphism.comp_one** — The degree-one map of n.comp(m) sends ω to n₁(m₁ω).

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-composition.

Proof outline: Unfold native semilinear composition.

## Composed two-form evaluation

**TwoForms.Morphism.comp_two** — The degree-two map of n.comp(m) sends η to n₂(m₂η).

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-composition.

Proof outline: Unfold native semilinear composition.

## Horizontal maps across coefficient rings

**Preconnection.SemilinearHorizontal** — For D a λ-preconnection over Ω, C an f(λ)-preconnection over Γ, and an actual f-semilinear h:E→F, SemilinearHorizontal(m,D,C,h) means C(h(e))=(h⊗β₁)(D(e)) for every e. Both tensors and their comparison are the native tensor product and native semilinear tensor map.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism, HodgeStructuresPartII:H.0/intrinsic-preconnection, mathlib:TensorProduct.map.

Proof outline: Specify the displayed equality of actual additive operators. The target parameter is f(λ); horizontality is a separate relation and does not make D R-linear.

API:

- **Preconnection.semilinearHorizontal_refl**: The identity module map is horizontal from D to D over refl(Ω).
- **Preconnection.semilinearHorizontal_unit**: For any m:Morphism(f,Ω,Γ), the native semilinear map f:R→S is horizontal from unit(Ω,λ) to unit(Γ,f(λ)). No injectivity, surjectivity or flatness of f is required.
- **Preconnection.extend_semilinear**: If h is semilinearly horizontal over m, then C.extend((h⊗β₁)x)=(h⊗β₂)(D.extend(x)) for every x∈E⊗_R W. This is equality of actual additive maps; neither extension is assumed linear.
- **Preconnection.curvature_semilinear**: If h is semilinearly horizontal over m, then κ_C(h(e))=(h⊗β₂)(κ_D(e)) for every e. The equation holds for arbitrary λ and requires no d₀λ=0.
- **Preconnection.flat_reflect**: If h is semilinearly horizontal, h⊗β₂:E⊗_R Z→F⊗_S Y is injective, and κ_C=0, then κ_D=0. Injectivity of h or of f alone is not asserted to imply injectivity of this tensor map.
- **Preconnection.semilinearHorizontal_comp**: If h is horizontal from D to C over m and i is horizontal from C to B over n, then i∘h is horizontal from D to B over n.comp(m). The final parameter is (g∘f)(λ).

Unit tests:

- **Preconnection.SemilinearHorizontal.test_identity**: The native identity map is horizontal for every D.
- **Preconnection.SemilinearHorizontal.test_unit**: For every m, native f is horizontal between the unit λ and f(λ) preconnections.
- **Preconnection.SemilinearHorizontal.test_zero_map**: The native zero semilinear map is horizontal between arbitrary D and C with the matching parameters.

## Identity is horizontal

**Preconnection.semilinearHorizontal_refl** — The identity module map is horizontal from D to D over refl(Ω).

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-horizontal, HodgeStructuresPartII:H.0/calculus-ring-identity, mathlib:TensorProduct.map.

Proof outline: Reduce the native tensor of the two identity maps to the identity.

## Unit parameter connections are horizontal

**Preconnection.semilinearHorizontal_unit** — For any m:Morphism(f,Ω,Γ), the native semilinear map f:R→S is horizontal from unit(Ω,λ) to unit(Γ,f(λ)). No injectivity, surjectivity or flatness of f is required.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-horizontal, HodgeStructuresPartII:H.0/unit-connection, mathlib:RingHom.toSemilinearMap, mathlib:TensorProduct.map_tmul.

Proof outline: Evaluate the unit formula λ(1⊗d₀a). Semilinearity sends λ to f(λ), f(1)=1, and the degree-zero compatibility gives dΓ,₀f(a)=β₁dΩ,₀a.

## Right wedge commutes with ring comparison

**TwoForms.Morphism.wedgeRight_natural** — For every x∈E⊗_R W and ω∈W, wedgeRightΓ(β₁ω)((h⊗β₁)x)=(h⊗β₂)(wedgeRightΩ(ω)x). The convention is α∧ω on e⊗α.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-morphism, HodgeStructuresPartII:H.0/wedge-right, HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.map, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.induction_on.

Proof outline: Induct on the actual tensor. The elementary-tensor case is exactly the defining wedge comparison; zero and sums follow by additivity.

## Exterior extension across coefficient rings

**Preconnection.extend_semilinear** — If h is semilinearly horizontal over m, then C.extend((h⊗β₁)x)=(h⊗β₂)(D.extend(x)) for every x∈E⊗_R W. This is equality of actual additive maps; neither extension is assumed linear.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-horizontal, HodgeStructuresPartII:H.0/calculus-ring-wedge-right, HodgeStructuresPartII:H.0/exterior-extension, HodgeStructuresPartII:H.0/affine-exterior-extension-tmul, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.induction_on.

Proof outline: Induct on tensors. On e⊗ω, expand D.extend as D(e)∧ω+λe⊗d₁ω; use horizontality, wedge naturality, d₁ compatibility and the f-semilinear image of λ.

## Curvature across coefficient rings

**Preconnection.curvature_semilinear** — If h is semilinearly horizontal over m, then κ_C(h(e))=(h⊗β₂)(κ_D(e)) for every e. The equation holds for arbitrary λ and requires no d₀λ=0.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-extension, HodgeStructuresPartII:H.0/intrinsic-curvature, HodgeStructuresPartII:H.0/affine-curvature-apply.

Proof outline: Unfold curvature as the composite of the actual exterior extension with D; apply horizontality and extension naturality.

Unit tests:

- **Preconnection.curvature_semilinear.test_identity**: The identity tensor comparison sends κ_D(e) to κ_D(e).

## Flatness on the horizontal image

**Preconnection.flat_on_image** — If κ_D=0 and h is semilinearly horizontal over m, then κ_C(h(e))=0 for every e. This only asserts flatness on the image of h.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-curvature.

Proof outline: Apply curvature naturality to κ_D(e)=0 and map zero.

## Surjective horizontal maps preserve flatness

**Preconnection.flat_of_surjective** — If h is semilinearly horizontal and surjective as a function, and κ_D=0, then κ_C=0 on all of F.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-flat-image.

Proof outline: For each x∈F choose e with h(e)=x and apply flatness on the image. No surjectivity of the ring map alone is substituted for surjectivity of h.

## Injective curvature comparison reflects flatness

**Preconnection.flat_reflect** — If h is semilinearly horizontal, h⊗β₂:E⊗_R Z→F⊗_S Y is injective, and κ_C=0, then κ_D=0. Injectivity of h or of f alone is not asserted to imply injectivity of this tensor map.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-curvature.

Proof outline: Curvature naturality identifies the image of κ_D(e) with zero. Use injectivity of the actual degree-two tensor map to detect zero.

Unit tests:

- **Preconnection.flat_reflect.test_identity**: Identity comparison has an injective degree-two tensor map and reflects the actual curvature-zero equation.

## Flatness equivalence with explicit detection

**Preconnection.flat_semilinear_iff** — When h is semilinearly horizontal and surjective, and h⊗β₂ is injective, κ_C=0 if and only if κ_D=0.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-flat-surjective, HodgeStructuresPartII:H.0/semilinear-flat-reflection.

Proof outline: Combine the two preceding implications, retaining both separate hypotheses.

## Constant-parameter curvature-map comparison

**Preconnection.curvatureLinear_semilinear** — If dΩ,₀λ=0 and h is semilinearly horizontal over m, then curvatureLinear_C(h(e))=(h⊗β₂)(curvatureLinear_D(e)). The target constant-parameter proof is the actual consequence dΓ,₀f(λ)=0.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-curvature, HodgeStructuresPartII:H.0/calculus-ring-constant-parameter, HodgeStructuresPartII:H.0/affine-curvature-linear-map.

Proof outline: Use constant-parameter preservation and the exact curvature naturality equation; the existing curvatureLinear evaluation identifies each linear map with its additive curvature.

## Native tensor comparison composes

**TwoForms.Morphism.tensorMap_comp** — For semilinear h over f and i over g, ((i∘h)⊗(n.comp(m))₁)(x)=(i⊗n₁)((h⊗m₁)(x)) for every x∈E⊗_R W.

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/calculus-ring-composition, mathlib:LinearMap.comp, mathlib:RingHomCompTriple, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.induction_on.

Proof outline: Induct on the native tensor; both sides evaluate to i(h(e))⊗n₁(m₁ω) on e⊗ω.

## Horizontal coefficient-ring maps compose

**Preconnection.semilinearHorizontal_comp** — If h is horizontal from D to C over m and i is horizontal from C to B over n, then i∘h is horizontal from D to B over n.comp(m). The final parameter is (g∘f)(λ).

Hypotheses: k,R,S (and T for composition) are commutative rings; R,S,T are k-algebras. W,V,P are degree-one modules with their specified k-module actions, and Z,Y,Q are degree-two modules. E,F,G are native modules over their respective coefficient rings with additive commutative groups. No finite generation, basis, field, characteristic, smoothness, projectivity or flatness hypothesis is imposed. Ω,Γ,Δ are the existing supplied TwoForms calculi: derivation d₀, additive d₁, alternating bilinear wedge, the degree-one Leibniz identity, and d₁d₀=0. The ring maps f,g are genuine ring homomorphisms. The three compatibility equations are explicit input data on native semilinear maps; universal forms and sheaf pullback remain supplier obligations. D,C,B are actual additive preconnections with parameters λ,f(λ),(g∘f)(λ). Their k-module scalar towers are compatible. No relatively constant parameter is needed for additive exterior-extension or curvature naturality; only curvatureLinear requires the explicit condition d₀λ=0. Flatness on the image is distinct from flatness on every target section. The forward all-target implication states surjectivity of h; reflection states injectivity of the actual degree-two tensor comparison. No nonfaithful scalar extension is claimed to detect curvature.

Prerequisites: HodgeStructuresPartII:H.0/semilinear-horizontal, HodgeStructuresPartII:H.0/semilinear-tensor-map-composition.

Proof outline: Substitute the two actual horizontal equations and apply the native tensor-composition equation. The composite is a native semilinear map, not a stored assertion of naturality.

# Hodge Structures Part II: affine coordinate and curvature continuation

Codex — codex-5ebb6f; Refs #3371. This is a partial plan at immutable input bc09ee60ffaaf17ea3a32ae1dce51b92a58430ad.

Actual affine degree-one extension and curvature now commute with horizontal maps. Module-equivalence conjugation preserves the parameter, composes, has an inverse and transports flatness; curvatureLinear packages the constant-parameter curvature and its tensor formula as native R-linear maps. The ℤ[x] shear test retains the nonzero −2 frame derivative. Global sheaf descent/restriction/equality detection, ring-changing exterior transport, all five supplier requests,149 routed source items and H.1–H.8 remain open.

The actual affine operator is additive with D(ae)=aD(e)+λe⊗d₀a. For u:E≃F, transport is Dᵘ=(u⊗id)D u⁻¹. The changing-frame derivative is inside D(u⁻¹f); it cannot be dropped. Extension and curvature horizontality hold for arbitrary λ. Only the new curvature linear map requires d₀λ=0. All new native and canonical statements use the same compatible scalar tower. No rank, basis or flatness is imposed on the module identities.

Fresh source reading: [Esnault–Groechenig author manuscript](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), §4.2 opening and complete printed Lemma4.9 proof, pp.23–24; [Stacks07J5](https://stacks.math.columbia.edu/tag/07J5), complete displayed mathematical section and Lemma60.15.1 proof. The identities here are authored affine deductions. The source comparisons and geometric stages remain open.

## Right wedge commutes with module maps

Declaration: TwoForms.wedgeRight_map.

For u:E→ₗ[R]F, ω∈W and x∈E⊗W, wedgeRight_F(ω)((u⊗id_W)x)=(u⊗id_Z)(wedgeRight_E(ω)x).

Prerequisites: HodgeStructuresPartII:H.0/wedge-right, mathlib:TensorProduct.map, mathlib:TensorProduct.induction_on.

Proof: Induct on the actual tensor x. On e⊗α both sides are u(e)⊗(α∧ω); the zero and additive cases follow from the native linear maps.

## Horizontal maps commute with exterior extension

Declaration: Preconnection.extend_horizontal.

If u:E→ₗ[R]F is horizontal from D to C, then C.extend((u⊗id_W)x)=(u⊗id_Z)(D.extend(x)) for every x∈E⊗W. No R-linearity of the extension is assumed.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right-map, HodgeStructuresPartII:H.0/exterior-extension, mathlib:TensorProduct.induction_on.

Proof: Induct on x in the native tensor product. On e⊗ω replace C(u(e)) using horizontality, commute right wedge with u, and preserve the single correction λu(e)⊗d₁ω. Use additive maps in the induction step.

## Horizontal maps commute with curvature

Declaration: Preconnection.curvature_horizontal.

If u:E→ₗ[R]F is horizontal from D to C, then κ_C(u(e))=(u⊗id_Z)(κ_D(e)) for every e∈E and arbitrary λ.

Prerequisites: HodgeStructuresPartII:H.0/extension-horizontal, HodgeStructuresPartII:H.0/intrinsic-curvature.

Proof: Expand κ_C as C.extend∘C. Substitute the horizontal equation for C(u(e)), then apply the extension-horizontal identity at D(e).

## Transport of an affine parameter operator

Declaration: Preconnection.transport.

For an actual R-linear equivalence u:E≃F, define Dᵘ(f)=(u⊗id_W)(D(u⁻¹(f))). This is an actual additive λ-preconnection on F with the original parameter and differential calculus.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection, mathlib:TensorProduct.map.

Proof: Compose the native additive maps underlying u⁻¹, D and u⊗id_W. For a∈R expand D(a u⁻¹(f)) using its λ-Leibniz rule and use u(u⁻¹(f))=f. The resulting correction is λf⊗d₀a; the dependence of a frame on R is retained inside D(u⁻¹(f)).

Uses: HodgeStructuresPartII:H.0/local-descent: Apply actual horizontal extension and curvature equations on restricted overlaps; E1 still supplies the sheaf descent, restriction and equality-detection interfaces. HodgeStructuresPartII:H.0/coordinate-comparison: Identify the induced operator and curvature under actual module coordinates; the native polynomial shear test retains the negative λ dG correction. The universal-forms/frame and global comparisons remain open.

Api:

- Preconnection.transport_apply: Dᵘ(f)=(u⊗id_W)(D(u⁻¹(f))) for every f∈F.

- Preconnection.transport_horizontal: Dᵘ(u(e))=(u⊗id_W)(D(e)) for every e∈E.

- Preconnection.transport_refl: Transport along the identity R-linear equivalence leaves the section map D(e) unchanged.

- Preconnection.transport_trans: For u:E≃F and v:F≃G, (Dᵘ)ᵛ(g)=D^(u.trans v)(g) for every g∈G.

- Preconnection.transport_symm: Transport D first along u:E≃F and then u⁻¹ gives the original section map D(e).

- Preconnection.transport_extend: Dᵘ.extend((u⊗id_W)x)=(u⊗id_Z)(D.extend(x)) for every actual tensor x.

- Preconnection.transport_curvature: κ_(Dᵘ)(u(e))=(u⊗id_Z)(κ_D(e)) for arbitrary λ.

- Preconnection.transport_flat_iff: All κ_(Dᵘ)(f) vanish iff all κ_D(e) vanish. This uses an actual module equivalence and holds for arbitrary λ.

Tests:

- Preconnection.transport.test_identity: Transport through the identity equivalence leaves D(e) unchanged.

- Preconnection.transport.test_inverse_change: An actual u:E≃F followed by u⁻¹ recovers the original additive operator, with the same λ.

- Preconnection.transport.test_curvature_flatness: A flat actual affine preconnection remains flat after an actual module equivalence on every target element.

- Preconnection.transport.test_variable_frame_derivative: Over A=ℤ[x] on A² with D=2d and actual shear u(a,b)=(a+xb,b), the right-unitor-normalized transported operator at (0,1) equals (−2,0) and is nonzero. Dropping the derivative of the changing frame would incorrectly give zero.

## Evaluation of the transported operator

Declaration: Preconnection.transport_apply.

Dᵘ(f)=(u⊗id_W)(D(u⁻¹(f))) for every f∈F.

Prerequisites: HodgeStructuresPartII:H.0/affine-coordinate-transport.

Proof: Unfold the actual additive composition in transport.

## Coordinate equivalence is horizontal

Declaration: Preconnection.transport_horizontal.

Dᵘ(u(e))=(u⊗id_W)(D(e)) for every e∈E.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-transport-apply.

Proof: Evaluate the transport formula at u(e) and cancel u⁻¹u.

## Identity coordinate transport

Declaration: Preconnection.transport_refl.

Transport along the identity R-linear equivalence leaves the section map D(e) unchanged.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-transport-apply, mathlib:TensorProduct.map_id.

Proof: Reduce the native identity equivalence and native tensor map of two identities.

## Composition of coordinate changes

Declaration: Preconnection.transport_trans.

For u:E≃F and v:F≃G, (Dᵘ)ᵛ(g)=D^(u.trans v)(g) for every g∈G.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-transport-apply, mathlib:TensorProduct.map_map.

Proof: Expand both conjugations. Combine the native tensor maps with map_map and identify the inverse of the composite equivalence.

## Inverse coordinate change recovers the operator

Declaration: Preconnection.transport_symm.

Transport D first along u:E≃F and then u⁻¹ gives the original section map D(e).

Prerequisites: HodgeStructuresPartII:H.0/coordinate-transport-composition, HodgeStructuresPartII:H.0/coordinate-transport-identity.

Proof: Apply composition to u and u⁻¹, then reduce their composite to the identity equivalence.

## Exterior extension under a coordinate change

Declaration: Preconnection.transport_extend.

Dᵘ.extend((u⊗id_W)x)=(u⊗id_Z)(D.extend(x)) for every actual tensor x.

Prerequisites: HodgeStructuresPartII:H.0/extension-horizontal, HodgeStructuresPartII:H.0/coordinate-transport-horizontal.

Proof: Apply extension-horizontal to the actual equivalence u and the proved horizontal transport equation.

## Curvature under a coordinate change

Declaration: Preconnection.transport_curvature.

κ_(Dᵘ)(u(e))=(u⊗id_Z)(κ_D(e)) for arbitrary λ.

Prerequisites: HodgeStructuresPartII:H.0/curvature-horizontal, HodgeStructuresPartII:H.0/coordinate-transport-horizontal.

Proof: Apply curvature-horizontal to u and the transport-horizontal identity.

## Coordinate-independent affine flatness

Declaration: Preconnection.transport_flat_iff.

All κ_(Dᵘ)(f) vanish iff all κ_D(e) vanish. This uses an actual module equivalence and holds for arbitrary λ.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-curvature-transport, mathlib:TensorProduct.congr.

Proof: For reflection apply κ_(Dᵘ) to u(e) and use injectivity of native TensorProduct.congr(u,id_Z). For preservation write f=u(e) by surjectivity and use the curvature transport equation. Tensoring a merely injective map is not invoked.

## The affine curvature linear map

Declaration: Preconnection.curvatureLinear.

When d₀λ=0, package the actual additive curvature κ_D:E→E⊗Z as a native R-linear map curvatureLinear(D).

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-curvature, HodgeStructuresPartII:H.0/affine-curvature-scalar-defect.

Proof: Use κ_D as the underlying function and its native additive equation. The already-proved scalar defect vanishes because d₀λ=0, yielding map_smul. This packages the affine object and leaves sheaf restriction and gluing open.

Uses: HodgeStructuresPartII:H.0/local-descent: Apply actual horizontal extension and curvature equations on restricted overlaps; E1 still supplies the sheaf descent, restriction and equality-detection interfaces. HodgeStructuresPartII:H.0/coordinate-comparison: Identify the induced operator and curvature under actual module coordinates; the native polynomial shear test retains the negative λ dG correction. The universal-forms/frame and global comparisons remain open.

Api:

- Preconnection.curvatureLinear_apply: curvatureLinear(D)(e)=κ_D(e) when d₀λ=0.

- Preconnection.curvatureLinear_horizontal: For a horizontal R-linear u:E→F and d₀λ=0, curvatureLinear(C)∘u=(u⊗id_Z)∘curvatureLinear(D) as actual R-linear maps.

- Preconnection.curvatureLinear_transport: For u:E≃F and d₀λ=0, curvatureLinear(Dᵘ)∘u=(u⊗id_Z)∘curvatureLinear(D).

- Preconnection.curvatureLinear_eq_zero_iff: When d₀λ=0, curvatureLinear(D)=0 iff κ_D(e)=0 for every e.

- Preconnection.affineTensor_curvatureLinear: When d₀λ=0, curvatureLinear(D⊗C)=rightComm∘(curvatureLinear(D)⊗id_F)+assoc⁻¹∘(id_E⊗curvatureLinear(C)). The equality is on all of E⊗F.

- Preconnection.unit_curvatureLinear_eq_zero: When d₀λ=0, curvatureLinear(unit(Ω,λ))=0.

Tests:

- Preconnection.curvatureLinear.test_zero_parameter: The zero native linear Higgs field gives the zero curvature linear map at λ=0.

- Preconnection.curvatureLinear.test_ordinary_unit: The genuine ordinary unit preconnection λ=1 has zero curvature linear map.

- Preconnection.curvatureLinear.test_tensor_flat: For constant λ, if both factor curvature linear maps vanish, the entire common-λ tensor curvature linear map vanishes.

## Evaluation of the curvature linear map

Declaration: Preconnection.curvatureLinear_apply.

curvatureLinear(D)(e)=κ_D(e) when d₀λ=0.

Prerequisites: HodgeStructuresPartII:H.0/affine-curvature-linear-map.

Proof: Evaluate the native LinearMap construction.

## Curvature linear maps respect horizontality

Declaration: Preconnection.curvatureLinear_horizontal.

For a horizontal R-linear u:E→F and d₀λ=0, curvatureLinear(C)∘u=(u⊗id_Z)∘curvatureLinear(D) as actual R-linear maps.

Prerequisites: HodgeStructuresPartII:H.0/affine-curvature-linear-map, HodgeStructuresPartII:H.0/curvature-horizontal.

Proof: Apply native linear-map extensionality and the arbitrary-parameter pointwise curvature-horizontal identity.

## Conjugacy of curvature linear maps

Declaration: Preconnection.curvatureLinear_transport.

For u:E≃F and d₀λ=0, curvatureLinear(Dᵘ)∘u=(u⊗id_Z)∘curvatureLinear(D).

Prerequisites: HodgeStructuresPartII:H.0/curvature-linear-map-horizontal, HodgeStructuresPartII:H.0/coordinate-transport-horizontal.

Proof: Specialize curvature-linear-map-horizontal to the actual coordinate equivalence and its proved horizontality.

## Zero curvature map detects affine integrability

Declaration: Preconnection.curvatureLinear_eq_zero_iff.

When d₀λ=0, curvatureLinear(D)=0 iff κ_D(e)=0 for every e.

Prerequisites: HodgeStructuresPartII:H.0/curvature-linear-map-apply.

Proof: Evaluate a zero-map equality on e for one implication. For the converse use native linear-map extensionality and pointwise vanishing.

## Tensor curvature as a linear-map sum

Declaration: Preconnection.affineTensor_curvatureLinear.

When d₀λ=0, curvatureLinear(D⊗C)=rightComm∘(curvatureLinear(D)⊗id_F)+assoc⁻¹∘(id_E⊗curvatureLinear(C)). The equality is on all of E⊗F.

Prerequisites: HodgeStructuresPartII:H.0/affine-curvature-linear-map, HodgeStructuresPartII:H.0/affine-parameter-tensor-curvature, mathlib:TensorProduct.ext'.

Proof: Both sides are native R-linear maps. Apply tensor extensionality and the already-proved arbitrary-λ tensor-curvature identity on e⊗f, including its cancellation of both mixed wedge terms.

## Constant-parameter unit has zero curvature map

Declaration: Preconnection.unit_curvatureLinear_eq_zero.

When d₀λ=0, curvatureLinear(unit(Ω,λ))=0.

Prerequisites: HodgeStructuresPartII:H.0/curvature-linear-map-zero, HodgeStructuresPartII:H.0/affine-unit-curvature.

Proof: Reduce zero-map equality to pointwise curvature. Substitute the genuine unit curvature formula λ(1⊗d₀λ∧d₀a) and use d₀λ=0.

The263 unchanged incoming node objects remain whole. Only local-descent and coordinate-comparison gain five prerequisites and one proof step each; their statements/hypotheses are unchanged. The new package adds19 nodes (2constructions,17lemmas),14 APIs and7 typed tests. All149 route obligations,35 inherited typed omissions, six planets,11 gaps and five supplier requests are retained. All implementation statuses remain unchecked.

---

## Preserved incoming reader

# Common-parameter affine exterior extension and tensor curvature

Checkpoint by Codex — codex-a71f92, 2026-10-03. The packet is partial and every declaration remains unchecked. This is the actual affine component of the existing general Hodge plan, not a replacement of the ringed-site key by an affine surrogate.

## Exact conventions and the correction term

Write W for degree-one forms and Z for degree-two forms. The existing TwoForms input supplies an actual derivation d₀, additive d₁ and alternating bilinear wedge, with d₁(aω)=d₀a∧ω+a d₁ω and d₁d₀=0. These equations are inputs of an exterior calculus: this checkpoint does not construct universal forms. D and C are actual additive preconnections with the same element λ of the coefficient ring. Their underlying section maps are not incorrectly declared R-linear.

The degree-one extension has the generator rule D₁(e⊗ω)=D(e)∧ω+λ(e⊗d₁ω). Both Leibniz equations are necessary to prove balance in the scalar relation ae⊗ω=e⊗aω; the receiving map is then the native balanced additive lift. For an arbitrary tensor x, its scalar correction is D₁(ax)=aD₁(x)+λ(id⊗(d₀a∧−))(x). Even when d₀λ=0, D₁ itself need not be R-linear.

Curvature κ_D=D₁∘D is additive. For a varying parameter its precise scalar defect is κ_D(ae)−aκ_D(e)=λ(e⊗(d₀λ∧d₀a)). Thus the ordinary scalar-linearity conclusion follows under d₀λ=0, but that condition may not be silently erased from the global flat-bundle definition. The raw unit U_λ=λd has curvature λ(1⊗(d₀λ∧d₀a)); it is flat for a relatively constant parameter. This calculation distinguishes a raw preconnection from the reserved general flat connection carrier.

For the actual common-λ tensor T=D⊗_λ C, the exterior extension of the left derivative contributes −tensorWedge(D(e)⊗C(f)); the right derivative contributes the identical tensor with a plus sign. Alternation derives from wedge(ω+α,ω+α)=0 and needs no division by two. Cancellation leaves κ_T(e⊗f)=ρ_Z(κ_D(e)⊗f)+a_Z⁻¹(e⊗κ_C(f)). This identity holds for arbitrary modules over every commutative coefficient ring, even before imposing d₀λ=0. Factor curvature vanishing implies tensor curvature vanishing on every tensor by additive tensor induction. It does not imply a converse.

## Source and ownership boundary

The fresh Esnault–Groechenig reading is exactly the author manuscript §4.2 opening definition, zero/one cases, and Lemma 4.9 statement and full printed proof, printed pages 23–24. Its downloaded SHA-256 is 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. The fresh Stacks Tag 07J5 reading covers its displayed connection definition, exterior extension, integrability convention and complete Lemma 60.15.1 proof. The native identities here are authored algebraic deductions, not printed arbitrary-module sheaf tensor claims. The Simpson inputs and published Acta text have not been freshly checked.

All four reviewed Hodge parent audit rows and the complete REV-AUDIT-02 report were read, together with the nearby upstream HodgeStructures and SemisimpleAlgebras documents. The nine own stage descriptions, exact reserved key and CR.1/E1/DD.1 supplier descriptions were read. These upstream theories stay imports. All eight assigned route briefs and their 149 item identifiers remain preserved; no fresh 149-source proof audit is claimed. Historical source receipts and the one existing source issue are retained as predecessor records. The 35 typed omission rows, six planets, eleven gaps and five requests remain intact.

The packet has 23 new declaration-sized nodes, including three constructions: right wedge multiplication, the exterior extension pair, and the coefficient tensor wedge. The first two already had admitted helper signatures in the incoming suggested file; they are now explicitly owned, equipped with APIs and tested. They are not second definitions. The full reserved key still ranges over finite locally free objects on a ringed site with a relatively constant parameter, tensor/dual operations, twists and graded constructions. E1 still supplies actual native sheaf tensor/exterior restriction, equality detection and gluing; tensor products of global sections are not silently identified with sections of a sheaf tensor.

## New declaration catalogue

### Alternating wedge interchange

Declaration: TwoForms.wedge_swap. Node: HodgeStructuresPartII:H.0/wedge-alternating-swap.

For any ω,α∈W, ω∧α+α∧ω=0. This follows from alternation even when 2 is not invertible.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Expand (ω+α)∧(ω+α)=0 by bilinearity and cancel both diagonal terms.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Right exterior multiplication

Declaration: TwoForms.wedgeRight. Node: HodgeStructuresPartII:H.0/wedge-right.

For ω∈W, wedgeRight(ω):E⊗W→E⊗Z is the R-linear map id_E⊗(α↦α∧ω). The order is α then ω.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Flip the existing bilinear wedge and tensor its fixed-ω linear map with the identity.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection, mathlib:TensorProduct.map, mathlib:LinearMap.flip.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

API outline:

- TwoForms.wedgeRight_tmul (projection): wedgeRight(ω)(e⊗α)=e⊗(α∧ω).
- TwoForms.wedgeRight_add (structure): wedgeRight(ω+α)(x)=wedgeRight(ω)(x)+wedgeRight(α)(x) for every x∈E⊗W.
- TwoForms.wedgeRight_smul (structure): wedgeRight(aω)(x)=a·wedgeRight(ω)(x) for a∈R and x∈E⊗W.

Unit tests:

- TwoForms.wedgeRight.test_order (computation): wedgeRight(ω)(e⊗α)=e⊗(α∧ω), not e⊗(ω∧α).
- TwoForms.wedgeRight.test_zero_form (degenerate): wedgeRight(0)(x)=0 for every genuine tensor x.
- TwoForms.wedgeRight.test_scalar (compatibility): wedgeRight(aω)(x)=a wedgeRight(ω)(x).

### Right wedge evaluation

Declaration: TwoForms.wedgeRight_tmul. Node: HodgeStructuresPartII:H.0/wedge-right-tmul.

wedgeRight(ω)(e⊗α)=e⊗(α∧ω).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Evaluate the native tensor map on an elementary tensor.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right, mathlib:TensorProduct.map_tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Additivity of the right form

Declaration: TwoForms.wedgeRight_add. Node: HodgeStructuresPartII:H.0/wedge-right-add.

wedgeRight(ω+α)(x)=wedgeRight(ω)(x)+wedgeRight(α)(x) for every x∈E⊗W.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Use tensor induction; on elementary tensors use bilinearity in the second wedge argument.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Scalar action on the right form

Declaration: TwoForms.wedgeRight_smul. Node: HodgeStructuresPartII:H.0/wedge-right-smul.

wedgeRight(aω)(x)=a·wedgeRight(ω)(x) for a∈R and x∈E⊗W.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Use tensor induction and move the scalar from the right wedge argument to the tensor.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.tmul_smul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Balanced exterior extension pair

Declaration: Preconnection.extensionPair. Node: HodgeStructuresPartII:H.0/exterior-extension-pair.

Define the biadditive pair P_D(e,ω)=wedgeRight(ω)(D(e))+λ(e⊗d₁ω). It has values in E⊗Z; its later balance proof, not separate R-linearity, permits the additive tensor lift.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Construct the two nested additive homomorphisms using additivity of D,d₁ and the right-wedge map.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection, HodgeStructuresPartII:H.0/wedge-right-add, HodgeStructuresPartII:H.0/wedge-right-tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

API outline:

- Preconnection.extensionPair_apply (projection): P_D(e,ω)=wedgeRight(ω)(D(e))+λ(e⊗d₁ω).
- Preconnection.extensionPair_add (structure): P_D(e+f,ω)=P_D(e,ω)+P_D(f,ω).
- Preconnection.extension_balanced (universal-property): P_D(ae,ω)=P_D(e,aω); this is the precise relation required by the native additive tensor lift.

Unit tests:

- Preconnection.extensionPair.test_formula (computation): P_D(e,ω)=wedgeRight(ω)(D(e))+λ(e⊗d₁ω).
- Preconnection.extensionPair.test_zero_section (degenerate): P_D(0,ω)=0.
- Preconnection.extensionPair.test_balanced (characterisation): P_D(ae,ω)=P_D(e,aω), with no separate R-linearity assumed.

### Exterior pair evaluation

Declaration: Preconnection.extensionPair_apply. Node: HodgeStructuresPartII:H.0/exterior-extension-pair-apply.

P_D(e,ω)=wedgeRight(ω)(D(e))+λ(e⊗d₁ω).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Unfold the pair's evaluation, without replacing it by an assumed R-linear map.

Prerequisites: HodgeStructuresPartII:H.0/exterior-extension-pair.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Affine exterior extension evaluation

Declaration: Preconnection.extend_tmul. Node: HodgeStructuresPartII:H.0/affine-exterior-extension-tmul.

For the actual balanced degree-one additive lift, D₁(e⊗ω)=wedgeRight(ω)(D(e))+λ(e⊗d₁ω).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Evaluate the existing liftAddHom using its native generator equation; this is the affine component of the unchanged global exterior-extension contract.

Prerequisites: HodgeStructuresPartII:H.0/exterior-extension, HodgeStructuresPartII:H.0/extension-balancing, HodgeStructuresPartII:H.0/exterior-extension-pair-apply, mathlib:TensorProduct.liftAddHom_tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Exterior extension scalar correction

Declaration: Preconnection.extend_smul. Node: HodgeStructuresPartII:H.0/affine-exterior-extension-scalar.

For every a∈R and x∈E⊗W, D₁(ax)=aD₁(x)+λ(id_E⊗(d₀a∧−))(x). In general D₁ is additive, not R-linear.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on x. On e⊗ω insert the λ-Leibniz equation for D(ae), evaluate wedgeRight, and transfer scalars in the tensor.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-extension-tmul, HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.map_tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Opposite exterior orders cancel

Declaration: TwoForms.wedgeRight_add_left. Node: HodgeStructuresPartII:H.0/wedge-right-left-cancellation.

For ω∈W and x∈E⊗W, wedgeRight(ω)(x)+(id_E⊗(ω∧−))(x)=0.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Reduce to e⊗α and tensor the alternating interchange equation. Additivity extends the cancellation to every x.

Prerequisites: HodgeStructuresPartII:H.0/wedge-alternating-swap, HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.map_tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Affine curvature evaluation

Declaration: Preconnection.curvature_apply. Node: HodgeStructuresPartII:H.0/affine-curvature-apply.

The existing actual additive curvature is κ_D(e)=D₁(D(e)). This is the degree-zero affine component, not a new global sheaf carrier.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Evaluate the existing additive composite.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-curvature, HodgeStructuresPartII:H.0/exterior-extension.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Curvature defect for a varying parameter

Declaration: Preconnection.curvature_scalar_defect. Node: HodgeStructuresPartII:H.0/affine-curvature-scalar-defect.

For every a∈R and e∈E, κ_D(ae)=aκ_D(e)+λ(e⊗(d₀λ∧d₀a)). No assumption d₀λ=0 is used.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Expand D(ae), apply the exterior scalar correction to both summands, use d₁d₀=0, and cancel the two opposite wedge orders. The remaining d₀λ term must not be discarded.

Prerequisites: HodgeStructuresPartII:H.0/affine-curvature-apply, HodgeStructuresPartII:H.0/affine-exterior-extension-scalar, HodgeStructuresPartII:H.0/affine-exterior-extension-tmul, HodgeStructuresPartII:H.0/wedge-right-left-cancellation.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Curvature of the parameter unit

Declaration: Preconnection.unit_curvature. Node: HodgeStructuresPartII:H.0/affine-unit-curvature.

For the genuine unit preconnection U_λ(a)=λ(1⊗d₀a), κ_U(a)=λ(1⊗(d₀λ∧d₀a)). In particular the unit is flat when d₀λ=0.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged. The existing unit construction additionally uses the compatible scalar tower k→R→W.

Proof: Insert the unit's actual additive formula and the degree-one scalar correction. Use d₀1=0 and d₁d₀a=0.

Prerequisites: HodgeStructuresPartII:H.0/unit-connection, HodgeStructuresPartII:H.0/affine-curvature-apply, HodgeStructuresPartII:H.0/affine-exterior-extension-scalar, HodgeStructuresPartII:H.0/affine-exterior-extension-tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Two coefficient tensors wedged

Declaration: TwoForms.tensorWedge. Node: HodgeStructuresPartII:H.0/tensor-wedge.

Define tensorWedge:(E⊗W)⊗(F⊗W)→(E⊗F)⊗Z as the R-linear native four-factor interchange followed by id_(E⊗F)⊗wedge. It sends (e⊗ω)⊗(f⊗α) to (e⊗f)⊗(ω∧α).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Use tensorTensorTensorComm to group E,F and W,W, then the linear lift of the existing wedge and the identity tensor map.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection, mathlib:TensorProduct.tensorTensorTensorComm, mathlib:TensorProduct.lift, mathlib:TensorProduct.map.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

API outline:

- TwoForms.tensorWedge_tmul (projection): tensorWedge((e⊗ω)⊗(f⊗α))=(e⊗f)⊗(ω∧α).
- TwoForms.tensorWedge_zero (simp): tensorWedge(0)=0.
- TwoForms.tensorWedge_add (structure): tensorWedge(x+y)=tensorWedge(x)+tensorWedge(y).

Unit tests:

- TwoForms.tensorWedge.test_pure (computation): tensorWedge((e⊗ω)⊗(f⊗α))=(e⊗f)⊗(ω∧α).
- TwoForms.tensorWedge.test_zero (degenerate): tensorWedge(0⊗y)=0.
- TwoForms.tensorWedge.test_integral_orientation (non-example): On R=ℤ, W=ℤ², Z=ℤ with determinant wedge and d₀=d₁=0, native unit normalization evaluates ((1⊗(1,0))⊗(1⊗(0,1))) to +1 and its form-reversed counterpart to −1. This rejects a zero wedge or reversed wedge convention.

### Coefficient wedge evaluation

Declaration: TwoForms.tensorWedge_tmul. Node: HodgeStructuresPartII:H.0/tensor-wedge-tmul.

tensorWedge((e⊗ω)⊗(f⊗α))=(e⊗f)⊗(ω∧α).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Evaluate each native map on the four elementary factors in the stated order.

Prerequisites: HodgeStructuresPartII:H.0/tensor-wedge, mathlib:TensorProduct.tensorTensorTensorComm_tmul, mathlib:TensorProduct.lift.tmul, mathlib:TensorProduct.map_tmul.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Right wedge through the right commutor

Declaration: TwoForms.wedgeRight_rightComm. Node: HodgeStructuresPartII:H.0/wedge-right-comm-transport.

wedgeRight(ω)(ρ_W(x⊗f))=ρ_Z(wedgeRight(ω)(x)⊗f), where ρ moves the coefficient factor past F.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on x and evaluate the right commutor and wedge on elementary tensors.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.rightComm_tmul, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Negative mixed wedge through association

Declaration: TwoForms.wedgeRight_assoc_mixed. Node: HodgeStructuresPartII:H.0/wedge-right-assoc-mixed.

wedgeRight(ω)(a_W⁻¹(e⊗y))=−tensorWedge((e⊗ω)⊗y) for all y∈F⊗W. The minus sign is forced by α∧ω=−ω∧α.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on y; on f⊗α exchange the wedge order using alternation, without dividing by 2.

Prerequisites: HodgeStructuresPartII:H.0/wedge-alternating-swap, HodgeStructuresPartII:H.0/wedge-right-tmul, HodgeStructuresPartII:H.0/tensor-wedge-tmul, mathlib:TensorProduct.assoc_symm_tmul, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Right wedge through association

Declaration: TwoForms.wedgeRight_assoc. Node: HodgeStructuresPartII:H.0/wedge-right-assoc-transport.

wedgeRight(ω)(a_W⁻¹(e⊗y))=a_Z⁻¹(e⊗wedgeRight(ω)(y)).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on y and compare elementary tensor evaluations.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right-tmul, mathlib:TensorProduct.assoc_symm_tmul, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Positive mixed wedge through commutation

Declaration: TwoForms.wedgeRight_rightComm_mixed. Node: HodgeStructuresPartII:H.0/wedge-right-comm-mixed.

wedgeRight(ω)(ρ_W(x⊗f))=tensorWedge(x⊗(f⊗ω)). The first wedge factor is the form in x.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on x; evaluate the native maps without interchanging the two form factors.

Prerequisites: HodgeStructuresPartII:H.0/wedge-right-tmul, HodgeStructuresPartII:H.0/tensor-wedge-tmul, mathlib:TensorProduct.rightComm_tmul, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Tensor exterior extension of a left derivative

Declaration: Preconnection.affineTensor_extend_left. Node: HodgeStructuresPartII:H.0/affine-parameter-tensor-extend-left.

For T=D⊗_λ C and x∈E⊗W, T₁(ρ_W(x⊗f))=ρ_Z(D₁(x)⊗f)−tensorWedge(x⊗C(f)).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on x, expand the genuine same-λ tensor derivative on e⊗f, and use the two right-wedge transport equations. Combine the d₁ contribution with the D₁ term.

Prerequisites: HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul, HodgeStructuresPartII:H.0/affine-exterior-extension-tmul, HodgeStructuresPartII:H.0/wedge-right-comm-transport, HodgeStructuresPartII:H.0/wedge-right-assoc-mixed, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Tensor exterior extension of a right derivative

Declaration: Preconnection.affineTensor_extend_right. Node: HodgeStructuresPartII:H.0/affine-parameter-tensor-extend-right.

For T=D⊗_λ C and y∈F⊗W, T₁(a_W⁻¹(e⊗y))=a_Z⁻¹(e⊗C₁(y))+tensorWedge(D(e)⊗y).

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Induct on y, expand the same-λ tensor derivative, and use positive mixed commutation plus plain association transport. Transfer the d₁ scalar term through the associator.

Prerequisites: HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul, HodgeStructuresPartII:H.0/affine-exterior-extension-tmul, HodgeStructuresPartII:H.0/wedge-right-comm-mixed, HodgeStructuresPartII:H.0/wedge-right-assoc-transport, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Common-parameter tensor curvature

Declaration: Preconnection.affineTensor_curvature_tmul. Node: HodgeStructuresPartII:H.0/affine-parameter-tensor-curvature.

For every e,f, κ_(D⊗_λ C)(e⊗f)=ρ_Z(κ_D(e)⊗f)+a_Z⁻¹(e⊗κ_C(f)). This formula holds even when d₀λ≠0; the two signed mixed terms cancel.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged.

Proof: Expand the actual additive curvature of the tensor sum and apply the left and right extension identities. Cancel −tensorWedge(D(e)⊗C(f)) with its positive counterpart.

Prerequisites: HodgeStructuresPartII:H.0/affine-curvature-apply, HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul, HodgeStructuresPartII:H.0/affine-parameter-tensor-extend-left, HodgeStructuresPartII:H.0/affine-parameter-tensor-extend-right.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

### Tensor of flat affine preconnections

Declaration: Preconnection.affineTensor_flat. Node: HodgeStructuresPartII:H.0/affine-parameter-tensor-flat.

If κ_D(e)=0 and κ_C(f)=0 for every factor input, then κ_(D⊗_λ C)(x)=0 for every x∈E⊗F. No converse or flatness of the underlying modules is asserted.

Hypotheses: k and R are commutative rings with a k-algebra structure on R. E,F,W,Z are genuine R-modules with additive commutative groups; W carries its specified k-module structure. The existing TwoForms input has a derivation d₀:R→W, additive d₁:W→Z, alternating R-bilinear wedge W×W→Z, d₁(aω)=d₀a∧ω+a d₁ω, and d₁d₀=0. No universal forms, site or global sections tensor comparison is constructed by this input. D:E→E⊗W and C:F→F⊗W are actual additive maps satisfying the same-λ Leibniz equation. Neither map is assumed R-linear. No basis, finite generation, projectivity, flatness, characteristic, field or smoothness hypothesis is imposed. λ is an arbitrary element of R. The raw tensor-curvature equality does not require d₀λ=0. The global reserved flat-bundle key keeps its relative-constant parameter and finite locally free ringed-site contract unchanged. For every e∈E and f∈F, the actual factor curvatures vanish.

Proof: Use tensor induction and additivity of the actual curvature. On elementary tensors insert the two factor vanishing equations.

Prerequisites: HodgeStructuresPartII:H.0/affine-parameter-tensor-curvature, mathlib:TensorProduct.induction_on.

Acceptance: Use the actual additive preconnection and native tensor maps; retain the stated wedge order and every scalar correction. The separate admission-free affine certificate does not close the global sheaf key, supplier requests, source routes, or H.1–H.8.

## Additional consumer API and tests

Preconnection.extend retains its incoming contract and adds:

- Preconnection.extend_smul: For every a∈R and x∈E⊗W, D₁(ax)=aD₁(x)+λ(id_E⊗(d₀a∧−))(x). In general D₁ is additive, not R-linear.

- Preconnection.extend.test_scalar_correction: D₁(a(e⊗ω))=aD₁(e⊗ω)+λ(e⊗(d₀a∧ω)).

Preconnection.curvature retains its incoming contract and adds:

- Preconnection.curvature_scalar_defect: For every a∈R and e∈E, κ_D(ae)=aκ_D(e)+λ(e⊗(d₀λ∧d₀a)). No assumption d₀λ=0 is used.
- Preconnection.unit_curvature: For the genuine unit preconnection U_λ(a)=λ(1⊗d₀a), κ_U(a)=λ(1⊗(d₀λ∧d₀a)). In particular the unit is flat when d₀λ=0.

- Preconnection.curvature.test_raw_parameter_defect: κ_D(ae)=aκ_D(e)+λ(e⊗(d₀λ∧d₀a)), without requiring d₀λ=0.
- Preconnection.curvature.test_higgs_linear: At λ=0, κ_D(ae)=aκ_D(e).
- Preconnection.unit.test_constant_flat: For d₀λ=0, κ_(unit λ)(a)=0 for every a.

Preconnection.affineTensor retains its incoming contract and adds:

- Preconnection.affineTensor_extend_left: For T=D⊗_λ C and x∈E⊗W, T₁(ρ_W(x⊗f))=ρ_Z(D₁(x)⊗f)−tensorWedge(x⊗C(f)).
- Preconnection.affineTensor_extend_right: For T=D⊗_λ C and y∈F⊗W, T₁(a_W⁻¹(e⊗y))=a_Z⁻¹(e⊗C₁(y))+tensorWedge(D(e)⊗y).
- Preconnection.affineTensor_curvature_tmul: For every e,f, κ_(D⊗_λ C)(e⊗f)=ρ_Z(κ_D(e)⊗f)+a_Z⁻¹(e⊗κ_C(f)). This formula holds even when d₀λ≠0; the two signed mixed terms cancel.
- Preconnection.affineTensor_flat: If κ_D(e)=0 and κ_C(f)=0 for every factor input, then κ_(D⊗_λ C)(x)=0 for every x∈E⊗F. No converse or flatness of the underlying modules is asserted.

- Preconnection.affineTensor.test_curvature_sum: κ_(D⊗_λ C)(e⊗f)=ρ_Z(κ_D(e)⊗f)+a_Z⁻¹(e⊗κ_C(f)).
- Preconnection.affineTensor.test_flat_all_tensors: Actual pointwise vanishing of both factor curvatures implies κ_(D⊗_λ C)(x)=0 for every x, not just elementary tensors.

## Verification and continuation

The standalone actual-carrier certificate has no admissions or new axioms. Its kernel audits, full suggested-file elaboration, indexed blueprint check, actual intake path checks and immutable promoted/control graph checks are recorded in the handoff. The suggested file retains admitted planning bodies: a passing elaboration is not an implementation claim. The integral orientation test uses determinant wedge on ℤ² and obtains +1 and −1, rather than a vacuous zero-forms calculation. The generic tests inspect the actual scalar correction, balancing equation, curvature sum and all-tensor flatness implication.

The codex-a71f92 common-λ affine exterior continuation constructs the actual balanced degree-one extension, proves its scalar correction and the exact curvature defect λ(e⊗d₀λ∧d₀a), computes unit curvature, and proves the full common-λ tensor-curvature formula and factor-flatness implication for arbitrary modules. No constant-λ assumption is used in the raw tensor-curvature equation. All 149 routed obligations, the reserved general finite-locally-free ringed-site key, E1 tensor/exterior restriction, equality detection/gluing, cross-ring exterior/curvature transport, arbitrary-Q tensor-valued shuffle, determinant/Tate/period adapters and H.1–H.8 remain open. Earlier narrower frontier paragraphs are preserved checkpoint history.

## Preserved incoming reader

The remainder is the unchanged predecessor reader, including its own attributed checkpoint and source-reading receipts. Its earlier frontier language is historical, not a fresh assertion of what this checkpoint has left unsolved.

# Affine coherence for common-parameter connections

Let k→R be a map of commutative rings, and let Ω be the specified intrinsic degree-zero/one/two calculus. Its first differential d₀:R→W is a derivation, its second differential d₁:W→Z is additive, and its alternating R-bilinear wedge and differentials satisfy the stated exterior identities. All coefficient tensors below are actual tensor products of R-modules.

A λ-preconnection D on an R-module E is additive and satisfies D(ae)=aD(e)+λ(e⊗d₀a). For the same λ on E and F, the actual affine tensor T(D,C) has value ρ(D(e)⊗f)+α⁻¹(e⊗C(f)) on e⊗f, where ρ moves the form factor to the right. Neither separate summand is required to be R-linear. Its balanced additive lift, already supplied, retains one copy of λ.

These coherence laws require no basis, finite generation, projectivity, flatness, smoothness or characteristic assumption. They do not require d₀λ=0 or flatness of a preconnection. The latter conditions remain part of the integrable bundle interface. The existing unit API uses the compatible scalar tower k→R→W.

For three inputs, the two bracketings produce three contributions, one from each input operator. The native associator takes each contribution to the corresponding tensor with its form in the last position. Tensor induction handles arbitrary coefficient tensors and arbitrary input tensors. The unit is the actual differential operator U_λ(a)=λ(1⊗d₀a); its scalar derivative is essential to both unitor equations. If a linear equivalence is horizontal, its actual inverse is horizontal by applying the inverse tensor map to the defining equality.

The generic associator, symmetry, unit maps and their ordinary module identities belong to Mathlib. The new content is their compatibility with the additive λ-preconnections. No category carrier or generic tensor equivalence is reconstructed here.

## Declarations and proof routes

### Associativity of parameter tensor connections

`Preconnection.affineTensor_assoc`. For common-λ preconnections D on E, C on F and B on G, let T_L=(D⊗C)⊗B and T_R=D⊗(C⊗B), using the actual affineTensor. The native α:(E⊗_R F)⊗_R G≃E⊗_R(F⊗_R G) is horizontal: T_R(αx)=(α⊗id_W)T_L(x) for every x.

1. Apply tensor induction to x, and again to its E⊗F factor. All zero and sum cases follow by additivity.
2. On (e⊗f)⊗g, expand both tensor preconnections and reassociate the sum into its three contributions from D(e), C(f) and B(g).
3. Induct on each of those actual coefficient tensors. On pure coefficients, native associator/right-commutor/map evaluation gives exactly the same output tensor. No coefficient basis or integrability is used.

Prerequisites: `HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul`, `mathlib:TensorProduct.assoc`, `mathlib:TensorProduct.assoc_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.induction_on`.

### Inverses of horizontal parameter equivalences

`Preconnection.horizontal_symm`. Let D on E and C on F be common-λ preconnections and u:E≃ₗ[R]F an actual linear equivalence. If C(u(e))=(u⊗id_W)D(e) for every e, then D(u⁻¹(f))=(u⁻¹⊗id_W)C(f) for every f. The inverse is the native inverse of u, with no extra horizontal-inverse hypothesis.

1. Apply the forward equation at u⁻¹(f) and then the actual tensor map u⁻¹⊗id_W to both sides.
2. Cancel u(u⁻¹(f)). Tensor induction on D(u⁻¹(f)) cancels u⁻¹u in the remaining coefficient tensor.

Prerequisites: `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `mathlib:TensorProduct.map`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:LinearEquiv.apply_symm_apply`, `mathlib:LinearEquiv.symm_apply_apply`.

### Inverse associativity of parameter tensor connections

`Preconnection.affineTensor_assoc_symm`. With T_L,T_R and α as above, T_L(α⁻¹x)=(α⁻¹⊗id_W)T_R(x) for every x∈E⊗_R(F⊗_R G). Thus both directions of the native associator intertwine the actual additive tensor preconnections.

1. Apply horizontal_symm to the forward affineTensor_assoc equation and the native associator. Its inverse is not independently chosen.

Prerequisites: `HodgeStructuresPartII:H.0/affine-parameter-tensor-assoc`, `HodgeStructuresPartII:H.0/affine-parameter-horizontal-inverse`, `mathlib:TensorProduct.assoc`.

### Left unit for parameter tensor connections

`Preconnection.affineTensor_lid`. Write U_λ for the existing actual unit preconnection on R, U_λ(a)=λ(1⊗d₀a). For every common-λ D on E, the native left unitor ℓ:R⊗_R E≃E is horizontal: D(ℓx)=(ℓ⊗id_W)(U_λ⊗D)(x) for all x. In particular, on a⊗e the normalized value is aD(e)+λ(e⊗d₀a).

1. Induct on the tensor x. On a⊗e, expand U_λ(a) and the tensor formula, then use the actual λ-Leibniz equation for D(ae).
2. Move λ through the linear tensor permutations, interchange the two summands, and induct on the tensor D(e) to identify the second contribution with aD(e).

Prerequisites: `HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul`, `HodgeStructuresPartII:H.0/unit-connection`, `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `mathlib:TensorProduct.lid`, `mathlib:TensorProduct.lid_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.smul_tmul'`.

### Right unit for parameter tensor connections

`Preconnection.affineTensor_rid`. For D on E and U_λ(a)=λ(1⊗d₀a), the native right unitor r:E⊗_R R≃E is horizontal: D(rx)=(r⊗id_W)(D⊗U_λ)(x) for every x. On e⊗a its normalized value is aD(e)+λ(e⊗d₀a).

1. Induct on x and expand on e⊗a. The U_λ contribution is λ(e⊗d₀a), and tensor induction identifies the D contribution with aD(e).
2. The defining λ-Leibniz equation is precisely the remaining equality.

Prerequisites: `HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul`, `HodgeStructuresPartII:H.0/unit-connection`, `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `mathlib:TensorProduct.rid`, `mathlib:TensorProduct.rid_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.tmul_smul`.

### Horizontal insertion of the left tensor unit

`Preconnection.affineTensor_lid_symm`. The inverse left unitor is horizontal: (U_λ⊗D)(ℓ⁻¹e)=(ℓ⁻¹⊗id_W)D(e). Since the native inverse is ℓ⁻¹e=1⊗e, inserting the unit preserves the full coefficient tensor D(e).

1. Apply horizontal_symm to affineTensor_lid and the native left unitor. Read the inverse as the actual insertion e↦1⊗e, using lid_symm_apply.

Prerequisites: `HodgeStructuresPartII:H.0/affine-parameter-tensor-left-unit`, `HodgeStructuresPartII:H.0/affine-parameter-horizontal-inverse`, `mathlib:TensorProduct.lid`, `mathlib:TensorProduct.lid_symm_apply`.

### Horizontal insertion of the right tensor unit

`Preconnection.affineTensor_rid_symm`. The inverse right unitor is horizontal: (D⊗U_λ)(r⁻¹e)=(r⁻¹⊗id_W)D(e). The native inverse r⁻¹e=e⊗1 therefore preserves the full coefficient tensor D(e).

1. Apply horizontal_symm to affineTensor_rid and the native right unitor; rid_symm_apply fixes the actual inverse map.

Prerequisites: `HodgeStructuresPartII:H.0/affine-parameter-tensor-right-unit`, `HodgeStructuresPartII:H.0/affine-parameter-horizontal-inverse`, `mathlib:TensorProduct.rid`, `mathlib:TensorProduct.rid_symm_apply`.

## Consumed API

The existing `Preconnection.affineTensor` API includes the following coherence equations. The inverse-horizontality lemma is consumed by all three inverse statements.

- `Preconnection.affineTensor_assoc` (compatibility): For common-λ preconnections D on E, C on F and B on G, let T_L=(D⊗C)⊗B and T_R=D⊗(C⊗B), using the actual affineTensor. The native α:(E⊗_R F)⊗_R G≃E⊗_R(F⊗_R G) is horizontal: T_R(αx)=(α⊗id_W)T_L(x) for every x.

- `Preconnection.horizontal_symm` (functoriality): Let D on E and C on F be common-λ preconnections and u:E≃ₗ[R]F an actual linear equivalence. If C(u(e))=(u⊗id_W)D(e) for every e, then D(u⁻¹(f))=(u⁻¹⊗id_W)C(f) for every f. The inverse is the native inverse of u, with no extra horizontal-inverse hypothesis.

- `Preconnection.affineTensor_assoc_symm` (compatibility): With T_L,T_R and α as above, T_L(α⁻¹x)=(α⁻¹⊗id_W)T_R(x) for every x∈E⊗_R(F⊗_R G). Thus both directions of the native associator intertwine the actual additive tensor preconnections.

- `Preconnection.affineTensor_lid` (compatibility): Write U_λ for the existing actual unit preconnection on R, U_λ(a)=λ(1⊗d₀a). For every common-λ D on E, the native left unitor ℓ:R⊗_R E≃E is horizontal: D(ℓx)=(ℓ⊗id_W)(U_λ⊗D)(x) for all x. In particular, on a⊗e the normalized value is aD(e)+λ(e⊗d₀a).

- `Preconnection.affineTensor_rid` (compatibility): For D on E and U_λ(a)=λ(1⊗d₀a), the native right unitor r:E⊗_R R≃E is horizontal: D(rx)=(r⊗id_W)(D⊗U_λ)(x) for every x. On e⊗a its normalized value is aD(e)+λ(e⊗d₀a).

- `Preconnection.affineTensor_lid_symm` (compatibility): The inverse left unitor is horizontal: (U_λ⊗D)(ℓ⁻¹e)=(ℓ⁻¹⊗id_W)D(e). Since the native inverse is ℓ⁻¹e=1⊗e, inserting the unit preserves the full coefficient tensor D(e).

- `Preconnection.affineTensor_rid_symm` (compatibility): The inverse right unitor is horizontal: (D⊗U_λ)(r⁻¹e)=(r⁻¹⊗id_W)D(e). The native inverse r⁻¹e=e⊗1 therefore preserves the full coefficient tensor D(e).

## Discriminating tests

- `Preconnection.affineTensor.test_three_factor_reassociation` (compatibility): On every (e⊗f)⊗g the three common-λ preconnections agree after the native associator; forms remain the last tensor factor.

- `Preconnection.affineTensor.test_left_unit_derivative` (computation): For every a,e, normalize (U_λ⊗D)(a⊗e) by ℓ⊗id_W. The result is aD(e)+λ(e⊗d₀a), retaining the derivative of the scalar a.

- `Preconnection.affineTensor.test_left_unit_insertion` (compatibility): The actual tensor preconnection on 1⊗e is (ℓ⁻¹⊗id_W)D(e).

- `Preconnection.affineTensor.test_right_unit_insertion` (compatibility): The actual tensor preconnection on e⊗1 is (r⁻¹⊗id_W)D(e).

- `Preconnection.affineTensor.test_polynomial_parameter_not_doubled` (non-example): There exists an explicit intrinsic TwoForms on A=ℤ[x], with W=A, zero degree-two module and d₀=∂/∂x, for which two unit(2) connections evaluated at x⊗1 and normalized by native unitors give 2, and do not give 4. The proof constructs the calculus from MvPolynomial.pderiv rather than assuming the nonzero derivative.

The polynomial example uses A=MvPolynomial(Fin1,ℤ), W=A and the zero module Z=Fin0→A. It constructs TwoForms from the native partial derivative, with zero degree-one differential and zero wedge. This is a concrete rank-one affine calculus; it does not identify the sheaf of Kähler forms or assert the general sheaf comparison. The generator derivative equals1, so the displayed coefficient is exactly2 and differs from4 in ℤ[x].

## Sources and boundary

The parameter convention follows Esnault–Groechenig, [Rigid connections and F-isocrystals, author manuscript](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), §4.2, printed23–24. The ordinary connection and integrability convention is also given in [Stacks Project, §60.15](https://stacks.math.columbia.edu/tag/07J5). The affine coherence proofs above are direct algebraic deductions, not named source theorems.

General-λ tensor curvature and its integrability implication remain required. The native sheaf tensor, restriction compatibility, equality detection and gluing are separate from these module identities: tensors of global section modules are not identified with global sections of the sheaf tensor. The arbitrary-Q tensor-valued shuffle, cross-ring exterior transport, finite-projective sheaf restrictions, determinant/Tate/period adapters, all149 source obligations and the general reserved ringed-site key retain their full scope.

The subsequent detailed roadmap retains the established objects, source routes and requested suppliers. Earlier progress paragraphs describe their respective input boundaries; the current affine coherence boundary is stated above.

---

# Common-parameter additive tensor checkpoint

Two actual constructions and nine promoted lemmas extend the existing intrinsic preconnection on native module tensors. The definitions carry actual additive maps and defining equations; integrability remains separate. All235 declaration nodes remain unchecked, H.0 stays partial and H.1–H.8 stay not_read.

Let k→R be a commutative algebra, and let Ω be the existing truncated native TwoForms input. The underlying preconnections on E,F share λ∈R. Their values lie in E⊗_R W and F⊗_R W. Their sum is biadditive; its scalar correction is exactly λ(e⊗f)⊗d₀a. This algebra needs no flatness, local freeness, basis, characteristic restriction or d₀λ=0 assumption. The latter condition belongs to curvature and flatness, which this checkpoint does not close.

The two raw summands need not be R-linear individually. Expanding D(ae) on the left and C(af) on the right gives the same derivative correction and proves balancing of their sum. Mathlib’s actual balanced-additive tensor universal property gives the additive lift. Additive tensor induction proves its parameter Leibniz rule on every tensor. One does not add the two λ coefficients. The zero fiber agrees with the existing R-linear Higgs tensor by its evaluated formula and native tensor extensionality. Horizontal morphisms and symmetry follow by tensor induction on the source tensor and each coefficient tensor.

The raw unequal-parameter unit(1)/unit(0) formula fails balancing whenever d₀a≠0: after the native unit identifications its values at (a,1) and (1,a) are d₀a and zero. The common-parameter unit(2) tensor instead evaluates on a⊗1 to 2d₀a. This is a universal symbolic example with an explicit nonzero-derivative premise, not a newly certified polynomial calculus.

The ring-level same-λ additive tensor now has an actual balanced lift, its one-λ Leibniz rule, zero-Higgs compatibility, horizontal tensor maps and native symmetry, with admission-free proofs of the eleven new declarations in a standalone native context. The affine associator/unitors and general-λ tensor curvature remain open, as do arbitrary-Q tensor-valued shuffle, cross-ring exterior transport, finite-projective sheaf restriction/tensor coherence, E1 equality detection and gluing, determinant/Tate/period adapters, the reserved global ringed-site key, all149 source obligations and H.1–H.8. No tensor of global sections is identified with sections of the sheaf tensor. Earlier frontier text is retained as checkpoint history.

Fresh source reading is limited to the author manuscript §4.2 opening and Lemma4.9, and the displayed Stacks07J5 connection convention/proof. The author PDF hash is recorded in the packet. The published PDF returned403. The new arbitrary-module identities are authored deductions. Eight route manifests, all149 routed source obligations,35 global typed omissions, six planets, eleven gaps and five supplier requests are preserved. No whole-paper or whole-incoming-packet mathematical audit is newly claimed.

The mathematical contract of every new declaration, API item and test follows.

## Preconnection.affineTensorPair

For D∈Preconnection(Ω,λ,E), C∈Preconnection(Ω,λ,F), construct the actual biadditive B:E→(F→(E⊗_R F)⊗_R W), B(e,f)=ρ(D(e)⊗f)+α⁻¹(e⊗C(f)), where ρ:(E⊗W)⊗F≃(E⊗F)⊗W is the native right commutor and α:(E⊗F)⊗W≃E⊗(F⊗W) is the native associator.

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Use the two actual additive maps and native tensor maps to define the displayed sum. Prove additivity in e and f using add_tmul/tmul_add, additivity of D,C and linearity of the native rearrangements. The separate summands are not R-bilinear.

Dependencies: HodgeStructuresPartII:H.0/intrinsic-preconnection, mathlib:TensorProduct.rightComm, mathlib:TensorProduct.assoc.

API Preconnection.affineTensorPair_apply (projection). For every e∈E,f∈F, affineTensorPair(D,C)(e,f)=ρ(D(e)⊗f)+α⁻¹(e⊗C(f)).

API Preconnection.affineTensorPair_leibniz (compatibility). For a∈R,e∈E,f∈F, B(ae,f)=aB(e,f)+λ((e⊗f)⊗d₀a).

API Preconnection.affineTensorPair_balanced (universal-property). For a∈R,e∈E,f∈F, B(ae,f)=B(e,af). Both sides have exactly the same λ((e⊗f)⊗d₀a) correction.

Test Preconnection.affineTensorPair.test_zero_left (degenerate). For every D,C,f the actual biadditive map B(0,f) is zero.

Test Preconnection.affineTensorPair.test_balanced_same_parameter (compatibility). For arbitrary a,e,f and common λ, B(ae,f)=B(e,af).

Test Preconnection.affineTensorPair.test_parameter_two (computation). At λ=2 the scalar correction in B(ae,f) is 2((e⊗f)⊗d₀a).

Test Preconnection.affineTensorPair.test_distinct_parameters_nonexample (non-example). Assume d₀a≠0. For the raw two-summand formula from unit(1) on R and unit(0) on R, evaluate at (a,1) and (1,a), and normalize via ((R⊗R)⊗W)→W using the two native left unitors. The results are d₀a and zero, hence unequal. The unequal-parameter raw formula is not balanced.

Use HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-leibniz. Evaluate B and prove its single-correction scalar rule.

Use HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-balanced. Prove balancing of the sum from the two matching Leibniz equations.

Use HodgeStructuresPartII:H.0/affine-parameter-tensor. Supply the actual additive tensor lift, with balancing separately proved.

## Preconnection.affineTensorPair_apply

For every e∈E,f∈F, affineTensorPair(D,C)(e,f)=ρ(D(e)⊗f)+α⁻¹(e⊗C(f)).

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Evaluate the actual biadditive map on the displayed arguments.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-pair.

## Preconnection.affineTensorPair_leibniz

For a∈R,e∈E,f∈F, B(ae,f)=aB(e,f)+λ((e⊗f)⊗d₀a).

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Expand D(ae) with its λ-Leibniz equation. Move scalars through the actual tensors and right commutor. The derivative term occurs only in D(ae); commute the additive terms to recover aB(e,f).

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-apply, mathlib:TensorProduct.rightComm_tmul, mathlib:TensorProduct.smul_tmul'.

## Preconnection.affineTensorPair_balanced

For a∈R,e∈E,f∈F, B(ae,f)=B(e,af). Both sides have exactly the same λ((e⊗f)⊗d₀a) correction.

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Use the first scalar rule, then expand C(af) on the right. Native scalar balancing and associator evaluation identify the common derivative term; additive rearrangement proves equality. Differing parameters are not substituted.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-leibniz, HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-apply, mathlib:TensorProduct.tmul_smul, mathlib:TensorProduct.assoc_symm_tmul.

## Preconnection.affineTensor

Construct affineTensor(D,C)∈Preconnection(Ω,λ,E⊗_R F). Its actual additive section map is TensorProduct.liftAddHom(B, balanced). On e⊗f it is ρ(D(e)⊗f)+α⁻¹(e⊗C(f)); for every x it satisfies T(ax)=aT(x)+λ(x⊗d₀a).

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Apply the pinned balanced-additive universal property to B and the proved balancing equation. This produces an additive map, not an R-linear map for arbitrary λ. Verify its λ-Leibniz equation by native tensor induction: zero by additivity, pure tensors by the first scalar rule and liftAddHom_tmul, sums by distributivity.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-pair, HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-balanced, HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-leibniz, mathlib:TensorProduct.liftAddHom, mathlib:TensorProduct.liftAddHom_tmul, mathlib:TensorProduct.induction_on.

API Preconnection.affineTensor_toAddHom (projection). The underlying additive map of affineTensor(D,C) equals the native TensorProduct.liftAddHom of affineTensorPair(D,C) with its actual balanced proof.

API Preconnection.affineTensor_tmul (simp). For every e∈E,f∈F, affineTensor(D,C)(e⊗f)=ρ(D(e)⊗f)+α⁻¹(e⊗C(f)).

API Preconnection.affineTensor_leibniz (compatibility). For every a∈R,x∈E⊗_R F, affineTensor(D,C)(ax)=a affineTensor(D,C)(x)+λ(x⊗d₀a). The tensor has the common λ, rather than the sum of two parameters.

API Preconnection.affineTensor_ofLinear (compatibility). For actual R-linear θ:E→E⊗_R W and ψ:F→F⊗_R W, the R-linear zero-parameter map underlying affineTensor(ofLinear θ,ofLinear ψ) equals the existing TwistedHiggsBundle.affineTensorField(θ,ψ).

API Preconnection.affineTensor_horizontal (functoriality). For actual R-linear u:E→E′,v:F→F′ and common-λ preconnections D,C,D′,C′ with D′u=(u⊗id_W)D and C′v=(v⊗id_W)C, their native tensor map is horizontal: affineTensor(D′,C′)((u⊗v)x)=((u⊗v)⊗id_W)affineTensor(D,C)(x), for every x∈E⊗_R F.

API Preconnection.affineTensor_comm (compatibility). For the actual native symmetry τ:E⊗_R F≃F⊗_R E, affineTensor(C,D)(τx)=(τ⊗id_W)affineTensor(D,C)(x) for every x∈E⊗_R F.

Test Preconnection.affineTensor.test_higgs_compatibility (compatibility). For actual R-linear θ:E→E⊗_R W and ψ:F→F⊗_R W, the R-linear zero-parameter map underlying affineTensor(ofLinear θ,ofLinear ψ) equals the existing TwistedHiggsBundle.affineTensorField(θ,ψ).

Test Preconnection.affineTensor.test_additive_zero (degenerate). The actual tensor preconnection sends zero to zero.

Test Preconnection.affineTensor.test_parameter_one (compatibility). At λ=1, T(ax)=aT(x)+x⊗d₀a for every tensor x.

Test Preconnection.affineTensor.test_unit_parameter_two (computation). Tensor the actual unit(2) preconnection on R with itself. On a⊗1, normalize the result via ((R⊗R)⊗W)→W using the two native left unitors. Its value is 2d₀a; the parameter has not doubled.

Use HodgeStructuresPartII:H.0/affine-parameter-tensor-of-linear. Recover the actual R-linear Higgs tensor at zero parameter.

Use HodgeStructuresPartII:H.0/affine-parameter-tensor-horizontal. Construct the horizontal tensor of the actual linear horizontal maps.

Use HodgeStructuresPartII:H.0/affine-parameter-tensor-comm. Prove native tensor symmetry horizontal.

Use HodgeStructuresPartII:H.0/intrinsic-tensor. Supply the genuine ring-level common-λ component; actual sheaf tensor restriction and gluing remain required.

## Preconnection.affineTensor_toAddHom

The underlying additive map of affineTensor(D,C) equals the native TensorProduct.liftAddHom of affineTensorPair(D,C) with its actual balanced proof.

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Evaluate the actual projection of the preconnection constructor.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor, HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-balanced, mathlib:TensorProduct.liftAddHom.

## Preconnection.affineTensor_tmul

For every e∈E,f∈F, affineTensor(D,C)(e⊗f)=ρ(D(e)⊗f)+α⁻¹(e⊗C(f)).

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Use liftAddHom_tmul and the evaluated biadditive formula.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor, HodgeStructuresPartII:H.0/affine-parameter-tensor-pair-apply, mathlib:TensorProduct.liftAddHom_tmul.

## Preconnection.affineTensor_leibniz

For every a∈R,x∈E⊗_R F, affineTensor(D,C)(ax)=a affineTensor(D,C)(x)+λ(x⊗d₀a). The tensor has the common λ, rather than the sum of two parameters.

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Project the proved λ-Leibniz field of the actual tensor preconnection.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor.

## Preconnection.affineTensor_ofLinear

For actual R-linear θ:E→E⊗_R W and ψ:F→F⊗_R W, the R-linear zero-parameter map underlying affineTensor(ofLinear θ,ofLinear ψ) equals the existing TwistedHiggsBundle.affineTensorField(θ,ψ).

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results. For the zero-Higgs compatibility, use the existing IsScalarTower k R W input required by the inherited ofLinear/toLinear API. This is not used in raw common-λ balancing.

Proof. Apply native linear tensor extensionality on pure tensors. Use the existing toLinear_apply and ofLinear_apply equations; do not rely on reducibility of admitted prototypes. The actual elementary tensor formula matches the existing Higgs tensor evaluation exactly.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul, HodgeStructuresPartII:H.0/intrinsic-preconnection, HodgeStructuresPartII:H.0/affine-tensor-tmul, mathlib:TensorProduct.ext'.

## Preconnection.affineTensor_horizontal

For actual R-linear u:E→E′,v:F→F′ and common-λ preconnections D,C,D′,C′ with D′u=(u⊗id_W)D and C′v=(v⊗id_W)C, their native tensor map is horizontal: affineTensor(D′,C′)((u⊗v)x)=((u⊗v)⊗id_W)affineTensor(D,C)(x), for every x∈E⊗_R F.

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Induct on x by the actual additive tensor eliminator. On e⊗f insert the two given horizontality equations. Induct separately on D(e) and C(f) as tensors. Their pure coefficient tensors give the native map/rearrangement identity; sums and zero follow by additivity.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul, mathlib:TensorProduct.map, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.rightComm_tmul, mathlib:TensorProduct.assoc_symm_tmul.

## Preconnection.affineTensor_comm

For the actual native symmetry τ:E⊗_R F≃F⊗_R E, affineTensor(C,D)(τx)=(τ⊗id_W)affineTensor(D,C)(x) for every x∈E⊗_R F.

Hypotheses. k and R are commutative rings and R is a k-algebra; Ω is the existing intrinsic degree-zero/one/two calculus TwoForms, with actual derivation d₀:R→W, additive d₁:W→Z and alternating R-bilinear wedge satisfying its defining equations. E,F,W,Z are genuine R-modules with additive commutative groups; W also has its specified k-module structure. λ is the same element of R on both preconnections. No basis, finite generation, projectivity, flatness, smoothness, characteristic or field hypothesis is used. D:E→E⊗_R W and C:F→F⊗_R W are the actual additive section maps with λ-Leibniz equations. d₀λ=0 and integrability are not needed for the raw preconnection tensor; they remain requirements for later curvature and flat-bundle results.

Proof. Induct on x; exchange the two summands on elementary tensors. Induct on each genuine coefficient tensor D(e),C(f); the native commutor/associator evaluations agree on pure tensors. Handle sums by additivity.

Dependencies: HodgeStructuresPartII:H.0/affine-parameter-tensor-tmul, mathlib:TensorProduct.comm, mathlib:TensorProduct.comm_tmul, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.rightComm_tmul, mathlib:TensorProduct.assoc_symm_tmul.

The following reader is the unchanged incoming checkpoint history. Its narrower remaining-work statements are historical; the current frontier is above.

## Finite-projective coefficients retain the exact ordered tensor bound

Let R be any commutative ring and E,F,Q be R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual linear maps; their prescribed tensor field is T=θ⊗1+1⊗ψ. Ordered iterates I_n keep their coefficient factors in the given tensor-power order. For positive N,M, the hypotheses I_N(θ)=0 and I_M(ψ)=0 concern those actual tensor-valued maps, not only repeated powers of contractions by one dual vector.

If Q is finitely generated projective, then I_{N+M−1}(T)=0. No global basis of Q is chosen in the statement. E and F need not be finite, projective or flat. Neither integrability nor assumptions on the characteristic or reducedness of R enter this calculation. The coefficient hypothesis is precise: it does not settle the reserved ringed-site key when the coefficient sheaf is arbitrary.

The native theorem Module.Finite.exists_comp_eq_id_of_projective chooses d≥0 and actual linear maps u:Q→R^d and v:R^d→Q with vu=id_Q. A finite projective module is a retract of a finite free module; it need not itself be free. Postcompose θ and ψ with u to obtain fields with coefficient module R^d. The existing all-order coefficient comparison preserves I_N=0 and I_M=0, and coefficient postcomposition commutes with the actual tensor field. The mixed-word theorem for the native standard basis of R^d gives its order N+M−1 zero. Postcomposition by v reflects that zero to the original field, using the specified split relation on every ordered coefficient tensor power. Split maps remain split after tensoring with any module, which is why no flatness of E or F is needed. The auxiliary choice disappears from the result: the conclusion is the zero of the original intrinsic affine iterate.

This gives separate APIs for the coefficient retraction, a bound with a specified retract of a finite-basis module, the finite-projective bound, larger specified bounds, and existence of a positive nilpotence exponent. For k satisfying N+M≤k+1, ordered monotonicity gives I_k(T)=0. Positive nilpotence witnesses produce the positive exponent N+M−1; order zero is not used as a degenerate nilpotence witness.

For every commutative R-algebra S, the inherited actual scalar-extension/tensor-power comparison preserves the same bound for the tensor of the two scalar-extended fields. S need not be flat or faithful for preservation. The nonflat example takes ℤ→ZMod2. Reflection still requires its separately specified hypotheses. Actual S-linear equivalences e:S⊗_R(E⊗_R F)≃G and q:S⊗_R Q≃P transport the bound to the inherited chart field. These are maps and inverse data, not hypotheses asserting that the comparison conclusion already holds.

There is also a principal-cover statement. Let s⊆R span1 and let A_r be a native localization away from r for each r∈s. Suppose A_r⊗_R Q is finite projective and the two scalar-extended fields have fixed positive zero degrees N,M on every chart. Their local tensor fields have order N+M−1 zero. The actual scalar-extension coherence identifies them with the scalar extension of T, and principal-cover equality detection on the actual ordered tensor target gives I_{N+M−1}(T)=0 over R. This does not assume a global basis or global projectivity of Q. It is an affine localization result; native sheaf restriction, tensor/exterior identification and equality detection/gluing still require their EnhancedDerivedSheaves:E1 interfaces.

The concrete coefficient test is R=ℚ×ℚ and Q=ℚ through the first projection. Its maps are u(x)=(x,0) and v(a,b)=a, with vu=id. The native split-module theorem proves projectivity, and the surjective projection proves finite generation. The nonzero scalar (0,1) annihilates1∈Q. A nonzero globally free R-module would have zero annihilator, so this Q is not free. The typed example builds those actual maps and module instances and applies the order2/order2→order3 bound. Thus a proof that silently substitutes a basis of Q cannot account for this example.

Ten acceptance examples also check the direct-sum coefficient retraction, a specified finite-basis retract, the projective order3 bound, zero fields at order1, the larger order5 bound, positive nilpotence witnesses, nonflat scalar extension, chart transport and the principal-cover comparison. All eight new declarations are reusable affine lemmas consumed by the existing field/coefficient APIs; no generic native projective module or tensor-product definition is planned again.

Source motivation comes from Liu–Zhu, arXiv1602.06282v3 §2.1, Theorem2.1 and equation2.4. That source works over a smooth rigid analytic variety over a p-adic field, with a specified perfectoid extension and genuine local systems. Its tensor, dual and pullback requirements motivate this coefficient calculation. The arbitrary-ring finite-projective retract argument is authored mathematics using the pinned native module theorem and existing affine adapters. It is not the source correspondence, its proof of source nilpotence, a published-edition collation or a new erratum. Fresh reading covers the complete §2.1 on printed/PDF6–9, including its setup, full theorem, explanations and remarks before §2.2; other source coverage remains inherited.

The actual arbitrary-Q tensor-valued shuffle remains open. In particular, contractions by dual vectors do not separate arbitrary coefficient tensors without a proved separation result. The finite-projective retract does not remove that boundary. Same-λ nonzero-parameter balancing, cross-ring exterior/curvature transport, native finite-projective sheaf restriction and tensor-power coherence, global gluing, determinant/Tate/period adapters and all149 source obligations remain required. H.0 is partial; H.1–H.8 remain not_read. The full reserved key still uses finite locally free native O-module sheaves on the differential ringed site, central dλ=0, actual additive λ-Leibniz maps and defined exterior curvature. All35 global typed omissions and existing supplier ownership remain.

An inherited nonflat scalar-extension example failed its first whole-file check because its explicitly introduced integer module instances disagreed with the tensor-product instance. Its signature now uses fresh module types with canonical integer actions and explicit original-ring arguments, preserving the same mathematical assertion. The final admitted file and a supplement with the eight proof bodies and ten example bodies are checked separately. The supplement retains admitted incoming prototypes, so its receipt is conditional on those dependencies and is not an admission-free library proof. Every implementation status remains unchecked.

**TwistedHiggsBundle.affineCoefficientMap_retract**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. For arbitrary R-module P and u:Q→P, v:P→Q with vu=id_Q, postcomposition by u followed by v recovers θ.

**TwistedHiggsBundle.affineTensorField_ordered_bound_of_split_basis**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Let P have a finite R-basis and let u:Q→P, v:P→Q satisfy vu=id_Q. For positive N,M with I_N(θ)=0 and I_M(ψ)=0, I_{N+M−1}(T)=0.

**TwistedHiggsBundle.affineTensorField_ordered_bound_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For positive N,M with I_N(θ)=0 and I_M(ψ)=0, I_{N+M−1}(T)=0.

**TwistedHiggsBundle.affineTensorField_ordered_larger_bound_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For positive N,M, k with N+M≤k+1 and I_N(θ)=I_M(ψ)=0, I_k(T)=0.

**TwistedHiggsBundle.affineTensorField_ordered_nilpotent_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. If θ and ψ each have a positive zero ordered iterate, then T has a positive zero ordered iterate.

**TwistedHiggsBundle.affineTensorField_ordered_baseChange_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For any commutative R-algebra S, positive N,M and I_N(θ)=I_M(ψ)=0, the tensor of the actual scalar-extended fields has zero ordered iterate N+M−1. No flatness or faithfulness of S is required for preservation.

**TwistedHiggsBundle.affineTensorField_ordered_chart_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For any commutative R-algebra S, S-linear equivalences e:S⊗_R(E⊗_R F)≃G and q:S⊗_R Q≃P, and positive bounds N,M on θ,ψ, the actual chart field transported by e,q has zero ordered iterate N+M−1.

**TwistedHiggsBundle.affineTensorField_ordered_principalCover_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Let s⊆R satisfy span(s)=R, and for each r∈s let A_r be an actual localization away from r. Assume A_r⊗_R Q is finitely generated projective and that the scalar-extended fields have positive fixed zero degrees N,M on every r. Then I_{N+M−1}(T)=0 over R. Q need not have a global basis, and its global projectivity is not a premise.

**TwistedHiggsBundle.affineCoefficientMap_retract**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. For arbitrary R-module P and u:Q→P, v:P→Q with vu=id_Q, postcomposition by u followed by v recovers θ.

**TwistedHiggsBundle.affineCoefficientMap.test_split_projective_retract**. Postcomposition through Q→Q⊕P→Q recovers every actual field θ.

**TwistedHiggsBundle.affineTensorField_ordered_bound_of_split_basis**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Let P have a finite R-basis and let u:Q→P, v:P→Q satisfy vu=id_Q. For positive N,M with I_N(θ)=0 and I_M(ψ)=0, I_{N+M−1}(T)=0.

**TwistedHiggsBundle.affineTensorField_ordered_bound_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For positive N,M with I_N(θ)=0 and I_M(ψ)=0, I_{N+M−1}(T)=0.

**TwistedHiggsBundle.affineTensorField_ordered_larger_bound_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For positive N,M, k with N+M≤k+1 and I_N(θ)=I_M(ψ)=0, I_k(T)=0.

**TwistedHiggsBundle.affineTensorField_ordered_nilpotent_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. If θ and ψ each have a positive zero ordered iterate, then T has a positive zero ordered iterate.

**TwistedHiggsBundle.affineTensorField_ordered_baseChange_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For any commutative R-algebra S, positive N,M and I_N(θ)=I_M(ψ)=0, the tensor of the actual scalar-extended fields has zero ordered iterate N+M−1. No flatness or faithfulness of S is required for preservation.

**TwistedHiggsBundle.affineTensorField_ordered_chart_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For any commutative R-algebra S, S-linear equivalences e:S⊗_R(E⊗_R F)≃G and q:S⊗_R Q≃P, and positive bounds N,M on θ,ψ, the actual chart field transported by e,q has zero ordered iterate N+M−1.

**TwistedHiggsBundle.affineTensorField_ordered_principalCover_of_projective**. Let R be any commutative ring, E,F,Q be R-modules and θ:E→E⊗_R Q, ψ:F→F⊗_R Q be actual R-linear fields. Use the inherited ordered iterate I_n, with ordered tensor-power coefficient target and the prescribed tensor field T=θ⊗1+1⊗ψ. Let s⊆R satisfy span(s)=R, and for each r∈s let A_r be an actual localization away from r. Assume A_r⊗_R Q is finitely generated projective and that the scalar-extended fields have positive fixed zero degrees N,M on every r. Then I_{N+M−1}(T)=0 over R. Q need not have a global basis, and its global projectivity is not a premise.

**TwistedHiggsBundle.affineTensorField.test_split_basis_bound**. A specified coefficient retract of a finite-basis P transfers the two order2 bounds to order3, without a basis of Q.

**TwistedHiggsBundle.affineTensorField.test_projective_bound**. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. Two order2 bounds imply order3 for T.

**TwistedHiggsBundle.affineTensorField.test_projective_zero_fields**. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. For θ=ψ=0 the tensor field has zero order1 iterate.

**TwistedHiggsBundle.affineTensorField.test_projective_larger_bound**. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. Two order2 bounds imply the specified larger order5 bound.

**TwistedHiggsBundle.affineTensorField.test_projective_positive_nilpotence**. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. Two positive ordered nilpotence witnesses give a positive tensor witness.

**TwistedHiggsBundle.affineTensorField.test_projective_nonflat_baseChange**. Over ℤ with finite-projective Q, two order2 bounds remain order3 after scalar extension to ZMod2, a nonflat scalar extension.

**TwistedHiggsBundle.affineTensorField.test_projective_chart_bound**. Assume Q is finitely generated and projective. No basis of Q and no finiteness, projectivity or flatness of E or F are required. No integrability, characteristic or reducedness assumption is used. The two order2 bounds give order3 in any actual scalar-extended module chart, with the stated coefficient and field-module equivalences.

**TwistedHiggsBundle.affineTensorField.test_projective_principal_cover**. On a principal cover spanning1, local finite-projective coefficient modules and two local order2 bounds detect the global order3 tensor-valued bound.

**TwistedHiggsBundle.affineTensorField.test_projective_nonfree_corner**. Let R=ℚ×ℚ and Q=ℚ with the first-projection action. The real maps u(x)=(x,0) and v(a,b)=a split Q off R, making it finite projective. The nonzero scalar (0,1) annihilates1. Two actual order2 field bounds still imply order3. Q is nonzero and cannot be a globally free R-module since it has a nonzero annihilator.

# Current checkpoint: mixed ordered tensor contractions

Codex — codex-a71f92, 3 October 2026. Refs #3371. This is a partial affine λ=0 continuation, not the whole HodgeStructuresPartII design or a formalisation. The reserved general ringed-site Higgs/parameter-connection contract is unchanged.

The nine new lemmas expand an arbitrary mixed contraction word integrally, preserving the order within each factor. Genuine ordered bounds on the factors kill every sufficiently long mixed dual word for arbitrary Q. A chosen finite coefficient basis then detects the actual tensor-valued iterate and gives the exact N+M−1 bound for arbitrary E,F, without integrability, reducedness, characteristic restrictions or division. Larger specified exponents and preservation after any scalar extension are consumers of the existing native monotonicity and monoidal base-change interfaces.

This does **not** claim the whole tensor-valued shuffle for arbitrary Q, a finite-projective restriction/gluing theorem, the native sheaf identification or nonzero-λ balancing. The general ringed-site tensor-nilpotence statement is retained at its original generality and remains unchecked. All149 source obligations,8 source routes,35 global typed omissions,5 supplier requests,11 gaps and6 planets remain. H.0 is partial and H.1–H.8 remain not_read.

## Mathematical convention and proof boundary

Products are native endomorphism composition, with the right factor applied first. A word records increasing position order. Binary masks choose E or F independently at every position, so repeated directions count repeatedly and carry full multiplicity. Only separate-factor actions commute. The additive sum is commutative; the products in End(E) and End(F) need not be.

Do not apply commutative Finset.prod_add or List.prod_map_ite to these endomorphism rings. The proof expands an ordered list by induction, reindexes its additive binary-mask sum by Fin.consEquiv, and groups each selected word with TensorProduct.map_mul/map_one. The generated additive versions of the read Fintype.prod_equiv, prod_prod_type and prod_bool statements supply sum reindexing, nested sums and the Bool sum; they are already-built generic library tools, not new Hodge nodes.

For a mask with r E positions and s F positions, r+s=n. If n≥N+M−1 and N,M>0, then r≥N or s≥M. Monotonicity of the actual factor iterate, followed by the all-dual ordered contraction formula, kills the selected factor word. The empty word gives the identity, never a false zero-nilpotence premise. A genuine I_0=0 premise is retained only where explicitly permitted.

## Source, library and ownership screen

Fresh primary reading covered the complete Liu–Zhu §2.1, printed/PDF pp.6–9 of [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), including Theorem2.1 and equations(2.4)–(2.5), tensor/dual explanations, twisted Higgs complex and remarks. The640639-byte PDF SHA256 is `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`. These arbitrary-ring mixed-word deductions are authored affine algebra, not the p-adic correspondence, its source nilpotence proof, an edition collation or a new source erratum.

The whole issue was read before the claim and after bot5966437276 confirmed comment5966436402. Fresh immutable WORKERS, all9 stage descriptions, the reserved survey/owner, all5 requests, reviewed Hodge L0–L3/E1/D3 rows and REV-AUDIT-02/10/22 were read. The governing protocols and two complete upstream exemplars read earlier in this continuous session remain applicable. Not all retained historical handoffs or149 source proofs were freshly reread. A bounded Mathlib PR/Zulip search produced no exact mixed-word adapter lead; it is not a blanket absence proof. Pinned native tensor maps, ordered list operations, finite tuple equivalence and filter-length identity were read with their ambient hypotheses and source hashes. Generic tensor/list/finite-sum machinery is imported, not replanned.

The key is still finite locally free native O-module sheaves on the specified differential ringed site, central dλ=0 and an actual additive λ-Leibniz map with defined exterior curvature. There is no global-frame replacement or assumption of completed sheaf operations. E1 owns actual sheaf tensor/exterior restriction, equality detection and gluing; CR.1 owns ordinary connection/exterior calculus; DD.1 owns the filtered/Rees carrier; D3 owns the common VHS; the generic Jacobi input remains the existing Coleman supplier. The pure Hodge/linear and native tensor baseline is not duplicated.

## Execution and inherited test repair

The final full suggested file is **UNCOMPILED**: available memory was10–14GiB, below the WORKERS20GiB threshold. No Lean process, library build, setup/cache/update or language server was started. All implementationStatus fields remain unchecked.

Three inherited examples had been truncated at local let bindings: integer sharpness, characteristic-two cancellation and self-powers-versus-ordered detection. Their complete assertion headers have been restored from the authenticated3090-line incoming native archive at9a34a674dc624e21c9ad7ae573abda4baeeb1808 (SHA256e2e288fd7bc2f897c023ce4766d15e19c4215a20c095c5f4f96e9eed71ebc773); their bodies remain admitted planning drafts. The incoming full native archive was itself UNCOMPILED, so recovery authenticates the statements, not a kernel receipt. Every other incoming canonical byte is retained, apart from three added individual Mathlib imports and the appended typed continuation.

The independent exact Python regression executes3940 assertions,155 binary word expansions and2729 selected-word summands over ℤ,ZMod2,ZMod4,ZMod6,ZMod7. It checks noncommuting factor order, repeated-position counts, the empty identity, integer sharpness, and distinct characteristic-two mixed directions with I₂≠0/I₃=0 although all self-contraction squares vanish. These are finite mathematical regression tests, not Lean execution or a proof of the general theorem.

## New declaration-sized proof plan

### Cross-direction separate-factor contractions

`TwistedHiggsBundle.affineTensorField_contractions_cross_commute` — `HodgeStructuresPartII:H.0/affine-tensor-cross-commute`.

For all v,w∈Q∨, Lθ(v)=aθ(v)⊗id_F commutes with Rψ(w)=id_E⊗aψ(w). There is no requirement that v=w or that contractions within either factor commute.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Regard the products as compositions of native linear maps. Both Lθ(v)Rψ(w) and Rψ(w)Lθ(v) equal TensorProduct.map(aθ(v),aψ(w)) by the two existing tensor-composition identities.
2. This equality is the separate-factor interchange used in regrouping a mixed word; it neither permutes dual directions within an E/F subsequence nor asserts integrability.

Prerequisites: `HodgeStructuresPartII:H.0/affine-contractions`, `mathlib:LinearMap.rTensor_comp_lTensor`, `mathlib:LinearMap.lTensor_comp_rTensor`.

### Ordered factorization of a selected tensor word

`TwistedHiggsBundle.affineTensorField_contractions_selected_word` — `HodgeStructuresPartII:H.0/affine-tensor-selected-word`.

For n≥0, vs:Fin n→Q∨ and c:Fin n→Bool, the ordered product choosing Lθ(vs(i)) when c(i)=true and Rψ(vs(i)) otherwise is TensorProduct.map of the ordered E and F products, inserting the identity at every unchosen position. The within-factor order is unchanged.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Induct on the ordered list of positions, not a commutative finite product. For the empty list both products are identities and TensorProduct.map_one identifies their tensor map with the identity.
2. At a true head, write Lθ(v)=map(aθ(v),1); at a false head write Rψ(v)=map(1,aψ(v)). Apply TensorProduct.map_mul to the head and inductive tail. Only the E or F head product is extended; identities erase the other head.
3. This proves the grouping directly in possibly noncommutative endomorphism rings and realizes separate-factor interchange without moving two contractions on the same factor.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-cross-commute`, `mathlib:TensorProduct.map_mul`, `mathlib:TensorProduct.map_one`, `mathlib:List.ofFn_cons`.

### Integral binary expansion of tensor contraction words

`TwistedHiggsBundle.affineTensorField_contractions_word_expansion` — `HodgeStructuresPartII:H.0/affine-tensor-word-expansion`.

For n≥0 and arbitrary vs:Fin n→Q∨, the ordered product of aT(vs(i)) equals the sum over all binary masks c:Fin n→Bool of TensorProduct.map(Pθ(c),Pψ(not c)), where Pθ/Pψ are the ordered contraction products with identities at unchosen positions. The sum has 2^n terms with their full multiplicity; no division or within-factor commutation is used.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Expand each actual tensor contraction as Lθ(v)+Rψ(v) by the inherited native tensor-contraction formula. Induct on n using ordered List products and multiplication distributing over the additive sum; no Finset.prod_add or commutative List.prod_map_ite may be applied to End(E).
2. At the head, identify masks on Fin(n+1) with Bool×(Fin n→Bool) using Fin.consEquiv. Reindex the additive sum by the generated additive versions of Fintype.prod_equiv/prod_prod_type and split its Bool sum by sum_bool. These require only commutativity of addition, which End(E⊗F) has.
3. Apply the selected-word factorization term by term. For n=0 the mask type is a singleton, so the sole summand is map(1,1)=1. Repeated directions do not collapse masks or multiplicities.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-contractions`, `HodgeStructuresPartII:H.0/affine-tensor-selected-word`, `mathlib:Fin.consEquiv`, `mathlib:List.ofFn_cons`.

### Vanishing of selected ordered contraction words

`TwistedHiggsBundle.affineOrderedIterate_selected_word_zero` — `HodgeStructuresPartII:H.0/affine-ordered-selected-word-zero`.

If I_N(θ)=0 and a binary mask selects r≥N positions in a word of length n, the ordered θ product with identities at unselected positions is zero. Count selected occurrences, not distinct dual directions. Q may be arbitrary, and N=0 is retained under its genuine I_0=0 premise.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Let l be the ascending list of selected indices, of length r. Erasing the inserted identities by ordered list induction identifies the masked product with the list product of aθ(vs(l_j)); no commuting step or sorting of dual values occurs.
2. By the existing affineOrderedIterate_mono, I_r(θ)=0. Instantiate the existing all-dual ordered-contraction formula with the r directions indexed by the list get map; List.ofFn_get recovers the original ordered selected list. Contracting the zero map gives zero.
3. At N=0 the premise already implies id_E=0; the proof does not infer nilpotence from an empty product in a nonzero module. No basis or dual-separation hypothesis is used because only the forward contraction of an actual zero iterate is required.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-iterate-mono`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-contraction`, `mathlib:List.ofFn_get`.

### Pigeonhole vanishing of each ordered tensor summand

`TwistedHiggsBundle.affineTensorField_contractions_word_summand_zero` — `HodgeStructuresPartII:H.0/affine-tensor-word-summand-zero`.

For positive N,M, n with N+M≤n+1, and actual bounds I_N(θ)=I_M(ψ)=0, each binary-mask summand TensorProduct.map(Pθ(c),Pψ(not c)) is zero for every mixed dual word of length n.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. The list of n positions partitions into true and false selections, of lengths r,s with r+s=n by List.length_eq_length_filter_add. If r<N and s<M then n≤N+M−2, contradicting N+M≤n+1. Hence r≥N or s≥M.
2. Apply selected-word zero to θ with c in the first case or ψ with the complementary mask in the second. In the ψ case Bool.not swaps precisely the chosen and identity factors while preserving their order.
3. Use the native tensor-map zero identity in the vanishing factor. There is no binomial coefficient to invert and no characteristic, integrability or basis premise.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-selected-word-zero`, `mathlib:List.length_eq_length_filter_add`, `mathlib:TensorProduct.map_zero_left`, `mathlib:TensorProduct.map_zero_right`.

### Mixed tensor contraction vanishing from ordered factor bounds

`TwistedHiggsBundle.affineTensorField_contractions_word_zero` — `HodgeStructuresPartII:H.0/affine-tensor-word-zero`.

For positive N,M and n with N+M≤n+1, I_N(θ)=I_M(ψ)=0 implies every ordered mixed dual contraction word of T(θ,ψ) of length n is zero. This holds for arbitrary Q; it does not assert that Q's dual detects the tensor-valued iterate.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Rewrite the actual contraction word by the integral binary expansion.
2. Each summand vanishes by the selected-count pigeonhole lemma. Sum the zero native linear maps.
3. Unlike uniform self-powers, this conclusion ranges over arbitrary sequences of dual directions, including distinct directions in characteristic two. Recovering I_n(T)=0 still requires an actual coefficient-separation theorem, supplied next only for a chosen finite basis.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-word-expansion`, `HodgeStructuresPartII:H.0/affine-tensor-word-summand-zero`.

### Actual ordered tensor bound with a finite coefficient basis

`TwistedHiggsBundle.affineTensorField_ordered_bound_of_basis` — `HodgeStructuresPartII:H.0/affine-tensor-ordered-basis-bound`.

For a chosen finite basis b:I→Q and positive N,M, I_N(θ)=I_M(ψ)=0 implies I_(N+M−1)(T(θ,ψ))=0 as an equality of actual native tensor-valued linear maps. E,F need no basis, finiteness or flatness, and the fields need not be integrable.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Apply the inherited finite coefficient-basis zero criterion to T at n=N+M−1; no basis of E⊗F is involved.
2. For each p:Fin n→I, feed the arbitrary mixed-word vanishing theorem the directions b.coord(p(i)). Positivity makes n+1=N+M, so its length hypothesis holds.
3. The criterion detects the whole native coefficient tensor, not merely its repeated self-contractions or a symmetric quotient. This finite-basis adapter does not weaken or close the existing arbitrary-Q/sheaf tensor-nilpotence theorem.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-word-zero`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing`.

### Larger specified ordered tensor exponents

`TwistedHiggsBundle.affineTensorField_ordered_bound_of_basis_of_le` — `HodgeStructuresPartII:H.0/affine-tensor-ordered-basis-larger`.

Under the same finite coefficient basis and positive factor bounds, every k with N+M≤k+1 satisfies I_k(T(θ,ψ))=0. The specified exponent is preserved rather than replaced by an unspecified existence assertion.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. Obtain the actual native bound at n=N+M−1 from the finite-basis theorem.
2. The natural-number inequality gives n≤k. Apply the existing all-degree monotonicity to the actual tensor field.
3. No new tensor-power carrier, larger-exponent oracle or sheaf comparison is introduced.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-ordered-basis-bound`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-mono`.

### Finite-basis ordered tensor bound after arbitrary scalar extension

`TwistedHiggsBundle.affineTensorField_ordered_bound_of_basis_baseChange` — `HodgeStructuresPartII:H.0/affine-tensor-ordered-basis-basechange`.

For every R-algebra S, a finite coefficient basis over R and positive ordered factor bounds N,M imply I_(N+M−1)(T(S⊗θ,S⊗ψ))=0 over S. No flatness, faithful-flatness or characteristic condition on S is required for this preservation direction.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules with actual R-linear fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q. No integrability or finite basis of E/F is assumed. The final ordered detection/bound lemmas explicitly require a chosen finite basis b:I→Q, [Fintype I]; earlier contraction-word lemmas do not.

aθ(v)=rid∘(id_E⊗v)∘θ; T is the inherited actual affine tensor field, and I_n is its inherited ordered iterate, with I_0 the native tensor-unit map. Multiplication is composition with the right factor acting first. Mask products retain increasing position order; c=true chooses E and c=false chooses F.

N,M are positive only where explicitly stated. The selected-factor zero lemma also permits N=0 under the genuine I_0=0 hypothesis. No self-power-to-ordered converse, general-Q dual separation, global frame, sheaf/gluing comparison or nonzero-λ algebra is assumed.

1. First prove the actual R-linear ordered tensor bound with the finite coefficient-basis adapter.
2. Import the existing arbitrary-module affineTensorField_baseChange_nilpotence theorem at this exact exponent. Its native monoidal comparison identifies the two scalar-extended fields; it is not a tensor-of-global-sections identification.
3. Keep reflection, actual cross-ring exterior/curvature comparison, finite-projective sheaf restriction and gluing at their inherited interfaces. This consumer is preservation only and does not close any supplier.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-ordered-basis-bound`, `HodgeStructuresPartII:H.0/affine-tensor-base-change-nilpotence`.

## Consumed API additions

`TwistedHiggsBundle.affineOrderedIterate_selected_word_zero` (compatibility): If I_N(θ)=0 and a binary mask selects r≥N positions in a word of length n, the ordered θ product with identities at unselected positions is zero. Count selected occurrences, not distinct dual directions. Q may be arbitrary, and N=0 is retained under its genuine I_0=0 premise.

`TwistedHiggsBundle.affineOrderedIterate.test_selected_repeated_direction` (degenerate): If I_2(θ)=0, the length-two word with both positions equal to v has zero product. Two selected occurrences count as two even though only one distinct dual direction occurs.

`TwistedHiggsBundle.affineTensorField_contractions_cross_commute` (compatibility): For all v,w∈Q∨, Lθ(v)=aθ(v)⊗id_F commutes with Rψ(w)=id_E⊗aψ(w). There is no requirement that v=w or that contractions within either factor commute.

`TwistedHiggsBundle.affineTensorField_contractions_selected_word` (compatibility): For n≥0, vs:Fin n→Q∨ and c:Fin n→Bool, the ordered product choosing Lθ(vs(i)) when c(i)=true and Rψ(vs(i)) otherwise is TensorProduct.map of the ordered E and F products, inserting the identity at every unchosen position. The within-factor order is unchanged.

`TwistedHiggsBundle.affineTensorField_contractions_word_expansion` (compatibility): For n≥0 and arbitrary vs:Fin n→Q∨, the ordered product of aT(vs(i)) equals the sum over all binary masks c:Fin n→Bool of TensorProduct.map(Pθ(c),Pψ(not c)), where Pθ/Pψ are the ordered contraction products with identities at unchosen positions. The sum has 2^n terms with their full multiplicity; no division or within-factor commutation is used.

`TwistedHiggsBundle.affineTensorField_contractions_word_summand_zero` (compatibility): For positive N,M, n with N+M≤n+1, and actual bounds I_N(θ)=I_M(ψ)=0, each binary-mask summand TensorProduct.map(Pθ(c),Pψ(not c)) is zero for every mixed dual word of length n.

`TwistedHiggsBundle.affineTensorField_contractions_word_zero` (compatibility): For positive N,M and n with N+M≤n+1, I_N(θ)=I_M(ψ)=0 implies every ordered mixed dual contraction word of T(θ,ψ) of length n is zero. This holds for arbitrary Q; it does not assert that Q's dual detects the tensor-valued iterate.

`TwistedHiggsBundle.affineTensorField_ordered_bound_of_basis` (compatibility): For a chosen finite basis b:I→Q and positive N,M, I_N(θ)=I_M(ψ)=0 implies I_(N+M−1)(T(θ,ψ))=0 as an equality of actual native tensor-valued linear maps. E,F need no basis, finiteness or flatness, and the fields need not be integrable.

`TwistedHiggsBundle.affineTensorField_ordered_bound_of_basis_of_le` (compatibility): Under the same finite coefficient basis and positive factor bounds, every k with N+M≤k+1 satisfies I_k(T(θ,ψ))=0. The specified exponent is preserved rather than replaced by an unspecified existence assertion.

`TwistedHiggsBundle.affineTensorField_ordered_bound_of_basis_baseChange` (compatibility): For every R-algebra S, a finite coefficient basis over R and positive ordered factor bounds N,M imply I_(N+M−1)(T(S⊗θ,S⊗ψ))=0 over S. No flatness, faithful-flatness or characteristic condition on S is required for this preservation direction.

`TwistedHiggsBundle.affineTensorField.test_mixed_word_empty` (degenerate): The n=0 tensor contraction word is the identity on E⊗F, not zero; the binary-mask sum has one identity summand.

`TwistedHiggsBundle.affineTensorField.test_mixed_word_two` (computation): For arbitrary v,w the length-two word is map(aθ(v)aθ(w),1)+map(aθ(v),aψ(w))+map(aθ(w),aψ(v))+map(1,aψ(v)aψ(w)). The E/F subsequences retain their order even for noncommuting directions.

`TwistedHiggsBundle.affineTensorField.test_mixed_bound_zero_factor` (compatibility): For a finite coefficient basis, M>0 and I_M(ψ)=0, I_M(T(0,ψ))=0. The bound with N=1 preserves exactly M rather than adding an unnecessary exponent.

`TwistedHiggsBundle.affineTensorField.test_mixed_empty_coefficients` (degenerate): If Q is the zero module, every θ,ψ has I_1(T(θ,ψ))=0. Degree zero still gives the tensor-unit map.

`TwistedHiggsBundle.affineTensorField.test_mixed_char_two_bound` (non-example): Over K=ZMod 2, V=K×K and J(x,y)=(y,0), let θ=J⊗(1,0) and ψ=J⊗(0,1). Each has ordered bound 2, while their actual tensor field has I_3=0 and I_2≠0. Distinct mixed directions remain nonzero although all self-contraction squares vanish.

`TwistedHiggsBundle.affineTensorField.test_mixed_integer_bound` (non-example): Over ℤ with V=ℤ×ℤ and J(x,y)=(y,0), θ=J⊗1 has I_2=0; the actual tensor field T(θ,θ) has I_3=0 and I_2≠0. The integer mixed coefficient is 2(J⊗J), so max(2,2) is not the tensor bound.

`TwistedHiggsBundle.affineTensorField.test_mixed_nonflat_baseChange` (compatibility): Over ℤ with a finite coefficient basis and I_2(θ)=I_2(ψ)=0, the tensor of the two scalar-extended fields over ZMod 2 has actual ordered bound 3. This preservation uses no flatness.

## Suggested signatures

The nine lemma and eight test signatures are in the authorized suggested Lean file. They are proposed and uncompiled; the mathematical statements and proof outlines above remain definitive.

## Next boundary

The codex-a71f92 mixed-word continuation gives the integral binary-mask expansion and arbitrary-Q vanishing of every mixed dual contraction word, then actual ordered bound N+M−1 with a chosen finite coefficient basis and arbitrary E,F, including larger exponents and arbitrary scalar-extension preservation. This is an affine plan with UNCOMPILED typed sketches, not a kernel certificate. The actual tensor-valued shuffle for arbitrary Q, finite-projective local dual/tensor restriction and E1 sheaf tensor identification/equality detection/gluing remain open. The existing general theorem is not weakened to a basis case. Nonzero-λ balancing, cross-ring exterior/curvature transport, determinant/Tate/period adapters, all 149 source obligations and H.1–H.8 remain open; preceding narrower frontier prose is checkpoint history.

## Retained earlier roadmap text

Earlier narrower status prose is checkpoint history; the current scope and execution limits above govern this continuation.

# Hodge structures (pure, mixed, and polarized), Part II

## Continuation scope and conventions

This partial checkpoint has 112 declaration nodes: 12 definitions, 24 constructions, 57 lemmas, 14 theorems and 5 comparisons. It has 147 API items, 139 required definition/construction tests and 141 total tests, 135 pinned baseline references and six H.0 planets. All nodes remain unchecked; H.0 is partial and H.1–H.8 not_read. The current full-sketch and separate native-proof receipts appear in the handoff and the final section below. The 35 inherited global signature omissions remain. No stage or reserved key is closed.

The reserved **HodgeStructuresPartII:key/higgs-parameter-connections** is now supplied as a mathematical declaration plan. It defines finite locally free coefficients on a general commutative ringed differential site with an actual additive λ-Leibniz operator, a defined exterior extension and curvature-zero equality. Its sheaf tensor, ordinary-connection and filtration prerequisites are explicit supplier requests. The twelve inherited free affine matrix nodes remain as examples and sign tests. They are not the definition of the global object.

A differential site means a ringed Grothendieck site with **specified** relative exterior forms, restrictions, wedge and d, satisfying the exterior and differential identities. This is not a theorem that every ringed site admits locally free universal differentials. The general connection carrier accepts forms that are not locally free. Finite local freeness of Ω¹ is imposed exactly for the coordinate, symmetric action, nilpotence-kernel and subbundle quotient arguments that need it. The coefficient bundle E is finite locally free, with locally constant rank; there need not be a single global frame or one fixed rank on disconnected components. Commutative coefficients admit nonreduced and positive-characteristic examples. No integral lattice, determinant, trace or stability is silently included.

The parameter is central and relatively constant, dλ=0. In a family over k[t], this means the differential is relative to the parameter base: dt=0. Inverting t is allowed only with this convention. An absolute differential with dt≠0 is a different input. All tensor products are **sheaf tensors**. Formulas on elementary tensors are local formulas checked after a cover and glued; there is no identification of global sections of a tensor sheaf with tensor products of global sections.

For E-valued forms the convention is E followed by forms. The extension is D_n(e⊗ω)=D(e)∧ω+λe⊗dω. Its right graded Leibniz rule has a sign (−1)^n in the term λu∧dω when u has degree n. Curvature is D_1∘D:E→E⊗Ω². Ordered Higgs iterates use Q^⊗N, not ∧^NQ. Thus exterior integrability and finite tensor nilpotence are distinct properties even on a line.

## Ownership and reviewed baseline

The parent tauceti:TauCetiRoadmap/HodgeStructures owns the existing fibrewise pure, mixed and polarized structures and period-domain points. Its HodgeStructures and the nearby ReductiveGroups upstream documents were read completely for scope and density. None of their linear algebra is replanned here. The initial checkpoint's statement that the reviewed coverage had no parent Hodge entries was a lookup error. At continuation tree dc0c470bcc064a08d8d9161ea963afe12b2c4b8d, **AUDIT-02** marks L0, L1 and L3 built, and L2 partly built: its mixed-Hodge abelian-category object packaging is incomplete, while its main filtration/strictness/bigrading results are recorded as built. These verdicts are imported; no new claim of implementation is made on a roadmap-name search.

**AUDIT-10** marks ShimuraData:D3's common variation interface not built. D3 remains the sole owner of the local-system, holomorphic filtered-bundle, fibrewise opposedness and Griffiths-transversality variation datum. This continuation defines the algebra of a filtered connection, which alone is not a variation. It does not infer that a complex variation has an integral lattice.

**AUDIT-22** marks EnhancedDerivedSheaves:E1 partly built. Module sheaves already exist as Mathlib SheafOfModules; locally free sheaves already have SheafOfModules.IsLocallyFree. PresheafOfModules.Monoidal.tensorObj supplies the objectwise presheaf tensor and its restrictions. E1 is requested only for the missing sheaf tensor/coherence, finite dual/evaluation, tensor exactness with locally free coefficients, pullback and descent. A request to construct the native module-sheaf carrier again would duplicate the baseline. IsLocallyFree alone does not assert finite rank: finite local generator types must be an explicit extra premise.

CrystallineCohomology:CR.1 owns the ordinary integrable relative connection carrier and its convention of extended differentials. It supplies the λ=1 comparison; quasi-nilpotence, smooth-lift and nilpotent-base hypotheses belong to its crystal comparison. Arbitrary flat connections are not identified with crystals. DerivedDeRhamCohomology:DD.1 owns the generic filtered/Rees carrier and the associated quotient/fiber coherences; this successor constructs the particular t∇ operator. Finite split Rees modules need no derived-completion premise. AdicSpacesPartII:R0 supplies analytic differentials for p-adic specialization; its full analytic constructions are not duplicated by a formal choice of Ω.

The canonical pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both trees were searched thoroughly for Higgs, λ-connection, LambdaConnection and ParameterConnection. The Mathlib Higgs hits concern matroids, while neither tree gives this general parameter category. Positive citations were checked by reading actual Lean statements. The original fifteen references comprised the nine retained affine prerequisites and SheafOfModules, IsLocallyFree, presheaf tensorObj, KaehlerDifferential.D, TensorProduct.liftAddHom and liftAddHom_tmul. In particular, the additive balanced tensor lift exists already and is reused: an ordinary O-linear tensor lift cannot descend D by falsely assuming D is O-linear.

Near misses were inspected directly. Mathlib CovariantDerivative is for smooth manifold bundles, with differentiability hypotheses in its local Leibniz law. It does not supply the ringed-site λ carrier. TauCeti.AlgebraicGeometry.InvertibleSheaf is the native full subcategory of scheme module sheaves satisfying the invertible predicate; its file expressly leaves tensor/Picard completion to subsequent files. Presheaf relative differentials are available, but first differentials are not an automatic complete exterior calculus with sheaf tensor and descent. These objects receive no replacement nodes.

## Fresh source receipts and proof boundaries

The following source receipts belong to the inherited checkpoints; this worker does not claim to have repeated those wider readings. On 2 October 2026 the three inherited PDFs were retrieved again from their public URLs and matched the original hashes. The continuation directly read these passages:

- [Esnault–Groechenig, published Acta PDF](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), printed pp.108,131–132: Higgs and flat definitions, λ-Leibniz/integrability, and the explicit Griffiths associated-graded formula. SHA-256 0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab.
- [Liu–Zhu, arXiv v3](https://arxiv.org/pdf/1602.06282v3), PDF pp.5,7,20–22,24: nilpotence scope, Theorem 2.1 tensor/dual/pullback statements, period-ring bundle and filtered-bundle definitions, Definition 3.6 and Remark 3.2. SHA-256 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79.
- [Heuer, published Inventiones PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), printed pp.262,267,297: the explicit Ω¹(−1) coefficient, setup and degree-one contraction into the symmetric-algebra action. SHA-256 7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd.
- [Stacks tag 07J5](https://stacks.math.columbia.edu/tag/07J5), the opening connection/extension definition and full crystal-to-connection lemma proof. This motivates the additive ordinary extension convention; its crystal theorem is imported from CR.1, not replanned here. Tags [0FKF](https://stacks.math.columbia.edu/tag/0FKF) and [07HX](https://stacks.math.columbia.edu/tag/07HX) were read for the stated ring/scheme exterior-calculus convention; no universal locally free forms theorem is inferred.

Reading these definitions is not a reading of the complete nonabelian or p-adic correspondence proofs. All eight binding accepted route briefs were reread at the continuation tree, and all 149 assigned ids are retained unchanged. Only the stated H.0 algebra is decomposed here. The EG paragraph's inherited E10 misprint subset is recorded with the precise correction from integrality to integrability and X to Z for its forms. It is not a new discovery or a corrected theorem. No new source error is asserted. The assumption dλ=0 is a relative input convention, not an alleged erratum to the paper's moduli family.

## H.0: intrinsic Higgs and parameter algebra

The new declaration names use TauCeti.Hodge.ParameterConnection. The reserved carrier depends on the unbundled preconnection and its exterior curvature, so its integrability proof is an equality about an already defined map. Tensor and dual curvature lemmas use their unbundled formulas, avoiding a circular dependency on already-flat constructed bundles. The following statements, proof outlines, APIs and tests are identical to the packet. The general hypotheses at the start of each item are material, not implied by a local matrix presentation.

### I.1. Preconnection: Intrinsic parameter preconnections

**Node:** HodgeStructuresPartII:H.0/intrinsic-preconnection.

A Preconnection(E,λ) is an additive map of sheaves D:E→E⊗_OΩ¹ satisfying D(ae)=aD(e)+λ(e⊗da) on every object after local restriction. It is not O-linear unless its Leibniz correction vanishes. Integrability is a separate predicate; neither a lattice nor trace-zero nor nilpotence is part of this carrier.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the native module-sheaf carrier and imported sheaf tensor. Define D as a morphism of underlying abelian sheaves.
2. Impose the displayed local Leibniz equality, compatible with all restrictions. This automatically gives linearity over the relatively constant base.
3. Equality of D as an additive sheaf map gives equality of preconnections; construction requires actual data and the equality, not a supplied unnamed proposition.

API:

- **Preconnection.mk** (constructor): An additive sheaf map and its λ-Leibniz proof give a preconnection.
- **Preconnection.leibniz** (projection): D(ae)=aD(e)+λ(e⊗da).
- **Preconnection.ext** (extensionality): Equal section maps on all site objects imply equality.
- **Preconnection.base_linear** (compatibility): D(be)=bD(e) whenever db=0.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **Preconnection.test_affine_line** (computation): On A¹_k, λd on O sends x to λdx.
- **Preconnection.test_zero_parameter** (degenerate): At λ=0 the correction is zero and D is O-linear.
- **Preconnection.test_not_O_linear** (non-example): Over Q[x], d(x·1)=dx while x d(1)=0, so the unit ordinary connection is not O-linear.

Acceptance:

- A Preconnection(E,λ) is an additive map of sheaves D:E→E⊗_OΩ¹ satisfying D(ae)=aD(e)+λ(e⊗da) on every object after local restriction. It is not O-linear unless its Leibniz correction vanishes. Integrability is a separate predicate; neither a lattice nor trace-zero nor nilpotence is part of this carrier.

Prerequisites: mathlib:SheafOfModules; EnhancedDerivedSheaves:E1; CrystallineCohomology:CR.1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.2. Preconnection.extension_balanced: Balancing the exterior extension

**Node:** HodgeStructuresPartII:H.0/extension-balancing.

For n≥0, B_n(e,ω)=D(e)∧ω+λe⊗dω is biadditive and O-balanced: B_n(ae,ω)=B_n(e,aω). In degree zero use E⊗O≅E. No O-linearity of B_n in an individual argument is assumed.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand B_n(ae,ω) using the λ-Leibniz rule.
2. Expand d(aω)=da∧ω+a dω; the two derivative terms coincide, and bilinearity moves a between factors.
3. Both expressions are aD(e)∧ω+λe⊗da∧ω+λae⊗dω. Additivity is inherited from D,d and wedge.

Acceptance:

- For n≥0, B_n(e,ω)=D(e)∧ω+λe⊗dω is biadditive and O-balanced: B_n(ae,ω)=B_n(e,aω). In degree zero use E⊗O≅E. No O-linearity of B_n in an individual argument is assumed.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; EnhancedDerivedSheaves:E1; mathlib:TensorProduct.liftAddHom.

Source: StacksConnection, tag 07J5, opening connection/extended differential paragraph; Only the ordinary connection equation and extension formula are imported as motivation. The λ-version and all parameter transport statements are explicit deductions; crystals are not identified with arbitrary flat objects.

### I.3. Preconnection.extend: Extended parameter differential

**Node:** HodgeStructuresPartII:H.0/exterior-extension.

Construct additive sheaf maps D_n:E⊗Ωⁿ→E⊗Ωⁿ⁺¹ by D_n(e⊗ω)=D(e)∧ω+λe⊗dω. D_0 is D via E⊗O≅E; uniqueness follows from local elementary tensors. For u of degree n, D(u∧ω)=D(u)∧ω+(−1)^n λu∧dω.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Descend the balanced biadditive expression using TensorProduct.liftAddHom locally.
2. Restriction compatibility follows on elementary tensors and then by additive generation. Sheafify the local tensor construction and use E1 descent.
3. Apply the graded Leibniz identity for d to establish the displayed rule and the degree-zero identification.

API:

- **Preconnection.extend_tmul** (projection): D_n(e⊗ω)=D(e)∧ω+λe⊗dω.
- **Preconnection.extend_zero** (compatibility): D_0 identifies with D.
- **Preconnection.extend_unique** (universal-property): The elementary tensor formula uniquely specifies the additive extension.
- **Preconnection.extend_wedge** (compatibility): The right graded Leibniz rule has sign (−1)^n on λu∧dω.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **Preconnection.test_extend_line** (computation): For D=d on Q[x,y], D_1(1⊗xdy)=1⊗dx∧dy.
- **Preconnection.test_extend_zero** (degenerate): A zero-parameter zero field extends by zero in every degree.
- **Preconnection.test_extend_sign** (non-example): For unit λd on Q[x,y,z], D(dx∧y dz)=−λdx∧dy∧dz. The opposite odd-degree sign gives a wrong nonzero answer.
- **Preconnection.test_extend_balancing** (compatibility): D_n(ae⊗ω)=D_n(e⊗aω); using an R-linear tensor lift separately on D would fail when λda≠0.

Acceptance:

- Construct additive sheaf maps D_n:E⊗Ωⁿ→E⊗Ωⁿ⁺¹ by D_n(e⊗ω)=D(e)∧ω+λe⊗dω. D_0 is D via E⊗O≅E; uniqueness follows from local elementary tensors. For u of degree n, D(u∧ω)=D(u)∧ω+(−1)^n λu∧dω.

Prerequisites: HodgeStructuresPartII:H.0/extension-balancing; EnhancedDerivedSheaves:E1; mathlib:TensorProduct.liftAddHom; mathlib:TensorProduct.liftAddHom_tmul.

Source: StacksConnection, tag 07J5, opening connection/extended differential paragraph; Only the ordinary connection equation and extension formula are imported as motivation. The λ-version and all parameter transport statements are explicit deductions; crystals are not identified with arbitrary flat objects.

### I.4. Preconnection.curvature: Intrinsic exterior curvature

**Node:** HodgeStructuresPartII:H.0/intrinsic-curvature.

Curvature is the additive sheaf map κ_D=D_1∘D:E→E⊗Ω². IsIntegrable(D) means κ_D=0. D² here means this extended composite, not an ill-typed composition of E→E⊗Ω¹ with itself.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Compose the exterior extension in degree one with the original section map.
2. Define vanishing as equality of additive sheaf maps; verify it can be checked on every local section.

API:

- **Preconnection.curvature_apply** (projection): κ_D(e)=D_1(D(e)).
- **Preconnection.integrable_iff** (characterisation): Integrability iff κ_D(e)=0 on all local sections.
- **Preconnection.curvature_restrict** (compatibility): Restriction commutes with κ_D.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **Preconnection.test_curvature_unit** (computation): On O, D=λd has κ=λ²d²=0 when dλ=0.
- **Preconnection.test_curvature_zero** (degenerate): The zero Higgs field has zero curvature.
- **Preconnection.test_curvature_A2** (non-example): On A²_Q, θ=E12dx+E21dy has κ=diag(1,−1)dx∧dy≠0.

Acceptance:

- Curvature is the additive sheaf map κ_D=D_1∘D:E→E⊗Ω². IsIntegrable(D) means κ_D=0. D² here means this extended composite, not an ill-typed composition of E→E⊗Ω¹ with itself.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/exterior-extension.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.5. Preconnection.curvature_linear: Curvature is O-linear

**Node:** HodgeStructuresPartII:H.0/curvature-linearity.

For relatively constant λ, κ_D(ae)=aκ_D(e). If dλ is not assumed zero the extra term is e⊗λdλ∧da. Thus κ_D is canonically an O-linear sheaf morphism under the standing hypotheses.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand D_1(aD(e)) with its scalar rule.
2. Expand D_1(λe⊗da). The mixed terms λD(e)∧da and its reversed wedge cancel; d²a=0.
3. The remaining scalar defect is λe⊗dλ∧da, which vanishes by relative constancy.

Acceptance:

- For relatively constant λ, κ_D(ae)=aκ_D(e). If dλ is not assumed zero the extra term is e⊗λdλ∧da. Thus κ_D is canonically an O-linear sheaf morphism under the standing hypotheses.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-curvature; HodgeStructuresPartII:H.0/exterior-extension.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.6. Preconnection.extend_sq: Flatness in every exterior degree

**Node:** HodgeStructuresPartII:H.0/flat-extension-square.

For dλ=0, D_{n+1}D_n(e⊗ω)=κ_D(e)∧ω for every n. Hence κ_D=0 iff all adjacent extended differentials compose to zero.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Apply the extension formula twice. The D(e)∧dω terms cancel with the degree-one sign.
2. Use d²ω=0 and dλ=0; retain exactly D_1D(e)∧ω.
3. Local elementary tensors generate the sheaf tensor, and n=0 gives the converse.

Acceptance:

- For dλ=0, D_{n+1}D_n(e⊗ω)=κ_D(e)∧ω for every n. Hence κ_D=0 iff all adjacent extended differentials compose to zero.

Prerequisites: HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/intrinsic-curvature.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.7. LambdaBundle: Integrable parameter bundles

**Node:** HodgeStructuresPartII:key/higgs-parameter-connections.

LambdaBundle(Ω,λ) consists of a finite locally free O-module sheaf E and a Preconnection(E,λ) with κ_D=0. The parameter is a central relatively constant global section. This is the reserved general ringed-site definition: at λ=0 it gives integrable Higgs bundles and at λ=1 the imported ordinary connection carrier. Tensor, dual, pullback, coefficient twists and Griffiths grading are provided by the declaration nodes below; they are not axioms stored as arbitrary properties of an object.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Take E in the native sheaf category with a finite local trivializing cover. Require finite local bases, not a single global rank or a global basis.
2. Bundle actual additive D with its Leibniz proof and its defined curvature equality.
3. Use the extension-square theorem to give a genuine complex. λ=1 comparisons use the CR.1 carrier; general Higgs structure is the zero fiber of the same definition.

API:

- **LambdaBundle.mk** (constructor): Bundle E,D, finite local freeness, and the actual curvature-zero equality.
- **LambdaBundle.connection** (projection): Recover D with its λ-Leibniz rule.
- **LambdaBundle.integrable** (projection): The defined exterior curvature is zero.
- **LambdaBundle.ext** (extensionality): For the same underlying E, equal additive D gives equal bundle structures.
- **LambdaBundle.restrict** (functoriality): Restriction to a slice/open subsite retains the same parameter and integrability.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.test_affine_unit** (computation): On A¹_k, (O,d) is a nonzero rank-one flat connection; at λ=0 θ=dx gives an integrable rank-one Higgs object.
- **LambdaBundle.test_parameter_unit** (compatibility): D=λd for constant λ is flat, with λ=1 giving d and λ=0 giving the zero Higgs field.
- **LambdaBundle.test_noncommuting** (non-example): On A²_Q, E12dx+E21dy does not define a LambdaBundle at λ=0.
- **LambdaBundle.test_zero_module** (degenerate): The zero sheaf with its unique operator is admitted, with local rank zero.

Acceptance:

- LambdaBundle(Ω,λ) consists of a finite locally free O-module sheaf E and a Preconnection(E,λ) with κ_D=0. The parameter is a central relatively constant global section. This is the reserved general ringed-site definition: at λ=0 it gives integrable Higgs bundles and at λ=1 the imported ordinary connection carrier. Tensor, dual, pullback, coefficient twists and Griffiths grading are provided by the declaration nodes below; they are not axioms stored as arbitrary properties of an object.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/intrinsic-curvature; HodgeStructuresPartII:H.0/flat-extension-square; mathlib:SheafOfModules.IsLocallyFree; EnhancedDerivedSheaves:E1; CrystallineCohomology:CR.1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.8. LambdaBundle.Hom: Horizontal parameter morphisms

**Node:** HodgeStructuresPartII:H.0/connection-morphism.

A morphism between LambdaBundles with the same Ω,λ is an O-linear sheaf map f:E→F satisfying D_F f=(f⊗id)D_E. Identity and composition obey the equality; no determinant or polarization preservation is required.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use native module-sheaf morphisms and tensor functoriality.
2. Compose the horizontal equalities to prove closure under composition. Addition and zero follow from additivity.

API:

- **LambdaBundle.Hom.id** (constructor): Identity is horizontal.
- **LambdaBundle.Hom.comp** (functoriality): Horizontal morphisms compose.
- **LambdaBundle.Hom.add** (structure): Sum of two horizontal O-linear morphisms is horizontal.
- **LambdaBundle.Hom.ext** (extensionality): Equality of the underlying O-linear sheaf maps gives equality of morphisms.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.Hom.test_identity** (compatibility): Identity on the affine unit is horizontal.
- **LambdaBundle.Hom.test_zero** (degenerate): The zero O-linear map is horizontal.
- **LambdaBundle.Hom.test_nonconstant** (non-example): Multiplication by x on (O,d) over Q[x] is not horizontal: d(x)≠0.

Acceptance:

- A morphism between LambdaBundles with the same Ω,λ is an O-linear sheaf map f:E→F satisfying D_F f=(f⊗id)D_E. Identity and composition obey the equality; no determinant or polarization preservation is required.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.9. LambdaBundle.unit: Unit parameter connection

**Node:** HodgeStructuresPartII:H.0/unit-connection.

On O construct D(a)=λda, using O⊗Ω¹≅Ω¹. It is integrable for dλ=0 and is the tensor unit of the fixed-parameter category.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Derivation Leibniz proves the λ-rule.
2. Compute D_1D(a)=λdλ∧da+λ²d²a=0.
3. The unit isomorphisms are horizontal by the tensor formula proved below.

API:

- **LambdaBundle.unit_apply** (projection): The unit operator on a is λda.
- **LambdaBundle.unit_flat** (compatibility): Its defined curvature is zero.
- **LambdaBundle.unit_zero_parameter** (simp): The zero fiber is the zero Higgs field.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.unit.test_x** (computation): On Q[x], with λ=2, D(x)=2dx.
- **LambdaBundle.unit.test_zero** (degenerate): For λ=0 all sections have zero operator.
- **LambdaBundle.unit.test_not_zero** (non-example): At λ=1 the unit operator is not zero because D(x)=dx≠0.

Acceptance:

- On O construct D(a)=λda, using O⊗Ω¹≅Ω¹. It is integrable for dλ=0 and is the tensor unit of the fixed-parameter category.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/curvature-linearity; EnhancedDerivedSheaves:E1; mathlib:KaehlerDifferential.D.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.10. LambdaBundle.zeroEquivHiggs: Higgs zero fiber

**Node:** HodgeStructuresPartII:H.0/zero-fiber.

At λ=0, preconnections are exactly O-linear fields θ:E→E⊗Ω¹, and κ_D=(id⊗wedge)(θ⊗id)θ. Thus LambdaBundle(Ω,0) is equivalent to the integrable Higgs category, including its horizontal morphisms, without any nilpotence or trace-zero condition.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. The zero-parameter Leibniz rule is exactly O-linearity.
2. In the extension formula the dω term vanishes; the remaining composite is θ∧θ.
3. The two constructions leave the underlying E and map unchanged and are inverse on morphisms.

Acceptance:

- At λ=0, preconnections are exactly O-linear fields θ:E→E⊗Ω¹, and κ_D=(id⊗wedge)(θ⊗id)θ. Thus LambdaBundle(Ω,0) is equivalent to the integrable Higgs category, including its horizontal morphisms, without any nilpotence or trace-zero condition.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/connection-morphism; HodgeStructuresPartII:H.0/exterior-extension.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.11. LambdaBundle.oneEquivConnection: Ordinary connection fiber

**Node:** HodgeStructuresPartII:H.0/ordinary-fiber.

The λ=1 category identifies with CR.1 ordinary integrable relative connections on the same ringed differential site, by preserving E,D,restriction and the exterior curvature convention. This does not identify it with crystals; their quasi-nilpotence and lift hypotheses remain separate.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Specialize the Leibniz and exterior-extension equations to λ=1.
2. Use the requested CR.1 carrier equivalence, explicitly requiring these input/output equations.
3. Identity on section maps is inverse to the supplier-to-parameter construction.

Acceptance:

- The λ=1 category identifies with CR.1 ordinary integrable relative connections on the same ringed differential site, by preserving E,D,restriction and the exterior curvature convention. This does not identify it with crystals; their quasi-nilpotence and lift hypotheses remain separate.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/connection-morphism; CrystallineCohomology:CR.1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.12. LambdaBundle.tensor_balanced: Balancing the tensor connection

**Node:** HodgeStructuresPartII:H.0/tensor-balancing.

For two λ-preconnections on E,F, B(e,f)=D_E(e)⊗f+e⊗D_F(f), with forms moved to the last factor, satisfies B(ae,f)=B(e,af). Its scalar rule is B(ae,f)=aB(e,f)+λ(e⊗f)⊗da. A differing pair of parameters need not descend.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand the left expression with D_E Leibniz and the right with D_F Leibniz.
2. The identical derivative term λe⊗f⊗da cancels in the comparison; all remaining terms are scalar-balanced.
3. Additivity in each argument gives an additive tensor lift, not an O-bilinear lift of each separate summand.

Acceptance:

- For two λ-preconnections on E,F, B(e,f)=D_E(e)⊗f+e⊗D_F(f), with forms moved to the last factor, satisfies B(ae,f)=B(e,af). Its scalar rule is B(ae,f)=aB(e,f)+λ(e⊗f)⊗da. A differing pair of parameters need not descend.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; EnhancedDerivedSheaves:E1; mathlib:TensorProduct.liftAddHom.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.13. LambdaBundle.tensor: Tensor parameter bundles

**Node:** HodgeStructuresPartII:H.0/intrinsic-tensor.

Construct the connection D_{E⊗F}(e⊗f)=D_E(e)⊗f+e⊗D_F(f) on the sheaf tensor for the same λ. It satisfies the λ-Leibniz rule with one coefficient λ. Tensor associators, symmetry and unitors are horizontal.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the balancing lemma and the additive tensor universal property.
2. Glue through the imported sheaf tensor and verify the λ-rule on elementary tensors.
3. Three-factor expansions agree and the symmetric swap is compatible; integrability follows from the tensor-curvature lemma.

API:

- **LambdaBundle.tensor_tmul** (projection): D(e⊗f)=D_E(e)⊗f+e⊗D_F(f).
- **LambdaBundle.tensor_leibniz** (compatibility): D(a(e⊗f))=aD(e⊗f)+λ(e⊗f)⊗da.
- **LambdaBundle.tensor_assoc** (compatibility): The native sheaf-tensor associator is horizontal.
- **LambdaBundle.tensor_comm** (compatibility): The native symmetry is horizontal.
- **LambdaBundle.tensor_unit** (compatibility): Tensoring with unit(λ) is horizontally isomorphic to the input.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.tensor.test_unit** (compatibility): unit(λ)⊗unit(λ) identifies with unit(λ).
- **LambdaBundle.tensor.test_zero** (degenerate): Tensor with the zero module is zero.
- **LambdaBundle.tensor.test_one_lambda** (non-example): Over Q[x], tensoring two λ=2 unit lines sends x under the unit identification to 2dx, not 4dx.

Acceptance:

- Construct the connection D_{E⊗F}(e⊗f)=D_E(e)⊗f+e⊗D_F(f) on the sheaf tensor for the same λ. It satisfies the λ-Leibniz rule with one coefficient λ. Tensor associators, symmetry and unitors are horizontal.

Prerequisites: HodgeStructuresPartII:H.0/tensor-balancing; HodgeStructuresPartII:H.0/tensor-curvature; HodgeStructuresPartII:H.0/unit-connection; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.14. Preconnection.tensor_curvature: Tensor curvature formula

**Node:** HodgeStructuresPartII:H.0/tensor-curvature.

For the balanced tensor preconnection, κ_{E⊗F}(e⊗f)=κ_E(e)⊗f+e⊗κ_F(f), with Ω² moved to the last factor. In particular flat inputs yield flat output; no converse is claimed.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the balanced tensor preconnection before bundling flatness, so there is no dependency on the flat tensor object.
2. Apply the extended differential twice on elementary tensors. Mixed terms occur in opposite exterior orders and cancel.
3. The two remaining squares are exactly the input curvatures; extend by locality and additive generation.

Acceptance:

- For the balanced tensor preconnection, κ_{E⊗F}(e⊗f)=κ_E(e)⊗f+e⊗κ_F(f), with Ω² moved to the last factor. In particular flat inputs yield flat output; no converse is claimed.

Prerequisites: HodgeStructuresPartII:H.0/tensor-balancing; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/intrinsic-curvature; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.15. LambdaBundle.dual: Dual parameter bundles

**Node:** HodgeStructuresPartII:H.0/intrinsic-dual.

On E∨=Hom_O(E,O), define D∨φ by (D∨φ)(e)=λd(φ(e))−(φ⊗id)D(e). Finite local freeness identifies E∨⊗Ω¹ with Hom(E,Ω¹). Evaluation is horizontal; the construction has the same λ and is intrinsic.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand on ae: the terms λφ(e)da cancel, showing that the displayed expression is O-linear in e.
2. Use the finite locally free evaluation isomorphism supplied by E1 to obtain a unique section in E∨⊗Ω¹.
3. The expression satisfies the λ-Leibniz rule in φ and glues; dual-curvature proves flatness.

API:

- **LambdaBundle.dual_eval** (projection): (D∨φ)(e)=λd(φ(e))−φ(D(e)).
- **LambdaBundle.eval_horizontal** (compatibility): Evaluation E∨⊗E→unit(λ) is horizontal.
- **LambdaBundle.biddual** (equivalence): The canonical E→E∨∨ is horizontal and an isomorphism.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.dual.test_unit** (compatibility): The dual of unit(λ) is unit(λ).
- **LambdaBundle.dual.test_zero** (degenerate): The dual zero module is zero.
- **LambdaBundle.dual.test_sign** (non-example): For θ=a dx on a Higgs line its dual is −a dx; using +a violates the evaluation equation.

Acceptance:

- On E∨=Hom_O(E,O), define D∨φ by (D∨φ)(e)=λd(φ(e))−(φ⊗id)D(e). Finite local freeness identifies E∨⊗Ω¹ with Hom(E,Ω¹). Evaluation is horizontal; the construction has the same λ and is intrinsic.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/dual-curvature; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.16. Preconnection.dual_curvature: Dual curvature sign

**Node:** HodgeStructuresPartII:H.0/dual-curvature.

The dual preconnection defined by the evaluation formula satisfies (κ_{E∨}φ)(e)=−φ(κ_E(e)). Hence flatness is preserved and reflected through finite locally free biduality.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Construct the unbundled dual from the formula, using finite local freeness.
2. Differentiate the evaluation relation a second time. Opposite-degree mixed terms cancel and d²φ(e)=0.
3. The result is the negative dual of κ_E; finite locally free evaluation detects zero.

Acceptance:

- The dual preconnection defined by the evaluation formula satisfies (κ_{E∨}φ)(e)=−φ(κ_E(e)). Hence flatness is preserved and reflected through finite locally free biduality.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/intrinsic-curvature; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.17. LambdaBundle.pullback: Pullback of parameter bundles

**Node:** HodgeStructuresPartII:H.0/intrinsic-pullback.

For a morphism of ringed differential sites f:Y→X with a morphism of exterior calculi f*Ω_X→Ω_Y commuting with wedge and d, set λ_Y=f#λ and construct D_Y(b⊗e)=λ_Y e⊗d_Yb+b·df(D_Xe) on f*E. It is integrable, functorial in f, and compatible with tensor and dual. No flatness of f is required for finite locally free E.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Check scalar balancing against f#(a): d_Yf#(a)=df(d_Xa) supplies exactly the needed correction.
2. Apply local finite free presentations; the sheaf pullback supplier glues and gives independence.
3. Compute curvature on 1⊗e as the image of κ_X(e), then use its O_Y-linearity. Composition follows on generators; tensor/dual follow from their defining equations.

API:

- **LambdaBundle.pullback_apply** (projection): D_Y(b⊗e)=λ_Y e⊗d_Yb+b df(D_Xe).
- **LambdaBundle.pullback_id** (compatibility): Identity pullback gives the original object.
- **LambdaBundle.pullback_comp** (functoriality): Composed pullbacks agree via the canonical sheaf-pullback isomorphism.
- **LambdaBundle.pullback_tensor** (compatibility): Pullback commutes horizontally with same-parameter tensor.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.pullback.test_identity** (compatibility): Pullback along id leaves (O,d) unchanged.
- **LambdaBundle.pullback.test_constant** (degenerate): Along x↦0, the Higgs line dx pulls back to zero.
- **LambdaBundle.pullback.test_ramified** (computation): Along x=y² over Q, a Higgs field dx pulls back to 2y dy; replacing df by an identity would fail.

Acceptance:

- For a morphism of ringed differential sites f:Y→X with a morphism of exterior calculi f*Ω_X→Ω_Y commuting with wedge and d, set λ_Y=f#λ and construct D_Y(b⊗e)=λ_Y e⊗d_Yb+b·df(D_Xe) on f*E. It is integrable, functorial in f, and compatible with tensor and dual. No flatness of f is required for finite locally free E.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/curvature-linearity; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.18. LambdaBundle.descent: Local descent of parameter operators

**Node:** HodgeStructuresPartII:H.0/local-descent.

For a site covering family, finite locally free E_i, horizontal isomorphisms g_ij and their actual cocycle, the imported module-sheaf descent produces E. The D_i glue uniquely to a λ-preconnection on E, and it is integrable iff all its local curvatures vanish. The equations are on the common restricted parameter and differential calculus.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Import descent of the underlying finite locally free module sheaves from E1.
2. The horizontal equality says the additive D_i agree after all identifications on double overlaps. Descend as maps of abelian sheaves to E⊗Ω¹.
3. Leibniz, curvature and finite local freeness are local properties. Uniqueness follows from separatedness; no global coordinates are chosen.

Acceptance:

- For a site covering family, finite locally free E_i, horizontal isomorphisms g_ij and their actual cocycle, the imported module-sheaf descent produces E. The D_i glue uniquely to a λ-preconnection on E, and it is integrable iff all its local curvatures vanish. The equations are on the common restricted parameter and differential calculus.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/connection-morphism; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.19. LambdaBundle.affineCoordinateEquiv: Comparison with the affine frame

**Node:** HodgeStructuresPartII:H.0/coordinate-comparison.

On a chart where Ω¹ has the genuine basis dx_i with commuting dual derivations δ_i, Ω² has its exterior basis, and E≅O^V, write D=λd+A. Its curvature coefficients are λδ_iA_j−λδ_jA_i+[A_i,A_j]. The same-parameter tensor, dual and s′=Gs gauge formulas agree with the twelve retained affine nodes. An arbitrary zero-direction Frame is not enough for this equivalence.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand D of each basis vector to recover A_i uniquely.
2. Use the intrinsic extension to compute curvature on basis sections, then read off exterior-basis coefficients.
3. Under a changed component column s′=Gs, apply the product rule to G⁻¹s′; the derivative correction is −λdG·G⁻¹.
4. Tensor and dual follow on basis tensors and evaluation, with Kronecker sum and minus transpose respectively.

Acceptance:

- On a chart where Ω¹ has the genuine basis dx_i with commuting dual derivations δ_i, Ω² has its exterior basis, and E≅O^V, write D=λd+A. Its curvature coefficients are λδ_iA_j−λδ_jA_i+[A_i,A_j]. The same-parameter tensor, dual and s′=Gs gauge formulas agree with the twelve retained affine nodes. An arbitrary zero-direction Frame is not enough for this equivalence.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/intrinsic-curvature; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/gauge; HodgeStructuresPartII:H.0/tensor; HodgeStructuresPartII:H.0/dual; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.20. LambdaBundle.rescale: Invertible parameter rescaling

**Node:** HodgeStructuresPartII:H.0/intrinsic-rescale.

If λ is an invertible relatively constant section, rescale by λ⁻¹D to obtain an ordinary integrable connection. Its curvature is λ⁻²κ_D. This gives an equivalence of fixed-λ and ordinary connection categories with inverse ∇↦λ∇, including tensor, dual and horizontal morphisms.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Differentiate λλ⁻¹=1 to get dλ⁻¹=0.
2. Expand the scaled Leibniz equation: the scalar derivative coefficient becomes 1.
3. The extended differential scales by λ⁻¹ in every degree, so its square scales by λ⁻². The inverse and morphisms are unchanged on E.

API:

- **LambdaBundle.rescale_apply** (projection): The new operator is λ⁻¹D.
- **LambdaBundle.rescale_curvature** (compatibility): κ_rescale=λ⁻²κ_D.
- **LambdaBundle.rescale_equiv** (equivalence): Scaling by λ and λ⁻¹ are inverse functors.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.rescale.test_two** (computation): On Q[x], 2d rescales to d.
- **LambdaBundle.rescale.test_one** (degenerate): λ=1 leaves the operator unchanged.
- **LambdaBundle.rescale.test_t** (compatibility): For relative forms over k[t], t has dt=0; after localizing at t, t∇ rescales to ∇. Absolute forms with dt≠0 do not satisfy the input convention.

Acceptance:

- If λ is an invertible relatively constant section, rescale by λ⁻¹D to obtain an ordinary integrable connection. Its curvature is λ⁻²κ_D. This gives an equivalence of fixed-λ and ordinary connection categories with inverse ∇↦λ∇, including tensor, dual and horizontal morphisms.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/ordinary-fiber.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.21. TwistedHiggsBundle: Twisted integrable Higgs bundles

**Node:** HodgeStructuresPartII:H.0/twisted-higgs.

For an invertible coefficient sheaf T, put Q=Ω¹⊗T. A TwistedHiggsBundle is finite locally free E with O-linear θ:E→E⊗Q whose exterior composite in E⊗Ω²⊗T² vanishes. The twist is in the coefficient of the field, not absorbed into E. No connection on T or differential on T is required for this zero-parameter definition.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the native module-sheaf and supplied tensor/exterior-power identifications. Define the composite by applying θ to the E factor and wedging the Ω¹ factors, with both T factors retained.
2. With T=O, compare by unitors with the zero fiber. If T changes by an isomorphism, transport θ through its coefficient tensor map.
3. Tensor and dual use the same Q and evaluation formulas with no d-term. In the p-adic instance T is O(−1), including its Galois action.

API:

- **TwistedHiggsBundle.zero** (constructor): Every finite locally free E has the zero Q-valued field.
- **TwistedHiggsBundle.coefficient** (projection): The coefficient is Ω¹⊗T and its curvature coefficient is Ω²⊗T².
- **TwistedHiggsBundle.trivialTwistEquiv** (equivalence): T=O gives the ordinary integrable Higgs category via its tensor unitors.
- **TwistedHiggsBundle.changeTwist** (functoriality): An isomorphism T≅T′ transports fields and curvature.
- **TwistedHiggsBundle.tensor** (structure): Same-twist fields tensor by θ_E⊗1+1⊗θ_F, with one Q coefficient.
- **TwistedHiggsBundle.dual** (structure): The dual field is characterized by zero-field evaluation and equals minus transpose locally.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.test_trivial** (compatibility): T=O, θ=E12dx on O² is the usual nonzero square-zero Higgs field.
- **TwistedHiggsBundle.test_zero** (degenerate): θ=0 is integrable for every invertible T.
- **TwistedHiggsBundle.test_Tate** (non-example): For the rigid p-adic instance, Ω¹(−1) and its Galois action must appear in θ; an untwisted target has the wrong character.
- **TwistedHiggsBundle.test_tensor_twist** (compatibility): Tensor of two T-valued Higgs objects remains T-valued; T² occurs in curvature, not in the degree-one tensor field.

Acceptance:

- For an invertible coefficient sheaf T, put Q=Ω¹⊗T. A TwistedHiggsBundle is finite locally free E with O-linear θ:E→E⊗Q whose exterior composite in E⊗Ω²⊗T² vanishes. The twist is in the coefficient of the field, not absorbed into E. No connection on T or differential on T is required for this zero-parameter definition.

Prerequisites: HodgeStructuresPartII:H.0/zero-fiber; EnhancedDerivedSheaves:E1.

Source: Heuer25, Definition 1.2(2) p.262; Definition 4.1 p.297; These passages specify the explicit Tate-twisted Higgs field and its symmetric-algebra action; the p-adic correspondence remains with its consumer.

### I.22. TwistedHiggsBundle.coordinate_integrability: Integrability and commuting coefficients

**Node:** HodgeStructuresPartII:H.0/higgs-commuting.

If Q is locally free with finite basis q_i, write θ=ΣA_i⊗q_i. Then θ∧θ=0 iff [A_i,A_j]=0 for all i,j, in arbitrary characteristic. This uses the exterior basis q_i∧q_j for i<j, not division by 2. An arbitrary collection of directions without a basis cannot give the converse.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
- Ω¹ has finite locally free local charts; T is invertible.

Construction or proof:

1. Expand θ twice in the specified local basis. Pair i,j and j,i coefficients using q_j∧q_i=−q_i∧q_j and q_i∧q_i=0.
2. Independence of the exterior-basis terms gives each commutator zero, including in characteristic two.
3. The basis-free equation glues across all local trivializations.

Acceptance:

- If Q is locally free with finite basis q_i, write θ=ΣA_i⊗q_i. Then θ∧θ=0 iff [A_i,A_j]=0 for all i,j, in arbitrary characteristic. This uses the exterior basis q_i∧q_j for i<j, not division by 2. An arbitrary collection of directions without a basis cannot give the converse.

Prerequisites: HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: Heuer25, Definition 1.2(2) p.262; Definition 4.1 p.297; These passages specify the explicit Tate-twisted Higgs field and its symmetric-algebra action; the p-adic correspondence remains with its consumer.

### I.23. TwistedHiggsBundle.symmetricAction: Symmetric-algebra Higgs action

**Node:** HodgeStructuresPartII:H.0/symmetric-action.

For Q finite locally free, construct the O-algebra map Sym_O(Q∨)→End_O(E) sending v to the contraction (id⊗v)θ. Integrability is equivalent to existence of this extension with the stated degree-one restriction. End(E) can be noncommutative; the images of Q∨ must commute.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use finite local dual bases to identify contraction coefficients with A_i. The commuting comparison supplies the commutation relation.
2. Apply the symmetric-algebra universal property into an associative O-algebra with commuting image; glue uniqueness.
3. Conversely a symmetric action gives commuting contractions, hence integrability by the exterior-basis comparison.

API:

- **TwistedHiggsBundle.symmetricAction_generator** (projection): The image of v∈Q∨ is contraction of θ by v.
- **TwistedHiggsBundle.symmetricAction_unique** (universal-property): The degree-one contractions uniquely determine the algebra map.
- **TwistedHiggsBundle.symmetricAction_iff** (characterisation): The given contractions extend iff θ is integrable under Q finite local freeness.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.symmetricAction.test_scalar** (computation): On A¹_Q, θ=dx gives the action Q[x][u]→End(O) with u↦1.
- **TwistedHiggsBundle.symmetricAction.test_zero** (degenerate): Zero field factors through the augmentation Sym(Q∨)→O.
- **TwistedHiggsBundle.symmetricAction.test_noncommuting** (non-example): u↦E12 and v↦E21 cannot define a map from Q[u,v] to Mat₂(Q).

Acceptance:

- For Q finite locally free, construct the O-algebra map Sym_O(Q∨)→End_O(E) sending v to the contraction (id⊗v)θ. Integrability is equivalent to existence of this extension with the stated degree-one restriction. End(E) can be noncommutative; the images of Q∨ must commute.

Prerequisites: HodgeStructuresPartII:H.0/higgs-commuting; EnhancedDerivedSheaves:E1.

Source: Heuer25, Definition 1.2(2) p.262; Definition 4.1 p.297; These passages specify the explicit Tate-twisted Higgs field and its symmetric-algebra action; the p-adic correspondence remains with its consumer.

### I.24. TwistedHiggsBundle.iterate: Ordered Higgs iterates

**Node:** HodgeStructuresPartII:H.0/ordered-iterate.

Define θ^[0]=id_E and θ^[n+1]=(θ⊗id_{Q^⊗n})θ^[n], with coherent reassociation to E⊗Q^⊗(n+1). This uses ordinary ordered tensor powers, never exterior powers. IterateNul(θ,N) means N>0 and θ^[N]=0.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Construct n-fold tensor powers from the supplied monoidal category and recurse, applying θ only on E.
2. Track associators explicitly; θ O-linearity permits tensoring.
3. Local dual-basis contractions recover every ordered word of coefficients, so vanishing can be checked by those words when Q is finite locally free.

API:

- **TwistedHiggsBundle.iterate_zero** (simp): The zeroth iterate is identity.
- **TwistedHiggsBundle.iterate_succ** (projection): The successor is θ⊗id after the preceding iterate, with the prescribed reassociation.
- **TwistedHiggsBundle.iterate_coordinates** (characterisation): In a finite local basis, θ^[N]=0 iff every word of N coefficients vanishes.
- **TwistedHiggsBundle.iterate_zero_field** (simp): The zero field has bound 1.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.iterate.test_E12** (computation): For E12dx on O², θ^[2]=0 but θ≠0.
- **TwistedHiggsBundle.iterate.test_zero** (degenerate): Zero field has bound 1, including the zero module.
- **TwistedHiggsBundle.iterate.test_scalar** (non-example): The scalar dx over Q[x] has θ^[N](1)=1⊗dx^⊗N≠0 for every positive N, although it is integrable.

Acceptance:

- Define θ^[0]=id_E and θ^[n+1]=(θ⊗id_{Q^⊗n})θ^[n], with coherent reassociation to E⊗Q^⊗(n+1). This uses ordinary ordered tensor powers, never exterior powers. IterateNul(θ,N) means N>0 and θ^[N]=0.

Prerequisites: HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.25. TwistedHiggsBundle.NilpotenceFiltration: Finite Higgs nilpotence filtrations

**Node:** HodgeStructuresPartII:H.0/nilpotence-filtration.

A length-N nilpotence filtration has N>0 and subsheaves 0=K_0⊆K_1⊆⋯⊆K_N=E with θ(K_j) lies in the image of K_{j−1}⊗Q→E⊗Q. When Q is flat this image is the indicated tensor subsheaf. Quotients and steps need not be locally free. Vanishing graded Higgs fields means this lowering equality; it is distinct from the subbundle filtration used for Griffiths associated graded.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use native module-sheaf subobjects with the supplied tensor maps and inclusions.
2. Record the length and lowering condition. No nonreduced-base restriction or unjustified subbundle requirement is imposed.
3. Changing charts transports subobjects, so the definition is global and invariant under isomorphism.

API:

- **TwistedHiggsBundle.NilpotenceFiltration.lower** (projection): θ(K_j) lies in K_{j−1}⊗Q.
- **TwistedHiggsBundle.NilpotenceFiltration.zero** (constructor): A zero field has K_0=0,K_1=E.
- **TwistedHiggsBundle.NilpotenceFiltration.transport** (functoriality): A Higgs isomorphism transports the filtration and length.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.NilpotenceFiltration.test_E12** (computation): For E12dx, K_1 is the line spanned by e₁ and K_2=O².
- **TwistedHiggsBundle.NilpotenceFiltration.test_zero** (degenerate): A zero field gives a length-one filtration.
- **TwistedHiggsBundle.NilpotenceFiltration.test_nonreduced** (non-example): Over Q[ε]/ε², θ=εdx on a line has K_1=(ε), K_2=O. K_1 is not a line subbundle; a compulsory locally free-quotient definition rejects this valid nilpotent field.

Acceptance:

- A length-N nilpotence filtration has N>0 and subsheaves 0=K_0⊆K_1⊆⋯⊆K_N=E with θ(K_j) lies in the image of K_{j−1}⊗Q→E⊗Q. When Q is flat this image is the indicated tensor subsheaf. Quotients and steps need not be locally free. Vanishing graded Higgs fields means this lowering equality; it is distinct from the subbundle filtration used for Griffiths associated graded.

Prerequisites: HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.26. TwistedHiggsBundle.nilpotence_iff_filtration: Tensor nilpotence and finite filtrations

**Node:** HodgeStructuresPartII:H.0/nilpotence-equivalence.

When Q is finite locally free, θ^[N]=0 for N>0 iff a length-N nilpotence filtration exists. No integrability is needed for this equivalence of ordered iterates and lowering filtrations. For a general coherent Q without flatness, this equivalence is not asserted.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
- Q=Ω¹⊗T is finite locally free; E finite locally free, and the tensor-exactness/kernel identification for Q is imported from E1.

Construction or proof:

1. A lowering filtration kills N successive applications on E=K_N.
2. Conversely define K_j=ker θ^[j]. Locally a finite basis of Q identifies K_j with vectors annihilated by all words of length j.
3. These kernels ascend and θ(K_j)⊆K_{j−1}⊗Q: contraction by each basis covector lands in K_{j−1}; finite locally free tensor exactness identifies the kernel after tensoring.
4. K_0=ker id=0 and θ^[N]=0 gives K_N=E; glue kernels without asserting they or their quotients are locally free.

Acceptance:

- When Q is finite locally free, θ^[N]=0 for N>0 iff a length-N nilpotence filtration exists. No integrability is needed for this equivalence of ordered iterates and lowering filtrations. For a general coherent Q without flatness, this equivalence is not asserted.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/nilpotence-filtration; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.27. TwistedHiggsBundle.tensor_nilpotence_bound: Tensor nilpotence bound

**Node:** HodgeStructuresPartII:H.0/tensor-nilpotence.

If two same-Q fields have positive ordered bounds N and M, their tensor field has bound N+M−1. The proof is valid in arbitrary characteristic and over nonreduced rings, without dividing by binomial coefficients.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand the (N+M−1)-fold iterate as a sum indexed by choosing the E or F action at every position; distributivity and tensor associators give this formula without a basis of Q.
2. Reorder actions on separate E,F factors while retaining the corresponding permutation of the ordered Q factors. Every summand factors through an E iterate of length r and an F iterate of length s with r+s=N+M−1.
3. Either r≥N or s≥M. Higher iterates factor through the specified zero iterate, so that summand vanishes. This is an integral shuffle argument: no integrability between directions, local freeness of Q or division by binomial coefficients is required.

Acceptance:

- If two same-Q fields have positive ordered bounds N and M, their tensor field has bound N+M−1. The proof is valid in arbitrary characteristic and over nonreduced rings, without dividing by binomial coefficients.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.28. TwistedHiggsBundle.dual_nilpotence_bound: Dual nilpotence bound

**Node:** HodgeStructuresPartII:H.0/dual-nilpotence.

For finite locally free E,Q, a twisted Higgs field with ordered bound N has a dual field with the same bound N. In a finite local basis, its word equals (−1)^N times the transpose of the reversed original word.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the dual evaluation definition to identify each contracted matrix with −A_iᵀ.
2. Multiplication under transpose reverses order, and all reversed words are included in the original bound.
3. Finite local evaluation detects zero and glues the bound.

Acceptance:

- For finite locally free E,Q, a twisted Higgs field with ordered bound N has a dual field with the same bound N. In a finite local basis, its word equals (−1)^N times the transpose of the reversed original word.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.29. TwistedHiggsBundle.pullback_nilpotence_bound: Pullback nilpotence bound

**Node:** HodgeStructuresPartII:H.0/pullback-nilpotence.

Pullback of a twisted field through a coefficient map f*Q→Q_Y preserves the ordered bound N. It also preserves integrability when that map induces the required exterior map. No flatness is required to preserve a zero composite; reflection or identification of pulled-back kernels is not asserted.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Tensor functoriality identifies every pulled-back iterate with the image of θ^[N].
2. A zero map remains zero under pullback and postcomposition on coefficients.
3. Use the exterior analogue for integrability; do not infer left-exactness of arbitrary pullback.

Acceptance:

- Pullback of a twisted field through a coefficient map f*Q→Q_Y preserves the ordered bound N. It also preserves integrability when that map induces the required exterior map. No flatness is required to preserve a zero composite; reflection or identification of pulled-back kernels is not asserted.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.30. TwistedHiggsBundle.nilpotent_line_eq_zero: Nilpotent fields on reduced lines

**Node:** HodgeStructuresPartII:H.0/reduced-line-nilpotence.

If O is locally reduced, E is invertible and Q is finite locally free, a positive ordered nilpotence bound forces θ=0. Reducedness is necessary: on O=Q[ε]/ε², θ=εdx is nonzero with bound 2.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Trivialize E and Q locally; write θ by scalars a_i.
2. The constant word i,…,i gives a_i^N=0. Reducedness forces every a_i=0.
3. Sheaf locality gives θ=0; the ε example disproves the assertion without reducedness.

Acceptance:

- If O is locally reduced, E is invertible and Q is finite locally free, a positive ordered nilpotence bound forces θ=0. Reducedness is necessary: on O=Q[ε]/ε², θ=εdx is nonzero with bound 2.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.31. GriffithsFiltration: Griffiths transverse filtrations

**Node:** HodgeStructuresPartII:H.0/griffiths-filtration.

For an ordinary integrable connection (E,∇), a GriffithsFiltration is a bounded decreasing Z-indexed filtration F^pE by subbundles, exhaustive for p≤a and zero for p>b, with finite locally free successive quotients and ∇F^p⊆F^{p−1}⊗Ω¹. Only this filtration-to-graded algebra is defined here; a VHS additionally has the local-system/fibrewise Hodge data supplied by D3.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
- Ω¹ is finite locally free, the parameter is 1, and F has finite locally free subquotients and local split inclusions.

Construction or proof:

1. Import the ordinary connection from CR.1 and generic filtration/subquotient machinery from DD.1, rather than inventing a second filtration carrier.
2. Require genuine inclusions with antitonicity, boundedness and local splitting of quotient sequences; not mere rank inequalities.
3. Express transversality through the actual tensor inclusion; Ω¹ local freeness ensures those inclusions are monic.

API:

- **GriffithsFiltration.transverse** (projection): ∇F^p⊆F^{p−1}⊗Ω¹ for every integer p.
- **GriffithsFiltration.shift** (functoriality): F⟨m⟩^p=F^{p+m} is again transverse with shifted bounds.
- **GriffithsFiltration.trivial** (constructor): F^p=E for p≤0 and zero for p>0 is transverse.
- **GriffithsFiltration.isVHS_input** (compatibility): A variation from D3 forgets to this datum; this datum alone does not imply opposedness or a rational local system.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **GriffithsFiltration.test_trivial** (degenerate): The one-step filtration of a flat line is transverse and has zero graded Higgs field.
- **GriffithsFiltration.test_nonzero_symbol** (computation): On Q[x], take ∇=d+E21dx and F¹=Oe₁⊂F⁰=O². The filtration is transverse and its graded symbol sends [e₁] to [e₂]dx.
- **GriffithsFiltration.test_skip_two** (non-example): Take F²=F¹=Oe₁ and F⁰=O² with ∇=d+E21dx. ∇F² is not in F¹⊗Ω¹, so this filtration is rejected.

Acceptance:

- For an ordinary integrable connection (E,∇), a GriffithsFiltration is a bounded decreasing Z-indexed filtration F^pE by subbundles, exhaustive for p≤a and zero for p>b, with finite locally free successive quotients and ∇F^p⊆F^{p−1}⊗Ω¹. Only this filtration-to-graded algebra is defined here; a VHS additionally has the local-system/fibrewise Hodge data supplied by D3.

Prerequisites: HodgeStructuresPartII:H.0/ordinary-fiber; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: EG20, Lemma 4.9 p.132, displayed associated graded and transversality; The filtration-to-Higgs algebra is isolated from the separately unproved rigid-moduli/Simpson assertions in Lemma 4.9.

### I.32. GriffithsFiltration.gradedHiggs: Associated graded Higgs field

**Node:** HodgeStructuresPartII:H.0/graded-higgs.

For G^p=F^p/F^{p+1}, define θ_p([e])=[∇e] in G^{p−1}⊗Ω¹. The direct sum G=⊕_pG^p is finite locally free and θ has degree −1. Changing a representative by F^{p+1} changes ∇e by F^p⊗Ω¹; the scalar derivative term e⊗da also lies there, so θ_p is O-linear.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use transversality to map F^p into F^{p−1}⊗Ω¹.
2. Quotient by F^p⊗Ω¹ using tensor exactness; ∇F^{p+1}⊆F^p⊗Ω¹ removes representative dependence.
3. In ∇(ae), the extra e⊗da vanishes modulo F^p⊗Ω¹.
4. Boundedness and finite locally free quotients give finite direct sum. Integrability is the separate symbol-square lemma.

API:

- **GriffithsFiltration.gradedHiggs_apply** (projection): θ_p([e])=[∇e] in G^{p−1}⊗Ω¹.
- **GriffithsFiltration.gradedHiggs_linear** (compatibility): Each degree-lowering symbol is O-linear.
- **GriffithsFiltration.gradedHiggs_shift** (compatibility): Shifting F only reindexes degrees; it does not change the underlying Higgs object.
- **GriffithsFiltration.gradedHiggs_nilpotent** (compatibility): For F exhaustive at a and zero above b, θ^[b−a+1]=0 when a≤b.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **GriffithsFiltration.gradedHiggs.test_line** (degenerate): The trivial filtration on (O,d) gives zero graded Higgs field.
- **GriffithsFiltration.gradedHiggs.test_E21** (computation): For the two-step Q[x] filtration, θ([e₁])=[e₂]dx≠0 and θ² as an ordered iterate is zero.
- **GriffithsFiltration.gradedHiggs.test_scalar** (compatibility): The class of ∇(ae) equals a[∇e]; retaining the e da term would incorrectly produce a connection instead of a Higgs field.

Acceptance:

- For G^p=F^p/F^{p+1}, define θ_p([e])=[∇e] in G^{p−1}⊗Ω¹. The direct sum G=⊕_pG^p is finite locally free and θ has degree −1. Changing a representative by F^{p+1} changes ∇e by F^p⊗Ω¹; the scalar derivative term e⊗da also lies there, so θ_p is O-linear.

Prerequisites: HodgeStructuresPartII:H.0/griffiths-filtration; HodgeStructuresPartII:H.0/graded-higgs-integrable; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: EG20, Lemma 4.9 p.132, displayed associated graded and transversality; The filtration-to-Higgs algebra is isolated from the separately unproved rigid-moduli/Simpson assertions in Lemma 4.9.

### I.33. GriffithsFiltration.gradedHiggs_integrable: Flat connection gives integrable symbol

**Node:** HodgeStructuresPartII:H.0/graded-higgs-integrable.

The degree −1 associated-graded symbol of a flat Griffiths-transverse connection has θ∧θ=0. Flatness ∇²=0 is essential. This is an exterior-square assertion; finite ordered nilpotence instead follows from filtration bounds.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Construct the unbundled quotient symbol using representative independence and O-linearity; no flat Higgs bundling is used in this step.
2. The composition maps G^p to G^{p−2}⊗Ω² and is represented by ∇_1∇e modulo F^{p−1}⊗Ω².
3. The coefficient dω term from ∇_1 lies in F^{p−1}⊗Ω² and vanishes in this quotient; the remaining symbol composite is θ∧θ.
4. The actual curvature ∇_1∇e is zero, giving the claimed equality.

Acceptance:

- The degree −1 associated-graded symbol of a flat Griffiths-transverse connection has θ∧θ=0. Flatness ∇²=0 is essential. This is an exterior-square assertion; finite ordered nilpotence instead follows from filtration bounds.

Prerequisites: HodgeStructuresPartII:H.0/griffiths-filtration; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/flat-extension-square; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: EG20, Lemma 4.9 p.132, displayed associated graded and transversality; The filtration-to-Higgs algebra is isolated from the separately unproved rigid-moduli/Simpson assertions in Lemma 4.9.

### I.34. GriffithsFiltration.reesConnection: Rees parameter connection

**Node:** HodgeStructuresPartII:H.0/rees-parameter.

On Rees_F(E)=Σ_p F^pE·t^(−p)⊂E[t,t⁻¹], use the generic DD.1 Rees carrier and construct D_Rees=t∇, relative to the parameter base so dt=0. Transversality sends e t^(−p) to ∇e t^(1−p), which belongs to Rees_F(E)⊗Ω¹. Its parameter is t, and its curvature vanishes.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Import the DD.1 finite split filtration/Rees module, its O[t]-local freeness and embeddings; do not build a second Rees carrier.
2. Define t∇ on Laurent sections with derivative only along the ringed-space direction. Transversality proves preservation of the Rees submodule.
3. The scalar rule on O[t] has coefficient t since dt=0. Curvature is t²∇²=0.
4. Use the imported fiber identifications for the specialization comparison below.

API:

- **GriffithsFiltration.reesConnection_apply** (projection): D(e t^(−p))=∇e t^(1−p).
- **GriffithsFiltration.reesConnection_parameter** (compatibility): The parameter is t and the differential is relative, with dt=0.
- **GriffithsFiltration.reesConnection_flat** (compatibility): Its curvature is zero when ∇ is flat.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **GriffithsFiltration.reesConnection.test_one** (compatibility): At t=1 its operator identifies with ∇.
- **GriffithsFiltration.reesConnection.test_zero** (compatibility): At t=0 its operator identifies with the graded Higgs symbol.
- **GriffithsFiltration.reesConnection.test_relative** (non-example): Using absolute forms with dt≠0 violates the constant-parameter convention; there is no claim that t∇ extends as this absolute t-connection.

Acceptance:

- On Rees_F(E)=Σ_p F^pE·t^(−p)⊂E[t,t⁻¹], use the generic DD.1 Rees carrier and construct D_Rees=t∇, relative to the parameter base so dt=0. Transversality sends e t^(−p) to ∇e t^(1−p), which belongs to Rees_F(E)⊗Ω¹. Its parameter is t, and its curvature vanishes.

Prerequisites: HodgeStructuresPartII:H.0/griffiths-filtration; HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/exterior-extension; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.35. GriffithsFiltration.reesSpecialization: Rees zero and unit fibers

**Node:** HodgeStructuresPartII:H.0/rees-specialization.

Under the generic finite split Rees identifications, (Rees_F(E),t∇)/(t) identifies as a Higgs object with (gr_F E,gr_F∇), and its /(t−1) fiber identifies as an ordinary connection with (E,∇). After t inversion, t⁻¹D_Rees identifies with ∇ on E[t,t⁻¹]. These are operator-compatible sheaf isomorphisms, not just rank or point equalities.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use DD.1 Rees_F(E)/(t)≅⊕_pF^p/F^{p+1} and the t=1 identification.
2. Evaluate e t^(−p): modulo t the output represents [∇e] one degree lower; at t=1 it represents ∇e.
3. Invert t and use intrinsic rescaling, while retaining relative dt=0.

Acceptance:

- Under the generic finite split Rees identifications, (Rees_F(E),t∇)/(t) identifies as a Higgs object with (gr_F E,gr_F∇), and its /(t−1) fiber identifies as an ordinary connection with (E,∇). After t inversion, t⁻¹D_Rees identifies with ∇ on E[t,t⁻¹]. These are operator-compatible sheaf isomorphisms, not just rank or point equalities.

Prerequisites: HodgeStructuresPartII:H.0/rees-parameter; HodgeStructuresPartII:H.0/graded-higgs; HodgeStructuresPartII:H.0/intrinsic-rescale; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

## H.0: affine coordinate parameter algebra

Fix commutative rings k and R with a k-algebra structure on R. Directions are indexed by Fin d. A frame specifies k-linear derivations δ_i, requires δ_iδ_j=δ_jδ_i and δ_i(λ)=0, and makes no invertibility assumption on λ. The coefficient module is R^V for a finite decidable index type V. Derivations act entrywise on vectors and matrices. Matrix action is on **column** vectors; juxtaposition denotes composition by matrix multiplication.

A preconnection is a matrix family A_i. Its differential operators are D_i=λδ_i+A_i. Flatness is a separate equation on curvature, not part of the preconnection's data. At λ=0 the model is a Higgs coefficient family; at λ=1 it satisfies the ordinary connection rule. The zero matrices represent the unit connection λd, which is generally not the zero operator.

This is an affine frame model. In an actual polynomial coordinate chart, curvature coefficients multiply dx_i∧dx_j. An arbitrary Frame, including the all-zero frame used by some small matrix tests, is not asserted to represent the universal Kähler differentials of R. General nonholonomic frames would need the bracket term, and are not included by the commuting-frame hypothesis.

All proposed names below live in the namespace TauCeti.Hodge.ParameterConnection.Affine. The twelve nodes are in HodgeStructuresPartII:H.0. Every dependency on another local node is explicit; their recursive prerequisite chains end in the nine read baseline declarations and elementary finite-coordinate algebra.

### 1. Frame: Commuting coordinate directions with constant parameter

Frame consists of d k-linear derivations δ_i:R→R, pairwise commuting on every a∈R, with δ_i(λ)=0. This is a specified affine frame, not a definition of a general differential site.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N and λ∈R; all derivations are k-linear.

Construction or proof outline:

1. Use the pinned Derivation carrier and record its pairwise commutation and constant-parameter equations.
2. Zero derivations give Frame.zero. On k[X_0,…,X_(d−1)], partial derivatives give Frame.polynomial with constant parameter C(c).
3. Prove polynomial commutation on monomials: successive removal of i,j has the same coefficient in both orders, including i=j; extend by k-linearity. Constants differentiate to zero.
4. Frame.one keeps the directions and uses δ_i(1)=0. No invertibility of λ is assumed.

API:

- **Frame.zero** (constructor): The all-zero directions give a frame for every d and λ.
- **Frame.polynomial** (constructor): The d-variable polynomial ring with partial derivatives and parameter C(c) gives a frame.
- **Frame.one** (constructor): Replace λ by 1 without changing directions.
- **Frame.zero_delta** (simp): Every zero-frame direction acts by zero.
- **Frame.polynomial_delta** (compatibility): The ith polynomial-frame direction is exactly MvPolynomial.pderiv i.
- **Frame.one_delta** (simp): The one-parameter frame has the input directions.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Frame.test_zero** (degenerate): In the one-direction zero frame, δ_0(a)=0 for every a.
- **Frame.test_polynomial_X** (computation): Over Q[X] with constant parameter 1, δ_0(X)=1.
- **Frame.test_identity_not_derivation** (non-example): Over Q, 1≠1·1+1·1; the identity map cannot satisfy the derivation Leibniz rule.

Acceptance: λ=X_0 with δ_0=∂_0 is excluded over Q since δ_0λ=1. Zero directions are allowed, but are not universal differential forms.

Prerequisites: mathlib:Derivation; mathlib:Derivation.leibniz; mathlib:MvPolynomial.pderiv; mathlib:MvPolynomial.derivation_ext.

### 2. Connection: Affine coordinate parameter connection

For a fixed Frame F, Connection is a family A_i∈Mat_V(R). It encodes D_i(s)=λδ_i(s)+A_i s before imposing flatness. F is an explicit type parameter: changing the directions or parameter is not a silent type identification.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Use the matrix family as the sole data field.
2. Keep F explicitly in the structure declaration even though the matrix field alone does not mention F.
3. Construct zero matrices. Extensionality and constructor projection follow from the product representation.

API:

- **Connection.zero** (constructor): All zero matrices define a preconnection.
- **Connection.zero_matrix** (simp): The ith matrix of the zero preconnection is zero.
- **Connection.matrix_ext** (extensionality): Agreement of all matrices implies equality for the same F,V.
- **Connection.mk_matrix** (projection): The constructor on a family A projects to A_i.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_zero_matrix** (degenerate): Zero preconnection projects to zero.
- **Connection.test_constructor_projection** (characterisation): The ith projection of the constructor on A is A_i.
- **Connection.test_rank_one** (computation): Over Q with one zero direction, the supplied 1×1 matrix is unchanged by construction and projection.

Acceptance: No flatness or nilpotence is imposed on an arbitrary Connection. Any one-direction rank-one matrix family is accepted, including a nonzero scalar.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-frame.

### 3. Connection.operator: Coordinate parameter differential operator

Define the k-linear operator (D_i s)_v=λδ_i(s_v)+(A_i s)_v. It satisfies D_i(a s)=aD_i(s)+λδ_i(a)s and is generally not R-linear.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Apply the derivation in each coordinate, multiply by λ and add the matrix-vector action.
2. k-linearity follows from derivation k-linearity and R-linear matrix multiplication.
3. Expand δ_i(a s_v) using Leibniz and scalar commutation to get precisely one λ in the scalar derivative term.

API:

- **Connection.operator_apply** (projection): D_i(s)=λδ_i(s)+A_i s coordinatewise.
- **Connection.operator_leibniz** (characterisation): D_i(a s)=aD_i(s)+λδ_i(a)s.
- **Connection.operator_zero** (simp): Zero matrices give D_i(s)=λδ_i(s).

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_operator_zero_section** (degenerate): D_i(0)=0.
- **Connection.test_operator_unit** (computation): The zero-matrix model acts by λδ_i in every coordinate.
- **Connection.test_operator_polynomial_leibniz** (computation): Over Q[X] with λ=1 and A=0, D(Xs)=XD(s)+s.
- **Connection.test_operator_parameter_two** (non-example): On Q[X] with λ=2 and zero matrix, D(X)=2, not the ordinary derivative value 1.

Acceptance: Zero matrices give λδ, not the zero operator in general. At λ=1 the scalar derivative is the ordinary connection term.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; mathlib:Derivation.leibniz; mathlib:Matrix.mulVec.

### 4. Connection.curvature: Coordinate curvature matrix

Define κ_ij=λδ_i(A_j)−λδ_j(A_i)+A_i A_j−A_j A_i with entrywise derivatives. In a genuine polynomial coordinate chart the two-form is Σ_(i<j)κ_ij dx_i∧dx_j.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Construct the displayed matrix expression using entrywise derivations.
2. Unfold to show κ_ii=0, κ_ji=−κ_ij and vanishing curvature for zero matrices.
3. For E12,E21 multiply E12 E21=E11 and E21 E12=E22; constant matrices have zero derivatives.

API:

- **Connection.curvature_self** (simp): κ_ii=0.
- **Connection.curvature_swap** (relation): κ_ji=−κ_ij.
- **Connection.curvature_zero** (simp): All zero matrices have zero curvature.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_curvature_self** (degenerate): Every diagonal-direction curvature is zero.
- **Connection.test_curvature_zero** (degenerate): All curvatures of zero matrices vanish.
- **Connection.test_curvature_noncommuting** (computation): With two zero directions over Q, λ=0, A_0=E12 and A_1=E21, κ_01=diag(1,−1).

Acceptance: On Q[x,y], E12 dx+E21 dy has curvature diag(1,−1)dx∧dy. The zero-direction Q test reproduces the same matrix coefficient without claiming universal forms.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; mathlib:Matrix.single.

### 5. Connection.operator_commutator: Commutator is curvature action

For every c,i,j and s∈R^V, D_i(D_j(s))−D_j(D_i(s))=κ_ij s.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Expand both compositions, including derivatives of λ and all matrix entries.
2. The second derivatives cancel by Frame.commute. Terms λδ_i(λ)δ_j(s) vanish by Frame.constant.
3. Use Leibniz inside finite sums; mixed A_iδ_j(s) terms cancel and remaining entries equal κ_ij s.

Acceptance: Without δλ=0 an extra term is λ(δ_iλ·δ_j(s)−δ_jλ·δ_i(s)). The E12/E21 commutator acts by diag(1,−1).

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; mathlib:Derivation.leibniz; mathlib:Matrix.mulVec_mulVec.

### 6. Connection.IsFlat: Flatness of the coordinate model

Connection.IsFlat means κ_ij=0 for every i,j. It is equivalent to pairwise commuting D_i on every section, and does not assert nilpotence.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Define the predicate by the explicit curvature equalities.
2. The commutator theorem proves one direction.
3. For the converse evaluate the zero operator on each coordinate basis vector; every column of κ_ij vanishes.
4. For d=1 the only curvature is diagonal and hence zero.

API:

- **Connection.flatZero** (constructor): Zero matrices with their flatness proof give an element of the flat subtype.
- **Connection.isFlat_iff** (characterisation): Flatness iff D_iD_j(s)=D_jD_i(s) for all i,j,s.
- **Connection.isFlat_zero** (simp): The zero preconnection is flat.
- **Connection.isFlat_one_direction** (characterisation): Every one-direction model is flat.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_flat_zero** (degenerate): Zero matrices give a flat model.
- **Connection.test_flat_line** (computation): Every one-direction model is flat.
- **Connection.test_flat_noncommuting** (non-example): The two-direction E12,E21 model over Q is not flat.

Acceptance: A scalar Higgs coefficient 1 on A¹_Q is flat but not nilpotent. Two directions with E12,E21 fail flatness.

Prerequisites: HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/operator-commutator.

### 7. Connection.gauge: Coordinate change by an invertible matrix

For a matrix unit G and the convention s′=Gs, define A′_i=G A_i G^−1−λδ_i(G)G^−1. The associated operator is G D_i G^−1 on the new component column.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Differentiate G G^−1=I to get δ_i(G^−1)=−G^−1δ_i(G)G^−1.
2. Expand G D_i(G^−1s′): its derivative coefficient is λ and its matrix coefficient has the displayed minus sign.
3. Its operator commutator is G[D_i,D_j]G^−1. Use the commutator node and coordinate basis evaluation to identify κ′_ij=Gκ_ijG^−1.
4. Invertibility of G proves preservation and reflection of curvature vanishing.

API:

- **Connection.gauge_matrix** (projection): A′_i=G A_i G^−1−λδ_i(G)G^−1.
- **Connection.gauge_curvature** (compatibility): κ′_ij=Gκ_ijG^−1.
- **Connection.gauge_flat** (equivalence): The gauge model is flat iff the original is flat.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_gauge_identity** (degenerate): Gauge by the identity unit fixes c.
- **Connection.test_gauge_flat** (compatibility): Every matrix-unit gauge preserves and reflects flatness.
- **Connection.test_gauge_zero_correction** (computation): Gauge of zero matrices has coefficient −λδ_i(G)G^−1.

Acceptance: The fixed convention is s′=Gs; the opposite convention changes the formula. Gauge of zero matrices need not have zero matrices when λδG≠0.

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/operator-commutator; mathlib:Derivation.leibniz; mathlib:Matrix.mulVec_mulVec.

### 8. Connection.tensor: Tensor with the same parameter

For models c on R^V and b on R^W with the same F and λ, construct the free model on R^(V×W) with matrices A_i⊗I_W+I_V⊗B_i, using the Kronecker product. Its parameter is λ, not 2λ.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Use the standard free-coordinate tensor identification and define the Kronecker sum.
2. Entrywise differentiate; the cross commutators cancel since A⊗I commutes with I⊗B. The remaining curvature is κ_c⊗I+I⊗κ_b.
3. On elementary tensors, λδ(s⊗t)=λδ(s)⊗t+s⊗λδ(t). Scalar balancing identifies the derivative term represented in either factor, so one λ occurs.
4. Vanishing of both input curvatures implies vanishing of the tensor curvature; no converse is claimed.

API:

- **Connection.tensor_matrix** (projection): The tensor matrix is A_i⊗I_W+I_V⊗B_i.
- **Connection.tensor_curvature** (compatibility): Tensor curvature is κ_c,ij⊗I_W+I_V⊗κ_b,ij.
- **Connection.tensor_flat** (compatibility): Flat inputs give a flat tensor.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_tensor_zero** (degenerate): The tensor of zero matrices is zero.
- **Connection.test_tensor_flat** (compatibility): The tensor of flat models is flat.
- **Connection.test_tensor_parameter** (characterisation): D_tensor,i(a s)=aD_tensor,i(s)+λδ_i(a)s.

Acceptance: Input parameters must agree. The balanced tensor scalar Leibniz rule has one λ derivative term.

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/flatness; mathlib:Matrix.kronecker; mathlib:Derivation.leibniz.

### 9. Connection.dual: Coordinate dual parameter connection

Identify the dual of R^V with row coefficients transposed to a column, and define the dual matrix as −A_iᵀ. Keep the same F and λ.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Expand the evaluation-pairing equation λδ_i(φ(s))=D_dual,i(φ)(s)+φ(D_i(s)); its coefficient terms force −A_iᵀ.
2. Entrywise differentiation and reversal of products under transpose give κ_dual,ij=−κ_ijᵀ.
3. Double transposition recovers A, and curvature vanishing is preserved.

API:

- **Connection.dual_matrix** (projection): The dual ith matrix is −A_iᵀ.
- **Connection.dual_curvature** (compatibility): Dual curvature is −κ_ijᵀ.
- **Connection.dual_flat** (compatibility): The dual of a flat model is flat.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_dual_zero** (degenerate): The zero model has zero dual.
- **Connection.test_dual_involution** (compatibility): Taking the dual twice returns c.
- **Connection.test_dual_entry** (computation): The (v,w) dual entry equals −A_i(w,v).

Acceptance: Omitting the minus sign breaks compatibility with evaluation. This coordinate identification is only for finite free modules, not a claimed sheaf-duality construction.

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/flatness; mathlib:Matrix.transpose.

### 10. Connection.rescale: Rescaling an invertible parameter

For u∈R× and F with λ=u, define rescale(c) on F.one by matrices u^−1A_i. Its operator is u^−1D_i and curvature u^−2κ_ij; its scalar Leibniz coefficient is 1.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Differentiate u u^−1=1 and use δ_i(u)=0 to obtain δ_i(u^−1)=0.
2. Retain the same directions with parameter 1 and multiply every coefficient matrix by u^−1.
3. The new operator is δ_i(s)+u^−1A_i s=u^−1D_i(s). Expanding curvature scales derivative and commutator terms by u^−2.
4. Invertibility makes flatness equivalent. Merely changing λ's type while leaving A unscaled is incorrect.

API:

- **Connection.rescale_matrix** (projection): The rescaled matrix is u^−1A_i.
- **Connection.rescale_operator** (compatibility): The rescaled operator is u^−1D_i.
- **Connection.rescale_curvature** (compatibility): The rescaled curvature is u^−2κ_ij.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_rescale_flat** (compatibility): Rescaling preserves flatness.
- **Connection.test_rescale_zero** (degenerate): Zero matrices rescale to zero matrices.
- **Connection.test_rescale_leibniz** (characterisation): D_rescale,i(a s)=aD_rescale,i(s)+δ_i(a)s.

Acceptance: Over Q[X], the zero-matrix λ=2 model maps X to 2; rescaling maps X to 1. λ=0 and nonunit parameters do not admit this operation.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-frame; HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/flatness; mathlib:Derivation.leibniz.

### 11. Connection.zero_parameter_curvature: Higgs specialization is the matrix commutator

At λ=0 the curvature is A_i A_j−A_j A_i. Flatness means commuting Higgs coefficients, not nilpotence.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Substitute λ=0 into the curvature definition.
2. Remove the zero derivative terms and retain the signed commutator coefficient.

Acceptance: E12 dx+E21 dy on A²_Q has curvature diag(1,−1)dx∧dy. The scalar dx on A¹_Q is integrable and not nilpotent.

Prerequisites: HodgeStructuresPartII:H.0/curvature.

### 12. Connection.JointNilpotent: Joint word nilpotence of Higgs coefficients

At λ=0, JointNilpotent(c,N) means N>0 and A_(i1)…A_(iN)=0 for every direction word of length N. This is a separate finite bound; no rank-one-zero assertion over nonreduced R is made.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Use all words of length N, not exterior products, and require N>0.
2. Zero matrices satisfy bound 1; one-letter words show that bound 1 iff every A_i=0.
3. For the dual a product equals (−1)^N times the transpose of the reversed original word, hence the same bound holds.
4. Compute E12²=0≠E12 and scalar ε²=0≠ε examples. The scalar 1 has nonzero word product at every positive length.

API:

- **Connection.jointNilpotent_zero** (simp): Zero matrices have bound 1.
- **Connection.jointNilpotent_dual** (compatibility): Duality preserves the stated bound N.
- **Connection.jointNilpotent_one_iff** (characterisation): Bound 1 iff every matrix is zero.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. LZ17 Remark 1.10 and Theorem 2.1: Distinguishes a separate finite nilpotence condition from integrability and keeps the coefficient ring visible.

Discriminating unit tests:

- **Connection.test_nilpotent_nonzero** (computation): In one direction over Q, E12 on Q² has bound 2 but is nonzero.
- **Connection.test_integrable_not_nilpotent** (non-example): The one-direction scalar 1 over Q is flat but not JointNilpotent(c,N) for any N.
- **Connection.test_nonreduced_rank_one** (computation): If ε²=0≠ε in R, the one-direction rank-one scalar ε model has bound 2 but is nonzero.

Acceptance: Scalar 1 in one direction over Q is flat but has no finite bound. For ε²=0≠ε in nonreduced R, a rank-one coefficient ε is nonzero with bound 2. The intrinsic finite-filtration comparison and tensor nilpotence bounds are now planned by H.0/nilpotence-equivalence and H.0/tensor-nilpotence; the exact E1 tensor-kernel contract and their global Lean signatures remain outstanding.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; HodgeStructuresPartII:H.0/dual; HodgeStructuresPartII:H.0/flatness; HodgeStructuresPartII:H.0/zero-parameter-curvature; mathlib:Matrix.single.

### Why the tests discriminate

On A¹_Q, the scalar Higgs field dx has zero wedge curvature because there is only one direction, but every positive word product of its coefficient 1 remains 1. Thus integrability is not nilpotence. Conversely E12 dx on a rank-two free module has a genuinely nonzero coefficient with square zero. The nonreduced test is equally important: if ε²=0≠ε, a rank-one Higgs coefficient ε is nonzero and has bound 2. A rank-one-zero rule without a reducedness premise would fail it.

On A²_Q, E12 dx+E21 dy has coefficient curvature E11−E22=diag(1,−1). Replacing integrability by a vacuous exterior condition or by a property checked one direction at a time misses this obstruction. The zero-direction Q matrix test in the suggested file is a coefficient calculation; it is not a claim that Ω¹_Q/Q contains dx and dy.

The constant-parameter premise has a separate role. If commuting directions are ∂_x,∂_y, λ=x and A=0 over Q[x,y], then [x∂_x,x∂_y](y)=x. The displayed constant-parameter curvature expression would be zero. This model is deliberately excluded by δ_xλ=1. The distinction concerns relative constancy; no claim is made that the source's family parameter is an arbitrary nonconstant absolute-coordinate parameter.

For a unit u, rescaling multiplies both D and A by u^−1. The model with λ=2, A=0 on Q[X] sends X to 2, while the ordinary rescaled operator sends X to 1. Tensoring two same-parameter models uses the Kronecker sum, and its Leibniz rule still has λ once. Adding both scalar Leibniz terms as if they acted on an unbalanced tensor would produce an incorrect 2λ coefficient.

Gauge is fixed by the convention s′=Gs; its derivative correction is minus λδG·G^−1. Dual is minus transpose, not transpose. These signs are tested independently of flatness: zero curvature alone cannot detect a wrong coefficient formula in a one-direction model.

## Binding route inventory and remaining layers

The packet's routeManifest preserves all 149 routed item ids from eight accepted route records: the seven papers in the issue and the additional Liu–Zhu shared-prefix obligations. Counts are catalogue obligations, not a claim of 149 freshly verified statements. All eight accepted briefs and the key-definition assignment were read in both checkpoints. Only the selected fresh primary passages above were read in this continuation; reading a brief is not reading the corresponding proof.

- Landesman–Litt: 46 items, H.1–H.5. Retain canonical extensions, fixed parts, period derivatives, parabolic semistability and rank/Clifford bounds, Artinian deformation vanishing, rigidity and integrality. The brief's qualifications remain binding: Lemma 6.1.1 uses the specified isomorphic sublocal system; Proposition 5.2.4 is semistability, not stability; 8.3.3 needs a strict normal-crossing compactification; the 9.1.4 implication imports LL22 Theorem 1.2.5. These require fresh source proofs, not adoption on the strength of a label.
- Gao–Habegger: 3 items, H.2–H.3. Retain the weight-one holomorphic period map, connected monodromy/fixed parts, and the Hodge-generic invariant-subvariation to abelian-subscheme bridge. Common variations come from D3 and abelian geometry from its own supplier. Finite monodromy tests must allow trivial connected monodromy.
- Heuer: 1 item, H.0. The general Higgs carrier includes the explicit Ω¹(−1) twist. Definition 1.2 does not identify the whole p-adic essential image with a complex semistable vanishing-Chern-class locus. The correspondence and its choices remain with PadicHodgeTheoryPartIIPadicSimpson.
- Qian: 1 item, H.6. Preserve the proper semistable log-de Rham carrier, residue connecting morphism, exp(−2πiN), actions/eigenspaces and ramified base change. A disc cannot silently contain other singular fibres. This is a complex log-monodromy interface, not an ell-adic substitute.
- Bakker–Klingler–Tsimerman: 60 items, H.3/H.6/H.7. Preserve the general represented Mumford–Tate orbit inside the ambient period carrier, nilpotent and limiting-mixed structures, simultaneous splitting and norm estimates, finite fixed-K Siegel control, definability and individual algebraic Hodge-locus pullbacks. The brief's buffered domains, angular seam cover, splitting-independent multigrading, rough-monomial denominator conventions and exact Tate normalization require complete proof-level resolution. A countable union is not asserted definable.
- Benoist: 10 items, H.8. Preserve the full real Noether–Lefschetz supplier: real twisted geometric weight-two variations, transported classes, Kodaira–Spencer contraction, period derivative, boundary factorization, Green cone and Voisin kernel-cone interface. Do not rebuild the divisor-class theorem in MC.7, and do not create a backedge from the double-cover application to its variation foundations. Ordinary weak Lefschetz and the equivariant theorem are distinct inputs.
- Esnault–Groechenig: 26 items, H.1/H.5 plus H.0 foundations. Preserve stable moduli, torsion determinant, Riemann–Hilbert/Simpson on the correct component, End-zero rigidity, nilpotent rigid Higgs fields, smooth arithmetic models, λ-Hodge moduli and Griffiths graded objects. Lemma 4.9 explicitly relies on Simpson Theorem 9.1 and Lemma 7.2; this checkpoint does not close those references. Integral and strongly integral remain distinct.
- Liu–Zhu: H02 and H03, H.0. Preserve general ringed differential-site coefficients, twisted Higgs fields, intrinsic finite-filtration nilpotence, tensor/dual/pullback and Griffiths/Rees interfaces. Remark 3.2 supplies a t-connection specialization passage, not the missing global definition or its entire API.

The provisional layer organization is:

### H.0. Higgs fields and parameter connections

Supply the reserved general ringed-site finite-locally-free Higgs/λ-connection interface once: central parameter with dλ=0, integrability, explicit coefficient twist, tensor, dual, pullback, nilpotence bounds and Griffiths associated-graded construction. This continuation supplies the intrinsic reserved carrier and its algebra as plans; supplier contracts and the filtered-coefficient adapter remain open.

Declared draft prerequisites: CrystallineCohomology:CR.1; EnhancedDerivedSheaves:E1.

Coverage: partial intrinsic and affine prefix, with exact supplier and coefficient-adapter boundaries.

### H.1. Stable moduli and complex non-abelian Hodge theory

Build projective stable Betti, de Rham and Dolbeault moduli with the stated torsion determinant and vanishing-Chern-class component. Establish Riemann–Hilbert, Simpson and Hodge moduli after importing generic moduli foundations. Keep rank, determinant, stability and analytic/algebraic comparison hypotheses explicit. No p-adic correspondence is constructed here.

Declared draft prerequisites: HodgeStructuresPartII:H.0.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.2. Variations, canonical extensions and fixed parts

Import the common variation carrier from ShimuraData:D3, including fibrewise opposedness and Griffiths transversality. Add pure/mixed/admissible/graded-polarizable interfaces, canonical logarithmic extensions, Gauss–Manin, fixed-part and connected monodromy results. A complex variation is not assumed to have an integral lattice.

Declared draft prerequisites: HodgeStructuresPartII:H.0; ShimuraData:D3.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.3. General period manifolds and period-map derivatives

Extend the parent's fibrewise period points to compact dual charts, Mumford–Tate orbit subdomains, holomorphic period maps and differential formulas. Keep the full ambient period carrier, tensor constraints and connected-component choices; the orbit equals the ambient domain only in the full-isometry specialization. Supply trace-pairing/Kodaira–Spencer period derivatives without duplicating common variations.

Declared draft prerequisites: HodgeStructuresPartII:H.2; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l3--period-domain-points-the-symmetry-group.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.4. Parabolic bounds and unitary deformation vanishing

Plan Landesman–Litt parabolic weights, degrees, slopes, semistability and exact Clifford/rank bounds. Establish the sublocal-system rank theorem and Artinian unitary deformation vanishing with their separate hypotheses. Import curve Riemann–Roch, Serre duality, Clifford and Grassmannian foundations.

Declared draft prerequisites: HodgeStructuresPartII:H.1; HodgeStructuresPartII:H.2; HodgeStructuresPartII:H.3.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.5. Rigid loci, arithmetic models and integral variations

Build rigid/cohomologically rigid fixed-determinant loci, End-zero tangent conventions, rigid Higgs nilpotence, equivariant rigid Hodge-moduli splitting, smooth arithmetic models and the zero-graded-Higgs/unitarity criterion. Add rigidity/integrality with quasi-unipotent boundary and finite determinant explicit. Distinguish integral from strongly integral; retain rank-one infinite-image unitary examples. Export to CartierFlows/RigidCompanions without importing those consumers.

Declared draft prerequisites: HodgeStructuresPartII:H.1; HodgeStructuresPartII:H.2; HodgeStructuresPartII:H.4.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.6. Semistable degeneration and logarithmic monodromy

Plan Qian's proper semistable log-de Rham interface, residue/monodromy comparison exp(−2πiN), finite group actions and ramified base-change normalization. Add BKT multivariable nilpotent orbits, monodromy weight filtrations, limiting mixed Hodge structures and splitting-independent norm estimates. Keep discs away from other singular fibres and use buffered charts covering angular seams.

Declared draft prerequisites: HodgeStructuresPartII:H.2.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.7. Definable period maps and algebraicity of Hodge loci

Retain the full BKT continuation: bounded-width positive-height sectors, fixed-canonical-K finite Siegel containment, multigrading estimates, period definability, individual special pullbacks and definable Chow. The exceptional Hodge locus is a countable union of closed irreducible algebraic subvarieties, not itself asserted definable. Untwisted rational tensors have type (0,0); (p,p) tensors require Tate twists.

Declared draft prerequisites: HodgeStructuresPartII:H.3; HodgeStructuresPartII:H.6.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.8. Real Noether–Lefschetz variation interfaces

Retain the mandatory Benoist continuation: geometric weight-two real variations, transported Hodge classes, generic Kodaira–Spencer contraction, Griffiths derivative, normal-boundary factorization, Green open cones and the required Voisin kernel-cone interface. Supply RealSurfacePeriodIndex using common variations and the existing divisor-class supplier. Ordinary integral weak Lefschetz is not replaced by an equivariant variant. Double-cover families and application-specific vanishings remain with the consumer.

Declared draft prerequisites: HodgeStructuresPartII:H.3.

Coverage: not_read; route brief is a requirement, not a source decomposition.

## Remaining work and suggested-file boundary

H.0 is partial for the following exact reasons:

1. Discharge the CR.1 ordinary connection/exterior-calculus comparison and E1 sheaf tensor, finite dual evaluation, tensor-kernel exactness, pullback and descent requests; native sheaf carriers and presheaf tensor must be reused.
2. Discharge DD.1 finite split filtration/Rees carrier and specialization equations, then elaborate the global signatures listed in the suggested-file omission ledger.
3. Freshly source-decompose all other H.0 definitions/proof inputs required by the full 149-item route inventory; the reserved carrier and its present algebra are supplied as plans, not implementation.
4. Prove determinant/exterior-power connection functoriality and the coefficient-equivariance adapter for the p-adic Tate instance at declaration granularity; no choices of a Tate basis may erase Galois action.
5. Supply the filtered-coefficient/period-lattice adapter for Liu–Zhu Definition 3.5–3.6: its t-adic filtration is not a bounded subbundle filtration over the original period ring. Import graded base-ring and Tate degree identifications from DD.1 and the p-adic consumer; the finite Griffiths/Rees specialization here does not discharge that adapter.

The finite subbundle Griffiths construction is valid for the complex EG situation. Liu–Zhu Definition 3.5 instead uses an unbounded t-adic period-lattice filtration with t^iFil^j=Fil^{i+j}. Its quotients need not be locally free over the original period ring. Applying the finite-subquotient theorem to that ring would add a false hypothesis. The filtered coefficient ring, degree-zero graded specialization and Tate-character adapter are explicit remaining work; the p-adic consumer and DD.1 must provide their exact comparison. This boundary is retained even though the ordinary relative t-rescaling calculation is valid.

H.1–H.8 retain their exact inherited remaining lists, all binding source tranches and all 149 route ids. In particular real Noether–Lefschetz H.8 is mandatory. Complete source/declaration decomposition and suitable exact supplier nodes remain outstanding; no unread theorem is represented as an implemented planet. The parent and directly used CR.1/E1/DD.1/D3 stage contracts were read. Blueprint and integrated link entries and the atlas stage edges were screened for HodgeStructuresPartII and DegeneratingHodgeStructures at the base tree; none named this successor. This is not a claim that every downstream supplier link was fully audited.

The suggested file retains all twelve affine signatures, their APIs and thirty-one examples. It adds a native ring-level additive-balanced core against existing derivations and tensor products. Its TwoForms input contains concrete degree-zero/one/two operations and their defining equations, not a fictitious curvature proposition. It models arbitrary modules in a local chart and does not claim to be the global sheaf object. Every global signature, API and unit test that cannot yet be expressed against the missing sheaf monoidal/filtered interfaces is explicitly listed in its omission ledger, with the actual mathematical statement and the missing carrier. There are no fabricated Proposition-valued stand-ins for those objects. Higher-degree statements are not justified by a truncation to two forms. Historical receipt for codex-J6LwjP’s intrinsic checkpoint: that entire file was elaborated by codex-J6LwjP with Lean v4.34.0-rc2 and the existing Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build: zero errors and 106 admitted-declaration warnings. All imports are Mathlib modules, so this check does not require or certify a built Tau Ceti tree. The continuation repaired the reserved lambda identifier, implicit frame inference, independent universes for finite index types, polynomial scalar annotations and explicit matrix-unit inverse coercions. These repairs change no mathematical node, source, supplier request or global omission. No Lake project/cache setup, library build or language server was started.

The five selected planets are Integrable parameter bundles, Twisted Higgs bundles, Joint Higgs nilpotence, Griffiths filtrations, Graded Higgs field and Rees parameter connection. The former affine preconnection and coordinate-curvature planets were removed so the layer shows its intrinsic definitions and remains within the five-planet limit. All affine node ids survive.


## Retained affine declaration IDs

These IDs continue to name the coordinate models; the intrinsic equivalence requires the genuine local form bases specified above.

| Node | Suggested declaration |
| --- | --- |
| `HodgeStructuresPartII:H.0/coordinate-frame` | `Frame` |
| `HodgeStructuresPartII:H.0/preconnection` | `Connection` |
| `HodgeStructuresPartII:H.0/operator` | `Connection.operator` |
| `HodgeStructuresPartII:H.0/curvature` | `Connection.curvature` |
| `HodgeStructuresPartII:H.0/operator-commutator` | `Connection.operator_commutator` |
| `HodgeStructuresPartII:H.0/flatness` | `Connection.IsFlat` |
| `HodgeStructuresPartII:H.0/gauge` | `Connection.gauge` |
| `HodgeStructuresPartII:H.0/tensor` | `Connection.tensor` |
| `HodgeStructuresPartII:H.0/dual` | `Connection.dual` |
| `HodgeStructuresPartII:H.0/invertible-rescale` | `Connection.rescale` |
| `HodgeStructuresPartII:H.0/zero-parameter-curvature` | `Connection.zero_parameter_curvature` |
| `HodgeStructuresPartII:H.0/joint-nilpotence` | `Connection.JointNilpotent` |

## Elaboration continuation — codex-J6LwjP

This continuation rechecked the reviewed parent L0–L3 audit and the D3/E1 audit boundaries, read the full parent document, and inspected the pinned additive tensor-lift and unit-inverse statements. It adds no mathematical nodes or source-reading claims. The preceding continuation’s PDF/model/projection receipts are retained as historical evidence; they were not rerun here. The current Lean check exercises all 44 native example signatures, including the nonreduced rank-one example with a universe-polymorphic coefficient ring. The 35 global nodes, 65 APIs and 54 tests listed only in the omission ledger still require actual supplier interfaces and native signatures. Compilation checks types; it does not prove the admitted-declaration goals or close H.0.


## Coordinate determinant continuation — codex-J6LwjP

The fixed-determinant conditions of EG require the induced line connection, not merely the underlying line bundle. On a chosen finite free chart, its coefficient is the trace of the matrix. This continuation supplies that local model over any commutative coefficient ring. It does not construct a determinant sheaf or identify arbitrary global tensors with tensors of global sections.

### Coordinate determinant parameter connection

Declaration: Connection.determinant. Node: HodgeStructuresPartII:H.0/determinant-coordinate.

For the finite free coordinate model c with matrices A_i, construct a rank-one coordinate model det(c) with the same F and λ and one-by-one matrix tr(A_i). Its section operator is s ↦ λδ_i(s)+tr(A_i)s. This is the local coefficient model for the induced top exterior-power connection; the global determinant sheaf, the wedge identification and change-of-frame descent are separate supplier/bridge obligations. Rank zero gives the unit-line connection with zero coefficient.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Define the rank-one matrices by the existing matrix trace, summing diagonal entries; reuse the existing coordinate Connection carrier with index Fin 1.
2. The operator formula follows from the existing operator equation. The scalar derivative term has λ, not rank(V)λ; the rank only multiplies scalar coefficient matrices.
3. This construction uses no scalar division, exterior-sheaf construction or global frame choice. Its identification with a top exterior power is recorded as a separate gap, not an assumed theorem.

Uses:

- EG author §1 Definition 1.1 and §2.1; HodgeStructuresPartII:H.1/H.5: Provide the local coefficients needed for the fixed-determinant connection and trace-zero Higgs condition without assuming an arbitrary connection has trace zero.
- HodgeStructuresPartII:H.0/determinant-curvature: Identify the scalar curvature and prove flatness is preserved.
- HodgeStructuresPartII:H.0/determinant-tensor and HodgeStructuresPartII:H.0/determinant-dual: Test determinant compatibility and rank multiplicities before global exterior-power descent.

API:

- Connection.determinant_matrix (projection): The sole matrix entry of det(c) in direction i equals tr(A_i). Promoted to determinant-matrix for downstream use.
- Connection.determinant_operator (projection): On the coordinate line, D_det,i(s)(0)=λδ_i(s(0))+tr(A_i)s(0).
- Connection.determinant_curvature (compatibility): The sole curvature entry of det(c) in directions i,j is tr(κ_c,ij). Promoted to determinant-curvature for downstream use.

Tests:

- Connection.test_determinant_rank_zero (degenerate): For an empty index Fin 0, det(c) is the rank-one zero-coefficient model; the determinant is not the zero module.
- Connection.test_determinant_rank_one (compatibility): For index Fin 1, det(c)=c.
- Connection.test_determinant_scalar_rank_two (computation): For A_i=a_i I_2, the determinant connection coefficient is 2a_i, not a_i² and not a rank-scaled parameter.
- Connection.test_determinant_flat_no_converse (non-example): For λ=0, two zero directions over Q and A_0=E12, A_1=E21, det(c) is flat while c has nonzero diagonal(1,−1) curvature.

Acceptance:

- Distinguish trace(A_i) from the algebraic determinant of A_i.
- The model preserves the source parameter at every rank, including rank zero.
- Trace loses information: flatness of det(c) has no converse.

Prerequisites: HodgeStructuresPartII:H.0/preconnection, HodgeStructuresPartII:H.0/operator, mathlib:Matrix.trace.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Matrix of the coordinate determinant connection

Declaration: Connection.determinant_matrix. Node: HodgeStructuresPartII:H.0/determinant-matrix.

The unique matrix entry of det(c) in direction i is tr(A_i).

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Project the defining one-by-one matrix from the coordinate construction.

Acceptance:

- The coefficient is trace, not determinant.

Prerequisites: HodgeStructuresPartII:H.0/determinant-coordinate.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Curvature of the determinant coordinate line

Declaration: Connection.determinant_curvature. Node: HodgeStructuresPartII:H.0/determinant-curvature.

For all i,j, the unique entry of κ_det(c),ij is tr(κ_c,ij)=λδ_i(tr A_j)−λδ_j(tr A_i).

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Use determinant-matrix and expand the coordinate curvature. One-by-one coefficient commutators vanish because R is commutative.
2. Apply AddMonoidHom.map_trace to each derivation, commuting differentiation with the finite diagonal sum. Apply trace_add, trace_sub and trace_smul to the original curvature.
3. Matrix.trace_mul_comm identifies tr(A_i A_j) and tr(A_j A_i); their difference cancels. No division by rank or by two is used.

Acceptance:

- Valid over any commutative coefficient ring, including characteristic two.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/curvature, mathlib:AddMonoidHom.map_trace, mathlib:Matrix.trace_mul_comm, mathlib:Matrix.trace_add, mathlib:Matrix.trace_sub, mathlib:Matrix.trace_smul.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Flat connections have flat determinant models

Declaration: Connection.determinant_flat. Node: HodgeStructuresPartII:H.0/determinant-flat.

If c is flat, det(c) is flat. A flat determinant model does not imply that c is flat.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Apply determinant-curvature and trace_zero to every vanishing input curvature matrix; a one-by-one matrix vanishes exactly when its entry does.
2. The test with two noncommuting off-diagonal matrix units has nonzero trace-zero curvature and refutes the converse.

Acceptance:

- Do not replace the full integrability condition by trace-zero curvature.

Prerequisites: HodgeStructuresPartII:H.0/determinant-curvature, HodgeStructuresPartII:H.0/flatness, mathlib:Matrix.trace_zero.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Determinant model commutes with duality

Declaration: Connection.determinant_dual. Node: HodgeStructuresPartII:H.0/determinant-dual.

The coordinate models det(c.dual) and det(c).dual are equal, with the same F and λ.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Use the inherited dual coefficient −A_iᵀ. Trace_neg and trace_transpose give tr(−A_iᵀ)=−tr(A_i).
2. The one-by-one matrices agree by determinant-matrix; connection extensionality gives equality.

Acceptance:

- The minus sign is required; transpose alone is wrong.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/dual, mathlib:Matrix.trace_transpose, mathlib:Matrix.trace_neg.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Tensor determinant rank multiplicities

Declaration: Connection.determinant_tensor_matrix. Node: HodgeStructuresPartII:H.0/determinant-tensor.

For c on R^V and b on R^W with the same F and λ, the determinant coordinate coefficient of c.tensor(b) in direction i is rank(W)tr(A_i)+rank(V)tr(B_i), with natural ranks cast into R.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Use the inherited Kronecker-sum coefficient A_i⊗I_W+I_V⊗B_i.
2. Apply trace_add and Matrix.trace_kronecker, then trace_one. Commute the scalar factors in R to obtain the displayed rank coefficients.
3. The section operator still has parameter λ. This coefficient identity alone is not the global determinant-line tensor isomorphism.

Acceptance:

- Ranks appear as elements of R and can vanish in positive characteristic; they are not inverted.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/tensor, mathlib:Matrix.trace_kronecker, mathlib:Matrix.trace_one, mathlib:Matrix.trace_add.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Curvature under coordinate change

Declaration: Connection.gauge_curvature. Node: HodgeStructuresPartII:H.0/gauge-curvature.

For the coordinate transformation s′=Gs and every invertible matrix G, curvature transforms as κ_gauge(c,G),ij=G κ_c,ij G⁻¹. This is the promoted curvature API of the inherited gauge construction.

Proof:

1. Differentiate GG⁻¹=I entrywise. The matrix product Leibniz rule gives δ_i(G⁻¹)=−G⁻¹δ_i(G)G⁻¹ by multiplying the resulting zero identity on the left by G⁻¹.
2. Insert the defined coefficient G A_i G⁻¹−λδ_i(G)G⁻¹ into the curvature formula. Use the preceding inverse derivative, the relatively constant parameter and commutation of the coordinate derivations to cancel all terms with derivatives of G; the remaining expression is G(λδ_iA_j−λδ_jA_i+[A_i,A_j])G⁻¹. Finite matrix sums and multiplication are over the commutative ring R.

Prerequisites: HodgeStructuresPartII:H.0/gauge, HodgeStructuresPartII:H.0/curvature, HodgeStructuresPartII:H.0/coordinate-frame, mathlib:Derivation.leibniz.

Source: EG author preprint §4.2 pp.23–24 parameter rule, with explicit coordinate derivation. This promotes the inherited gauge curvature API without adding a second declaration.

### Determinant curvature is gauge invariant

Declaration: Connection.determinant_gauge_curvature. Node: HodgeStructuresPartII:H.0/determinant-gauge-curvature.

For every invertible coordinate matrix G, the one-by-one curvature entry of det(c.gauge(G)) equals that of det(c).

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Apply determinant-curvature on both sides and the inherited gauge curvature identity κ_gauge=G κ G⁻¹.
2. Matrix.trace_units_conj proves equality of the two traces. This requires no derivative of det(G).
3. This is curvature invariance only; the connection coefficient still has its trace of the derivative correction. A global determinant descent theorem also needs the induced frame det(G) and the Jacobi derivative formula.

Acceptance:

- Do not assert that the determinant connection matrices themselves are unchanged under a nonconstant gauge.

Prerequisites: HodgeStructuresPartII:H.0/determinant-curvature, HodgeStructuresPartII:H.0/gauge-curvature, mathlib:Matrix.trace_units_conj.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

The new public source is the 44-page author preprint at https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf, retrieved on 2026-10-02 with SHA-256 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. The published PDF returned HTTP 403 in this continuation; its historical receipt remains. Only the selected fixed-determinant/Higgs/parameter passages were freshly read. No complete edition collation or new erratum is claimed.

The global determinant/exterior-power bridge remains a gap: import locally free exterior powers and determinant lines from E1, define the induced alternating operator, prove its trace expression in a top-wedge frame, and prove the det(G) transition law using the Jacobi derivative identity before descent. Curvature invariance alone is insufficient. All 35 global signature omissions and later-stage source obligations remain.

Historical receipt from the preceding codex-J6LwjP checkpoint ONLY (SHA-256 df692430d323e907f4a419970dbde6f4a72a6d354f5759a96a1c5a42c7c154e7; not the current changed file): the expanded entire suggested file elaborated at the exact pinned Mathlib commit with zero errors, 118 admitted-declaration warnings, no other warnings and 48 native examples. The global omission ledger remains unchanged. The packet checker and five-file intake pass; actual atlas projection preserves all 18 required layer edges without pending/skipped links and is acyclic. Fresh exact polynomial/Laurent gauges over characteristics zero, two and three support the determinant formulas; reproduction counts and hashes are in the handoff.


## Current continuation: determinant derivative and frame bridge

Codex — codex-a71f92, issue #3371; immutable audit tree f9cfbaf2b11b46e79508bfaa1c4d60823bd266de. Five finite-coordinate declaration plans are added; all 55 preceding node objects, their 103 API items and 89 planned definition/construction tests, the six planets, eight binding route entries and source-issue records are preserved. Older checkpoint counts/compilation receipts describe their own exact bytes only.

The EG author-hosted preprint was freshly retrieved at SHA-256 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. Fresh selected reading: §1 p.2 fixed-determinant opening/Definition 1.1/Remark 1.2; §2.1 pp.5–6 Higgs/trace-zero definitions and complete printed Lemma 2.1 proof; §4.2 pp.23–24 parameter definition and complete printed Lemma 4.9 proof. Simpson's cited results are not freshly verified. This is the 44-page author version, not the 56-page Acta bytes; no complete edition collation, new erratum or full-paper reading is claimed.

Ownership screening found **ColemanPowerSeries:L1/derivation-determinant-unit** already plans the general matrix-unit Jacobi formula with exactly these commutative-ring/native-derivation hypotheses. Its whole node and proof outline were read. It is imported, not duplicated or moved, and a fifth supplier request makes that exact dependency explicit. Its trace orientation G⁻¹δG is converted to δG G⁻¹ by the pinned Matrix.trace_mul_comm; multiplying by det(G⁻¹) gives the scalar logarithmic-derivative version. The supplier proof uses existing dual numbers and first-order determinants, not a new Hodge or sheaf input. The row-derivative and row-action helpers below remain separate local alternating-evaluation inputs and do not replan the unit Jacobi theorem.

Pinned Mathlib supplies alternating determinants, row additivity/scalar linearity, duplicate-row vanishing, determinant multiplication/transposition, determinant/scalar homomorphisms and native unit transport. Tau Ceti's Matrix.sum_det_updateRow_mul_row is already built for column weights d_j S_rj; its entire pinned module was read. It is not the general derivation or left row-action identity. CR.1/E1/DD.1/D3 contracts remain unchanged; no sheaf/exterior or common-variation carrier is duplicated.

### Derivation of a determinant by row replacements

Declaration: det_derivation_rows. Node: HodgeStructuresPartII:H.0/determinant-derivation-rows.

For a k-linear derivation δ:R→R and any square matrix S, δ(det S)=Σ_r det(updateRow S r (j↦δ(S_rj))). S need not be invertible.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.

Proof plan:

1. Use the pinned det_apply' permutation formula. Additivity moves δ through the finite sum; Derivation.map_intCast kills each integer-valued permutation sign.
2. Induct over the finite product for each permutation: δ(Π_j S_(σj),j)=Σ_j δ(S_(σj),j) Π_{l≠j} S_(σl),l. The empty product derivative is δ(1)=0. This is an induction using the existing Leibniz rule, not a new generic product carrier.
3. For a fixed permutation, the row-replacement determinant has exactly one differentiated factor, in the column j=σ⁻¹(r). Reindex the finite row sum r=σ(j), then exchange the permutation and column sums. The permutation sign is unchanged.
4. No inverse is introduced. The argument also works for singular matrices, repeated rows and characteristic two; do not prove alternating vanishing by cancelling 2.

Acceptance:

- The 0×0 determinant is 1, whose derivative and empty row sum are zero.
- For S=diag(x,x) over F₂[x], δ(det S)=δ(x²)=0, and the two replacement terms cancel in characteristic two.
- The formula applies to singular matrices; invertibility is added only at the unit Jacobi node.

Prerequisites: mathlib:Derivation.leibniz, mathlib:Derivation.map_intCast, mathlib:Derivation.map_one_eq_zero, mathlib:Matrix.det_apply'.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Trace of infinitesimal left row action

Declaration: sum_det_updateRow_left_mul. Node: HodgeStructuresPartII:H.0/determinant-row-action.

For square matrices A and S over R, Σ_r det(updateRow S r ((A*S)r)) = tr(A) det(S). S is arbitrary, including singular matrices.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.

Proof plan:

1. Expand (A*S)_r=Σ_j A_rj • S_j using the native matrix multiplication finite sum.
2. For each fixed replacement row r, use determinant additivity and scalar linearity in that row to move this sum outside: Σ_j A_rj det(updateRow S r S_j). Finite-sum linearity follows by induction from det_updateRow_add and det_updateRow_smul.
3. If j≠r, the replacement matrix has rows j and r equal, so det_updateRow_eq_zero applies. This native alternating lemma works in characteristic two without dividing by 2.
4. The only surviving term is j=r, with updateRow S r S_r=S. Sum A_rr det(S) over r and identify the diagonal sum with Matrix.trace. In rank zero both sides vanish.

Acceptance:

- For A=diag(a,b) and S=diag(x,y), the sum is (a+b)xy.
- An off-diagonal elementary A has trace zero, and every nonzero candidate replacement term has duplicated rows.
- Do not confuse this statement with Tau Ceti's existing column-weight identity sum_det_updateRow_mul_row, whose replacement entries are d_j S_rj, not (A*S)_rj.

Prerequisites: mathlib:Matrix.det_updateRow_add, mathlib:Matrix.det_updateRow_smul, mathlib:Matrix.det_updateRow_eq_zero, mathlib:Matrix.trace.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Determinant coefficient under coordinate change

Declaration: Connection.determinant_gauge_matrix. Node: HodgeStructuresPartII:H.0/determinant-gauge-matrix.

For the inherited convention s′=Gs and frame F, (det(c.gauge G)).matrix_i,0,0 = tr(A_i) − λ det(G⁻¹) δ_i(det G). The determinant connection coefficient is not generally gauge invariant.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.
- F is the inherited coordinate frame with commuting derivations annihilating λ; c is an arbitrary, not necessarily flat, connection on that frame.

Proof plan:

1. Apply determinant_matrix to c.gauge G, then the inherited gauge_matrix formula A′_i=G A_i G⁻¹−λ(δ_iG)G⁻¹.
2. Move trace through subtraction and scalar multiplication using the existing trace_sub and trace_smul declarations; trace_units_conj reduces the first term to tr(A_i).
3. Import ColemanPowerSeries:L1/derivation-determinant-unit with δ=F.delta i and use the pinned Matrix.trace_mul_comm to match its G⁻¹δG trace orientation. Multiply its identity by det(G⁻¹), using determinant multiplicativity and the matrix-unit inverse law; this logarithmic form converts the trace of the derivative correction into det(G⁻¹)δ_i(det G).
4. Keep the minus sign dictated by s′=Gs, and retain λ rather than rank·λ. For λ=0 the derivative term vanishes; this is the conjugation-only Higgs specialization.

Acceptance:

- For A=0, λ=1 and G=diag(x,1), the new line coefficient is −x⁻¹, not zero.
- For G=diag(x,x⁻¹) the determinant correction vanishes even though the vector connection changes.
- An empty vector bundle induces the unit line: det G=1 and the transformed line coefficient remains zero.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/gauge, ColemanPowerSeries:L1/derivation-determinant-unit, mathlib:Matrix.trace_units_conj, mathlib:Matrix.trace_sub, mathlib:Matrix.trace_smul, mathlib:Matrix.trace_mul_comm.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Determinant connection commutes with gauge transport

Declaration: Connection.determinant_gauge. Node: HodgeStructuresPartII:H.0/determinant-gauge.

Let g=Units.map Matrix.detMonoidHom G∈Rˣ, and let ℓ(g)=Units.map (Matrix.scalar (Fin 1)).toMonoidHom g be the native one-by-one matrix unit. Then (c.gauge G).determinant = c.determinant.gauge ℓ(g), with the same F and λ.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.
- F is the inherited coordinate frame with commuting derivations annihilating λ; c is an arbitrary, not necessarily flat, connection on that frame.

Proof plan:

1. Build g and ℓ(g) only by the existing native monoid homomorphisms and Units.map. Units.coe_map exposes values det G and scalar(det G); inverse values are det(G⁻¹) and scalar(det(G⁻¹)). No new determinant-line carrier or arbitrary choice is introduced.
2. Apply the inherited gauge_matrix formula to the one-by-one determinant connection. Its coefficient is (det G) tr(A_i) det(G⁻¹) − λ δ_i(det G)det(G⁻¹).
3. Use det_mul and the inverse equation to simplify the conjugation scalar product to tr(A_i). Commutativity reorders the derivative factors; determinant-gauge-matrix supplies equality with the left side.
4. Connections are determined by their matrix field. Extensionality over directions and the unique Fin 1 row and column proves equality of coordinate connection objects. Their operator compatibility then follows from the inherited operator definition.
5. This is exact finite-coordinate frame coherence. It does not construct exterior-power sheaves or glue local operators; those remain E1/global-comparison obligations.

Acceptance:

- The transformation uses det G, not tr G, and exactly the existing gauge convention.
- A nonconstant diagonal Laurent gauge reproduces the negative logarithmic derivative term on both sides.
- The rank-zero vector frame maps to the identity one-by-one frame on the unit line.

Prerequisites: HodgeStructuresPartII:H.0/determinant-gauge-matrix, HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/gauge, mathlib:Matrix.det_mul, mathlib:Matrix.detMonoidHom, mathlib:Matrix.scalar, mathlib:Units.map, mathlib:Units.coe_map.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Alternating determinant evaluation intertwines the section operator

Declaration: Connection.determinant_alternating_operator. Node: HodgeStructuresPartII:H.0/determinant-alternating-operator.

Represent an ordered family of sections as the rows of S. For each direction i, Σ_r det(updateRow S r (c.operator i (S r))) = c.determinant.operator i (fun _↦det S) 0 = λδ_i(det S)+tr(A_i)det S. No flatness or invertibility of S is assumed.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.
- F is the inherited coordinate frame with commuting derivations annihilating λ; c is an arbitrary, not necessarily flat, connection on that frame.

Proof plan:

1. Expand each section operator as λδ_i(S_r)+A_i*ᵥS_r. Use determinant linearity in the replaced row to split the derivative and matrix-action sums.
2. Pull λ out of each derivative replacement using det_updateRow_smul. The determinant-derivation-rows identity reduces that sum to λδ_i(det S).
3. For any perturbation matrix H, the sum of single-row replacement determinants Σ_r det(updateRow S r H_r) equals the sum of single-column replacement determinants Σ_j det(updateCol S j (r↦H_rj)). Expand det_apply' on both sides: each permutation term replaces exactly one entry S_(σj),j by H_(σj),j, and the row index is reindexed as r=σ(j). No derivation or invertibility is needed for this finite-sum reindexing.
4. For H_r=A_i*ᵥS_r, entrywise H=S*A_iᵀ, not A_i*S. Convert its replacement-row sum to the preceding replacement-column sum, transpose each determinant, and observe Hᵀ=A_i*Sᵀ. The determinant-row-action node with A_i and Sᵀ now gives tr(A_i)det(Sᵀ)=tr(A_i)det S. This explicitly justifies the column-vector/row-family orientation; duplicate-row vanishing, not cancellation by 2, handles every characteristic.
5. Apply determinant_operator to identify the resulting scalar with the one-by-one line section operator. The empty family evaluates to det(∅)=1 and both sides are zero because δ_i(1)=0.
6. This is the local alternating universal-property test needed by a future top-wedge comparison. It is not yet a connection on a global exterior-power module/sheaf.

Acceptance:

- With S=diag(x,y), λ=1, δ=∂x and A=diag(a,b), both sides equal y+(a+b)xy.
- For an off-diagonal A, the action part is zero on every S, not merely invertible S.
- Rank zero gives the derivative of the unit section, not a zero determinant line.

Prerequisites: HodgeStructuresPartII:H.0/operator, HodgeStructuresPartII:H.0/determinant-coordinate, HodgeStructuresPartII:H.0/determinant-derivation-rows, HodgeStructuresPartII:H.0/determinant-row-action, mathlib:Matrix.det_updateRow_add, mathlib:Matrix.det_updateRow_smul, mathlib:Matrix.det_transpose, mathlib:Matrix.trace_transpose.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Current verification and remaining boundary

The five new signatures use native Matrix, Derivation and Units objects and admitted-declaration bodies. Historical receipt for codex-a71f92’s determinant checkpoint: that full changed file elaborates with zero errors, 123 admitted-declaration warnings and no other warnings; all 48 native examples remain. There is no new definition/construction in this continuation, so all 103 API items and 89 planned definition/construction tests are unchanged. Acceptance examples are independently exercised by 6,303 exact computations over Q/F₂/F₃ Laurent polynomial rings with nonzero square-zero ε, using 720 matrix pairs of ranks 0–3. These are finite model regressions, not Lean proofs. Current validation receipts are recorded in the handoff/packet; the earlier 118-admitted-declaration compilation covers only its preceding exact-file hash.

The affine row-derivative, trace-action and det(G) coherence steps are decomposed as plans, with the generic Jacobi identity imported from its sole owner. E1 must still supply finite locally free exterior/determinant sheaf carriers; this roadmap owes descent of the induced alternating operator through the exterior universal property, top-wedge comparison using the local formula, restriction/pullback/functoriality and gluing. All 35 global signature omissions remain. The unbounded period-lattice/graded-base-ring/Tate and coefficient-equivariance adapters remain gaps. H.1–H.8, including mandatory real Noether–Lefschetz H.8, remain not_read with all routed obligations retained.

Current exact-file Lean SHA-256: 6e90608f1e0748728112b947e7f5f6bf3b1c55398d62235d80cdf7a6300ad290. The existing top-level project supplied the build. A preliminary nested-project invocation failed on the Aesop search path and automatically fetched redundant dependency copies; those were moved to recoverable trash before using the correct existing project. No library build, cache retrieval or Lean language server was run. The roadmap now explicitly imports ColemanPowerSeries:L1 as a layer dependency so the named unpromoted Jacobi declaration cannot disappear from the provisional atlas link projection.

## Symmetric action and ordered augmentation nilpotence

Codex — codex-rtOQ9t, continuation of issue #3371 at b1a65cb0bd7a8cb7325bc1f77087c39bfa124e76. The latest merged handoff supplied detailed mathematical leads; this continuation turns the action/ordered-nilpotence branch into ten canonical nodes. Historical matrix experiments and compilation receipts remain attributed to their workers.

The existing Tau Ceti augmentation generation theorem is imported. The target End(E) remains associative and may be noncommutative; the affine construction descends TensorAlgebra using RingCon, rather than applying the commutative-target symmetric lift. Ordered nilpotence keeps its exact exponent; the characteristic-two example shows why symmetric projection cannot substitute for the ordered tensor map.

Fresh source scope: [Heuer published HTML](https://link.springer.com/article/10.1007/s00222-025-01321-4), Definition 1.2(2) and complete Definition 4.1/Remark 4.2; [Liu–Zhu v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1 full statement/setup and the short full Lemma 2.15 proof. The following proofs are explicit algebraic deductions, not claims of reading the full correspondence proofs. Spectral image algebras and twisting are the PadicHodgeTheoryPartIIPadicSimpson consumer, whose accepted joining brief was read.

### Contraction of an affine twisted field

Declaration: TwistedHiggsBundle.affineContractions. Node: HodgeStructuresPartII:H.0/affine-contractions.

For an A-linear θ:E→E⊗_A Q, construct the A-linear contraction map a_θ:V→End_A(E), a_θ(v)=(E⊗v)θ followed by the right tensor unit equivalence E⊗A≅E. This is the affine section formula of the existing twisted field, not a new Higgs or dual carrier.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Use the native tensor map of id_E and v; compose with the native right tensor unit equivalence and θ.
2. Use native TensorProduct.map_add_right and map_smul_right to prove linearity in the contracting functional, then compose with θ and rid. This actual affine proof works for arbitrary modules.
3. On local finite projective charts, evaluation separates tensor coefficients. Its sheaf/co-evaluation and gluing interface is the E1 supplier, not an assumption that global sections commute with tensor.

Dependencies: mathlib:Module.Dual, mathlib:TensorProduct.map, mathlib:TensorProduct.rid, mathlib:TensorProduct.map_add_right, mathlib:TensorProduct.map_smul_right.

Planning API:

- TwistedHiggsBundle.affineContractions_apply: a_θ(v)(e) is exactly the tensor-map/right-unit formula.
- TwistedHiggsBundle.affineContractions_zero: The zero field gives the zero contraction map.
- TwistedHiggsBundle.affineContractions_add: Contraction of θ+η is a_θ+a_η.

Unit tests:

- TwistedHiggsBundle.affineContractions.test_zero (degenerate): Every contraction of the zero field vanishes.
- TwistedHiggsBundle.affineContractions.test_line (computation): For E=Q=A, θ(e)=e⊗1 and v=id_A, the contraction sends e to e.
- TwistedHiggsBundle.affineContractions.test_zero_dual (computation): The zero functional contracts every field to zero.

Acceptance: For an A-linear θ:E→E⊗_A Q, construct the A-linear contraction map a_θ:V→End_A(E), a_θ(v)=(E⊗v)θ followed by the right tensor unit equivalence E⊗A≅E. This is the affine section formula of the existing twisted field, not a new Higgs or dual carrier.

### Symmetric action on an affine Higgs module

Declaration: TwistedHiggsBundle.affineSymmetricAction. Node: HodgeStructuresPartII:H.0/affine-symmetric-action.

Given an A-linear a:V→End_A(E) with pairwise commuting images, construct the unique A-algebra map α:S→End_A(E) satisfying α(ι(v))=a(v). For a=a_θ on finite locally free charts, this is the affine adapter of the existing integrable twisted Higgs symmetric action.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Lift a through the built TensorAlgebra.lift, whose target is an associative semiring, so End(E) is allowed.
2. For each native TensorAlgebra.SymRel generator, the two images a(v)a(w) and a(w)a(v) agree. RingCon.ringConGen_le therefore places the symmetric congruence in the kernel of the tensor lift.
3. Descend using native RingCon.liftₐ. RingCon.liftₐ_mk and TensorAlgebra.lift_ι_apply give the generator formula.
4. Use native SymmetricAlgebra.induction on scalars, generators, sums and products to prove uniqueness into the associative End(E) target; the zero action is the composite of algebraMapInv with the scalar algebra map. No commutative target instance is imposed. SymmetricAlgebra.lift and algHom_ext cannot be applied directly to End(E) at this pin.

Dependencies: HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorAlgebra.lift, mathlib:TensorAlgebra.SymRel, mathlib:RingCon.ringConGen_le, mathlib:RingCon.liftₐ, mathlib:TensorAlgebra.hom_ext, mathlib:RingCon.Quotient.hom_extₐ, mathlib:SymmetricAlgebra.induction, mathlib:SymmetricAlgebra.algebraMapInv_ι.

Planning API:

- TwistedHiggsBundle.affineSymmetricAction_generator: α(ι(v))=a(v).
- TwistedHiggsBundle.affineSymmetricAction_unique: Any other A-algebra map with the same degree-one contractions equals α.
- TwistedHiggsBundle.affineSymmetricAction_zero: For a=0, α is ε followed by the scalar map A→End(E).

Unit tests:

- TwistedHiggsBundle.affineSymmetricAction.test_zero (degenerate): For the zero field every degree-one generator acts by zero.
- TwistedHiggsBundle.affineSymmetricAction.test_scalar (computation): For E=Q=A and a(id_A)=id_E, the distinguished generator acts as identity, so the action is not nilpotent on a nonzero line.
- TwistedHiggsBundle.affineSymmetricAction.test_rank_zero (degenerate): On the zero module A^(Fin 0), every element of S acts by the zero endomorphism, including its unit.
- TwistedHiggsBundle.affineSymmetricAction.test_noncommuting (non-example): On ℚ² the actual endomorphisms E12 and E21 cannot both be images of degree-one generators under a symmetric-algebra action: their products differ on the first basis vector.

Acceptance: Given an A-linear a:V→End_A(E) with pairwise commuting images, construct the unique A-algebra map α:S→End_A(E) satisfying α(ι(v))=a(v). For a=a_θ on finite locally free charts, this is the affine adapter of the existing integrable twisted Higgs symmetric action.

### Symmetric extension and commuting contractions

Declaration: TwistedHiggsBundle.affineSymmetricAction_iff_commute. Node: HodgeStructuresPartII:H.0/affine-symmetric-commuting.

An A-linear a:V→End_A(E) extends to an A-algebra map from S with generator values a iff a(v)a(w)=a(w)a(v) for every v,w. For a=a_θ and Q finite locally free, the existing exterior-coordinate theorem identifies this condition with θ∧θ=0.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. For the forward implication apply α to ι(v)ι(w)=ι(w)ι(v) in the native commutative symmetric algebra.
2. For the reverse implication use affineSymmetricAction; no commutative ring instance is introduced on End(E).
3. Apply the existing H.0/higgs-commuting exterior basis argument locally; its i<j coefficients work in characteristic two without dividing by 2.

Dependencies: HodgeStructuresPartII:H.0/affine-symmetric-action, HodgeStructuresPartII:H.0/higgs-commuting.

Acceptance: An A-linear a:V→End_A(E) extends to an A-algebra map from S with generator values a iff a(v)a(w)=a(w)a(v) for every v,w. For a=a_θ and Q finite locally free, the existing exterior-coordinate theorem identifies this condition with θ∧θ=0.

### Evaluation of a word of Higgs contractions

Declaration: TwistedHiggsBundle.symmetricAction_word. Node: HodgeStructuresPartII:H.0/symmetric-action-word.

If α(ι(v))=a(v), then for every finite ordered list (v₁,…,v_N), α(ι(v₁)⋯ι(v_N))=a(v₁)⋯a(v_N). The empty word acts as id_E. Endomorphism multiplication is composition, so the rightmost listed contraction applies first.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. The empty list uses α(1)=1 and the actual endomorphism unit.
2. Induct on list length using the algebra map multiplication law and the degree-one formula.
3. If a comes from an integrable field, commuting contractions permit reversal/reordering without changing this product; the ordered tensor-coordinate lemma below does not need that reordering.

Dependencies: HodgeStructuresPartII:H.0/affine-symmetric-action.

Acceptance: If α(ι(v))=a(v), then for every finite ordered list (v₁,…,v_N), α(ι(v₁)⋯ι(v_N))=a(v₁)⋯a(v_N). The empty word acts as id_E. Endomorphism multiplication is composition, so the rightmost listed contraction applies first.

### Morphisms intertwine the symmetric action

Declaration: TwistedHiggsBundle.symmetricAction_morphism. Node: HodgeStructuresPartII:H.0/symmetric-action-morphism.

For contraction maps a:V→End_A(E), b:V→End_A(F) and their generator-preserving actions α,β, an A-linear f:E→F satisfies f∘a(v)=b(v)∘f for every v iff f∘α(s)=β(s)∘f for every s∈S. For finite locally free Q these equalities identify Higgs-horizontal morphisms with intertwining the actual S-actions.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.
- F is another A-module. The action maps on both modules use the same coefficient dual V and the same symmetric algebra S.

Proof plan:

1. An intertwiner of all s intertwines degree-one generators.
2. For the converse, use native symmetric-algebra induction on scalars, generators, sums and products. A-linearity of f handles scalars; composing the two induction equalities handles products.
3. On finite local bases, dual evaluation identifies the generator equalities with (f⊗id_Q)θ_E=θ_F f. Restriction and equality of sheaf maps glue; this is not a new module category carrier.

Dependencies: HodgeStructuresPartII:H.0/affine-contractions, HodgeStructuresPartII:H.0/affine-symmetric-action, mathlib:SymmetricAlgebra.induction, EnhancedDerivedSheaves:E1.

Acceptance: For contraction maps a:V→End_A(E), b:V→End_A(F) and their generator-preserving actions α,β, an A-linear f:E→F satisfies f∘a(v)=b(v)∘f for every v iff f∘α(s)=β(s)∘f for every s∈S. For finite locally free Q these equalities identify Higgs-horizontal morphisms with intertwining the actual S-actions.

### Ordered tensor coefficients detect vanishing

Declaration: TwistedHiggsBundle.iterate_coordinates. Node: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing.

For every N≥0, an O-linear θ:E→E⊗Q with Q finite locally free has θ^[N]=0 iff every ordered word of N dual contractions vanishes, locally on each coefficient trivializing chart. In a basis θ=Σ_i A_i⊗q_i, the coefficient of q_(i₁)⊗⋯⊗q_(i_N) is A_(i₁)⋯A_(i_N); the most recently applied coefficient is the leftmost one. N=0 gives id_E, hence vanishing only for E=0. No integrability is required.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O). E is finite locally free and Q is finite locally free, possibly Ω¹⊗T with T invertible. All maps, tensor powers and algebra objects are sheaves, with restriction-compatible local formulas.
- θ:E→E⊗Q is O-linear. Integrability is required only for the symmetric-action comparison, not for the ordered-coordinate lemma. No characteristic, reducedness, basis or nilpotence condition is built into θ.
- Local finite bases are used on trivializing covers; no tensor of global sections is identified with sections of a sheaf tensor.

Proof plan:

1. Induct over the existing ordered iterate recursion, fixing the associators and the order of the newly inserted coefficient factor.
2. Use the native/local finite tensor basis: its distinct ordered tuples give independent coefficients, with no symmetrization, factorial or exterior projection.
3. Dual basis contractions extract those coefficients. Conversely arbitrary local dual sections are linear combinations of dual basis sections, so multilinearity gives every ordered word.
4. Equality of the maps is local and therefore glues. For N=0 use the tensor unit and identity, rather than imposing a positive bound on this coordinate lemma.

Dependencies: HodgeStructuresPartII:H.0/ordered-iterate, HodgeStructuresPartII:H.0/affine-contractions, EnhancedDerivedSheaves:E1.

Acceptance: For every N≥0, an O-linear θ:E→E⊗Q with Q finite locally free has θ^[N]=0 iff every ordered word of N dual contractions vanishes, locally on each coefficient trivializing chart. In a basis θ=Σ_i A_i⊗q_i, the coefficient of q_(i₁)⊗⋯⊗q_(i_N) is A_(i₁)⋯A_(i_N); the most recently applied coefficient is the leftmost one. N=0 gives id_E, hence vanishing only for E=0. No integrability is required.

### Augmentation powers and contraction words

Declaration: TwistedHiggsBundle.augmentation_pow_iff_words. Node: HodgeStructuresPartII:H.0/augmentation-power-words.

For every integer N≥0 and a generator-preserving action α:S→End_A(E), I^N⊆ker α iff every ordered product a(v₁)⋯a(v_N) is zero for all v₁,…,v_N∈V. Equivalently I^N annihilates E with its actual α-action. The exponent is the same on both sides; set-theoretic support on the zero section supplies no such exponent.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Import the already built TauCeti.SymmetricAlgebra.augmentation_toIdeal_eq_span_range_ι. HopfIdeal.mem_augmentation and the built SymmetricAlgebra.counitAlgHom_eq identify its ideal with ker ε, where ε=algebraMapInv.
2. Induct on N using native Ideal.span_mul_span and ideal power multiplication: I^N is the ideal generated by all products of N degree-one generators. This is a deduction from the existing ideal operations, not a new augmentation or homogeneous grading plan.
3. Use symmetricAction_word and the fact that ker α is an ideal. Containment is equivalent to vanishing on those generators.
4. The zero endomorphism acts by zero on all e, and conversely equality of its evaluations detects a zero endomorphism. For N=0 the ideal is S and the empty endomorphism word is id_E; both vanish precisely for E=0.

Dependencies: HodgeStructuresPartII:H.0/symmetric-action-word, tauceti:TauCeti.SymmetricAlgebra.augmentation_toIdeal_eq_span_range_ι, tauceti:TauCeti.HopfIdeal.mem_augmentation, mathlib:SymmetricAlgebra.counitAlgHom_eq, mathlib:Ideal.span_mul_span.

Acceptance: For every integer N≥0 and a generator-preserving action α:S→End_A(E), I^N⊆ker α iff every ordered product a(v₁)⋯a(v_N) is zero for all v₁,…,v_N∈V. Equivalently I^N annihilates E with its actual α-action. The exponent is the same on both sides; set-theoretic support on the zero section supplies no such exponent.

### Ordered nilpotence equals augmentation annihilation

Declaration: TwistedHiggsBundle.nilpotence_iff_augmentation_power. Node: HodgeStructuresPartII:H.0/ordered-augmentation-nilpotence.

For an integrable twisted Higgs field with Q finite locally free and its actual sheaf algebra action α:Sym_O(Q∨)→End_O(E), and a specified positive N, θ^[N]=0 iff (ker ε)^N acts by zero on E. The same N occurs on both sides in every characteristic and over nonreduced bases. This also identifies a specified ordered nilpotence bound with factorization of α through Sym_O(Q∨)/(ker ε)^N.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O). E is finite locally free and Q is finite locally free, possibly Ω¹⊗T with T invertible. All maps, tensor powers and algebra objects are sheaves, with restriction-compatible local formulas.
- θ:E→E⊗Q is O-linear. Integrability is required only for the symmetric-action comparison, not for the ordered-coordinate lemma. No characteristic, reducedness, basis or nilpotence condition is built into θ.
- Local finite bases are used on trivializing covers; no tensor of global sections is identified with sections of a sheaf tensor.
- θ∧θ=0 and N>0. ε is the actual degree-zero augmentation of the symmetric sheaf algebra; annihilation is an equality of action maps, not an arbitrary stored predicate.

Proof plan:

1. Use symmetric-action and affineSymmetricAction to identify the local contraction action, retaining the actual coefficient sheaf Q and any Tate character.
2. On local finite charts apply ordered-coordinate-vanishing and augmentation-power-words. Integrability permits the listed contractions to commute; no projection onto Sym^N(Q) occurs.
3. Check equality and ideal-power annihilation locally. Restriction compatibility of the supplied sheaf algebra and module action glues the equivalence with the same N.
4. Apply the native quotient-action construction on affine charts and the E1 quotient/sheaf coherence for global factorization. The sheaf-level carrier and gluing remain named native omissions until supplied.

Dependencies: HodgeStructuresPartII:H.0/symmetric-action, HodgeStructuresPartII:H.0/ordered-coordinate-vanishing, HodgeStructuresPartII:H.0/augmentation-power-words, HodgeStructuresPartII:H.0/truncated-symmetric-action, EnhancedDerivedSheaves:E1.

Acceptance: For an integrable twisted Higgs field with Q finite locally free and its actual sheaf algebra action α:Sym_O(Q∨)→End_O(E), and a specified positive N, θ^[N]=0 iff (ker ε)^N acts by zero on E. The same N occurs on both sides in every characteristic and over nonreduced bases. This also identifies a specified ordered nilpotence bound with factorization of α through Sym_O(Q∨)/(ker ε)^N.

### Action through a fixed augmentation quotient

Declaration: TwistedHiggsBundle.truncatedSymmetricAction. Node: HodgeStructuresPartII:H.0/truncated-symmetric-action.

Given α:S→End_A(E), N≥0 and I^N⊆ker α, construct the unique A-algebra map β:S/I^N→End_A(E) satisfying β([s])=α(s). Such a generator-preserving factorization exists iff I^N⊆ker α. No radical quotient or unspecified larger nilpotence bound replaces I^N.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Use the built Ideal.Quotient.liftₐ with the actual ideal I^N and the actual endomorphism algebra. Its associative semiring target is sufficient.
2. The containment supplies vanishing on I^N. The native quotient lift computes definitionally on representatives, giving the representative formula.
3. Use Ideal.Quotient.mk_surjective for uniqueness; any competing factorization kills I^N by Ideal.Quotient.eq_zero_iff_mem. These actual affine proofs do not require augmentation_pow_iff_words.
4. For the zero module the bound N=0 is permitted because the target algebra is the zero algebra; positive bound conventions remain in IterateNul, not in this quotient construction.

Dependencies: HodgeStructuresPartII:H.0/augmentation-power-words, mathlib:Ideal.Quotient.liftₐ, mathlib:Ideal.Quotient.liftₐ_comp, mathlib:Ideal.Quotient.mk_surjective, mathlib:Ideal.Quotient.eq_zero_iff_mem, mathlib:Ideal.pow_mem_pow.

Planning API:

- TwistedHiggsBundle.truncatedSymmetricAction_mk: β([s])=α(s).
- TwistedHiggsBundle.truncatedSymmetricAction_unique: The representative formula uniquely determines β.
- TwistedHiggsBundle.truncatedSymmetricAction_exists_iff: A factorization through this exact quotient exists iff I^N⊆ker α.

Unit tests:

- TwistedHiggsBundle.truncatedSymmetricAction.test_generator (computation): When N=1, each degree-one generator acts by zero.
- TwistedHiggsBundle.truncatedSymmetricAction.test_scalar_rejected (non-example): On a nonzero Q-line with generator acting by identity, no positive augmentation power is killed.
- TwistedHiggsBundle.truncatedSymmetricAction.test_rank_zero (degenerate): The action on A^(Fin 0) kills every augmentation power, including I^0=S.
- TwistedHiggsBundle.truncatedSymmetricAction.test_square_zero (computation): For Q=A=Q, a(v)=v(1)X with X nonzero and X²=0, the action kills I² but not I. A nonzero E12 gives this example.

Acceptance: Given α:S→End_A(E), N≥0 and I^N⊆ker α, construct the unique A-algebra map β:S/I^N→End_A(E) satisfying β([s])=α(s). Such a generator-preserving factorization exists iff I^N⊆ker α. No radical quotient or unspecified larger nilpotence bound replaces I^N.

### Symmetric projection loses ordered nilpotence

Declaration: TwistedHiggsBundle.symmetricProjection_charTwo_counterexample. Node: HodgeStructuresPartII:H.0/symmetric-projection-counterexample.

Over k=F₂, take E=k[x,y]/(x²,y²), Q=kq₀⊕kq₁, and θ(e)=xe⊗q₀+ye⊗q₁. The two multiplication contractions commute and square to zero, but their product xy is nonzero. θ^[2](1)=xy⊗(q₀⊗q₁+q₁⊗q₀) is nonzero, whereas its image in E⊗Sym²(Q) is zero. In fact the projected second iterate is the zero map. The action has I²E≠0 and I³E=0. Thus symmetrized vanishing cannot replace ordered vanishing with the same exponent.

Hypotheses:

- The ground field is F₂. E has the actual basis (1,x,y,xy), with x²=y²=0; Q has its actual two-element basis. No division by 2 is available.

Proof plan:

1. Multiplication by x and y on the displayed four-dimensional module gives commuting matrices A,B with A²=B²=0 and AB=BA≠0.
2. The ordered degree-two tensor basis distinguishes q₀⊗q₁ and q₁⊗q₀, so their sum is nonzero. A dual tensor coefficient extracts xy from θ^[2](1).
3. In the symmetric quotient the two basis words agree, and 2=0. All diagonal coefficients also vanish, hence the projected map is zero.
4. All words of length three contain x² or y²; the mixed degree-two word acts nontrivially. Apply augmentation-power-words to get the exact bounds. The analogous finite regression over F₃ uses x³=y³=0: projected degree three vanishes while ordered degree three does not, and the ordered bound is five.

Dependencies: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing, HodgeStructuresPartII:H.0/augmentation-power-words, mathlib:SymmetricAlgebra.algHom.

Acceptance: Over k=F₂, take E=k[x,y]/(x²,y²), Q=kq₀⊕kq₁, and θ(e)=xe⊗q₀+ye⊗q₁. The two multiplication contractions commute and square to zero, but their product xy is nonzero. θ^[2](1)=xy⊗(q₀⊗q₁+q₁⊗q₀) is nonzero, whereas its image in E⊗Sym²(Q) is zero. In fact the projected second iterate is the zero map. The action has I²E≠0 and I³E=0. Thus symmetrized vanishing cannot replace ordered vanishing with the same exponent.

### Exact continuation boundaries

The ordered-coordinate statement promotes the existing iterate_coordinates API to a declaration node with no duplicate API or carrier. Its existing omission entry is reused. The affine action morphism signature is present, while its sheaf horizontal-morphism interpretation still requires E1 finite-dual and gluing interfaces. The global ordered-augmentation equivalence has a precise omission entry. The previous 35 global objects, 65 APIs and 54 tests remain omitted; no affine construction discharges them.

The remaining field/reduced-ring rank bound must distinguish geometric-prime fibres from rigid classical points; reducedness is essential. The nonreduced rank-one multiplication-by-2 example over Z/4 is nonzero and square-zero. Nilpotence filtrations allow ordinary submodules, not necessarily subbundles. The predecessor image-algebra/base-change and nonsplit-kernel arguments remain precise resume leads in the handoff. H.8 real Noether–Lefschetz remains mandatory.

### Historical codex-rtOQ9t validation receipt

The entire expanded Mathlib-only suggested file elaborates at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean v4.34.0-rc2: zero errors, 151 admitted-declaration warnings, no other warnings, and 58 native examples. This validates signatures only. The Tau Ceti baseline augmentation theorem was read and cited, not imported into this Mathlib-only file or certified by a Tau Ceti build. Existing build/artifacts were reused; no project/cache/library setup or Lean server.

Native SHA-256: 92d380f0b3fd13af0187b13920525b4e2ccc957872e27cf41d16eddf7a810f24. Compiler-output SHA-256: b625bfec8c11ee32b9154fffad4ea7512a4a138d813bb894d3efda740fc89b51.

Independent standard-library finite algebra checks passed 11,378 assertions. All 6,817 pairs of 2×2 matrices over F₂/F₃ were screened; the 1,033 commuting pairs compare all ordered words and commutative monomials in degrees 0–4. The four- and nine-dimensional truncated polynomial modules verify projected degree-p vanishing and ordered degree-p nonvanishing, with ordered bounds 3 and 5. These finite computations do not prove the general ideal/sheaf equivalences or any correspondence. Script SHA-256: 5dfc681b5f0b4b707166a8a24d5d548ad7f63aa3d515af49fdbfc182880364cd.

The indexed packet checker reports zero errors and warnings. Actual in-memory atlas assembly, with normal retirements/restructuring/link overlays and replaced-decomposition trimming, retains 70 declarations and six planets, with no own pending/skipped links. Its complete stage graph has 3,056 vertices and 8,663 edges; this packet’s declaration graph has 70 vertices and 137 edges; stage plus this packet’s recursively used declarations has 3,121 vertices and 8,914 edges. All three are acyclic. All 19 named stage prerequisite pairs are reachable, which does not assert they are all direct displayed edges. The single recursively used external declaration is ColemanPowerSeries:L1/derivation-determinant-unit. The seven unrelated skipped links exactly match unmodified baseline assembly; unrelated declaration graphs were not audited.

All 60 inherited node statements, 103 APIs, 89 tests and 149 routed obligations remain. Fifty-nine inherited node objects are unchanged; the existing symmetric-action object gains only the precise associative-target proof step and dependency. No source issue, restructuring proposal or stage status is removed. H.0 remains partial; H.1–H.8 remain not_read.

### Historical affine proof continuation — Codex codex-J6LwjP

This checkpoint supplies actual bodies for fifteen existing affine declarations. The contraction map is the composite of θ, the tensor map id⊗v and the right unit equivalence; native tensor-map add/scalar laws prove its linearity. The symmetric action lifts through the tensor algebra and descends through the existing symmetric congruence using the commuting hypothesis. Its generator equation is the native tensor-lift computation. Symmetric-algebra induction proves uniqueness into the associative endomorphism algebra, and comparison with the scalar augmentation proves the zero-action law. No commutative target instance is assumed.

The extension-exists iff commute statement, evaluation on ordered words, and morphism-intertwiner equivalence have actual affine proofs. The intertwiner proof uses induction on scalars, generators, sums and products, retaining composition order. These are the affine parts of Heuer Definition 4.1; the sheaf restriction/finite-dual/gluing interpretation remains a supplier obligation. Fresh selected source reading covered Definition 1.2(2), the complete Definition 4.1 and Remark 4.2 in the [publisher HTML](https://link.springer.com/article/10.1007/s00222-025-01321-4). No further source correspondence theorem is certified here.

The exact I^N quotient action, representative computation, uniqueness and existence iff containment use the already built ideal quotient lift. They have actual bodies independent of the still-admitted augmentation-word criterion. The quotient-zero criterion proves the necessary containment. Surjectivity of representatives proves uniqueness. Bound N=0 is accepted for the zero module. The scalar rejection example uses membership of generator^N in I^N and its image 1, and its proof even works for N=0. The positive-N test statement is retained.

Nine existing examples now have actual proofs: three contraction tests, three symmetric-action tests, and the generator/scalar-rejection/zero-module quotient tests. The new TwistedHiggsBundle.affineSymmetricAction.test_noncommuting constructs E12 and E21 as actual linear endomorphisms of ℚ². Any symmetric action sending generators to them would make their products equal; evaluating on the first basis vector gives 1=0. This tests the essential commuting hypothesis in an endomorphism algebra that is actually noncommutative. The square-zero augmentation example and characteristic-two ordered/projection witnesses remain admitted.

Named affine proof bodies: TwistedHiggsBundle.affineContractions, TwistedHiggsBundle.affineContractions_apply, TwistedHiggsBundle.affineContractions_zero, TwistedHiggsBundle.affineContractions_add, TwistedHiggsBundle.affineSymmetricAction, TwistedHiggsBundle.affineSymmetricAction_generator, TwistedHiggsBundle.affineSymmetricAction_unique, TwistedHiggsBundle.affineSymmetricAction_zero, TwistedHiggsBundle.affineSymmetricAction_iff_commute, TwistedHiggsBundle.symmetricAction_word, TwistedHiggsBundle.symmetricAction_morphism, TwistedHiggsBundle.truncatedSymmetricAction, TwistedHiggsBundle.truncatedSymmetricAction_mk, TwistedHiggsBundle.truncatedSymmetricAction_unique, TwistedHiggsBundle.truncatedSymmetricAction_exists_iff.

The full exact Mathlib-only suggested file elaborates with Lean v4.34.0-rc2: zero errors, 127 admitted-declaration warnings, no other warnings, 59 native examples, 3.55 seconds. Source SHA-256: af7d537a0dc75975f2081fbd6b143a70b7d63a81b92e032511fd9a20d0ae4b83. Compiler-output SHA-256: 9458fef8f76f8955e974846509c23124dd24da5b252d934fc6a0494df7968a3e. A separate focused file contains these fifteen matching declarations and ten proved examples and reports zero errors and warnings. Printing axioms for all fifteen names reports only propext, Classical.choice and Quot.sound, with no admitted-proof axiom. Focused source SHA-256: 4f92141c3c91821a4ce6a20e2a177506ac44554b3a42343e47cc7b0aafeb92be; axiom-output SHA-256: e44351794e0b77d4828e013fc26647c405fe51313db9ae126ee6138ccbf91253. Existing pinned artifacts were reused with one Lean process at a time and 74 GB available before each final invocation; no library/cache/project setup or Lean server.

The indexed packet check reports zero errors and warnings: 70 nodes, 112 API items, 100 planned definition/construction tests, six planets, 69 named baseline citations, eleven gaps and five requests. Six newly cited built statements were read with ambient hypotheses and matched to the pinned index: tensor-map add/scalar laws, augmentation on generators, ideal-quotient representatives and zero criterion, and ideal-power membership. No generic carrier is replanned.

Current actual read-only atlas assembly uses the normal retirement/restructuring/link overlays and replaced-decomposition trimming. The stage graph has 3022 vertices and 8663 edges; the own declaration graph has 70 vertices and 137 edges; stages plus the 71 reachable declarations and explicit supplier-request edges have 3087 vertices and 8914 edges. All three are acyclic. All 21 computed stage prerequisite pairs, including request/stage dependencies, reach their consumers; none is asserted to be a direct displayed edge. The only external declaration is the existing Coleman Jacobi supplier. No own pending/skipped links; unrelated skips and all stage edges match the unchanged 70-node packet overlay. Projection-script SHA-256: 14985a897bb969631f728f35ee9a1bc67280f0245e6034effe465300eec58d41.

All 70 prior node IDs, mathematical statements, hypotheses, APIs, acceptance and source records survive; all 99 prior tests remain and one test is added. Sixty-seven whole node objects are unchanged; only the contraction, symmetric-action and quotient-action proof/dependency/test outlines change. Requests, gaps, source issues, restructuring and all 149 routed obligations remain. Earlier finite-model/PDF receipts are historical and were not rerun here. All nodes remain unchecked; H.0 partial and H.1–H.8 not_read; zero stages closed. Actual affine proofs do not discharge the augmentation-word proof, ordered coefficient theorem, sheaf carrier/gluing omissions, determinant descent, rank bounds or later source decomposition.


## Augmentation generator continuation

The new TwistedHiggsBundle.augmentation_pow_generators identifies I^N with the ideal span of length-N degree-one words for every N≥0. Its source is the actual degree-zero augmentation of Sym_A(Q∨). The already built Tau Ceti augmentation ideal/span equality and HopfIdeal.augmentation_toIdeal identify I; the built Submodule.span_pow and Set.mem_pow then give the word generators. This replaces the handoff's proposed generic private induction. No general span-power, augmentation or symmetric algebra object is planned again.

The existing same-exponent word criterion uses this adapter and Ideal.span_le. Its statement and hypotheses are unchanged. End(E) remains an associative target. At N=0 the empty word is identity and I⁰ is the whole source; annihilation means E is the zero module. At N=1 the generator formula recovers the built augmentation span. The two new lemma boundary tests record these cases.

The new TwistedHiggsBundle.affineSymmetricAction.test_ambient_ideal regression uses X=E12 and Y=E21 on ℚ². The rank-one action with u↦X has I²⊆ker α. Yet YX is a nonzero idempotent in the ambient left ideal span{X}, so that ideal cannot be nilpotent. Keep the augmentation ideal and action kernel in Sym_A(Q∨); the commutative image algebra is a separate possible formulation. This tests a potential implementation error and records no source erratum.

TwistedHiggsBundle.augmentation_pow_generators.test_zero checks that the empty word generates the whole source ideal at N=0. TwistedHiggsBundle.augmentation_pow_generators.test_one recovers the degree-one generator span of ker ε. The generator lemma assumes only a commutative coefficient ring and modules, with V=Hom_A(Q,A); it adds no freeness, finite-generation, reducedness or characteristic restriction.

Fresh primary reading was Heuer25 Definition 1.2(2), all of Definition 4.1 and Remark 4.2 in the publisher HTML, and Liu–Zhu Lemma 2.15 with its complete short proof. Spectral/coherent-image and twisting results in Heuer's consumer are not absorbed into this roadmap. All later source obligations, sheaf gluing, rank bounds and filtered-period interfaces remain open.

Under PROTOCOL section 13, the current suggested bodies are admitted sketches. The fifteen actual affine declarations and ten proved examples remain available at immutable commit 9a36f4d1d6743c0202f12020c0df603400149faa; their preceding exact-file receipts remain historical. A separate Mathlib-only experiment proves the generic span/word/kernel implication from an explicit ideal-generation equality, without admissions. That experiment is evidence for the algebraic route, not a compiled proof of the Tau Ceti augmentation adapter or of a global sheaf statement. Current exact-file and projection receipts appear in the packet and handoff.

Current exact admitted sketch receipt: 0 errors, 156 admitted-declaration warnings only, 62 examples; source SHA-256 e7c84108653b8d910a49fb6aebe50ca9880572f206b2e0348ba36e625665af4b. Compiler-output SHA-256 2c8ff8fa3cfb9ca4ba9deef0bc48a0fdb6436a483149be1da355a8281715482f. Separate conditional proof: 0 errors/warnings, both axiom audits contain only propext, Classical.choice and Quot.sound. The finite script freshly reruns all 88 commuting F₂ pairs at N=0,…,4 (440 cases) and its ambient-ideal, characteristic-two and nonreduced fixtures. The actual assembler has an acyclic 3,022-vertex/8,663-edge stage graph; the own declaration graph is 71/138; the reachable declaration/request graph is 3,088/8,916. All 21 computed stage prerequisite pairs are reachable, with unchanged stage edges and no own skipped links. Sixty-eight of the seventy inherited node objects are unchanged; all mathematical statements and prior tests survive. All 71 nodes remain unchecked; H.0 partial and H.1–H.8 not_read.

## Ordered second iterates on affine coefficient charts

For a finite basis (q_i) of Q, contraction reconstructs θ(e)=Σ_i a_θ(q_i∨)(e)⊗q_i. This requires no basis or reducedness on E. Apply θ a second time to the E-factor and use the native associator to obtain E⊗(Q⊗Q). The new coefficient occupies the left slot, so contraction by (v,w) is a_θ(v)∘a_θ(w), with w applied first. This formula holds for noncommuting contractions.

Reconstructing both tensor factors proves that the second iterate vanishes exactly when every ordered product of two coefficient contractions vanishes. Exterior integrability and commuting contractions are not hypotheses. This supplies the N=2 affine step of the existing all-N coordinate theorem; it retains the required all-N induction, restriction/change-of-chart and sheaf gluing. No tensor of global section modules replaces a sheaf tensor.

Declaration: HodgeStructuresPartII:H.0/affine-contractions-reconstruction. lemma. Native name: TwistedHiggsBundle.affineContractions_reconstruct.

Statement: For a finite basis b=(q_i) of Q and every e in E, θ(e)=Σ_i a_θ(b_i∨)(e)⊗q_i in the actual E⊗_R Q. The coordinate dual is b.coord i. Only Q has a finite basis; E is an arbitrary module.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-contractions, mathlib:Module.Basis.coord, mathlib:Module.Basis.sum_repr, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.tmul_sum.

Proof: Tensor induction reduces reconstruction to zero, pure tensors and sums. For e⊗q, contracting b.coord i gives the corresponding scalar times e. Tensor balancing and the native finite basis reconstruction sum give e⊗q. Apply this identity to θ(e); no generic basis or tensor carrier is defined.

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

Declaration: HodgeStructuresPartII:H.0/affine-ordered-square. construction. Native name: TwistedHiggsBundle.affineOrderedSquare.

Statement: Construct θ^[2]:E→E⊗(Q⊗Q) as assoc∘(θ⊗id_Q)∘θ. The outer θ creates the left coefficient factor; no exterior or symmetric quotient is taken.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.map, mathlib:TensorProduct.assoc.

Proof: Compose the existing linear tensor map of θ and id_Q with θ, then apply the existing associator. The codomain retains both ordered coefficient slots even for noncommuting contractions.

Use: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing. Supplies the exact native N=2 affine specialization before the general iteration and sheaf assembly.

Use: HodgeStructuresPartII:H.0/affine-ordered-square-vanishing. Tests ordered nilpotence by actual products of two contractions.

API: TwistedHiggsBundle.affineOrderedSquare_apply (projection). The value on e is the native associator applied to (θ⊗id_Q)(θ(e)).

API: TwistedHiggsBundle.affineOrderedSquare_zero (simp). The zero field has zero second iterate.

API: TwistedHiggsBundle.affineOrderedSquare_contraction (compatibility). Contraction of the two slots by v,w equals a_θ(v)∘a_θ(w), with w applied first.

Test: TwistedHiggsBundle.affineOrderedSquare.test_zero (degenerate). For any modules E,Q, the second iterate of the zero field is zero.

Test: TwistedHiggsBundle.affineOrderedSquare.test_line_nonzero (non-example). For any nontrivial R, E=Q=R and θ(e)=e⊗1, the ordered second iterate is nonzero. A rank-one field cannot be declared square-nilpotent from an exterior-square condition.

Test: TwistedHiggsBundle.affineOrderedSquare.test_empty_coefficients (degenerate). If Q is subsingleton, every θ has zero second iterate.

Test: TwistedHiggsBundle.affineOrderedSquare.test_order (computation). Over ℚ, E=Q=ℚ², let X=E12,Y=E21 and θ(e)=Xe⊗q0+Ye⊗q1. Contraction of θ^[2] by the coordinate pair (q0∨,q1∨) is XY=E11 and differs from the reverse YX=E22. No integrability is assumed.

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

Declaration: HodgeStructuresPartII:H.0/affine-ordered-square-contraction. lemma. Native name: TwistedHiggsBundle.affineOrderedSquare_contraction.

Statement: For arbitrary dual functionals v,w on Q, contract θ^[2] by the functional lid∘(v⊗w):Q⊗Q→R. The resulting endomorphism is a_θ(v)·a_θ(w), with the right factor applied first. No finite basis or integrability is needed.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-square, HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.assoc_tmul, mathlib:TensorProduct.rid.

Proof: On each outer pure tensor e⊗q, use a second tensor induction on θ(e). The native associator and tensor map identify the result with w(q) times the v-contraction of θ(e); commuting coefficient scalars uses the commutative base only. Additivity finishes both inductions. Apply the result to θ(e) and use the actual composition multiplication in End_R(E).

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

Declaration: HodgeStructuresPartII:H.0/affine-ordered-square-vanishing. lemma. Native name: TwistedHiggsBundle.affineOrderedSquare_eq_zero_iff.

Statement: For a finite basis b of Q, θ^[2]=0 iff a_θ(b_i∨)·a_θ(b_j∨)=0 for every ordered pair i,j. No integrability, field, reducedness or finite basis on E is needed. Distinct ordered pairs remain distinct, including in characteristic two.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-square, HodgeStructuresPartII:H.0/affine-ordered-square-contraction, HodgeStructuresPartII:H.0/affine-contractions-reconstruction, mathlib:TensorProduct.sum_tmul, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.assoc_tmul.

Proof: If θ^[2] vanishes, contract the two slots and use the exact two-slot formula. Conversely reconstruct θ(e) and then θ(a_θ(b_j∨)e) in the finite coefficient basis. Every summand of the associated ordered double tensor has coefficient a_θ(b_i∨)a_θ(b_j∨)e. The hypothesized endomorphism equality kills every coefficient, so both finite sums vanish. This is an actual algebraic N=2 proof; general N and sheaf gluing are separate obligations.

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

The existing HodgeStructuresPartII:H.0/ordered-coordinate-vanishing now imports HodgeStructuresPartII:H.0/affine-ordered-square-vanishing and HodgeStructuresPartII:H.0/affine-contractions-reconstruction for its affine N=2 step. That predecessor receipt stopped at N=2; the current all-N affine continuation follows below. Its sheaf hypotheses and statement remain unchanged.

Native baseline statements:

- mathlib:Module.Basis.sum_repr — A vector in a finite basis is the finite sum of its coordinates times basis vectors. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.coord — Existing linear dual coordinate of a chosen basis. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:TensorProduct.induction_on — Existing zero/pure-tensor/add induction for the actual tensor product. Source: Mathlib/LinearAlgebra/TensorProduct/Defs.lean.
- mathlib:TensorProduct.assoc — Existing linear associator from (E tensor Q) tensor Q to E tensor (Q tensor Q). Source: Mathlib/LinearAlgebra/TensorProduct/Associator.lean.
- mathlib:TensorProduct.assoc_tmul — The actual associator sends (e tensor q) tensor r to e tensor (q tensor r). Source: Mathlib/LinearAlgebra/TensorProduct/Associator.lean.
- mathlib:TensorProduct.map_tmul — Native tensor map applies its two component maps to a pure tensor. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean.
- mathlib:TensorProduct.tmul_sum — Tensoring a fixed first factor distributes over a finite sum in the second factor. Source: Mathlib/LinearAlgebra/TensorProduct/Defs.lean.
- mathlib:TensorProduct.sum_tmul — Tensoring a finite sum in the first factor distributes over a fixed second factor. Source: Mathlib/LinearAlgebra/TensorProduct/Defs.lean.

The source-augmentation generator adapter remains HodgeStructuresPartII:H.0/augmentation-power-generators: the actual source ideal power is generated by words of exactly that length, including the empty word at degree zero. This is separate from the new tensor-square chart calculation.

## Historical validation of the ordered-square contracts

The [separate native proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/a31c7908e2ba7455d333f1f4e25e07a6563f692b/research/blueprint/suggested/HodgeStructuresPartII.lean) proves finite-coefficient reconstruction, the actual second-iterate construction, its projection/zero/contraction formulas and the exact finite-basis vanishing criterion. All four new examples are proved, including the E12/E21 ordering test. A narrow extraction passes with zero errors or warnings and seven kernel axiom audits without admission dependencies. It reuses the historical native contraction proof; it does not prove general-N or global sheaf statements.

Under PROTOCOL section13 the submitted new signatures/examples retain admitted bodies. The entire suggested file, which imports only Mathlib, passes at the exact pin with 66 examples, zero errors, 166 admission warnings and no other warnings. The 35 inherited global omission entries remain; compilation does not supply those signatures. No TauCeti build, library cache or language server was created.

The packet has 75 nodes, 115 API items, 107 total tests (105 for definitions/constructions), 82 baseline references and six planets. All 71 predecessor statements and 70 complete predecessor node objects are preserved. The actual stage graph and its transitive stage/declaration graph are acyclic, all 21 required stage pairs are reachable, and this packet has no skipped/pending links. H.0 remains partial, H.1–H.8 not_read; eleven gaps and five requests remain.

## Arbitrary-N native affine continuation

This extends the exact native second-iterate chart proof using Mathlib TensorPower, its zero-degree unit, native dual pairing and existing finite tensor basis. The tensor-power carrier, basis and associators are imported, not replanned. No global module-sheaf object is replaced by its sections. All75 predecessor statements are retained; only the existing global ordered-coordinate proof/input list is refined.

For a tuple of duals, contractions form a list product in the actual potentially noncommutative End algebra. The leftmost dual is the newest coefficient, so a two-letter word is A_i A_j with A_j acting first. The empty product is the identity. The scalar products inside the dual pairing commute because the base ring is commutative; no endomorphism commutativity is inferred.

### Prepend one coefficient factor

Node: HodgeStructuresPartII:H.0/affine-ordered-step. construction. Declaration: TwistedHiggsBundle.affineOrderedStep.

Statement: For θ:E→E⊗Q and n≥0 construct S_θ,n:E⊗Q^⊗n→E⊗Q^⊗(n+1) by θ⊗id, the associator, the native singleton tensor equivalence Q≅Q^⊗1, native multiplication of tensor powers and the cast 1+n=n+1. The new Q factor is inserted on the left.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: mathlib:TensorPower, mathlib:TensorPower.mulEquiv, mathlib:TensorPower.cast, mathlib:PiTensorProduct.subsingletonEquiv, mathlib:TensorProduct.congr, mathlib:TensorProduct.assoc, mathlib:TensorProduct.map.

Proof: Compose the existing tensor maps and linear equivalences; the singleton/multiplication/cast equivalences are internal data, not new carriers. On a pure input e⊗(q₁⊗⋯⊗qₙ), expand θ(e) and insert its Q factor before q₁. No symmetric or exterior quotient is used.

Use: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing — Supplies the native arbitrary-N affine chart calculation, with the empty word and tensor unit retained; restriction and local equality detection remain separate supplier obligations.

Use: LZ17 Theorem2.1(i); Lemma2.15 — Provides an ordered-coefficient interface for the nilpotent Higgs conclusion. No geometric nilpotence or source correspondence proof follows from this algebraic calculation alone.

API: TwistedHiggsBundle.affineOrderedStep_zero (simp). S_0,n=0 for every n.

API: TwistedHiggsBundle.affineOrderedStep_add (compatibility). S_(θ+η),n=S_θ,n+S_η,n.

API: TwistedHiggsBundle.affineOrderedStep_contraction (compatibility). For any η:E→E⊗Q^⊗n, contract S_θ,n∘η by (v,vs) to obtain a_θ(v) times the vs contraction of η, in this order.

Test: TwistedHiggsBundle.affineOrderedStep.test_zero (degenerate). The zero field gives a zero successor step at every order.

Test: TwistedHiggsBundle.affineOrderedStep.test_empty_coefficients (degenerate). If Q is subsingleton then S_θ,n=0 for every θ and n, including n=0.

Test: TwistedHiggsBundle.affineOrderedStep.test_scalar_nonzero (non-example). For any nontrivial R, E=Q=R and θ(e)=e⊗1, every S_θ,n is nonzero. A unit field cannot acquire nilpotence at a positive order.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Native ordered Higgs iterates

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate. construction. Declaration: TwistedHiggsBundle.affineOrderedIterate.

Statement: For every n≥0 construct θ^[n]:E→E⊗Q^⊗n recursively: θ^[0] is the inverse right tensor unit followed by the native identification R≅Q^⊗0; θ^[n+1]=S_θ,n∘θ^[n]. This definition uses no integrability or finite basis.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step, mathlib:TensorPower.algebraMap₀, mathlib:TensorProduct.rid, mathlib:TensorProduct.map.

Proof: Use primitive recursion into the native tensor-power codomains, with the actual degree-zero unit rather than a zero map. Apply the successor step at each degree; its new factor is always the leftmost coefficient.

Use: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing — Supplies the native arbitrary-N affine chart calculation, with the empty word and tensor unit retained; restriction and local equality detection remain separate supplier obligations.

Use: LZ17 Theorem2.1(i); Lemma2.15 — Provides an ordered-coefficient interface for the nilpotent Higgs conclusion. No geometric nilpotence or source correspondence proof follows from this algebraic calculation alone.

API: TwistedHiggsBundle.affineOrderedIterate_zero (projection). θ^[0](e)=e⊗1₀ in the actual degree-zero tensor unit.

API: TwistedHiggsBundle.affineOrderedIterate_succ (projection). θ^[n+1]=S_θ,n∘θ^[n].

API: TwistedHiggsBundle.affineOrderedIterate_contraction (compatibility). Contraction by an ordered n-tuple of duals equals the ordered product of the n contractions of θ; at n=0 the product is id_E.

API: TwistedHiggsBundle.affineOrderedIterate_zero_field (simp). The zero field has zero iterate at every positive order. Order zero remains the tensor-unit identity.

Test: TwistedHiggsBundle.affineOrderedIterate.test_unit_boundary (boundary). For any θ, contraction of θ^[0] by the empty tensor pairing is id_E, including E=0.

Test: TwistedHiggsBundle.affineOrderedIterate.test_zero (degenerate). The zero field vanishes at all positive orders without imposing any assumption on E,Q.

Test: TwistedHiggsBundle.affineOrderedIterate.test_scalar_nonzero (non-example). For any nontrivial R, the scalar unit field on E=Q=R has nonzero θ^[n] for every n≥0.

Test: TwistedHiggsBundle.affineOrderedIterate.test_nonreduced_nilpotent (boundary). Over Z/4, θ=2 times the scalar unit field is nonzero but θ^[2]=0. This rules out unconditional rank-one or reduced-base shortcuts.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Evaluate an affine contraction

Node: HodgeStructuresPartII:H.0/affine-contractions-apply. lemma. Declaration: TwistedHiggsBundle.affineContractions_apply.

Statement: For any dual v and e∈E, a_θ(v)(e)=rid((id_E⊗v)(θ(e))).

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.rid, mathlib:TensorProduct.map.

Proof: Unfold the contraction linear map and its compositions. This is an existing API item promoted because the arbitrary-N unit calculation consumes it.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Contractions of the zero field

Node: HodgeStructuresPartII:H.0/affine-contractions-zero. lemma. Declaration: TwistedHiggsBundle.affineContractions_zero.

Statement: For any E,Q the contraction linear map of the zero field is zero.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-contractions.

Proof: Evaluate the native compositions at each functional and vector. Promote the existing API to discharge the forward coefficient-vanishing implication.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Degree-zero tensor unit

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-unit. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_zero.

Statement: For every θ and e, θ^[0](e)=e⊗algebraMap₀(1).

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate, mathlib:TensorPower.algebraMap₀, mathlib:TensorProduct.rid.

Proof: Unfold only the zero branch and evaluate the native right tensor unit and tensor map.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Ordered successor recurrence

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-succ. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_succ.

Statement: For every n≥0, θ^[n+1]=S_θ,n∘θ^[n].

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate, HodgeStructuresPartII:H.0/affine-ordered-step.

Proof: The equality is the successor branch of the recursive construction.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Zero successor step

Node: HodgeStructuresPartII:H.0/affine-ordered-step-zero. lemma. Declaration: TwistedHiggsBundle.affineOrderedStep_zero.

Statement: For every n≥0, S_0,n=0.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step.

Proof: Evaluate the composite; the tensor map of the zero field is zero.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Successor step is additive in the field

Node: HodgeStructuresPartII:H.0/affine-ordered-step-add. lemma. Declaration: TwistedHiggsBundle.affineOrderedStep_add.

Statement: For every θ,η,n, S_(θ+η),n=S_θ,n+S_η,n.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step, mathlib:TensorProduct.map_add_left.

Proof: Distribute the tensor map in its left argument, then use additivity of the associator and prepend map.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Contract the new leftmost factor

Node: HodgeStructuresPartII:H.0/affine-ordered-step-contraction. lemma. Declaration: TwistedHiggsBundle.affineOrderedStep_contraction.

Statement: For arbitrary η:E→E⊗Q^⊗n, v∈Q∨ and vs:Fin n→Q∨, contraction of S_θ,n∘η by the native pairing of Fin.cons v vs equals a_θ(v)·a_η(pairing(vs)). No basis or integrability is required.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step, HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.induction_on, mathlib:PiTensorProduct.induction_on, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.assoc_tmul, mathlib:TensorProduct.congr_tmul, mathlib:PiTensorProduct.subsingletonEquiv_symm_apply', mathlib:TensorPower.gMul_def, mathlib:TensorPower.tprod_mul_tprod, mathlib:TensorPower.cast_tprod, mathlib:TensorPower.multilinearMapToDual_apply_tprod, mathlib:Fin.append_left_eq_cons, mathlib:Fin.prod_univ_succ, mathlib:TensorProduct.rid, mathlib:TensorPower.multilinearMapToDual.

Proof: Induct on the input E⊗Q^⊗n, then on the native PiTensorProduct factor. Reduce to a scalar times a pure n-tuple. A second tensor induction on θ(e) reduces the new leftmost factor to a pure tensor. The singleton, multiplication and cast formulas identify it with Fin.cons of the new coefficient and the old tuple. Evaluate the native dual pairing; its commutative scalar product splits into v(q) times the tail product. Only scalar commutation is used. The resulting endomorphism composition is a_θ(v) after the tail contraction.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Exact ordered coefficient formula

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-contraction. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_contraction.

Statement: For every n≥0 and vs:Fin n→Q∨, contraction of θ^[n] by the native tensor-power dual pairing equals the ordered list product [a_θ(vs(0)),…,a_θ(vs(n−1))]. Its empty product is id_E. End_R(E) need not be commutative.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-unit, HodgeStructuresPartII:H.0/affine-ordered-iterate-succ, HodgeStructuresPartII:H.0/affine-ordered-step-contraction, HodgeStructuresPartII:H.0/affine-contractions-apply, mathlib:TensorPower.algebraMap₀_one, mathlib:TensorPower.gOne_def, mathlib:TensorPower.multilinearMapToDual_apply_tprod, mathlib:Module.End.one_eq_id, mathlib:TensorPower.multilinearMapToDual.

Proof: At n=0 evaluate the actual tensor unit and empty scalar pairing; the result is the identity. At n+1 split the dual tuple into its head and successor tail and apply the left-factor contraction lemma and induction hypothesis. Use the core finite-list head/tail recursion to obtain an ordered list product. A commutative finite-set product of endomorphisms is never used.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Dual coordinates of a native tensor power

Node: HodgeStructuresPartII:H.0/affine-tensor-power-coordinate. lemma. Declaration: TwistedHiggsBundle.affineTensorPower_coordinate.

Statement: For a finite basis b:I→Q, every n≥0 and word p:Fin n→I, the p coordinate of the existing native piTensorProduct basis equals the tensor-power pairing of the dual coordinates b.coord(p(i)). This includes the unique empty word.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: mathlib:Basis.piTensorProduct, mathlib:Basis.piTensorProduct_repr_tprod_apply, mathlib:PiTensorProduct.ext, mathlib:TensorPower.multilinearMapToDual_apply_tprod, mathlib:Module.Basis.coord, mathlib:TensorPower.multilinearMapToDual.

Proof: By native PiTensorProduct extensionality it suffices to evaluate both functionals on a pure tuple. The tensor basis representation and native dual pairing both give the product of the corresponding scalar coordinates. No new tensor-power basis carrier is introduced.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### All-order finite-chart vanishing criterion

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_eq_zero_iff.

Statement: For a chosen finite basis b of Q and every n≥0, θ^[n]=0 iff every ordered coefficient word [a_θ(b.coord(p(0))),…,a_θ(b.coord(p(n−1)))] has zero product. At n=0 this is equivalent to id_E=0, hence E is the zero module. E need not have a finite basis.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-contraction, HodgeStructuresPartII:H.0/affine-tensor-power-coordinate, HodgeStructuresPartII:H.0/affine-contractions-reconstruction, HodgeStructuresPartII:H.0/affine-contractions-zero, mathlib:Basis.piTensorProduct.

Proof: If θ^[n]=0, use the exact contraction formula and the promoted zero contraction lemma. For the converse reconstruct each θ^[n](e) using the existing finite native tensor basis and the arbitrary-E contraction reconstruction lemma. Identify every tensor coordinate with its dual tuple pairing, replace it by the ordered coefficient product, and kill each summand by hypothesis. This proves the affine statement; sheaf equality detection and gluing remain separate.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Zero field at every positive degree

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-zero-field. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_zero_field.

Statement: For every n≥0, the (n+1)-st ordered iterate of the zero field vanishes. The zero-th iterate is not asserted to vanish.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-succ, HodgeStructuresPartII:H.0/affine-ordered-step-zero.

Proof: Rewrite the recurrence and use the zero successor step; composition with zero vanishes.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Historical all-order evidence and remaining closure

Fresh primary reading is restricted to complete Heuer Definitions1.2(2) and4.1, including image/canonical-section/twisting formulas, and [Liu–Zhu Theorem2.1(i)–(v) and Lemma2.15 with its proof](https://arxiv.org/pdf/1602.06282v3), PDFpp.7 and18–19. The latter proves nilpotence of the logarithm through the cyclotomic-conjugation characteristic-polynomial argument. It motivates the algebraic coefficient interface but does not print its arbitrary-N proof. Publisher HTML SHA256 f70c37b9ea04164e15efe2dfe2754cd5eb605adb008260000153ce279a9f4934; Liu–Zhu v3 PDF SHA256 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79. Other source findings, all149 routed obligations and accepted owner boundaries are inherited unchanged. No new source error is asserted.

The [immutable native proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/ea49500be7122dfa7b09c7128537d8a304dae405/research/blueprint/suggested/HodgeStructuresPartII.lean) proves all eleven new native declarations and seven new examples; it restores the actual affine contraction/reconstruction/square proof prefix for a check without admission dependencies. Its narrow extraction has14 examples, zero errors/warnings/admissions and20 axiom audits with no admission dependencies. The standard kernel dependencies are propext, Classical.choice and Quot.sound. The predecessor N=2 noncommuting E12/E21 example remains in this extraction. The all-N vanishing criterion requires a finite basis only for Q, not E. The new Z/4 example preserves the nonreduced-base boundary.

The entire submitted Mathlib-only planning sketch elaborates at the exact pin with73 examples, zero errors,184 admitted-declaration warnings and no other warnings. All new bodies are admitted under PROTOCOL section13. The35 inherited global signature omissions remain. This elaboration does not certify those missing signatures, sheaf gluing, rank bounds or any stage. Native arbitrary-N coefficient proofs and admitted planning signatures are distinct receipts.

The exact-pin baseline entries record native tensor powers, singleton/multiplication/cast/unit equivalences, pure-tensor dual pairing, piTensorProduct basis coordinates, extensionality and induction. Core finite-list recursion is routine; Fin.prod_univ_succ is applied only to commutative scalar products. It is never used for products of endomorphisms.

Baseline: mathlib:Basis.piTensorProduct — For a finite family of R-modules with chosen bases, the native PiTensorProduct has a basis indexed by tuples of factor-basis indices. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basis.lean, declaration line33.

Baseline: mathlib:Basis.piTensorProduct_repr_tprod_apply — The tuple coordinate of a pure native tensor is the product of scalar basis coordinates in each factor. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basis.lean, declaration line42.

Baseline: mathlib:Fin.append_left_eq_cons — Appending a singleton tuple on the left of an n-tuple agrees with Fin.cons of its sole value and that tuple. Source: Mathlib/Data/Fin/Tuple/Basic.lean, declaration line367.

Baseline: mathlib:Fin.prod_univ_succ — For a commutative monoid, a product over Fin(n+1) is its zeroth factor times the product of successor factors. Used only for base scalars here. Source: Mathlib/Algebra/BigOperators/Fin.lean, declaration line76.

Baseline: mathlib:Module.End.one_eq_id — The unit of the native composition endomorphism algebra is the identity linear map. Source: Mathlib/Algebra/Module/LinearMap/End.lean, declaration line51.

Baseline: mathlib:PiTensorProduct.ext — Two linear maps out of a native PiTensorProduct are equal if they agree on every pure tuple. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line364.

Baseline: mathlib:PiTensorProduct.induction_on — Prove a predicate on native finite-family tensors by additivity and scalar multiples of pure tuples. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line356.

Baseline: mathlib:PiTensorProduct.subsingletonEquiv — For a subsingleton index type with a chosen element, the native PiTensorProduct is linearly equivalent to that one module factor. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line806.

Baseline: mathlib:PiTensorProduct.subsingletonEquiv_symm_apply' — For the constant module family over a subsingleton index type, the inverse singleton equivalence sends an element to the constant pure tuple. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line829.

Baseline: mathlib:TensorPower — For a commutative semiring R and R-module Q, TensorPower R n Q abbreviates the existing PiTensorProduct of n copies indexed by Fin n. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line38.

Baseline: mathlib:TensorPower.algebraMap₀ — The native linear equivalence R≅Q^⊗0; no assumption of freeness or nontriviality on Q. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line202.

Baseline: mathlib:TensorPower.algebraMap₀_one — The degree-zero algebra-map equivalence sends1 to the graded tensor unit. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line208.

Baseline: mathlib:TensorPower.cast — Reindex a native tensor power along a specified equality of degrees; a linear equivalence with no change to its module factors. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line98.

Baseline: mathlib:TensorPower.cast_tprod — The degree cast sends a pure tuple to its native reindexed tuple along the inverse Fin congruence. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line100.

Baseline: mathlib:TensorPower.gMul_def — The native graded multiplication is the linear tensor-power multiplication equivalence applied to a pure tensor of two tensor-power elements. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line86.

Baseline: mathlib:TensorPower.gOne_def — The native degree-zero graded tensor unit is the pure empty tuple. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line72.

Baseline: mathlib:TensorPower.mulEquiv — Native linear equivalence Q^⊗n⊗Q^⊗m≅Q^⊗(n+m), preserving the first block before the second block. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line76.

Baseline: mathlib:TensorPower.multilinearMapToDual_apply_tprod — The native pairing of an n-tuple of duals with a pure n-tuple is the product of scalar evaluations in the commutative coefficient semiring. Source: Mathlib/LinearAlgebra/TensorPower/Pairing.lean, declaration line53.

Baseline: mathlib:TensorPower.tprod_mul_tprod — Multiplying two pure tensor tuples gives the concatenated tuple with the first tuple before the second. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line138.

Baseline: mathlib:TensorProduct.congr — A pair of compatible semilinear module equivalences gives the native semilinear tensor-product equivalence; specialize to identity scalar homomorphisms here. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean, declaration line260.

Baseline: mathlib:TensorProduct.congr_tmul — The tensor congruence sends a pure tensor to the pure tensor of the two equivalence images. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean, declaration line270.

Baseline: mathlib:TensorProduct.map_add_left — Tensor mapping distributes over addition of the first semilinear map, with the same fixed second map. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean, declaration line149.

Baseline: mathlib:TensorPower.multilinearMapToDual — For any commutative semiring R and R-module Q, the native multilinear map sends n dual functionals to a linear functional on Q^⊗n. On a pure tensor it is the commutative scalar product of evaluations. No finite basis on Q is required. Source: Mathlib/LinearAlgebra/TensorPower/Pairing.lean, declaration line31.

Actual atlas assembly and the scoped prerequisite DAG pass without unresolved inputs or cycles. There are88 nodes,122 API items,114 total tests (112 required construction/definition tests),105 baseline entries and six unchanged planets. The reserved key, parent Hodge L0–L3, common variation D3, ordinary connection CR.1, generic sheaf tensor/dual/descent E1 and filtration/Rees DD.1 ownership remain unchanged. Global tensor-power comparison, change-of-chart/restriction and local equality detection/gluing are still required; the augmentation-power and rank/period adapters are separate obligations. H.0 remains partial, H.1–H.8 not_read, with11 gaps and5 requests.


## Predecessor checkpoint: native naturality and exact bound transport

This continuation uses the existing E-left convention: a field has codomain E tensor Q, and its next application prepends the new Q coefficient before the previous coefficient word. The preceding mathematical handoff used a Q-left presentation. Those presentations require the actual tensor flip; they are not literally the same carrier. The native affine formulas below preserve all88 predecessor statements.

The source input is the actual field and intertwining equation in [Heuer, arXiv v3, Definition1.2](https://arxiv.org/html/2307.01303v3), read with its complete two parts. The tensor discussion in [Stacks, Section17.16](https://stacks.math.columbia.edu/tag/01CA) distinguishes the presheaf tensor from the sheaf tensor. The following seven results are authored affine algebraic deductions, not named correspondence theorems from either source. No integrability, coefficient basis or finite rank is required. Generic tensor functor laws and congruences are existing Mathlib work, not new Higgs constructions.

Write T_n(u) for the existing finite-family tensor map of n copies of u, and I_n(theta),S_theta,n for the existing native iterate and step. For theta:E→E tensor Q, psi:F→F tensor P and R-linear f,u assume psi composed with f=(f tensor u) composed with theta, except in the independent order-zero test. All modules are arbitrary over a commutative ring.

### Naturality of a coefficient-prepending step

**Node:** HodgeStructuresPartII:H.0/affine-ordered-step-natural. **Proposed declaration:** TwistedHiggsBundle.affineOrderedStep_natural. **Kind:** lemma; implementation unchecked.

For every n≥0, S_psi,n composed with (f tensor u^(tensor n)) equals (f tensor u^(tensor(n+1))) composed with S_theta,n.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-step; mathlib:PiTensorProduct.map; mathlib:PiTensorProduct.map_tprod.

**Proof route:** Reduce equality of linear maps by native tensor extensionality, then induction on the existing n-fold coefficient tensor. For a pure coefficient word, substitute psi(f(e))=(f tensor u)(theta(e)); expand theta(e) by native tensor induction. Both sides are f(x) tensor the word (u(q),u(q1),…,u(qn)); singleton, multiplication and degree-cast maps retain the new leftmost slot. Extend by scalar linearity and addition.

**Acceptance:** The identity holds at n=0 with the actual empty tensor, not a zero surrogate. Every linear coefficient map u is permitted, including u=0. The convention retains the newly applied factor before the old ordered word.

### Naturality at every ordered degree

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-natural. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_natural. **Kind:** lemma; implementation unchecked.

For every n≥0, I_n(psi) composed with f equals (f tensor u^(tensor n)) composed with I_n(theta).

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-step-natural; HodgeStructuresPartII:H.0/affine-ordered-iterate-unit; HodgeStructuresPartII:H.0/affine-ordered-iterate-succ.

**Proof route:** At n=0 both sides send e to f(e) tensor 1_0; the empty coefficient maps are equal by elimination of Fin 0. At n+1 substitute the two successor recurrences and the degree-n induction hypothesis. Apply step naturality and associativity of linear-map composition. No coefficient dualization or finite basis is required.

**Acceptance:** Order zero works for arbitrary f,u even without the intertwining hypothesis. The same n appears on both sides; no enlargement of the exponent occurs. In particular, coefficient specialization with f=id transports a vanishing iterate.

### Enlarge an ordered nilpotence bound

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-mono. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_mono. **Kind:** lemma; implementation unchecked.

If n≤m and I_n(theta)=0, then I_m(theta)=0, including n=0.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-succ.

**Proof route:** Write m=n+d and induct on d. The zero increment is the hypothesis; each successor is S_theta,n+d composed with the zero map. This is a statement about a given exponent; it does not construct a bound on an arbitrary infinite cover.

**Acceptance:** Vanishing at degree two implies vanishing at degree five. The assertion includes zero modules and the n=0 boundary. No commutativity of coefficient contractions is used.

### Preserve a fixed bound through a surjective morphism

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-surjective. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_zero_of_surjective. **Kind:** lemma; implementation unchecked.

For a surjective intertwiner f:E→F and any coefficient map u:Q→P, I_n(theta)=0 implies I_n(psi)=0 with exactly the same n.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-natural.

**Proof route:** Naturality and the zero hypothesis show I_n(psi) composed with f is zero. Evaluate any x in F on a preimage under f; this proves I_n(psi)(x)=0. Surjectivity of f says nothing about zero detection by u. Do not reverse this implication for arbitrary coefficient maps.

**Acceptance:** For f=id and any u this gives coefficient specialization. A zero coefficient map in characteristic two preserves zero but erases a nonzero unit field. Reflection is provided only by the separate two-isomorphism theorem.

### Reflect the same bound through two isomorphisms

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-equiv. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_equiv_zero_iff. **Kind:** lemma; implementation unchecked.

For linear isomorphisms f:E≃F and u:Q≃P intertwining theta and psi, I_n(psi)=0 if and only if I_n(theta)=0, at the identical n.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-natural; mathlib:PiTensorProduct.congr; mathlib:TensorProduct.congr.

**Proof route:** The native tensor congruence of f and the family of n copies of u is an invertible linear map. If I_n(psi)=0, naturality makes this invertible tensor map annihilate I_n(theta); injectivity reflects zero pointwise. Conversely I_n(theta)=0 and surjectivity of f imply I_n(psi)=0. The proof covers n=0 without a separate positive-degree restriction.

**Acceptance:** Identity frame changes preserve the exact exponent. Both module and coefficient isomorphisms are explicit; f=id with u=0 is a counterexample to omitting the latter. There is no assumption that arbitrary scalar extension is faithful.

### First iterate and the singleton tensor equivalence

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-one. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_one. **Kind:** lemma; implementation unchecked.

Let a:Q≃Q^(tensor 1) be the existing inverse singleton tensor equivalence. Then I_1(theta)=(id_E tensor a) composed with theta.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-unit; HodgeStructuresPartII:H.0/affine-ordered-iterate-succ; mathlib:PiTensorProduct.subsingletonEquiv; mathlib:TensorPower.mulEquiv.

**Proof route:** Unfold the degree-zero unit and the first successor step. Expand theta(e) into pure tensors using the native tensor induction principle. The first singleton coefficient multiplied by the empty tensor word, then cast 1+0=0+1, is the same singleton coefficient. Hence both maps agree.

**Acceptance:** I_1(theta)=0 if and only if theta=0, by injectivity of the native tensor congruence. No literal equality between Q and its singleton tensor-power carrier is asserted. The unit line field over Z/2 has a nonzero first iterate.

### Second iterate and the ordered associator square

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-two. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_two. **Kind:** lemma; implementation unchecked.

Let a:Q≃Q^(tensor 1) be the inverse singleton equivalence and c=(a tensor a) followed by native tensor-power multiplication into Q^(tensor 2). Then I_2(theta)=(id_E tensor c) composed with affineOrderedSquare(theta).

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-one; HodgeStructuresPartII:H.0/affine-ordered-square; mathlib:TensorProduct.congr; mathlib:TensorPower.mulEquiv.

**Proof route:** Apply the successor recurrence and the degree-one comparison. First induct on theta(e), then on each theta(x), so both expressions reduce to pure coefficient tensors. Both sides send an ordered term y tensor(p tensor q) to y tensor the two-slot word (p,q). The degree cast at 1+1=2 is definitionally the identity. No flip, exterior quotient or symmetric quotient is introduced.

**Acceptance:** I_2(theta)=0 if and only if the separate ordered square is zero. The new coefficient p occupies the first slot, preserving the earlier E12/E21 noncommuting discriminator. The assertion holds over arbitrary rings, including characteristic two.

### New APIs and native acceptance tests

The step construction gains its promoted naturality API. The iterate construction gains naturality,monotonicity,surjective preservation,two-isomorphism reflection and degree-one/two comparison APIs, each promoted to the corresponding lemma node above when consumed. Their existing projections and tests are retained.

| Test | Kind | Exact contract |
|---|---|---|
| TwistedHiggsBundle.affineOrderedIterate.test_natural_unit | compatibility | For arbitrary fields theta,psi and maps f,u, the degree-zero naturality equation holds even without an intertwining assumption; the empty tensor word is mapped to itself. |
| TwistedHiggsBundle.affineOrderedIterate.test_coefficient_quotient | compatibility | For any u:Q→P and n, I_n(theta)=0 implies I_n((id_E tensor u) composed with theta)=0 at the same n. |
| TwistedHiggsBundle.affineOrderedIterate.test_chart_identity | compatibility | Take f=id_E,u=id_Q and psi=theta in the isomorphism transport theorem; the same-exponent equivalence holds for every n. |
| TwistedHiggsBundle.affineOrderedIterate.test_bound_two_to_five | computation | If I_2(theta)=0 then I_5(theta)=0 over any commutative ring, with no integrability assumption. |
| TwistedHiggsBundle.affineOrderedIterate.test_one_zero_iff | characterisation | For any theta, its first ordered iterate is zero if and only if theta itself is zero. |
| TwistedHiggsBundle.affineOrderedIterate.test_two_zero_iff | compatibility | For any theta, its second ordered iterate is zero if and only if the separate associator-defined ordered square is zero. |
| TwistedHiggsBundle.affineOrderedIterate.test_characteristic_two_nonreflection | non-example | Over Z/2 with E=F=Q=P=Z/2, let theta(e)=e tensor 1, psi=0, f=id and u=0. The fields intertwine, I_1(psi)=0, and I_1(theta)≠0. Thus arbitrary coefficient maps cannot reflect a fixed bound even when f is an isomorphism. |

The characteristic-two test is an actual native tensor calculation, not a symmetric-square shortcut: the identity map on E intertwines the unit field with the zero field when u=0, yet only the latter has zero first iterate. The degree-two comparison uses the coefficient equivalence c explicitly; injectivity of id_E tensor c reflects the square-zero condition. It preserves the prior noncommuting ordered-product discriminator; no reversal of the two coefficient slots occurs.

### Remaining mathematical interfaces

These results settle native affine change of module/coefficient charts and same-ring isomorphism transport. An R-linear map u:Q→P is not the cross-ring functor S tensor_R−. Arbitrary scalar extension therefore still needs the actual scalar-tower and tensor-associativity comparison. Its fixed-exponent preservation uses no flatness, whereas reflection needs faithful zero detection. The inherited flat but nonfaithful projection example remains a valid warning against dropping faithfulness. Fixed-bound locality needs sheaf morphism equality detection; varying local bounds require a separate finite subcover/maximum argument. Field/reduced-ring rank bounds, image-algebra base change, period/Tate equivariance and global determinant comparison stay open. No tensor of global sections is substituted for a sheaf tensor. All5 supplier requests,11 gaps,149 source-route obligations and35 omitted global signatures remain. H.0 stays partial and H.1–H.8 not_read.

### Predecessor native proof and exact sketch evidence

The [immutable native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/ab19cc58e36f8fe16ff95e0258bb5dd308e2fb5f/research/blueprint/suggested/HodgeStructuresPartII.lean), delimited by ARCHIVED CHECKED HIGGS NATURALITY, contains the complete real native carriers and allseven new proofs/seven examples. Verbatim public extraction is byte-identical to the source checked against Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2. Source SHA-256:98d24ca7657199269c93f26eaae69b83dfedcd777ea8b0f0a669e5bb437bacc8. The check has zero errors,warnings or admissions; allseven kernel axiom audits contain only propext,Classical.choice andQuot.sound. Runtime2.20seconds,maxRSS2154116KiB,65GiB available beforehand. Twelve native declaration headers match the canonical planning file, including the inherited step,iterate,square and unit/successor types.

The entire submitted Mathlib-only planning file has80 examples and elaborates with zero errors,198 admitted-declaration warnings and no other warnings. Exact source SHA-256:87dd584cbe55a71d10bf049f6839f87a83e04c1d73b81b334a685b079b4cfb2b; compiler-log SHA-256:a0bff331fa557021ea49a37df2737387a4bf6417dbeeb2a76f629e7640e01a5e. Runtime4.70seconds,maxRSS2933908KiB,65GiB available. These are admitted signatures under protocol13. The separate actual proof does not turn any implementationStatus into implemented or discharge global omitted signatures. One bounded Lean process ran at a time; no project,cache,library build or language server was started.

The indexed packet and actual read-only atlas assembly pass. The stage/planet graph is3022vertices/8663edges; the own declaration prerequisite graph95/179; the stage/planet plus reachable prerequisite graph3112/8880,with96 reachable declarations and51 existing virtual supplier endpoints. Allare acyclic; zero unresolved references,no own skipped/pending links and unchanged stage edges. There are95 nodes,129 APIs,121 total tests,110 baseline references,six planets,five requests andeleven gaps. All88 inherited mathematical statements,86 complete node objects,122 inherited APIs,114 inherited tests,149 paper-item obligations andstage requires are retained. Only step/iterate constructions gain new promoted APIs/uses and the iterate gains seven tests.


## Scalar extension of ordered Higgs iterates

This partial continuation compares different coefficient rings using the existing native scalar-extension functor. Let R→S be any map of commutative rings, and let E and Q be R-modules. Write E_S=S⊗_R E and Q_S=S⊗_R Q. Extend the actual field θ:E→E⊗_R Q and compose with Mathlib’s existing S-linear distribution equivalence to obtain θ_S:E_S→E_S⊗_S Q_S. This construction needs neither integrability nor a basis, and it does not define another generic tensor functor. It sends a⊗θ(e) to the distribution image; a term a⊗(x⊗q) becomes (a⊗x)⊗(1⊗q).

Suppose b:I→Q is a basis. Its existing native extension b_S is an S-basis of Q_S with the same index type; this requires no flatness. Contract θ_S by the i-th coordinate of b_S. On a⊗e, expand θ(e) into elementary tensors. The coordinate of 1⊗q is the scalar image of b.coord(i)(q); tensor balancing moves this scalar back to the E factor. Consequently the contraction is exactly the S-extension of the original coordinate contraction. This comparison allows an infinite basis index type: each coordinate and each individual ordered word is finite data.

Apply the actual endomorphism scalar-extension algebra homomorphism to a list of contractions. It preserves the list product in the original order, even when the endomorphisms do not commute. The newest coefficient remains on the left, and the rightmost operator acts first. At degree zero, the empty product extends to the identity of E_S. No symmetric or exterior quotient, factorial denominator, field or characteristic assumption is used.

A finite basis of Q is required for the all-order vanishing criterion already planned here. E can still be any module. Apply that criterion before and after extension: every original ordered product vanishes when I_n(θ)=0, so its scalar extension vanishes, and reconstruction in the extended tensor-power basis gives I_n(θ_S)=0. The integer n is identical on both sides, including n=0. Scalar extension preserving a zero map requires no flatness; this calculation makes no assertion that kernels or image algebras commute with nonflat extension.

For reflection, assume S is faithfully flat over R. If I_n(θ_S)=0, each extended ordered product is zero. Evaluate it at 1⊗e. The native faithful-flat zero-detection lemma implies the original product kills e. Since e is arbitrary, the original word is zero; the original finite-basis criterion gives I_n(θ)=0. This is an application of [Stacks Lemma10.39.14](https://stacks.math.columbia.edu/tag/00H9), imported through pinned Mathlib, to the authored Higgs-word comparison. It is not a source theorem about the p-adic Simpson correspondence.

The construction and four consumed lemmas below keep all these hypotheses explicit. Their implementation status remains unchecked; the separate checked native proof provides evidence for the plan, while the suggested file retains admitted signatures under protocol13.

### Scalar extension of an affine twisted field

**Node:** HodgeStructuresPartII:H.0/affine-base-change. **Proposed declaration:** TwistedHiggsBundle.affineBaseChange. **Kind:** construction; implementation unchecked.

For θ:E→E⊗_R Q, construct the S-linear field θ_S:E_S→E_S⊗_S Q_S by the existing linear-map scalar extension followed by the existing tensor-distribution equivalence. On an elementary term a⊗(x⊗q), the latter gives (a⊗x)⊗(1⊗q). No coefficient differential map or integrability claim is included.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity.

**Inputs:** mathlib:LinearMap.baseChange; mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange.

**Proof route:** Compose the native scalar extension of θ with the native S-linear tensor equivalence; introduce no new generic tensor or scalar-extension carrier. Pure tensor evaluation is the defining baseChange formula followed by distribBaseChange_tmul. The zero field extends to zero.

| API | Role | Contract |
|---|---|---|
| TwistedHiggsBundle.affineBaseChange_tmul | projection | θ_S(a⊗e) is the native tensor-distribution image of a⊗θ(e). |
| TwistedHiggsBundle.affineBaseChange_zero | simp | The zero field extends to the zero field for every R-algebra S. |
| TwistedHiggsBundle.affineBaseChange_contraction | compatibility | For any basis b of Q and i∈I, contraction of θ_S by the extended coordinate equals scalar extension of the i-th contraction of θ. |
| TwistedHiggsBundle.affineBaseChange_word | compatibility | Every ordered word of extended coordinate contractions is scalar extension of the corresponding original word, including the empty word. |

| Test | Kind | Contract |
|---|---|---|
| TwistedHiggsBundle.affineBaseChange.test_zero | degenerate | The extended zero field has zero iterate at every positive degree for arbitrary modules E,Q and every R-algebra S. |
| TwistedHiggsBundle.affineBaseChange.test_line | computation | For E=Q=R and θ(e)=e⊗1, θ_S(a⊗e)=(a⊗e)⊗(1⊗1). This detects the placement of the coefficient unit. |
| TwistedHiggsBundle.affineBaseChange.test_unit_all_orders | boundary | For every nontrivial R-algebra S, the scalar-extended unit field on E=Q=R has nonzero iterate at every n≥0. The empty product and positive degrees must all survive. |
| TwistedHiggsBundle.affineBaseChange.test_nonfaithful | non-example | Over R=Z with E=Q=Z, θ(e)=2e⊗1 is nonzero; its scalar extension to S=Z/2 is zero. Arbitrary scalar extension cannot reflect vanishing. This example does not assert that Z→Z/2 is flat. |

### Scalar extension of coordinate contractions

**Node:** HodgeStructuresPartII:H.0/affine-base-change-contraction. **Proposed declaration:** TwistedHiggsBundle.affineBaseChange_contraction. **Kind:** lemma; implementation unchecked.

For any basis b:I→Q, θ:E→E⊗_R Q and i∈I, a_(θ_S)((b_S).coord i)=(a_θ(b.coord i))_S as actual S-linear endomorphisms of E_S. I need not be finite.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. A specified native R-basis b:I→Q is given, with arbitrary index type I.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change; HodgeStructuresPartII:H.0/affine-contractions; mathlib:Module.Basis.baseChange; mathlib:Module.Basis.baseChange_repr_tmul; mathlib:TensorProduct.AlgebraTensorModule.ext; mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul.

**Proof route:** Check equality on a⊗e, then induct on θ(e) in the native E⊗_R Q. For x⊗q, the extended coordinate of 1⊗q is the scalar image of b.coord(i)(q). The right tensor unit makes it act on a⊗x. The tensor balancing relation identifies this with a⊗a_θ(b.coord i)(e). Zero and sums follow by linearity. No evaluation of global sections or finite-basis reconstruction is used.

### Scalar extension of ordered contraction products

**Node:** HodgeStructuresPartII:H.0/affine-base-change-word. **Proposed declaration:** TwistedHiggsBundle.affineBaseChange_word. **Kind:** lemma; implementation unchecked.

For any basis b:I→Q, n≥0 and p:Fin(n)→I, the ordered product of the extended coordinate contractions equals scalar extension of the original ordered product. At n=0 both sides are id_(E_S).

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. A specified native R-basis b:I→Q is given; its index type may be infinite because each individual word is finite.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change-contraction; mathlib:Module.End.baseChangeHom; mathlib:map_list_prod.

**Proof route:** Rewrite each factor by the coordinate-contraction lemma. Apply the existing endomorphism scalar-extension algebra homomorphism to the ordered list product. The generic monoid-homomorphism list-product law applies without commutativity. The homomorphism preserves the empty product as the actual identity endomorphism. No word reversal, divided factorial or characteristic assumption appears.

### Preserve an ordered bound under scalar extension

**Node:** HodgeStructuresPartII:H.0/affine-base-change-bound. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_baseChange_zero. **Kind:** lemma; implementation unchecked.

For a finite basis b of Q and any n≥0, I_n(θ)=0 implies I_n(θ_S)=0 with exactly the same n, for every R-algebra S. E is arbitrary and S need not be flat.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. The basis index type I is finite; no finite-generation or freeness hypothesis is imposed on E.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change-word; HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing; mathlib:Module.Basis.baseChange; mathlib:LinearMap.baseChange_zero.

**Proof route:** Apply the actual all-order coordinate-vanishing criterion to b_S. Each extended word is scalar extension of the corresponding original word. Original iterate vanishing annihilates all such words; scalar extension preserves their zero values. The finite index type is used only for the native tensor-power basis and reconstruction in the criterion. The proof also covers n=0 and zero modules.

### Reflect an ordered bound under faithful scalar extension

**Node:** HodgeStructuresPartII:H.0/affine-base-change-bound-faithful. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_baseChange_zero_iff. **Kind:** lemma; implementation unchecked.

For a finite basis b of Q and faithfully flat R-algebra S, I_n(θ_S)=0 if and only if I_n(θ)=0, at the identical n≥0. E is an arbitrary R-module.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. I is finite and S carries the native Module.FaithfullyFlat R S instance.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change-bound; HodgeStructuresPartII:H.0/affine-base-change-word; HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing; mathlib:Module.FaithfullyFlat; mathlib:Module.FaithfullyFlat.one_tmul_eq_zero_iff.

**Proof route:** Use the existing preservation lemma for the forward scalar-extension direction. For reflection, extended iterate vanishing makes every extended ordered word zero. The word comparison identifies it with scalar extension of the original word. Evaluate each extended endomorphism at 1⊗e. Native faithful zero detection gives that the original word kills e, for arbitrary e. Apply the original finite-basis coordinate criterion. Flatness alone is not used as a substitute for faithfulness; the characteristic-two field-collapse test and the retained historical flat-nonfaithful projection lead distinguish the assumptions.


The unit-line test computes the coefficient-unit placement directly. Its all-order variant proves the scalar-extended unit field has nonzero iterate at every n when S is nontrivial, including the empty-word boundary. The concrete field θ(e)=2e⊗1 over Z is nonzero, yet becomes zero over Z/2. This rules out unconditional reflection. It does not assert flatness of Z→Z/2; the predecessor’s flat but nonfaithful projection example remains a historical lead with its original receipt.

The global pullback-nilpotence theorem retains its original statement. Its proof now imports the affine scalar-extension bound, followed by the existing same-ring coefficient-map preservation for Q_S→Q_Y. E1 must still supply the actual sheaf tensor-power comparison, finite-projective charts, restriction and morphism equality detection. No global tensor of sections, pullback-integrability theorem or coefficient differential is silently supplied. General arbitrary-Q tensor-power comparison, sheaf gluing, field/reduced-ring rank bounds, kernel/image-algebra base-change hypotheses, determinant descent and period/Tate equivariance remain open. H.0 remains partial, H.1–H.8 not_read; allfive requests,eleven gaps,149 routed obligations and35 omitted global signatures remain.

### Scalar-extension evidence

The [immutable native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/dc25c5c1974994ba2e382998b82d187f9b027bd9/research/blueprint/suggested/HodgeStructuresPartII.lean), delimited by BEGIN/END ARCHIVED CHECKED HIGGS SCALAR EXTENSION, contains the complete standalone native source:607 lines,18 examples and28 kernel axiom audits. Its source SHA-256 is f922ee36944f958ba59913bf9bef72223e69b22de885590cc37c35beefe8ebb6. Verbatim extraction was checked byte-for-byte. At the exact Mathlib pin with Lean4.34.0-rc2 it elaborates with zero errors,warnings or admissions; each audit contains only propext,Classical.choice andQuot.sound. Runtime3.80seconds,maxRSS2991956KiB,63GiB available. All28 native declaration headers and the four new example types are matched to the canonical sketch. The full final admitted-sketch receipt and actual assembler checks are in the current handoff and packet verification. Historical receipts earlier in this document apply only to their original hashes.

The entire exact final Mathlib-only suggested file elaborates:84examples,zero errors,209admitted-declaration warnings andzero other warnings. Source SHA-256:ab7b037d990ebfd7e39d242e8819ab8aaaece15e07adf3c171c64893d18e3bc3; normalized diagnostics SHA-256:c0699f5d698b2734b1774f886f1f3da335303bf55ba8d276acfbde43c41237d0. Runtime5.00seconds,maxRSS2960448KiB,61GiB available beforehand. Normalize the source filename to suggested/HodgeStructuresPartII.lean and omit the final elapsed/maxRSS line when hashing the diagnostics. Allplanning bodies remain admitted.

Indexed packet checker:zero errors/warnings. Actual atlas assembly:stage graph3022vertices/8663edges; own prerequisite graph100/189; stage plus reachable prerequisite graph3117/8890;101reachable declarations,51existing virtual supplier endpoints,zero unresolved references. Allacyclic; no own skipped/pending links; stage edges and other roadmaps skipped/pending links unchanged from the base control. No site output is written. Five-file intake,JSON validity,statement/hypothesis/API/test preservation,exact public archive extraction,all28 declaration headers,four new example types andwhitespace pass. Only the packet,reader,suggested file andhandoff change; roadmap definition stays byte-identical. Scratch is deleted after the PR opens; allreproduction inputs are durable in tracked files/history. No owned background process remains.

## Coefficient changes and exact ordered bounds

The coefficient-map step of pullback is separate from extension of the coefficient ring. Work over an arbitrary commutative ring R with arbitrary R-modules E,Q,P,T. The existing affine field is a native linear map θ:E→E⊗_R Q; its ordered iterates I_n(θ) use the existing Fin n-indexed tensor powers. No local basis of E or Q, finiteness, integrability, flatness, reducedness or field hypothesis is imposed in this section. This affine generality includes modules that are not vector bundles. The global bundle endpoints retain their finite local freeness and differential-calculus hypotheses.

**TwistedHiggsBundle.affineCoefficientMap.** For an R-linear coefficient map u:Q→P, construct θ_u=(id_E⊗u)∘θ:E→E⊗_R P using the existing TensorProduct.map. The module E and the base ring remain fixed. This is a named adapter for the actual field, not a new tensor functor or Higgs carrier. It supplies the coefficient leg after scalar extension in the original pullback-nilpotence theorem. Giving this operation explicitly prevents a statement about a scalar-extended field from silently assuming that its coefficient module is already the target module of forms.

The API follows its consumers. `TwistedHiggsBundle.affineCoefficientMap_apply` gives θ_u(e)=(id_E⊗u)(θ(e)) on the actual native tensor. `TwistedHiggsBundle.affineCoefficientMap_id` says θ_id=θ. `TwistedHiggsBundle.affineCoefficientMap_zero` says a zero coefficient map kills every field. `TwistedHiggsBundle.affineCoefficientMap_comp` says successive changes by u then v agree with the single change by v∘u. `TwistedHiggsBundle.affineOrderedIterate_coefficientMap` compares every ordered iterate at the same degree. The latter two APIs have individual consumed lemma nodes below; generic tensor composition and identity remain imported baseline declarations.

**TwistedHiggsBundle.affineCoefficientMap_comp.** For u:Q→P and v:P→T, compute

    (θ_u)_v=(id_E⊗v)(id_E⊗u)θ=(id_E⊗(v∘u))θ=θ_(v∘u).

Associativity of linear-map composition and the native tensor-map composition law prove this equality. The order is v after u. No coordinate expansion, dualization or generic new monoidal structure is introduced. This equation is consumed by reflection through a coefficient left inverse, so it is an explicit declaration rather than an unrecorded proof step.

**TwistedHiggsBundle.affineOrderedIterate_coefficientMap.** For every n≥0,

    I_n(θ_u)=(id_E⊗u^(⊗n))∘I_n(θ).

The map u^(⊗n) is the existing PiTensorProduct.map on n copies of u. Apply the inherited all-degree naturality theorem with the module map f=id_E and the target field ψ=θ_u. Its intertwining equation is exactly the construction. Thus the proof uses the actual native ordered tensor-power carriers, including their associativity and prepend convention, without choosing dual coordinates or replacing tensor powers by symmetric powers.

At n=0 the coefficient tensor power is the unit. The zero-th iterate is the native identity after its tensor-unit identification, not the original field and not a zero map. In particular, sending Q to P by a zero map does not erase degree zero for a nonzero E. At positive degree a zero coefficient map kills the field, but this is compatible with the degree-zero exception. The rational-line acceptance example checks this boundary for every coefficient endomap, including zero.

**TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero.** If I_n(θ)=0, then I_n(θ_u)=0, at the identical n. The iterate formula is a postcomposition of zero by a native tensor map, and postcomposition preserves zero without any exactness hypothesis. This direction works for every coefficient map and every E. It does not assert that the tensor map detects a zero source map, that kernels commute with tensor product, or that nilpotence filtrations pull back as subbundles.

In the affine chart proof of the original global pullback theorem, first use the native scalar-extension construction and its same-bound result to obtain θ_S on E_S with coefficient Q_S. Then use affineCoefficientMap for the specified map Q_S→Q_Y and apply the same-bound preservation lemma. This supplies the two algebraic legs. Identification with the actual sheaf-level pulled-back iterate still requires the E1 tensor-power comparison, chart restriction and equality detection/gluing. Integrability still needs the separate exterior-map compatibility. The coefficient step cannot certify either global interface by itself.

**TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero_iff.** Suppose a specified R-linear v:P→Q satisfies v∘u=id_Q. Then I_n(θ_u)=0 if and only if I_n(θ)=0, for every n≥0 and arbitrary E. For reflection, apply the preservation theorem a second time to θ_u with coefficient map v. Its result is I_n((θ_u)_v)=0. The composition API and v∘u=id identify this field with θ. The converse is the preservation theorem. The identical n appears throughout; no larger unspecified bound is substituted.

A linear left inverse makes u a split inclusion, and its tensor powers carry corresponding left inverses. This proof uses the field composition directly, so no new generic theorem about split injections is needed. Neither u nor v is required to be an isomorphism; no assertion u∘v=id_P is used. The native inclusion Q→Q×P with its first projection is an acceptance example at every degree. It shows reflection works after adjoining unused coefficient directions, even when E is not flat.

Mere coefficient injectivity does not give this reflection for arbitrary E. Take R=ℤ, Q=P=ℤ, u multiplication by2 and E=ℤ/2. The coefficient map is injective because 2x=2y implies x=y in ℤ. Let θ be the inverse right tensor-unit map E→E⊗_ℤℤ. This field is nonzero: applying the right tensor-unit map to θ(1) returns the nonzero element1 of E. But its coefficient change sends e⊗1 to e⊗2=2(e⊗1)=0. The actual counterexample test proves both injectivity of u and vanishing of the changed field while θ remains nonzero. It changes the coefficient module at the same base ring; it is distinct from the existing counterexample that changes the base ring. E here is not a finite locally free ℤ-module, so this does not claim a counterexample with E flat or a failure of the original finite-locally-free bundle hypotheses.

The remaining construction tests compare the identity change with the original arbitrary field and show that the nonzero native rational unit field becomes zero under the zero coefficient map. Together with the split-inclusion, injective-map and degree-zero tests, these distinguish the operation, its direction of composition and its detection hypotheses. They check native maps and tensors rather than an assumed vanishing predicate.

A separate actual-body prototype proves these eight named declarations, five examples and their inherited native iterate/naturality inputs without admissions. Twelve axiom audits list only standard axioms and contain no admitted axiom. The full submitted suggested file elaborates at the pinned existing Mathlib build with every new planning body admitted, as PROTOCOL§13 requires. These checks are interface evidence, not a claim that a packet node or missing global theorem is implemented.

The source carrier is Heuer, arXiv2307.01303v3 Definition1.2(2), freshly read with the selected introduction. The coefficient formulas and left-inverse argument are authored affine algebraic deductions. Stacks Section17.16 explains why the sheaf tensor and its pullback comparison require their own interface; its opening construction and Lemmas17.16.1–5 were read, including the displayed proofs. These scoped readings do not certify the correspondence, the full149-item source inventory or any omitted global signature. The reserved general Higgs/parameter carrier, all100 inherited mathematical contracts, source findings, requests, planets and nine-stage roadmap remain. H.0 stays partial and H.1–H.8 stay not_read.


## Flat coefficient injections and horizontal subobjects

Write I_n for the existing ordered iterate. The coefficient-change and split-inclusion statements above continue to hold for arbitrary modules. The following reflection criteria use the native flat-module hypothesis, which follows in particular from projectivity without a chosen basis. They are statements about modules over one fixed ring. They supply no new global Higgs carrier, chart descent or comparison of tensor products of global sections.

### Reflect ordered bounds on flat ambient subobjects

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-flat-subobject. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_natural_zero_iff_of_flat. **Kind:** lemma; implementation unchecked.

Let f:E→F and u:Q→P be injective R-linear maps with ψ∘f=(f⊗u)∘θ. If F,Q,P are flat over R, then for every n≥0, I_n(ψ)∘f=0 if and only if I_n(θ)=0. In particular a specified bound on ψ restricts to the same bound on θ. E need not be flat. The left side is the restriction along f, not vanishing on all of F.

Hypotheses:

- R is any commutative ring, and E,F,Q,P are R-modules with their native additive group and module structures. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R P are R-linear. No integrability, rank, reducedness or chosen basis is assumed.
- I_n is the existing ordered iterate with the newest coefficient on the left and the native tensor-unit identity at n=0. The base ring stays fixed. These are affine module statements; restrictions and equality detection for actual sheaf tensors remain E1 supplier obligations.
- F,Q,P are flat R-modules; f and u are injective and satisfy the displayed horizontal equation. No flatness assumption on E is used.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-natural; mathlib:Module.Flat; mathlib:Module.Flat.of_linearEquiv; mathlib:TensorProduct.map_injective_of_flat_flat; mathlib:TensorPower.algebraMap₀; mathlib:TensorPower.mulEquiv; mathlib:TensorPower.cast; mathlib:TensorPower.cast_tprod; mathlib:TensorPower.tprod_mul_tprod; mathlib:PiTensorProduct.subsingletonEquiv; mathlib:PiTensorProduct.map_tprod; mathlib:TensorProduct.congr; mathlib:PiTensorProduct.induction_on.

Proof:

1. Use the native unit R≅Q^⊗0 and the prepend equivalence Q⊗Q^⊗n≅Q^⊗(n+1), formed from the singleton equivalence, tensor-power multiplication and the 1+n=n+1 reindexing. Native flat tensor closure and transport through a linear equivalence prove flatness of Q^⊗n by induction.
2. Inductively prove injectivity of u^⊗n. In degree zero its conjugate by the two native unit identifications is id_R. At a successor, the native prepend diagram identifies u^⊗(n+1) with u⊗u^⊗n. Check that diagram on pure tensors with the native tprod multiplication and cast laws; coefficient order is unchanged. Apply the baseline tensor-map injectivity lemma using P flat and Q^⊗n flat. These are local helper deductions in this proof, not new generic carriers or an assumed injection certificate.
3. Apply the same baseline tensor-map lemma to f and u^⊗n using F flat and Q^⊗n flat. The existing naturality equality identifies I_n(ψ)∘f with (f⊗u^⊗n)∘I_n(θ). Injectivity of the actual tensor map reflects zero pointwise; postcomposition preserves zero for the other implication.
4. If I_n(ψ)=0, its restriction is zero and the equivalence applies. Without surjectivity of f, vanishing on its image gives no vanishing on a complementary summand.

Acceptance:

- At n=0 both sides detect the zero source E, since f is injective and I_0 is the tensor-unit identity.
- An ambient bound I_n(ψ)=0 restricts to I_n(θ)=0 with no flatness premise on E.
- Over ℤ, f embeds the first summand of ℤ⊕ℤ, θ=0 and ψ(a,b)=(0,b)⊗1. The horizontal equation holds with u=id; ψ∘f=0 but ψ≠0. Thus the conclusion does not replace the restricted iterate by the whole ambient iterate.

### Reflect ordered bounds through a flat coefficient injection

**Node:** HodgeStructuresPartII:H.0/affine-coefficient-map-bound-flat. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero_iff_of_flat. **Kind:** lemma; implementation unchecked.

If E,Q,P are flat R-modules and u:Q→P is injective, then for every n≥0, I_n(θ_u)=0 if and only if I_n(θ)=0, where θ_u=(id_E⊗u)∘θ. No coefficient left inverse, finite basis, finite generation or integrability is required; the same exponent occurs on both sides.

Hypotheses:

- R is any commutative ring, and E,F,Q,P are R-modules with their native additive group and module structures. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R P are R-linear. No integrability, rank, reducedness or chosen basis is assumed.
- I_n is the existing ordered iterate with the newest coefficient on the left and the native tensor-unit identity at n=0. The base ring stays fixed. These are affine module statements; restrictions and equality detection for actual sheaf tensors remain E1 supplier obligations.
- For this coefficient-only specialization F=E and f=id_E. E,Q,P are flat over R and u is injective. These are sufficient hypotheses, not a claim of minimal hypotheses for each degree.

Inputs: HodgeStructuresPartII:H.0/affine-coefficient-map; HodgeStructuresPartII:H.0/affine-ordered-iterate-flat-subobject; mathlib:Module.Flat; mathlib:Module.Flat.of_projective.

Proof:

1. Instantiate the horizontal reflection theorem with F=E, f=id_E and ψ=θ_u. Its horizontal equation is the definition of coefficient change. Remove composition with the identity.
2. Projective coefficients and E satisfy the flatness hypotheses by the native projective-to-flat instance; no basis or finite-rank choice enters this implication.
3. The inherited split coefficient result still applies to arbitrary E, even when this flatness hypothesis fails. The two reflection criteria therefore retain their separate hypotheses.

Acceptance:

- For E=Q=P=ℤ and u multiplication by 2, the equivalence holds for every θ and n, although no ℤ-linear left inverse exists.
- Native projective E,Q,P satisfy the statement without finite generation or a chosen basis.
- The inherited E=ℤ/2, Q=P=ℤ, u=2 counterexample excludes dropping flatness of E from this sufficient criterion.
- Degree zero keeps the actual tensor-unit identity; no positive-degree nilpotence condition is built into the field.

The ordered-iterate construction gains the compatibility API **TwistedHiggsBundle.affineOrderedIterate_natural_zero_iff_of_flat**: Let f:E→F and u:Q→P be injective R-linear maps with ψ∘f=(f⊗u)∘θ. If F,Q,P are flat over R, then for every n≥0, I_n(ψ)∘f=0 if and only if I_n(θ)=0. In particular a specified bound on ψ restricts to the same bound on θ. E need not be flat. The left side is the restriction along f, not vanishing on all of F. The coefficient-map construction gains **TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero_iff_of_flat**: If E,Q,P are flat R-modules and u:Q→P is injective, then for every n≥0, I_n(θ_u)=0 if and only if I_n(θ)=0, where θ_u=(id_E⊗u)∘θ. No coefficient left inverse, finite basis, finite generation or integrability is required; the same exponent occurs on both sides.

Discriminating construction tests:

- **TwistedHiggsBundle.affineCoefficientMap.test_flat_nonsplit** (non-example): For E=Q=P=ℤ and u multiplication by 2, every specified ordered bound is equivalent before and after coefficient change, but there is no ℤ-linear v with v∘u=id.
- **TwistedHiggsBundle.affineCoefficientMap.test_projective_no_basis** (compatibility): For native projective R-modules E,Q,P and an injective u:Q→P, the coefficient-changed iterate vanishes exactly when the original iterate does, at every specified degree, without finite generation or any chosen basis.
- **TwistedHiggsBundle.affineOrderedIterate.test_flat_subobject** (compatibility): For a horizontal pair of injections f:E→F and u:Q→P with F,Q,P flat, an ambient zero iterate I_n(ψ)=0 gives I_n(θ)=0; E is an arbitrary module.
- **TwistedHiggsBundle.affineOrderedIterate.test_restriction_not_ambient** (non-example): Over ℤ let f(a)=(a,0) and ψ(a,b)=(0,b)⊗1. Then ψ∘f=0 and ψ≠0. Restricted vanishing does not assert ambient vanishing, even with free finite modules and the identity coefficient map.

The nonsplit test is stronger than checking identity or coefficient isomorphisms: any proposed ℤ-linear left inverse of multiplication by 2 would force 2v(1)=1. Reflection instead follows from the actual flat tensor-map induction. The inherited E=ℤ/2 example still rules out replacing flatness by mere coefficient injectivity. The subobject conclusion keeps composition with f: a field can vanish on the first summand and act nontrivially on the second. In degree zero the tensor unit detects the source module; it is not a positive nilpotence bound.

Sources read for this extension are [Heuer, arXiv v3, Definition 1.2](https://arxiv.org/html/2307.01303v3) for the field and horizontal-morphism convention, and [Stacks, Definition 10.39.1 and Lemma 10.39.5](https://stacks.math.columbia.edu/tag/00H9) for flatness and tensor preservation of injections. The finite tensor-power induction and the two Higgs-specific deductions are authored algebra, not attributed correspondence theorems. The pinned native flat tensor closure, projective-to-flat instance, equivalence transport and tensor-map injectivity proofs were read and reused. Historical broader source receipts remain historical.

All 105 inherited statements, hypotheses and acceptance conditions, the reserved key, six planets, five supplier requests, eleven gap entries, 149 routed source obligations and the 35 global omissions remain. Two existing constructions gain the displayed APIs, uses and tests. Arbitrary-Q cross-ring coherence, finite-projective chart restriction, sheaf equality detection/gluing, exterior integrability and the remaining source routes still require their recorded inputs. The narrower same-ring flat reflection does not close them.

### Flat-reflection validation

The [standalone native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/d94ef3bb3b47d21b8308c595f6e23055cd390a3a/research/blueprint/suggested/HodgeStructuresPartII.lean) contains the complete actual inherited iterate/naturality/coefficient definitions and proofs followed by the flat-reflection proof and tests. The archive marker is BEGIN/END ARCHIVED CHECKED HIGGS FLAT REFLECTION. Its SHA-256 is b1335d49069b99337ff05089cbfc8658ab2bb0da4e32dd5cedfb64d2d0ad04dc. The 517-line source elaborates at pinned Mathlib with Lean 4.34.0-rc2: nine examples, no errors, admissions or warnings; fourteen axiom audits contain only the standard kernel axioms. The two new public signatures and four example types match the submitted planning file.

The entire final suggested file, SHA-256 82a282d7a295d3c678c3fdc9462c64b8c6931ebccd4617053b08dc7662121b29, elaborates with 93 examples, zero errors, 228 admitted-declaration warnings and no other warnings. The packet checker reports no errors or warnings. Actual atlas assembly has stage graph 3022 vertices/8663 edges, own graph 107/199 and combined prerequisite graph 3124/8900; all are acyclic with zero unresolved references. Stage edges and unrelated pending/skipped links match the control. The current handoff records exact reproduction and remaining work; earlier receipts apply only to their original hashes.


## Arbitrary-coefficient scalar-extension continuation

The canonical affine field θ_S is the native linear-map scalar extension composed with the native tensor distributor. For a horizontal pair f:E→F and u:Q→P, this field construction preserves the actual horizontal equation. Taking f=id shows that scalar extension commutes with arbitrary coefficient postcomposition. No coefficient basis, finite generation, flatness, integrability or invertibility is needed for either equality. Applying the existing ordered naturality theorem over S gives an all-degree receiving-ring equation, including the degree-zero tensor unit.

If S is faithfully flat over R, evaluating θ_S on 1⊗e and undoing the tensor distributor detects θ(e) in E⊗_R Q. Thus θ_S=0 iff θ=0, without flatness of E or Q. The actual singleton tensor-power equivalence gives the corresponding degree-one iterate criterion. Torsion source/coefficient examples over ℤ check this generality; the field e↦2e⊗1 becomes zero over ℤ/2 and checks the need for faithful flatness in reflection. A horizontal test retains vanishing only on the image of f_S.

These are authored affine deductions motivated by [Heuer, §4.2, Theorem 4.8 and Remark 4.9](https://arxiv.org/html/2307.01303v3), whose local formula and displayed proof were freshly read. They do not discharge that analytic theorem or its chart independence. The predecessor's finite-basis all-degree scalar-extension contracts remain unchanged. Receiving-ring naturality alone does not identify I_n(θ_S) with scalar extension of I_n(θ): the arbitrary-Q cross-ring tensor-power unit/prepend coherence and comparison are still open, followed by finite-projective restriction and E1 sheaf equality detection/gluing. The complete new proof and exact final-sketch receipts are in the current handoff; inherited wider source receipts remain historical.

## Arbitrary-coefficient cross-ring ordered coherence — codex-a71f92

Read base: `f6de888f4ad723d376d77b66fa8486d538bd1aeb`. This is a partial affine checkpoint, not a closed H.0 stage or a global sheaf implementation. The reserved general parameter-connection carrier and all 149 binding route obligations remain unchanged.
Let E_S=S⊗_R E and Q_S=S⊗_R Q. Write α_R,n for the exact native singleton/multiplication/cast left-prepend equivalence already used by the ordered step. The adapter T_n is an actual equivalence, recursively built from native distributors, not an assumed comparison or a second tensor carrier. D_n is the binary distributor followed by id⊗T_n.
Fresh primary reading is limited to Heuer’s [arXiv v3](https://arxiv.org/html/2307.01303v3), Definition 1.2(1)–(2), Definition 4.1, Theorem 4.8(1)–(3), Remark 4.9 and the complete displayed proof. Download SHA-256: `ec7742d917b413a52d05e5eeffbab9fdaab3bed13412dc2c9e426ffb8bcb8081`, accessed 2026-10-02. The following arbitrary-ring tensor equations are authored algebraic deductions; the geometric correspondence and its descent are not proved here.

### Scalar extension of ordered coefficient powers

`HodgeStructuresPartII:H.0/affine-tensor-power-base-change` — `TwistedHiggsBundle.affineTensorPowerBaseChange` (construction).
Construct T_n:S⊗_R Q^⊗n≃_S Q_S^⊗n for every n≥0, with Q_S=S⊗_R Q. T_0 is the scalar extension of (R≃Q^⊗0)⁻¹ followed by S⊗_R R≃S and S≃Q_S^⊗0. T_(n+1) is the scalar extension of α_R,n⁻¹, followed by the native binary distributor, id_(Q_S)⊗T_n and α_S,n. No basis of Q is chosen.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `mathlib:TensorPower.algebraMap₀`, `mathlib:LinearEquiv.baseChange`, `mathlib:TensorProduct.AlgebraTensorModule.rid`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.congr`, `mathlib:PiTensorProduct.subsingletonEquiv`, `mathlib:TensorPower.mulEquiv`, `mathlib:TensorPower.cast`.

Proof plan:

1. At degree zero compose the three specified existing linear equivalences; no nontriviality assumption is used.
2. At a successor compose the four specified native linear equivalences. The private syntactic abbreviation α is exactly the singleton/multiplication/cast composite already used by affineOrderedStep, not a replacement tensor carrier.
3. Primitive recursion supplies the actual S-linear equivalence and its actual inverse at every degree; no comparison property or bijectivity is stored as an assumption.

API:

- `TwistedHiggsBundle.affineTensorPowerBaseChange_unit` (compatibility): For every a∈S, T_0(a⊗algebraMap₀_R(1))=algebraMap₀_S(a). In particular the empty coefficient word maps to the tensor unit, with no premise on Q.
- `TwistedHiggsBundle.affineTensorPowerBaseChange_prepend` (compatibility): For every n≥0, a∈S, q∈Q and t∈Q^⊗n, T_(n+1)(a⊗α_R,n(q⊗t))=α_S,n((a⊗q)⊗T_n(1⊗t)). This is the actual cross-ring prepend equation, not same-ring coefficient-map naturality.

Tests:

- `TwistedHiggsBundle.affineTensorPowerBaseChange.test_torsion_unit` (computation): For R=ℤ, S=ℤ/4 and Q=ℤ/2, T_0(a⊗1_0)=algebraMap₀(a) in Q_S^⊗0, for every a∈S. The coefficient module is not free over ℤ.
- `TwistedHiggsBundle.affineTensorPowerBaseChange.test_torsion_prepend` (compatibility): For R=S=ℤ, Q=ℤ/2, q∈Q and t∈Q^⊗1, T_2(1⊗α_R,1(q⊗t))=α_S,1((1⊗q)⊗T_1(1⊗t)). This keeps the new factor on the left without a coefficient basis.
- `TwistedHiggsBundle.affineTensorPowerBaseChange.test_nonflat_distributor` (characterisation): For R=ℤ, S=Q=ℤ/2, every n≥0 and x∈S⊗_R Q^⊗n, T_n⁻¹(T_n(x))=x. The distributor remains an equivalence although S is not flat over R; this alone does not reflect scalar-extended vanishing.

Uses:

- `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-unit`: Keep the empty-word tensor unit in the iterate comparison.
- `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-prepend`: Keep the coefficient order in the successor square.
- `HodgeStructuresPartII:H.0/affine-ordered-base-change`: Combine this coefficient-power adapter with the existing binary distributor.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension preserves the empty coefficient word

`HodgeStructuresPartII:H.0/affine-tensor-power-base-change-unit` — `TwistedHiggsBundle.affineTensorPowerBaseChange_unit` (lemma).
For every a∈S, T_0(a⊗algebraMap₀_R(1))=algebraMap₀_S(a). In particular the empty coefficient word maps to the tensor unit, with no premise on Q.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`, `mathlib:LinearEquiv.baseChange_tmul`, `mathlib:TensorProduct.AlgebraTensorModule.rid_tmul`.

Proof plan:

1. Unfold T_0, evaluate the scalar-extended inverse degree-zero equivalence, then the native right tensor unit. The two degree-zero inverse evaluations and 1 acting on a give the displayed equality.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension respects ordered coefficient prepending

`HodgeStructuresPartII:H.0/affine-tensor-power-base-change-prepend` — `TwistedHiggsBundle.affineTensorPowerBaseChange_prepend` (lemma).
For every n≥0, a∈S, q∈Q and t∈Q^⊗n, T_(n+1)(a⊗α_R,n(q⊗t))=α_S,n((a⊗q)⊗T_n(1⊗t)). This is the actual cross-ring prepend equation, not same-ring coefficient-map naturality.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`, `mathlib:LinearEquiv.baseChange_tmul`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`.

Proof plan:

1. Evaluate the successor definition on the specified elementary tensor, cancel α_R,n with its inverse, and use the existing binary distributor evaluation and tensor congruence. No permutation of the coefficient factors is made.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension of ordered iterate codomains

`HodgeStructuresPartII:H.0/affine-ordered-base-change` — `TwistedHiggsBundle.affineOrderedBaseChange` (construction).
Construct D_n:S⊗_R(E⊗_R Q^⊗n)≃_S E_S⊗_S Q_S^⊗n as the native binary distributor followed by id_(E_S)⊗T_n, at every n≥0. Both E and Q are arbitrary modules.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.congr`.

Proof plan:

1. Compose the existing binary distributor with tensor congruence for id_(E_S) and T_n. This introduces no new scalar-extension, tensor-product or module carrier.
2. Evaluate on elementary tensors using the binary distributor: D_n(a⊗(e⊗t))=(a⊗e)⊗T_n(1⊗t).

API:

- `TwistedHiggsBundle.affineOrderedBaseChange_tmul` (simp): For all n,a,e,t, D_n(a⊗(e⊗t))=(a⊗e)⊗T_n(1⊗t).
- `TwistedHiggsBundle.affineOrderedBaseChange_step` (compatibility): For every θ:E→E⊗_R Q and n≥0, D_(n+1)∘(S_θ,n)_S=S_(θ_S),n∘D_n as actual S-linear maps on S⊗_R(E⊗_R Q^⊗n).

Tests:

- `TwistedHiggsBundle.affineOrderedBaseChange.test_unit` (degenerate): For arbitrary R,S,E,Q and a∈S,e∈E, D_0(a⊗(e⊗1_0))=(a⊗e)⊗1_0 in E_S⊗_S Q_S^⊗0. No field or horizontal-morphism hypothesis is needed.
- `TwistedHiggsBundle.affineOrderedBaseChange.test_torsion_degree_two` (compatibility): For R=S=ℤ and E=Q=ℤ/2, D_2∘(I_2(θ))_S=I_2(θ_S) for every θ:E→E⊗_R Q. Neither E nor Q is flat over R.
- `TwistedHiggsBundle.affineOrderedBaseChange.test_zero_module` (degenerate): For E=(Fin 0→R), every n≥0 and x∈S⊗_R(E⊗_R Q^⊗n), D_n(x)=0, without any hypothesis on Q or S beyond the ring/algebra structure.

Uses:

- `HodgeStructuresPartII:H.0/affine-ordered-base-change-step`: Transport the actual successor step between rings.
- `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`: Compare the entire scalar-extended iterate, including the degree-zero unit.
- `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful`: Use the actual equivalence's injectivity before applying faithful-flat one-tensor detection.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension commutes with the ordered successor step

`HodgeStructuresPartII:H.0/affine-ordered-base-change-step` — `TwistedHiggsBundle.affineOrderedBaseChange_step` (lemma).
For every θ:E→E⊗_R Q and n≥0, D_(n+1)∘(S_θ,n)_S=S_(θ_S),n∘D_n as actual S-linear maps on S⊗_R(E⊗_R Q^⊗n).

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-base-change`, `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-prepend`, `HodgeStructuresPartII:H.0/affine-ordered-step`, `HodgeStructuresPartII:H.0/affine-base-change`, `mathlib:TensorProduct.AlgebraTensorModule.ext`, `mathlib:LinearMap.baseChange_tmul`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`.

Proof plan:

1. Use heterobasic tensor extensionality, then tensor induction to reduce the input to a⊗(e⊗t).
2. Expand the actual field and step maps before tensor-inducting on θ(e). Zero and sum cases follow from additivity; for x⊗q use the cross-ring prepend equation with scalar 1.
3. The E factor carries a; the new Q factor carries 1; remaining coefficients use T_n. Both sides thus have the same left-prepended ordered tensor.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension of every ordered Higgs iterate

`HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison` — `TwistedHiggsBundle.affineOrderedIterate_baseChange_comparison` (lemma).
For every θ:E→E⊗_R Q and n≥0, D_n∘(I_n(θ))_S=I_n(θ_S) as actual S-linear maps E_S→E_S⊗_S Q_S^⊗n. Here (I_n(θ))_S is native scalar extension of the source-ring iterate, whereas I_n(θ_S) is formed recursively over S. No coefficient basis or integrability premise is required.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-base-change`, `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-unit`, `HodgeStructuresPartII:H.0/affine-ordered-base-change-step`, `HodgeStructuresPartII:H.0/affine-ordered-iterate`, `HodgeStructuresPartII:H.0/affine-base-change`, `mathlib:LinearMap.baseChange_comp`.

Proof plan:

1. At n=0 evaluate on a⊗e, use the actual tensor-unit definition and the cross-ring degree-zero unit equation. Do not assume a zero field or discard the empty word.
2. At n+1 apply native baseChange_comp to the iterate recursion. Associate compositions, insert the promoted step square, then the inductive comparison. The result is precisely the receiving-ring recursion.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Preserve ordered nilpotence without a coefficient basis

`HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary` — `TwistedHiggsBundle.affineOrderedIterate_baseChange_zero_of_arbitrary_coefficients` (lemma).
For every specified n≥0 and every R-algebra S, I_n(θ)=0 implies I_n(θ_S)=0 at the identical n, for arbitrary R-modules E and Q. S need not be flat.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`, `mathlib:LinearMap.baseChange_zero`.

Proof plan:

1. Rewrite the receiving-ring iterate by the cross-ring comparison. Scalar extension of the zero source iterate is zero; composition with D_n remains zero. No finite-basis coordinate criterion is invoked.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Reflect ordered nilpotence without a coefficient basis

`HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful` — `TwistedHiggsBundle.affineOrderedIterate_baseChange_zero_iff_of_arbitrary_coefficients` (lemma).
If S is faithfully flat over R, then for every specified n≥0, I_n(θ_S)=0 if and only if I_n(θ)=0, for arbitrary modules E and Q. The exponent is unchanged, and no flatness or finiteness of E or Q is needed.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.
- Only this reflection result additionally assumes Module.FaithfullyFlat R S. This is a hypothesis on the algebra S, not on E or Q.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`, `HodgeStructuresPartII:H.0/affine-ordered-base-change`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary`, `mathlib:Module.FaithfullyFlat.one_tmul_eq_zero_iff`.

Proof plan:

1. For reflection evaluate the comparison on 1⊗e. The receiving iterate is zero, so injectivity of the actual D_n gives 1⊗I_n(θ)(e)=0.
2. Apply the native faithful-flat one-tensor detection theorem to the arbitrary module E⊗_R Q^⊗n; extensionality gives I_n(θ)=0.
3. For preservation apply the preceding arbitrary-algebra fixed-bound lemma. Nonfaithful extensions do not satisfy this equivalence.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Existing ordered-iterate API and new regression tests

Keep the finite-basis preservation/reflection contracts and their names unchanged; the general results have distinct names. The existing iterate construction gains the promoted comparison and two arbitrary-coefficient bound APIs above, plus these tests:
- `TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_preservation` (compatibility): For R=ℤ, E=ℤ/4, Q=ℤ/2 and S=ℤ/2, I_n(θ)=0 implies I_n(θ_S)=0 for every specified n≥0 and actual θ. The extension S and both coefficient/source modules are not flat; no reflection is asserted.
- `TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_reflection` (compatibility): For R=S=ℤ, E=ℤ/4 and Q=ℤ/2, I_n(θ_S)=0 iff I_n(θ)=0 at every specified n≥0 for every θ, using the faithfully flat identity algebra, without source or coefficient flatness.
- `TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_degree_zero` (non-example): If R is nontrivial and S is faithfully flat, the degree-zero receiving iterate of every θ:R→R⊗_R Q is nonzero, even for Q=0. Tensor nilpotence at exponent zero cannot mean the zero field.

### Exact boundary and checks

Current codex-a71f92 checkpoint supplies actual native arbitrary-Q affine cross-ring unit/prepend/step/iterate equations and all-degree same-exponent preservation and faithfully-flat reflection, including n=0; earlier affine missing-work wording above is retained as checkpoint history. Finite-projective chart restriction, sheaf tensor-power comparison/equality detection/gluing, exterior-integrability transport, globally uniform versus locally varying exponents, rank bounds and all global/source/supplier obligations remain open. This does not identify sheaf tensor sections with tensors of global sections or assert kernel/image base-change compatibility.
The full suggested file remains the admitted signature plan required by PROTOCOL §13. A distinct complete native proof, its immutable public archive and a portable read-only checker/assembly recipe are recorded in the handoff. All implementation statuses remain unchecked, every old contract and key carrier is retained, H.0 remains partial and H.1–H.8 remain not_read. No source route, supplier request, global omission or stage is closed.

### Native equivalence inverse API

`TwistedHiggsBundle.affineTensorPowerBaseChange_symm_apply` (characterisation): For every n≥0 and x∈S⊗_R Q^⊗n, T_n⁻¹(T_n(x))=x. The inverse is the actual inverse of the recursively composed native equivalences, with no flatness or basis premise.

The ordered-codomain distributor also exposes `TwistedHiggsBundle.affineOrderedIterate_baseChange_comparison` as its compatibility API, referring to the single promoted comparison node above. No duplicate theorem is introduced.


## Affine charts and local ordered nilpotence (Codex — codex-5ebb6f)

This partial continuation starts from the inherited checked arbitrary-coefficient tensor comparison. The field in a chart is the actual composite `(e ⊗ q) ∘ θ_S ∘ e⁻¹`. Both equivalences matter: negating only the coefficient chart negates the field. The coefficient factor is not absorbed into the source module.

These statements work for arbitrary modules over commutative rings, hence include finite-projective affine charts without chosen bases. A fixed bound descends by joint zero detection on `D(r)` for elements spanning the unit ideal. A localization need not be faithful individually. The module-zero detector and finite-subcover extraction are existing pinned library theorems, reused here.

### Twisted field in actual affine module charts

`TwistedHiggsBundle.affineChartField` — Construct θ_(S,e,q)=(e⊗q)∘θ_S∘e⁻¹:F→F⊗_S P. The source-ring field is scalar-extended by its actual native map before both module charts are applied; neither chart comparison nor horizontality is assumed as an oracle.

Compose the native scalar-extended field with e inverse on the source and the existing tensor map of e and q on the target. Apply e inverse to e(x) to obtain the actual horizontal square; zero and reflexive charts reduce by native composition laws.

- `TwistedHiggsBundle.affineChartField_horizontal`: θ_(S,e,q)∘e=(e⊗q)∘θ_S as actual S-linear maps.
- `TwistedHiggsBundle.affineChartField_zero`: The chart field of θ=0 is zero for every S and both actual chart equivalences.
- `TwistedHiggsBundle.affineChartField_refl`: With reflexive e and q, the chart field is exactly θ_S, with no flatness assumption.
- `TwistedHiggsBundle.affineOrderedIterate_chart_comparison`: For every n≥0, I_n(θ_(S,e,q))∘e=(e⊗q^⊗n)∘D_n∘baseChange(I_n(θ)).
- `TwistedHiggsBundle.affineOrderedIterate_chart_zero_iff`: At every specified n≥0, I_n(θ_(S,e,q))=0 iff I_n(θ_S)=0. This is reflection between receiving-ring charts, not reflection to R along a single localization.
- `TwistedHiggsBundle.affineOrderedIterate_chart_zero_of`: If I_n(θ)=0, then I_n(θ_(S,e,q))=0 for every algebra S and actual chart, at the identical n.

- `TwistedHiggsBundle.affineChartField.test_refl` (compatibility): For every θ and S, chart transport through reflexive module equivalences is exactly affineBaseChange S θ.
- `TwistedHiggsBundle.affineChartField.test_zero` (degenerate): For every S and arbitrary e,q, affineChartField S 0 e q=0.
- `TwistedHiggsBundle.affineChartField.test_coeff_sign` (computation): With reflexive e and q equal to negation on Q_S, affineChartField S θ e q=(-1:S)•θ_S. This detects a definition that forgets the coefficient chart.
- `TwistedHiggsBundle.affineChartField.test_projective_unbased` (compatibility): For projective E,Q with no chosen bases, I_n(θ)=0 implies I_n(affineChartField S θ refl refl)=0 for every n and S.
- `TwistedHiggsBundle.affineChartField.test_noncover_erasure` (non-example): Over R=ℤ take E=ℤ/2, Q=ℤ and θ the inverse right tensor unit. Then θ≠0 but affineBaseChange (Localization.Away 2) θ=0. D(2) alone does not cover Spec ℤ. This is an arbitrary-module counterexample, not a finite-locally-free example.
- `TwistedHiggsBundle.affineChartField.test_two_principal_opens` (characterisation): For R=ℤ, E=ℤ/4 and Q=ℤ/2, every θ and n≥0 satisfy: I_n(θ)=0 iff I_n(θ_(R[1/r]))=0 for every r∈{2,3}. These opens cover although neither localization is faithfully flat over ℤ.
- `TwistedHiggsBundle.affineChartField.test_degree_zero_cover` (degenerate): For nontrivial R, E=R, arbitrary Q and every principal cover spanning 1, it is impossible that every localized I_0(θ) is zero. The empty ordered word remains the tensor unit.

### Ordered iterates in actual affine charts

`TwistedHiggsBundle.affineOrderedIterate_chart_comparison` — For every n≥0, I_n(θ_(S,e,q))∘e=(e⊗q^⊗n)∘D_n∘baseChange(I_n(θ)).

Use the proved chart horizontal square in the inherited receiving-ring ordered naturality theorem. Insert the actual cross-ring iterate comparison D_n∘baseChange(I_n(θ))=I_n(θ_S), retaining n=0 and coefficient order.

### Fixed bound is independent of affine coordinates

`TwistedHiggsBundle.affineOrderedIterate_chart_zero_iff` — At every specified n≥0, I_n(θ_(S,e,q))=0 iff I_n(θ_S)=0. This is reflection between receiving-ring charts, not reflection to R along a single localization.

Apply the inherited equivalence criterion to e and q and the proved horizontal square. Tensor powers of q are actual native linear equivalences. Use e surjectivity for the reverse direction and tensor-equivalence injectivity for the forward direction. This does not assume R→S faithful.

### Fixed bound restricts to every affine chart

`TwistedHiggsBundle.affineOrderedIterate_chart_zero_of` — If I_n(θ)=0, then I_n(θ_(S,e,q))=0 for every algebra S and actual chart, at the identical n.

Preserve the source-ring zero at the same n under arbitrary scalar extension, then transfer it through the two actual chart equivalences. No coefficient basis or projectivity is used.

### Detect an ordered bound on a principal cover

`TwistedHiggsBundle.affineOrderedIterate_away_cover_zero_iff` — If Ideal.span s=R and A_r=R[1/r] (or any actual away localization), then for every fixed n≥0, I_n(θ)=0 iff I_n(θ_(A_r))=0 for every r∈s. E,Q are arbitrary; individual R→A_r maps need not be faithful.

For each x∈E evaluate the actual cross-ring comparison on 1⊗x. Vanishing of each receiving iterate and D_n injectivity give 1⊗I_n(θ)(x)=0 in A_r⊗_R(E⊗_R Q^⊗n). The native unit-tensor map is a localized-module map. Apply the existing joint module-zero detector for the unit-ideal cover, then use linear-map extensionality. The converse is inherited arbitrary-algebra bound preservation; no new generic locality theorem is planned.

### Detect a bound through arbitrary module charts

`TwistedHiggsBundle.affineOrderedIterate_chart_cover_zero_iff` — For a principal cover s spanning 1, actual A_r-localized modules and arbitrary chart isomorphisms e_r:A_r⊗E≃F_r, q_r:A_r⊗Q≃P_r, I_n(θ)=0 iff I_n(θ_(A_r,e_r,q_r))=0 for every r, at the identical specified n≥0.

Apply the chart zero equivalence on each receiving ring; replace each local chart zero by its actual scalar-extended field zero. Apply the preceding principal-cover zero criterion. This supplies finite-projective charts as a special case without choosing bases or asserting global freeness.

### A positive bound from finitely many chart bounds

`TwistedHiggsBundle.affineOrderedIterate_finite_chart_bound` — If s spans 1, its subtype is finite, and each chart has a specified bound N(r) with I_(N(r))(θ_(A_r,e_r,q_r))=0, then I_(1+sup_(r∈s)N(r))(θ)=0. The actual finite supremum makes the global exponent positive, even for the empty zero-ring cover; local bounds are not assumed equal.

Each N(r) is at most the finite supremum and hence at most 1 plus that supremum. Use ordered-iterate monotonicity on every receiving chart, then jointly detect the common zero. This changes local exponents explicitly; it does not assert identical local bounds.

### Ordered nilpotence is affine local

`TwistedHiggsBundle.affineOrderedIterate_chart_local_nilpotent_iff` — For any principal cover s spanning 1, possibly infinitely indexed, every local chart has some positive vanishing ordered iterate iff θ has some positive globally vanishing ordered iterate. The positive global exponent is extracted from a finite principal subcover, and is not claimed equal to every local exponent.

Choose the given positive local exponents, then use the native unit-ideal finite-subset theorem to extract a finite principal subcover. Restrict the actual rings, module charts and exponent function along the subtype inclusion. Reuse their away-localization instances and apply the finite bound theorem to obtain 1 plus the finite maximum. For the converse use the one positive global exponent on every chart by arbitrary-algebra preservation. Affine finite-subcover extraction is essential; this theorem makes no claim about a general non-quasi-compact ringed site.

A prescribed common exponent stays unchanged on all charts. Varying local exponents on a finite cover give the explicit positive global bound `1 + max N(r)`. Even for an infinitely indexed affine principal cover, the unit-ideal hypothesis supplies a finite subcover before taking a maximum. This uses affineness; it does not give a uniform exponent on every general ringed site.

The counterexample uses the inverse right unit on ℤ/2: it is nonzero over ℤ and vanishes after inverting 2. The proper cover by D(2),D(3) detects every specified bound for E=ℤ/4,Q=ℤ/2. Degree zero stays the tensor unit and cannot vanish on every chart when E=R and R is nontrivial.

Fresh primary reading: [Stacks tag 00EN](https://stacks.math.columbia.edu/tag/00EN), complete Lemmas 10.23.1–10.23.2 and proofs. Its generic locality results motivate the authored ordered-field deductions; it does not state the new Higgs theorems. The earlier Heuer/Esnault–Groechenig/Liu–Zhu receipts remain historical.

Current codex-5ebb6f affine-local checkpoint proves actual chart transport and ordered comparison, fixed-bound detection through a unit-ideal principal cover, and a positive finite-subcover bound for varying local exponents. Finite-projective modules are included without bases. This does not construct actual sheaf restriction identifications, sheaf tensor powers, equality detection or gluing: discharge the E1 request on the native module-sheaf carrier before upgrading the affine statement to a global ringed-site theorem. Non-quasi-compact sites need separate uniformity hypotheses. Exterior-integrability transport, rank bounds, period/Tate adapters, all source routes and H.1–H.8 remain open.

All nodes remain unchecked plans. A separate archived native proof tests this affine slice; no generic module/sheaf carrier, E1 implementation, global integrability or paper correspondence is supplied here.


## Affine chart overlap coherence — 2026-10-03 checkpoint

This continuation supplies the affine field agreement needed before chart descent. Both chart pairs identify the same scalar-extended E and Q over the same receiving ring S. No bases or finiteness hypotheses are used. Actual sheaf tensor/restriction identifications and equality detection/gluing remain E1 supplier obligations. These are plans, with separate checked native proofs; all implementations remain unchecked.

### Unique field in a specified affine chart

Declaration: `TwistedHiggsBundle.affineChartField_eq_iff_horizontal` (`HodgeStructuresPartII:H.0/affine-chart-field-uniqueness`).

For every S-linear ψ:F₁→F₁⊗_S P₁, ψ=θ₁ if and only if ψ∘e₁=(e₁⊗q₁)∘θ_S.

Hypotheses and conventions:

R and S are commutative rings with a specified R-algebra S. E,Q are arbitrary R-modules. For i=1,2, e_i:S⊗_R E≃_S F_i and q_i:S⊗_R Q≃_S P_i are actual native linear equivalences. No basis, flatness, finite generation, projectivity or exterior-integrability assumption is needed.

Write θ_i=(e_i⊗q_i)∘θ_S∘e_i⁻¹, a_i=e_i⁻¹.trans(e_j) and b_i=q_i⁻¹.trans(q_j), where trans applies its right argument after its left. I_n is the inherited left-prepended ordered tensor iterate, with the tensor unit at n=0. Both charts must identify the same receiving-ring modules.

For restrictions to a common overlap ring, first obtain the actual scalar-extension and restriction identifications from the E1 supplier. These affine statements neither supply a ringed-site sheaf tensor comparison nor prove equality detection or gluing. No individual nonfaithful scalar extension reflects a source-ring field merely because its receiving charts agree.

Proof plan: The forward implication is the existing actual horizontal square. For the reverse implication evaluate the horizontal equality on e₁⁻¹(x), cancel e₁e₁⁻¹, and compare with the actual definition of θ₁. Surjectivity is supplied by the equivalence, not an extra stored equality.

Prerequisites: `HodgeStructuresPartII:H.0/affine-chart-field`, `mathlib:LinearEquiv.apply_symm_apply`.

### Horizontal transition between affine field charts

Declaration: `TwistedHiggsBundle.affineChartField_transition` (`HodgeStructuresPartII:H.0/affine-chart-field-transition`).

Put a=e₁⁻¹.trans(e₂):F₁≃_S F₂ and b=q₁⁻¹.trans(q₂):P₁≃_S P₂. Then θ₂∘a=(a⊗b)∘θ₁ as actual S-linear maps.

Proof plan: Expand only the actual affine chart-field composites. The left side evaluates θ_S on e₁⁻¹(x) after cancellation in e₂. Use native TensorProduct.map_map on the right. Cancel e₁⁻¹e₁ and q₁⁻¹q₁; both sides become (e₂⊗q₂)(θ_S(e₁⁻¹(x))). The coefficient transition is indispensable.

Prerequisites: `HodgeStructuresPartII:H.0/affine-chart-field`, `mathlib:TensorProduct.map_map`, `mathlib:LinearEquiv.trans_apply`, `mathlib:LinearEquiv.symm_apply_apply`.

### Ordered iterate agreement on affine chart overlaps

Declaration: `TwistedHiggsBundle.affineOrderedIterate_chart_transition` (`HodgeStructuresPartII:H.0/affine-chart-iterate-transition`).

For the same a and b and every n≥0, I_n(θ₂)∘a=(a⊗b^⊗n)∘I_n(θ₁). Here b^⊗n is the actual PiTensorProduct.map on Fin n, including the empty tensor unit.

Proof plan: Apply the inherited actual ordered-iterate naturality to the proved field-transition square with f=a and u=b. Its base case uses Fin 0 and the tensor unit, and its successor preserves the inherited ordered prepend. No coefficient basis or bound rescaling is introduced.

Prerequisites: `HodgeStructuresPartII:H.0/affine-chart-field-transition`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-natural`.

### Chart API acceptance tests

`TwistedHiggsBundle.affineChartField.test_horizontal_unique` (characterisation): Any two S-linear candidate chart fields satisfying the actual horizontal square with the same e and q are equal. The inverse chart determines the value on every section.

`TwistedHiggsBundle.affineChartField.test_chart_roundtrip` (compatibility): At every n≥0, reversing the two charts reverses both module transitions and gives the reverse ordered-iterate square, with no bound change.

`TwistedHiggsBundle.affineChartField.test_empty_word_transition` (degenerate): For every input x, the degree-zero iterate in the second chart sends a(x) to a(x)⊗1 in F₂⊗_S P₂^⊗0. It is independent of the first coefficient chart; the value remains the tensor unit rather than an imposed zero value.

`TwistedHiggsBundle.affineChartField.test_sign_overlap` (computation): With identity E-charts, first coefficient chart identity and second coefficient chart negation, I_n(θ₂)=(id⊗neg^⊗n)∘I_n(θ_S) for every n, including zero.

`TwistedHiggsBundle.affineChartField.test_missing_coefficient_transition` (non-example): Over ℤ, (id⊗neg)(1⊗1)≠1⊗1, as detected by the native right tensor unit. Omitting the coefficient transition gives the wrong square even in rank one.

`TwistedHiggsBundle.affineChartField.test_triple_overlap` (compatibility): For three arbitrary chart pairs of the same θ_S, the two successive E-transitions and two successive Q-transitions give exactly the direct 1→3 ordered-iterate square for every n. Native equivalence cancellation proves the cocycle; no generic cocycle construction is replanned.

Source: [Heuer, published paper](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition 1.2(2), p.262 and Definition 4.1/Remark 4.2, pp.297–298, selected passages read 2026-10-03. The affine chart equations are authored deductions; no global Simpson equivalence or new generic sheaf descent carrier is claimed.

Current codex-J6LwjP chart-overlap checkpoint supplies unique affine chart fields, actual horizontal two-chart transition and all-degree ordered-iterate transition, including tensor-unit and triple-overlap checks. Before global restriction/descent, discharge E1’s actual sheaf tensor-power comparison, restriction identifications and equality detection/gluing. Exterior-integrability transport, global determinant/Tate adapters, rank bounds, all 149 source obligations and H.1–H.8 remain open.

The three new declarations are API entries of the existing affineChartField construction. Its previous contracts, six API items, seven tests and all inherited source routes are retained. The test labels above correspond to six new planning examples.


## Affine exterior integrability and chart comparison

The actual native affine exterior square, horizontal naturality, module/coefficient-equivalence reflection, receiving-chart transition, arbitrary-characteristic two-direction commutator formula and split-coefficient detection are now supplied as plans with separate checked native proofs. The full two-coordinate integrability criterion and scalar unit field at every ordered degree are checked, including characteristic two and integrability without nilpotence. Still supply the arbitrary-Q cross-ring exterior projection/base-change comparison, the global Ω²⊗T² identification, finite-projective sheaf restriction/exterior comparison, equality detection/gluing, the full arbitrary finite-basis coordinate criterion and every inherited rank, determinant/Tate, period, supplier and source obligation. These affine proofs do not compare a sheaf tensor with tensors of global sections or reflect source-ring curvature through a nonfaithful extension.

Define κ(θ) by projecting the actual second ordered coefficient tensor to the actual native exterior square. The projection is the existing Tau Ceti fromTensorPower definition, transparently expanded to its Mathlib multilinear lift here; it is not a new generic exterior construction. The target is E⊗Λ²Q. The global twisted identification Λ²(Ω¹⊗T)≃Ω²⊗T² and the sheaf calculus remain supplier work.

A horizontal square for f,u induces the exterior square for f,Λ²u. Actual inverses reflect zero without flatness. Two receiving charts identify the same S-modules before this comparison applies; no source-ring reflection or cross-ring exterior comparison follows merely from chart agreement.

For θ(e)=A(e)⊗q+B(e)⊗r, the inherited prepend convention gives κ(θ)(e)=[A,B](e)⊗(q∧r). Repeated arguments vanish and swapping gives a minus sign; neither step divides by two. Commutativity suffices for integrability with arbitrary directions. The converse requires the actual unit-value exterior functional. For the standard two-coordinate chart the native exterior-dual pairing supplies that functional over any commutative ring. Dependent directions give an essential counterexample to an unconditional converse.

The scalar unit field is integrable, but its actual n-th iterate evaluates to the constant unit tensor word and is nonzero at every n, including zero. The native multilinear product and tensor unitor detect the value one. This separates integrability from ordered tensor nilpotence even in a reduced rank-one chart. The E12/E21 examples detect exterior curvature over ℤ and ℤ/2. These are actual module-chart tests, not a construction of a geometric affine-space differential calculus.

### Exterior square of an affine Higgs field

Declaration: TwistedHiggsBundle.affineExteriorSquare.

For arbitrary R-modules E,Q and an R-linear field θ:E→E⊗Q, construct κ(θ)=(id_E⊗π₂)∘I₂(θ):E→E⊗Λ²_R Q. Here π₂ is the existing native tensor-power exterior projection, implemented by its exact Mathlib multilinear-lift expression; I₂ is the inherited left-prepended ordered iterate. No division by two or integrability premise occurs.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Apply the existing native exterior projection to the coefficient factor of the actual second ordered iterate. Its pure-word value is the native alternating exterior product, not an antisymmetrization divided by two. Retain the full target E⊗Λ²_R Q, even when Q is torsion, not flat or not finitely generated.

Prerequisites: HodgeStructuresPartII:H.0/affine-ordered-iterate, mathlib:PiTensorProduct.lift, mathlib:exteriorPower.ιMulti, tauceti:exteriorPower.fromTensorPower.

API TwistedHiggsBundle.affineExteriorSquare_zero (compatibility): For arbitrary E,Q, κ(0)=0.

API TwistedHiggsBundle.affineExteriorSquare_natural (compatibility): If ψ∘f=(f⊗u)∘θ for actual R-linear maps f:E→F and u:Q→P, then κ(ψ)∘f=(f⊗Λ²u)∘κ(θ). No injectivity, surjectivity, basis, flatness or integrability assumption is required.

API TwistedHiggsBundle.affineExteriorSquare_equiv_zero_iff (compatibility): For a horizontal pair of native linear equivalences f:E≃F and u:Q≃P, κ(ψ)=0 if and only if κ(θ)=0. Neither coefficient nor module flatness is needed.

API TwistedHiggsBundle.affineExteriorSquare_coefficientMap (compatibility): For every actual coefficient map u:Q→P, κ(θ_u)=(id_E⊗Λ²u)∘κ(θ), where θ_u is the inherited actual coefficient postcomposition.

API TwistedHiggsBundle.affineExteriorSquare_coefficientMap_zero (compatibility): If κ(θ)=0, then κ(θ_u)=0 for every R-linear coefficient map u, including zero and quotient maps.

API TwistedHiggsBundle.affineExteriorSquare_coefficientEquiv_zero_iff (compatibility): For every native linear equivalence u:Q≃P, κ(θ_u)=0 if and only if κ(θ)=0.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection (compatibility): For the actual two-direction field, κ(θ)(e)=(A(B(e))−B(A(e)))⊗(q∧r) for every e. The sign follows the inherited left-prepended order. This holds over every commutative ring, including characteristic two.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_of_commute (compatibility): If A∘B=B∘A, then κ(θ)=0 for the actual two-direction field, for arbitrary q,r.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_iff (compatibility): Suppose an actual linear functional ℓ:Λ²_R Q→R satisfies ℓ(q∧r)=1. Then κ(θ)=0 if and only if A∘B=B∘A for the two-direction field. This unit-value hypothesis is essential; arbitrary dependent directions do not detect commutation.

API TwistedHiggsBundle.affineExteriorSquare_twoCoordinates_zero_iff (compatibility): For Q=R×R, q=(1,0) and r=(0,1), the actual two-direction field has κ(θ)=0 if and only if A∘B=B∘A. E is an arbitrary R-module and R is an arbitrary commutative ring; no characteristic restriction or basis of E occurs.

API TwistedHiggsBundle.affineExteriorSquare_chart_transition (compatibility): For two actual charts of the same receiving-ring scalar extensions, with θ_i the inherited chart field, a=e₂∘e₁⁻¹ and b=q₂∘q₁⁻¹, κ(θ₂)∘a=(a⊗Λ²b)∘κ(θ₁). Every exterior power is over the receiving ring S. This is a chart-transition equation, not a comparison with scalar extension of the source-ring exterior square.

API TwistedHiggsBundle.affineExteriorSquare_chart_zero_iff (compatibility): For those two charts of the same S-modules, κ(θ₂)=0 if and only if κ(θ₁)=0. An individual nonfaithful R→S extension is not asserted to reflect the original source-ring exterior square.

Test TwistedHiggsBundle.affineExteriorSquare.test_zero (degenerate): The actual zero field on arbitrary E,Q has zero exterior square.

Test TwistedHiggsBundle.affineExteriorSquare.test_torsion_coefficients (compatibility): For E=ℤ, Q=ℤ/2, P=ℤ/3 and every actual θ:E→E⊗Q, postcomposition by the zero coefficient map has zero exterior square; no flat coefficient or basis exists here.

Test TwistedHiggsBundle.affineExteriorSquare.test_scalar_line (non-example): For the actual unit field θ on E=Q=ℤ, κ(θ)=0 and the actual associator-defined ordered square is nonzero.

Test TwistedHiggsBundle.affineExteriorSquare.test_noncommuting_integer (non-example): For E=Q=ℤ×ℤ, A=E12 and B=E21 as the actual inl/snd and inr/fst composites, the standard two-direction field has nonzero exterior square.

Test TwistedHiggsBundle.affineExteriorSquare.test_noncommuting_char_two (non-example): The same actual E12/E21 field on E=Q=(ℤ/2)×(ℤ/2) has nonzero exterior square. No division by two or characteristic-zero premise is valid.

Test TwistedHiggsBundle.affineExteriorSquare.test_coefficient_erasure (non-example): The actual noncommuting ℤ two-coordinate field has nonzero exterior square, but its postcomposition by the zero coefficient map to ℤ has zero exterior square. Arbitrary coefficient maps do not reflect integrability.

Test TwistedHiggsBundle.affineExteriorSquare.test_coefficient_equiv (compatibility): For every actual coefficient equivalence u:Q≃P, exterior integrability of θ_u is equivalent to exterior integrability of θ.

Test TwistedHiggsBundle.affineChartField.test_exterior_transition (degenerate): The actual two-direction field is zero when both operators are zero, for arbitrary coefficient directions.

Test TwistedHiggsBundle.affineChartField.test_exterior_zero_iff (degenerate): The actual two-direction field is zero when both operators are zero, for arbitrary coefficient directions.

Test TwistedHiggsBundle.affineExteriorSquare.test_degree_two_not_nilpotence (non-example): The actual unit field on ℤ has zero exterior square and a nonzero degree-two ordered tensor-power iterate.

Test TwistedHiggsBundle.affineExteriorSquare.test_integrable_not_nilpotent (non-example): The actual unit field on ℤ has zero exterior square, while every actual ordered iterate at every n≥0 is nonzero. Exterior integrability cannot replace tensor nilpotence.

### Exterior square of the zero field

Declaration: TwistedHiggsBundle.affineExteriorSquare_zero.

For arbitrary E,Q, κ(0)=0.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Unfold the two successors in the actual ordered iterate. The zero field makes the positive iterate zero, and exterior projection preserves zero.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square, HodgeStructuresPartII:H.0/affine-ordered-iterate, HodgeStructuresPartII:H.0/affine-ordered-step.

### Exterior square under a horizontal morphism

Declaration: TwistedHiggsBundle.affineExteriorSquare_natural.

If ψ∘f=(f⊗u)∘θ for actual R-linear maps f:E→F and u:Q→P, then κ(ψ)∘f=(f⊗Λ²u)∘κ(θ). No injectivity, surjectivity, basis, flatness or integrability assumption is required.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Apply the inherited ordered-iterate naturality at degree two. Use the existing exterior-projection naturality; its exact pinned proof compares pure tensor words via the native exterior map on alternating generators. Compose the two actual linear-map squares.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square, HodgeStructuresPartII:H.0/affine-ordered-iterate-natural, tauceti:exteriorPower.map_comp_fromTensorPower, mathlib:exteriorPower.map_apply_ιMulti.

### Integrability under module and coefficient equivalences

Declaration: TwistedHiggsBundle.affineExteriorSquare_equiv_zero_iff.

For a horizontal pair of native linear equivalences f:E≃F and u:Q≃P, κ(ψ)=0 if and only if κ(θ)=0. Neither coefficient nor module flatness is needed.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Construct the actual left inverse f⁻¹⊗Λ²(u⁻¹) using native tensor and exterior functor composition. It makes f⊗Λ²u injective. Evaluate the horizontal exterior square to reflect zero through this injection. Preserve zero using surjectivity of f.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-natural, mathlib:exteriorPower.map_comp, mathlib:exteriorPower.map_id, mathlib:LinearMap.injective_of_comp_eq_id.

### Exterior square after changing coefficients

Declaration: TwistedHiggsBundle.affineExteriorSquare_coefficientMap.

For every actual coefficient map u:Q→P, κ(θ_u)=(id_E⊗Λ²u)∘κ(θ), where θ_u is the inherited actual coefficient postcomposition.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use horizontal naturality with f=id_E and the defining coefficient-map square.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-natural, HodgeStructuresPartII:H.0/affine-coefficient-map.

### Coefficient maps preserve integrability

Declaration: TwistedHiggsBundle.affineExteriorSquare_coefficientMap_zero.

If κ(θ)=0, then κ(θ_u)=0 for every R-linear coefficient map u, including zero and quotient maps.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Substitute the zero exterior square in the proved coefficient-map equation.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-coefficient-map.

### Coefficient equivalences reflect integrability

Declaration: TwistedHiggsBundle.affineExteriorSquare_coefficientEquiv_zero_iff.

For every native linear equivalence u:Q≃P, κ(θ_u)=0 if and only if κ(θ)=0.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use the module identity equivalence and the specified coefficient equivalence in the horizontal zero-reflection theorem.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-equiv, HodgeStructuresPartII:H.0/affine-coefficient-map.

### An affine field with two coefficient directions

Declaration: TwistedHiggsBundle.affineTwoDirectionField.

For A,B∈End_R(E) and arbitrary q,r∈Q, construct the actual R-linear field θ(e)=A(e)⊗q+B(e)⊗r by the native bilinear tensor constructor. The directions need not be a basis or independent, and A,B need not commute.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Compose the native linear map e↦e⊗q with A, compose e↦e⊗r with B, and add the resulting actual linear maps.

Prerequisites: mathlib:TensorProduct.mk.

API TwistedHiggsBundle.affineTwoDirectionField_apply (projection): For every e, the constructed two-direction field evaluates to A(e)⊗q+B(e)⊗r.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection (compatibility): For the actual two-direction field, κ(θ)(e)=(A(B(e))−B(A(e)))⊗(q∧r) for every e. The sign follows the inherited left-prepended order. This holds over every commutative ring, including characteristic two.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_of_commute (compatibility): If A∘B=B∘A, then κ(θ)=0 for the actual two-direction field, for arbitrary q,r.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_iff (compatibility): Suppose an actual linear functional ℓ:Λ²_R Q→R satisfies ℓ(q∧r)=1. Then κ(θ)=0 if and only if A∘B=B∘A for the two-direction field. This unit-value hypothesis is essential; arbitrary dependent directions do not detect commutation.

API TwistedHiggsBundle.affineExteriorSquare_twoCoordinates_zero_iff (compatibility): For Q=R×R, q=(1,0) and r=(0,1), the actual two-direction field has κ(θ)=0 if and only if A∘B=B∘A. E is an arbitrary R-module and R is an arbitrary commutative ring; no characteristic restriction or basis of E occurs.

Test TwistedHiggsBundle.affineTwoDirectionField.test_apply (computation): The actual two-direction field evaluates at each e to A(e)⊗q+B(e)⊗r.

Test TwistedHiggsBundle.affineTwoDirectionField.test_zero (degenerate): The actual two-direction field is zero when both operators are zero, for arbitrary q,r.

Test TwistedHiggsBundle.affineTwoDirectionField.test_dependent_directions (non-example): With q=r, the actual two-direction field has zero exterior square for every pair A,B, even when the operators do not commute. Directions without a detection hypothesis cannot give the converse.

Test TwistedHiggsBundle.affineTwoDirectionField.test_commutator_detection (characterisation): For Q=R×R and the actual standard coordinate vectors, the field has zero exterior square exactly when A∘B=B∘A, for arbitrary R and E.

### Evaluation of the two-direction field

Declaration: TwistedHiggsBundle.affineTwoDirectionField_apply.

For every e, the constructed two-direction field evaluates to A(e)⊗q+B(e)⊗r.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Read the value of the two tensor-constructor composites; this is definitional.

Prerequisites: HodgeStructuresPartII:H.0/affine-two-direction-field.

### Commutator formula for the exterior square

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoDirection.

For the actual two-direction field, κ(θ)(e)=(A(B(e))−B(A(e)))⊗(q∧r) for every e. The sign follows the inherited left-prepended order. This holds over every commutative ring, including characteristic two.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use the proved comparison with the associator-defined ordered square. Expand all four actual pure tensor terms. The diagonal terms vanish because repeated arguments of the native alternating map vanish. Swap r,q to obtain minus q,r, without dividing by two. Collect the two off-diagonal terms in the module factor to obtain the stated commutator, with the rightmost endomorphism acting first.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square, HodgeStructuresPartII:H.0/affine-two-direction-apply, HodgeStructuresPartII:H.0/affine-ordered-iterate-two, HodgeStructuresPartII:H.0/affine-ordered-square, mathlib:PiTensorProduct.lift.tprod, mathlib:AlternatingMap.map_eq_zero_of_eq, mathlib:AlternatingMap.map_swap.

### Commuting operators give an integrable two-direction field

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_of_commute.

If A∘B=B∘A, then κ(θ)=0 for the actual two-direction field, for arbitrary q,r.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Evaluate the commutator formula at every e and substitute the specified equality of the two composites.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-two-direction.

### A split exterior coefficient detects commutation

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_iff.

Suppose an actual linear functional ℓ:Λ²_R Q→R satisfies ℓ(q∧r)=1. Then κ(θ)=0 if and only if A∘B=B∘A for the two-direction field. This unit-value hypothesis is essential; arbitrary dependent directions do not detect commutation.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. ℓ is an actual R-linear functional on the full native exterior square, and ℓ(q∧r)=1. It is neither a stored zero-reflection oracle nor an omitted independence condition.

Proof: Apply id_E⊗ℓ and the tensor right unitor to each value of the commutator formula. The actual unit value makes the resulting map the identity on the commutator vector. For the converse, apply the proved commuting-operator lemma.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-two-direction, HodgeStructuresPartII:H.0/affine-exterior-two-direction-commute.

### Integrability in the native two-coordinate chart

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoCoordinates_zero_iff.

For Q=R×R, q=(1,0) and r=(0,1), the actual two-direction field has κ(θ)=0 if and only if A∘B=B∘A. E is an arbitrary R-module and R is an arbitrary commutative ring; no characteristic restriction or basis of E occurs.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use the actual native exterior-dual functional determined by the coordinate projections fst,snd. Its value on q∧r is the determinant of the identity two-by-two matrix, hence one over every commutative ring. Apply the split-coefficient detection lemma.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-two-direction-detection, mathlib:exteriorPower.alternatingMapToDual, mathlib:exteriorPower.alternatingMapToDual_apply_ιMulti.

### Exterior square on affine chart overlaps

Declaration: TwistedHiggsBundle.affineExteriorSquare_chart_transition.

For two actual charts of the same receiving-ring scalar extensions, with θ_i the inherited chart field, a=e₂∘e₁⁻¹ and b=q₂∘q₁⁻¹, κ(θ₂)∘a=(a⊗Λ²b)∘κ(θ₁). Every exterior power is over the receiving ring S. This is a chart-transition equation, not a comparison with scalar extension of the source-ring exterior square.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. S is a commutative R-algebra. For i=1,2 the actual e_i:S⊗_R E≃_S F_i and q_i:S⊗_R Q≃_S P_i identify the same receiving-ring scalar extensions. Sheaf restriction/exterior/twist comparisons and equality detection/gluing remain E1 supplier obligations.

Proof: Apply exterior horizontal naturality over S to the proved actual chart-transition square.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-natural, HodgeStructuresPartII:H.0/affine-chart-field-transition.

### Integrability is independent of the receiving chart

Declaration: TwistedHiggsBundle.affineExteriorSquare_chart_zero_iff.

For those two charts of the same S-modules, κ(θ₂)=0 if and only if κ(θ₁)=0. An individual nonfaithful R→S extension is not asserted to reflect the original source-ring exterior square.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. S is a commutative R-algebra. For i=1,2 the actual e_i:S⊗_R E≃_S F_i and q_i:S⊗_R Q≃_S P_i identify the same receiving-ring scalar extensions. Sheaf restriction/exterior/twist comparisons and equality detection/gluing remain E1 supplier obligations.

Proof: Use the actual module and coefficient transition equivalences in the exterior zero-reflection theorem.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-equiv, HodgeStructuresPartII:H.0/affine-chart-field-transition.

### Every ordered iterate of the scalar unit field

Declaration: TwistedHiggsBundle.affineOrderedIterate_unitField.

For θ(e)=e⊗1 on E=Q=R, every n≥0 satisfies I_n(θ)(e)=e⊗(1⊗⋯⊗1), with the empty word and tensor unit retained at n=0.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: The degree-zero defining unit identifies the empty Fin 0 word. Induct through the actual successor prepend. The tensor unitor gives θ(e)=e⊗1; native tensor-power multiplication and cast identify the constant unit word at n+1.

Prerequisites: HodgeStructuresPartII:H.0/affine-ordered-iterate, HodgeStructuresPartII:H.0/affine-ordered-step.

### The scalar unit field is never tensor nilpotent

Declaration: TwistedHiggsBundle.affineOrderedIterate_unitField_ne_zero.

If R is a nontrivial commutative ring, then I_n(θ)≠0 for every n≥0 for the actual scalar unit field θ(e)=e⊗1. This does not require R to be reduced, a domain or a field.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. R is nontrivial. E=Q=R with θ the actual inverse tensor right unitor.

Proof: Evaluate the supposed zero iterate at e=1. Apply the actual multilinear product of the n coefficient entries and the tensor right unitor. The value of the constant unit word is one, contradicting nontriviality.

Prerequisites: HodgeStructuresPartII:H.0/affine-ordered-unit-field, mathlib:PiTensorProduct.lift, mathlib:MultilinearMap.mkPiAlgebraFin, mathlib:MultilinearMap.mkPiAlgebraFin_apply_const.

## Finite coefficient directions and exterior integrability

Work over any commutative ring R. The field module E is arbitrary, including torsion or nonflat modules. The coefficient module Q is arbitrary in the finite-direction formula and in integrability implying commutation of all dual contractions. Only the converse criteria take a specified finite basis of Q. Neither the construction nor any proof uses division by two.

Put aθ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ), using the existing native tensor-power exterior projection and the inherited left-prepended iterate. For θ_A,q(e)=Σ_i A_i(e)⊗q_i, expanding twice gives κ(θ_A,q)(e)=Σ_jΣ_i A_i(A_j(e))⊗(q_i∧q_j). The rightmost operator acts first. Pair (i,j) with (j,i): commuting operators cancel using alternating swaps, and diagonal summands vanish by alternation. The native sum-involution lemma explicitly requires that a nonzero summand has no fixed point; diagonal vanishing discharges this requirement even in characteristic two. Antisymmetry alone would not suffice there.

The canonical alternating dual functional on Λ²Q has value v(p)w(q)−w(p)v(q) on p∧q. Two tensor inductions identify its contraction of κ(θ) with [aθ(v),aθ(w)] in the actual endomorphism algebra. Thus integrability implies commutation for all dual contractions even when Q has no basis. Conversely, a finite coefficient basis reconstructs θ, and pairwise commutation of its coordinate operators makes the actual double-sum square vanish. The all-dual criterion and independence of the chosen basis follow from these actual equalities, not from an assumed separation predicate.

The exact pinned imports are the existing tensor map/right-unitor/induction, basis coordinate/reconstruction and exterior-dual determinant APIs. Finset.sum_involution is the generated additive counterpart of the indexed Finset.prod_involution; Fintype.sum_prod_type' is generated from Fintype.prod_prod_type'. Native tensor/exterior/dual/basis carriers are reused, not replanned. The published Heuer Definition1.2(2), complete Definition4.1 and Remark4.2 motivate the field/contraction interface. These thirteen deductions are authored affine algebra, not named theorems or a correspondence proof from that paper.

### Finite coefficient-direction Higgs field

`HodgeStructuresPartII:H.0/affine-finite-direction-field`; `TwistedHiggsBundle.affineFiniteDirectionField` (construction).

For a finite index type I, arbitrary A:I→End_R(E) and q:I→Q, construct the actual R-linear field θ_A,q(e)=Σ_i A_i(e)⊗q_i. The q_i need not be independent and the A_i need not commute.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- For each i compose the native tensor constructor e↦e⊗q_i with A_i, and take the finite sum in the actual R-linear-map module.

Prerequisites: `mathlib:TensorProduct.mk`.

API:

- `TwistedHiggsBundle.affineFiniteDirectionField_apply` (projection): For every e∈E, θ_A,q(e)=Σ_i A_i(e)⊗q_i in the native tensor product E⊗_R Q.
- `TwistedHiggsBundle.affineFiniteDirectionField_reconstruct` (compatibility): For a chosen finite basis b:I→Q and every actual field θ:E→E⊗_R Q, θ equals the finite-direction field with operators A_i=a_θ(b.coord i) and directions b_i. This is an equality of native linear maps, with no basis assumption on E.
- `TwistedHiggsBundle.affineExteriorSquare_finiteDirection` (compatibility): For every finite-direction field and e∈E, κ(θ_A,q)(e)=Σ_j Σ_i A_i(A_j(e))⊗(q_i∧q_j). The operator indexed by the inner sum acts last in the left-prepended coefficient convention; no commutation or independence hypothesis occurs.
- `TwistedHiggsBundle.affineExteriorSquare_finiteDirection_zero_of_commute` (compatibility): If A_i A_j=A_j A_i for every i,j, then κ(θ_A,q)=0 for arbitrary directions q_i. This holds over every commutative ring, including characteristic two; no inverse of two or flatness assumption is used.
- `TwistedHiggsBundle.affineExteriorSquare_contraction` (compatibility): For arbitrary Q and E and all v,w∈Q∨, contraction of κ(θ) by the actual exterior-dual functional ℓ(v,w)=alternatingMapToDual_R,Q,2(v,w) equals a_θ(v)a_θ(w)−a_θ(w)a_θ(v) in End_R(E). On p∧q the functional has value v(p)w(q)−w(p)v(q); rightmost endomorphisms act first.
- `TwistedHiggsBundle.affineFiniteDirectionField_contraction` (compatibility): For all finite A,q and v∈Q∨, a_(θ_A,q)(v)=Σ_i v(q_i)•A_i as an equality in the actual native endomorphism module.
- `TwistedHiggsBundle.affineFiniteDirectionField_coordinate` (compatibility): If b:I→Q is a finite basis, contraction of θ_A,b by b.coord i equals A_i, for every i. The coordinate evaluation is the native basis coordinate, not a stored comparison oracle.
- `TwistedHiggsBundle.affineExteriorSquare_zero_commute` (compatibility): If κ(θ)=0 then a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for all v,w∈Q∨. No finiteness, freeness or projectivity hypothesis on Q or E is needed in this forward implication.
- `TwistedHiggsBundle.affineExteriorSquare_finiteBasis_zero_iff` (characterisation): For a finite basis b:I→Q, κ(θ_A,b)=0 if and only if A_i A_j=A_j A_i for every i,j. R is an arbitrary commutative ring and E an arbitrary R-module. A merely spanning or dependent list of directions is not substituted for the basis in the converse.
- `TwistedHiggsBundle.affineExteriorSquare_coordinate_zero_iff` (characterisation): For every finite basis b:I→Q and actual θ:E→E⊗_R Q, κ(θ)=0 if and only if the coordinate contractions a_θ(b.coord i) commute pairwise. Only Q has a basis; E need not be free, finite, projective or flat.
- `TwistedHiggsBundle.affineExteriorSquare_dual_zero_iff` (characterisation): If Q has a chosen finite basis, κ(θ)=0 if and only if a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for every v,w∈Q∨. The backward implication explicitly uses finite-basis reconstruction; separation by the dual is not assumed for an arbitrary coefficient module.
- `TwistedHiggsBundle.affineExteriorSquare_coordinates_basis_independent` (characterisation): For two finite bases b:I→Q and c:J→Q, with possibly different index types, pairwise commutation of the b-coordinate contractions is equivalent to pairwise commutation of the c-coordinate contractions for the same θ. Both criteria are identified with the same native κ(θ)=0.

Uses:

- HodgeStructuresPartII:H.0/higgs-commuting: Supply the actual finite-coordinate affine criterion, including characteristic two, before using E1 to restrict, compare exterior powers and glue local fields.
- HodgeStructuresPartII:H.0/symmetric-action: Certify commutation of actual contraction operators from exterior integrability; the native symmetric-algebra action and its global endomorphism/sheaf comparison remain distinct existing obligations.
- HodgeStructuresPartII:key/higgs-parameter-connections: Give coordinate-independent affine integrability tests without a basis for E and without identifying sheaf tensor sections with tensors of global sections.
- Heuer Definition 4.1 and Remark 4.2: Relate the actual exterior obstruction to the signed commutator of contraction operators, retaining the finite coefficient-basis hypothesis only for the converse.

Unit tests:

- `TwistedHiggsBundle.affineFiniteDirectionField.test_apply` (computation): The finite-direction field evaluates at e to Σ_i A_i(e)⊗q_i.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_empty` (degenerate): For I=Fin 0 the finite-direction field is the zero linear map.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_zero` (degenerate): For any finite I and q, setting every A_i=0 gives the zero field.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_reconstruct` (characterisation): Any actual θ is recovered exactly from the contractions by the coordinates of a chosen finite basis of Q.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_coordinate` (computation): For finite-basis directions, contracting θ_A,b at b.coord i recovers the actual A_i.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_dependent` (non-example): For an arbitrary family of operators with all coefficient directions equal to q, the exterior square is zero even without operator commutation. Dependence cannot supply the converse criterion.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_one_direction` (degenerate): A field with one coefficient direction and an arbitrary endomorphism has zero exterior square.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_torsion_module` (example): Over R=ℤ with the torsion module E=ZMod 2, the one-direction identity field has zero exterior square. No freeness or flatness of E is required.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_char_two_three_coordinates` (non-example): Over ZMod 2, take E=(ZMod 2)², Q=Fin 3→ZMod 2 with its native standard basis, and operators E12,E21,0. The finite-direction field has nonzero exterior square, detected by the 0,1 coordinate commutator at (1,0).
- `TwistedHiggsBundle.affineFiniteDirectionField.test_all_duals` (characterisation): With a finite coefficient basis, κ(θ)=0 exactly when all actual dual contractions commute, not only the selected coordinate contractions.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_basis_independent` (invariance): Coordinate commutation is equivalent for any two finite coefficient bases, even if their index types differ.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Evaluation of a finite-direction field

`HodgeStructuresPartII:H.0/affine-finite-direction-apply`; `TwistedHiggsBundle.affineFiniteDirectionField_apply` (lemma).

For every e∈E, θ_A,q(e)=Σ_i A_i(e)⊗q_i in the native tensor product E⊗_R Q.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate the finite sum of the tensor-constructor composites using native linear-map sum evaluation.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-field`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Reconstruction as a finite-direction field

`HodgeStructuresPartII:H.0/affine-finite-direction-reconstruct`; `TwistedHiggsBundle.affineFiniteDirectionField_reconstruct` (lemma).

For a chosen finite basis b:I→Q and every actual field θ:E→E⊗_R Q, θ equals the finite-direction field with operators A_i=a_θ(b.coord i) and directions b_i. This is an equality of native linear maps, with no basis assumption on E.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate the finite-direction field at each e, apply the existing affineContractions_reconstruct to the chosen finite coefficient basis, and use native linear-map extensionality.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-apply`, `HodgeStructuresPartII:H.0/affine-contractions-reconstruction`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Finite double-sum exterior-square formula

`HodgeStructuresPartII:H.0/affine-exterior-finite-direction`; `TwistedHiggsBundle.affineExteriorSquare_finiteDirection` (lemma).

For every finite-direction field and e∈E, κ(θ_A,q)(e)=Σ_j Σ_i A_i(A_j(e))⊗(q_i∧q_j). The operator indexed by the inner sum acts last in the left-prepended coefficient convention; no commutation or independence hypothesis occurs.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Use the inherited affineOrderedIterate_two comparison with the associator-defined ordered square.
- Expand θ_A,q twice with native tensor-map and linear-map finite-sum laws. The first q_j is on the right after prepending the second q_i.
- Evaluate the existing tensor-power exterior projection on each pure word to obtain precisely q_i∧q_j.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-apply`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-two`, `HodgeStructuresPartII:H.0/affine-ordered-square`, `HodgeStructuresPartII:H.0/affine-exterior-square`, `mathlib:PiTensorProduct.lift.tprod`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Commuting finite directions give integrability

`HodgeStructuresPartII:H.0/affine-exterior-finite-direction-commute`; `TwistedHiggsBundle.affineExteriorSquare_finiteDirection_zero_of_commute` (lemma).

If A_i A_j=A_j A_i for every i,j, then κ(θ_A,q)=0 for arbitrary directions q_i. This holds over every commutative ring, including characteristic two; no inverse of two or flatness assumption is used.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Rewrite the double sum as a sum on I×I using the generated additive form Fintype.sum_prod_type' of the indexed native product theorem.
- Use the actual Finset.sum_involution generated from Finset.prod_involution with (i,j)↦(j,i). Pairwise operator commutation and AlternatingMap.map_swap make paired summands negatives.
- A fixed point has i=j and its alternating generator is zero by AlternatingMap.map_eq_zero_of_eq. This explicit zero condition, not 2x=0, closes the involution hypothesis.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-finite-direction`, `mathlib:Finset.prod_involution`, `mathlib:Fintype.prod_prod_type'`, `mathlib:AlternatingMap.map_swap`, `mathlib:AlternatingMap.map_eq_zero_of_eq`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Exterior-dual contraction is the commutator

`HodgeStructuresPartII:H.0/affine-exterior-contraction-commutator`; `TwistedHiggsBundle.affineExteriorSquare_contraction` (lemma).

For arbitrary Q and E and all v,w∈Q∨, contraction of κ(θ) by the actual exterior-dual functional ℓ(v,w)=alternatingMapToDual_R,Q,2(v,w) equals a_θ(v)a_θ(w)−a_θ(w)a_θ(v) in End_R(E). On p∧q the functional has value v(p)w(q)−w(p)v(q); rightmost endomorphisms act first.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate the actual linear-map equality at e. Tensor induction on θ(e), followed by tensor induction on θ(x), reduces it to two pure coefficient vectors p,q; sums are preserved by the genuine linear maps.
- The inherited left-prepended iterate yields the exterior generator p∧q. Read the native alternatingMapToDual_apply_ιMulti determinant, evaluate its 2×2 determinant and use tensor right-unit/balancing.
- The value is (v(p)w(q)−w(p)v(q))•x; native commutative scalar multiplication and module subtraction give the signed commutator, without commutation of endomorphisms.

Prerequisites: `HodgeStructuresPartII:H.0/affine-contractions-apply`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-two`, `HodgeStructuresPartII:H.0/affine-ordered-square`, `HodgeStructuresPartII:H.0/affine-exterior-square`, `mathlib:TensorProduct.induction_on`, `mathlib:exteriorPower.alternatingMapToDual`, `mathlib:exteriorPower.alternatingMapToDual_apply_ιMulti`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Contraction of a finite-direction field

`HodgeStructuresPartII:H.0/affine-finite-direction-contraction`; `TwistedHiggsBundle.affineFiniteDirectionField_contraction` (lemma).

For all finite A,q and v∈Q∨, a_(θ_A,q)(v)=Σ_i v(q_i)•A_i as an equality in the actual native endomorphism module.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate on e, distribute the actual tensor map and right unitor over the finite sum, and use rid(e⊗r)=r•e.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-apply`, `HodgeStructuresPartII:H.0/affine-contractions-apply`, `mathlib:TensorProduct.map_tmul`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Basis coordinates recover the specified operators

`HodgeStructuresPartII:H.0/affine-finite-direction-coordinate`; `TwistedHiggsBundle.affineFiniteDirectionField_coordinate` (lemma).

If b:I→Q is a finite basis, contraction of θ_A,b by b.coord i equals A_i, for every i. The coordinate evaluation is the native basis coordinate, not a stored comparison oracle.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Apply the preceding contraction formula and native basis coordinate evaluation b.coord i (b j)=δ_ij. The finite sum reduces to A_i.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-contraction`, `mathlib:Module.Basis.coord`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability makes all contractions commute

`HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`; `TwistedHiggsBundle.affineExteriorSquare_zero_commute` (lemma).

If κ(θ)=0 then a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for all v,w∈Q∨. No finiteness, freeness or projectivity hypothesis on Q or E is needed in this forward implication.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Apply the actual exterior-contraction commutator identity to v,w.
- Replace κ(θ) by the zero linear map and use the existing affineContractions_zero. The commutator is zero, hence the two products are equal.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-contraction-commutator`, `HodgeStructuresPartII:H.0/affine-contractions-zero`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability criterion for finite-basis fields

`HodgeStructuresPartII:H.0/affine-exterior-finite-basis-criterion`; `TwistedHiggsBundle.affineExteriorSquare_finiteBasis_zero_iff` (lemma).

For a finite basis b:I→Q, κ(θ_A,b)=0 if and only if A_i A_j=A_j A_i for every i,j. R is an arbitrary commutative ring and E an arbitrary R-module. A merely spanning or dependent list of directions is not substituted for the basis in the converse.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Necessity: apply the arbitrary-module forward contraction theorem to b.coord i and b.coord j, then recover the specified A_i and A_j by the proved coordinate formula.
- Sufficiency: use the finite-direction swap-involution theorem with directions b_i. No exterior-basis or invertibility-of-two lemma is required.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`, `HodgeStructuresPartII:H.0/affine-finite-direction-coordinate`, `HodgeStructuresPartII:H.0/affine-exterior-finite-direction-commute`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability criterion for coordinate contractions

`HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`; `TwistedHiggsBundle.affineExteriorSquare_coordinate_zero_iff` (lemma).

For every finite basis b:I→Q and actual θ:E→E⊗_R Q, κ(θ)=0 if and only if the coordinate contractions a_θ(b.coord i) commute pairwise. Only Q has a basis; E need not be free, finite, projective or flat.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Reconstruct θ as the finite-direction field of its coordinate contractions using the existing native finite coefficient-basis reconstruction.
- Substitute the equality in the finite-basis field criterion; no module coordinates for E are introduced.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-reconstruct`, `HodgeStructuresPartII:H.0/affine-exterior-finite-basis-criterion`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability criterion for all dual contractions

`HodgeStructuresPartII:H.0/affine-exterior-all-dual-criterion`; `TwistedHiggsBundle.affineExteriorSquare_dual_zero_iff` (lemma).

If Q has a chosen finite basis, κ(θ)=0 if and only if a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for every v,w∈Q∨. The backward implication explicitly uses finite-basis reconstruction; separation by the dual is not assumed for an arbitrary coefficient module.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Forward: invoke the arbitrary-module all-contractions necessity theorem.
- Backward: specialize all-functional commutation to the finite basis coordinates and invoke the coordinate criterion. The given basis supplies the exact reconstruction needed for sufficiency.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`, `HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Basis independence of coordinate commutation

`HodgeStructuresPartII:H.0/affine-exterior-coordinate-basis-independence`; `TwistedHiggsBundle.affineExteriorSquare_coordinates_basis_independent` (lemma).

For two finite bases b:I→Q and c:J→Q, with possibly different index types, pairwise commutation of the b-coordinate contractions is equivalent to pairwise commutation of the c-coordinate contractions for the same θ. Both criteria are identified with the same native κ(θ)=0.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Identify both coordinate-commutation statements with κ(θ)=0 by the coordinate criterion, and compose the equivalences.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Global boundary

The affine finite-coordinate result does not construct a sheaf tensor or identify its sections with tensors of global sections. The existing H.0/higgs-commuting global target still consumes E1 restriction, exterior/dual tensor comparison, local equality detection and gluing. Arbitrary-Q cross-ring exterior projection/base-change comparison, finite-projective dual localization, the global Ω²⊗T² identification and all λ-connection/Griffiths/Rees supplier obligations remain explicit work. No Hodge parent carrier is duplicated, no stage or reserved key is closed, and all149 source-route obligations retain their previous status. H.0 is partial and H.1–H.8 are not_read. The full suggested file uses admitted bodies under protocol13; its type check is separate from the admission-free native prototype archived in the handoff.

## Affine tensor Higgs fields — codex-7e92bd continuation

General ringed-site Higgs/constant-parameter connection plan with 173 nodes. The affine tensor continuation supplies the actual tensor field on arbitrary modules, its contraction and coefficient-map identities, horizontal tensor maps, native symmetry, both unitors and associator; finite-basis coefficient directions give tensor integrability over any commutative ring. All 161 inherited contracts, ordered-iterate/base-change/chart/exterior APIs, eight routes and 149 source obligations remain. H.0 is partial and H.1–H.8 are not_read; every node is unchecked. General-Q tensor curvature, nonzero-parameter balancing, the integral tensor-nilpotence bound, exterior scalar extension, finite-projective and actual sheaf restriction/gluing, determinant/Tate/period adapters and source decomposition remain open.

Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), §2.1 Theorem 2.1(iv), equation (2.4), uses the sum of the two induced Higgs fields on a sheaf tensor. The following arbitrary-ring affine identities are authored deductions, not a proof of the correspondence or its tensor functor. The source read covers all of §2.1 and the preceding Theorem 1.6, Remark 1.10 and conventions; it does not cover the whole paper.

R is an arbitrary commutative ring; E,F,Q (and any explicitly named E′,F′,G,P) are arbitrary R-modules. Fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps, without an integrability assumption unless explicitly stated. No finiteness, flatness, freeness, reducedness or characteristic hypothesis is imposed on E or F.
Write T(θ,ψ)=rightComm∘(θ⊗id_F)+assoc⁻¹∘(id_E⊗ψ), with target (E⊗_R F)⊗_R Q; write a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) for the inherited native contraction and exterior square. Tensor associators, symmetry and unitors are the existing Mathlib linear equivalences, not new general module constructions.
Only the integrability theorem requires a chosen finite basis b:I→Q. Every other new tensor identity holds for arbitrary Q. The tensor unit carries the zero Higgs field. This is the affine λ=0 specialization: neither the nonzero-parameter Leibniz balancing nor actual sheaf restriction/gluing is discharged.

The coefficient module Q remains a single common factor. In the p-adic application Q models the existing differential/Tate coefficient module; no Tate trivialization is chosen here. Tensoring a Higgs field with the zero field on R gives the unit operation. Tensoring two scalar unit fields instead adds their scalar coefficients.

### Affine tensor Higgs field

`TwistedHiggsBundle.affineTensorField` — Construct T(θ,ψ):E⊗_R F→(E⊗_R F)⊗_R Q as the sum rightComm∘(θ⊗id_F)+assoc⁻¹∘(id_E⊗ψ). Both summands retain one common coefficient module Q; no tensor-square coefficient or division is introduced.

Proof outline: Compose the native tensor maps with rightComm and the inverse associator, then add in the native module of linear maps.

Prerequisites: `mathlib:TensorProduct.map`, `mathlib:TensorProduct.rightComm`, `mathlib:TensorProduct.assoc`.

### Tensor Higgs field on pure tensors

`TwistedHiggsBundle.affineTensorField_tmul` — For every e∈E and f∈F, T(θ,ψ)(e⊗f)=rightComm(θ(e)⊗f)+assoc⁻¹(e⊗ψ(f)).

Proof outline: Evaluate the two defining composites on a pure tensor.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-field`, `mathlib:TensorProduct.map_tmul`.

### Tensor of zero Higgs fields

`TwistedHiggsBundle.affineTensorField_zero` — T(0_E,0_F)=0 as a native linear map E⊗_R F→(E⊗_R F)⊗_R Q.

Proof outline: Apply native tensor extensionality and the pure-tensor formula.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.ext'`.

### Contraction of the tensor Higgs field

`TwistedHiggsBundle.affineTensorField_contractions` — For every v∈Hom_R(Q,R), a_T(θ,ψ)(v)=a_θ(v)⊗id_F+id_E⊗a_ψ(v) in End_R(E⊗_R F).

Proof outline: Apply tensor extensionality; expand the contraction of each summand. Tensor induction on θ(e) and ψ(f) reduces the two equations to pure tensors, where scalar balance gives the stated endomorphisms.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-contractions`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Commuting tensor contractions

`TwistedHiggsBundle.affineTensorField_contractions_commute` — For v,w∈Hom_R(Q,R), if a_θ(v)a_θ(w)=a_θ(w)a_θ(v) and a_ψ(v)a_ψ(w)=a_ψ(w)a_ψ(v), then a_T(θ,ψ)(v)a_T(θ,ψ)(w)=a_T(θ,ψ)(w)a_T(θ,ψ)(v). Products are composition with the right factor applied first.

Proof outline: Use the contraction formula and tensor extensionality. Expand both products into four terms; the two mixed terms match by acting in separate tensor factors, and the two same-factor terms match by the hypotheses. Reorder the four-term sum without dividing by two.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-contractions`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.map_tmul`.

### Integrability of the tensor Higgs field

`TwistedHiggsBundle.affineTensorField_integrable` — If Q has a chosen finite basis b:I→Q and κ(θ)=κ(ψ)=0, then κ(T(θ,ψ))=0. E and F remain arbitrary R-modules, including torsion modules.

Proof outline: Use the inherited finite-coordinate integrability criterion for Q. Each input curvature vanishing gives commuting contractions at b.coord i and b.coord j; the tensor contraction lemma supplies the pairwise commutation required by the criterion.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-commute`, `HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`, `HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`.

### Tensor field under coefficient postcomposition

`TwistedHiggsBundle.affineTensorField_coefficientMap` — For any R-linear u:Q→P, (id_(E⊗F)⊗u)∘T(θ,ψ)=T((id_E⊗u)∘θ,(id_F⊗u)∘ψ). This is same-ring postcomposition, with no injectivity or flatness requirement on u.

Proof outline: Apply tensor extensionality and expand both fields. Tensor induction on each input field value reduces naturality of the associator and permutation to their pure-tensor formulas.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-coefficient-map`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Tensor of horizontal linear maps

`TwistedHiggsBundle.affineTensorField_horizontal` — For fields θ′ on E′ and ψ′ on F′ with coefficients Q and R-linear f:E→E′, g:F→F′, suppose θ′∘f=(f⊗id_Q)∘θ and ψ′∘g=(g⊗id_Q)∘ψ. Then T(θ′,ψ′)∘(f⊗g)=((f⊗g)⊗id_Q)∘T(θ,ψ). No map needs to be invertible.

Proof outline: Evaluate on e⊗x, substitute both horizontal equations, and separate the two summands. Tensor induction on θ(e) and ψ(x) proves each tensor-map/permutation identity.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Horizontal tensor symmetry

`TwistedHiggsBundle.affineTensorField_comm` — For the native symmetry c:E⊗_R F≃F⊗_R E, T(ψ,θ)∘c=(c⊗id_Q)∘T(θ,ψ).

Proof outline: Evaluate on e⊗f, swap the two summands, and use tensor induction on the two field values with the native commutor, rightComm and associator evaluations.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.comm`, `mathlib:TensorProduct.comm_tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Horizontal right tensor unit

`TwistedHiggsBundle.affineTensorField_rid` — For the native right unitor ρ:E⊗_R R≃E and the zero field on R, θ∘ρ=(ρ⊗id_Q)∘T(θ,0_R).

Proof outline: Evaluate at e⊗r. Linearity makes the left side r•θ(e); tensor induction on θ(e) identifies the right side with the same scalar action.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.rid`, `mathlib:TensorProduct.rid_tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`.

### Horizontal left tensor unit

`TwistedHiggsBundle.affineTensorField_lid` — For the native left unitor ℓ:R⊗_R E≃E and the zero field on R, θ∘ℓ=(ℓ⊗id_Q)∘T(0_R,θ).

Proof outline: Evaluate at r⊗e and use linearity. Tensor induction on θ(e) reduces both sides to r acting on the E component of each pure tensor.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.lid`, `mathlib:TensorProduct.lid_tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Horizontal tensor associator

`TwistedHiggsBundle.affineTensorField_assoc` — For a third arbitrary R-module G with field χ:G→G⊗_R Q and the native associator α:(E⊗_R F)⊗_R G≃E⊗_R(F⊗_R G), T(θ,T(ψ,χ))∘α=(α⊗id_Q)∘T(T(θ,ψ),χ).

Proof outline: Use threefold tensor extensionality and expand the fields into the three summands contributed by θ,ψ,χ. Reassociate the sum; for each term, tensor induction on its field value reduces the equality to the native permutation and associator formulas.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.assoc`, `mathlib:TensorProduct.assoc_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.ext_threefold`, `mathlib:TensorProduct.induction_on`.

### Construction tests

- `TwistedHiggsBundle.affineTensorField.test_zero` (degenerate): For arbitrary E,F,Q, tensoring the two zero Higgs fields gives the zero field.
- `TwistedHiggsBundle.affineTensorField.test_integer_sum` (computation): Over R=ℤ and E=F=Q=ℤ, tensor the two fields e↦e⊗1. The value at 1⊗1 is (1⊗1)⊗2, retaining both summands.
- `TwistedHiggsBundle.affineTensorField.test_char_two_cancellation` (non-example): Over R=E=F=Q=ZMod 2, the scalar unit field e↦e⊗1 is nonzero, but tensoring it with itself gives the zero field. Tensor-field vanishing cannot reflect the vanishing of either input.
- `TwistedHiggsBundle.affineTensorField.test_torsion_integrability` (compatibility): Over ℤ with Q=ℤ, use E=ZMod 2 and F=ZMod 4 and the one-direction fields with identity operators and direction 1. Their tensor field has zero native exterior square, without a flatness or freeness assumption on either module.
- `TwistedHiggsBundle.affineTensorField.test_zero_direction_map` (degenerate): For arbitrary fields θ,ψ and an arbitrary target coefficient module P, postcompose both fields by the zero map Q→P; their tensor field is zero.

### Ownership and remaining work

The affine λ=0 tensor field, tensor contraction formula, horizontal maps and native associativity/symmetry/unit equations are now planned with separately checked proofs for arbitrary modules. Tensor integrability is proved using a chosen finite basis of Q and no condition on E,F. Still prove the actual tensor-curvature formula for arbitrary Q, the N+M−1 ordered nilpotence bound by integral shuffles, same-λ nonzero-parameter balancing, cross-ring tensor/exterior comparison and E1 sheaf restriction/gluing. No global key, supplier, source route or stage is closed.

All six existing planets, all eight accepted routes, the 149 routed obligations, five supplier requests and 35 global suggested-file omissions are retained. The intrinsic tensor construction gains these affine inputs without changing its original statement. Generic underived sheaf tensor, dual, exterior and pullback comparisons remain with E1; ordinary connection/calculus with CR.1; filtration/Rees with DD.1; general VHS with D3; Jacobi with the existing ColemanPowerSeries declaration.

## Affine tensor exterior curvature over arbitrary coefficients

Fix an arbitrary commutative ring R and arbitrary native R-modules E,F,Q. Let θ:E→E⊗Q and ψ:F→F⊗Q be the specified actual fields. Write π(q⊗r)=q∧r for the existing exterior quotient, κ for the inherited actual exterior square, Sθ=(id⊗π)∘assoc∘(θ⊗id) and T for the inherited tensor field. The mixed pairing M reorders (E⊗Q)⊗(F⊗Q) into (E⊗F)⊗(Q⊗Q) before applying π. All factor permutations are native Mathlib equivalences.

The left extension contribution contains −M(θ(e)⊗ψ(f)); the right contains +M(θ(e)⊗ψ(f)). Their cancellation is integral: the alternating relation supplies the sign, and repeated coefficients vanish by the independent diagonal alternating relation. No division by two, dual separation, chosen basis or flatness is used. This gives the actual curvature formula for arbitrary coefficient modules and therefore tensor integrability for flat Higgs inputs. Nilpotence and converse reflection are distinct statements.

The actual affine tensor-curvature formula and integrability theorem now have native proofs for arbitrary E,F,Q over every commutative ring, with no basis or flatness hypothesis. Prove the existing integral ordered tensor nilpotence bound N+M−1 for positive input bounds, cross-ring tensor/exterior comparison and finite-projective restriction, then discharge E1 actual sheaf tensor/exterior restriction, equality detection and gluing. Same-λ nonzero-parameter additive balancing, determinant/Tate/period adapters, the reserved global ringed-site carrier, all 149 routed source obligations and H.1–H.8 remain open. Earlier narrower affine-frontier statements are retained as checkpoint history.

### Exterior extension of an affine Higgs field

`HodgeStructuresPartII:H.0/affine-exterior-step` — `TwistedHiggsBundle.affineExteriorStep`.

Construct Sθ:E⊗Q→E⊗∧²Q as (id_E⊗π)∘assoc∘(θ⊗id_Q), where π(q⊗r)=q∧r is the native tensor-to-exterior projection. This is the degree-one exterior extension at λ=0, without a differential term.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Compose native tensor maps, associator and the existing exterior quotient. No basis or dual separation argument is used.

Dependencies: `mathlib:TensorProduct.map`, `mathlib:TensorProduct.assoc`, `tauceti:exteriorPower.fromTensorPower`, `mathlib:TensorPower.mulEquiv`.

API `TwistedHiggsBundle.affineExteriorStep_tmul` (simp): For e∈E and q∈Q, Sθ(e⊗q)=(id_E⊗π)(assoc(θ(e)⊗q)); in particular if θ(e)=x⊗r, this equals x⊗(r∧q).

API `TwistedHiggsBundle.affineExteriorStep_add` (relation): For θ,χ:E→E⊗Q, S(θ+χ)=Sθ+Sχ as native linear maps.

API `TwistedHiggsBundle.affineExteriorStep_zero` (simp): S(0_E)=0:E⊗Q→E⊗∧²Q.

API `TwistedHiggsBundle.affineExteriorSquare_eq_step` (compatibility): The inherited actual exterior square satisfies κ(θ)=Sθ∘θ as a native linear map.

Test `TwistedHiggsBundle.affineExteriorStep.test_zero` (degenerate): The zero field on arbitrary E,Q has zero native exterior extension.

Test `TwistedHiggsBundle.affineExteriorStep.test_integer_value` (computation): Over ℤ, with E=ℤ and Q=ℤ², the field θ(e)=e⊗(1,0) has Sθ(1⊗(0,1))=1⊗((1,0)∧(0,1)).

Test `TwistedHiggsBundle.affineExteriorStep.test_square_comparison` (compatibility): For arbitrary θ,E,Q, the exterior-step composite Sθ∘θ equals the inherited actual affineExteriorSquare θ.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Exterior square as a composed extension

`HodgeStructuresPartII:H.0/affine-exterior-square-step` — `TwistedHiggsBundle.affineExteriorSquare_eq_step`.

The inherited actual exterior square satisfies κ(θ)=Sθ∘θ as a native linear map.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use the inherited degree-two ordered-iterate comparison and compose the native tensor-to-exterior projection; tensor-map composition identifies the expressions.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-exterior-step`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-two`, `HodgeStructuresPartII:H.0/affine-ordered-square`, `mathlib:TensorProduct.map_comp`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Exterior extension on a pure tensor

`HodgeStructuresPartII:H.0/affine-exterior-step-tmul` — `TwistedHiggsBundle.affineExteriorStep_tmul`.

For e∈E and q∈Q, Sθ(e⊗q)=(id_E⊗π)(assoc(θ(e)⊗q)); in particular if θ(e)=x⊗r, this equals x⊗(r∧q).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Unfold the extension and evaluate the native tensor map and associator.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.assoc_tmul`, `tauceti:exteriorPower.fromTensorPower_tprod`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Additivity in the Higgs field

`HodgeStructuresPartII:H.0/affine-exterior-step-add` — `TwistedHiggsBundle.affineExteriorStep_add`.

For θ,χ:E→E⊗Q, S(θ+χ)=Sθ+Sχ as native linear maps.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use native tensor-map additivity in its first map and distribute composition.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `mathlib:TensorProduct.map_add_left`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Exterior extension of the zero field

`HodgeStructuresPartII:H.0/affine-exterior-step-zero` — `TwistedHiggsBundle.affineExteriorStep_zero`.

S(0_E)=0:E⊗Q→E⊗∧²Q.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: The first tensor map is zero; its composite is zero.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Mixed tensor exterior pairing

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair` — `TwistedHiggsBundle.affineTensorWedgePair`.

Construct M:(E⊗Q)⊗(F⊗Q)→(E⊗F)⊗∧²Q as (id_(E⊗F)⊗π)∘tensorTensorTensorComm. It sends (e⊗q)⊗(f⊗r) to (e⊗f)⊗(q∧r).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Reuse the native four-factor tensor permutation, followed by the native exterior quotient. This is the specified mixed-term adapter, not a replacement exterior-power carrier.

Dependencies: `mathlib:TensorProduct.tensorTensorTensorComm`, `mathlib:TensorProduct.map`, `tauceti:exteriorPower.fromTensorPower`, `mathlib:exteriorPower.alternatingMapToDual`, `mathlib:exteriorPower.alternatingMapToDual_apply_ιMulti`, `mathlib:Matrix.det_fin_two`.

API `TwistedHiggsBundle.affineTensorWedgePair_tmul` (simp): M((e⊗q)⊗(f⊗r))=(e⊗f)⊗(q∧r), for every e,f,q,r.

API `TwistedHiggsBundle.affineTensorWedgePair_same_direction` (relation): For all e,f,q, M((e⊗q)⊗(f⊗q))=0, including characteristic two.

API `TwistedHiggsBundle.affineTensorWedgePair_swap` (relation): For z∈E⊗Q and w∈F⊗Q, M_(F,E)(w⊗z)=−(comm_(E,F)⊗id_(∧²Q))(M_(E,F)(z⊗w)).

Test `TwistedHiggsBundle.affineTensorWedgePair.test_repeated_coefficient` (degenerate): For arbitrary e,f,q, the mixed pairing of e⊗q with f⊗q is zero.

Test `TwistedHiggsBundle.affineTensorWedgePair.test_integer_sign` (computation): Over ℤ with E=F=ℤ and Q=ℤ², pairing (1⊗(0,1)) with (1⊗(1,0)) gives −(1⊗1)⊗((1,0)∧(0,1)), with the coefficient sign retained.

Test `TwistedHiggsBundle.affineTensorWedgePair.test_characteristic_two_nonzero` (non-example): Over ZMod 2, with E=F=ZMod 2 and Q=(ZMod 2)², the actual mixed exterior pairing is nonzero. Alternating signs in characteristic two do not make the exterior projection vanish.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Mixed pairing on four factors

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul` — `TwistedHiggsBundle.affineTensorWedgePair_tmul`.

M((e⊗q)⊗(f⊗r))=(e⊗f)⊗(q∧r), for every e,f,q,r.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Evaluate the native four-factor permutation and tensor-to-exterior projection.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `mathlib:TensorProduct.tensorTensorTensorComm_tmul`, `mathlib:TensorProduct.map_tmul`, `tauceti:exteriorPower.fromTensorPower_tprod`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Left contribution and reversed mixed term

`HodgeStructuresPartII:H.0/affine-exterior-step-tensor-left` — `TwistedHiggsBundle.affineExteriorStep_tensor_left`.

For z∈E⊗Q and f∈F, ST(rightComm(z⊗f))=rightComm(Sθ(z)⊗f)−M(z⊗ψ(f)), where T=T(θ,ψ). The minus sign comes from reversing the two coefficient factors.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Induct on z by native tensor generation and distribute the two field summands. Induct on θ(e) for the pure left contribution, and on ψ(f) for the mixed contribution. The latter has r∧q=−q∧r by native alternating-map swap. No division by two is used.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-exterior-step-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:AlternatingMap.map_swap`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Right contribution and direct mixed term

`HodgeStructuresPartII:H.0/affine-exterior-step-tensor-right` — `TwistedHiggsBundle.affineExteriorStep_tensor_right`.

For e∈E and w∈F⊗Q, ST(assoc⁻¹(e⊗w))=M(θ(e)⊗w)+assoc⁻¹(e⊗Sψ(w)), where T=T(θ,ψ).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Induct on w by native tensor generation and distribute the field summands. Induct on θ(e) and ψ(f) for the two terms; native tensor permutations give the specified factor order.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-exterior-step-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Tensor curvature on elementary tensors

`HodgeStructuresPartII:H.0/affine-tensor-curvature-tmul` — `TwistedHiggsBundle.affineTensorField_curvature_tmul`.

For arbitrary Q, κ(T(θ,ψ))(e⊗f)=rightComm(κ(θ)(e)⊗f)+assoc⁻¹(e⊗κ(ψ)(f)), with ∧²Q moved to the last factor.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Replace each exterior square by its exterior-step composite. Expand T(e⊗f) and substitute the left and right extension identities. The identical mixed pairings occur with opposite signs and cancel.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-exterior-square-step`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-exterior-step-tensor-left`, `HodgeStructuresPartII:H.0/affine-exterior-step-tensor-right`.

Test `TwistedHiggsBundle.affineTensorField.test_curvature_value` (compatibility): For arbitrary actual fields and pure e⊗f, the tensor exterior square equals the two input exterior squares in the specified last-factor order.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Tensor integrability for arbitrary coefficients

`HodgeStructuresPartII:H.0/affine-tensor-integrable-arbitrary` — `TwistedHiggsBundle.affineTensorField_integrable_of_arbitrary_coefficients`.

If κ(θ)=κ(ψ)=0, then κ(T(θ,ψ))=0 for every R-module Q. E,F,Q may all have torsion; no basis, projectivity or flatness of any of them is needed.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use native pure-tensor extensionality and the actual curvature formula; both surviving terms are zero. No converse or nilpotence implication follows.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-curvature-tmul`, `mathlib:TensorProduct.ext'`.

Test `TwistedHiggsBundle.affineTensorField.test_torsion_coefficient_integrability` (compatibility): Over ℤ with E=F=ℤ and torsion Q=(ZMod 2)², tensor the scalar one-direction fields in directions (1,0) and (0,1). The actual tensor field has zero exterior square without a coefficient basis or flatness hypothesis.

Test `TwistedHiggsBundle.affineTensorField.test_no_reflection_through_zero_module` (non-example): Over ℤ take the nonintegrable two-direction field E12 dx+E21 dy on ℤ² and F=(Fin 0→ℤ). Its tensor field with the zero field on F has zero curvature, while the original field has nonzero curvature. Tensor integrability does not reflect the integrability of an input through a zero module.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Tensor curvature as a linear-map equality

`HodgeStructuresPartII:H.0/affine-tensor-curvature` — `TwistedHiggsBundle.affineTensorField_curvature`.

κ(T(θ,ψ))=rightComm∘(κ(θ)⊗id_F)+assoc⁻¹∘(id_E⊗κ(ψ)) as native linear maps E⊗F→(E⊗F)⊗∧²Q.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Apply native tensor extensionality; evaluate both sides and use the elementary-tensor curvature formula.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-curvature-tmul`, `mathlib:TensorProduct.ext'`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Repeated coefficients in the mixed pairing

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-repeated` — `TwistedHiggsBundle.affineTensorWedgePair_same_direction`.

For all e,f,q, M((e⊗q)⊗(f⊗q))=0, including characteristic two.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Evaluate the mixed pairing and use the alternating relation q∧q=0, rather than deriving it from a sign by division.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:AlternatingMap.map_eq_zero_of_eq`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Signed swap of the mixed pairing

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-swap` — `TwistedHiggsBundle.affineTensorWedgePair_swap`.

For z∈E⊗Q and w∈F⊗Q, M_(F,E)(w⊗z)=−(comm_(E,F)⊗id_(∧²Q))(M_(E,F)(z⊗w)).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use tensor induction in z and w. On four pure factors use the actual commutor and alternating coefficient swap; extend by additivity.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.comm_tmul`, `mathlib:AlternatingMap.map_swap`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

## Affine monoidal scalar extension — current checkpoint

General ringed-site Higgs/constant-parameter connection plan with 197 unchecked nodes. Ten new affine lemmas prove the actual tensor Higgs field commutes with arbitrary scalar extension through the native monoidal comparison, its inverse, all-degree ordered transport, same-exponent preservation and faithfully-flat reflection. Exterior identities compare the two S-fields only. All 187 incoming whole node objects, eight routes, 149 obligations and 35 global omissions remain. H.0 is partial and H.1–H.8 not_read; global sheaf/nonzero-parameter algebra, integral tensor bound, cross-ring exterior curvature, source decomposition and suppliers remain open.

The affine arbitrary-module monoidal scalar-extension comparison for the actual tensor Higgs field is now proved, including its inverse, all-degree ordered transport, specified-exponent preservation, faithfully-flat reflection, and same-S exterior comparison. Still prove the integral ordered tensor bound N+M−1 from positive bounds on the factors, actual cross-ring exterior-power comparison and curvature transport, finite-projective restriction, and E1 sheaf tensor/exterior identification, equality detection and gluing. Same-λ nonzero-parameter balancing, determinant/Tate/period adapters, the general reserved ringed-site carrier, all 149 source obligations and H.1–H.8 remain open. Earlier frontier text is checkpoint history.

For δ_(X,Y), use Mathlib’s existing tensor comparison, with δ(a⊗(x⊗y))=(a⊗x)⊗(1⊗y) and δ⁻¹((a⊗x)⊗(b⊗y))=(ab)⊗(x⊗y). No additional tensor carrier, field, basis or flatness hypothesis is built into the horizontal equation. Integrability and tensor nilpotence remain different predicates. The exterior comparison below is between two S-fields; it is not a claim about scalar extension of ∧²_R Q or original R-curvature.

### Left tensor summand under scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change-left` — `TwistedHiggsBundle.affineTensorBaseChange_left`.

For a∈S,z∈E⊗_R Q,f∈F, rightComm_S(δ_(E,Q)(a⊗z)⊗(1⊗f))=(δ_(E,F)⊗id_(Q_S))δ_(E⊗F,Q)(a⊗rightComm_R(z⊗f)).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Tensor induction in z reduces to e⊗q, where native pure-tensor evaluations give both sides ((a⊗e)⊗(1⊗f))⊗(1⊗q). Extend by additivity.

Dependencies: `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.map_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Right tensor summand under scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change-right` — `TwistedHiggsBundle.affineTensorBaseChange_right`.

For a∈S,e∈E,w∈F⊗_R Q, assoc_S⁻¹((a⊗e)⊗δ_(F,Q)(1⊗w))=(δ_(E,F)⊗id_(Q_S))δ_(E⊗F,Q)(a⊗assoc_R⁻¹(e⊗w)).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Tensor induction in w reduces to f⊗q. Apply the actual inverse associator and native scalar-extension evaluation; extend by additivity.

Dependencies: `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`, `mathlib:TensorProduct.map_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Tensor Higgs field commutes with scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change` — `TwistedHiggsBundle.affineTensorField_baseChange`.

T(B_Sθ,B_Sψ)∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S))∘B_S(T(θ,ψ)) as S-linear maps S⊗_R(E⊗_R F)→(E_S⊗_S F_S)⊗_S Q_S.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Use additive tensor induction in S⊗_R(E⊗_R F) and in E⊗_R F. On a⊗(e⊗f), expand the actual tensor field and apply the left and right summand identities. No assertion that the two individual endomorphisms commute is required.

Dependencies: `HodgeStructuresPartII:H.0/affine-base-change`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-base-change-left`, `HodgeStructuresPartII:H.0/affine-tensor-base-change-right`, `mathlib:TensorProduct.induction_on`, `mathlib:LinearMap.baseChange_tmul`.

API `TwistedHiggsBundle.affineTensorField_baseChange` (compatibility): T(B_Sθ,B_Sψ)∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S))∘B_S(T(θ,ψ)) as S-linear maps S⊗_R(E⊗_R F)→(E_S⊗_S F_S)⊗_S Q_S.

API `TwistedHiggsBundle.affineTensorField_baseChange_inverse` (compatibility): B_S(T(θ,ψ))∘δ_(E,F)⁻¹=(δ_(E,F)⁻¹⊗id_(Q_S))∘T(B_Sθ,B_Sψ).

API `TwistedHiggsBundle.affineTensorField_baseChange_ordered` (compatibility): For every n≥0, I_n(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S tensor-power n))∘I_n(B_S(T(θ,ψ))).

API `TwistedHiggsBundle.affineTensorField_baseChange_ordered_zero_iff` (compatibility): For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(B_S(T(θ,ψ)))=0. No flatness or faithful-flatness of S is required for this comparison of two S-fields.

API `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence` (compatibility): For every specified n≥0, if I_n(T(θ,ψ))=0, then I_n(T(B_Sθ,B_Sψ))=0. The same exponent is retained under every R-algebra S, including nonflat scalar extensions.

API `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence_iff` (compatibility): Assume S is faithfully flat over R. For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(T(θ,ψ))=0.

API `TwistedHiggsBundle.affineTensorField_baseChange_exterior` (compatibility): κ_S(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(∧²_S Q_S))∘κ_S(B_S(T(θ,ψ))). Both sides use the same S-exterior coefficient module; no original R-curvature is compared.

API `TwistedHiggsBundle.affineTensorField_baseChange_exterior_zero_iff` (compatibility): κ_S(T(B_Sθ,B_Sψ))=0 if and only if κ_S(B_S(T(θ,ψ)))=0, with no flatness hypothesis. This compares two S-fields, not κ_R(T(θ,ψ)) with its scalar extension.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_zero` (degenerate): For arbitrary R,S,E,F,Q, tensor the scalar extensions of the two zero fields; the actual resulting S-field is zero.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_integer_value` (computation): For R=E=F=Q=ℤ, S=ℚ and θ=ψ:e↦e⊗1, B_S(T(θ,ψ))(2⊗(1⊗1))=(2⊗(1⊗1))⊗(1⊗2). Both scalar tensor summands survive.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_nonflat_tensor` (compatibility): Specialize the actual horizontal equation to ℤ→ZMod 2 and the two unit fields on ℤ. No flatness premise is allowed; the coefficient order and native comparison remain exact.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_torsion_coefficients` (compatibility): Over ℤ use E=ZMod 2, F=ZMod 4 and Q=(ZMod 2)²; for arbitrary actual fields and every n, the two S-fields with S=ZMod 2 have the same n-th iterate vanishing. No coefficient basis or flatness is present.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_degree_zero` (degenerate): For arbitrary fields and ring extension, the two scalar-extended tensor fields have equivalent vanishing of I_0; the empty tensor is the native unit, not a stipulated zero iterate.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_faithful` (compatibility): For faithfully flat S/R, reflect the same specified exponent from the actual tensor of the extended fields to the original R-tensor field; E,F,Q remain arbitrary.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_exterior_scope` (compatibility): For arbitrary S/R, the two actual S-fields have equivalent exterior-integrability. Both exterior powers are over S on Q_S; the test does not assert transport of original R-curvature.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_nonfaithful_erasure` (non-example): Over ℤ, the tensor of two scalar unit fields on E=F=Q=ℤ is nonzero, but after scalar extension to ZMod 2 the actual tensor of their two extended fields is zero. Unconditional reflection of the original field or its degree-one iterate is false.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Inverse tensor comparison is horizontal

`HodgeStructuresPartII:H.0/affine-tensor-base-change-inverse` — `TwistedHiggsBundle.affineTensorField_baseChange_inverse`.

B_S(T(θ,ψ))∘δ_(E,F)⁻¹=(δ_(E,F)⁻¹⊗id_(Q_S))∘T(B_Sθ,B_Sψ).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Evaluate on x=δ_(E,F)(y), using surjectivity of the existing native equivalence. Apply its inverse tensored with the identity to the forward horizontal equation and cancel the tensor-map composite.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `mathlib:TensorProduct.map_map`, `mathlib:TensorProduct.map_id`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Ordered tensor iterates through the monoidal comparison

`HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered` — `TwistedHiggsBundle.affineTensorField_baseChange_ordered`.

For every n≥0, I_n(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S tensor-power n))∘I_n(B_S(T(θ,ψ))).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited all-degree ordered naturality theorem to the actual horizontal equation with module map δ_(E,F) and coefficient identity. Simplify the family tensor of identities, including the empty family at n=0.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-natural`, `mathlib:PiTensorProduct.map_id`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Same-exponent vanishing across the tensor comparison

`HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered-zero` — `TwistedHiggsBundle.affineTensorField_baseChange_ordered_zero_iff`.

For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(B_S(T(θ,ψ)))=0. No flatness or faithful-flatness of S is required for this comparison of two S-fields.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited ordered equivariance zero criterion with actual equivalences δ_(E,F) and id_(Q_S), and the proven tensor horizontal equation.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-equiv`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Specified tensor nilpotence bound survives scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change-nilpotence` — `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence`.

For every specified n≥0, if I_n(T(θ,ψ))=0, then I_n(T(B_Sθ,B_Sψ))=0. The same exponent is retained under every R-algebra S, including nonflat scalar extensions.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Use the inherited arbitrary-coefficient same-exponent scalar-extension preservation for the actual R-tensor field, then the same-exponent S-tensor comparison.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered-zero`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Faithful-flat reflection of the tensor bound

`HodgeStructuresPartII:H.0/affine-tensor-base-change-nilpotence-iff` — `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence_iff`.

Assume S is faithfully flat over R. For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(T(θ,ψ))=0.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate. For this reflection lemma only, the native condition Module.FaithfullyFlat R S is required.

Proof: Compose the S-tensor comparison with the inherited actual faithfully-flat scalar-extension reflection for arbitrary coefficient modules. The condition is imposed on S, not on E,F or Q.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered-zero`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Curvature of the two scalar-extended tensor fields

`HodgeStructuresPartII:H.0/affine-tensor-base-change-exterior` — `TwistedHiggsBundle.affineTensorField_baseChange_exterior`.

κ_S(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(∧²_S Q_S))∘κ_S(B_S(T(θ,ψ))). Both sides use the same S-exterior coefficient module; no original R-curvature is compared.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited same-ring exterior naturality to the actual S-horizontal equation. Simplify the exterior-power map of the coefficient identity.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-exterior-square-natural`, `mathlib:exteriorPower.map_id`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Integrability across the monoidal tensor comparison

`HodgeStructuresPartII:H.0/affine-tensor-base-change-exterior-zero` — `TwistedHiggsBundle.affineTensorField_baseChange_exterior_zero_iff`.

κ_S(T(B_Sθ,B_Sψ))=0 if and only if κ_S(B_S(T(θ,ψ)))=0, with no flatness hypothesis. This compares two S-fields, not κ_R(T(θ,ψ)) with its scalar extension.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited exterior equivariance criterion with native module equivalence δ_(E,F), coefficient identity equivalence, and the tensor horizontal equation.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-exterior-square-equiv`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.


## Integral powers of affine tensor contractions

The inherited tensor field uses one coefficient module Q and sums the two separate-factor actions. Evaluating it against a dual direction v produces L+R. L and R commute because they act on different module factors; no within-factor integrability is needed. The pinned Mathlib binomial and commuting-nilpotence theorems already supply the generic algebra, so this continuation imports them and plans only the actual Higgs adapters. All module and ring hypotheses remain general.

The existing ordered-step and ordered-word contraction contracts are reused. Separate proof experiments follow the actual tensor associators and evaluate the ordered pure tensor by the pinned tensor-power dual pairing. A constant word yields a power of the contraction, hence a genuine ordered zero bound implies the same exponent for each self-contraction. Applying the existing integral commuting bound to the actual tensor contraction gives N+M−1. This is a necessary consequence of factor ordered bounds, not the full ordered tensor conclusion.

In characteristic two every self-contraction square of the specified two-direction field can vanish while its mixed ordered coefficient remains nonzero. The example below therefore prevents a converse based only on self-powers. The full arbitrary-Q mixed shuffle argument remains a separate obligation under the original tensor-nilpotence contract; no basis, factorial inversion or accidental integrability assumption is added to it. Global sheaf tensors and restriction/descent remain E1 supplies.

Fresh source reading covers Liu–Zhu v3, complete printed pp.6–9, especially Theorem 2.1(i),(iv), equation (2.4) and the tensor/Higgs-complex explanation on p.8. These contraction identities are authored arbitrary-ring deductions, not a formalisation of the p-adic correspondence. Reviewed Hodge L0–L3, E1 and D3 audits and REV-AUDIT-10/22 retain their boundaries. Existing ordinary Hodge carriers and general tensor/nilpotence constructions are imported.

### Separate-factor contraction actions commute

TwistedHiggsBundle.affineTensorField_contractions_separate_commute — For every dual direction v, a_θ(v)⊗id_F commutes with id_E⊗a_ψ(v) in End_R(E⊗_R F). These operators act on different factors even when contractions within a factor do not commute.

Interpret endomorphism multiplication as native composition. Both orders equal TensorProduct.map(a_θ(v),a_ψ(v)) by the two pinned separate-factor composition lemmas.

### Integral binomial expansion of tensor contractions

TwistedHiggsBundle.affineTensorField_contractions_pow — For all k≥0 and v∈Q∨, a_T(v)^k=Σ_{i=0}^k binom(k,i)·TensorProduct.map(a_θ(v)^i,a_ψ(v)^(k−i)), as an equality of native endomorphisms. The coefficient acts by repeated addition.

Use the actual contraction sum a_T=L+R and the separate-factor commutation lemma. Apply the existing Commute.add_pow. Use the native rTensor/lTensor power equalities and composition to identify each summand; convert right multiplication by the natural cast to natural scalar multiplication. The k=0 term is the identity.

### Integral bound for one tensor contraction

TwistedHiggsBundle.affineTensorField_contractions_bound — For N,M≥0 and v∈Q∨, if a_θ(v)^N=0 and a_ψ(v)^M=0 then a_T(v)^(N+M−1)=0. The zero-exponent hypotheses, when possible, are retained rather than silently excluded.

Transport the two specified powers to the separate-factor tensor operators by rTensor_pow/lTensor_pow and the zero-map lemmas. Apply the already-built Commute.add_pow_add_eq_zero_of_pow_eq_zero to L+R. Its integral pigeonhole proof requires no division, unit scalar, characteristic hypothesis or additional commutation within E or F.

### Larger integral tensor contraction bounds

TwistedHiggsBundle.affineTensorField_contractions_bound_of_le — For N,M,k≥0 with N+M≤k+1, vanishing of a_θ(v)^N and a_ψ(v)^M implies a_T(v)^k=0.

Transport factor powers through the two native tensor actions and apply the pinned general-exponent commuting-nilpotence theorem with the exact inequality.

### Nilpotence of a specified tensor contraction

TwistedHiggsBundle.affineTensorField_contractions_isNilpotent — If a_θ(v) and a_ψ(v) are nilpotent endomorphisms, then a_T(v) is nilpotent; witnesses N,M produce the explicit witness N+M−1. No claim is made about a common bound as v varies.

Extract the two natural-exponent witnesses of IsNilpotent and apply the explicit contraction bound.

### Uniform bound for all tensor self-contractions

TwistedHiggsBundle.affineTensorField_contractions_uniform_bound — If a_θ(v)^N=0 and a_ψ(v)^M=0 for every v∈Q∨, then a_T(v)^(N+M−1)=0 for every v. Uniform vanishing of these self-powers alone is not the full ordered nilpotence criterion.

Fix a dual direction and apply the bound to its two hypotheses. Keep the universal quantifier outside the chosen fixed exponents.

### Repeated contraction of an ordered iterate

TwistedHiggsBundle.affineOrderedIterate_contraction_constant — For n≥0 and v∈Q∨, contracting all n coefficient factors of I_n(θ) by v gives exactly a_θ(v)^n. At n=0 this is the tensor-unit identity, including the zero module.

Use the existing arbitrary ordered-word contraction formula with the constant tuple of v. List.ofFn_const changes the word to n repeated copies; its product is the native endomorphism power.

### Ordered bounds imply contraction bounds

TwistedHiggsBundle.affineOrderedIterate_contractions_bound — If I_N(θ)=0 for N≥0 then a_θ(v)^N=0 for every v∈Q∨. This implication holds for arbitrary Q without any dual-separation assumption; its converse is not asserted.

Rewrite the contraction power using the constant-word equality. The ordered-zero hypothesis and the inherited zero-contraction API then give zero.

### Tensor contraction bound from ordered factor bounds

TwistedHiggsBundle.affineTensorField_contractions_bound_of_ordered — For N,M≥0, if I_N(θ)=0 and I_M(ψ)=0 then, for every v∈Q∨, a_T(v)^(N+M−1)=0. This is an actual affine consequence of ordered factor bounds; it does not establish I_(N+M−1)(T)=0.

Apply the ordered-to-contracted implication to the two factor fields at the same chosen v and specified exponents. Apply the integral tensor contraction bound. The full ordered tensor bound requires the separate mixed E/F shuffle factorization already planned by tensor-nilpotence. Never infer it from these self-powers; the characteristic-two native counterexample tests that boundary.

### Contracting a two-direction field

TwistedHiggsBundle.affineTwoDirectionField_contractions — For arbitrary A,B∈End_R(E), q,r∈Q and v∈Q∨, the actual field θ(e)=A(e)⊗q+B(e)⊗r has contraction a_θ(v)=v(q)·A+v(r)·B. No basis or independence of q,r is required.

Evaluate the actual field and map each pure tensor through the native dual map and right unitor. Linearity gives the two scalar multiples.

### Acceptance examples

TwistedHiggsBundle.affineTensorField.test_contracted_binomial — The k-fold self-contraction of the actual tensor field is the integral binomial sum for every k≥0, including the tensor-unit boundary.

TwistedHiggsBundle.affineTensorField.test_ordered_to_contracted — Arbitrary-module factor ordered bounds N,M give the specified tensor contraction bound N+M−1 in each chosen dual direction.

TwistedHiggsBundle.affineTensorField.test_bound_one — Two vanishing contractions have vanishing tensor contraction, the N=M=1 boundary.

TwistedHiggsBundle.affineTensorField.test_larger_bound — Factor contraction squares zero imply the fifth power of the tensor contraction is zero via the exact larger-exponent inequality.

TwistedHiggsBundle.affineOrderedIterate.test_contraction_degree_zero — Contracting degree zero gives the identity endomorphism, not zero; this assertion includes the zero module.

TwistedHiggsBundle.affineTensorField.test_integer_sharp_bound — Over ℤ let J(x,y)=(y,0) and θ=J⊗1. The self-contraction of T(θ,θ) has cube zero and square nonzero, detected at (0,1)⊗(0,1) by the first-coordinate pairing giving 2. Replacing N+M−1 by max(N,M) is false.

TwistedHiggsBundle.affineTensorField.test_char_two_square_cancellation — For the same J and θ over ZMod 2, the tensor self-contraction square is zero because its two equal mixed terms cancel. The proof uses actual tensor maps and no division by 2.

TwistedHiggsBundle.affineTwoDirectionField.test_contracted_formula — The contraction of an arbitrary two-direction field is v(q)A+v(r)B, even for dependent or zero directions.

TwistedHiggsBundle.affineTensorField.test_self_powers_do_not_detect_ordered — Over K=ZMod 2 let V=K², J(x,y)=(y,0), E=V⊗V, Q=K² and θ=(J⊗id)⊗(1,0)+(id⊗J)⊗(0,1). Every dual contraction square vanishes, but I₂(θ) is nonzero: the mixed ordered contraction (first coordinate, second coordinate) is J⊗J, detected as 1 on (0,1)⊗(0,1). No equivalence between self-power vanishing and ordered nilpotence is asserted.

The actual affine tensor contraction has an integral binomial expansion and the N+M−1 self-contraction bound from ordered factor bounds, with no basis or integrability premise. The complete mixed E/F shuffle factorization proving I_(N+M−1)(T)=0 remains open; characteristic-two self-powers do not detect all ordered words. Cross-ring exterior-power/curvature transport, finite-projective restrictions and E1 sheaf identification, equality detection and gluing remain open, together with the same-λ nonzero-parameter balancing, determinant/Tate/period adapters, reserved general ringed-site key, all 149 source obligations and H.1–H.8. Earlier narrower frontier text is retained as checkpoint history.

The final admitted sketch and separate native proof experiment have matching new headers. Final Lean execution was unavailable under the programme’s 20 GiB memory threshold; preliminary runs do not certify the corrected final sources or tests. Exact finite matrix calculations check the two characteristic-two regressions and the sharp integral example. All planned nodes remain unchecked.
