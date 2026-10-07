# Metaplectic groups, oscillator representations and theta kernels

This part specifies MP.0–MP.7. It starts with the native bilinear Heisenberg extension and develops the local oscillator, metaplectic cover and theta correspondence, then the adelic cover, automorphic theta kernels, Siegel–Weil and Rallis comparisons, and rank-one half-weight interfaces. MP.8 owns the genus-two BFH arithmetic kernel and its Whittaker/Euler/continuation analysis.

The packet is **complete as a target-level planning pass**: all eight stages are planned, and each prerequisite chain reaches a checked library declaration, an exact external node, a requested supplier stage or an explicit gap. No stage is closed. The inherited twelve algebraic Heisenberg nodes retain their stronger algebraic closure; the remaining analytic and representation-theoretic plans have the source and signature boundaries listed below. Every implementation status is **unchecked**. The suggested file proposes native signatures with proof placeholders; the mathematical statements in this document are definitive.

## Conventions

For a commutative ring R, additive R-modules W,C and a native bilinear map B:W×W→C, use Tau Ceti’s existing FactorSet.Extension with its trivial coefficient action. Write E_B for that carrier, in coefficient-first coordinates (t,x), with product (t,x)(s,y)=(t+s+B(x,y),x+y). Kudla writes the space coordinate first. Native inl, rightHom, canonicalSection and rescaleEquiv supply the group-extension machinery. A bilinear cocycle may be defined in characteristic two; the half-alternating specialization requires 2 invertible and uses B=½ω. The latter is valid over Q₂: residue characteristic two does not obstruct this algebraic formula. The displayed section-trivial inducing character additionally requires the half-pairing cocycle to be killed by ψ; character self-duality of a lattice alone does not ensure that condition.

The symplectic group is the existing bilinear isometry group, rather than a new symplectic-space structure. A native left action and Kudla’s right action compare by x·g=g⁻¹x. Lagrangian complements and symplectic bases belong to LV.3/lagrangian-symplectic-basis and are imported. The honest symplectic action on the Heisenberg group precedes the scalar-ambiguous intertwining action on a representation space. The Heisenberg extension and the metaplectic extension have different quotient groups and centers.

Fix a nontrivial continuous additive character and self-dual positive Haar measures. At the real place use ψ(t)=exp(2πit), and the Fourier sign of the stated generator. A quadratic form, its polar bilinear form and their determinants must be distinguished: the Weil index formulas below use the source’s q versus ½ω convention explicitly. Hilbert symbols and local Hasse invariants, including the dyadic case, are imported from Tau Ceti QuadraticFormInvariants layer6C. The scalar normalizer extension has center C× or the unit circle in its unitary realization. Its normalized double-cover restriction has center μ₂. Genuineness means that the nontrivial central sign acts by −1; on the larger scalar extension the source’s weight-one and weight-two character conventions remain explicit.

Smooth nonarchimedean modules, unitary Hilbert models and archimedean (g,K)-modules are separate categories. ContRepresentation gives continuous linear operators; it alone does not assert continuity of the action in the group variable. SR.0’s abelian smooth category, SR.2 induction/Jacquet functors, SR.3 admissibility/duals and AF.1 real representation theory supply those categories. Big theta uses a maximal isotypic quotient, with a tensor-coinvariant adapter only after the correct smooth dual comparison. Small theta uses the justified maximal semisimple quotient of a finite-length module. An arbitrary quotient or an algebraic tensor product does not supply these hypotheses.

At almost all finite places choose the distinguished integral splitting and spherical Schwartz vector. The adelic μ₂ cover is a restricted product with its finite-support central sign kernel quotiented out; it is not an unrestricted product of local covers. The rational subgroup is embedded by the canonical splitting proved from the Weil-index product formula and Poisson summation.

Use the full smooth genuine automorphic space for the right adelic-group action, as in GQT §2.10. Its K-finite part is a (g,K)-module with the finite-adelic action. Growth, constant terms and rapid decay are transported from AF.2/3 through the cover; Siegel-set reduction comes from AA.3. Every interchange of theta sums, integrals and derivatives carries an integrability or convergence proof. For GQT, m=m₀+2r, d(n)=n+ε₀ and s_{m,n}=(m−d(n))/2. Ordinary theta integration converges for r=0 or m−r>d(n). Cover Haar measure pushes forward to the linear Tamagawa measure, so a μ₂ fiber has total mass1. The integral convention additionally divides by τ(H_r); disconnected orthogonal and split binary exceptions are retained.

For classical weight½ use Γ₀(4), the theta quotient multiplier and Γ∞\Γ₀(4), with Whittaker indices (¼ sign n,ir/2). The plus space kills coefficients n≡2, 3 modulo4. The U,W order and conjugation by y^{1/4} are fixed by DIT11 and DIT16; prime 2 is retained in the normalized Shimura Euler product. Phase ambiguity is resolved at the eigenline level, coefficient products use conjugation, and fractional discriminant factors use |D|. The theta norm and all three trace branches carry the corrected normalization.

## Scope and suppliers

Generic finite-dimensional and joint archimedean Schwartz–Bruhat spaces, distributional Fourier transforms, Gaussian/ideal Poisson and measure laws extend AL.0 as PartII. Linear adelic/restricted-product structures remain AA.1; disconnected orthogonal measures extend that supplier. MP owns the cover and oscillator adapters. AS.1–2 supplies principal series, Eisenstein continuation/intertwining and normalized doubling factors. GZ.5 retains Waldspurger period identities, GZ.6 the arithmetic derivative identities, BSD.2 quadratic-twist nonvanishing and QM.1 classical rank-one theta/Jacobi theory. Function-field metaplectic geometric Satake/fusion and excursion inputs are expressly conditional supplier extensions, following Lafforgue §14; no conjectural adapter is promoted to an unconditional theorem.

The four confirmed automorphic-area requirements are represented by native prerequisites and requested contracts: SR.0/2/3 plus AF.1 for local theta; QuadraticFormInvariants6C for Weil indices; AA.3 plus AF.2/3 for global growth; and actual ordinary/boundary/second-term Siegel–Weil norm-form instances for GZ.5. These change the blueprint, not the campaign files. The final section lists all supplier requests and stage refinements.

## Planning inventory

| Stage | Targets | Status | Planets |
|---|---:|---|---:|
| MP.0 — Heisenberg groups and Schrödinger models | 18 | planned | 4 |
| MP.1 — Stone–von Neumann and the metaplectic cover | 7 | planned | 5 |
| MP.2 — Weil operators and quadratic invariants | 10 | planned | 4 |
| MP.3 — Local theta correspondence | 44 | planned | 6 |
| MP.4 — Adelic covers and oscillator representations | 8 | planned | 5 |
| MP.5 — Theta kernels and automorphic spaces | 16 | planned | 6 |
| MP.6 — Siegel–Weil, doubling and Rallis formulas | 22 | planned | 6 |
| MP.7 — Rank-one half-weight and Shimura adapters | 51 | planned | 6 |

176 nodes: 11 definitions, 48 constructions, 5 lemmas, 88 theorems and 24 comparisons. The 59 definitions/constructions have 181 named API items and 179 tests. There are 42 planets, 58 cited baseline declarations, 99 explicit proof/signature gaps and 27 supplier requests. All 110 assigned mathematical source items are routed; the additional DIT geometric trace makes 111 distinct source-item routes.

## MP.0. Heisenberg groups and Schrödinger models

### Bilinear Heisenberg factor set

**Construction.** `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet`

Node: `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`. Planet: **Heisenberg group**.

Construct α_B(x,y)=B(x,y), viewed multiplicatively, as a native normalized factor set on Multiplicative W with coefficients Multiplicative C and trivial action. Its existing extension E_B has multiplication (t,x)(s,y)=(t+s+B(x,y),x+y). The maps t↦(t, 0) and (t,x)↦x and their exactness are the native inl, rightHom and groupExtension.

**Hypotheses.** R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0, 0). The coefficient action is the native trivial action.

**Construction or proof route.**

1. Bilinearity gives B(x+y,z)+B(x,y)=B(y,z)+B(x,y+z), the native multiplicative cocycle identity after type tagging and using the trivial action.
2. B(0, 0)=0 gives normalization. Supply these two fields to FactorSet; use its existing group instance, exact sequence, section and central inclusion without rebuilding them.

**Uses determining the API.**

- Kudla I.1, p.3; MP.0–1: Provide the exact Heisenberg group and central embedding before choosing a smooth representation.
- Weil I.§§3–4, pp.148–149; MP.0 and MP.8: Support polarized bilinear cocycles and the Heisenberg input to Jacobi semidirect products.
- Kudla I.2, p.6: Allow a lattice domain over Z with coefficient module in the ambient local field; no division operation on the lattice is assumed.

**API.**

- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_apply` (simp): The additive value of α_B(x,y) is B(x,y).
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_mul_left` (projection): The coefficient coordinate of pq is t+s+B(x,y).
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_mul_right` (projection): The quotient coordinate of pq is x+y.

**Discriminating tests.**

- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_zero` (degenerate): For B=0 on W=C=Z, the coefficient coordinate of pq is t+s.
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_cross` (computation): For W=Z² and B(x,y)=x₀y₁, α_B(e₀,e₁)=1 in additive coefficient coordinates.
- `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_reversed` (non-example): For the same native matrix form, α_B(e₁,e₀)=0. Replacing B by its transpose fails the two ordered tests.

**Acceptance.**

- No division by 2 is used; the construction works in characteristic two.
- For C=R and B=½ω, with ω alternating and 2 invertible, the multiplication is exactly Kudla’s convention after swapping the written coordinate order.
- For B=0 the native multiplication is addition on C×W.

**Prerequisites.** `mathlib:LinearMap.BilinMap`, `mathlib:LinearMap.map_add₂`, `mathlib:Multiplicative`, `mathlib:groupCohomology.IsMulCocycle₂`, `tauceti:TauCeti.trivialMulDistribMulAction`, `tauceti:TauCeti.trivialMulDistribMulAction_smul`, `tauceti:TauCeti.FactorSet`, `tauceti:TauCeti.FactorSet.Extension`, `tauceti:TauCeti.FactorSet.groupExtension`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “has multiplication deﬁned by”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Inverse in the bilinear extension

**Lemma.** `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_inv`

Node: `MetaplecticAutomorphicForms:MP.0/inverse`.

For p=(t,x) in E_B, p⁻¹=(−t+B(x,x),−x).

**Hypotheses.** R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0, 0). The coefficient action is the native trivial action.

**Construction or proof route.**

1. Specialize the native inverse coordinate formulas to the trivial action. Bilinearity gives B(x,−x)=−B(x,x); simplify coefficient inversion into additive negation.
2. Alternatively multiply the proposed inverse on either side using the native product formulas; both coordinates are zero.

**Acceptance.**

- For B=0 the inverse is ordinary negation.
- For B(x,y)=x₀y₁ over Z and p=(0,(2, 3)), the inverse has coefficient 6, not 0.
- For an alternating B the diagonal correction vanishes.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `tauceti:TauCeti.FactorSet.Extension.inv_left`, `tauceti:TauCeti.FactorSet.Extension.inv_right`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “has multiplication deﬁned by”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Commutator in a bilinear central extension

**Lemma.** `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_commutator`

Node: `MetaplecticAutomorphicForms:MP.0/commutator`.

For p=(t,x),q=(s,y), with commutator convention pqp⁻¹q⁻¹, the commutator is inl(B(x,y)−B(y,x)).

**Hypotheses.** R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0, 0). The coefficient action is the native trivial action.

**Construction or proof route.**

1. Substitute inverse and the native multiplication coordinate formulas into the fourfold product.
2. The quotient coordinate is zero. Expand B(x+y,−x) and B(y,−y) by bilinearity; diagonal terms cancel and the coefficient becomes B(x,y)−B(y,x). Identify the resulting pair with native inl.

**Acceptance.**

- The coefficient does not depend on t or s.
- For B(x,y)=x₀y₁ and x=e₀,y=e₁ over Z, the commutator is central 1.
- The same triangular form over Z/2Z is noncommutative; the generic bilinear construction still applies.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/inverse`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`, `tauceti:TauCeti.FactorSet.inl`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “has multiplication deﬁned by”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Center criterion for a bilinear extension

**Lemma.** `TauCeti.Metaplectic.Heisenberg.bilinearFactorSet_mem_center_iff`

Node: `MetaplecticAutomorphicForms:MP.0/center-criterion`.

An element (t,x) belongs to the center of E_B iff B(x,y)=B(y,x) for every y∈W.

**Hypotheses.** R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0, 0). The coefficient action is the native trivial action.

**Construction or proof route.**

1. Use Subgroup.mem_center_iff. Compare (t,x)(s,y) and (s,y)(t,x) using the native product coordinates.
2. The quotient coordinates agree. Cancel t+s in C; this leaves precisely equality of the two bilinear values. For necessity it suffices to take s=0; for sufficiency allow arbitrary s.

**Acceptance.**

- For symmetric B the entire group is central.
- For B=0 on Z the center strictly contains the coefficient subgroup, detected by (0, 1).
- The criterion uses the radical of B−Bᵀ and does not assume 2 invertible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `mathlib:Subgroup.mem_center_iff`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “This action is trivial on the center Z = {(0, t)} ≃ F of H(W ) .”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Commutator for the half-alternating convention

**Lemma.** `TauCeti.Metaplectic.Heisenberg.halfForm_commutator`

Node: `MetaplecticAutomorphicForms:MP.0/half-form-commutator`.

Let ω be alternating and let 2 be invertible in R. In E_{½ω}, pqp⁻¹q⁻¹=inl(ω(x,y)).

**Hypotheses.** R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. ω is alternating; 2 is invertible in R.

**Construction or proof route.**

1. Apply commutator to B=½ω. Native IsAlt.neg_eq gives ω(y,x)=−ω(x,y).
2. The coefficient is ½(ω(x,y)−ω(y,x))=ω(x,y), using invOf_mul_self for 2.

**Acceptance.**

- For the standard alternating form over Q, the two standard basis vectors have commutator central 1.
- No residue-characteristic restriction occurs: the field Q₂ has invertible 2.
- The convention p⁻¹q⁻¹pq must not be substituted into a calculation using a different bracket convention without checking the resulting identity.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/commutator`, `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.IsAlt.neg_eq`, `mathlib:invOf_mul_self`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “has multiplication deﬁned by”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Center of the Heisenberg group

**Theorem.** `TauCeti.Metaplectic.Heisenberg.halfForm_center`

Node: `MetaplecticAutomorphicForms:MP.0/half-form-center`.

If ω is alternating and nondegenerate and 2 is invertible in R, the center of E_{½ω} is exactly the range of its native coefficient injection.

**Hypotheses.** R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. ω is alternating and nondegenerate; 2 is invertible in R.

**Construction or proof route.**

1. Native centrality of inl gives one inclusion. For a central (t,x), half-form-commutator and injectivity of inl imply ω(x,y)=0 for every y.
2. Apply the separation property in native Nondegenerate to obtain x=0. The element is then inl(t), proving the other inclusion.

**Acceptance.**

- A zero form on a nonzero module violates nondegeneracy and has a larger center.
- For the zero module the statement still identifies the whole extension with its coefficient subgroup.
- No finite-dimensionality, topology, or field hypothesis is used in this algebraic theorem.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/half-form-commutator`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:Subgroup.mem_center_iff`, `tauceti:TauCeti.FactorSet.inl_injective`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “This action is trivial on the center Z = {(0, t)} ≃ F of H(W ) .”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Extension isomorphism induced by an isometry

**Construction.** `TauCeti.Metaplectic.Heisenberg.extensionIsometry`

Node: `MetaplecticAutomorphicForms:MP.0/isometry-extension`.

For scalar forms B on W and D on W′ and a native isometry e:B≃D, construct the group isomorphism E_B≃E_D sending (t,x) to (t,e(x)).

**Hypotheses.** R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

**Construction or proof route.**

1. Use the underlying linear equivalence on the quotient coordinate and identity on the coefficient coordinate, with e inverse giving the inverse map.
2. Preservation of multiplication follows from linear additivity and native IsometryEquiv.map_app: D(e(x),e(y))=B(x,y).

**Uses determining the API.**

- Kudla I.1, p.3; MP.0: Transport Heisenberg coordinates under symplectic isometries.
- Kudla I.2, pp.7–9; MP.0–1: Compare polarizations and conjugate induced models while preserving their central character.

**API.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_apply` (projection): The coordinate formula is (t,x)↦(t,e(x)).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_refl` (functoriality): The identity native isometry gives the identity group isomorphism.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_trans` (functoriality): Extension of the composite f∘e is extension of f composed with extension of e, with the same order as native IsometryEquiv.trans.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_inl` (compatibility): Extension of e sends inl_B(t) to inl_D(t).

**Discriminating tests.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_identity` (computation): The identity isometry of the zero form on Z fixes (3, 4).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_negation` (computation): Negation preserves any scalar bilinear form on Z and sends (3, 4) to (3,−4), preserving the coefficient 3.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometry_inverse` (compatibility): Extension of the native inverse isometry undoes extension of e, including when the underlying modules differ.

**Acceptance.**

- Different underlying modules are allowed.
- The map fixes the native central injection pointwise.
- Applied to half an alternating form, this supplies the symplectic automorphisms in Kudla p.3.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `mathlib:LinearMap.BilinForm.IsometryEquiv`, `mathlib:LinearMap.BilinForm.IsometryEquiv.map_app`, `mathlib:LinearMap.BilinForm.IsometryEquiv.symm`, `tauceti:TauCeti.FactorSet.Extension.mul_left`, `tauceti:TauCeti.FactorSet.Extension.mul_right`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “acts as a group of automorphisms of H(W ) by the rule:”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Isometry action on the Heisenberg group

**Construction.** `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction`

Node: `MetaplecticAutomorphicForms:MP.0/isometry-action`. Planet: **Symplectic action**.

For a scalar form B, construct a group homomorphism from the native TauCeti.BilinForm.isometryGroup B to automorphisms of E_B, sending e to (t,x)↦(t,e(x)).

**Hypotheses.** R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate.

**Construction or proof route.**

1. Use the native equivalence from the isometry subgroup to self-isometries and the preceding extension construction.
2. Verify the identity and multiplication laws by the coordinate formula, using the left-composition convention of linear automorphisms. No projective scalar ambiguity occurs in this action on the Heisenberg group.

**Uses determining the API.**

- Kudla I.1, pp.3–4; MP.1: Supply the group automorphism used to twist the irreducible Heisenberg representation before choosing an intertwiner.
- MetaplecticAutomorphicForms:MP.8: Supply the symplectic part of a Jacobi action. The similitude action that scales the center is an additional MP.8 obligation.

**API.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_apply` (projection): The group element e acts by (t,x)↦(t,e(x)).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_inl` (compatibility): Every e fixes each inl(t).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_injective` (characterisation): The action homomorphism is injective: evaluation on all (0,x) determines e.

**Discriminating tests.**

- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_identity` (computation): The native group identity for the zero form on Z fixes (3, 4).
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_negation` (non-example): The negation element of the native isometry group of the zero form on Z sends (3, 4) to (3,−4); a constant identity action fails.
- `TauCeti.Metaplectic.Heisenberg.extensionIsometryAction_center` (compatibility): Every native isometry-group element fixes the native coefficient injection, for all t.

**Acceptance.**

- This is an honest action on E_B; it does not construct an honest symplectic action on an irreducible representation space.
- The action is faithful, including degenerate forms: equality on (0,x) recovers the linear automorphism.
- Kudla uses a right action; translate it by x·e=e⁻¹(x) before comparing multiplication order.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/isometry-extension`, `tauceti:TauCeti.BilinForm.isometryGroup`, `tauceti:TauCeti.BilinForm.mem_isometryGroup`, `tauceti:TauCeti.BilinForm.isometryGroupEquivIsometryEquiv`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, p.3, Heisenberg group and symplectic action; excerpt at PDF 3. Literal excerpt: “acts as a group of automorphisms of H(W ) by the rule:”. An algebraic consequence of the displayed Heisenberg multiplication. The packet separates the calculation from the source’s local-field and representation-theoretic hypotheses and uses the existing native extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Quadratic correction between Heisenberg cocycles

**Lemma.** `TauCeti.Metaplectic.Heisenberg.polarization_cocycle`

Node: `MetaplecticAutomorphicForms:MP.0/polarization-cocycle`.

For scalar B and invertible 2, put q(x)=½B(x,x) and ω=B−Bᵀ. Then ½ω(x,y)+q(x+y)=B(x,y)+q(x)+q(y).

**Hypotheses.** R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. 2 is invertible in R.

**Construction or proof route.**

1. Expand B(x+y,x+y)=B(x,x)+B(x,y)+B(y,x)+B(y,y) by bilinearity.
2. Collect terms and cancel the transpose terms; use ½·2=1. This is exactly the rescaling identity for α=½(B−Bᵀ), β=B and cochain q.

**Acceptance.**

- For B(x,y)=x₀y₁ and x=e₀,y=e₁ over Q, the left side is ½+½=1.
- The plus sign before q(x+y) is required for the forward coordinate map t↦t+q(x).
- The identity holds for degenerate and symmetric forms.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `mathlib:LinearMap.BilinForm.flip`, `mathlib:LinearMap.BilinForm.flip_apply`, `mathlib:invOf_mul_self`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§3 equation(3), printed 148, PDF 6; literal excerpt PDF 6. Literal excerpt: “F ( z . z ~ ) =<xl, x*2>            (z1=(xl,x*),z*=(x2,x*))"                             (3)”. Weil uses the polarized cocycle pairing the first primal coordinate with the second dual coordinate. The displayed algebra derives the exact additive coboundary relating it to Kudla’s half-alternating convention; neither source is claimed to state this native-library formulation verbatim.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Polarized Heisenberg coordinates

**Construction.** `TauCeti.Metaplectic.Heisenberg.polarizationEquiv`

Node: `MetaplecticAutomorphicForms:MP.0/polarization-equivalence`.

For scalar B and invertible 2, construct E_{½(B−Bᵀ)}≃E_B by (t,x)↦(t+½B(x,x),x), with inverse (t,x)↦(t−½B(x,x),x). This is a specialization of the native equivalence of rescaled extensions.

**Hypotheses.** R is a commutative ring and W,W′,W″ are R-modules with additive commutative groups. Forms are native scalar-valued bilinear forms, with no nondegeneracy assumption unless explicitly stated. E_B denotes the same native extension, with coordinates (t,w). Maps between extensions fix the coefficient coordinate. 2 is invertible in R.

**Construction or proof route.**

1. Use polarization-cocycle as the cochain identity required by native FactorSet.rescaleEquiv, under the trivial action.
2. Extract its underlying group isomorphism. Native forward and inverse rescaling formulas give the two coordinate descriptions; q(0)=0 shows compatibility with the central inclusion.

**Uses determining the API.**

- Weil I.§4, p.149; Kudla I.2 Lemma 2.2, p.7: Reconcile the polarized translation/modulation convention with the half-alternating Heisenberg law and its ½ω(x,y) phase.
- MetaplecticAutomorphicForms:MP.0–2: Fix the sign and coordinate dictionary before proving Fourier and generator operator identities.

**API.**

- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_apply` (projection): The forward coefficient is t+½B(x,x), and the quotient coordinate remains x.
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_symm_apply` (projection): The inverse coefficient is t−½B(x,x), and the quotient coordinate remains x.
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_inl` (compatibility): The equivalence fixes the native coefficient injection.

**Discriminating tests.**

- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_zero` (degenerate): For B=0 on Q, the equivalence fixes (3, 4).
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_cross` (computation): For B(x,y)=x₀y₁ on Q², the image of (0,(2, 3)) is (3,(2, 3)).
- `TauCeti.Metaplectic.Heisenberg.polarizationEquiv_sign` (non-example): For the same B, the inverse image of (0,(2, 3)) is (−3,(2, 3)); using a plus sign for both directions fails.

**Acceptance.**

- For the standard polarization W=X⊕Y with B((x,y),(x′,y′))=ω(x,y′), the correction is ½ω(x,y).
- This construction assumes a chosen polarized bilinear representative; existence of a Lagrangian complement belongs to the existing LV.3 node.
- It changes group coordinates. It does not define a Fourier transform or prove an equivalence of Schrödinger representations.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/polarization-cocycle`, `tauceti:TauCeti.FactorSet.rescaleEquiv`, `tauceti:TauCeti.FactorSet.rescaleEquiv_apply`, `tauceti:TauCeti.FactorSet.rescaleEquiv_symm_apply`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§3 equation(3), printed 148, PDF 6; comparison with Kudla I.2 Lemma 2.2 PDF 7; literal excerpt PDF 6. Literal excerpt: “F ( z . z ~ ) =<xl, x*2>            (z1=(xl,x*),z*=(x2,x*))"                             (3)”. Weil’s polarized cocycle and Kudla’s half-pairing Schrödinger phase determine this quadratic change of coordinates. The construction is proved directly with the native rescaling equivalence.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Criterion for the section-trivial central character

**Theorem.** `TauCeti.Metaplectic.Heisenberg.centralCharacter_multiplicative_iff`

Node: `MetaplecticAutomorphicForms:MP.0/central-character-criterion`.

For any group A and homomorphism χ:Multiplicative C→A, the function E_B→A given by (t,x)↦χ(t) preserves multiplication iff χ(B(x,y))=1 for every x,y∈W.

**Hypotheses.** R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0, 0). The coefficient action is the native trivial action. A is any group; χ is a group homomorphism from Multiplicative C to A.

**Construction or proof route.**

1. Necessity: test multiplicativity on (0,x) and (0,y). Both proposed character values are one, and the product has coefficient B(x,y).
2. Sufficiency: apply χ to t+s+B(x,y), use its homomorphism law, and use χ(B(x,y))=1. Its value at the identity is already one. No commutativity of A is required.

**Acceptance.**

- For B=0 every χ satisfies the criterion.
- For B(x,y)=x₀y₁ over Z and χ the identity on Multiplicative Z, the proposed scalar projection is not multiplicative.
- For B=½ω restricted to a lattice, killing ω on the lattice is insufficient unless χ also kills ½ω; the Q₂ counterexample is recorded in E-MP0-3.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `tauceti:TauCeti.FactorSet.Extension.mul_left`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2, p.6, the asserted extension ψ_Y; corrected statement; excerpt at PDF 6. Literal excerpt: “unique extension ψY to H(Y ) , given by ψY (y, t) = ψ(t) . Let”. The source formula requires exactly the cocycle-killing condition proved here. For an isotropic F-subspace it holds because the form itself vanishes; character-self-duality of an arbitrary additive subgroup alone does not suffice.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Section-trivial extension of a central character

**Construction.** `TauCeti.Metaplectic.Heisenberg.centralCharacter`

Node: `MetaplecticAutomorphicForms:MP.0/central-character`. Planet: **Heisenberg central character**.

Given χ:Multiplicative C→A with χ(B(x,y))=1 for all x,y, construct the group homomorphism E_B→A, (t,x)↦χ(t). It extends χ on native inl and is trivial on the native canonical section.

**Hypotheses.** R is a commutative ring; W and C are additive commutative groups and R-modules. B:W×W→C is a native R-bilinear map. Write E_B for the existing FactorSet.Extension of the bilinear factor set. This is notation, not a proposed wrapper. Coordinates are (t,w), coefficient first; identity is (0, 0). The coefficient action is the native trivial action. A is any group; χ:Multiplicative C→A is a group homomorphism, and χ(B(x,y))=1 for every x,y.

**Construction or proof route.**

1. Use central-character-criterion to establish multiplicativity and the homomorphism law for χ to establish the identity value.
2. Use the coordinate formula to check the two prescribed restrictions. For uniqueness among homomorphisms satisfying both restrictions, factor each p as inl(p.left) times canonicalSection(p.right) using the native decomposition theorem.

**Uses determining the API.**

- Kudla I.2, pp.6–7; MP.0: Supply the inducing character of H(Y) when Y is an isotropic subspace, or when an explicit splitting condition has been established.
- Kudla I.1 Theorem 1.1, p.3; MP.1: Specify the central character of the chosen model. This construction does not prove irreducibility or Stone–von Neumann uniqueness.

**API.**

- `TauCeti.Metaplectic.Heisenberg.centralCharacter_apply` (projection): At (t,x) the homomorphism evaluates to χ(t).
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_inl` (compatibility): Its restriction along native inl is χ.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_canonicalSection` (simp): Its value on each native canonicalSection(x) is one.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_unique` (universal-property): If ρ:E_B→A agrees with χ on native inl and is one on every native canonicalSection(x), then ρ equals centralCharacter B χ. Both conditions are required.

**Discriminating tests.**

- `TauCeti.Metaplectic.Heisenberg.centralCharacter_value` (computation): For B=0 on Z and χ the identity of Multiplicative Z, the value at (3, 4) is additive 3.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_trivial` (degenerate): For every bilinear B, the trivial character into Multiplicative Z gives the trivial homomorphism on E_B.
- `TauCeti.Metaplectic.Heisenberg.centralCharacter_zero` (compatibility): For B=0 on Z and χ the native identity homomorphism, the value at the native extension identity is one.

**Acceptance.**

- Uniqueness is asserted only with both the central restriction and triviality on the chosen section.
- The section need not itself be a homomorphism; the cocycle condition makes its image trivial under this character.
- An arbitrary extension of the same χ may be multiplied by a nontrivial character of the quotient.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/central-character-criterion`, `tauceti:TauCeti.FactorSet.inl`, `tauceti:TauCeti.FactorSet.canonicalSection`, `tauceti:TauCeti.FactorSet.inl_mul_canonicalSection`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2, p.6, extension ψ_Y; corrected normalization and hypothesis; excerpt at PDF 6. Literal excerpt: “unique extension ψY to H(Y ) , given by ψY (y, t) = ψ(t) . Let”. This is the distinguished character intended in the induced model, with the missing cocycle hypothesis and the normalization needed for uniqueness made explicit.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Heisenberg`. Implementation: unchecked.

### Topological Heisenberg extension

**Construction.** `TauCeti.Metaplectic.heisenbergTopology`

Node: `MetaplecticAutomorphicForms:MP.0/topological-heisenberg`.

Give the existing bilinear FactorSet.Extension E_B the topology transported from C×W by its coordinate equivalence. If C,W are Hausdorff topological modules and B is continuous, multiplication and inversion are continuous. For finite-dimensional modules over a nondiscrete local field it is locally compact and second countable. For B=½ω, the native isometry action is jointly continuous.

**Hypotheses.** The local-field specialization has characteristic different from two; W is finite dimensional and ω is alternating. Continuity of B is required in the general topological-module case.

**Construction or proof route.**

1. Use the inherited coordinate multiplication and inverse formulas; sums, B and negation are continuous.
2. Transport the product topology and local compactness, then identify isometries with the closed subgroup of the finite-dimensional general linear group preserving ω.

**Uses determining the API.**

- Weil III.§§31–36; MP.1: Form a topological, rather than merely abstract, normalizer extension.

**API.**

- `TauCeti.Metaplectic.heisenbergCoordinates` (equivalence): The native extension coordinate equivalence E_B≃C×W is a homeomorphism.
- `TauCeti.Metaplectic.heisenberg_continuous_mul` (structure): Multiplication is continuous for the transported product topology.
- `TauCeti.Metaplectic.heisenberg_continuous_action` (compatibility): The native form-isometry group acts jointly continuously on E_{½ω}.

**Discriminating tests.**

- `TauCeti.Metaplectic.heisenbergTopology_zero` (degenerate): For W=0 over R the coordinate homeomorphism identifies E with the additive topological group R.
- `TauCeti.Metaplectic.heisenbergTopology_q2` (compatibility): For W=Q₂² with standard ω, the topology is precisely Q₂×Q₂² and the half-form multiplication is continuous.
- `TauCeti.Metaplectic.heisenbergTopology_projection` (characterisation): The central inclusion is a closed embedding and the quotient projection is an open continuous surjection.

**Acceptance.**

- Q₂ is admitted: the field element 2 is invertible although it is not an integral unit.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/bilinear-factor-set`, `MetaplecticAutomorphicForms:MP.0/inverse`, `MetaplecticAutomorphicForms:MP.0/isometry-action`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1 pp.3–4; I.2 p.6; excerpt at PDF 3. Literal excerpt: “H(W ) := W ⊕ F”. The existing algebraic carrier receives the topology of W×F; the coordinate order is swapped.

**Suggested-signature boundary.** The Q₂ product-topology test is generalized to native topological field/module parameters; local compactness and action-group topology require the packet hypotheses.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage0`. Implementation: unchecked.

### Product Haar measure on the Heisenberg group

**Theorem.** `TauCeti.Metaplectic.heisenberg_haar`

Node: `MetaplecticAutomorphicForms:MP.0/heisenberg-haar`.

For C=F, W=F^{2n}, B continuous bilinear, the product of additive Haar measures μ_F and μ_W transported to E_B is both left and right Haar measure. With self-dual measures for ψ and ω, every symplectic automorphism preserves it; rescaling the central or vector measure rescales their product.

**Hypotheses.** F is a nondiscrete local field; for symplectic invariance ω is nondegenerate.

**Construction or proof route.**

1. Fix one coordinate in the left-translation formula and apply translation invariance in the coefficient coordinate, then in W; use Fubini. Repeat on the right.
2. In the symplectic case determinant one gives vector-measure invariance. Import finite-dimensional self-dual Haar and change of variables from the Fourier supplier.

**Acceptance.**

- For n=0 the measure is μ_F. No arbitrary probability normalization is imposed on a noncompact field.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/topological-heisenberg`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2 pp.6–10; excerpt at PDF 8. Literal excerpt: “Haar measure dµg (y) on ker(c)\Y such that the operator r(g) deﬁned for”. The quotient integrals require translation invariant and self-dual normalizations.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- AL.0 currently states Fourier inversion on the scalar local field. Its finite-dimensional vector-space extension, measure determinant law, and the symplectic determinant-one bridge must be supplied and checked before this signature is closed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage0`. Implementation: unchecked.

### Schrödinger representation

**Construction.** `TauCeti.Metaplectic.schroedinger`

Node: `MetaplecticAutomorphicForms:MP.0/schroedinger-model`. Planet: **Schrödinger representation**.

For W=X⊕Y with X,Y Lagrangian, define on S(X) the representation ρψ(x+y,t)φ(u)=ψ(t+ω(u,y)+½ω(x,y))φ(u+x). Here S(X) is the actual locally constant compactly supported space at nonarchimedean places and the joint real Schwartz space at archimedean places. The formula preserves S(X) and gives central character ψ.

**Hypotheses.** F is a nondiscrete local field of characteristic different from two; ψ is nontrivial continuous unitary; the polarization identifies Y with the algebraic dual of X by ω.

**Construction or proof route.**

1. Import the Lagrangian complement and basis theorem from LV.3 and the concrete finite-dimensional Schwartz carrier from AL.0.
2. Compose the two displayed operators; the cross term is exactly ½ω(w,w′), hence the inherited group law. Translation and multiplication by a character preserve the appropriate Schwartz space.

**Uses determining the API.**

- Kudla I.2 Prop.2.3; MP.1–2: Supply the concrete oscillator carrier for intertwiners and generators.

**API.**

- `TauCeti.Metaplectic.schroedinger_apply` (simp): Evaluation is the displayed translation and modulation formula.
- `TauCeti.Metaplectic.schroedinger_center` (simp): ρψ(0,t)φ=ψ(t)φ.
- `TauCeti.Metaplectic.schroedinger_mul` (relation): ρψ(hh′)=ρψ(h)ρψ(h′).
- `TauCeti.Metaplectic.schroedinger_isUnitary` (compatibility): The induced operator on L²(X,μselfdual) is a native linear isometry and its map to continuous linear operators is unitary.

**Discriminating tests.**

- `TauCeti.Metaplectic.schroedinger_zero` (degenerate): When X=Y=0, ρψ(t) is multiplication by ψ(t) on C.
- `TauCeti.Metaplectic.schroedinger_translation` (computation): For w=x∈X, ρψ(x, 0)φ(u)=φ(u+x).
- `TauCeti.Metaplectic.schroedinger_modulation` (computation): For w=y∈Y, ρψ(y, 0)φ(u)=ψ(ω(u,y))φ(u).
- `TauCeti.Metaplectic.schroedinger_commutator` (non-example): For x∈X,y∈Y, ρ(x)ρ(y)=ψ(ω(x,y))ρ(y)ρ(x), with this positive sign.

**Acceptance.**

- The center acts by ψ, and modulation and translation have the required ordered commutator.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/topological-heisenberg`, `MetaplecticAutomorphicForms:MP.0/half-form-commutator`, `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2 Lemma 2.2, PDF 7, translation and phase action; literal excerpt PDF 7. Literal excerpt: “Lemma 2.2. The resulting action of H(W ) in S(X) is given by:”. Formula (2.1), using the packet’s coefficient-first coordinates.

**Suggested-signature boundary.** Function-space action fragment. The requested local Schwartz carrier, Schwartz preservation and actual L² descent are not replaced by arbitrary structure fields; the unitarity signature takes the resulting native Hilbert action.

**Explicit proof/signature refinements.**

- The exact finite-dimensional and joint archimedean Schwartz carriers are an AL.0 Part II request; neither a formal function symbol nor the scalar supplier alone supplies them.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage0`. Implementation: unchecked.

### Induced and coordinate Schrödinger models

**Construction.** `TauCeti.Metaplectic.inducedSchroedingerEquiv`

Node: `MetaplecticAutomorphicForms:MP.0/induced-schroedinger`.

Identify S(X) with the smooth functions f on H(W) satisfying f(h_Yh)=ψ_Y(h_Y)f(h), whose support is compact modulo H(Y), by evaluation on the X section; here H(Y)=Y×F and ψ_Y(y,t)=ψ(t). The inverse is the extension determined by covariance. Right translation gives exactly the Schrödinger formula.

**Hypotheses.** F is nonarchimedean; ψ is continuous nontrivial unitary; Y is an isotropic F-subspace, not merely a character-self-dual lattice.

**Construction or proof route.**

1. Use unique H(Y) times X decomposition, calculate its central coordinate and impose covariance.
2. Support modulo H(Y) is precisely compact support on X. Import smooth induction from SR.2; check sign using Kudla’s right-translation convention.

**Uses determining the API.**

- Kudla I.2 Prop.2.3; MP.1: Derive quotient-integral intertwiners from the induced realization.

**API.**

- `TauCeti.Metaplectic.inducedSchroedingerEquiv_apply` (simp): The coordinate map is f↦(u↦f(u, 0)).
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_covariance` (characterisation): The inverse has ψ_Y covariance and compact support modulo H(Y).
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_intertwines` (compatibility): The equivalence intertwines right translation with ρψ.

**Discriminating tests.**

- `TauCeti.Metaplectic.inducedSchroedingerEquiv_zero` (degenerate): For W=0 the induced model is the one-dimensional central character.
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_indicator` (computation): A compact open L⊂X gives a vector whose section restriction is exactly 1_L.
- `TauCeti.Metaplectic.inducedSchroedingerEquiv_dyadic` (non-example): The subgroup Z₂²⊂Q₂² with standard ω does not admit ψ_Y(y,t)=ψ(t) when ψ has conductor Z₂, because ψ(½ω(e₀,e₁))=−1.

**Acceptance.**

- This is an equivalence of actual smooth representations, not the algebraic polarization cochain map.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/schroedinger-model`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2 Lemma 2.2, PDF 7, polarization realization; literal excerpt PDF 7. Literal excerpt: “Lemma 2.2. The resulting action of H(W ) in S(X) is given by:”. The isotropic-subspace instance satisfies the corrected character condition E-MP0-3.

**Suggested-signature boundary.** Section-evaluation/covariance fragment. The subtype states an explicit equation, not a placeholder Prop field. Smooth compact induction and its support condition await SR.2; the dyadic obstruction is expressed on its rational half argument.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage0`. Implementation: unchecked.

### Hilbert Schrödinger model

**Construction.** `TauCeti.Metaplectic.hilbertSchroedinger`

Node: `MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger`.

Extend translation and modulation to unitary operators on the actual Hilbert space L²(X,μselfdual), using almost-everywhere classes. This is a strongly continuous unitary representation of H(W); its dense Schwartz subspace carries the preceding formula.

**Hypotheses.** F is a local field of characteristic different from two; X is finite dimensional; ψ is continuous unitary.

**Construction or proof route.**

1. Translations preserve Haar measure and modulation has absolute value one, so the operators descend to L² and preserve its inner product.
2. Prove strong continuity first on Schwartz vectors by dominated convergence and then by density. Native ContRepresentation requires an additional strong-continuity assertion in the group variable.

**Uses determining the API.**

- Weil I.§10; MP.1: Define the normalizer in the unitary group with the strong operator topology.

**API.**

- `TauCeti.Metaplectic.hilbertSchroedinger_norm` (simp): Every ρψ(h) preserves the L² norm.
- `TauCeti.Metaplectic.hilbertSchroedinger_schwartz` (compatibility): The Schwartz-to-L² dense inclusion intertwines the two actions.
- `TauCeti.Metaplectic.hilbertSchroedinger_stronglyContinuous` (structure): For every ξ∈L², h↦ρψ(h)ξ is continuous.

**Discriminating tests.**

- `TauCeti.Metaplectic.hilbertSchroedinger_zero` (degenerate): For X=0 the Hilbert space is C and the representation is ψ.
- `TauCeti.Metaplectic.hilbertSchroedinger_gaussian` (computation): On X=R, translation of e^{−πu²} gives e^{−π(u+x)²} with identical L² norm.
- `TauCeti.Metaplectic.hilbertSchroedinger_ae` (compatibility): Changing a measurable representative on a null set does not change any represented L² vector.

**Acceptance.**

- Continuity is not inferred from native ContRepresentation’s name.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/schroedinger-model`, `MetaplecticAutomorphicForms:MP.0/heisenberg-haar`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `mathlib:ContRepresentation`, `mathlib:ContRepresentation.toRepresentation`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§4, printed 149, PDF 7; I.§10 Théorème1, printed 157, PDF 15; literal excerpt PDF 7. Literal excerpt: “representation unitaire de A(G). On ddsignera par A(G) le g r o u p e form~ p a r les op~rateurs t. U(w); si”. The unitary Weyl model is completed in L²; group-variable continuity is an extra condition.

**Suggested-signature boundary.** H denotes the actual L² space after supplier instantiation; this fragment does not manufacture a Hilbert space or assert every ContRepresentation is strongly continuous. L² null representatives are equal vectors.

**Explicit proof/signature refinements.**

- Native L² density and finite-dimensional local-field measure input must be instantiated; an abstract norm-preserving monoid homomorphism alone is not the required strongly continuous model.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage0`. Implementation: unchecked.

### Smooth vectors of the oscillator model

**Comparison.** `TauCeti.Metaplectic.oscillator_smoothVectors`

Node: `MetaplecticAutomorphicForms:MP.0/smooth-vectors`.

At nonarchimedean places the smooth vectors of the Hilbert oscillator model are precisely S(X). Over R, and over C viewed as a real field, the C∞ vectors for the Heisenberg group action are precisely the Schwartz functions on the underlying real X, with their Schwartz Fréchet topology.

**Hypotheses.** The local unitary model has nontrivial central character. Archimedean smoothness means all orbit derivatives for the full Heisenberg group, not just smooth pointwise representatives.

**Construction or proof route.**

1. Nonarchimedean compact-open stabilizers force local constancy and compact support using translations and modulations.
2. In the real model the infinitesimal operators are partial derivatives and coordinate multiplications. Joint Sobolev estimates identify their common domain with Schwartz space.

**Acceptance.**

- Smooth vectors include modulation derivatives; arbitrary smooth L² functions need not be Schwartz.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger`, `MetaplecticAutomorphicForms:MP.0/schroedinger-model`, `AutomorphicFormsOnReductiveGroups:AF.1`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `mathlib:SchwartzMap`, `mathlib:ContRepresentation`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2 p.10; excerpt at PDF 10. Literal excerpt: “precisely the space of smooth vectors in L2 (X) for the action”. The nonarchimedean comparison is stated after the unitary completion.

**Suggested-signature boundary.** Real one-dimensional Schrödinger specialization, using all three Heisenberg coordinates (t,x,y). H is the actual L² space, i its Schwartz injection and orbit its strongly continuous Schrödinger action; those supplier identifications are omitted. Smoothness of a single translation or central orbit is insufficient.

**Explicit proof/signature refinements.**

- The nonarchimedean compact-open argument and the archimedean Sobolev/Fréchet comparison require a matching proof source and a native smooth-vector carrier from SR.0/AF.1. The source citation here does not establish the archimedean conclusion.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage0`. Implementation: unchecked.

## MP.1. Stone–von Neumann and the metaplectic cover

### Smooth Stone–von Neumann theorem

**Theorem.** `TauCeti.Metaplectic.smooth_stoneVonNeumann`

Node: `MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann`. Planet: **Stone–von Neumann theorem**.

For a finite-dimensional symplectic space over a nonarchimedean local field of characteristic different from two and a nontrivial continuous unitary ψ, every irreducible smooth complex representation of H(W) with central character ψ is isomorphic to the Schrödinger model. Its Heisenberg intertwining endomorphism algebra is C.

**Hypotheses.** No odd-residue-characteristic assumption is imposed. For the use of Sun–Zhu’s formulation restrict to characteristic zero; Kudla’s statement allows characteristic different from two.

**Construction or proof route.**

1. Existence is the explicit model. Apply the smooth Stone–von Neumann theorem in the exact smooth category, then Dixmier’s Schur lemma for the scalar ambiguity.
2. A proof reading matching the indicated characteristic range is required, rather than treating the theorem citation as a proof.

**Acceptance.**

- The trivial central character is excluded; the zero symplectic space still has the one-dimensional ψ representation.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/induced-schroedinger`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1 Theorem 1.1 p.3; excerpt at PDF 3. Literal excerpt: “Theorem 1.1. (Stone, von Neumann) Up to isomorphism, there is a unique”. The precise nonarchimedean smooth uniqueness target.

**Suggested-signature boundary.** Native representation equivalence; smooth irreducible nontrivial central-character conditions await SR.0/3 and remain mandatory in the packet.

**Explicit proof/signature refinements.**

- Kudla and Sun–Zhu both refer this proof to MVW 2.I.2; that book proof has not been read. The smooth uniqueness and scalar Schur step remain explicit proof gaps until a matching source is checked.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

### Unitary Stone–von Neumann theorem

**Theorem.** `TauCeti.Metaplectic.unitary_stoneVonNeumann`

Node: `MetaplecticAutomorphicForms:MP.1/unitary-stone-von-neumann`.

Every irreducible strongly continuous unitary representation of the real Heisenberg group with nontrivial unitary central character is unitarily equivalent to L²(X); all unitary representations with that character are Hilbert multiplicities of it. The complex local-field Heisenberg statement is obtained by viewing its alternating pairing and character on the underlying real group.

**Hypotheses.** Finite-dimensional real symplectic space and nontrivial central character; strong continuity is required.

**Construction or proof route.**

1. Use the Weyl transform to identify Schwartz kernels with finite-rank/Hilbert–Schmidt operators. Their rank-one relations show irreducibility and force every representation to be a Hilbert multiple.
2. For F=C use ψ∘ω as a real nondegenerate alternating pairing, with the correct real central quotient.

**Acceptance.**

- A discontinuous abstract action of H(W) does not meet the theorem’s hypotheses.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§10 Théorème1, printed 157, PDF 15 (scalar commutant); classification proof is Garrett20; literal excerpt PDF 15. Literal excerpt: “Le centralisateur de A(G) daus le groupe des automorphismes de L~(G) est le centre T de ces deux groupes; de plus, si B0(G ) est le normalisateur de A(G) dans le mdme”. Weil proves normalizer surjectivity and scalar commutants; the full classification has an additional proof source.
- [Garrett20](https://www-users.cse.umn.edu/~garrett/m/mfms/SSW/06_svn_theorem.pdf), Author notes23March2020, Claims0.1–0.7, PDF 1–4; excerpt at PDF 4. Literal excerpt: “so π is a multiple of σ in this sense. In particular, for π irreducible, necessarily X 0 ≈ {0}, and π ≈ σ.”. The real proof route; the two p4 corrections are recorded. The Schwartz Fourier-density step remains an analytic gap.

**Suggested-signature boundary.** Irreducibility, shared nontrivial central character and strong group continuity are required in the packet; missing category predicates are omitted here.

**Explicit proof/signature refinements.**

- Garrett’s real proof supplies the route with the two recorded textual corrections; its Schwartz Fourier-density step, the complex reduction and nonarchimedean unitary analogue still need analytic proof closure and native irreducibility formulation.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

### Unitary normalizer extension

**Construction.** `TauCeti.Metaplectic.scalarNormalizer`

Node: `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`. Planet: **Unitary normalizer**.

Inside Sp(W)×U(L²(X)), take pairs (g,A) satisfying Aρ(h)A⁻¹=ρ(g·h) for every h. Composition gives the scalar extension Sψ, with kernel z↦(1,z·id), z∈U(1). Equip the unitary group with strong operator topology and Sψ with the subspace topology. Its oscillator action is the second projection.

**Hypotheses.** The Hilbert Schrödinger model is strongly continuous; g acts by the inherited center-fixing Heisenberg automorphism.

**Construction or proof route.**

1. Covariance is stable under pair multiplication and inversion, hence defines a native subgroup.
2. Stone–von Neumann gives surjectivity and Schur gives precisely the unit-circle kernel. Local Bruhat charts in Weil III establish local compactness and openness; product topology on arbitrary cocycle coordinates is not asserted.

**Uses determining the API.**

- Weil IV.§§43–45; MP.2 and MP.4: Construct and compare the double cover and global finite central quotient.

**API.**

- `TauCeti.Metaplectic.scalarNormalizer_projection` (projection): (g,A)↦g is a continuous open central extension with kernel U(1).
- `TauCeti.Metaplectic.scalarNormalizer_covariance` (simp): Aρ(h)=ρ(g·h)A.
- `TauCeti.Metaplectic.scalarNormalizer_oscillator` (data): (g,A) acts by A and z in the central circle acts as z·id.

**Discriminating tests.**

- `TauCeti.Metaplectic.scalarNormalizer_zero` (degenerate): When W=0, Sψ=U(1).
- `TauCeti.Metaplectic.scalarNormalizer_kernel` (characterisation): Any pair above g=1 is exactly a unique scalar z·id with |z|=1.
- `TauCeti.Metaplectic.scalarNormalizer_nonsplitting` (non-example): For W≠0 over R the normalized μ₂ subextension does not admit a continuous homomorphic section; arbitrary lift choice does not prove a splitting.

**Acceptance.**

- The projection to Sp is onto and a local continuous section exists on the big cell.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger`, `MetaplecticAutomorphicForms:MP.0/isometry-action`, `MetaplecticAutomorphicForms:MP.1/unitary-stone-von-neumann`, `MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§10 Théorème1, printed 157, PDF 15; III.§§31–36, PDF 39–45; literal excerpt PDF 15. Literal excerpt: “Le centralisateur de A(G) daus le groupe des automorphismes de L~(G) est le centre T de ces deux groupes; de plus, si B0(G ) est le normalisateur de A(G) dans le mdme”. The topological unitary normalizer, with central circle rather than a chosen matrix lift.

**Suggested-signature boundary.** Native subgroup of symplectic-action × unitary operators. The strong operator topology, exact kernel and nonsplitting tests require the source hypotheses; the nonsplitting fragment is meaningful only after the normalized μ₂ restriction.

**Explicit proof/signature refinements.**

- Strong operator topology and the local-chart proof must be supplied on native unitary automorphisms; native ContRepresentation supplies only continuous linear operators, not continuity in g.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

### Scalar ambiguity and composition of intertwiners

**Theorem.** `TauCeti.Metaplectic.intertwinerLine_dim`

Node: `MetaplecticAutomorphicForms:MP.1/intertwiner-lines`.

For each g∈Sp(W), the smooth intertwiner space between ρ and its g-twist is a one-dimensional C vector space; its nonzero operators are invertible. Choosing A_g with A_1=1 yields A_gA_h=c(g,h)A_{gh}, where c is a normalized scalar factor set. Rescaling A_g by b(g) changes c by b(g)b(h)/b(gh). In the unitary model these scalars have norm one.

**Hypotheses.** Nontrivial ψ; the exact smooth or strongly continuous unitary category is fixed. No global continuity of the chosen A_g is assumed.

**Construction or proof route.**

1. Use uniqueness to produce an isomorphism, then scalar Schur to compare all maps.
2. Associativity of operator composition gives the cocycle equation; use the native FactorSet and rescaleEquiv for abstract algebraic packaging.

**Acceptance.**

- c changes under a section change; its extension isomorphism class does not.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann`, `MetaplecticAutomorphicForms:MP.1/unitary-stone-von-neumann`, `tauceti:TauCeti.FactorSet`, `tauceti:TauCeti.FactorSet.rescaleEquiv`, `mathlib:Representation.IntertwiningMap`, `mathlib:Representation.Equiv`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1, PDF 3–5, irreducibility and intertwiners; literal excerpt PDF 4. Literal excerpt: “The automorphism A(g) is only unique up to a scalar in C× , and so the au- tomorphisms A(g1 )A(g2 ) and A(g1 g2 ) need not coincide. But at least the map”. Scalar ambiguity is derived from uniqueness, not chosen as an axiom.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

### Rao factor set

**Construction.** `TauCeti.Metaplectic.raoFactorSet`

Node: `MetaplecticAutomorphicForms:MP.1/rao-factor-set`. Planet: **Rao cocycle**.

Relative to Y, write j(g)=rank(c_g) and x(g)∈F×/(F×)² for the Bruhat square class. For q=L(Y,Yg₂⁻¹,Yg₁), let t=(j(g₁)+j(g₂)−j(g₁g₂)−dim q)/2. Define the μ₂-valued Rao factor set by (x₁,x₂)(−x₁x₂,x₁₂)(−1,det(2q))^t(−1,−1)^{t(t−1)/2}Hasse(2q). Its normalization and cocycle equation make a native FactorSet with trivial μ₂ action.

**Hypotheses.** F is nonarchimedean of characteristic different from two; the Bruhat representatives, j,x and the nonsingular Leray quotient use Kudla I.4’s normalization. Rank-zero determinants equal one.

**Construction or proof route.**

1. Use Kudla I.4 formula (4.3) and the Weil-index identities to reduce c_Y by the explicit cochain β(g)=γ(x(g),ψ/2)⁻¹γ(ψ/2)⁻j(g).
2. The identity c_Y=β(g₁g₂)c_Rao/(β(g₁)β(g₂)) transports the cocycle equation and normalization to c_Rao.

**Uses determining the API.**

- Kudla I.5–6; MP.2 and MP.4: Supply a precise local double cover and its normalized generators.

**API.**

- `TauCeti.Metaplectic.raoFactorSet_values` (data): Its values lie in μ₂.
- `TauCeti.Metaplectic.raoFactorSet_cocycle` (relation): c(g,h)c(gh,k)=c(g,hk)c(h,k).
- `TauCeti.Metaplectic.raoFactorSet_beta` (compatibility): The displayed β cochain converts it to the integral-operator cocycle.

**Discriminating tests.**

- `TauCeti.Metaplectic.raoFactorSet_identity` (degenerate): c(1,g)=c(g, 1)=1.
- `TauCeti.Metaplectic.raoFactorSet_rankOne` (computation): For SL₂, x(g)=c if c≠0 and x(g)=d otherwise; the factor is (x₁,x₂)(−x₁x₂,x₁₂).
- `TauCeti.Metaplectic.raoFactorSet_levi` (non-example): In rank one, restriction to diagonal matrices has factor (a,b)F and generally does not split over the entire Levi.

**Acceptance.**

- The formula is independent of ψ after normalization.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/leray-cocycle`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `tauceti:TauCeti.FactorSet`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.4 pp.19–22 Proposition 4.3 and Theorem 4.5; excerpt at PDF 20. Literal excerpt: “Theorem 4.5. For g ∈ Sp(W ) , let”. The explicit μ₂-valued cocycle, not an arbitrary square root of c_Y.

**Suggested-signature boundary.** Native factor-set target; j,x,Leray,Hasse and corrected t(t−1)/2 formulas are specified in the packet. The rank-one and Levi tests below expose the Hilbert-symbol formulas only; full Bruhat coordinate bridges are gaps.

**Explicit proof/signature refinements.**

- Bruhat x(g), j(g), Leray rank and t-integrality still require their full sourced definitions/proofs; the formula specifies the target but does not conceal those data as arbitrary functions.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

### Metaplectic double cover

**Construction.** `TauCeti.Metaplectic.metaplecticCover`

Node: `MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover`. Planet: **Metaplectic group**.

For nonarchimedean F take the native extension E_{c_Rao} and identify (g,ε) with (T_g,εβ(g)r_Y(g)) in Sψ, where T_g(w)=wg⁻¹ converts Kudla’s right matrix action to the native left action. Give it the topology of ker λ₂⊂Sψ, where λ₂ is the continuous character restricting to z↦z² on the scalar circle. Over R use the same kernel construction. Over C Sψ≃Sp(W)×U(1), and the double cover is Sp(W)×μ₂. It is a topological central extension by μ₂, nonsplit when W≠0 and F≠C.

**Hypotheses.** Local field characteristic different from two, finite-dimensional symplectic W. The zero-dimensional cover is μ₂. The discontinuous global Bruhat section does not define a product topology on Sp×μ₂.

**Construction or proof route.**

1. Weil IV.§43 constructs λ₂ by checking a big-cell relation and the generation/gluing lemma; IV.§44 proves nonsplitting in the stated range.
2. For nonarchimedean fields use the Rao cochain comparison; the image of εβr is exactly the kernel. Transport its subgroup topology, not a falsely continuous cocycle-coordinate topology.

**Uses determining the API.**

- Weil IV.§45; Kudla II.3; MP.3–5: Provide the genuine local cover and its adelic restricted product.

**API.**

- `TauCeti.Metaplectic.metaplecticCover_kernel` (characterisation): The kernel is exactly μ₂, embedded centrally.
- `TauCeti.Metaplectic.metaplecticCover_toNormalizer` (compatibility): The cover embeds as ker λ₂ and its oscillator action is the restriction of the second projection.
- `TauCeti.Metaplectic.metaplecticCover_coboundary` (equivalence): Rescaling the chosen local section induces the native cochain extension equivalence and a homeomorphism.

**Discriminating tests.**

- `TauCeti.Metaplectic.metaplecticCover_zero` (degenerate): For W=0 the cover is μ₂.
- `TauCeti.Metaplectic.metaplecticCover_complex` (computation): Over C the cover is Sp(W)×μ₂.
- `TauCeti.Metaplectic.metaplecticCover_real` (non-example): Over R and W≠0 it is nonsplit; a homomorphic section would contradict the big-cell obstruction.

**Acceptance.**

- The projection is a local homeomorphism with two-point fibers; real positive-rank cover is nonsplit.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.1/rao-factor-set`, `MetaplecticAutomorphicForms:MP.2/leray-cocycle`, `mathlib:rootsOfUnity`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), IV.§§42–44, printed 194–199, PDF 52–57; literal excerpt PDF 53. Literal excerpt: “extension par le groupe ~ deux ~l~ments ( • 1}, ou, comme on pour- rait le dire aussi, ~ u n revdtement ~ deux feuillets.”. The continuous squared scalar character and its double-cover kernel.

**Suggested-signature boundary.** Intrinsic ker λ₂, using a native subgroup. λ₂’s construction, transport to Rao coordinates, topology and the real nonsplitting hypotheses remain explicit in the packet.

**Explicit proof/signature refinements.**

- The continuous character λ₂ and big-cell gluing proof must be turned into a concrete native topological-group signature; a raw FactorSet extension alone supplies only the algebraic group.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

### Genuine Weil representation

**Construction.** `TauCeti.Metaplectic.weilRepresentation`

Node: `MetaplecticAutomorphicForms:MP.1/genuine-oscillator`. Planet: **Weil representation**.

Restrict the normalizer’s second projection to Mp(W)=ker λ₂. This gives the unitary Weil representation ωψ on L²(X) and its smooth/Schwartz subrepresentation; the nontrivial central element acts as −id. With the Rao coordinates ωψ(g,ε)=εβ(g)r_Y(g).

**Hypotheses.** The local-field cover and actual Schrödinger model are fixed.

**Construction or proof route.**

1. Restriction of a native representation supplies the action and its group laws.
2. Use the cover embedding to compute the central action; apply the smooth-vector comparison to obtain the required model.

**Uses determining the API.**

- Kudla II.3–4; Weil III.39; MP.2–6: Restrict to dual pairs, tensor globally and form theta kernels.

**API.**

- `TauCeti.Metaplectic.weilRepresentation_apply` (simp): The operator is εβ(g)r_Y(g).
- `TauCeti.Metaplectic.weilRepresentation_central` (simp): ωψ(1,−1)=−id.
- `TauCeti.Metaplectic.weilRepresentation_modelChange` (equivalence): A unitary Heisenberg model intertwiner conjugates the intrinsic cover action; changing its scalar leaves this equivalence unchanged.

**Discriminating tests.**

- `TauCeti.Metaplectic.weilRepresentation_zero` (degenerate): For W=0, μ₂ acts on C by its sign character.
- `TauCeti.Metaplectic.weilRepresentation_genuine` (non-example): In a nonzero model the two lifts of the same g have opposite operators.
- `TauCeti.Metaplectic.weilRepresentation_identity` (compatibility): The identity lift acts by the identity native linear isometry.

**Acceptance.**

- The representation does not descend to Sp(W) when its central element acts nontrivially.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover`, `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.0/smooth-vectors`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.5 pp.23–24; II.4 pp.37–39; excerpt at PDF 23. Literal excerpt: “Weil representation (ωψ , S) .”. The normalized cover acts genuinely on the concrete model.

**Suggested-signature boundary.** Restriction of the actual normalizer oscillator to ker λ₂. z denotes its distinguished central −1 in the genuine API and tests, and the zero-space specialization has carrier ℂ. Those central and carrier identifications, normalized λ₂, strong continuity and local-field hypotheses are omitted until the packet suppliers are available.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage1`. Implementation: unchecked.

## MP.2. Weil operators and quadratic invariants

### Weil index

**Construction.** `TauCeti.Metaplectic.weilIndex`

Node: `MetaplecticAutomorphicForms:MP.2/weil-index`. Planet: **Weil index**.

For a nondegenerate quadratic form q on F^d, define γψ(q)∈U(1) as the scalar in the Fourier transform of the oscillatory distribution ψ∘q: with positive Fourier kernel ψ(x·y) and coordinate self-dual Haar, its transform at y is γψ(q)|det Bq|⁻¹/²ψ(−q(Bq⁻¹y)), where Bq(x,y)=q(x+y)−q(x)−q(y). In the Bq-self-dual measure this is γψ(q)ψ(−q(y)). This is not an absolutely convergent integral over F^d.

**Hypotheses.** F is a nondiscrete local field of characteristic different from two, ψ continuous nontrivial unitary, q nondegenerate, Bq its full polar form.

**Construction or proof route.**

1. Weil I.§14 Théorème2 defines the scalar by the Fourier distribution identity and proves it has absolute value one.
2. At nonarchimedean places choose L with ψq trivial on L and stabilize the integral over L′, the Bq-annihilator of L; normalize its finite Gauss sum to unit norm. At real places evaluate the Gaussian oscillatory integral.

**Uses determining the API.**

- Kudla I.3–4; Weil II.30 and IV.43; MP.1, 4, 6: Normalize the cocycle, prove its global product formula and compare Siegel–Weil sections.

**API.**

- `TauCeti.Metaplectic.weilIndex_distribution` (characterisation): The Fourier transform identity above characterizes γψ(q).
- `TauCeti.Metaplectic.weilIndex_norm` (structure): |γψ(q)|=1.
- `TauCeti.Metaplectic.weilIndex_isometry` (functoriality): Isometric quadratic forms have equal Weil index.
- `TauCeti.Metaplectic.weilIndex_gaussSum` (compatibility): For ψq-trivial L, γ is the unit normalization of vol(L)Σ_{L′/L}ψ(q(x)).

**Discriminating tests.**

- `TauCeti.Metaplectic.weilIndex_zero` (degenerate): The zero-dimensional form has γ=1.
- `TauCeti.Metaplectic.weilIndex_real` (computation): For ψ(t)=e^{2πit} on R, γψ(ax²)=e^{πi sgn(a)/4} for a≠0.
- `TauCeti.Metaplectic.weilIndex_q2` (computation): For ψ₂(t)=e^{−2πi frac₂(t)} on Q₂, γψ₂(x²)=(1−i)/√2, from the lattice quotient ½Z₂/Z₂.
- `TauCeti.Metaplectic.weilIndex_hyperbolic` (compatibility): The hyperbolic form xy has index one with the same Fourier convention.

**Acceptance.**

- The index of the zero-dimensional form is one, and dyadic lattices require ψq triviality, not only polar self-duality.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§14 Théorème2, printed 161–162, PDF 19–20; II.§§24–28; literal excerpt PDF 19. Literal excerpt: “Soit / un caract~re du second degrg non ddgdndrd de G, associg ~t l'iso- morphisme symdtrique ~ de G sur G*. Alors / poss~de une trans/ormge de Fourier 7(]), donnde”. The quadratic character’s Fourier scalar, with the polar matrix and self-dual measure pinned.

**Suggested-signature boundary.** Distribution identity fragment; FT is the supplier’s distributional transform, a is the signed-polar determinant modulus and h its inverse. The dyadic test requires the packet’s Q₂ character and lattice quotient, omitted from this generic native signature.

**Explicit proof/signature refinements.**

- AL.0 Part II must supply Fourier transforms of oscillatory distributions and finite-dimensional self-dual measure; the native Fourier integral on integrable functions cannot itself define γ.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Weil index and Hilbert symbol

**Theorem.** `TauCeti.Metaplectic.weilIndex_hilbertSymbol`

Node: `MetaplecticAutomorphicForms:MP.2/weil-index-identities`. Planet: **Weil index identities**.

The index is multiplicative under orthogonal sums, invariant under isometry and trivial on hyperbolic planes, with γψ(−q)=γψ(q)⁻¹. For η=ψ/2 define γ(a,η)=γ(η a x²)/γ(η x²). Then γ(ab,η)=(a,b)F γ(a,η)γ(b,η), γ(a,ηb)=(a,b)F γ(a,η), γ(a,η)²=(−1,a)F and γ(a,η)⁴=1. If q=Σa_ix_i², γψ(q)=γ(det q,ψ)γψ(x²)^d∏_{i<j}(a_i,a_j)F; det q means ∏a_i, not det Bq=2^d∏a_i.

**Hypotheses.** F is a local field of characteristic different from two, including Q₂ and R; all a_i and a,b are nonzero. The Hilbert symbol and local Hasse invariant are imported from QuadraticFormInvariants 6C.

**Construction or proof route.**

1. Weil II.§25 gives the Witt-group character and II.§§27–28 reduce nonarchimedean evaluation to Gauss sums and the quaternion norm.
2. Apply the two-variable identity and induction on a diagonalization to obtain Kudla I.4 Lemmas4.1–4.2. Keep the factors of 2 in converting between q and Bq.

**Acceptance.**

- Over R, (−1,−1)=−1 and γ(−1,ψ)=−i; the square identity detects a missing phase.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/weil-index`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.4 pp.17–18 Lemmas4.1–4.2; excerpt at PDF 17. Literal excerpt: “Hilbert symbol of F . In particular, a character of”. The normalized index identities, with real and dyadic places included.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Leray quadratic form

**Construction.** `TauCeti.Metaplectic.lerayForm`

Node: `MetaplecticAutomorphicForms:MP.2/leray-form`. Planet: **Leray invariant**.

For Lagrangians L₀,L₁,L₂ in a symplectic W, form the nondegenerate Leray quadratic space after quotienting by R=(L₀∩L₁)+(L₁∩L₂)+(L₂∩L₀). The reduced Lagrangians are the images ((L_i∩R⊥)+R)/R in R⊥/R. For transverse pairs, express L₂ as the graph of T:L₁→L₀ and use q_T(y)=½ω(y,Ty), with the sign chosen to match Kudla’s cocycle formula.

**Hypotheses.** Characteristic different from two; use the symplectic quotient by the isotropic R and quotient out the radical of the resulting quadratic form if needed.

**Construction or proof route.**

1. The transverse graph construction is invariant under symplectic isomorphisms.
2. Reduce arbitrary triples by their pairwise intersections, using image subspaces rather than an invalid quotient of L_i by all of R. Verify cyclic and sign conventions against the explicit three-line example.

**Uses determining the API.**

- Kudla I.3 Prop.3.1; MP.1: Describe composition of unitary polarization intertwiners by the Weil index.

**API.**

- `TauCeti.Metaplectic.lerayForm_graph` (simp): On the transverse graph model its quadratic value is ½ω(y,Ty).
- `TauCeti.Metaplectic.lerayForm_isometry` (functoriality): A common symplectic isometry induces an isometry of Leray forms.
- `TauCeti.Metaplectic.lerayForm_reduction` (compatibility): The general triple is the transverse construction on its reduced symplectic quotient.

**Discriminating tests.**

- `TauCeti.Metaplectic.lerayForm_repeated` (degenerate): For L₀=L₁, the Leray form is zero.
- `TauCeti.Metaplectic.lerayForm_rankOne` (computation): In W=F² with ω(e₀,e₁)=1, L₀=Fe₀,L₁=Fe₁,L₂=F(e₀+e₁) gives q(y)=−½y².
- `TauCeti.Metaplectic.lerayForm_quotient` (non-example): With L₀=L₁ transverse to L₂, R=L₀ is not contained in L₂; the image formula is defined whereas (L₂∩R⊥)/R is not.

**Acceptance.**

- Repeated Lagrangians give the zero form.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, `MetaplecticAutomorphicForms:MP.2/weil-index`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.3 pp.11–13; excerpt at PDF 12. Literal excerpt: “L(Y0 , Y1 , Y2 ) := L(Y0,R , Y1,R , Y2,R ).”. The quadratic space of a Lagrangian triple; quotient notation is corrected as recorded in sourceIssues.

**Suggested-signature boundary.** Transverse graph q=½ω(y,Ty); the general triple requires the native perpendicular-quotient bridge. In the reduction API D and R are the source reduction domain and radical, and reducedForm is the constructed transverse quotient form. Descent and source identification remain omitted supplier conditions. The quotient example checks a native image under the quotient map, avoiding a quotient by R outside its domain.

**Explicit proof/signature refinements.**

- The general quotient’s transversality and the integral-composition proof require Rao’s argument; the graph sign is checked directly from Kudla p.11. That referenced proof has not been read.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Leray cocycle of intertwiners

**Theorem.** `TauCeti.Metaplectic.leray_cocycle`

Node: `MetaplecticAutomorphicForms:MP.2/leray-cocycle`.

For the unitary normalized integral operators r_Y(g), their factor set is c_Y(g₁,g₂)=γψ(L(Y,Yg₁⁻¹,Yg₂⁻¹g₁⁻¹))=γψ(L(Y,Yg₂⁻¹,Yg₁)). This obeys normalization and the two-cocycle identity because it computes actual operator composition.

**Hypotheses.** Use Kudla’s right action on W and the same q-versus-polar-form convention as the index and Leray nodes; source convention conversion is explicit.

**Construction or proof route.**

1. Evaluate the double intertwining integral by Fourier inversion, then identify its residual oscillatory integral with the reduced Leray form.
2. The unitary scalar is the Weil index. Associativity of operators supplies the cocycle identity even across Bruhat boundaries.

**Acceptance.**

- For g₁=1 or g₂=1 the Leray form is zero and the factor is one.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/schroedinger-model`, `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.2/weil-index`, `MetaplecticAutomorphicForms:MP.2/leray-form`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.3 Theorem 3.1 p.13; excerpt at PDF 13. Literal excerpt: “Theorem 3.1. Let W = X + Y be a complete polarization. The cocycle cY”. The factor set is tied to the actual intertwining operators.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Kudla refers the integral-composition proof to Rao; exact quotient integral normalizations must be checked before promoting this proof route to closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Weil operators on generators

**Theorem.** `TauCeti.Metaplectic.weil_generators`

Node: `MetaplecticAutomorphicForms:MP.2/generator-operators`. Planet: **Weil operators**.

In the polarized nonarchimedean model, the scalar-normalized integral operators satisfy r(m(a))φ(x)=|det a|^{1/2}φ(xa), r(n(b))φ(x)=ψ(½x bᵗx)φ(x), and r(w) is the self-dual Fourier operator for the explicitly chosen w. The double-cover action is εβ(g)r(g), hence the Levi acquires the Weil-index character and Fourier the corresponding Weil factor. For an orthogonal space V of dimension m, ω(m(a),ε)φ(x)=χV,ψ(det a,ε)|det a|^{m/2}φ(xa), ω(n(b))φ(x)=ψ(½tr(b·Gram(x)))φ(x), and ω(w)φ=γ(ψ∘V)^{−n} times the negative-kernel Fourier transform for Kudla’s w.

**Hypotheses.** F is nonarchimedean, char≠2, b symmetric; the self-dual measure is fixed. χV,ψ depends on m parity and the signed discriminant. Source right-action matrices are used consistently.

**Construction or proof route.**

1. Kudla I.2 Prop.2.3 gives the quotient integral and its unique positive Haar normalization; on generators compute it by substitution and Fourier inversion.
2. Apply β and tensor m copies to get II.4 Proposition 4.3. Kudla and Zhang print the same Weyl matrix but use different group-action conventions; convert the source action by inversion, then use reflection to compare positive and negative Fourier kernels.

**Acceptance.**

- At an unramified odd place the integral indicator is fixed. At Q₂ no unsupported integral splitting is inferred.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/genuine-oscillator`, `MetaplecticAutomorphicForms:MP.2/weil-index`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.2 pp.8–10; II.4 pp.35–39; excerpt at PDF 37. Literal excerpt: “Proposition 4.3. Let χV be the quadratic character of F × deﬁned by”. The scalar and μ₂ normalizations are distinguished; the Fourier sign is fixed by the actual Weyl matrix.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Generator relations and intrinsic comparison

**Comparison.** `TauCeti.Metaplectic.weil_generatorRelations`

Node: `MetaplecticAutomorphicForms:MP.2/operator-relations`.

The unipotent, Levi and Fourier operators satisfy their presentation relations with exactly the Rao central factors; their action is the intrinsic genuine representation obtained from the normalizer. In particular Fourier squared is reflection times its Weil scalar, and conjugating a unipotent by Fourier gives the opposite unipotent with its prescribed phase.

**Hypotheses.** Use the same Weyl element, Haar measure, q and character as the generator theorem; the cover lift is part of the data.

**Construction or proof route.**

1. Use the intertwiner covariance and one-dimensionality to reduce each relation to a scalar. Evaluate that scalar by the Weil-index Fourier identity.
2. Check the Bruhat generation and relations, using Weil V.§§46–47 for the big cell; identify the normalized intertwining operators.

**Acceptance.**

- Over R positive Fourier applied twice is reflection; omitting the index phase fails the cover’s central relation.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `MetaplecticAutomorphicForms:MP.1/intertwiner-lines`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), I.§13, printed 160, PDF 18; I.§14 relation(9), PDF 19; literal excerpt PDF 18. Literal excerpt: “monomorphismes, dans Bo(G), du groupe des automorphismes de G, et du groupe X2(G), respectivement; et, quand ~, /, ~ sont comme ci-dessus, on a :”. The presentation check ties explicit operators to the intrinsic representation.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Weil’s big-cell proof continuation and the complete presentation-to-operator calculation must be checked; this node records the exact comparison target rather than assuming all generator formulas define a representation.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Character change and dual Weil models

**Comparison.** `TauCeti.Metaplectic.weil_characterChange`

Node: `MetaplecticAutomorphicForms:MP.2/character-and-dual`.

For ψa(t)=ψ(at), compare the oscillator model with the one for the scaled symplectic form aω; if a=b² the coordinate scaling by b gives an intertwiner and theta modules are unchanged up to the stated group conjugation. Complex conjugation changes ψ to ψ⁻¹; the contragredient Weil action is the ψ⁻¹ action. On scalar-circle covers, the tensor product of two weight-one models needs λ₂⁻¹, and the dual model needs λ₂, to give scalar weight zero for the descended tensor and scalar weight one for the normalized dual.

**Hypotheses.** a∈F×; for unitary models use continuous ψ and Hilbert dual/conjugate. The μ₂ cover and scalar-circle cover are distinguished.

**Construction or proof route.**

1. Compute translations and modulations under coordinate scaling, using the self-dual measure change.
2. Complex conjugate every operator and normalize by the index conjugation law. On the scalar cover use λ₂(z)=z² to check the corrected weights.

**Acceptance.**

- The scalar weights are 2−2=0 for a descended tensor product and −1+2=1 for its normalized dual.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/genuine-oscillator`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.1 p.5; II.4 Remark 4.1 p.37; excerpt at PDF 36. Literal excerpt: “λ(z) = z 2 and whose kernel is the”. Character/dual conversion and corrected scalar-circle tensor twists.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Quadratic uncertainty principle

**Theorem.** `TauCeti.Metaplectic.weil_quadraticUncertainty`

Node: `MetaplecticAutomorphicForms:MP.2/quadratic-uncertainty`.

Let (V,q) be a nondegenerate quadratic space over nonarchimedean F, char F≠2, with conductor-zero ψ and self-dual Fourier transform. If φ∈S(V) has support in {q>0 in valuation, i.e. q∈p_F} and its Fourier transform has support in {q∈O_F}, then φ=0 identically. Corollary8.1.4 says that supp φ⊂{val q>0} and a scalar-multiple Fourier eigenfunction condition also force φ=0.

**Hypotheses.** The inequalities refer to valuation, not an order on F; the exact strict/non-strict source sets must be collated before the signature.

**Construction or proof route.**

1. The support hypotheses make φ and its Fourier transform fixed by the two specified unipotent groups.
2. These generate SL₂, hence invariance under N(F) forces support on the null cone; local constancy then forces φ=0. For odd dimension reduce by the doubling argument.

**Acceptance.**

- Dyadic F is not excluded solely by char F≠2; the generated-unipotent argument and normalization must be checked there.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.2/operator-relations`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Source match.**

- [PAPER-LI-ZHANG-22-B](https://arxiv.org/pdf/1908.01701v3), Proposition 8.1.2, Corollary8.1.4 PDF 56–57; excerpt at PDF 57. Literal excerpt: “uncertainty principle is also used in the new proof by Beuzart-Plessis [BP19]”. The quadratic support theorem uses valuation inequalities.

**Routed items.** `PAPER-LI-ZHANG-22-B/23`.

**Suggested-signature boundary.** Native support conclusion with valuation(0)=top, so isotropic points are retained. The actual nonarchimedean valuation, nondegenerate quadratic/Hermitian datum, self-dual Fourier transform and local-field hypotheses are required by the packet. No statement for arbitrary FT or valuation is claimed.

**Explicit proof/signature refinements.**

- The native valuation and finite-dimensional Schwartz carriers must be supplied by AL.0 Part II; the proof and exact strict/non-strict cone definitions were read, including residue characteristic2.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Hermitian uncertainty principle

**Theorem.** `TauCeti.Metaplectic.weil_hermitianUncertainty`

Node: `MetaplecticAutomorphicForms:MP.2/hermitian-uncertainty`.

For the Hermitian trace quadratic form of Li–Zhang, apply the quadratic uncertainty theorem with q(x)=the source half-trace pairing. The Hermitian support and transformed support hypotheses imply φ=0, with no identification of q with the unscaled trace norm.

**Hypotheses.** The nonarchimedean Hermitian datum, ψ and self-dual measure of Proposition 8.1.6; exact valuation support sets retained.

**Construction or proof route.**

1. Identify the F-quadratic form from the Hermitian pairing.
2. Check the Fourier characters and measure under that identification, then apply Proposition 8.1.2.

**Acceptance.**

- A factor of2 in the trace form changes its self-dual Haar measure.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/quadratic-uncertainty`, `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Source match.**

- [PAPER-LI-ZHANG-22-B](https://arxiv.org/pdf/1908.01701v3), Proposition 8.1.6 PDF 57–58; excerpt at PDF 57. Literal excerpt: “hermitian space with respect to a (possibly”. Hermitian-to-quadratic Fourier adapter.

**Routed items.** `PAPER-LI-ZHANG-22-B/24`.

**Suggested-signature boundary.** Native support conclusion with valuation(0)=top, so isotropic points are retained. The actual nonarchimedean valuation, nondegenerate quadratic/Hermitian datum, self-dual Fourier transform and local-field hypotheses are required by the packet. No statement for arbitrary FT or valuation is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

### Hermitian oscillator normalizations

**Comparison.** `TauCeti.Metaplectic.weil_hermitianNormalizations`

Node: `MetaplecticAutomorphicForms:MP.2/hermitian-operator-normalizations`.

Compare the Hermitian Weil operators in Li–Liu22, Li–Zhang22B, Disegni–Liu24 and Zhang21 with MP.2: m(a) has the specified character and |det a|_E^{dim_E V/2}, n(b) has ψ(tr bT(x)), and w has γ_V^{rank} times the positive Fourier transform for the source’s chosen trace pairing. Zhang’s even quadratic formula uses χV(a)=(a,(−1)^{dim V/2}det q)_F. His AppendixA gives γ_V=η(det Hermitian V)ε(η, 1/2,ψ)^{dim_E V} and the hyperbolic constant1.

**Hypotheses.** Even dimension where descent is asserted; exact quadratic determinant versus polar determinant; each source’s w and group action converted before comparing signs.

**Construction or proof route.**

1. Expand the trace pairing in a diagonal basis and apply Weil-index/Hilbert identities.
2. Compare unipotent and Levi generators directly and Fourier generators with the inverse/right-action dictionary; import the epsilon-factor evaluation from AL.2.

**Acceptance.**

- Do not identify a source’s w matrix with an opposite matrix when the difference is actually left versus right action.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Source match.**

- [PAPER-LI-LIU-22](https://arxiv.org/pdf/2101.09485v2), §§2.1, 3.1 PDF 11, 43–44; excerpt at PDF 11. Literal excerpt: “Fourier transform φb is defined by”. Ramified Hermitian Fourier convention.
- [PAPER-LI-ZHANG-22-B](https://arxiv.org/pdf/1908.01701v3), §§1.7, 8.1, 12.3 PDF 8–9, 56, 78–79; excerpt at PDF 56. Literal excerpt: “Weil representation ω of SL2 (F ). The group SL2 (F ) acts”. Hermitian generator normalization.
- [PAPER-DISEGNI-LIU-24](https://arxiv.org/pdf/2204.09239v3), §4.1 H7 PDF 40–41; excerpt at PDF 40. Literal excerpt: “Weil representations. Let π be a relevant L-”. Coefficient-valued finite-place formulas.
- [PAPER-ZHANG-21](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), §11.1 PDF 70–71 and AppendixA PDF 108–109; excerpt at PDF 70. Literal excerpt: “Weil represen- tation.”. Even quadratic and Hermitian phase conventions.

**Routed items.** `PAPER-LI-LIU-22/47`, `PAPER-LI-LIU-22/48`, `PAPER-LI-ZHANG-22-B/21`, `PAPER-LI-ZHANG-22-B/22`, `PAPER-ZHANG-21/89`, `PAPER-ZHANG-21/127`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The γ_V=−1 assertion for the specific nonsplit Hermitian datum in Li–Zhang Lemma 6.3.1 and Zhang’s Deligne epsilon-factor input need original proof closure. General Fourier theory stays with AL.0/AL.2.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage2`. Implementation: unchecked.

## MP.3. Local theta correspondence

### Orthogonal–symplectic dual pair

**Construction.** `TauCeti.Metaplectic.orthogonalSymplecticEmbedding`

Node: `MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair`. Planet: **Reductive dual pairs**.

For a nondegenerate symmetric space (V,b) and symplectic space (W,ω) over F, give V⊗F W the alternating form b⊗ω and embed O(V)×Sp(W) into its native isometry group by tensoring the two actions. The images commute. When V,W are nonzero, each is the full centralizer of the other; for zero factors state only the embedding map, with its actual kernel.

**Hypotheses.** char F≠2; finite-dimensional spaces; b and ω nondegenerate. The tensor-product map can have diagonal scalar kernel, so injectivity of the product map is not asserted.

**Construction or proof route.**

1. Construct the tensor pairing from the native tensor-product universal property and prove nondegeneracy in supplied bases.
2. Use double-centralizer linear algebra for the nonzero case, or import the matching classical-group result from upstream.

**Uses determining the API.**

- Kudla II.4; MP.3 local theta: Restrict the oscillator representation to commuting groups.

**API.**

- `TauCeti.Metaplectic.tensorSymplecticForm` (constructor): The form evaluates on pure tensors as b(v,v′)ω(w,w′).
- `TauCeti.Metaplectic.dualPair_commute` (compatibility): The O(V) and Sp(W) actions commute on V⊗W.
- `TauCeti.Metaplectic.dualPair_kernel` (characterisation): For nonzero factors the kernel is the simultaneous scalar pairs (aI,a⁻¹I) admitted by the two groups.

**Discriminating tests.**

- `TauCeti.Metaplectic.dualPair_line` (computation): For V=F, the Sp(W) action is its native defining action.
- `TauCeti.Metaplectic.dualPair_zero` (degenerate): For V=0 the target space and its isometry group are trivial; the product map need not be injective.
- `TauCeti.Metaplectic.dualPair_minus` (non-example): The pair (−I,−I) acts trivially on V⊗W, so the product homomorphism is not an embedding with trivial kernel.

**Acceptance.**

- For V=F with b=1 the tensor space is W; (−1,−I) is in the product kernel.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/isometry-action`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), II.1, PDF 29–30, tensor orthogonal–symplectic pair; literal excerpt PDF 30. Literal excerpt: “and there is a natural map                               G(V ) × G(W ) −→ Sp(W)”. Tensor embedding and its centralizers.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Cover over orthogonal–symplectic pairs

**Theorem.** `TauCeti.Metaplectic.orthogonalCover_parity`

Node: `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`. Planet: **Metaplectic parity**.

The scalar cover pulls back to O(V)×Sp(W). O(V) has the Schrödinger splitting h↦[φ(x)↦φ(h⁻¹x)]. The restriction over Sp(W) of the μ₂ cover is trivial when m=dim V is even and is the metaplectic cover of W when m is odd. The tensor Weil representation consequently descends to O(V)×Sp(W) for even m and is genuine on O(V)×Mp(W) for odd m.

**Hypotheses.** F is a characteristic-not-two local field; a nontrivial continuous ψ and compatible Haar measures are fixed. The orthogonal action is the specified splitting, not a uniqueness claim.

**Construction or proof route.**

1. Compute the pullback cocycle using orthogonal diagonalization and the Weil-index identities.
2. Use Kudla II.2–4 to compare its scalar weight and λ₂; record the actual splitting over O(V).

**Acceptance.**

- m=1 gives a genuine action of Mp(W), while a hyperbolic plane has m=2 and gives a linear Sp(W) action.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair`, `MetaplecticAutomorphicForms:MP.1/genuine-oscillator`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), II.3 Corollary3.3, PDF 36; cocycle comparison Proposition 3.2 PDF 35; literal excerpt PDF 36. Literal excerpt: “Corollary 3.3. The homomorphism jV : Sp(W ) → Sp(W) lifts uniquely to a homomorphism j˜V : M p(W ) → M p(W) whose restriction to C× takes z to z m .”. Parity of the symplectic restriction and the orthogonal splitting.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Unitary dual-pair splittings

**Construction.** `TauCeti.Metaplectic.unitaryWeilRepresentation`

Node: `MetaplecticAutomorphicForms:MP.3/unitary-splitting`. Planet: **Unitary Weil representation**.

For E/F quadratic, an ε-Hermitian V and a −ε-Hermitian W, construct their commuting actions on the F-symplectic tensor space with trace pairing. A pair of characters χV,χW of E× with χV|F×=ωE/F^dim V and χW|F×=ωE/F^dim W gives the two compatible scalar-cover splittings and the Weil representation ωψ,χV,χW. Record dependence on those characters and on the trace-zero δ used to write the pairing.

**Hypotheses.** Characteristic zero local F; E/F quadratic field or split étale algebra. Hermitian forms nondegenerate. Each splitting uses the matching dimension and character restriction.

**Construction or proof route.**

1. Form the trace pairing and import the Hermitian group carriers from the classical-group supplier.
2. Apply Kudla’s unitary splitting construction with the dimension characters; identify coordinate changes in δ by the explicit isometry.

**Uses determining the API.**

- Gan–Ichino §§3–4; Li–Liu Proposition 3.6: Normalize the unitary theta modules and root-number dichotomy.

**API.**

- `TauCeti.Metaplectic.unitarySplitting_cocycle` (characterisation): Each splitting cochain cancels the pulled-back scalar cocycle.
- `TauCeti.Metaplectic.unitarySplitting_character_change` (functoriality): Replacing an auxiliary character by a character trivial on F× twists by the corresponding determinant character.
- `TauCeti.Metaplectic.unitarySplitting_delta` (compatibility): Changing δ gives the transported trace symplectic space and its intertwining equivalence.

**Discriminating tests.**

- `TauCeti.Metaplectic.unitarySplitting_zero` (degenerate): For V=0 the tensor symplectic space is zero and the oscillator action is the trivial line, with the stated character restriction still recorded.
- `TauCeti.Metaplectic.unitarySplitting_restriction` (non-example): A character whose restriction to F× is not ωE/F^dim V is rejected as splitting data.
- `TauCeti.Metaplectic.unitarySplitting_twist` (compatibility): Two valid characters differing by ξ produce the determinant twist ξ∘det on the relevant unitary factor.

**Acceptance.**

- The resulting correspondence depends on ψ only through its norm-class orbit; dependence on arbitrary choices is not silently suppressed.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Source match.**

- [GanIchino16](https://arxiv.org/pdf/1409.6824v2), §4 local theta setup, arXiv-v2 PDF 11–12. Literal excerpt: “splitting of the metaplectic cover over U(V ) × U(W ), as shown in [37], [25]. In fact, it does not depend on the choice of δ.”. The character restrictions in the unitary setup.

**Suggested-signature boundary.** Unitary splitting fragment. χV and χW must satisfy the quadratic-character restrictions on the native F× inclusion. ξ denotes the quotient character pulled back by the determinant. The zero tensor-space test specializes the actual oscillator carrier to ℂ. Local field, extension, dimensions, polarization and determinant bridges remain the packet hypotheses.

**Explicit proof/signature refinements.**

- The cited papers invoke Kudla’s unitary splitting formula; its original proof and exact δ convention must be collated. The generic Hermitian-space carrier belongs to upstream ClassicalGroups, not to this packet.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Big theta module

**Construction.** `TauCeti.Metaplectic.bigTheta`

Node: `MetaplecticAutomorphicForms:MP.3/big-theta-module`. Planet: **Big theta module**.

For commuting G×H actions on the oscillator space S and an irreducible admissible smooth G-representation π over C, define Θ(π)=(S⊗π∨)G using algebraic smooth coinvariants. Equivalently the maximal π-isotypic quotient of S is π⊗Θ(π). Restrict to the matched central characters so that the central kernel acts trivially. The H action descends by its commutation with G.

**Hypotheses.** Nonarchimedean local field and the specified dual pair/splittings. π∨ is the smooth contragredient, not the full algebraic dual. The maximal-isotypic comparison uses admissibility and Schur’s lemma.

**Construction or proof route.**

1. Import coinvariants, smooth dual and quotient actions from SR.0/SR.2.
2. Prove the Hom adjunction for the tensor coinvariants and use admissible Schur to identify the maximal π-isotypic quotient.

**Uses determining the API.**

- Kudla II.3; Gan–Takeda Theorem 1.1: State finite length, Howe duality, and see-saw without conflating big and small lifts.

**API.**

- `TauCeti.Metaplectic.bigTheta_hom` (universal-property): HomH(Θ(π),σ)≃HomG×H(S,π⊗σ) for admissible π and the correct smooth dual.
- `TauCeti.Metaplectic.bigTheta_equivariant` (structure): The H action preserves the G-coinvariant relations.
- `TauCeti.Metaplectic.bigTheta_isotypic` (compatibility): The maximal π-isotypic quotient of S is π⊗Θ(π).

**Discriminating tests.**

- `TauCeti.Metaplectic.bigTheta_character_mismatch` (non-example): If the common central element acts oppositely on S and π, the coinvariant quotient is zero.
- `TauCeti.Metaplectic.bigTheta_trivial_factor` (degenerate): For G=1 and π=C the quotient is S with its H action.
- `TauCeti.Metaplectic.bigTheta_quotient` (characterisation): Every G-equivariant map S→π⊗σ factors uniquely through the maximal π-isotypic quotient.

**Acceptance.**

- Do not replace Θ by its irreducible quotient or claim Θ is always irreducible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`, `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:Representation.Coinvariants`, `mathlib:Representation.Coinvariants.mk`, `mathlib:Representation.Coinvariants.lift`, `mathlib:Representation.IntertwiningMap`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), II.2, PDF 32–33, maximal isotypic quotient and its theta factor; literal excerpt PDF 32. Literal excerpt: “S(π) be the maximal quotient of S on which G̃ acts as a multiple of π . A little”. The maximal isotypic quotient definition and its theta multiplicity space.

**Suggested-signature boundary.** Algebraic tensor coinvariant adapter, defined as a type synonym of native Coinvariants. πdual is the SR.3 smooth dual, with a commuting H-action on the tensor product. In the isotypic API P is the actual π carrier and kernel the maximal π-isotypic kernel. The algebraic universal-map API omits H-equivariance and the smooth-dual adjunction; both remain mandatory before using the full source Hom comparison.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Small theta quotient

**Construction.** `TauCeti.Metaplectic.smallTheta`

Node: `MetaplecticAutomorphicForms:MP.3/small-theta-module`.

Define θ(π) as the maximal semisimple quotient of the finite-length big theta module in the source category. Under a stated Howe theorem, it is zero or irreducible. Define no arbitrary chosen irreducible summand when Howe duality has not been established.

**Hypotheses.** The big theta module is finite length. The semisimple quotient and radical are imported from SR.0/SR.3; archimedean variants use AF.1.

**Construction or proof route.**

1. Take the radical quotient and prove its universal property among semisimple quotients.
2. Apply the source-qualified multiplicity-one theorem for the zero-or-irreducible assertion.

**Uses determining the API.**

- Gan–Takeda Theorem 1.1 and Gan–Ichino theta parameters: Use Howe duality on the small lift with its exact quotient convention.

**API.**

- `TauCeti.Metaplectic.smallTheta_projection` (constructor): The natural Θ(π)→θ(π) is surjective.
- `TauCeti.Metaplectic.smallTheta_semisimple` (structure): θ(π) is semisimple in the supplied smooth category.
- `TauCeti.Metaplectic.smallTheta_factor` (universal-property): Every map from Θ(π) to a semisimple object factors uniquely through θ(π).

**Discriminating tests.**

- `TauCeti.Metaplectic.smallTheta_zero` (degenerate): The radical quotient of the zero big lift is zero.
- `TauCeti.Metaplectic.smallTheta_simple` (compatibility): For an irreducible big lift the projection is an isomorphism.
- `TauCeti.Metaplectic.smallTheta_extension` (non-example): For a nonsplit extension 0→A→M→B→0 with unique simple quotient B, the maximal semisimple quotient is B, not A⊕B.

**Acceptance.**

- A nonzero big lift may be a nonsplit extension even though its small quotient is irreducible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Representation.Coinvariants.mk`, `mathlib:Representation.IntertwiningMap`.

**Source match.**

- [GanTakeda16](https://arxiv.org/pdf/1407.1995v4), §1 PDF 1–2; excerpt at PDF 1. Literal excerpt: “maximal semisimple quotient θ(π). One has the following fundamental conjecture due to”. Definition of small theta as the maximal semisimple quotient.

**Suggested-signature boundary.** Quotient by the native radical supplied by the finite-length smooth category. This signature neither defines the radical by an assumed Prop field nor asserts semisimplicity for an arbitrary quotient.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Finite length of theta modules

**Theorem.** `TauCeti.Metaplectic.bigTheta_finiteLength`

Node: `MetaplecticAutomorphicForms:MP.3/theta-finite-length`.

For a type-I reductive dual pair over a nonarchimedean characteristic-zero local field and irreducible admissible π, Θ(π) is an admissible smooth H-module of finite length. At archimedean places state the corresponding finitely generated admissible (g,K)-module result on the oscillator Harish-Chandra module, with its own source gate.

**Hypotheses.** The matched central character and source splittings are fixed. Generic admissibility, Jacquet exactness and finite-length criteria belong to SR.2/SR.3; Harish-Chandra modules belong to AF.1.

**Construction or proof route.**

1. Use the finite-generation/compact-open argument for the oscillator quotient; apply the smooth admissibility theorem cited in Kudla II.3.
2. For the archimedean comparison use the K-finite oscillator module and the matching Howe module theorem; do not infer it from the nonarchimedean proof.

**Acceptance.**

- The source’s finite-length theorem does not make a big lift irreducible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, `mathlib:IsArtinian`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), II.2 pp31–33, isotypic quotient and admissibility; excerpt at PDF 33. Literal excerpt: “of ﬁnite length.”. Admissibility and finite length are assertions about the big module.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The generic SR criteria are requested; the exact archimedean finite-generation proof and its globalization/automatic-continuity bridge remain unverified.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Howe duality

**Theorem.** `TauCeti.Metaplectic.howeDuality`

Node: `MetaplecticAutomorphicForms:MP.3/howe-duality`. Planet: **Howe duality**.

For an orthogonal–symplectic or unitary type-I pair over a nonarchimedean local field of characteristic different from two, θ(π) is zero or irreducible, and nonzero θ(π)≃θ(π′) implies π≃π′. This includes residue characteristic two. For quaternionic pairs use the additional theorem explicitly, rather than treating Gan–Takeda’s partial quaternionic statement as full Howe duality. For real or complex type-I pairs, use the archimedean Howe theorem in the appropriate Harish-Chandra/smooth-globalization category; this is a separate original-source input, not a consequence of Gan–Takeda’s nonarchimedean theorem.

**Hypotheses.** The smooth representations are irreducible admissible and genuine where required. Gan–Takeda Theorem 1.2 is the full orthogonal/symplectic/unitary theorem; its Theorem 1.3 only gives scoped quaternionic conclusions. Archimedean Harish-Chandra modules/globalizations and Howe’s original theorem require AF.1 and the stated source gap; no extension to arbitrary algebraic representations is asserted.

**Construction or proof route.**

1. Apply the normalized doubling filtration to reduce nonboundary π to the regular representation quotient and multiplicity one.
2. In boundary cases use the oscillator Jacquet filtration and induction on the smaller dual pair; the type-II input is supplied separately.

**Acceptance.**

- Q₂ orthogonal–symplectic pairs are covered; general quaternionic pairs require Gan–Sun, not a changed hypothesis on Kudla’s odd-residue theorem.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/small-theta-module`, `MetaplecticAutomorphicForms:MP.3/theta-finite-length`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Source match.**

- [GanTakeda16](https://arxiv.org/pdf/1407.1995v4), Theorem 1.2 and(HD), PDF 2; proof §§4–6 PDF 9 onward; literal excerpt PDF 2. Literal excerpt: “Theorem 1.2. The Howe duality conjecture (HD) holds for the pair G(W ) × H(V ).      Let us make a few remarks:”. Full theorem with characteristic and pair scope separated.
- [PAPER-GAN-ICHINO-18](https://arxiv.org/pdf/1705.10106v3), §2.2, arXiv-v3 PDF 8; excerpt at PDF 8. Literal excerpt: “by the Howe duality [35, 90, 26], Θψ (π) has a unique”. Classical local Howe input across characteristic-zero places. The archimedean original source and category comparison remain explicit gaps.
- [PAPER-GAN-SAVIN-23](https://arxiv.org/pdf/2102.00372v1), §14.1–14.3, arXiv-v1 PDF 50–51; excerpt at PDF 51. Literal excerpt: “by the classical Howe duality theorem, Θ′ (σ)”. The classical input to the exceptional argument; the exceptional Howe theorem itself stays at its proposed separate owner.

**Routed items.** `PAPER-GAN-ICHINO-18/howe-duality`, `PAPER-GAN-SAVIN-23/classical-howe-duality`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Gan–Takeda proof continuation PDF 11–21 and its type-II/MVW inputs need complete proof closure; the full quaternionic Gan–Sun theorem and archimedean Howe/automatic-continuity sources remain requested.
- Gan–Ichino18 and Gan–Savin23 invoke classical Howe duality. Their invocation is read; Howe’s archimedean original proof and its Harish-Chandra/globalization comparison have not been read here. Supply the full real/complex theorem with exact categories before closing this node.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Local see-saw identity

**Theorem.** `TauCeti.Metaplectic.localSeeSaw`

Node: `MetaplecticAutomorphicForms:MP.3/local-see-saw`. Planet: **See-saw identity**.

For a see-saw of commuting dual pairs inside one symplectic space with compatible splittings, identify HomH1(ΘG1(π1),π2) with HomH2(ΘG2(π2∨),π1∨), after writing the common oscillator Hom space and its exact tensor/dual conventions. State the identity first for big theta coinvariants; a small-theta version needs semisimplicity/Howe hypotheses.

**Hypotheses.** Smooth admissible modules; compatible restrictions of the same oscillator representation; archimedean version in AF.1.

**Construction or proof route.**

1. Apply the coinvariant tensor-Hom adjunction twice to the common restricted oscillator module.
2. Transport the identifications through the orthogonal-sum tensor oscillator isomorphism.

**Acceptance.**

- Tensoring by the determinant/auxiliary character of a different splitting changes both sides by that twist.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `AutomorphicFormsOnReductiveGroups:AF.1`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), IV.1 pp59–66, see-saw examples and oscillator Hom route; excerpt at PDF 60. Literal excerpt: “a natural isomorphism”. The standard see-saw statement; its use is checked independently in Gan–Ichino §5.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Kudla IV.1 pp59–66 has been read. Its common oscillator, sum tensorization and specialized application supply the route; a general native smooth tensor–Hom/dual adjunction, with the exact infinite-dimensional dual and admissibility conditions, remains to be supplied from SR and the unread original references.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Persistence and stable range

**Theorem.** `TauCeti.Metaplectic.theta_persistence_stableRange`

Node: `MetaplecticAutomorphicForms:MP.3/persistence-and-stable-range`.

In a fixed orthogonal Witt tower V_r=V_0⊕H^r paired with Sp(W), dim W=2n, a nonzero theta lift persists for larger r. Every irreducible admissible genuine π has nonzero theta lift in stable range r≥2n; in the reverse direction a fixed O(V)-representation has nonzero lift when n≥dim V. These are sufficient bounds, not minimal first-occurrence formulas.

**Hypotheses.** Nonarchimedean local F in Kudla’s stated odd-residue range; broader fields use the separately qualified nonvanishing sources.

**Construction or proof route.**

1. Use the zero-rank term in Kudla’s Jacquet filtration for persistence.
2. Construct the stable-range quotient on the open full-rank orbit and apply induction/Frobenius reciprocity.

**Acceptance.**

- A tower label includes the anisotropic kernel and oscillator enhancement; dimension alone does not distinguish towers.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `MetaplecticAutomorphicForms:MP.3/theta-finite-length`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), III.4 Propositions4.1, 4.3–4.5, PDF 44–49; literal excerpt PDF 48. Literal excerpt: “Proposition 4.3. (stable range) If r ≥ 2n , then for every π ∈ Irr(G) , Θ(π, Vr )”. Persistence and the safe stable-range bounds.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### First occurrence in a Witt tower

**Definition.** `TauCeti.Metaplectic.firstOccurrence`

Node: `MetaplecticAutomorphicForms:MP.3/first-occurrence`.

For a supplied tower V_r and π define the first-occurrence rank as the least r with ΘV_r(π)≠0, in WithTop N before nonvanishing is proved. Define the dimension index m_0+2r separately. Record the tower’s discriminant, Hasse invariant, anisotropic kernel and auxiliary splitting characters.

**Hypotheses.** Tower supplied by QuadraticFormInvariants and classical groups; nonvanishing at a finite rank is a theorem input, not part of the definition.

**Construction or proof route.**

1. Use the least element of the nonempty set after stable-range nonvanishing; retain ⊤ without that hypothesis.
2. Convert between rank and dimension only with the fixed m_0.

**Uses determining the API.**

- Sun–Zhu conservation; Gan–Ichino smaller odd towers: State vanishing and first occurrence without an implicit finite-index assumption.

**API.**

- `TauCeti.Metaplectic.firstOccurrence_nonzero` (characterisation): For finite first occurrence r₀, ΘV_r₀(π) is nonzero.
- `TauCeti.Metaplectic.firstOccurrence_vanishing` (characterisation): For r<r₀ the big lift is zero.
- `TauCeti.Metaplectic.firstOccurrence_dimension` (compatibility): The dimension index is m_0+2r₀ when r₀ is finite.

**Discriminating tests.**

- `TauCeti.Metaplectic.firstOccurrence_zero` (computation): If ΘV_0(π) is nonzero, the rank index is 0 and the dimension index is m_0.
- `TauCeti.Metaplectic.firstOccurrence_empty` (degenerate): If every lift vanishes, the index in WithTop N is ⊤.
- `TauCeti.Metaplectic.firstOccurrence_anisotropic` (non-example): Two towers with distinct anisotropic dimensions and equal rank index need not have equal dimension index.

**Acceptance.**

- Rank and dimension differ by m_0+2r and cannot share one unqualified numerical conservation formula.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `MetaplecticAutomorphicForms:MP.3/persistence-and-stable-range`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [SunZhu15](https://arxiv.org/pdf/1204.2969v3), §1.5 PDF 5–8; excerpt at PDF 7. Literal excerpt: “first occurrence index”. Enhanced towers and their dimension-index convention.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Supercuspidal first occurrence

**Theorem.** `TauCeti.Metaplectic.supercuspidal_firstOccurrence`

Node: `MetaplecticAutomorphicForms:MP.3/supercuspidal-first-occurrence`.

For a supercuspidal π in Kudla’s nonarchimedean orthogonal–symplectic range, let r₀ (respectively n₀ in the reverse direction) be first occurrence. At every larger rank the big lift is irreducible admissible and equals the small lift. At first occurrence it is supercuspidal; above first occurrence it is not supercuspidal and embeds in the normalized parabolic induction of the first lift with the explicit tower characters of III.6 Theorems6.1–6.2. Do not extend this big=small assertion to arbitrary nonsupercuspidal π.

**Hypotheses.** Nonarchimedean odd residue characteristic as in Kudla III; π irreducible supercuspidal, fixed tower and splittings.

**Construction or proof route.**

1. Apply the Jacquet filtration: all proper-radical terms vanish before the first occurrence.
2. Use the first-occurrence quotient and Howe theorem, then identify higher-rank Jacquet terms by induction.

**Acceptance.**

- No claim that every irreducible big theta module is supercuspidal.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `MetaplecticAutomorphicForms:MP.3/howe-duality`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), III.6 Theorems6.1–6.2 pp52–53; proof sketch IV.3 pp70–74; excerpt at PDF 53. Literal excerpt: “For all r ≥ r0 , Θ(π, Vr ) is an irreducible admissible representation of O(Vr ) .”. First occurrence and higher tower behavior.

**Suggested-signature boundary.** Kudla III.6: for a supercuspidal source representation, all nonzero tower ranks have irreducible big lift equal to small lift. Only first occurrence is supercuspidal. The smooth admissibility, tower identification, and normalized higher-rank induction formula require SR.2/3 and remain in the packet.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Kudla’s Jacquet filtration

**Theorem.** `TauCeti.Metaplectic.oscillator_jacquetFiltration`

Node: `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`.

For Q(X_a)⊂G(W_n), the normalized Jacquet module of ω has a finite filtration with kth quotient, 0≤k≤min(a,q_V), equal to normalized induction from Q(X_{a−k},X_a)×G(W_{n−2a})×P(Y_k) of χV|det X_{a−k}|^{s_{m,n}+(a−k)/2}⊗Cc∞(Isom_{E,c}(X_k,Y_k))⊗ω_{smaller}. Here s_{m,n}=(m−n−ε₀)/2 and (b,c) acts on f(g) by χV(det b)χW(det c)f(c⁻¹gb).

**Hypotheses.** Gan–Takeda §2 conventions; normalized induction/Jacquet functor and modulus characters; the metaplectic Levi has its genuine χψ factor. Unipotent radicals split canonically.

**Construction or proof route.**

1. Stratify the oscillator support by rank of the X_a→V coordinate and take successive quotient spaces.
2. Compute the stabilizer, its modulus and determinant characters; invoke SR.2/3 geometric lemma and induction rather than re-proving those functors.

**Acceptance.**

- k=0 has no Isom-factor; the nonempty kth quotient vanishes for k larger than the Witt index.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`, `MetaplecticAutomorphicForms:MP.3/unitary-splitting`.

**Source match.**

- [GanTakeda16](https://arxiv.org/pdf/1407.1995v4), Lemma 3.1 PDF 7–8; excerpt at PDF 7. Literal excerpt: “filtration. The first lemma describes the computation of the Jacquet modules”. Rank-orbit normalized Jacquet quotients and their exponents.

**Suggested-signature boundary.** Finite filtration carrier; the exact normalized induced quotient formulas, rank bounds, modulus characters and smaller oscillator models are in the packet and require SR.2’s Jacquet/induction APIs.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Doubling principal-series filtration

**Theorem.** `TauCeti.Metaplectic.doubling_rankFiltration`

Node: `MetaplecticAutomorphicForms:MP.3/doubling-filtration`.

For I(s)=normalized Ind_{Siegel}^{G(W⊕W⁻)}χV|det|^s, its restriction to G(W)×G(W) has rank-t quotients induced from Q_t×Q_t with characters χV|det X_t|^{s+t/2} on both GL_t factors and χV(det W⁻_{n−2t})⊗Cc∞(G(W_{n−2t})) on the remaining factors. The open-orbit quotient R_0=χV(det W⁻)⊗Cc∞G(W) is independent of s.

**Hypotheses.** Gan–Takeda normalized induction conventions; actual group dimensions and ε-Hermitian type fixed.

**Construction or proof route.**

1. Filter the doubled flag variety by orbit rank under the product group.
2. Apply the stabilizer modulus computation; regular-representation duality treats R_0 and Jacquet reciprocity treats t>0.

**Acceptance.**

- Boundary detection uses Hom_{GL_t}(χV|det|^{s+t/2},R_Qbar π)≠0, including the normalized sign.

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`.

**Source match.**

- [GanTakeda16](https://arxiv.org/pdf/1407.1995v4), Lemma 3.2, PDF 7–8, filtration of degenerate principal series; literal excerpt PDF 7. Literal excerpt: “Lemma 3.2. As a representation of G(W ) × G(W − ), I(s) possesses an equivariant filtration”. Doubling filtration separating boundary and nonboundary cases.

**Suggested-signature boundary.** Finite filtration carrier; the exact normalized induced quotient formulas, rank bounds, modulus characters and smaller oscillator models are in the packet and require SR.2’s Jacquet/induction APIs.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Type-II theta input

**Theorem.** `TauCeti.Metaplectic.typeII_theta`

Node: `MetaplecticAutomorphicForms:MP.3/type-ii-theta`.

For the split type-II pair GL_m(F)×GL_n(F), the small theta lift of an irreducible smooth representation is zero or irreducible, and nonzero lifts determine the source representation uniquely. The unequal-rank parameter formula used by a boundary argument is a separately requested Mínguez input; no general n<m vanishing is asserted.

**Hypotheses.** Smooth irreducible representations; the pair orientation and normalized action are those of Gan–Takeda’s cited Mínguez theorem.

**Construction or proof route.**

1. Identify the full-rank orbit with the regular representation at equal rank.
2. Import the generic GL representation classification from SR.3; collate the unequal-rank Mínguez theorem before using it.

**Acceptance.**

- A rank comparison alone does not force the lift of every irreducible representation to vanish.

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [GanTakeda16](https://arxiv.org/pdf/1407.1995v4), §3 proof strategy, PDF 9, cited general-linear Howe input; original Mínguez statement is a gap; literal excerpt PDF 9. Literal excerpt: “Minguez [M] in his proof of the Howe duality conjecture for general linear groups.   In Section 6, we assemble the results of Section 4 and Section 5 to complete the proof of”. The type-II input is source-qualified.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Mínguez’s original proof and the full unequal-rank parameter formula have not been read; only the cited input needed by Gan–Takeda is planned.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### MVW involution and metaplectic induction

**Comparison.** `TauCeti.Metaplectic.mvw_coverInduction`

Node: `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`.

Transport the native smooth dual/induction operations to the canonical split unipotent radicals of Mp. The MVW involution is an exact covariant functor and for irreducible π gives π^MVW≃π∨; it is not the contragredient functor on every module. On a standard Levi GL_k×Mp_{2n−2k}, τ̃ψ=(τ∘projection)⊗χψ has central −1 acting by −1 and determines normalized parabolic induction.

**Hypotheses.** Nonarchimedean characteristic-zero F for the smooth comparison; real Lie-group variants use AF.1 and their own proof. χψ is the Weil-index genuine character on the covered GL factor.

**Construction or proof route.**

1. Apply the anti-isometry of the form and the corresponding automorphism of the cover to define the covariant twist.
2. Use the irreducible MVW theorem and induction covariance with the modulus and character factors explicit.

**Acceptance.**

- For any short exact sequence the MVW twist retains arrow direction; algebraic dual reverses it.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Source match.**

- [PAPER-GAN-ICHINO-18](https://arxiv.org/pdf/1705.10106v3), §5.2–5.3 PDF 18–20, Lemma 5.2; excerpt at PDF 19. Literal excerpt: “MVW involution [63, 84], we obtain an injection”. Contragredient and induction are used with distinct variance.

**Routed items.** `PAPER-GAN-ICHINO-18/mvw-involution`, `PAPER-GAN-ICHINO-18/metaplectic-induction`.

**Suggested-signature boundary.** ρ and σ denote the stated MVW and smooth-dual realizations, or the cover-induced comparison. Only irreducible inputs have the source MVW≃dual assertion; the dual functor is not asserted covariant on all modules.

**Explicit proof/signature refinements.**

- Original MVW irreducible-duality proof and real-cover variant remain supplier/source requests; a cited use does not close those proofs.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Nonarchimedean conservation relations

**Theorem.** `TauCeti.Metaplectic.theta_conservation`

Node: `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`.

For the two enhanced Witt towers differing by the anti-split class in Sun–Zhu, the dimension first-occurrence indices satisfy n_t₁(π)+n_t₂(π)=2 dim_D U+d_{D,ε}. Here d is 4 for orthogonal, 2 for unitary, 1 for quaternionic Hermitian, 3 for quaternionic skew-Hermitian and 0 for symplectic U. In particular an Sp_{2n} representation in the two even-orthogonal towers has dimension sum 4n+4, and for O(V) the symplectic rank indices of π and π⊗det sum dim V.

**Hypotheses.** Characteristic-zero nonarchimedean F, including residue characteristic two; towers enhanced by their oscillator character; genuine π as in Theorem 1.10.

**Construction or proof route.**

1. Prove the Kudla homomorphism and its kernel on enhanced Witt data.
2. Use the nonoccurrence lower bound and degenerate principal-series quotients to prove the matching upper bound; convert dimension to rank with each anisotropic kernel explicit.

**Acceptance.**

- For Sp₂ the even-orthogonal dimension sum is 8; a formula summing their Witt ranks to 4 would be wrong.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`, `MetaplecticAutomorphicForms:MP.3/doubling-filtration`, `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [SunZhu15](https://arxiv.org/pdf/1204.2969v3), Theorem 1.10 PDF 8–10; §§5–6; excerpt at PDF 8. Literal excerpt: “conservation relations assert the following:”. Dimension-index conservation, not a universal rank-only formula.

**Routed items.** `PAPER-GAN-ICHINO-18/conservation-relation`, `PAPER-ICHINO-PRASANNA-23/085`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Archimedean first-occurrence cases

**Theorem.** `TauCeti.Metaplectic.theta_archimedeanFirstOccurrence`

Node: `MetaplecticAutomorphicForms:MP.3/archimedean-conservation`.

For real/complex orthogonal U, n_t₁(π)+n_t₂(π)=2 dim U for the towers differing by the sign class. For complex symplectic or real quaternionic Hermitian U there is no two-tower conservation relation: the parity-compatible first occurrence is at most dim U or dim U+1. For real symplectic, complex unitary, or real quaternionic skew-Hermitian U, each K_U-coset T has a distinct pair with dimension sum 2 dim U+d; every other pair has sum at least 2 dim U+d|t₃−t₄|, and the two minima modulo 2K_U sum 2 dim U+d.

**Hypotheses.** Irreducible admissible genuine Harish-Chandra/smooth representations with the enhancement of Sun–Zhu §7; no claim across inequivalent oscillator cosets.

**Construction or proof route.**

1. Use the three distinct kernels of the archimedean Kudla homomorphism.
2. Apply Theorems7.1, 7.3, 7.6 and the scoped degenerate-principal-series statements; import the (g,K) category from AF.1.

**Acceptance.**

- Complex symplectic spaces satisfy the parity bound, not the nonarchimedean two-tower equality.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `AutomorphicFormsOnReductiveGroups:AF.1`, `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`.

**Source match.**

- [SunZhu15](https://arxiv.org/pdf/1204.2969v3), §7.2 Theorems7.1, 7.3, 7.6 PDF 43–46; excerpt at PDF 44. Literal excerpt: “no conservation relation in the case under consideration.”. Exceptional archimedean cases and the coset formula.

**Suggested-signature boundary.** Displayed equality is only the two-tower equality cases of Sun–Zhu §7.2; the parity bounds and K_U-coset inequalities are separately stated in the packet, not subsumed by a universal archimedean equality.

**Explicit proof/signature refinements.**

- The cited degenerate-principal-series and archimedean Howe/automatic-continuity inputs are not proved here; §7 references are recorded as requests.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Unitary equal and almost equal rank

**Theorem.** `TauCeti.Metaplectic.unitaryTheta_equalAlmostEqualRank`

Node: `MetaplecticAutomorphicForms:MP.3/unitary-equal-almost-equal-rank`.

For tempered π of U(W_n) over a nonarchimedean characteristic-zero F, equal-rank theta to U(V_n^ε) is nonzero in exactly one sign, determined by ε(1/2,φπχV⁻¹,ψ₂^E)=εε′, and its parameter is φπχV⁻¹χW. For rank n+1, if χV is absent from φπ both signs are nonzero, while if χV occurs exactly one sign is nonzero; the lifted parameter is (φπχV⁻¹χW)⊕χW. In these stated tempered ranges the big nonzero lift is irreducible.

**Hypotheses.** Auxiliary χ restrictions and ψ₂^E as in Gan–Ichino; LLC, component groups and epsilon factors are imported, not defined by this packet.

**Construction or proof route.**

1. Use Kudla’s Jacquet filtration to reduce nontempered assertions only where the source does so.
2. For the tempered theorem use unitary dichotomy and the specified LLC/root-number comparison, separately for equal and almost equal rank.

**Acceptance.**

- The irreducibility assertion cannot be extended to every tempered big lift in every rank from these theorems.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`, `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ModularityAndLanglandsExtensions:ML.4`.

**Source match.**

- [GanIchino16](https://arxiv.org/pdf/1409.6824v2), Theorems4.1 and 4.4 PDF 11–15; excerpt at PDF 11. Literal excerpt: “tempered L-parameter φ for G±”. Precise tempered big-lift irreducibility and the two rank ranges.

**Suggested-signature boundary.** Dichotomy fragment in the source’s specified equal-rank/relevant tempered range. Almost-equal-rank two-nonzero cases, parameter/epsilon formulas and broader semisimplicity gates remain explicit in the packet.

**Explicit proof/signature refinements.**

- LLC/root-number supplier stage and original theta-dichotomy proofs require an exact owner mapping; the packet requests that mapping rather than inventing an existing declaration.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Unitary doubling multiplicity and dichotomy

**Theorem.** `TauCeti.Metaplectic.unitaryTheta_doublingDichotomy`

Node: `MetaplecticAutomorphicForms:MP.3/unitary-doubling-dichotomy`.

In Li–Liu Assumption3.1’s rank-2r skew-Hermitian setting, the two equal-rank Hermitian theta choices give the local dichotomy of Proposition 3.6 and the local doubling Hom space has dimension at most one. Keep its assertion that the relevant big theta module is semisimple as a separate source/proof gate; Gan–Ichino’s scoped irreducibility theorem alone does not prove that broader assertion.

**Hypotheses.** Characteristic zero local fields, the exact relevant tempered representation and splitting data of Li–Liu; archimedean case uses AF.1.

**Construction or proof route.**

1. Compare the regular and boundary doubled principal-series quotients with the relevant π.
2. Apply the equal-rank dichotomy and source-qualified semisimplicity argument; no arbitrary direct sum decomposition is used.

**Acceptance.**

- A unique irreducible quotient does not establish semisimplicity of the big module.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/doubling-filtration`, `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Source match.**

- [PAPER-LI-LIU-21](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Proposition 3.6 PDF 15–17; excerpt at PDF 16. Literal excerpt: “semisimple representation of H̃(F ). By [GT16, Theorem 1.2], we know that”. Dichotomy and the distinct semisimplicity proof obligation.

**Routed items.** `PAPER-LI-LIU-21/17`.

**Suggested-signature boundary.** Dichotomy fragment in the source’s specified equal-rank/relevant tempered range. Almost-equal-rank two-nonzero cases, parameter/epsilon formulas and broader semisimplicity gates remain explicit in the packet.

**Explicit proof/signature refinements.**

- Li–Liu’s broader semisimplicity assertion refers to the same argument as Gan–Ichino; matching that argument to its complete hypotheses remains open (existing paper finding E15).

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Unramified metaplectic theta and induction

**Theorem.** `TauCeti.Metaplectic.mpTheta_unramifiedInduction`

Node: `MetaplecticAutomorphicForms:MP.3/mp-odd-orthogonal-unramified`.

For nonarchimedean odd-residue F and ψ of conductor O_F, the standard compact splitting identifies unramified genuine Mp₂n representations with unramified principal-series constituents induced from χψ|·|^{s_i}. The ψ-relative parameter is ⊕i(|·|^{s_i}⊕|·|^{−s_i}). Smaller odd-orthogonal towers obey the first-occurrence vanishing and induction principle of Gan–Ichino Lemmas6.3, 6.8, 6.10, with the removed character pairs and their modulus factors explicit.

**Hypotheses.** For almost tempered induction require |Re s_i|<1/2. The smaller-tower statements retain the exact lemma hypotheses; ψ changes act through its square class and the associated orthogonal-space scaling.

**Construction or proof route.**

1. Use the standard unramified oscillator vector and the compact splitting to calculate its torus Hecke eigenvalues.
2. Apply the rank filtration/induction principle, then the first-occurrence and conservation formulas to exclude or identify smaller towers.

**Acceptance.**

- No standard integral compact splitting is asserted at dyadic places by this unramified statement.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`, `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`, `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [PAPER-GAN-ICHINO-18](https://arxiv.org/pdf/1705.10106v3), Remark 5.3 PDF 19–20; Lemmas6.3, 6.8, 6.10 PDF 21, 24–27; excerpt at PDF 19. Literal excerpt: “unramified, i.e. has a nonzero”. Unramified principal series and smaller odd towers.

**Routed items.** `PAPER-GAN-ICHINO-18/unramified-theta`, `PAPER-GAN-ICHINO-18/induction-principle`, `PAPER-GAN-ICHINO-18/rev-unramified-theta-correspondence-from-mp`, `PAPER-GAN-ICHINO-18/rev-dependence-of-theta-lifts-on`.

**Suggested-signature boundary.** Exponent-list fragment of the actual ψ-relative unramified parameter. Induced constituents, smaller-tower removal and modulus factors require the SR.2/3 carriers and source hypotheses.

**Explicit proof/signature refinements.**

- PDF 24 start of Lemma 6.8 and every removed-pair exponent must be collated before the smaller-tower parameter signature is closed; this node does not substitute an unqualified Satake assertion.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Rallis unramified theta parameters

**Comparison.** `TauCeti.Metaplectic.theta_unramifiedSatake`

Node: `MetaplecticAutomorphicForms:MP.3/rallis-unramified-satake`.

Relate the spherical Hecke characters of a nonzero local theta lift by Rallis’s L-group map, including the additional SL₂/principal-series segment specified by the dimension difference. For the orthogonal–symplectic instances of Chenevier–Taïbi §5.3.2, keep the local Satake relation separate from their global level-one multiplicity computation.

**Hypotheses.** Unramified local datum, compatible integral lattices, ψ conductor zero, compact splitting and the exact source dimension/parity.

**Construction or proof route.**

1. Compute the Hecke action on the spherical oscillator vector and its joint annihilator.
2. Translate the Satake map with the normalized induction convention; import Satake and Hecke algebras from their owners.

**Acceptance.**

- At equal rank the relation has no extra segment; changing normalized to unnormalized induction changes the powers of q.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.2`.

**Source match.**

- [PAPER-CHENEVIER-TAIBI-20](https://arxiv.org/pdf/1907.08783v1), §5.3.2 PDF 50; §5.4 PDF 54–55; excerpt at PDF 50. Literal excerpt: “Rallis [Ral82, §6]”. The local theta Satake input; global level-one results stay in their owner.

**Routed items.** `PAPER-CHENEVIER-TAIBI-20/rallis-unramified`.

**Suggested-signature boundary.** List-of-eigenvalues fragment; the exact added Satake segment and L-group normalization must be supplied from original Rallis, not an arbitrary added list.

**Explicit proof/signature refinements.**

- Ral82 original local computation is cited but unread; the exact dimension-dependent segment remains a source gate rather than an invented formula.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Unitary theta Hecke compatibility

**Comparison.** `TauCeti.Metaplectic.unitaryTheta_hecke`

Node: `MetaplecticAutomorphicForms:MP.3/unitary-hecke-compatibility`.

For Li–Liu’s unramified/almost-unramified and split local places, the oscillator spherical module induces the surjective Hecke map θ^R:H^R_W→T^R, and the π Hecke character factors through it. The operator on the theta output has the contragredient/conjugate character χπ(s)^c. At ramified odd places of Li–Liu22, use the special compact K_r and the trace-self-dual lattice indicator, not the unramified hyperspecial vector.

**Hypotheses.** Exact Assumption3.1 and compact subgroups; rank2r Hermitian target. Ramified E/F has odd residue characteristic, ψ conductor O_F and the source’s trivial splitting characters.

**Construction or proof route.**

1. Use the spherical oscillator module and joint Satake annihilator to obtain the map.
2. Apply adjunction to transfer Hecke operators through the theta integral, keeping the dual/conjugate character.

**Acceptance.**

- The special compact K_r in a ramified unitary group is not automatically hyperspecial.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.2`.

**Source match.**

- [PAPER-LI-LIU-21](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Definition 6.8, Proposition 6.10 PDF 31–32; Lemma 11.1 PDF 49–50; excerpt at PDF 31. Literal excerpt: “canonical surjective homomorphism θR : HW         R”. Hecke character factorization and its dual convention.
- [PAPER-LI-LIU-22](https://arxiv.org/pdf/2101.09485v2), Definition 3.2, Lemma 3.3, Proposition 3.4 PDF 43–45; excerpt at PDF 43. Literal excerpt: “spherical doubling zeta integral, and the local theta lifting for a tempered admissible”. Ramified special-compact oscillator module.

**Routed items.** `PAPER-LI-LIU-21/50`, `PAPER-LI-LIU-22/49`, `PAPER-LI-LIU-22/50`.

**Suggested-signature boundary.** A and B are precisely Li–Liu’s spherical Hecke algebra and theta quotient algebra, theta is its canonical surjection, and the two characters are those of the source and contragredient theta output. Their identification, compact subgroups and ramified range are omitted supplier conditions; this conclusion retains surjectivity and conjugate character matching.

**Explicit proof/signature refinements.**

- The original Liu spherical module theorem and split-place AppendixA computation are unread; the broader tempered big-lift semisimplicity cited in Proposition 3.9 remains the same explicit proof gate.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Quaternionic similitude dual pair

**Construction.** `TauCeti.Metaplectic.quaternionSimilitudeEmbedding`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`.

Let B=E⊕Ej over F, E=F(i), i²=u, j²=J. For a right skew-Hermitian B-space V of rank m with diagonal κ_i i and the left Hermitian line W=B, construct the F-symplectic space V⊗B W with pairing (1/2)Tr_{B/F}(the tensor product of the skew-Hermitian and Hermitian pairings). The matched subgroup G={(g,h)∈GU(V)^0×B×:ν(g)=ν(h)∈N_{E/F}(E×)} acts by g⁻¹v⊗wh. The bases e_i⊗1,e_i⊗j and e_i⊗i,e_i⊗ij give X,Y.

**Hypotheses.** Characteristic-zero local or global F; E embedded in B; nondegenerate forms; connected similitude factor and norm-image condition retained.

**Construction or proof route.**

1. Check the alternating nondegenerate trace tensor pairing in the stated quaternion basis.
2. Matched multipliers cancel in the pairing; convert the source’s right action to a left action by inversion.

**Uses determining the API.**

- Ichino–Prasanna PropositionA.1: Define the scalar-cover pullback and similitude theta lift.

**API.**

- `TauCeti.Metaplectic.quaternionTensor_pairing` (simp): The pairing is half the reduced trace.
- `TauCeti.Metaplectic.quaternionSimilitude_invariant` (structure): Matched multipliers preserve the tensor pairing.
- `TauCeti.Metaplectic.quaternionPolarization` (constructor): X,Y span complementary Lagrangians.

**Discriminating tests.**

- `TauCeti.Metaplectic.quaternionTensor_rankOne` (computation): At m=1 each Lagrangian has F-dimension2.
- `TauCeti.Metaplectic.quaternionTensor_zero` (degenerate): At m=0 the tensor space is zero.
- `TauCeti.Metaplectic.quaternionTensor_mismatch` (non-example): Unequal multipliers rescale the pairing, hence do not give a symplectic isometry.

**Acceptance.**

- The F-dimension is4m and the two Lagrangians have dimension2m.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA.1, (A.1)–(A.2), arXiv-v2 PDF 87–89; excerpt at PDF 87. Literal excerpt: “symplectic form                                                         1”. Quaternionic tensor pairing, matched similitudes and polarization.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/061`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Quaternionic Hermitian and connected similitude carriers are imported from upstream; exact layer mapping is requested.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Quaternionic similitude splitting

**Construction.** `TauCeti.Metaplectic.quaternionSplitting`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`.

Construct s_v:G_v→C¹ with z_Y(g₁,g₂)=s_v(g₁g₂)/(s_v(g₁)s_v(g₂)). It obeys s_v(zg)=ξE_v(z)^m s_v(g), agrees with the standard compact splitting almost everywhere, and ∏v s_v(γ)=1 for γ∈G(F). This splits the scalar-circle cover on the norm-image subgroup; no μ₂ splitting is inferred.

**Hypotheses.** AppendixA.1 datum; global ψ trivial on F for the product assertion; compatible local measures.

**Construction or proof route.**

1. Multiply the two doubled cochains on G^sharp and the polarization correction μ.
2. Divide by the norm-one kernel correction to descend independently of α and auxiliary χ.
3. Use the local computations and global Weil-index product for the central, compact and rational properties.

**Uses determining the API.**

- Ichino–Prasanna §§7–9: Define adelic similitude theta kernels and their central character.

**API.**

- `TauCeti.Metaplectic.quaternionSplitting_cocycle` (characterisation): The cochain cancels z_Y in the stated quotient direction.
- `TauCeti.Metaplectic.quaternionSplitting_central` (simp): Central scalars give ξE(z)^m.
- `TauCeti.Metaplectic.quaternionSplitting_auxiliary` (compatibility): The result is independent of α and auxiliary χ.

**Discriminating tests.**

- `TauCeti.Metaplectic.quaternionSplitting_identity` (degenerate): s_v(1)=1.
- `TauCeti.Metaplectic.quaternionSplitting_character` (non-example): An odd-rank scalar with ξE(z)=−1 acts by −1.
- `TauCeti.Metaplectic.quaternionSplitting_product` (compatibility): For rational γ the product of local values is1.

**Acceptance.**

- For odd m a scalar z with ξE(z)=−1 gives −1.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`, `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), PropositionA.1 and §§A.2–A.7 PDF 89–99; excerpt at PDF 89. Literal excerpt: “Proposition A.1 will be given in §A.3–§A.6 below. From now on, we fix a place v of F”. Scalar splitting and its central, compact and rational properties.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/062`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Original Kudla unitary and Periods-I/II splittings remain unread inputs. Existing E6 replaces s(g₂) by s_v(g₂).

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### First doubled quaternionic splitting

**Theorem.** `TauCeti.Metaplectic.quaternionSplitting_firstDoubled`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-first-doubled-splitting`.

On U(V⊕V⁻), ŝ₁ is1 for split B and (−1)^j on a Bruhat stratum for division B. It cancels z_{V△}, is invariant under E× conjugation, and on the norm-one scalar embedding α has value1 if α=1 and (−1)^m otherwise in the division case.

**Hypotheses.** AppendixA.2–A.3 bases and Bruhat index; α∈E¹.

**Construction or proof route.**

1. Compare doubled and diagonal polarizations.
2. Compute the Bruhat index and split/division Weil index.

**Acceptance.**

- Keep the special identity element case.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`, `MetaplecticAutomorphicForms:MP.2/leray-cocycle`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.3–A.4, PDF 90; literal excerpt PDF 90. Literal excerpt: “Lemma A.3. For α ∈ E × and g ∈ U(V”. Conjugation invariance and norm-one evaluation.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/063`.

**Suggested-signature boundary.** Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Second doubled quaternionic splitting

**Theorem.** `TauCeti.Metaplectic.quaternionSplitting_secondDoubled`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-second-doubled-splitting`.

For the doubled unitary W-model, ŝ₂(h)=χ(x(h))^mγ^{−j(h)}, γ=(u,det V)_F γ_F(−u,ψ/2)^mγ_F(−1,ψ/2)^{−m}. It is invariant under E× conjugation. The diagonal norm-one scalar gives χ(α)^{−2m}; the mixed embedding of A.7 gives χ(α)^{−m} times1 for split B and (−1)^m for division B.

**Hypotheses.** Exact embeddings ι and bases of §§A.4–A.5; χ|F×=ξE, α∈E¹.

**Construction or proof route.**

1. Calculate rank and x invariant of the embedded matrices.
2. Apply normalized Weil-index identities.

**Acceptance.**

- Their χ exponents differ: −2m and −m.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.5–A.7, PDF 92; literal excerpt PDF 92. Literal excerpt: “Lemma A.5. For α ∈ E × and h ∈ U(W”. The two distinct norm-one scalar embeddings.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/064`.

**Suggested-signature boundary.** Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Sharp splitting and norm-one descent

**Comparison.** `TauCeti.Metaplectic.quaternionSplitting_sharpDescent`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent`.

On G^sharp={(g,h,α,α):ν(g)=ν(h)=Nα}, set ŝ^sharp=χ(α)^{−m}ŝ₁(ι(gα⁻¹, 1))ŝ₂(ι(hα⁻¹, 1))z_{V△}(ι(gα⁻¹, 1),ι(hα⁻¹, 1)). With μ(σ)=z_Y(σ₀,σ)⁻¹z_Y(σ₀σσ₀⁻¹,σ₀), z_Y=z_{V△}δμ. Descend s(g,h)=s^sharp(g,h,α,α)/s₂(ι(1,[α,α])). A.9 proves norm-one invariance and A.12 cancels auxiliary χ.

**Hypotheses.** Exact α lift of the common norm multiplier and polarization σ₀.

**Construction or proof route.**

1. Multiply the cocycle identities on G^sharp.
2. Compute the kernel action and χ-change factors, then descend.

**Acceptance.**

- Replacing μ by μ⁻¹ fails the stated coboundary direction.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/quaternionic-first-doubled-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-second-doubled-splitting`, `MetaplecticAutomorphicForms:MP.2/leray-cocycle`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.8–A.12, PDF 93–96; literal excerpt PDF 93. Literal excerpt: “Lemma A.8. For g1 , g2 ∈ G ♯ , we have                                                                  ŝ♯ (g1 g2 )”. Sharp cochain, polarization correction and descent.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/065`, `PAPER-ICHINO-PRASANNA-23/066`.

**Suggested-signature boundary.** Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Quaternionic see-saw and Periods-II comparison

**Comparison.** `TauCeti.Metaplectic.quaternionSplitting_seeSaw`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-see-saw-compatibility`.

For an orthogonal sum V=V′⊕V″ with matched similitude triple, s=s′s″ on the see-saw restriction. In rank-one Periods-II conventions, s^natural(α,h)=s(α,h)χ(α)⁻¹.

**Hypotheses.** Compatible polarizations, ψ and χ; exact norm-image subgroups and components.

**Construction or proof route.**

1. Apply orthogonal-sum multiplicativity of the Leray/Weil indices.
2. Compare the rank-one diagonal matrices and auxiliary character.

**Acceptance.**

- Retain χ(α)⁻¹ in the Periods-II comparison.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent`, `MetaplecticAutomorphicForms:MP.3/local-see-saw`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA.8 LemmaA.13, PDF 97; literal excerpt PDF 97. Literal excerpt: “Lemma A.13. We have                                              s♮ (α, h) = s(α, h) · χ(α)−1 .  Proof. Recall that”. See-saw restriction and the Periods-II character twist.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/067`, `PAPER-ICHINO-PRASANNA-23/068`.

**Suggested-signature boundary.** Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains.

**Explicit proof/signature refinements.**

- The original Periods-II splitting remains unread; AppendixA supplies the comparison.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Periods-I splitting comparison

**Theorem.** `TauCeti.Metaplectic.quaternionSplitting_periodsI`

Node: `MetaplecticAutomorphicForms:MP.3/periods-i-comparison`.

For m=2, V=B₁⊗E B₂, J₁J₂=J, κ₁=1, κ₂=−J₁, the ratio ζ=tilde s/s is an automorphic character. If F is totally real, E totally imaginary and B₁,B₂ split at one common real place, ζ=1 at every local place.

**Hypotheses.** All global hypotheses of A.14, including the common split real place.

**Construction or proof route.**

1. Reduce ζ to the norm-image quotient and kill the derived subgroup.
2. Check both E× embeddings and the negative real generator; the common split real place removes the residual sign character.

**Acceptance.**

- Do not claim the equality after deleting that real-place hypothesis.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-first-doubled-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-second-doubled-splitting`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA PropositionA.14, equations(A.9)–(A.11), PDF 98–99; literal excerpt PDF 98. Literal excerpt: “Proposition A.14. Assume that      • F is totally real;      • E is totally imaginary;      • B1,v and B2,v are split for some real place v of F .”. Global character argument and its real-place hypothesis.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/069`.

**Suggested-signature boundary.** Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains.

**Explicit proof/signature refinements.**

- The original Periods-I construction is an unread referenced input.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### First scalar splitting calculation

**Theorem.** `TauCeti.Metaplectic.quaternionSplitting_scalarA9`

Node: `MetaplecticAutomorphicForms:MP.3/periods-i-first-scalar-calculation`.

For α=a+bi with a,b≠0, tilde s(1,α,α)=γ_F(J₁,ψ/2)(−2abJ₂,J₁)_F; ŝ₂(ι([α,α], 1))=χ(α)⁻⁴(u,J₁)_F; μ on that matrix is γ_F(J₁,ψ/2)(−2abuJ₂,J₁)_F. Together these give s=tilde s on the first E× embedding.

**Hypotheses.** Rank-two Periods-I datum and exact embeddings.

**Construction or proof route.**

1. Factor the matrices into Bruhat generators.
2. Compute x,j,μ and cancel u using Hilbert identities.

**Acceptance.**

- At m=2 the χ power is −4.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/periods-i-comparison`, `MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.15–A.17, PDF 100–104; literal excerpt PDF 100. Literal excerpt: “Lemma A.15. We have                                            s̃(1, α, α) = γF (J1 , 21 ψ) · (−2abJ2 , J1 )F .”. Three calculations for (A.9).

**Routed items.** `PAPER-ICHINO-PRASANNA-23/070`.

**Suggested-signature boundary.** Appendix A.9 coordinate values; gamma is γ_F(·,ψ/2), hilbert the QFI.6 Hilbert symbol. The actual embeddings and a,b≠0 hypotheses are omitted until the quaternionic supplier.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Second scalar splitting calculation

**Theorem.** `TauCeti.Metaplectic.quaternionSplitting_scalarA10`

Node: `MetaplecticAutomorphicForms:MP.3/periods-i-second-scalar-calculation`.

For α=a+bi with a,b≠0, tilde s(α,α⁻¹, 1)=γ_F(J,ψ/2)(−2abJ₁,J)_F; ŝ₁(ι([α,α⁻¹], 1))=(u,J)_F; μ is γ_F(J,ψ/2)(−2abuJ₁,J)_F. Together these give s=tilde s on the second E× embedding.

**Hypotheses.** Rank-two datum; both a,b nonzero before continuous extension.

**Construction or proof route.**

1. Use the quaternionic Bruhat factorization.
2. Evaluate the Leray form under σ₀ and cancel the Weil-index factors.

**Acceptance.**

- Treat a=0 or b=0 by local continuity.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/periods-i-comparison`, `MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.18–A.20, PDF 104–106; literal excerpt PDF 104. Literal excerpt: “Lemma A.18. We have                                   s̃(α, α−1 , 1) = γF (J, 21 ψ) · (−2abJ1 , J)F .”. Three calculations for (A.10).

**Routed items.** `PAPER-ICHINO-PRASANNA-23/071`.

**Suggested-signature boundary.** Appendix A.10 values, with the exact second embedding and source nonzero coordinates required in the packet.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Square quaternion splitting calculation

**Theorem.** `TauCeti.Metaplectic.quaternionSplitting_scalarA11`

Node: `MetaplecticAutomorphicForms:MP.3/periods-i-square-quaternion-calculation`.

When J_i=t_i², the normalized generators j_i^natural=j_i/t_i have both splittings equal to1 on the matrices of A.21–A.23. Combined with the scalar calculations and the negative real generator, this gives (A.11).

**Hypotheses.** Specified square roots and the global real-place argument of A.14.

**Construction or proof route.**

1. Evaluate x,j,μ on the normalized quaternion matrices.
2. Use the generating quotient argument of A.14.

**Acceptance.**

- A change of square root changes the normalized matrix.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/periods-i-comparison`, `MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.21–A.23, PDF 106–108; literal excerpt PDF 106. Literal excerpt: “Lemma A.21. We have                                                            s̃(j♮1 , j♮2 , 1) = 1.”. Square-quaternion generators.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/072`.

**Suggested-signature boundary.** Only the normalized square-quaternion generators j_i/t_i in A.21–A.23; this does not claim triviality of both cochains on an arbitrary group element.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Harris–Kudla splitting comparison

**Comparison.** `TauCeti.Metaplectic.quaternionSplitting_harrisKudla`

Node: `MetaplecticAutomorphicForms:MP.3/harris-kudla-morita-comparison`.

For split B and idempotent e, V^dagger=Ve and W^dagger=eW have dimensions2m and 2; V^dagger has symmetric diagonal (κ_i u/2,−κ_i/2). Set s^dagger(h)=ξE(x(h))^m(γ′)^{−j(h)}, γ′=γ_F(ψ/2)^{2m}γ_F(det V^dagger,ψ/2)Hasse(V^dagger). Extend to similitudes by h↦h d(ν(h))⁻¹. The polarization correction gives s₀=s^daggerμ₀=s.

**Hypotheses.** Exact split quaternion idempotent and bases; norm-image multipliers; source quadratic determinant.

**Construction or proof route.**

1. Check the Morita pairings and A.24 cocycle.
2. Use A.26 s=s′μ₀ and A.27 s^dagger=s′ with the explicit matrices.

**Acceptance.**

- For generic α=a+bi, retain γ_F(u)^m∏i(2bκ_i,u)_F.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`, `MetaplecticAutomorphicForms:MP.3/quaternionic-sharp-descent`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`, `MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), AppendixA LemmasA.24–A.27, PDF 108–115; literal excerpt PDF 110. Literal excerpt: “Proposition A.25. We have                                                          s0 |G = s.     The rest of this section is devoted to the proof of Proposition A.25.”. Morita comparison and polarization correction.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/073`, `PAPER-ICHINO-PRASANNA-23/074`.

**Suggested-signature boundary.** Equality of the source’s precisely normalized quaternionic cochains after its doubled/sharp/see-saw/Morita maps. Those carriers/maps and discriminant/norm-class hypotheses are supplier gaps; this is not equality of arbitrary cochains.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Similitude theta correspondence

**Theorem.** `TauCeti.Metaplectic.similitudeTheta_howe`

Node: `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`.

For the matched multiplier subgroup R⊂G×H^+ and its extended oscillator action, Ω=compact Ind_R^{G×H^+}ω has finite-length big theta quotients. In the classical pairs scoped by Ichino–Prasanna, the small lift is zero or irreducible and injective on its nonzero domain. H^+ is the multiplier-image subgroup.

**Hypotheses.** Characteristic-zero local F; isometry-group Howe, Clifford and compact-induction inputs; AF.1 at infinity.

**Construction or proof route.**

1. Restrict to isometry groups and apply Howe duality.
2. Apply Clifford theory and conservation to pass through the multiplier quotient and O/SO components.

**Acceptance.**

- The inducing subgroup projects onto H^+, not necessarily all H.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), §7.2 and Lemma 9.3 arXiv PDF 41–42, 50–52; excerpt at PDF 41. Literal excerpt: “Howe duality [28].”. Similitude extension on its multiplier-image subgroup.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/049`, `PAPER-ICHINO-PRASANNA-23/050`.

**Suggested-signature boundary.** smallLift denotes the small lift for the matched-multiplier similitude oscillator, not an arbitrary representation. The actual group carrier, finite-length big lift and injectivity comparison need the recorded SR.2/3 suppliers.

**Explicit proof/signature refinements.**

- Original similitude Howe and Clifford inputs must be instantiated; compact induction is supplied by SR.2.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Real discrete-series theta lifts

**Comparison.** `TauCeti.Metaplectic.theta_realDiscreteSeries`

Node: `MetaplecticAutomorphicForms:MP.3/real-discrete-series-theta`.

For ψ_R(t)=exp(2πit), k≥2 and holomorphic SL₂(R) discrete series of weight k+1, theta to O(4, 2) restricts to the identity component as A_q₀(0, 0,k−2), while its dual lifts as A_q₁(k−2, 0, 0). q₀ has Levi so(4)+so(2); q₁ has Levi so(2)+so(2, 2) and minimal K-type(k, 0, 0). To O(0, 6) the holomorphic lift has highest weight(k−2, 0, 0), and the dual lift is zero.

**Hypotheses.** Positive ψ; exact root basis, components and cohomological induction conventions of the source.

**Construction or proof route.**

1. Use real first occurrence and oscillator K-types.
2. Import cohomological induction from AF.1 and collate the cited module identification.

**Acceptance.**

- At k=2 the O(0, 6) highest weight is zero but the dual lift still vanishes.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `AutomorphicFormsOnReductiveGroups:AF.1`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), §7.2.1–7.2.2 arXiv PDF 41–42; excerpt at PDF 41. Literal excerpt: “discrete series representation of G′ of weight k + 1 (i.e. with”. Holomorphic/dual distinction at the two signatures.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/051`.

**Suggested-signature boundary.** Compact O(0, 6) fragment: the holomorphic weight-(k+1) SL2 discrete series has theta highest weight (k-2, 0, 0), while its dual lift vanishes. Exact real groups, positive psi, highest-weight/cohomological induction and the O(4, 2) comparison need AF.1; no generic irreducibility substitute is used.

**Explicit proof/signature refinements.**

- The original archimedean identification and complete root data remain an AF.1/source gate.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Quaternionic unramified theta lift

**Comparison.** `TauCeti.Metaplectic.theta_quaternionUnramified`

Node: `MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta`.

In Lemma 9.4’s odd-residue unramified E/F, split B, self-dual V^dagger and conductor-zero ψ setup, an unramified H^+ constituent of normalized GL₂ induction χ₁⊗χ₂ lifts to the GSO(3, 3)-form constituent induced from (χ₁χ₂⁻¹ξE)⊗|·|⊗((χ₂|·|⁻¹/²)∘N_{E/F}), on the source’s torus coordinates.

**Hypotheses.** Norm-image subgroup, exact Borel and integral splitting.

**Construction or proof route.**

1. Use the Harris–Kudla/Morita comparison on the spherical vector.
2. Calculate the normalized torus Hecke map.

**Acceptance.**

- The |·|⁻¹/² factor is retained.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/harris-kudla-morita-comparison`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.2`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), Lemma 9.4 arXiv PDF 53; excerpt at PDF 53. Literal excerpt: “unramified characters χ1 , χ2 of F × . Note that χ1 , χ2 are not necessarily uniquely determined.”. Unramified similitude lift and characters.

**Routed items.** `PAPER-ICHINO-PRASANNA-23/079`.

**Suggested-signature boundary.** Three-character fragment of IP Lemma 9.4. chi2Norm is chi2 composed with N_E/F, modulus is the E absolute value and normModulus the F absolute value composed with N_E/F. The unramified torus, normalized induction and source constituent identification remain mandatory supplier conditions.

**Explicit proof/signature refinements.**

- Lemma 9.4 omits its local calculation; an explicit Hecke computation must close it.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Rank-one oscillator constituents

**Comparison.** `TauCeti.Metaplectic.theta_rankOneConstituents`

Node: `MetaplecticAutomorphicForms:MP.3/rank-one-oscillator-constituents`.

On S(F), the genuine rank-one oscillator splits into even and odd functions ρψ⁺,ρψ⁻. For the split O₃ pair, the corrected Gan–Savin convention uses the conjugate oscillator: Θ(ρbarψ⁻)=St⁻ and 0→St⁺→Θ(ρbarψ⁺)→1→0. These are big-lift assertions; the even big lift is an extension, while its small lift is1.

**Hypotheses.** Characteristic-zero nonarchimedean F and Gan–Savin’s ψ and O₃ extensions of the Steinberg representation.

**Construction or proof route.**

1. Decompose by x↦−x and compare dual ψ by the operator formulas.
2. Use the rank-one Jacquet calculation and exact sequence of the degenerate principal series.

**Acceptance.**

- The nonsplit even big lift is not1.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/big-theta-module`, `MetaplecticAutomorphicForms:MP.3/small-theta-module`, `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`.

**Source match.**

- [PAPER-GAN-SAVIN-23](https://arxiv.org/pdf/2102.00372v1), §8.4 PDF 26–28; corrected §11.4, existing source finding E36; excerpt at PDF 27. Literal excerpt: “Steinberg representation of SO(3) ∼    = PGL2 . We extend st to two representations”. Even/odd oscillator and the corrected additive character.

**Routed items.** `PAPER-GAN-SAVIN-23/sl2-o3-theta`.

**Suggested-signature boundary.** Corrected conjugate-oscillator convention: odd big lift is Steinberg-minus; even big lift is the extension of trivial by Steinberg-plus, whose underlying short exact sequence is displayed. The named carriers/maps must be those source representations and intertwining maps, supplied by SR.0/3.

**Explicit proof/signature refinements.**

- The §11.4 proof continuation and original rank-one extension theorem require full reading; existing E36 corrects ψ to its conjugate in the theta input.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### GL₂–GSO₄ theta correspondence

**Theorem.** `TauCeti.Metaplectic.theta_gl2Gso4`

Node: `MetaplecticAutomorphicForms:MP.3/gl2-gso4-theta`.

For irreducible generic π of GL₂(F), the similitude theta lift of π∨ to GSO₄≃(GL₂×GL₂)/diagonal center is π⊗π, and theta back from π⊗π is π∨, in Gan–Savin Lemma 13.2’s action convention.

**Hypotheses.** Characteristic-zero nonarchimedean F, generic irreducible π and compatible similitude oscillator action.

**Construction or proof route.**

1. Compute the Jacquet module on the open full-rank orbit.
2. Use the regular-representation quotient and Ext¹_SO₄(1,St⊗St)=0 to treat the boundary; apply Howe injectivity.

**Acceptance.**

- For Steinberg, retain the Ext argument rather than discarding the boundary.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`, `SmoothRepresentationsOfLocalGroups:SR.3`, `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`.

**Source match.**

- [PAPER-GAN-SAVIN-23](https://arxiv.org/pdf/2102.00372v1), Lemma 13.2 PDF 40–41; excerpt at PDF 41. Literal excerpt: “Lemma 13.2. Consider the similitude theta correspondence for the dual pair GL2 × GSO4”. Generic GL₂ similitude correspondence and its dual convention.

**Routed items.** `PAPER-GAN-SAVIN-23/lemma-13-2`.

**Suggested-signature boundary.** Pullback to GL2 x GL2 of the GSO4 lift of pi-dual is the external tensor pi x pi. Generic irreducibility, similitude descent, central quotient and the back-lift comparison remain packet hypotheses/suppliers.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Minimal orthogonal theta lift

**Theorem.** `TauCeti.Metaplectic.theta_minimalOrthogonal`

Node: `MetaplecticAutomorphicForms:MP.3/minimal-orthogonal-theta`.

For split SO₂n with n=5 or6, the big theta lift of the trivial SL₂ representation is the minimal representation Π_n (the irreducibility is the cited Yamana input). For tempered π of G₂ its Π_n lift to SO₂n−7 has finite length, as in Proposition 14.2. For the tensor restriction Sp(V₂)×Sp(V₆)→SO(V₂⊗V₆), the see-saw identifies the relevant Hom module with Hom_{Sp(V₂′)}(Θ′(σ), 1); it has finite length as an Sp(V₂)-module, as in §14.3. This is a finite-length assertion, not finite-dimensionality of the entire Hom space.

**Hypotheses.** Characteristic-zero nonarchimedean F, split forms n=5, 6 and the exact minimal-representation realization. π is tempered where Proposition 14.2 requires it; σ is the stated irreducible Sp(V₆) representation. Exceptional representations are supplied by their owner.

**Construction or proof route.**

1. Import the minimal representation from its exceptional-representation owner.
2. Apply Yamana’s classical theta identification and the big-theta finite-length/see-saw argument to the restriction.

**Acceptance.**

- The assertion is scoped to n=5, 6 and the specified tensor restriction.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/theta-finite-length`, `MetaplecticAutomorphicForms:MP.3/local-see-saw`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source match.**

- [PAPER-GAN-SAVIN-23](https://arxiv.org/pdf/2102.00372v1), §14.2 Proposition 14.2 and §14.3, arXiv-v1 PDF 50–51; literal excerpt PDF 50. Literal excerpt: “Proposition 14.2. Let Πn be the minimal representation of SO(2n) for n = 5 or 6. Then for tempered π ∈ Irr(G2 ), Θn (π) is a finite length Hn -module where Hn = SO2n−7 .”. The source explicitly invokes [Y, Prop.8.4]; the original proof remains unread. Classical finite length supplies the §14.3 Hom module, not finite dimension.

**Routed items.** `PAPER-GAN-SAVIN-23/yamana-minimal`, `PAPER-GAN-SAVIN-23/rev-finiteness-for-sp-v-6`.

**Suggested-signature boundary.** Finite-length fragment of Gan–Savin Prop14.2 and §14.3. thetaHomModule is the actual lifted Hom module under the displayed see-saw, with H=SO(2n-7) or Sp(V2) as appropriate. Minimal-representation identification, tempered scope and finite-index isogeny require suppliers; finite-dimensionality is not asserted.

**Explicit proof/signature refinements.**

- Yamana Proposition 8.4 is invoked for the minimal theta realization but its original proof is unread. GS23 Proposition 14.2 and §14.3 prove finite length of the specified Hom modules; the original exceptional realization and generic smooth tensor–Hom/finite-index restriction steps remain supplier inputs.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Division ternary theta lift

**Theorem.** `TauCeti.Metaplectic.theta_divisionTernary`

Node: `MetaplecticAutomorphicForms:MP.3/division-ternary-theta`.

Let ρ be an irreducible supercuspidal representation of PGL₂(F), for characteristic-zero nonarchimedean F. If B is the division quaternion algebra, JL(ρ) is its representation on PB×≃SO(B₀,N). With fixed nontrivial ψ, the rank-one theta lift σ_ρ=θ_ψ(JL(ρ)) to Mp₂ is nonzero irreducible, genuine and supercuspidal. This is the classical input in Gan–Savin §15.1; the exceptional lift to G₂ is separately owned.

**Hypotheses.** ρ is supercuspidal on PGL₂, and the exact ψ and splitting normalization in §15.1 is used. No claim is made for all irreducible representations of PB×.

**Construction or proof route.**

1. Identify the trace-zero norm space and its compact orthogonal group.
2. Use the original Waldspurger rank-one local theorem and Jacquet–Langlands matching.

**Acceptance.**

- The source introduces ρ on PGL₂ and JL(ρ) on PB×; its undeclared JL(τ) is read as JL(ρ). The trivial PB× representation is outside this supercuspidal PGL₂ input.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `ModularityAndLanglandsExtensions:ML.4`.

**Source match.**

- [PAPER-GAN-SAVIN-23](https://arxiv.org/pdf/2102.00372v1), §15.1 preceding Lemma 15.4, arXiv-v1 PDF 54; literal excerpt PDF 54. Literal excerpt: “For each cuspidal representation ρ of PGL2 ∼  = SO3 , let JL(ρ) be its Jacquet-Langlands lift to the an isotropic inner form P B × = SO∗3 (where B is”. Precisely the supercuspidal PGL₂ domain stated before Lemma 15.4. The original rank-one/Jacquet–Langlands proofs remain explicit gaps.

**Routed items.** `PAPER-GAN-SAVIN-23/rev-theta-lifts-from-so-3`.

**Suggested-signature boundary.** thetaJL is the rank-one psi-theta lift of JL(rho), where rho is irreducible supercuspidal on PGL2 as in GS23 §15.1. This conclusion includes nonzero irreducibility. Genuineness, supercuspidality and the precise PGL2/PB*/Mp2 carriers need the recorded suppliers. The source typo JL(tau) is corrected to JL(rho).

**Explicit proof/signature refinements.**

- The source domain is irreducible supercuspidal rho on PGL2 and its JL(rho) on PB×, as read before GS23 Lemma 15.4. The original rank-one Waldspurger/Jacquet–Langlands proofs and exact carrier/psi comparison remain unread supplier inputs.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### PGSp₆–PGSO₈ similitude theta

**Theorem.** `TauCeti.Metaplectic.theta_pgsp6Pgso8`

Node: `MetaplecticAutomorphicForms:MP.3/pgsp6-pgso8-similitude-theta`.

For generic irreducible σ of PGSp₆(F), its classical similitude theta lift to PGSO₈ is nonzero. If σ_b is a constituent on Sp₆, its SO₈ theta lift occurs in the similitude restriction and has standard parameter φ_b⊕1. At unramified places the Satake embedding is Spin₇→Spin₈ with standard representation 1⊕std₇ and the corresponding spin restrictions.

**Hypotheses.** Characteristic-zero nonarchimedean F; generic σ; exact LLC/Satake conventions and multiplier subgroup.

**Construction or proof route.**

1. Use the generic Whittaker quotient of the oscillator to show nonzero lift.
2. Apply isometry/similitude restriction and the unramified Satake map; import the parameter theory.

**Acceptance.**

- The exceptional G₂ correspondence remains in its owner; this is the classical theta input.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/rallis-unramified-satake`, `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ModularityAndLanglandsExtensions:ML.4`.

**Source match.**

- [PAPER-GAN-SAVIN-23-B](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf), §4.2 PDF 17–18; excerpt at PDF 17. Literal excerpt: “similitude             theta lift of 𝜎 to PGSO8 . Both these theta lifts are nonzero and one has the following compatibility:”. Classical similitude lift used by the G₂ parameter construction.

**Routed items.** `PAPER-GAN-SAVIN-23-B/50`.

**Suggested-signature boundary.** Nonvanishing and standard-parameter fragment for the generic PGSp6 to PGSO8 similitude lift. The exact LLC/Satake carrier and restriction constituent must be source-identified; the Spin7 to Spin8 and spin-restriction comparisons remain supplier gaps.

**Explicit proof/signature refinements.**

- Exact local LLC and Spin representation supplier mapping must be supplied; the generic theta theorem is cited in the source rather than reproved there.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### PGSp₆ theta dichotomy

**Theorem.** `TauCeti.Metaplectic.theta_pgsp6Dichotomy`

Node: `MetaplecticAutomorphicForms:MP.3/pgsp6-theta-dichotomy`.

Every irreducible σ of PGSp₆(F) has nonzero theta lift to exactly one of PGO₈ and PGO_{5, 1} in Gan–Savin’s two matched towers. Some representations already occur at PGO₆≃PGL₄⋊{±1}; first occurrence determines this case.

**Hypotheses.** Characteristic-zero nonarchimedean F, the source’s two discriminant-compatible orthogonal towers.

**Construction or proof route.**

1. Use persistence and conservation in the two orthogonal towers.
2. Apply similitude restriction/Clifford theory to identify the allowed components.

**Acceptance.**

- The smaller PGO₆ occurrence is not excluded by the dichotomy.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`, `MetaplecticAutomorphicForms:MP.3/first-occurrence`, `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`.

**Source match.**

- [PAPER-GAN-SAVIN-23-B](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf), §12.2 PDF 34–35; excerpt at PDF 34. Literal excerpt: “dichotomy            We shall make use of the similitude theta correspondence associated to the following dual pairs:”. The classical similitude dichotomy used by the exceptional programme.

**Routed items.** `PAPER-GAN-SAVIN-23-B/120`.

**Suggested-signature boundary.** Exactly-one-nonzero fragment of GS23B §12.2 for the PGO8/PGO(5, 1) towers. splitLift and nonsplitLift are the actual theta carriers of a fixed irreducible PGSp6 input; PGO6 first occurrence and the group/cover identifications remain in the packet.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Relevant unitary local dichotomy

**Theorem.** `TauCeti.Metaplectic.theta_relevantDichotomy`

Node: `MetaplecticAutomorphicForms:MP.3/relevant-unitary-dichotomy`.

For a relevant tempered L-representation π_v in Disegni–Liu’s rank n=2r setting, there is a unique rank-n Hermitian space V_πv for which theta is nonzero, for every embedding L→C. Its lift is tempered irreducible admissible and the double-theta Hom recovers π_v. Keep the stated semisimplicity/irreducibility reference gate separate from Howe duality.

**Hypotheses.** Nonarchimedean places, exact relevance and coefficient-field hypotheses of §4.1; specified ψ,χ and Hermitian invariant.

**Construction or proof route.**

1. Use the equal-rank local dichotomy and change-of-character norm orbit.
2. Apply the source-qualified tempered big-lift irreducibility argument and the dual Hom identity.

**Acceptance.**

- Do not replace “relevant” by every tempered representation.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/unitary-splitting`, `MetaplecticAutomorphicForms:MP.3/howe-duality`, `MetaplecticAutomorphicForms:MP.3/unitary-equal-almost-equal-rank`, `MetaplecticAutomorphicForms:MP.3/unitary-doubling-dichotomy`.

**Source match.**

- [PAPER-DISEGNI-LIU-24](https://arxiv.org/pdf/2204.09239v3), Lemma 4.1 arXiv PDF 41; excerpt at PDF 41. Literal excerpt: “Lemma 4.1. For every v ∈ Vfin  F , there exists a (unique up to isomorphism) hermitian”. Relevant representation dichotomy and the recovery Hom.

**Routed items.** `PAPER-DISEGNI-LIU-24/22`.

**Suggested-signature boundary.** Dichotomy fragment in the source’s specified equal-rank/relevant tempered range. Almost-equal-rank two-nonzero cases, parameter/epsilon formulas and broader semisimplicity gates remain explicit in the packet.

**Explicit proof/signature refinements.**

- The original [20,Thm3.10]/[19,Thm1.3(ii)] proof scope and big-lift irreducibility still require collation.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

### Rationality of local theta lifting

**Comparison.** `TauCeti.Metaplectic.theta_coefficientRationality`

Node: `MetaplecticAutomorphicForms:MP.3/theta-coefficient-rationality`.

For the same relevant π, let U_π be the finite-place set where π_v is not invariant under every similitude conjugation †a, a∈F_v×. Define Q_π by the open subgroup {a∈Zhat×:a_v∈N(E_v×) for every v∈U_π}. For σ∈Aut(C/Q_π), θ(σιπ_v)≃σθ(ιπ_v). The comparison changes ψ to ψ_a and π to π^{†a}; the norm/symmetry condition removes that change.

**Hypotheses.** Exact coefficient field L and embeddings; finite nonsymmetric set so the subgroup is open; class-field construction is imported.

**Construction or proof route.**

1. Conjugate the explicit oscillator matrices coefficientwise, producing ψ_a.
2. Transport by the similitude and use the defining norm/symmetry condition for Q_π.

**Acceptance.**

- The symmetry definition quantifies over F_v×, not just its units.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/relevant-unitary-dichotomy`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [PAPER-DISEGNI-LIU-24](https://arxiv.org/pdf/2204.09239v3), Lemma 4.5 and (4.2) arXiv PDF 42; excerpt at PDF 42. Literal excerpt: “Lemma 4.5. For every v ∈ Vfin    F , every embedding ι : L → C, and every σ ∈”. Coefficient conjugation with its finite abelian field.

**Routed items.** `PAPER-DISEGNI-LIU-24/22`.

**Suggested-signature boundary.** Coefficient fragment of the semilinear theta comparison: sourceTheta and conjugateTheta are coefficients of theta(ιπ) and theta(σιπ), respectively, after their source-defined identification. The coefficient-field, similitude and psi_a hypotheses are omitted pending their suppliers. The conclusion compares two independently formed lifts.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage3`. Implementation: unchecked.

## MP.4. Adelic covers and oscillator representations

### Unramified compact splittings

**Theorem.** `TauCeti.Metaplectic.metaplectic_compactSplitting`

Node: `MetaplecticAutomorphicForms:MP.4/unramified-compact-splittings`.

For a nonarchimedean odd-residue local field, conductor-zero ψ and a self-dual symplectic lattice, the normalized oscillator supplies the distinguished splitting of Sp(W)(O) into Mp(W), fixing the lattice indicator in its Schrödinger model. For a global datum these conditions hold at all but finitely many places.

**Hypotheses.** The lattice is integral self-dual for the specified ψ-pairing; no assertion of this splitting over every dyadic maximal compact.

**Construction or proof route.**

1. Check the generators on the lattice indicator and its positive Fourier transform.
2. Use the normalized cocycle to show its chosen lifts form a subgroup; isolate finitely many bad places.

**Acceptance.**

- At a dyadic place the naive half-form lattice character can fail; use an explicitly checked smaller compact instead.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§36, printed 186–187, PDF 44–45; literal excerpt PDF 45. Literal excerpt: “homomorphisme ~u de Ps(X) dans Bo(X ) applique Ps(X,L) dans Bo(X,L ).     Avec les notations ci-dessus, l'espaee H(G, I TM)du Chapitre I, n ~ 18, devient un espace”. Distinguished almost-everywhere compact lift.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Adelic metaplectic cover

**Construction.** `TauCeti.Metaplectic.adelicMetaplectic`

Node: `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`. Planet: **Adelic metaplectic group**.

Take the restricted product ∏′_v Mp(W_v) relative to the distinguished integral splittings at good finite places. Its central restricted subgroup is the finite-support product ⊕_v μ₂. Quotient by the subgroup {ε:∏_v ε_v=1} to obtain Mp(W)(A), with exact projection to Sp(W)(A) and a single μ₂ kernel. Equip it with the quotient topology and local compactness inherited from the restricted product.

**Hypotheses.** Global field char≠2 with the characteristic-zero source used for number-field assertions; finitely many bad places retained; topological restricted-product input from AA.1.

**Construction or proof route.**

1. Construct the restricted product using the compact subgroups supplied at good places.
2. The finite-support central product map has kernel as stated; quotient it and prove the projection exact/topological.

**Uses determining the API.**

- Weil III.40 and MP.5: Use one global genuine central character and rational splitting.

**API.**

- `TauCeti.Metaplectic.adelicMetaplectic_projection` (structure): The projection onto Sp(W)(A) is continuous surjective with μ₂ kernel.
- `TauCeti.Metaplectic.adelicMetaplectic_local` (functoriality): Each local cover maps compatibly into the quotient.
- `TauCeti.Metaplectic.adelicMetaplectic_center_product` (characterisation): A finite collection of local central signs has global value their product.

**Discriminating tests.**

- `TauCeti.Metaplectic.adelicCover_twoSigns` (computation): Central −1 at two distinct places becomes the identity in the global quotient.
- `TauCeti.Metaplectic.adelicCover_oneSign` (non-example): Central −1 at one place remains nontrivial.
- `TauCeti.Metaplectic.adelicCover_finiteSupport` (characterisation): Every central representative differs from a single-place sign by the product-one subgroup.

**Acceptance.**

- An unrestricted product has an infinite central kernel and is rejected.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/unramified-compact-splittings`, `MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover`, `AdelicAlgebraicGroups:AA.1`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§§37–38, printed 187–189, PDF 45–47; IV.§42 for the twofold reduction; literal excerpt PDF 46. Literal excerpt: “groupe mgtaplectique Mp(X)A comme 6tant le sous-groupe de Ps(X)A •             form6 des 616ments (s,s) de ce produit tels que”. Restricted adelic extension and its finite central identification.

**Suggested-signature boundary.** R is the AA.1 restricted product, K the image of the finite-support sign-product kernel. Both their construction and topology are mandatory packet hypotheses, not arbitrary quotient data.

**Explicit proof/signature refinements.**

- Native restricted-product topology and quotient-group instances must be instantiated with AA.1; the topological cocycle charts are not supplied by a bare algebraic FactorSet.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Weil product formula

**Theorem.** `TauCeti.Metaplectic.weilIndex_productFormula`

Node: `MetaplecticAutomorphicForms:MP.4/global-weil-index-product`. Planet: **Weil product formula**.

For a nondegenerate quadratic form q over a global field F and the factorizable additive character ψ of A/F with compatible self-dual measures, γψ_v(q_v)=1 almost everywhere and ∏_vγψ_v(q_v)=1. This is the analytic Weil-index product formula; local Hilbert/Hasse formulas are its local adapters.

**Hypotheses.** F has char≠2; every dyadic and archimedean factor included. Character is trivial on F and Haar measures are globally compatible.

**Construction or proof route.**

1. Apply adelic Poisson summation to the quadratic Gaussian distributions after the source’s regularization.
2. Compare both sides using local Fourier index factors and cancel the global self-dual covolume.

**Acceptance.**

- For q=ax² the product includes the real phase and every finite ramified factor.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/weil-index`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), II.§30 Proposition 5, printed 179–180; excerpt at PDF 37. Literal excerpt: “PROI'OSIT*ON 5. Soit / une ]orme quadratique non d~ggngrge sur un espace vectoriel”. Analytic product formula, including all local places.

**Suggested-signature boundary.** Finite support of the global index product; the compatible rational quadratic form/global character and good-place triviality are required packet hypotheses.

**Explicit proof/signature refinements.**

- The oscillatory-distribution version of AL.0 Poisson and its finite-dimensional self-dual normalization remain a Part-II request.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Rational symplectic splitting

**Construction.** `TauCeti.Metaplectic.rationalMetaplecticSplitting`

Node: `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`. Planet: **Rational splitting**.

The product formula gives a canonical homomorphism Sp(W)(F)→Mp(W)(A) splitting the adelic projection, characterized by preservation of the theta summation functional. It agrees with rational Levi/unipotent/Fourier lifts and respects a change of polarization.

**Hypotheses.** Global ψ trivial on F; rational symplectic space and a compatible adelic Schrödinger realization.

**Construction or proof route.**

1. Evaluate the rational Leray cocycle and apply the global index product.
2. Normalize the scalar lift using Poisson/theta invariance and check the generating rational matrices.

**Uses determining the API.**

- Weil Theorem 6; MP.5 rational invariance: Form the genuine automorphic quotient.

**API.**

- `TauCeti.Metaplectic.rationalSplitting_projection` (compatibility): Projection of the rational lift is the diagonal adelic symplectic element.
- `TauCeti.Metaplectic.rationalSplitting_mul` (structure): The rational lift is a group homomorphism.
- `TauCeti.Metaplectic.rationalSplitting_polarization` (compatibility): Changing rational polarization conjugates the model and preserves the lift.

**Discriminating tests.**

- `TauCeti.Metaplectic.rationalSplitting_identity` (degenerate): The rational identity maps to the adelic identity.
- `TauCeti.Metaplectic.rationalSplitting_fourier` (compatibility): The rational Fourier generator preserves theta summation by global Poisson.
- `TauCeti.Metaplectic.rationalSplitting_section` (non-example): An arbitrary single-place sign change of a rational lift generally destroys theta preservation.

**Acceptance.**

- A collection of arbitrary local sections is not a rational group homomorphism.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`, `MetaplecticAutomorphicForms:MP.4/global-weil-index-product`, `MetaplecticAutomorphicForms:MP.2/leray-cocycle`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§40, printed 190–193, PDF 48–51; §41 rational invariance; literal excerpt PDF 48. Literal excerpt: “u n r e l b v e m e n t de Ps(X)k d a n s B0(G), et p a r suite u n r e l b v e m e n t de Ps(X)k d a n s Mp(X)A,”. Rational splitting and the theta summation functional.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Adelic Weil representation

**Construction.** `TauCeti.Metaplectic.adelicWeil`

Node: `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`. Planet: **Adelic Weil representation**.

Construct the global oscillator action on S(X(A))=S(X_∞)⊗(∏′_{v finite}S(X_v)), the algebraic finite-place restricted tensor product with standard lattice indicators and the full joint archimedean Schwartz space. Pure tensor operators use the product of local Weil actions; the product-one central subgroup acts trivially, so the action descends to Mp(W)(A).

**Hypotheses.** Number field, global ψ, finite-dimensional rational X and compatible polarizations/measures. The archimedean space is the joint Schwartz space, not merely the span of products over individual real/complex places.

**Construction or proof route.**

1. Construct the finite restricted tensor action because all but finitely many factors fix the standard vector.
2. Use the common central sign and the central quotient; prove continuity and rational-splitting compatibility on the joint archimedean space.

**Uses determining the API.**

- Weil III.40; theta kernels and finite Weil modules: Supply actual transformed functions for the rational sum.

**API.**

- `TauCeti.Metaplectic.adelicWeil_pureTensor` (simp): On a factorizable vector, each local operator acts on its own factor.
- `TauCeti.Metaplectic.adelicWeil_central` (characterisation): The single adelic central −1 acts as scalar −1.
- `TauCeti.Metaplectic.adelicWeil_characterChange` (compatibility): Changing the global additive character gives the scaled quadratic/symplectic datum with compatible local operators.

**Discriminating tests.**

- `TauCeti.Metaplectic.adelicWeil_goodVector` (compatibility): At a good place the integral compact splitting fixes the standard indicator.
- `TauCeti.Metaplectic.adelicWeil_twoCenters` (characterisation): Two local central −1 operators cancel on a pure tensor and descend to the quotient identity.
- `TauCeti.Metaplectic.adelicWeil_jointSchwartz` (non-example): In two archimedean coordinates there exists a joint Schwartz function outside every finite sum of products of one-coordinate Schwartz functions. The adelic model must accept it.

**Acceptance.**

- The global central −1 acts by −1.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `MetaplecticAutomorphicForms:MP.1/genuine-oscillator`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§§38–39, printed 188–190, PDF 46–48; literal excerpt PDF 47. Literal excerpt: “39. Comme dans le cas local, on v a m o n t r e r m a i n t e n a n t clue (S,(P)-->S(I) ddtermine une”. Actual adelic model with joint archimedean Schwartz space.

**Suggested-signature boundary.** U is the supplier’s finite restricted tensor × full joint archimedean Schwartz model. Pure-tensor evaluation and local good-vector/central conditions require those actual realizations. The two-coordinate Schwartz example explicitly requires a vector outside every finite sum of separated Schwartz products; an algebraic tensor carrier cannot satisfy it.

**Explicit proof/signature refinements.**

- AL.0’s scalar adelic space needs the finite-dimensional/joint archimedean extension; the completion and continuous action comparison must be supplied.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Adelic choice compatibility

**Comparison.** `TauCeti.Metaplectic.adelicWeil_choiceCompatibility`

Node: `MetaplecticAutomorphicForms:MP.4/adelic-choice-compatibility`.

Changing local sections by coboundaries, polarization, or finitely many integral reference vectors produces the corresponding isomorphic restricted-product cover and oscillator model, provided the central product quotient and rational splitting are transported together. Changing ψ to ψ_a, a∈F×, is the scaled rational datum and respects the product formula.

**Hypotheses.** The changed local choices agree at almost all places or have explicitly transported reference compacts; no unrestricted infinite rescaling.

**Construction or proof route.**

1. Use native FactorSet.rescaleEquiv locally.
2. Take the restricted product of the local comparisons, descend its central quotient and compare rational theta functionals.

**Acceptance.**

- An infinite rescaling that does not preserve the reference subgroups need not define a restricted-product map.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`, `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`, `tauceti:TauCeti.FactorSet.rescaleEquiv`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§§38–40, printed 188–193, PDF 46–51; literal excerpt PDF 47. Literal excerpt: “rel~vement continu rs de g2s dans Mp(X)A. De l~ on tire aussitSt les consdquences annoncdes plus haut.”. Local-to-global transport of the chosen models.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Finite Weil representation

**Construction.** `TauCeti.Metaplectic.finiteWeil`

Node: `MetaplecticAutomorphicForms:MP.4/finite-weil-representation`. Planet: **Finite Weil representation**.

For an even integral lattice L with discriminant module D=L∨/L, realize C[D] as the finite adelic Schwartz subspace S_L supported on Lhat∨ and periodic under Lhat. Restrict the adelic Weil action along the rational lift whose real component is γ̃∈Mp₂(Z). In the AGHMP convention this is ω_L, while the frequently cited ρ_L is its complex conjugate. T multiplies e_μ by exp(2πiq(μ)); S is the discriminant-pairing finite Fourier transform with the signature/Weil phase dictated by ψ.

**Hypotheses.** Nondegenerate even lattice, ψ_Q with positive real exponential and globally compatible finite character; discriminant form and signature imported from IntegralLattices.

**Construction or proof route.**

1. Identify each coset basis vector with its lattice-coset indicator.
2. Apply local unipotent and positive Fourier formulas, then use the rational splitting to compare the real lift and finite action.

**Uses determining the API.**

- AGHMP §4.7 and vector-valued half-weight forms: Supply the finite oscillator representation; harmonic Maass spaces remain with their owner.

**API.**

- `TauCeti.Metaplectic.finiteWeil_T` (simp): T e_μ=exp(2πiq(μ))e_μ in ω_L.
- `TauCeti.Metaplectic.finiteWeil_S` (simp): S is the normalized finite pairing Fourier transform with the stated Weil phase.
- `TauCeti.Metaplectic.finiteWeil_conjugate` (compatibility): ρ_L is the complex conjugate of ω_L; T exponents change sign.

**Discriminating tests.**

- `TauCeti.Metaplectic.finiteWeil_unimodular` (degenerate): If L is unimodular, C[D] is one dimensional; its S phase still follows the signature.
- `TauCeti.Metaplectic.finiteWeil_Tbasis` (computation): Each coset basis vector has its own q(μ) phase.
- `TauCeti.Metaplectic.finiteWeil_conjugation` (non-example): Replacing ω_L by ρ_L conjugates its nonreal T phase rather than preserving it.

**Acceptance.**

- The discriminant quadratic form itself belongs to IntegralLattices.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.

**Source match.**

- [PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §4.7 published 452–453, PDF 62–63; excerpt at PDF 63. Literal excerpt: “complex conjugate representation ω L : SL › 2 (Z) → Aut(SL ) by”. Finite adelic subspace and conjugate-representation convention.

**Routed items.** `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/finite-weil`.

**Suggested-signature boundary.** Function-space realization of C[D]; q and pairing are lifts of the completed IntegralLattices finite quadratic module values. Period/lift independence and the metaplectic generator relations require that native AddCircle/QuadraticMap bridge.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

### Function-field metaplectic programme

**Comparison.** `TauCeti.Metaplectic.metaplectic_functionFieldProgramme`

Node: `MetaplecticAutomorphicForms:MP.4/function-field-metaplectic-programme`.

Lafforgue §14 sketches a conditional extension of shtuka excursion constructions to metaplectic groups: replace ordinary geometric Satake by its metaplectic version and use the modified dual group and gerbe/twisting data of (14.1)–(14.5). Record this as a programme with explicit missing hypotheses and constructions, not as a proved metaplectic global Langlands theorem.

**Hypotheses.** Function field, a covering/gerbe datum and the required metaplectic Satake equivalences, fusion and shtuka sheaves supplied. The section’s indications and remarks are not a full proof.

**Construction or proof route.**

1. Import the ordinary excursion/shtuka construction from its existing owner.
2. Identify the points where the twisting datum changes Satake and the dual group; request the metaplectic Part-II extension there.

**Acceptance.**

- No number-field adelic proof is used to claim the function-field shtuka programme is established.

**Prerequisites.** `GeometricSatakeAndFusion:GS3`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/excursion-operator`, `GlobalShtukasAndFunctionFieldLanglands:GS.5/the-excursion-algebra`.

**Source match.**

- [PAPER-LAFFORGUE-18](https://arxiv.org/pdf/1209.5352v10), §14, Remarks14.1–14.2, (14.1)–(14.5), arXiv-v10 PDF 169–173; excerpt at PDF 169. Literal excerpt: “métaplectiques    Ce chapitre indique sommairement comment les résultats de cet article”. Conditional indications, with no theorem promoted beyond the source.

**Routed items.** `PAPER-LAFFORGUE-18/43`.

**Suggested-signature boundary.** Conditional excursion-algebra action signature only. A must be the requested twisted excursion algebra; gerbe/fusion/coherence and modified dual group remain gaps. This is not a proved metaplectic Langlands theorem.

**Explicit proof/signature refinements.**

- Metaplectic Satake/fusion, gerbe sheaves and modified excursion operators are a proposed upstream Part-II request; §14 does not establish all of them.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage4`. Implementation: unchecked.

## MP.5. Theta kernels and automorphic spaces

### Theta kernel

**Construction.** `TauCeti.Metaplectic.thetaKernel`

Node: `MetaplecticAutomorphicForms:MP.5/theta-kernel`. Planet: **Theta kernel**.

For a rational polarized symplectic space W with configuration space X, define θφ(g)=Σx∈X(F)(ωψ(g)φ)(x), φ∈S(X(A)). For a split dual-pair realization write θ(g,h;φ) for its pullback. This is a genuine function on Sp(W)(F)\Mp(W)(A), with the rational subgroup embedded by the canonical splitting; the nontrivial global central sign acts by −1. On an even orthogonal dual pair the pulled-back kernel is linear in the symplectic factor.

**Hypotheses.** Number field, characteristic-zero source, compatible ψ and self-dual measures; actual joint archimedean Schwartz functions. For a dual pair its splitting characters are fixed.

**Construction or proof route.**

1. Establish absolute and locally uniform summability of every transformed Schwartz function on the rational lattice.
2. Apply rational Poisson summation to the rational Fourier generator, and the direct translation/Levi identities to the other generators.
3. Use the genuine central action before restricting to a split dual pair.

**Uses determining the API.**

- Weil Theorem 6; Zhang21 §8; GQT §2: Integrate against automorphic forms or extract unipotent Fourier coefficients.

**API.**

- `TauCeti.Metaplectic.thetaKernel_apply` (simp): The kernel is the rational sum of the transformed Schwartz function.
- `TauCeti.Metaplectic.thetaKernel_rational` (compatibility): θφ(γg)=θφ(g) for the canonical rational lift γ.
- `TauCeti.Metaplectic.thetaKernel_central` (characterisation): θφ(zg)=−θφ(g) for the global central z=−1.

**Discriminating tests.**

- `TauCeti.Metaplectic.thetaKernel_zero` (degenerate): For X=0 the rational sum has one term.
- `TauCeti.Metaplectic.thetaKernel_fourier` (compatibility): The rational Fourier generator preserves the sum by Poisson with covolume1.
- `TauCeti.Metaplectic.thetaKernel_sign` (non-example): A nonzero genuine θφ cannot descend to a function on Sp(W)(A).

**Acceptance.**

- The zero-dimensional configuration has θφ(g)=ω(g)φ(0).

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§41 Théorème6, printed 193–194, PDF 51–52; literal excerpt PDF 51. Literal excerpt: “Alors ~) est une /onction continue sur Mp(X)~, invariante par les translations h gauche ddter- min&s par les ~ldments de Mp(X)A de la /orme rk(s), avec s ePs(X)k.”. Rational sum, continuity and rational invariance.

**Routed items.** `PAPER-ZHANG-21/90`.

**Suggested-signature boundary.** Rational evaluation/sum fragment. X is X(F), φ the restriction of an actual adelic Schwartz vector; summability, canonical rational lift and central z are essential packet hypotheses.

**Explicit proof/signature refinements.**

- The full finite-dimensional joint Schwartz lattice summability proof and native global function-space inclusion need the requested AL.0 extension.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Theta smoothness and growth transfer

**Theorem.** `TauCeti.Metaplectic.theta_uniformModerateGrowth`

Node: `MetaplecticAutomorphicForms:MP.5/theta-growth-transfer`.

The theta kernel is smooth at infinity, locally constant at finite places, and every archimedean differential operator can be applied termwise on compact subsets. On the specified adelic Siegel sets its derivatives satisfy a common polynomial height bound for each finite Schwartz seminorm family. With fixed finite level and finite K-type this gives uniform moderate growth in the AF.2 sense, after comparison of the cover height with the base-group height.

**Hypotheses.** Number field; finite-dimensional quadratic/symplectic datum; fixed finite-level vector and K-type where an automorphic-form space requires them. The height, central-character restriction and Schwartz seminorms must be matched to the supplier.

**Construction or proof route.**

1. Use a compact-uniform summable Schwartz majorant for each differentiated operator.
2. Apply AA.3’s rational lattice counting/reduction bounds on a Siegel set.
3. Transport those estimates through the finite cover and compare the single-exponent all-derivatives definition in AF.2; establish the needed seminorm estimate before using it.

**Acceptance.**

- A bound for each derivative with unrelated exponents does not establish the requested uniform-growth condition.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/theta-kernel`, `AdelicAlgebraicGroups:AA.3/adelic-siegel-set`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-forms-uniform-growth`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§41 Lemmas4–5 and compact normal convergence, printed 193–194, PDF 51–52; literal excerpt PDF 52. Literal excerpt: “LEMME 5. Soient G u n    groupe abdlien localement compact et C une partie compacte”. Compact-family Schwartz majorants underlying continuity; stronger growth requires the stated supplier comparison.

**Suggested-signature boundary.** One differentiated theta function is displayed; the packet requires a single exponent for the complete all-derivatives family and its AA.3/AF.2 height comparison.

**Explicit proof/signature refinements.**

- Weil’s cited continuity proof alone does not prove uniform moderate growth. The differentiated lattice majorant and finite-cover height comparison are explicit missing proof steps, requested from AA.3/AF.2 with an MP-specific transfer.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Genuine automorphic spaces

**Definition.** `TauCeti.Metaplectic.genuineAutomorphic`

Node: `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`. Planet: **Genuine automorphic forms**.

Inside smooth finite-level functions on Sp(W)(F)\Mp(W)(A), take the subspace of infinitesimal-character-finite, uniformly moderate-growth functions f with f(zg)=−f(g), using AF.2’s fixed central-character convention. Its cuspidal subspace has vanishing constant term along every proper rational parabolic, computed through the canonical unipotent splitting. Following GQT §2.10, this smooth space imposes no K-finiteness and carries the full right G(A)-action. Its K-finite part is instead a (g,K)-module with the finite-adelic action; full real-group translation is not claimed to preserve K-finiteness.

**Hypotheses.** Use the actual adelic cover, rational splitting and AF.1–3 analytic conventions; require the same split-center/central-character normalization as the base automorphic space.

**Construction or proof route.**

1. Intersect explicit invariant function subspaces, importing the linear-group smoothness/growth notions.
2. Prove right-translation invariance of the smooth space by transporting growth and infinitesimal-character operators through the finite cover. Then take the K-finite (g,K)-module and distinguish its available actions.
3. Use the unipotent splitting and AA quotient probability measure to define the cusp equations.

**Uses determining the API.**

- MP.5 theta lift; MP.7 classical comparison; MP.8 genuine Eisenstein: State the actual output space and its cusp/central conditions.

**API.**

- `TauCeti.Metaplectic.genuineAutomorphic_eval` (data): Elements evaluate as functions on the actual cover quotient.
- `TauCeti.Metaplectic.genuineAutomorphic_right` (structure): Right translation preserves the smooth genuine automorphic and cusp subspaces. The K-finite part is stable under its (g,K) and finite-adelic actions.
- `TauCeti.Metaplectic.genuineCusp_iff` (characterisation): Membership in the cusp subspace is the vanishing of all proper parabolic constant terms.

**Discriminating tests.**

- `TauCeti.Metaplectic.genuineAutomorphic_zero` (degenerate): The zero function belongs to both automorphic and cusp subspaces.
- `TauCeti.Metaplectic.genuineAutomorphic_descend` (non-example): A function that is both genuine and descends to the base group is zero over C.
- `TauCeti.Metaplectic.genuineAutomorphic_translation` (compatibility): Translating a genuine function preserves its central sign equation.

**Acceptance.**

- The genuine condition is a linear equation, not a claim of linear reductive algebraic-group structure.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `MetaplecticAutomorphicForms:MP.5/theta-growth-transfer`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicFormsOnReductiveGroups:AF.3`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§41 Théorème6, printed 193, PDF 51; AF.2/3 supplies finiteness and growth conditions; literal excerpt PDF 51. Literal excerpt: “Alors ~) est une /onction continue sur Mp(X)~, invariante par les translations h gauche ddter- min&s par les ~ldments de Mp(X)A de la /orme rk(s), avec s ePs(X)k.”. The actual cover carries genuine theta functions; analytic automorphic-space conditions are imported and compared.
- [GQT](https://arxiv.org/pdf/1207.4709v3), §2.10, arXiv-v3 PDF 13. Literal excerpt: “we do not impose the usual K-finiteness condition. Hence the full group G(A) acts on A(G).”. Separates full smooth group action from the K-finite Harish–Chandra core; the cover transfer remains MP-specific.

**Suggested-signature boundary.** Genuine-sign submodule fragment. The AF.1/2 smooth, finite-level, Z-finite and uniform-growth restrictions and AF.3 all-parabolic continuous constant terms are omitted until their native carriers arrive. The full smooth space has a group action; its K-finite core has the (g,K) and finite-adelic actions.

**Explicit proof/signature refinements.**

- AF.1–3 do not themselves define a cover automorphic space. Native smooth/globalized function carriers and the finite-cover comparison remain required signatures; they are not replaced by arbitrary Prop fields.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Unipotent splittings

**Theorem.** `TauCeti.Metaplectic.metaplectic_unipotentSplitting`

Node: `MetaplecticAutomorphicForms:MP.5/unipotent-splitting`.

Each rational unipotent subgroup U of Sp(W) has the canonical continuous splitting in the local and adelic metaplectic double cover, compatible with conjugation and the rational splitting. On the Siegel unipotent this is the phase-multiplication operator. Uniqueness is in the characteristic-zero unipotent setting and follows from absence of nontrivial continuous μ₂-valued characters.

**Hypotheses.** Characteristic zero; the unipotent subgroup and cover topology are fixed.

**Construction or proof route.**

1. On root subgroups use the normalized operator and its additive group law.
2. Compare root relations and conjugation; use connected real groups and uniquely two-divisible nonarchimedean unipotents for uniqueness.
3. Take restricted products and compare rational elements.

**Acceptance.**

- For n(b₁)n(b₂), the canonical lifts multiply to the lift of n(b₁+b₂).

**Prerequisites.** `MetaplecticAutomorphicForms:MP.1/metaplectic-double-cover`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`.

**Source match.**

- [Kudla96](https://www.math.utoronto.ca/skudla/castle.pdf), I.6 Lemma 6.3, PDF 25–26 (unique unipotent lift); compare I.6 formulas PDF 26–27; literal excerpt PDF 25. Literal excerpt: “Lemma 6.3. The homomorphism µ : n → (n, 1) is the unique homomorphism lifting the natural inclusion”. Generator splitting and its extension to unipotent radicals.

**Suggested-signature boundary.** G here is the actual unipotent subgroup, H its inverse image in the cover. No arbitrary cover splits; the characteristic-zero unipotent and source topology conditions are mandatory.

**Explicit proof/signature refinements.**

- The complete root-relation proof and native rational-unipotent carrier are supplier/gap inputs; the Siegel formula alone is not a proof for every U.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Metaplectic constant terms and Whittaker coefficients

**Construction.** `TauCeti.Metaplectic.metaplecticWhittaker`

Node: `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

For a continuous genuine automorphic f, a rational unipotent U, and a unitary character η on U(F)\U(A), define W_U,η(f)(g)=∫U(F)\U(A) f(ũg)η(u)⁻¹du using the canonical splitting and probability quotient Haar. The trivial η gives the constant term. Right translation and differentiation commute with the integral under the AF.3 regularity hypotheses; central genuineness is retained.

**Hypotheses.** U(F)\U(A) compact; η trivial on rational points; f smooth for derivative assertions. Fourier expansion requires the appropriate abelian U and the supplier’s convergence topology.

**Construction or proof route.**

1. Pull f back along the actual splitting and integrate on the compact quotient.
2. Use AA quotient Haar and AF.3 differentiation under the integral.
3. For abelian U apply Fourier completeness with its normalization; no L¹-equivalence-class point evaluation is used.

**Uses determining the API.**

- MP.7 Fourier expansion; MP.8 genuine constant terms: Supply a normalized compact-quotient extraction, retaining cover splittings.

**API.**

- `TauCeti.Metaplectic.metaplecticWhittaker_trivial` (compatibility): The trivial-character coefficient equals the constant term.
- `TauCeti.Metaplectic.metaplecticWhittaker_right` (functoriality): Coefficient extraction commutes with right translation.
- `TauCeti.Metaplectic.metaplecticWhittaker_central` (compatibility): The coefficient is genuine in its remaining cover variable.

**Discriminating tests.**

- `TauCeti.Metaplectic.metaplecticWhittaker_zeroU` (degenerate): For the trivial U the integral is f(g).
- `TauCeti.Metaplectic.metaplecticWhittaker_character` (computation): For f on a compact abelian U equal to η, its η coefficient is1.
- `TauCeti.Metaplectic.metaplecticWhittaker_orthogonal` (non-example): A distinct unitary character has zero η coefficient.

**Acceptance.**

- A nontrivial unipotent character coefficient of a constant function is zero.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`, `MetaplecticAutomorphicForms:MP.5/unipotent-splitting`, `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, `AdelicAlgebraicGroups:AA.1`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), III.§41 Théorème6, printed 193, PDF 51 (theta realization); AA.1 and AF.3 supply the quotient-integral API; literal excerpt PDF 51. Literal excerpt: “Alors ~) est une /onction continue sur Mp(X)~, invariante par les translations h gauche ddter- min&s par les ~ldments de Mp(X)A de la /orme rk(s), avec s ePs(X)k.”. Theta continuity permits compact unipotent integration; spectral expansion inputs are separate.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Native unipotent quotient integration and Fourier-completeness topology must be instantiated from AA/AL; the module-level averaging prototype does not establish smooth cover expansions.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Global theta lift

**Construction.** `TauCeti.Metaplectic.globalThetaLift`

Node: `MetaplecticAutomorphicForms:MP.5/global-theta-lift`. Planet: **Global theta lift**.

For a dual pair G,H, define θφ(f)(g)=∫[H] θ(g,h;φ) conjugate(f(h))dh whenever the displayed product is absolutely integrable. Its span is the global theta-lift module; the oscillator splitting fixes its central character and equivariance. If f is cuspidal with the required unitary central character, AF.3 rapid decay combined with the theta-growth estimate supplies convergence in the source’s permitted range.

**Hypotheses.** Quotient and measure normalized as in GQT; use either anisotropic H, the convergent range, or a cusp/decay bound proved sufficient. No arbitrary regularized value is substituted for a divergent integral.

**Construction or proof route.**

1. Prove an integrable majorant on AA.3’s covering Siegel sets using AF.3’s rapid decay in G(A)^1.
2. Apply Fubini/dominated convergence only after that bound; unfold rational invariance to obtain equivariance.
3. Take the invariant span in the appropriate genuine/linear automorphic output space.

**Uses determining the API.**

- GQT §11 Rallis; GZ.5 toric pairing; IP §§7–9: Supply the actual global module and theta pairing.

**API.**

- `TauCeti.Metaplectic.globalThetaLift_apply` (simp): The lift evaluates by the integrable theta pairing.
- `TauCeti.Metaplectic.globalThetaLift_equivariant` (functoriality): Right translation acts through the kernel’s two commuting actions.
- `TauCeti.Metaplectic.globalThetaLift_central` (characterisation): The output central character is determined by the chosen oscillator splitting and input character.

**Discriminating tests.**

- `TauCeti.Metaplectic.globalThetaLift_zero` (degenerate): Zero input or zero Schwartz vector gives zero output.
- `TauCeti.Metaplectic.globalThetaLift_compact` (compatibility): For a compact source quotient, continuous kernel/input give an ordinary Haar integral.
- `TauCeti.Metaplectic.globalThetaLift_divergent` (non-example): For nonintegrable kernel/input data the raw native Bochner integral returns zero. This default value does not satisfy the integrability contract for a mathematical theta lift.

**Acceptance.**

- A source central character that mismatches the kernel cannot produce the advertised output representation.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/theta-kernel`, `MetaplecticAutomorphicForms:MP.5/theta-growth-transfer`, `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`, `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay`, `AdelicAlgebraicGroups:AA.3`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §11.1, PDF 52, cuspidal theta lift; §2.11 PDF 13 gives the kernel; literal excerpt PDF 52. Literal excerpt: “theta lift Θn,r (π) to H(Vr ), so that Θn,r (π) is the automorphic subrepresentation of H(Vr ) spanned by the automorphic forms”. The actual theta integral and its convergence/automorphic output.

**Suggested-signature boundary.** Integrable theta pairing. Lean’s total Bochner integral returns zero for a nonintegrable input; that behavior is tested explicitly. It is not a convergent mathematical theta lift, whose integrability gate remains mandatory in the packet.

**Explicit proof/signature refinements.**

- The source-qualified cuspidal growth/decay transfer and actual global automorphic module carrier must be completed; a totalized integral alone does not satisfy the convergence contract.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Weil convergence criterion

**Theorem.** `TauCeti.Metaplectic.thetaIntegral_converges`

Node: `MetaplecticAutomorphicForms:MP.5/theta-integral-convergence`. Planet: **Weil convergence criterion**.

For the GQT type-I datum with dim_E V=m=m₀+2r, dim_E W=n, ε₀∈{−1, 0, 1}, d(n)=n+ε₀, the theta integral of every Schwartz vector over H(V)(F)\H(V)(A) converges absolutely if r=0 or m−r>d(n). The borderline and second-term cases require the regularized construction. This is a criterion for the theta integral, not for the pointwise rational theta sum.

**Hypotheses.** Number field; GQT §2 groups, splitting characters and Tamagawa measure; the exceptional split O(1, 1) normalization is retained.

**Construction or proof route.**

1. Use the rational theta estimate and reduction of H(V) to a Siegel set.
2. Compare the boundary exponents against the cusp volume exponent; the anisotropic quotient is compact.
3. Invoke Weil’s precise convergence theorem after matching m,r,n,ε₀.

**Acceptance.**

- For rank-one target n=1, split binary m=2,r=1 fails 1>2; anisotropic binary r=0 converges.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/theta-kernel`, `MetaplecticAutomorphicForms:MP.5/theta-growth-transfer`, `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.1`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §3.1, PDF 14, Weil convergent range; literal excerpt PDF 14. Literal excerpt: “r = 0 or m − r = m0 + r > d(n). We call this the Weil’s convergent range.    In particular, the pair (Wn , V0 ) is in this range. Then for φ0 ∈ S(Yn∗ ⊗ V0 )(A), we have the theta”. Convergence inequality with anisotropic exception.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original convergence proof referenced by GQT is not fully read; its finite-cover/reduction comparison is retained as a proof gap.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Regularized theta integral

**Construction.** `TauCeti.Metaplectic.regularizedTheta`

Node: `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`. Planet: **Regularized theta integral**.

In the GQT nonconvergent range r>0, m−r≤d(n), r≤n, choose a compatible regularizing Hecke/central operator z making ω(z)φ rapidly decreasing and acting on the normalized auxiliary H-Eisenstein series E_H(s,h) by P_z(s). Define B_{n,r}(s,φ)=1/(τ(H)κ_r P_z(s)) ∫[H] θ(g,h;ω(z)φ)E_H(s,h)dh. It is independent of the admissible regularizer, meromorphic, and satisfies the source functional equation. Laurent coefficients B_k at ρ_H=(m−r−ε₀)/2 retain the source’s indexing.

**Hypotheses.** GQT datum; E_H normalized from the parabolic |det|^s; κ_r its residue/constant normalization. For split O(1, 1), κ_r=2 and ρ_H=0.

**Construction or proof route.**

1. Construct z and an integrable differentiated majorant; prove its eigenvalue P_z on E_H.
2. Compare two admissible z by their commuting product, then use the spectral continuation of E_H.
3. Extract Laurent coefficients in the correct local coordinate s−ρ_H.

**Uses determining the API.**

- GQT §§7–10; MP.6 second-term identity and GZ.5 split norm examples: Supply genuine Laurent coefficients for a divergent theta integral.

**API.**

- `TauCeti.Metaplectic.regularizedTheta_regularizer` (compatibility): The meromorphic family is independent of the admissible z.
- `TauCeti.Metaplectic.regularizedTheta_convergent` (compatibility): In a matched convergent case its specified coefficient equals the ordinary theta integral.
- `TauCeti.Metaplectic.regularizedTheta_laurent` (data): B_k is the coefficient of (s−ρ_H)^k with no reindexing.

**Discriminating tests.**

- `TauCeti.Metaplectic.regularizedTheta_zero` (degenerate): Zero Schwartz vector gives the zero meromorphic family.
- `TauCeti.Metaplectic.regularizedTheta_scale` (computation): Multiplying z by a nonzero scalar multiplies numerator and P_z equally.
- `TauCeti.Metaplectic.regularizedTheta_splitBinary` (non-example): The split O(1, 1) case uses κ_r=2 at ρ_H=0, rather than a generic simple-pole normalization.

**Acceptance.**

- An unregularized divergent integral cannot be used in place of B_{n,r}.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/theta-integral-convergence`, `MetaplecticAutomorphicForms:MP.5/theta-kernel`, `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `AdelicAlgebraicGroups:AA.1`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §§3.2–3.7, PDF 14–18; definition §3.5 and functional equation(3.7); literal excerpt PDF 18. Literal excerpt: “3.5. Regularized theta integral. The regularized theta integral is defined to be the function”. Named regularizer, eigenvalue denominator and Laurent convention.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Regularizer existence, independence and operator eigenvalue proofs need their original sources; the native meromorphic family and normalized Eisenstein carrier are AS requests with an MP adaptation.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Extended Schwartz Weil action

**Construction.** `TauCeti.Metaplectic.extendedSchwartzWeil`

Node: `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`.

For a totally real F and even-dimensional positive-definite (V,q), form the YZ extended adelic space in (x,u)∈V(A)×A×. At finite places use locally constant compactly supported functions; at real places use (P₁(uq(x))+sgn(u)P₂(uq(x)))exp(−2π|u|q(x)), where P₁,P₂ are complex polynomials in the one real argument uq(x). The action of GL₂(A)×GO(V)(A) extends the usual even oscillator action and rescales the u variable by the similitude multiplier.

**Hypotheses.** YZ published §6.1 exact extended real test class P₁,P₂∈C[t], evaluated at uq(x); u≠0; GL₂/GO matched action and quadratic character conventions.

**Construction or proof route.**

1. Import the usual even oscillator action and compute the extra diagonal/similitude generators.
2. Verify the real test class is preserved by the prescribed extended operators.
3. Use the finite restricted tensor product and the joint archimedean realization; the full extended space is not an arbitrary Schwartz space on V×A×.

**Uses determining the API.**

- YZ published §6.1 and GZ.6–7: Form unit-quotiented theta functions with an auxiliary similitude variable.

**API.**

- `TauCeti.Metaplectic.extendedSchwartzWeil_similitude` (simp): A similitude transports the u parameter with the source’s multiplier convention.
- `TauCeti.Metaplectic.extendedSchwartzWeil_restrict` (compatibility): At u=1 and in the isometry subgroup the usual even oscillator action is recovered.
- `TauCeti.Metaplectic.extendedSchwartzWeil_real` (data): The real factors have the displayed polynomial-times-Gaussian form.

**Discriminating tests.**

- `TauCeti.Metaplectic.extendedSchwartzWeil_zero` (degenerate): Zero polynomial data give the zero vector.
- `TauCeti.Metaplectic.extendedSchwartzWeil_sign` (computation): At u<0 the P₂ contribution changes sign.
- `TauCeti.Metaplectic.extendedSchwartzWeil_gaussian` (compatibility): For P₁=1,P₂=0,u=1 the real vector is exp(−2πq(x)).

**Acceptance.**

- u↦−u changes the P₂ sign and the character convention.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `MetaplecticAutomorphicForms:MP.3/orthogonal-cover-restriction`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`.

**Source match.**

- [PAPER-YUAN-ZHANG-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Published §6.1, printed 578–579, PDF 46–47; recalled definitions originate in YZZ13 §§2.1.3, 4.1; literal excerpt PDF 46. Literal excerpt: “6.1. Schwartz functions and theta series. We first recall the notion of Schwartz functions and theta series in [YZZ13], which is a variant of the stan- dard notions.”. Extended real test functions and similitude action.

**Routed items.** `PAPER-YUAN-ZHANG-18/extended-schwartz`.

**Suggested-signature boundary.** The real vector fragment is polynomial-times-Gaussian. In the similitude API ρ is the actual GO action, act its defining action and ν its multiplier: pullback uses (g⁻¹x,ν(g)u). In the restriction API the source GO isometry/GL₂ inclusion identifies the extended and usual oscillator actions at u=1. The full GL₂ action, adelic carrier and original Waldspurger/YZZ13 proof remain recorded supplier/source gaps.

**Explicit proof/signature refinements.**

- The complete YZZ/Waldspurger extended-action reference is unread; its native carrier and operator comparison are an explicit missing input.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Unit-quotiented theta series

**Construction.** `TauCeti.Metaplectic.unitTheta`

Node: `MetaplecticAutomorphicForms:MP.5/unit-quotiented-theta`.

For extended φ invariant under a finite-index unit subgroup μ via (x,u)↦(αx,α⁻²u), define θ_μ(g,φ)=Σu∈μ²\F× Σx∈V(F) r(g)φ(x,u). The ±1 stabilizer normalization is w_K=|{±1}∩K|. With the exact real test class, the series is normally convergent and transforms under GL₂(F) and the prescribed finite-level GO action as in YZ published §6.1.

**Hypotheses.** YZ totally real positive-definite even V; finite-index unit subgroup preserving φ; compact level K; retain u-orbits and w_K.

**Construction or proof route.**

1. Use Dirichlet-unit reduction of u with finite adelic support and Gaussian decay in x.
2. Prove independence of orbit representatives from the assumed unit action.
3. Apply the extended rational generator identities and Poisson summation.

**Uses determining the API.**

- YZ published §6.2 and averaged Colmez theta integral: Integrate the convergent extended theta kernel.

**API.**

- `TauCeti.Metaplectic.unitTheta_representative` (compatibility): The term is independent of the μ²-orbit representative after the simultaneous x substitution.
- `TauCeti.Metaplectic.unitTheta_rational` (compatibility): The series satisfies the stated GL₂(F) transformation.
- `TauCeti.Metaplectic.unitTheta_multiplicity` (simp): w_K is1 or2 according to −1∈K.

**Discriminating tests.**

- `TauCeti.Metaplectic.unitTheta_zero` (degenerate): Zero test function gives zero.
- `TauCeti.Metaplectic.unitTheta_minusOne` (computation): A level containing −1 has w_K=2.
- `TauCeti.Metaplectic.unitTheta_orbit` (non-example): Repeating a nonzero unit-orbit term infinitely often is not summable: the constant sequence 1 indexed by Z is a native non-example.

**Acceptance.**

- Summing over every u∈F× instead of μ²-orbits repeats an infinite unit orbit.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, `MetaplecticAutomorphicForms:MP.5/theta-kernel`, `AdelicAlgebraicGroups:AA.3`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Source match.**

- [PAPER-YUAN-ZHANG-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Published §6.1, printed 578–579, PDF 46–47; literal excerpt PDF 47. Literal excerpt: “Here the natural action of µK on V × F × is just α ◦ (x, u) 7→ (αx, α−2 u). The summation over u is well defined since φ(αx, α−2 u) = r(α−1 )φ(x, u) = φ(x, u)”. The unit quotient and multiplicity normalization.

**Routed items.** `PAPER-YUAN-ZHANG-18/unit-theta`, `PAPER-YUAN-ZHANG-18/theta-automorphy`.

**Suggested-signature boundary.** Y is the actual μ² quotient, X=V(F); absolute summability and simultaneous orbit reindexing are packet conditions. The stabilizer Bool test assumes the source’s distinct ±1.

**Explicit proof/signature refinements.**

- The unit/Gaussian convergence argument and full extended rational-action comparison need a native finite-dimensional implementation and the unread extended-action source.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Extended restriction comparison

**Comparison.** `TauCeti.Metaplectic.extendedWeil_restriction`

Node: `MetaplecticAutomorphicForms:MP.5/extended-restriction-comparison`.

For V₁⊂V nondegenerate even-dimensional spaces of dimensions d₁,d, restrict a standard tensor test vector along V₁ and compare its transformed restrictions. In the finite-place normalized model the modulus ratio is δ(g)^((d−d₁)/2), where δ(diag(a,d))=|a/d|^{1/2}; at infinity include the prescribed ρ(g) power. The quadratic-character/Weil-index ratio must also be retained unless the two splitting characters agree.

**Hypotheses.** YZ published §6.2 standard complementary Gaussian/indicator; explicit common splitting characters for any statement containing only the modulus factor.

**Construction or proof route.**

1. Factor the oscillator representation over V₁⊕V₁⊥.
2. Evaluate the complementary standard vector at0 and compute Levi and Fourier factors.
3. Compare the finite and archimedean normalizations; δ is a positive modulus, not a character.

**Acceptance.**

- Different signed discriminants require their character ratio on Levi elements.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.2/weil-index-identities`.

**Source match.**

- [PAPER-YUAN-ZHANG-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Published §6.2, printed 580–581, PDF 48–49, restriction formula preceding(6.2.1); literal excerpt PDF 49. Literal excerpt: “Here we write d = dim V and d1 = dim V1 .     This result implies that”. Restriction factors and the positive Iwasawa modulus.

**Routed items.** `PAPER-YUAN-ZHANG-18/rev-restriction-of-the-weil-representation`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The abbreviated restriction formula suppresses splitting-character data. The generator comparison and exact source convention must be reconciled; only the matching-character version is targeted without an extra ratio.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Ideal-class theta series

**Construction.** `TauCeti.Metaplectic.idealClassTheta`

Node: `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`. Planet: **Ideal class theta series**.

For K=Q(√D), negative fundamental discriminant D, ideal class A and w=|O_K×|, define θ_A(z)=1/w+Σn≥1 r_A(n)exp(2πinz). Equivalently, for an integral ideal a∈A, θ_A(z)=(1/w)Σλ∈a exp(2πiN(λ)z/N(a)); the latter first counts A⁻¹, and conjugation identifies its coefficients with A. The series is independent of a and normally convergent on the upper half plane.

**Hypotheses.** D<0 fundamental; actual ideal-class/norm arithmetic supplied by GN.3; z in the native upper half plane.

**Construction or proof route.**

1. Use positive-definite binary norm and lattice Gaussian decay.
2. Map nonzero λ to (λ)a⁻¹, with each ideal counted w times.
3. Apply ideal conjugation to exchange A and A⁻¹; handle the zero vector separately.

**Uses determining the API.**

- GZ IV.§2 Lemma 2.3; GZ.5 kernel inputs: Supply the classical weight-one binary theta form.

**API.**

- `TauCeti.Metaplectic.idealClassTheta_coeff` (simp): The positive n coefficient is r_A(n).
- `TauCeti.Metaplectic.idealClassTheta_constant` (simp): The constant coefficient is1/w.
- `TauCeti.Metaplectic.idealClassTheta_lattice` (compatibility): The w-normalized lattice sum equals the ideal-count series.

**Discriminating tests.**

- `TauCeti.Metaplectic.idealClassTheta_gaussianUnits` (computation): For K=Q(i), w=4 and the constant coefficient is1/4.
- `TauCeti.Metaplectic.idealClassTheta_conjugate` (compatibility): A and A⁻¹ give the same theta series.
- `TauCeti.Metaplectic.idealClassTheta_zeroIdeal` (non-example): The constant term is supplied by λ=0 and is not a count of nonzero integral ideals.

**Acceptance.**

- The constant coefficient is1/w, not the number of ideals of norm 0.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/theta-kernel`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.

**Source match.**

- [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I.§5(5.2), printed 229, PDF 6; IV.§1(1.1), printed 268, PDF 45. Literal excerpt: “theta-series”. Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Routed items.** `PAPER-GROSS-ZAGIER-86/19`, `PAPER-GROSS-ZAGIER-86/177`.

**Suggested-signature boundary.** Norm-count theta function. w and r must be the imaginary-quadratic unit count and ideal-class coefficients, with n=0 separated from nonzero ideals; the lattice/ideal counting dictionary stays GN.3.

**Explicit proof/signature refinements.**

- Native ideal-class count/norm-lattice equivalence and normal convergence are GN/AL supplier inputs; no unary jacobiTheta theorem is substituted for this binary theta object.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Ideal-class theta modularity

**Theorem.** `TauCeti.Metaplectic.idealClassTheta_modular`

Node: `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-modularity`.

θ_A is holomorphic of weight 1 on Γ₀(|D|) with Nebentypus ε_D: θ_A(γz)=ε_D(d)(cz+d)θ_A(z), and it is holomorphic at every cusp. This holds for every negative fundamental D; the explicit all-SL₂(Z) transformation node below is restricted to odd D.

**Hypotheses.** Negative fundamental D; γ∈Γ₀(|D|); source lattice and character conventions.

**Construction or proof route.**

1. Use the adelic binary oscillator section and local integral lattice stabilizer.
2. Compare its positive real Gaussian with the weight 1 slash action.
3. Prove all-cusp holomorphy by the transformed lattice Gaussian expansion.

**Acceptance.**

- For even D the odd-D Gauss-factor formula is not asserted.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`, `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Source match.**

- [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), IV.§1 after(1.1), printed 268, PDF 45. Literal excerpt: “It is known”. Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Routed items.** `PAPER-GROSS-ZAGIER-86/178`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Hecke/Schoeneberg’s original all-discriminant modularity proof is not read; GZ quotes it. Its exact classical modular-form carrier and cusp comparison remain requested.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Ideal-class theta conjugation

**Theorem.** `TauCeti.Metaplectic.idealClassTheta_conjugation`

Node: `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-conjugation`.

For every ideal class A and n≥1, conjugation gives r_A(n)=r_{A⁻¹}(n), hence θ_A=θ_{A⁻¹}. For the ramified ideal d₁ in an odd-discriminant factorization, d₁²=(D₁), so its class D₁ has square1; consequently θ_{A⁻¹D₁⁻¹}=θ_{AD₁}.

**Hypotheses.** Imaginary quadratic K; the ramified ideal is the one in GZ Lemma 2.3.

**Construction or proof route.**

1. Use aā=(N(a)) for the norm-preserving ideal conjugation bijection.
2. Use the ramified prime factorization to compute d₁².
3. Compare Fourier coefficients, including the shared constant1/w.

**Acceptance.**

- The inverse-class equality uses a bijection, not an assumption that every class has order2.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Source match.**

- [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), IV.§2 proof of Lemma(2.3), printed 275, PDF 52. Literal excerpt: “because κ(D₁)κ(D₂) = i and θ_{A⁻¹d₁} = θ_{Ad₁}.”. Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Routed items.** `PAPER-GROSS-ZAGIER-86/328`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Ideal-class theta transformation

**Theorem.** `TauCeti.Metaplectic.idealClassTheta_transform`

Node: `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-general-transform`.

For odd negative fundamental D=D₁D₂, δ_i=|D_i|, γ=[[a,b],[c,d]]∈SL₂(Z) with gcd(c,|D|)=δ₂, and c* inverse to c modulo δ₁ chosen0 modulo δ₂, (θ_A|₁γ)(z)=ε_{D₁}(c/δ₂)ε_{D₂}(d)κ(D₁)⁻¹δ₁⁻¹/²χ_{D₁,D₂}(A)θ_{A D₁}((z+c*d)/δ₁). Here κ(D₁)=1 or i by its sign, and D₁ also denotes the class of the ideal of normδ₁ only in the last subscript. Use SL₂, correcting the printed PSL₂ because weight 1 detects −I.

**Hypotheses.** D odd squarefree, D≡1 mod4; D_i fundamental with1 allowed; c* convention and exact genus character; no even-discriminant extension asserted.

**Construction or proof route.**

1. Apply the ideal-lattice Poisson identity and reduce the finite Gauss sums.
2. Evaluate the two quadratic Gauss factors with the correct δ_i indices.
3. Use the norm-class conjugation equality and d₁²=(D₁).

**Acceptance.**

- At γ=−I, the weight 1 action and odd ε_D character have the same sign.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`, `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-conjugation`, `MetaplecticAutomorphicForms:MP.6/ideal-lattice-poisson`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Source match.**

- [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), IV.§2 Lemma(2.3), printed 274, PDF 51; proof275, PDF 52. Literal excerpt: “(2.3) Lemma.”. Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Routed items.** `PAPER-GROSS-ZAGIER-86/194`.

**Suggested-signature boundary.** General SL₂ integral transform fragment with the source δ-indexed Gauss sum and determinant/ideal twist in factor/transformed. GZ’s explicit Lemma 2.3 has odd fundamental discriminant; no all-D explicit formula is asserted.

**Explicit proof/signature refinements.**

- The finite Gauss-sum proof needs the exact quadratic-character supplier; the visually read statement and its odd-D hypothesis are retained without claiming the full computation is implemented.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

### Genuine Eisenstein families

**Construction.** `TauCeti.Metaplectic.genuineEisenstein`

Node: `MetaplecticAutomorphicForms:MP.5/genuine-eisenstein-family`.

For a rational parabolic of Mp(W), an actual genuine Levi cuspidal datum and a normalized section in its covered induced representation, define E(g,s,F)=Σγ∈P(F)\Sp(W)(F)F_s(γg) in a proved absolute-convergence chamber. The rational/unipotent splittings are canonical; the covered Levi and genuine inducing character are retained. The span of the continued families/residues is an Eisenstein space only after the cover-specific intertwining/constant-term comparison is established.

**Hypotheses.** Specified covered parabolic, genuine Levi representation, actual section and source-qualified convergence chamber; no automatic linear reductive-group continuation theorem.

**Construction or proof route.**

1. Use MP.3’s covered Levi induction and MP.4 rational splitting to make the summand well-defined.
2. Prove compact-uniform convergence via the corresponding finite-cover comparison and AS.1 estimates.
3. Use the normalized cover intertwining operators and AS.2 adaptation for meromorphic continuation and residues.

**Uses determining the API.**

- MP.6 regularization and MP.7 rank-one Eisenstein coefficients: Provide actual cover sections and their qualified family/residue space.

**API.**

- `TauCeti.Metaplectic.genuineEisenstein_sum` (simp): In the verified chamber the value is the rational coset sum.
- `TauCeti.Metaplectic.genuineEisenstein_central` (characterisation): The inducing central sign is retained in E.
- `TauCeti.Metaplectic.genuineEisenstein_constantTerm` (compatibility): Its constant term is expressed by the specified normalized cover intertwiners.

**Discriminating tests.**

- `TauCeti.Metaplectic.genuineEisenstein_zero` (degenerate): The zero section gives the zero family.
- `TauCeti.Metaplectic.genuineEisenstein_sign` (non-example): A nonzero genuine family cannot descend to the linear base group.
- `TauCeti.Metaplectic.genuineEisenstein_siegel` (compatibility): For the Siegel evaluation section its parameter is s₀=(m−d(n))/2 as in MP.6.

**Acceptance.**

- For an odd orthogonal datum the inducing character is genuine, not an ordinary linear-group character.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`, `MetaplecticAutomorphicForms:MP.5/unipotent-splitting`, `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`, `MetaplecticAutomorphicForms:MP.4/rational-symplectic-splitting`, `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §§5.3, 6.1–6.2, PDF 25, 28; pole statement Proposition 6.1 excludes O(1, 1); literal excerpt PDF 28. Literal excerpt: “6.1. Siegel Eisenstein series. For a standard section Φs ∈ Inn (s, χ), we consider the Siegel Eisenstein”. Siegel family as the scoped worked case; general covered induction/continuation remains requested.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- General covered parabolic induction, convergence and normalized meromorphic intertwiners require source-qualified SR/AS extensions. GQT’s Siegel example does not close a general cover Langlands theorem.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage5`. Implementation: unchecked.

## MP.6. Siegel–Weil, doubling and Rallis formulas

### Theta measure conventions

**Comparison.** `TauCeti.Metaplectic.theta_measureComparison`

Node: `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

Match self-dual additive measures, restricted-product Haar and GQT quotient Tamagawa measures before theta integration. Write I=τ(H)⁻¹∫[H]θ. For a covering quotient map π use π* dĝ=dg as stipulated. The orthogonal τ is1 in the source convention except split O(1, 1), where it is1/2; unitary τ is2. Disconnected O(V) needs its component normalization explicitly, and cannot be imported from a connected reductive Tamagawa theorem.

**Hypotheses.** GQT §2 exact groups and quotient conventions; GL/GO central quotient data where used.

**Construction or proof route.**

1. Compare all local self-dual measures and their almost-everywhere unit-volume vectors.
2. Apply AA.0’s restricted-Haar integral and AA.2’s connected group results only within their hypotheses.
3. Supply the separate disconnected-orthogonal component formula, then compare the normalized theta pairing.

**Acceptance.**

- The split O(1, 1) normalization changes the expected scalar by2.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/heisenberg-haar`, `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `AdelicAlgebraicGroups:AA.2/tamagawa-number`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §2.5, PDF 11, cover pushforward measure and orthogonal exceptions; literal excerpt PDF 11. Literal excerpt: “2.5. Measures. Having fixed the additive character ψ of F \A, we fix the Haar measure dxv on Fv (for”. Normalized theta measure, including split orthogonal exception.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- AA.2 supplies connected algebraic groups. Its Part-II disconnected orthogonal component normalization and the exact GQT measure comparison are requested, not inferred.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Siegel–Weil section

**Construction.** `TauCeti.Metaplectic.siegelWeilSection`

Node: `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`. Planet: **Siegel–Weil section**.

For a type-I dual pair, send φ to Φφ(g)=(ω(g)φ)(0) in the normalized Siegel degenerate principal series I_n(s₀,χV), s₀=(m−d(n))/2. Extend by the source’s standard flat section to a meromorphic Eisenstein family E(g,s,Φφ), and write A_k(φ) for its Laurent coefficients at s₀. The inducing cover and χV depend on orthogonal parity and the chosen splitting characters.

**Hypotheses.** Number field GQT datum; normalized induction δ_P^{1/2}|det|^s, compatible measures and oscillator convention.

**Construction or proof route.**

1. Compute the evaluation-at-zero Levi and unipotent covariance using the generator formulas.
2. Identify its normalized inducing parameter; import the induced-section/meromorphic Eisenstein spaces from AS with the cover comparison.
3. Extract coefficients in s−s₀.

**Uses determining the API.**

- GQT §§7–11; LZ §12; DL §4.1; GZ.6: Supply coherent/incoherent sections and normalized local integrals.

**API.**

- `TauCeti.Metaplectic.siegelWeilSection_apply` (simp): Φφ(g)=ω(g)φ(0).
- `TauCeti.Metaplectic.siegelWeilSection_covariance` (characterisation): Its Levi covariance has the normalized parameter s₀.
- `TauCeti.Metaplectic.siegelWeilSection_laurent` (data): A_k is indexed by powers of s−s₀.

**Discriminating tests.**

- `TauCeti.Metaplectic.siegelWeilSection_zero` (degenerate): Zero vector maps to the zero section.
- `TauCeti.Metaplectic.siegelWeilSection_identity` (computation): Φφ(1)=φ(0).
- `TauCeti.Metaplectic.siegelWeilSection_parameter` (non-example): The binary orthogonal/rank-one example has s₀=0, not the unnormalized Levi exponent m/2.

**Acceptance.**

- For orthogonal m=2,n=1, d(n)=2, s₀=0.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.2/generator-operators`, `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §§5.3–5.4, PDF 25; global §6.2 PDF 28; literal excerpt PDF 25. Literal excerpt: “Φn,r (φ)(g) = (ωn,r (g)φ)(0),     for φ ∈ S(Yn∗ ⊗ Vr )(k). This defines an Hr (k)-invariant and Gn (k)-equivariant map”. Evaluation section and the normalized parameter.

**Routed items.** `PAPER-LI-ZHANG-22-B/25`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- Native degenerate induction, flat sections and meromorphic cover Eisenstein families are AS/SR supplier requests; evaluation on actual function spaces is prototyped without inventing those analytic carriers.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Ikeda map

**Construction.** `TauCeti.Metaplectic.ikedaMap`

Node: `MetaplecticAutomorphicForms:MP.6/ikeda-map`.

For V=H^{r−r′}⊕V′ in the same Witt tower, define Ik_{r,r′}φ(a)=∫ φ(x,a, 0)dx in the corresponding polarized configuration coordinates. The self-dual measures and splitting-character twists are fixed. The map preserves Schwartz functions, is equivariant for the smaller dual pair, and composes as Ik_{r′,r″}∘Ik_{r,r′}=Ik_{r,r″}.

**Hypotheses.** 0≤r″≤r′≤r; fixed isotropic splitting and source measures.

**Construction or proof route.**

1. Integrate the Schwartz function in the removed isotropic coordinates.
2. Use Fubini for the composition and generator formulas for equivariance.
3. Compare with the standard-vector normalization at good places.

**Uses determining the API.**

- GQT Theorems7.1, 8.1, 9.1: Define the complementary-tower correction in regularized identities.

**API.**

- `TauCeti.Metaplectic.ikedaMap_apply` (simp): The map integrates φ(x,a, 0) in x.
- `TauCeti.Metaplectic.ikedaMap_comp` (relation): The maps compose along a Witt tower.
- `TauCeti.Metaplectic.ikedaMap_equivariant` (functoriality): The smaller dual-pair action intertwines with its prescribed character.

**Discriminating tests.**

- `TauCeti.Metaplectic.ikedaMap_identity` (degenerate): Removing zero hyperbolic planes gives the identity.
- `TauCeti.Metaplectic.ikedaMap_product` (computation): For φ=φ₁(x)φ₂(a)φ₃(y), the result is (∫φ₁)φ₂(a)φ₃(0).
- `TauCeti.Metaplectic.ikedaMap_measure` (non-example): Scaling dx scales the map, so unspecified Haar measure cannot give the same normalized operator.

**Acceptance.**

- For r=r′ the map is the identity.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space`, `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §2.7 equation(2.1), PDF 12; equivariance PDF 13; literal excerpt PDF 12. Literal excerpt: “2.7. Ikeda’s map. Suppose that Vr ⊃ Vr′ (not necessarily complementary spaces). Then one may write”. Integration along isotropic coordinates and its composition.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The finite-dimensional Schwartz integration carrier and exact equivariance proof must be supplied by the AL extension and GQT source comparison.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Anisotropic Siegel–Weil formula

**Theorem.** `TauCeti.Metaplectic.siegelWeil_anisotropic`

Node: `MetaplecticAutomorphicForms:MP.6/anisotropic-siegel-weil`. Planet: **Siegel–Weil formula**.

For anisotropic H(V), E(g,s₀,Φφ)=c_{m,n} τ(H)/[E:F]·I_{n, 0}(φ), with the source’s definition of I and its measure comparison, c=1 for s₀>0 and c=2 for s₀≤0. Retain the split exceptional-group normalization wherever it enters a boundary comparison; do not transfer this anisotropic formula to a split divergent norm form.

**Hypotheses.** GQT Theorem 7.1 hypotheses; r=0; section and normalized quotient measure fixed.

**Construction or proof route.**

1. Use absolute convergence and the source’s anisotropic Siegel–Weil comparison.
2. Match all measure and inducing normalizations rather than absorbing the scalar into I.

**Acceptance.**

- Binary anisotropic norm form at n=1 has s₀=0 and uses the c=2 branch.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `MetaplecticAutomorphicForms:MP.5/theta-integral-convergence`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), Theorem 7.1, PDF 33–34; excerpt at PDF 33. Literal excerpt: “Theorem 7.1. For φ ∈ S(Yn∗ ⊗ V0 )(A), the Eisenstein series E(s, Φn, 0 (φ)) is holomorphic at s = sm,n =”. Anisotropic formula and source scalar.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original anisotropic identity and exact constant proof are cited by GQT but not fully read; the scalar must be rechecked against the adopted normalized I convention.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Regularized first-term identity

**Theorem.** `TauCeti.Metaplectic.siegelWeil_firstTerm`

Node: `MetaplecticAutomorphicForms:MP.6/first-term-identity`.

In the first-term range 0<m<d(n), the GQT normalized Laurent coefficients satisfy A₀(φ)=2B₋₁(φ). At the boundary m=d(n), A₀=2B₋₁ except for the split O(1, 1) case; in that exception A₀=B₋₁=0 and A₁=B₀. All coefficients are evaluated at their respective s₀ and ρ_H.

**Hypotheses.** GQT number-field type-I datum and regularizer range; retain the exceptional O(1, 1) group, κ and τ.

**Construction or proof route.**

1. Use the regularized first-term comparison and its boundary refinement.
2. Evaluate the source constants after matching normalized sections and measures.

**Acceptance.**

- The split binary rank-one norm-form example uses A₁=B₀, never an ordinary divergent theta integral.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`, `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), Theorem 7.1 boundary; §8.1, PDF 33–35; excerpt at PDF 34. Literal excerpt: “first term range. The following theorem was shown by Kudla-Rallis [KR5], Moeglin [Mo], Ichino [I1, Theorem 3.1]”. First-term and exceptional boundary coefficients.

**Suggested-signature boundary.** First-term/boundary nonexceptional signature. The split O(1, 1) A₀=BnegOne=0 and A₁=B₀ branch is separately recorded in the packet; no use of this generic signature in that exception.

**Explicit proof/signature refinements.**

- The first-term identity proof inputs and the exceptional boundary calculation require their referenced original proofs; all ranges and coefficient conventions are retained for review.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Regularized second-term identity

**Theorem.** `TauCeti.Metaplectic.siegelWeil_secondTerm`

Node: `MetaplecticAutomorphicForms:MP.6/second-term-identity`. Planet: **Second term identity**.

In d(n)<m≤d(n)+r with r≤n, let m+m′=2d(n), V′ the complementary Witt-tower space of index r′. Then A₋₁(φ)=B₋₂(φ), and A₀(φ)=B₋₁(φ)−κ_{r,r′}B₀(Ik_{r,r′}(π_KHφ)) modulo Im A₋₁. The correction is zero for r′=0 or H(V′)=O(1, 1), with the source’s stipulated interpretation. Equality of A₀ and B₋₁ is only a quotient identity unless the residual image vanishes.

**Hypotheses.** GQT Theorem 1.2/9.1 exact range, compact averaging π_KH and coefficient/measure normalizations.

**Construction or proof route.**

1. Use the induction in n and the constant-term computation for complementary towers.
2. Apply the Ikeda map and matching compact average.
3. Separate the leading-term equality from the quotient-valued second-term equality.

**Acceptance.**

- At n=1,m=3,r=1 the complementary m′=1 is anisotropic: correction zero, but the residual-image quotient qualification remains.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`, `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `MetaplecticAutomorphicForms:MP.6/ikeda-map`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`, `AutomorphicSpectralTheory:AS.2`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), Theorem 1.2, PDF 5–6, quotient-valued second-term identity; proof refinements remain gaps; literal excerpt PDF 6. Literal excerpt: “(ii) (Second term identity) For all φ ∈ ωn,r , one has                                                       ′”. Leading and quotient second-term identities with complementary-tower correction.

**Suggested-signature boundary.** Native residual-image membership, expressing the quotient identity. B₀ is the Ikeda(K_Hφ) correction; residual is Im A₋₁, so no literal A₀=BnegOne identity is asserted without vanishing.

**Explicit proof/signature refinements.**

- The induction and constant-term proof continuation after the read statements is not fully checked. The exact κ_{r,r′} evaluation and quotient carrier remain implementation/review work.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Coherent and incoherent sections

**Construction.** `TauCeti.Metaplectic.thetaSectionCollection`

Node: `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`.

A local collection of nondegenerate quadratic/Hermitian spaces with fixed dimension/discriminant and standard good-place lattices gives a restricted tensor of local evaluation sections. Call it coherent only when it is the localization of a global space, with all real signatures and local invariant product constraints matched. An incoherent collection still gives sections in the common induced representation; it does not give a global rational theta sum. Export their functional-equation and normalization data to GZ.6.

**Hypotheses.** Number-field local collection, common inducing character, matching archimedean data. Global form existence/classification belongs to QuadraticFormInvariants, not an assumed consequence of local theta nonvanishing.

**Construction or proof route.**

1. Construct local evaluation sections and their almost-everywhere standard tensors.
2. Import the global local-invariant classification and identify the coherent collections.
3. Use the normalized Eisenstein functional equation for both kinds of section without assigning an incoherent global V(F).

**Uses determining the API.**

- GZ.6–7; AGHMP big-CM; DL π-coherence: Supply reusable analytic sections without duplicating arithmetic derivative identities.

**API.**

- `TauCeti.Metaplectic.thetaSectionCollection_tensor` (constructor): Almost-everywhere standard local sections give the restricted tensor section.
- `TauCeti.Metaplectic.thetaSectionCollection_global` (compatibility): For a coherent datum the section equals that of the global Schwartz vector.
- `TauCeti.Metaplectic.thetaSectionCollection_incoherent` (characterisation): An incoherent datum has no rational theta kernel attached to a global V.

**Discriminating tests.**

- `TauCeti.Metaplectic.thetaSectionCollection_globalExample` (compatibility): Localizations of a specified global quadratic space are coherent.
- `TauCeti.Metaplectic.thetaSectionCollection_oneFlip` (non-example): A single incompatible local Hasse invariant violates the global product constraint.
- `TauCeti.Metaplectic.thetaSectionCollection_standard` (computation): At every good place the spherical evaluation section has value1 at the identity.

**Acceptance.**

- Changing one finite invariant can destroy coherence while preserving the local section carrier.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `MetaplecticAutomorphicForms:MP.4/global-weil-index-product`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `AutomorphicSpectralTheory:AS.2`.

**Source match.**

- [PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Published §6.1 equations(6.1.1)–(6.1.2), printed 466–467, PDF 76–77; literal excerpt PDF 76. Literal excerpt: “incoherence of C implies that E(g, s, Φ) vanishes identically at s = 0.     Endow AF with the Haar measure self-dual with respect to ψF , and give”. The finite Weil and incoherent Eisenstein conventions consumed by the arithmetic application.

**Suggested-signature boundary.** Restricted tensor evaluation fragment, with almost-all spherical value1. Coherence is existence of a global quadratic/Hermitian form, not a new assumed Prop field; only its necessary invariant product is prototyped.

**Explicit proof/signature refinements.**

- Exact global Hermitian classification and the incoherent functional-equation comparison are QFI/AS Part-II supplier inputs. No arithmetic derivative identity is asserted here.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Unitary Siegel–Weil measure

**Comparison.** `TauCeti.Metaplectic.unitary_siegelWeilMeasure`

Node: `MetaplecticAutomorphicForms:MP.6/unitary-siegel-weil-measure`.

For DL’s rank n=2r unitary local datum and a nonsingular moment matrix T, use the unique rationally normalized H(F_v)-Haar measure stipulated in §4.1(H8): I_T(φ)=b_{2r,v}(1)·W_T(SW(φ)), with the source Whittaker character and local standard section. At an unramified hyperspecial place the designated compact subgroup has volume1. This equality specifies a normalization; it is not an arbitrary Haar choice.

**Hypotheses.** DL §4.1(H1)–(H9); the local Fourier character and the source’s b_{2r,v} factor; nonsingular T in the indicated orbit.

**Construction or proof route.**

1. Compare orbital integration with the local Siegel–Weil Whittaker functional.
2. Prove uniqueness of the Haar scalar and evaluate it on the unramified standard vector.
3. Track this measure through the global restricted product.

**Acceptance.**

- Hyperspecial volume1 is checked only at the source’s good places.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`, `MetaplecticAutomorphicForms:MP.2/hermitian-operator-normalizations`, `AdelicAlgebraicGroups:AA.1`.

**Source match.**

- [PAPER-DISEGNI-LIU-24](https://arxiv.org/pdf/2204.09239v3), §4.1(H8), PDF 41–42; excerpt at PDF 41. Literal excerpt: “Siegel–Weil measure, satisfying that for every T □ ∈ Herm◦2r (Fv )”. Rational measure specified by the exact orbital/Whittaker comparison.

**Routed items.** `PAPER-DISEGNI-LIU-24/21`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The referenced LL21 local identity proof is unread; its rational Haar scalar and native orbital-integral carrier remain precise supplier/proof inputs.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Unitary theta coherence parity

**Theorem.** `TauCeti.Metaplectic.unitaryTheta_coherenceParity`

Node: `MetaplecticAutomorphicForms:MP.6/pi-coherence-parity`.

For DL’s tempered relevant π with rank n=2r, prescribed infinity signature (n−1, 1) at one place and (n, 0) elsewhere, the locally distinguished finite Hermitian spaces V_{π_v} form a coherent global collection exactly when ∏_{v finite}η_v((−1)^r det V_{π_v})=−(−1)^{r[F:Q]}. Retain the ordinary norm-character conventions at every v. This global form-existence test is distinct from the local theta dichotomy.

**Hypotheses.** DL Assumption3.2 and §4.1, F totally real, E/F CM; relevant tempered local representations and the stated archimedean signatures.

**Construction or proof route.**

1. Use the unique local theta spaces from MP.3.
2. Compute the real local invariants in the specified signature.
3. Apply the global Hermitian invariant product criterion imported from QFI.

**Acceptance.**

- Flipping one finite η(det) changes coherence.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/relevant-unitary-dichotomy`, `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [PAPER-DISEGNI-LIU-24](https://arxiv.org/pdf/2204.09239v3), Definition 4.2 and Remark 4.3, PDF 41–42; excerpt at PDF 41. Literal excerpt: “coherent if Vv ≃ Vπv for every v ∈ Vfin”. The exact parity condition defining π-coherence.

**Routed items.** `PAPER-DISEGNI-LIU-24/22`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The exact global Hermitian existence theorem and native local invariant carrier are QFI supplier requests; no arithmetic height assertion is part of this node.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Doubling Schwartz map

**Construction.** `TauCeti.Metaplectic.doublingSchwartz`

Node: `MetaplecticAutomorphicForms:MP.6/doubling-schwartz-map`.

Identify the doubled oscillator space for W⊕W⁻ with the tensor of the ψ and ψ⁻¹ oscillator models. Define δ:S(V^n)⊗conjugate(S(V^n))→S(V^n⊕V^n) by the source partial Fourier/polarization transform. Normalize it so δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩. Under G×G its action is the two commuting Weil actions with the explicit χV determinant twist in the doubled embedding.

**Hypotheses.** Compatible self-dual measures, doubled polarization and GQT §11.2 splitting convention.

**Construction or proof route.**

1. Take the tensor oscillator representation and correct its scalar-cover weight as in MP.2.
2. Apply the partial Fourier polarization equivalence.
3. Evaluate at0 to identify the Hilbert pairing and compute the doubled character.

**Uses determining the API.**

- GQT Proposition 11.1 and Theorem 11.4: Convert the theta inner product to a doubled Eisenstein integral.

**API.**

- `TauCeti.Metaplectic.doublingSchwartz_eval_zero` (simp): δ(φ₁⊗conjugate φ₂)(0)=⟨φ₁,φ₂⟩.
- `TauCeti.Metaplectic.doublingSchwartz_equivariant` (functoriality): δ intertwines the doubled action with the stipulated χV determinant twist.
- `TauCeti.Metaplectic.doublingSchwartz_pureTensor` (data): δ is the source partial Fourier transform of a pure tensor.

**Discriminating tests.**

- `TauCeti.Metaplectic.doublingSchwartz_zero` (degenerate): A zero factor maps to zero.
- `TauCeti.Metaplectic.doublingSchwartz_norm` (computation): For equal φ the value at0 is its squared L² norm.
- `TauCeti.Metaplectic.doublingSchwartz_conjugate` (non-example): Replacing conjugate φ₂ by φ₂ changes a Hermitian pairing into a bilinear one.

**Acceptance.**

- Without the conjugate/ψ⁻¹ factor the evaluation is not the Hermitian pairing.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.4/adelic-weil-representation`, `MetaplecticAutomorphicForms:MP.2/character-and-dual`, `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §11.2, (11.4)–(11.6), PDF 52–53; excerpt at PDF 52. Literal excerpt: “doubling see-saw”. The doubled map and evaluation inner-product normalization.

**Suggested-signature boundary.** δ(φ⊗conjugate ψ) evaluation fragment, using Mathlib’s conjugate-linear-first inner product; ⟪ψ,φ⟫ matches the source linear-first convention. The actual partial Fourier Schwartz/tensor map and determinant twist require AL/SR suppliers.

**Explicit proof/signature refinements.**

- The exact partial Fourier kernel and native completed/joint tensor comparison remain a finite-dimensional AL Part-II input.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Local doubling zeta integral

**Construction.** `TauCeti.Metaplectic.localDoublingZeta`

Node: `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`.

For local π and a section Φ_s of the doubled normalized induced representation, define Z_v(s,Φ_s,f₁,f₂)=∫G(F_v)Φ_s((g, 1))⟨π(g)f₁,f₂⟩dg in its absolute-convergence chamber. Its meromorphic continuation is the local doubling functional. Define Z_v*=Z_v/L_v(s+1/2,π⊗χV) using the GQT normalization; for the standard good-place section Z_v=L_v/d_v, hence Z_v*=d_v⁻¹. Do not silently multiply the local section by d_v.

**Hypotheses.** Generic good section in the source’s normalized induction, compatible Haar and matrix-coefficient pairing; L/d convention fixed.

**Construction or proof route.**

1. Prove initial absolute convergence and equivariance.
2. Apply the local doubling continuation and normalized L-factor theorem.
3. Compute the unramified standard vector, then match all ramified factors rather than infer them from the Euler product.

**Uses determining the API.**

- GQT Theorem 11.4; GZ.5 factorized pairings: Provide the actual local factors and nonvanishing tests.

**API.**

- `TauCeti.Metaplectic.localDoublingZeta_integral` (simp): In absolute convergence Z is the displayed group integral.
- `TauCeti.Metaplectic.localDoublingZeta_unramified` (simp): The designated spherical data give L_v/d_v.
- `TauCeti.Metaplectic.localDoublingZeta_normalized` (compatibility): Z_v*=Z_v/L_v(s+1/2,π⊗χV).

**Discriminating tests.**

- `TauCeti.Metaplectic.localDoublingZeta_zero` (degenerate): Zero vector or section gives zero.
- `TauCeti.Metaplectic.localDoublingZeta_spherical` (compatibility): Spherical Z_v* is d_v⁻¹ with the unscaled section.
- `TauCeti.Metaplectic.localDoublingZeta_measure` (non-example): Changing Haar without transporting the normalization rescales Z_v.

**Acceptance.**

- The normalized good-place value is1/d_v, unless the section has explicitly been normalized by d_v.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/doubling-schwartz-map`, `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §11.3, (11.7)–(11.9), PDF 53–54; excerpt at PDF 54. Literal excerpt: “local zeta integrals (see [G] for the metaplectic”. Local integral, normalized factor and unramified denominator.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original PSR/Yamana local doubling theorem and ramified test-vector calculation are unread proof inputs; AL owns local L-factors, not this integral’s automatic normalization.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Factorization of theta pairings

**Theorem.** `TauCeti.Metaplectic.thetaPairing_factorization`

Node: `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`.

For pure tensor Schwartz vectors, matrix coefficients and sections in a proved absolute-convergence chamber, the unfolded doubled theta pairing equals the product of its normalized local integrals times the designated partial/global L-factor and almost-everywhere denominators. Restricted-product Fubini uses AA.0’s countability, second-countability, open compact and cofinite indicator hypotheses; ramified and real factors are computed independently. A rational theta sum itself is generally not the product of local theta sums.

**Hypotheses.** Pure-tensor input; all integrability/unfolding hypotheses proved; compatible local measures and good-place reference vectors.

**Construction or proof route.**

1. Unfold using rational invariance and a dominated majorant.
2. Apply the exact restricted-Haar factorization theorem.
3. Extract the AL Euler factor and retain every local normalizing denominator; continue only through an established meromorphic identity.

**Acceptance.**

- The product assertion is about local operators/sections/integrals, not an unrestricted product of rational lattice sums.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `MetaplecticAutomorphicForms:MP.6/doubling-schwartz-map`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), Proposition 11.1 and §11.3, PDF 52–54; excerpt at PDF 54. Literal excerpt: “Euler product                                                     Y”. Factorization applies to unfolded integrals under verified convergence.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The complete unfolding proof and each ramified integral comparison require their original sources and native restricted quotient integration.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Rallis inner product formula

**Theorem.** `TauCeti.Metaplectic.rallis_innerProduct`

Node: `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`. Planet: **Rallis inner product formula**.

In the GQT second-term range d(n)<m≤2d(n), r≤n, for cuspidal π whose lower theta lifts vanish, the theta inner product is [E:F]·Val_{s=s_{m,n}} L(s+1/2,π⊗χV)·Z*(s,Φ,f₁,f₂), with the exact normalized doubled section and global measures. If every relevant local theta lift is nonzero, the stated L-factor is holomorphic at that point and the formula uses its value. The lower-lift vanishing is essential to the cuspidal and residual-term elimination.

**Hypotheses.** GQT Theorem 11.4 hypotheses; first-occurrence theta lift; s_{m,n}=(m−d(n))/2>0; good sections and local/global normalization.

**Construction or proof route.**

1. Use the doubled Schwartz map to express the theta pairing via Proposition 11.1.
2. Apply the second-term identity, using lower-lift vanishing to eliminate the complementary correction and residual image.
3. Unfold and apply the normalized local factor theorem.

**Acceptance.**

- Neither a nonzero local theta module nor a formal Euler product proves this global identity.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/second-term-identity`, `MetaplecticAutomorphicForms:MP.6/doubling-schwartz-map`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), Theorem 11.4, PDF 54; excerpt at PDF 54. Literal excerpt: “Theorem 11.4. Suppose that d(n) < m ≤ 2 · d(n) and r ≤ n. Let π be an irreducible cuspidal represen-”. Source-qualified Rallis formula in its positive second-term range.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The referenced Yamana/PSR proof, holomorphy criterion and exact Val interpretation are not fully read; statement and ranges are checked but the proof chain remains open.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Global theta nonvanishing criterion

**Theorem.** `TauCeti.Metaplectic.globalTheta_nonvanishing`

Node: `MetaplecticAutomorphicForms:MP.6/global-theta-nonvanishing`.

In the same first-occurrence range, the global theta lift is nonzero exactly when the relevant normalized local functionals and the special L-value are nonzero. Replacing local-functional nonvanishing by local-theta nonvanishing requires GQT’s extra archimedean/range hypotheses: ε₀=−1, or all unitary archimedean places split, or orthogonal F totally complex, or m=d(n)+1. In the remaining cases the source permits modifying real signatures; it does not prove the unrestricted assertion for the original V.

**Hypotheses.** GQT Theorem 11.7 and Proposition 11.6; the exact local-functional hypotheses and first-occurrence cuspidality.

**Construction or proof route.**

1. Use the nonnegative norm given by the Rallis formula.
2. Choose test vectors with nonzero normalized local factors in the established local range.
3. Use only the stated cases for the archimedean local-theta/functional comparison.

**Acceptance.**

- A general local-to-global theta claim without the real-signature qualification is rejected.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `MetaplecticAutomorphicForms:MP.3/first-occurrence`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §§11.8–11.9, Proposition 11.6 and Theorem 11.7, PDF 55–57; excerpt at PDF 55. Literal excerpt: “non-vanishing. But since by our assumption Θn,j (π) = 0 for all j < r, Vr#′ belongs”. Nonvanishing criterion with its archimedean qualifications.

**Suggested-signature boundary.** Scalar nonvanishing fragment under all local nonzero and GQT11.7’s stated archimedean hypotheses; outside those cases the conclusion allows V′ with changed real signatures, not the original V.

**Explicit proof/signature refinements.**

- The cited real induced-module diagrams and original local comparison proofs are unread; Conjecture11.5 is not used as a theorem. The target preserves Proposition 11.6/Theorem 11.7’s restricted hypotheses.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Global see-saw and spectral projection

**Theorem.** `TauCeti.Metaplectic.globalTheta_seeSaw`

Node: `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`.

For a nested global dual-pair see-saw with compatible splittings, the two iterated theta pairings agree when the double integrand is absolutely integrable; with regularization use the specifically proved regularized see-saw identity and its coefficient convention. Orthogonal projection onto a specified discrete cuspidal eigenspace commutes with the equivariant lift under the Hilbert-domain/integrability hypotheses. No projection through a divergent or merely totalized integral is asserted.

**Hypotheses.** Compatible see-saw characters; cusp/decay or compact-source estimates sufficient for Fubini; actual closed Hilbert subspace for projection.

**Construction or proof route.**

1. Use equality of the restricted oscillator actions.
2. Prove a double-integral majorant and apply Fubini.
3. For projection use the bounded Hilbert projection and kernel pairing; retain regularized coefficient calculations as separate identities.

**Acceptance.**

- A regularized pairing is compared through its Laurent coefficient, not ordinary Fubini on a divergent integral.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.3/local-see-saw`, `MetaplecticAutomorphicForms:MP.5/global-theta-lift`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`, `AutomorphicSpectralTheory:AS.0`, `AutomorphicFormsOnReductiveGroups:AF.3`.

**Source match.**

- [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2), §§7–9, PDF 41–42, 50–53; excerpt at PDF 41. Literal excerpt: “theta lifts. Let the notation be as in §8 below. In particular, G ≃ O(p, q) and G′ ≃”. Global theta pairings using compatible quaternionic splittings.

**Suggested-signature boundary.** The compatible global see-saw theta kernel and absolute integrability on the quotient product are required; regularized pairings and spectral projection need the packet’s separate proof gates.

**Explicit proof/signature refinements.**

- The full global see-saw/projection proof and regularized analogue are source/spectral gaps; IP’s checked constructions provide only the stated specialized compatibility route.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Norm-form theta integrals

**Theorem.** `TauCeti.Metaplectic.normTheta_integralRange`

Node: `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`. Planet: **Norm form theta integrals**.

Export to GZ.5 the rank-one theta kernel for the binary quadratic norm of E/F and the ternary trace-zero quaternion norm. For anisotropic binary (m=2,r=0,n=1) and division ternary (m=3,r=0), the ordinary integral converges. Split binary (m=2,r=1) lies at the exceptional boundary A₁=B₀. Split ternary (m=3,r=1) lies in the second-term range and uses A₋₁=B₋₂ and A₀=B₋₁ modulo Im A₋₁, with the anisotropic complementary correction zero. Export explicit Haar/splitting factors, not the Waldspurger identity itself.

**Hypotheses.** Orthogonal ε₀=1,d(1)=2; nondegenerate norm/trace-zero forms; exact GQT convention and source’s quaternion split/division cases.

**Construction or proof route.**

1. Construct the norm forms from upstream quadratic/quaternion arithmetic.
2. Compute m and Witt index and apply the convergence test.
3. Use the corresponding ordinary, boundary or second-term comparison with its coefficient/measure normalization.

**Acceptance.**

- The split binary integral fails the convergence inequality 1>2.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/theta-integral-convergence`, `MetaplecticAutomorphicForms:MP.6/anisotropic-siegel-weil`, `MetaplecticAutomorphicForms:MP.6/first-term-identity`, `MetaplecticAutomorphicForms:MP.6/second-term-identity`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Source match.**

- [GQT](https://arxiv.org/pdf/1207.4709v3), §3.1, PDF 14; anisotropic Theorem 7.1 PDF 33, boundary §8.1 PDF 34 and Theorem 1.2 PDF 5–6; literal excerpt PDF 14. Literal excerpt: “r = 0 or m − r = m0 + r > d(n). We call this the Weil’s convergent range.    In particular, the pair (Wn , V0 ) is in this range. Then for φ0 ∈ S(Yn∗ ⊗ V0 )(A), we have the theta”. The dimension/Witt-index criterion selects the actual theta integral for each norm-form instance.

**Suggested-signature boundary.** Range classification fragment: anisotropic binary/ternary convergent, split binary boundary, split ternary second-term. The actual norm-form case and rank conditions in the packet are required; it is not a disjunction for arbitrary integers.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Jacobi group

**Construction.** `TauCeti.Metaplectic.jacobiGroup`

Node: `MetaplecticAutomorphicForms:MP.6/jacobi-group`. Planet: **Jacobi group**.

Construct J(W)=H(W)⋊Mp(W) using the native center-fixing action induced by Mp(W)→Sp(W). The central H(F) embeds as the additive center, while the metaplectic sign is the second factor. The Schrödinger–Weil representation is (h,g)↦ρψ(h)ωψ(g), with multiplication (h,g)(h′,g′)=(h(g·h′),gg′). A positive similitude transports the Heisenberg central character/index; it is not an action preserving a fixed ψ without that transport.

**Hypotheses.** Characteristic-zero local/adelic symplectic datum; chosen genuine oscillator model and its covariance.

**Construction or proof route.**

1. Use the already constructed Heisenberg action and native semidirect product.
2. Compute the representation group law by covariance.
3. Compare the coordinate Jacobi action in BFH with the intrinsic action, keeping the order of factors explicit.

**Uses determining the API.**

- MP.8 BFH slash/translation; Fourier–Jacobi coefficients: Supply the common group and oscillator action before the genus-two specialization.

**API.**

- `TauCeti.Metaplectic.jacobiGroup_mul` (simp): Multiplication uses h(g·h′),gg′.
- `TauCeti.Metaplectic.schroedingerWeil_apply` (simp): The action is ρψ(h)ωψ(g).
- `TauCeti.Metaplectic.jacobiGroup_similitude` (compatibility): A similitude transports the central character by its multiplier.

**Discriminating tests.**

- `TauCeti.Metaplectic.jacobiGroup_identity` (degenerate): With W=0, H(W)=F and the cover is μ₂.
- `TauCeti.Metaplectic.jacobiGroup_translation` (compatibility): On the H subgroup the action is the native Schrödinger representation.
- `TauCeti.Metaplectic.jacobiGroup_covariance` (non-example): Using an ordinary direct product would require symplectic and Heisenberg operators to commute, contrary to covariance.

**Acceptance.**

- The two central coordinates have distinct roles.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.0/topological-heisenberg`, `MetaplecticAutomorphicForms:MP.1/genuine-oscillator`, `MetaplecticAutomorphicForms:MP.1/scalar-normalizer-extension`, `MetaplecticAutomorphicForms:MP.0/isometry-action`, `mathlib:SemidirectProduct`.

**Source match.**

- [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §1 equations(1.1)–(1.5), printed 547, PDF 6. Literal excerpt: “We have the relations”. Visual transcription. The two slash actions and their compatibility motivate the intrinsic semidirect product; the semidirect product itself reuses the native library.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The topological semidirect-product and actual smooth representation instances must be elaborated; positive similitude transport is a comparison with MP.8, not a new fixed-index action.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Jacobi spaces

**Definition.** `TauCeti.Metaplectic.jacobiSpace`

Node: `MetaplecticAutomorphicForms:MP.6/jacobi-spaces`.

For an arithmetic lattice in J(W), integral central index m and a specified finite-dimensional weight/multiplier representation, define the space of smooth automorphic sections with ψ_m central character, holomorphic dependence on the complex Heisenberg variable, the exact symplectic weight covariance, and the prescribed elliptic-lattice transformations. Fourier growth/holomorphy at cusps is part of the relevant holomorphic/cuspidal subspace. The genus-two BFH coordinates are supplied by MP.8/bfh-jacobi-specialization.

**Hypotheses.** A fixed Jacobi lattice and compatible central index; exact weight and multiplier, not inferred from the lattice equations alone.

**Construction or proof route.**

1. Take the invariant subspace of actual smooth sections.
2. Translate the intrinsic central and group covariance into slash/elliptic coordinate laws.
3. Compare the BFH lattice, vector-valued K-type and the two cusps using the supplier’s exact specialization.

**Uses determining the API.**

- MP.8/bfh-jacobi-specialization and theta-decomposition: Provide actual common weight/index sections, avoiding a genus-two duplicate.

**API.**

- `TauCeti.Metaplectic.jacobiSpace_central` (characterisation): The additive center acts by ψ_m.
- `TauCeti.Metaplectic.jacobiSpace_elliptic` (relation): The coordinate elliptic law has the prescribed quadratic phase.
- `TauCeti.Metaplectic.jacobiSpace_weight` (compatibility): The symplectic covariance agrees with the specified weight/multiplier.

**Discriminating tests.**

- `TauCeti.Metaplectic.jacobiSpace_zero` (degenerate): The zero section belongs to every specified Jacobi space.
- `TauCeti.Metaplectic.jacobiSpace_index` (non-example): A nonzero section with distinct central character is outside the fixed-index space.
- `TauCeti.Metaplectic.jacobiSpace_bfh` (compatibility): At the BFH lattice the translation periods are Z² and N⁻¹Z², as in MP.8.

**Acceptance.**

- The index and weight are independent input data.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/jacobi-group`, `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Source match.**

- [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §1 equations(1.6)–(1.9), printed 547, PDF 6. Literal excerpt: “which is holomorphic in W”. Visual transcription. Central/elliptic covariance; full weight and cusp conditions are stated separately in the generic definition.

**Suggested-signature boundary.** Central-character subspace fragment. Full elliptic/weight covariance, archimedean holomorphy, cusp/growth and rational finite-level lattice are packet hypotheses pending native Jacobi space suppliers; the BFH lattice scale is rational, not a private wrapper.

**Explicit proof/signature refinements.**

- The common smooth section and holomorphic Jacobi carrier is not yet present. The MP.8 specialization imports MP.6; its statement is used as a consumer contract, not as a circular proof of this definition.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Fourier–Jacobi extraction

**Construction.** `TauCeti.Metaplectic.fourierJacobi`

Node: `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction`.

Extract a Fourier–Jacobi coefficient of a smooth automorphic form by integration over the compact rational center of the relevant Heisenberg unipotent against ψ_m⁻¹. Its remaining transformation is the Jacobi action of index m, with the inherited weight/multiplier. The coefficient of a normally convergent Fourier family is recovered termwise; further Fourier extraction in the elliptic variable uses its designated compact torus and probability/Lebesgue normalization.

**Hypotheses.** Compact central quotient; actual unipotent splitting; smoothness and normal convergence for termwise extraction.

**Construction or proof route.**

1. Apply the compact unipotent Whittaker construction to the Heisenberg center.
2. Use normalizer covariance to obtain the Jacobi law.
3. Apply character orthogonality for the remaining elliptic Fourier coefficient.

**Uses determining the API.**

- MP.8/fourier-coefficient and theta-decomposition: Supply compact coefficient extraction and its Jacobi transformation.

**API.**

- `TauCeti.Metaplectic.fourierJacobi_index` (characterisation): The coefficient has ψ_m central character.
- `TauCeti.Metaplectic.fourierJacobi_equivariant` (functoriality): It transforms under the common Jacobi action.
- `TauCeti.Metaplectic.fourierJacobi_coefficient` (simp): A character term of matching index is recovered by compact orthogonality.

**Discriminating tests.**

- `TauCeti.Metaplectic.fourierJacobi_zero` (degenerate): The zero automorphic form has zero coefficient.
- `TauCeti.Metaplectic.fourierJacobi_matching` (computation): Integration of ψ_m against ψ_m⁻¹ over the probability center gives1.
- `TauCeti.Metaplectic.fourierJacobi_mismatch` (non-example): A distinct central character gives zero coefficient.

**Acceptance.**

- The normalization of each compact variable must be retained.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.6/jacobi-group`, `MetaplecticAutomorphicForms:MP.6/jacobi-spaces`, `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`.

**Source match.**

- [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §2 equations(2.2)–(2.3), printed 551–552, PDF 10–11. Literal excerpt: “has a Fourier expansion”. Visual transcription. Actual compact fibre Fourier extraction and its measure; arithmetic genus-two specialization remains MP.8.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The exact unipotent/center quotient and weight-section carrier need supplier elaboration; genus-two half-integral Fourier matrices are already owned by MP.8.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Jacobi theta decomposition interface

**Comparison.** `TauCeti.Metaplectic.jacobi_thetaDecomposition`

Node: `MetaplecticAutomorphicForms:MP.6/jacobi-theta-decomposition-interface`.

For a positive integral index and normally convergent Jacobi section, elliptic invariance decomposes its Fourier indices into finitely many discriminant residues; its unique theta components transform through the finite Weil module. Prove the general statement using compact torus orthogonality and Poisson summation, then specialize to the exact genus-two BFH formulas supplied by MP.8/theta-decomposition, theta-pairing and theta-fourier-transform, including the positive-on-iY determinant-root branch.

**Hypotheses.** Positive index; compatible integral lattice; normal Fourier convergence and all weight/multiplier data fixed. The generic lattice/discriminant carrier is imported from IntegralLattices.

**Construction or proof route.**

1. Group coefficients by their elliptic orbits using the invariant quadratic form.
2. Use the finite Weil representation and torus orthogonality for existence/uniqueness.
3. Use positive Fourier Poisson to compute the component transformation; compare the genus-two specialization without duplicating it.

**Acceptance.**

- For BFH dimension2 the finite Fourier normalization is1/(2a), not1/sqrt(2a).

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction`, `MetaplecticAutomorphicForms:MP.6/jacobi-spaces`, `MetaplecticAutomorphicForms:MP.4/finite-weil-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`.

**Source match.**

- [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §2 Proposition 2.2, equations(2.4)–(2.10), printed 552–553, PDF 11–12. Literal excerpt: “We have the transformation properties”. Visual transcription. Finite component transformation, positive-on-pure-imaginary determinant branch; genus-two theorem is imported from MP.8.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The generic lattice theta-decomposition proof/carrier remains open. MP.8 depends on the common MP.6 interface; cross-references record the specialization contract rather than a closed cyclic proof.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Ideal-lattice Poisson comparison

**Comparison.** `TauCeti.Metaplectic.idealLattice_poisson`

Node: `MetaplecticAutomorphicForms:MP.6/ideal-lattice-poisson`.

For an imaginary quadratic K, fractional ideal b, λ∈C and z∈H, Σμ∈b exp(2πiN(λ+μ)z)=i/(sqrt(|D|)N(b)z) Σν∈b⁻¹d⁻¹ exp(−2πiN(ν)/z)exp(2πiTr(λν)). The trace-dual ideal is b⁻¹d⁻¹, and the additive measure is matched to its discriminant covolume. This is an adapter of the supplied finite-dimensional Poisson theorem.

**Hypotheses.** D<0 fundamental; d the different, N(d)=|D|; the complex norm and trace conventions fixed.

**Construction or proof route.**

1. Compute the trace-dual lattice from ideal arithmetic.
2. Compute the positive Fourier transform of the shifted complex Gaussian.
3. Apply AL Poisson with the exact covolume and identify the prefactor.

**Acceptance.**

- For K=Q(i), the trace-dual Z[i] lattice is (1/2)Z[i] up to its unit.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion`, `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Source match.**

- [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), IV.§2, printed 273–274, PDF 50–51. Literal excerpt: “Applying the Poisson summation formula”. Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Routed items.** `PAPER-GROSS-ZAGIER-86/195`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The finite-dimensional complex Gaussian Fourier/covolume comparison is an AL Part-II input; ideal trace-duality belongs to GN.3.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

### Toric theta pairing interface

**Comparison.** `TauCeti.Metaplectic.toricTheta_pairingComparison`

Node: `MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface`.

For an anisotropic norm torus T and a compatible quadratic/quaternionic theta kernel, unfold the toric theta pairing into the local oscillator/orbital integrals only after proving the product integrand absolutely integrable on [T] and the companion quotient. Match the torus character, rational splitting, self-dual additive measures and quotient Haar. Export these local factors and the global see-saw to GZ.5; the exact Waldspurger special-value identity and its arithmetic comparisons stay there.

**Hypotheses.** Actual anisotropic torus and unitary character trivial on T(F); cusp or compactness/decay bound; ramified test functions and source parity fixed. Split cases use the separately proved regularization.

**Construction or proof route.**

1. Apply the norm-form theta construction and its convergent or regularized range.
2. Unfold the rational orbit sum with the supplied torus orbit dictionary and a dominated majorant.
3. Apply restricted-product Haar factorization and match each ramified factor; use the exact global see-saw.

**Acceptance.**

- An anisotropic compact torus alone does not prove integrability on an additional noncompact group quotient.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `GrossZagierAndArithmeticHeights:GZ.5`, `AdelicAlgebraicGroups:AA.1`.

**Source match.**

- [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I.§5(5.2), printed 229, PDF 6; IV.§2 printed 273–275, PDF 50–52. Literal excerpt: “theta-series”. Visual transcription from the published scan; corrected SL₂ lift and Gauss modulus conventions are retained. The toric period identity belongs to GZ.5.

**Suggested-signature boundary.** Normalized pairing interface only. The actual torus/GL₂ representations and Schwartz input and convergence are required; Waldspurger’s period/L-value theorem remains GZ.5’s responsibility.

**Explicit proof/signature refinements.**

- The exact original toric theta unfolding/ramified local calculations are not read. GZ.5 must supply its period theorem; MP.6 supplies the common kernel, convergence/range and normalization adapter, with this proof gap explicit.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage6`. Implementation: unchecked.

## MP.7. Rank-one half-weight and Shimura adapters

### Theta multiplier

**Definition.** `TauCeti.Metaplectic.thetaMultiplier`

Node: `MetaplecticAutomorphicForms:MP.7/theta-multiplier`. Planet: **Theta multiplier**.

For γ∈Γ₀(4), J(γ,z)=θ(γz)/θ(z), where θ=y^(1/4)Σ_ne(n²z). Prove θ(z)≠0, |J|=1 and the cocycle law, using the exact principal square-root branch and Kronecker multiplier.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the nonvanishing scalar theta seed from QM.1 and its exact Γ₀(4) transformation.
2. Conjugate by y^{1/4}; the absolute automorphy factor cancels, leaving the unitary multiplier and its cocycle.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/96: Define the multiplier inverse in a Poincaré sum.

**API.**

- `TauCeti.Metaplectic.thetaMultiplier_thetaRatio` (constructor): Form J from the nonvanishing theta seed.
- `TauCeti.Metaplectic.thetaMultiplier_cocycle` (relation): J(γδ, z)=J(γ,δz)J(δ, z).
- `TauCeti.Metaplectic.thetaMultiplier_unitary` (characterisation): |J(γ, z)|=1, with the precise branch giving the Γ₀(4)theta multiplier.

**Discriminating tests.**

- `TauCeti.Metaplectic.thetaMultiplier_test1` (computation): J(1, z)=1.
- `TauCeti.Metaplectic.thetaMultiplier_test2` (degenerate): A phase change of the theta seed does not change J.
- `TauCeti.Metaplectic.thetaMultiplier_test3` (non-example): Replacing the principal square-root by independent local choices can violate the cocycle law.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `mathlib:CongruenceSubgroup.Gamma0`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, (5.14) and the next display, p964; excerpt at PDF 16. Literal excerpt: “(5.14)                         J( , z) =                         for       2   0 (4).”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/73`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Weight-one-half Maass space

**Definition.** `TauCeti.Metaplectic.halfWeightMaass`

Node: `MetaplecticAutomorphicForms:MP.7/half-weight-maass-space`.

Let Δ_{1/2}=−y²(∂_x²+∂_y²)+(i/2)y∂_x. Then (Δ_{1/2}F)(γz)=J(γ,z)(Δ_{1/2}F)(z) for γ∈Γ₀(4) when F has weight 1/2. A Maass form of weight 1/2 for Γ₀(4) is a smooth F of weight 1/2, i.e. F(γz)=J(γ,z)F(z), with Δ_{1/2}F=λF, where λ=1/4+(r/2)². A Maass cusp form is also in L²(Γ₀(4)\H,dμ) and has zero constant term at each of the three cusps. V_r is the space of Maass cusp forms of weight 1/2 with λ=1/4+(r/2)². Its members have expansions (8.8): ψ(z)=Σ_{n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use QM.3’s differential operator and compute covariance through the exact unitary multiplier.
2. Impose the eigenfunction, all-cusp, smoothness and Petersson-L² conditions on actual functions.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/81: Provide the actual ambient eigenspace for the plus condition.

**API.**

- `TauCeti.Metaplectic.halfWeightMaass_automorphy` (projection): F(γz)=J(γ, z)F(z).
- `TauCeti.Metaplectic.halfWeightMaass_allCusps` (characterisation): Cuspidality means zero constant term at each of ∞, 0, 1/2, in normalized cusp coordinates.
- `TauCeti.Metaplectic.halfWeightMaass_eigenParameter` (compatibility): Weight-one-half eigenvalue is 1/4+(r/2)² when its Shimura lift has 1/4+r².

**Discriminating tests.**

- `TauCeti.Metaplectic.halfWeightMaass_test1` (computation): Vanishing only at ∞ is insufficient without a proved plus-space cusp comparison.
- `TauCeti.Metaplectic.halfWeightMaass_test2` (degenerate): An ordinary Γ-invariant function does not satisfy the genuine half-weight condition automatically.
- `TauCeti.Metaplectic.halfWeightMaass_test3` (non-example): Using the weight-zero parameter r directly in W produces the wrong eigenvalue.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/theta-multiplier`, `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, printed 975, PDF 27; literal excerpt PDF 27. Literal excerpt: “A Maass form of weight 1/2 for 0 (4) has weight 1/2, is smooth and satisfies   1/2 F = F, where we write         = (F ) = 14 + ( 2r )2 . Usually we also require”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/74`.

**Suggested-signature boundary.** Native function-submodule/eigen/automorphy fragment. Δ is the exact unitary half-weight differential operator, compared to QM.3 by y¼ conjugation and +3/16; smoothness and the self-adjoint three-cusp L² domain remain supplier gaps.

**Explicit proof/signature refinements.**

- The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Whittaker Fourier expansion

**Theorem.** `TauCeti.Metaplectic.halfWeight_fourierExpansion`

Node: `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`.

A cuspidal weight-one-half eigenform has F(z)=Σ_{n≠0}b(n)W_{sgn(n)/4,ir/2}(4π|n|y)e(nx), with convergence and coefficient recovery. The spectral parameter is r/2 here, versus r in weight zero.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Integrate in the periodic x variable to recover coefficients.
3. Solve the resulting Whittaker ODE and use the cusp/L² condition to eliminate growing terms; apply the supplier’s differentiated convergence estimate.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-maass-space`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `AutomorphicSpectralTheory:AS.0/dit-112`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 4, p965 (display before (5.16)); (8.8), p976; (10.1), p981; excerpt at PDF 28. Literal excerpt: “(8.8)                       (z) =          b(n)W 1 sign n, ir (4⇡|n|y)e(nx).”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/75`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Completed half-weight Eisenstein family

**Construction.** `TauCeti.Metaplectic.halfWeightEisenstein`

Node: `MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein`.

Construct E*_{1/2}(z,s) with constant term Λ(2s)2^s y^(s/2+1/4)+Λ(2−2s)2^(1−s)y^(3/4−s/2) and Whittaker parameter s/2−1/4. Prove automorphy and meromorphic continuation; its parameter differs from that in F_{1/2,n}(z,w).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Define the three-cusp Eisenstein family in its convergence half plane, then project to plus space in the fixed order.
2. Compute the constant term and its normalized functional equation; identify each nonzero coefficient in the Whittaker basis.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/79: Produce the two Dirichlet L-factors through half-weight coefficients.

**API.**

- `TauCeti.Metaplectic.halfWeightEisenstein_initialSeries` (constructor): Construct the Eisenstein family on Γ₀(4) with the theta multiplier and its prescribed cusp data.
- `TauCeti.Metaplectic.halfWeightEisenstein_constantTerms` (simp): Expose both powers y^(s/2+1/4) and y^(3/4−s/2), with 2^s and 2^(1−s).
- `TauCeti.Metaplectic.halfWeightEisenstein_fourierTransport` (compatibility): Its W parameter s/2−1/4 equals w−1/2 under w=s/2+1/4.

**Discriminating tests.**

- `TauCeti.Metaplectic.halfWeightEisenstein_test1` (computation): At s=1 the constant powers are 3/4 and 1/4.
- `TauCeti.Metaplectic.halfWeightEisenstein_test2` (degenerate): The factor 2^s cannot be absorbed into an L² normalization of a meromorphic family.
- `TauCeti.Metaplectic.halfWeightEisenstein_test3` (non-example): A coefficient formula at n=0 needs a constant-term branch.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicSpectralTheory:AS.1`, `MetaplecticAutomorphicForms:MP.7/theta-multiplier`, `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `mathlib:Complex.Gamma`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, unnumbered display after (5.14) and the Shimura relation, p964, quoting [16, Prop. 2 p. 959] (coefficient evaluation from [16, Lemma 4, (2.23)–(2.25), pp. 961–962]); excerpt at PDF 16. Literal excerpt: “Then it follows from [16, Prop. 2 p. 959] that”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/76`.

**Suggested-signature boundary.** Source Fourier-series construction, with Λ the completed zeta, b the stated plus coefficients and W the actual Whittaker function. Absolute convergence/meromorphic continuation and constant-term extraction are omitted until AS/AL/QM carriers arrive; arbitrary choices of these functions are not Eisenstein series.

**Explicit proof/signature refinements.**

- The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Fundamental-discriminant Eisenstein coefficient

**Construction.** `TauCeti.Metaplectic.fundamentalEisensteinCoefficient`

Node: `MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient`.

For fundamental d, b(d,s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d), where Λ(s,χ_d)=π^(−s/2)Γ((s+α)/2)|d|^(s/2)L(s,χ_d), α=(1−sgn d)/2. Compare with Mathlib’s gamma normalization, including its π^(−α/2) difference.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Express the coefficient at a fundamental discriminant as its quadratic Dirichlet series.
2. Insert the native completed Dirichlet L-function and the exact sign-dependent Gamma and |d| factors.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/78: Extend fundamental coefficients to all discriminants.

**API.**

- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_fundamentalValue` (simp): b(d, s)=(4π)^(−1/4)|d|^(−3/4)Λ(s,χ_d).
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_parityFactor` (compatibility): The paper completion is |d|^(s/2)π^(α/2) times Mathlib completed L.
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_product` (relation): The product of two such coefficients has factor (4π)^(−1/2)|D|^(−3/4).

**Discriminating tests.**

- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test1` (computation): d=1 gives the completed zeta factor.
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test2` (degenerate): d<0 uses Γ((s+1)/2), not Γ(s/2).
- `TauCeti.Metaplectic.fundamentalEisensteinCoefficient_test3` (non-example): The product constant in 79 is 2√π, not 4π.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.0`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `mathlib:Complex.Gamma`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, (5.13) (Λ(s,χ_d)) and the unnumbered definition of b(d,s), p964; excerpt at PDF 16. Literal excerpt: “For fundamental d, set”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/77`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Half-weight Eisenstein coefficient expansion

**Theorem.** `TauCeti.Metaplectic.halfWeightEisenstein_coefficients`

Node: `MetaplecticAutomorphicForms:MP.7/eisenstein-divisor-coefficients`.

The nonconstant coefficients of E*_{1/2} are b(n,s), supported on n≡0, 1 mod4. For fundamental d and m>0, mΣ_{n|m}n^(−3/2)(d/n)b(m²d/n²,s)=m^(s−1/2)σ_{1−2s}(m)b(d,s).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Compute local divisor factors for d times a square and use the plus-space Hecke relation.
2. Match the two Whittaker/Eisenstein normalizations, retaining m and n^{-3/2}.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein`, `MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, the two unnumbered displays after (5.14) (Shimura relation for b(dm²,s) and E*_{1/2}), p964; excerpt at PDF 16. Literal excerpt: “Shimura relation”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/78`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Eisenstein product normalization

**Theorem.** `TauCeti.Metaplectic.halfWeightEisenstein_product`

Node: `MetaplecticAutomorphicForms:MP.7/eisenstein-product-normalization`.

For coprime fundamental d,d′ and D=d′d, Λ(s,χ_{d′})Λ(s,χ_d)=2√π|D|^(3/4)b(d′,s)b(d,s). This is a bilinear product without complex conjugation, unlike Theorem 4.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Multiply the two fundamental coefficient formulas.
2. Cancel the two (4π)^{-1/4} factors against 2sqrt(π), retaining |D|^{3/4} and the bilinear product.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (5.15); excerpt at PDF 16. Literal excerpt: “(5.15)            ⇤(s, d0 )⇤(s, d ) = 2 ⇡|D|3/4 b(d0 , s)b(d, s)”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/79`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Theta residue and Petersson normalization

**Theorem.** `TauCeti.Metaplectic.halfWeightEisenstein_thetaResidue`

Node: `MetaplecticAutomorphicForms:MP.7/theta-residue-normalization`.

Res_{s=1}E*_{1/2}(z,s) = ½θ(z) (the pole comes from Λ(2−2s) in the constant term and from Λ(s,χ_1)=Λ(s) in the coefficients b(m²,s); checked). The paper states ⟨½θ,½θ⟩ = 6 citing [7], but with the paper's product ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ one has ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), hence ⟨½θ,½θ⟩ = π/2. The number 6 = [Γ:Γ_0(4)] is (3/π)⟨θ,θ⟩, i.e. ⟨θ,θ⟩ for the product normalized by area(Γ\H)=π/3. Rescaling F from ⟨F,F⟩=1 to ⟨F,F⟩=6 does turn 12 into 2 on the left of (5.16). The remark is heuristic and used in no proof.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Extract the pole at s=1 in the constant term and square-index coefficients.
2. Use the source’s actual hyperbolic measure and Rankin–Selberg norm comparison: ||θ||²=2π and ||θ/2||²=π/2. Record the printed 6 as source issue DIT-E22, not as the Petersson norm in this measure.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AdelicAlgebraicGroups:AA.1`, `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-theta-nonvanishing`, `MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Remarks after Theorem 4, p965; excerpt at PDF 17. Literal excerpt: “Perhaps not coincidentally,”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/80`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Kohnen plus subspace

**Definition.** `TauCeti.Metaplectic.kohnenPlus`

Node: `MetaplecticAutomorphicForms:MP.7/kohnen-plus-space`. Planet: **Kohnen plus space**.

V_r^+ is the subspace of the weight-one-half cuspidal eigenspace V_r whose Fourier coefficients vanish outside n≡0, 1 mod4. It is a linear subspace defined by coefficient kernels, not by a chosen basis.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Intersect the kernels of inadmissible coefficient maps in the actual Maass cusp eigenspace.
2. Use Fourier coefficient uniqueness and linearity to obtain the plus subspace.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/100: Project the finite-rank residue to the appropriate subspace.

**API.**

- `TauCeti.Metaplectic.kohnenPlus_coefficientKernels` (constructor): Intersect kernels of b(n) for n≡2, 3 mod 4.
- `TauCeti.Metaplectic.kohnenPlus_membership` (characterisation): Membership means exactly the forbidden coefficients vanish, together with the ambient cusp/eigen conditions.
- `TauCeti.Metaplectic.kohnenPlus_linearStructure` (structure): The plus condition is linear and preserved by the applicable Hecke operators.

**Discriminating tests.**

- `TauCeti.Metaplectic.kohnenPlus_test1` (computation): n=−3≡1 mod 4 is allowed.
- `TauCeti.Metaplectic.kohnenPlus_test2` (degenerate): n=−1≡3 mod 4 is forbidden.
- `TauCeti.Metaplectic.kohnenPlus_test3` (non-example): A form with zero forbidden coefficients but a nonzero cusp constant is not a plus cusp form.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-maass-space`, `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, p976; excerpt at PDF 28. Literal excerpt: “Kohnen the plus space, that contains those Maass cusp”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/81`.

**Suggested-signature boundary.** Fourier-kernel intersection fragment; the genuine ambient cusp/eigen space and applicable odd/p=2 Hecke preservation require the packet hypotheses.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Plus projection operators

**Construction.** `TauCeti.Metaplectic.plusOperators`

Node: `MetaplecticAutomorphicForms:MP.7/plus-operators`.

On the unitary-weight space set UF(z)=(√2/4)Σ_{ν=0}^3F((z+ν)/4), WF(z)=exp(iπ/4)(z/|z|)^(−1/2)F(−1/(4z)), and pr⁺=(2/3)WU+1/3. Record operator composition order and the factor √2 caused by y^(1/4).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Define U by four translates and W by the principal square-root Fricke factor.
2. Compute their action on the automorphic domain and define the fixed DIT16 order pr+=(2/3)WU+1/3.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/99: Recover the principal-term coefficient of the projected family.

**API.**

- `TauCeti.Metaplectic.plusOperators_uFormula` (simp): U=(√2/4)Σ_{ν mod 4}F((z+ν)/4) in the unitary normalization.
- `TauCeti.Metaplectic.plusOperators_wFormula` (simp): W uses exp(iπ/4)(z/|z|)^(−1/2) and z↦−1/(4 z).
- `TauCeti.Metaplectic.plusOperators_projectionComparison` (compatibility): Verify the composition order against the conjugated DIT 11 operators and prove pr⁺|V⁺=1 before using its 2/3 principal term.

**Discriminating tests.**

- `TauCeti.Metaplectic.plusOperators_test1` (computation): Dropping √2 changes U after conjugation by y^(1/4).
- `TauCeti.Metaplectic.plusOperators_test2` (degenerate): The projection must be idempotent on the ambient eigenspace.
- `TauCeti.Metaplectic.plusOperators_test3` (non-example): Compare WU and UW on a form outside the plus space; equality is not an assumption.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/theta-multiplier`, `MetaplecticAutomorphicForms:MP.7/half-weight-maass-space`, `MetaplecticAutomorphicForms:MP.7/kohnen-plus-space`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, printed 976, PDF 28, U,W and footnote6; literal excerpt PDF 28. Literal excerpt: “projection operator pr+ : Vr ! Vr+ defined by pr+ = 23 W U + 13 , where6                       p     3”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/82`.

**Suggested-signature boundary.** Explicit U,W on native upper-half-plane functions; idempotence is only on the source ambient modular eigenspace. WU composition is exposed; no UW=WU assumption is inserted.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Plus projection and old normalization bridge

**Theorem.** `TauCeti.Metaplectic.kohnenPlus_projection`

Node: `MetaplecticAutomorphicForms:MP.7/plus-projection`.

Prove pr⁺ is the orthogonal projection onto V_r^+, with the same extension on the relevant Poincaré families. DIT11 (2.19) must read P_d^+=(3/2)pr⁺P_d; DIT16 footnote7 corrects it. The principal term of pr⁺F_{1/2,d} thus has factor2/3.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the exact four-coset action and Petersson adjoint relations.
2. Identify image and fixed vectors by Fourier support; compare the DIT11 (3/2) normalization without commuting U and W silently.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-operators`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8 equation(8.10) and footnote7, printed 977, PDF 29; projection definition printed 976 PDF 28; literal excerpt PDF 29. Literal excerpt: “(8.10)        pr F1/2,d (z, s) =              M 1 sign d,s                     1   (4⇡|d|y)e(dx)”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/83`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Half-weight Kloosterman sum

**Definition.** `TauCeti.Metaplectic.halfWeightKloosterman`

Node: `MetaplecticAutomorphicForms:MP.7/half-weight-kloosterman`.

For c>0 divisible by4, K_{1/2}(m,n; c)=Σ_{a mod c,(a,c)=1}(c/a)ε_a e((m a+n ā)/c), where aā≡1 modc and ε_a=1 or i according as a≡1 or3 mod4. The extended Kronecker symbol convention is part of the data.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Choose units modulo c and their inverses in the finite group.
2. Check the Kronecker/ε_a phase is independent of admissible odd representatives, then sum the character terms.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/104: Keep the dyadic multiplier in the divisor identity.

**API.**

- `TauCeti.Metaplectic.halfWeightKloosterman_unitSum` (constructor): Sum over units mod c with a chosen inverse and the extended Kronecker symbol.
- `TauCeti.Metaplectic.halfWeightKloosterman_inverseIndependence` (characterisation): Changing the integer lift of a⁻¹ by c does not change the phase.
- `TauCeti.Metaplectic.halfWeightKloosterman_modulusData` (projection): Require 4|c and distinguish ε_a for a residue 1 or 3 mod 4.

**Discriminating tests.**

- `TauCeti.Metaplectic.halfWeightKloosterman_modFour` (computation): K_{1/2}(0, 0; 4)=1+i.
- `TauCeti.Metaplectic.halfWeightKloosterman_period` (compatibility): Adding c to either index leaves the sum unchanged.
- `TauCeti.Metaplectic.halfWeightKloosterman_phase` (non-example): Omitting ε_a gives2 instead of1+i at m=n=0,c=4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, p.976; DIT11 p.964 (unnumbered display just before (3.4)); DIT11 (3.4), p.965, is K⁺; excerpt at PDF 28. Literal excerpt: “Kloosterman sums of weight”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/84`.

**Suggested-signature boundary.** Finite sum on native units of ZMod c; κ is the GN.2 extended Kronecker symbol, not a private substitute. The source modulus 4|c is required in the packet.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Modified plus Kloosterman sum

**Definition.** `TauCeti.Metaplectic.plusKloosterman`

Node: `MetaplecticAutomorphicForms:MP.7/plus-kloosterman`.

K⁺(m,n; c)=(1−i)K_{1/2}(m,n; c) times1 if8|c, and times2 ifc≡4 mod8. Only the discriminant-indexed symmetry statement is used.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Multiply the half-weight sum by (1−i) and the source’s c modulo8 factor.
2. Compare the source plus projection coefficient calculation.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/98: Match the plus-projected Fourier coefficients.

**API.**

- `TauCeti.Metaplectic.plusKloosterman_dyadicFactor` (simp): Use 2 when c≡4 mod 8 and 1 when 8|c.
- `TauCeti.Metaplectic.plusKloosterman_weightHalfComparison` (compatibility): K⁺/(1−i) equals the dyadic multiple of K_{1/2}.
- `TauCeti.Metaplectic.plusKloosterman_discriminantSymmetry` (relation): For allowed indices, K⁺ is real and symmetric.

**Discriminating tests.**

- `TauCeti.Metaplectic.plusKloosterman_modFour` (computation): K+(0, 0; 4)=4.
- `TauCeti.Metaplectic.plusKloosterman_oneOne` (computation): K+(1, 1; 4)=−4.
- `TauCeti.Metaplectic.plusKloosterman_exception` (non-example): Omitting the c≡4 mod8 factor gives2 rather than4 at zero indices,c=4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-kloosterman`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, p976; excerpt at PDF 28. Literal excerpt: “Kloosterman sums of weight”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/85`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Reality and symmetry of plus sums

**Theorem.** `TauCeti.Metaplectic.plusKloosterman_symmetry`

Node: `MetaplecticAutomorphicForms:MP.7/plus-kloosterman-symmetry`.

For c>0 with 4|c and all m,n∈ℤ, K⁺(m,n; c)=K⁺(n,m; c)=conj(K⁺(n,m; c)). This is (8.9), stated without any congruence condition on m,n, as in DIT11 (3.5).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Invert the summation variable to exchange the two indices.
2. Apply the exact quadratic phase/complex-conjugation calculation; the claim is the stated K+ identity, not an ordinary Kloosterman symmetry without phase.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-kloosterman`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.9); excerpt at PDF 28. Literal excerpt: “(8.9)                  K + (m, n; c) = K + (n, m; c) = K + (n, m; c).”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/86`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Half-weight resolvent kernel

**Construction.** `TauCeti.Metaplectic.halfWeightResolvent`

Node: `MetaplecticAutomorphicForms:MP.7/half-weight-resolvent`. Planet: **Half weight resolvent**.

Construct the resolvent G_{1/2}(z,z′; s) on the Γ₀(4) unitary-multiplier L² space, with its three-cusp domain, hermitian kernel symmetry and discrete polar projectors. This is a cover-specific adaptation of AS.0, not an ordinary scalar kernel on Γ\H.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Apply the AS.0 resolvent to the closed three-cusp unitary-multiplier Laplacian domain.
2. Prove the finite-cover/multiplier adaptation and identify the kernel’s Fourier expansion and spectral poles.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/100: Transport resolvent theory to the genuine multiplier space.

**API.**

- `TauCeti.Metaplectic.halfWeightResolvent_weightedDomain` (constructor): Use functions with J automorphy and all three cusps in the self-adjoint domain.
- `TauCeti.Metaplectic.halfWeightResolvent_covariance` (relation): Transform each kernel variable with its J or conjugate J factor.
- `TauCeti.Metaplectic.halfWeightResolvent_polarProjection` (compatibility): The residue is the orthogonal projector onto the weighted eigenspace, before plus projection.

**Discriminating tests.**

- `TauCeti.Metaplectic.halfWeightResolvent_test1` (computation): The kernel cannot be an ordinary invariant scalar in both variables.
- `TauCeti.Metaplectic.halfWeightResolvent_test2` (degenerate): Changing the phase of an orthonormal basis vector leaves its rank-one projector unchanged.
- `TauCeti.Metaplectic.halfWeightResolvent_test3` (non-example): Projection to V⁺ changes the basis sum and must precede the coefficient identity 100.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-maass-space`, `AutomorphicSpectralTheory:AS.0`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.5); excerpt at PDF 27. Literal excerpt: “(8.5)              1/2       s(1   s)                  G 1 (z, z 0 ; s)u(z)dµ(z) = u(z 0 )”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/95`.

**Suggested-signature boundary.** Kernel value signature; native unbounded self-adjoint three-cusp domain, spectral pole parameter and resolvent operator require AS.0. The basis residue must be taken in the actual orthonormal weighted eigenspace.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Half-weight Poincaré family

**Construction.** `TauCeti.Metaplectic.halfWeightPoincare`

Node: `MetaplecticAutomorphicForms:MP.7/half-weight-poincare`.

For n≠0, Re(s)>1, F_{1/2,n}(z,s)=Γ(s−sgn(n)/4)/(4π|n|Γ(2s)) times Σ_{Γ∞\Γ₀(4)}J(γ,z)⁻¹ M_{sgn(n)/4,s−1/2}(4π|n|Imγz)e(n Reγz).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Form the Γ∞\Γ₀(4) orbit sum of the normalized Whittaker-M seed.
3. Prove absolute/compact-uniform convergence for Re(s)>1, covariance, and its Fourier expansion.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/99: Produce the exact gamma normalization of Φ⁺.

**API.**

- `TauCeti.Metaplectic.halfWeightPoincare_seedNormalization` (simp): The prefactor is Γ(s−sgn n/4)/(4π|n|Γ(2 s)).
- `TauCeti.Metaplectic.halfWeightPoincare_multiplierInverse` (structure): J(γ, z)⁻¹ in the coset sum gives the correct automorphy.
- `TauCeti.Metaplectic.halfWeightPoincare_parameter` (compatibility): The Whittaker parameter is s−1/2. Comparing with weight zero requires the substitution w=s/2+1/4.

**Discriminating tests.**

- `TauCeti.Metaplectic.halfWeightPoincare_test1` (computation): n=1 and n=−3 use different gamma arguments.
- `TauCeti.Metaplectic.halfWeightPoincare_test2` (degenerate): n=0 cannot be inserted into the prefactor.
- `TauCeti.Metaplectic.halfWeightPoincare_test3` (non-example): Missing 4π|n| changes both the residue and the constant 12 in Theorem 4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/theta-multiplier`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `mathlib:QuotientGroup.rightRel`, `mathlib:CongruenceSubgroup.Gamma0`, `AutomorphicSpectralTheory:AS.0/dit-112`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.6); excerpt at PDF 27. Literal excerpt: “(8.6)         F1/2,n (z, s) =      4⇡|n| (2s)                      J( , z) 1 f1/2,n ( z, s)”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/96`.

**Suggested-signature boundary.** Native right-coset quotient Γ∞\Γ. Quotient.out chooses representatives; source multiplier periodicity proves the summand independent of that choice. n≠0, Re(s)>1 and the actual Whittaker M remain packet conditions.

**Explicit proof/signature refinements.**

- The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Half-weight Poincaré residues

**Theorem.** `TauCeti.Metaplectic.halfWeightPoincare_residue`

Node: `MetaplecticAutomorphicForms:MP.7/poincare-residues`.

At s₀=1/2+ir/2, r>0, Res[(2s−1)F_{1/2,n}(z,s)]=Σ_ψ conj(b_ψ(n))ψ(z) over an orthonormal cuspidal eigenbasis, in the kernel convention verified from Fay. Preserve conjugation; raw PDF text drops bars.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the resolvent spectral projection at s=1/2+ir/2.
2. Apply its coefficient extraction with an orthonormal Petersson basis and retain conjugation on the source coefficient.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.7/half-weight-resolvent`, `MetaplecticAutomorphicForms:MP.7/half-weight-poincare`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8 equation(8.7), printed 976, PDF 28; literal excerpt PDF 28. Literal excerpt: “(8.7)                 Ress= 1 + ir (2s        1)F1/2,n (z, s) =            b(n) (z).                               2     2”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/97`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Plus Bessel coefficient family

**Construction.** `TauCeti.Metaplectic.plusBesselCoefficient`

Node: `MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient`.

For nonzero discriminant indices n,d and Re(s)>1, Φ⁺(n,d; s) equals [Γ(s−sgn n/4)Γ(s−sgn d/4)/(3√π·2^(2−2s)Γ(2s−1/2)√|nd|)] Σ_{c>0, 4|c}K⁺(n,d; c)c⁻¹ B_{2s−1}(4π√|nd|/c), with I for nd<0, J for nd>0.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Compute the projected Poincaré Fourier coefficient by orbit unfolding.
3. Apply the Whittaker–Bessel integral, selecting I for nd<0 and J for nd>0 and retaining all Gamma and power factors.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/119: Convert the finite root sums into metaplectic spectral coefficients.

**API.**

- `TauCeti.Metaplectic.plusBesselCoefficient_besselSeries` (constructor): Use the explicit prefactor and K⁺ series of 98 in Re(s)>1.
- `TauCeti.Metaplectic.plusBesselCoefficient_signs` (simp): Each gamma factor uses its own index sign; the Bessel function depends on the product sign.
- `TauCeti.Metaplectic.plusBesselCoefficient_continuation` (compatibility): Extend using the projected resolvent coefficient, preserving its initial series.

**Discriminating tests.**

- `TauCeti.Metaplectic.plusBesselCoefficient_test1` (computation): When d′<0 and d<0, use J with two Γ(s+1/4) factors.
- `TauCeti.Metaplectic.plusBesselCoefficient_test2` (degenerate): d′>0, d<0 uses I with opposite sign gamma arguments.
- `TauCeti.Metaplectic.plusBesselCoefficient_test3` (non-example): The c≡4 mod 8 coefficient must retain its extra 2 from K⁺.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-kloosterman`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`, `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8 equation(8.11), printed 977, PDF 29; literal excerpt PDF 29. Literal excerpt: “(8.11)                (n, d; s) =         1   p                1”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/98`.

**Suggested-signature boundary.** The full two-sign Gamma/power prefactor and K⁺/Bessel series are exposed. Nonzero discriminant indices, Re(s)>1, the actual J/I functions and meromorphic continuation remain packet conditions.

**Explicit proof/signature refinements.**

- The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Projected Fourier expansion

**Theorem.** `TauCeti.Metaplectic.plusPoincare_expansion`

Node: `MetaplecticAutomorphicForms:MP.7/projected-poincare-expansion`.

Let Re(s)>1 and let d≠0 with d≡0, 1 mod 4. Then pr⁺F_{1/2,d}(z,s)=(2/3)Γ(s−sgn(d)/4)/(4π|d|Γ(2s))·M_{sgn(d)/4,s−1/2}(4π|d|y)e(dx)+Σ_{n≡0, 1(4),n≠0}Φ⁺(n,d; s)W_{sgn(n)/4,s−1/2}(4π|n|y)e(nx)+(a constant term that the paper does not display). Φ⁺ is given by (8.11). The paper's sum over n≡0, 1(4) formally includes n=0, where W(4π|n|y) is meaningless.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Apply the fixed plus projection to the Poincaré family.
2. Separate its leading M term with coefficient2/3 from the W Fourier terms defined by Φ+.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-projection`, `MetaplecticAutomorphicForms:MP.7/half-weight-poincare`, `MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8 equations(8.10)–(8.11), printed 977, PDF 29; literal excerpt PDF 29. Literal excerpt: “(8.10)        pr F1/2,d (z, s) =              M 1 sign d,s                     1   (4⇡|d|y)e(dx)”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/99`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Plus coefficient residue theorem

**Theorem.** `TauCeti.Metaplectic.plusBesselCoefficient_residue`

Node: `MetaplecticAutomorphicForms:MP.7/plus-coefficient-residue`.

Φ⁺(d′,d; s) continues meromorphically to Re(s)>0 and Res_{s=1/2+ir/2}[(2s−1)Φ⁺(d′,d; s)]=Σ_ψ b_ψ(d′)conj(b_ψ(d)), for an orthonormal basis of V_r^+.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Continue the projected coefficient through the resolvent and use its discrete spectral residue.
2. Recover the product b(d′)conjugate(b(d)); r=0 needs its distinct pole analysis.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/kohnen-plus-space`, `MetaplecticAutomorphicForms:MP.7/poincare-residues`, `MetaplecticAutomorphicForms:MP.7/projected-poincare-expansion`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proposition 4, p977; excerpt at PDF 29. Literal excerpt: “Proposition 4. For fixed discriminants d0 , d, the function                                       + (d0 , d; s)”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/100`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Quadratic-root Weyl sum

**Definition.** `TauCeti.Metaplectic.quadraticRootWeylSum`

Node: `MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum`.

For c>0 divisible by4, S_m(d′,d; c)=Σ_{b mod c,b²≡D modc}χ_d([c/4,b,(b²−D)/c])e(2mb/c). Prove representative independence, reality and S_{−m}=S_m using the exact factor2 in the exponential.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Import the invariant genus character on possibly imprimitive forms from GN.2.
2. Use b²≡D modc to form [c/4,b,(b²−D)/c]; prove independence, reality and m↦−m symmetry.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/106: Parametrize unfolded cycles by roots of a congruence.

**API.**

- `TauCeti.Metaplectic.quadraticRootWeylSum_rootIndex` (constructor): Sum over b mod c with b²≡d′d mod c.
- `TauCeti.Metaplectic.quadraticRootWeylSum_formEvaluation` (simp): Associate [c/4, b,(b²−D)/c] of discriminant D.
- `TauCeti.Metaplectic.quadraticRootWeylSum_evenness` (relation): S_{−m}=S_m=conj(S_m) under the stated genus character convention.

**Discriminating tests.**

- `TauCeti.Metaplectic.quadraticRootWeylSum_test1` (computation): The quadratic form discriminant computes to D exactly.
- `TauCeti.Metaplectic.quadraticRootWeylSum_test2` (degenerate): The phase is e(2 mb/c), not e(mb/c).
- `TauCeti.Metaplectic.quadraticRootWeylSum_test3` (non-example): Passing from b modulo 2a to b modulo 4a doubles the count and requires a factor 1/2.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (9.1); excerpt at PDF 30. Literal excerpt: “(9.1)              Sm (d0 , d; c) =                             [ 4c , b, b c D ] e       2mb”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/103`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Kohnen–Salié divisor identity

**Theorem.** `TauCeti.Metaplectic.kohnenSalie_identity`

Node: `MetaplecticAutomorphicForms:MP.7/kohnen-salie-identity`. Planet: **Kohnen–Salié identity**.

For c>0 divisible by4, d fundamental, d′≡0, 1 mod4 and integer m, S_m(d′,d; c)=Σ_{n|gcd(m,c/4),n>0}(d/n)√(n/c)K⁺(d′,m²d/n²; c/n). Include even-prime factors and the c≡4 mod8 multiplier.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Evaluate the finite quadratic-root sum prime by prime using the same genus character convention.
2. Assemble the divisor decomposition, including p=2; the unread original Kohnen computation remains a gap.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-kloosterman`, `MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma 8, p.980; the same as DIT11 Proposition 3, p.965, with DIT11's (d,D) renamed (d′,d); excerpt at PDF 32. Literal excerpt: “Lemma 8. For positive c ⌘ 0 (mod 4), d, m 2 Z with d0 ⌘ 0, 1 (mod 4)”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/104`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Weight-two cycle unfolding

**Theorem.** `TauCeti.Metaplectic.halfWeight_cycleUnfolding`

Node: `MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding`.

Let d be fundamental, d′,d<0, D=d′d nonsquare, and let φ be as in item 105. Put Φ_m(t)=−it∫_0^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ (9.3). For every m∈ℤ, Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ=ε·Σ_{0<c≡0(4)}S_m(d′,d; c)Φ_m(2√D/c). Here ε=+1 when C_Q runs from z to g_Qz=γ_Q⁻¹z (DIT11's orientation: counterclockwise on S_Q for a>0), and ε=−1 when C_Q runs from z to γ_Qz (the orientation of C_A in §2, under which Lemma 5 holds). The paper prints S_m(d,d′; c) and ε=+1. This uses the corrected z→γ_Qz orientation of E28. Work in a proved convergence range (or with the weaker actual decay O(y^ε)); the printed stronger decay hypothesis is not inferred automatically for Re(s)>1.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Unfold the oriented quadratic cycle using GN.3’s actual z→γ_Qz orientation.
2. The weight-two differential contributes −it in the corrected kernel; justify convergence first on the valid decay range and continue as needed.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum`, `AutomorphicSpectralTheory:AS.0`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma 6, (9.3); DIT11 Lemmas6–8; excerpt at PDF 31. Literal excerpt: “Lemma 6. Suppose that d0 , d < 0 and that dd0 = D is not a square. Then”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/106`.

**Suggested-signature boundary.** Corrected −it oriented kernel for z→γ_Qz. Cycle indexing, compact integration and convergence require the routed Nielsen-core supplier and the packet hypotheses.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### CM Poincaré sum

**Theorem.** `TauCeti.Metaplectic.poincare_cmSum`

Node: `MetaplecticAutomorphicForms:MP.7/cm-poincare-sum`.

For m≠0, Re(s)>1 and d′d=D<0, Σ_Qχ(Q)ω_Q⁻¹F_m(z_Q,s)=2^(−1/2)|D|^(1/4)Σ_{c>0, 4|c}S_m(d′,d; c)c^(−1/2)I_{s−1/2}(4π|m|√|D|/c). The square root is of |D|.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Unfold the weight-zero Poincaré orbit at the CM point with its stabilizer weight.
2. Identify the quadratic-root sum and evaluate the I-Bessel radial integral.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AutomorphicSpectralTheory:AS.0`, `MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma 3, p978; DIT11 Proposition 4; excerpt at PDF 30. Literal excerpt: “Lemma 3. For m 6= 0, d0 d < 0 and Re(s) > 1, we have”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/107`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Positive cycle Poincaré sum

**Theorem.** `TauCeti.Metaplectic.poincare_positiveCycle`

Node: `MetaplecticAutomorphicForms:MP.7/positive-cycle-poincare-sum`.

For m≠0, Re(s)>1 and d,d′>0, D nonsquare, Σ_Qχ(Q)∫_{C_Q}F_m ds=2^(s−1/2)Γ(s/2)²D^(1/4)/Γ(s) times Σ_{c>0, 4|c}S_m(d′,d; c)c^(−1/2)J_{s−1/2}(4π|m|√D/c).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Parametrize the positively factored oriented closed cycle.
2. Unfold its scalar Poincaré integral and evaluate the J-Bessel integral with Γ(s/2)².

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AutomorphicSpectralTheory:AS.0`, `MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma 4, p979; excerpt at PDF 31. Literal excerpt: “Lemma 4. For m 6= 0, d0 , d > 0 with d0 d not a square and Re(s) > 1, we”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/108`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Negative-factor cycle Poincaré sum

**Theorem.** `TauCeti.Metaplectic.poincare_negativeCycle`

Node: `MetaplecticAutomorphicForms:MP.7/negative-cycle-poincare-sum`.

Let m≠0, Re(s)>1, d fundamental, d′,d<0 and D=d′d nonsquare. Orient C_Q from z to γ_Qz, with γ_Q from (2.11); this is clockwise on S_Q when a>0 and is the orientation of C_A in §2. Then Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}i∂_zF_m(z,s)dz=2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}Σ_{0<c≡0(4)}S_m(d′,d; c)c^{−1/2}J_{s−1/2}(4π|m|√D/c). With DIT11's orientation (z to γ_Q⁻¹z) the right side changes sign.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Import the exact general special-function carrier named in the prerequisites. Preserve the positive-real branch and parameter normalization; cover-specific Fourier/cycle integration remains here.
2. Use the corrected weight-two oriented unfolding.
3. Evaluate the differentiated Whittaker integral, retaining Γ((s+1)/2)² and the source’s oriented differential.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma 5, p979; excerpt at PDF 31. Literal excerpt: “Lemma 5. For m 6= 0, d0 , d < 0 with d0 d not a square and Re(s) > 1, we”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/109`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Exact three-case Poincaré identity

**Theorem.** `TauCeti.Metaplectic.halfWeight_threeCasePoincare`

Node: `MetaplecticAutomorphicForms:MP.7/three-case-poincare-identity`.

Let m≠0 and Re(s)>1, let d be a fundamental discriminant and d′ a discriminant with D=d′d nonsquare. Then 6π^{1/2}|D|^{3/4}|m|Σ_{n|m,n>0}n^{−3/2}(d/n)Φ⁺(d′,m²d/n²; s/2+1/4)=Σ_{Q∈Γ\Q_D}χ(Q)·X_Q, where X_Q=2√πω_Q⁻¹F_m(z_Q,s) if d′d<0, X_Q=∫_{C_Q}F_m(z,s)y⁻¹|dz| if d′,d>0, and X_Q=∫_{C_Q}i∂_zF_m(z,s)dz if d′,d<0. In the third case C_Q runs from z to γ_Qz, as in item 109.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Insert the Kohnen–Salié divisor identity into Φ+.
2. Compare each sign case with its independently unfolded CM/scalar-cycle/weight-two-cycle formula.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient`, `MetaplecticAutomorphicForms:MP.7/kohnen-salie-identity`, `MetaplecticAutomorphicForms:MP.7/cm-poincare-sum`, `MetaplecticAutomorphicForms:MP.7/positive-cycle-poincare-sum`, `MetaplecticAutomorphicForms:MP.7/negative-cycle-poincare-sum`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proposition 5, p978; excerpt at PDF 30. Literal excerpt: “Proposition 5. Let m 6= 0 and Re(s) > 1. Suppose that d is a funda-”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/119`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Plus Hecke eigenbasis

**Theorem.** `TauCeti.Metaplectic.kohnenPlus_heckeBasis`

Node: `MetaplecticAutomorphicForms:MP.7/plus-hecke-basis`.

V_r^+ has an orthonormal basis B_r of simultaneous eigenforms for T_{p²}, p>2. Supply the p=2 plus-space convention needed for the Euler product over all primes; diagonalization away from2 alone does not define that factor. The all-prime version explicitly includes the plus-space p=2 Hecke operator; an odd-prime eigenbasis alone is insufficient.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use finite-dimensionality and the self-adjoint commuting Hecke family on the plus cusp space.
2. Include the separately verified p=2 plus operator before asserting an all-prime Euler product.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/kohnen-plus-space`, `MetaplecticAutomorphicForms:MP.7/plus-operators`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §10, pp980–981; Katok–Sarnak[34]; excerpt at PDF 32. Literal excerpt: “orthonormal basis Br = { }”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/120`.

**Suggested-signature boundary.** Finite-dimensional simultaneous eigenbasis fragment; normal commuting Hecke operators and the explicit plus-space p=2 convention are packet/supplier conditions, not consequences of an arbitrary T.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Shimura lift from an eigenline

**Construction.** `TauCeti.Metaplectic.shimuraEigenlineLift`

Node: `MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift`.

For ψ∈B_r, choose a fundamental d with b_ψ(d)≠0, define a_ψ(n) from the Hecke Euler factors, and form Shim(ψ)(z)=2√yΣ_{n≠0}a_ψ(|n|)K_ir(2π|n|y)e(nx). Prove independence from the selected d and from scaling ψ; define it first on the eigenline.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Choose a fundamental coefficient that is nonzero, then use the coefficient/Hecke relation to define the normalized weight-zero Fourier series.
2. Prove its automorphy via the finite Fourier certificate; normalized output depends on the eigenline, not a unit-phase choice of input.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/127: Separate eigenline existence from phase selection.

**API.**

- `TauCeti.Metaplectic.shimuraEigenlineLift_heckeSeries` (constructor): Form the even K-Bessel series from the Hecke eigenvalues.
- `TauCeti.Metaplectic.shimuraEigenlineLift_scaleIndependence` (characterisation): Multiplying ψ by a nonzero scalar leaves all a_ψ(n) and Shim(ψ) unchanged.
- `TauCeti.Metaplectic.shimuraEigenlineLift_fundamentalChoice` (compatibility): Different nonzero fundamental coefficients produce the same a_ψ(n), using the Hecke relations.

**Discriminating tests.**

- `TauCeti.Metaplectic.shimuraEigenlineLift_test1` (computation): ψ and −ψ have the same Shimura lift.
- `TauCeti.Metaplectic.shimuraEigenlineLift_test2` (degenerate): A selected coefficient b(d)=0 cannot be used as a denominator.
- `TauCeti.Metaplectic.shimuraEigenlineLift_test3` (non-example): The p=2 Euler factor needs its own plus-space convention even when the basis was diagonalized only for p>2.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.2`, `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.7/plus-hecke-basis`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (10.1)–(10.3); excerpt at PDF 33. Literal excerpt: “(10.3)            Shim (z) = y 1/2                      2a (|n|)Kir (2⇡|n|y)e(nx).”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/121`.

**Suggested-signature boundary.** K-Bessel series from all-prime Hecke eigenvalues on an eigenline, with scale-invariant coefficient ratios. Automorphy and nonzero fundamental coefficient are separate theorems; p=2 needs its actual operator.

**Explicit proof/signature refinements.**

- The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Shimura coefficient relation

**Theorem.** `TauCeti.Metaplectic.shimura_coefficientRelation`

Node: `MetaplecticAutomorphicForms:MP.7/shimura-coefficient-relation`.

For m>0 and fundamental d, mΣ_{n|m}n^(−3/2)(d/n)b_ψ(m²d/n²)=a_ψ(m)b_ψ(d). Prove that some fundamental coefficient is nonzero, so these relations determine the lift and all coefficients from fundamental ones.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Apply the half-weight T_{p²} recurrence at every prime with the specified p=2 convention.
2. Induct on m and use coprime multiplicativity; prove some fundamental coefficient is nonzero rather than assuming a normalization b(d)=1.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.7/plus-hecke-basis`, `MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 4; §10, pp981–982; excerpt at PDF 17. Literal excerpt: “Shimura relation”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/122`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Spectral substitution residue factor four

**Theorem.** `TauCeti.Metaplectic.spectralResidue_substitution`

Node: `MetaplecticAutomorphicForms:MP.7/spectral-residue-substitution`.

Set w=s/2+1/4, s₀=1/2+ir and w₀=1/2+ir/2, r>0. Then Res_{s=s₀}[(2s−1)H(s/2+1/4)]=4 Res_{w=w₀}[(2w−1)H(w)] for H with a simple pole at w₀. One factor2 is the derivative of the coordinate change, the other the linear spectral factor.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Set w=s/2+1/4 and convert the simple-pole local coordinate.
2. The residue change contributes2 and (2s−1)/(2w−1) contributes2, hence the factor4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §10, p982; excerpt at PDF 34. Literal excerpt: “Proposition 4 gives”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/123`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Spectral trace identity before multiplicity one

**Theorem.** `TauCeti.Metaplectic.halfWeight_spectralTrace`

Node: `MetaplecticAutomorphicForms:MP.7/spectral-trace-identity`.

Taking residues in119 and using93, 100, 122, 123 yields 12√π|D|^(3/4)Σ_ψ b_ψ(d′)conj(b_ψ(d))a_ψ(m)=Σ_φa_φ(m)T(φ,χ), where T is ||φ||⁻² times the appropriate three-case geometric trace. Keep the finite eigenspace sums until the Shimura bijection is proved.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Take residues in the three-case Poincaré identity with the permitted coefficient/interchange estimate.
2. Use the weight-zero and half-weight orthonormal spectral projections, coefficient relation and residue factor4.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `AutomorphicSpectralTheory:AS.0`, `MetaplecticAutomorphicForms:MP.7/plus-coefficient-residue`, `MetaplecticAutomorphicForms:MP.7/three-case-poincare-identity`, `MetaplecticAutomorphicForms:MP.7/shimura-coefficient-relation`, `MetaplecticAutomorphicForms:MP.7/spectral-residue-substitution`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (10.4)–(10.6); excerpt at PDF 33. Literal excerpt: “(10.4)            12⇡ 2 D 4                b(d0 )b(d)a (m) =                      a(m)T (', ),”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/124`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Automorphy of the Shimura series

**Theorem.** `TauCeti.Metaplectic.shimura_automorphy`

Node: `MetaplecticAutomorphicForms:MP.7/shimura-series-automorphy`.

Use the family of trace identities and the Biró linear-independence argument to prove Shim(ψ) is an even level-one Hecke–Maass cusp form with eigenvalue1/4+r². Formal Fourier series with the right Euler factors alone do not imply automorphy.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Apply the finite Fourier separation argument to the invisible-kernel orthogonal complement.
2. Use the trace identities for all positive test indices to express the candidate as a finite combination of actual automorphic forms.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift`, `MetaplecticAutomorphicForms:MP.7/spectral-trace-identity`, `MetaplecticAutomorphicForms:MP.7/finite-fourier-automorphy`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §10, p982, citing Biró[3]p129; excerpt at PDF 34. Literal excerpt: “Biró in [3], one”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/125`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Shimura bijection of eigenlines

**Theorem.** `TauCeti.Metaplectic.shimura_eigenlineBijection`

Node: `MetaplecticAutomorphicForms:MP.7/shimura-eigenline-bijection`. Planet: **Shimura correspondence**.

The weight-one-half Kohnen-plus Hecke eigenlines at parameter r/2 correspond bijectively to normalized even level-one Hecke–Maass forms at parameter r. On a previously chosen orthonormal basis B_r this gives one selected vector for each line; it does not produce a phase-independent unit vector.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the proved automorphy and normalized coefficient relation.
2. Import the Baruch–Mao multiplicity-one and existence theorem with the exact even/plus eigenline conventions; no uniqueness of a unit-phase vector is asserted.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/plus-hecke-basis`, `MetaplecticAutomorphicForms:MP.7/shimura-series-automorphy`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proposition 6 proof, [1]Theorem 1.2; excerpt at PDF 34. Literal excerpt: “bijection between Br and the even Hecke-Maass cusp forms ' with Laplace eigenvalue”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/126`.

**Suggested-signature boundary.** Carrier signature for eigenlines and normalized even level-one forms. Projectivized native submodules and the actual Maass category await suppliers; no unique phase-independent vector is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Extended trace formula for all discriminants

**Theorem.** `TauCeti.Metaplectic.shimura_extendedTrace`

Node: `MetaplecticAutomorphicForms:MP.7/extended-shimura-trace`.

For a normalized even φ and a unit ψ on its corresponding plus eigenline, T(φ,χ)=12√π|D|^(3/4)b_ψ(d′)conj(b_ψ(d)) for fundamental d, discriminant d′, D=d′d nonsquare. General negative D requires |D|^(3/4).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Identify the two spectral sides by eigenline multiplicity one.
2. Retain the norm denominator in the geometric trace and the 12sqrt(π)|D|^{3/4} factor.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/spectral-trace-identity`, `MetaplecticAutomorphicForms:MP.7/shimura-eigenline-bijection`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proposition 6, pp981–982; excerpt at PDF 33. Literal excerpt: “Proposition 6. For any even Hecke-Maass cusp form ' for             with”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/127`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Theorem 4 negative factors

**Theorem.** `TauCeti.Metaplectic.shimura_negativeTrace`

Node: `MetaplecticAutomorphicForms:MP.7/negative-factor-trace`.

Let φ(z)=2y^{1/2}Σ_{n≠0}a(n)K_{ir}(2π|n|y)e(nx) be an even Hecke–Maass cusp form for Γ=PSL(2,Z) with a(1)=1 and Laplace eigenvalue λ=1/4+r², and let F(z)=Σ_{n≡0, 1 (mod 4), n≠0} b(n)W_{sgn(n)/4, ir/2}(4π|n|y)e(nx) be the weight-1/2 form for Γ_0(4) of Theorem 4, with ⟨F,F⟩=∫_{Γ_0(4)\H}|F|²dμ=1 and b(dm²) given by m Σ_{n|m} n^{−3/2}(d/n) b(m²d/n²) = a(m)b(d) (F is unique only up to a unimodular constant). For coprime negative fundamental discriminants d′, d, D=d′d>0 and χ the genus character of D=d′d: 12√π D^{3/4} b(d′) conj(b(d)) = ⟨φ,φ⟩^{−1}(λ/2)Σ_{A∈Cl⁺(K)} χ(A)∫_{F_A}φ(z)dμ(z).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the negative-factor oriented differential trace.
2. Apply the corrected Stokes identity from the geometric owner to express it as the required surface integral.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/extended-shimura-trace`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 4, (5.16) first branch; excerpt at PDF 17. Literal excerpt: “Theorem 4. Let                                           X”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/128`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Theorem 4 positive factors

**Theorem.** `TauCeti.Metaplectic.shimura_positiveTrace`

Node: `MetaplecticAutomorphicForms:MP.7/positive-factor-trace`.

For coprime positive fundamental d,d′, 12√πD^(3/4)b(d′)conj(b(d))=||φ||⁻²Σ_Aχ(A)∫_{C_A}φds, with the same normalized φ and unit half-weight eigenline.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the scalar closed-cycle term in the extended trace identity.
2. Match the GN.3 length measure y^{-1}|dz| and the genus character.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/extended-shimura-trace`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 4, (5.16) second branch; excerpt at PDF 17. Literal excerpt: “Theorem 4. Let                                           X”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/129`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Theorem 4 CM factors

**Theorem.** `TauCeti.Metaplectic.shimura_cmTrace`

Node: `MetaplecticAutomorphicForms:MP.7/cm-trace`.

For coprime fundamental d,d′ of opposite sign, 12√π|D|^(3/4)b(d′)conj(b(d))=||φ||⁻²(2√π/ω_D)Σ_Aχ(A)φ(z_A). Keep both 2√π and ω_D; the paper explicitly corrects the earlier CM constant.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the CM-point term of the extended trace identity.
2. Match the inverse stabilizer weight and the factor2sqrt(π).

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/extended-shimura-trace`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 4, (5.16) third branch and footnote4; excerpt at PDF 17. Literal excerpt: “Theorem 4. Let                                           X”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/130`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Duke coefficient estimate with spectral factor

**Theorem.** `TauCeti.Metaplectic.halfWeight_dukeBound`

Node: `MetaplecticAutomorphicForms:MP.7/duke-coefficient-bound`.

For an L²-unit weight k=1/2 spectral cusp form on fixed Γ₀(4), eigenvalue1/4+t², its standard W coefficient at a fundamental discriminant n satisfies |b(n)|≪_ε(1+|t|)^C cosh(πt/2)|n|^(−2/7+ε). Here the half-weight form in Theorem 4 has t=r/2. The exponential factor is explicitly present in Duke88 Theorem 5. The bound is for unit Petersson norm; translating to the a(1)=1 lift keeps the norm and its spectral factor. No unverified r^ε symmetric-square estimate is imported.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Apply Duke’s original coefficient estimate to a unit Petersson vector.
2. For the a(1)=1 weight-zero normalization retain its norm/spectral conversion; only a proved polynomial spectral estimate is targeted.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.7/half-weight-kloosterman`, `MetaplecticAutomorphicForms:MP.7/plus-hecke-basis`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Duke88 Theorem 5 pp85–86; DIT16 (6.6); excerpt at PDF 20. Literal excerpt: “(6.6)                 Weyl(h', 'i 1 ', ) ⌧✏ rC |D|13/28+✏ ,”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/149`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Exact conjugation of the two U and W normalizations

**Theorem.** `TauCeti.Metaplectic.plusOperators_conjugation`

Node: `MetaplecticAutomorphicForms:MP.7/plus-normalization-conjugation`.

On functions on H let C f(z)=Im(z)^(1/4)f(z), U₄f(z)=¼Σ_{ν mod4}f((z+ν)/4), W₄f(z)=(2z/i)^(−1/2)f(−1/(4z)) with the principal square root. Then CU₄C⁻¹=U and CW₄C⁻¹=W for the U,W displayed in DIT16 p976, and C(U₄∘W₄)C⁻¹=U∘W. This calculation alone does not identify U∘W with W∘U on the automorphic subspace.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Compute the two positive y^{1/4} conjugations directly using Im((z+ν)/4)=y/4 and Im(−1/(4z))=y/(4|z|²).
2. Use arg(z/i)=arg(z)−π/2 to obtain exp(+iπ/4); preserve composition order.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** .

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, printed 976, PDF 28, U,W and footnote6; DIT11 §2 printed 959 PDF 13; literal excerpt PDF 28. Literal excerpt: “projection operator pr+ : Vr ! Vr+ defined by pr+ = 23 W U + 13 , where6                       p     3”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.
- [DIT11](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf), §2, printed 959, PDF 13; excerpt at PDF 13. Literal excerpt: “projection operator pr+ = 32 (U4 ◦W4 )+ 13 ,”. The old and new scalar conjugations preserve composition order.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/168`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Positive Fourier kernel and orthogonal complement

**Definition.** `TauCeti.Metaplectic.positiveFourierKernel`

Node: `MetaplecticAutomorphicForms:MP.7/positive-fourier-kernel`.

In the finite-dimensional fixed-eigenvalue plus cusp space W, let W₀=⋂_{n>0,n≡0, 1(4)}ker(b_n) and W₁=W₀⊥. Use W=W₀⊕W₁ with the inherited Petersson inner product. No hypothesis or conclusion W₀=0 is imposed.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Intersect kernels of positive admissible coefficient maps.
2. Take its orthogonal complement in the finite-dimensional Petersson space; do not assume the common kernel is zero.

**Uses determining the API.**

- PAPER-DUKE-IMAMOGLU-TOTH-16/182: Apply dual separation on W₁, where the common kernel is zero.
- PAPER-DUKE-IMAMOGLU-TOTH-16/184: Prove automorphy while allowing a nontrivial invisible kernel.

**API.**

- `TauCeti.Metaplectic.positiveFourierKernel_memKernel` (characterisation): Membership in W₀ means every positive admissible Fourier coefficient vanishes.
- `TauCeti.Metaplectic.positiveFourierKernel_orthogonalSplit` (constructor): Choose an orthonormal basis adapted to W₀⊕W₁ using finite dimensionality.
- `TauCeti.Metaplectic.positiveFourierKernel_liftZero` (compatibility): For positive fundamental D, the Biró lift is zero on W₀ because every DQ² index is positive and admissible.

**Discriminating tests.**

- `TauCeti.Metaplectic.positiveFourierKernel_test1` (computation): A three-dimensional model with coefficients(1,n, 0) has nonzero W₀=span(e₃).
- `TauCeti.Metaplectic.positiveFourierKernel_test2` (degenerate): If W₁=0, the positive-D lift is zero; the proof remains valid.
- `TauCeti.Metaplectic.positiveFourierKernel_test3` (non-example): Vanishing of positive coefficients alone must not be rewritten as vanishing of negative coefficients.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`, `MetaplecticAutomorphicForms:MP.7/kohnen-plus-space`.

**Source match.**

- [Biro00](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf), Proof of Theorem 1, printed 128–129, PDF 26–27; excerpt at PDF 26. Literal excerpt: “Theorem 1, Theorem 2 and its Corollary. Mul-”. Finite Fourier separation, preserving the positive-coefficient kernel.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/181`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Finite Fourier certificate with conjugated trace coefficients

**Theorem.** `TauCeti.Metaplectic.positiveFourier_finiteCertificate`

Node: `MetaplecticAutomorphicForms:MP.7/finite-fourier-certificate`.

For an orthonormal basis f₁,…,f_m of W₁, there exist m positive admissible indices n_i for which the matrix (conj(b_{f_j}(n_i))) is invertible. This uses all positive admissible coefficients, not only fundamental indices.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use separation of W₁ by the coefficient linear functionals.
2. Choose finitely many indices whose coefficient matrix has rank dim W₁; solve the dual system with the conjugated trace coefficients.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/positive-fourier-kernel`.

**Source match.**

- [Biro00](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf), Proof of Theorem 1, printed 128–129, PDF 26–27; excerpt at PDF 26. Literal excerpt: “Theorem 1, Theorem 2 and its Corollary. Mul-”. Finite Fourier separation, preserving the positive-coefficient kernel.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/182`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Automorphy from finite Fourier separation

**Theorem.** `TauCeti.Metaplectic.shimura_finiteFourierAutomorphy`

Node: `MetaplecticAutomorphicForms:MP.7/finite-fourier-automorphy`.

Assume the convergent Biró lift and identity183 for every positive admissible n. Then each Sh_D f is a level-one weight-zero cusp eigenform at parameter r (possibly zero), for every f∈W. If D>0 the coefficient formula is even in the Fourier index, so the lift is even.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Build the finite trace combination from that certificate.
2. The candidate’s difference has all separating coefficients zero, so vanishes on W₁; on W₀ the positive-D lift is already zero.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/positive-fourier-kernel`, `MetaplecticAutomorphicForms:MP.7/finite-fourier-certificate`.

**Source match.**

- [Biro00](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf), Proof of Theorem 1, printed 128–129, PDF 26–27; excerpt at PDF 26. Literal excerpt: “Theorem 1, Theorem 2 and its Corollary. Mul-”. Finite Fourier separation, preserving the positive-coefficient kernel.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/184`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Coefficients of the weight-1/2 plus-space Eisenstein series (black box from [16])

**Theorem.** `TauCeti.Metaplectic.halfWeightEisenstein_dit11`

Node: `MetaplecticAutomorphicForms:MP.7/dit11-eisenstein-comparison`.

In the notation of DIT11 ([16]): for m∈Z⁺ and D a fundamental discriminant, Σ_{n|m}(D/n) b_0(Dm²/n², s) = 2^{2−4s}π^{s+1/4}m^{3/2−2s}|D|^{s−1/4}σ_{4s−2}(m)L_D(2s−1/2)/ζ(4s−1), and b_0(0,s)=π^{1/2}2^{5/2−6s}Γ(2s)ζ(4s−2)/ζ(4s−1), where b_0(n,s) are the Fourier coefficients of P⁺_0(τ,s) in [16, (2.20)–(2.21)]. Consequently E*_{1/2}(z,s) = 2^sΛ(2s) y^{1/4} P⁺_0(z, s/2+1/4) has the expansion displayed on DIT16 p964, with b(d,s)=(4π)^{−1/4}|d|^{−3/4}Λ(s,χ_d) for fundamental d and the stated Shimura relation.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the normalized half-weight Fourier expansion and compare the exact source formula.
2. Import the ordinary Dirichlet/spectral input from its supplier; retain the stated pole, Gamma and Fourier conventions.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), DIT11 Lemma 4, (2.23)–(2.25), pp961–962; used for the E*_{1/2} display, DIT16 p964, which cites only [16, Prop. 2 p. 959]; excerpt at PDF 16. Literal excerpt: “Then it follows from [16, Prop. 2 p. 959] that”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/dit11-lemma4-weight-half-eisenstein-coefficients`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Fourier expansion and residues of the weight-1/2 resolvent (Fay, cited)

**Theorem.** `TauCeti.Metaplectic.halfWeightResolvent_fourier`

Node: `MetaplecticAutomorphicForms:MP.7/resolvent-fourier-comparison`.

Let Re(s)>1 and Im z′>Im z, with z in reduced position. Then G_{1/2}(z′,z; s)=Σ_{n≠0}F_{1/2,n}(z,s)W_{sgn(n)/4,s−1/2}(4π|n|y′)e(−nx′) plus the n=0 (Eisenstein) term, with F_{1/2,n} as in (8.6). G_{1/2} continues meromorphically in s, and Res_{s=1/2+ir/2}(2s−1)G_{1/2}(z′,z; s)=Σ_ψ conj(ψ(z′))ψ(z) over an orthonormal basis of V_r. By Fay [20, Cor. 3.6, p.178], Φ⁺(n,d; s) continues meromorphically to all s.

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the normalized half-weight Fourier expansion and compare the exact source formula.
2. Import the ordinary Dirichlet/spectral input from its supplier; retain the stated pole, Gamma and Fourier conventions.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, pp.975–977, citing Fay [20, Thm 3.1] and footnote 5; Fay Cor. 3.6 p.178; excerpt at PDF 27. Literal excerpt: “Fay [20] (see also [43]). It satisfies”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/resolvent-fourier-expansion-weight-half`.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Shimura Dirichlet-series identity for ψ∈B_r

**Theorem.** `TauCeti.Metaplectic.shimura_dirichletSeries`

Node: `MetaplecticAutomorphicForms:MP.7/shimura-dirichlet-series`.

Let ψ∈B_r have coefficients b(n) as in (10.1), and let d be a fundamental discriminant. Then L_d(s+1/2)Σ_{n≥1}b(dn²)n^{1−s}=b(d)Π_p(1−a_ψ(p)p^{−s}+p^{−2s})⁻¹, where L_d(s)=L(s,χ_d)=Σ_{n≥1}(d/n)n^{−s} and a_ψ(p) is the T_{p²}-eigenvalue. Comparing coefficients gives mΣ_{n|m}n^{−3/2}(d/n)b(m²d/n²)=a_ψ(m)b(d) (item 122).

**Hypotheses.** Native upper half plane; Γ₀(4) unitary theta multiplier; exact DIT16/DIT11 normalization and every numerical/range hypothesis in the statement. For spectral residue formulas r>0 and an orthonormal Petersson basis; three-cusp boundary conditions are retained.

**Construction or proof route.**

1. Use the normalized half-weight Fourier expansion and compare the exact source formula.
2. Import the ordinary Dirichlet/spectral input from its supplier; retain the stated pole, Gamma and Fourier conventions.

**Acceptance.**

- Conjugation, sign, residue coordinate and norm factors must match the displayed statement; all supplier proof gates stay visible.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §10, p.981 (display after (10.1)); excerpt at PDF 33. Literal excerpt: “(10.2)                       (1    a (p)p s + p 2s ) 1 =                              a (n)n s”. Read DIT16 passage, using its reviewed normalization corrections and the stated supplier boundaries.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/shimura-dirichlet-series-identity`.

**Suggested-signature boundary.** Infinite prime Euler product in its source convergence half-plane. The actual quadratic Dirichlet L-function, eigenform coefficients and p=2 operator remain packet hypotheses.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Geometric trace

**Definition.** `TauCeti.Metaplectic.geometricTrace`

Node: `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

For an even Hecke–Maass cusp form φ, fundamental d, discriminant d′ and nonsquare D=d′d, define T(φ,χ)=||φ||⁻²Σ_{Q∈Γ\Q_D}χ(Q)Y_Q. Here Y_Q=2sqrt(π)ω_Q⁻¹φ(z_Q) for D<0, ∫C_Qφ y⁻¹|dz| for d,d′>0, and ∫C_Q i∂_zφ dz for d,d′<0, with the corrected z→γ_Qz orientation. The sums and cycles are the supplied arithmetic geometric objects; for odd φ the paired trace vanishes.

**Hypotheses.** Nonzero actual cusp eigenform so ||φ||²>0; the genus character on possibly imprimitive forms; invariant cycle/stabilizer conventions.

**Construction or proof route.**

1. Import CM points, closed cycles and genus characters from GN.2–3.
2. Form their finite genus-weighted pairing with the actual scalar or differential integrand.
3. Divide by the fixed Petersson norm; use Q↦[a,−b,c] for odd parity.

**Uses determining the API.**

- DIT Proposition 6 and Theorem 4: Name the geometric output in the spectral and individual trace formulas.

**API.**

- `TauCeti.Metaplectic.geometricTrace_cm` (simp): The negative-D branch is the inverse-stabilizer weighted CM value sum.
- `TauCeti.Metaplectic.geometricTrace_cycle` (simp): The two positive-D branches use scalar length integration or the oriented weight-two differential.
- `TauCeti.Metaplectic.geometricTrace_odd` (compatibility): An odd eigenfunction has zero genus-weighted trace.

**Discriminating tests.**

- `TauCeti.Metaplectic.geometricTrace_scale` (computation): For nonzero a, T(aφ)=T(φ)/conjugate(a).
- `TauCeti.Metaplectic.geometricTrace_oddTest` (non-example): Odd parity gives zero rather than a spurious Shimura-plus coefficient.
- `TauCeti.Metaplectic.geometricTrace_norm` (compatibility): At Petersson norm 1 the norm denominator is1; at other norms it is retained.

**Acceptance.**

- Multiplying φ by a nonzero scalar changes its trace by the expected inverse conjugate scalar, rather than leaving the norm-normalized trace unchanged.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/three-case-poincare-identity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `AutomorphicSpectralTheory:AS.0`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §10 geometric trace display preceding Proposition 6, printed 981, PDF 33; literal excerpt PDF 33. Literal excerpt: “It is convenient to define                                       8 p                                       >”. The three-case norm-normalized trace used by the spectral identity.

**Routed items.** `PAPER-DUKE-IMAMOGLU-TOTH-16/geometric-trace-T`.

**Suggested-signature boundary.** Norm-denominator fragment with rawTrace the actual genus-weighted CM/oriented-cycle/core integral. The geometric definitions belong to GN.3/Fuchsian PartII and their three branch constants are stated in the packet.

**Explicit proof/signature refinements.**

- The actual arithmetic cycle, genus character and differentiable Maass carriers are GN/AS inputs. Generic geometric construction and the Stokes core remain with their owners.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Biró lift

**Construction.** `TauCeti.Metaplectic.biroLift`

Node: `MetaplecticAutomorphicForms:MP.7/biro-shintani-lift`.

For Γ₀(4N), N odd, take a half-weight Maass cusp form f with eigenvalue −1/4−t²<−3/16 in Biró’s negative-Laplacian convention and positive discriminant D. Define Sh_Df by the source kernel and positive Fourier coefficients Σ_{PQ=k,P>0,(N,P)=1}|Q|^{1/2}P⁻¹(D/P)b_f(DQ²). It is an automorphic weight-zero cusp form at parameter2t; for odd N use the stated plus-space domain, while the even-level variant has its separately stated domain.

**Hypotheses.** Biró Theorem 1 exact level/domain and spectral range; the Whittaker normalization is that paper’s own convention, compared explicitly with DIT16.

**Construction or proof route.**

1. Read the integral kernel as an actual automorphic pairing and compute its unfolded Fourier coefficients.
2. Use the finite coefficient certificate to recover its modular transformation.
3. Repair the convergence argument by Vitali on a positive interval with an interior accumulation point, not convergence at one point.

**Uses determining the API.**

- DIT §10 finite Fourier automorphy argument: Supply the original theorem and its normalization comparison.

**API.**

- `TauCeti.Metaplectic.biroLift_coeff` (simp): The positive k coefficient is the displayed divisor expression.
- `TauCeti.Metaplectic.biroLift_spectral` (compatibility): Half-weight parameter t gives weight-zero parameter2t in the negative Laplacian convention.
- `TauCeti.Metaplectic.biroLift_kernel` (characterisation): The positive-coefficient common kernel maps to zero for positive D.

**Discriminating tests.**

- `TauCeti.Metaplectic.biroLift_zero` (degenerate): Zero f has zero lift.
- `TauCeti.Metaplectic.biroLift_kernelTest` (non-example): A nonzero vector in W₀ is invisible to positive-D lifts.
- `TauCeti.Metaplectic.biroLift_parameter` (computation): The output spectral term is (2t)², rather than t².

**Acceptance.**

- Positive-D coefficients vanish on W₀; no assertion W₀=0 is made.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/positive-fourier-kernel`, `MetaplecticAutomorphicForms:MP.7/finite-fourier-certificate`, `MetaplecticAutomorphicForms:MP.7/finite-fourier-automorphy`, `AutomorphicSpectralTheory:AS.0`, `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Source match.**

- [Biro00](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf), §1 and Theorem 1, printed 105–106, PDF 3–4; proof128–129, PDF 26–27; excerpt at PDF 4. Literal excerpt: “Theorem 1. If f ∈ V1/2     (4N ) is a cusp form with ∆1/2 -eigenvalue”. Lift, spectral rescaling and finite Fourier proof with repaired Vitali argument.

**Suggested-signature boundary.** This is a native signature fragment. The full source hypotheses and missing supplier carriers remain mandatory in the packet; no theorem for arbitrary choices of the displayed parameters is claimed.

**Explicit proof/signature refinements.**

- The intervening kernel proof and cited Iwaniec/Whittaker theorems are not fully read. The checked theorem and finite Fourier argument are retained; the false one-point convergence sentence is corrected explicitly.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Adelic and classical half-weight comparison

**Theorem.** `TauCeti.Metaplectic.halfWeight_adelicClassical`

Node: `MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight`. Planet: **Half integral weight forms**.

For the actual rank-one adelic cover and a specified finite-level genuine vector, evaluate along the real Iwasawa section over H to obtain a classical half-integral-weight form with its theta multiplier. Conversely adelize a classical form with the compatible congruence/character and cusp conditions. The comparison intertwines right Hecke actions and matches the positive Fourier e(nx), chosen Whittaker normalization, and the y^{k/2} holomorphic-to-unitary weight change. At weight 1/2 the conjugated Laplacian is Δ_unit, 1/2=y^{1/4}Δ_hol, 1/2 y^{−1/4}+3/16.

**Hypotheses.** Rank-one genuine central sign, specified K-weight and finite-level splitting; exact classical multiplier/character; archimedean and all-cusp growth conditions.

**Construction or proof route.**

1. Compute the real cover section and its cocycle, then compare with the nonvanishing theta multiplier.
2. Use rational and finite-level invariance to establish the classical slash law and the inverse adelization.
3. Compare Fourier coefficients, Petersson measure, Hecke double cosets and the explicit differential conjugation.

**Acceptance.**

- The half-weight unitary Laplace eigenvalue is1/4+(r/2)².

**Prerequisites.** `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`, `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`, `MetaplecticAutomorphicForms:MP.7/theta-multiplier`, `MetaplecticAutomorphicForms:MP.7/half-weight-maass-space`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.2`, `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

**Source match.**

- [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5(5.14)–(5.16), PDF 16–17; §8, PDF 27–29; excerpt at PDF 16. Literal excerpt: “(5.14)                         J( , z) =                         for       2   0 (4).”. Classical multiplier and Fourier/spectral conventions; full adelization proof is a gap.

**Suggested-signature boundary.** Equivalence target only, between the actual compatible finite-level genuine adelic and classical spaces. The Iwasawa/multiplier/Whittaker/Laplacian matching conditions are omitted until their native suppliers arrive.

**Explicit proof/signature refinements.**

- The full adelization equivalence and metaplectic Hecke comparison need an exact original proof source. QM.3 owns the holomorphic-weight Laplacian; its concrete conjugacy, not an identical formula, supplies this comparison.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### BFH metaplectic kernel interface

**Comparison.** `TauCeti.Metaplectic.bfh_halfWeightKernelComparison`

Node: `MetaplecticAutomorphicForms:MP.7/bfh-kernel-import`.

Import the genuine genus-two BFH kernel, its theta components, two-cusp Whittaker expansions, actual local test vectors and unramified Euler-factor ratio from MP.8. Its normalized Siegel parameter is s−2 and its original newform conductor is M, while the auxiliary arithmetic level is N. MP.7 supplies the common multiplier/Fourier conventions and compares their restriction with the rank-one half-weight theory; BSD.2 consumes MP.8/bsd2-export and owns the final twist nonvanishing argument.

**Hypotheses.** MP.8 exact arithmetic datum: even weightk≥2, trivial character, 8M|N,N|m, 4m|N²; vector-valued K-type and specified two-cusp transforms.

**Construction or proof route.**

1. Use the read BFH §1 theta-component construction to identify the common Jacobi/finite Weil interfaces.
2. Import the existing MP.8 declarations rather than reconstruct the GSp₄ cover or its Eisenstein proof.
3. Match the sign, Whittaker and local factor conventions before passing the supplier’s explicit export to BSD.2.

**Acceptance.**

- The rank-one comparison does not supply the genus-two similitude double cover.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight`, `MetaplecticAutomorphicForms:MP.6/jacobi-theta-decomposition-interface`, `MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein`, `MetaplecticAutomorphicForms:MP.8/theta-decomposition`, `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`, `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`, `MetaplecticAutomorphicForms:MP.8/bsd2-export`.

**Source match.**

- [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §1 construction printed 549, PDF 8; §2 Proposition 2.2 printed 552, PDF 11. Literal excerpt: “convergent for re(s) sufficiently large”. Visual transcription. Initial Jacobi Eisenstein construction and finite components; subsequent analytic kernel results are supplied by MP.8, not claimed read here.

**Suggested-signature boundary.** Comparison signature for the MP.8 supplied BFH specialization; no new genus-two kernel is defined here. The exact restriction datum and parameter s−2/newform M versus auxiliary N are required.

**Explicit proof/signature refinements.**

- BFH proofs after printed 553 and its local Whittaker/Euler computations were not read in this run. They are supplied as planned MP.8 nodes with their own open proof gates, not promoted to checked results.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

### Ramified quadratic-twist kernel inputs

**Comparison.** `TauCeti.Metaplectic.quadraticTwist_kernelInputs`

Node: `MetaplecticAutomorphicForms:MP.7/ramified-quadratic-twist-kernel-inputs`.

For the BFH route, export the supplier’s actual ramified local character/test-vector integrals and nonzero finite K-type tests together with its normalized Euler factors. For the separate Friedberg–Hoffstein route, require the original kernel, its exact level/character restrictions, each ramified and dyadic integral, and its Fourier coefficient comparison before an identification with this common interface is asserted. The unavailable original FH kernel formula is an explicit source gap; no generic formal half-weight symbol is used in its place.

**Hypotheses.** A specified original paper route and actual newform/local vectors; original character and conductor hypotheses must be collated. No all-local-condition nonvanishing theorem is concluded here.

**Construction or proof route.**

1. Import the read MP.8 local test-vector contracts for the BFH specialization.
2. Match finite additive and quadratic characters and their conductor-dependent Haar factors.
3. For FH95, acquire and read the original construction, then prove its adapter; until then keep that target’s exact statement/proof boundary as the recorded gap.

**Acceptance.**

- Unramified Euler identities alone do not establish a ramified/dyadic local input.

**Prerequisites.** `MetaplecticAutomorphicForms:MP.8/bsd2-export`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`, `MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight`, `AutomorphicLFunctionsAndLocalFactors:AL.0`, `RankZeroOneBSD:BSD.2`.

**Source match.**

- [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §1 quadratic-twist completion, printed 551, PDF 10. Literal excerpt: “provided gcd(M, D) = 1”. Visual transcription. This condition gates the printed functional equation; ramified adaptations remain a BSD.2/source request.

**Suggested-signature boundary.** BFH local-factor export signature only. The separate unavailable FH95 original kernel is an explicit source gap; this signature does not identify that unread kernel with BFH.

**Explicit proof/signature refinements.**

- FH95 full public mathematical text was not obtained: only the publisher metadata was read. Its exact kernel/ramified-local adapter remains to be stated after acquisition. This records the missing MP.7 target explicitly instead of claiming the BFH family proves it.

Proposed module: `TauCeti/RepresentationTheory/Metaplectic/Stage7`. Implementation: unchecked.

## Supplier requests

### `AutomorphicLFunctionsAndLocalFactors:AL.0`

PartII: finite-dimensional local and adelic Schwartz–Bruhat spaces, the full joint archimedean Schwartz/Fréchet space (and completed tensor comparison), distributions/oscillatory Fourier transforms, self-dual determinant/covolume laws, Gaussian and ideal-lattice Poisson, compact Fourier completeness and Schwartz integration. The existing scalar AL.0 nodes are retained, not duplicated.

Needed by: `MetaplecticAutomorphicForms:MP.0/heisenberg-haar`; `MetaplecticAutomorphicForms:MP.0/schroedinger-model`; `MetaplecticAutomorphicForms:MP.0/hilbert-schroedinger`; `MetaplecticAutomorphicForms:MP.2/weil-index`; `MetaplecticAutomorphicForms:MP.3/theta-coefficient-rationality`; `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`; `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`; `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`; `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`; `MetaplecticAutomorphicForms:MP.7/fundamental-eisenstein-coefficient`; `MetaplecticAutomorphicForms:MP.7/biro-shintani-lift`; `MetaplecticAutomorphicForms:MP.7/ramified-quadratic-twist-kernel-inputs`.

### `SmoothRepresentationsOfLocalGroups:SR.2`

Smooth compact/normalized parabolic induction, Jacquet modules, Frobenius reciprocity and geometric lemma with precise support, coefficient and modulus hypotheses. MP supplies the cover/Weil-character adapters and rank filtrations.

Needed by: `MetaplecticAutomorphicForms:MP.0/induced-schroedinger`; `MetaplecticAutomorphicForms:MP.3/big-theta-module`; `MetaplecticAutomorphicForms:MP.3/theta-finite-length`; `MetaplecticAutomorphicForms:MP.3/howe-duality`; `MetaplecticAutomorphicForms:MP.3/local-see-saw`; `MetaplecticAutomorphicForms:MP.3/persistence-and-stable-range`; `MetaplecticAutomorphicForms:MP.3/supercuspidal-first-occurrence`; `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`; `MetaplecticAutomorphicForms:MP.3/doubling-filtration`; `MetaplecticAutomorphicForms:MP.3/type-ii-theta`; `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`; `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`; `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`.

### `AutomorphicFormsOnReductiveGroups:AF.1`

Real smooth-vector/Fréchet/globalization and Sobolev-differentiation carriers; archimedean theta module category. MP proves its Heisenberg/finite-cover comparison before importing these.

Needed by: `MetaplecticAutomorphicForms:MP.0/smooth-vectors`; `MetaplecticAutomorphicForms:MP.3/theta-finite-length`; `MetaplecticAutomorphicForms:MP.3/local-see-saw`; `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`; `MetaplecticAutomorphicForms:MP.3/archimedean-conservation`; `MetaplecticAutomorphicForms:MP.3/unitary-doubling-dichotomy`; `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`; `MetaplecticAutomorphicForms:MP.3/real-discrete-series-theta`; `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`; `MetaplecticAutomorphicForms:MP.6/jacobi-spaces`; `MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight`; `MetaplecticAutomorphicForms:MP.3/howe-duality`.

### `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`

Native smooth representation abelian category and its coinvariants/duals/smooth-vector carriers; identify the full smooth central-character category needed for Stone–von Neumann, not just finite-dimensional operators. Native algebraic Coinvariants are reused.

Needed by: `MetaplecticAutomorphicForms:MP.0/smooth-vectors`; `MetaplecticAutomorphicForms:MP.3/big-theta-module`; `MetaplecticAutomorphicForms:MP.3/small-theta-module`; `MetaplecticAutomorphicForms:MP.3/theta-finite-length`; `MetaplecticAutomorphicForms:MP.3/local-see-saw`; `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`; `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`; `MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`

Reuse native orthogonal/symplectic groups and defining actions. PartII: Hermitian/quaternionic and connected similitude carriers and tensor double-centralizer comparison needed by the stated dual pairs.

Needed by: `MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair`; `MetaplecticAutomorphicForms:MP.3/unitary-splitting`; `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`.

### `SmoothRepresentationsOfLocalGroups:SR.3`

Admissibility, finite length, smooth dual, supercuspidal/tempered and finite semisimple quotient interfaces in complex smooth modules. Supply MVW and Mínguez scope via their original proofs; MP owns only the cover/theta-specific comparisons.

Needed by: `MetaplecticAutomorphicForms:MP.3/small-theta-module`; `MetaplecticAutomorphicForms:MP.3/theta-finite-length`; `MetaplecticAutomorphicForms:MP.3/howe-duality`; `MetaplecticAutomorphicForms:MP.3/persistence-and-stable-range`; `MetaplecticAutomorphicForms:MP.3/supercuspidal-first-occurrence`; `MetaplecticAutomorphicForms:MP.3/kudla-jacquet-filtration`; `MetaplecticAutomorphicForms:MP.3/doubling-filtration`; `MetaplecticAutomorphicForms:MP.3/type-ii-theta`; `MetaplecticAutomorphicForms:MP.3/mvw-and-cover-induction`; `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`; `MetaplecticAutomorphicForms:MP.3/unitary-equal-almost-equal-rank`; `MetaplecticAutomorphicForms:MP.3/mp-odd-orthogonal-unramified`; `MetaplecticAutomorphicForms:MP.3/rallis-unramified-satake`; `MetaplecticAutomorphicForms:MP.3/unitary-hecke-compatibility`; `MetaplecticAutomorphicForms:MP.1/smooth-stone-von-neumann`; `MetaplecticAutomorphicForms:MP.3/similitude-theta-howe`; `MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta`; `MetaplecticAutomorphicForms:MP.3/gl2-gso4-theta`; `MetaplecticAutomorphicForms:MP.3/minimal-orthogonal-theta`; `MetaplecticAutomorphicForms:MP.3/pgsp6-pgso8-similitude-theta`.

### `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`

Use the existing Hilbert/Hasse identity layer, including R and dyadic fields, signed quadratic vs polar determinant. PartII: exact Hermitian and quaternionic trace-norm/global coherent-collection classification adapters; analytic Weil index and its global Poisson product stay with MP.

Needed by: `MetaplecticAutomorphicForms:MP.3/first-occurrence`; `MetaplecticAutomorphicForms:MP.3/nonarchimedean-conservation`; `MetaplecticAutomorphicForms:MP.2/weil-index-identities`; `MetaplecticAutomorphicForms:MP.1/rao-factor-set`; `MetaplecticAutomorphicForms:MP.3/quaternionic-similitude-datum`; `MetaplecticAutomorphicForms:MP.3/quaternionic-splitting`; `MetaplecticAutomorphicForms:MP.3/quaternionic-first-doubled-splitting`; `MetaplecticAutomorphicForms:MP.3/periods-i-comparison`; `MetaplecticAutomorphicForms:MP.3/division-ternary-theta`; `MetaplecticAutomorphicForms:MP.4/global-weil-index-product`; `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`; `MetaplecticAutomorphicForms:MP.6/pi-coherence-parity`; `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`; `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-general-transform`.

### `ModularityAndLanglandsExtensions:ML.4`

Exact local Langlands/Jacquet–Langlands/Satake normalization used by the classical similitude theta comparisons; exceptional G₂ parameters remain at their separate proposed owner.

Needed by: `MetaplecticAutomorphicForms:MP.3/unitary-equal-almost-equal-rank`; `MetaplecticAutomorphicForms:MP.3/division-ternary-theta`; `MetaplecticAutomorphicForms:MP.3/pgsp6-pgso8-similitude-theta`.

### `AdelicAlgebraicGroups:AA.2`

PartII: disconnected orthogonal Haar/Tamagawa component and O(1) and split O(1,1) normalizations; connected reductive Tamagawa results cannot directly supply this.

Needed by: `MetaplecticAutomorphicForms:MP.3/rallis-unramified-satake`; `MetaplecticAutomorphicForms:MP.3/unitary-hecke-compatibility`; `MetaplecticAutomorphicForms:MP.3/quaternionic-unramified-theta`; `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`; `MetaplecticAutomorphicForms:MP.6/anisotropic-siegel-weil`; `MetaplecticAutomorphicForms:MP.6/first-term-identity`.

### `AutomorphicLFunctionsAndLocalFactors:AL.2`

Native quadratic Dirichlet completed L-functions and special-function Gamma normalization, local epsilon factors and their character/measure conventions; MP compares its coefficients to these functions.

Needed by: `MetaplecticAutomorphicForms:MP.2/hermitian-operator-normalizations`.

### `AdelicAlgebraicGroups:AA.1`

Finite-dimensional local/adelic groups, restricted products, quotients and actual Haar/Fubini integration with topological assumptions, including unipotent compact probability quotients and covered-group comparison.

Needed by: `MetaplecticAutomorphicForms:MP.4/adelic-metaplectic-cover`; `MetaplecticAutomorphicForms:MP.5/metaplectic-constant-and-whittaker`; `MetaplecticAutomorphicForms:MP.5/theta-integral-convergence`; `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`; `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`; `MetaplecticAutomorphicForms:MP.6/unitary-siegel-weil-measure`; `MetaplecticAutomorphicForms:MP.7/theta-residue-normalization`; `MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface`.

### `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules`

Reuse the finite quadratic module as native QuadraticMap Z A (AddCircle (1:Q)), its half-norm convention and discriminant pairing. Supply a checked Lean carrier bridge before MP’s finite Weil action; do not re-plan the completed lattice arithmetic.

Needed by: `MetaplecticAutomorphicForms:MP.4/finite-weil-representation`; `MetaplecticAutomorphicForms:MP.6/jacobi-theta-decomposition-interface`; `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`.

### `GeometricSatakeAndFusion:GS3`

PartII: metaplectic gerbe/twisted Satake, coherent fusion and modified dual-group construction required by Lafforgue §14. Ordinary fusion is imported from its exact existing node.

Needed by: `MetaplecticAutomorphicForms:MP.4/function-field-metaplectic-programme`.

### `GlobalShtukasAndFunctionFieldLanglands:GS.5`

PartII: metaplectic shtuka sheaves and modified excursion operators with exact conditionality. Ordinary excursion operators are imported; Lafforgue §14 is a programme, not full theorem proof.

Needed by: `MetaplecticAutomorphicForms:MP.4/function-field-metaplectic-programme`.

### `AutomorphicFormsOnReductiveGroups:AF.2`

Finite-level K/Z-finiteness and the all-derivatives single-exponent uniform-growth API. Verify the theta seminorm estimate and finite-cover height transfer before applying the linear-group result.

Needed by: `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`; `MetaplecticAutomorphicForms:MP.7/shimura-eigenline-lift`; `MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight`.

### `AutomorphicFormsOnReductiveGroups:AF.3`

Actual continuous/smooth compact unipotent fibre integrals and cusp decay on Siegel sets modulo the split center with unitary central character; regularized/projection interchanges require MP-specific proofs.

Needed by: `MetaplecticAutomorphicForms:MP.5/genuine-automorphic-spaces`; `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`; `MetaplecticAutomorphicForms:MP.7/biro-shintani-lift`.

### `AdelicAlgebraicGroups:AA.3`

Rational lattice counting and differentiated Schwartz majorants on the stated adelic Siegel sets/height. Supply the connected-group estimate; MP compares the finite cover and disconnected orthogonal components.

Needed by: `MetaplecticAutomorphicForms:MP.5/global-theta-lift`; `MetaplecticAutomorphicForms:MP.5/theta-integral-convergence`; `MetaplecticAutomorphicForms:MP.5/unit-quotiented-theta`.

### `AutomorphicSpectralTheory:AS.1`

Normalized induced section spaces and source-qualified initial Eisenstein convergence chambers/majorants; MP must prove the genuine-cover comparison and preserve parameter/measure conventions.

Needed by: `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`; `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`; `MetaplecticAutomorphicForms:MP.7/half-weight-eisenstein`; `MetaplecticAutomorphicForms:MP.5/genuine-eisenstein-family`.

### `AutomorphicSpectralTheory:AS.2`

Meromorphic normalized intertwining/constant-term/functional-equation families and Laurent/residue topology; supply only after the exact cover adaptation, never an unqualified linear reductive theorem.

Needed by: `MetaplecticAutomorphicForms:MP.5/regularized-theta-integral`; `MetaplecticAutomorphicForms:MP.6/siegel-weil-section`; `MetaplecticAutomorphicForms:MP.6/second-term-identity`; `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`; `MetaplecticAutomorphicForms:MP.5/genuine-eisenstein-family`.

### `GeometryOfNumbersAndQuadraticArithmetic:GN.3`

Ideal norm/class and trace-dual arithmetic, ramified ideal classes, CM stabilizers and the oriented z→γ_Qz closed-cycle dictionary. The binary theta construction stays with MP. This is a request for additional arithmetic supplier nodes, not a claim that the present GN.3 packet supplies them. Its theta-lattice-coefficient-interface imports MP.5 and cannot be an input here; the maintainer must route a precise independent arithmetic extension/Part II and replace the broad stage edges.

Needed by: `MetaplecticAutomorphicForms:MP.5/unit-quotiented-theta`; `MetaplecticAutomorphicForms:MP.5/ideal-class-theta`; `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-modularity`; `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-conjugation`; `MetaplecticAutomorphicForms:MP.6/ideal-lattice-poisson`; `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-general-transform`; `MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding`; `MetaplecticAutomorphicForms:MP.7/cm-poincare-sum`; `MetaplecticAutomorphicForms:MP.7/positive-cycle-poincare-sum`; `MetaplecticAutomorphicForms:MP.7/positive-factor-trace`; `MetaplecticAutomorphicForms:MP.7/cm-trace`; `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

### `AutomorphicSpectralTheory:AS.0`

Actual unbounded three-cusp Laplacian domain, multiplier Hilbert resolvent, finite-rank spectral residues and their coefficient/interchange estimates. Ordinary weight-zero Poincaré/resolvent and finite-dimensional spectral input remain here; MP proves the half-weight adaptation.

Needed by: `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`; `MetaplecticAutomorphicForms:MP.7/half-weight-resolvent`; `MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding`; `MetaplecticAutomorphicForms:MP.7/cm-poincare-sum`; `MetaplecticAutomorphicForms:MP.7/positive-cycle-poincare-sum`; `MetaplecticAutomorphicForms:MP.7/spectral-trace-identity`; `MetaplecticAutomorphicForms:MP.7/geometric-trace`; `MetaplecticAutomorphicForms:MP.7/biro-shintani-lift`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`

Classical weight/character and all-cusp holomorphy carrier for binary weight1 and half-weight adelization; the genuine multiplier/cocycle comparison is MP’s addition.

Needed by: `MetaplecticAutomorphicForms:MP.5/ideal-class-theta-modularity`; `MetaplecticAutomorphicForms:MP.7/adelic-classical-half-weight`.

### `GeometryOfNumbersAndQuadraticArithmetic:GN.2`

Invariant genus characters χ_d on possibly imprimitive binary forms, including discriminant/conductor/parity at2; MP owns only the finite oscillator/Kohnen sum adapter. The current GN.2 lattice/genus nodes do not state this binary genus-character and extended Kronecker API; route its missing arithmetic extension and then cite exact nodes.

Needed by: `MetaplecticAutomorphicForms:MP.7/quadratic-root-weyl-sum`; `MetaplecticAutomorphicForms:MP.7/weight-two-cycle-unfolding`; `MetaplecticAutomorphicForms:MP.7/geometric-trace`.

### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order`

Import the level-one orbifold geometry and the proposed FuchsianOrbifolds PartII arithmetic Nielsen-core/Stokes extension from the DIT16 routing. MP must not duplicate core surfaces or generic cycle geometry.

Needed by: `MetaplecticAutomorphicForms:MP.7/negative-factor-trace`.

### `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`

Extend the I-Bessel API with differentiated bounds locally uniform for complex order ν=2s−1 in the Re(s)>1 half-plane. The existing real-order bound is not this complex-parameter estimate.

Needed by: `MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient`.

### `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`

Extend the J-Bessel API with the locally uniform complex-order small-argument and differentiated cycle-integral estimates. Import the existing series/ODE carrier; no second Bessel definition is planned.

Needed by: `MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient`; `MetaplecticAutomorphicForms:MP.7/negative-cycle-poincare-sum`.

### `AutomorphicSpectralTheory:AS.0/dit-112`

Export the displayed M/W positive-real normalization and continued parameter domains; refine the compact-parameter derivative/endpoint estimates needed by the half-weight Fourier and Poincaré adapters. DIT11 Appendix A gives fixed-parameter asymptotics, not unrestricted uniform estimates.

Needed by: `MetaplecticAutomorphicForms:MP.7/half-weight-poincare`; `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`.


## Source versions and reading boundaries

Dates and hashes identify the material read for this planning pass. An extraction’s prior reading and correction search are provenance, not a claim of full reading here. A cited theorem whose proof was not read remains a recorded gap.

### Kudla96

[Notes on the local theta correspondence](https://www.math.utoronto.ca/skudla/castle.pdf) — Stephen S. Kudla. Unpublished author notes; introduction dated July 6, 1996; 110-page author copy

SHA-256: `800ed01b22fa6104a3292a8b2ef124cd69781a6904f626f71fcf2a30a9af8cdd`. Read: 2026-10-07.

- PDF 3–84 read; I.1–6, II–III local statements/operators/filtrations and IV.1 see-saw examples/adjunction route checked. PDF 85–110 unread. Referenced MVW and other original proofs remain unread.

### Weil64

[Sur certains groupes d’opérateurs unitaires](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf) — André Weil. Acta Mathematica 111 (1964), 143–211; published scan, DOI 10.1007/BF02391012

SHA-256: `22df47cb98307aa77c46028cf5575eeb1d3524950dbdadb9c0c21890966039d2`. Read: 2026-10-07.

- PDF 1–63, printed 143–205 read, including quadratic Fourier scalar, local charts, II.§30 product formula and III.§41 Theorem 6. PDF 64–69 unread; no full Chapter-V proof closure claimed.

### Garrett20

[Stone–von Neumann theorem](https://www-users.cse.umn.edu/~garrett/m/mfms/SSW/06_svn_theorem.pdf) — Paul Garrett. Author notes dated 23March2020; 5 pages

SHA-256: `7fed4ade4126aa2acfbf59901acc33253d6f38eeedbbe812d3a2f377c7a9903f`. Read: 2026-10-07.

- All PDF 1–5 read. Real Stone–von Neumann proof checked with the two recorded textual corrections; its Schwartz Fourier-density step still needs its analytic justification.

### GQT

[The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3) — Wee Teck Gan, Yannan Qiu and Shuichiro Takeda. arXiv:1207.4709v3, 21January2014

SHA-256: `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5`. Read: 2026-10-07.

- PDF 1–20, 25–28, 33–35, 52–57 read. Measures, Ikeda maps, regularization, local/global Siegel–Weil sections, coherent data, first/boundary/second-term statements and §§11.6–11.9 nonvanishing checked. Intervening induction proof and referenced original theorems unread.

### GanTakeda16

[A proof of the Howe duality conjecture](https://arxiv.org/pdf/1407.1995v4) — Wee Teck Gan and Shuichiro Takeda. arXiv:1407.1995v4, 15June2015; 21-page PDF, not collated against publication

SHA-256: `89972dcc033e93feb2a483d44a5c03569fecb026079c0f2152f05c90f6f6a561`. Read: 2026-10-07.

- PDF 1–10 read: theorem, smooth big/small theta, Jacquet/doubling filtrations and boundary argument. PDF 11–21 unread; cited Mínguez/MVW proofs unread.

### GanIchino16

[The Gross–Prasad conjecture and local theta correspondence](https://arxiv.org/pdf/1409.6824v2) — Wee Teck Gan and Atsushi Ichino. arXiv:1409.6824v2, 17July2015; 62-page PDF, not collated against publication

SHA-256: `4aaf7bd6281dd8726cdfca2de32b6f515924a8277865684fc9e011770ec0be5e`. Read: 2026-10-07.

- PDF 1–8, 11–15, 19–20 read: equal/almost-equal rank statements and their scoped uses. Other pages and cited semisimplicity proofs unread.

### SunZhu15

[Conservation relations for local theta correspondence](https://arxiv.org/pdf/1204.2969v3) — Binyong Sun and Chen-Bo Zhu. arXiv:1204.2969v3, 2June2014; 50-page PDF

SHA-256: `dbd11f450840ecf3b33cec57b22b9bc37ff80d11da000c55743429a43c402676`. Read: 2026-10-07.

- PDF 1–10, 43–46 read: nonarchimedean conservation and the three different archimedean assertions. Intermediate proofs and cited original inputs unread.

### DIT11

[Cycle integrals of the j-function and mock modular forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf) — W. Duke, Ö. Imamoḡlu and Á. Tóth. Annals of Mathematics173(2011), 947–981; published 35-page PDF

SHA-256: `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`. Read: 2026-10-07.

- PDF 12–16 read, including the U₄,W₄ normalization and coefficient formula. Remaining pages and cited Duke/Fay proofs unread.

### Biro00

[Cycle integrals of Maass forms of weight 0 and Fourier coefficients of Maass forms of weight 1/2](https://matwbn.icm.edu.pl/ksiazki/aa/aa94/aa9421.pdf) — András Biró. Acta Arithmetica94(2000), 103–152; 50-page published scan

SHA-256: `d1a49be2d88fb60164b11783d444256fdcb0e1e8678476a325c077322a4572a4`. Read: 2026-10-07.

- PDF 3–4, 26–27 read: lift/Theorem 1 and finite Fourier/Vitali proof argument. Intervening kernel calculations and referenced Iwaniec proof unread.

### BFH90Invent

[Nonvanishing theorems for L-functions of modular forms and their derivatives](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) — Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein. Inventiones mathematicae102(1990), 543–618; 77-page published scan

SHA-256: `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`. Read: 2026-10-07.

- Scanned PDF 2–12, printed 543–553 read visually: original genus-two Jacobi construction and theta components. PDF 13–77 unread. MP.8 supplies its subsequent planned Whittaker/Euler/continuation nodes.

### PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18

[Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf) — Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera. Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics 187 (2018), no. 2, 391–531

SHA-256: `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb`. Read: 2026-10-07.

- PDF 62–63 (§4.7 finite Weil representation) and 75–77 (§6.1 incoherent Eisenstein series) read. Referenced original incoherent Siegel–Weil proof unread.

### PAPER-CHENEVIER-TAIBI-20

[Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://arxiv.org/pdf/1907.08783v1) — Gaëtan Chenevier, Olivier Taïbi. Public arXiv PDF 1907.08783v1

SHA-256: `81b7fe2c31d0ab4ac7465c7d5209611638fa0d8c7c4ff11f7f4746866491742c`. Read: 2026-10-07.

- arXiv-v1 PDF 44–55 read, including the Rallis Satake use and harmonic-polynomial theta application. Original Rallis theorem unread; explicit added Satake segments remain a gap.

### PAPER-DISEGNI-LIU-24

[A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3) — Daniel Disegni and Yifeng Liu. Public arXiv PDF 2204.09239v3

SHA-256: `1f759774cdbf8700c5978b6ea45c1bf63c99b993136a82a45a907320fef53bfa`. Read: 2026-10-07.

- arXiv-v3 PDF 39–42 read: §4.1(H1)–(H9), Lemma 4.1, Definition 4.2/Remark 4.3 and Lemma 4.5. Referenced local proof and other pages unread.

### PAPER-DUKE-IMAMOGLU-TOTH-16

[Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) — W. Duke, Ö. Imamoḡlu, Á. Tóth. Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics 184 (2016), 949–990

SHA-256: `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`. Read: 2026-10-07.

- Published PDF 16–17, 19–21, 27–34 read: multiplier/trace statements, spectral normalization and §§8–10 coefficient/residue/cycle/Shimura formulas. AppendixA PDF 39–42 and cited original Fay/Kohnen/Baruch–Mao/Duke proofs unread.

### PAPER-GAN-ICHINO-18

[The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3) — Wee Teck Gan and Atsushi Ichino. Public arXiv PDF 1705.10106v3

SHA-256: `5d1408c5f8bc15a5ceec04a465ceb80cb7265da218138d5a746418ee8b4b291d`. Read: 2026-10-07.

- arXiv-v3 PDF 7–12, 19–21, 25–28 read: smooth cover induction/MVW, conservation and unramified uses. Other pages and original referenced proofs unread.

### PAPER-GAN-SAVIN-23

[Howe duality and dichotomy for exceptional theta correspondences](https://arxiv.org/pdf/2102.00372v1) — Wee Teck Gan and Gordan Savin. Public arXiv PDF 2102.00372v1

SHA-256: `8b3b6702909a6a936e5984f46a3c2fbfe629b63db4ba0ae9bd4356286508c6e5`. Read: 2026-10-07.

- arXiv-v1 PDF 26–28, 34–35, 40–41, 50–51, 54 read: required classical theta inputs and see-saw uses. Rank-one/minimal-representation original proofs and other pages unread; exceptional construction imported to its separate proposed owner.

### PAPER-GAN-SAVIN-23-B

[The Local Langlands Conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf) — Wee Teck Gan and Gordan Savin. Published/author public PDF identified by the URL and hash; journal metadata: Forum of Mathematics, Pi 11 (2023), e28, 1–42

SHA-256: `6fc3979d78510fb094e50de9bdd162dfaad43f51fe9b6b8a82ab3d84e0c93389`. Read: 2026-10-07.

- Published PDF 17–18, 34–35 read: classical similitude and theta dichotomy inputs. Original local Langlands/epsilon-factor proofs and other pages unread.

### PAPER-GROSS-ZAGIER-86

[Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) — Benedict H. Gross, Don B. Zagier. Published/author public PDF identified by the URL and hash; journal metadata: Inventiones mathematicae 84 (1986), no. 2, 225–320

SHA-256: `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5`. Read: 2026-10-07.

- Scanned PDF 6, 44–47, 50–52 (printed 229, 267–270, 273–275) read visually: ideal-class theta, all-discriminant quoted modularity, odd-D Lemma 2.3 and ideal Poisson. Other arithmetic results and the cited Hecke proof unread.

### PAPER-ICHINO-PRASANNA-23

[Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2) — Atsushi Ichino and Kartik Prasanna. Public arXiv PDF 1806.10563v2

SHA-256: `058fda94ad08d245dcdf01672e5915beacb8458e6b49498b7e15debbf828aad5`. Read: 2026-10-07.

- arXiv-v2 PDF 41–42, 50–53, 87–115 read; entire AppendixA splitting/comparison argument checked. PDF 49 and cited original Periods-I/II/Kudla/Harris–Kudla proofs unread. Published135-page version not collated in this run.

### PAPER-LAFFORGUE-18

[Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10) — Vincent Lafforgue. Public arXiv PDF 1209.5352v10

SHA-256: `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`. Read: 2026-10-07.

- arXiv-v10 PDF 169–173, entire §14 read. This is a conditional metaplectic programme; the ordinary excursion and Satake results are imported from their owners.

### PAPER-LI-LIU-21

[Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf) — Chao Li and Yifeng Liu. Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics (2) 194 (2021), no. 3, 817–901

SHA-256: `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566`. Read: 2026-10-07.

- Author-final PDF 15–17, 31–32, 49–50 read: local dichotomy/irreducibility, Hecke use and measure identity references. Original cited semisimplicity/Hecke/local Siegel–Weil proofs unread.

### PAPER-LI-LIU-22

[Chow groups and L-derivatives of automorphic motives for unitary groups, II](https://arxiv.org/pdf/2101.09485v2) — Chao Li and Yifeng Liu. Public arXiv PDF 2101.09485v2

SHA-256: `6cf5b238a14dfea7761133b0437cd5a671db1266bc0dd9806163cfdd3bc20990`. Read: 2026-10-07.

- arXiv-v2 PDF 11, 42–48 read: ramified operators, spherical module and tempered theta application. Other pages and the precise original semisimplicity proof unread.

### PAPER-LI-ZHANG-22-B

[Kudla–Rapoport cycles and derivatives of local densities](https://arxiv.org/pdf/1908.01701v3) — Chao Li and Wei Zhang. Public arXiv PDF 1908.01701v3

SHA-256: `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`. Read: 2026-10-07.

- arXiv-v3 PDF 8–9, 36, 56–58, 78–79 read: quadratic/Hermitian Fourier conventions, support uncertainty and unitary evaluation section. Geometric local-density/arithmetic proofs not part of MP; original nonsplit index evaluation remains an input.

### PAPER-YUAN-ZHANG-18

[On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) — Xinyi Yuan and Shou-Wu Zhang. Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics187(2018), 533–638; erratum 198(2023), 867–878

SHA-256: `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`. Read: 2026-10-07.

- Published PDF 46–50, with48 reread: extended Schwartz, unit quotient, convergence/automorphy and restriction. YZZ/Waldspurger action source and 2023 arithmetic erratum not read in this run; no claim to reading the erratum.

### PAPER-ZHANG-21

[Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) — Wei Zhang. Published/author public PDF identified by the URL and hash; journal metadata: Annals of Mathematics 193 (2021), no. 3, 863–978

SHA-256: `6f8ac537b4f95cf26ba907dc1d25c1b9d9157a3a4006a311b114a522177d3b45`. Read: 2026-10-07.

- Published PDF 70–71, 108–109 read: even Weil/theta and Hermitian index formulas used here. Other pages and the AFL/transfer proofs not part of MP.

## Version-scoped source corrections

The packet records 23 corrections or proof gaps: four inherited Kudla findings, thirteen independently confirmed extraction findings used with attribution, and six further source-scoped observations. No author correspondence or author erratum is claimed. New observations require independent review.

### MetaplecticAutomorphicForms/E-MP0-1

Kudla96, 1996 author copy, I.1, p.5, orthogonal-sum paragraph. misprint; affects the proof.

Printed: “W = W₁ + W₁”.

Correction: Read W=W₁+W₂, the orthogonal direct sum used in the map H(W₁)×H(W₂)→H(W).

Reason: The immediately described map sends ((w₁,t₁),(w₂,t₂)) to (w₁+w₂,t₁+t₂) and has the anti-diagonal scalar kernel. Repeating W₁ is inconsistent with both its domain and the orthogonal-sum assumption.

Known status: new (no addressing correction located; independent review required)

Search/version boundary:

- 2026-09-27: author research page https://www.math.utoronto.ca/skudla/ssk.research.html lists the 1996 notes; no erratum entry found.
- 2026-09-27: searches for Kudla castle.pdf corrections, Kudla local theta 1996 errata, unique Heisenberg character extension, and dyadic self-dual lattice model corrections found no correction addressing these passages. A 2002-labelled mirror was a search lead, not a version read or collated.
- These are findings about the specified unpublished author copy. No claim is made about a separate published version or about an exhaustive correction search.

### MetaplecticAutomorphicForms/E-MP0-2

Kudla96, 1996 author copy, I.2, p.6, character extension paragraph. error; affects a stated result.

Printed: “unique extension”.

Correction: The displayed character, when multiplicative, is the distinguished extension trivial on the chosen section Y→H(Y). It is unique only after imposing that normalization; the cocycle condition must also hold as in E-MP0-3.

Reason: Take a nonzero isotropic F-line Y in a symplectic plane and nontrivial ψ. Since ω restricts to zero on Y, ψ(t) and ψ(t+ℓ(y)) are distinct characters of H(Y) extending the same central ψ, for any nonzero F-linear functional ℓ:Y→F. Thus uniqueness among all extensions is false even in the simplest polarized case.

Known status: new (no addressing correction located; independent review required)

Search/version boundary:

- 2026-09-27: author research page https://www.math.utoronto.ca/skudla/ssk.research.html lists the 1996 notes; no erratum entry found.
- 2026-09-27: searches for Kudla castle.pdf corrections, Kudla local theta 1996 errata, unique Heisenberg character extension, and dyadic self-dual lattice model corrections found no correction addressing these passages. A 2002-labelled mirror was a search lead, not a version read or collated.
- These are findings about the specified unpublished author copy. No claim is made about a separate published version or about an exhaustive correction search.

### MetaplecticAutomorphicForms/E-MP0-3

Kudla96, 1996 author copy, I.2, p.6, formula for ψ_Y on a closed character-self-dual additive subgroup. error; affects a stated result.

Printed: “ψ_Y(y, t) = ψ(t)”.

Correction: For this formula require ψ(½ω(y,y′))=1 for all y,y′∈Y. It holds for an isotropic F-subspace. For a general closed self-dual additive subgroup, construct a valid splitting character or quadratic refinement and prove its multiplication law; do not infer the displayed formula from ψω-self-duality alone.

Reason: Let F=Q₂, W=F² with ω((x,y),(x′,y′))=xy′−yx′, Y=Z₂², and ψ have kernel Z₂. Then Y equals its annihilator for ψω. The elements (e₀, 0) and (e₁, 0) both have proposed value 1, but their product has central coordinate ½ and value ψ(½)=−1. This is a failure of the printed formula, not a claim that a correctly chosen lattice model cannot exist.

Known status: new (no addressing correction located; independent review required)

Search/version boundary:

- 2026-09-27: author research page https://www.math.utoronto.ca/skudla/ssk.research.html lists the 1996 notes; no erratum entry found.
- 2026-09-27: searches for Kudla castle.pdf corrections, Kudla local theta 1996 errata, unique Heisenberg character extension, and dyadic self-dual lattice model corrections found no correction addressing these passages. A 2002-labelled mirror was a search lead, not a version read or collated.
- These are findings about the specified unpublished author copy. No claim is made about a separate published version or about an exhaustive correction search.

### MetaplecticAutomorphicForms/E-MP0-4

Kudla96, 1996 author copy, I.2, p.9, equivariance display for I_{Y₁,Y₂}. misprint; affects the proof.

Printed: “A_{Y₁,Y₂}(f)”.

Correction: Use I_{Y₁,Y₂}(f) on the right side of the equivariance identity, matching the integral operator defined immediately above.

Reason: The paragraph defines I_{Y₁,Y₂}:S_{Y₁}→S_{Y₂}, then asserts its H-equivariance. No operator A indexed by this pair has been defined; the same intertwining integral is required on both sides.

Known status: new (no addressing correction located; independent review required)

Search/version boundary:

- 2026-09-27: author research page https://www.math.utoronto.ca/skudla/ssk.research.html lists the 1996 notes; no erratum entry found.
- 2026-09-27: searches for Kudla castle.pdf corrections, Kudla local theta 1996 errata, unique Heisenberg character extension, and dyadic self-dual lattice model corrections found no correction addressing these passages. A 2002-labelled mirror was a search lead, not a version read or collated.
- These are findings about the specified unpublished author copy. No claim is made about a separate published version or about an exhaustive correction search.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E2

PAPER-DUKE-IMAMOGLU-TOTH-16, Theorem 4, p.965, in the published version, Annals of Mathematics 184 (2016), 949–990 (publisher PDF, SHA-256 a67de715…5f61); the author preprint of 29 July 2016 on W. Duke's page has the same text there. error; affects a stated result.

Printed: “"Then there exists a unique nonzero F(z) with weight 1/2 for Γ_0(4) with Fourier expansion F(z) = Σ b(n) W_{sgn(n)/4, ir/2}(4π|n|y) e(nx), such that for any pair of co-prime fundamental discriminants d′ and d, we have (5.16) 12√π |D|^{3/4} b(d′) \overline{b(d)} = ⟨φ, φ⟩^{−1} Σ_A χ(A) {…}. Here ⟨F, F⟩ = … = 1 and the value of b(n) for a general discriminant n = dm² … is determined by means of the Shimura relation …"”.

Correction: F is unique only up to a constant factor of absolute value 1. The line spanned by F is unique, and F itself becomes unique once one also requires, for example, b(d_0) > 0 for one fundamental discriminant d_0 with b(d_0) ≠ 0.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. If F satisfies the conditions, so does uF for every complex u with |u| = 1. Indeed ⟨uF, uF⟩ = 1, the Shimura relation is linear in b, and b(d′)\overline{b(d)} is unchanged since |u|² = 1. Taking u = −1 gives a second such F. The conjugate in (5.16) was checked on the page image. Existence and the identity (5.16) are unaffected. The proof, via Proposition 6 in §10, produces F as a member ψ of a chosen orthonormal basis B_r, which fixes it only up to such a unit. Noted by the extraction (Corrections, item 5).

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E2`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E3

PAPER-DUKE-IMAMOGLU-TOTH-16, §5, numerical example after Theorem 4, p966 (also Proposition 6 on p981 twice and in its proof on p982 twice; those pages are outside range B). misprint; affects nothing.

Printed: “λ = 190.13154731 = · · · = ½ + r², where r/2 = 6.889875675 · · · .”.

Correction: p.966: λ = 190.13154731 · · · = ¼ + r² (the stray '=' before the dots also goes). Likewise ¼ + r² for ½ + r² in Proposition 6 and after (10.4) on p.981, and twice in the proof on p.982.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. The substance of E3 is confirmed. Only the quote changes: the page image has '= · · · =' between the digits and ½ + r². With r = 2×6.889875675 = 13.77975135, 1/4+r² = 190.1315473 (the printed λ) and 1/2+r² = 190.3815473. Independent check: from Table 1 (a(p), p≤13), ⟨φ,φ⟩=7.26300636e−19, λ=1/4+r², a direct quadrature of λ⟨φ,φ⟩^{−1}∫_{F_I}φ dμ for D=12 gives 1.047598e10, matching 12^{7/4}√π b(−3)b(−4)=1.047599e10. With λ=1/2+r² it would be 1.04897e10. The text layer also shows '1/2 + r²' twice on p981 and twice on p982.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E3`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E6

PAPER-DUKE-IMAMOGLU-TOTH-16, Proposition 2, (6.6), p.968, and its proof and use, p.969 ('Part (6.6) … follows straight from Theorem 4 and Theorem 5 of [12]'; 'c(φ) ≪ |r|^{−A}'). error; affects a stated result.

Printed: “"Weyl(⟨φ,φ⟩^{−1}φ, χ) ≪_ε r^C |D|^{13/28+ε}, (6.6) where Re(s) = 1/2 and φ is any even Hecke–Maass cusp form with Laplace eigenvalue 1/4 + r²."”.

Correction: Replace (6.6) by Weyl(u_φ, χ) ≪_ε r^C|D|^{13/28+ε} for u_φ = φ/‖φ‖. With the a(1) = 1 normalization of (5.7), what Theorem 4 and [12, Thm 5] actually give is Weyl(⟨φ,φ⟩^{−1}φ, χ) ≪_ε r^C cosh²(πr/4)|D|^{13/28+ε}. The two forms agree after changing C, because ‖φ‖² = 2L(1,sym²φ)/cosh(πr) and L(1,sym²φ) = r^{o(1)}; only the upper bound L(1,sym²φ) ≪ r^ε is needed to pass from the second form to the first. In the deduction of Theorem 2, write c(φ)⟨φ,φ⟩^{−1}φ = ⟨f,u_φ⟩u_φ and use ⟨f,u_φ⟩ ≪ r^{−A} in place of c(φ) ≪ |r|^{−A}.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. I agree with the existing analysis, and reclassify from gap to error because the printed (6.6) is false, not merely unproved. The cited results give an extra factor cosh²(πr/4): Duke 1988, Thm 5 (p.85) has the factor ch(πt/2) with t = r/2, once for each of b(d') and b(d). The failure can be shown directly in the CM case D = −4 = (1)(−4). Here h = 1 and ω_D = 2, so Weyl(⟨φ,φ⟩^{−1}φ, χ) = ⟨φ,φ⟩^{−1}φ(i)/2. With a(1) = 1, ⟨φ,φ⟩ = 2L(1,sym²φ)/cosh(πr) (see item 151), so (6.6) would force |u_φ(i)| ≪ r^{C+ε}e^{−πr/2} for every even φ. Odd forms vanish at i. The local Weyl law at z = i (pre-trace formula) gives Σ_{r_j≤R}|u_j(i)|² + (1/4π)∫_{−R}^{R}|E(i, 1/2+it)|²dt ≍ R². By (7.1), E(i,s) = 2ζ(s)L(s,χ_{−4})/ζ(2s), and fourth-moment bounds make the Eisenstein part O(R^{1+ε}). So the even u_j cannot all be exponentially small at i, and (6.6) fails. The paper's own numbers show the same thing. With ⟨φ,φ⟩ = 7.263×10^{−19} and r = 13.78, the unit-vector values are modest: u(i) ≈ 3.76 and u((1+√−3)/2) ≈ 2.44, from the displayed values 4.41046×10⁹ and 2.86296×10⁹. So the printed Weyl values ≈ 10⁹–10^{10} are ‖φ‖^{−1}·O(1), where ‖φ‖^{−1} ≈ 1.17×10⁹. The printed argument for Theorem 2 multiplies the false (6.6) by the true but too weak bound c(φ) ≪ r^{−A}. With both corrected, c(φ)⟨φ,φ⟩^{−1}φ = ⟨f,u_φ⟩u_φ and the proof goes through. Humphries–Nordentoft (arXiv 2211.05890, §9) use the unit-normalized form without comment.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E6`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E8

PAPER-DUKE-IMAMOGLU-TOTH-16, Proposition 6, p.981; also the proof: first line 'suppose that D=d′d>1', (10.4) and (10.5) on p.981, and the displays on p.982 including (10.6). misprint; affects nothing.

Printed: “Proposition 6: 'T(φ,χ)=12π^{1/2}D^{3/4}b(d′)b̄(d)'. Proof: 'Let m>0, and suppose that D=d′d>1 where d is fundamental.' (10.4): '12π^{1/2}D^{3/4}Σ_{ψ∈B_r}b(d′)b̄(d)a_ψ(m)=…'. (10.5): '6π^{1/2}D^{3/4}|m|…'. p.982: '24π^{1/2}D^{3/4}m…', (10.6) '12π^{1/2}D^{3/4}…', and the two following displays.”.

Correction: Read |D|^{3/4} for D^{3/4} in Proposition 6, (10.4), (10.5), the p. 982 display, (10.6) and the two displays after it, as in Proposition 5 and (5.16). In the first line of the proof, replace 'D=d′d>1' by 'D=d′d not a square', so that D<0 (the d′d<0 case of (5.16)) is covered.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. Confirmed on the page images. The statement allows D<0, and T(φ,χ) is real, so D^{3/4} cannot be meant. The proof also writes D^{3/4} at every step and assumes D>1 at the start, so as written it does not treat D<0, the CM case needed for the third branch of Theorem 4. Proposition 5, with |D|^{3/4}, covers D<0, and the argument then goes through word for word. I did not repeat the erratum searches recorded in E8.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E8`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E22

PAPER-DUKE-IMAMOGLU-TOTH-16, §5, Remarks after Theorem 4, p965. error; affects nothing.

Printed: “Perhaps not coincidentally, Res_{s=1}E*_{1/2}(z, s) = ½θ(z), and by [7] we have ⟨½θ(z), ½θ(z)⟩ = 6.”.

Correction: '… and ⟨½θ(z), ½θ(z)⟩ = π/2', equivalently ⟨θ,θ⟩ = 2π = area(Γ_0(4)\H), for the product of Theorem 4. The value 6 = [Γ:Γ_0(4)] is ⟨θ,θ⟩, not ⟨½θ,½θ⟩, for the product normalized by 3/π = 1/area(Γ\H). In that normalization ⟨½θ,½θ⟩ = 3/2. Either way the claimed match with ⟨F,F⟩ = 6 does not hold.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. The residue claim is right (checked from the constant term Λ(2−2s)2^{1−s}y^{3/4−s/2} and b(m²,s)). For the norm: g(z)=|θ(z)|² is Γ_0(4)-invariant (checked), and ⟨θ,θ⟩=Σ_{i=1}^{6}∫_F g(γ_i z)dµ over coset representatives I, S, ST, ST², ST³, ST²S (bottom rows exhausting P¹(Z/4Z)). Gauss–Legendre quadrature up to y=Y plus the exact cusp tail 3·∫_Y^∞ y^{−3/2}dy = 6Y^{−1/2} gives 6.283185307180 for Y=12 and for Y=20, i.e. 2π to 12 digits; the same code with g≡1 returns area 2π. So ⟨½θ,½θ⟩ = π/2 ≈ 1.571, not 6, and the claimed match between the norm-6 normalization of F and ½θ fails. Defence: the remark is explicitly heuristic ('Perhaps not coincidentally'), and [7] (Chiera, J. Number Theory 122 (2007), which I could not access) may use a normalized Petersson product; even so, no normalization gives ⟨½θ,½θ⟩=6, only ⟨θ,θ⟩=6 with the product divided by π/3. Nothing in the proofs uses it; extraction item 80 repeats the false value.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E22`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E28

PAPER-DUKE-IMAMOGLU-TOTH-16, Lemma 6 (pp.979–980) against Lemma 5 (p.979) and its proof; also the note in the proof of Lemma 4, p.979. error; affects a stated result.

Printed: “Lemma 6: 'Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ=Σ_{0<c≡0(4)}S_m(d,d′; c)Φ_m(2√D/c)', where (9.3) 'Φ_m(t)=it∫_0^π e(mt cosθ)φ(t sinθ)e^{iθ}dθ'. Lemma 5: 'Σχ(Q)∫_{C_Q}i∂_zF_m(z,s)dz=2^{s−1/2}Γ((s+1)/2)²/Γ(s)·D^{1/4}Σ_{0<c≡0(4)}S_m(d′,d; c)/√c·J_{s−1/2}(4π|m|√D/c)'. Proof of Lemma 4: 'Note that √D/Q(z, 1)dz=y⁻¹|dz| on C_Q.'”.

Correction: Take C_Q from z to γ_Qz, with γ_Q from (2.11) as footnote 8 indicates. This is the orientation of C_A in §2, which Lemma 1 uses. Lemma 6 should then read Σ_{Q∈Γ\Q_D}χ(Q)∫_{C_Q}P_m(τ,φ)dτ = −Σ_{0<c≡0(4)}S_m(d′,d; c)Φ_m(2√D/c); equivalently, put −it in place of it in (9.3). The note in the proof of Lemma 4 should read √D dz/Q(z, 1)=−y^{−1}|dz| on C_Q. Lemma 5, Propositions 5 and 6 and Theorem 4 stand as printed.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. By (9.2), −2i∂_zF_m=P_m(z,φ) with φ(y)=−s|m|^{−1/2}(2πy)⁻¹Γ(s)Γ(2s)⁻¹M_{sgn m,s−1/2}(4π|m|y), so i∂_zF_m=−½P_m. I checked (9.2) numerically to 1e-15 at four points, including complex s, and Lemma 7 for both signs and several (t,μ,s). Put the printed Lemma 6 and Lemma 7 together, with μ=sgn m, e(±μ/4)=i, Γ((s+2)/2)Γ(s/2)=(s/2)Γ(s/2)² and the duplication formula. This gives −½Φ_m(2√D/c)=−2^{s−1/2}Γ((s+1)/2)²Γ(s)⁻¹D^{1/4}c^{−1/2}J_{s−1/2}(4π|m|√D/c), which is minus the c-th term of Lemma 5. Quadrature of (9.3) gives the same ratio, −1.0000000, for three (D,c,m,s). To decide which statement is wrong, I computed Lemma 5 directly. I took D=12=(−3)(−4), with classes [1, 0,−3] and [−1, 0, 3], χ=+1 and −1, and γ_Q=[[2, 3],[1, 2]]. I evaluated F_m from its Fourier expansion at points reduced to the fundamental domain and summed S_m for c≤4000. With C_Q from z to γ_Qz, LHS/RHS=1.0000000000 at (m,s)=(1, 4) and 1.00000005 at (2, 3.7). Unfolding (a>0, θ from 0 to π, counterclockwise) also shows that the printed Lemma 6 is the statement for the counterclockwise orientation when a>0: forms with a<0 contribute equally, because χ(−Q)=−χ(Q) for d<0 and their orientation is reversed. That orientation is DIT11's S_Q ((4.1), p.966: 'directed counterclockwise if a>0'), whose C_Q runs to g_Qz. So Lemma 6 and the Lemma 4 note were carried over from [16] without the sign change that footnote 8 signals. Case for the defence: the paper never states the orientation explicitly. Theorem 4 is unaffected, because its third case is written with (λ/2)∫_{F_A}φdμ, which does not depend on orientation, and the chain Lemma 5 → Proposition 5 → Proposition 6 → Lemma 1 is consistent under the (2.11) orientation. The Lemma 4 note is harmless, because Lemma 4 is stated with y⁻¹|dz|.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E28`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E30

PAPER-DUKE-IMAMOGLU-TOTH-16, Hypothesis before Lemma 6 (p.979) as applied in the proof of Lemma 5 (p.980). gap; affects the proof.

Printed: “'For a smooth function φ(y) that satisfies φ(y)≪y^{1+ε} as y→0, …' and 'Taking φ(t)=−s|m|^{−1/2}(2πy)⁻¹Γ(s)/Γ(2s)M_{sgn(m),s−1/2}(4π|m|y) in (9.3) reduces the proof of Lemma 5 to …'”.

Correction: State Lemma 6 for φ(y)≪y^{ε} as y→0. This suffices, because |f(γτ)(γτ)′|=|φ(Im γτ)|Im γτ/Im τ. Alternatively, prove Lemma 5 for Re(s)>2 and continue analytically.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. M_{κ,μ}(x)~x^{μ+1/2} as x→0, so the φ used satisfies φ(y)≍y^{s−1}. That is ≪y^{1+ε} only when Re(s)>2, but Lemma 5 is claimed for Re(s)>1. The weight-2 series has an extra factor Im γτ/Im τ, so the hypothesis carried over from the weight-0 setting of DIT11 (φ=O(y^a), a>1) is stronger than needed. The repair is routine.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E30`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-DUKE-IMAMOGLU-TOTH-16-E33

PAPER-DUKE-IMAMOGLU-TOTH-16, §10, pp.980–981: the choice of B_r, the display after (10.1), (10.2), and 'Note that for some d, we must have that b(d)≠0'. gap; affects the proof.

Printed: “'It is shown in [34] that V_r^+ has an orthonormal basis B_r={ψ} consisting of eigenfunction of all Hecke operators T_{p²} where p>2 is prime. … the Hecke relation T_{p²}ψ=a_ψ(p)ψ implies that L_d(s+1/2)Σ_{n≥1}b(dn²)n^{−s+1}=b(d)Π_p(1−a_ψ(p)p^{−s}+p^{−2s})⁻¹. Define the numbers a_ψ(n) via (10.2) Π_p(…)⁻¹=Σa_ψ(n)n^{−s} … Note that for some d, we must have that b(d)≠0 so that this is always defined.'”.

Correction: Take B_r to consist of eigenfunctions of Kohnen's plus-space operator at 2 as well, and define a_ψ(2) as its eigenvalue, as in the plus-space Shimura correspondence of [34]/[1]; or restrict (10.2)–(10.4) to odd m and treat 2 separately. Justify b(d)≠0 for some fundamental d: with the full Shimura relation, b(d)=0 forces b(dk²)=0 for all k, and every nonzero n≡0, 1 mod 4 is dk² with d fundamental. Note that the a_ψ(m) are real.

Reason: Imported correction from REV-PAPER-DUKE-IMAMOGLU-TOTH-16; this packet uses the corrected statements. With eigenvalues only for p>2, the Euler factor at p=2 in the display and in (10.2) is undefined. So a_ψ(2^k), and hence Shim ψ in (10.3), are not defined by the text, and the nonvanishing claim is asserted without argument. Case for the defence: the plus-space Hecke theory at 2 and the Hecke-equivariant correspondence of Katok–Sarnak [34] and Baruch–Mao [1], which the proof invokes at the end, supply what is missing. The extraction flags this in item 120, but there is no source issue for it.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-DUKE-IMAMOGLU-TOTH-16/E33`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-GROSS-ZAGIER-86-E30

PAPER-GROSS-ZAGIER-86, Chapter IV, §2, (2.3) Lemma, p. 274; Invent. Math. 84 (1986), published version (GDZ scan; formulas read from the GDZ IIIF 1400px crops of the page images). misprint; affects nothing.

Printed: “(2.3) Lemma. For γ = (a b; c d) ∈ PSL₂(ℤ), (c, D) = |D₂|, D₁·D₂ = D we have θ_𝒜|₁γ = …”.

Correction: γ = (a b; c d) ∈ SL₂(ℤ)

Reason: Imported correction from REV-PAPER-GROSS-ZAGIER-86; this packet uses the corrected statements. In odd weight 1, θ_𝒜|₁(−γ) = −θ_𝒜|₁γ, so the left side is not a function of the image of γ in PSL₂(ℤ). The right side also changes sign under γ ↦ −γ: ε_{D₁}(−1)ε_{D₂}(−1) = ε(−1) = −1 because exactly one of D₁, D₂ is negative, and c*d is unchanged. So the identity holds for every matrix of SL₂(ℤ) (either lift). This is what the proof uses ('an arbitrary element of SL₂(ℤ)') and what (2.2) states.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-GROSS-ZAGIER-86/E30`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-GROSS-ZAGIER-86-E31

PAPER-GROSS-ZAGIER-86, Chapter IV, §2, proof of (2.3), p. 275, second line of the display after 'choosing an inverse R* of R (mod δ₂)'; Invent. Math. 84 (1986), published version (GDZ scan; formulas read from the GDZ IIIF 1400px crops of the page images). misprint; affects nothing.

Printed: “= e_{δ₂}(R N(μ + R* λ₀′ ν′)) e_{𝔡₂}(−R* N(λ₀ ν)),”.

Correction: e_{δ₂}(−R* N(λ₀ν)) (the integer δ₂, not the ideal 𝔡₂, in the subscript)

Reason: Imported correction from REV-PAPER-GROSS-ZAGIER-86; this packet uses the corrected statements. e_n(a) = e^{2πia/n} is defined for an integer modulus n (Conventions, p. 269). The next line of the proof writes C(ν) = e_{δ₂}(−R* N(λ₀ν)) · Σ e_{δ₂}(R N(μ)). Check: R·N(μ + R*λ̄₀ν̄) ≡ R N(μ) + RR* Tr(λ₀νμ) + R* N(λ₀ν) (mod δ₂), with R* ≡ 0 (mod D₁) making R* N(λ₀ν) integral.

Known status: Already recorded and independently confirmed in the atlas extraction; no external author erratum is claimed.

Imported finding: `PAPER-GROSS-ZAGIER-86/E31`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json. Those searches are provenance, not claimed repeated by this worker.
- 2026-10-07: the relevant source pages and the extraction/review correction were compared for this planning pass.

### MetaplecticAutomorphicForms/E-Kudla-Leray-quotient

Kudla96, 1996 author copy I.3 p12, reduction of the triple. error; affects a stated result.

Printed: “Y_{j,R} = (Y_j ∩ R^⊥)/R”.

Correction: Use the image ((Y_j∩R^⊥)+R)/R in R^⊥/R; R need not be contained in each Y_j.

Reason: Take Y₀=Y₁=L and Y₂ transverse to L. Then R=L, while Y₂∩R^⊥=0, so division of that intersection by R is undefined. Its image in the ambient quotient is defined.

Known status: new (no addressing correction located)

Search/version boundary:

- 2026-10-07: primary source version named in sources was read at this locator.
- 2026-10-07: web searches for source title, author and errata/correction found no addressing correction. Search leads were not collated against another version; independent review remains necessary.

### MetaplecticAutomorphicForms/E-Kudla-genuine-twists

Kudla96, 1996 author copy II.4 Remark 4.1, pp36–37. error; affects a stated result.

Printed: “π₁ ⊗gen π₂ = π₁ ⊗ π₂ ⊗ λ⁻²; π∨,gen = π∨ ⊗ λ²”.

Correction: With λ(z)=z² as fixed on p36, use λ⁻¹ for the tensor of two genuine weight-one modules and λ for the genuine dual.

Reason: The printed powers yield scalar weights 2−4=−2 and −1+4=3; the required weights are 0 and 1. Definition 4.2 immediately below uses the consistent half-dimension exponents.

Known status: new (no addressing correction located)

Search/version boundary:

- 2026-10-07: primary source version named in sources was read at this locator.
- 2026-10-07: web searches for source title, author and errata/correction found no addressing correction. Search leads were not collated against another version; independent review remains necessary.

### MetaplecticAutomorphicForms/E-Kudla-Rao-known-sign

Kudla96, 1996 author copy I.4 Remark 4.6 p21, note about Rao93. misprint; affects nothing.

Printed: “t(t+1)/2”.

Correction: Use t(t−1)/2 in the cited Rao formula, as Kudla’s remark explicitly instructs.

Reason: This is a correction already printed in the source read, recorded to preserve the corrected cocycle convention. Rao’s original article was not read or independently collated.

Known status: Kudla96 I.4 Remark 4.6 already records this correction to Rao93

Search/version boundary:

- 2026-10-07: primary source version named in sources was read at this locator.
- 2026-10-07: web searches for source title, author and errata/correction found no addressing correction. Search leads were not collated against another version; independent review remains necessary.

### MetaplecticAutomorphicForms/E-Garrett-inner-product

Garrett20, Author notes March23 2020 Claim 0.7 p4 and ensuing tensor norm calculation. error; affects the proof.

Printed: “⟨(πh₁)x₁,(πh₂)x₂⟩_{X⁰}”.

Correction: Replace the second factor by ⟨x₁,x₂⟩_{X⁰}.

Reason: For x_i in the projector image, the proof computes the scalar oscillator matrix coefficient times their unchanged inner product. πh_i x_i need not even lie in X⁰, and the printed factor conflicts with the algebraic tensor inner product stated above.

Known status: new (no addressing correction located)

Search/version boundary:

- 2026-10-07: primary source version named in sources was read at this locator.
- 2026-10-07: web searches for source title, author and errata/correction found no addressing correction. Search leads were not collated against another version; independent review remains necessary.

### MetaplecticAutomorphicForms/E-Garrett-multiplicity-space

Garrett20, Author notes March23 2020 final paragraph p4. misprint; affects the proof.

Printed: “necessarily X⁰ ≈ {0}”.

Correction: For a nonzero irreducible π the multiplicity space is one-dimensional: X⁰≃C.

Reason: The established equivalence is Y≃X⊗X⁰. X⁰=0 would force Y=0, whereas irreducibility and the concluded π≃σ require nonzero dimension one.

Known status: new (no addressing correction located)

Search/version boundary:

- 2026-10-07: primary source version named in sources was read at this locator.
- 2026-10-07: web searches for source title, author and errata/correction found no addressing correction. Search leads were not collated against another version; independent review remains necessary.

### MetaplecticAutomorphicForms/E-Biro-Vitali

Biro00, Published Acta Arith94(2000) p128, PDF 26, function-theoretic parenthesis before Lemma 10. error; affects the proof.

Printed: “if lim_{n→∞} f_n(z₀)=f(z₀) for a point z₀ of this domain”.

Correction: Require convergence on a set with an accumulation point inside the domain. The preceding convergence for all sufficiently large positive A supplies such a set here.

Reason: On the unit disk, f_n(z)=(−1)^n z is uniformly bounded and converges to f(0)=0 at z₀=0, but fails to converge at z=1/2. The correct Vitali argument repairs this proof without changing the lift theorem.

Known status: new (no addressing correction located)

Search/version boundary:

- 2026-10-07: primary source version named in sources was read at this locator.
- 2026-10-07: web searches for source title, author and errata/correction found no addressing correction. Search leads were not collated against another version; independent review remains necessary.

### MetaplecticAutomorphicForms/E-GAN-SAVIN-23-E17

PAPER-GAN-SAVIN-23, §15.1, before Lemma 15.4, p. 54 (arXiv v1); checked on the page image. misprint; affects nothing.

Printed: ““let JL(ρ) be its Jacquet-Langlands lift to the an isotropic inner form PB^× = SO_3^* (where B is the quaternion division algebra) and let σ_ρ be the ψ-theta lift of JL(τ) to S̃L_2””.

Correction: “… to the anisotropic inner form PB^× = SO_3^* … and let σ_ρ be the ψ-theta lift of JL(ρ) to S̃L_2”.

Reason: Imported correction from REV-PAPER-GAN-SAVIN-23. For a division quaternion algebra B, PB^× is compact, so SO_3^* is anisotropic. τ is not defined in this passage.

Known status: Already recorded and independently confirmed in the atlas extraction; no author erratum is claimed.

Imported finding: `PAPER-GAN-SAVIN-23/E17`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-GAN-SAVIN-23.result.json; this is provenance, not a search repeated by this worker.
- 2026-10-07: the cited page and the extraction/review correction were compared.

### MetaplecticAutomorphicForms/E-GAN-SAVIN-23-E36

PAPER-GAN-SAVIN-23, Proof of Proposition 8.4, p. 27 (arXiv v1); checked on the page image. misprint; affects nothing.

Printed: ““Let Θ(ρ^+_ψ̄) and Θ(ρ^−_ψ̄) be the theta lifts of their contragredients to O_3, via the Weil representation on C_c(M°_2(F)) with respect to ψ. … Then Θ(ρ^−_ψ) ≅ st^− while Θ(ρ^+_ψ) is the principal series representation with the trivial representation as a quotient and st^+ as a submodule.””.

Correction: Θ(ρ^−_ψ̄) ≅ st^− and Θ(ρ^+_ψ̄) is the principal series with quotient 1 and submodule st^+, since these are the objects appearing in the SL_2-coinvariants.

Reason: Imported correction from REV-PAPER-GAN-SAVIN-23. The coinvariant decomposition uses Θ(ρ_ψ̄^±), but the identifications are printed for Θ(ρ_ψ^±). Changing ψ to ψ̄ can twist the S̃L_2 → PGL_2 lift by the quadratic character χ_{−1}. The argument is unaffected either way: τ^− is supercuspidal (so the 1-dimensional quotient is irrelevant), and every generic representation of GL_2, e.g. st ⊗ χ_{−1}, is a quotient of τ.

Known status: Already recorded and independently confirmed in the atlas extraction; no author erratum is claimed.

Imported finding: `PAPER-GAN-SAVIN-23/E36`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-GAN-SAVIN-23.result.json; this is provenance, not a search repeated by this worker.
- 2026-10-07: the cited page and the extraction/review correction were compared.

### MetaplecticAutomorphicForms/E-ICHINO-PRASANNA-23-E6

PAPER-ICHINO-PRASANNA-23, arXiv:1806.10563v2, PropositionA.1(i), PDF 88; the earlier extraction locator p101 refers to its published version, not collated here. misprint; affects nothing.

Printed: “z_{𝕐_v}(g_1, g_2) = s_v(g_1g_2) / (s_v(g_1) s(g_2))”.

Correction: z_{𝕐_v}(g_1, g_2) = s_v(g_1g_2) / (s_v(g_1) s_v(g_2))

Reason: Imported correction from REV-PAPER-ICHINO-PRASANNA-23. s_v is the local map being constructed; s without subscript is the global notation of §A.6 onwards and is not yet defined at this point.

Known status: Already recorded and independently confirmed in the atlas extraction; no author erratum is claimed.

Imported finding: `PAPER-ICHINO-PRASANNA-23/E6`. Its earlier independent verdict is attribution, not a verdict on this blueprint.

Search/version boundary:

- Earlier extraction records its correction search at research/blueprint/papers/PAPER-ICHINO-PRASANNA-23.result.json; this is provenance, not a search repeated by this worker.
- 2026-10-07: the cited page and the extraction/review correction were compared.

## Pinned library baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The actual statements were read and the relied-on source bytes checked at these pins. Native group-extension, representation, quotient, Schwartz, modular-subgroup and special-function vocabulary is reused below.

- `tauceti:TauCeti.FactorSet` (structure, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Normalized multiplicative two-cocycle for a specified coefficient action. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.Extension` (structure, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Native carrier with left coefficient and right group coordinates; its group instance uses the factor set. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.Extension.mul_left` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): The coefficient coordinate of a product is x.left·(x.right acting on y.left)·α(x.right,y.right). Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.Extension.mul_right` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): The quotient coordinate of a product is x.right·y.right. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.Extension.inv_left` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): The coefficient coordinate of the inverse is the native factor-set inverse formula. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.Extension.inv_right` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): The quotient coordinate of the inverse is x.right inverse. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.inl` (def, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Canonical injection of coefficients into the extension. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.inl_injective` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): The coefficient injection is injective. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.rightHom` (def, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Canonical projection of the extension to its quotient group. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.range_inl_eq_ker_rightHom` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Exactness at the extension. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.rightHom_surjective` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Surjectivity of the quotient projection. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.groupExtension` (def, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Packages the preceding native maps as a group extension. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.canonicalSection` (def, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Canonical set-theoretic section with coefficient coordinate one; it is not generally a homomorphism. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.inl_mul_canonicalSection` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Every extension element is its central coordinate times the section of its quotient coordinate. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.inl_range_le_center` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): For the trivial coefficient action the coefficient subgroup lies in the center. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.rescaleEquiv` (def, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): A cochain satisfying α(g,h)x(gh)=β(g,h)(g acting on x(h)·x(g)) gives an equivalence of group extensions, multiplying the coefficient by x(g). Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.rescaleEquiv_apply` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): Coordinate formula for the forward rescaling equivalence. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.FactorSet.rescaleEquiv_symm_apply` (theorem, `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`): The inverse equivalence divides the coefficient by the cochain. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.trivialMulDistribMulAction` (def, `TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean`): The existing trivial action through the identity automorphism, installed only locally. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.trivialMulDistribMulAction_smul` (theorem, `TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean`): Every group element acts identically under that action. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinMap` (abbrev, `Mathlib/LinearAlgebra/BilinearMap.lean`): Bilinear maps W×W→C over a common scalar ring, allowing the coefficient module to differ from W and R. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm` (abbrev, `Mathlib/LinearAlgebra/BilinearMap.lean`): The scalar-valued specialization of the native bilinear-map type. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.map_add₂` (theorem, `Mathlib/LinearAlgebra/BilinearMap.lean`): Additivity in the first input with both arguments displayed; second-input additivity is native linear-map additivity. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.domRestrict₁₂` (def, `Mathlib/LinearAlgebra/BilinearMap.lean`): Restrict both arguments of a bilinear map to a submodule, keeping its coefficient module. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.restrictScalars₁₂` (def, `Mathlib/LinearAlgebra/BilinearMap.lean`): Restrict the scalar ring on a bilinear map without changing its values. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsAlt` (def, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): The native alternating predicate: the diagonal values vanish. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsAlt.neg_eq` (theorem, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): An alternating bilinear form satisfies −B(y,x)=B(x,y), over the stated ring hypotheses. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.Nondegenerate` (abbrev, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): The native nondegeneracy predicate, including separation in each variable. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.flip` (abbrev, `Mathlib/LinearAlgebra/BilinearForm/Basic.lean`): The native transposed bilinear form. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.flip_apply` (theorem, `Mathlib/LinearAlgebra/BilinearForm/Basic.lean`): The transpose evaluates to B(y,x). Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsometryEquiv` (structure, `Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean`): A linear equivalence between two modules preserving the given scalar-valued forms. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.map_app` (theorem, `Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean`): Exact equality expressing preservation of the forms. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.refl` (def, `Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean`): Identity isometry. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.symm` (def, `Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean`): Inverse isometry. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:LinearMap.BilinForm.IsometryEquiv.trans` (def, `Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean`): Composition of isometries. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.BilinForm.isometryGroup` (def, `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean`): Subgroup of linear automorphisms preserving a bilinear form; available over any commutative semiring, without a new symplectic-space wrapper. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.BilinForm.mem_isometryGroup` (theorem, `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean`): Membership is preservation of every bilinear value. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `tauceti:TauCeti.BilinForm.isometryGroupEquivIsometryEquiv` (def, `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean`): Equivalence from the subgroup carrier to native self-isometries. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:groupCohomology.IsMulCocycle₂` (def, `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`): The multiplicative cocycle identity used by FactorSet. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:Subgroup.mem_center_iff` (theorem, `Mathlib/GroupTheory/Subgroup/Center.lean`): An element belongs to the center iff it commutes with every group element. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:Matrix.toBilin'` (def, `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean`): The matrix bilinear form x,y↦Σ xᵢMᵢⱼyⱼ, used directly in the tests. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:Matrix.toBilin'_apply` (theorem, `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean`): Explicit finite-sum evaluation of that matrix form. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:Multiplicative` (def, `Mathlib/Algebra/Group/TypeTags/Basic.lean`): Existing multiplicative view of an additive group; no new additive central-extension type is needed. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:invOf_mul_self` (theorem, `Mathlib/Algebra/Group/Invertible/Defs.lean`): The chosen inverse of an invertible element multiplied by it is one. Actual statement read at the pinned commit; source bytes verified against the pinned tree.
- `mathlib:Representation.Coinvariants` (def, `Mathlib/RepresentationTheory/Coinvariants.lean`): The algebraic module quotient by the span of ρ(g)v−v; no smooth-category assertion. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:Representation.Coinvariants.mk` (def, `Mathlib/RepresentationTheory/Coinvariants.lean`): Native quotient linear map onto the algebraic coinvariants. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:Representation.Coinvariants.lift` (def, `Mathlib/RepresentationTheory/Coinvariants.lean`): A linear map satisfying f∘ρ(g)=f descends uniquely to the quotient. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:Representation.IntertwiningMap` (structure, `Mathlib/RepresentationTheory/Intertwining.lean`): Linear map with the exact equivariance condition. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:Representation.Equiv` (structure, `Mathlib/RepresentationTheory/Intertwining.lean`): An equivariant linear equivalence of native algebraic representations. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:ContRepresentation` (structure, `Mathlib/RepresentationTheory/Continuous/Basic.lean`): A monoid homomorphism into continuous linear endomorphisms. It imposes no continuity of the group parameter. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:ContRepresentation.toRepresentation` (abbrev, `Mathlib/RepresentationTheory/Continuous/Basic.lean`): Underlying algebraic representation of a continuous-operator representation. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:SchwartzMap` (structure, `Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean`): Native real smooth functions with all polynomially weighted derivative seminorm bounds. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:SemidirectProduct` (structure, `Mathlib/GroupTheory/SemidirectProduct.lean`): Native semidirect-product carrier and group law for an action by multiplicative automorphisms. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:rootsOfUnity` (def, `Mathlib/RingTheory/RootsOfUnity/Basic.lean`): The subgroup of units satisfying ζ^n=1; at n=2,C this is μ₂. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:QuotientGroup.rightRel` (def, `Mathlib/GroupTheory/Coset/Defs.lean`): Right-coset setoid y*x⁻¹∈H. Its quotient supplies H\G in the Poincaré sum. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:CongruenceSubgroup.Gamma0` (def, `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): Native subgroup of SL₂(Z) with lower-left entry zero mod N. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:Complex.Gamma` (def, `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`): Complex Gamma using the analytically continued auxiliary definition; poles and argument conventions are retained. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:IsArtinian` (abbrev, `Mathlib/RingTheory/Artinian/Defs.lean`): Well-founded strict submodule order; finite-length theta modules need the separate smooth-category theorem. Declaration statement read; module bytes verified against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

## Stage refinements and structural proposals

### MP.0 — planned

- Product Haar measure on the Heisenberg group proof/signature boundary: AL.0 currently states Fourier inversion on the scalar local field. Its finite-dimensional vector-space extension, measure determinant law, and the symplectic determinant-one bridge must be supplied and checked before this signature is closed.
- Schrödinger representation proof/signature boundary: The exact finite-dimensional and joint archimedean Schwartz carriers are an AL.0 Part II request; neither a formal function symbol nor the scalar supplier alone supplies them.
- Hilbert Schrödinger model proof/signature boundary: Native L² density and finite-dimensional local-field measure input must be instantiated; an abstract norm-preserving monoid homomorphism alone is not the required strongly continuous model.
- Smooth vectors of the oscillator model proof/signature boundary: The nonarchimedean compact-open argument and the archimedean Sobolev/Fréchet comparison require a matching proof source and a native smooth-vector carrier from SR.0/AF.1. The source citation here does not establish the archimedean conclusion.

### MP.1 — planned

- Smooth Stone–von Neumann theorem proof/signature boundary: Kudla and Sun–Zhu both refer this proof to MVW 2.I.2; that book proof has not been read. The smooth uniqueness and scalar Schur step remain explicit proof gaps until a matching source is checked.
- Unitary Stone–von Neumann theorem proof/signature boundary: Garrett’s real proof supplies the route with the two recorded textual corrections; its Schwartz Fourier-density step, the complex reduction and nonarchimedean unitary analogue still need analytic proof closure and native irreducibility formulation.
- Unitary normalizer extension proof/signature boundary: Strong operator topology and the local-chart proof must be supplied on native unitary automorphisms; native ContRepresentation supplies only continuous linear operators, not continuity in g.
- Rao factor set proof/signature boundary: Bruhat x(g), j(g), Leray rank and t-integrality still require their full sourced definitions/proofs; the formula specifies the target but does not conceal those data as arbitrary functions.
- Metaplectic double cover proof/signature boundary: The continuous character λ₂ and big-cell gluing proof must be turned into a concrete native topological-group signature; a raw FactorSet extension alone supplies only the algebraic group.

### MP.2 — planned

- Weil index proof/signature boundary: AL.0 Part II must supply Fourier transforms of oscillatory distributions and finite-dimensional self-dual measure; the native Fourier integral on integrable functions cannot itself define γ.
- Leray quadratic form proof/signature boundary: The general quotient’s transversality and the integral-composition proof require Rao’s argument; the graph sign is checked directly from Kudla p.11. That referenced proof has not been read.
- Leray cocycle of intertwiners proof/signature boundary: Kudla refers the integral-composition proof to Rao; exact quotient integral normalizations must be checked before promoting this proof route to closure.
- Generator relations and intrinsic comparison proof/signature boundary: Weil’s big-cell proof continuation and the complete presentation-to-operator calculation must be checked; this node records the exact comparison target rather than assuming all generator formulas define a representation.
- Quadratic uncertainty principle proof/signature boundary: The native valuation and finite-dimensional Schwartz carriers must be supplied by AL.0 Part II; the proof and exact strict/non-strict cone definitions were read, including residue characteristic2.
- Hermitian oscillator normalizations proof/signature boundary: The γ_V=−1 assertion for the specific nonsplit Hermitian datum in Li–Zhang Lemma 6.3.1 and Zhang’s Deligne epsilon-factor input need original proof closure. General Fourier theory stays with AL.0/AL.2.

### MP.3 — planned

- Unitary dual-pair splittings proof/signature boundary: The cited papers invoke Kudla’s unitary splitting formula; its original proof and exact δ convention must be collated. The generic Hermitian-space carrier belongs to upstream ClassicalGroups, not to this packet.
- Finite length of theta modules proof/signature boundary: The generic SR criteria are requested; the exact archimedean finite-generation proof and its globalization/automatic-continuity bridge remain unverified.
- Howe duality proof/signature boundary: Gan–Takeda proof continuation PDF 11–21 and its type-II/MVW inputs need complete proof closure; the full quaternionic Gan–Sun theorem and archimedean Howe/automatic-continuity sources remain requested.
- Local see-saw identity proof/signature boundary: Kudla IV.1 pp59–66 has been read. Its common oscillator, sum tensorization and specialized application supply the route; a general native smooth tensor–Hom/dual adjunction, with the exact infinite-dimensional dual and admissibility conditions, remains to be supplied from SR and the unread original references.
- Type-II theta input proof/signature boundary: Mínguez’s original proof and the full unequal-rank parameter formula have not been read; only the cited input needed by Gan–Takeda is planned.
- MVW involution and metaplectic induction proof/signature boundary: Original MVW irreducible-duality proof and real-cover variant remain supplier/source requests; a cited use does not close those proofs.
- Archimedean first-occurrence cases proof/signature boundary: The cited degenerate-principal-series and archimedean Howe/automatic-continuity inputs are not proved here; §7 references are recorded as requests.
- Unitary equal and almost equal rank proof/signature boundary: LLC/root-number supplier stage and original theta-dichotomy proofs require an exact owner mapping; the packet requests that mapping rather than inventing an existing declaration.
- Unitary doubling multiplicity and dichotomy proof/signature boundary: Li–Liu’s broader semisimplicity assertion refers to the same argument as Gan–Ichino; matching that argument to its complete hypotheses remains open (existing paper finding E15).
- Unramified metaplectic theta and induction proof/signature boundary: PDF 24 start of Lemma 6.8 and every removed-pair exponent must be collated before the smaller-tower parameter signature is closed; this node does not substitute an unqualified Satake assertion.
- Rallis unramified theta parameters proof/signature boundary: Ral82 original local computation is cited but unread; the exact dimension-dependent segment remains a source gate rather than an invented formula.
- Unitary theta Hecke compatibility proof/signature boundary: The original Liu spherical module theorem and split-place AppendixA computation are unread; the broader tempered big-lift semisimplicity cited in Proposition 3.9 remains the same explicit proof gate.
- Quaternionic similitude dual pair proof/signature boundary: Quaternionic Hermitian and connected similitude carriers are imported from upstream; exact layer mapping is requested.
- Quaternionic similitude splitting proof/signature boundary: Original Kudla unitary and Periods-I/II splittings remain unread inputs. Existing E6 replaces s(g₂) by s_v(g₂).
- Quaternionic see-saw and Periods-II comparison proof/signature boundary: The original Periods-II splitting remains unread; AppendixA supplies the comparison.
- Periods-I splitting comparison proof/signature boundary: The original Periods-I construction is an unread referenced input.
- Similitude theta correspondence proof/signature boundary: Original similitude Howe and Clifford inputs must be instantiated; compact induction is supplied by SR.2.
- Real discrete-series theta lifts proof/signature boundary: The original archimedean identification and complete root data remain an AF.1/source gate.
- Quaternionic unramified theta lift proof/signature boundary: Lemma 9.4 omits its local calculation; an explicit Hecke computation must close it.
- Rank-one oscillator constituents proof/signature boundary: The §11.4 proof continuation and original rank-one extension theorem require full reading; existing E36 corrects ψ to its conjugate in the theta input.
- Minimal orthogonal theta lift proof/signature boundary: Yamana Proposition 8.4 is invoked for the minimal theta realization but its original proof is unread. GS23 Proposition 14.2 and §14.3 prove finite length of the specified Hom modules; the original exceptional realization and generic smooth tensor–Hom/finite-index restriction steps remain supplier inputs.
- Division ternary theta lift proof/signature boundary: The source domain is irreducible supercuspidal rho on PGL2 and its JL(rho) on PB×, as read before GS23 Lemma 15.4. The original rank-one Waldspurger/Jacquet–Langlands proofs and exact carrier/psi comparison remain unread supplier inputs.
- PGSp₆–PGSO₈ similitude theta proof/signature boundary: Exact local LLC and Spin representation supplier mapping must be supplied; the generic theta theorem is cited in the source rather than reproved there.
- Relevant unitary local dichotomy proof/signature boundary: The original [20,Thm3.10]/[19,Thm1.3(ii)] proof scope and big-lift irreducibility still require collation.
- Archimedean Howe duality original-source and category boundary: Gan–Ichino18 and Gan–Savin23 invoke classical Howe duality. Their invocation is read; Howe’s archimedean original proof and its Harish-Chandra/globalization comparison have not been read here. Supply the full real/complex theorem with exact categories before closing this node.

### MP.4 — planned

- Adelic metaplectic cover proof/signature boundary: Native restricted-product topology and quotient-group instances must be instantiated with AA.1; the topological cocycle charts are not supplied by a bare algebraic FactorSet.
- Weil product formula proof/signature boundary: The oscillatory-distribution version of AL.0 Poisson and its finite-dimensional self-dual normalization remain a Part-II request.
- Adelic Weil representation proof/signature boundary: AL.0’s scalar adelic space needs the finite-dimensional/joint archimedean extension; the completion and continuous action comparison must be supplied.
- Function-field metaplectic programme proof/signature boundary: Metaplectic Satake/fusion, gerbe sheaves and modified excursion operators are a proposed upstream Part-II request; §14 does not establish all of them.

### MP.5 — planned

- Theta kernel proof/signature boundary: The full finite-dimensional joint Schwartz lattice summability proof and native global function-space inclusion need the requested AL.0 extension.
- Theta smoothness and growth transfer proof/signature boundary: Weil’s cited continuity proof alone does not prove uniform moderate growth. The differentiated lattice majorant and finite-cover height comparison are explicit missing proof steps, requested from AA.3/AF.2 with an MP-specific transfer.
- Genuine automorphic spaces proof/signature boundary: AF.1–3 do not themselves define a cover automorphic space. Native smooth/globalized function carriers and the finite-cover comparison remain required signatures; they are not replaced by arbitrary Prop fields.
- Unipotent splittings proof/signature boundary: The complete root-relation proof and native rational-unipotent carrier are supplier/gap inputs; the Siegel formula alone is not a proof for every U.
- Metaplectic constant terms and Whittaker coefficients proof/signature boundary: Native unipotent quotient integration and Fourier-completeness topology must be instantiated from AA/AL; the module-level averaging prototype does not establish smooth cover expansions.
- Global theta lift proof/signature boundary: The source-qualified cuspidal growth/decay transfer and actual global automorphic module carrier must be completed; a totalized integral alone does not satisfy the convergence contract.
- Weil convergence criterion proof/signature boundary: The original convergence proof referenced by GQT is not fully read; its finite-cover/reduction comparison is retained as a proof gap.
- Regularized theta integral proof/signature boundary: Regularizer existence, independence and operator eigenvalue proofs need their original sources; the native meromorphic family and normalized Eisenstein carrier are AS requests with an MP adaptation.
- Extended Schwartz Weil action proof/signature boundary: The complete YZZ/Waldspurger extended-action reference is unread; its native carrier and operator comparison are an explicit missing input.
- Unit-quotiented theta series proof/signature boundary: The unit/Gaussian convergence argument and full extended rational-action comparison need a native finite-dimensional implementation and the unread extended-action source.
- Extended restriction comparison proof/signature boundary: The abbreviated restriction formula suppresses splitting-character data. The generator comparison and exact source convention must be reconciled; only the matching-character version is targeted without an extra ratio.
- Ideal-class theta series proof/signature boundary: Native ideal-class count/norm-lattice equivalence and normal convergence are GN/AL supplier inputs; no unary jacobiTheta theorem is substituted for this binary theta object.
- Ideal-class theta modularity proof/signature boundary: Hecke/Schoeneberg’s original all-discriminant modularity proof is not read; GZ quotes it. Its exact classical modular-form carrier and cusp comparison remain requested.
- Ideal-class theta transformation proof/signature boundary: The finite Gauss-sum proof needs the exact quadratic-character supplier; the visually read statement and its odd-D hypothesis are retained without claiming the full computation is implemented.
- Genuine Eisenstein families proof/signature boundary: General covered parabolic induction, convergence and normalized meromorphic intertwiners require source-qualified SR/AS extensions. GQT’s Siegel example does not close a general cover Langlands theorem.

### MP.6 — planned

- Theta measure conventions proof/signature boundary: AA.2 supplies connected algebraic groups. Its Part-II disconnected orthogonal component normalization and the exact GQT measure comparison are requested, not inferred.
- Siegel–Weil section proof/signature boundary: Native degenerate induction, flat sections and meromorphic cover Eisenstein families are AS/SR supplier requests; evaluation on actual function spaces is prototyped without inventing those analytic carriers.
- Ikeda map proof/signature boundary: The finite-dimensional Schwartz integration carrier and exact equivariance proof must be supplied by the AL extension and GQT source comparison.
- Anisotropic Siegel–Weil formula proof/signature boundary: The original anisotropic identity and exact constant proof are cited by GQT but not fully read; the scalar must be rechecked against the adopted normalized I convention.
- Regularized first-term identity proof/signature boundary: The first-term identity proof inputs and the exceptional boundary calculation require their referenced original proofs; all ranges and coefficient conventions are retained for review.
- Regularized second-term identity proof/signature boundary: The induction and constant-term proof continuation after the read statements is not fully checked. The exact κ_{r,r′} evaluation and quotient carrier remain implementation/review work.
- Coherent and incoherent sections proof/signature boundary: Exact global Hermitian classification and the incoherent functional-equation comparison are QFI/AS Part-II supplier inputs. No arithmetic derivative identity is asserted here.
- Unitary Siegel–Weil measure proof/signature boundary: The referenced LL21 local identity proof is unread; its rational Haar scalar and native orbital-integral carrier remain precise supplier/proof inputs.
- Unitary theta coherence parity proof/signature boundary: The exact global Hermitian existence theorem and native local invariant carrier are QFI supplier requests; no arithmetic height assertion is part of this node.
- Doubling Schwartz map proof/signature boundary: The exact partial Fourier kernel and native completed/joint tensor comparison remain a finite-dimensional AL Part-II input.
- Local doubling zeta integral proof/signature boundary: The original PSR/Yamana local doubling theorem and ramified test-vector calculation are unread proof inputs; AL owns local L-factors, not this integral’s automatic normalization.
- Factorization of theta pairings proof/signature boundary: The complete unfolding proof and each ramified integral comparison require their original sources and native restricted quotient integration.
- Rallis inner product formula proof/signature boundary: The referenced Yamana/PSR proof, holomorphy criterion and exact Val interpretation are not fully read; statement and ranges are checked but the proof chain remains open.
- Global theta nonvanishing criterion proof/signature boundary: The cited real induced-module diagrams and original local comparison proofs are unread; Conjecture11.5 is not used as a theorem. The target preserves Proposition 11.6/Theorem 11.7’s restricted hypotheses.
- Global see-saw and spectral projection proof/signature boundary: The full global see-saw/projection proof and regularized analogue are source/spectral gaps; IP’s checked constructions provide only the stated specialized compatibility route.
- Jacobi group proof/signature boundary: The topological semidirect-product and actual smooth representation instances must be elaborated; positive similitude transport is a comparison with MP.8, not a new fixed-index action.
- Jacobi spaces proof/signature boundary: The common smooth section and holomorphic Jacobi carrier is not yet present. The MP.8 specialization imports MP.6; its statement is used as a consumer contract, not as a circular proof of this definition.
- Fourier–Jacobi extraction proof/signature boundary: The exact unipotent/center quotient and weight-section carrier need supplier elaboration; genus-two half-integral Fourier matrices are already owned by MP.8.
- Jacobi theta decomposition interface proof/signature boundary: The generic lattice theta-decomposition proof/carrier remains open. MP.8 depends on the common MP.6 interface; cross-references record the specialization contract rather than a closed cyclic proof.
- Ideal-lattice Poisson comparison proof/signature boundary: The finite-dimensional complex Gaussian Fourier/covolume comparison is an AL Part-II input; ideal trace-duality belongs to GN.3.
- Toric theta pairing interface proof/signature boundary: The exact original toric theta unfolding/ramified local calculations are not read. GZ.5 must supply its period theorem; MP.6 supplies the common kernel, convergence/range and normalization adapter, with this proof gap explicit.

### MP.7 — planned

- Weight-one-half Maass space proof/signature boundary: The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.
- Completed half-weight Eisenstein family proof/signature boundary: The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.
- Plus projection and old normalization bridge proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Half-weight resolvent kernel proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Half-weight Poincaré family proof/signature boundary: The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.
- Half-weight Poincaré residues proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Plus Bessel coefficient family proof/signature boundary: The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.
- Plus coefficient residue theorem proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Kohnen–Salié divisor identity proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Plus Hecke eigenbasis proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Shimura lift from an eigenline proof/signature boundary: The actual Maass/Whittaker/Eisenstein or meromorphic spectral carrier and its supplier’s convergence/domain conditions are not fully present at the pin. The suggested native function-space signature omits unstatable analytic conditions and records them here; it does not use an arbitrary Prop field.
- Shimura bijection of eigenlines proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Duke coefficient estimate with spectral factor proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Fourier expansion and residues of the weight-1/2 resolvent (Fay, cited) proof/signature boundary: The original projection/Fay resolvent, Kohnen finite-sum, p=2 Hecke, Baruch–Mao or Duke proof used by this target has not all been read. Its exact source and native spectral/Hecke carrier are required before closure; the read DIT statement is not itself proof closure.
- Geometric trace proof/signature boundary: The actual arithmetic cycle, genus character and differentiable Maass carriers are GN/AS inputs. Generic geometric construction and the Stokes core remain with their owners.
- Biró lift proof/signature boundary: The intervening kernel proof and cited Iwaniec/Whittaker theorems are not fully read. The checked theorem and finite Fourier argument are retained; the false one-point convergence sentence is corrected explicitly.
- Adelic and classical half-weight comparison proof/signature boundary: The full adelization equivalence and metaplectic Hecke comparison need an exact original proof source. QM.3 owns the holomorphic-weight Laplacian; its concrete conjugacy, not an identical formula, supplies this comparison.
- BFH metaplectic kernel interface proof/signature boundary: BFH proofs after printed 553 and its local Whittaker/Euler computations were not read in this run. They are supplied as planned MP.8 nodes with their own open proof gates, not promoted to checked results.
- Ramified quadratic-twist kernel inputs proof/signature boundary: FH95 full public mathematical text was not obtained: only the publisher metadata was read. Its exact kernel/ramified-local adapter remains to be stated after acquisition. This records the missing MP.7 target explicitly instead of claiming the BFH family proves it.

**rescope.** MP.0 asks to construct polarizations, while the existing LV.3/lagrangian-symplectic-basis node already gives Lagrangian complements, symplectic bases and the associated graph coordinates over a field, including characteristic two. The native isometry group is also already in Tau Ceti. Keep the existing MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis node and its ownership. Narrow the algebraic-polarization wording of MP.0 to import that result, then construct the Heisenberg coordinate maps, topology and actual Schrödinger models here. The current twelve declarations use a supplied bilinear form and do not depend on choosing a Lagrangian complement; no new symplectic-space wrapper or duplicate basis theorem is proposed.

**prerequisites.** The four confirmed red-team findings require SR.0/2/3 and real AF.1 before local theta modules, plus AA.3 and AF.2/3 before convergence/automorphic theta spaces. Add these named stage prerequisites explicitly; retain MP cover/theta adapters rather than treating algebraic operators as smooth admissible modules or moderate-growth automorphic forms.

**part-ii.** The requested finite-dimensional/joint Schwartz distribution, disconnected orthogonal measure and conditional metaplectic geometric adapters exceed existing scalar/connected/ordinary contracts. Extend those suppliers as PartII with the requests’ exact contracts; preserve their existing definitions and do not duplicate them in MP.

**sublayers.** MP.3 now contains distinct orthogonal/unitary, quaternionic splitting, conservation/first-occurrence and specialized classical theta adapters; MP.7 has multiplier/operators, Eisenstein/resolvent, finite sums and Shimura trace groups. Display those groups as sublayers in a future structure job, retaining current MP.0–7 ids and the current maximum of six source-named planets per layer. MP.8 remains the genus-two BFH supplier.

## Validation boundary

The packet checker reports zero errors and zero warnings. Native signature fragments for 142 nodes in the Mathlib-only suffix elaborate against the pinned Mathlib, with 377 warnings, all declaration proof placeholders. This checks syntax and native types, not the omitted mathematical conditions or proofs. The complete suggested file **was not compiled**: the shared build lacks the compiled Tau Ceti ProjectiveRepresentation.Extension module. The inherited twelve nodes and the twenty-two further Tau-dependent nodes are outside that checked suffix. No dependency build was attempted. All 176 declaration names, 181 API names and 179 test names are present in the suggested file.

## Round-3 closure boundaries

### Special-function uniformity beyond the exact carriers

The broad QM.2 imports are replaced by its existing I/J nodes and AS.0/dit-112 for Whittaker M/W. The three fine-node requests retain the missing complex-order uniform differentiated bounds and continued exceptional-parameter domains. Neither a real-order I estimate nor a fixed-parameter Whittaker asymptotic proves these uniform estimates.

Needed by: `MetaplecticAutomorphicForms:MP.7/plus-bessel-coefficient`; `MetaplecticAutomorphicForms:MP.7/negative-cycle-poincare-sum`; `MetaplecticAutomorphicForms:MP.7/half-weight-poincare`; `MetaplecticAutomorphicForms:MP.7/half-weight-fourier-expansion`.

### Classical and unitary Jacobi consumer contracts

QM.1’s request to MP.6, items(a)–(e), is binding: the discrete J_n(Γ) and Heisenberg-center bridge; matrix-index slash action; typus(Γ,V) and Fourier cusp support; half-integral scalar index through central characters or z↦2z; the elliptic-function theta decomposition and Skoruppa Theorem5, with the dual finite Weil module and finite-image hypothesis. The existing four adelic integral-index contracts do not yet supply these outputs, so QM.1’s eight stage prerequisites remain. Also extract the unitary Jacobi/Schrödinger–Weil and Fourier–Jacobi instance needed by AutomorphicCongruences:L2s, with its unitary splitting, coefficient/index and multiplier conventions. No use by L2 itself has been established, and no L2 edge is added. BFH genus-two and QM classical q-series specializations retain their owners.

Needed by: `MetaplecticAutomorphicForms:MP.6/jacobi-group`; `MetaplecticAutomorphicForms:MP.6/jacobi-spaces`; `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction`; `MetaplecticAutomorphicForms:MP.6/jacobi-theta-decomposition-interface`.


## Round-3 structural proposals

### RT-AREA-automorphic-1/20 and the round2 review: the four MP.6 adelic contracts exist, but are insufficient for the matrix-index/half-integral classical and unitary consumers.

Keep one Jacobi producer before MP.7, using the four existing MP.6 nodes. Complete exactly QM.1 request items(a)–(e) at least for SL₂ and a lattice index; add the separately source-qualified unitary instance for L2s. Skoruppa arXiv:0707.0718v1 §4 pp.10–13 fixes the classical action, cusp support and dual-Weil conventions; it does not prove a general unitary theorem. Retarget QM.1’s eight prerequisites only after those outputs exist. Keep MP.8’s GSp4 cover/BFH normalization and QM.1’s eta, theta, weak forms and q-series operations. No L2 edge follows from its embedded L2s paragraph. The MP.7 special-function consumers now cite the actual independent I/J and Whittaker carrier nodes; the remaining uniformity requests are explicit.
