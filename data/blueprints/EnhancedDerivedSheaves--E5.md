# Shared monoidal enhancement, presentability and animation

This part supplies the categorical operations shared by enhanced sheaf theory,
algebraic K-theory, trace methods and the geometric Langlands constructions.
The carriers are the pinned simplicial sets and quasicategories. Passing to an
ordinary homotopy category is a comparison, never the definition of an enhanced
limit, action or algebra object. All results below are targets for formalization;
no target is claimed implemented.

The six stage ids remain those of the atlas. E0 supplies mapping spaces,
restricted straightening, stability, exact functors and the cochain suspension
sign. E1 supplies the concrete enhanced derived category and K-flat derived
tensor. E3 supplies coherent Kan extensions, accessible localizations and
adjoints. E5 adds the monoidal, presentable and animated structures to these
interfaces. The cotangent complex remains owned by DerivedDeRhamCohomology:DD.0,
and concrete spectra by StableHomotopyKTheory:H.5. Neither supplier is an input
to the animation or the monoidal stable foundation. The parent acceptance
diagram uses both comparison branches.

Work in fixed nested universes: a category described as small belongs to the
input universe, and its space-valued presheaves to the next. A large-universe
Ind(C) for a presentable category requires one further enlargement. Compact
means omega-compact unless a regular cardinal is specified. Homotopy of an
animated ring is indexed homologically, so π_n appears in cohomological degree
−n. Ordinary polynomial algebras use Mathlib's MvPolynomial, ordinary rings use
CommRingCat, and ordinary Witt vectors use WittVector.

The reviewed AUDIT-22 identifies all six stages as unbuilt, while recording
ordinary monoidal categories, the Karoubi envelope, set-valued Ind, sifted
categories, polynomial rings and the naive cotangent complex as partial
foundations. These declarations are imported rather than recreated. In
particular MonoidalCategory alone does not impose symmetry: the ordinary
comparison uses SymmetricCategory. A naive two-term cotangent construction is
not the entire cotangent complex. Ordinary siftedness by connected comma
categories is not automatically homotopy cofinality.

The dependencies printed with each target are its direct interfaces. Supplier
nodes already state their own prerequisite chains; they are not reproved here.
When a needed statement has no precise supplier node, the packet records a
request with its owner. The target-level construction or proof records the
major steps; elementary steps remain inside that proof. Readers should keep
stable, thick and localizing closures separate, distinguish finite generation
from compactness of a mapping-space functor, and distinguish recovery by
completion from descendability with a finite index.

## Monoidal stable constructions

### Symmetric monoidal infinity-categories

Target: `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

A symmetric monoidal infinity-category is a cocartesian fibration C⊗ → N(Fin_*) whose fibre over ⟨n⟩ maps equivalently to C^n through the n inert projections; C is the fibre at ⟨1⟩. The fibre at ⟨0⟩ is terminal. Active fold maps give tensor products and the nullary fold gives the unit.

Conventions and hypotheses. Work in specified nested universes; finite pointed sets are ordinary finite sets with a distinguished base point. Cocartesian lifts over all maps are required, not only inert lifts.

Construction or proof. Extend E0’s restricted straightening to the base N(Fin_*); assemble the fibrewise product diagrams. Impose the Segal equivalences and recover coherent tensor and unit from active lifts. Apply the Grothendieck construction to an ordinary symmetric monoidal category and compare its nerve fibrewise.

Direct inputs: `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `mathlib:CategoryTheory.Grothendieck`, `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:SSet`, `mathlib:SSet.Quasicategory`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.MonoidalCategory`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 2.0.0.7, p. 169; Remark 2.1.2.19, p. 182. Defines symmetric monoidal categories as cocartesian families over pointed finite sets with the inert Segal equivalences; the nullary fibre supplies the unit.

Uses. FS21, Theorem X.1.1: Coherent monoidal representations require the total operadic fibration, not a tensor on isomorphism classes.

| API name | Role | Specification |
| --- | --- | --- |
| `SymMonData` | data | Total space, projection to N(Fin_*), fibres and Segal equivalences; the full definition also imposes cocartesianness. |
| `SymMonData.tensor` | projection | Tensor is the active binary pushforward. |
| `SymMonData.unit` | projection | Unit is the active nullary pushforward. |
| `SymMonData.ofOrdinary` | constructor | The nerve of an ordinary SymmetricCategory gives the corresponding operadic fibration. |

The following tests separate the intended definition from plausible substitutes.

- `SymMonData.test_zero` (degenerate): The zero-ary fibre is equivalent to the terminal infinity-category.
- `SymMonData.test_one` (computation): The one-ary fibre is equivalent to the underlying category.
- `SymMonData.test_ordinary` (compatibility): For an ordinary symmetric monoidal C the homotopy category of the underlying fibre is equivalent to C.

### Infinity-operads

Target: `EnhancedDerivedSheaves:E5:abstract/infinity-operad`.

An infinity-operad O⊗ → N(Fin_*) is an inner fibration with cocartesian inert lifts. For each map f:⟨m⟩→⟨n⟩, its mapping space over f is the product of the mapping spaces over ρ_i f to the n output colours. Its fibre at ⟨n⟩ is equivalent, via inert projections, to the n-fold product of its colour fibre. The mapping-space condition includes nullary operations.

Conventions and hypotheses. Mapping spaces are those of E0, with fibres over specified base morphisms. An infinity-operad need not admit active cocartesian lifts.

Construction or proof. Construct the inert/active factorization in Fin_*. Use E0 mapping spaces and lifting predicates to state the inert, operation-product and object-Segal axioms. Check the commutative operad and the associative operad with ordered fibres.

Direct inputs: `EnhancedDerivedSheaves:E0/right-mapping-space`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 2.1.1.10, pp. 174–175. Specifies the inner fibration, inert cocartesian lifts, fibre decomposition and operation-space decomposition, including nullary operations.

Uses. NS18, Appendix B, p. 140: Ordered fibres and the cuts functor produce the associative algebra interface.

| API name | Role | Specification |
| --- | --- | --- |
| `OperadData` | data | Underlying operadic map and colour category; lifting and operation-space axioms belong to the full definition. |
| `commOperad` | constructor | The identity operad of N(Fin_*) is the commutative operad. |
| `assOperad` | constructor | The associative operad has ordered nonbasepoint fibres; composition concatenates their orders. |

The following tests separate the intended definition from plausible substitutes.

- `OperadData.test_comm` (degenerate): The colour category of the commutative operad is terminal.
- `OperadData.test_assoc` (computation): The associative n-input operation space has n! components, represented by total orders.
- `OperadData.test_nullary` (degenerate): The associative zero-input operation space is terminal.

### Monoidal categories over an operad

Target: `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`.

An O-monoidal infinity-category is a cocartesian fibration C⊗ → O⊗ such that, for T with inert components T_i, C_T → ∏_i C_(T_i) is an equivalence. The composite to N(Fin_*) is then an infinity-operad. A map is O-monoidal if it preserves cocartesian edges; it is lax O-monoidal if it is an operad map and only preserves the inert edges.

Conventions and hypotheses. O⊗ is an infinity-operad. The product condition is on the fibres over individual objects T of O⊗.

Construction or proof. Use the fibre criterion in HA 2.1.2.12, rather than assuming any cocartesian fibration is monoidal. Compose the operadic maps and verify the mapping-space and Segal conditions. Build the full functor categories of strong and lax maps over the base.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/infinity-operad`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 2.1.2.12, p. 180; Definition 2.1.2.13, p. 182. Characterizes the relative Segal cocartesian family and distinguishes maps preserving all cocartesian edges from lax maps preserving inert ones.

Uses. NS18, Appendix A: Localization must distinguish strong from lax functor universal properties.

| API name | Role | Specification |
| --- | --- | --- |
| `OMonoidalData` | data | Cocartesian operadic map with componentwise fibre-product equivalences. |
| `strongMonoidalFunctors` | data | The infinity-category of maps preserving all cocartesian edges. |
| `laxMonoidalFunctors` | data | The infinity-category of operad maps preserving inert edges. |

The following tests separate the intended definition from plausible substitutes.

- `OMonoidalData.test_comm` (compatibility): For O=Comm, this recovers symmetric monoidal categories.
- `OMonoidalData.test_identity` (degenerate): The identity operad map is strong monoidal.
- `OMonoidalData.test_unit` (characterisation): A lax map supplies a unit comparison; a strong map has an invertible unit comparison.

### Operadic algebras

Target: `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

Alg_O(C) is the full infinity-category of sections O⊗ → C⊗ over O⊗ that preserve inert edges. For O=Comm write CAlg(C); for O=Ass use associative algebra objects. Algebra maps are coherent transformations over the operad. In a cartesian monoidal ordinary category, the construction agrees with ordinary commutative or associative monoid objects after passing to nerves.

Conventions and hypotheses. C⊗ is O-monoidal. A section need not preserve active cocartesian edges.

Construction or proof. Form the functor category over O⊗ using E0; select inert-preserving sections. Compare with ordinary algebra objects by evaluating operation maps. For Ass use the cuts functor Δop→Ass⊗; the resulting simplicial object satisfies the Segal condition with A_0 terminal.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E5:abstract/infinity-operad`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 2.1.3.1, p. 184. Defines algebra objects by operadic sections preserving inert morphisms; commutative and associative algebra categories are its two specializations.

Uses. NS18, Appendix B, p. 140: The cuts functor encodes associative algebra objects by simplicial objects with Segal equivalences; inert-preserving sections retain the coherent multiplication used by the trace consumers.

| API name | Role | Specification |
| --- | --- | --- |
| `operadicAlgebras` | constructor | The category of inert-preserving sections. |
| `commutativeAlgebras` | data | The specialization CAlg(C). |
| `algebraForget` | projection | Evaluation at the unique input colour. |
| `assCuts` | data | The cuts functor gives the Segal simplicial presentation of associative algebras. |

The following tests separate the intended definition from plausible substitutes.

- `operadicAlgebras.test_terminal` (degenerate): Algebras in the terminal monoidal category form a terminal category.
- `operadicAlgebras.test_sets` (compatibility): Commutative algebras in cartesian sets are ordinary commutative monoids.
- `operadicAlgebras.test_segal` (characterisation): An associative algebra has A_2 ≃ A_1 × A_1, and A_0 terminal.

### Modules and extension of scalars

Target: `EnhancedDerivedSheaves:E5:abstract/module-objects`.

For an associative algebra A in C and a left C-tensored infinity-category M, LMod_A(M) is the fibre of the category of LM-algebras at A. Its objects have a coherently unital associative action A⊗M→M. If geometric realizations exist and the action preserves them separately, f:A→B has an extension-of-scalars left adjoint B⊗_A− to restriction. Compute it by the two-sided bar realization.

Conventions and hypotheses. LM is the two-coloured operad distinguishing the algebra and module colours. For a commutative A in presentably symmetric monoidal C, Mod_A(C) has relative tensor and unit A; tensors must preserve colimits.

Construction or proof. Apply the algebra-section construction to LM and take the fibre over A. Realize Bar(B,A,M) and prove its mapping-space adjunction with restriction. Use commutativity of A to descend tensor and its symmetry to the relative bar construction.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definitions 4.2.1.12–13, pp. 506–507; Proposition 4.6.2.17, p. 627. Defines the LM-fibre of left modules in a left-tensored category; the relative tensor product gives composition of extension of scalars.

Uses. BS17, Theorem 11.15, pp. 42–43; HA §4.8.4, pp. 736–738: Amitsur module descent changes coefficients along commutative algebra maps. Extension of scalars and its forgetful right adjoint must act on the same operadic module category, with relative tensor preserved.

| API name | Role | Specification |
| --- | --- | --- |
| `leftModuleObjects` | constructor | The LM-fibre LMod_A(M) for an associative algebra A and a left C-tensored category M. |
| `moduleObjects` | constructor | The commutative specialization Mod_A(C). |
| `extensionScalars` | functoriality | B⊗_A−, computed by a bar realization and left adjoint to restriction. |
| `moduleUnit` | projection | The unit of Mod_A(C) is A. |

The following tests separate the intended definition from plausible substitutes.

- `moduleObjects.test_unit` (degenerate): Modules over the tensor unit are equivalent to C.
- `moduleObjects.test_identity` (degenerate): Extension along the identity A→A is equivalent to the identity.
- `moduleObjects.test_composition` (characterisation): C⊗_B(B⊗_A M) ≃ C⊗_A M for composable algebra maps.

### Stable monoidal enhancement comparison

Target: `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`.

Import E0’s stable infinity-category and its exact/triangulated API. If C is also symmetric monoidal and its tensor is exact separately, the tensor descends to a symmetric monoidal structure on hC compatible with suspension and distinguished cofiber triangles. For derived modules it agrees with Mathlib’s ordinary derived category through E1’s enhancement; constructing the tensor uses K-flat replacements, not closure of K-injectives under tensor.

Conventions and hypotheses. Stability and cochain suspension signs are supplied by E0. Require exactness separately; it does not follow from merely having a monoidal structure.

Construction or proof. Transport the operadic coherent tensor along h and identify its associator, unit and symmetry. Apply E0’s finite cofiber/triangle comparison to tensor in either variable. Use E1’s derived tensor comparison to ordinary complexes.

Direct inputs: `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `mathlib:DerivedCategory`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), §1.1.2, Theorem 1.1.2.14, pp. 27–28; §4.8.1, pp. 712–715. Gives the triangulated homotopy-category comparison and the monoidal extension machinery; the stable structure itself is imported from E0.

Acceptance.

- For R-modules, the monoidal homotopy-category comparison sends the enhanced tensor unit to R[0] and a cofiber triangle to the pinned cochain cone triangle.
- Tensoring the triangle R→R→0 by any K gives K→K→0, with the E0 shift convention.

### Exact monoidal functors and triangles

Target: `EnhancedDerivedSheaves:E5:abstract/exact-functors`.

For stable C,D, import E0’s equivalence of finite-limit and finite-colimit preservation. An exact strong or lax monoidal functor then induces the corresponding ordinary monoidal functor on homotopy categories and carries the cofiber triangle of f to that of Ff, with the suspension comparison inherited from E0. Coherent functors are retained before passing to homotopy categories.

Conventions and hypotheses. Exactness is an E0 property of the underlying functor. Lax monoidal does not imply exact, and exact does not imply strong monoidal.

Construction or proof. Restrict the coherent strong/lax functor categories by E0 exactness. Apply h, transport suspension isomorphisms, and verify compatibility with the tensor structure.

Direct inputs: `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.1.4.1, pp. 33–35; §2.1.2, pp. 177–182. Identifies finite-limit and finite-colimit preservation in stable categories; the monoidal map convention supplies the additional comparison structure.

Acceptance.

- The suspension comparison for the identity functor is the identity; comparisons compose naturally for two exact monoidal functors.
- For extension of scalars R→S, the image of a cone triangle is the derived-tensor cone triangle, without a flatness assumption on S.

### Idempotent completion and its monoidal extension

Target: `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`.

Idem(C) is the full subcategory of P(C) spanned by retracts of representables. C→Idem(C) is fully faithful; restriction Fun(Idem(C),D)→Fun(C,D) is an equivalence for idempotent-complete D. For small stable C it is stable. A separately exact tensor extends to retracts, giving a symmetric monoidal completion and the corresponding monoidal universal property. For an ordinary category C this agrees with the nerve of its Mathlib Karoubi envelope.

Conventions and hypotheses. Use homotopy coherent idempotents, not just idempotents in hC. The ordinary comparison has discrete mapping spaces; no claim hIdem(C)=Karoubi(hC) in complete generality is needed.

Construction or proof. Take the retract closure of the representable Yoneda image in space-valued presheaves. Use HTT’s functor restriction theorem for uniqueness of extensions. Extend tensor on retracts and check closure of finite cofibers using E0.

Direct inputs: `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §5.1.4, Propositions 5.1.4.2 and 5.1.4.9, pp. 321–323. Constructs idempotent completion from retracts of representables and gives its functor-extension universal property.

Uses. GeneralAlgebraicKTheory:K.1: K-theory uses stable idempotent-complete categories. Compatibility is an output, not a prerequisite.

| API name | Role | Specification |
| --- | --- | --- |
| `idemCompletion` | constructor | Retracts of representables in P(C). |
| `idemInclusion` | data | The fully faithful embedding C→Idem(C). |
| `idemRestriction` | universal-property | Restriction is an equivalence for idempotent-complete targets. |

The following tests separate the intended definition from plausible substitutes.

- `idemCompletion.test_idempotent` (degenerate): Completing a completed category changes it by an equivalence.
- `idemCompletion.test_ordinary` (compatibility): Idem(NC) is equivalent to N(Karoubi C).
- `idemCompletion.test_terminal` (degenerate): Idem(*) is terminal.

### The monoidal envelope

Target: `EnhancedDerivedSheaves:E5:abstract/monoidal-envelope`.

Env(C⊗) has objects finite lists of colours of C; maps are active operadic maps, tensor concatenates lists. Inclusion of C as singleton lists extends lax maps: restriction Fun⊗(Env(C⊗),D) ≃ Fun_lax(C,D). Thus lax functors can be handled by strong functors out of a universal envelope. The envelope of the unit category has one object per arity, not just one object.

Conventions and hypotheses. D is symmetric monoidal. Use the operadic active-arrow construction, not a free ordinary tensor category on hC.

Construction or proof. Pull back the operad along the active-arrow category of Fin_* and evaluate targets. Check the Segal equivalences for concatenation. Give inverse functors by applying a lax functor to each list and using its coherent structure maps; verify the mapping-space equivalence.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Proposition III.3.2, p. 76. Describes the finite-list monoidal envelope and the equivalence between strong maps from it and lax maps from the original monoidal category.

Uses. NS18, Proposition III.3.2: Changes lax universal properties into strong ones.

| API name | Role | Specification |
| --- | --- | --- |
| `monoidalEnvelope` | constructor | The symmetric monoidal active-arrow envelope. |
| `envelopeSingleton` | data | The canonical lax singleton inclusion. |
| `envelopeRestriction` | universal-property | Strong functors out of the envelope are equivalent to lax functors out of C. |

The following tests separate the intended definition from plausible substitutes.

- `monoidalEnvelope.test_arity` (computation): For the terminal input category, envelope objects up to isomorphism are indexed by ℕ.
- `monoidalEnvelope.test_concat` (computation): Tensor of an m-list and an n-list has arity m+n.
- `monoidalEnvelope.test_empty` (degenerate): The envelope unit is the empty list, of arity zero.

### Symmetric monoidal Dwyer–Kan localization

Target: `EnhancedDerivedSheaves:E5:abstract/monoidal-dwyer-kan-localization`.

If C⊗ is symmetric monoidal and a class W of underlying morphisms is stable under tensoring with any object in either variable, C[W⁻¹] carries a symmetric monoidal structure. The localization is strong monoidal. Restriction is fully faithful on strong and on lax monoidal functor categories with essential image the functors inverting W. For every base change K→N(Fin_*), the total operadic localization is the corresponding Dwyer–Kan localization.

Conventions and hypotheses. Use the saturated class generated by W; an ordinary categorical localization of hC alone does not supply this theorem. The tensor-stability hypothesis is essential for the fibrewise assertion.

Construction or proof. Mark the vertical product edges of W in the fibres of C⊗. Localize the total space over Fin_* and use inert/product compatibility to prove the Segal equivalences. Verify universal properties after arbitrary base change; distinguish the strong and lax subcategories.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Definitions A.1–A.4 and Proposition A.5, pp. 128–130. Constructs the symmetric monoidal localization when tensor preserves the marked morphisms, including the lax universal property and compatibility over the operadic base.

Acceptance.

- Localizing only equivalences recovers C and its unit.
- Restriction on both strong and lax functor categories is fully faithful and its essential image inverts each specified W-map; check inert as well as nullary operations.
- For any K→N(Fin_*), the operadic localization comparison after pullback is an equivalence.

### Monoidal localization of a model category

Target: `EnhancedDerivedSheaves:E5:abstract/monoidal-model-category-localization`.

A symmetric monoidal model category satisfying the pushout-product and unit axioms has a symmetric monoidal infinity-localization. The localization of cofibrant objects computes the derived tensor and is strongly monoidally equivalent to the underlying Dwyer–Kan localization with this derived structure. The map from the category of all objects is lax monoidal and initial among lax monoidal functors inverting weak equivalences. This operadic localization is compatible with base change over Fin_*. If the original unit is not cofibrant, the derived unit is represented by its cofibrant replacement; no strong all-object localization map is asserted.

Conventions and hypotheses. The model structure and Quillen tensor hypotheses must be supplied for each application. Tensor need not preserve weak equivalences between all objects; cofibrant replacements are indispensable.

Construction or proof. Apply tensor-compatible localization to cofibrant objects; the pushout-product axiom and Ken Brown argument give weak-equivalence preservation there. A cofibrant replacement of the unit supplies the derived nullary operation. Use the unit axiom and cofibrant replacement to identify the all-object localization. Construct the lax all-object comparison and verify its universal property on each fibre.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/monoidal-dwyer-kan-localization`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Theorem A.7, pp. 130–131. Passes from a symmetric monoidal model category to its coherent localization, distinguishing the cofibrant strong presentation from the all-object lax map.

Acceptance.

- For chain complexes, tensor on cofibrant replacements computes derived tensor; ordinary tensor on arbitrary nonflat complexes cannot replace it.
- With a noncofibrant unit, its replacement still maps to the derived tensor unit.
- The all-object localization supplies lax tensor and unit maps; an unsupported strong all-object comparison fails the specification.

### Derived cocartesian families

Target: `EnhancedDerivedSheaves:E5:abstract/left-derivable-cocartesian-families`.

For a cocartesian fibration X→S over a small infinity-category, with vertical marked weak equivalences, call it left derivable when every transition has an absolute left derived functor, described as an absolute right Kan extension along the source localization, and the derived-composition comparisons are equivalences for all 2-simplices. Localizing X fibrewise gives a cocartesian fibration over S, with those derived transitions, compatible with base change by any small infinity-category K→S. The localization preserves original cocartesian lifts over a transition that preserves the marked weak equivalences; this is a sufficient condition, not a necessity assertion.

Conventions and hypotheses. Left derived is the source-localization right-Kan convention of NS A.8. S and every base-change K are small infinity-categories. E0 supplies restricted diagram shapes; the present construction requires the Cat∞ gluing argument for general S.

Construction or proof. Extend restricted straightening by NS A.16–A.17: points and intervals generate Cat∞ under colimits, cocartesian families glue along those categorical colimits, and pullback preserves the gluing. A strict colimit of raw simplicial sets is not substituted for that colimit. Localize fibres and derive transitions using E3 Kan extensions. Use the absolute property and the 2-simplex comparisons to assemble a coherent functor S→Cat∞. Apply NS A.14–A.15 to identify the total localization and its base-change comparison.

Direct inputs: `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Definition A.8, pp. 131–132; Proposition A.14, Corollary A.15, pp. 134–135; Lemmas A.16–A.17, pp. 136–137. States fibrewise localization and base-change compatibility under absolute derivation and coherent composition; the later lemmas provide the required arbitrary-base straightening input.

Uses. NS18, Appendix A: Derives coherent diagram transports without pretending underived transition functors preserve weak equivalences.

| API name | Role | Specification |
| --- | --- | --- |
| `DerivedFamilyData` | data | Base, total space, projection and localized fibres; full derivability conditions are additional. |
| `derivedFamily` | constructor | The localized cocartesian family with derived transports. |
| `derivedFamilyBaseChange` | compatibility | Pullback of the derived family equals deriving the pulled-back family. |

The following tests separate the intended definition from plausible substitutes.

- `DerivedFamilyData.test_point` (degenerate): Over a point the construction is the fibre localization.
- `DerivedFamilyData.test_interval` (characterisation): Over Δ¹ the transition is the derived transition, not the underived functor.
- `DerivedFamilyData.test_identity` (degenerate): For identity weak-equivalence classes the localized family is equivalent to the original one.

### Stable subcategories and tensor ideals

Target: `EnhancedDerivedSheaves:E5:abstract/stable-tensor-ideals`.

A stable subcategory D⊆C is a full subcategory closed under zero objects, fibers and cofibers; it need not be closed under retracts. In a stable monoidal C with separately exact tensor, it is a tensor ideal if X⊗Y lies in D whenever X lies in C and Y lies in D. The thick tensor ideal adds closure under retracts. For commutative A→B, the thick tensor ideal generated by B is taken in Mod_A(C), not in C unless A is the unit.

Conventions and hypotheses. C is stable; tensor-ideal statements require separately exact symmetric tensor. Keep stable, thick and localizing closure distinct.

Construction or proof. Use E0 stable full-subcategory operations and the existing object-property carrier. Define the closures by intersection and derive inclusions and induction principles. Tensor ideals and thick closure are used in quotient kernels and descendability.

Direct inputs: `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E5:abstract/module-objects`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Definition I.3.2, p. 18. Defines stable subcategories separately from retract closure and requires the tensor-ideal condition for the monoidal Verdier quotient.

Source: [The Galois group of a stable homotopy theory](https://arxiv.org/pdf/1404.2156), Definition 3.18, p. 19. Uses the thick tensor ideal generated by an algebra to define descendability; retract closure is essential.

Uses. NS18, Theorem I.3.6: The quotient tensor needs an ideal. BS17, Definition 11.14: Descendability is thick tensor generation of the unit.

| API name | Role | Specification |
| --- | --- | --- |
| `stableClosure` | constructor | Smallest full stable subcategory containing the given objects. |
| `thickTensorClosure` | constructor | Closure additionally under retracts and tensoring with arbitrary objects. |
| `tensorIdealInduction` | characterisation | Any full thick tensor ideal containing the generators contains their thick tensor closure. |

The following tests separate the intended definition from plausible substitutes.

- `stableClosure.test_zero` (degenerate): The thick tensor closure of zero contains only zero objects.
- `stableClosure.test_unit` (characterisation): The thick tensor closure of the tensor unit is all of C.
- `stableClosure.test_retract` (characterisation): Any retract of a generating object belongs to its thick tensor closure.

### Verdier quotient of a small stable infinity-category

Target: `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`.

For small stable C and full stable D⊆C, C/D is the Dwyer–Kan localization at maps with cofiber in D. It is stable and universal for exact functors C→E annihilating D. For X,Y∈C its mapping space is the filtered colimit over maps Z→Y with Z∈D of Map_C(X,cofib(Z→Y)). The kernel on objects is the retract closure of D, rather than D itself when D is not thick. If D is a tensor ideal and tensor is separately exact, the quotient is symmetric monoidal with the analogous universal property for exact lax monoidal functors.

Conventions and hypotheses. No compact-generation assumption is used. Idempotent completion of the quotient is a separate construction.

Construction or proof. Invert maps with cofiber in D; identify their calculus through the filtered approximation of Y by cofibers of Z→Y. Use the formula to establish mapping-space universality and stability. Apply monoidal localization to an ideal; derive the lax monoidal universality, preserving the distinction from strong maps.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/stable-tensor-ideals`, `EnhancedDerivedSheaves:E5:abstract/monoidal-dwyer-kan-localization`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Theorems I.3.3 and I.3.6, pp. 18–23. Constructs the stable quotient, computes its mapping spaces from cofiber approximations and supplies the exact and monoidal universal properties.

Uses. RefinedTraceMethods:RT.5: Imports the quotient formalism; trace-specific arguments are not prerequisites.

| API name | Role | Specification |
| --- | --- | --- |
| `verdierQuotient` | constructor | The stable localization C/D. |
| `verdierProjection` | data | The exact localization map. |
| `verdierRestriction` | universal-property | Exact functors out of C/D are exact functors out of C killing D. |
| `verdierMapping` | characterisation | Mapping spaces are the filtered cofiber approximation stated above. |

The following tests separate the intended definition from plausible substitutes.

- `verdierQuotient.test_zero` (degenerate): C/0 is equivalent to C.
- `verdierQuotient.test_all` (degenerate): C/C is the zero stable category.
- `verdierQuotient.test_suspension` (characterisation): q(ΣX) ≃ ΣqX.

### Barr–Beck–Lurie monadicity

Target: `EnhancedDerivedSheaves:E5:abstract/barr-beck-lurie`.

For F:C⇄D:G with unit and counit, let T=GF be the coherent monad on C. The comparison D→LMod_T(C) is an equivalence precisely when G is conservative and D admits geometric realizations of G-split simplicial objects which G preserves. Split refers to the augmented simplicial diagram after applying G. The algebra comparison preserves the forgetful functor to C.

Conventions and hypotheses. The coherent adjunction is imported from E3. Preservation of all colimits is sufficient in applications but is not the criterion’s hypothesis.

Construction or proof. Construct the coherent monad and comparison from the unit and counit. Use the split augmented bar resolution and conservativity to prove full faithfulness and essential surjectivity. Apply the exact G-split realization condition; do not replace it by unqualified preservation of arbitrary limits.

Direct inputs: `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `mathlib:CategoryTheory.Functor.ReflectsIsomorphisms`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Theorem 4.7.3.5, p. 685. Gives the conservative-right-adjoint and split-realization criterion for the monadic comparison equivalence.

Acceptance.

- For the free/forgetful adjunction on modules, the monadic comparison commutes with the forgetful functor.
- For the identity adjunction, the monad is the identity and its module category recovers C.
- Use G-split realizations and conservativity separately; neither condition can be discarded in the comparison.

### Descendable algebras and finite index

Target: `EnhancedDerivedSheaves:E5:abstract/descendable-algebras`.

In a presentable stable symmetric monoidal C whose tensor preserves colimits separately, A→B is descendable when A belongs to the thick tensor ideal generated by B in Mod_A(C). Write I=fib(A→B). It has index at most m when the natural map I^⊗_A m→A is nullhomotopic. Descendability is equivalent to such a finite m and to the augmented Amitsur totalization tower being pro-isomorphic to the constant A tower. Its definition uses finite thick generation, not merely recovery of the completed unit by the infinite totalization.

Conventions and hypotheses. m is a nonnegative integer; m=0 forces the unit A to be zero. Nullhomotopy is a nullhomotopy of the map, stronger than vanishing on cohomology.

Construction or proof. Define the augmentation fibre and its tensor powers in Mod_A(C). Relate the cubical bar tower to the cosimplicial partial-totalization tower by a pro-comparison. Use nilpotence of the augmentation maps to prove finite-index ⇔ thick generation ⇔ pro-constant Amitsur tower.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:abstract/stable-tensor-ideals`, `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Definitions 11.14 and 11.18, p. 43; Lemma 11.20, p. 44. Defines finite tensor nilpotence, characterizes it by thick generation and compares it with the pro-constant Amitsur tower.

Source: [The Galois group of a stable homotopy theory](https://arxiv.org/pdf/1404.2156), Definition 3.18 and Proposition 3.20, pp. 19–20. Defines descendability by thick tensor generation and derives the finite nilpotence criterion.

Uses. BS17, Theorem 11.15: Finite nilpotence supplies coherent module descent. BM26, item 47: Descendability is categorical, independent of later concrete spectra.

| API name | Role | Specification |
| --- | --- | --- |
| `descendable` | characterisation | The thick tensor generation criterion in Mod_A(C). |
| `descendabilityIndex` | characterisation | The canonical augmentation-fibre tensor-power map is nullhomotopic. |
| `amitsurTower` | data | The coherent tower of finite Amitsur totalizations, with augmentation. |

The following tests separate the intended definition from plausible substitutes.

- `descendable.test_identity` (degenerate): An identity algebra map has index at most one.
- `descendable.test_zero_index` (non-example): Index at most zero forces A=0.
- `descendable.test_completion` (non-example): ℤ_p→𝔽_p is not descendable, although its Amitsur completion recovers the p-complete unit.

### Module descent and permanence of descendability

Target: `EnhancedDerivedSheaves:E5:abstract/module-descent-and-functoriality`.

For descendable A→B, Mod_A(C) → lim_[n] Mod_(B^⊗_A(n+1))(C) is a symmetric monoidal equivalence along extension-of-scalars transitions. Descendability is preserved by composition, by passage to an intermediate algebra, and by exact strong monoidal functors. Cocontinuous lax monoidal functors preserve a specified finite index after applying their algebra and module structure maps. For a finite simplicial diagram of presentably stable symmetric monoidal categories, a commutative algebra in its limit is descendable if and only if its evaluations at every vertex are descendable. Extension of scalars along a descendable map is conservative.

Conventions and hypotheses. All limits of module categories are coherent limits. For the finite-limit statement use a finite simplicial indexing set; arbitrary inverse limits are not asserted.

Construction or proof. Use the finite index to show the augmented Amitsur resolutions are effective for every module. Apply the dual Barr–Beck–Lurie criterion to extension of scalars, whose conservativity follows from finite thick generation; the finite-index Amitsur resolution supplies the required split-totalization preservation. Prove composition and intermediate-algebra assertions by induction through thick ideals. Transport the canonical augmentation-power nullhomotopy under the functor. For finite limits of categories use the pointwise detection of a pro-constant bar tower (Mathew Proposition 3.25); for conservativity use the thick-generation argument.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/descendable-algebras`, `EnhancedDerivedSheaves:E5:abstract/barr-beck-lurie`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:presentability/limits-of-presentable-categories`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Theorem 11.15 and Lemma 11.17, p. 43; Lemma 11.20, p. 44. Gives module descent and the permanence of a specified finite descendability index under the stated algebra operations and monoidal functors.

Source: [The Galois group of a stable homotopy theory](https://arxiv.org/pdf/1404.2156), Propositions 3.19, 3.22, 3.24–3.27, pp. 19–22. Proves module descent and permanence; Proposition 3.25 tests descendability pointwise in a finite limit of categories, rather than under arbitrary finite limits of algebra objects.

Acceptance.

- For A→A the Amitsur diagram is constant and its limit recovers Mod_A.
- Extension of scalars along a descendable A→B detects zero modules; compatible unit objects and relative tensor products descend.
- The sequence ℤ_p→𝔽_p recovers the completed unit by totalization but is not descendable, so it cannot pass the finite thick-generation test.

### Uniform index and categorical descendability examples

Target: `EnhancedDerivedSheaves:E5:abstract/uniform-index-colimits`.

Fix a presentably stable symmetric monoidal category C and A∈CAlg(C), with tensor preserving colimits separately. Let I be a small filtered ordinary category such that derived inverse limits of Iᵒᵖ-diagrams of spectra have finite cohomological dimension. A coherent diagram of A-algebras B_i with every A→B_i of descendability index at most the same m has descendable colimit map A→colim_i B_i. For I=ℕ, index at most 2m suffices. Without a uniform bound this can fail. For ordinary rings, nilpotent ideal quotients are descendable, while a locally nilpotent ideal quotient need not be. A faithfully flat map with countably presented target algebra is descendable. If its source is Noetherian Gorenstein of Krull dimension d, a faithfully flat target has index at most d+1.

Conventions and hypotheses. The source algebra A is fixed throughout the diagram. The finite cohomological dimension is a condition on derived limits of spectra over Iᵒᵖ, and the index bound is uniform in i. Countably presented means both generators and relations, not merely countably generated. For I=ℕ the BS proof gives a bound 2m through the vanishing of lim²; no quantitative bound for arbitrary I is asserted here.

Construction or proof. For sequential diagrams apply the multiplicative derived-limit filtration to the powers of the augmentation map; two filtration-one maps have zero composite. For finite-cohomological-dimension I use the finite derived-limit filtration and multiplicativity; isolate this general tower input in the recorded gap. Apply the augmentation-fibre nilpotence criterion to nilpotent quotients and BS’s locally-nilpotent counterexample. Import E1’s ordinary Ext/projective-dimension statements to obtain the Gorenstein bound; use Mathew Corollary 3.33 for countable presentations.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/descendable-algebras`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E5:abstract/module-descent-and-functoriality`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Examples 11.19 and 11.21; Lemma 11.22; Remark 11.24, pp. 44–45. Proves the sequential uniform-index bound and records nilpotent, Gorenstein and countability applications; the general finite-cohomological-dimension filtration input remains explicit.

Source: [The Galois group of a stable homotopy theory](https://arxiv.org/pdf/1404.2156), Corollary 3.33, p. 24. Gives faithful-flat descendability for a target with countably many generators and relations; countable generation alone is not the cited hypothesis.

Acceptance.

- For a sequential diagram over one A, the same index m works at every stage and yields the bound 2m on the colimit.
- For A=𝔽_p[x₁,x₂,…]/(x₁²,x₂³,…) and I=(x₁,x₂,…), every finite-generator subideal is nilpotent, but I is not nilpotent and A→A/I is not descendable. This detects removal of the uniform bound.
- Identity maps have index at most 1; zero source unit allows index 0, so no convention silently excludes the degenerate case.

### Formal inversion of a tensor object

Target: `EnhancedDerivedSheaves:E5:abstract/formal-tensor-inversion`.

For presentably symmetric monoidal C and X∈C, C[X⁻¹] is initial among presentably symmetric monoidal categories receiving a colimit-preserving strong monoidal functor from C in which X becomes tensor invertible. For a presentable C-module M its base change M⊗_C C[X⁻¹] is the universal inversion of X on M. If the cyclic permutation of X⊗X⊗X is homotopic to the identity, its underlying presentable category is the colimit in PrL of the telescope M→M→⋯ with transition X⊗−. Without this symmetric-object hypothesis the telescope formula is not asserted.

Conventions and hypotheses. Universes and presentability are fixed. The cyclic symmetry is a coherent homotopy condition, not equality in an ordinary Grothendieck group.

Construction or proof. Construct the inversion as a localization in commutative algebra objects of PrL. Base change modules along its universal map. Apply Robalo’s symmetric-object argument to identify the telescope, checking the permutation hypothesis.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`.

Source: [K-theory and the bridge from motives to noncommutative motives](https://arxiv.org/pdf/1206.3645), Proposition 4.10, pp. 75–76; Definition 4.18, p. 88; Proposition 4.21, p. 90; Corollary 4.24, p. 92. Constructs presentable tensor inversion and its module base change; the telescope calculation requires the cyclic symmetry condition on the inverted object.

Uses. BM26, item 47: Imports formal categorical tensor inversion; motive-specific objects belong to the Berkovich continuation.

| API name | Role | Specification |
| --- | --- | --- |
| `tensorInversion` | constructor | The universal presentable symmetric monoidal inversion. |
| `tensorInversionMap` | data | The colimit-preserving strong monoidal universal map. |
| `tensorInversionUniversal` | universal-property | Restriction identifies colimit-preserving strong monoidal functors with those carrying X to an invertible object. |

The following tests separate the intended definition from plausible substitutes.

- `tensorInversion.test_unit` (degenerate): Inverting the unit changes C by an equivalence.
- `tensorInversion.test_zero` (degenerate): Inverting zero in a stable C gives the zero category.
- `tensorInversion.test_idempotent` (characterisation): Inverting the already inverted object again changes nothing.

## Presentable categories and coherent extensions

### Compact objects

Target: `EnhancedDerivedSheaves:E5:presentability/compact-objects`.

For regular κ, an object x of C is κ-compact if Map_C(x,−) preserves κ-filtered colimits. Compact means ω-compact. Write C^κ for the full subcategory. In a presentable stable C, compact generation means a small set of compact objects whose shifts detect zero. Finite colimits and retracts of compact objects are compact. Compactness is a mapping-space condition, not merely finite generation of the cohomology groups.

Conventions and hypotheses. C admits the indicated filtered colimits. Use universes where C^κ is essentially small when forming its Ind-completion.

Construction or proof. Apply E0 mapping spaces to the canonical filtered-colimit comparison. Identify the full subcategory by this preservation property. For stable C use finite-limit commutation in spaces and the suspension equivalence.

Direct inputs: `EnhancedDerivedSheaves:E0/right-mapping-space`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 5.3.4.5, printed p. 396 (PDF p. 414). Defines compactness using preservation of filtered colimits by mapping spaces, rather than finite generation of cohomology.

Uses. FS21, Lemma IV.2.20: Compact objects test preservation of coproducts by right adjoints.

| API name | Role | Specification |
| --- | --- | --- |
| `compactObjects` | constructor | The full subcategory of ω-compact objects. |
| `compactMappingComparison` | characterisation | Map(x,colim y_i) ≃ colim Map(x,y_i) for x compact and the indexing diagram filtered. |
| `compactRetract` | structure | Retracts of compact objects are compact. |

The following tests separate the intended definition from plausible substitutes.

- `compactObjects.test_zero` (degenerate): Zero is compact in any stable C.
- `compactObjects.test_ring` (compatibility): R in D(R) is compact and its shifts detect zero.
- `compactObjects.test_infinite_sum` (non-example): The countable direct sum of copies of a nonzero field is not compact in its derived category.

### Ind-completion

Target: `EnhancedDerivedSheaves:E5:presentability/ind-completion`.

Ind_κ(C) is the full subcategory of P(C)=Fun(Cop,Spaces) spanned by κ-filtered colimits of representables. Yoneda lands in it and is fully faithful; the representables are κ-compact, and every object has a κ-filtered presentation. For a small idempotent-complete C with finite colimits, Ind(C) is compactly generated and its compact objects recover C. On ordinary C the 0-truncated presheaf part compares with Mathlib’s set-valued Ind(C); it is not an unconditional equivalence with the full space-valued completion.

Conventions and hypotheses. C is small in the input universe. For κ>ω the generation equivalence uses the relevant κ-small colimits; the finite-colimit formulation here is for ω.

Construction or proof. Use E3 presheaf Yoneda and select filtered colimits of representables. Prove full faithfulness, compactness and filtered presentation using the mapping-space formula. Identify compact objects as retracts of representables under the finite-colimit hypotheses.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `mathlib:CategoryTheory.Ind`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 5.3.5.1, printed p. 403; Propositions 5.3.5.10–11, printed pp. 406–407. Constructs the space-valued filtered completion and gives compactness, generation and extension criteria for the Yoneda image.

Uses. NS18, Proposition I.3.5: The large quotient is the Ind extension of the small quotient.

| API name | Role | Specification |
| --- | --- | --- |
| `indCompletion` | constructor | The space-valued filtered-colimit completion. |
| `indYoneda` | data | The fully faithful representable embedding. |
| `indCompactComparison` | equivalence | For small stable idempotent-complete C, compact objects of Ind(C) are C. |

The following tests separate the intended definition from plausible substitutes.

- `indCompletion.test_terminal` (degenerate): Ind(*) is terminal.
- `indCompletion.test_compacts` (characterisation): For small stable idempotent-complete C, the compact comparison is an equivalence.
- `indCompletion.test_discrete` (computation): For an ordinary discrete category, no filtered presentation creates a new connected component.

### The universal property of Ind

Target: `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`.

If small C and D admits κ-filtered colimits, restriction along Yoneda gives Fun_κ(Ind_κ(C),D) ≃ Fun(C,D). The extension sends a filtered presentation colim_i y(c_i) to colim_i F(c_i), independently of the presentation. If C,D have finite colimits and F preserves them, its Ind extension preserves all colimits. The extension is an equivalence exactly when the input is fully faithful, its objects are κ-compact in D, and they κ-filtered-generate D.

Conventions and hypotheses. The equivalence criterion refers to the stated fully faithful input, not an arbitrary functor.

Construction or proof. Apply the E3 full-inclusion left Kan extension to Yoneda. Use filtered presentations to prove evaluation and uniqueness on mapping spaces. Use compactness to prove full faithfulness of the extension, then generation for essential surjectivity.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Propositions 5.3.5.10–11, printed pp. 406–407 (PDF pp. 424–425). Proves extension from the small category to filtered-colimit-preserving functors and the compact-generation criterion for that extension to be an equivalence.

Acceptance.

- Restriction of the extension of F is naturally equivalent to F; two filtered presentations of one Ind-object give the same mapping-space comparison.
- For an idempotent-complete small stable C, compact objects of Ind(C) recover C.
- The extension-equivalence criterion fails if its generators are not compact, even when they generate under colimits.

### Stable and monoidal Ind-completion

Target: `EnhancedDerivedSheaves:E5:presentability/ind-of-a-stable-category-is-stable`.

For small stable C, Ind_κ(C) is stable and Yoneda is exact. For small symmetric monoidal C, Ind(C) has a symmetric monoidal structure whose tensor preserves filtered colimits separately and extends C’s tensor. If C is stable and tensor exact separately, this tensor preserves all colimits separately. Exact strong monoidal functors on C extend to colimit-preserving strong monoidal functors on Ind(C); uniqueness includes their coherent monoidal structure.

Conventions and hypotheses. The monoidal colimit-preservation conclusion needs stability and exactness, not just existence of tensor.

Construction or proof. Express arrows as filtered colimits of arrows in C and compute their cofibers. Use finite-limit commutation with filtered colimits in spaces to identify fibers. Apply the monoidal free-colimit completion in HA 4.8.1.14; check finite cofiber compatibility to upgrade filtered preservation to all colimits.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.1.3.6, p. 32; Corollary 4.8.1.14, pp. 711–712. Proves stability of Ind and extends the tensor by filtered colimits; separate exactness gives all-colimit preservation in the stable case.

Acceptance.

- The Ind Yoneda functor preserves the zero object, cofibers and the E0 suspension convention.
- Tensor of two filtered representable presentations is computed by the product filtered diagram, and the unit is the representable original unit.
- Separately exact tensor and filtered-colimit preservation imply arbitrary-colimit preservation in the stable completion.

### Presentable infinity-categories

Target: `EnhancedDerivedSheaves:E5:presentability/presentable-categories`.

C is presentable when it is accessible and admits all small colimits. Equivalently it is an accessible reflective localization of a presheaf infinity-category. PrL has these objects and colimit-preserving functors; PrR uses accessible right adjoints. Accessibility entails a regular cardinal and an essentially small subcategory of compact objects generating by that cardinal’s filtered colimits. Presentability alone does not assert compact generation at ω.

Conventions and hypotheses. Maintain the specified universe of small colimits. Representability and adjoint existence are supplied by E3, including the accessibility condition.

Construction or proof. Describe accessibility by the essentially small κ-compact subcategory and its filtered generation. Construct the space-valued presheaf category using E0 functor/limit infrastructure; use HTT 5.5.1.1 to compare accessible presheaf localizations with the definition. Define PrL and PrR by their coherent preservation/adjoint properties; E1’s concrete sheaf application imports this generic definition.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 5.5.0.1, printed p. 456 (PDF p. 474); Theorem 5.5.1.1, printed pp. 457–460; Proposition 5.5.2.2, printed p. 463 (PDF p. 481). Defines accessible cocomplete categories and identifies them with accessible reflective localizations of presheaf categories. The representability test uses contravariant mapping spaces and preservation of limits in Cᵒᵖ.

Uses. Diamonds, Lemma 17.1 and Proposition 26.2: The generic limit theorem is here; the geometric full subcategory and completion are consumers.

| API name | Role | Specification |
| --- | --- | --- |
| `PresentableData` | data | A category, a regular accessibility cardinal and a small generating subcategory; accessibility/colimit axioms are part of the full definition. |
| `presentableLeftFunctors` | data | Colimit-preserving coherent functors. |
| `presentableRightFunctors` | data | Accessible right adjoints. |

The following tests separate the intended definition from plausible substitutes.

- `PresentableData.test_modules` (compatibility): The enhanced derived category of R-modules is presentable.
- `PresentableData.test_terminal` (degenerate): The zero stable category is presentable.
- `PresentableData.test_representability` (characterisation): A small-limit-preserving functor Cᵒᵖ→Spaces on a presentable C is represented by an object of C, as provided by E3’s criterion.

### Limits in PrL

Target: `EnhancedDerivedSheaves:E5:presentability/limits-of-presentable-categories`.

Every small diagram of presentable categories and colimit-preserving functors has a limit in PrL, and its underlying category is the limit in Cat∞. Colimits in that limit are detected and computed by the projections. In particular pullbacks of presentable colimit-preserving functors are presentable. The limit remains stable when the diagram categories are stable. This does not imply that an unrelated forgetful functor from a completed subcategory preserves colimits.

Conventions and hypotheses. The diagram is coherent in PrL, not a diagram of triangulated categories.

Construction or proof. Construct the Cat∞ limit using E0/E3 coherent diagrams. Use the presentable pullback theorem and accessible-localization presentations to verify presentability. Compute colimits pointwise and check the projection joint-detection property; stability follows from pointwise finite fibers and cofibers.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E5:abstract/left-derivable-cocartesian-families`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Propositions 5.5.3.12–13, printed pp. 469–470 (PDF pp. 487–488). Proves existence of small limits of presentable categories with colimit-preserving transition maps and identifies the underlying categorical limit.

Source: [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), Lemma 17.1, p. 97; Proposition 26.2, p. 162. Applies presentable limits to derived coefficient categories; those geometric applications remain downstream of the generic theorem.

Acceptance.

- The limit of a diagram over one point is its input; the empty limit is the terminal presentable category.
- In a pullback C×_E D of left adjoints, projections compute coproducts and cofibers componentwise.
- A completed-module inclusion into ambient modules can fail to preserve coproducts; this does not contradict the theorem, since that inclusion need not be a PrL map.

### Tensor products of presentable categories and module base change

Target: `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`.

For presentable C,D, C⊗D represents functors C×D→E preserving colimits separately: FunL(C⊗D,E) ≃ FunL,L(C×D,E). PrL is symmetric monoidal with unit Spaces; its stable subcategory has unit the abstract stabilization Sp, with no concrete spectral model required. For presentably monoidal C, a presentable right C-module M and algebra A∈C, M⊗_C RMod_A(C) ≃ RMod_A(M). Extension of scalars and these comparisons are coherent for compositions and units.

Conventions and hypotheses. The required geometric realizations exist and tensor actions preserve colimits separately. The relative tensor is categorical; distinguish it from an object’s derived tensor over a ring.

Construction or proof. Use HA’s separately-colimit universal property to construct C⊗D and its internal FunL category. Realize the categorical two-sided bar construction for relative module tensors. Evaluate the universal balanced functors on free A-modules to prove the module base-change comparison.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:presentability/ind-of-a-stable-category-is-stable`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Propositions 4.8.1.15 and 4.8.1.17, pp. 712–715; Theorem 4.8.4.6, p. 737. Gives the separately-colimit universal property of categorical tensor and the relative categorical module-tensor comparison for a right-tensored category.

Uses. BM26, item 60: Dualizability and rigidity use the tensor of categories rather than tensor of coefficient modules.

| API name | Role | Specification |
| --- | --- | --- |
| `presentableTensor` | constructor | The separately-colimit-preserving tensor of categories. |
| `presentableTensorUniversal` | universal-property | The equivalence of colimit-preserving and separately colimit-preserving functors. |
| `categoricalModuleBaseChange` | compatibility | The relative categorical tensor agrees with the category of modules in M. |

The following tests separate the intended definition from plausible substitutes.

- `presentableTensor.test_spaces` (degenerate): Spaces⊗C ≃ C for presentable C.
- `presentableTensor.test_stable_unit` (degenerate): Sp⊗C ≃ C for presentable stable C.
- `presentableTensor.test_zero` (degenerate): Zero⊗C is zero in PrL_st.

### Ind of a Verdier quotient

Target: `EnhancedDerivedSheaves:E5:presentability/ind-verdier-localization`.

For small stable C and full stable D, Ind(C)→Ind(C/D) is a localization with kernel Ind(D), interpreted by its fully faithful extension. Its right adjoint is fully faithful and preserves colimits; the right adjoint extends the quotient-Yoneda approximation C/D→Ind(C). The monoidal version exists for separately exact tensors and tensor ideals. Compact objects of the target are Idem(C/D), not C/D without an idempotent-completeness hypothesis.

Conventions and hypotheses. No retract closure hypothesis on D is necessary for the Ind localization statement.

Construction or proof. Extend the small quotient using the Ind universal property. Use the mapping-space approximation to construct the right adjoint on quotient generators. Extend it by colimits; verify the unit and counit on generators and identify the kernel.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/verdier-quotient`, `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`, `EnhancedDerivedSheaves:E5:presentability/ind-of-a-stable-category-is-stable`.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Proposition I.3.5, pp. 21–22. Identifies the kernel of the Ind-extended quotient and its fully faithful colimit-preserving right adjoint.

Acceptance.

- For D=0 the Ind localization is the identity; for D=C its target is zero.
- Objects of Ind(D) go to zero and the localization counit is invertible.
- Compact objects are the retract closure of C/D; a missing retract cannot be silently discarded.

### Compactness and right adjoints

Target: `EnhancedDerivedSheaves:E5:presentability/neeman-compactness-criterion`.

For F:C⇄D:G between presentable stable categories, if C is compactly generated then F preserves compact objects if and only if G preserves coproducts, equivalently all colimits. The forward direction tests the coproduct comparison against compact generators of C; the reverse uses the mapping-space adjunction. The general κ-accessible version replaces compact/coproduct preservation by κ-compact/κ-filtered preservation with the accessibility hypotheses of HTT 5.5.7.2.

Conventions and hypotheses. The source C of the left adjoint is compactly generated in the converse test; presentability alone is insufficient. G is already exact as a right adjoint between stable categories.

Construction or proof. Apply the adjunction to maps out of compact source generators. Use detection by their shifts to identify the canonical coproduct comparison. Use exactness plus coproduct preservation to obtain all colimits, and the adjunction to get preservation of compactness back.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 5.5.7.2, printed p. 501 (PDF p. 519). Gives the compact-object/right-adjoint-colimit correspondence with its accessibility hypotheses; the compactly generated stable specialization tests coproducts against generators.

Source: [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma IV.2.20, pp. 123–124. Uses compact preservation to obtain preservation of sums by the right adjoint in the compactly generated derived setting.

Source: [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), Proposition 23.7, p. 144. Uses the compact-generation criterion to identify the right-adjoint preservation property in the geometric application.

Acceptance.

- For extension of scalars Mod_R→Mod_S, the unit R maps to the compact object S and restriction commutes with coproducts.
- The proof checks every shift of each compact generator when testing the coproduct comparison.
- Compact generation is required for the converse detection step; preservation on an empty compact subcategory gives no conclusion.

### Coherent actions and continuous fixed points

Target: `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`.

For a finite group G, an action on C is a coherent functor BG→Cat∞, equivalently a cocartesian fibration over BG. Its homotopy fixed point category is its limit; for two actions, equivariant functors are the homotopy fixed points of Fun(C,D) under conjugation. Presentable stable actions by equivalences have presentable stable fixed point categories. For a profinite G, categorical actions factoring through a specified finite quotient are pulled back coherently from that quotient. The continuous coefficient specialization uses the E1 enhancement of discrete continuous G-modules: derived invariants agree with the canonical continuous-cochain object and, in degree n, the ProfiniteCohomology finite-quotient system colim_U Hⁿ(G/U,M^U). No filtered-colimit formula for arbitrary categorical homotopy fixed points is asserted.

Conventions and hypotheses. For profinite coefficient modules M the topology is discrete and stabilizers of each element are open. The all-degree finite-quotient statement is ProfiniteCohomology Layer 10; Layer 4 supplies only degrees 0,1,2. General topological actions on Cat∞ beyond finite-quotient factoring require a chosen continuity model.

Construction or proof. Use the arbitrary-base extension of E0 straightening and coherent limits to construct actions and fixed points. Construct conjugation coherently on the functor category and take its limit. For continuous modules use E1’s enhancement and import the existing ProfiniteCohomology dictionary and canonical comparisons; do not replan its cochain theory.

Direct inputs: `EnhancedDerivedSheaves:E5:abstract/left-derivable-cocartesian-families`, `EnhancedDerivedSheaves:E5:presentability/limits-of-presentable-categories`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Propositions 5.5.3.12–13, printed pp. 469–470. The presentable-limit theorem applies to coherent BG families; finite-group and finite-quotient factoring actions are constructed from this and the explicit upstream continuous-coefficient interfaces.

Source: [On topological cyclic homology](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf), Lemma A.16, p. 136. The coherent-family/straightening construction provides the BG action model; the continuous coefficient formula is imported from ProfiniteCohomology, not proved by this lemma.

Uses. FS21, Theorem X.1.1: Coherent actions on a stable category enter the representation comparison.

| API name | Role | Specification |
| --- | --- | --- |
| `CoherentActionData` | data | The cocartesian family over BG, retaining coherent transitions. |
| `homotopyFixedPoints` | constructor | The coherent limit over BG. |
| `equivariantFunctors` | constructor | The limit of the conjugation action on Fun(C,D). |
| `continuousDerivedInvariants` | compatibility | The enhanced derived invariants specialize to the upstream canonical continuous cochains. |

The following tests separate the intended definition from plausible substitutes.

- `CoherentActionData.test_trivial_group` (degenerate): The trivial group has C as its fixed point category.
- `CoherentActionData.test_trivial_action` (characterisation): The trivial action of finite G on C has fixed point category Fun(BG,C).
- `CoherentActionData.test_finite_coefficients` (compatibility): For finite G and coefficients M, derived invariants agree with ordinary group cohomology in every nonnegative degree.

### Compact morphisms and compact exhaustions

Target: `EnhancedDerivedSheaves:E5:presentability/compact-morphisms`.

A weakly compact map f:x→y factors through some stage whenever y maps into a filtered colimit. A compact map has the coherent lifting property for the square obtained by precomposition with f between colim_i Map(y,z_i)→Map(y,colim z_i) and colim_i Map(x,z_i)→Map(x,colim z_i). A strongly compact map has its representable transformation factoring through a filtered-colimit-preserving functor. A compact exhaustion is a sequential presentation x≃colim x_n with compact transition maps. In compactly assembled categories these three notions agree; outside this hypothesis they are kept distinct.

Conventions and hypotheses. Compactness of an object means compactness of its identity map. Weak factorization on components alone does not impose coherent diagonal fillers.

Construction or proof. Form the precomposition square in mapping spaces, then its coherent diagonal-lift condition. Define sequential exhaustion using E0 coherent diagrams. Apply Ramzi’s representable factorization argument to compare the notions under compact assembly.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E0/right-mapping-space`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `mathlib:CategoryTheory.IsFiltered`.

Source: [Dualizable presentable infinity-categories](https://arxiv.org/pdf/2410.21537v1), Definitions 2.1, 2.3 and 2.5, pp. 26–27; Definition 2.23 and Lemma 2.24, pp. 31–32. Distinguishes weak lifting, coherent diagonal lifting and representable-factorization compactness, and defines sequential compact exhaustions.

Uses. BM26, Definition 2.7: Compact transitions, not compact terms, allow categories with too few compact objects.

| API name | Role | Specification |
| --- | --- | --- |
| `compactMorphismSquare` | data | The precomposition square whose diagonal fillers define compactness. |
| `compactExhaustion` | data | A sequential diagram with compact transitions realizing the given object. |
| `compactIdentityComparison` | characterisation | The identity is compact precisely when its object is compact. |

The following tests separate the intended definition from plausible substitutes.

- `compactMorphismSquare.test_zero` (degenerate): The zero morphism is compact in a stable compactly assembled category.
- `compactMorphismSquare.test_identity` (non-example): The identity of a countably infinite-dimensional rational vector space is not compact.
- `compactMorphismSquare.test_finite_rank` (computation): Every finite-rank map of rational vector spaces in degree zero is compact.

### Dualizable and compactly assembled categories

Target: `EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories`.

A presentable stable C is dualizable in PrL_st if it admits a dual, evaluation and coevaluation with triangle homotopies. Equivalently C is a retract, through colimit-preserving functors, of a compactly generated stable category. Equivalently its large-universe colimit functor Ind(C)→C has a left adjoint. In the compactly assembled description filtered colimits commute with finite limits, and objects admitting compact exhaustions generate under filtered colimits. No compact-generation assumption on C is imposed.

Conventions and hypotheses. The Ind(C) criterion uses a larger universe; it is not Ind(C^ω). The triangle homotopies and coherent retraction are part of the categorical statement.

Construction or proof. Use the categorical tensor to define dual pairs. Apply the retract/atomic-generator characterization of Ramzi Theorem 1.49 in the stable absolute specialization. Identify the compact-exhaustion characterization via Theorem 2.39 and BM Remark 2.8.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, `EnhancedDerivedSheaves:E5:presentability/compact-morphisms`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`.

Source: [Dualizable presentable infinity-categories](https://arxiv.org/pdf/2410.21537v1), Theorem 1.49, pp. 17–18; Definition 1.68, p. 25; Theorem 2.39, p. 39. Characterizes dualizable stable presentable categories by retracts of compactly generated categories and the left adjoint to the enlarged Ind-colimit functor, without assuming compact generation of the category itself.

Source: [Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Definition 2.7 and Remark 2.8, p. 9. Gives the left-exact filtered-colimit and weak compact-exhaustion description, and the enlarged Ind-colimit adjoint criterion. Stability is imposed here before identifying compact assembly with dualizability.

Uses. BM26, Lemma 10.5: Filtered colimits preserve dualizability under strong continuity even without compact generation. RefinedTraceMethods:RT.5: Imports dualizable categories as the trace-theoretic input.

| API name | Role | Specification |
| --- | --- | --- |
| `DualPairData` | data | Dual, evaluation and coevaluation; triangle homotopies are required in the full interface. |
| `dualizableRetractComparison` | characterisation | Dualizable stable presentable categories are retracts of compactly generated ones. |
| `assemblyLeftAdjoint` | data | The left adjoint to large-universe Ind colimit. |

The following tests separate the intended definition from plausible substitutes.

- `DualPairData.test_modules` (compatibility): D(R) is dualizable, with the expected dual evaluation via relative tensor.
- `DualPairData.test_zero` (degenerate): The zero category is self-dual.
- `DualPairData.test_retract` (characterisation): A coherent colimit-preserving retract of a compactly generated category is dualizable.

### Filtered colimits of dualizable categories

Target: `EnhancedDerivedSheaves:E5:presentability/strongly-continuous-filtered-colimits`.

A left adjoint is strongly continuous when its right adjoint also preserves colimits. A filtered diagram of dualizable stable presentable categories with strongly continuous transitions has dualizable colimit in PrL_st. The canonical comparison from the colimit of their compact subcategories to the compact subcategory of the result is an equivalence, with colimits of small stable categories taken in the idempotent-complete convention. The result does not assert that any input or the colimit is compactly generated.

Conventions and hypotheses. Use strong continuity, not merely that the left adjoint preserves filtered colimits. For arbitrary presentable inputs the compact-subcategory comparison is not asserted.

Construction or proof. Use Ramzi Proposition 1.62, or Efimov Proposition 2.63: coherent atomic presentations retract onto the diagram along internal left adjoints, so the PrL_st colimit remains dualizable. Choose a uniform uncountable regular accessibility cardinal. Embed each input by the assembly left adjoint into its Ind of cardinal-compact objects; the corresponding quotient is compactly generated. The compact subcategory of the input is the kernel between the two small compact subcategories. Efimov Proposition 2.67 shows that filtered colimits preserve the strongly continuous fully faithful embeddings and their exact sequences. Finite kernels commute with filtered colimits in the category of small idempotent-complete stable categories, yielding Proposition 2.70 and the compact-object comparison. This does not require the input itself to be compactly generated.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories`, `EnhancedDerivedSheaves:E5:presentability/neeman-compactness-criterion`.

Source: [Berkovich Motives](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf), Lemma 10.5, p. 55. States the compact-subcategory comparison for filtered diagrams of dualizable stable categories with strongly continuous maps. Its proof points to Efimov; Corollary 10.6 is a geometric application, not the generic closure theorem.

Source: [Dualizable presentable infinity-categories](https://arxiv.org/pdf/2410.21537v1), Proposition 1.62, p. 22. Proves closure of dualizable presentable categories under colimits whose transitions are internal left adjoints, using coherent atomic-presentation retractions.

Source: [K-theory and localizing invariants of large categories](https://arxiv.org/pdf/2405.12169v4), Propositions 2.63, 2.67 and 2.70, pp. 52–55 (arXiv v4). Proves strongly continuous colimit closure and the compact-subcategory comparison through exact sequences of compactly generated presentations and filtered finite-kernel commutation. This is the updated numbering of BM26’s cited Proposition 1.72.

Acceptance.

- A constant filtered diagram recovers the original category and its compact subcategory.
- For a diagram of D(R_i) along scalar extension, the compact comparison identifies the colimit of perfect subcategories with the perfect objects of the colimit.
- The compact-object comparison is checked on morphism spaces and retracts; no stage or colimit is assumed compactly generated.

### Trace-class maps and rigid categories

Target: `EnhancedDerivedSheaves:E5:presentability/rigid-presentable-categories`.

In a presentable closed symmetric monoidal C, f:x→y is trace-class if there are d, a pairing d⊗x→1 and a map 1→y⊗d whose contraction is f. Equivalently its class in Hom(x,y) lifts through Hom(x,1)⊗y. C is locally rigid over V when it is dualizable as a V-module and multiplication C⊗_V C→C is an internal left adjoint over C⊗_V C: its right adjoint preserves colimits and is bilinear. It is rigid when additionally its unit is V-atomic; absolutely over Sp this means compact. In the absolute stable case local rigidity is equivalent to dualizability plus every compact morphism being trace-class. Compact unit together with trace-class compact exhaustions generating under colimits implies rigidity.

Conventions and hypotheses. Objectwise dualizability is distinct from categorical rigidity. Absolute stable formulations use the abstract unit Sp of PrL_st, not a concrete spectrum model.

Construction or proof. Define the contraction of evaluation and coevaluation and the trace-class factorization. Use the internal adjoint criterion for multiplication, with both linearity and preservation of colimits. Apply Ramzi v2 Proposition 4.15 and Corollary 4.60, translating v1 locator 4.57 to v2 4.60.

Direct inputs: `EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories`, `EnhancedDerivedSheaves:E5:presentability/compact-morphisms`, `EnhancedDerivedSheaves:E5:presentability/tensor-product-and-module-base-change`, `EnhancedDerivedSheaves:E5:abstract/module-objects`.

Source: [Locally rigid infinity-categories](https://arxiv.org/pdf/2410.21524v2), Definition 3.1, p. 21; Definition 4.5, p. 24; Proposition 4.15, pp. 26–27; Definition 4.36, p. 33; Corollary 4.60, p. 38. Defines trace-class maps and local rigidity and proves the compact-unit plus trace-class-exhaustion criterion for rigidity, using the downloaded v2 numbering.

Uses. BM26, item 60: Rigid coefficient categories supply linear and colimit-preserving right adjoints.

| API name | Role | Specification |
| --- | --- | --- |
| `TraceClassData` | data | A factorization through an evaluation/coevaluation contraction. |
| `RigidData` | data | A dual pair and the bilinear colimit-preserving right adjoint to multiplication; compact unit is additional. |
| `rigidRightAdjointLinearity` | compatibility | Right adjoints to strong monoidal maps between rigid categories are strong module-linear and colimit-preserving. |

The following tests separate the intended definition from plausible substitutes.

- `RigidData.test_modules` (compatibility): For commutative R, D(R) is rigid with compact unit R.
- `TraceClassData.test_dualizable` (characterisation): The identity of a dualizable object is trace-class.
- `TraceClassData.test_infinite` (non-example): The identity of an infinite-dimensional rational vector space is not trace-class.

## Animation and characteristic-p adapters

### Sifted colimits

Target: `EnhancedDerivedSheaves:E5:animation/sifted-colimits`.

A small infinity-category I is sifted if it is nonempty and the diagonal I→I×I is cofinal; equivalently its colimits in spaces commute with finite products. Filtered categories and Δop are sifted. Empty is not sifted: its colimit does not preserve the empty product. Nerves of ordinary sifted categories compare with Mathlib’s IsSifted where the diagonal is homotopy cofinal; ordinary connectedness of comma categories alone does not establish homotopy cofinality.

Conventions and hypotheses. Infinity-categorical cofinality is supplied by the E0/E3 mapping-space machinery. Do not identify ordinary finality with homotopy cofinality without contractibility.

Construction or proof. Define the nonempty and diagonal cofinality criterion. Use the spaces-colimit criterion to prove finite-product commutation. Check Δop by its standard simplicial contraction, and filtered shapes by contractibility of finite cone categories.

Direct inputs: `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `mathlib:CategoryTheory.IsSifted`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §5.5.8, especially Proposition 5.5.8.10, printed pp. 506–508; §5.5.8 introduction. Uses nonemptiness and the cofinal diagonal to obtain finite-product commutation of space-valued colimits; simplicial realizations are the fundamental example.

Uses. HTT, Proposition 5.5.8.15: The animation universal property uses filtered colimits and realizations, hence all sifted colimits.

| API name | Role | Specification |
| --- | --- | --- |
| `siftedDiagonal` | data | The diagonal I→I×I, with nonemptiness and cofinality as the definitive definition’s hypotheses. |
| `siftedProductComparison` | characterisation | The comparison colim(F×G)→colim F×colim G is an equivalence. |
| `siftedRealization` | compatibility | Geometric realization is a sifted colimit and commutes with finite products of spaces. |

The following tests separate the intended definition from plausible substitutes.

- `siftedDiagonal.test_empty` (non-example): The empty category is not sifted.
- `siftedDiagonal.test_simplex` (computation): Δop is sifted.
- `siftedDiagonal.test_two_points` (non-example): The discrete category with two objects is not sifted.

### The nonabelian derived category

Target: `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`.

For a small category C with finite coproducts, PΣ(C) is the full subcategory of Fun(Cop,Spaces) sending finite coproducts to products, including the empty coproduct. It is presentable. Yoneda is fully faithful, preserves finite coproducts and its image consists of compact projective objects. Every object is a sifted colimit of representables, more precisely a geometric realization of coproducts of representables. Compact-projective means Map(x,−) preserves sifted colimits, a stronger property than ordinary compactness.

Conventions and hypotheses. Space-valued presheaves are essential; replacing them by set-valued presheaves would remove animation. The target Spaces has cartesian products.

Construction or proof. Impose finite-coproduct relations on presheaves as an accessible localization. Use Yoneda evaluation and sifted-product commutation for compact projectivity. Use HTT’s simplicial resolution by representables for generation.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 5.5.8.10 and Lemma 5.5.8.14, printed pp. 507–510. Constructs finite-coproduct-preserving space-valued presheaves, their compact-projective Yoneda generators and simplicial presentations by coproducts of representables.

Uses. DerivedDeRhamCohomology:DD.0/cotangent-complex: Polynomial resolutions use this single animation foundation.

| API name | Role | Specification |
| --- | --- | --- |
| `nonabelianDerived` | constructor | The finite-coproduct-to-product space-valued presheaves. |
| `animationYoneda` | data | The compact-projective representable embedding. |
| `animationResolution` | characterisation | Each object has a simplicial resolution by coproducts of representables. |

The following tests separate the intended definition from plausible substitutes.

- `nonabelianDerived.test_initial` (degenerate): For the category with just its zero coproduct object, PΣ is terminal.
- `nonabelianDerived.test_finite_sets` (computation): PΣ(FinSet) is Spaces.
- `nonabelianDerived.test_coproduct` (characterisation): Yoneda preserves finite coproducts in PΣ, rather than pointwise coproducts of unrestricted presheaves.

### The universal property of animation

Target: `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

If C is small with finite coproducts and D admits filtered colimits and geometric realizations, restriction gives Fun_sifted(PΣ(C),D) ≃ Fun(C,D). The inverse is sifted left Kan extension. It preserves all colimits exactly when its input preserves finite coproducts, provided D admits those coproducts. Evaluation on a simplicial polynomial resolution is realization of the values. HTT’s strict simplicial algebra model presents PΣ(C) by objectwise weak equivalences; rectification is part of the comparison, not a definition by assertion.

Conventions and hypotheses. The full equivalence includes coherent natural transformations and uniqueness. Model rectification uses the finite-product theory Cop.

Construction or proof. Use the representable resolution and E3 left Kan extension to construct the inverse. Prove resolution independence and sifted-colimit preservation, then the restriction equivalence. Apply HTT 5.5.9.2–3 for the strict-product-preserving simplicial model.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 5.5.8.15, printed p. 510 (PDF p. 528); Proposition 5.5.9.1 and Corollary 5.5.9.3, printed pp. 516–517. Gives the sifted-colimit-preserving extension property and rectifies these presheaves to strict simplicial algebra models.

Acceptance.

- For C=FinSet, the sifted extension of C→Spaces recovers the identity on Spaces.
- Sifted extension of a finite-coproduct-preserving functor also preserves finite coproducts; applying a different simplicial resolution gives an equivalent value.
- Natural transformations extend uniquely, so the universal property is a functor-category equivalence rather than only a bijection on objects.

### Animated commutative rings

Target: `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`.

For an ordinary commutative R, let Poly_R be the category of polynomial R-algebras in finitely many variables and all R-algebra maps. AnimAlg_R=PΣ(Poly_R) is equivalent to the infinity-localization of simplicial commutative R-algebras at maps inducing isomorphisms on all homotopy groups. Its discrete subcategory is ordinary R-algebras; inclusion has π₀ as left adjoint. Pushouts B⊗^L_A C are computed by simplicial polynomial resolutions. Their additive homotopy groups are Tor when the bases are ordinary; an underived pushout is correct only under suitable Tor vanishing.

Conventions and hypotheses. Animated means simplicial commutative, not strictly commutative cochain dg in positive characteristic. Higher homotopy groups have homological indices n≥0, corresponding to cohomological degree −n.

Construction or proof. Construct Poly_R using the existing MvPolynomial universal property and animate it. Apply the strict-product model rectification to identify simplicial commutative algebras. Use cofibrant polynomial resolutions to compute homotopy pushouts and the discrete/π₀ adjunction.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `mathlib:MvPolynomial`, `mathlib:CommRingCat`, `mathlib:CategoryTheory.SimplicialObject`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §5.5.9, Propositions 5.5.9.1–2 and Corollary 5.5.9.3, printed pp. 516–517. The simplicial algebra rectification applies to the finite polynomial theory; the existing ordinary polynomial carrier supplies the generators.

Uses. BS17, Proposition 11.6: Frobenius discreteness is a statement about this animation, independent of cotangent and spectra returns.

| API name | Role | Specification |
| --- | --- | --- |
| `animatedAlgebras` | constructor | The animation of finite polynomial R-algebras. |
| `animatedDiscrete` | constructor | Inclusion of ordinary rings as constant simplicial rings. |
| `animatedPiZero` | projection | The ordinary π₀ ring. |
| `animatedPushout` | data | The derived pushout in animated rings. |

The following tests separate the intended definition from plausible substitutes.

- `animatedAlgebras.test_polynomial` (computation): The polynomial algebra in n generators remains discrete under inclusion and π₀.
- `animatedAlgebras.test_tor` (non-example): For k=𝔽₂, π₁(k⊗^L_(k[t])k)≅k when t acts by zero on both factors.
- `animatedAlgebras.test_identity` (degenerate): A⊗^L_A B≃B.

### Frobenius discreteness and perfection

Target: `EnhancedDerivedSheaves:E5:animation/frobenius-and-perfection`.

For a simplicial commutative 𝔽_p-algebra A, Frobenius acts by zero on π_i(A) for i>0. Thus perfection, the sequential Frobenius colimit, is discrete and equals the perfection of π₀A. Perfect discrete 𝔽_p-algebras are closed under ordinary and derived colimits. In particular a derived tensor of perfect B←A→C is discrete, perfect and equals its ordinary tensor. The perfection of a derived affine scheme is the perfection of its classical truncation; global scheme glueing is imported from E1/E2. The multiplication map A×A→A, based at (0,0), induces zero on positive homotopy because its restrictions to both axes are zero. This does not say multiplication as a bilinear graded ring operation vanishes. An imperfect base cannot be dropped: for A=𝔽_p(t), A_perf⊗_A A_perf has the nonzero nilpotent t^(1/p)⊗1−1⊗t^(1/p). Cosimplicial perfection need not be discrete, as the perfected elliptic-cohomology example in Remark 11.7 shows.

Conventions and hypotheses. p is prime and the algebra is commutative simplicial in characteristic p. A cosimplicial or arbitrary E∞ algebra does not satisfy this assertion.

Construction or proof. Resolve A by free simplicial algebras and calculate Frobenius on positive homotopy using the graded free resolution argument in BS. Use filtered-colimit preservation of π_i to kill all positive homotopy in perfection. Apply the same calculation to derived pushouts between perfect rings; identify π₀ with the ordinary pushout.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Proposition 11.6, Remarks 11.7–11.8 and Lemma 11.10, pp. 41–42. Proves the vanishing of Frobenius on positive homotopy, discreteness of perfection and discreteness of derived colimits of perfect rings.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882v2), Lemma 2.6, p. 5. Uses simplicial perfection in the integral perfectoid Koszul argument; the perfection theorem itself is supplied by BS17.

Acceptance.

- For A=𝔽_p⊗ᴸ_{𝔽_p[x]}𝔽_p, π₁A=𝔽_p while its perfection is discrete; the theorem must kill this genuine derived class.
- For perfect B←A→C with perfect A, all positive Tor groups vanish.
- Over the imperfect base 𝔽_p(t), the ordinary tensor of two perfections has the displayed nonzero nilpotent; perfect endpoints alone do not imply a perfect pushout.

### The simplicial Witt adapter

Target: `EnhancedDerivedSheaves:E5:animation/derived-witt-adapter`.

Apply the existing p-typical Witt vector functor degreewise to a simplicial commutative 𝔽_p-algebra A. This preserves weak equivalences since its underlying simplicial set is A^ℕ, with π_i W(A)≅∏_ℕ π_i A. Witt Frobenius induces zero on positive homotopy; its sequential localization is discrete and the map to W(π₀A) becomes an equivalence after Frobenius localization. The fibre of W(A)→W(π₀A) is killed by p in the derived sense, using the coherent Witt identity VF=p and the Frobenius nullhomotopy, rather than inferring a null map just from p-torsion cohomology.

Conventions and hypotheses. Use the pinned WittVector carrier, functorial maps and Frobenius/Verschiebung formulas. The p-nullhomotopy is stronger than the homotopy-group computation; its coherent construction is recorded as a remaining gap.

Construction or proof. Lift WittVector’s ordinary functor degreewise; compare its underlying simplicial set with the countable product. Use fibrant simplicial abelian groups to compute homotopy groups of that product and hence weak-equivalence preservation. Apply Frobenius discreteness to the coordinate Frobenius and take the telescope. Construct the p-annihilation nullhomotopy on the fibre from the coherent factorization through Frobenius and Verschiebung.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:animation/frobenius-and-perfection`, `mathlib:WittVector`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 11.43 and Remark 11.44, p. 52. Computes homotopy via Witt coordinates and shows Frobenius-localized discreteness; the fibre-level p-annihilation assertion needs the coherent nullhomotopy recorded as a gap.

Uses. BS17, Lemma 11.43: Derived Witt constructions are reduced to the ordinary coefficient functor.

| API name | Role | Specification |
| --- | --- | --- |
| `simplicialWitt` | constructor | The degreewise existing Witt vector functor. |
| `simplicialWittPi` | characterisation | π_iW(A) is the product of the π_iA over Witt coordinates. |
| `wittFrobeniusLocalization` | compatibility | Frobenius localization is discrete and insensitive to the higher homotopy of A. |

The following tests separate the intended definition from plausible substitutes.

- `simplicialWitt.test_constant` (compatibility): For constant A the result is constant W(A).
- `simplicialWitt.test_coordinates` (computation): For constant A, the n-th coordinate is the existing WittVector.coeff n.
- `simplicialWitt.test_positive` (computation): For A=𝔽_p⊗ᴸ_{𝔽_p[x]}𝔽_p with x mapping to zero on both sides, π₁W(A)≃∏_ℕ𝔽_p. Computing W only on π₀A would fail this test.

### Bounded totalizations and filtered colimits

Target: `EnhancedDerivedSheaves:E5:animation/bounded-totalization-colimits`.

For a cosimplicial diagram of n-truncated spaces, n≥0 fixed, totalization equals partial totalization through degree n+1. Consequently totalization commutes with filtered colimits when the truncation bound is uniform in both indices. For cosimplicial spectra whose terms all lie in Sp≤b for one integer b, π_k of totalization is computed by a finite partial stage r≥max(0,b−k+1). This gives filtered-colimit commutation degree by degree; coconnective terms are the case b=0. The analogous cohomological comparison for complexes uses a uniform lower cohomological bound. Without a uniform bound, arbitrary totalization need not commute with filtered colimits. Unbounded Postnikov convergence and hypercompleteness are supplied by E2.

Conventions and hypotheses. The bound must hold uniformly over both the filtered index and cosimplicial degree. A claim that an arbitrary infinite limit commutes with filtered colimits is excluded.

Construction or proof. Use the Reedy matching-object tower: extending Tot_(r−1) to Tot_r has obstruction in degree r−1 of the matching fibre and space of lifts Ωʳ of that fibre. For n-truncated spaces, obstructions and choices vanish for r>n+1, so Tot_(n+1) determines the result. For spectra bounded above by b, the layer Ωʳ of a matching fibre is bounded above by b−r. Both π_k and π_(k−1) of that layer vanish for r>b−k+1, giving the displayed stable-degree window. Partial totalizations are finite iterated homotopy limits built from matching diagrams. Filtered colimits commute with these finite limits and with homotopy groups, giving the comparison; E2 supplies convergence when using a more general Postnikov reconstruction.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E2`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), §11, footnote 23, p. 46; the coconnective-spectra argument in the proof of Proposition 11.41, p. 53. Uses uniform n-truncation for space-valued totalizations and coconnectivity for spectral totalizations. The finite-stage bounds above are obtained from the matching-fibre obstruction tower; no unbounded commutation theorem is attributed to this source.

Acceptance.

- For 0-truncated terms, Tot₁ is the equalizer condition and suffices. For 1-truncated terms, Tot₂ must also impose coherence.
- The same truncation bound is used for every filtered input, and the comparison uses finite homotopy limits rather than an infinite product interchange.
- For spectra in Sp≤0, each π_k uses the window r≥max(0,1−k); the argument supplies no single finite stage for the whole spectrum.

## The cotangent comparison branch

### The cotangent-complex interface

Target: `EnhancedDerivedSheaves:E5:cotangent-export/the-imported-interface`.

Import L_(B/A) from DD.0 with Map_B(L_(B/A),M) ≃ Der_A(B,M), its transitivity cofiber sequence B⊗^L_A L_(A/R)→L_(B/R)→L_(B/A), and derived base change for a homotopy pushout. E5 identifies these maps with its animated and monoidal module structures, without defining a second cotangent complex. The low-degree comparison with Mathlib’s naive cotangent construction covers H⁰=Ω and H⁻¹, not the entire complex. Re-export derived exterior powers and the DD.0 amplitude tests through the same interface.

Conventions and hypotheses. Cohomological indexing puts connective animated homotopy in nonpositive degrees. Ordinary tensor base change needs Tor-independence unless explicitly derived. The square-zero derivation mapping-space comparison is for connective modules M, as in DD.0; extension to arbitrary M requires its own argument. The regular-quotient test requires a finite regular sequence. For A=k[ε]/(ε²)→k, relative L_(k/A) has H⁻¹=k and H⁻²=k; an arbitrary quotient cannot use the conormal-shift formula.

Construction or proof. Import DD.0’s stated constructions and characterize the comparison by the same derivation mapping spaces. Identify transitivity and base-change arrows by naturality, including composite algebra maps. Transport DD.0’s polynomial, regular-quotient and transitivity tests. Apply transitivity to k→k[ε]/(ε²)→k to compute the relative nonregular-quotient counterexample and retain all negative cohomology.

Direct inputs: `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`, `DerivedDeRhamCohomology:DD.0/cotangent-naive-comparison`, `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`, `DerivedDeRhamCohomology:DD.0/cotangent-base-change`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/lci-amplitude`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `mathlib:Algebra.Extension.H1Cotangent`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:TrivSqZeroExt`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), §7.1.4, pp. 1223–1227. Supplies the rational commutative dg comparison needed to identify the animated cotangent return; the cotangent construction and its test computations remain imported from DD.0.

Acceptance.

- Polynomial R[x₁,…,x_n] has relative cotangent B^n in degree zero; a length-c regular quotient has relative cotangent B^c[1].
- For k[ε]/(ε²)→k, transitivity gives H⁻¹L=k and H⁻²L=k, detecting substitution of the naive two-term truncation for the full object.
- Derived base change follows a homotopy pushout; its ordinary-square specialization separately checks positive Tor vanishing.

### Animation and E-infinity algebra comparison

Target: `EnhancedDerivedSheaves:E5:cotangent-export/e-infinity-comparison-in-proved-ranges`.

There is a sifted-colimit-preserving comparison from animated commutative R-algebras to connective E∞ HR-algebras, determined on polynomial generators. It is an equivalence for R a ℚ-algebra. For any commutative R, simplicial associative R-algebras compare equivalently with connective E₁ HR-algebras. In positive characteristic the commutative comparison is not an equivalence in general: spectral free algebras retain the homology of symmetric groups, absent from a polynomial animated algebra on a degree-zero generator. Strictly commutative dg algebras are a general model only in characteristic zero. Cotangent comparisons are asserted only after the relevant equivalence or separately verified hypotheses.

Conventions and hypotheses. This is a return comparison requiring the concrete spectral supplier; it is not an input to animation. No positive-characteristic commutative dg replacement or unrestricted equivalence is asserted.

Construction or proof. Extend the polynomial-generator spectral comparison by the animation universal property. Apply HA 7.1.4.20 over ℚ and 7.1.4.18 for associative algebras over any R. Check the positive-characteristic free algebra counterexample and record the exact comparison boundary.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:cotangent-export/the-imported-interface`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`, `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 7.1.4.11, p. 1223; Propositions 7.1.4.18 and 7.1.4.20, pp. 1225–1227; Warning 7.1.4.21, p. 1227. Proves the associative dg comparison over any base and the commutative comparison over a rational base; explicitly distinguishes the positive-characteristic non-equivalence.

Acceptance.

- Over ℚ the comparison is an equivalence on objects and mapping spaces and carries ordinary polynomials to the same connective rational spectral algebra.
- Over 𝔽₂ the arity-two summand of the free spectral commutative algebra on H𝔽₂ has positive H_*(BΣ₂;𝔽₂); the animated polynomial generator has no such positive homotopy.
- Associative comparison over any R is kept separate from the commutative characteristic-zero comparison.

## The spectral comparison branch

### Concrete spectral realization of the enhancement

Target: `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`.

Import the H.5 symmetric-spectrum stable model, derived smash, Eilenberg–Mac Lane object and module model. Apply the E5 monoidal model-localization interface to compare its infinity-localization with the abstract stable monoidal category Sp. For each ordinary commutative R, Mod_HR is symmetric monoidally equivalent to the E1 enhanced D(R), carrying HR to R and derived smash over HR to derived tensor over R. On homotopy categories it recovers Mathlib’s DerivedCategory of R-modules, with the same cochain shifts and exact triangles.

Conventions and hypotheses. Concrete spectra, stable model structures and Eilenberg–Mac Lane objects are supplied by H.5. This layer has no outgoing prerequisite edge to E5:abstract or E5:animation; its supplier direction must remain a return branch.

Construction or proof. Verify the supplier’s monoidal model axioms and apply NS A.7. Use HA 7.1.2.13 to identify spectral modules with the enhanced derived category. Compare E1’s homotopy category and tensor using E0’s sign convention and E5’s exact monoidal comparison.

Direct inputs: `StableHomotopyKTheory:H.5:spectra/stable-model-structure`, `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:abstract/monoidal-model-category-localization`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Theorem 7.1.2.13, p. 1212. Identifies derived modules with modules over the Eilenberg–Mac Lane ring spectrum; the chosen concrete stable model is imported from H.5.

Acceptance.

- HR corresponds to R[0]; relative smash corresponds to derived tensor and the spectral shift to the pinned cochain shift.
- Mapping spectra compare with derived Hom, so agreement only on homotopy categories is insufficient.
- For a nonflat pair of ordinary modules, derived smash retains the positive Tor term of derived tensor.

## The common acceptance diagram

### Compatibility of enhancement and algebra comparisons

Target: `EnhancedDerivedSheaves:E5/single-enhancement-supplier`.

The shared interface commutes with passage from ordinary rings to animated rings and from algebra objects to modules. For the unit R, the enhanced module category, its tensor unit and ordinary derived-category comparison agree across E1, abstract E5 and the spectral return. For polynomial R[x₁,…,x_n], the imported cotangent complex is the free rank-n B-module in degree zero. For a quotient by a regular sequence of length c, the imported relative cotangent complex is (I/I²)[1], free rank c in cohomological degree −1. These computations, the homotopy pushout Tor example and preservation of exact triangles are the parent layer’s acceptance diagram. The nonregular quotient k[ε]/(ε²)→k retains a nonzero H⁻² term, checking that the full cotangent object was not replaced by its naive truncation.

Conventions and hypotheses. The cotangent and spectra supplier branches are prerequisites only for this joint acceptance diagram, not for abstract constructions. The regular-quotient statement is relative to the ambient ring, rather than its absolute cotangent complex.

Construction or proof. Apply the animation, unit-module and enhanced derived comparisons. Transport the DD.0 polynomial and regular-quotient tests through the same module functor. Use uniqueness from the universal properties to identify the comparison composites and their naturality.

Direct inputs: `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:cotangent-export/the-imported-interface`, `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`, `EnhancedDerivedSheaves:E5:abstract/exact-functors`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Theorem 7.1.2.13, p. 1212. Supplies the derived-module-to-spectral comparison in the joint acceptance diagram; DD.0 supplies the other branch and the smooth and regular-quotient computations.

Acceptance.

- The unit and polynomial/regular-quotient cotangent comparisons commute with the same enhancement functor.
- The Tor pushout and k[ε]/(ε²)→k cotangent computations both retain their nonzero higher derived terms.
- Every cofiber triangle is transported with E0’s signs; neither comparison return is a prerequisite for constructing animation.

## Scope and source intake

The additional paper routes are covered by the targets above or by the stated supplier boundaries. Geometry-specific Dqc and h-descent assertions remain E1/E2 results. Coherent towers remain E2 constructions, and adic completion remains E4. The Witt adapter imports the ordinary coefficient formulas directly from Mathlib; it does not introduce another Witt ring. The full item-to-owner ledger is sourceCoverage in the packet. The grouped ledger below makes the scope decisions reviewable without reproducing source passages.

| Extraction | Items | Target or owner |
| --- | --- | --- |
| PAPER-BHATT-SCHOLZE-17 | S318, S319, S320, S321, F618, F619, Q1101, Q1127, Q1128, Q1129, Q1130, Q1136, Q1141, Q1143, Q1145, Q1146, Q1147, Q1148, dqc-definition, remark-11-34-literature | `EnhancedDerivedSheaves:E1` |
| PAPER-BHATT-SCHOLZE-17 | S322, F607, F609, F610, Q1132, Q1133, Q1135, Q1137, Q1138, Q1140, Q1142, Q1144, Q1149, Q1150, Q1151, Q1152, definition-11-1-h-topology-on-perf, theorem-11-2-3-bounded-dqc-h-sheaf, remark-11-3-quotients-of-regular, remark-11-4-derived-perf-not-hypercomplete, remark-11-5-h-amplitude, black-box-htt-hypercompleteness, black-box-dag8-remark-2-1-11 | `EnhancedDerivedSheaves:E2` |
| PAPER-BHATT-SCHOLZE-17 | Q1103 | `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings` |
| PAPER-BHATT-SCHOLZE-17 | Q1106, Q1107, Q1108, Q1109, Q1110, Q1111 | `EnhancedDerivedSheaves:E5:animation/frobenius-and-perfection` |
| PAPER-BHATT-SCHOLZE-17 | Q1114 | `EnhancedDerivedSheaves:E5:presentability/presentable-categories` |
| PAPER-BHATT-SCHOLZE-17 | Q1115, Q1117, Q1120, Q1121, black-box-carlsson-fibre-of-tot | `EnhancedDerivedSheaves:E5:abstract/descendable-algebras` |
| PAPER-BHATT-SCHOLZE-17 | Q1116, Q1118, Q1119, Q1122, black-box-mathew-3-24 | `EnhancedDerivedSheaves:E5:abstract/module-descent-and-functoriality` |
| PAPER-BHATT-SCHOLZE-17 | Q1123, Q1124, Q1125, Q1126, Q1131, Q1160 | `EnhancedDerivedSheaves:E5:abstract/uniform-index-colimits` |
| PAPER-BHATT-SCHOLZE-17 | Q1153, Q1154, Q1155 | `EnhancedDerivedSheaves:E5:animation/derived-witt-adapter` |
| PAPER-BHATT-SCHOLZE-17 | tot-commutes-with-filtered-colimits | `EnhancedDerivedSheaves:E5:animation/bounded-totalization-colimits` |
| PAPER-BHATT-SCHOLZE-17 | black-box-bhl15-thm-1-10 | `LanglandsParameterStacks:LP2` |
| PAPER-BHATT-SCHOLZE-17 | black-box-carlsson-completion | `EnhancedDerivedSheaves:E4` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 23 | `EnhancedDerivedSheaves:E5:abstract/stable-tensor-ideals` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 24, 26 | `EnhancedDerivedSheaves:E5:abstract/verdier-quotient` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 25 | `EnhancedDerivedSheaves:E5:presentability/ind-verdier-localization` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 91 | `EnhancedDerivedSheaves:E5:abstract/algebra-objects` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 95 | `EnhancedDerivedSheaves:E5:abstract/monoidal-envelope` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 139 | `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 140, 141 | `EnhancedDerivedSheaves:E5:abstract/monoidal-dwyer-kan-localization` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 142 | `EnhancedDerivedSheaves:E5:abstract/monoidal-model-category-localization` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 143, 144, 145, 146 | `EnhancedDerivedSheaves:E5:abstract/left-derivable-cocartesian-families` |
| PAPER-NIKOLAUS-SCHOLZE-18 | 147 | `EnhancedDerivedSheaves:E5:abstract/infinity-operad` |
| PAPER-SCHOLZE-26 | 47 | `EnhancedDerivedSheaves:E5:abstract/formal-tensor-inversion` |
| PAPER-SCHOLZE-26 | 60 | `EnhancedDerivedSheaves:E5:presentability/dualizable-compactly-assembled-categories` |
| PAPER-SCHOLZE-26 | 64 | `EnhancedDerivedSheaves:E2` |
| PAPER-BHATT-18 | simplicial-perfection | `EnhancedDerivedSheaves:E5:animation/frobenius-and-perfection` |
| PAPER-BHATT-18 | obstruction, derived-tensor-api, cohomology-base-change-map, splitting-through-comparison | `EnhancedDerivedSheaves:E1` |
| PAPER-BHATT-18 | tower-roos, pro-zero-roos, module-tower-milnor, pro-tower | `EnhancedDerivedSheaves:E2` |
| PAPER-BHATT-ETAL-23 | enhancement, triangulated-limit-warning | `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison` |
| PAPER-FARGUES-SCHOLZE-21 | c4a-right-adjoint-sums-IV.2.20 | `EnhancedDerivedSheaves:E5:presentability/neeman-compactness-criterion` |
| PAPER-SCHOLZE-17 | 407, 611 | `EnhancedDerivedSheaves:E5:presentability/limits-of-presentable-categories` |
| PAPER-SCHOLZE-17 | 603 | `EnhancedDerivedSheaves:E5:presentability/neeman-compactness-criterion` |
| PAPER-SCHOLZE-17 | 406 | `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations` |

BS17 Remark 11.24 attributes a countability result with only generators mentioned. The verified input here is Mathew Corollary 3.33, which also bounds relations. This packet does not promote countable generation alone to a theorem. The sourceIssue records the citation gap already identified by the extraction. Versioned Ramzi references use the version-specific numbering: the trace-class rigidity criterion is Corollary 4.60. Author PDFs use the page conventions recorded in the packet; HTT PDF pages are 18 greater than printed pages. FS21 has inserted pages, so its later printed/PDF offsets vary. Efimov v4 Proposition 2.70 is the updated compact-colimit input behind BM26 Lemma 10.5.

## Planning status and refinements

All six stages are planned and this target-level pass is complete. No stage is closed. Every implementation status is unchecked. The following obligations are explicit leaves in the graph.

- **Refine abstract supplier dependencies across parts.** E3’s existing full-inclusion Kan-extension node lists whole E1/E2 stages, and its adjoint/localization node also lists E1’s concrete presentability result and the whole E5:presentability stage. The abstract Kan-extension and adjoint interfaces must be isolated from those concrete applications before the combined package has an acyclic prerequisite graph. This packet removes the direct E1/E3-application inputs from its generic presentability definition, preserves the exact existing supplier ids, and requests the dependency refinement from E3. Its own node graph is acyclic; no claim of cross-part closure is made. The separate signatureOmissions record incomplete prototypes, rather than treating absent implementations as mathematical results. E0’s restricted straightening must explicitly expose the operadic base shapes and coherent transformation/mapping-space operations requested here; no general unstraightening implementation is assumed.
- **Amitsur tower and general uniform-index proof input.** Prove the cubical bar/partial-cosimplicial-totalization pro-comparison and import E2’s multiplicative derived-limit filtration for a finite-cohomological-dimension indexing category. The sequential 2m proof is read in BS17 Lemma 11.22; the general case is asserted there without a worked multiplicative-filtration proof. Do not claim a termwise fibre formula for the usual Tot_n solely from a pro-equivalence.
- **Coherent p-annihilation for the derived Witt fibre.** BS17 Remark 11.44 asserts p-annihilation. The π_i calculation alone proves p-torsion in positive homotopy, not a nullhomotopy of multiplication by p on the entire fibre. Construct the fibre-level Frobenius nullhomotopy and combine it with the ordinary VF=p identity before claiming the derived map is zero.
- **Continuous categorical action beyond finite quotient factoring.** The finite-group construction and the discrete-continuous-module adapter have precise models. A general profinite action on an infinity-category requires a specified topology or condensed continuity model; no universal filtered-colimit formula for categorical fixed points is supplied. The stage’s appropriate finite-quotient cases are planned; any broader application must name and supply its continuity model.

The suggested file records construction data and homotopy-category consequences where full coherent predicates are unavailable. An HEquiv checks only the homotopy-category shadow, not the infinity-equivalence or its mapping spaces. Compilation checks displayed types and existing carrier compatibility; it cannot certify omitted cocartesian axioms, accessibility, higher naturality, coherent monads, duality triangles or internal adjoint linearity. The mathematical statements and tests in this document are definitive.

Supplier requests.

- `EnhancedDerivedSheaves:E1`: Module specialization: perfect-ring Tor vanishing; flat Frobenius-root ideals; the projective/flat dimension bounds for perfections and finite presentations, with their countability hypotheses; valuation-module finite-freeness criterion; derived tensor/Hom and the splitting-obstruction triangle. Concrete qcqs Dqc, base change, Zariski/fppf/nilpotent-cover descent, and affine-to-scheme perfection comparison must use E1/E2’s enhancement. The claims and counterexamples in BS17 S318–S321, F618–F619 and Q1141,Q1143,Q1145–Q1148 remain in E1, with the source’s finite-dimension bounds stated separately from unsupported general finite global dimension.
- `EnhancedDerivedSheaves:E2`: Pro-zero towers and pro-isomorphisms of modules and their coherent enhancement; the strict countable Roos derived-limit model, Milnor sequence, pro-zero invariance, and multiplicative finite-cohomological-dimension derived-limit filtration used in uniform descendability. Supply bounded/Postnikov totalization convergence, h-descent/hypercompleteness and the geometric Dqc descent results of BS17 Q1132–Q1152 in this direction. CompletedCohomologyPartII and ArithmeticGaloisDuality consume this E2 construction; they do not supply it.
- `EnhancedDerivedSheaves:E4`: Identify Amitsur completion of a finitely generated module for a Noetherian ring and ideal quotient with derived adic completion (the Carlsson completion input); do not confuse this comparison with finite-index descendability.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`: Import the upstream discrete continuous coefficient dictionary and finite-quotient actions unchanged; no new cochain theory is planned here.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`: Import its canonical all-degree continuous finite-quotient cocone, with coefficients M^U and inflation-and-inclusion transitions, to test the E1 enhanced-invariants adapter.
- `EnhancedDerivedSheaves:E3`: Isolate the abstract full-inclusion left Kan extension (including the right-Kan variant for source-localization derivation) from its whole E1/E2 stage inputs, and the conditional accessible adjoint/localization theorem from E1’s concrete presentability application. Keep the existing precise node ids and restrict their prerequisite chains to E0 categorical infrastructure and the E5 generic presentability definition when that hypothesis is needed. E1’s concrete presentability-and-derived-tensor node then imports E5 rather than being an input to its definition.
- `EnhancedDerivedSheaves:E0`: Expose coherent functor categories, transformations, mapping-space Kan/composition laws and the straightening interfaces for N(Fin_*), LM/Ass operadic bases and their pullbacks. E5 extends to arbitrary small infinity-categorical bases by the NS A.16–A.17 Cat∞ colimit-gluing argument; do not silently replace E0’s restricted shapes by unrestricted straightening.

The cotangent and spectral returns retain their supplier direction when packaged. E0 remains the unique owner of minimal stability and exactness. E1 imports E5’s generic presentability theorem for its concrete derived categories. RefinedTraceMethods and the Berkovich continuation import these categorical results; their geometric and trace-theoretic applications are not prerequisites here. General profinite categorical actions require an explicit continuity model. Existing ProfiniteCohomology, DGAInfinity and StablePeriodicCurved roadmap plans are imported unchanged.
