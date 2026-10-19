# Metaplectic groups, Weil representations and automorphic theta kernels, Part II: finite Weil–Heisenberg representations

This Part II develops the finite, odd-characteristic representation theory needed by tame and classical p-adic types. Starting from the parent roadmap’s algebraic Heisenberg extension, it constructs Schrödinger models, proves central-character uniqueness including cyclic centers of higher p-power order, and normalizes a genuine finite symplectic action. Partial-polarization restriction retains the quadratic determinant twist, and isotropic induction and tensor fixed vectors supply the finite inputs to Fintzen and Stevens. The independent automorphic theta-correspondence routes have an explicit companion-roadmap proposal.

This is a plan for formalization, not an implementation report. The finite branch of issue #3389 is covered in full. The independent theta branch has the concrete assignment at the end of this document. Every target below remains unchecked as an implementation; the suggested file’s elaboration checks signatures only.

## Scope, conventions and ownership

H(V) is the native factor-set extension supplied by MetaplecticAutomorphicForms:MP.0: coordinates (t,v), product (t,v)(s,w)=(t+s+B(v,w)/2,v+w), commutator ghg⁻¹h⁻¹=(B(v,w),0). Sp(V) is TauCeti.BilinForm.isometryGroup B. For V=X⊕X*, B((x,y),(x′,y′))=y′(x)−y(x′). In coordinates y(z) is a dot product. ψ is unit-valued, and scalar equations use its image in C. Native semidirect products put the normal subgroup first: H(V)⋊Sp(V). The notation Sp(V)⋉H(V) in papers denotes this same group after exchanging the coordinate order.

The ambient finite symplectic space uses native bilinear forms. No real-only symplectic structure is reused over a finite field. Nontrivial ψ is sufficient: over a field extension ψ generally has a kernel, while its scalar shifts still detect every nonzero functional. All sums in this roadmap are finite, and complex finite-group representations supply semisimplicity.

The parent supplies these exact algebraic nodes; their ring-level hypotheses permit the finite-field specialization:

| Imported node | Input used here |
|---|---|
| `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set` | Native factor-set extension and its coefficient/vector coordinates. |
| `MetaplecticAutomorphicForms:MP.0/half-form-commutator` | The commutator is B(v,w), with the chosen sign. |
| `MetaplecticAutomorphicForms:MP.0/half-form-center` | For nondegenerate B, the coefficient subgroup is the full center. |
| `MetaplecticAutomorphicForms:MP.0/polarization-equivalence` | The quadratic coordinate change between the half-form and polarized cocycles. |
| `MetaplecticAutomorphicForms:MP.0/isometry-action` | The native isometry group acts on the same extension, fixing its center. |

In a plane the last coordinate change identifies (t,x,y) with the current library’s native Heisenberg element (x,y,t+xy/2). The current-main group, cardinality and commutator theorems are already supplied by `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean`; they are not new targets here. This current-main comparison is recorded separately from the pinned baseline.

The parent’s `MP.4/finite-weil-representation` concerns the discriminant quadratic module of an even integral lattice and its Mp₂(Z) action, including its signature phase. That target retains its owner. It does not supply the Sp(V) representation of a finite-field symplectic space used here. Parent smooth local Stone–von Neumann, Haar/Fourier analysis, local metaplectic covers and adelic theta kernels are likewise distinct inputs and are not prerequisites for this finite branch.

Current TauCetiRoadmap InductionRestriction and CharacterTheory were read alongside the current library. The nine newer roadmap directions were screened for overlapping targets. The reviewed parent library audit and all touching link records were checked. Generic induction, characters, projective representations and bilinear-form isometries are cited directly below.

General Lagrangian basis extension is imported from `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, whose statement covers any field and any specified basis of a Lagrangian. FW.0 only assembles partial coordinates from it. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already provides `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `even_finrank` in `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean` (lines 301–313); they are absent at the pinned commit and are not new targets. The current library uses `Matrix.J`; negating the second half of its basis gives the sign convention here.

## Pinned library baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each listed declaration was read with its actual hypotheses.

| Declaration | What it supplies |
|---|---|
| `mathlib:LinearMap.BilinForm.IsAlt` | Alternating bilinear forms over the native module carrier; no real symplectic-form wrapper. |
| `mathlib:LinearMap.BilinForm.Nondegenerate` | The two-sided native nondegeneracy predicate. |
| `mathlib:LinearMap.BilinForm.finrank_orthogonal` | For nondegenerate B on a finite-dimensional space, dim(W orthogonal)=dim(V)-dim(W). |
| `tauceti:TauCeti.BilinForm.isometryGroup` | The subgroup of native linear equivalences preserving a bilinear form; its elements act on vectors. |
| `tauceti:TauCeti.BilinForm.mem_isometryGroup_iff` | Membership is exactly B(gx,gy)=B(x,y) for all x,y. |
| `mathlib:AddChar.IsPrimitive.of_ne_one` | A nontrivial additive character of a field is primitive, including extension fields where it is not injective. |
| `mathlib:AddChar.sum_mulShift` | The sum of a primitive additive character over a scaled finite field is the cardinality at scale zero and zero otherwise. |
| `mathlib:quadraticChar` | The existing integer-valued multiplicative quadratic character; cast its values to complex units on nonzero inputs. |
| `tauceti:FDRep.ofLinearCharacter` | The native one-dimensional FDRep associated with a homomorphism to coefficient-field units. |
| `tauceti:TauCeti.indFDRep` | Finite-index induction of an FDRep from a subgroup, using the native induction model. |
| `tauceti:TauCeti.finrank_indFDRep` | Dimension of finite-index induction is subgroup index times input dimension. |
| `mathlib:MonoidAlgebra.Submodule.exists_isCompl` | Invariant complements over a field when the finite group order is invertible; used only over C. |
| `mathlib:FDRep.char_orthonormal` | Normalized character pairing of two simple finite-group FDReps over an algebraically closed splitting field is the isomorphism indicator. |
| `mathlib:FDRep.simple_iff_char_is_norm_one` | Over an algebraically closed characteristic-zero field, character norm one characterizes simplicity. |
| `mathlib:FDRep.simple_iff_end_is_rank_one` | Schur scalar endomorphisms for a simple FDRep over an algebraically closed field, with invertible group order. |
| `tauceti:TauCeti.IsProjectiveRep` | Normalized projective operators with their multiplicative scalar factor set; rescaling changes that factor by a coboundary. |
| `mathlib:LinearEquiv.det` | Determinant of an automorphism as a unit, with multiplicativity inherited from LinearMap.det. |
| `mathlib:Representation.invariants` | The native submodule of vectors fixed by a representation; used after restricting to a subgroup. |
| `mathlib:Rep.indResHomEquiv` | The native linear Frobenius-reciprocity equivalence between morphisms from induction and morphisms to restriction; use the existing indFDRep forgetful comparison. |
| `tauceti:TauCeti.Rep.indSubtypeEquivPi_ρ_apply` | Finite-index induction has a right-coset function model, with action by right translation and the subgroup coset factor. |
| `mathlib:SemidirectProduct` | Native group carrier with normal subgroup first and multiplication (n,g)(n′,g′)=(n·φ(g)n′,gg′). |
| `tauceti:TauCeti.indFDRepForgetEquiv` | The native equivariant linear equivalence between the small carrier of indFDRep and Mathlib Rep.ind after forgetting finite dimensionality; this carries the coset model and Frobenius reciprocity to FDRep. |

Over C, every finite group order is invertible and the algebraic-closure hypotheses of Schur and character orthogonality hold. The native finite-index induction object is compared with its right-coset model; no replacement induction structure is planned.

## Layer order and acceptance

| Layer | Targets | Depends on |
|---|---|---|
| FW.0 — Finite symplectic coordinates | Over a finite field k of odd characteristic, assemble coordinates adapted to a specified isotropic I: V=I⊕V₀⊕J, I⊥=I⊕V₀, perfect I–J pairing and nondegenerate V₀, with dim V=2 dim I+dim V₀. Import the general Lagrangian basis-extension theorem from MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis. General symplectic-basis existence and even dimension already exist in current Tau Ceti and are not new targets. Use native bilinear forms, submodules and isometries. Import the parent MP.0 algebraic Heisenberg extension, half-form commutator and center, polarization equivalence and isometry action; the current library’s rank-one Heisenberg group is an existing carrier. | `MetaplecticAutomorphicForms:MP.0`, `MordellLawrenceVenkatesh:LV.3` |
| FW.1 — Finite Heisenberg representations | For nontrivial ψ:k→Cˣ and dim V=2n, construct the finite Schrödinger FDRep on Fun(X,C), π(t,x,y)f(z)=ψ(t+y(z)+y(x)/2)f(z+x), and identify native induction. Compute its character qⁿψ(t) on the center and zero elsewhere; prove irreducibility and uniqueness. More generally, for finite J, normal H, abelian J/H and invariant θ with nondegenerate commutator pairing, prove the unique θ-scalar irreducible has dimension squared [J:H], allowing H/ker θ of order pᵃ. For Lagrangians A,B, construct T_BA by finite left averaging and prove T_AA=\|A\|id and T_AB T_BA=\|A\|\|A∩B\|id. | `MetaplecticAutomorphicFormsPartII:FW.0` |
| FW.2 — Genuine finite Weil actions | Choose Egorov intertwiners μ(g) for g∈Sp(V) and their native projective multiplier. With parity Rf(z)=f(−z) and S⁺ its even subspace, prove μ commutes with R and normalize by κ(g)=det μ(g)/(det μ(g)\|S⁺)². Prove ω=κμ is a genuine, scalar-choice-independent homomorphism, including Sp₂(F₃), characterized by det ω=(det ω\|S⁺)². Give exact lower-shear, diagonal and Fourier formulas with the quadratic determinant character and pinned J sign. Construct Ω(h,g)=π(h)ω(g) on the native H(V)⋊Sp(V). Pull it back to P⋊K only from a specified special isomorphism P≃H(V) equivariant for a specified K→Sp(V). | `MetaplecticAutomorphicFormsPartII:FW.1` |
| FW.3 — Parabolic restriction and isotropic induction | For isotropic I, identify Sψ,V with Ind_H(I⊥)^H(V) Sψ,V̄, V̄=I⊥/I, and identify I-fixed vectors with the smaller Schrödinger space by evaluation at zero in its mixed model. If P stabilizes I, prove its action on these vectors is (χ_k∘det on I)⊗Ωψ,V̄. Deduce the corrected induction formula from P⋉H(I⊥) to P⋉H(V), retaining this twist. For cyclic-center data J,H,θ over Fp and a subgroup U lifting isotropic I with θ(U∩H)=1, construct θ_I(hu)=θ(h) on HU, prove its unique Heisenberg representation η_I satisfies Ind_Q^J η_I≅η and η^U≅η_I for Q the preimage of I⊥, and compute its dimension. | `MetaplecticAutomorphicFormsPartII:FW.0`, `MetaplecticAutomorphicFormsPartII:FW.1`, `MetaplecticAutomorphicFormsPartII:FW.2` |
| FW.4 — Fixed vectors and type-theoretic exports | If U stabilizes isotropic I and its quotient action stabilizes a Lagrangian L₀ in I⊥/I, prove that the inverse image L is Lagrangian and its Schrödinger fixed line carries χ_k(det on I)χ_k(det on L₀). Deduce a nonzero U-fixed vector when both determinant characters are trivial, in particular for unipotent induced actions. For orthogonal sums, identify the pulled-back Schrödinger and normalized Weil–Heisenberg actions with tensor products, including the F₃ exception and the empty family, and prove the pure tensor of nonzero fixed vectors is nonzero. Export these finite inputs to Fintzen’s and Stevens’s type constructions, whose p-adic quotients and action identifications remain with their consumer roadmap. | `MetaplecticAutomorphicFormsPartII:FW.3` |

## FW.0. Finite symplectic coordinates

Over a finite field k of odd characteristic, assemble coordinates adapted to a specified isotropic I: V=I⊕V₀⊕J, I⊥=I⊕V₀, perfect I–J pairing and nondegenerate V₀, with dim V=2 dim I+dim V₀. Import the general Lagrangian basis-extension theorem from MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis. General symplectic-basis existence and even dimension already exist in current Tau Ceti and are not new targets. Use native bilinear forms, submodules and isometries. Import the parent MP.0 algebraic Heisenberg extension, half-form commutator and center, polarization equivalence and isometry action; the current library’s rank-one Heisenberg group is an existing carrier.

### Adapted finite symplectic coordinates

Target `MetaplecticAutomorphicFormsPartII:FW.0/adapted-polarization` (construction). Planet: **Partial polarization**.

For every isotropic subspace I≤V, assemble finite Schrödinger coordinates V=I⊕V₀⊕J with I⊥=I⊕V₀, perfect I–J pairing and nondegenerate V₀. The coordinate equivalence identifies the form with B₀ orthogonally summed with B((x,y),(x′,y′))=y′(x)−y(x′) on I⊕I*. Its API records dim V=2 dim I+dim V₀. General adapted Lagrangian bases are imported from MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis; general symplectic-basis existence and even dimension already exist in current Tau Ceti and are not new targets. Use native Submodule, LinearEquiv and BilinForm; this target packages the specified partial decomposition for the finite models.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate.
- I is isotropic: B vanishes on I×I.

**Construction or proof.**

1. Extend I to a maximal isotropic subspace L. A vector in L⊥ outside L would enlarge L isotropically, so L=L⊥; native orthogonal dimensions give dim V=2 dim L. Extend a basis of I to one of L.
2. Apply the imported Lagrangian basis-extension theorem to this chosen basis. Let J be spanned by the dual vectors paired with the basis of I; let V₀ be spanned by the remaining paired basis vectors. The symplectic-basis equations directly give the required orthogonal decomposition and I⊥=I⊕V₀.
3. Identify J with I* by y(x)=B(x,y). Read the dimension formula, the quotient identification and full polarizations from these coordinates. General basis existence, basis extension and even dimension retain their existing owners; no separate theorem for them is planned here.

**Prerequisites.** `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.finrank_orthogonal`, `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`.

**Uses that determine the API.**

- FW.1 Schrödinger models: Choose finite coordinates and dimension qⁿ.
- Fintzen, Lemma 7.10, pp. 32–34: Split off the isotropic plus space and identify its symplectic quotient.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `adaptedPolarization_coordinates` | equivalence | The coordinate map I⊕V₀⊕I*≃ₗ[k]V preserves the displayed alternating form. |
| `adaptedPolarization_perp` | characterisation | I⊥ corresponds to I⊕V₀⊕0, and its quotient by I is isometric to V₀. |
| `adaptedPolarization_finrank` | relation | dim V=2 dim I+dim V₀, by counting paired coordinates; general even dimension is an existing result, not a separate target. |
| `adaptedPolarization_transport` | functoriality | An isometry carrying I to I′ transports the chosen witness data and the induced quotient isometry. |

**Checks and worked examples.**

- `adapted_zero`: I=0 permits V₀=V and J=0; it does not force V=0.
- `adapted_plane`: For V=k² with B((x,y),(x′,y′))=xy′−yx′ and I=k(1,0), take J=k(0,1), V₀=0.
- `adapted_rank_four`: In two orthogonal planes, choosing I as the first x-axis leaves the second plane as V₀ of dimension two.
- `adapted_nonexample`: The whole nonzero symplectic plane is not isotropic and cannot be supplied as I.

**Acceptance.**

- The complement to I in I⊥ is the quotient symplectic space, with its induced form.
- No assertion is made that a fixed chosen complement is preserved by its parabolic stabilizer.
- For a full polarization, reuse the imported Lagrangian basis-extension theorem. Current TauCeti LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J and even_finrank are comparisons after the pin, not pinned baseline citations.

**Sources.** [FS25](#sources), Example 3.1.6, p. 11; Lemma 3.3.4, p. 15. The standard odd Heisenberg model and partial polarizations use these decompositions; the finite coordinate adapter here is derived from the imported Lagrangian basis-extension theorem.; [N02](#sources), Section 2, p. 16. The coordinate construction starts from a split finite symplectic space.


## FW.1. Finite Heisenberg representations

For nontrivial ψ:k→Cˣ and dim V=2n, construct the finite Schrödinger FDRep on Fun(X,C), π(t,x,y)f(z)=ψ(t+y(z)+y(x)/2)f(z+x), and identify native induction. Compute its character qⁿψ(t) on the center and zero elsewhere; prove irreducibility and uniqueness. More generally, for finite J, normal H, abelian J/H and invariant θ with nondegenerate commutator pairing, prove the unique θ-scalar irreducible has dimension squared [J:H], allowing H/ker θ of order pᵃ. For Lagrangians A,B, construct T_BA by finite left averaging and prove T_AA=|A|id and T_AB T_BA=|A||A∩B|id.

### Finite Schrödinger representation

Target `MetaplecticAutomorphicFormsPartII:FW.1/schrodinger` (construction). Planet: **Schrödinger representation**.

For a full polarization V=X⊕X*, construct the native FDRep Sψ of H(V) on Fun(X,C), by (π(t,x,y)f)(z)=ψ(t+y(z)+y(x)/2)f(z+x). Supply a linear equivalence with native induction from A={(t,0,y)} of its character (t,0,y)↦ψ(t). Here induction is realized as functions F(ah)=ψ(tₐ)F(h), with H acting by right translation; restriction to representatives (0,x,0) fixes the coordinate convention. Its dimension is |X|=qⁿ.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- A full polarization has been chosen.

**Construction or proof.**

1. Use the imported bilinear factor-set multiplication and the displayed formula to check π(h)π(h′)=π(hh′): the two cross terms differ by B(v,v′)/2. Inverses give invertible operators.
2. Linearity and finite X bundle the operators into an FDRep. For functions F(ah)=ψ(tₐ)F(h), set f(z)=F((0,z,0)); right translation by (t,x,y) has subgroup factor (t+y(z)+y(x)/2,0,y), giving the displayed formula. Use TauCeti.Rep.indSubtypeEquivPi_ρ_apply and the existing induction–coinduction comparison to identify this with native induction.
3. A delta-function basis identifies dimension with |X|. Central action is ψ(t), translations are z↦z+x, and modulations are multiplication by ψ(y(z)).

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.0/adapted-polarization`, `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/half-form-commutator`, `MetaplecticAutomorphicForms:MP.0/polarization-equivalence`, `tauceti:FDRep.ofLinearCharacter`, `tauceti:TauCeti.indFDRep`, `tauceti:TauCeti.finrank_indFDRep`, `tauceti:TauCeti.Rep.indSubtypeEquivPi_ρ_apply`, `tauceti:TauCeti.indFDRepForgetEquiv`.

**Uses that determine the API.**

- Neuhauser, Section 4, pp. 19–23: Intertwine this exact action to normalize symplectic operators.
- Fintzen, Lemmas 7.8 and 7.10, pp. 31–34: Supply each finite Heisenberg factor.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `schrodinger_apply` | simp | The action on f,z is exactly ψ(t+y(z)+y(x)/2)f(z+x). |
| `schrodinger_center` | compatibility | π(t,0)=ψ(t)·id; dim Sψ=qⁿ. |
| `schrodinger_mul` | relation | π(h)π(h′)=π(hh′), with ghg⁻¹h⁻¹ producing ψ(B(v,w)). |
| `schrodinger_indFDRep` | equivalence | Sψ is isomorphic to TauCeti.indFDRep of FDRep.ofLinearCharacter on A, with explicit restriction-to-cosets maps. |
| `schrodinger_changeCoordinates` | functoriality | Changing a polarization along an isometry transports the H action by pullback and gives an intertwiner, unique up to scalar after the uniqueness theorem. |

**Checks and worked examples.**

- `schrodinger_F3_commutator`: For k=F₃ and ζ=exp(2πi/3), translation by 1 followed by modulation by 1 equals ζ times their reverse product.
- `schrodinger_zero`: For V=0, Sψ is the one-dimensional central character ψ on H(0)=k, not a zero representation.
- `schrodinger_delta`: In the plane over F₃, π(0,0,1)δ₁=ζδ₁ and π(0,1,0)δ₁=δ₀.
- `schrodinger_trivial_character`: Replacing ψ by the trivial character in a nonzero plane leaves a translation representation with a fixed constant line; it is not the promised irreducible model.

**Acceptance.**

- Check the native induction comparison on center, translation and modulation generators, rather than only comparing dimensions.

**Sources.** [N02](#sources), Section 2, pp. 16–17. The explicit finite Schrödinger action supplies the formula and its central character.; [FS25](#sources), Example 3.1.6, p. 11; Lemma 3.3.4, p. 15. The odd standard model and induction construction supply the compatible induced realization.

### Finite Schrödinger character

Target `MetaplecticAutomorphicFormsPartII:FW.1/character` (theorem). Planet: **Schrödinger character**.

The character of Sψ at (t,v) is qⁿψ(t) if v=0 and is 0 otherwise. Thus its normalized character norm is 1. This holds for every nontrivial additive character of any finite odd field, including characters with a nontrivial additive kernel.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.

**Construction or proof.**

1. For x≠0, translation has no fixed basis vector, so the diagonal trace is zero. For x=0, sum ψ(t+y(z)) over X; a nonzero functional y is onto k and primitive-character orthogonality makes this sum zero.
2. For v=0 the scalar action gives qⁿψ(t). Sum χ(h)χ(h⁻¹) over the q-element center, divide by |H|=q^(2n+1), and get 1. The order follows from the imported extension equivalence with k×V.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/schrodinger`, `mathlib:AddChar.IsPrimitive.of_ne_one`, `mathlib:AddChar.sum_mulShift`.

**Acceptance.**

- The test must distinguish nontrivial from faithful ψ over F₉; nonzero y is detected by a suitable scalar multiple even when ψ(y(z))=1 for one z.

**Sources.** [N02](#sources), Lemma 2.1 and its proof, pp. 16–17. The character is concentrated on the center; its norm and completeness are then computed.

### Finite Stone–von Neumann theorem

Target `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann` (theorem). Planet: **Finite Stone–von Neumann theorem**.

Sψ is irreducible. Every irreducible complex representation of H(V) on which (t,0) acts as ψ(t) is isomorphic to Sψ; it has dimension qⁿ and scalar endomorphisms. In an arbitrary finite-dimensional representation with this central action, every irreducible constituent is Sψ, so it is Sψ-isotypic.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.

**Construction or proof.**

1. Apply the native character-norm criterion to the preceding character. For another simple representation with this central character, pair its character with that of Sψ: only the center contributes and the pairing equals dim(A)/qⁿ, a positive number. Native orthogonality forces an isomorphism.
2. Maschke decomposes any finite-dimensional representation into simples, each with the prescribed scalar central action. Native Schur gives scalar endomorphisms.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/character`, `mathlib:FDRep.simple_iff_char_is_norm_one`, `mathlib:FDRep.char_orthonormal`, `mathlib:MonoidAlgebra.Submodule.exists_isCompl`, `mathlib:FDRep.simple_iff_end_is_rank_one`, `MetaplecticAutomorphicForms:MP.0/half-form-center`.

**Acceptance.**

- For n=0 this reduces to the character ψ of the additive center.
- Uniqueness is an isomorphism class, not a distinguished nonzero vector or a uniquely normalized intertwiner.

**Sources.** [N02](#sources), Section 2, Lemma 2.1 and following completeness argument, pp. 16–17. The trace calculation yields irreducibility and the unique nontrivial-central-character representation.; [FS25](#sources), Lemma 3.3.1, p. 14. The finite Stone–von Neumann statement is given for center of order p; the field model follows by the same character calculation.

### Stone–von Neumann with a cyclic center

Target `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center` (theorem). Planet: **Cyclic-center Stone–von Neumann theorem**.

Let J be a finite group, H normal in J, J/H abelian, and θ:H→Cˣ invariant under conjugation by J. Assume that for each g∉H there is x∈J with θ(gxg⁻¹x⁻¹)≠1. Then there is exactly one isomorphism class of irreducible η with η(h)=θ(h)·id. Its dimension d satisfies d²=[J:H], and its character is dθ on H and zero off H. Every representation containing θ is η-isotypic on its θ-isotypic J-subrepresentation. In the routed application J is a finite p-group, p odd, J/H is an Fp-vector space with nondegenerate θ-commutator pairing; H/ker θ can have order pᵃ. No exponent-p or standard-Heisenberg-isomorphism hypothesis is needed.

**Hypotheses.**

- J is finite; H is normal; every commutator lies in H.
- θ is J-invariant and its commutator radical in J/H is zero.
- All representations are complex and finite-dimensional.

**Construction or proof.**

1. Induce the existing one-dimensional θ representation from H. J-invariance implies its H action is scalar θ; it is nonzero by its positive dimension. Maschke supplies a nonzero simple constituent η.
2. For g∉H choose x detecting its commutator. Since commutators act scalarly, conjugating η(g) multiplies its trace by the nontrivial scalar θ([g,x]) (or its inverse, according to the conjugation direction), so the trace vanishes.
3. Character norm of a simple η is |H|d²/|J|=1, hence d²=[J:H]. Pair any two such simple representations: the same calculation gives 1, and character orthogonality yields an isomorphism. Decompose the θ-isotypic subrepresentation by Maschke.

**Prerequisites.** `tauceti:FDRep.ofLinearCharacter`, `tauceti:TauCeti.indFDRep`, `tauceti:TauCeti.finrank_indFDRep`, `mathlib:MonoidAlgebra.Submodule.exists_isCompl`, `mathlib:FDRep.char_orthonormal`.

**Acceptance.**

- Test a central product of the order-p³ standard Heisenberg group with C_(p²), identifying their order-p central subgroups: the faithful cyclic central character has one representation of dimension p.
- The nonabelian group of order p³ and exponent p² is also covered; it need not admit a special isomorphism to the exponent-p standard group.
- If the commutator pairing is degenerate, uniqueness can fail: an abelian J with H proper has many extensions of a fixed H-character.

**Sources.** [S08](#sources), Proposition 3.5, p. 14, with its cited finite Heisenberg argument. The target used by Stevens is uniqueness and the square-root dimension for the θ-isotypic representation. The explicit trace proof here applies to cyclic center of order pᵃ and even to the stated finite-group generality.; [F21](#sources), Lemma 7.8, p. 31, using Lemma 7.7, pp. 30–31. The type argument needs uniqueness for a finite central-character quotient, then isotypy.

### Intertwiners between finite polarizations

Target `MetaplecticAutomorphicFormsPartII:FW.1/polarization-intertwiner` (construction). Planet: **Polarization intertwiner**.

For Lagrangians A,B≤V let S_A be functions F:H→C with F((t,a)h)=ψ(t)F(h) for a∈A, acted on by right translation. Define T_BA:S_A→S_B by (T_BA F)(h)=∑_(b∈B)F((0,b)h). It is a nonzero H-intertwiner and an isomorphism. With this unnormalized convention, T_AA=|A|id and T_AB∘T_BA=|A|·|A∩B|id. These are chosen intertwiners, not an assertion that all triple compositions are exactly 1.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- A and B are Lagrangian.

**Construction or proof.**

1. Use the imported Heisenberg product and isotropy of B to reindex the B sum, proving its left covariance; right translation commutes with left averaging.
2. Apply T_BA to the function supported on the inducing subgroup of A; its value at 1 is |A∩B|, hence it is nonzero. Stone–von Neumann makes it an isomorphism.
3. For the composite, sum ψ of the commutator character on the finite quotient; character orthogonality leaves |A|·|A∩B|. Equal Lagrangians give |A|id directly.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann`, `tauceti:TauCeti.indFDRep`, `mathlib:AddChar.sum_mulShift`, `MetaplecticAutomorphicForms:MP.0/half-form-commutator`.

**Uses that determine the API.**

- FW.2 projective symplectic action: Supply the nonzero intertwiners and scalar ambiguity.
- Changing special coordinates in finite type constructions: Transport between polarized models through actual H-isomorphisms.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `polarizationIntertwiner_apply` | simp | T_BA is the displayed left average, commuting with all right H translations. |
| `polarizationIntertwiner_nonzero` | structure | T_BA is a nonzero linear equivalence between the native induced FDReps. |
| `polarizationIntertwiner_self` | relation | T_AA=\|A\|id and T_AB T_BA=\|A\|·\|A∩B\|id. |
| `polarizationIntertwiner_isometry` | functoriality | An isometry of V transports the sum and both inducing subgroups, with no extra counting factor. |

**Checks and worked examples.**

- `intertwiner_same_F3`: For a line A=B in the F₃ plane, T_AA=3id and the double composite is 9id.
- `intertwiner_transverse_F3`: For distinct Lagrangian lines in the F₃ plane, T_AB T_BA=3id, so an identity-normalized guess fails.
- `intertwiner_zero`: For V=0 the sums have one term and every T is the identity.

**Acceptance.**

- Every sum is a finite sum; no Haar measure or local-field topology is imported.

**Sources.** [FS25](#sources), Lemma 3.3.4 and proof, pp. 15–16. Induction and restriction-to-zero identify polarized models and their intertwining spaces.; [N02](#sources), Theorem 4.1, pp. 19–20. The transverse-coordinate intertwiner is a finite Fourier transform; the averaging normalization here is specified independently.


## FW.2. Genuine finite Weil actions

Choose Egorov intertwiners μ(g) for g∈Sp(V) and their native projective multiplier. With parity Rf(z)=f(−z) and S⁺ its even subspace, prove μ commutes with R and normalize by κ(g)=det μ(g)/(det μ(g)|S⁺)². Prove ω=κμ is a genuine, scalar-choice-independent homomorphism, including Sp₂(F₃), characterized by det ω=(det ω|S⁺)². Give exact lower-shear, diagonal and Fourier formulas with the quadratic determinant character and pinned J sign. Construct Ω(h,g)=π(h)ω(g) on the native H(V)⋊Sp(V). Pull it back to P⋊K only from a specified special isomorphism P≃H(V) equivariant for a specified K→Sp(V).

### Projective symplectic action

Target `MetaplecticAutomorphicFormsPartII:FW.2/projective-action` (construction). Planet: **Projective Weil representation**.

For every g∈Sp(V) choose μ(g)∈GL_C(Sψ) with μ(1)=1 and μ(g)π(h)μ(g)⁻¹=π(g·h), where g·(t,v)=(t,gv) is the parent isometry action. There is a unique c(g,g′)∈Cˣ such that μ(g)μ(g′)=c(g,g′)μ(gg′); c is normalized and satisfies the native factor-set identity. Bundle this as TauCeti.IsProjectiveRep. No splitting is inferred merely from this construction.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.

**Construction or proof.**

1. The parent isometry action fixes the center. Stone–von Neumann identifies π with its pullback along g and supplies an invertible intertwiner; choose the identity at g=1.
2. Schur makes the discrepancy of two compositions a unique nonzero scalar. Associativity and μ(1)=1 give the native cocycle equations.
3. Changing μ(g) to a(g)μ(g), a(1)=1, changes c by a(g)a(g′)/a(gg′), exactly the native projective-representation rescaling convention.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann`, `MetaplecticAutomorphicFormsPartII:FW.1/polarization-intertwiner`, `MetaplecticAutomorphicForms:MP.0/isometry-action`, `tauceti:TauCeti.BilinForm.isometryGroup`, `tauceti:TauCeti.BilinForm.mem_isometryGroup_iff`, `tauceti:TauCeti.IsProjectiveRep`.

**Uses that determine the API.**

- Neuhauser, Theorem 4.3, p. 22: Provide the scalar factors which the determinant argument cancels.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `projectiveWeil_egorov` | relation | μ(g)π(t,v)μ(g)⁻¹=π(t,gv). |
| `projectiveWeil_factor` | compatibility | μ and c satisfy TauCeti.IsProjectiveRep, with c(1,g)=c(g,1)=1. |
| `projectiveWeil_rescale` | functoriality | A normalized scalar change multiplies c by its displayed coboundary. |

**Checks and worked examples.**

- `projective_identity`: μ(1)=id, so both identity factors are 1.
- `projective_F3_scalar`: In the F₃ plane take the order-three shear g=u(1). Rescale only μ(g) by ζ, leaving μ(g²) and μ(1) unchanged. Then c(g,g) is multiplied by ζ²≠1 while Egorov still holds.
- `projective_zero`: For V=0 the intertwiner space is Cˣ and the next determinant normalization removes every scalar choice.

**Acceptance.**

- The native central extension of a projective representation is a different construction from a linear representation of Sp(V).

**Sources.** [N02](#sources), Theorem 4.1, pp. 19–20. The symplectic action is first constructed by intertwining the Schrödinger representation, with scalar ambiguity.; [FS25](#sources), Construction 3.4.2, pp. 16–17. The finite symplectic action first defines a projective representation.

### Determinant normalization of the Weil action

Target `MetaplecticAutomorphicFormsPartII:FW.2/parity-linearization` (construction). Planet: **Finite Weil representation**.

Let Rf(z)=f(−z), S⁺=ker(R−1), S⁻=ker(R+1). Their dimensions are (qⁿ+1)/2 and (qⁿ−1)/2. Every μ(g) commutes with R. Put κ(g)=det μ(g)/(det(μ(g)|S⁺))² and ω(g)=κ(g)μ(g). Then ω:Sp(V)→GL_C(Sψ) is a genuine homomorphism with Egorov covariance, independent of the chosen scalar representatives μ. It is characterized among scalar corrections by det ω(g)=(det(ω(g)|S⁺))². This specifies a preferred action even for Sp₂(F₃), where arbitrary linearizations are not unique.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.

**Construction or proof.**

1. Parity implements the central symplectic element −1. Its conjugate by μ(g) is a scalar multiple of R by Schur. As trace R=1, conjugacy invariance of trace makes this scalar 1.
2. Decompose functions into even and odd parts using 1/2. The only fixed point of z↦−z is 0, giving the dimensions and dim S−2 dim S⁺=−1.
3. For μ(g)μ(g′)=c μ(gg′), determinants give κ(g)κ(g′)=c⁻¹κ(gg′). Thus the corrected operators multiply exactly. Rescaling μ by a multiplies κ by a⁻¹; the normalized action is independent of choices.
4. Apply the same exponent −1 to any two scalar corrections satisfying the determinant condition to prove uniqueness of this preferred normalization.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.2/projective-action`, `mathlib:LinearEquiv.det`, `mathlib:FDRep.simple_iff_end_is_rank_one`.

**Uses that determine the API.**

- FW.3 parabolic restriction: Fix the determinant character, which would change under arbitrary exceptional twists.
- Fintzen–Schwein, Definition 3.4.5(a), p. 18: Supply a genuine finite symplectic action for compatible special-coordinate transport.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `weil_normalized_apply` | simp | ω(g)=(det μ(g)/(det μ⁺(g))²)μ(g). |
| `weil_map_mul` | structure | ω(1)=1, ω(gg′)=ω(g)ω(g′), and ω satisfies Egorov. |
| `weil_independent_intertwiners` | characterisation | The result is unchanged under every normalized scalar rescaling of μ. |
| `weil_determinant_characterization` | universal-property | The determinant relation on S⁺ uniquely selects the scalar correction for every g, including q=3,n=1. |

**Checks and worked examples.**

- `weil_scalar_line`: For n=0 and μ(g)=a(g)id on C, κ(g)=a(g)⁻¹ and ω(g)=id.
- `weil_F3_exception`: For the F₃ plane and ψ(1)=ζ, a nontrivial order-three character twist of ω remains genuine and has Egorov covariance but fails the determinant characterization.
- `weil_parity_dimensions`: For the F₅ plane the even and odd dimensions are 3 and 2, so 5−2·3=−1; reversing the determinant ratio would double rather than cancel a generic multiplier.

**Acceptance.**

- A proof that uses perfectness of every finite symplectic group fails at Sp₂(F₃); the determinant proof must handle it directly.

**Sources.** [N02](#sources), Theorem 4.3, p. 22, using Theorem 4.2, pp. 20–22. The ratio of determinants on the whole space and its even subspace removes the projective multiplier.; [FS25](#sources), Construction 3.4.2, pp. 16–17. Sp₂(F₃) is the exceptional case for unrestricted uniqueness of a finite Weil linearization.

### Normalized finite Weil generators

Target `MetaplecticAutomorphicFormsPartII:FW.2/generator-formulas` (theorem). Planet: **Weil generator formulas**.

In X=kⁿ coordinates write u(C)=(I,0;C,I), m(A)=(A,0;0,A⁻ᵀ), and J=(0,I;−I,0), C symmetric and A invertible. Then ω(u(C))f(z)=ψ(−zᵀCz/2)f(z), ω(m(A))f(z)=χ_k(det A)f(A⁻¹z), and ω(J)=κ_J Fψ, where Fψ f(z)=q^(−n/2)∑_w ψ(z·w)f(w) and κ_J=det Fψ/(det(Fψ|S⁺))². χ_k is the existing quadraticChar, cast to C on kˣ. These are formulas for the homomorphism already constructed, so all generator relations hold. The J here is the negative of Mathlib Matrix.J; its action must not be identified by name alone.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- The full coordinate polarization and its standard bases are fixed; q^(−n/2) is the positive real normalization.

**Construction or proof.**

1. Check Egorov on translations and modulations for each displayed unnormalized operator. Use the native symplectic isometry group, rather than silently switching the sign of J.
2. For u(C), pair z and −z in the determinant to obtain κ=1. For m(A), the even-subspace permutation determinant squares to 1, so the ratio is the sign of the permutation z↦A⁻¹z on all of X. This is χ_k(det A): elementary transvections have odd order and sign +1; a diagonal scaling reduces to its permutation of k, whose sign is its quadratic character since kˣ is cyclic. The other coordinates repeat this permutation an odd number of times.
3. For J use the displayed determinant ratio, which requires no unproved choice of Gauss-sum square root. Finite Fourier inversion gives Fψ²=R. The preferred normalization then yields the formulas and their relations.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.2/parity-linearization`, `mathlib:quadraticChar`, `mathlib:AddChar.sum_mulShift`, `mathlib:AddChar.IsPrimitive.of_ne_one`, `tauceti:TauCeti.BilinForm.isometryGroup`.

**Acceptance.**

- For q=3,n=1, ψ(1)=exp(2πi/3), obtain ω(u(1))=diag(1,ζ,ζ), ω(m(−1))=−R and κ_J=−i.
- For q=5,n=1, ψ(1)=exp(2πi/5), κ_J=−1 and ω(m(2))δ₀=−δ₀.
- Retain κ_J as a determinant formula; no local Weil index or analytic Gauss-sum evaluation is a prerequisite.

**Sources.** [N02](#sources), Theorem 3.3, p. 18; Theorem 4.1, pp. 19–20; determinant calculations after Theorem 4.3, pp. 22–23. The generators, their intertwining operators and their determinant corrections give the formulas.; [N02](#sources), Example 4.4, pp. 23–24. The F₅ example tests the nontrivial Fourier and diagonal correction factors.

### Weil–Heisenberg semidirect representation

Target `MetaplecticAutomorphicFormsPartII:FW.2/weil-heisenberg` (construction). Planet: **Weil–Heisenberg representation**.

On the native semidirect product H(V)⋊Sp(V), with (h,g)(h′,g′)=(h(g·h′),gg′), define Ω(h,g)=π(h)ω(g). This is a genuine complex FDRep. Its restriction to H(V) is Sψ, its restriction to Sp(V) is the normalized Weil action, and its center acts by ψ. Transport along isometries is compatible up to the unique scalar ambiguity of the underlying Heisenberg intertwiner; the transported normalized symplectic action is exact after conjugation.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.

**Construction or proof.**

1. Use the parent isometry action to form the existing native SemidirectProduct; no new group carrier is needed.
2. Insert Egorov into π(h)ω(g)π(h′)ω(g′) to obtain π(h(g·h′))ω(gg′). Bundle the finite-dimensional representation.
3. Conjugate both π and ω by a nonzero Heisenberg intertwiner. The determinant characterization is preserved under conjugation, so the resulting normalized action agrees.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/schrodinger`, `MetaplecticAutomorphicFormsPartII:FW.2/parity-linearization`, `MetaplecticAutomorphicForms:MP.0/isometry-action`, `mathlib:SemidirectProduct`.

**Uses that determine the API.**

- Fintzen, proof of Lemma 7.10, pp. 32–34: Use the finite Weil action and Heisenberg action on the same space.
- FW.2 special-coordinate transport: Pull Ω back to a finite quotient with a compatible symplectic action.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `weilHeisenberg_apply` | simp | Ω(h,g)=π(h)ω(g) in native normal-first coordinates. |
| `weilHeisenberg_restrictions` | compatibility | The two canonical subgroup restrictions are Sψ and ω; the center is ψ. |
| `weilHeisenberg_map_mul` | structure | The displayed semidirect multiplication is respected exactly. |
| `weilHeisenberg_isometry` | functoriality | An isometry and a chosen Schrödinger intertwiner conjugate Ω to the corresponding transported representation. |

**Checks and worked examples.**

- `semidirect_plane`: On the F₃ plane, conjugating translation by J gives modulation by −1, as required by J(x,0)=(0,−x).
- `semidirect_zero`: For V=0, Sp(V) is trivial and Ω is ψ on the center.
- `semidirect_order`: For a nontrivial g and h, reversing π(h)ω(g) to ω(g)π(h) changes the h coordinate by g; the unadjusted reversed formula fails the stated multiplication.

**Acceptance.**

- The representation is genuine on a finite semidirect product; no local metaplectic double cover is introduced.

**Sources.** [FS25](#sources), Construction 3.4.2 and Definition 3.4.5(a), pp. 16–17. The finite Weil action extends the Heisenberg action to the symplectic semidirect product.

### Transport through compatible special coordinates

Target `MetaplecticAutomorphicFormsPartII:FW.2/special-transport` (construction). Planet: **Compatible special isomorphism**.

Let P be an abstract finite group with a specified isomorphism j:P≃H(V) inducing the given identification P/Z(P)≃V and its given central character. Let K act on P, let s:K→Sp(V), and require j(k·a)=s(k)·j(a) for every k,a. Then (a,k)↦(j(a),s(k)) is a homomorphism P⋊K→H(V)⋊Sp(V), and its pullback of Ω is a genuine extension of the Heisenberg representation to P⋊K. Merely having a special isomorphism on quotients, or an arbitrary center-fixing action, does not imply this equivariance hypothesis.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- j is a group isomorphism with the stated center and quotient identifications.
- s is a homomorphism and the displayed equivariance is part of the input.

**Construction or proof.**

1. Check the native semidirect multiplication using precisely the equivariance assumption, then restrict the representation along the resulting homomorphism.
2. Central action and the representation on P follow from j; the K action follows from s. Changing j compatibly conjugates the pulled-back action.
3. Do not manufacture j from nondegeneracy alone. Cyclic-center groups of order pᵃ and exponent-p² groups are handled by the separate uniqueness theorem, without a false standard-group identification.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.2/weil-heisenberg`, `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center`, `mathlib:SemidirectProduct`.

**Uses that determine the API.**

- SmoothRepresentationsPartII, finite quotients in Yu-type constructions: The p-adic owner must prove existence and equivariance of its chosen special isomorphisms before invoking this extension.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `specialTransport_hom` | constructor | Equivariance gives the homomorphism (a,k)↦(j(a),s(k)) of native semidirect products. |
| `specialTransport_restrict` | compatibility | Restriction to P is Sψ pulled back by j; K acts through the normalized ω∘s. |
| `specialTransport_change` | functoriality | A compatible isomorphism of the j,s data gives an isomorphism of pulled-back representations. |

**Checks and worked examples.**

- `special_identity`: For P=H(V), j=id, K=Sp(V), s=id, the pullback is Ω.
- `special_inner_nonexample`: For V a nonzero F₃ plane, a noncentral inner automorphism is the identity on V but adds B(v,−) to the center, so j=id is not equivariant with s=1.
- `special_exponent_nonexample`: The order-p³ exponent-p² group cannot be isomorphic to the standard exponent-p group; it still satisfies the cyclic-center uniqueness theorem when its commutator pairing is nondegenerate.

**Acceptance.**

- An inner translation in Aut_Z(P) generally adds a nonzero central linear term in j coordinates, and is not a pure symplectic action under this fixed j.

**Sources.** [FS25](#sources), Definition 3.4.4, p. 17; Definition 3.4.5(a), p. 18; Remark 3.4.3, p. 17. The definition of a compatible special isomorphism includes the semidirect equivariance needed to pull back a linear Weil action. The full center-fixing automorphism group has an obstruction.


## FW.3. Parabolic restriction and isotropic induction

For isotropic I, identify Sψ,V with Ind_H(I⊥)^H(V) Sψ,V̄, V̄=I⊥/I, and identify I-fixed vectors with the smaller Schrödinger space by evaluation at zero in its mixed model. If P stabilizes I, prove its action on these vectors is (χ_k∘det on I)⊗Ωψ,V̄. Deduce the corrected induction formula from P⋉H(I⊥) to P⋉H(V), retaining this twist. For cyclic-center data J,H,θ over Fp and a subgroup U lifting isotropic I with θ(U∩H)=1, construct θ_I(hu)=θ(h) on HU, prove its unique Heisenberg representation η_I satisfies Ind_Q^J η_I≅η and η^U≅η_I for Q the preimage of I⊥, and compute its dimension.

### Partial-polarization induced model

Target `MetaplecticAutomorphicFormsPartII:FW.3/mixed-model` (construction). Planet: **Mixed Schrödinger model**.

For an adapted decomposition V=I⊕V₀⊕J, let K=H(I⊥)=H(I⊕V₀). Projection K→H(V₀) has kernel I={(0,i)}. Inflate Sψ,₀ along this projection. Then Sψ,V≅Ind_K^H(V)(Sψ,₀), with mixed realization Fun(J,Sψ,₀). Using representatives (0,j), the action of i∈I on the value at j is multiplication by ψ(B(j,i)), and its fixed vectors are exactly the functions supported at 0. Evaluation at 0 identifies Sψ,V^I with Sψ,₀, of dimension q^(dim V₀/2). Use native induction and native representation invariants.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- I is isotropic and adapted coordinates have been chosen.

**Construction or proof.**

1. Use the parent half-form product: the projection K→H(V₀) is a homomorphism and its kernel is I, because I pairs trivially with I⊥.
2. The native induced representation has the right central character and dimension |J|q^(dim V₀/2)=qⁿ. Stone–von Neumann and Maschke make it the unique Sψ,V, with multiplicity one.
3. Evaluate the induced functions on representatives (0,j). The identity (0,j)(0,i)=(B(j,i),i)(0,j) gives the multiplier ψ(B(j,i)). Nondegeneracy and primitivity show that only j=0 has trivial I-character. Evaluation and zero extension are inverse on fixed vectors.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.0/adapted-polarization`, `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann`, `tauceti:TauCeti.indFDRep`, `tauceti:TauCeti.finrank_indFDRep`, `mathlib:Representation.invariants`, `mathlib:AddChar.IsPrimitive.of_ne_one`, `MetaplecticAutomorphicForms:MP.0/half-form-commutator`, `tauceti:TauCeti.Rep.indSubtypeEquivPi_ρ_apply`, `tauceti:TauCeti.indFDRepForgetEquiv`.

**Uses that determine the API.**

- Fintzen, Lemma 7.10, p. 33: Identify the smaller module carrying the action of the symplectic quotient.
- Stevens, Corollary 5.7 and Lemma 5.12, pp. 30–33: The standard model explains the invariant-space calculation; the next cyclic theorem handles its more general group.

**Named API.**

| Name | Role | Statement |
|---|---|---|
| `mixedModel_indFDRep` | equivalence | Sψ,V≅TauCeti.indFDRep of the inflated Sψ,₀, with the subgroup K specified above. |
| `mixedModel_action_I` | simp | Using representatives (0,j), (π(0,i)F)(j)=ψ(B(j,i))F(j); this is ψ(−B(i,j)), fixing the sign convention. |
| `mixedModel_fixed_iff` | characterisation | A mixed-model function is I-fixed exactly when its support is contained in {0}. |
| `mixedModel_eval_zero` | equivalence | Evaluation at 0 and extension supported at 0 are inverse H(V₀)-equivariant linear equivalences, using Representation.invariants. |

**Checks and worked examples.**

- `mixed_zero_I`: For I=0, K=H(V), induction has index one and the fixed subspace is the whole Sψ,V.
- `mixed_lagrangian`: For I Lagrangian, V₀=0 and the I-fixed subspace is the single δ₀ line.
- `mixed_rank_four_F3`: For a one-dimensional I in a four-dimensional F₃ symplectic space, S has dimension 9 and its I-fixed subspace has dimension 3, not 1 or 9.

**Acceptance.**

- The fixed subspace has the smaller Heisenberg action; its parabolic action still requires the next determinant-character theorem.

**Sources.** [FS25](#sources), Lemma 3.3.4 and proof, pp. 15–16. The partial-polarization induction and its fixed subspace are identified by functions supported at zero.; [F21](#sources), Proof of Lemma 7.10, pp. 32–34. The plus-space fixed vectors are the smaller symplectic Weil module.

### Parabolic fixed-space representation

Target `MetaplecticAutomorphicFormsPartII:FW.3/parabolic-invariants` (theorem). Planet: **Parabolic fixed-space formula**.

Let P≤Sp(V) stabilize I. It acts on I and on V̄=I⊥/I, giving p₁:P→GL(I) and p₂:P→Sp(V̄). There is an isomorphism of P⋉H(V̄)-representations Sψ,V^I≅(χ_k∘det∘p₁)⊗Ωψ,V̄, where Ω is pulled back along p₂ on P and the identity on H(V̄). The H(V̄) action is obtained from H(I⊥)/I; an adapted complement identifies V̄ with V₀ but need not be P-stable.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- I is isotropic; P is its full stabilizer or any subgroup of that stabilizer.

**Construction or proof.**

1. The mixed-model evaluation identifies the smaller Heisenberg action. For the Levi subgroup GL(I)×Sp(V₀), the generator formulas give χ_k(det on I) times the smaller normalized Weil action.
2. In adapted coordinates, the parabolic unipotent radical has p₂=1. Its quadratic and mixed phases evaluate to 1 at the zero I-coordinate, so it acts trivially on the fixed subspace. This can be checked on the symmetric shear and off-diagonal generators of that radical.
3. Combine the Levi and radical actions and express the result intrinsically through p₁,p₂. This proves independence of the adapted complement and includes the determinant correction in Fintzen’s footnote.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.3/mixed-model`, `MetaplecticAutomorphicFormsPartII:FW.2/generator-formulas`, `MetaplecticAutomorphicFormsPartII:FW.2/weil-heisenberg`, `mathlib:quadraticChar`.

**Acceptance.**

- For V the F₅ plane and I its y-axis, m(2) acts on I by 2⁻¹=3 and on the fixed δ₀ line by χ₅(3)=−1. Equivalently choose I the x-axis and its constant-function line, where χ₅(2)=−1. These refer to the standard Schrödinger coordinates; the mixed model uses its own zero-support coordinate.
- For I=0 the character is trivial and the result is Ωψ,V.
- For I Lagrangian the fixed subspace is one-dimensional and its entire P action is χ_k(det p₁).

**Sources.** [F21](#sources), Proof of Lemma 7.10, p. 33, especially footnote 3. The parabolic restriction uses a quadratic determinant twist on the plus space; the footnote corrects its omission from the cited Gérardin formula.

### Corrected Gérardin induction formula

Target `MetaplecticAutomorphicFormsPartII:FW.3/corrected-restriction` (theorem). Planet: **Corrected Gérardin restriction formula**.

With P,I,V̄ as above, set Q=P⋉H(I⊥)≤P⋉H(V), using the same normal-first convention when formalizing. Inflate (χ_k∘det p₁)⊗Ωψ,V̄ to Q via H(I⊥)→H(V̄). Then Ωψ,V restricted to P⋉H(V) is isomorphic to Ind_Q^(P⋉H(V)) of that inflated representation. Its index factor is q^(dim I); the output dimension is qⁿ. The quadratic determinant factor is part of the inducing representation.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- P stabilizes the isotropic I.

**Construction or proof.**

1. Use the fixed subspace as a Q-subrepresentation of Sψ,V. Its H(I⊥) action factors through H(V̄), and its P action is the preceding formula.
2. Finite Frobenius reciprocity gives a nonzero map from induction to Ωψ,V. Its image is stable under H(V); irreducibility of Sψ,V makes the map surjective.
3. Native induction dimension is q^(dim I)q^(dim V̄/2)=qⁿ, so the map is an isomorphism. This recovers the corrected induction formula without relying on an unread proof.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.3/parabolic-invariants`, `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann`, `tauceti:TauCeti.indFDRep`, `tauceti:TauCeti.finrank_indFDRep`, `mathlib:Rep.indResHomEquiv`, `tauceti:TauCeti.indFDRepForgetEquiv`.

**Acceptance.**

- Dimension and restriction to the smaller Heisenberg subgroup must both agree.
- A formula omitting χ_k(det p₁) fails the F₅ Lagrangian test.

**Sources.** [F21](#sources), Proof of Lemma 7.10 and footnote 3, p. 33. The corrected inducing representation includes the quadratic character of the determinant on the isotropic plus space.

### Isotropic induction for cyclic-center quotients

Target `MetaplecticAutomorphicFormsPartII:FW.3/cyclic-isotropic-induction` (theorem). Planet: **Isotropic Heisenberg induction**.

Assume the cyclic-center theorem data, now with J/H an Fp-vector space and θ([−,−])=ψ(B(−,−)) for nondegenerate alternating B and nontrivial ψ:Fp→Cˣ. Let I be isotropic, Q the inverse image of I⊥ in J, and U≤J map isomorphically onto I under J→J/H (more generally its kernel U∩H is allowed if θ is trivial there). Put H_I=HU and θ_I(hu)=θ(h). Then θ_I is a well-defined Q-invariant character; Q/H_I≅I⊥/I has the nondegenerate induced pairing. Let η_I be its unique irreducible representation. There are isomorphisms Ind_Q^J η_I≅η and η^U≅η_I as Q-representations; dim η_I=p^(dim(I⊥/I)/2). The invariant subspace is Q-stable because commutators [Q,U] lie in ker θ, even when U itself is not normal in Q.

**Hypotheses.**

- J,H,θ satisfy the cyclic-center theorem, and the θ-commutator pairing is as stated over Fp.
- U is a subgroup mapping onto I and θ is trivial on U∩H.

**Construction or proof.**

1. For h∈H,u∈U, J-invariance of θ and triviality on U∩H show that θ_I is well-defined and multiplicative. Orthogonality I⊥ makes it Q-invariant. Compute its radical as H_I using the nondegeneracy of the quotient form.
2. Apply cyclic-center Stone–von Neumann to Q,H_I,θ_I. Its induction to J has central H-character θ and dimension [J:Q]p^(dim(I⊥/I)/2)=p^(dim(J/H)/2), so isotypy makes it exactly η.
3. In the induced coset model indexed by J/Q, U acts on the identity coset trivially and on every other coset through a nontrivial character detected by the pairing. Thus only the identity coset contributes U-fixed vectors, giving η_I.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center`, `MetaplecticAutomorphicFormsPartII:FW.0/adapted-polarization`, `tauceti:TauCeti.indFDRep`, `tauceti:TauCeti.finrank_indFDRep`, `mathlib:AddChar.IsPrimitive.of_ne_one`, `tauceti:TauCeti.Rep.indSubtypeEquivPi_ρ_apply`.

**Acceptance.**

- For I=0 take U⊂H with θ(U)=1: Q=J and η_I=η.
- For a Lagrangian I, Q=H_I and η_I is the line θ_I; induction has dimension pⁿ.
- An isotropic quotient does not itself guarantee existence of a subgroup U with θ(U∩H)=1; that splitting is an explicit input supplied by the p-adic owner.

**Sources.** [S08](#sources), Lemma 5.6, pp. 29–30; Corollary 5.7 and proof, pp. 30–31; Lemma 5.12, pp. 32–33. Stevens uses the parabolic subgroup, the extended character and induction from the smaller Heisenberg representation, with the original representation recovered from its unipotent fixed vectors.


## FW.4. Fixed vectors and type-theoretic exports

If U stabilizes isotropic I and its quotient action stabilizes a Lagrangian L₀ in I⊥/I, prove that the inverse image L is Lagrangian and its Schrödinger fixed line carries χ_k(det on I)χ_k(det on L₀). Deduce a nonzero U-fixed vector when both determinant characters are trivial, in particular for unipotent induced actions. For orthogonal sums, identify the pulled-back Schrödinger and normalized Weil–Heisenberg actions with tensor products, including the F₃ exception and the empty family, and prove the pure tensor of nonzero fixed vectors is nonzero. Export these finite inputs to Fintzen’s and Stevens’s type constructions, whose p-adic quotients and action identifications remain with their consumer roadmap.

### Iterated fixed line for unipotent actions

Target `MetaplecticAutomorphicFormsPartII:FW.4/iterated-fixed-line` (theorem). Planet: **Unipotent fixed line**.

Let I≤V be isotropic and U≤P=Stab(I). Suppose p₂(U) stabilizes a Lagrangian L₀≤V̄=I⊥/I. Let L be the inverse image of L₀ in I⊥, so L is Lagrangian in V. The line Sψ,V^L is U-stable and U acts on it by χ_k(det(u|I))χ_k(det(p₂(u)|L₀)). If both determinants are squares for every u∈U, this line is pointwise fixed and contains a nonzero U-fixed vector. In particular this holds when the two induced actions are unipotent. Apply this finite statement factor by factor to the plus-space and smaller Lagrangian in Fintzen’s Lemma 7.10.

**Hypotheses.**

- k is a finite field of odd characteristic p, with q elements; representations have coefficients C.
- V is finite-dimensional over k; B is alternating and nondegenerate; dim(V)=2n.
- ψ:k→Cˣ is a nontrivial additive character. It need not be faithful if k is not a prime field.
- U stabilizes I and its quotient action stabilizes L₀.
- For the fixed-vector conclusion, both displayed determinant characters are trivial; unipotence is a sufficient condition.

**Construction or proof.**

1. Apply the parabolic fixed-space theorem to I, then to the Lagrangian L₀ of its quotient. The remaining Heisenberg space is zero, so its module is a line.
2. The two determinant twists multiply. Equivalently the filtration 0⊂I⊂L gives det(u|L)=det(u|I)det(p₂(u)|L₀).
3. Unipotent matrices have determinant 1, and quadraticChar(1)=1. A nonzero vector in this one-dimensional space is therefore fixed. This avoids false small-rank claims about commutator subgroups of GL.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.3/parabolic-invariants`, `MetaplecticAutomorphicFormsPartII:FW.3/mixed-model`, `mathlib:quadraticChar`.

**Acceptance.**

- With V₀=0 the second determinant is the determinant on a zero-dimensional space, hence 1.
- If a nonsquare scalar acts on I in an F₅ plane, the line is stable but has eigenvalue −1, so invariance cannot be concluded.
- For I=0 the result is the standard fixed line attached to a U-stable Lagrangian.

**Sources.** [F21](#sources), Lemma 7.10 and proof, pp. 32–34, especially pp. 33–34. The proof takes plus-space invariants and then a Lagrangian fixed line in the smaller symplectic module; its unipotent actions kill the determinant twists.

### Tensor compatibility and finite-type exports

Target `MetaplecticAutomorphicFormsPartII:FW.4/tensor-export` (theorem). Planet: **Tensor product of Weil representations**.

For an orthogonal sum V=⊥ᵢVᵢ and a single ψ, pull Sψ,V back along ∏ᵢH(Vᵢ)→H(V), (tᵢ,vᵢ)↦(∑tᵢ,∑vᵢ). It is isomorphic to ⊗ᵢSψ,Vᵢ; central tuples with ∑tᵢ=0 act trivially. Under ∏ᵢSp(Vᵢ)→Sp(V), this isomorphism intertwines the normalized Weil actions, and hence the Weil–Heisenberg actions. For any group U acting through these symplectic factors, nonzero fixed vectors vᵢ supplied by the preceding theorem have a nonzero U-fixed pure tensor. Dimensions multiply to q^(∑ᵢdim Vᵢ/2); the empty family is the one-dimensional trivial symplectic module. Together with cyclic-center uniqueness and isotropic induction, these are the finite inputs exported to the tame-type and classical-type roadmaps.

**Hypotheses.**

- The family is finite, every Vᵢ is a finite nondegenerate odd-field symplectic space, and ψ is common to the factors.
- Each U action factors through ∏Sp(Vᵢ), and each chosen vᵢ is nonzero and U-fixed.

**Construction or proof.**

1. In product Schrödinger coordinates Fun(∏Xᵢ,C) is the native tensor product of the finite function spaces; evaluate pure tensors by multiplying their values. This directly intertwines the Heisenberg action. Alternatively apply Stone–von Neumann and the dimension formula.
2. For two factors, the even subspace of the tensor product is S₁⁺⊗S₂⁺ ⊕ S₁⁻⊗S₂⁻. The determinant of the candidate ω₁⊗ω₂ satisfies the preferred determinant relation because dim Sᵢ⁺−dim Sᵢ⁻=1. Uniqueness of the parity normalization gives tensor compatibility even in the F₃ exception; induct on the family.
3. The tensor action fixes the pure tensor. Choose linear functionals ℓᵢ with ℓᵢ(vᵢ)=1; their tensor product evaluates it to 1, proving nonvanishing. Treat the empty family as the monoidal unit.
4. Export only these finite statements. The p-adic consumers prove their own filtration quotients, equivariant special coordinates, subgroup splittings, and identification of κ-factors.

**Prerequisites.** `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann`, `MetaplecticAutomorphicFormsPartII:FW.2/parity-linearization`, `MetaplecticAutomorphicFormsPartII:FW.2/weil-heisenberg`, `MetaplecticAutomorphicFormsPartII:FW.2/special-transport`, `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center`, `MetaplecticAutomorphicFormsPartII:FW.3/cyclic-isotropic-induction`, `MetaplecticAutomorphicFormsPartII:FW.4/iterated-fixed-line`.

**Acceptance.**

- Two F₃ planes have a nine-dimensional tensor model and one fixed tensor line for the product of their standard unipotent subgroups.
- No finite-quotient construction for a p-adic group is claimed here.
- Central characters in the product must agree with the sum map on centers; independent incompatible ψᵢ cannot be collapsed through that map.

**Sources.** [F21](#sources), Lemma 7.8, p. 31; Lemma 7.10, pp. 32–34; tensor description preceding Lemma 7.6, p. 30. The finite factors are assembled in a tensor product; uniqueness and the invariant vectors are the finite representation-theoretic inputs.; [S08](#sources), Proposition 3.5, p. 14; Corollary 5.7, pp. 30–31; Lemma 5.12, pp. 32–33. The second consumer uses central-character uniqueness and the smaller-group invariant/induction comparison.

## Finite paper coverage and export contracts

The following five routed items are all covered here. The older routing alias `FiniteWeilRepresentationsPartII` denotes this roadmap; it creates no extra owner.

| Routed item | Exact targets |
|---|---|
| `PAPER-FINTZEN-21/27` | `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann`, `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center`, `MetaplecticAutomorphicFormsPartII:FW.4/tensor-export` |
| `PAPER-FINTZEN-21/27a` | `MetaplecticAutomorphicFormsPartII:FW.2/projective-action`, `MetaplecticAutomorphicFormsPartII:FW.2/parity-linearization`, `MetaplecticAutomorphicFormsPartII:FW.2/generator-formulas`, `MetaplecticAutomorphicFormsPartII:FW.2/weil-heisenberg`, `MetaplecticAutomorphicFormsPartII:FW.2/special-transport` |
| `PAPER-FINTZEN-21/27b` | `MetaplecticAutomorphicFormsPartII:FW.3/mixed-model`, `MetaplecticAutomorphicFormsPartII:FW.3/parabolic-invariants`, `MetaplecticAutomorphicFormsPartII:FW.3/corrected-restriction`, `MetaplecticAutomorphicFormsPartII:FW.4/iterated-fixed-line` |
| `PAPER-STEVENS-08/75` | `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center` |
| `PAPER-STEVENS-08/170` | `MetaplecticAutomorphicFormsPartII:FW.3/cyclic-isotropic-induction` |

The p-adic consumer `SmoothRepresentationsPartII` must supply its finite quotient groups, normal subgroups and characters; their commutator identifications and nondegeneracy; equivariant special isomorphisms when a Weil extension is used; isotropic subgroup lifts U and triviality of θ on U∩H for the cyclic induction theorem; and its tensor-factor action and unipotence/determinant conditions. This roadmap supplies the finite theorems once those hypotheses are proved. It does not assert that every abstract cyclic-center group is a standard exponent-p Heisenberg group.

## Suggested Lean file and declaration boundary

The [suggested file](../suggested/MetaplecticAutomorphicFormsPartII.lean) follows the streamlined shape in WORKERS.md. It elaborates at the pins with only placeholder-proof warnings. Its `schrodingerValue` is a real-bodied coordinate expression over existing carriers; three examples test identity, zero dimension and the positive F₃ translation convention. The complete native-FDRep cyclic-center endpoint and the generic parity-determinant cancellation endpoint are signatures. General even dimension already exists in current Tau Ceti and is not restated here. They do not implement the theory.

The full definitions and their APIs and tests are the targets in this document. Their absence from the suggested file is deliberate: they require the parent Heisenberg specialization, new finite Schrödinger/Weil modules or witness constructions. No replacement carrier, axiom, or unconstructed data definition is introduced just to state those APIs.

| Target | Suggested-file boundary |
|---|---|
| `MetaplecticAutomorphicFormsPartII:FW.0/adapted-polarization` | The partial-coordinate adapter is a README target; general symplectic bases and even dimension already have existing owners. No duplicate even-dimension endpoint is emitted. |
| `MetaplecticAutomorphicFormsPartII:FW.1/schrodinger` | Only its endpoint/formula listed above is emitted; the full witness, API and tests below remain reader targets. |
| `MetaplecticAutomorphicFormsPartII:FW.1/character` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.1/stone-von-neumann` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.1/cyclic-center` | Only its endpoint/formula listed above is emitted; the full witness, API and tests below remain reader targets. |
| `MetaplecticAutomorphicFormsPartII:FW.1/polarization-intertwiner` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.2/projective-action` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.2/parity-linearization` | Only its endpoint/formula listed above is emitted; the full witness, API and tests below remain reader targets. |
| `MetaplecticAutomorphicFormsPartII:FW.2/generator-formulas` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.2/weil-heisenberg` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.2/special-transport` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.3/mixed-model` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.3/parabolic-invariants` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.3/corrected-restriction` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.3/cyclic-isotropic-induction` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.4/iterated-fixed-line` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |
| `MetaplecticAutomorphicFormsPartII:FW.4/tensor-export` | The statement depends on the parent Heisenberg specialization or the new finite models/actions; all target statements, APIs and tests remain in the README. No surrogate carrier or heavy construction is introduced in the suggested file. |

For the light coordinate helper, its consumer API is the displayed evaluation formula, the center action and the translation/modulation specializations in FW.1. The three file examples test that formula; the full FDRep tests remain in FW.1.

## Source corrections and remaining comparison

- **MetaplecticAutomorphicFormsPartII/E1** (misprint), Fintzen, arXiv:1810.04198v2, p. 33 footnote 3, reporting the correction to Gérardin 1977, Theorem 2.4(b). The original Gérardin text was not obtained. Fintzen reports that the inducing representation in the cited Gérardin formula omits the quadratic determinant character of the isotropic plus space. Before induction, tensor the pullback of the smaller Weil–Heisenberg representation with χ_k(det on I), trivial on the Heisenberg factor. In the F₅ symplectic plane, the stabilizer element m(2) acts by −1 on the Lagrangian fixed line. An untwisted zero-dimensional smaller Weil module would give +1. The fixed-space and corrected-induction nodes retain the sign. Status: Already documented in Fintzen, arXiv:1810.04198v2, p. 33 footnote 3, crediting Loren Spice. This finding is an attributed correction, not a claim to have inspected the original misprint.
- **MetaplecticAutomorphicFormsPartII/E2** (misprint), Fintzen–Schwein author manuscript dated April 15, 2025, equation (3.3.3), p. 14; visually checked in the PDF. The same symbol occurs in arXiv:2501.18553v2 HTML at equation (3.3.3). The displayed commutator defining the pairing on xZ(P),yZ(P) uses [x,z], with z absent from the input and not defined there. Use [x,y] for the commutator of the two representatives, followed by the specified center identification. The formula must depend on the two displayed cosets, and the following identification with the alternating form and the imported half-form commutator use precisely [x,y]. No change to the ensuing arguments is needed. Status: new (minor symbol correction scoped to the two explicitly inspected preprint versions; no separate correction located).

- **MetaplecticAutomorphicFormsPartII/E3** (misprint), Published Journal of Lie Theory 12 (2002), p. 23, determinant computation for the diagonal generator immediately after Theorem 4.3. The permutation induced by a generator of kˣ on the nonzero elements of k is described as even, while the determinant calculation assigns it sign −1. The permutation is odd: its single nontrivial cycle has even length q−1. Keep the displayed determinant sign −1 and the ensuing quadratic-character formula. A cycle of length q−1 has sign (−1)^(q−2)=−1 for odd q; the zero element is fixed. The scalar formulas in FW.2 already use the correct sign. Status: new (minor prose parity slip; no separate correction located). Independently confirmed in this review.

The original Gérardin paper and Yu article were not obtained. Publisher requests failed; neither is treated as a directly read source. Neuhauser supplies the actual linearization proof, and Fintzen–Schwein supplies the precise equivariance condition for transporting the action. One source-comparison gap remains: verify that the preferred normalization here agrees with Gérardin’s choice in the exceptional Sp₂(F₃) case, and collate the corrected restriction with the original printed hypotheses. The finite construction and proof targets are fully stated; this gap prevents a claim of complete source closure. FW.0, FW.1 and FW.4 are closed at target-planning level; FW.2 and FW.3 are planned with this comparison recorded. No supplier requests remain.

## Companion-roadmap proposal

The design issue explicitly permits independent directions to be separated. Five finite items need algebraic finite sums and finite groups in odd characteristic; the other 78 concern characteristic-zero local/global theta correspondences and automorphic spectra. Neither branch needs the other. The older finite-route alias FiniteWeilRepresentationsPartII maps to this issue’s required id, not a third roadmap.

Keep FW.0–FW.4 here, in the issue area automorphic with parent MetaplecticAutomorphicForms. Create the companion MetaplecticAutomorphicFormsPartIIShimuraWaldspurger in automorphic with the same parent, with SW.0–SW.8 and the exact item inventory below. This is a concrete design proposal for that independent branch; no claim of having blueprinted its 78 targets is made. Updated parent nodes already cover several older route suggestions and must be imported, not replanned.

The assignment below is based on the reviewed extraction briefs and item records; the theta papers were not directly read in this finite-branch job. It specifies the next independent design scope and exact item ownership, rather than claiming a completed theta blueprint. In particular the current parent already plans theta integrals, parts of doubling and Rallis theory, so those targets must be imported.

### SW.0. Genuine local representations

Import MP.1–MP.4 cover/oscillator infrastructure and MP.3/mp-odd-orthogonal-unramified. Own only genuine induction and Langlands/Whittaker/adelic extensions not already covered there; parameters retain their ψ dependence.

Assigned routed items: `PAPER-GAN-ICHINO-18/metaplectic-induction-adelic`, `PAPER-GAN-ICHINO-18/mp-standard-modules`, `PAPER-GAN-ICHINO-18/rmk-5-3`, `PAPER-GAN-ICHINO-18/unramified-unitarity`, `PAPER-GAN-ICHINO-18/whittaker-mp`.

### SW.1. Local Shimura correspondence and parameters

Import MP.3 Howe duality, first occurrence, conservation, induction and unramified correspondence. Own the Shimura correspondence as a bijection and its ψ-relative LLC/packet labels. Import SO LLC and A-packets from ML.4.

Assigned routed items: `PAPER-GAN-ICHINO-18/local-shimura`, `PAPER-GAN-ICHINO-18/local-parameters`, `PAPER-GAN-ICHINO-18/llc-mp`, `PAPER-GAN-ICHINO-18/lemma-5-2`, `PAPER-GAN-ICHINO-18/rev-epsilon-dichotomy-and-coherence`, `PAPER-GAN-ICHINO-18/rev-square-class-labelling`.

### SW.2. Stable range and rank

Own J.-S. Li rank and stable-range local/global results needed for multiplicity comparisons; import the oscillator, theta modules and measure conventions from MP.0–MP.6.

Assigned routed items: `PAPER-GAN-ICHINO-18/rank`, `PAPER-GAN-ICHINO-18/stable-range-local`, `PAPER-GAN-ICHINO-18/rank-global`, `PAPER-GAN-ICHINO-18/li-inequalities`.

### SW.3. Global theta applications

Import MP.5/global-theta-lift, MP.5/theta-integral-convergence, MP.5/regularized-theta-integral, MP.6/first-term-identity, MP.6/second-term-identity, MP.6/local-doubling-integral, MP.6/rallis-inner-product and MP.6/global-theta-nonvanishing at their exact ranges. Own only remaining global irreducibility, tower/cuspidality and multiplicity-preservation comparisons and specific quaternionic/similitude or boundary cases not supplied by these nodes. For Ichino–Prasanna §9 retain GU plus-subgroups and extension by zero, Lemma 9.3 factorization, the doubling seesaw, Lemma 9.7 image of M_v*(3/2), the unramified zeta normalization and Lemma 9.8 local nonvanishing; import Appendix A splittings from MP.3–MP.4, Eisenstein series from AS.1–AS.2 and local L-factors from AL.4. Gan–Savin item 125 adds the global Sp₆→O₈ case at dim V=2n+2 and L(1,std), with nonzero/generic PGSp₆×PGSO₈ lifts and the tower cuspidality test; the local similitude lift already belongs to MP.3/pgsp6-pgso8-similitude-theta.

Assigned routed items: `PAPER-GAN-ICHINO-18/abstract-theta`, `PAPER-GAN-ICHINO-18/kudla-rallis-irreducibility`, `PAPER-GAN-ICHINO-18/tower-property`, `PAPER-GAN-ICHINO-18/rallis-inner-product`, `PAPER-GAN-ICHINO-18/multiplicity-preservation`, `PAPER-GAN-ICHINO-18/furusawa`, `PAPER-GAN-ICHINO-18/jiang-soudry-supercuspidal`, `PAPER-GAN-ICHINO-18/rev-cuspidality-criterion-for-global-theta`, `PAPER-ICHINO-PRASANNA-23/075`, `PAPER-ICHINO-PRASANNA-23/076`, `PAPER-ICHINO-PRASANNA-23/080`, `PAPER-ICHINO-PRASANNA-23/081`, `PAPER-ICHINO-PRASANNA-23/082`, `PAPER-ICHINO-PRASANNA-23/083`, `PAPER-ICHINO-PRASANNA-23/084`, `PAPER-GAN-SAVIN-23-B/125`.

### SW.4. Discrete spectrum and near equivalence

Own the cover spectral adaptation, standard L-function exponent bound and near-equivalence decomposition of Theorem 1.1. Import AF.1–AF.3, AS.4, AL.3–AL.4 and the weak SO→GL lift from ML.5; do not replace the necessary Euler-product nonvanishing by meromorphic continuation.

Assigned routed items: `PAPER-GAN-ICHINO-18/discrete-spectrum`, `PAPER-GAN-ICHINO-18/near-equivalence`, `PAPER-GAN-ICHINO-18/mp-satake-exponent-bound`, `PAPER-GAN-ICHINO-18/prop-3-1`, `PAPER-GAN-ICHINO-18/thm-1-1`, `PAPER-GAN-ICHINO-18/rmk-1-2`, `PAPER-GAN-ICHINO-18/rmk-1-3`, `PAPER-GAN-ICHINO-18/rmk-3-2`, `PAPER-GAN-ICHINO-18/rmk-3-3`, `PAPER-GAN-ICHINO-18/rev-the-partial-l-function-of`, `PAPER-GAN-ICHINO-18/rev-the-spectral-decomposition-of-l`, `PAPER-GAN-ICHINO-18/rev-weak-lift-of-a-genuine`, `PAPER-GAN-ICHINO-18/complete-l-function-mp`.

### SW.5. Generic component groups

Own generic component-group labels, the sign character, transported packets and Proposition 4.4. Import Arthur SO classification from ML.4 and endoscopic comparison from ET.6.

Assigned routed items: `PAPER-GAN-ICHINO-18/global-component-group`, `PAPER-GAN-ICHINO-18/cuspidal-support`, `PAPER-GAN-ICHINO-18/prop-4-1`, `PAPER-GAN-ICHINO-18/cor-4-2`, `PAPER-GAN-ICHINO-18/lemma-4-3`, `PAPER-GAN-ICHINO-18/pi-tilde`, `PAPER-GAN-ICHINO-18/prop-4-4`.

### SW.6. Comparison of local theta lifts

Own Propositions 5.4 and 6.1 and their local-to-global comparison, with r>2n+1 and almost-tempered input explicit. Import the parent induction/unramified/conservation nodes instead of reproducing them.

Assigned routed items: `PAPER-GAN-ICHINO-18/prop-5-4`, `PAPER-GAN-ICHINO-18/prop-6-1`, `PAPER-GAN-ICHINO-18/lemma-6-2`, `PAPER-GAN-ICHINO-18/lemma-6-3`, `PAPER-GAN-ICHINO-18/lemma-6-4`, `PAPER-GAN-ICHINO-18/gan-takeda-standard-module`, `PAPER-GAN-ICHINO-18/lemma-6-8`, `PAPER-GAN-ICHINO-18/lemma-6-9`, `PAPER-GAN-ICHINO-18/lemma-6-10`, `PAPER-GAN-ICHINO-18/lemma-6-11`, `PAPER-GAN-ICHINO-18/lemma-6-12`.

### SW.7. Globalization and relative Poincaré series

Own the relative/Whittaker Poincaré-series globalization construction for reductive groups and finite central covers. Import abstract weak containment and Fell closure from SmoothRepresentationsPartIIUnitaryDual; Gan–Savin item 91 imports this construction here. Retain the corrected supercuspidal-descent hypothesis of Proposition A.2. Use GZ.4–GZ.5 for toric distinction, and the existing global quadratic-form and class-field suppliers for arithmetic choices.

Assigned routed items: `PAPER-GAN-ICHINO-18/symplectic-supercuspidal-existence`, `PAPER-GAN-ICHINO-18/prop-6-5`, `PAPER-GAN-ICHINO-18/prop-6-6`, `PAPER-GAN-ICHINO-18/cor-6-7`, `PAPER-GAN-ICHINO-18/prop-a-1`, `PAPER-GAN-ICHINO-18/prop-a-2`, `PAPER-GAN-ICHINO-18/ilm-globalization-inputs`, `PAPER-GAN-ICHINO-18/prop-a-3`, `PAPER-GAN-ICHINO-18/prop-a-4`, `PAPER-GAN-ICHINO-18/psp-lemma`, `PAPER-GAN-ICHINO-18/rev-number-fields-with-prescribed-completions`, `PAPER-GAN-ICHINO-18/rev-whittaker-poincare-series-on-mp`, `PAPER-GAN-ICHINO-18/rev-whittaker-plancherel-support-and-weak`, `PAPER-GAN-ICHINO-18/rev-quaternion-algebras-with-prescribed-ramification`.

### SW.8. Generic metaplectic multiplicity formula

Deduce Theorem 1.4 for generic elliptic A-parameters from the local comparison and the generic nonsplit SO near-equivalence multiplicity formula of ML.4, including (6.1). State the multiplicity indicator Δ*η=ε_φ and Corollary 1.6. Do not claim the nongeneric nonsplit input from Ishimoto.

Assigned routed items: `PAPER-GAN-ICHINO-18/thm-1-4`, `PAPER-GAN-ICHINO-18/cor-1-6`.

**Binding corrections inherited from the reviewed routing brief.**

- Proposition A.2 requires the local descent theta lift at v₀ to be supercuspidal (no S₂ in its parameter), not merely exclusion of the odd Weil representation at n=1.
- The proof of Proposition 3.1 uses absolute convergence and nonvanishing of the Euler product in Re(s)>n+1.
- Import the parent theta integral with conjugate(f), and use conjugate(ψ) in the Whittaker functional.
- Input (6.1) includes the nonsplit SO near-equivalence decomposition; Ishimoto supplies the generic case.
- Use a Hasse-invariant convention equal to 1 on split spaces, with the required correction to a raw localHasse convention.

## Sources

The edition, PDF hash, access date and read sections are recorded in the packet. Page numbers in F21 and S08 refer to the linked arXiv editions, N02 to the journal pagination, and FS25 to the dated author manuscript. Only the material supporting these targets was used.

- **F21**. Jessica Fintzen, [Types for tame p-adic groups](https://arxiv.org/pdf/1810.04198v2). Annals of Mathematics 193 (2021), arXiv:1810.04198v2; page locators below refer to this 39-page version. Accessed 2026-10-19.
- **S08**. Shaun Stevens, [The supercuspidal representations of p-adic classical groups](https://arxiv.org/pdf/math/0607622v2). Inventiones mathematicae 172 (2008), 289–352; arXiv:math/0607622v2, 55 pages; page locators refer to arXiv. Accessed 2026-10-19.
- **N02**. Markus Neuhauser, [An Explicit Construction of the Metaplectic Representation over a Finite Field](https://www.heldermann-verlag.de/jlt/jlt12/NEUHAUSLAT2E.PDF). Journal of Lie Theory 12 (2002), 15–30; publisher PDF; journal page numbers. Accessed 2026-10-19.
- **FS25**. Jessica Fintzen and David Schwein, [Construction of tame supercuspidal representations in arbitrary residue characteristic](https://www.math.uni-bonn.de/people/schwein/documents/fintzen_schwein25.pdf). Author manuscript dated April 15, 2025, 53 pages; only the odd-characteristic parts are used. Accessed 2026-10-19.
