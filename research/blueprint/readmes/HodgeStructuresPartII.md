# Hodge structures (pure, mixed, and polarized), Part II

## Checkpoint scope and ownership

This is a **partial design checkpoint**, not a closed blueprint. It supplies a mathematically explicit affine coordinate test and transport prefix for the shared Higgs/constant-parameter connection interface. There are twelve declaration nodes, thirty-five API items and thirty-one definition/construction tests. H.0 is partial; H.1–H.8 are not source-decomposed. All implementation statuses are unchecked. The suggested file is not compiled.

The required reserved node **HodgeStructuresPartII:key/higgs-parameter-connections is not supplied**. A family of matrices in commuting directions on a free module is not a general finite-locally-free connection on a ringed differential site. In particular, it does not by itself supply intrinsic forms, sheaf restriction, descent, pullback, a coefficient twist or Griffiths associated grading. The local nodes are valuable tests of that required definition, not permission to weaken its generality.

The parent, tauceti:TauCetiRoadmap/HodgeStructures, supplies the existing direction: pure, mixed and polarized fibrewise structures and period-domain points. It is not replanned. The HodgeStructures and ReductiveGroups upstream documents were read completely for scope and style. This successor extends the geometric interfaces beyond the parent's endpoint.

There is one owner for each shared interface:

- **ShimuraData:D3** owns the common variation carrier: a local system, filtered holomorphic bundle, fibrewise opposedness and Griffiths transversality, with coefficient and polarizability assumptions explicit. Its reviewed audit reports the variation interface unbuilt, and its packet has no D3 supplier node. This plan requests it rather than creating another variation carrier.
- **CrystallineCohomology:CR.1** owns generic ordinary connection/crystal interfaces. Its equivalence with crystals has quasi-nilpotence and base hypotheses. An arbitrary integrable connection is not silently a crystal.
- **EnhancedDerivedSheaves:E1** owns general module-sheaf tensor, pullback and descent/coherence. Relative first differentials and a presheaf carrier in Mathlib do not give this entire interface.
- **DerivedDeRhamCohomology:DD.1** owns shared filtered/Rees and relevant Koszul inputs. This is not an assignment of every ordinary differential form construction to derived completion.
- This successor supplies the Higgs/constant-parameter interface and its extra complex-geometric applications. The p-adic Simpson correspondence, Cartier flows and arithmetic companion applications retain their existing owners. They consume this prefix; no reverse dependency is introduced.

The accepted BKT and Benoist routes called DegeneratingHodgeStructures are coalesced here, as the issue requires. No separate definition or packet for that alias existed at the audit tree. The real Noether–Lefschetz interface is mandatory H.8, not an omitted source obligation.

## Baseline and source receipts

The pins are Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The initial atlas audit tree is cc8e6af71d89d29632dec19bbc36ffdbb76af6e2. No reviewed coverage entry for HodgeStructuresPartII/HodgeStructures was present in data/library-coverage.json. The existing parent is nevertheless imported as upstream work, not reconstructed.

Both pinned source trees and the declaration index were searched for Higgs, λ-connection and curvature interfaces. The matching Higgs names in Mathlib were unrelated matroid terminology; matching Tau Ceti curvature names did not provide this general carrier. Actual statements were read for derivations, Kähler differentials, relative presheaf differentials, exterior powers, module finiteness and projectivity. Those ingredients are not claimed to be a completed general sheaf connection theory. Ordinary smooth covariant-derivative search hits are not cited here as if their statements had been audited.

Nine declarations actually used in the affine prefix are registered in the packet: Derivation, Derivation.leibniz, MvPolynomial.pderiv, MvPolynomial.derivation_ext, Matrix.single, Matrix.mulVec, Matrix.mulVec_mulVec, Matrix.kronecker and Matrix.transpose. Their statements were read at the Mathlib pin. Polynomial partial-derivative commutation is a required elementary proof, not a theorem inferred from the existence of pderiv or derivation_ext.

The following fresh primary readings were made on 2 October 2026:

- [Esnault–Groechenig, published PDF](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf): p.108 definitions; pp.131–132 the parameter definition and Lemma 4.9, including its reliance on Simpson; p.133 Proposition 4.10 and opening flow notation. SHA-256: 0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab. These are selected readings, not a complete verification of this paper.
- [Liu–Zhu, final author version](https://arxiv.org/pdf/1602.06282v3): PDF pp.5, 7, 9, 20–24 and 27 at the passages listed in the packet. In particular Remark 3.2 on p.24 was read directly. SHA-256: 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79. The full correspondence proof is not claimed read.
- [Heuer, published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf): printed pp.262–263, Definition 1.2 and introduction scope. SHA-256: 7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd. The correspondence proof is not claimed read.

The matrix calculations below are elementary deductions from the parameter Leibniz rule, not claimed as named theorems of those papers. Source locators and short literal excerpts identify the motivating definition; the packet's match text records the exact limit of the citation. No new source error is alleged. The assumption that λ is relatively constant is explicit input for this model, not a purported correction to EG's moduli definition.

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

Acceptance: Scalar 1 in one direction over Q is flat but has no finite bound. For ε²=0≠ε in nonreduced R, a rank-one coefficient ε is nonzero with bound 2. Intrinsic finite-filtration comparison and tensor nilpotence bounds remain gaps.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; HodgeStructuresPartII:H.0/dual; HodgeStructuresPartII:H.0/flatness; HodgeStructuresPartII:H.0/zero-parameter-curvature; mathlib:Matrix.single.

### Why the tests discriminate

On A¹_Q, the scalar Higgs field dx has zero wedge curvature because there is only one direction, but every positive word product of its coefficient 1 remains 1. Thus integrability is not nilpotence. Conversely E12 dx on a rank-two free module has a genuinely nonzero coefficient with square zero. The nonreduced test is equally important: if ε²=0≠ε, a rank-one Higgs coefficient ε is nonzero and has bound 2. A rank-one-zero rule without a reducedness premise would fail it.

On A²_Q, E12 dx+E21 dy has coefficient curvature E11−E22=diag(1,−1). Replacing integrability by a vacuous exterior condition or by a property checked one direction at a time misses this obstruction. The zero-direction Q matrix test in the suggested file is a coefficient calculation; it is not a claim that Ω¹_Q/Q contains dx and dy.

The constant-parameter premise has a separate role. If commuting directions are ∂_x,∂_y, λ=x and A=0 over Q[x,y], then [x∂_x,x∂_y](y)=x. The displayed constant-parameter curvature expression would be zero. This model is deliberately excluded by δ_xλ=1. The distinction concerns relative constancy; no claim is made that the source's family parameter is an arbitrary nonconstant absolute-coordinate parameter.

For a unit u, rescaling multiplies both D and A by u^−1. The model with λ=2, A=0 on Q[X] sends X to 2, while the ordinary rescaled operator sends X to 1. Tensoring two same-parameter models uses the Kronecker sum, and its Leibniz rule still has λ once. Adding both scalar Leibniz terms as if they acted on an unbalanced tensor would produce an incorrect 2λ coefficient.

Gauge is fixed by the convention s′=Gs; its derivative correction is minus λδG·G^−1. Dual is minus transpose, not transpose. These signs are tested independently of flatness: zero curvature alone cannot detect a wrong coefficient formula in a one-direction model.

## Binding route inventory and remaining layers

The packet's routeManifest preserves all 149 routed item ids from eight accepted route records: the seven papers in the issue and the additional Liu–Zhu shared-prefix obligations. Counts are catalogue obligations, not a claim of 149 freshly verified statements. All seven complete accepted briefs and the key-definition assignment were read. Only the selected fresh primary passages above were read this session; reading a brief is not reading the corresponding proof.

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

Supply the reserved general ringed-site finite-locally-free Higgs/λ-connection interface once: central parameter with dλ=0, integrability, explicit coefficient twist, tensor, dual, pullback, nilpotence bounds and Griffiths associated-graded construction. This checkpoint develops only free affine commuting-coordinate models; these do not discharge the reserved key.

Declared draft prerequisites: CrystallineCohomology:CR.1; EnhancedDerivedSheaves:E1.

Coverage: partial affine prefix only.

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

## Exact continuation worklist

No stage is closed. The next worker starts with the reserved key, not with a comparison theorem, and retains the coordinate nodes as tests:

1. Supply HodgeStructuresPartII:key/higgs-parameter-connections on general ringed differential sites with finite locally free coefficients and central relatively constant λ; the local models do not supply it.
2. Construct intrinsic exterior differential forms and the graded extension of D with well-defined curvature; prove its comparison with commuting-coordinate local models.
3. Import generic sheaf tensor/descent and ordinary connection carriers, then construct finite projective and sheaf gluing, pullback and gauge cocycle compatibility.
4. Construct twisted Higgs fields valued in Ω¹⊗T, keeping the p-adic Tate coefficient explicit.
5. Compare intrinsic finite-filtration/iterated-Higgs nilpotence with local word nilpotence under the necessary local-freeness assumptions; prove tensor, dual and pullback bounds.
6. Construct Griffiths filtered connections, the induced associated-graded Higgs field and Rees specialization; prove integrability passes to the graded field.
7. Freshly read complete supporting source proofs and all routed catalogue statements; verify remaining ordinary-connection near-misses before asserting their scope.

For H.1–H.8, read the complete source statements and supporting proofs identified by the retained routeManifest, resolve the moduli/curve/analytic/log/equivariant supplier interfaces at declaration level, and promote each non-routine proof input to its own node. The named four requests in the packet are supplier contracts, not evidence that those contracts have been met. No nodes for the undecomposed layers have been manufactured from brief summaries.

Stage links and blueprint/integrated link-map entries were screened for HodgeStructuresPartII and DegeneratingHodgeStructures at the audit tree; no pre-existing entries named either. This does not count as a catalogue-wide link audit for all touching suppliers. The parent and four directly used supplier descriptions were read; the continuation must read the remaining suppliers and touching links before planning their downstream declarations.

Only three provisional planets are selected in H.0: Affine parameter connections, Coordinate curvature and Joint Higgs nilpotence. No missing general definition or unread theorem is presented as a planet. No source erratum is asserted by this checkpoint.

Validation results and the exact publication audit tree are recorded in the handoff. The suggested file is a set of uncompiled signatures and examples; no implementation is claimed.
