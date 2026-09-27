# Logic, definability, valued fields and motivic integration

## Scope and conventions

This document specifies the polynomial comparison and finite-witness component of LD.4. It connects the existing Diophantine library to the existing multivariate-polynomial library and gives a normal form for future arithmetic interpretation and computability interfaces. The remaining targets of LD.0–LD.6 are stated below as concrete work; no layer is declared complete.

Use the native types `Poly`, `Dioph` and `MvPolynomial`. A native `Poly α` is an integer-valued polynomial function on natural assignments indexed by α. The variable type can be empty or infinite, while each polynomial depends on finitely many coordinates. Coefficients are integers; assignments in this component are natural numbers. In particular, subtraction is evaluated in the integers.

Write Tα for the forward ring map and Eα for the resulting ring equivalence. Input variables occupy the left summand of α⊕β; existential witnesses occupy the right. Renaming variables is covariant on polynomials and precomposes assignments. Witness compression fixes the left summand pointwise. The mathematical inverse Eα⁻¹ uses classical choice and carries no executable extraction guarantee.

Suggested home: `TauCeti/NumberTheory/Diophantine/PolynomialBridge`. All declarations retain implementation status unchecked. The suggested signatures cover exactly this component.

## What the pinned libraries supply

Mathlib already defines the Diophantine predicates and proves their closure operations and Diophantine exponentiation. Its polynomial functions use a separate extensional type, and its pinned source explicitly identifies the connection to multivariate polynomials as missing. The current component supplies that interface; it preserves the existing ring, predicate and exponentiation theorem.

The broader roadmap also consumes existing first-order syntax and semantics, definable sets, elementary embeddings, ultraproducts and Łoś’s theorem. The accepted library audit identifies those foundations as existing work. None is reconstructed here. Valued-field languages and relative elimination still require their own precise interfaces.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following statements were read at the pin.

| Declaration | Contract used |
| --- | --- |
| [Poly](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Native subtype of natural-assignment-to-integer functions satisfying IsPoly; its native commutative ring is used unchanged. |
| [Poly.ext](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Pointwise equality of native polynomial functions implies equality. |
| [Poly.proj](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Coordinate projection with its natural value cast to integers. |
| [Poly.const](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Constant integer-valued native polynomial function. |
| [Poly.proj_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Evaluation of a coordinate projection. |
| [Poly.const_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Evaluation of an integer constant. |
| [Poly.add_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Addition of native polynomials evaluates pointwise. |
| [Poly.sub_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Subtraction evaluates in the integers, without natural truncated subtraction. |
| [Poly.mul_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Multiplication evaluates pointwise. |
| [Poly.induction](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Induction into propositions from projections, integer constants, subtraction and multiplication. |
| [Poly.map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Rename variables of a native polynomial function by precomposition on assignments. |
| [Poly.map_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | The evaluation identity for Poly.map, valid without injectivity of the variable map. |
| [Dioph](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Native Diophantine-set predicate with an arbitrary witness type and a native Poly in input-plus-witness variables. |
| [Dioph.DiophFn](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Native graph-based notion of Diophantine function; retained, not reconstructed. |
| [Dioph.pow_dioph](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean) | Diophantine exponentiation already follows from the native Pell development; this is not the entire MRDP theorem. |
| [MvPolynomial.eval₂Hom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Eval.lean) | The universal evaluation ring homomorphism for a coefficient ring map and chosen variable images. |
| [MvPolynomial.eval₂Hom_C](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Eval.lean) | Evaluation of a constant under the universal ring map. |
| [MvPolynomial.eval₂Hom_X'](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Eval.lean) | Evaluation of a variable under the universal ring map. |
| [MvPolynomial.induction_on](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean) | Polynomial induction using constants, addition and multiplication by a variable. |
| [MvPolynomial.funext_set](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Funext.lean) | Equality of polynomials over an integral domain from equality on a Cartesian box with every side infinite; specialize to the natural-number image in the integers. |
| [Nat.cast_injective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/CharZero/Defs.lean) | Injectivity of the natural cast into a characteristic-zero target. |
| [Set.infinite_range_of_injective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Set/Finite/Basic.lean) | An injection from an infinite type has infinite image. |
| [Int.castRingHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Int/Cast/Lemmas.lean) | The canonical ring homomorphism from integers into a ring. |
| [RingEquiv.ofBijective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Equiv.lean) | Bundle a bijective native ring map as a ring equivalence, using classical inverse choice. |
| [MvPolynomial.rename](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Rename.lean) | Native variable-renaming algebra homomorphism. |
| [MvPolynomial.rename_rename](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Rename.lean) | Composition of native polynomial renamings. |
| [MvPolynomial.eval_rename](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Rename.lean) | Evaluation after renaming is evaluation after precomposition of the assignment. |
| [MvPolynomial.exists_finset_rename](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Rename.lean) | A polynomial factors through a finite subset of its full variable index type. |
| [Finset.toRight](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finset/Sum.lean) | Extract the right-summand elements of a finite set of sum variables. |
| [Finset.mem_toRight](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Finset/Sum.lean) | Membership in the extracted finite set is equivalent to right-summand membership in the original set. |
| [Fintype.equivFin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Fintype/EquivFin.lean) | Classical enumeration of a finite type by Fin of its cardinality. |
| [Function.extend](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Function/Basic.lean) | Extend a function along a map, using an explicit default function outside its image. |
| [Function.Injective.extend_apply](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Function/Basic.lean) | An extension along an injection takes the prescribed value at every image point. |

## LD.4 — Polynomial comparison and finite witnesses

The construction has two independent ingredients. First, evaluation gives a ring map from integer polynomial syntax to native polynomial functions. Native constructor induction proves surjectivity, while polynomial extensionality on the infinite natural-number box proves injectivity. Second, finite polynomial support lets us enumerate only the witnesses. Combining these ingredients yields a finite-witness normal form without a finite input-type assumption.

The [public Hilbert10 work by Cameron Freer](https://github.com/cameronfreer/hilbert10/tree/25b42fcd6c6c5af710c514638a6fcb4e22d00a30) supplies the forward-map and finite-witness proof route. Its finite-input theorem motivates the more general statement here, whose proof compresses witnesses directly. [Mathlib PR #42203](https://github.com/leanprover-community/mathlib4/pull/42203) determines the shape and semiring generality of the support-compression lemmas. Those statements are absent from the required pin; build them in Tau Ceti with that interface and replace them by imports when the baseline provides them. This specification imports no external implementation.

### Integer polynomials as native polynomial functions

**Declaration:** `TauCeti.Diophantine.toDiophPoly`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly`.

For every type α, construct the ring homomorphism Tα from MvPolynomial α ℤ to Poly α which sends each integer constant c to Poly.const(c) and each variable Xᵢ to Poly.proj(i). Its underlying function evaluates the polynomial on natural assignments after casting them to integers.

**Construction or proof.**

1. Use the existing commutative ring on Poly α; the integer cast there is its constant constructor. Apply MvPolynomial.eval₂Hom to Int.castRingHom and Poly.proj. This supplies the ring-map laws without a second ring structure.
2. The separate constant, variable and evaluation nodes below identify this universal map with the source’s intended polynomial function. No polynomial or Diophantine-set carrier is replaced.

**Dependencies.** `mathlib:Poly`, `mathlib:Poly.proj`, `mathlib:Poly.const`, `mathlib:MvPolynomial.eval₂Hom`, `mathlib:Int.castRingHom`.

**Consumers and API.**

- `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-surjective`: Transfers constructor induction on native polynomial functions to integer polynomial syntax.
- `LogicAndDefinabilityInNumberTheory:LD.4/dioph-finite-mvpolynomial`: Builds the native Dioph witness from a finite multivariate-polynomial presentation.
- `Poonen Definition 1, p.2`: Reconciles the standard polynomial presentation with the native library predicate.

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.Diophantine.toDiophPoly_C` | simp | Tα(C c) = Poly.const(c) for every integer c. |
| `TauCeti.Diophantine.toDiophPoly_X` | simp | Tα(Xᵢ) = Poly.proj(i). |
| `TauCeti.Diophantine.toDiophPoly_apply` | compatibility | For p and a natural assignment x, Tα(p)(x) = p evaluated at the integer casts of x. |
| `TauCeti.Diophantine.toDiophPoly_add` | structure | Tα(p+q)=Tα(p)+Tα(q). |
| `TauCeti.Diophantine.toDiophPoly_mul` | structure | Tα(pq)=Tα(p)Tα(q). |
| `TauCeti.Diophantine.toDiophPoly_sub` | structure | Tα(p−q)=Tα(p)−Tα(q), using integer subtraction. |
| `TauCeti.Diophantine.toDiophPoly_ext` | extensionality | If Tα(p) and Tα(q) agree at every natural assignment, they are equal as native Poly elements. |

**Unit tests.**

- `TauCeti.Diophantine.constant_negative` (degenerate): With no variables, the image of constant −3 evaluates to −3 on the unique assignment.
- `TauCeti.Diophantine.two_coordinates` (value): At (1,3), the image of X₀−2X₁ has value −5, not a truncated natural difference.
- `TauCeti.Diophantine.native_eval` (compatibility): Evaluation agrees with native MvPolynomial.eval at every natural assignment cast to integers.
- `TauCeti.Diophantine.distinct_coordinates` (non-example): The images of X₀ and X₁ in two variables differ: assignment (0,1) distinguishes them.

**Acceptance.** Negative coefficients remain integers. The construction exists when α is empty.

**Source.** Hilbert10 polynomial bridge, toDiophPoly and its evaluation lemmas. Mathematical comparison with the existing native types; declaration shape follows the cited source.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Constant-polynomial comparison

**Declaration:** `TauCeti.Diophantine.toDiophPoly_C`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-constant`.

For every integer c, Tα(C c) is Poly.const(c).

**Construction or proof.**

1. Apply MvPolynomial.eval₂Hom_C.
2. The native AddGroupWithOne instance on Poly uses Poly.const for integer casts; alternatively compare the two functions with Poly.ext and Poly.const_apply.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly`, `mathlib:MvPolynomial.eval₂Hom_C`, `mathlib:Poly.ext`, `mathlib:Poly.const_apply`.

**Acceptance.** Test c=−3,0,1.

**Source.** Hilbert10 polynomial bridge, toDiophPoly and its evaluation lemmas. Mathematical comparison with the existing native types; declaration shape follows the cited source.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Coordinate-polynomial comparison

**Declaration:** `TauCeti.Diophantine.toDiophPoly_X`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-variable`.

For each i in α, Tα(Xᵢ) is Poly.proj(i).

**Construction or proof.**

1. Apply MvPolynomial.eval₂Hom_X' to the chosen variable image.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly`, `mathlib:MvPolynomial.eval₂Hom_X'`.

**Acceptance.** Different coordinates remain distinct when distinguishable assignments exist.

**Source.** Hilbert10 polynomial bridge, toDiophPoly and its evaluation lemmas. Mathematical comparison with the existing native types; declaration shape follows the cited source.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Evaluation on natural assignments

**Declaration:** `TauCeti.Diophantine.toDiophPoly_apply`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-eval`.

For p in MvPolynomial α ℤ and x:α→ℕ, Tα(p)(x) = eval(cast∘x,p), where cast is the natural embedding into ℤ.

**Construction or proof.**

1. Induct on p by MvPolynomial.induction_on. The constant case uses to-dioph-poly-constant and Poly.const_apply.
2. For addition use the ring-map law and Poly.add_apply. For multiplication by Xᵢ use the ring-map law, to-dioph-poly-variable, Poly.mul_apply and Poly.proj_apply. Each step matches native polynomial evaluation.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-constant`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-variable`, `mathlib:MvPolynomial.induction_on`, `mathlib:Poly.const_apply`, `mathlib:Poly.proj_apply`, `mathlib:Poly.add_apply`, `mathlib:Poly.mul_apply`.

**Acceptance.** Negative coefficients and products give their integer values.

**Source.** Hilbert10 polynomial bridge, toDiophPoly and its evaluation lemmas. Mathematical comparison with the existing native types; declaration shape follows the cited source.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Every native polynomial has integer polynomial syntax

**Declaration:** `TauCeti.Diophantine.toDiophPoly_surjective`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-surjective`.

The map Tα is surjective for every type α.

**Construction or proof.**

1. Apply Poly.induction with the proposition that a preimage under Tα exists. Projection and constant cases use Xᵢ and C c and the separate comparison nodes.
2. For subtraction and multiplication, take the corresponding operation on the two existing preimages. The ring-map laws prove the required equality.
3. The induction is into a proposition, so it is permitted by native Poly.induction. This does not construct a computable extraction procedure from an extensional function.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-constant`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-variable`, `mathlib:Poly.induction`.

**Acceptance.** No finite input-type hypothesis. No executable syntax recovery is claimed.

**Source.** Hilbert10 polynomial bridge, exists_mvPolynomial and its constructor induction. The source’s existence proof, repackaged as surjectivity of the native ring map.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Polynomial identity from natural assignments

**Declaration:** `TauCeti.Diophantine.toDiophPoly_injective`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-injective`.

The map Tα is injective for every type α.

**Construction or proof.**

1. Let Tα(p)=Tα(q). By to-dioph-poly-eval their evaluations agree on all tuples of natural numbers.
2. For every variable use the subset of ℤ which is the image of the natural embedding. Nat.cast_injective and Set.infinite_range_of_injective prove each side of this Cartesian box is infinite.
3. For a tuple in this box, choose a natural preimage in every coordinate and apply the assumed equality. MvPolynomial.funext_set over the integral domain ℤ now gives p=q. The empty index type is covered by the same statement.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-eval`, `mathlib:MvPolynomial.funext_set`, `mathlib:Nat.cast_injective`, `mathlib:Set.infinite_range_of_injective`.

**Acceptance.** X(X−1) is distinguished from zero by assignment 2, even though both vanish at 0 and 1.

**Source.** Multivariate polynomial extensionality on infinite boxes, funext_set, lines 51–74. Specialization of native polynomial extensionality to the infinite natural-number box in the integers; the specialized injectivity statement is new.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Polynomial ring equivalence

**Declaration:** `TauCeti.Diophantine.mvPolynomialEquiv`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/poly-mvpolynomial-equiv`.

For every α, bundle Tα as a ring equivalence Eα: MvPolynomial α ℤ ≃ Poly α. Its inverse sends a native polynomial function to the unique multivariate integer polynomial with the same values on every natural assignment. The inverse is classical and carries no computability assertion.

**Construction or proof.**

1. Combine the separately proved injectivity and surjectivity into bijectivity.
2. Apply RingEquiv.ofBijective. Record that the resulting forward ring map is exactly Tα. Its inverse laws and algebraic compatibility are inherited from the ring equivalence.
3. Evaluate Eα(Eα⁻¹(f))=f and apply to-dioph-poly-eval to obtain the inverse evaluation law. Uniqueness follows from injectivity, not from a chosen syntactic representative.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-surjective`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-injective`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-eval`, `mathlib:RingEquiv.ofBijective`.

**Consumers and API.**

- `LogicAndDefinabilityInNumberTheory:LD.4/poly-equiv-rename`: Transports existing variable maps to native polynomial renaming.
- `LogicAndDefinabilityInNumberTheory:LD.4/dioph-finite-mvpolynomial`: Exposes finite polynomial support while retaining the native Dioph carrier.
- `LogicAndDefinabilityInNumberTheory:LD.4`: Makes the native exponentiation and closure results usable by future polynomial coding interfaces.

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.Diophantine.mvPolynomialEquiv_toRingHom` | compatibility | The forward ring map of Eα is Tα. |
| `TauCeti.Diophantine.mvPolynomialEquiv_symm_apply` | compatibility | Evaluating Eα⁻¹(f) at the integer casts of x gives f(x). |
| `TauCeti.Diophantine.mvPolynomialEquiv_symm_const` | simp | Eα⁻¹(Poly.const(c))=C c for every integer c. |
| `TauCeti.Diophantine.mvPolynomialEquiv_symm_proj` | simp | Eα⁻¹(Poly.proj(i))=Xᵢ. |
| `TauCeti.Diophantine.mvPolynomialEquiv_symm_add` | structure | Eα⁻¹(f+g)=Eα⁻¹(f)+Eα⁻¹(g). |
| `TauCeti.Diophantine.mvPolynomialEquiv_symm_mul` | structure | Eα⁻¹(fg)=Eα⁻¹(f)Eα⁻¹(g). |
| `TauCeti.Diophantine.mvPolynomialEquiv_left_inv` | equivalence | Eα⁻¹(Eα(p))=p. |
| `TauCeti.Diophantine.mvPolynomialEquiv_right_inv` | equivalence | Eα(Eα⁻¹(f))=f. |
| `TauCeti.Diophantine.mvPolynomialEquiv_rename` | functoriality | For any map h:α→β, Eβ(rename(h,p))=Poly.map(h,Eα(p)); injectivity of h is not required. |

**Unit tests.**

- `TauCeti.Diophantine.empty_inverse` (degenerate): With no variables, E⁻¹(Poly.const(−7)) is C(−7).
- `TauCeti.Diophantine.product_inverse` (value): In two variables, E⁻¹(Poly.proj(0)·Poly.proj(1)) is X₀X₁.
- `TauCeti.Diophantine.inverse_native_eval` (compatibility): For every native f and natural assignment x, eval(cast∘x,E⁻¹(f))=f(x).
- `TauCeti.Diophantine.boolean_grid_insufficient` (non-example): E(X₀(X₀−1)) is nonzero: its value at 2 is 2. Sampling only a Boolean grid is insufficient.

**Acceptance.** Forward and inverse preserve integer constants and multiplication. The inverse is uniquely determined mathematically even though constructed by classical choice.

**Source.** Diophantine functions and Matiyasevic’s theorem: native Poly and Dioph, Poly, Poly.induction and the comparison TODO, lines 48–51,93,197–204. Completes the missing native polynomial comparison using the separately listed infinite-box theorem; the ring equivalence is an elementary consequence, not an existing pinned declaration.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Inverse evaluation comparison

**Declaration:** `TauCeti.Diophantine.mvPolynomialEquiv_symm_apply`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/poly-equiv-inverse-eval`.

For every native polynomial f in Poly α and natural assignment x, evaluating Eα⁻¹(f) at the integer casts of x gives f(x).

**Construction or proof.**

1. The defining forward map of Eα is Tα. Apply to-dioph-poly-eval to Eα⁻¹(f).
2. The ring equivalence identity Eα(Eα⁻¹(f))=f identifies the resulting function value with f(x).

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/poly-mvpolynomial-equiv`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-eval`.

**Acceptance.** This remains valid for an empty variable type and negative constants.

**Source.** Diophantine functions and Matiyasevic’s theorem: native Poly and Dioph, Poly and Poly.ext, lines 93–107, together with the polynomial-comparison TODO. Elementary inverse law of the new equivalence. Promoted from its API because the finite-witness theorem consumes it.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Renaming compatibility

**Declaration:** `TauCeti.Diophantine.mvPolynomialEquiv_rename`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/poly-equiv-rename`.

For any map h:α→β and polynomial p, Eβ(rename(h,p)) = Poly.map(h,Eα(p)). The map h can identify distinct variables.

**Construction or proof.**

1. Compare values at every β-indexed natural assignment using Poly.ext.
2. The equivalence’s forward map is T. Apply to-dioph-poly-eval on both sides, MvPolynomial.eval_rename on the left and Poly.map_apply on the right. Both values are eval(cast∘x∘h,p).

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/poly-mvpolynomial-equiv`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-eval`, `mathlib:Poly.ext`, `mathlib:Poly.map_apply`, `mathlib:MvPolynomial.eval_rename`.

**Acceptance.** Collapsing both variables of X₀−X₁ to the same coordinate produces zero; this naturality identity does not assert injectivity of renaming.

**Source.** Diophantine functions and Matiyasevic’s theorem: native Poly and Dioph, Poly.map and map_apply, lines 226–234. Comparison of native reindexing with the new ring equivalence.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Finite witness support with fixed inputs

**Declaration:** `TauCeti.Diophantine.exists_finset_right_rename`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/finite-right-support`.

For a commutative semiring R and p in MvPolynomial (α⊕β) R, there exist a finite subset t of β and q in MvPolynomial (α⊕t) R such that p=rename(idα⊕inclusion,q). Every input variable is left unchanged.

**Construction or proof.**

1. Apply MvPolynomial.exists_finset_rename to p, obtaining a finite set s of sum variables and a polynomial r on s.
2. Put t=Finset.toRight(s). Map each element of s to α⊕t: an input inl(a) goes to inl(a); a witness inr(b) goes to inr(b), with its membership in t supplied by Finset.mem_toRight.
3. Rename r by this map to form q. The composite with idα⊕inclusion is the original inclusion of s, so MvPolynomial.rename_rename gives p=rename(idα⊕inclusion,q).

**Dependencies.** `mathlib:MvPolynomial.exists_finset_rename`, `mathlib:Finset.toRight`, `mathlib:Finset.mem_toRight`, `mathlib:MvPolynomial.rename`, `mathlib:MvPolynomial.rename_rename`.

**Acceptance.** No domain or characteristic assumption on R. No finite input-type assumption. A polynomial involving only inputs admits t empty.

**Source.** Compact only the right summand of a sum of polynomial variables, PR body, exists_finset_right_rename and proof route. Same statement shape as the open Mathlib proposal; absent from the required pin.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Finite witness enumeration

**Declaration:** `TauCeti.Diophantine.exists_fin_right_rename`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/finite-right-rename`.

For a commutative semiring R and p in MvPolynomial (α⊕β) R, there exist m∈ℕ, an injective map h:Fin m→β, and q in MvPolynomial (α⊕Fin m) R with p=rename(idα⊕h,q).

**Construction or proof.**

1. Apply finite-right-support to obtain t and its polynomial q₀.
2. Choose e:t≃Fin(card t) using Fintype.equivFin. Set h=inclusion∘e⁻¹ and rename q₀ by idα⊕e.
3. The chosen h is injective because e⁻¹ and subtype inclusion are injective. Use MvPolynomial.rename_rename and the inverse laws of e to verify the displayed identity.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/finite-right-support`, `mathlib:Fintype.equivFin`, `mathlib:MvPolynomial.rename_rename`.

**Acceptance.** If β is empty the witness block has size zero. Inputs are not silently permuted when witnesses are numbered.

**Source.** Compact only the right summand of a sum of polynomial variables, PR body, exists_fin_right_rename and finite enumeration. Follows the proposed Mathlib shape and generality at the fixed baseline.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Preservation of existential natural roots

**Declaration:** `TauCeti.Diophantine.exists_nat_zero_rename_right`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/right-rename-solutions`.

Let h:Fin m→β be injective, q∈ℤ[α⊕Fin m], and x:α→ℕ. There exists y:β→ℕ with rename(idα⊕h,q)(x,y)=0 if and only if there exists z:Fin m→ℕ with q(x,z)=0. All evaluations cast naturals into integers.

**Construction or proof.**

1. Given y, restrict it to z=y∘h. MvPolynomial.eval_rename proves the evaluations agree.
2. Given z, use Function.extend(h,z,0) as a β-assignment. Function.Injective.extend_apply gives y(h(j))=z(j), so the same evaluation identity gives a root of the renamed polynomial.
3. The default zero supplies all unused witnesses, including when m=0. No surjectivity of h is needed.

**Dependencies.** `mathlib:MvPolynomial.eval_rename`, `mathlib:Function.extend`, `mathlib:Function.Injective.extend_apply`.

**Acceptance.** For q(u,v)=u−v−1, collapsing both witnesses makes the equation unsatisfiable although q has natural roots; the injectivity hypothesis cannot be dropped.

**Source.** Hilbert10 finite Diophantine normal form, dioph_iff_exists_fin_mvPolynomial, key equality and witness extension. Extracts the two solution-transport directions as a reusable lemma; does not add a new representation predicate.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

### Finite Diophantine normal form

**Declaration:** `TauCeti.Diophantine.dioph_iff_exists_fin_mvPolynomial`. **Node:** `LogicAndDefinabilityInNumberTheory:LD.4/dioph-finite-mvpolynomial`.

For every type α and S⊆(α→ℕ), native Dioph(S) holds exactly when there are m∈ℕ and p∈MvPolynomial (α⊕Fin m) ℤ such that, for every input x, x∈S if and only if there exists y:Fin m→ℕ with eval(cast∘Sum.elim(x,y),p)=0. This holds without assuming α finite.

**Construction or proof.**

1. Unpack native Dioph(S) as a polynomial function f on α⊕β and its existential-root characterization. Apply the inverse of poly-mvpolynomial-equiv to obtain integer polynomial syntax with exactly the same values.
2. Apply finite-right-rename to that polynomial. Then right-rename-solutions replaces the arbitrary β-witness block by Fin m while fixing x; this proves the forward implication.
3. For the reverse implication in universe zero use witness type Fin m and native polynomial T(p). Apply to-dioph-poly-eval. For an arbitrary input universe use the witness type ULift(Fin m) at that universe and rename p along idα⊕ULift.up before applying T. Lifting or lowering assignments gives the same existential condition by MvPolynomial.eval_rename.
4. This is a mathematical existential normal form, not a computable procedure for recovering p or m from a proof of native Dioph. Computable encodings and the MRDP simulation remain separate work.

**Dependencies.** `LogicAndDefinabilityInNumberTheory:LD.4/poly-mvpolynomial-equiv`, `LogicAndDefinabilityInNumberTheory:LD.4/poly-equiv-inverse-eval`, `LogicAndDefinabilityInNumberTheory:LD.4/to-dioph-poly-eval`, `LogicAndDefinabilityInNumberTheory:LD.4/finite-right-rename`, `LogicAndDefinabilityInNumberTheory:LD.4/right-rename-solutions`, `mathlib:Dioph`, `mathlib:MvPolynomial.eval_rename`.

**Acceptance.** Even natural inputs are represented by X−2Y. A nonzero constant polynomial has no root, including with zero inputs and witnesses. The statement specializes both to finite tuples and to α=ℕ. Zero witness variables means a polynomial condition, not automatic truth.

**Source.** Hilbert10 finite Diophantine normal form, dioph_iff_exists_fin_mvPolynomial and dioph_iff_exists_finite_mvPolynomial. Generalizes the cited finite-input theorem by applying witness compression before any input reindexing; the proof does not require a finite input type.; Undecidability in number theory, Definition 1 and footnote 4, author-copy p.2. Motivation: arithmetic relations represented by one integer polynomial and finitely many existential witnesses. The source states its definition over integers; this component retains Mathlib’s natural assignment domain and does not identify those domains..

## Acceptance tests for the component

- Negative integer coefficients survive evaluation: X₀−2X₁ at (1,3) equals −5.
- At zero input or witness dimension, the unique empty tuple is still an assignment. The constant 1 equation has no solution; the constant 0 equation does.
- Eα and Eα⁻¹ preserve constants, addition and multiplication and satisfy both inverse identities.
- X(X−1) is a nonzero polynomial function on natural numbers, despite vanishing on the Boolean assignments. Infinite-box extensionality is essential.
- For X−2Y, the existential natural witness condition is precisely evenness of the fixed input. Swapping the roles of input and witness would give a different relation.
- An injective witness renaming preserves existential roots. If two witnesses of U−V−1 are collapsed into one, the renamed polynomial is −1 although the original has root (1,0); injectivity is essential.
- The normal form applies when inputs are indexed by all natural numbers. Only finitely many input coordinates occur in each witnessing polynomial; no finite-cardinality instance on the input type is required.

## Remaining layer targets

Each layer retains its current atlas id. The dependencies below describe its intended mathematical boundary; this component makes no unresolved cross-roadmap request. Any request introduced while constructing those targets must name the precise missing statement and its actual consumers.

### LD.0 — Languages and interpretations

Arithmetic interpretation and valued-language interfaces: Read a complete source for interpretations on definable quotients and a concrete valued-field language. Reuse native Language, ring language, Term, BoundedFormula, Realize, Definable, ultraproducts and Łoś. Specify the sort encoding and semantics bridge for residue and value sorts rather than replanning single-sorted logic. A chosen elementary arithmetic extension and its relationship to the native standard-part interfaces still need exact statements.

**Layer dependencies.** `FoundationsAndLibraryIntegration:LI.0`.

### LD.1 — Valued-field logic

Denef–Pas language and relative elimination: Acquire the exact Pas/Cluckers–Loeser sources and decompose angular components, residue/value sorts, henselian hypotheses and relative elimination. Reuse native algebraic HenselianLocalRing. Separate equicharacteristic-zero theorems from mixed-characteristic transfer with exceptional residue characteristics. No quantifier-elimination theorem is claimed by this component.

**Layer dependencies.** `LogicAndDefinabilityInNumberTheory:LD.0`, `FoundationsAndLibraryIntegration:LI.4`.

### LD.2 — p-adic definable integration

Definable cells and local integration: Read complete cell-decomposition and Igusa/Poincaré rationality proofs. Specify normalized Haar measures, measurability, cell fibers, convergence and coefficient rings. Reconcile local-density measure normalizations with ExponentialSumsAndCircleMethod:ES.3, and give exact input contracts to AnalyticNumberTheory:AN.8. Native measure theory alone is not definable integration.

**Layer dependencies.** `LogicAndDefinabilityInNumberTheory:LD.1`, `FoundationsAndLibraryIntegration:LI.2`.

### LD.3 — Motivic integration and transfer

Constructible motivic functions and transfer: Acquire and decompose a fixed complete Cluckers–Loeser source, including definable subassignments, coefficient localization, integrability, pushforwards, specialization and the residue-characteristic bound. Inspect actual motives and geometric suppliers before requesting missing inputs. Do not identify the Grothendieck ring of varieties, definable sets and mixed motives. No supplier request is invented for a statement not yet specified.

**Layer dependencies.** `LogicAndDefinabilityInNumberTheory:LD.2`, `SchemeAndStackFoundations:SF.1`, `MotivesAndAlgebraicCycles:MC.4`.

### LD.4 — Diophantine definability and undecidability

Computable coding, MRDP and integer transfer: The polynomial comparison is mathematically closed, but its classical inverse supplies no algorithm. Construct and verify a finite effective polynomial coding and evaluation interface against native REPred and ComputablePred. Read the full Davis–Putnam–Robinson/Matiyasevich proof route, reusing native Dioph.pow_dioph. The public Hilbert10 repository is a concrete source lead: its PolyBridge, NormalForm and DiophToRE files were read, but its computation and MRDP spine were not audited or compiled. Coordinate with its author before integrating code; this checkpoint integrates none. State both natural/integer reductions, with four-square witnesses and effective transformations, before claiming integer H10. Keep rational and other-field assertions separate.

**Layer dependencies.** `LogicAndDefinabilityInNumberTheory:LD.0`, `ClassicalArithmeticCompletion:CA.4`.

### LD.5 — Uniform arithmetic applications

Uniform consumer instantiations: Choose actual density/counting, nonarchimedean geometry and algorithmic consumers. For each specify its language, formula, parameters and finite exceptional set, then trace the exact LD.2/LD.3/LD.4 supplier statements. An existential normal form alone gives no uniform algorithm or transfer theorem.

**Layer dependencies.** `LogicAndDefinabilityInNumberTheory:LD.3`, `LogicAndDefinabilityInNumberTheory:LD.4`.

### LD.6 — o-minimality, definable counting and unlikely intersections

o-minimal counting and application inputs: Read complete primary proofs of selected o-minimal structures and cells, the Pila–Wilkie estimate outside the algebraic part, and source-scoped unlikely-intersection applications. Specify independent orbit, uniformization and functional-transcendence inputs. Reuse native height/Northcott material and the owners in DiophantineApproximationAndTranscendence:DT.5 and HeightsRationalPointsAndObstructions:RP.5 after checking exact statements. Do not infer Manin–Mumford or André–Oort from counting alone.

**Layer dependencies.** `LogicAndDefinabilityInNumberTheory:LD.0`, `DiophantineApproximationAndTranscendence:DT.0`, `SchemeAndStackFoundations:SF.0`.

## Planets

LD.4 has two planets: **Diophantine polynomial comparison** and **Finite Diophantine normal form**. The ring equivalence, evaluation and support lemmas remain navigable declarations beneath that component. No planet is added to a layer whose sources and targets have not been decomposed.

## Source register and reading boundaries

- **Bjorn Poonen. [Undecidability in number theory](https://math.mit.edu/~poonen/papers/h10_notices.pdf).** Author-hosted eight-page copy of the Notices AMS 55 (2008), no.3, 344–350 survey; accessed 2026-09-27. Physical/printed author-copy pages 1–3: Definition 1, Example 2, Example 4, Definitions 3 and 5, Theorem 6 and Corollary 7, DPRM theorem and footnote 4, history and deduction of H10. The book proof of MRDP and pages 4–8 were not read. The finite polynomial/witness convention motivates this component; this survey is not asserted to supply a complete MRDP proof.
- **Mario Carneiro and the Mathlib contributors. [Diophantine functions and Matiyasevic’s theorem: native Poly and Dioph](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean).** Pinned source, Apache-2.0, read 2026-09-27. Lines 42–51: the explicit polynomial-comparison TODO; 76–246: native polynomial constructors, ring operations, induction, reindexing and Dioph; 337–347: Diophantine functions and projection; 634–640 and 660–681: existing exponentiation statement and proof context.
- **Cameron Freer. [Hilbert10 polynomial bridge](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/PolyBridge.lean).** Public independent formalization, commit 25b42fcd6c6c5af710c514638a6fcb4e22d00a30, Apache-2.0; read 2026-09-27. Full file: forward ring map, evaluations and polynomial existence by Poly.induction. Its actual namespace is Hilbert10. This packet follows the mathematical design and credits the proof route; no implementation is imported. Bijectivity and a ring equivalence strengthen the file’s existence-only inverse interface.
- **Cameron Freer. [Hilbert10 finite Diophantine normal form](https://github.com/cameronfreer/hilbert10/blob/25b42fcd6c6c5af710c514638a6fcb4e22d00a30/Hilbert10/NormalForm.lean).** Public independent formalization, same pinned commit, Apache-2.0; read 2026-09-27. Full file, including the natural-cast identity, Fin-input normal form, and transport to a finite input type. The checkpoint generalizes its conclusion to an arbitrary input type by compressing witnesses directly; it does not transport inputs through Fin. Full DiophToRE.lean and README status/main-results paragraphs were read as continuation leads, not as pinned-library declarations or independently compiled results.
- **Cameron Freer. [Compact only the right summand of a sum of polynomial variables](https://github.com/leanprover-community/mathlib4/pull/42203).** Open Mathlib pull request #42203; head fc45c15e7908c6f31b0b5efc447b8d8a5800d051, status checked 2026-09-27. Full PR description, including both proposed statements and its finite-support/enumeration proof route. It is absent from the required Mathlib pin, so this packet plans the missing statements with that shape. Its current status is not a prerequisite or a reason to suspend work.
- **The Mathlib contributors. [Multivariate polynomial extensionality on infinite boxes](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Funext.lean).** Pinned source, Apache-2.0; read 2026-09-27. Lines 28–89, including the finite-variable induction and the arbitrary-variable funext_set statement and proof.

Poonen’s survey motivates the arithmetic problem and the natural/integer distinction. Its overview of the DPRM theorem is not a full proof decomposition. Its historically open examples are read with the 2008 date. No error was established in the passages used by this component.

No completeness claim is made for the rest of the source programme. The exact Pas, Cluckers–Loeser, MRDP and o-minimality proof chains named in the remaining targets must be acquired and decomposed before those layers can be closed.
