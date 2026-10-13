# Explicit K₂: the classical field presentation

The field-symbol layer connects a concrete commutator in the stable Steinberg group to an integral tensor presentation. Its central requirement is a proof that this presentation has exactly the relations it states. Bilinearity and the Steinberg relation construct a map into classical K₂; completeness makes that map an isomorphism. The same integral presentation supplies Milnor K-theory, its degree-two comparison, its sign rules, and the elementary field computations used by the residue and reciprocity layers.

This document specifies the additional proof inputs for `K2SymbolsBrauer:T.2:symbols`. The definitions and theorem targets already owned by the accepted [T.1 packet](../packets/K2SymbolsBrauer--T.1.json) keep their identifiers. The [new packet](../packets/K2SymbolsBrauer--T.2-symbols.json) supplies their missing field-specific proof inputs. The graded map into Quillen K-theory belongs to `K2SymbolsBrauer:T.2:graded-map`; valuation residues and reciprocity belong to T.3 and T.6. Their APIs consume this layer rather than being constructed here.

Suggested homes are `TauCeti/Algebra/KTheory/FieldSymbols`, `TauCeti/Algebra/KTheory/Milnor`, and a subdirectory for the symbol-dependent extension construction. The implementation should retain the existing Steinberg, elementary-matrix, factor-set, tensor and quotient vocabulary. An object already owned by T.1 or by an upstream roadmap is imported under its existing name.

## Conventions and mathematical boundary

All fields in this layer are commutative. General associative-ring identities, division-ring symbol presentations and commutative semilocal-ring generation stay with their existing targets in T.1. A theorem established here for fields cannot close a predecessor gap for arbitrary rings.

Write `Fˣ` for the group of units and `U = Additive Fˣ` for its additive form. Thus the additive operation in U corresponds to multiplication of units, its zero corresponds to the field unit 1, and its negative corresponds to inversion. Every tensor, submodule span and module homomorphism in the presentation is over the integers. There is no tensor product over F: U is not an F-vector space. A complementary pair consists of units a,b satisfying their value equation a+b=1 in F. The familiar notation b=1−a is used only with a≠0,1. No totalized symbol at zero is introduced.

The group commutator is `[x,y]=xyx⁻¹y⁻¹`, matching Mathlib's `commutatorElement`. Let

`w_ij(a)=x_ij(a)x_ji(−a⁻¹)x_ij(a)` and `h_ij(a)=w_ij(a)w_ij(−1)`.

For distinct i,j,k the classical symbol is `[h_ij(a),h_ik(b)]`. Its elementary image is identity because its two diagonal images commute, and its value lies in the stable kernel K₂(F). The choice of these indices disappears through stable conjugation and centrality, supplied by T.1. Use additive notation for the Milnor and tensor quotients and multiplicative notation for words in the Steinberg group. Passing from one to the other is an explicit equivalence, not an implicit change of carrier.

The integral sign rule is skew-symmetry. Repeated entries are killed by two; they need not vanish. In particular `{a,a}={a,−1}`, `{a,−a}=0`, and `{−1,−1}` over ℝ is nonzero. The Milnor ring is graded-commutative, with sign `(−1)^(ij)` between degrees i and j. Calling its symbol algebra an exterior algebra would discard valid integral information. Characteristic two makes −1=1 and does force repeated adjacent entries to vanish.

For the extension construction take F infinite and `m≥3`. Its root system is type `A_(m−1)`, with simple roots α_i=e_i−e_(i+1), ordered in increasing i. It is the non-symplectic branch of Matsumoto's theorem. No assertion about the unstable universal central extension of SL₂ is involved. The ordinary Weyl group is the permutation group of the m coordinates; the simple normalizer matrices are w_i(−1), whose squares have −1 on the affected pair. They are not involutions when the characteristic differs from two.

The source construction has an infinite-field hypothesis. The overall Matsumoto target applies to every field, but its finite-field proof requires its own presentation argument. Vanishing of the finite Milnor tensor quotient alone does not prove vanishing of the classical stable kernel.

## Existing targets to consume

The following identifiers are references to the predecessor packet, not new copies of its nodes. They specify the public objects and results of the layer. Each added proof input below has a separate identifier under `K2SymbolsBrauer:T.2:symbols/field-proof/`.

| Existing node | Required output and convention |
| --- | --- |
| `K2SymbolsBrauer:T.2/star-product` | For commuting elementary matrices, the commutator of arbitrary lifts in the stable central extension is independent of the lifts. |
| `K2SymbolsBrauer:T.2/steinberg-symbol` | The diagonal commutator symbol of two units, independent of the three distinct indices, bilinear and skew-symmetric. |
| `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words` | The displayed w and h words with nonzero unit parameters; the matrix block of w is `[[0,a],[−a⁻¹,0]]`. |
| `K2SymbolsBrauer:T.2:symbols/diagonal-lift` | The image of h is diagonal, with a and a⁻¹ in its two specified coordinates. |
| `K2SymbolsBrauer:T.2/steinberg-identity` | The classical symbol of a and 1−a is identity for a≠0,1. |
| `K2SymbolsBrauer:T.2/symbol-consequences` and `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit` | The integral sign and negative-unit consequences. The direct proof here supplies their field restriction. |
| `K2SymbolsBrauer:T.2/symbols-generate` | The field restriction says every stable kernel element is a product of symbols. The broader division-ring and semilocal targets keep their own hypotheses and sources. |
| `K2SymbolsBrauer:T.2/matsumoto` | The symbol map from `(F×⊗ℤF×)/⟨a⊗(1−a)⟩` to K₂(F) is an isomorphism for every field; it is natural in field homomorphisms. |
| `K2SymbolsBrauer:T.2/k2-finite-field` | The classical K₂ of a finite field is trivial. Both symbol generation and relation annihilation are required. |
| `K2SymbolsBrauer:T.2/rational-function-field` | Leading coefficients split the inclusion K₂(F)→K₂(F(t)); the complementary relation must be checked through every degree and cancellation case. |
| `K2SymbolsBrauer:T.2:symbols/extension-kernel-torsion` | For every field extension F→E, the kernel of restriction on K₂ is torsion. The transfer-degree argument comes from GeneralAlgebraicKTheory. |
| `K2SymbolsBrauer:T.2/milnor-k-theory` | The integral graded tensor algebra of U modulo the two-sided homogeneous Steinberg ideal, with symbols, concatenation, field functoriality and the low-degree identifications. |
| `K2SymbolsBrauer:T.2/milnor-alternating` | Permuting entries multiplies a symbol by the permutation sign. This is integral skew-symmetry and retains repeated-entry 2-torsion. |
| `K2SymbolsBrauer:T.2/milnor-examples` | For a finite field, every Milnor degree n≥2 vanishes. |
| `K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed` | For algebraically closed F and n≥2, every positive integer acts bijectively on K⁽M⁾_n(F). Degree one is divisible but can have torsion. |
| `K2SymbolsBrauer:T.2:symbols/milnor-real` | For n≥1, the real Milnor group is an all-minus-one ℤ/2 summand plus its divisible positive-entry subgroup. |
| `K2SymbolsBrauer:T.2:symbols/milnor-number-field` | For a number field F and n≥3, the signature map identifies K⁽M⁾_n(F) with `(ℤ/2)^(r₁)`, one coordinate for each real embedding. |
| `K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic` | For a positive-characteristic global field, K⁽M⁾_n vanishes for n≥3; the transcendence-degree-one extension follows by finite symbol tuples. |

The last two arithmetic computations require the Bass–Tate proof, with the exact degree bound n≥3. They do not follow just from the number of real embeddings or from finite-field K₂ vanishing. A totally imaginary number field is the r₁=0 test. Degree two of a number field can be nontrivial, so that degree must fail a proposed high-degree vanishing theorem.

## Foundations and ownership

The reviewed audit records this stage as not built at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The elementary diagonal identity exists; an integral Milnor or Steinberg field presentation does not occur in the inspected pinned or current library trees.

Consume the actual tensor product and `TensorProduct.lift`, the quotient module and `Submodule.liftQ`, and `TensorAlgebra.gradedAlgebra`. The last declaration already grades the tensor algebra by powers of the range of its degree-one injection. The missing work is the homogeneous relation ideal and the proof that its ring quotient carries the required degree components. A commutative-ring `Ideal` quotient theorem does not apply automatically: a tensor algebra on a general module is noncommutative. The inherited `RingQuot` realization handles its ring quotient, while the component comparison below supplies the grading.

Finite-unit cyclicity is already a Mathlib theorem: `isCyclic_of_injective_ringHom` in `Mathlib/RingTheory/IntegralDomain.lean` applies to a finite group injecting into an integral domain. Its following instance gives cyclicity of finite groups of units. The finite-field proof should invoke this instead of planning cyclicity again. Tensor right exactness is also present: `rTensor_exact` in `Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean` requires an exact pair and a surjective second map. Those hypotheses are exactly what the multiplication-by-p argument uses.

For fields, the four existing Tau Ceti transvection statements supply additivity, disjoint commutation, forward chaining and reverse chaining. The reverse coefficient is `−(s*r)`. No general associative-ring matrix calculus is added. The diagonal decomposition `Matrix.SpecialLinearGroup.diag2nUnit_decompose` supplies the matrix image of the lift word. The lift word itself remains a Steinberg-group construction, so a matrix identity alone cannot prove a kernel relation.

Use `TauCeti.FactorSet` and its existing extension carrier for the torus construction, with trivial action and coefficient group `Multiplicative A`. `TauCeti.FactorSet.inl_range_le_center` proves centrality for that action. General group extension theory and its equivalence/classification machinery belong to the existing T.1 and Tau Ceti development. Here only the factor set depending on a prescribed field symbol, and its type-A realization, are new.

The current upstream **ReductiveGroups, Layer 7: structure theory** owns ordinary Bruhat decomposition, root data, Weyl groups and normalizers. This layer requests its exact SL_m specialization: ordered positive-root coordinates, determinant-one monomial matrices, the unique normalizer coordinate v(g), and its transformation rules. Uniqueness means uniqueness of v(g), not uniqueness of two unrestricted unipotent factors in `u v(g) u′`. The ordinary root presentation `(R1),(R2),(R3)` is also a supplied group-structure target. The symbol-dependent torus and normalizer lifts are distinct objects over those groups.

The current **RepresentationTheory/RootSystems** roadmap owns reduced words, Weyl systems and ordinary Coxeter combinatorics. The current library also contains Coxeter Matsumoto modules. That theorem concerns braid moves between reduced expressions; it is different from the K₂ presentation theorem. Consume its API if a normalizer implementation uses reduced expressions. Do not add a second Weyl or Coxeter Matsumoto plan.

The current upstream roadmaps, including the additions absent from the atlas snapshot, were searched along with current Tau Ceti. Matches for symbols occurred in ClassFieldTheory and quaternion/Brauer applications; matches for Matsumoto occurred in Coxeter theory. Those results supply consumers and distinct symbol notions, not the integral object here. The modern GrothendieckEulerForms roadmap is an ownership and quotient-design guide: its categorical K₀ constructions do not define this field-symbol quotient.

## Additional proof inputs

Each item below is a target or key proof input. Small algebraic steps remain in its proof outline. Definitions and constructions have their full planning API and discriminating checks. Heavy extension and graded-group carriers are specified here; the compact [suggested Lean file](../suggested/K2SymbolsBrauer--T.2-symbols.lean) contains only statements over existing pinned carriers.

### 1. The degree-two tensor realization

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-realization`.

Set T₂(F)=U⊗ℤU, R₂(F)=spanℤ{a⊗b : a,b∈F× and a+b=1 in F}, and Q₂(F)=T₂(F)/R₂(F). Let symbol(a,b) be the quotient class of a⊗b. For every abelian group A, evaluation on symbols identifies Homℤ(Q₂(F),A) with bilinear maps U×U→A annihilating these complementary-unit tensors.

Hypotheses: For any commutative field F, use its multiplicative unit group U=F× written additively as Additive Fˣ; all tensors and spans are over ℤ.

Proof outline:

1. Use the pinned tensor product and Submodule quotient directly. Relations are a submodule of a degree-two module, not an ideal requiring a commutative tensor algebra.
2. TensorProduct.lift extends a bilinear pairing. It vanishes on the span exactly when it vanishes on each complementary-unit tensor; use Submodule.liftQ to descend it.
3. Pure tensors generate the tensor product additively; their images generate the quotient. Equality on symbols therefore proves homomorphism extensionality.
4. A field homomorphism preserves units and complementary-unit equations. The universal property gives the induced map; identity and composition follow by extensionality.

API:

- `TauCeti.FieldSymbols.SymbolTensor`: T₂(F)=Additive Fˣ⊗ℤAdditive Fˣ.
- `TauCeti.FieldSymbols.steinbergRelations`: R₂(F) is the ℤ-span of a⊗b with a+b=1.
- `TauCeti.FieldSymbols.SymbolGroup`: Q₂(F)=T₂(F)/R₂(F).
- `TauCeti.FieldSymbols.symbol`: For units a,b, symbol(a,b) is their tensor class.
- `TauCeti.FieldSymbols.symbol_mul_left`: symbol(ab,c)=symbol(a,c)+symbol(b,c).
- `TauCeti.FieldSymbols.symbol_mul_right`: symbol(a,bc)=symbol(a,b)+symbol(a,c).
- `TauCeti.FieldSymbols.symbol_steinberg`: If a+b=1 in F then symbol(a,b)=0.
- `TauCeti.FieldSymbols.symbol_one_left`: symbol(1,a)=0.
- `TauCeti.FieldSymbols.symbol_one_right`: symbol(a,1)=0.
- `TauCeti.FieldSymbols.symbol_inv_left`: symbol(a⁻¹,b)=−symbol(a,b).
- `TauCeti.FieldSymbols.universal`: Every bilinear complementary-zero pairing factors through a unique linear map Q₂(F)→A.
- `TauCeti.FieldSymbols.hom_ext`: Two linear maps out of Q₂(F) agreeing on all symbols are equal.
- `TauCeti.FieldSymbols.map_exists`: A field map induces a unique linear map sending symbols to symbols of mapped units; the maps respect identity and composition.

Checks:

- `TauCeti.FieldSymbols.test_one` (degenerate): symbol(1,a)=0 for any field and unit a.
- `TauCeti.FieldSymbols.test_complement` (characterisation): symbol(a,b)=0 when a+b=1, with both entries units.
- `TauCeti.FieldSymbols.test_not_exterior` (non-example): symbolℝ(−1,−1)≠0; the presentation is not the exterior square of ℝ×.
- `TauCeti.FieldSymbols.test_zero_map` (computation): The zero linear map Q₂(F)→ℤ evaluates to zero on every symbol.
- `TauCeti.FieldSymbols.test_finite` (computation): Q₂(𝔽₃) is trivial.
- `TauCeti.FieldSymbols.test_char_two` (computation): symbol𝔽₂(a,a)=0 for every unit a.

Uses: K2SymbolsBrauer:T.2/matsumoto: Separates descent of the universal symbol from injectivity of the classical presentation. K3BlochGroups:V.2: A bilinear Steinberg pairing supplies a well-defined target for the boundary of a pre-Bloch symbol.

Acceptance: The universal property is unique existence, not merely existence of a descended map. The scalar ring is ℤ; quotienting by squares as well would give a different object.

Direct prerequisites: `mathlib:TensorProduct.lift`, `mathlib:Submodule.liftQ`, `mathlib:Additive`.

Source: Weibel.III.public, Definition III.7.1, printed pp.61–62; Theorem III.6.1, printed p.48. The degree-two presentation uses bilinearity and complementary entries. The universal-property formulation follows from the pinned quotient and tensor APIs.

### 2. The homogeneous Steinberg quotient bridge

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/homogeneous-components`.

In the inherited tensor-algebra definition of K*M(F), let T_n be the degree-n module. Its relation module R_n is the sum, over i+j=n−2, of images of T_i⊗R₂⊗T_j under concatenation; R₀=R₁=0. Construct canonical equivalences K⁽M⁾_n(F)≅T_n/R_n compatible with concatenation and field maps, including K⁽M⁾₂(F)≅Q₂(F). The natural map from the direct sum of these quotients to the ungraded ring quotient is an additive equivalence.

Hypotheses: For any commutative field F, use its multiplicative unit group U=F× written additively as Additive Fˣ; all tensors and spans are over ℤ. n is a natural number; the generating relations have degree exactly two.

Proof outline:

1. Consume TensorAlgebra.gradedAlgebra; do not construct the tensor-algebra grading again.
2. Describe the two-sided ideal as finite sums of words p·(a⊗b)·q, with a+b=1. Decompose p and q into their finitely many homogeneous terms; each summand remains in that ideal and has its computed degree.
3. This proves degree projection preserves the ideal. Its intersection with T_n is precisely R_n, since each word of total degree n has prefix and suffix degrees summing to n−2.
4. Each graded quotient has a multiplication induced by concatenation: R_iT_j+T_iR_j⊆R_{i+j}. Prove quotient well-definedness before asserting the grading.
5. The direct-sum map is surjective by finite homogeneous expansion and injective by componentwise ideal membership. Use this equivalence to transport the graded ring structure to the inherited ungraded quotient.
6. For n=0,1 there are no relation words, giving ℤ and U; for n=2 the prefix and suffix are scalars, giving exactly the tensor realization.

API:

- `TauCeti.MilnorK.degreePresentation`: K⁽M⁾_n(F)≃ₗ[ℤ]T_n/R_n, sending a symbol to its pure tensor class.
- `TauCeti.MilnorK.degreeTwoEquiv`: K⁽M⁾₂(F)≃ₗ[ℤ]Q₂(F), with positive symbol normalization.
- `TauCeti.MilnorK.relationComponent`: I∩T_n=R_n.
- `TauCeti.MilnorK.gradedQuotientEquiv`: The direct sum of degree quotients is the underlying additive group of the tensor-algebra ring quotient.
- `TauCeti.MilnorK.concat_quotient`: Multiplication of pure symbol classes is concatenation, and R_iT_j+T_iR_j⊆R_{i+j}.
- `TauCeti.MilnorK.degreePresentation_natural`: Every field map commutes with the degree presentation and with the degree-two equivalence.

Checks:

- `TauCeti.MilnorK.test_degree_zero` (degenerate): The degree-zero component and its multiplication are canonically ℤ; 1≠0.
- `TauCeti.MilnorK.test_degree_one` (compatibility): The degree-one symbol class identifies K⁽M⁾₁(F) with Additive Fˣ and sends the unit 1 to zero.
- `TauCeti.MilnorK.test_degree_two` (compatibility): degreeTwoEquiv({a,b})=symbol(a,b).
- `TauCeti.MilnorK.test_noncommutative_tensor` (non-example): For a free rank-two module with basis x,y, x⊗y−y⊗x≠0 before imposing relations; a commutative ideal quotient cannot supply this bridge.

Uses: K2SymbolsBrauer:T.2/milnor-k-theory: Supplies the component construction without inventing a second Milnor ring. K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed: Identifies each degree as a tensor quotient whose relation subgroup can be tested for divisibility.

Acceptance: No positive-degree relation kills an integer in degree zero. The multiplication is associative and unital and respects the grading. The degree-two equivalence sends the inherited Milnor symbol to symbol(a,b), not its inverse.

Direct prerequisites: `mathlib:TensorAlgebra`, `mathlib:TensorAlgebra.gradedAlgebra`, `mathlib:RingQuot`, `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-realization`, `K2SymbolsBrauer:T.2/milnor-k-theory`.

Source: Weibel.III.public, Definition III.7.1, printed p.61. The source defines a homogeneous ideal quotient and describes each degree by multilinear symbols. The component-intersection proof fills in the grading bridge left unstated there.

### 3. Field-only proof of the symbol sign identities

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/field-calculus`.

For any bilinear pairing c:F××F×→A into an abelian group with c(a,1−a)=0 for a≠0,1, one has c(a,−a)=0, c(a,b)=−c(b,a), c(a,a)=c(a,−1), and 2c(a,a)=0. In characteristic two c(a,a)=0. The statement applies to the inherited classical symbol and the tensor realization without a general-ring localization theorem.

Hypotheses: F is a commutative field; A is an abelian group; c is bilinear in multiplicative units and annihilates complementary units.

Proof outline:

1. Bilinearity gives c(1,b)=c(a,1)=0, inversion identities and 2c(a,−1)=c(a,1)=0.
2. For a≠1, apply the relation to a⁻¹ and (a−1)/a; expanding gives c(a,a−1)=c(a,a). Apply the relation to a and −(a−1) to get c(a,−1)+c(a,a)=0. This also handles a=1 by normalization.
3. Thus c(a,−a)=0. Expand c(ab,−ab) using −ab=(−a)b=a(−b), cancel the diagonal-negative terms and obtain c(a,b)+c(b,a)=0.
4. Since c(a,−1) is killed by two, its negative equals itself, yielding the square formula with the stated sign. In characteristic two −1=1, so the square is zero.

Acceptance: No assumption that 1−a is a unit is made when a=1; that case has its own normalization argument. Over ℝ the square c(−1,−1) need not vanish. The proof does not use Matsumoto injectivity or residues.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-realization`, `K2SymbolsBrauer:T.2/steinberg-symbol`, `K2SymbolsBrauer:T.2/steinberg-identity`.

Source: Weibel.III.public, Definition III.7.1, printed p.61; Exercise III.6.3, printed pp.58–59; identity preceding III.6.1, printed p.47. Bilinearity and the Steinberg relation imply the field identities. This proof supplies the field restriction of the inherited general-ring consequence nodes. The field calculation is written out independently.

### 4. Weyl conjugation and commutator-symbol normalization

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/root-word-normalization`.

For commutative F and pairwise distinct i,j,k in St_m(F), m≥3, w_ij(r)w_ij(−r)=1, w_ij(r)x_ij(s)w_ij(r)⁻¹=x_ji(−r⁻²s), and w_ij(r)x_ji(s)w_ij(r)⁻¹=x_ij(−r²s). After stabilization, or in a compatible central extension, the inherited commutator convention gives {r,s}=h_ij(rs)h_ij(r)⁻¹h_ij(s)⁻¹=h_ij(r)h_ij(s)h_ij(rs)⁻¹. This fixes the positive normalization when comparing Matsumoto’s cocycle with the classical symbol.

Hypotheses: r,s∈F× for torus expressions; the root parameter in conjugation can be any field element; m≥3.

Proof outline:

1. The inverse word follows by reversing the three root generators and negating parameters. For a nonopposite root expand the three conjugations using the ordinary chaining relations; retain the root coefficient order.
2. For opposite roots choose the third index and express x_ij(s) as [x_ik(s),x_kj(1)]. Conjugate both nonopposite factors and recombine with the chaining relation. This gives the two opposite-root formulas without adding them as relations.
3. Conjugation by h_ik(r) scales the ij root parameter by r and the ji parameter by r⁻¹. Thus h_ik(r)h_ij(s)h_ik(r)⁻¹=w_ij(rs)w_ij(−r)=h_ij(rs)h_ij(r)⁻¹.
4. In the stable central extension, taking the commutator gives {r,s}=h_ij(rs)h_ij(r)⁻¹h_ij(s)⁻¹. Swapping r,s and using central skew-symmetry identifies this with h_ij(r)h_ij(s)h_ij(rs)⁻¹. Do not commute two same-root torus lifts without their central correction.

Acceptance: The coefficient −r⁻²s is required in the opposite-root conjugation formula. The two inverse torus factors appear in order r then s; reversing them changes the result in general. No finite-rank kernel centrality is assumed from the stable centre theorem; the torus-defect equality is asserted stably or in an explicitly central extension.

Direct prerequisites: `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`, `K2SymbolsBrauer:T.2/steinberg-symbol`.

Source: Weibel.III.public, Exercises III.5.8–5.9, printed p.46, with the torus-factor order corrected; Matsumoto Lemma 5.4(c), printed p.26. Root-word conjugation supplies the opposite-root identities and the torus-defect interpretation. The inspected author chapter prints the inverse torus factors in the opposite order in Exercise 5.9; the calculation and independent Matsumoto comparison use the corrected order.

### 5. The type-A torus factor set for a prescribed symbol

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/torus-factor-set`.

For infinite F, m≥3, an abelian A and bilinear Steinberg pairing c, index simple roots by 1,…,m−1, α_i=e_i−e_{i+1}. On H=(F×)^(m−1) define C(t,u)=Σ_i c(t_i,u_i)−Σ_{i=2}^{m−1}c(t_i,u_{i−1}). Use the pinned normalized factor-set extension to form H~. Its ordered section is the product of h_i(t_i); the torus image in SL_m is ∏diag_i(t_i,t_i⁻¹), not the tuple interpreted as diagonal entries.

Hypotheses: F infinite and commutative; m≥3; A an additive abelian group; c bilinear with the Steinberg relation.

Proof outline:

1. Use Multiplicative A and the trivial H action in TauCeti.FactorSet. Bilinearity of C gives the cocycle equation and C(1,t)=C(t,1)=0.
2. The Cartan entries for type A are 2 on the diagonal, −1 on adjacent nodes and zero otherwise. The lower adjacent sum records exactly the central correction for reordering the chosen simple-root lifts.
3. Use the existing factor-set extension injection and centrality theorem. Ordered section multiplication has defect C; the single-root defect is c(a,b).
4. Convert simple-coroot coordinates to diagonal coordinates: (t₁,t₂/t₁,…,t_{m−1}/t_{m−2},t_{m−1}⁻¹). This is the determinant-one torus.

API:

- `TauCeti.FieldSymbolExtension.torusFactor`: The normalized factor set C on simple-coroot coordinates.
- `TauCeti.FieldSymbolExtension.torusSection_mul`: section(t)section(u)=inl(C(t,u))section(tu).
- `TauCeti.FieldSymbolExtension.torus_injective`: The coefficient map A→H~ is injective and central.
- `TauCeti.FieldSymbolExtension.simple_defect`: h_i(a)h_i(b)h_i(ab)⁻¹=inl(c(a,b)).
- `TauCeti.FieldSymbolExtension.torus_coordinates`: Projection of section(t) is diag(t₁,t₂/t₁,…,t_last⁻¹).

Checks:

- `TauCeti.FieldSymbolExtension.test_rank_three_factor` (computation): For m=3, C((a,b),(d,e))=c(a,d)+c(b,e)−c(b,d).
- `TauCeti.FieldSymbolExtension.test_torus_identity` (degenerate): C(1,t)=C(t,1)=0.
- `TauCeti.FieldSymbolExtension.test_torus_zero_symbol` (compatibility): For c=0, H~ identifies with Multiplicative A×H with the product group law.
- `TauCeti.FieldSymbolExtension.test_torus_cartan_sign` (characterisation): For adjacent i<j, [h_i(a),h_j(b)]=inl(−c(a,b)); a plus sign in the lower correction fails this check.

Uses: Matsumoto Lemma 6.6, pp.39–40: The torus extension is the coefficient-preserving input to the lifted normalizer. K2SymbolsBrauer:T.2/matsumoto: The universal pairing must survive as actual injected central elements.

Acceptance: For type A₂ the factor is c(t₁,u₁)+c(t₂,u₂)−c(t₂,u₁). A is injected, rather than quotiented by an unstated relation.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/field-calculus`, `tauceti:TauCeti.FactorSet`, `tauceti:TauCeti.FactorSet.inl_range_le_center`.

Source: Matsumoto.1969, §6, construction (2)–(3), printed pp.35–37; Lemma 5.4(c), printed pp.26–27. The ordered torus extension records the prescribed root-symbol cocycles and Cartan corrections. The formula is its additive type-A specialization.

### 6. The symbol-dependent lift of the type-A normalizer

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/normalizer-lift`.

Extend H~ to N~ over the monomial determinant-one normalizer N⊂SL_m(F), with simple lifts w_i=w_i(−1), root-torus lifts h_i(t), injected central A and kernel A. The action is θ_i⁻¹(h_j(t))=h_j(t)h_i(t^(−⟨α_i,α_j∨⟩)); θ_i fixes A. Its square is conjugation by h_i(−1), the w_i satisfy type-A braid relations, and w_i²=h_i(−1).

Hypotheses: The input and conventions of torus-factor-set, with the ordered type-A simple roots.

Proof outline:

1. Consume the ordinary normalizer and Weyl group from ReductiveGroups Layer 7; the coefficient-dependent lifting is new work here.
2. Verify the stated θ_i⁻¹ preserves torus multiplication, using field-calculus for equal, adjacent and nonadjacent indices. Its square is inner by h_i(−1), not generally the identity on the torus extension.
3. Form the source semidirect construction with the group of simple normalizer words; identify their square generators with the corresponding h_i(−1). Lemma 6.6 proves this quotient keeps H~ embedded.
4. Use Lemma 6.5 to verify length-two and length-three braids and the resulting projection onto N. The normalizer kernel is the already injected A. No general Tits-system theory is replanned here.

API:

- `TauCeti.FieldSymbolExtension.normalizer`: N~ is the symbol-dependent extension of N, with maps A→N~→N.
- `TauCeti.FieldSymbolExtension.normalizer_exact`: The coefficient injection is injective, projection is surjective and kernel equals coefficient image.
- `TauCeti.FieldSymbolExtension.weyl_torus`: w_i⁻¹ h_j(t) w_i=h_j(t)h_i(t^(−⟨α_i,α_j∨⟩)); θ_i is conjugation by w_i.
- `TauCeti.FieldSymbolExtension.simple_square`: w_i²=h_i(−1).
- `TauCeti.FieldSymbolExtension.simple_braid`: Nonadjacent simple lifts commute; adjacent lifts satisfy w_iw_jw_i=w_jw_iw_j.

Checks:

- `TauCeti.FieldSymbolExtension.test_normalizer_square` (non-example): In characteristic different from two, the image of w_i² has −1 at its two coordinates and is not the identity.
- `TauCeti.FieldSymbolExtension.test_normalizer_adjacent` (computation): For adjacent i,j, θ_i⁻¹(h_j(t))=h_j(t)h_i(t).
- `TauCeti.FieldSymbolExtension.test_normalizer_zero` (compatibility): For A=0, projection N~→N is a group isomorphism.

Uses: Matsumoto Lemma 6.8, pp.41–42 and §7: The normalizer lifts act on the Bruhat fiber set and carry the prescribed coefficient classes. K2SymbolsBrauer:T.2/matsumoto: Separates the central symbol coefficients from ordinary Weyl presentation data.

Acceptance: The square relation retains h_i(−1), rather than incorrectly setting w_i²=1. The coefficient injection stays faithful after the square identifications.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/torus-factor-set`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Source: Matsumoto.1969, Lemmas 6.5–6.6, printed pp.38–40. The Weyl automorphisms and their square and braid identities build an extension of the normalizer preserving the torus extension.

### 7. The Bruhat fiber set and its lift action

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/bruhat-fiber`.

Let v:SL_m(F)→N be the unique normalizer coordinate in its upper-unipotent Bruhat double coset, as in Matsumoto Lemma 5.3. Define S={(g,n~):v(g)=q(n~)}. This is a set, with each fiber an A-torsor, and not a fiber-product group; the simple-lift branches test the sign of σ⁻¹α_i and then the simple root coordinate t. Construct permutations λ(h), λ(u), λ(w_i) lifting left multiplication by h∈H, u∈U⁺ and w_i∈N; let E_c be their generated subgroup of Perm(S).

Hypotheses: F infinite; m≥3; the symbol-dependent normalizer and the ordinary Bruhat coordinate v are fixed.

Proof outline:

1. Use the ordinary Bruhat coordinate uniqueness and its transformation rules from ReductiveGroups Layer 7, requested with the precise SL_m specialization.
2. For u∈U⁺ set λ(u)(g,n~)=(ug,n~). For h~∈H~ set λ(h~)(g,n~)=(q(h~)g,h~n~). The transformation rules for v prove these remain in S.
3. Write g=u₀ x_i(t) v(g) u′, with u₀ in the upper subgroup omitting the simple root α_i and Weyl coordinate σ. If σ⁻¹α_i is positive or t=0, λ(w_i)(g,n~)=(w_i g,w_i n~). If σ⁻¹α_i is negative and t≠0, λ(w_i)(g,n~)=(w_i g,h_i(t⁻¹)n~). Lemma 5.3(d) proves these remain in S; the transformation rules are requested from the ordinary Bruhat owner.
4. Check each formula has an inverse before generating E_c. Projection on the first coordinate defines a homomorphism E_c→SL_m, because each generating permutation lifts that fixed left multiplication.
5. Define the opposite right permutations through the inversion involution (g,n~)↦(g⁻¹,n~⁻¹); their commutation with left permutations is the next theorem, not an axiom.

API:

- `TauCeti.FieldSymbolExtension.bruhatFiber`: The type S of pairs satisfying v(g)=q(n~); it is not equipped with a coordinatewise group law.
- `TauCeti.FieldSymbolExtension.left_unipotent`: Upper unipotents act by (g,n~)↦(ug,n~).
- `TauCeti.FieldSymbolExtension.left_torus`: Torus lifts act by (g,n~)↦(q(h~)g,h~n~).
- `TauCeti.FieldSymbolExtension.left_simple`: A simple Weyl lift acts with second coordinate w_i n~ if σ⁻¹α_i>0 or t=0, and h_i(t⁻¹)n~ if σ⁻¹α_i<0 and t≠0.
- `TauCeti.FieldSymbolExtension.fiber_translate`: Coefficients act by (g,n~)↦(g,inl(a)n~).

Checks:

- `TauCeti.FieldSymbolExtension.test_fiber_identity` (degenerate): Over the identity matrix, the fiber is the coefficient copy A.
- `TauCeti.FieldSymbolExtension.test_fiber_unipotent` (computation): For u∈U⁺, λ(u)(1,1)=(u,1).
- `TauCeti.FieldSymbolExtension.test_fiber_faithful` (characterisation): If coefficient translation by a fixes (1,1), then a=0.
- `TauCeti.FieldSymbolExtension.test_fiber_not_group` (non-example): The coordinatewise multiplication formula on SL_m×N~ does not define a group law on S: v is not a homomorphism.

Uses: Matsumoto Lemma 6.8 and §7, pp.41–47: Permutation equalities verify the root relations without assuming a central extension exists. Matsumoto Lemma 6.11, pp.42–43: Bruhat reduction in the generated permutation group identifies its projection kernel.

Acceptance: S is nonempty over every g since q:N~→N is surjective. The simple-root zero branch uses no inversion of zero. A acts on each fiber by central translation.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/normalizer-lift`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Source: Matsumoto.1969, Lemma 5.3, printed pp.24–25; construction before Lemma 6.8, printed pp.40–41; §7, printed pp.44–45. The lifted Bruhat coordinate defines a set carrying explicit permutations. Opposite actions supply the relation checks in the construction of the central extension.

### 8. Rank-one and rank-two verification of the lift action

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/rank-two-action`.

In the preceding construction the left and opposite right actions commute. The left lifts obey additive root relations, Weyl conjugation of roots, and all type-A rank-two commutator and braid relations. In particular [x_ij(r),x_jk(s)]=x_ik(rs) and [x_ij(r),x_ki(s)]=x_kj(−sr) for distinct i,j,k. These assertions include the opposite-root conjugation identities used by Bruhat reduction.

Hypotheses: The infinite-field construction above; type-A root indices and the prescribed c with its complementary-unit relation.

Proof outline:

1. Reduce to simple-root subgroups and rank-two root subsystems using the ordinary positive-root decomposition. Type A requires only A₁×A₁ and A₂ calculations, not the source symplectic C₂ case.
2. Use the opposite right action and reduce its commutation with each left generator to representatives x_α(u)w_σx_β(v). Split into σβ≠±α, σβ=α and σβ=−α as in §7.
3. The first two branches follow from torus conjugation and ordinary root commutators. In the opposite branch separate uv=0, uv=1 and uv(1−uv)≠0, so all reciprocals carry nonzero witnesses.
4. In the final branch the discrepancy is a central combination of c evaluated at complementary parameters; the Steinberg relation cancels it. This is the essential use of c(a,1−a)=0 beyond bilinearity.
5. Transitivity of both actions and their commutation make each simply transitive. Apply Lemma 6.9 on subsystem fibers and Lemma 6.10 to obtain the defining lifted relations globally.

Acceptance: The root coefficient order is rs forward and −sr in reverse chaining. The uv=1 branch is checked independently, not by substituting into a formula with (1−uv)⁻¹. Opposite-root conjugation is proved, rather than inferred solely from Weyl braid relations.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/bruhat-fiber`, `K2SymbolsBrauer:T.2:symbols/field-proof/field-calculus`, `tauceti:TauCeti.transvectionUnit_add`, `tauceti:TauCeti.commute_transvectionUnit`, `tauceti:TauCeti.commutatorElement_transvectionUnit`, `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse`, `K2SymbolsBrauer:T.2:symbols/field-proof/root-word-normalization`.

Source: Matsumoto.1969, Lemmas 6.8–6.10, printed pp.41–42; proof in §7, printed pp.44–47. Commuting opposite actions verify the rank-two relations needed for the lifted Bruhat decomposition and the symbol-realizing extension.

### 9. Faithful realization and Bruhat normal form for the symbol extension

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/faithful-realization`.

The generated permutation group E_c fits into an exact central extension 0→A→E_c→SL_m(F)→1. Every element admits a lifted Bruhat expression u h~ w_σ v, with v in the root-coordinate subgroup appropriate to σ. The only kernel elements are coefficient translations. A homomorphism St_m(F)→E_c takes elementary root generators to their lift permutations, and the symbol [h_ij(a),h_ik(b)] maps to inl(c(a,b)) for distinct i,j,k.

Hypotheses: F infinite and m≥3; the type-A ordinary root presentation and Bruhat form, plus the preceding verified lift action.

Proof outline:

1. Use rank-two-action to show the union of lifted Bruhat cells contains the identity and is stable under left multiplication by every root generator; hence it contains the generated group.
2. Project a normal form to its ordinary Bruhat expression. If the projection is identity, uniqueness removes the Weyl and unipotent coordinates and leaves precisely the coefficient A.
3. Coefficient translations inject by their action on (1,1). They commute with every left generator, so kernel identification proves central exactness without an assumption of faithfulness.
4. The verified elementary relations induce St_m(F)→E_c by its presentation universal property. Match the source cocycle h_α(a)h_α(b)h_α(ab)⁻¹ to the commutator definition: α=e_i−e_j, β=e_i−e_k have pairing +1 in Lemma 5.4(c), giving +c(a,b).
5. Set A=0 for the presentation-completeness specialization. For arbitrary A, retain the coefficient injection rather than only a surjection onto the desired central subgroup.

Acceptance: The coefficient class cannot disappear in the generated permutation group. Taking A=0 yields SL_m(F). The source h_α(a)=w_α(a)w_α(1)⁻¹ agrees with inherited w_ij(a)w_ij(−1); verify the rank-one inverse word.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/rank-two-action`, `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`, `K2SymbolsBrauer:T.2/steinberg-symbol`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `K2SymbolsBrauer:T.2:symbols/field-proof/root-word-normalization`.

Source: Matsumoto.1969, Lemma 6.11, printed pp.42–43; Theorem 5.10 and Corollary 5.11, printed pp.30–31; Lemma 5.4(c), printed pp.26–27. Lifted Bruhat reduction identifies the kernel and completes the constructed extension. The commutator-cocycle comparison fixes the sign of the realized symbol.

### 10. Stable relation separation for the inherited Matsumoto target

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/stable-separation`.

For infinite F, specialize the preceding construction to A=Q₂(F) and c=the tensor symbol. The canonical map Q₂(F)→K₂(F) is injective: every finite symbol relation that becomes trivial in the stable Steinberg group is already zero in Q₂(F). The lifted normal form also shows every stable kernel element is a finite product of symbols. Together these are proof inputs for the existing Matsumoto isomorphism, not a second definition of it.

Hypotheses: F infinite; the stable Steinberg group and its finite-representative equality criterion are supplied by T.1.

Proof outline:

1. A finite symbol expression involves finitely many root indices. If it dies after stabilization, the directed-colimit equality criterion witnesses its vanishing in one sufficiently large St_m(F).
2. Apply that rank’s faithful-realization with A=Q₂(F). Each commutator symbol maps to its tensor class, so the zero word acts as zero coefficient translation; coefficient injectivity gives the required zero relation.
3. For generation, let C be the subgroup of stable K₂ generated by all symbols and quotient the stable Steinberg extension by C. It remains central, and its elementary root lifts have zero torus defects by root-word-normalization. Each pullback to SL_m(F), m≥3, splits by zero-symbol-splitting. Perfectness makes the splittings unique, hence compatible on rank inclusions; the inherited stable-colimit universal property gives a stable section. A split central extension with perfect total group has trivial central kernel: its abelian central factor must vanish. The quotient St(F)/C is perfect as a quotient of St(F), so K₂(F)/C=0.
4. No compatible choices of E_c across all ranks are required for the separation argument: every relation is tested in its witnessing finite rank. Naturality of the resulting isomorphism follows from symbols and the quotient universal property.
5. This infinite-field argument must not be applied to finite fields. The finite-field classical comparison retains the explicit source gap recorded separately.

Acceptance: Injectivity is not justified by merely showing symbol relations hold in classical K₂. The proof works in a finite witness rank before taking the stable conclusion. Stabilization preserves the chosen symbol convention.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-realization`, `K2SymbolsBrauer:T.2:symbols/field-proof/faithful-realization`, `K2SymbolsBrauer:T.1/stabilisation`, `K2SymbolsBrauer:T.2:symbols/field-proof/zero-symbol-splitting`, `K2SymbolsBrauer:T.1/k2-is-centre`, `K2SymbolsBrauer:T.1:classical/stable-steinberg-perfect`.

Source: Matsumoto.1969, Corollary 5.11, printed pp.30–31; Lemma 6.11, printed pp.42–43; Weibel Theorem III.6.1, printed p.48. The original extension proof supplies the completeness direction for infinite fields. Finite-rank witnesses connect it to the stable kernel target already owned by the predecessor.

### 11. Zero-symbol splitting for finite type-A central extensions

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/zero-symbol-splitting`.

Let F be infinite, m≥3, and E→SL_m(F) a central extension by A with compatible root lifts satisfying the ordinary root and Weyl-conjugation relations. If all its torus-defect cocycles h_i(a)h_i(b)h_i(ab)⁻¹ are trivial, the extension splits. The splitting carrying elementary matrices to these lifts is unique, since SL_m(F) is perfect.

Hypotheses: F infinite and commutative, m≥3; the coefficient kernel is central; compatible root lifts are supplied as part of the hypothesis.

Proof outline:

1. By root-word-normalization a zero commutator symbol is a zero simple-root torus defect. No unspecified choice of root sections enters this specialization.
2. Zero defect makes each h_i:F×→E multiplicative. The root lifts then satisfy the full ordinary group presentation (R1),(R2),(R3) at Matsumoto p.23, supplied as the exact SL_m specialization requested from ReductiveGroups.
3. The presentation universal property induces a section SL_m→E, agreeing with all root lifts. This is the zero-cocycle/injectivity part of Theorem 5.10, not its construction part.
4. If two sections exist, their pointwise ratio is a homomorphism SL_m→A because A is central. Elementary matrices are commutators using a third index, so SL_m is perfect; the ratio is trivial.

Acceptance: No arbitrary extension is asserted to split; the zero-cocycle hypothesis is essential. The result applies to restrictions of a central quotient of the stable Steinberg extension, whose root lifts are inherited.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/root-word-normalization`, `K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Source: Matsumoto.1969, §5 ordinary presentation (R1)–(R3), printed p.23; paragraph preceding Theorem 5.10, printed p.30. Trivial symbol cocycles make the root lifts satisfy the full group presentation, giving a splitting; perfectness gives uniqueness.

### 12. Divisibility and torsion in tensor quotients

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-divisibility`.

Let p>0. If abelian groups U,V are p-divisible then multiplication by p on U⊗ℤV is bijective. If multiplication by p on an abelian group T is bijective and its subgroup R is p-divisible, then multiplication by p on T/R is bijective. These statements need no torsion-freeness assumption on U or V themselves.

Hypotheses: p a positive integer; U,V,T abelian groups; R an additive subgroup or equivalently an ℤ-submodule of T.

Proof outline:

1. Surjectivity on U⊗V follows by taking a p-preimage in one tensor slot and extending from pure tensors.
2. Use pinned rTensor_exact on U[p]→U→U→0, where the second arrow is multiplication by p and is surjective. Every tensor of an element killed by p with V vanishes because V is p-divisible; hence multiplication by p on U⊗V is injective. No flatness assumption on divisible groups is made.
3. For the quotient, surjectivity descends from T. If pt∈R, choose r∈R with pr=pt. Injectivity in T implies t=r, so its quotient class is zero.
4. Iterate the tensor statement for degrees n≥2; the remaining tensor block stays p-divisible. The relation-subgroup calculation is the separate next input.

Acceptance: Divisibility of a quotient alone does not rule out torsion. Q/ℤ is a counterexample if the subgroup hypothesis is dropped from the quotient claim: ℤ is not p-divisible.

Direct prerequisites: `mathlib:TensorProduct.lift`, `mathlib:Submodule.liftQ`, `mathlib:rTensor_exact`.

Source: Weibel.III.public, Proposition III.6.4.1, printed p.52; Exercise III.7.3, printed p.72. The source tensor and relation-subgroup argument yields unique divisibility; this is the reusable additive statement underlying it.

### 13. Root factorization divides the homogeneous relation modules

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/relation-divisibility`.

For a prime p, assume every polynomial X^p−a with a∈F× splits into linear factors over F. Every relation module R_n from homogeneous-components is p-divisible. For n≥2, multiplication by p on T_n/R_n is bijective. Thus this input proves the inherited unique-divisibility target for algebraically closed fields in exactly degrees n≥2.

Hypotheses: F a field, p prime; every X^p−a for a nonzero splits over F; repeated roots are counted with multiplicity.

Proof outline:

1. List all p roots b₁,…,b_p of X^p−a, with multiplicities. None is zero; for a≠1 none is one. Evaluation at 1 gives 1−a=∏(1−b_i).
2. In T₂, expand a⊗(1−a)=Σ_i a⊗(1−b_i)=pΣ_i b_i⊗(1−b_i), since b_i^p=a. Every summand is a relation. This proves each degree-two generator lies in pR₂, with the reverse inclusion automatic.
3. Multiply this equality by arbitrary prefix and suffix tensors. The R_n description implies R_n=pR_n in every degree; degrees zero and one have zero relation module.
4. F× is p-divisible by root existence. Apply tensor-divisibility to T_n for n≥2 and then to its p-divisible relation module. Homogeneous-components transports the resulting bijection to inherited K⁽M⁾_n.
5. An algebraically closed field satisfies the hypothesis for each prime; compositions of prime multiplications give unique divisibility by every positive integer. Degree one can have roots-of-unity torsion and degree zero is ℤ.

Acceptance: In characteristic p, use multiplicities, not a false assertion that there are p distinct roots. For algebraically closed F, the assertion is n≥2; it does not assert F× is uniquely divisible.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/homogeneous-components`, `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-divisibility`.

Source: Weibel.III.public, Proposition III.6.4.1, printed p.52; Exercise III.7.3, printed p.72. The root factorization gives a p-preimage inside the relation subgroup itself. The same argument with prefixes and suffixes handles all degrees at least two.

### 14. The positive-entry subgroup over the real field

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/real-positive-subgroup`.

For n≥1 let D_n⊂K⁽M⁾_n(ℝ) be the ℤ-span of symbols with at least one strictly positive entry. Let e_n={−1,…,−1}. Then D_n is divisible, e_n has exact order two, and every class decomposes uniquely as εe_n+d with ε∈ℤ/2 and d∈D_n. The sign map sends a symbol to 1 in ℤ/2 exactly when all entries are negative, and its kernel equals D_n. For n=2 use the light realization realPositive⊂Q₂(ℝ).

Hypotheses: n≥1; the usual ordered field ℝ; entries are nonzero units.

Proof outline:

1. Define D_n as a generated subgroup, not as a chosen unspecified complement. Expand each unit as its sign times its positive absolute value; multilinearity writes each symbol as an all-minus-one term plus terms with a positive entry.
2. The all-negative test is multiplicative in each entry. Complementary real numbers cannot both be negative, so it annihilates the Steinberg relation and gives the stated additive sign map.
3. Since −1 has square one, 2e_n=0; its sign is 1, so its order is exactly two. The expansion and sign calculation identify ker(sign)=D_n and prove directness of the sum.
4. For each m>0, a positive real entry has a positive mth root. Replacing that slot by its root yields an m-preimage still in D_n. Finite signed sums of generators inherit such preimages, so D_n is divisible.
5. In degree two transfer through degreeTwoEquiv. No assertion of unique divisibility of D_n is needed for this target.

API:

- `TauCeti.MilnorK.realPositive`: D_n is the span of degree-n real symbols with a positive entry, n≥1.
- `TauCeti.MilnorK.realSign`: The additive sign map is 1 on all-negative symbols and 0 on all others.
- `TauCeti.MilnorK.realSign_kernel`: ker(realSign)=D_n.
- `TauCeti.MilnorK.realDecomposition`: K⁽M⁾_n(ℝ)≃+(ℤ/2)×D_n, sending e_n to (1,0).
- `TauCeti.MilnorK.realPositive_divisible`: For every integer m>0, multiplication by m on D_n is surjective.
- `TauCeti.FieldSymbols.realPositive`: The degree-two realization is the span in Q₂(ℝ) of symbol(a,b) with a>0 or b>0.
- `TauCeti.FieldSymbols.realPositive_divisible`: For m>0 multiplication by m on realPositive is surjective.
- `TauCeti.FieldSymbols.real_sign_exists`: The all-negative pairing descends to a linear sign map Q₂(ℝ)→ZMod 2 with kernel realPositive.
- `TauCeti.FieldSymbols.real_minus_one_nonzero`: symbolℝ(−1,−1)≠0.
- `TauCeti.FieldSymbols.real_decomposition`: Q₂(ℝ)≃ₗ[ℤ]ZMod 2×realPositive.
- `TauCeti.FieldSymbols.realPositive_contains`: A real symbol with a positive entry belongs to realPositive.
- `TauCeti.FieldSymbols.realPositive_excludes_minus_one`: symbolℝ(−1,−1)∉realPositive.

Checks:

- `TauCeti.MilnorK.test_real_degree_one` (compatibility): D₁ identifies with the positive real units; e₁ is the class of −1 and has order two.
- `TauCeti.FieldSymbols.test_positive_entry` (characterisation): If a>0, then symbolℝ(a,b)∈realPositive for every b.
- `TauCeti.FieldSymbols.test_positive_nonexample` (non-example): symbolℝ(−1,−1)∉realPositive.
- `TauCeti.FieldSymbols.test_positive_root` (characterisation): Multiplication by two on realPositive is surjective.
- `TauCeti.MilnorK.test_real_zero_boundary` (non-example): K⁽M⁾₀(ℝ)=ℤ is not (ℤ/2)⊕D₀; realDecomposition takes n≥1.

Uses: K2SymbolsBrauer:T.2:symbols/milnor-real: Supplies the missing complementary divisibility argument and identifies its exact subgroup. K2SymbolsBrauer:T.6: The real sign summand is the real-place detector; degree two keeps its integral 2-torsion.

Acceptance: D₁ is the multiplicative positive reals written additively; sign gives ℝ×/D₁≅ℤ/2. The pure all-minus-one symbol is outside D_n. Degree zero is excluded: K⁽M⁾₀(ℝ)=ℤ.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/homogeneous-components`, `K2SymbolsBrauer:T.2:symbols/field-proof/field-calculus`.

Source: Weibel.III.public, Example III.7.2(c), printed pp.61–62; real symbol in Example III.6.2.1, printed pp.49–50. The source identifies a sign summand and a divisible complement. Positive-entry generators give a canonical complement and a direct proof of its divisibility.

### 15. The cyclic-unit symbol annihilator

Identifier: `K2SymbolsBrauer:T.2:symbols/field-proof/cyclic-annihilator`.

Suppose F× is cyclic with generator g and c:F××F×→A is a bilinear Steinberg pairing. If char F=2, or if there exist complementary units a,b whose exponents relative to g are both odd, then c(g,g)=0 and consequently c is identically zero. Every finite field satisfies one of these alternatives.

Hypotheses: F a commutative field with cyclic units; c takes values in an abelian group and annihilates complementary units.

Proof outline:

1. Bilinearity reduces every value to an integer multiple of z=c(g,g). Field-calculus gives 2z=0.
2. In characteristic two the square formula immediately gives z=0. In odd characteristic the square and nonsquare unit cosets have equal size (q−1)/2.
3. On F minus {0,1}, there are (q−1)/2 nonsquares and only (q−3)/2 squares. If every nonsquare a had square 1−a, the involution a↦1−a would inject the larger set into the smaller, a contradiction.
4. Choose the resulting complementary nonsquares g^r,g^s with r,s odd. The Steinberg relation yields rsz=0; Bézout with the odd integer rs and 2 gives z=0.
5. Use the pinned cyclicity theorem for finite units. This proves the inherited Milnor finite-field vanishing without Matsumoto; the classical stable kernel still needs the separate finite-field presentation proof.

Acceptance: For q=3 take a=b=−1; the relation directly kills z. For q=2 normalization alone kills the symbol. This argument does not assert that all finite-field stable K₂ is symbol-generated without a proof.

Direct prerequisites: `K2SymbolsBrauer:T.2:symbols/field-proof/field-calculus`, `mathlib:isCyclic_of_injective_ringHom`.

Source: Weibel.III.public, Corollary III.6.1.1, printed p.48; Example III.7.2(a), printed p.61. The finite-field counting argument kills the universal bilinear Steinberg pairing. Separating it from classical symbol generation prevents a circular finite-field comparison.

## Worked consequences and consumer contracts

### Leading-coefficient splitting

For a nonzero rational function f=P/Q, write `d=deg P−deg Q` and `a=lead(P)/lead(Q)`. This integer degree is independent of the representation. The leading-coefficient map is multiplicative on nonzero rational functions and restricts to the identity on constants. It therefore gives a bilinear symbol pairing `{f,g}↦{lead f,lead g}`. Its descent requires the following four Steinberg cases, with f≠0,1 throughout.

If d>0, f dominates its complement and `lead(1−f)=−a`. The image of `{f,1−f}` is `{a,−a}=0`. If d<0, the constant term dominates and `lead(1−f)=1`; the image is `{a,1}=0`. If d=0 and a≠1, leading terms do not cancel, so the complementary leading coefficient is 1−a, and the Steinberg relation applies. If d=0 and a=1, the leading terms cancel and the complementary leading coefficient can have another value. The image is nevertheless `{1,lead(1−f)}=0`. This fourth case is required; replacing every degree-zero complement by 1−a would introduce the forbidden zero entry.

The quotient universal property gives the retraction on Q₂, and Matsumoto gives the retraction on classical K₂ under its field comparison. The source is Weibel Example III.6.1.2, printed p.48. The field sign calculus here supplies its negative-unit branch. Acceptance includes f=(t+1)/t: its leading coefficient is 1 but its complement has negative degree. A retraction formula must handle it without a zero symbol.

For multiple transcendence variables, every finite symbol expression uses finitely many variables. Apply the one-variable splitting iteratively. The inherited filtered-field and K-theory functoriality interfaces supply the arbitrary extension statement; no infinite product of retractions is introduced.

### Restriction kernels

For a finite extension E/F of degree d, the imported restriction and transfer maps on Quillen K-theory satisfy transfer after restriction = multiplication by d. The inherited classical/Quillen K₂ comparison transports this equation to the field symbols. Thus an element killed by restriction is killed by d. This argument applies to inseparable finite extensions as well: the integer is the full vector-space degree, not a separable degree inferred from an embedding count.

For an arbitrary extension choose a transcendence basis, use the leading-coefficient splitting to remove the purely transcendental part, and use finite field witnesses in the remaining algebraic extension. An element in a kernel is torsion because its vanishing is witnessed in a finite algebraic subextension. This is the existing `extension-kernel-torsion` target, sourced at Weibel Lemma III.6.1.3, pp.48–49. GeneralAlgebraicKTheory owns the restriction, transfer and projection-formula maps; this layer requests no second transfer theory.

The consumer contract is an actual statement about the kernel subgroup. It does not say restriction is always injective, and it does not provide a single integer annihilating the kernel of every infinite extension. Each element has its own finite witness and annihilator.

### Algebraic closure: why the relation subgroup matters

Divisibility of F× gives divisible symbol groups, but it does not by itself give unique divisibility. The quotient of a uniquely divisible group by a nondisible subgroup can acquire torsion; ℚ/ℤ demonstrates the failure. The acceptance criterion therefore checks two separate objects before taking the quotient: multiplication by p is bijective on the tensor module in degree at least two, and the relation module has internal p-preimages.

The root-factorization input supplies the second fact exactly. With a≠0,1 and the roots b_i of X^p−a, the equality `1−a=∏(1−b_i)` is in the unit group. Each term `b_i⊗(1−b_i)` is another allowed Steinberg generator. The equality of tensors writes the original generator as p times a sum of such generators. Prefix and suffix tensors preserve this calculation, so it applies to every adjacent Steinberg relation in every degree. Repeated roots in characteristic p cause no problem; their multiplicities are part of the factorization identity.

For the first fact, tensor right exactness identifies the possible p-kernel with tensors of p-torsion in one factor. Such tensors vanish when the other factor is p-divisible. This remains true even though F× itself contains roots-of-unity torsion. It explains why the degree threshold is two. After proving the quotient criterion, composite positive integers are handled by factoring them into primes and composing their multiplication bijections.

The target is consequently precise: K⁽M⁾_n(F) is uniquely divisible for algebraically closed F and n≥2. K⁽M⁾₁(ℂ)=ℂ× has −1 of order two, and K⁽M⁾₀(ℂ)=ℤ is not divisible. The predecessor's confirmed source finding `K2SymbolsBrauer/E1` records this degree correction. It is consumed here rather than recorded again as a new finding.

### Real sign and integral squares

Every real unit is its sign times a positive unit. Expand a symbol multilinearly. The only term having no positive entry is the all-minus-one term, with coefficient one precisely when every original entry was negative. All other terms belong to D_n. The sign map detects that coefficient, while `2e_n=0` follows by squaring any −1 entry. This simultaneously proves generation of the direct sum, its directness and the exact order of e_n.

To divide a generator of D_n by m, choose one of its positive entries and replace it by its positive mth root. The resulting symbol remains in D_n and its m multiple is the original symbol. The same operation on a finite signed sum proves surjectivity on the generated subgroup. This proof requires the positive-root operation, not an arbitrary mth root of a negative entry. It supplies the complementary-divisibility argument independently of transfer or the arithmetic Bass–Tate theorem.

In degree one this is the familiar decomposition of ℝ× into its sign and positive units. In degree two the sign sends `{−1,−1}` to one in ℤ/2, proving that the repeated-entry symbol is nonzero. A formalization that implements an exterior square or kills all repeated symbols fails this check. In higher degrees it still detects e_n. No formula of this form is asserted in degree zero, and unique divisibility of the complementary group is not part of this target.

For a number field the all-negative detector is applied separately at each real embedding. The integral high-degree signature isomorphism is the Bass–Tate target, not a consequence of the real calculation alone. In particular, one must prove that no other classes remain in its kernel in degrees n≥3.

### Positive-characteristic arithmetic boundary

A positive-characteristic global field is a finite extension of a rational function field over a finite field. The inherited Bass–Tate target states vanishing in degrees n≥3. To pass to an arbitrary field of transcendence degree one over a finite field, fix a transcendental t and any finite tuple of nonzero symbol entries. Each entry is algebraic over the rational function field. The tuple generates a finite extension of that rational function field, hence a global subfield. Its symbol is zero by the global theorem, and remains zero under the field map into the original field. Since symbols generate every Milnor degree, the full group vanishes.

This reduction needs only finite tuples, functoriality and symbol generation. It does not need an injectivity assertion for a field colimit. It also does not prove the global theorem: its actual arithmetic proof is a required source input, identified in the packet's gap ledger. The degree-two finite-field tensor calculation cannot replace that theorem.

## Extension acceptance and proof boundaries

The Matsumoto completeness contract has two independent directions. Given any bilinear Steinberg pairing c into A, the infinite-field extension construction produces an injected coefficient group realizing c. Applying this to Q₂ separates every relation that vanishes classically. Separately, quotienting the stable Steinberg group by its subgroup of symbols gives a central extension with zero cocycle. The ordinary root presentation makes its finite SL_m restrictions split. Their splittings are unique by perfectness, so the stable-colimit universal property glues them. Perfectness of the quotient total group then kills its split central factor. That is generation, with no assumption of the target theorem.

The stable relation witness required for separation is a specific T.1 group-colimit property: a finite word dying in the stable group dies in some sufficiently large finite rank. A type-level direct-limit carrier is not by itself this theorem. The packet retains the inherited `G-colimit` boundary rather than claiming that the carrier citation proves it.

For finite fields, the universal Milnor pairing is zero by the cyclic-unit annihilator. Completing the classical comparison additionally requires the primary finite-field presentation proof, including the connection between ordinary Steinberg relations and the root presentation and the stable-rank passage. Matsumoto's printed p.23 reports Steinberg's finite-field kernel theorem without its proof, whereas his detailed extension construction assumes an infinite field. These are different evidence levels. The packet therefore distinguishes the verified Milnor counting input from the required finite classical source proof.

Likewise, Weibel Example III.7.2(a),(d), pp.61–62, states the arithmetic Milnor answers and attributes them to Bass and Tate. That citation is not a decomposition of the Bass–Tate proof. The original article is *The Milnor ring of a global field*, LNM 342 (1973), pp.349–446. Its two high-degree results remain inherited targets requiring that proof. No unverified account of the article is written here.

## Source convention finding

The separate author-hosted Weibel Chapter III PDF inspected here has creation metadata dated 2012-10-10. Its Exercise III.5.9, printed p.46, puts the two inverse torus factors in the order `h(s)⁻¹h(r)⁻¹` after h(rs). With its stated commutator symbol, the root-word calculation gives `h(rs)h(r)⁻¹h(s)⁻¹`. The two same-root torus lifts need not commute. The printed expression is the inverse symbol.

Indeed conjugation by h_ik(r) carries h_ij(s) to `w_ij(rs)w_ij(−r)=h_ij(rs)h_ij(r)⁻¹`. Taking its commutator with h_ij(s) gives the corrected factor order. The positive torus cocycle `h(r)h(s)h(rs)⁻¹` agrees by skew-symmetry. Matsumoto Lemma 5.4(c), p.26, gives an independent check: the roots e_i−e_j and e_i−e_k have Cartan pairing +1. There is no permitted silent inversion between that cocycle and the inherited diagonal commutator.

The difference can be detected concretely. In the source's tame convention, Weibel Lemma III.6.3, p.51, sends `{t,2}` over ℚ(t) to 2 under the t-adic symbol; its inverse maps to 1/2. This is a detector supplied by the residue layer, not a new residue construction here. Testing only real signs or finite-field vanishing would miss the inverse, because those examples kill or collapse the distinction.

The packet records this as `K2SymbolsBrauer/E-field-symbol-factor-order`, scoped to the identified author copy. Its page was inspected both as text and as a rendered PDF image. No statement is made about an unread version of record. The author's source index was checked for errata; its linked errata URL returned 404 and no verified correction was found. The finding makes no novelty claim. The corrected identity is used throughout this document.

## Dependency order, checks and Lean shape

The degree-two tensor realization and the field calculus are the first independent inputs. The homogeneous-component bridge consumes the existing tensor grading and the inherited Milnor definition. Tensor divisibility and relation divisibility then supply algebraic-closure computations; the positive-entry subgroup supplies the real computation; the cyclic-unit annihilator supplies finite Milnor vanishing. None of these computations needs Matsumoto injectivity.

The other lane begins with the root-word normalization and the prescribed torus factor set. It lifts the normalizer, defines the Bruhat fiber set, checks the opposite actions in rank two and proves faithful realization. Zero-symbol splitting uses the ordinary root presentation separately. Stable separation and generation combine these two lanes with the existing stable group interface. The classical field comparison then enables consumers such as rational-function splitting, restriction kernels and the residue layer to work with symbols instead of arbitrary Steinberg words.

The six display landmarks for the added inputs are **Steinberg symbol quotient**, **Homogeneous Steinberg relations**, **Integral symbol sign identities**, **Matsumoto extension construction**, **Matsumoto completeness**, and **Unique divisibility of Milnor groups**. They name mathematical objects and theorems rather than source section numbers. The real and finite computations remain explicit targets and checks in the reader.

The suggested Lean file supplies real-bodied light definitions of the tensor relation module, its quotient and the degree-two real positive-entry submodule. It states bilinearity, the universal property, field maps, field sign consequences, tensor/quotient divisibility, algebraically closed degree-two divisibility and the real decomposition. Its examples distinguish the zero quotient, the exterior-square error, the finite-field computation and the positive subgroup. It introduces no Steinberg-group placeholder, artificial Milnor carrier or axiomatized extension data.

The homogeneous graded quotient, Milnor degree presentations, torus/normalizer extension carriers, fiber action, stable comparison and arithmetic computations require carriers or theory beyond the pins. Their declarations, hypotheses, APIs and checks are therefore specified in this reader, following the fixed compact suggested-file shape. The file is an interface aid, not an exhaustive encoding of the document. Omitted heavy names are also indexed in its comments. All implementation statuses remain unchecked: elaborating an interface with proof holes is not implementing its mathematics.

## References

- Charles A. Weibel, [*The K-book*, separate Chapter III author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf): Exercises 5.8–5.9, p.46; Theorem 6.1 and Corollaries 6.1.1–6.1.3, p.48; Lemma 6.3, p.51, read for the sign detector; Proposition 6.4.1, p.52; Definition 7.1 and Examples 7.2, pp.61–62; Exercise 7.3, p.72. The locators are printed chapter pages, not published-book or combined-PDF page numbers.
- Hideya Matsumoto, [“Sur les sous-groupes arithmétiques des groupes semi-simples déployés”](https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf), *Annales scientifiques de l'École normale supérieure*, série 4, tome 2 (1969), pp.1–62: Lemmas 5.1–5.4, pp.23–26; Theorem 5.10 and Corollary 5.11, pp.30–31; torus construction and Lemmas 6.5–6.6, pp.37–40; Lemmas 6.8–6.11, pp.41–43; rank-two proof, pp.44–47. The infinite-field hypothesis starts on p.23.
- The [accepted predecessor packet](../packets/K2SymbolsBrauer--T.1.json) owns the symbols, stable classical K₂, Milnor groups and computations imported above. Its confirmed findings and unresolved general-ring or topology boundaries are not replaced by this field supplement.
