# Roadmap: K₂ symbols over fields and Matsumoto's theorem

**Summary.** This layer develops the presentation of classical K₂ of a field by bilinear Steinberg symbols. It also supplies the homogeneous Milnor quotient, identifies its degree-two component with the symbol presentation, and specifies the compatibility needed to compare this presentation with the graded Milnor-to-Quillen map. The output is a particular natural equivalence: its value on a Milnor symbol is the commutator of two specified diagonal lifts. Keeping that map fixed matters for residue maps, products and the Brauer comparisons built from it.

## Scope and ownership

All coefficients are integral. A symbol is skew-symmetric, but its diagonal need not vanish. In particular, the real symbol {-1,-1} is a nonzero element of order two. Replacing Milnor K-theory by an exterior algebra would lose this element and would give the wrong comparison map.

The base field F is commutative and has arbitrary characteristic. Symbols take units as arguments. A coefficient group A is an abelian group, written additively. Finite-rank root calculations use Stₙ(F) with n≥3; the classical kernel K₂(F) is the kernel in the stable Steinberg group. No universal-central-extension theorem for finite-rank St₃(F), and no injectivity of every stabilization map, is a premise. The coefficient-extension construction below is used for infinite fields. Finite fields have a separate cyclicity and counting proof, including F₂, F₃ and F₄.

The definitive specification is this document. The accompanying suggested signatures use existing library carriers for pairings, the integral tensor-square quotient and the real sign function. The stable Steinberg group, homogeneous Milnor components and lifted extension groups are construction targets supplied by this roadmap and its dependencies.

## Exact supplier contracts

Use the Steinberg presentation, stabilization and classical kernel from the preceding layer:

| Imported target | Required interface |
| --- | --- |
| `K2SymbolsBrauer:T.1/steinberg-group-finite-rank` | Root generators xᵢⱼ(t), additivity, and the forward, reverse and disconnected Steinberg commutator relations with all index inequalities. |
| `K2SymbolsBrauer:T.1/stabilisation` | Compatible finite-rank maps, finite representatives of stable words, and equality of stable finite words at a sufficiently large finite rank. |
| `K2SymbolsBrauer:T.1/k2-definition` | The actual stable kernel of St(F)→E(F), and field-induced maps on it. |
| `K2SymbolsBrauer:T.1/k2-is-centre` | This stable kernel is central. This is used for lift independence, bilinearity and removal of conjugations. |
| `K2SymbolsBrauer:T.1/central-extension` | The standard notion of an exact central extension with an injective coefficient inclusion. |
| `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words` and `/diagonal-lift` | The existing words wᵢⱼ(a) and hᵢⱼ(a), with their matrix images. |
| `K2SymbolsBrauer:T.2/steinberg-symbol` | The specified stable commutator symbol; its field properties are proved here. |
| `K2SymbolsBrauer:T.2/milnor-k-theory` | The tensor-algebra quotient definition; the grading and its usable API are supplied here. |
| `K2SymbolsBrauer:T.2/graded-map` and `/graded-map-degree-three` | The graded Milnor-to-Quillen construction owned by `K2SymbolsBrauer:T.2:graded-map`, including its separate product identification. |

The statement target `K2SymbolsBrauer:T.2/matsumoto` is realized by the proof route below. It is not a premise for the tensor-square universal property, finite-field vanishing or symbol injectivity.

Ordinary Bruhat decomposition and BN-pair structure theory belong to [ReductiveGroups, Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ReductiveGroups), identified by `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Use its split type-A specialization to SLₙ: positive unipotent groups, the diagonal torus, monomial representatives and the increasing/decreasing-length alternatives under a simple Weyl element. This is a precise request refining the supplier’s broad ordinary Bruhat target; its current Suggested.lean only covers Layer 0. This layer builds the lifted toral and root relations.

Coxeter reduced-word invariance belongs to [RepresentationTheory/RootSystems, Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/RootSystems), identified by `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`. That combinatorial Matsumoto theorem supplies Weyl word manipulations; the K₂ theorem in this document is a different theorem. Minimal representatives of left parabolic cosets, with length additivity and root positivity, are a requested consequence of exchange in the same owner. They are not an already displayed upstream target.

## Conventions

Fix the group commutator to be [x,y]=xyx⁻¹y⁻¹. For a unit a set

- wᵢⱼ(a)=xᵢⱼ(a)xⱼᵢ(-a⁻¹)xᵢⱼ(a);
- hᵢⱼ(a)=wᵢⱼ(a)wᵢⱼ(-1);
- s(a,b)=[h₁₂(a),h₁₃(b)] in stable St(F).

The matrix image of hᵢⱼ(a) is diagonal, with a at i and a⁻¹ at j. The two roots e₁-e₂ and e₁-e₃ have Cartan pairing +1. Thus s(a,b) is the positive toral defect h₁₂(a)h₁₂(b)h₁₂(ab)⁻¹. Adjacent simple roots have Cartan pairing -1 and give the inverse defect. Preserve this distinction in every root transport and comparison square.

Write U=Additive Fˣ, with its standard ℤ-module structure. The unit a contributes an additive element of U; multiplication of units becomes addition in U. In the tensor algebra the degree-one class of the multiplicative unit 1 is consequently zero. The empty Milnor symbol is the ring unit in degree zero. These two conventions must not be interchanged.

## Existing library interfaces

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. These interfaces supply the foundation; they do not already supply the classical or Milnor presentation theorem.

| Declaration | What it supplies |
| --- | --- |
| `Units` and `Additive` | Nonzero multiplicative inputs and their additive ℤ-module form. |
| `TensorProduct.lift` | A linear map from the tensor square induced by a bilinear pairing, with pure-tensor evaluation and uniqueness. |
| `Submodule.span` and `Submodule.liftQ` | The relation submodule and descent through its module quotient. |
| `TensorAlgebra.lift` | Extension of a linear degree-one map to an algebra homomorphism, also for noncommutative target algebras. |
| `TensorAlgebra.gradedAlgebra` | The existing ℕ-grading by powers of the image of the tensor-algebra inclusion. |
| `TensorAlgebra.equivDirectSum` and `TensorPower.mulEquiv` | The existing direct-sum tensor-power decomposition and concatenation equivalence. Degree-two projection is reused from this decomposition. |
| `PiTensorProduct.isEmptyEquiv` and `PiTensorProduct.subsingletonEquiv` | The empty and singleton tensor products identify degrees zero and one with ℤ and U. |
| `TwoSidedIdeal` and `RingCon.mk'` | The two-sided ring ideal, its complete lattice, and the surjective ring congruence quotient. A homogeneous quotient grading must still be proved. |
| `isCyclic_of_injective_ringHom` | A finite multiplicative group injected into an integral domain is cyclic; apply it to Fˣ. |
| `TauCeti.transvectionUnit` | Actual GL transvections over a commutative ring with finite index type and distinct indices. |
| `TauCeti.commutatorElement_transvectionUnit` and its `_reverse` variant | Forward parameter cd and reverse parameter -(dc), with the three index inequalities. |

The tensor algebra is noncommutative. Define its Steinberg ideal by the complete lattice of two-sided ideals, and use its ring congruence quotient. A span of the original products as a left ideal does not impose the necessary right sandwiches.

## How to read the build

The targets below form one layer, in four consecutive groups. First construct the universal pairing presentation and prove that it is the actual degree-two component of the homogeneous Milnor ring. Next derive the lift calculus and stable kernel generation. Then construct a central extension with faithful coefficients realizing any pairing over an infinite field. Finally combine this detector with the separate finite-field proof to obtain the specified natural equivalence.

## Layer T.2: field presentation

### Milnor components and the universal pairing

Define P₂(F) as the quotient of U⊗ℤU by the span of a⊗b with a+b=1 in F. Bilinearity is already encoded by the tensor square; impose only the Steinberg relation. Its universal property is the bridge between concrete pairings, the graded quotient and classical symbols. In particular it must precede Matsumoto's injectivity proof.

For the Milnor ring, use the imported tensor algebra T and two-sided Steinberg ideal J. Every element of J is a finite sum of sandwiches z·ι(a)ι(b)·w with a+b=1. Expand the outer factors into their existing homogeneous components. Grouping those terms by degree proves that J is homogeneous. A relation contributes at least degree two, and a degree-two relation has outer degree zero on both sides. This identifies J∩T₂ with the tensor-square relation submodule, while J∩T₀ and J∩T₁ vanish. The same argument proves directness of the grading on T/J: if a sum of distinct-degree lifts is in J, each lift is in J.

This gives the degree-two equivalence Kᴹ₂(F)≃P₂(F) on the actual components of the quotient. It also gives degree zero ℤ, degree one U, concatenation of symbols, multilinearity and vanishing of a relation anywhere inside a longer word. The higher-local-field layer `HigherLocalFieldsAndHigherClassFieldTheory:HL.1` imports these components and products. The graded comparison lane imports them as well. Neither consumer reconstructs Milnor K-theory.

### Classical generation and detection

Checking the matrix images of the root relations only gives a homomorphism to SLₙ(F). To identify its kernel, impose multiplicativity of all diagonal lift words and prove a complete lifted Bruhat reduction. Collected positive-root words inject into upper-triangular matrices. Every lifted word reduces to a unipotent–torus–Weyl–unipotent word. When its matrix image is the identity, ordinary Bruhat removes the Weyl term, diagonal coordinates remove the torus term, and unipotent injectivity removes the rest. This works over every field. It implies stable kernel generation by central toral defects, hence by the chosen s(a,b).

Generation gives surjectivity of the comparison. Injectivity requires a detector in which a prescribed pairing survives. For infinite fields use Matsumoto's extension: first a central torus extension, then a lifted monomial extension with Weyl squares, then its permutation action on the fiber over the ordinary Bruhat monomial map. Verify the local action and braid relations, including the exceptional parameter branches, and prove that the resulting projection has kernel exactly the coefficient group. Apply it to A=P₂(F) and its universal pairing. After exactness, construct canonical root lifts using the central-extension argument in Steinberg’s Theorem 10 proof, pp. 79–82. Verify their Steinberg relations and their agreement with the prescribed toral cocycle. A stable relation has a finite-rank representative; the resulting homomorphism from Stₙ into the extension identifies it with its coefficient value, which vanishes only when the proposed relation in P₂(F) vanishes.

For a finite field, cyclicity reduces P₂(F) to its diagonal generator. In characteristic two the diagonal identity kills it. In odd characteristic the diagonal is 2-torsion; a counting argument produces two nonsquares adding to one, and their odd exponents kill the remaining generator by the Steinberg relation. Apply the same vanishing to the already constructed classical pairing and use generation to kill stable K₂(F). Both groups vanish independently of the comparison theorem.

The development below specifies the objects and theorems in build order, with the interfaces that make them usable and the examples that distinguish the intended constructions.

### T.2.1. Bilinear Steinberg pairings

F is a field and A is an AddCommGroup. For an abelian group A written additively, IsSteinbergPairing(c) for c:Fˣ×Fˣ→A means c(ab,d)=c(a,d)+c(b,d), c(a,bd)=c(a,b)+c(a,d), and c(a,b)=0 whenever a+b=1 in F. The last condition uses the field values of two units, so neither zero nor a fake totalised inverse enters the definition.

(Matsumoto-1969, §5, Lemma 5.6 and bilinear conditions (S°), pp. 27–28 (PDF pp. 28–29). Type A uses the bilinear version, specialized to additive coefficients. Weibel-III, III.6.1, chapter/PDF p. 48. The two presentation relations.)

*Needs:* `mathlib:Additive`, `mathlib:Units`.

Use a predicate on an actual function with these three equations; do not put derived identities into the definition.

Convert each multiplicative variable to Additive Fˣ. Additive group homomorphisms are automatically ℤ-linear, supplying the tensor-product universal property.

Prove closure under postcomposition by additive homomorphisms and under pullback by field homomorphisms.

Supply the following named interface.

- `IsSteinbergPairing`: The three equations in the statement.
- `pairing_postcompose`: For f:A→+B and a Steinberg pairing c, f∘c is a Steinberg pairing.
- `pairing_pullback`: For a field homomorphism f:F→E, c(f(a),f(b)) is a Steinberg pairing over F.
- `pairing_one_left`: Every Steinberg pairing satisfies c(1,b)=0.
- `pairing_one_right`: Every Steinberg pairing satisfies c(a,1)=0.

**Checks.**

- `zero_pairing` (degenerate): The constant zero map is a Steinberg pairing for every F and A.
- `constant_one_rejected` (non-example): The constant function with value 1 in ℤ is not a Steinberg pairing, since its bilinearity at (1,1,1) would give 1=2.
- `sign_pairing_values` (computation): Over ℝ, the pairing to ℤ/2 with value 1 exactly when both arguments are negative has values c(-1,-1)=1, c(-1,1)=0 and c(2,-1)=0; it satisfies the three equations.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/tensor-square-presentation` uses this interface as follows: Characterizes all maps out of the presentation, without assuming Matsumoto. `K2SymbolsBrauer:T.2/symbol-extension` uses this interface as follows: Supplies the coefficient cocycle used to detect injectivity.

### T.2.2. Integral symbol identities

F is a commutative field; coefficients in every symbol group are integral. Every Steinberg pairing satisfies c(a,-a)=0, c(a,b)=-c(b,a), c(a,a)=c(a,-1), and 2c(a,a)=0. In characteristic two c(a,a)=0. The assertion c(a,a)=0 is false for general integral coefficients.

(Weibel-III, III.5.10.2–5.10.4, p. 43; III.6.1, p. 48. Field specialization of the negative-unit argument; the a=1 case is supplied explicitly. Matsumoto-1969, §5, Proposition 5.7(a),(c), pp. 28–29. The bilinear cocycle consequences.)

*Needs:* `K2SymbolsBrauer:T.2/field-pairing`.

Prove `pairing_identities` by the following argument.

Bilinearity implies that the value at a unit 1 is zero and inversion negates either variable.

If a≠1, both 1-a and 1-a⁻¹ are units and -a=(1-a)/(1-a⁻¹). The two Steinberg relations show c(a,-a)=0. If a=1, use the unit-one equation. This covers F₂ without introducing 1/(1-a).

Expand c(ab,-ab)=0, splitting -ab once as (-a)b and once as a(-b); the terms c(a,-a) and c(b,-b) vanish, leaving c(a,b)+c(b,a)=0.

Expand c(a,-a)=c(a,-1)+c(a,a). Since 2c(a,-1)=c(a,(-1)²)=0, negating c(a,-1) has no effect. This gives the stated diagonal formula.

**Checks.**

- No division by 1-a occurs in the a=1 branch.
- The real sign pairing has c(-1,-1)=1, disproving integral alternation.
- Characteristic-two diagonal vanishing is stated separately from skew-symmetry.

### T.2.3. Universal degree-two symbol presentation

F is a commutative field; coefficients in every symbol group are integral. Put U=Additive Fˣ and P₂(F)=(U⊗ℤU)/R₂, where R₂ is the ℤ-submodule spanned by a⊗b for unit pairs with a+b=1. Let p(a,b) be the quotient class of a⊗b. For every abelian A, evaluation on p gives a bijection between additive maps P₂(F)→A and Steinberg pairings Fˣ×Fˣ→A.

(Weibel-III, III.6.1 and III.7.1, pp. 48, 61. The tensor-square presentation and its degree-two role; its universal-property proof is expanded using the pinned quotient API.)

*Needs:* `K2SymbolsBrauer:T.2/field-pairing`, `mathlib:TensorProduct.lift`, `mathlib:Submodule.liftQ`, `mathlib:Submodule.span`.

Form the submodule on the indicated set of pure tensors, using the standard ℤ-module structures.

Lift a pairing by the tensor universal property. Its lift annihilates the generating tensors and therefore the entire span.

Descend with Submodule.liftQ. Conversely compose any additive homomorphism with the pure-tensor quotient to get a pairing.

Use generation by pure tensors and surjectivity of the quotient map to prove the two operations are inverse. No injectivity into classical K₂ is used here.

Supply the following named interface.

- `SymbolPresentation`: The quotient P₂(F) with its AddCommGroup and ℤ-module structures.
- `presentedSymbol`: The class p(a,b) of the pure tensor.
- `presentation_universal`: For every Steinberg pairing c to A, there is exactly one f:P₂(F)→+A satisfying f(p(a,b))=c(a,b).
- `presentation_hom_ext`: Maps P₂(F)→+A agreeing on every p(a,b) agree.
- `presentation_relations`: The pairing p is bilinear and p(a,b)=0 if a+b=1.

**Checks.**

- `presentation_F2` (degenerate): P₂(F₂)=0 because F₂ˣ is trivial, before using Matsumoto.
- `presentation_half` (computation): p(1/2,1/2)=0 over ℚ because the entries sum to one.
- `presentation_real_nonzero` (non-example): Over ℝ, p(-1,-1) is nonzero because the sign pairing descends and sends it to 1 in ℤ/2.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/graded-degree-two` uses this interface as follows: Identifies the actual degree-two component of the Milnor quotient. `K2SymbolsBrauer:T.2/classical-comparison-map` uses this interface as follows: Descends the explicit diagonal commutator to a single chosen comparison map.

### T.2.4. Homogeneity of the two-sided Steinberg ideal

F is a commutative field; coefficients in every symbol group are integral. In the predecessor’s tensor-algebra Milnor construction, let T=TensorAlgebra ℤ U, T_d its existing homogeneous pieces, and J the least two-sided ideal containing ι(a)ι(b) for a+b=1. Every homogeneous component of every z∈J lies in J. Moreover J∩T₀=J∩T₁=0, and J∩T₂ is exactly the ℤ-span of the Steinberg degree-two products.

(Weibel-III, III.7.1, p. 61. Refinement of the homogeneous quotient claimed by the Milnor definition; the homogeneous-sandwich proof makes its two-sided nature explicit.)

*Needs:* `K2SymbolsBrauer:T.2/tensor-square-presentation`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `mathlib:TensorAlgebra.gradedAlgebra`, `mathlib:TwoSidedIdeal`, `mathlib:RingCon.mk'`, `mathlib:TensorAlgebra.equivDirectSum`, `mathlib:PiTensorProduct.isEmptyEquiv`.

Prove `homogeneous_steinberg_ideal` by the following argument.

Use TwoSidedIdeal and its complete lattice: J is the intersection of all ideals containing the displayed products. The tensor algebra is noncommutative, so a left-ideal span alone is insufficient.

Identify J additively with finite sums of sandwiches z·ι(a)ι(b)·w. Closure under left/right multiplication proves this description has the required minimality.

Decompose z and w into their finite homogeneous sums using the existing direct-sum grading. Every resulting sandwich has degree deg(z)+2+deg(w). Group the finite sum by degree.

The component of each degree is again a sum of sandwiches, proving homogeneity. Nonnegative grading implies there are no terms of degree zero or one.

For degree two, the two outer degrees must both be zero. TensorAlgebra.equivDirectSum and PiTensorProduct.isEmptyEquiv identify T₀ with ℤ (the empty tensor maps to 1), so these sandwiches are precisely the integer span of the Steinberg products. The converse containment is immediate. This uses existing tensor-algebra decomposition rather than developing another one.

**Checks.**

- Use the existing TensorAlgebra.gradedAlgebra instance, not a new tensor grading.
- Left and right multiplication by degree-one tensors preserve the ideal and raise the relation degree to three.
- Degree-zero and degree-one embeddings into T/J are injective.

### T.2.5. Milnor quotient grading and symbol API

F is a commutative field; coefficients in every symbol group are integral. Refine the imported Milnor ring Kᴹ(F)=T/J by equipping it with the ℕ-grading whose degree-d piece is the image of T_d under the congruence quotient. The direct sum of these pieces maps isomorphically to Kᴹ(F). Define n-symbols as products of the imported degree-one unit classes; they generate degree n, are multilinear and vanish when consecutive entries sum to one.

(Weibel-III, III.7.1, p. 61. Adds the grading proof and precise symbol API to the predecessor definition, rather than defining a second Milnor theory.)

*Needs:* `K2SymbolsBrauer:T.2/homogeneous-steinberg-ideal`, `mathlib:RingCon.mk'`, `mathlib:TensorAlgebra.gradedAlgebra`, `mathlib:TensorAlgebra.lift`, `mathlib:TensorAlgebra.equivDirectSum`, `mathlib:PiTensorProduct.isEmptyEquiv`, `mathlib:PiTensorProduct.subsingletonEquiv`.

Apply the quotient ring to the ring congruence of J; this is a Ring, not a commutative-ring quotient of T.

Define each homogeneous image as an ℤ-submodule. Multiplication sends degree i times degree j to degree i+j since the quotient map is a ring homomorphism.

For injectivity of the direct-sum reconstruction, lift each summand to T_i. If their sum lies in J, homogeneity puts each lift in J, so every image summand vanishes. Surjectivity follows by decomposing an arbitrary representative.

Factor finite tensor words through the quotient. A consecutive Steinberg relation is a sandwich of a defining relation, which is zero.

Use TensorAlgebra.equivDirectSum with the empty and singleton PiTensorProduct equivalences for T₀≃ℤ and T₁≃U. Pure words of length d span T_d, so this decomposition agrees with the existing range-power grading on generators. The previously established vanishing intersections then identify Kᴹ₀(F) with ℤ and Kᴹ₁(F) with U. No basis or freeness assumption on U is used.

Supply the following named interface.

- `milnor_gradedAlgebra`: The images of T_d form an ℕ-graded ℤ-algebra decomposition of the imported Milnor ring.
- `milnor_symbol_mem_degree`: The product {a₁,…,aₙ} lies in degree n; the empty symbol is 1 in degree zero.
- `milnor_symbol_mul`: Multiplying an i-symbol and a j-symbol concatenates their lists, in that order.
- `milnor_symbol_multilinear`: Multiplication of one unit entry becomes addition of two symbols.
- `milnor_hom_ext`: Ring homomorphisms out of Kᴹ(F) are determined by the degree-one unit classes.
- `milnor_low_degrees`: Degrees zero and one are ℤ and Additive Fˣ, with explicit maps and inverses.

**Checks.**

- `milnor_degree_zero` (compatibility): For F₂ the constant 7 survives in degree zero and 1≠0 in Kᴹ(F₂).
- `milnor_unit_one` (degenerate): The one-entry symbol {1} is zero in degree one, whereas the empty symbol is the ring unit.
- `milnor_sandwich` (characterisation): For units a,b with a+b=1, the degree-four symbol {r,a,b,s} vanishes; imposing only a left-ideal relation would not justify the trailing s.
- `milnor_real_square` (non-example): {-1}²={-1,-1} is nonzero over ℝ, so the graded ring is not an exterior algebra.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`HigherLocalFieldsAndHigherClassFieldTheory:HL.1` uses this interface as follows: Imports these same degree pieces and concatenation product; does not reconstruct Milnor theory. `K2SymbolsBrauer:T.2/graded-degree-two` uses this interface as follows: Makes the phrase degree-two group a proven direct-sum component.

### T.2.6. Degree two equals the tensor-square presentation

F is a commutative field; coefficients in every symbol group are integral. There is a canonical additive equivalence Kᴹ₂(F)≃P₂(F) taking the two-entry Milnor symbol {a,b} to p(a,b). This is an equivalence of the two specified quotient constructions; it is independent of classical or Quillen K-theory.

(Weibel-III, III.7.1 and III.6.1, pp. 61, 48. Explains the two presentations without using the asserted Matsumoto isomorphism as a premise.)

*Needs:* `K2SymbolsBrauer:T.2/graded-quotient-components`, `K2SymbolsBrauer:T.2/tensor-square-presentation`, `mathlib:TensorAlgebra.equivDirectSum`, `mathlib:TensorPower.mulEquiv`, `mathlib:PiTensorProduct.subsingletonEquiv`.

Prove `graded_degree_two` by the following argument.

Restrict the existing TensorAlgebra.equivDirectSum to degree two. Its generator formula sends a product ι(u)ι(v) to the second pure tensor. Identify this tensor power with U⊗ℤU using TensorPower.mulEquiv at 1+1 and the singleton PiTensorProduct equivalence. These are existing library equivalences, not new tensor-algebra targets.

The inverse is the existing second-component projection composed with the inverse tensor-power equivalence: length-two words go to their pure tensor and words of other lengths have zero second component. Compare with the existing T₂ range-power submodule by its generation by length-two products. The library equivalence supplies well-definedness and multilinearity without a new raw-word quotient construction.

Use J∩T₂=R₂ to descend both directions. Check the composites on degree-two products, then extend by their additive generation.

**Checks.**

- The equivalence sends {1/2,1/2} to zero over ℚ.
- Both maps are fixed on symbols; there is no arbitrary chosen isomorphism.

### T.2.7. Functorial maps on the Milnor presentation

F is a commutative field; coefficients in every symbol group are integral. For a field homomorphism f:F→E construct the graded ring map Kᴹ(f) induced by units a↦f(a). Its degree-two map corresponds under the tensor-square equivalences to p(a,b)↦p(f(a),f(b)); identity and composition are strict map equalities.

(Weibel-III, III.7.1, p. 61. Functoriality derived from the presented definition. Matsumoto-1969, §9, functorial observations (a),(b), p. 50. Symbol pullback and coefficient postcomposition in the central-extension setting, specialized without topology.)

*Needs:* `K2SymbolsBrauer:T.2/graded-quotient-components`, `K2SymbolsBrauer:T.2/graded-degree-two`, `mathlib:TensorAlgebra.lift`.

A field homomorphism is injective and maps units to units. Its induced additive-unit map is ℤ-linear.

Lift to the tensor algebra. It sends each generating Steinberg product into the target Steinberg ideal because f(a)+f(b)=1. Hence it preserves J and descends to the quotient.

On n-symbols it sends every entry through f and preserves degree. Prove identity and composition on degree-one generators and use ring-hom extensionality.

Supply the following named interface.

- `milnorFieldMap`: A graded ring homomorphism from the imported Milnor ring of F to that of E.
- `milnorFieldMap_symbol`: An n-symbol maps to the n-symbol of its images, with unchanged entry order.
- `milnorFieldMap_id`: The identity field map induces the identity ring map.
- `milnorFieldMap_comp`: For F→E→L the composite of induced maps equals the map of the composite.
- `milnorFieldMap_degreeTwo`: The degree-two square with the two tensor-square presentation maps commutes.

**Checks.**

- `map_Q_R` (computation): Under ℚ→ℝ, p(-1,-1) maps to p(-1,-1), detected by the real sign pairing.
- `map_F2_identity` (degenerate): The identity of F₂ is the identity on degree zero ℤ, even though its degree-two group vanishes.
- `map_order` (compatibility): The image of {a,b,c} is {f(a),f(b),f(c)}, not the reversed symbol, which would introduce a permutation sign.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/matsumoto-natural` uses this interface as follows: Pins the source map of the naturality square. `K2SymbolsBrauer:T.3:symbols` uses this interface as follows: Supplies restriction on symbols before valuations or transfers are introduced.

### T.2.8. Field Weyl and diagonal lift calculus

F is a commutative field; coefficients in every symbol group are integral. Use the preceding layer’s w_ij(a)=x_ij(a)x_ji(-a⁻¹)x_ij(a) and h_ij(a)=w_ij(a)w_ij(-1). In St_n(F), n≥3, their conjugation on every root subgroup is the signed and rescaled matrix Weyl/torus action. In particular w_ij(a)⁻¹=w_ij(-a), h_ij(a)x_kl(t)h_ij(a)⁻¹=x_kl(d_k t d_l⁻¹), where d_i=a,d_j=a⁻¹ and all other d_k=1.

(Steinberg-1967, §6, Lemma 37(a)–(f), pp. 67–68 (PDF pp. 74–75). Derivation of the opposite-root relation from a third root, specialized to type A. Weibel-III, III, Exercise 5.8(a)–(e), p. 46. The concrete w-word identities, expanded rather than imported as an unproved exercise.)

*Needs:* `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift`, `tauceti:TauCeti.transvectionUnit`, `tauceti:TauCeti.commutatorElement_transvectionUnit`, `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse`.

Prove `field_lift_calculus` by the following argument.

Reuse the existing lift words; no new presentation of St_n is introduced.

For non-opposite roots expand the three factors of w and apply the three Steinberg relations, retaining all distinct-index hypotheses.

For opposite roots use a third index to express x_ij(t)=[x_ik(t),x_kj(1)]. Conjugate both factors by w, using the already checked non-opposite cases; this supplies the rank-one identities without assuming them as relations.

Compose the Weyl conjugations for w(a)w(-1) to obtain the diagonal rescaling. Read each elementary-image equation against the existing pinned transvection API.

**Checks.**

- Rank two is excluded.
- At a=-1 the elementary image of h is diag(-1,-1); it is not the identity over ℚ.
- Disjoint root coordinates are fixed; adjacent parameters have the displayed scaling.

### T.2.9. Diagonal commutator equals the toral defect

F is a commutative field; coefficients in every symbol group are integral. In stable St(F), for distinct i,j,k and units a,b, the chosen classical symbol s(a,b)=[h_ij(a),h_ik(b)] equals c_ij(a,b)=h_ij(a)h_ij(b)h_ij(ab)⁻¹. The positive roots e_i-e_j and e_i-e_k have Cartan pairing +1. The corresponding simple adjacent roots instead have pairing -1; their toral commutator is c(a,b)⁻¹.

(Matsumoto-1969, §5, Lemma 5.4(a)–(d), p. 26 (PDF p. 27). The commutator/cocycle identity with its Cartan exponent; the direct stable calculation also works over finite fields. Weibel-III, III.5.10.1, p. 43 and Exercise 5.9, p. 46. Uses the explicit symbol convention; the inverse-defect mismatch in the exercise is recorded as source issue E-T2-2.)

*Needs:* `K2SymbolsBrauer:T.2/field-lift-calculus`, `K2SymbolsBrauer:T.1/k2-is-centre`, `K2SymbolsBrauer:T.2/steinberg-symbol`.

Prove `field_cocycle_normalization` by the following argument.

Every defect c_ij(a,b) lies in the stable kernel, hence is central by the imported stable theorem.

The lift-calculus conjugation gives h_ik(b)h_ij(a)h_ik(b)⁻¹=h_ij(ab)h_ij(b)⁻¹. Therefore its inverse commutator is h_ij(a)h_ij(b)h_ij(ab)⁻¹, exactly s(a,b).

Transport between positive root pairs by signed permutation words built from w; their conjugations fix central kernel elements. This makes the common positive-root defect independent of i<j, with the reverse-root orientation handled separately.

For arbitrary roots use the Cartan exponent in [h_α(a),h_β(b)]=c_α(a,b^{⟨β,α∨⟩}). Fix both the +1 overlap and -1 adjacency cases; never switch between them silently.

**Checks.**

- The normalization is the displayed commutator, not its inverse.
- The matrix image of c_ij is 1, but that fact alone is not used to conclude c_ij=1.
- The comparison agrees with Matsumoto’s cocycle for the +1 root overlap.

### T.2.10. The explicit classical symbol is a pairing

F is a commutative field; coefficients in every symbol group are integral. The preceding layer’s symbol s:Fˣ×Fˣ→Additive K₂(F) is a Steinberg pairing. It is independent of stabilizing coordinates and is natural under field homomorphisms. This supplies the field case without appealing to the preceding layer’s general-ring Whitehead conjugation argument.

(Weibel-III, III.5.10.1–5.10.2, p. 43. The complete word calculation for the Steinberg relation. Matsumoto-1969, §5, Lemma 5.4 and Lemma 5.6, pp. 26–28. Bilinearity for type A and its relation to the bilinear symbol conditions.)

*Needs:* `K2SymbolsBrauer:T.2/field-cocycle-normalization`, `K2SymbolsBrauer:T.2/field-pairing`, `K2SymbolsBrauer:T.1/stabilisation`.

Prove `field_symbol_pairing` by the following argument.

The elementary diagonals commute, so their lift commutator lies in K₂. Centrality gives independence of lifts.

For a product aa′ in either argument, replace h(aa′) by h(a)h(a′) times its central defect. The central factor disappears from the commutator; the commutator product law supplies bilinearity.

For a+b=1 expand w(a)w(-1)w(b). The identities a-a²=ab, b-b²=ab and a⁻¹+b⁻¹=(ab)⁻¹ reduce this word to w(ab), hence h(a)h(b)=h(ab). Cocycle normalization yields s(a,b)=0.

Coordinate changes use actual elementary signed permutation words, not arbitrary GL conjugation. Field homomorphisms preserve each of the three w factors and thus h and the commutator.

**Checks.**

- The Steinberg relation has two unit inputs and does not assert a symbol at zero.
- The case a=1 is addressed by pairing-identities, rather than a nonexistent unit 1-a.

### T.2.11. Lifted Bruhat reduction and complete toral relations

F is a commutative field; coefficients in every symbol group are integral. For n≥3 and any field F, quotient St_n(F) by the normal closure of the defects h_ij(a)h_ij(b)h_ij(ab)⁻¹. The map from this quotient to SL_n(F) is an isomorphism. In the quotient, Bruhat words reduce to u·h·w·v, with ordered positive-root products u,v, simple-coroot diagonal word h, and a chosen signed permutation representative w. An element mapping to the identity reduces to the identity; no uniqueness of both outer unipotent factors is claimed.

(Steinberg-1967, §6, Lemmas 36–38 and Theorem 8(b), pp. 66–70 (PDF pp. 73–77). The complete Chevalley presentation specialized to A_{n-1}; ordinary Bruhat is imported, while the lift reduction is planned here. Matsumoto-1969, §5, Lemma 5.3, pp. 24–25. Distinguishes the unique monomial component from non-unique outer factors; its infinite-field restriction is not used to extend this theorem to finite fields.)

*Needs:* `K2SymbolsBrauer:T.2/field-lift-calculus`, `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`.

Prove `lifted_bruhat_generation` by the following argument.

Gaussian elimination over F identifies E_n(F) with SL_n(F); ordinary Bruhat decomposition and its Weyl combinatorics are imported from their upstream owners.

Order positive roots by increasing height. Steinberg commutator relations collect their products; inspection of triangular matrix entries proves the collected root-subgroup map injective.

Use the lift calculus to move diagonal and Weyl words across collected unipotent products. Modulo the defects, h_ij is multiplicative. Rewrite all diagonal words in the simple-coroot coordinates.

The union of the Bruhat word sets is stable under left multiplication by each generator: positive roots collect directly; simple Weyl generators split into the increasing/decreasing-length cases. For an opposite root with nonzero parameter use the three-factor w identity, whose torus parameter is its inverse.

If the matrix image is 1, ordinary Bruhat forces w=1; diagonal coordinates then force h=1. The remaining unipotent product is trivial by triangular injectivity. This proves injectivity of the quotient and completeness of the presentation, rather than merely checking its matrix relations.

**Checks.**

- The result includes n=3 over F₂ and F₃; it does not assert universal centrality in that rank.
- Injectivity is proved through the Bruhat reduction, not from faithfulness of an already defined matrix action.

### T.2.12. Symbols generate the stable field kernel

F is a commutative field; coefficients in every symbol group are integral. The additive subgroup generated by s(a,b) is all of K₂(F), for every field F. This is only the field refinement of the preceding layer’s semilocal generation target.

(Steinberg-1967, §6, Theorem 8(b), pp. 66, 69–70. Extracts the kernel generators from the complete presentation. Weibel-III, III.5.10.5, pp. 43–44. Closes the field branch of the cited generation theorem using the explicit presentation proof.)

*Needs:* `K2SymbolsBrauer:T.2/lifted-bruhat-generation`, `K2SymbolsBrauer:T.2/field-cocycle-normalization`, `K2SymbolsBrauer:T.1/stabilisation`, `K2SymbolsBrauer:T.1/k2-definition`, `K2SymbolsBrauer:T.1/k2-is-centre`.

Prove `field_symbol_generation` by the following argument.

Choose a finite Steinberg word representing a stable kernel element. Its elementary image is identity already at a sufficiently large finite rank, since the finite matrix embeddings are injective.

By complete toral relations, that word is a product of conjugates of toral defects and their inverses.

In stable St each defect is the chosen symbol and is central. Drop the conjugations to obtain a finite sum of symbols.

This argument requires the preceding layer’s finite-representative/colimit API and stable centrality, supplied by the preceding layer. It does not prove generation for arbitrary semilocal rings.

**Checks.**

- Every stable kernel element has a displayed finite sum of symbols.
- No claim about finite-rank universality follows from this stable result.

### T.2.13. Torus extension carrying a prescribed symbol

F is a field, A is an abelian group, c is a Steinberg pairing, n≥3 and r=n-1. Given a Steinberg pairing c:Fˣ×Fˣ→A and r=n-1≥2, let H₀=(Fˣ)^r with ordered simple coroots α_i=e_i-e_{i+1}. Put β(s,t)=Σ_i c(s_i,t_i)−Σ_{i>j, i=j+1} c(s_i,t_j). Give H_c=A×H₀ the product (a,s)(b,t)=(a+b+β(s,t),st). It is a central extension of the SL_n diagonal torus by A, with h_i(s)h_i(t)h_i(st)⁻¹=c(s,t) and [h_i(s),h_j(t)]=a_{ji}c(s,t), where a_{ii}=2, adjacent a_{ji}=-1 and all other entries are zero.

(Matsumoto-1969, §6, construction preceding Lemma 6.5, pp. 37–38 (PDF pp. 38–39). The torus factor set specialized to simply laced type A and additive coefficients, with its coordinate formula explicit.)

*Needs:* `K2SymbolsBrauer:T.2/pairing-identities`, `K2SymbolsBrauer:T.1/central-extension`.

Each term of β is biadditive in the multiplicative coordinates, so β(s,t)+β(st,u)=β(s,tu)+β(t,u); β at either identity is zero. This gives associativity and identity on the displayed carrier.

The inverse is (-a-β(s,s⁻¹),s⁻¹). Projection onto H₀ is onto; inclusion a↦(a,1) is injective and its image is the kernel and is central.

Compute defects and commutators using the coordinate formula and skew-symmetry. The same-coordinate commutator is 2c(s,t), explaining the diagonal Cartan entry.

Identify H₀ with diagonal matrices of determinant one by s↦diag(s₁,s₁⁻¹s₂,…,s_{r-1}⁻¹s_r,s_r⁻¹). The inverse reads successive products of diagonal entries.

Supply the following named interface.

- `symbolTorusExtension`: The central extension on A×(Fˣ)^r with the displayed β product.
- `symbolTorus_inl_injective`: The coefficient inclusion a↦(a,1) is injective and identifies A with the projection kernel.
- `symbolTorus_defect`: h_i(s)h_i(t)h_i(st)⁻¹=inl(c(s,t)).
- `symbolTorus_commutator`: The toral commutator is the Cartan multiple a_{ji}c(s,t).
- `symbolTorus_map`: Postcomposing c by A→+B maps (a,t) to (f(a),t) and fixes the quotient torus.
- `symbolTorus_mul`: In the A×(Fˣ)^r coordinates, (a,s)(b,t)=(a+b+β(s,t),st), with the displayed ordered factor set β.
- `symbolTorus_project`: The homomorphism (a,s)↦s is surjective; the simple torus lift h_i(t) has coefficient zero and t in its ith coordinate.

**Checks.**

- `torus_zero` (degenerate): For c=0, H_c is the direct product A×H₀ with the identity inclusions.
- `torus_adjacent` (computation): For r=2, β(s,t)=c(s₁,t₁)+c(s₂,t₂)-c(s₂,t₁). The cross-term is present; for nonadjacent coordinates in r=3 it is zero.
- `torus_real_defect` (non-example): For the real sign pairing, h_i(-1)²=inl(1), although its diagonal matrix has square 1. A product torus would fail this test.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/symbol-monomial-extension` uses this interface as follows: Supplies the subgroup and Weyl action of the lifted monomial group. `K2SymbolsBrauer:T.2/symbol-extension` uses this interface as follows: Ensures that prescribed symbols remain visible, rather than killed by presentation relations.

### T.2.14. Extended Weyl square-subgroup presentation

n≥3, r=n-1 and the Cartan entries are those of A_r. This theorem is independent of the field. For the type-A chain with r=n-1≥2 let W̃ be generated by q_i with adjacent length-three braids, nonadjacent commutation, and q_i²q_jq_i⁻²=q_j^{(-1)^{a_{ji}}}. Its square subgroup D generated by d_i=q_i² has the presentation d_i⁻¹d_jd_i=d_j d_i^{1-(-1)^{a_{ji}}}. In particular q_i⁴ is a common nontrivial central element of order two, and W̃/D is S_n. These are square-subgroup relations, not the relation q_i⁴=1.

(Matsumoto-1969, §6, Theorem 6.3(a)–(c) and its proof, pp. 34–36. Specializes the auxiliary doubled signed-Weyl group to the connected simply laced type-A chain; the mod-two model spells out the square-subgroup realization.)

*Needs:* `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`.

Prove `lifted_weyl_square_presentation` by the following argument.

The defining relations make the fourth powers central; the ordinary signed-Weyl presentation identifies the quotient by them. Collect square words using the displayed conjugation relations. They force d_i⁴=1 and equality of d_i² along the connected type-A chain.

To prove there are no further square relations, realize the candidate D on (ℤ/2)×(ℤ/2)^r with factor set B(x,y)=Σ_i x_i y_i+Σ_{i=j+1} x_i y_j. Its coordinate generators square to the common central coefficient 1 and have precisely the adjacent/nonadjacent commutators. Collection gives at most 2^(r+1) elements, and this model has exactly that size.

Define auxiliary θ_i⁻¹(d_j)=d_j d_i^{b_ij}, where b_ij=(1−(-1)^{a_ij})/2: it is 1 for adjacent distinct vertices and 0 otherwise, including i=j. Thus the auxiliary action fixes d_i. Verify θ_i²=Ad(d_i) and the type-A braids. On D×S_n define Λ_i(t,w)=(θ_i(t),s_iw) when length increases, and Λ_i(t,w)=(θ_i(t d_i),s_iw) when length decreases. Their squares translate by d_i, so D acts faithfully; rank-two braid checks give a representation of W̃ preserving the candidate square group.

This faithful realization proves the displayed square relations exhaustive and the central fourth power nontrivial. Modulo D the Coxeter presentation gives S_n.

**Checks.**

- For r=2 the square subgroup has eight elements, with both generating squares equal to the nontrivial central coefficient.
- The proof is a lifted presentation calculation; ordinary Coxeter word invariance is imported.

### T.2.15. Lifted monomial extension

F is a field, A is abelian, c is a Steinberg pairing and n≥3. Extend H_c to a central extension N_c of the determinant-one monomial matrix group N₀. Its simple Weyl lifts q_i project to w_{i,i+1}(-1), satisfy q_i²=h_i(-1), commute for nonadjacent i,j and satisfy q_iq_jq_i=q_jq_iq_j for adjacent i,j. Conjugation by q_i acts by θ_i; θ_i⁻¹ fixes A and sends h_j(t) to h_j(t)h_i(t^{-a_{ij}}). The map H_c→N_c is injective; N_c/H_c is the symmetric group S_n.

(Matsumoto-1969, §6, Theorem 6.3 and Lemmas 6.5–6.6, pp. 34–40. The intermediate monomial construction and the injectivity of its torus; restrict to the simply laced A case.)

*Needs:* `K2SymbolsBrauer:T.2/symbol-torus-extension`, `K2SymbolsBrauer:T.2/lifted-weyl-square-presentation`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`.

Check that the proposed θ_i⁻¹ images preserve every torus defect and commutator relation using bilinearity, c(t,-t)=0 and the diagonal 2-torsion equation.

Check θ_i²=Ad(h_i(-1)), the adjacent braid relation and the nonadjacent commuting relation. These are explicit type-A computations on the torus generators.

Introduce the auxiliary group W̃ generated by q_i with the braid relations and q_i²q_jq_i⁻²=q_j^{(-1)^{a_{ji}}}. Its square subgroup maps to H_c by q_i²↦h_i(-1), using the proved lifted-weyl-square-presentation; its adjacent commutator and common central squares map correctly by the torus Cartan formula and 2c(-1,-1)=0.

Form H_c⋊W̃ and quotient by the graph subgroup identifying these squares. The graph subgroup is normal and meets H_c trivially; prove this intersection before claiming injectivity.

Using the ordinary Weyl presentation and reduced-word property, collect every element into a torus element times a chosen reduced Weyl lift. Compute the kernel of N_c→N₀ as precisely A. No relation q_i⁴=1 is added: it can erase c(-1,-1).

Supply the following named interface.

- `symbolMonomialExtension`: The extension N_c with its injective torus map and projection to N₀.
- `symbolMonomial_torus`: H_c embeds, with the same coefficient inclusion A→N_c.
- `symbolMonomial_square`: q_i²=h_i(-1); its fourth power is inl(c(-1,-1)).
- `symbolMonomial_braid`: Adjacent q satisfy the length-three braid relation; nonadjacent q commute.
- `symbolMonomial_kernel`: The coefficient inclusion is an isomorphism A≃ker(N_c→N₀).
- `symbolMonomial_conjugation`: For Cartan entries a_ij, q_i⁻¹ h_j(t) q_i=h_j(t)h_i(t^(-a_ij)); this includes the central coefficients dictated by the fixed torus product.
- `symbolMonomial_hom_ext`: Group homomorphisms out of N_c agree if they agree on the embedded H_c and on every q_i.
- `symbolMonomial_lift`: A homomorphism H_c→G and elements Q_i of a group G extend uniquely to a homomorphism N_c→G if they satisfy the displayed torus conjugation, braid/commutation and Q_i²=image(h_i(-1)) relations. No Q_i⁴=1 relation is imposed.

**Checks.**

- `monomial_zero` (compatibility): For c=0, N_c is A×N₀ over N₀, with the pinned signed matrix Weyl representatives.
- `monomial_square` (computation): q_i projects to a determinant-one signed transposition whose square is diagonal -1 at two coordinates, not generally 1.
- `monomial_real_fourth` (non-example): For the real sign pairing, q_i⁴=inl(1)≠1 and q_i⁸=1. Replacing the lift by an involutive permutation loses the prescribed symbol.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/symbol-extension` uses this interface as follows: Provides fibers over the unique ordinary Bruhat monomial component. `K2SymbolsBrauer:T.2/symbol-extension-exact` uses this interface as follows: Retains coefficient injectivity in the global normal-form argument.

### T.2.16. Matsumoto’s permutation construction

F is an infinite field; A is an abelian group; c is a Steinberg pairing; n≥3. For an infinite field F and prescribed pairing c, let v:SL_n(F)→N₀ be the unique monomial middle component in U⁺NU⁺. Define S_c={(g,m)∈SL_n(F)×N_c | v(g)=p(m)}. Define E_c as the subgroup of permutations of S_c generated by left torus translations, positive-unipotent translations and simple Weyl transformations. The first coordinate of each generator is the corresponding left matrix translation.

(Matsumoto-1969, §5, Lemma 5.3 and §6, construction of S and E before Lemma 6.7, pp. 24–25, 40–41. The two-branch transformation construction in the original proof, restricted to its infinite-field domain.)

*Needs:* `K2SymbolsBrauer:T.2/symbol-monomial-extension`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `K2SymbolsBrauer:T.2/field-lift-calculus`.

The map v is a function picking the unique middle monomial, not either outer unipotent factor. Establish its equivariance under left U⁺ and the torus and its two-branch change under w_i(-1), as the specialization of ordinary Bruhat to root coordinates.

A torus lift h acts by (g,m)↦(p(h)g,hm); u∈U⁺ acts by (g,m)↦(ug,m).

For q_i the first coordinate is w_i(-1)g. If v(w_i(-1)g)=w_i(-1)v(g), the second coordinate becomes q_i m. Otherwise there is a unique nonzero root parameter t and v(w_i(-1)g)=h_i(t⁻¹)v(g); the second coordinate becomes h_i(t⁻¹)m.

Check membership in S_c and bijectivity of each transformation. The Weyl inverse follows from λ_i²=λ(h_i(-1)), with both branches verified.

A acts faithfully and centrally on the second coordinates. Its orbit set is SL_n(F), so the first-coordinate action defines a surjection E_c→SL_n(F). Exactness of its kernel is the separate theorem below, not assumed in this construction.

Supply the following named interface.

- `symbolExtensionSpace`: The fiber set S_c over the unique ordinary Bruhat monomial map.
- `symbolExtensionAction`: The subgroup E_c of permutations generated by the displayed transformations.
- `symbolExtension_project`: The surjective homomorphism E_c→SL_n(F) induced by first coordinates.
- `symbolExtension_coeff`: A injects into the centre of E_c by second-coordinate translation.
- `symbolExtension_weyl_branch`: The two second-coordinate formulas use the actual unique nonzero root parameter only in the decreasing branch.

**Checks.**

- `action_identity_cell` (computation): At (1,1), the simple Weyl transformation sends the pair to (w_i(-1),q_i).
- `action_square` (compatibility): Applying the simple Weyl transformation twice equals torus translation by h_i(-1), including the second coordinate.
- `action_zero` (degenerate): For c=0 the fiber is SL_n(F)×A, and all root generators fix the A coordinate; coefficient elements translate it.
- `action_coeff_nontrivial` (non-example): For nonzero a∈A, coefficient translation sends (1,1) to (1,inl(a)); it is not the identity permutation.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/symbol-extension-local-relations` uses this interface as follows: Verifies the local rank-one/rank-two relations without asserting they hold by definition. `K2SymbolsBrauer:T.2/infinite-symbol-injectivity` uses this interface as follows: A faithful coefficient action will detect each proposed symbol relation.

### T.2.17. Rank-one and rank-two action relations

F is an infinite field; c is a Steinberg pairing to abelian A; n≥3. The left and right transformation groups on S_c commute and act transitively, so each acts freely. Each rank-one restriction has the prescribed toral cocycle c. The adjacent simple Weyl transformations satisfy the length-three braid relation, and transformations belonging to disconnected simple roots commute. These are the local action relations used to establish global exactness; the full type-A Steinberg relations are supplied after exactness by symbol-extension-root-lifts.

(Matsumoto-1969, §6, Lemmas 6.8–6.10, pp. 41–42; §7, Lemmas 7.1–7.2 and proof of Lemma 6.8, pp. 43–47. The nonroutine local action check, including its Steinberg-cocycle cancellation; no symplectic rank-two theory is needed for type A.)

*Needs:* `K2SymbolsBrauer:T.2/symbol-extension`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`.

Prove `symbol_extension_local_relations` by the following argument.

Define inversion on S_c by (g,m)↦(g⁻¹,m⁻¹), and conjugate the left transformation group by it to obtain the right transformation group.

Torus and positive-root left transformations commute with the right generators. Reduce the remaining left/right Weyl commutation to a rank-one or rank-two root subsystem and its minimal Weyl-coset representative.

Use orbit representatives (x_α(u)w(σ)x_β(v), lift(w(σ))) and split the three cases σβ≠±α, σβ=α and σβ=-α. In the last case isolate u=0, v=0 or uv=1; when uv(1-uv)≠0 use c(u⁻¹,(v-u⁻¹)⁻¹)=c((u-v⁻¹)⁻¹,v⁻¹). This follows by bilinearity and the Steinberg relation, and is the essential cocycle cancellation.

Left and right groups are transitive and commute, hence each acts freely: an element fixing one point fixes its orbit under the commuting transitive group. Verify the Weyl braid at (1,1), then use freeness to promote the equality to permutations.

Use the embedded rank-one actions to identify their toral defects with c. Check the braid and disconnected-root equations on the embedded rank-two spaces; the minimal-coset reduction of Lemma 6.9 transports their equality to every orbit. This supplies the monomial relations and the rank-one decomposition required for the global Bruhat cover. It does not infer all root commutator relations merely from the Weyl braid equations.

**Checks.**

- The exceptional uv=1 branch is checked without an inverse of zero.
- The braid equation is proved as an equality of permutations on the entire fiber set.
- A condition asserting these action relations is not added to the input data.

### T.2.18. Exact central extension realizing the pairing

F is an infinite field, A is abelian, c is a Steinberg pairing and n≥3. The projection E_c→SL_n(F) has kernel exactly the embedded coefficient group A. Thus 1→A→E_c→SL_n(F)→1 is an exact central extension with A included injectively. Its embedded torus retains the defect h_i(s)h_i(t)h_i(st)⁻¹=inl(c(s,t)). Agreement of this torus with Steinberg root-word lifts is proved in symbol-extension-root-lifts.

(Matsumoto-1969, §6, Lemma 6.11(a)–(d), pp. 42–43; Theorem 5.10, pp. 30–31. Completes the original extension construction through its lifted Bruhat cover, not through an assumed kernel presentation.)

*Needs:* `K2SymbolsBrauer:T.2/symbol-extension-local-relations`, `K2SymbolsBrauer:T.2/symbol-monomial-extension`, `K2SymbolsBrauer:T.2/symbol-extension`.

Prove `symbol_extension_exact` by the following argument.

Embed N_c into E_c using the verified local relations and coefficient/torus translations. Its quotient by the lifted torus is the ordinary Weyl group.

Show E_c is the union of Ũ⁺H̃ w̃ Ũ⁺: the union contains 1 and is stable under left multiplication by its generating transformations. Increasing-length cases move a root past w̃; decreasing-length cases use the verified rank-one decomposition, with its torus inverse parameter.

If an element projects to 1, ordinary Bruhat forces the Weyl component to be 1 and then its torus coordinate to be 1. Unipotent injectivity eliminates the outer factors, leaving precisely A.

The prescribed torus defect is retained under the injective torus embedding. Centrality and injectivity were established in the permutation action, so the identification of the kernel does not erase nonzero coefficients. This proves exactness before invoking the central-extension root-lifting argument.

**Checks.**

- At c=p with A=P₂(F), inl(p(-1,-1)) remains nonzero over ℝ.
- Exactness includes both containment directions and surjectivity.

### T.2.19. Steinberg root lifts of the detecting extension

F is an infinite commutative field; A is an abelian group; c is a bilinear Steinberg pairing; n≥3. For an infinite field F, a Steinberg pairing c:Fˣ×Fˣ→A to an abelian group and n≥3, the exact extension E_c admits lifts y_ij(t) of every elementary root x_ij(t). They are additive in t and satisfy the forward, reverse and disconnected type-A Steinberg commutator relations. Hence there is a homomorphism ρ_c:St_n(F)→E_c over SL_n(F). With w_ij(a)=y_ij(a)y_ji(-a⁻¹)y_ij(a) and h_ij(a)=w_ij(a)w_ij(-1), these lifts agree with the embedded simple torus words, and [h_12(a),h_13(b)]=inl(c(a,b)).

(Steinberg-1967, §7, Theorem 10 proof, steps (1)–(9), printed pp. 79–82 (PDF pp. 86–89); Corollary 1, printed p. 82 (PDF p. 89).. Only the lifting of root relations to an arbitrary central extension is used, specialized to type A and infinite fields. The theorem’s universality conclusion and its small-field exceptions are not imported. Matsumoto-1969, §5, root lifts before Lemma 5.1, printed p. 23; §6, Lemma 6.10(a), printed p. 42, and Lemma 6.11(d), printed p. 43; §7, end of the proof of Lemma 6.8(a), printed p. 47 (PDF pp. 24, 43–44, 48).. Identifies the rank-one root-word cocycle of the constructed extension with the prescribed coefficient cocycle.)

*Needs:* `K2SymbolsBrauer:T.2/symbol-extension-exact`, `K2SymbolsBrauer:T.2/symbol-extension-local-relations`, `K2SymbolsBrauer:T.2/field-lift-calculus`, `K2SymbolsBrauer:T.2/symbol-torus-extension`, `K2SymbolsBrauer:T.1/central-extension`, `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`.

Prove `symbol_extension_root_lifts` by the following argument.

First use the already proved exactness of E_c→SL_n(F). In a central extension, a commutator of arbitrary lifts depends only on their quotient elements. Choose a∈Fˣ with a²≠1, lift the ordinary coroot h_α(a), and set y_α(t) to the commutator of that lift with any lift of x_α(t/(a²-1)). Its projection is x_α(t); independence of the arbitrary lifts follows from centrality.

Follow the root-lifting part of Steinberg’s Theorem 10 proof, steps (2)–(8). Torus and monomial conjugation of these sections preserves the section with the correctly rescaled root parameter. For distinct nonopposite roots whose sum is not a root, the residual central commutator is biadditive, and a torus rescaling fixing one root and changing the other kills it. In type A the two roots are linearly independent, so an integral cocharacter with these weights exists; infinity lets one avoid the finitely many forbidden scalar values.

For a root paired with itself, use simultaneous torus rescaling and biadditivity as in step (5b). Choose z with z(1-z)(1-z+z²)≠0; such a choice exists in every infinite field, including characteristic two. This proves commutativity of the lifted root subgroup. Step (7) then kills the central additivity defect using the defining coroot commutator. These arguments establish actual root homomorphisms, rather than assuming them in the extension data.

For a pair whose sum is a root, compare its commutator with the canonical lift of the matrix commutator. The remaining central factor is biadditive; the same separating torus rescaling kills it, as in step (8). The matrix constants are +uv in the forward chain and -vu in the reverse chain. Opposite roots have no Steinberg commutator relation; normalizer conjugation supplies the Weyl identities instead. Apply the presented-group universal property to get ρ_c.

The positive-root translation sections in E_c are additive and satisfy the computed torus conjugation, so they equal the commutator-defined sections. Normalizer equivariance identifies their negative-root transports as well. The explicit rank-one calculation at the end of Matsumoto’s Lemma 6.8(a) proof, p. 47, gives w_i(t)=h_i(t)q_i⁻¹ and w_i(-1)=q_i. Thus the root-word h_i(t) is the embedded torus lift, and its defect is c; Lemmas 6.10(a) and 6.11(d) transport this to the global extension. Monomial conjugation and the +1 Cartan overlap give [h_12(a),h_13(b)]=inl(c(a,b)). Central changes of a torus lift do not change this commutator.

**Checks.**

- The field-size choice is justified by infinity. This theorem is not applied to F₂, F₃ or F₄.
- The root lifts are obtained after exactness, and satisfy every defining relation of the imported St_n, with all index inequalities.
- The generator equation detects the positive-overlap symbol and retains inl(c(-1,-1)) over ℝ. No finite-rank universal-central-extension theorem is an input.

### T.2.20. Finite-field classical kernel vanishing

F is a finite field. For a finite field F, every explicit classical symbol s(a,b) vanishes and the stable classical group K₂(F) is zero. The proof works over F₂, F₃ and F₄ and asserts no finite-rank universal-central-extension statement.

(Weibel-III, III.6.1.1, p. 48. The finite counting/parity argument specialized to the classical symbol after generation, with its two independent prerequisites made explicit. Steinberg-1967, §6, Theorem 9 and SL_n example, p. 72 (PDF p. 79). Independent source check that finite-field Steinberg relations impose no nontrivial stable kernel; the stronger finite-rank result is not a target here.)

*Needs:* `K2SymbolsBrauer:T.2/field-symbol-pairing`, `K2SymbolsBrauer:T.2/field-symbol-generation`, `K2SymbolsBrauer:T.2/finite-milnor-vanishing`, `K2SymbolsBrauer:T.2/tensor-square-presentation`.

Prove `finite_classical_vanishing` by the following argument.

By the independently proved abstract finite-field tensor-square vanishing, every Steinberg pairing over F is zero. Apply this to the explicit classical pairing.

The stable kernel is generated by these zero symbols, hence is itself zero. This uses neither infinite-field extension realization nor Matsumoto injectivity.

Alternatively repeat the cyclic generator, diagonal 2-torsion and nonsquare-pair proof directly on the classical pairing; the same F₂ and characteristic-two branches apply.

Keep the result at stable K₂. No finite-rank centrality or universality is deduced from it.

**Checks.**

- K₂(F₂)=K₂(F₃)=K₂(F₄)=0.
- Stable vanishing is established before invoking Matsumoto’s all-field equivalence.

### T.2.21. Finite-field tensor-square vanishing

F is a finite field. For a finite field F, P₂(F)=0 and Kᴹ₂(F)=0, independently of the classical comparison. Every Steinberg pairing from F to an abelian group is zero.

(Weibel-III, III.6.1.1, p. 48. Reuses its elementary cyclicity/parity/counting proof in the abstract quotient, without assuming Matsumoto.)

*Needs:* `K2SymbolsBrauer:T.2/pairing-identities`, `K2SymbolsBrauer:T.2/tensor-square-presentation`, `K2SymbolsBrauer:T.2/graded-degree-two`, `mathlib:isCyclic_of_injective_ringHom`.

Prove `finite_milnor_vanishing` by the following argument.

Choose a generator g of Fˣ using cyclicity; in F₂ the sole unit is 1. Multilinearity makes P₂(F) cyclic on p(g,g).

If char F=2, -1=1 and the diagonal identity gives p(g,g)=0.

If char F≠2, 2p(g,g)=0. There are (q−1)/2 nonsquares but only (q−3)/2 nonzero squares other than 1: the squaring map on units has kernel {1,−1} and fibers of size two. If every nonsquare u had 1−u square, the injection u↦1−u would put the larger set into the smaller one (1−u is neither 0 nor 1). Hence choose nonsquares u=g^m,v=g^n with u+v=1. The exponents m,n are odd, so p(u,v)=mn·p(g,g)=p(g,g), but the Steinberg relation makes this zero.

Generation proves the whole quotient vanishes; its universal property makes every pairing zero. Transfer this to the actual Milnor degree-two component through its already proved equivalence.

**Checks.**

- P₂(F₂)=P₂(F₃)=P₂(F₄)=0.
- No assertion that every skew pairing on a cyclic group is zero substitutes for the Steinberg relation.

### T.2.22. The chosen Milnor-to-classical comparison map

F is a commutative field; coefficients in every symbol group are integral. Define φ_F:Kᴹ₂(F)→Additive K₂(F) as the unique map taking {a,b} to the preceding layer’s explicit commutator symbol s(a,b). Construct it via Kᴹ₂(F)≃P₂(F) and the tensor-square universal property. It is surjective by stable symbol generation; its injectivity is proved separately.

(Weibel-III, III.6.1 and III.7.1, pp. 48, 61. Pins the homomorphism whose bijectivity is Matsumoto’s theorem.)

*Needs:* `K2SymbolsBrauer:T.2/field-symbol-pairing`, `K2SymbolsBrauer:T.2/tensor-square-presentation`, `K2SymbolsBrauer:T.2/graded-degree-two`, `K2SymbolsBrauer:T.2/field-symbol-generation`.

Use the actual diagonal commutator pairing, not an abstract isomorphism chosen from Matsumoto.

Descend it through the tensor-square quotient and compose with the degree-two equivalence in the specified direction.

Every symbol is in the image, so generation proves surjectivity.

Uniqueness on symbols records the exact map for naturality and product comparisons.

Supply the following named interface.

- `milnorToClassicalK2`: The map φ_F with the specified domain and additive target.
- `milnorToClassicalK2_symbol`: φ_F({a,b}) is [h_12(a),h_13(b)] in the stable kernel, written additively.
- `milnorToClassicalK2_unique`: Any additive map with that generator equation is φ_F.
- `milnorToClassicalK2_surjective`: Every element of the classical kernel is the image of an element of the actual Milnor degree-two group.

**Checks.**

- `comparison_half` (computation): φ_ℚ({1/2,1/2})=0 by the explicit w-word Steinberg calculation.
- `comparison_F2` (degenerate): φ_F₂ is the unique map between zero groups after the two independent finite-field arguments.
- `comparison_real_sign` (non-example): The coefficient detector built from the real sign pairing sends φ_ℝ({-1,-1}) to 1, so the map is not the zero map over all fields.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/matsumoto-equivalence` uses this interface as follows: Its inverse is proved for this exact map. `K2SymbolsBrauer:T.3:symbols` uses this interface as follows: Allows field residues to be specified by their values on the chosen classical symbol.

### T.2.23. Faithful symbols over infinite fields

F is an infinite field. For an infinite field F, the map P₂(F)→Additive K₂(F) induced by s is injective. A finite additive combination of symbols that is trivial in stable St already vanishes in P₂(F).

(Matsumoto-1969, §5, Theorem 5.10 and Corollary 5.11, pp. 30–31; §6, Lemma 6.11(d), p. 43. The no-further-relations argument, implemented by the faithful coefficient extension. Steinberg-1967, §6, Theorem 8, p. 66. The root-generator presentation universal property.)

*Needs:* `K2SymbolsBrauer:T.2/symbol-extension-root-lifts`, `K2SymbolsBrauer:T.2/field-cocycle-normalization`, `K2SymbolsBrauer:T.2/tensor-square-presentation`, `K2SymbolsBrauer:T.1/stabilisation`.

Prove `infinite_symbol_injectivity` by the following argument.

Take A=P₂(F) and c=p, its universal pairing. A putative relation is a finite product of stable symbol words.

If that word is 1 in stable St, the predecessor’s finite-representative equality yields a rank n≥3 where the corresponding St_n word is 1.

At that rank, symbol-extension-root-lifts gives ρ_p:St_n(F)→E_p with all Steinberg relations and the explicit symbol equation. No compatibility between E_p at different ranks is required. The argument uses root lifting in an exact central extension, not a claimed finite-rank universality theorem.

Each chosen symbol maps to inl(p(a,b)) by the positive-root cocycle normalization. The word maps to the coefficient inclusion of the alleged relation.

Since A→E_p is injective, the relation vanishes in A. This proves injectivity for the chosen map rather than for a possibly differently oriented presentation.

**Checks.**

- No stable UCE uniqueness theorem is needed to define the detecting map from St_n.
- The proof uses finite-representative equality, not an unsupported injectivity of all St_n→St_{n+1}.

### T.2.24. Matsumoto’s isomorphism for the chosen symbol map

F is a commutative field; coefficients in every symbol group are integral. For every field F, the map φ_F:Kᴹ₂(F)→Additive K₂(F) is bijective and therefore defines a specified additive equivalence. Its inverse sends the classical commutator symbol s(a,b) to {a,b}. The inverse is independent of how a classical kernel element is written as a sum of symbols.

(Weibel-III, III.6.1, p. 48. The all-field conclusion. Matsumoto-1969, §5, Corollary 5.11, p. 31. The infinite-field presentation. Steinberg-1967, §6, Theorem 9, p. 72 (PDF p. 79). The separate finite-field conclusion.)

*Needs:* `K2SymbolsBrauer:T.2/classical-comparison-map`, `K2SymbolsBrauer:T.2/infinite-symbol-injectivity`, `K2SymbolsBrauer:T.2/finite-classical-vanishing`, `K2SymbolsBrauer:T.2/finite-milnor-vanishing`.

Prove `matsumoto_equivalence` by the following argument.

Classically split the field into finite and infinite cases, with no characteristic restriction.

Over an infinite field combine the already established surjectivity with faithful-symbol injectivity. Over a finite field both source and target are independently zero.

Turn the bijective additive homomorphism into an additive equivalence. Its inverse evaluation on symbols follows from the generator equation and injectivity.

Use the universal pairing/presentation injectivity to prove that rewriting a kernel element as another sum gives the same inverse. The comparison statement is the conclusion of this argument, not a premise.

**Checks.**

- The inverse generator equation is explicit.
- All K₂ groups here are classical or Milnor; the Quillen product identification remains a separate supplier obligation.

### T.2.25. Naturality of the field presentation

F is a commutative field; coefficients in every symbol group are integral. For a field homomorphism f:F→E the square with φ_F,φ_E, Kᴹ₂(f) and the imported classical K₂(f) commutes. Both equivalences and their inverses are natural. Different choices of stabilizing coordinates give the same φ, because its generator equation uses the coordinate-independent stable symbol.

(Weibel-III, III.6.1 and III.7.1, pp. 48, 61. Map-level consequence of the presented theorem. Matsumoto-1969, §9, functorial observations (a),(b), p. 50. The same symbol-level naturality, without the topological extra structure.)

*Needs:* `K2SymbolsBrauer:T.2/matsumoto-equivalence`, `K2SymbolsBrauer:T.2/milnor-field-map`, `K2SymbolsBrauer:T.2/field-symbol-pairing`, `K2SymbolsBrauer:T.1/stabilisation`.

Prove `matsumoto_natural` by the following argument.

Evaluate both composites on a pure two-symbol. The source map applies f entrywise, and the classical map applies f to each x in the explicit h words. The results agree.

Use symbol generation/extensionality to deduce the map equality.

Compose with the specified inverse equivalences to obtain naturality in the reverse direction. The proof does not require injectivity of K₂(F)→K₂(E).

**Checks.**

- The identity and composite field-map squares commute.
- Naturality is not promoted to injectivity under arbitrary field extensions.

### T.2.26. A real symbol detecting the integral diagonal

F=ℝ and the coefficient target is ℤ/2. Define ε:ℝˣ→ℤ/2 to be 1 on negative units and 0 on positive units. The function c∞(a,b)=ε(a)ε(b) is a Steinberg pairing. It descends to P₂(ℝ)→ℤ/2 and therefore detects the nonzero order-two class {-1,-1} in Milnor and classical K₂(ℝ). It also defines a graded map Kᴹ(ℝ)→(ℤ/2)[t] sending the degree-one class of a to ε(a)t.

(Weibel-III, III.6.2.1, p. 49; III.7.2(c), p. 61. The real sign pairing and its polynomial-valued graded extension; only detection is used, not the full divisible-summand computation.)

*Needs:* `K2SymbolsBrauer:T.2/field-pairing`, `K2SymbolsBrauer:T.2/tensor-square-presentation`, `K2SymbolsBrauer:T.2/pairing-identities`, `K2SymbolsBrauer:T.2/graded-quotient-components`, `K2SymbolsBrauer:T.2/matsumoto-equivalence`, `mathlib:TensorAlgebra.lift`.

The sign of a product gives ε(ab)=ε(a)+ε(b) in ℤ/2. A unit is never zero, so positivity and negativity cover all inputs.

If a+b=1, the two units cannot both be negative, so their two sign values multiply to zero. This proves the pairing condition without Hilbert symbols or a Brauer-group comparison.

Descend by the universal property. Its value on p(-1,-1) is 1, while the diagonal identity makes twice that class zero.

For the graded detector extend the degree-one linear sign map to the tensor algebra. Its Steinberg products vanish, so it factors through the homogeneous quotient and respects degree.

Supply the following named interface.

- `realSignPairing`: The ℤ/2-valued function with value 1 exactly when both units are negative.
- `realSignPairing_isSteinberg`: The displayed function satisfies the pairing predicate.
- `realSignDetector`: The unique P₂(ℝ)→+ℤ/2 evaluating on symbols as realSignPairing.
- `realGradedSignDetector`: The map to (ℤ/2)[t] sends {a₁,…,aₙ} to (Π_i ε(a_i))t^n.

**Checks.**

- `sign_negative_negative` (computation): c∞(-1,-1)=1.
- `sign_positive_negative` (computation): c∞(2,-1)=0 and c∞(-1,1)=0.
- `sign_steinberg_pair` (compatibility): c∞(-1,2)=0 since the inputs sum to one.
- `sign_not_alternating` (non-example): Its diagonal at -1 is nonzero, despite skew-symmetry in the additive group ℤ/2.
- The conclusion holds at the displayed maps, with the stated orientations and hypotheses.

`K2SymbolsBrauer:T.2/tensor-square-presentation` uses this interface as follows: A concrete universal-property test rules out the zero presentation. `K2SymbolsBrauer:T.2/graded-symbol-signs` uses this interface as follows: Rules out an exterior-algebra or strictly alternating Milnor definition.

### T.2.27. Permutation signs without integral alternation

F is a commutative field; coefficients in every symbol group are integral. In the imported Milnor ring, interchanging adjacent unit entries negates an n-symbol. A permutation π multiplies a symbol by sign(π). A consecutive repeated entry can be replaced by (a,-1); in characteristic two such a consecutive repeat vanishes. The sign rule alone does not make all repeated-entry symbols vanish integrally.

(Weibel-III, III.7.1–7.2(c), p. 61. Correctly interprets the source’s permutation-sign terminology without imposing integral alternation.)

*Needs:* `K2SymbolsBrauer:T.2/graded-quotient-components`, `K2SymbolsBrauer:T.2/graded-degree-two`, `K2SymbolsBrauer:T.2/pairing-identities`, `K2SymbolsBrauer:T.2/real-sign-detector`.

Prove `graded_symbol_signs` by the following argument.

Apply the abstract degree-two identities to p, then transport to the actual Milnor degree-two piece.

Multiply a degree-two identity on the left and right by the products of the remaining entries; concatenation supplies the adjacent interchange and repeated-entry equations.

Decompose a permutation into adjacent transpositions. Parity makes the resulting sign independent of the decomposition.

The real graded sign map sends {-1,…,-1} to t^n, nonzero in every degree. It supplies a counterexample to any inference that repeated entries always vanish.

**Checks.**

- The degree-two equation is {a,a}={a,-1}, not zero.
- The ℝ symbol {-1,-1,-1} has a nonzero polynomial detector.

### Dependencies

This layer uses the preceding layer's stable Steinberg presentation, colimit representatives and centrality, and imports its Milnor ring definition. Its ordinary Bruhat and Coxeter inputs come from the named current upstream owners in the supplier contracts. The graded Quillen construction comes from `K2SymbolsBrauer:T.2:graded-map`; its precise product-symbol equation is described below. Higher-local-field Milnor theory and the residue-symbol layer consume the degree pieces and natural comparison.

## Downstream consumers and comparison with graded Quillen K-theory

The umbrella layer also includes the graded ring homomorphism Kᴹ(F)→Kᑫ(F). Its construction and the degree-three instance are imported from `K2SymbolsBrauer:T.2/graded-map` and `/graded-map-degree-three`, owned by `K2SymbolsBrauer:T.2:graded-map`. The inputs from this document are the actual homogeneous Milnor quotient, its tensor-square comparison, its field maps and its integral skew-commutativity. The companion owns Quillen products, its classical-to-Quillen comparison and the proof that these satisfy the Steinberg relation. A graded map is not an assertion that the map is an isomorphism in every degree.

The required degree-two square is precise. Let κ_F be the companion's specified comparison from classical K₂(F) to Quillen K₂(F), and write [a] for the Quillen K₁ unit class. It must prove

κ_F(s(a,b)) = [a]·[b],

where s(a,b)=[h₁₂(a),h₁₃(b)] with the positive orientation fixed here. Then the degree-two component of the graded map is κ_F∘φ_F, with φ_F the actual constructed Milnor-to-classical map. The generator equation determines this equality by the tensor-square universal property. An abstract isomorphism between the two K₂ groups cannot replace the product-symbol equation.

The companion's degree-three equation must preserve entry order: {a,b,c} maps to [a]·[b]·[c]. Pairwise swaps introduce their graded signs. The real sign example remains a check on integral conventions: a square in odd degree is 2-torsion, and it need not be zero. The finite-field degree-two result leaves degree zero ℤ intact.

### Examples and acceptance checks

A completed development must meet all of the following checks in addition to the named tests above:

- The construction of each quotient and extension provides its actual maps, with both kernel containments and injective coefficient inclusions.
- The degree-two Milnor equivalence evaluates to the tensor symbol p(a,b), and φ_F evaluates to the specified classical commutator s(a,b). Their composites are fixed on generators.
- The lift calculation works in rank at least three, using a third root for the opposite-root case. All finite-rank restrictions remain explicit.
- The ordinary Bruhat dependency is used for the matrix cells and middle monomial. The lifted kernel proof establishes completeness of the Steinberg/toral relations. It does not infer completeness from a check of matrix relations.
- The infinite-field detector retains p(-1,-1) over ℝ. In its lifted monomial group qᵢ⁴ can be nontrivial; an involutive Weyl representative or an extra fourth-power relation fails this check.
- The finite branch proves P₂(F₂)=P₂(F₃)=P₂(F₄)=0 before the all-field Matsumoto equivalence. No finite-rank universality is asserted for these cases.
- Naturality is equality of the specified maps on every symbol. No injectivity under an arbitrary extension of fields follows from naturality alone.
- The graded comparison satisfies the precise product-symbol square, including its sign, and its degree-three generator equation.

The six atlas landmarks are Steinberg pairings, the degree-two symbol presentation, the homogeneous Steinberg ideal, lifted Bruhat reduction, Matsumoto's extension construction and Matsumoto's isomorphism.

## References and source conventions

Use the freely readable sources below. The pagination conventions distinguish printed pages from PDF pages. All mathematical statements and proof plans in this document are expressed in our own words.

[Weibel-III]: [Charles A. Weibel, *The K-book*, author chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Chapter pages and this chapter PDF's pages coincide. Relevant locations are III.5.10–5.10.5, pp. 42–44; Exercises III.5.8–5.9, p. 46; III.6.1–6.1.1, p. 48; III.6.2.1, p. 49; III.7.1–7.2(c), p. 61. III.6.3, p. 51 is used only as a witness distinguishing a symbol from its inverse.

[Matsumoto-1969]: [Hideya Matsumoto, *Sur les sous-groupes arithmétiques des groupes semi-simples déployés*, Ann. Sci. ENS (4), 2 (1969), pp. 1–62](https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf). The scan has a cover page: PDF page is printed page plus one. The relevant statements are §5, Lemmas 5.3–5.6 and Proposition 5.7, pp. 24–29, Theorem 5.10 and Corollary 5.11, pp. 30–31; §6, Theorem 6.3 and Lemmas 6.5–6.11, pp. 34–43; §7, Lemmas 7.1–7.2 and the proof of Lemma 6.8, pp. 43–47. §9's opening functorial observations, p. 50, supply a symbol-level naturality check. The standing hypothesis from printed p. 23 is that the field is infinite. The finite-field proof here does not extend that hypothesis by assertion.

[Steinberg-1967]: [Robert Steinberg, *Lectures on Chevalley Groups*, Yale notes (1967), public scan](https://www.math.utah.edu/~ptrapa/math-library/steinberg/steinberg-yale-notes.pdf). In the cited interval PDF pagination is printed pagination plus seven. The main source is §6, Theorem 8 and Lemmas 36–40, printed pp. 66–72. Theorem 9 on p. 72 is the finite-field conclusion. §7, Theorem 10 is on printed p. 78 (PDF p. 85). Its proof steps (1)–(9), printed pp. 79–82 (PDF pp. 86–89), and Corollary 1 on p. 82 supply the root-lifting argument after the constructed extension is proved exact. The field-size restriction holds on the infinite-field branch. Its universality theorem is not a premise for this layer.

[Rehmann-2007]: [Ulf Rehmann, notes in collaboration with Hinda Hamraoui, *Linear Algebraic Groups and K-Theory*, ICTP lectures (2007)](https://www.math.uni-bielefeld.de/~rehmann/Publ/trieste_notes.pdf). The author notes, §1, pp. 1–9, provide a supplementary convention check. They are not used to bypass the extension construction.

Three source discrepancies were checked in the specified versions:

1. In Rehmann's displayed six-cell SL₃ decomposition, p. 7, the cell for the transposition (12) appears twice and the cell for (13) is missing. Use one representative for each of the six permutations, with w₁₃ replacing the repeated entry. This does not supply any extra mathematical dependency.
2. Weibel's Exercise III.5.9, p. 46, gives the inverse-defect word for the symbol under the commutator convention on p. 1 and symbol convention on p. 42. The chosen positive-overlap commutator instead equals h(a)h(b)h(ab)⁻¹. Indeed diagonal conjugation gives hᵢₖ(b)hᵢⱼ(a)hᵢₖ(b)⁻¹=hᵢⱼ(ab)hᵢⱼ(b)⁻¹, whose inverse commutator is the positive defect. Matsumoto's Lemma 5.4(c), p. 26, agrees with the +1 overlap. Equivalently the positive defect is h(ab)h(a)⁻¹h(b)⁻¹, with the inverse factors in this order. The discrepancy need not disappear by 2-torsion: the t-adic pairing on ℚ(t) takes the symbol (t,2) to 2, which differs from 1/2 (Weibel III.6.3, p. 51).

3. Matsumoto’s Lemma 5.6, printed p. 28 (PDF p. 29), repeats the condition label (S1) where (S2) is intended. The bilinear hypotheses imply the cocycle identity, normalization/inversion and the Steinberg condition, and the following definition lists (S1), (S2), (S3). This is a label misprint; the intended mathematics is unchanged. The published scan and Numdam record were checked, and targeted errata searches found no correction.

The formulas in the targets use these corrections. No claim is made that any discrepancy is new. The author material and the Bielefeld preprint catalogue contained no correction for the first. The advertised Weibel errata PDF could not be retrieved, so the status of a published correction for the second remains undetermined.

## Review and remaining supplier work

This independent review accepts the complete target-level pass. Coverage remains **planned**, with three recorded obligations: the predecessor’s stable finite-representative and centrality arguments (`G-T2-stable-imports`), the companion’s exact Quillen product-symbol square (`G-T2-product-symbol`), and the requested ordinary Bruhat/root-coordinate and minimal-parabolic-coset refinements (`G-T2-upstream-refinements`). The current upstream owners are retained. These interfaces must be supplied before this layer is declared closed. No declaration here is claimed to be formalized.
