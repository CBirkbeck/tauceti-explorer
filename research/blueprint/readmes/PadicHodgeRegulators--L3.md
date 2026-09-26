# P-adic regulators: big logarithms and signed extensions

## Scope and mathematical ownership

This part of **P-adic regulators and the local K₃ calculation** covers `PadicHodgeRegulators:L3` and `PadicHodgeRegulators:L4`. Its main analytic objects are the crystalline vector-valued Perrin–Riou regulator and the bounded Coleman coordinates which express it in a chosen Wach basis. A scalar regulator requires an additional functional or refinement; it is not determined by a representation alone. The noncrystalline extension is a separate, domain-qualified theorem.

The common input is supplied by the `(φ,Γ)` roadmap: `PG.4` supplies the integral ψ operator, `PG.5` the comparison with inverse-corestriction Iwasawa cochains, and `PG.6` Wach existence, lattice reconstruction and freeness in its stated unramified crystalline range. `PadicHodgeRegulators:L1` supplies Bloch–Kato maps; `L2` supplies regulator-specific normalization comparisons. The analytic Mellin equivalence belongs to `LocallyAnalyticDistributions:L3`. The bounded Iwasawa algebra and its division theory belong to `PadicMeasuresIwasawaAlgebras:L2` and `L4`. None of these carriers is defined again here. The good ψ-zero basis required by LLZ must be proved using their Theorem 2.12; ordinary Wach freeness is not that assertion.

The source for the declaration-level algebra below is Lei–Loeffler–Zerbes, *Coleman maps and the p-adic regulator*, Algebra & Number Theory **5** (2011), 1095–1131, especially §§3, 4A and 5A–5C. The publication and arXiv:1006.5163v2 are separate versions. Their local differences and the extent of source reading are recorded in the packet and handoff.

## Conventions

For the LLZ application, p is odd, E is a finite extension of Q_p, O is its ring of integers, and G=Δ×Γ₁ is the cyclotomic Galois group. Fix γ generating Γ₁ and write X=γ−1. The convention is HT(Q_p(1))=+1. Every use of a theorem about nonnegative Hodge–Tate weights retains that restriction and its admitted twist.

The bounded ring is R=O[[X]][1/ϖ], consisting of power series with bounded E-coefficients. It is **not** the ring of all formal series E[[X]]. Evaluation at x∈m_O is an algebra map on R, and division by X−x must be proved to remain in R. The analytic distribution algebra H(G) is another carrier. The Mellin identification used in the regulator construction is a module identification; it must not be treated as multiplicative for the ordinary product of analytic power series.

Coefficient vectors are rows and ordered vectors of basis elements are columns. For n′=Un and ν′=Bν, the coordinate row and matrix laws are

    c′ = c U⁻¹,           M′ = U M B⁻¹.

Apply the coefficient embedding R→H to U and c where necessary. These formulas imply c′M′=cMB⁻¹. Integral lattice invariance requires U∈GL_d(O), not just GL_d(E). A determinant generator is specified up to a unit unless an additional normalization is supplied.

## L3. Vector regulator and Euler operators

Construct the actual map

    L_V : H¹_Iw(Q_p,V) → H(G) ⊗_E D_cris(V)

by composing the inverse Iwasawa comparison, 1−φ, and the inverse Mellin module comparison. The direction of the Iwasawa isomorphism is important: in LLZ Definition 3.4 it is h_Iw:N(V)^(ψ=1)→H¹_Iw(Q_p,V), so the construction uses h_Iw⁻¹. Restrict this expression to the representation range in which that identification has been established. An arbitrary linear map between vector spaces of the expected dimensions is not an instance of this construction.

The full analytic targets include auxiliary-h comparison with the big exponential; every finite-order-character and integral-twist interpolation; Bloch–Kato exponential and dual-exponential formulas; growth, integrality, coefficient extension and reciprocity/determinant formulas; and the rank-one Coleman comparison with its actual sign and twist. Singular Euler operators must have their kernels and domains retained. The coverage record distinguishes these targets from the algebraic declarations actually decomposed here.

### Quadratic Euler calculation

The finite-dimensional input to LLZ Lemma 5.6 can be isolated without pretending to construct the regulator. Let Φ²+aΦ+bI=0 and put s=1+a+b. Define

    P = −b⁻¹(Φ+aI),          Q = s⁻¹(Φ+(1+a)I).

If b≠0, expansion of the quadratic relation proves ΦP=PΦ=I. If s≠0, it proves (I−Φ)Q=Q(I−Φ)=I. With p,b,s nonzero,

    Q(I−p⁻¹P)
      = ((1+a+pb)Φ + (a(1+a+pb)+b(p−1))I)/(pb(1+a+b)).

All inverses here are scalar inverses with stated nonvanishing conditions. For Φ=1 the second denominator can vanish; for Φ=0 the first can vanish. Neither case is repaired by using a total inverse operation that returns zero. Matrix multiplication is never assumed commutative; P and Q commute with Φ because they are polynomials in it.

The declarations are `quadraticFrobeniusInverse`, `quadraticFrobeniusInverse_spec`, `quadraticEulerInverse`, `quadraticEulerInverse_spec` and `quadraticEulerProduct`. The two inverse specifications are separate lemma nodes used by the product theorem. Scalar extension is expressed by applying a field embedding entrywise.

## L4. Coleman images and changes of basis

### A finite-evaluation module

The algebraic proof has the following precise interface. Let E be a field, R a nonzero commutative E-algebra which is a domain, t∈R, x_j∈E pairwise distinct, and ev_j:R→E E-algebra homomorphisms such that

    ev_j(t)=x_j,       q_j=t−x_j ≠ 0,
    ev_j(f)=0  if and only if  q_j divides f.

Scalars x_j are mapped into R in the expression q_j. Let V_j⊆E^d be subspaces. For a finite set J of indices define

    S_J(V) = { F∈R^d : ev_j(F)∈V_j for every j∈J }.

This is `evaluationConstraints`, an R-submodule because every ev_j respects multiplication. The nonzero-q_j hypothesis is substantive: allowing R=E and t=x_j can turn S into a proper E-subspace, defeating the rank-d conclusion. The domain hypothesis is also substantive: a nonzero zero-divisor need not identify R with q_jR. Pairwise distinctness is separate again: two conditions at the same point do not supply a doubled zero or a jet condition.

**One point — `singleConstraintBasisExists`.** Extend a basis of V_j to one of E^d, with row matrix C. In those coordinates the complementary entries must lie in q_jR. Consequently the rows of diag(1,…,1,q_j,…,q_j)C form a basis of S_{j}(V). Injectivity uses q_j≠0 and the domain assumption; surjectivity uses the evaluation-kernel division theorem. Its determinant is associated to q_j^codim(V_j). Use Mathlib's `Module.Basis` and `Module.Basis.extend`, not a private basis type.

**Several points — `constraintBasis`.** Suppose B is the row matrix of the basis for the old conditions. `constraintBasisEvaluationInvertible` proves that at a new point x_j its determinant is a unit times a product of nonzero differences x_j−x_i, so B(x_j) is invertible. The new condition on the coefficient row is the inverse image of V_j under row multiplication by B(x_j), namely V_jB(x_j)⁻¹. This is `transportedSpecialization`; `transportedSpecialization_finrank` exhibits the equivalence to V_j and proves equal codimension.

Apply the one-point construction to that coefficient module. The updated matrix is **CB**, with C on the left. The induction proves the basis and its determinant invariant together, so it does not assume the final determinant theorem to construct the basis. `constraintBasis_determinant` extracts the principal determinant ideal

    ( ∏_(j∈J) q_j^codim(V_j) ).

For any other basis, the determinant changes by a unit. This is an equality of ideals, or association of generators, not an assertion that every basis has the same determinant.

**A coordinate image — `coordinateImage_eq`.** For coordinate k set

    J_k = { j∈J : every v∈V_j has v_k=0 },
    g_k = ∏_(j∈J_k) q_j.

This is `projectionGenerator`. Then pr_k(S_J(V))=g_kR. The forward inclusion uses `divisibleByEvaluationProduct`: after dividing by q_j, the quotient still vanishes at x_i because x_i−x_j≠0. The reverse inclusion uses `projectionWitness`. Choose a vector in each V_j whose k-th coordinate is g_k(x_j), rescaling a vector with nonzero k-th coordinate; at a forced-zero point choose zero. Interpolate the other coordinates with Mathlib's `Lagrange.interpolate` and set the k-th coordinate to g_k itself. `Lagrange.eval_interpolate_at_node` verifies membership and gives the generator. Multiplication by R gives every element of g_kR.

This witness proof is over E. Values 0 and 1 at 0 and 5 require X/5 and cannot be interpolated by a polynomial over Z_5. Therefore the argument does not give integral surjectivity. Nor does coordinatewise surjectivity imply S_J(V)=R^d: the condition F(0)=G(0) is a simple counterexample.

### Actual Coleman coordinates and the logarithmic matrix

First supply the genuine ψ=1 source and ψ=0 Wach target and prove the good-basis result. If e is the coordinate map of that target, `colemanCoordinates` is Col=e∘(1−φ). `colemanCoordinates_reconstruct` recovers (1−φ)x using e⁻¹. The prototype also states this identity for arbitrary actual linear maps; that generality does not implement the arithmetic input.

Let j be the actual map into the analytic scalar extension and b the coordinate map of a fixed crystalline basis. Define `logarithmicMatrix` by its rows

    M_i = b(j(e⁻¹(e_i))).

`logarithmicMatrix_expansion` follows by finite basis expansion:

    b(j(w)) = algebraMap(e(w)) M.

Use `Module.Basis.constr_apply_fintype` and the existing bilinear row-multiplication API. `regulatorCoordinateDecomposition` applies this equality to (1−φ)x, and then uses the actual Iwasawa comparison to express the vector regulator. No determinant, dimension count or arbitrary functional substitutes for these maps.

At a specialization, l(x_j)∈V_j and l=cM with M(x_j) invertible give the Coleman condition c(x_j)∈V_jM(x_j)⁻¹. The two subspaces must not be identified without this transport. The determinant and image arguments identifying the genuine Coleman image with these constraints require LLZ's representation hypotheses and reciprocity input; the preceding algebra only computes the module once those subspaces have been determined.

`constantBasisCovariance` states both coordinate changes and invariance under simultaneous domain and target basis changes. The source's fixed-crystalline-basis case has B=I. A constant integral change is not a proof that every power-series Wach basis is good: LLZ Remark 2.14 leaves that larger assertion outside the theorem used here.

### Integral shear and rational versus integral images

For a two-dimensional coefficient row define `shearMatrix` by

    A = [[1,e₂],[e₁,1]],       (F′,G′)=(F+e₁G,G+e₂F).

`shearSpecializationLines` gives

    F=rG  if and only if  (1+e₂r)F′=(e₁+r)G′,

with the separate axis formulas F′=e₁G′ and G′=e₂F′. Nonzero determinant is sufficient over E, but over O the determinant must be a **unit**.

`integralShearChoice` chooses nonzero e₁,e₂ in the maximal ideal of O, avoiding the finitely many exceptional values −r and −r⁻¹. There are infinitely many choices even for a small residue field: positive powers of a uniformizer are distinct. Since e₁e₂ lies in the maximal ideal, `IsLocalRing.isUnit_one_sub_self_of_mem_nonunits` proves that 1−e₁e₂ is a unit. The maximal ideal is Mathlib's existing `IsLocalRing.maximalIdeal`.

All transformed lines have both projections nonzero. `shearedCoordinateSurjectivity` identifies S(V)A with S(VA) by evaluation and uses `coordinateImage_eq` to prove rational surjectivity. For the integral conclusion retain the actual lower inclusion used in LLZ Theorem 5.10, obtained from their earlier integral argument. Combine that inclusion with rational equality and the finite O-module quotient to prove finite cokernel. Theorem 5.13 concerns the pseudo-null correction, not automatic integral surjectivity. The ideal (5,X) in Z_5[[X]] is proper, has quotient F_5, and becomes full after inverting 5; it detects the invalid inference.

### Noncrystalline branch

The de Rham extension uses Rodrigues Jacinto, *(φ,Γ)-modules de de Rham et fonctions L p-adiques*, Algebra & Number Theory **12** (2018), 885–934, arXiv:1702.05636. Its construction belongs on its proved open character domain, with the actual ramification, growth and interpolation restrictions. It is not a globally defined scalar distribution for every de Rham representation. Prove comparison with crystalline Perrin–Riou theory only on the common domain. The packet's coverage record separately identifies the untranscribed source theorem and proofs; the algebraic declarations here do not discharge that branch.

## Definition API and discriminating tests

The packet gives one declaration per node, including the nonroutine inverse, basis, transport, image and matrix lemmas. The following API and tests apply to each definition or construction. Tests bearing the same names appear as examples in the suggested file; these are mathematical acceptance criteria, not a claim of compiled code.

### `quadraticFrobeniusInverse`

API: `quadraticFrobeniusInverse_formula` gives −b⁻¹(Φ+aI); `quadraticFrobeniusInverse_spec` proves the two inverse identities under b≠0 and the quadratic relation; `quadraticFrobeniusInverse_map` commutes with a field embedding.

Tests: `frobenius_scalar_two` uses Φ=2,a=−5,b=6 and gives 1/2; `frobenius_scalar_minus_one` uses Φ=−1,a=0,b=−1 and gives −1; `frobenius_singular_excluded` uses Φ=a=b=0 and verifies that the candidate is not an inverse.

### `quadraticEulerInverse`

API: `quadraticEulerInverse_formula` gives s⁻¹(Φ+(1+a)I); `quadraticEulerInverse_spec` proves the two inverse identities for I−Φ under s≠0; `quadraticEulerInverse_map` commutes with a field embedding.

Tests: `euler_scalar_two` gives −1 for Φ=2,a=−5,b=6; `euler_scalar_zero` gives I for Φ=a=b=0, showing b≠0 is not needed for this inverse alone; `euler_singular_excluded` takes Φ=1,a=−3,b=2 and detects s=0.

### `evaluationConstraints`

API: `evaluationConstraints_mem` is the exact componentwise condition; `evaluationConstraints_empty` gives the full module; `evaluationConstraints_antitone` proves that adding conditions shrinks the submodule.

Tests: `constraints_none` checks the empty family; `constraints_zero_at_zero` excludes 1 and includes X for one zero condition over Q[X]; `constraints_diagonal` includes (1,1) and excludes (1,0) for the diagonal condition at zero.

### `transportedSpecialization`

API: `transportedSpecialization_mem` says c∈W iff cC∈V; `transportedSpecialization_one` gives V; `transportedSpecialization_comp` transports first by C and then by D through the matrix DC, in that order.

Tests: `transport_identity` checks I; `transport_shear` takes V=Q(1,0), C=[[1,1],[0,1]] and obtains Q(1,−1); `transport_singular` takes C=0,V=0 and obtains E^d, detecting the missing invertibility hypothesis in any dimension claim.

### `constraintBasis`

API: `constraintBasis_rows_mem` certifies row membership; `constraintBasis_expansion` gives unique coordinates for each member; `constraintBasis_determinant` gives association to the product of q_j^codim(V_j), for any basis.

Tests: `basis_single_zero_condition` gives basis X of the kernel at zero; `basis_two_zero_conditions` gives X(X−5), not X²; `basis_two_coordinates` imposes span(e1) at zero and span(e2) at five, with basis rows (X−5,0),(0,X). All use the polynomial ring Q[X], where the hypotheses can be checked explicitly.

### `projectionGenerator`

API: `projectionGenerator_formula` gives the product over the forced-zero set; `projectionGenerator_empty` gives one when no point forces that coordinate to vanish; `projectionGenerator_eval` characterizes its zeros at the distinct evaluation nodes.

Tests: `projection_no_constraints` gives one; `projection_all_zero` gives X(X−5) for the scalar two-point problem; `projection_mixed` gives X−5 and X for the two coordinates of the mixed-axis problem.

### `projectionWitness`

API: `projectionWitness_coordinate` fixes the k-th coordinate to g_k; `projectionWitness_mem` gives membership in the actual constrained submodule; `projectionWitness_multiples` gives every multiple rg_k by multiplying the witness.

Tests: `witness_empty` uses the standard vector; `witness_diagonal` uses (1,1) for the condition F(0)=G(0); `witness_integral_denominators` computes X/5 and verifies that no polynomial over Z_5 can have values 0 and 1 at 0 and 5. The last test prevents an invalid integral interpretation of the rational interpolation proof.

### `colemanCoordinates`

API: `colemanCoordinates_apply` gives e(f(z)); `colemanCoordinates_reconstruct` recovers f(z); `colemanCoordinates_precomp` commutes with precomposition of the source map.

Tests: `coleman_zero` gives zero; `coleman_standard` gives identity for the standard coordinate model; `coleman_shear_inverse` distinguishes cU⁻¹=(1,−1) from cU=(1,1) when c=(1,0) and U=[[1,1],[0,1]].

### `logarithmicMatrix`

API: `logarithmicMatrix_entry` defines each entry from the image of a coordinate basis vector; `logarithmicMatrix_expansion` gives the actual vector identity after coefficient extension; `logarithmicMatrix_zero` gives zero when j=0.

Tests: `matrix_identity` gives I; `matrix_non_diagonal` recovers [[1,2],[3,4]], not its transpose; `matrix_singular_inclusion` takes j with row matrix diag(1,0) and verifies determinant zero, preventing an unsupported invertibility claim.

### `shearMatrix`

API: `shearMatrix_action` specifies the ordered row formula; `shearMatrix_det` gives 1−e₁e₂; `shearMatrix_unit` constructs invertibility only with a unit determinant.

Tests: `shear_identity` gives I; `shear_order` sends (7,11) to (29,32) for e₁=2,e₂=3; `shear_nonunit_determinant` uses e₁=1,e₂=−4 over Z_5, giving determinant 5 and a matrix that is not an integral automorphism.

## Acceptance and source boundaries

The algebraic core is accepted only with exact maps, row orientation, coefficient embeddings, all evaluation/division hypotheses and generator witnesses. A rank calculation alone does not discharge these contracts. For the analytic application, supply the bounded-series instance, the good Wach basis and actual ψ/Iwasawa/Mellin comparisons, and prove LLZ's genuine image equality before applying the constraint-module theorems. The integral lower inclusion and the de Rham open-domain theorem remain separate mathematical obligations; their exact continuation boundaries are recorded in the packet.
