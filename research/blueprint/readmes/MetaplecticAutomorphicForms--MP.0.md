# Heisenberg extensions and the metaplectic programme

This part covers MetaplecticAutomorphicForms:MP.0–7. Its completed planning component is the algebraic Heisenberg extension: twelve declarations with explicit hypotheses, proofs reduced to the pinned libraries, and tests on actual native types. The topology, Schrödinger representations, Stone–von Neumann theorem, metaplectic double cover and local/global theta analysis remain precise stage gaps. The packet is partial. Elaboration of the suggested signatures is not a proof of the proposed mathematics, and every declaration retains implementation status unchecked.

The mathematical purpose is to construct genuine representations on a central cover and the theta kernels used by automorphic consumers. The first central extension encountered in this development is the Heisenberg group. Its quotient is an additive symplectic space and its center is the additive coefficient field. The metaplectic group is a different extension: it lies over the symplectic group and arises from scalar ambiguity in intertwining Heisenberg representations. The algebra below establishes the first extension and its symplectic automorphisms. It supplies the input for the representation-theoretic construction without asserting that the second extension has been built.

## Conventions and native objects

Let R be a commutative ring, and let W and C be additive commutative groups with R-module structures. A bilinear map B:W×W→C is the native LinearMap.BilinMap. We use Multiplicative to pass additive groups to the existing multiplicative extension machinery. Install TauCeti’s existing trivial coefficient action locally. Define the factor set α_B by α_B(x,y)=B(x,y), expressed in the multiplicative tags. Write E_B for its native FactorSet.Extension. This notation introduces no wrapper, group structure or exact-sequence implementation.

Coordinates in this document are (t,x), with t∈C the native left coordinate and x∈W the native right coordinate. Kudla writes the space coordinate first, (x,t). In our coordinates the product is

    (t,x)(s,y) = (t+s+B(x,y), x+y).

The identity is (0,0), the native coefficient injection is inl(t)=(t,0), and the native quotient homomorphism is rightHom(t,x)=x. FactorSet already proves exactness, injectivity of inl and surjectivity of rightHom. It also provides canonicalSection(x)=(0,x) and the factorization (t,x)=inl(t)canonicalSection(x). The section is a map of sets, and its failure to preserve multiplication is exactly α_B. Under the trivial action the coefficient injection is central; identifying the entire center requires a further hypothesis and theorem.

The different coefficient module C matters. On a lattice Y in a local symplectic vector space, the half-pairing can take values in the ambient local field without taking values in Y’s scalar ring. One may restrict the scalar ring to Z and restrict the domain to a Z-submodule, retaining C as the local field. Native restrictScalars₁₂ and domRestrict₁₂ provide these operations. Requiring C=R in the generic construction would obscure this valid lattice application. The scalar-valued specialization is used only for the native isometry and polarization interfaces.

For a scalar-valued alternating form ω, with 2 invertible in R, the Heisenberg convention is B=½ω. Alternating means the existing IsAlt predicate, and nondegenerate means the existing Nondegenerate predicate; neither becomes a new structure. The inverse of 2 is supplied as an invertible element, not as division in an arbitrary ring. Every characteristic-not-two field supports this specialization, including Q₂. No odd residue-characteristic hypothesis belongs to this algebraic formula. The generic bilinear factor set also exists in characteristic two, where a triangular bilinear representative remains meaningful even though ½ω is unavailable.

For a scalar form B, use TauCeti.BilinForm.isometryGroup B, the existing subgroup of linear automorphisms preserving B. It is already defined over a commutative semiring and does not require a new finite-dimensional symplectic-space carrier. The induced maps of E_B use left composition. Kudla acts on vectors on the right; to compare a native left action with that convention, define x·e=e⁻¹(x). The map on Heisenberg groups is an honest action. On a chosen irreducible representation space, the corresponding intertwiners are only defined up to scalars until the cover is constructed.

## Sources and ownership

The source base consists of the first nine pages of Kudla’s 1996 author notes and the first nine physical pages of Weil’s published 1964 article. The latter are printed pages 143–151. All reading batches contained at most three physical pages. Kudla pages 5, 6 and 9, and Weil printed pages 146, 148 and 149, were also rendered to verify signs and suspect displays. Their hashes, editions and unread ranges are recorded in the packet. Kudla pages 10–110 and Weil printed pages 152–211 have not been read in this part. The bibliography and the introduction’s descriptions of subsequent results do not establish those results.

Kudla I.1 supplies the half-alternating multiplication and symplectic action; I.2 supplies the chosen inducing character and the Schrödinger phase. Weil I.§§3–5 uses a polarized cocycle. The declarations below extract the algebra relating these conventions and reduce it to existing extension machinery. Their general ring-valued statements are elementary extensions of those source calculations, not claims that the local-field texts state each native-library signature verbatim. The sources of each node identify this distinction.

The reviewed AUDIT-15 rows for all eight stages were read before planning. The native factor-set carrier, exact sequence, cochain rescaling and bilinear isometry group resolve more of the algebraic foundations than a keyword search for “Heisenberg” would show. The pinned loop-algebra twoCocycleOfBilinear is a Lie-algebra construction with different hypotheses and is not a supplier for this group cocycle. Every baseline entry below was checked in its actual pinned source; the index was used only to locate declarations.

The existing MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis node supplies Lagrangian complements, extension to a symplectic basis, transitivity and graph coordinates over a field, including characteristic two. MP.0 imports that theorem when constructing a polarization. It owns the Heisenberg coordinate maps and their topological and analytic comparisons. The existing LV.0 symplectic-transvection node and LV.7 Lagrangian-general-position node are also retained with their own scopes. None is re-planned here. The rescope proposal clarifies the algebraic-polarization boundary without changing those node ids.

AL.0 supplies Schwartz–Bruhat and Fourier foundations, AA.1 supplies linear adelic points, SR.0 supplies its early abelian smooth category, SR.2 supplies generic smooth/compact induction and Jacquet functors, and AF.1 supplies real representation foundations. These interfaces are explicit requests for the unfinished stage work. The twelve algebraic nodes do not depend on their analytic outputs. GZ.5–6 retain the Waldspurger and arithmetic/incoherent derivative identities. QM.1 retains classical rank-one theta, eta and Jacobi theory, consuming the metaplectic input. BSD.2 retains twist nonvanishing and local-condition selection. The separate MP.8 part owns genus-two similitudes, Jacobi forms and the BFH cover-specific analysis.

## MP.0 — Algebraic Heisenberg component

All names in the declaration catalogue below belong to TauCeti.Metaplectic.Heisenberg. The module proposed for implementation is TauCeti/RepresentationTheory/Metaplectic/Heisenberg. The prerequisites list contains exactly the node and baseline references in the packet. A short key following MP.0 refers to the declaration node in this catalogue; a baseline reference names existing library mathematics. Proof steps only unfold the specified constructions, use the listed facts and perform ordinary coordinate algebra.

### Bilinear Heisenberg factor set

**bilinearFactorSet** — Construct α_B(x,y)=B(x,y), viewed multiplicatively, as a native normalized factor set on Multiplicative W with coefficients Multiplicative C and trivial action. Its existing extension E_B has multiplication (t,x)(s,y)=(t+s+B(x,y),x+y). The maps t↦(t,0) and (t,x)↦x and their exactness are the native inl, rightHom and groupExtension.

Hypotheses: R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

Construction or proof:

1. Bilinearity gives B(x+y,z)+B(x,y)=B(y,z)+B(x,y+z), the native multiplicative cocycle identity after type tagging and using the trivial action.
2. B(0,0)=0 gives normalization. Supply these two fields to FactorSet; use its existing group instance, exact sequence, section and central inclusion without rebuilding them.

Uses:

- Kudla I.1, p.3; MP.0–1: Provide the exact Heisenberg group and central embedding before choosing a smooth representation.
- Weil I.§§3–4, pp.148–149; MP.0 and MP.8: Support polarized bilinear cocycles and the Heisenberg input to Jacobi semidirect products.
- Kudla I.2, p.6: Allow a lattice domain over Z with coefficient module in the ambient local field; no division operation on the lattice is assumed.

API:

- **bilinearFactorSet_apply** (simp): The additive value of α_B(x,y) is B(x,y).
- **bilinearFactorSet_mul_left** (projection): The coefficient coordinate of pq is t+s+B(x,y).
- **bilinearFactorSet_mul_right** (projection): The quotient coordinate of pq is x+y.

Definition tests:

- **bilinearFactorSet_zero** (degenerate): For B=0 on W=C=Z, the coefficient coordinate of pq is t+s.
- **bilinearFactorSet_cross** (computation): For W=Z² and B(x,y)=x₀y₁, α_B(e₀,e₁)=1 in additive coefficient coordinates.
- **bilinearFactorSet_reversed** (non-example): For the same native matrix form, α_B(e₁,e₀)=0. Replacing B by its transpose fails the two ordered tests.

Acceptance:

- No division by 2 is used; the construction works in characteristic two.
- For C=R and B=½ω, with ω alternating and 2 invertible, the multiplication is exactly Kudla’s convention after swapping the written coordinate order.
- For B=0 the native multiplication is addition on C×W.

Prerequisites: `mathlib:LinearMap.BilinMap`, `mathlib:LinearMap.map_add₂`, `mathlib:Multiplicative`, `mathlib:groupCohomology.IsMulCocycle₂`, `tauceti:TauCeti.trivialMulDistribMulAction`, `tauceti:TauCeti.trivialMulDistribMulAction_smul`, `tauceti:TauCeti.FactorSet`, `tauceti:TauCeti.FactorSet.Extension`, `tauceti:TauCeti.FactorSet.groupExtension`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Inverse in the bilinear extension

**bilinearFactorSet_inv** — For p=(t,x) in E_B, p⁻¹=(−t+B(x,x),−x).

Hypotheses: R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

Construction or proof:

1. Specialize the native inverse coordinate formulas to the trivial action. Bilinearity gives B(x,−x)=−B(x,x); simplify coefficient inversion into additive negation.
2. Alternatively multiply the proposed inverse on either side using the native product formulas; both coordinates are zero.

Acceptance:

- For B=0 the inverse is ordinary negation.
- For B(x,y)=x₀y₁ over Z and p=(0,(2,3)), the inverse has coefficient 6, not 0.
- For an alternating B the diagonal correction vanishes.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `tauceti:TauCeti.FactorSet.Extension.inv_left`, `tauceti:TauCeti.FactorSet.Extension.inv_right`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Commutator in a bilinear central extension

**bilinearFactorSet_commutator** — For p=(t,x),q=(s,y), with commutator convention pqp⁻¹q⁻¹, the commutator is inl(B(x,y)−B(y,x)).

Hypotheses: R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

Construction or proof:

1. Substitute inverse and the native multiplication coordinate formulas into the fourfold product.
2. The quotient coordinate is zero. Expand B(x+y,−x) and B(y,−y) by bilinearity; diagonal terms cancel and the coefficient becomes B(x,y)−B(y,x). Identify the resulting pair with native inl.

Acceptance:

- The coefficient does not depend on t or s.
- For B(x,y)=x₀y₁ and x=e₀,y=e₁ over Z, the commutator is central 1.
- The same triangular form over Z/2Z is noncommutative; the generic bilinear construction still applies.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/inverse`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`, `tauceti:TauCeti.FactorSet.inl`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Center criterion for a bilinear extension

**bilinearFactorSet_mem_center_iff** — An element (t,x) belongs to the center of E_B iff B(x,y)=B(y,x) for every y∈W.

Hypotheses: R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action.

Construction or proof:

1. Use Subgroup.mem_center_iff. Compare (t,x)(s,y) and (s,y)(t,x) using the native product coordinates.
2. The quotient coordinates agree. Cancel t+s in C; this leaves precisely equality of the two bilinear values. For necessity it suffices to take s=0; for sufficiency allow arbitrary s.

Acceptance:

- For symmetric B the entire group is central.
- For B=0 on Z the center strictly contains the coefficient subgroup, detected by (0,1).
- The criterion uses the radical of B−Bᵀ and does not assume 2 invertible.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `mathlib:Subgroup.mem_center_iff`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Commutator for the half-alternating convention

**halfForm_commutator** — Let ω be alternating and let 2 be invertible in R. In E_{½ω}, pqp⁻¹q⁻¹=inl(ω(x,y)).

Hypotheses: R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. ω is alternating; 2 is invertible in R.

Construction or proof:

1. Apply commutator to B=½ω. Native IsAlt.neg_eq gives ω(y,x)=−ω(x,y).
2. The coefficient is ½(ω(x,y)−ω(y,x))=ω(x,y), using invOf_mul_self for 2.

Acceptance:

- For the standard alternating form over Q, the two standard basis vectors have commutator central 1.
- No residue-characteristic restriction occurs: the field Q₂ has invertible 2.
- The convention p⁻¹q⁻¹pq must not be substituted into a calculation using a different bracket convention without checking the resulting identity.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/commutator`, `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.IsAlt.neg_eq`, `mathlib:invOf_mul_self`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Center of the Heisenberg group

**halfForm_center** — If ω is alternating and nondegenerate and 2 is invertible in R, the center of E_{½ω} is exactly the range of its native coefficient injection.

Hypotheses: R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. ω is alternating and nondegenerate; 2 is invertible in R.

Construction or proof:

1. Native centrality of inl gives one inclusion. For a central (t,x), half-form-commutator and injectivity of inl imply ω(x,y)=0 for every y.
2. Apply the separation property in native Nondegenerate to obtain x=0. The element is then inl(t), proving the other inclusion.

Acceptance:

- A zero form on a nonzero module violates nondegeneracy and has a larger center.
- For the zero module the statement still identifies the whole extension with its coefficient subgroup.
- No finite-dimensionality, topology, or field hypothesis is used in this algebraic theorem.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/half-form-commutator`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:Subgroup.mem_center_iff`, `tauceti:TauCeti.FactorSet.inl_injective`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Extension isomorphism induced by an isometry

**extensionIsometry** — For scalar forms B on W and D on W′ and a native isometry e:B≃D, construct the group isomorphism E_B≃E_D sending (t,x) to (t,e(x)).

Hypotheses: R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

Construction or proof:

1. Use the underlying linear equivalence on the quotient coordinate and identity on the coefficient coordinate, with e inverse giving the inverse map.
2. Preservation of multiplication follows from linear additivity and native IsometryEquiv.map_app: D(e(x),e(y))=B(x,y).

Uses:

- Kudla I.1, p.3; MP.0: Transport Heisenberg coordinates under symplectic isometries.
- Kudla I.2, pp.7–9; MP.0–1: Compare polarizations and conjugate induced models while preserving their central character.

API:

- **extensionIsometry_apply** (projection): The coordinate formula is (t,x)↦(t,e(x)).
- **extensionIsometry_refl** (functoriality): The identity native isometry gives the identity group isomorphism.
- **extensionIsometry_trans** (functoriality): Extension of the composite f∘e is extension of f composed with extension of e, with the same order as native IsometryEquiv.trans.
- **extensionIsometry_inl** (compatibility): Extension of e sends inl_B(t) to inl_D(t).

Definition tests:

- **extensionIsometry_identity** (computation): The identity isometry of the zero form on Z fixes (3,4).
- **extensionIsometry_negation** (computation): Negation preserves any scalar bilinear form on Z and sends (3,4) to (3,−4), preserving the coefficient 3.
- **extensionIsometry_inverse** (compatibility): Extension of the native inverse isometry undoes extension of e, including when the underlying modules differ.

Acceptance:

- Different underlying modules are allowed.
- The map fixes the native central injection pointwise.
- Applied to half an alternating form, this supplies the symplectic automorphisms in Kudla p.3.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `mathlib:LinearMap.BilinForm.IsometryEquiv`, `mathlib:LinearMap.BilinForm.IsometryEquiv.map_app`, `mathlib:LinearMap.BilinForm.IsometryEquiv.symm`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Isometry action on the Heisenberg group

**extensionIsometryAction** — For a scalar form B, construct a group homomorphism from the native TauCeti.BilinForm.isometryGroup B to automorphisms of E_B, sending e to (t,x)↦(t,e(x)).

Hypotheses: R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

Construction or proof:

1. Use the native equivalence from the isometry subgroup to self-isometries and the preceding extension construction.
2. Verify the identity and multiplication laws by the coordinate formula, using the left-composition convention of linear automorphisms. No projective scalar ambiguity occurs in this action on the Heisenberg group.

Uses:

- Kudla I.1, pp.3–4; MP.1: Supply the group automorphism used to twist the irreducible Heisenberg representation before choosing an intertwiner.
- MetaplecticAutomorphicForms:MP.8: Supply the symplectic part of a Jacobi action. The similitude action that scales the center is an additional MP.8 obligation.

API:

- **extensionIsometryAction_apply** (projection): The group element e acts by (t,x)↦(t,e(x)).
- **extensionIsometryAction_inl** (compatibility): Every e fixes each inl(t).
- **extensionIsometryAction_injective** (characterisation): The action homomorphism is injective: evaluation on all (0,x) determines e.

Definition tests:

- **extensionIsometryAction_identity** (computation): The native group identity for the zero form on Z fixes (3,4).
- **extensionIsometryAction_negation** (non-example): The negation element of the native isometry group of the zero form on Z sends (3,4) to (3,−4); a constant identity action fails.
- **extensionIsometryAction_center** (compatibility): Every native isometry-group element fixes the native coefficient injection, for all t.

Acceptance:

- This is an honest action on E_B; it does not construct an honest symplectic action on an irreducible representation space.
- The action is faithful, including degenerate forms: equality on (0,x) recovers the linear automorphism.
- Kudla uses a right action; translate it by x·e=e⁻¹(x) before comparing multiplication order.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/isometry-extension`, `tauceti:TauCeti.BilinForm.isometryGroup`, `tauceti:TauCeti.BilinForm.mem_isometryGroup`, `tauceti:TauCeti.BilinForm.isometryGroupEquivIsometryEquiv`.

Source: Kudla96, I.1, p.3, Heisenberg group and symplectic action. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

### Quadratic correction between Heisenberg cocycles

**polarization_cocycle** — For scalar B and invertible 2, put q(x)=½B(x,x) and ω=B−Bᵀ. Then ½ω(x,y)+q(x+y)=B(x,y)+q(x)+q(y).

Hypotheses: R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. 2 is invertible in R.

Construction or proof:

1. Expand B(x+y,x+y)=B(x,x)+B(x,y)+B(y,x)+B(y,y) by bilinearity.
2. Collect terms and cancel the transpose terms; use ½·2=1. This is exactly the rescaling identity for α=½(B−Bᵀ), β=B and cochain q.

Acceptance:

- For B(x,y)=x₀y₁ and x=e₀,y=e₁ over Q, the left side is ½+½=1.
- The plus sign before q(x+y) is required for the forward coordinate map t↦t+q(x).
- The identity holds for degenerate and symmetric forms.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `mathlib:LinearMap.BilinForm.flip`, `mathlib:LinearMap.BilinForm.flip_apply`, `mathlib:invOf_mul_self`.

Source: Weil64, I.§§3–5, pp.148–150; compare Kudla I.1–2, pp.3 and 7. Weil uses the polarized cocycle pairing the first primal coordinate with the second dual coordinate. The displayed algebra derives the exact additive coboundary relating it to Kudla’s half-alternating convention; neither source is claimed to state this native-library formulation verbatim.

### Polarized Heisenberg coordinates

**polarizationEquiv** — For scalar B and invertible 2, construct E_{½(B−Bᵀ)}≃E_B by (t,x)↦(t+½B(x,x),x), with inverse (t,x)↦(t−½B(x,x),x). This is a specialization of the native equivalence of rescaled extensions.

Hypotheses: R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. 2 is invertible in R.

Construction or proof:

1. Use polarization-cocycle as the cochain identity required by native FactorSet.rescaleEquiv, under the trivial action.
2. Extract its underlying group isomorphism. Native forward and inverse rescaling formulas give the two coordinate descriptions; q(0)=0 shows compatibility with the central inclusion.

Uses:

- Weil I.§4, p.149; Kudla I.2 Lemma 2.2, p.7: Reconcile the polarized translation/modulation convention with the half-alternating Heisenberg law and its ½ω(x,y) phase.
- MetaplecticAutomorphicForms:MP.0–2: Fix the sign and coordinate dictionary before proving Fourier and generator operator identities.

API:

- **polarizationEquiv_apply** (projection): The forward coefficient is t+½B(x,x), and the quotient coordinate remains x.
- **polarizationEquiv_symm_apply** (projection): The inverse coefficient is t−½B(x,x), and the quotient coordinate remains x.
- **polarizationEquiv_inl** (compatibility): The equivalence fixes the native coefficient injection.

Definition tests:

- **polarizationEquiv_zero** (degenerate): For B=0 on Q, the equivalence fixes (3,4).
- **polarizationEquiv_cross** (computation): For B(x,y)=x₀y₁ on Q², the image of (0,(2,3)) is (3,(2,3)).
- **polarizationEquiv_sign** (non-example): For the same B, the inverse image of (0,(2,3)) is (−3,(2,3)); using a plus sign for both directions fails.

Acceptance:

- For the standard polarization W=X⊕Y with B((x,y),(x′,y′))=ω(x,y′), the correction is ½ω(x,y).
- This construction assumes a chosen polarized bilinear representative; existence of a Lagrangian complement belongs to the existing LV.3 node.
- It changes group coordinates. It does not define a Fourier transform or prove an equivalence of Schrödinger representations.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/polarization-cocycle`, `tauceti:TauCeti.FactorSet.rescaleEquiv`, `tauceti:TauCeti.FactorSet.rescaleEquiv_apply`, `tauceti:TauCeti.FactorSet.rescaleEquiv_symm_apply`.

Source: Weil64, I.§§3–5, pp.148–150; Kudla I.2 Lemma 2.2, p.7. Weil’s polarized cocycle and Kudla’s half-pairing Schrödinger phase determine this quadratic change of coordinates. The construction is proved directly with the native rescaling equivalence.

### Criterion for the section-trivial central character

**centralCharacter_multiplicative_iff** — For any group A and homomorphism χ:Multiplicative C→A, the function E_B→A given by (t,x)↦χ(t) preserves multiplication iff χ(B(x,y))=1 for every x,y∈W.

Hypotheses: R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action. A is any group; χ is a group homomorphism from Multiplicative C to A.

Construction or proof:

1. Necessity: test multiplicativity on (0,x) and (0,y). Both proposed character values are one, and the product has coefficient B(x,y).
2. Sufficiency: apply χ to t+s+B(x,y), use its homomorphism law, and use χ(B(x,y))=1. Its value at the identity is already one. No commutativity of A is required.

Acceptance:

- For B=0 every χ satisfies the criterion.
- For B(x,y)=x₀y₁ over Z and χ the identity on Multiplicative Z, the proposed scalar projection is not multiplicative.
- For B=½ω restricted to a lattice, killing ω on the lattice is insufficient unless χ also kills ½ω; the Q₂ counterexample is recorded in E-MP0-3.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `tauceti:TauCeti.FactorSet.Extension.mul_left`.

Source: Kudla96, I.2, p.6, the asserted extension ψ_Y; corrected statement. The source formula requires exactly the cocycle-killing condition proved here. For an isotropic F-subspace it holds because the form itself vanishes; character-self-duality of an arbitrary additive subgroup alone does not suffice.

### Section-trivial extension of a central character

**centralCharacter** — Given χ:Multiplicative C→A with χ(B(x,y))=1 for all x,y, construct the group homomorphism E_B→A, (t,x)↦χ(t). It extends χ on native inl and is trivial on the native canonical section.

Hypotheses: R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0,0). The coefficient action is the native trivial action. A is any group; χ:Multiplicative C→A is a group homomorphism, and χ(B(x,y))=1 for every x,y.

Construction or proof:

1. Use central-character-criterion to establish multiplicativity and the homomorphism law for χ to establish the identity value.
2. Use the coordinate formula to check the two prescribed restrictions. For uniqueness among homomorphisms satisfying both restrictions, factor each p as inl(p.left) times canonicalSection(p.right) using the native decomposition theorem.

Uses:

- Kudla I.2, pp.6–7; MP.0: Supply the inducing character of H(Y) when Y is an isotropic subspace, or when an explicit splitting condition has been established.
- Kudla I.1 Theorem 1.1, p.3; MP.1: Specify the central character of the chosen model. This construction does not prove irreducibility or Stone–von Neumann uniqueness.

API:

- **centralCharacter_apply** (projection): At (t,x) the homomorphism evaluates to χ(t).
- **centralCharacter_inl** (compatibility): Its restriction along native inl is χ.
- **centralCharacter_canonicalSection** (simp): Its value on each native canonicalSection(x) is one.
- **centralCharacter_unique** (universal-property): If ρ:E_B→A agrees with χ on native inl and is one on every native canonicalSection(x), then ρ equals centralCharacter B χ. Both conditions are required.

Definition tests:

- **centralCharacter_value** (computation): For B=0 on Z and χ the identity of Multiplicative Z, the value at (3,4) is additive 3.
- **centralCharacter_trivial** (degenerate): For every bilinear B, the trivial character into Multiplicative Z gives the trivial homomorphism on E_B.
- **centralCharacter_zero** (compatibility): For B=0 on Z and χ the native identity homomorphism, the value at the native extension identity is one.

Acceptance:

- Uniqueness is asserted only with both the central restriction and triviality on the chosen section.
- The section need not itself be a homomorphism; the cocycle condition makes its image trivial under this character.
- An arbitrary extension of the same χ may be multiplied by a nontrivial character of the quotient.

Prerequisites: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/central-character-criterion`, `tauceti:TauCeti.FactorSet.inl`, `tauceti:TauCeti.FactorSet.canonicalSection`, `tauceti:TauCeti.FactorSet.inl_mul_canonicalSection`.

Source: Kudla96, I.2, p.6, extension ψ_Y; corrected normalization and hypothesis. This is the distinguished character intended in the induced model, with the missing cocycle hypothesis and the normalization needed for uniqueness made explicit.

## The polarized convention and the inducing character

For W=X⊕Y with an isotropic decomposition, write an element as x+y and set B((x,y),(x′,y′))=ω(x,y′). Then B−Bᵀ is the original alternating form and the quadratic correction is q(x+y)=½ω(x,y). The forward coordinate map from the half-alternating model to the polarized model adds q to the coefficient. For the standard two-dimensional example, B((a,b),(a′,b′))=ab′, so q(2,3)=3. This single computation detects both a missing factor of two and an incorrect sign in the equivalence.

Weil’s printed p.149 defines translation/modulation by applying translation and then evaluating the dual character on the original variable. Composing the two operators contributes the pairing of the first translation coordinate with the second modulation coordinate. That is the polarized B used here, rather than its transpose. Kudla’s Lemma 2.2 on p.7 contributes ψ(t+ω(x₀,y)+½ω(x,y)) and translation x₀↦x₀+x. The phase ½ω(x,y) agrees with the forward coordinate correction. The actual function spaces, continuity and integration arguments still have to be constructed; this agreement settles the algebraic convention they must use.

The proposed character (t,y)↦ψ(t) on H(Y) is a homomorphism exactly when ψ kills the restricted cocycle. For an isotropic F-subspace Y that cocycle is zero, so the criterion is automatic. A closed additive subgroup can instead be self-dual for the character pairing without being isotropic as an F-subspace. In that situation ψ(ω(y,y′))=1 does not imply ψ(½ω(y,y′))=1. The distinction is essential at a dyadic place and remains compatible with the fact that 2 is invertible in Q₂ itself.

Even when the criterion holds, a central character need not have only one extension. Multiplying the section-trivial extension by a quotient character gives another extension. Thus the centralCharacter API specifies both its restriction on inl and its value on canonicalSection. The native factorization of every group element proves uniqueness with these two restrictions. It does not invoke Stone–von Neumann: that theorem concerns irreducible representations with a fixed central character, rather than one-dimensional extensions to an isotropic subgroup.

## Remaining stage contracts

These are exact continuation obligations. The stage labels and dependencies are retained. MP.0 has the algebraic declarations above; MP.1–2 have a read source boundary but no new representation-theoretic nodes; MP.3–7 have unread source proofs. None of the eight stages is marked closed.

### MP.0 — Symplectic and Heisenberg groups with topology

Coverage: **partial**. Existing stage prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.0`.

1. Topology and polarizations: equip the native extension carrier with the product topology, prove continuity of multiplication/inversion and of the symplectic action, local compactness over a finite-dimensional local-field module, and compatibility of Haar normalization with AL.0. Import existence of Lagrangian complements and symplectic bases from MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis; do not duplicate it. Construct the resulting concrete coordinate maps and their topological compatibility. The native isometry group already exists over a commutative semiring; no new symplectic-space structure is needed.
2. Schrödinger models: construct the actual smooth induced space of Kudla I.2 pp.6–7, its compact-mod-H(Y) support identification with Schwartz–Bruhat functions on a complementary X, translation/modulation formula and central character. Apply the corrected character condition in E-MP0-2/3. Split Lemma 2.1 into its support, irreducibility and admissibility assertions only after reading its MVW proof; the citation on p.7 is not that proof. Construct the archimedean Hilbert and smooth-vector realizations using their actual topological carriers.
3. Source continuation: read Kudla p.10 onward to finish Proposition 2.3, the normalization of its intertwining integral and the measure choices. Pages 1–9 also introduce change-of-character/scaling, contragredients, orthogonal-sum central quotients, tensor products, polarization intertwiners and Levi/unipotent formulas; these remain unplanned and must be split into declarations. Read Weil physical p.10/printed152 onward with its positive Fourier convention. The current polarizationEquiv is the algebraic coordinate change, not the integral change-of-model operator.

### MP.1 — Stone–von Neumann and the metaplectic extension

Coverage: **partial**. Existing stage prerequisites: `MetaplecticAutomorphicForms:MP.0`.

1. Kudla Theorem 1.1 p.3 states Stone–von Neumann in the nonarchimedean smooth category for a nontrivial continuous additive character; its proof is referred to MVW Chapter 2 I.2 pp.28–31 and is unread. Obtain that proof or a freely readable replacement with matching hypotheses. Separate the archimedean unitary statement and smooth-vector comparison. Import early SR.0 and SR.2 for the ambient smooth category and induction.
2. Construct intertwining spaces, their one-dimensional scalar ambiguity and composition from the actual irreducible Heisenberg model. Use native FactorSet and group-extension/cohomology facilities for the algebraic packaging, importing generic central-extension theory from its existing owner after checking exact statements. Prove continuity and the comparison of the resulting scalar C× extension with the normalized μ₂ cover. The honest action on the Heisenberg group in this packet is not a splitting on the representation space.
3. Read the normalization argument in Kudla I and Weil’s double-cover reduction. Weil’s introduction assigns the reduction to Chapter IV; Chapters I–III alone do not establish it. Verify the chosen cocycle, coboundary independence, nontriviality in the stated dimension range, and genuine central −1 action.

### MP.2 — Weil index and explicit operator formulas

Coverage: **partial**. Existing stage prerequisites: `MetaplecticAutomorphicForms:MP.1`.

1. Read and decompose the Weil-index definitions and proofs beyond the present source boundary: oscillatory integrals, nondegeneracy, self-dual measure, orthogonal sums, scaling, discriminant and Hilbert-symbol factors, with the exact quadratic-versus-bilinear convention. The reviewed audit routes generic Hilbert-symbol theory to QuadraticFormInvariants Layer 6C; verify that supplier before importing its precise statement.
2. Starting from the actual Schrödinger representation, finish Kudla Proposition 2.3 and compute the Levi, unipotent and Fourier generators, including absolute-determinant square roots and signs. Prove relations and agreement with MP.1, then change-of-character and contragredient formulas. Test an odd place, Q₂ and R with nontrivial central character; no arbitrary global square-root choice supplies these laws.

### MP.3 — Dual pairs and local theta modules

Coverage: **not_read**. Existing stage prerequisites: `MetaplecticAutomorphicForms:MP.2`.

1. Kudla Chapters II–IV are unread. Extract the orthogonal–symplectic dual-pair embeddings, restriction and splitting of the cover with dimension/parity and auxiliary-character hypotheses; obtain an additional source for the unitary pairs that the notes do not cover. Define big theta coinvariants and justified small theta quotients on actual smooth representations.
2. Read every scoped admissibility, finite-length, see-saw, Jacquet-filtration and first-occurrence proof, recording its field and residual-characteristic range. Import generic induction and Jacquet functors from SR.2. The author introduction says these notes are incomplete; a full Howe-duality theorem in all residual characteristics must have a separate verified source.

### MP.4 — Adelic cover and global Weil representation

Coverage: **not_read**. Existing stage prerequisites: `MetaplecticAutomorphicForms:MP.3`.

1. Construct distinguished splittings at almost all integral places, the restricted product of local covers and its explicit finite central quotient. Import the linear adelic points from AA.1 and the actual restricted tensor product of Schwartz spaces from AL.0.
2. Read and decompose the global Weil-index product formula and rational splitting, then construct the global genuine Weil representation and prove independence of local choices and character compatibility. Neither the generic restricted-product type nor the unrestricted product of local μ₂ covers is this adelic cover. The relevant global proofs in Weil are unread.

### MP.5 — Theta kernels, convergence and automorphic spaces

Coverage: **not_read**. Existing stage prerequisites: `AutomorphicFormsOnReductiveGroups:AF.1`, `MetaplecticAutomorphicForms:MP.4`.

1. Construct the theta sum on rational vectors of the actual global Schwartz space, with absolute and locally uniform convergence, smoothness, rational invariance via AL.0 Poisson summation, moderate growth and genuine central character. Supply estimates permitting every sum/integral/differentiation interchange.
2. Construct genuine cusp and Eisenstein spaces on the cover, canonical unipotent splittings, constant terms and Fourier–Whittaker expansions. Import AF.1 real representation foundations only where applicable and prove their compatibility with the cover. State the theta-lift convergence range; wherever it fails, a source-pinned truncation or regularization construction and its properties are required. These source proofs are unread.

### MP.6 — Local–global comparison and reusable theta integrals

Coverage: **not_read**. Existing stage prerequisites: `MetaplecticAutomorphicForms:MP.5`.

1. Prove pure-tensor factorization and the exact local integral decompositions with self-dual measures, ramified test functions and central characters. Construct spectral projection and see-saw identities under proved convergence or a named regularization.
2. Export the coherent quadratic-character and quaternionic-norm-form instances to GrossZagierAndArithmeticHeights:GZ.5 and the coherent/incoherent local sections and functional-equation conventions to GZ.6. Those stages, whose descriptions were read, retain the Waldspurger and arithmetic derivative identities. Verify the separate AutomorphicCongruences:L2s consumer contract. The local/global comparison proofs and these specializations are unread.

### MP.7 — Half-integral weight, metaplectic Fourier coefficients and twists

Coverage: **not_read**. Existing stage prerequisites: `MetaplecticAutomorphicForms:MP.6`.

1. Construct the actual rank-one metaplectic cover comparison with classical half-integral-weight forms, its congruence subgroups and multiplier system. Existing QSeriesPartitionsAndMockModularForms:QM.1 owns the classical theta/eta/rank-one Jacobi development and consumes the metaplectic input; do not create a reverse dependency merely to reuse its consumer theorem.
2. Identify and read the exact BFH/Friedberg–Hoffstein rank-one cover-specific papers recorded by BSD.2. Define their genuine Eisenstein and Whittaker kernels, ramified characters/test functions and Fourier/Euler-factor identities. Keep RankZeroOneBSD:BSD.2 responsible for the double-Dirichlet-series continuation, residues, local-condition selection and nonvanishing; keep genus-two similitudes and Jacobi analysis in MP.8. No source-complete rank-one kernel claim is made.

## Requested interfaces

**AutomorphicLFunctionsAndLocalFactors:AL.0** supplies Supply the actual local Schwartz–Bruhat spaces, local additive self-duality, Fourier inversion and character/measure changes with fixed conventions, and the adelic restricted tensor product and Poisson theorem. MP.0 owns its Heisenberg action and induced-model comparison; MP.2 owns Weil-index normalization; MP.4–6 own cover compatibility and theta-integral estimates. The request includes the holomorphic parameter estimates needed where analytic interchanges are used. Consumers: MetaplecticAutomorphicForms:MP.0, MetaplecticAutomorphicForms:MP.2, MetaplecticAutomorphicForms:MP.4, MetaplecticAutomorphicForms:MP.5, MetaplecticAutomorphicForms:MP.6.

**SmoothRepresentationsOfLocalGroups:SR.0** supplies Supply the early abelian smooth representation category, smooth-vector functor, invariant submodules and admissibility with the stated coefficient hypotheses. The SR.0:abelian-category construction is sufficient here; its separate derived enhancement is not a prerequisite. MP.0–3 retain the actual Heisenberg and oscillator constructions. Consumers: MetaplecticAutomorphicForms:MP.0, MetaplecticAutomorphicForms:MP.1, MetaplecticAutomorphicForms:MP.3.

**SmoothRepresentationsOfLocalGroups:SR.2** supplies Supply smooth induction from a closed subgroup, compact induction with compact support modulo that subgroup, their precise reciprocity and induction-in-stages laws, and the generic Jacquet/normalized-modulus interfaces. Apply these to H(Y)⊂H(W) only after constructing the topology and valid inducing character; a lattice self-dual for ψω does not by itself supply ψ(½ω)=1. Consumers: MetaplecticAutomorphicForms:MP.0, MetaplecticAutomorphicForms:MP.1, MetaplecticAutomorphicForms:MP.3.

**AdelicAlgebraicGroups:AA.1** supplies Supply model-independent adelic points, local projections and compatibility with products, centers and closed subgroups, together with the full-adelic rational embedding. MP.4 constructs and proves the central quotient and rational splitting of its own cover; these are not outputs of the linear-group functor. Consumers: MetaplecticAutomorphicForms:MP.4.

**AutomorphicFormsOnReductiveGroups:AF.1** supplies Supply the actual real (g,K)-module, smooth-vector/globalization and infinitesimal-character interfaces under their finite-length/admissibility hypotheses. MP.0 and MP.5 must construct their oscillator and genuine automorphic carriers and justify applying these interfaces to the metaplectic group; the linear-group theory does not itself construct the cover. Consumers: MetaplecticAutomorphicForms:MP.0, MetaplecticAutomorphicForms:MP.5.


## Source findings

These four findings concern the specified 1996 author copy. They await independent review. No addressing correction was located; this does not assert that no correction exists. No mistake was found in the read range of Weil’s article.

**MetaplecticAutomorphicForms/E-MP0-1** (misprint; affects the proof). 1996 author copy, I.1, p.5, orthogonal-sum paragraph. The printed passage is “W = W₁ + W₁”. Read W=W₁+W₂, the orthogonal direct sum used in the map H(W₁)×H(W₂)→H(W). The immediately described map sends ((w₁,t₁),(w₂,t₂)) to (w₁+w₂,t₁+t₂) and has the anti-diagonal scalar kernel. Repeating W₁ is inconsistent with both its domain and the orthogonal-sum assumption.

**MetaplecticAutomorphicForms/E-MP0-2** (error; affects a stated result). 1996 author copy, I.2, p.6, character extension paragraph. The printed passage is “unique extension”. The displayed character, when multiplicative, is the distinguished extension trivial on the chosen section Y→H(Y). It is unique only after imposing that normalization; the cocycle condition must also hold as in E-MP0-3. Take a nonzero isotropic F-line Y in a symplectic plane and nontrivial ψ. Since ω restricts to zero on Y, ψ(t) and ψ(t+ℓ(y)) are distinct characters of H(Y) extending the same central ψ, for any nonzero F-linear functional ℓ:Y→F. Thus uniqueness among all extensions is false even in the simplest polarized case.

**MetaplecticAutomorphicForms/E-MP0-3** (error; affects a stated result). 1996 author copy, I.2, p.6, formula for ψ_Y on a closed character-self-dual additive subgroup. The printed passage is “ψ_Y(y, t) = ψ(t)”. For this formula require ψ(½ω(y,y′))=1 for all y,y′∈Y. It holds for an isotropic F-subspace. For a general closed self-dual additive subgroup, construct a valid splitting character or quadratic refinement and prove its multiplication law; do not infer the displayed formula from ψω-self-duality alone. Let F=Q₂, W=F² with ω((x,y),(x′,y′))=xy′−yx′, Y=Z₂², and ψ have kernel Z₂. Then Y equals its annihilator for ψω. The elements (e₀,0) and (e₁,0) both have proposed value 1, but their product has central coordinate ½ and value ψ(½)=−1. This is a failure of the printed formula, not a claim that a correctly chosen lattice model cannot exist.

**MetaplecticAutomorphicForms/E-MP0-4** (misprint; affects the proof). 1996 author copy, I.2, p.9, equivariance display for I_{Y₁,Y₂}. The printed passage is “A_{Y₁,Y₂}(f)”. Use I_{Y₁,Y₂}(f) on the right side of the equivariance identity, matching the integral operator defined immediately above. The paragraph defines I_{Y₁,Y₂}:S_{Y₁}→S_{Y₂}, then asserts its H-equivariance. No operator A indexed by this pair has been defined; the same intertwining integral is required on both sides.

Correction search: 2026-09-27: author research page https://www.math.utoronto.ca/skudla/ssk.research.html lists the 1996 notes; no erratum entry found. 2026-09-27: searches for Kudla castle.pdf corrections, Kudla local theta 1996 errata, unique Heisenberg character extension, and dyadic self-dual lattice model corrections found no correction addressing these passages. A 2002-labelled mirror was a search lead, not a version read or collated. These are findings about the specified unpublished author copy. No claim is made about a separate published version or about an exhaustive correction search.

## Baseline and validation

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their declarations were read from byte-verified source files. The following references describe the actual supplier statements, including boundary and testing declarations.

- `tauceti:TauCeti.FactorSet`: Normalized multiplicative two-cocycle for a specified coefficient action.
- `tauceti:TauCeti.FactorSet.Extension`: Native carrier with left coefficient and right group coordinates; its group instance uses the factor set.
- `tauceti:TauCeti.FactorSet.Extension.mul_left`: The coefficient coordinate of a product is x.left·(x.right acting on y.left)·α(x.right,y.right).
- `tauceti:TauCeti.FactorSet.Extension.mul_right`: The quotient coordinate of a product is x.right·y.right.
- `tauceti:TauCeti.FactorSet.Extension.inv_left`: The coefficient coordinate of the inverse is the native factor-set inverse formula.
- `tauceti:TauCeti.FactorSet.Extension.inv_right`: The quotient coordinate of the inverse is x.right inverse.
- `tauceti:TauCeti.FactorSet.inl`: Canonical injection of coefficients into the extension.
- `tauceti:TauCeti.FactorSet.inl_injective`: The coefficient injection is injective.
- `tauceti:TauCeti.FactorSet.rightHom`: Canonical projection of the extension to its quotient group.
- `tauceti:TauCeti.FactorSet.range_inl_eq_ker_rightHom`: Exactness at the extension.
- `tauceti:TauCeti.FactorSet.rightHom_surjective`: Surjectivity of the quotient projection.
- `tauceti:TauCeti.FactorSet.groupExtension`: Packages the preceding native maps as a group extension.
- `tauceti:TauCeti.FactorSet.canonicalSection`: Canonical set-theoretic section with coefficient coordinate one; it is not generally a homomorphism.
- `tauceti:TauCeti.FactorSet.inl_mul_canonicalSection`: Every extension element is its central coordinate times the section of its quotient coordinate.
- `tauceti:TauCeti.FactorSet.inl_range_le_center`: For the trivial coefficient action the coefficient subgroup lies in the center.
- `tauceti:TauCeti.FactorSet.rescaleEquiv`: A cochain satisfying α(g,h)x(gh)=β(g,h)(g acting on x(h)·x(g)) gives an equivalence of group extensions, multiplying the coefficient by x(g).
- `tauceti:TauCeti.FactorSet.rescaleEquiv_apply`: Coordinate formula for the forward rescaling equivalence.
- `tauceti:TauCeti.FactorSet.rescaleEquiv_symm_apply`: The inverse equivalence divides the coefficient by the cochain.
- `tauceti:TauCeti.trivialMulDistribMulAction`: The existing trivial action through the identity automorphism, installed only locally.
- `tauceti:TauCeti.trivialMulDistribMulAction_smul`: Every group element acts identically under that action.
- `mathlib:LinearMap.BilinMap`: Bilinear maps W×W→C over a common scalar ring, allowing the coefficient module to differ from W and R.
- `mathlib:LinearMap.BilinForm`: The scalar-valued specialization of the native bilinear-map type.
- `mathlib:LinearMap.map_add₂`: Additivity in the first input with both arguments displayed; second-input additivity is native linear-map additivity.
- `mathlib:LinearMap.domRestrict₁₂`: Restrict both arguments of a bilinear map to a submodule, keeping its coefficient module.
- `mathlib:LinearMap.restrictScalars₁₂`: Restrict the scalar ring on a bilinear map without changing its values.
- `mathlib:LinearMap.BilinForm.IsAlt`: The native alternating predicate: the diagonal values vanish.
- `mathlib:LinearMap.BilinForm.IsAlt.neg_eq`: An alternating bilinear form satisfies −B(y,x)=B(x,y), over the stated ring hypotheses.
- `mathlib:LinearMap.BilinForm.Nondegenerate`: The native nondegeneracy predicate, including separation in each variable.
- `mathlib:LinearMap.BilinForm.flip`: The native transposed bilinear form.
- `mathlib:LinearMap.BilinForm.flip_apply`: The transpose evaluates to B(y,x).
- `mathlib:LinearMap.BilinForm.IsometryEquiv`: A linear equivalence between two modules preserving the given scalar-valued forms.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.map_app`: Exact equality expressing preservation of the forms.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.refl`: Identity isometry.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.symm`: Inverse isometry.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.trans`: Composition of isometries.
- `tauceti:TauCeti.BilinForm.isometryGroup`: Subgroup of linear automorphisms preserving a bilinear form; available over any commutative semiring, without a new symplectic-space wrapper.
- `tauceti:TauCeti.BilinForm.mem_isometryGroup`: Membership is preservation of every bilinear value.
- `tauceti:TauCeti.BilinForm.isometryGroupEquivIsometryEquiv`: Equivalence from the subgroup carrier to native self-isometries.
- `mathlib:groupCohomology.IsMulCocycle₂`: The multiplicative cocycle identity used by FactorSet.
- `mathlib:Subgroup.mem_center_iff`: An element belongs to the center iff it commutes with every group element.
- `mathlib:Matrix.toBilin'`: The matrix bilinear form x,y↦Σ xᵢMᵢⱼyⱼ, used directly in the tests.
- `mathlib:Matrix.toBilin'_apply`: Explicit finite-sum evaluation of that matrix form.
- `mathlib:Multiplicative`: Existing multiplicative view of an additive group; no new additive central-extension type is needed.
- `mathlib:invOf_mul_self`: The chosen inverse of an invertible element multiplied by it is one.


The suggested file contains the twelve named declarations, all seventeen API signatures and fifteen definition examples. Four additional examples express acceptance conditions: the standard rational commutator, the characteristic-two triangular cocycle, failure of the unrestricted coefficient projection to be a character, and the larger center of a zero form. Three inspection commands identify the native group-extension, rescaling and isometry-group declarations. These examples elaborate with proof placeholders; none is reported as a proved theorem.

The file was elaborated with Lean 4.34.0-rc2 at the recorded library pins: exit zero, no errors and forty-eight proof-placeholder warnings. All 2,373 transitive Mathlib source imports were verified against the pin and the matching cache sources; eight transitive Tau Ceti modules were freshly compiled. No arbitrary predicate stands in for an unavailable analytic carrier. The packet has five construction nodes, five lemma nodes, two theorem nodes, seventeen API items, fifteen definition tests, five planets, forty-four baseline declarations, eight stage gaps and five requests. The five planets are the Heisenberg group, its center, the symplectic action, polarized Heisenberg group and Heisenberg central character.

The first implementation acceptance boundary is algebraic: multiplication, inverse, commutator, center, group-action composition, polarization signs and the cocycle criterion must all hold on the native carriers. The stage acceptance boundary is larger: actual locally compact and smooth representations, correctly normalized Fourier operators at odd places, Q₂ and R, a genuine central −1 action, the rational adelic splitting, and convergent or rigorously regularized theta integrals with matching consumer measures. Passing the first boundary does not establish the second.

## Bibliography and read boundary

**Stephen S. Kudla.** [Notes on the local theta correspondence](https://www.math.utoronto.ca/skudla/castle.pdf). Unpublished author notes; introduction dated July 6, 1996; 110-page author copy. Read 2026-09-27. SHA-256: `800ed01b22fa6104a3292a8b2ef124cd69781a6904f626f71fcf2a30a9af8cdd`. Physical/printed pages 1–9 read completely in batches of at most three pages. Pages 5, 6 and 9 also rendered to check the formulas and source findings. Pages 10–110 are unread. Proposition 2.3 starts on p.8 and its proof continues beyond the read boundary. References to MVW do not constitute reading its proofs.

**André Weil.** [Sur certains groupes d’opérateurs unitaires](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf). Acta Mathematica 111 (1964), 143–211; published scan, DOI 10.1007/BF02391012. Read 2026-09-27. SHA-256: `22df47cb98307aa77c46028cf5575eeb1d3524950dbdadb9c0c21890966039d2`. Physical pages 1–9, printed 143–151, read completely in batches of at most three pages. Physical pages 4, 6 and 7, printed 146, 148 and 149, also rendered to verify the quadratic-character, cocycle and operator conventions. Physical pages 10–69, printed 152–211, are unread. Introductory descriptions of the chapters do not supply their proofs.

The campaign also requires the exact BFH and Friedberg–Hoffstein source routes used by BSD.2. Their rank-one proofs are not read in this part. The separate MP.8 work reads specified portions of the Inventiones 1990 genus-two paper and records its own findings. MVW is cited by Kudla for the smooth Stone–von Neumann and induced-model proofs but was not obtained or read here. These source obligations are part of the coverage gaps above.
