# Shimura data, Hermitian domains, and adelic level structures

This is the first blueprint checkpoint. It covers stage D1: the Deligne torus and the dictionary between its real representations and real Hodge structures. Every declaration is a plan, and no stage is closed.

## Scope, ownership and conventions

The roadmap fixes Deligne's 1979 convention, and this checkpoint follows it:

- h(z) acts on V^{p,q} by z^{−p}·z̄^{−q}.
- The weight homomorphism w satisfies w(r) = r⁻¹, and its composite with h is the central restriction.
- μ_h(z) = h_ℂ(z, 1).
- h(i) is the inverse of Tau Ceti's Weil operator C = i^{p−q}.

Milne calls h(i) itself the Weil operator. The two conventions are inverse to each other, and this is a difference of convention, not an error. The existing Hodge library (`TauCeti.Hodge.HodgeStructureOn`) is consumed, and its convention is left unchanged.

The Deligne torus is built as Tau Ceti's Galois-descended torus (`GaloisDescent.descendedCoordinateRing`) of the lattice ℤ², with complex conjugation swapping the coordinates. Its identification with the Weil restriction Res_{ℂ/ℝ} G_m belongs to ReductiveGroupsPartII RG2.0a and is requested from there.

Mathlib has no `IsGalois ℝ ℂ` instance at the pin, so it is supplied here. Tau Ceti descends Hopf algebras and characters but not comodules, so the inverse direction of the equivalence records Galois descent of comodules as a gap.

## The Deligne torus and Hodge structures (D1)

### The Deligne torus S

Declaration: TauCeti.Shimura.DeligneTorus. Node: ShimuraData:D1/deligne-torus.

Let σ ∈ Gal(ℂ/ℝ) be complex conjugation and let ρ_S be the integral representation of Gal(ℂ/ℝ) on ℤ² in which σ swaps the two coordinates. The Deligne torus S is the affine group over ℝ obtained by Galois descent of the split torus D(ℤ²) = G_m² along ℂ/ℝ with this twist: its coordinate Hopf algebra is Tau Ceti's descended coordinate ring GaloisDescent.descendedCoordinateRing ρ_S, the fixed subalgebra of ℂ[ℤ²] = ℂ[x^{±1}, y^{±1}] under σ(a·x^i y^j) = ā·x^j y^i. Explicitly it is ℝ[u, v, (u² + v²)⁻¹], with x = u + iv and y = u − iv. S is a torus of rank 2, split by ℂ: S_ℂ ≅ G_m² through Tau Ceti's descendedBaseChangeIso. The two coordinates are named so that the ℝ-points z ∈ ℂˣ go to (z, z̄) (D1/deligne-torus-points). S is the Weil restriction Res_{ℂ/ℝ} G_m; that identification is requested from ReductiveGroupsPartII RG2.0a, and nothing here depends on it. Lean: `TauCeti.Shimura.delignetorusRep` (the representation ρ_S) and `TauCeti.Shimura.DeligneTorus` (the Hopf algebra object).

Hypotheses: ℂ/ℝ is finite Galois with group {1, σ}; ℤ² is a free lattice of rank 2. The conventions are those of Deligne 1979, 1.1.1.1, as fixed by the roadmap.

Proof or construction:

1. ℂ/ℝ is Galois: ℂ is the splitting field of X² + 1 over ℝ, which is separable in characteristic 0; Mathlib provides FiniteDimensional ℝ ℂ but no IsGalois ℝ ℂ instance at the pin, so it is supplied here. Gal(ℂ/ℝ) = {1, σ} with σ = Complex.conjAe.
2. ρ_S is an integral representation of Gal(ℂ/ℝ) because the swap is an involution of ℤ².
3. Tau Ceti's GaloisDescent.descendedCoordinateRing ρ_S is a finite-type commutative Hopf algebra over ℝ, and torusCommHopfAlgProperty_descendedCoordinateRing makes it a torus. splitTorusCommHopfAlgProperty_baseChange_descendedCoordinateRing makes its base change to ℂ a split torus, and descendedBaseChangeIso identifies it with ℂ[ℤ²].
4. Explicit generators: the invariants of the twisted action are spanned by a·x^i y^j + ā·x^j y^i. With u = (x + y)/2 and v = (x − y)/(2i), both invariant, xy = u² + v² is invariant and invertible, and the invariant subalgebra is ℝ[u, v, (u² + v²)⁻¹].

The required uses are:

- ShimuraData:D1/hodge-decomposition-of-representation: Real Hodge structures are real representations of S.
- ShimuraData:D4: A Shimura datum is a conjugacy class of homomorphisms S → G_ℝ.
- ShimuraData:D3: The Hodge cocharacter μ_h is h_ℂ restricted to the first factor of S_ℂ.

The API supplies:

- TauCeti.Shimura.isGalois_real_complex: IsGalois ℝ ℂ (no instance in Mathlib at the pin).
- TauCeti.Shimura.delignetorusRep: The swap representation of Gal(ℂ/ℝ) on ℤ².
- TauCeti.Shimura.DeligneTorus: descendedCoordinateRing delignetorusRep, a finite-type commutative Hopf algebra over ℝ.
- TauCeti.Shimura.DeligneTorus.isTorus: S is a torus.
- TauCeti.Shimura.DeligneTorus.baseChangeIso: ℂ ⊗_ℝ 𝒪(S) ≅ ℂ[ℤ²] as Hopf algebras, i.e. S_ℂ ≅ G_m², with the Galois action matching coefficient conjugation composed with the swap.
- TauCeti.Shimura.DeligneTorus.coordinateRing_eq: 𝒪(S) = ℝ[u, v, (u² + v²)⁻¹] with x = u + iv and y = u − iv.
- TauCeti.Shimura.DeligneTorus.not_split: S is not split over ℝ.

Discriminating tests:

- TauCeti.Shimura.tests.rank (computation): The character lattice of S_ℂ has rank 2 (it is ℤ², by groupAlgebraInvariantsCharacterEquiv).
- TauCeti.Shimura.tests.not_split (non-example): The Galois-invariant characters of S form the rank-one lattice ℤ·(1, 1); a split torus of rank 2 would have rank-2 invariants. So S is not isomorphic to G_m² over ℝ.
- TauCeti.Shimura.tests.not_Gm (non-example): S is not G_m over ℝ: G_m has rank 1.
- TauCeti.Shimura.tests.real_points (compatibility): The ℝ-points of S form a group isomorphic to ℂˣ (D1/deligne-torus-points).
- TauCeti.Shimura.tests.twisted_invariant (computation): x + y and i(y − x) are invariant under the twisted action, and x alone is not.

Acceptance cases:

- S is not split over ℝ: its Galois-invariant characters form a sublattice of rank 1 (the norm), not 2.
- S is not the multiplicative group ℂˣ viewed as an abstract group: its points over every ℝ-algebra A are (A ⊗_ℝ ℂ)ˣ.

Prerequisites: tauceti:TauCeti.GaloisDescent.descendedCoordinateRing, tauceti:TauCeti.GaloisDescent.groupAlgebraInvariants, tauceti:TauCeti.GaloisDescent.groupAlgebraAction, tauceti:TauCeti.GaloisDescent.descendedBaseChangeIso, tauceti:TauCeti.GaloisDescent.torusCommHopfAlgProperty_descendedCoordinateRing, tauceti:TauCeti.GaloisDescent.splitTorusCommHopfAlgProperty_baseChange_descendedCoordinateRing, tauceti:TauCeti.torusCommHopfAlgProperty, tauceti:TauCeti.FiniteTypeCommHopfAlgCat, mathlib:Representation, mathlib:MonoidAlgebra.

Sources:

- Milne, §2, 'Hodge structures as representations of S', p. 26. The Deligne torus as the restriction of scalars of G_m.
- Milne, §2, p. 26. The normalisation of the splitting S_ℂ ≅ G_m × G_m.

### Real and complex points of S

Declaration: TauCeti.Shimura.DeligneTorus.realPointsMulEquiv. Node: ShimuraData:D1/deligne-torus-points.

(a) For every ℝ-algebra A, S(A) ≅ (A ⊗_ℝ ℂ)ˣ, naturally in A; in particular S(ℝ) ≅ ℂˣ. (b) S(ℂ) ≅ ℂˣ × ℂˣ through S_ℂ ≅ G_m² (the values at x and y). (c) The map S(ℝ) → S(ℂ) induced by ℝ ⊆ ℂ is z ↦ (z, z̄). (d) Complex conjugation acts on S(ℂ) by (z₁, z₂) ↦ (z̄₂, z̄₁), and S(ℝ) is its fixed subgroup.

Hypotheses: S as in D1/deligne-torus.

Proof or construction:

1. (b) An ℝ-algebra map 𝒪(S) → ℂ is a ℂ-algebra map ℂ ⊗ 𝒪(S) ≅ ℂ[x^{±1}, y^{±1}] → ℂ, i.e. a pair of units (x, y) ↦ (z₁, z₂).
2. (d) Composing a point with complex conjugation of the target corresponds, under the splitting, to the twisted action: (z₁, z₂) ↦ (z̄₂, z̄₁). An ℝ-algebra map to ℂ lands in ℝ iff it is fixed by this action.
3. (a) and (c): a fixed point has z₂ = z̄₁, so S(ℝ) = {(z, z̄)} ≅ ℂˣ; for a general ℝ-algebra A, the same computation with A ⊗_ℝ ℂ in place of ℂ identifies S(A) with the units of A ⊗_ℝ ℂ, through u + iv.
4. Group structure: the comultiplication of the descended algebra is the restriction of that of ℂ[ℤ²], so the identifications are group isomorphisms.

Acceptance cases:

- The point z = i of S(ℝ) is (i, −i) in S(ℂ).

Prerequisites: ShimuraData:D1/deligne-torus, tauceti:TauCeti.HopfAlgebra.pointsHomEquiv, tauceti:TauCeti.DiagonalizableGroup.pointEquiv, tauceti:TauCeti.GaloisDescent.descendedBaseChangeIso.

Sources:

- Milne, §2, p. 26. The complex points and the conjugation (z₁, z₂) ↦ (z̄₂, z̄₁).
- Milne, §2, p. 26. The inclusion of real points is z ↦ (z, z̄).

### Weight, norm and the Hodge cocharacter

Declaration: TauCeti.Shimura.DeligneTorus.weight. Node: ShimuraData:D1/weight-norm-cocharacters.

An equivariant homomorphism of Galois lattices M′ → M induces a homomorphism of descended tori in the opposite direction on groups (a Hopf algebra map of the descended coordinate rings). Using it, together with G_m (the trivial lattice ℤ), define: (a) the norm Nm : S → G_m, the character (1, 1), with Nm(z) = z z̄ on ℝ-points; (b) the weight homomorphism w : G_m → S, the cocharacter (−1, −1), with w(r) = r⁻¹ on ℝ-points (Deligne's and Milne's normalisation); (c) over ℂ, the cocharacter μ : G_{m,ℂ} → S_ℂ, the cocharacter (1, 0), with μ(z) = (z, 1). The kernel of Nm is the circle S¹ = U(1), and Nm ∘ w is r ↦ r⁻². For h : S → GL(V) (D1/hodge-decomposition-of-representation), the central restriction is h ∘ w and μ_h := h_ℂ ∘ μ.

Hypotheses: S as in D1/deligne-torus. Characters are written (a, b) for z₁^a z₂^b, and cocharacters (a, b) for t ↦ (t^a, t^b).

Proof or construction:

1. Functoriality of descent: an equivariant homomorphism M′ → M gives an equivariant map of group algebras ℂ[M′] → ℂ[M] (for the simultaneous action on coefficients and exponents), which restricts to the invariant subalgebras and respects the Hopf operations. This is the map of coordinate rings of D(M) → D(M′).
2. Nm: the lattice map ℤ → ℤ², 1 ↦ (1, 1), is equivariant (the swap fixes (1, 1)). On points it is (z₁, z₂) ↦ z₁z₂, which is z z̄ on real points.
3. w: the lattice map ℤ² → ℤ, (a, b) ↦ −(a + b), is equivariant. On points it is r ↦ (r⁻¹, r⁻¹), i.e. r⁻¹ ∈ ℂˣ.
4. μ is defined over ℂ only: the lattice map (a, b) ↦ a is not equivariant for the swap, so μ is not defined over ℝ.
5. The kernel of Nm on real points is {z : z z̄ = 1}.

The required uses are:

- ShimuraData:D1/hodge-decomposition-of-representation: The weight decomposition is the eigenspace decomposition of h ∘ w.
- ShimuraData:D1/rational-weight-criterion: Rationality is a condition on h ∘ w.
- ShimuraData:D3: The Hodge filtration is read off from μ_h.

The API supplies:

- TauCeti.Shimura.descendMap: The homomorphism of descended groups (a Hopf algebra map of descended coordinate rings) induced by an equivariant lattice homomorphism.
- TauCeti.Shimura.DeligneTorus.norm: Nm : S → G_m, the character (1, 1).
- TauCeti.Shimura.DeligneTorus.weight: w : G_m → S, the cocharacter (−1, −1).
- TauCeti.Shimura.DeligneTorus.hodgeCocharacter: μ : G_{m,ℂ} → S_ℂ, the cocharacter (1, 0).
- TauCeti.Shimura.DeligneTorus.norm_apply_real: Nm(z) = z z̄ on real points.
- TauCeti.Shimura.DeligneTorus.weight_apply_real: w(r) = r⁻¹ on real points.
- TauCeti.Shimura.DeligneTorus.norm_comp_weight: Nm ∘ w = (r ↦ r⁻²).

Discriminating tests:

- TauCeti.Shimura.tests.norm_i (computation): Nm(i) = 1 and Nm(1 + i) = 2.
- TauCeti.Shimura.tests.weight_two (computation): w(2) = 1/2 ∈ ℂˣ = S(ℝ).
- TauCeti.Shimura.tests.mu_not_real (non-example): The lattice map (a, b) ↦ a is not swap-equivariant, so μ has no model over ℝ; a definition of μ as an ℝ-homomorphism G_m → S must fail.
- TauCeti.Shimura.tests.norm_weight (compatibility): Nm ∘ w is the character r ↦ r⁻², not the identity.

Acceptance cases:

- Nm ∘ w = (r ↦ r⁻²) on real points: the weight homomorphism and the norm do not compose to the identity.
- The weight convention differs by a sign from the 'weight cocharacter' r ↦ r used elsewhere; the roadmap names h ∘ w the central restriction and its inverse the weight cocharacter.

Prerequisites: ShimuraData:D1/deligne-torus, ShimuraData:D1/deligne-torus-points, tauceti:TauCeti.GaloisDescent.groupAlgebraAction, tauceti:TauCeti.DiagonalizableGroup.cocharPoints, tauceti:TauCeti.DiagonalizableGroup.charPoints, mathlib:MonoidAlgebra.

Sources:

- Milne, §2, p. 26. The weight homomorphism w(r) = r⁻¹.
- Milne, §2, p. 26. μ_h(z) = h_ℂ(z, 1).

### Hodge decomposition of a real representation of S

Declaration: TauCeti.Shimura.hodgeOfRepresentation. Node: ShimuraData:D1/hodge-decomposition-of-representation.

Let V be a finite-dimensional real vector space and h a representation of S on V (a right comodule over 𝒪(S)). Base change to ℂ and the splitting S_ℂ ≅ G_m² make ℂ ⊗ V a comodule over ℂ[ℤ²], and Tau Ceti's weight decomposition gives ℂ ⊗ V = ⊕_{(a, b) ∈ ℤ²} V_{(a, b)}, with (z₁, z₂) acting on V_{(a, b)} by z₁^a z₂^b. Deligne's convention sets V^{p,q} := V_{(−p, −q)}, so that h(z) acts on V^{p,q} by z^{−p} z̄^{−q}. Then: (a) complex conjugation of ℂ ⊗ V (Tau Ceti complexificationConjugation) carries V^{p,q} onto V^{q,p}; (b) for each n, V_n := ⊕_{p+q=n} V^{p,q} is conjugation-stable, hence the complexification of a real subspace, the weight-n part; (c) V = ⊕_n V_n, finitely many nonzero; (d) on each V_n, the family (V^{p, n−p})_p is a Hodge decomposition of weight n (Tau Ceti IsHodgeDecomposition), giving a pure Hodge structure HodgeStructureOn (ℂ ⊗ V_n) conj n by ofDecomposition. Lean: `TauCeti.Shimura.hodgeOfRepresentation`.

Hypotheses: V finite-dimensional over ℝ; h a comodule structure over 𝒪(S).

Proof or construction:

1. Weight spaces: ℂ ⊗ V is a comodule over ℂ ⊗ 𝒪(S) ≅ ℂ[ℤ²] (descendedBaseChangeIso), and DiagonalizableGroup.isInternal_weightSpace gives the internal direct sum of the weight spaces; finitely many are nonzero by finite dimension.
2. (a) The comodule structure comes from a real comodule, so it commutes with coefficient conjugation. Under the splitting, coefficient conjugation composed with the swap of exponents is the Galois action, so conjugation carries the (a, b)-weight space to the (b, a)-weight space, i.e. V^{p,q} to V^{q,p}.
3. (b), (c) A conjugation-stable complex subspace of ℂ ⊗ V is the complexification of its real points; the V_n exhaust V and are independent.
4. (d) The pieces V^{p, n−p} are an internal direct sum of ℂ ⊗ V_n exchanged by conjugation in the required way, which is the hypothesis of Tau Ceti's ofDecomposition.

The required uses are:

- ShimuraData:D1/representation-hodge-equivalence: The object part of the equivalence.
- ShimuraData:D2: The adjoint Hodge types of a datum are read off from this decomposition for the adjoint representation.

The API supplies:

- TauCeti.Shimura.hodgePiece: V^{p,q} ⊆ ℂ ⊗ V, the (−p, −q)-weight space.
- TauCeti.Shimura.conj_hodgePiece: Complex conjugation maps V^{p,q} onto V^{q,p}.
- TauCeti.Shimura.weightPart: The real subspace V_n with complexification ⊕_{p+q=n} V^{p,q}.
- TauCeti.Shimura.isInternal_weightPart: V is the internal direct sum of the V_n.
- TauCeti.Shimura.hodgeOfRepresentation: The pure Hodge structure of weight n on ℂ ⊗ V_n.
- TauCeti.Shimura.hodgeOfRepresentation_piece: Its Tau Ceti Hodge components are the V^{p, n−p}.

Discriminating tests:

- TauCeti.Shimura.tests.trivial_rep (degenerate): The trivial one-dimensional representation has V = V^{0,0}, a pure structure of weight 0 (Tau Ceti tate 0).
- TauCeti.Shimura.tests.norm_rep (computation): The representation h(z) = (z z̄)^m on ℝ has type (−m, −m) and weight −2m, matching Tau Ceti's tate m (Milne's ℚ(m)).
- TauCeti.Shimura.tests.complex_structure (computation): ℝ² with h(z) = multiplication by z (identify ℝ² = ℂ) has type {(−1, 0), (0, −1)}, weight −1: the homology H₁ of an elliptic curve.
- TauCeti.Shimura.tests.sign (non-example): With the opposite sign V^{p,q} = V_{(p, q)}, the last example would get type {(1, 0), (0, 1)} and weight +1; the definition must give weight −1.

Acceptance cases:

- The sign V^{p,q} = V_{(−p, −q)} is the Shimura-variety convention (Deligne 1979); the opposite convention of Hodge theory (Deligne 1971) would give V^{p,q} = V_{(p, q)}. A test pins the sign (D1/test-objects).

Prerequisites: ShimuraData:D1/deligne-torus, tauceti:TauCeti.DiagonalizableGroup.weightSpace, tauceti:TauCeti.DiagonalizableGroup.isInternal_weightSpace, tauceti:TauCeti.DiagonalizableGroup.endOfPoint_tmul_of_mem_weightSpace, tauceti:TauCeti.Comodule, tauceti:TauCeti.Hodge.complexificationConjugation, tauceti:TauCeti.Hodge.IsHodgeDecomposition, tauceti:TauCeti.Hodge.HodgeStructureOn.ofDecomposition, tauceti:TauCeti.Hodge.HodgeStructureOn.

Sources:

- Milne, §2, p. 26. The sign convention h(z)v = z^{−p} z̄^{−q}v on V^{p,q}.
- Milne, §2, p. 26. The sign convention.

### Real representations of S are finite sums of pure real Hodge structures

Declaration: TauCeti.Shimura.representationHodgeEquivalence. Node: ShimuraData:D1/representation-hodge-equivalence.

The construction of D1/hodge-decomposition-of-representation extends to an equivalence of categories between finite-dimensional real representations of S (comodules over 𝒪(S), with comodule maps) and finite direct sums of pure real Hodge structures: families (V_n, H_n)_{n ∈ ℤ}, finitely many nonzero, with H_n a HodgeStructureOn (ℂ ⊗ V_n) conj n, and morphisms the families of real-linear maps whose complexifications preserve every Hodge filtration step (equivalently every V^{p,q}). A representation need not be pure; it is pure of weight n iff V = V_n. The equivalence is compatible with tensor products, duals and Tate twists: (V ⊗ W, h_V ⊗ h_W) has (V ⊗ W)^{p,q} = ⊕ V^{r,s} ⊗ W^{r′,s′} over r + r′ = p, s + s′ = q (Tau Ceti tensorProduct), the dual representation corresponds to Tau Ceti dual, and twisting by Nm^m corresponds to Tau Ceti tateTwist by m.

Hypotheses: Finite-dimensional real vector spaces; the Hodge side uses the complexification conjugation.

Proof or construction:

1. Inverse construction: given (V_n, H_n), let (z₁, z₂) act on H_n.piece p ⊆ ℂ ⊗ V_n by z₁^{−p} z₂^{−(n−p)}; this is a ℂ[ℤ²]-comodule structure on ℂ ⊗ V which commutes with the Galois action (conjugation exchanges pieces p and n − p and the exponents are swapped), hence descends to an 𝒪(S)-comodule structure on V (Galois descent of comodules along the invariant subalgebra).
2. The two constructions are inverse on objects: weight spaces determine the comodule structure of a diagonalizable group (isInternal_weightSpace), and ofDecomposition recovers the Hodge structure from its pieces (decompositionEquiv).
3. Morphisms: a real-linear map commutes with the S-actions iff its complexification preserves each weight space V^{p,q}, iff it preserves the Hodge filtrations of each V_n (the filtration determines the pieces).
4. Tensor products and duals: weight spaces of a tensor product of comodules of a diagonalizable group add, and those of the dual negate; compare with Tau Ceti tensorProduct and dual. Tate twist: Nm^m has weight space (m, m), i.e. type (−m, −m).

Acceptance cases:

- A general representation is not forced to have one weight: ℝ ⊕ ℝ(1) has weights 0 and −2.

Prerequisites: ShimuraData:D1/hodge-decomposition-of-representation, ShimuraData:D1/weight-norm-cocharacters, tauceti:TauCeti.Hodge.HodgeStructureOn.decompositionEquiv, tauceti:TauCeti.Hodge.HodgeStructureOn.tensorProduct, tauceti:TauCeti.Hodge.HodgeStructureOn.dual, tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist, tauceti:TauCeti.DiagonalizableGroup.isInternal_weightSpace.

Sources:

- Milne, §2, p. 26. The equivalence (Milne's Hodge structures are the finite direct sums over the weights).
- Milne, §2, 'Tensor products of Hodge structures', p. 27. Compatibility with tensor products.

### h(i) is the inverse of the Weil operator

Declaration: TauCeti.Shimura.hodgeOfRepresentation_h_i. Node: ShimuraData:D1/weil-operator-sign.

For a real representation h of S and each weight n, h(i) acts on ℂ ⊗ V_n as the inverse of Tau Ceti's Weil operator C of the pure Hodge structure H_n: C acts on V^{p,q} by i^{p−q} (TauCeti.Hodge.HodgeStructureOn.weilOperator), whereas h(i) acts by i^{−p}·(−i)^{−q} = i^{q−p}. In particular h(i)² = h(−1) acts on V_n by (−1)^n, and h(i) = C⁻¹ = (−1)^n·C. Moreover the central restriction h ∘ w acts on V_n by r ↦ r^n, and μ_h(z) = h_ℂ(z, 1) acts on V^{p,q} by z^{−p}.

Hypotheses: h a real representation of S; H_n as in D1/hodge-decomposition-of-representation.

Proof or construction:

1. On V^{p,q}, h(z) = z^{−p} z̄^{−q}; at z = i, z̄ = −i = i⁻¹, so h(i) = i^{−p}·i^{q} = i^{q−p}.
2. Tau Ceti's weilOperator_apply_of_mem: C acts on piece p of weight n by i^{2p−n} = i^{p−q}. Hence h(i) = C⁻¹ on each piece and so on ℂ ⊗ V_n. Since C² = (−1)^n (weilOperator_comp_weilOperator), C⁻¹ = (−1)^n C.
3. h ∘ w(r) = h(r⁻¹) acts on V^{p,q} by r^{p} r^{q} = r^n (r is real, so z̄ = z = r⁻¹). μ_h(z) = h_ℂ(z, 1) acts by z^{−p}·1.

Acceptance cases:

- Milne calls C := h(i) the Weil operator, acting by i^{q−p}; Tau Ceti's Weil operator is the inverse. The roadmap keeps Tau Ceti's convention and records h(i) = C⁻¹.
- For ℝ² with h(z) = multiplication by z (weight −1), h(i) is the complex structure J, and C = −J.

Prerequisites: ShimuraData:D1/hodge-decomposition-of-representation, ShimuraData:D1/weight-norm-cocharacters, tauceti:TauCeti.Hodge.HodgeStructureOn.weilOperator, tauceti:TauCeti.Hodge.HodgeStructureOn.weilOperator_apply_of_mem.

Sources:

- Milne, §2, 'The Weil operator', p. 27. Milne's C = h(i), acting by i^{q−p}, the inverse of Tau Ceti's.
- Milne, §2, p. 26. h ∘ w acts by r^n on V_n.

### Rational Hodge structures and the weight

Declaration: TauCeti.Shimura.weightDefinedOverQ_iff. Node: ShimuraData:D1/rational-weight-criterion.

Let V_ℚ be a finite-dimensional ℚ-vector space and h a representation of S on V_ℝ := ℝ ⊗ V_ℚ. Then the weight decomposition V_ℝ = ⊕ V_n is defined over ℚ (each V_n is ℝ ⊗ of a ℚ-subspace) iff the central restriction h ∘ w : G_{m,ℝ} → GL(V_ℝ) is defined over ℚ (comes from a homomorphism G_{m,ℚ} → GL(V_ℚ)). In that case (V_ℚ, h) is a rational Hodge structure in Milne's sense: a Hodge decomposition of V_ℝ whose weight decomposition is defined over ℚ; for V_ℚ = V_n this is Tau Ceti's rational Hodge structure with the rational conjugation.

Hypotheses: V_ℚ finite-dimensional; h a real representation of S on V_ℝ.

Proof or construction:

1. A homomorphism G_m → GL(V_ℝ) is a ℤ-grading of V_ℝ (weight spaces of the diagonalizable group G_m); it is defined over ℚ iff each graded piece is defined over ℚ (a homomorphism over ℚ gives a ℚ-grading, and conversely the grading defines the comodule over ℚ[t^{±1}]).
2. For h ∘ w the graded pieces are the V_n (D1/weil-operator-sign: h ∘ w acts by r^n on V_n).
3. Given the ℚ-structure on each V_n, the pure structure on ℂ ⊗ V_n is Tau Ceti's rational Hodge structure (Tau Ceti rationalToComplexSubmodule and the base-change API).

Acceptance cases:

- The one-dimensional representation h(z) = z z̄ on ℚ has weight −2 over ℚ: it is ℚ(1).
- A representation of S on ℝ ⊗ V_ℚ whose weights are not defined over ℚ: V_ℚ = ℚ², h acting by weight 0 on the line ℝ·(1, √2) and weight −2 on ℝ·(1, 0); this is not a rational Hodge structure.

Prerequisites: ShimuraData:D1/weil-operator-sign, ShimuraData:D1/weight-norm-cocharacters, tauceti:TauCeti.DiagonalizableGroup.isInternal_weightSpace, tauceti:TauCeti.Hodge.rationalToComplexSubmodule.

Sources:

- Milne, §2, p. 26. Rational Hodge structures as representations whose weight homomorphism is defined over ℚ.

### The four test objects under one sign convention

Declaration: TauCeti.Shimura.hodgeOfRepresentation_tests. Node: ShimuraData:D1/test-objects.

Under the convention of D1/hodge-decomposition-of-representation: (a) the trivial representation of S on ℚ is of type (0, 0), Tau Ceti tate 0; (b) the character Nm^m = (z z̄)^m on ℚ is ℚ(m), of type (−m, −m), Tau Ceti tate m; in particular ℚ(1) has h(z) = z z̄ and weight −2; (c) the standard homology H₁(E, ℚ) = Λ ⊗ ℚ of an elliptic curve E = ℂ/Λ, with h(z) acting on Λ ⊗ ℝ = ℂ by multiplication by z, is of type {(−1, 0), (0, −1)} and weight −1, and Tau Ceti's weight-one structure on ℤ² from a complex structure is its dual (weight +1, cohomology); (d) for h₀ : S → GL₂,ℝ, h₀(a + bi) = [[a, −b], [b, a]], the adjoint representation on gl₂ has types (−1, 1), (0, 0), (1, −1) with dimensions 1, 2, 1: it is of weight 0, and these are the only adjoint Hodge types allowed by Deligne's first axiom.

Hypotheses: All four with the convention h(z)v = z^{−p} z̄^{−q}v on V^{p,q}.

Proof or construction:

1. (a), (b): the character (m, m) of S_ℂ has weight space the whole line, and V^{p,q} = V_{(−p, −q)} gives p = q = −m; compare Tau Ceti tate_piece.
2. (c): multiplication by z on ℂ = ℝ² has eigenvalues z (on the +i-eigenspace of J) and z̄ (on the −i-eigenspace) after complexification, i.e. weights (1, 0) and (0, 1), hence types (−1, 0) and (0, −1).
3. (d): h₀ is the representation of (c) on V = ℝ² = ℂ, of types (−1, 0), (0, −1); gl₂ = V ⊗ V^∨ and V^∨ has types (1, 0), (0, 1), so the types of V ⊗ V^∨ are (−1, 0) + (1, 0) = (0, 0), (−1, 0) + (0, 1) = (−1, 1), (0, −1) + (1, 0) = (1, −1), (0, −1) + (0, 1) = (0, 0).

Acceptance cases:

- All four examples use one convention. The opposite sign convention would leave (a) and (d) unchanged but give ℚ(m) type (m, m) and H₁(E) weight +1, so (b) and (c) detect it.

Prerequisites: ShimuraData:D1/hodge-decomposition-of-representation, ShimuraData:D1/representation-hodge-equivalence, tauceti:TauCeti.Hodge.tate.

Sources:

- Milne, §2, Example 2.9, p. 26. ℚ(m) corresponds to h(z) = (z z̄)^m.
- Milne, §2, Example 2.8, p. 26. A complex structure is a Hodge structure of type (−1, 0), (0, −1).
- Milne, §2, Example 2.4, p. 25. Complex structures and Hodge structures of type (−1, 0), (0, −1).

## Remaining work

### ShimuraData:D0 — not_read

Weil restriction and topological points: consume ReductiveGroupsPartII RG2.0a for Res_{L/K} and AdelicAlgebraicGroups AA.0–AA.1 for topological and adelic points (requests); instantiate for S, the Hilbert groups and datum morphisms.

### ShimuraData:D1 — partial

Galois descent of comodules along the descended coordinate ring, needed for the inverse construction of D1/representation-hodge-equivalence (gap).

The comparison with the existing opposed-filtration construction beyond pure pieces, and the identification S ≅ Res_{ℂ/ℝ} G_m (requested from RG2.0a).

Polarizations and Hodge tensors in representation-theoretic form (Milne §2, Hodge tensors and polarizations).

### ShimuraData:D2 — not_read

Cartan involutions, the stabiliser of h, the invariant complex structure and Hermitian symmetric domains (Milne §§1–2, Deligne 1979 §1.2).

### ShimuraData:D3 — not_read

Variations of Hodge structure, homogeneous variations, compact duals and the reflex field.

### ShimuraData:D4 — not_read

Shimura data and their morphisms, special points, Hodge and abelian type.

### ShimuraData:D5 — not_read

Neatness, arithmetic subgroups and the standard examples (GL₂, Siegel, Hilbert, tori).

## Requests and gaps

- Request to ReductiveGroupsPartII:RG2.0a: Weil restriction Res_{ℂ/ℝ} G_m by its functor-of-points universal property, and an isomorphism of affine groups over ℝ between it and the Galois-descended torus of the swap lattice ℤ² (Tau Ceti GaloisDescent.descendedCoordinateRing), compatible with S(A) ≅ (A ⊗_ℝ ℂ)ˣ.
- Request to AdelicAlgebraicGroups:AA.1: The topological group S(ℝ) and G(ℝ) of real points of affine groups, for the real Lie-group structure used from D2 on.
- Gap, Galois descent of comodules along the descended coordinate ring: A ℂ[ℤ²]-comodule structure on ℂ ⊗ V commuting with the simultaneous Galois action should descend to an 𝒪(S)-comodule structure on V. Tau Ceti descends the Hopf algebra and its characters but not comodules; the inverse construction of the equivalence needs this descent (Milne, Algebraic Groups, Appendix A).

## Sources and baseline

The source is Milne's *Introduction to Shimura varieties* (author PDF, sha256 in sourceVersions); §2, pp. 24–28, was read in full. No mistakes in the source were found.

All 30 baseline declarations are in the pinned declaration index, and their heads were read in the pinned sources:

- Tau Ceti's Galois-descended tori, the torus predicate, and diagonalizable-group weight spaces;
- `HodgeStructureOn` with its decomposition, Weil operator, tensor, dual and Tate APIs.

The planets are:

- Deligne torus;
- Hodge structures as representations of S;
- Representations of S and real Hodge structures.

The suggested Lean file is not compiled.
