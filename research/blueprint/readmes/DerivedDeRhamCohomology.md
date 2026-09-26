# Derived de Rham cohomology and its algebraic foundations

This checkpoint constructs a detailed plan for the ordinary differential algebra
that enters the derived de Rham construction, and preserves the seven reviewed
derived nodes already present in the atlas. It keeps all seven layers DD.0–DD.6.
The packet is partial: the ordinary tranche has typed suggested signatures, while
the coherent cotangent, completion, Cartier, crystalline, descent and logarithmic
constructions still have the precise gaps listed below. Nothing here is claimed
to be formalised.

## Objects and conventions

Fix a homomorphism A→B of commutative unital rings. Write Ω¹=Ω_(B/A) for the
existing Kähler differential module and D:B→Ω¹ for its universal derivation.
Write Ωⁿ=∧ⁿ_B Ω¹, including Ω⁰≃B and Ω¹≃Ω_(B/A) through the existing
exterior-power equivalences. The wedge product is the existing graded product in
the exterior algebra. There is no second definition of Kähler differentials,
exterior powers, their graded product, a free module or a cochain complex.

The de Rham differential dₙ:Ωⁿ→Ωⁿ⁺¹ is A-linear. Multiplication by a general
b∈B obeys the Leibniz rule and need not commute with d. For an A-algebra
homomorphism f:B→C, pullback of forms is f-semilinear in the B-action and
A-linear in the base action. Installing a global B-algebra structure on C for
every such f would lose this distinction, especially for endomorphisms; the
prototype retains the semilinear type already used by Tau Ceti on one-forms.

Use cohomological grading. The ordinary complex is concentrated in degrees
0,1,2,…; a simplicial resolution contributes in nonpositive degrees. Uncompleted
derived de Rham uses direct sums along antidiagonals of the resulting second
quadrant object. The Hodge filtration decreases and the conjugate filtration
increases. A Hodge or conjugate grade indexed by i carries a shift [−i] where
specified. The cotangent amplitude of an ordinary lci map is [−1,0]. Derived
exterior and divided powers cannot be replaced by exterior powers of homology.

Uncompleted derived de Rham, Hodge completion and derived p-completion are
distinct objects and operations. In particular, for Q→Q[t,t⁻¹], the uncompleted
derived object is Q, while the ordinary complex has the nonzero class dt/t in
degree one. The inherited characteristic-zero boundary is retained. The owner
roadmap's smooth-comparison target must be implemented with the characteristic
and completion qualifications established by the source, not as an unrestricted
uncompleted comparison. A canonical cohomological Cartier map is also distinct
from a chosen chain-level decomposition obtained from a Frobenius lift.

## Ownership and the baseline

Mathlib is pinned to 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti to
f790474821cf4256814db967cb154e7af3d0c369. Every declaration in the packet's
baseline list was read in the source tree. The reviewed library-coverage file
has no direct DD entries; AUDIT-36 remains pending review. Its detailed DD
records were read as leads and did not substitute for declaration checks.

The ordinary construction uses Mathlib's Kähler presentation, exterior-power
presentation and graded algebra, scalar-restriction presentation, free-module
linear combinations, quotient lifts and nonnegative cochain complexes. Tau
Ceti's semilinear Kähler map already supplies the one-form pullback. The
polynomial Kähler basis and derivative calculations support the nonzero-variable
tests. These are inputs, not work planned again.

The accepted RS-01 keeps this roadmap and every layer. EnhancedDerivedSheaves
owns the enhanced category, coherent Kan extensions and the animation prefix.
The exact existing enhanced-tensor and Kan-extension nodes are imported. The
animation stage has an explicit request for polynomial resolutions, coherent
comparison, sifted extensions and derived tensor pushouts. DD.0 and DD.1 own
the full cotangent and generic completion developments; those are not moved
back into EDS. The EDS cotangent export is a consumer, not a prerequisite that
could create a cycle.

CrystallineCohomology owns PD envelopes, crystals and the early log-algebra
prefix; PrismaticCohomology owns prisms and prismatic comparisons. Habiro owns
the global q-deformed construction. Existing algebraic de Rham and Jacobian
roadmaps keep their geometric applications. The ordinary algebra planned here
supplies the generic differential algebra requested by MotivicEtaleKTheory
M.5d; none of its Milnor K-theory constructions is an input here. Its arbitrary
characteristic-p field Cartier request remains unsatisfied by the inherited
polynomial statement alone.

## The direct-symbol proof

The key presentation takes the free A-module on pairs (c,v), with c∈B and
v a finite n-tuple of elements of B. The symbol [c;v] represents
c Dv₁∧…∧Dvₙ. Additivity and A-linearity in c are imposed, followed by
slot additivity, the slot Leibniz relation, vanishing of base constants, and
strict alternation. All B coefficients belong inside the generator index c;
assuming that the exact one-forms alone span over A would be incorrect.

The presentation proof has two directions. Evaluation kills every displayed
relation. Conversely, the Kähler relations are imposed in each slot, followed
by the existing exterior-power universal property and restriction of scalars.
Strict alternation on arbitrary one-forms follows by expansion from diagonal
generator relations: applying a repeated-slot relation to x+y and subtracting
the x and y diagonal relations yields antisymmetry of the cross terms. This
works in characteristic two and does not use division by 2. The proof must
construct both quotient comparisons, not merely verify one kernel inclusion.

On the free module, differentiation sends [c;v] to Dc∧Dv₁∧…∧Dvₙ.
For a product in a slot, the universal derivation produces two main terms and
two cross terms. The main terms match the two coefficient-weighted symbols;
the cross terms cancel by swapping the leading slot with the affected slot.
This establishes descent. Applying the descended map twice inserts D1=0.
Expanding D(ce) on the product of two elementary forms proves graded Leibniz,
with sign (−1)^m when a one-form passes the m slots of the first factor.

The construction agrees with the argument in Stacks Section 10.132 and with
the direct-presentation strategy in Joël Riou's open Mathlib PR 18551. The
complete proposed file at the recorded head was read. Its unmerged presentation
combinators and de Rham operator are not declared to exist at the pins and are
not imported. The blueprint uses the existing carriers and records the new
presentation proof explicitly. Stacks Lemma 10.13.4 gives an alternative
tensor-kernel route but omits its proof; reading that statement does not close
the omitted proof.

## Reading boundary and author corrections

Bhatt's arXiv:1204.6560v1 PDF was read on printed pages 3–8, including the
proofs there; pages 5–7 were also inspected visually. This verifies the inherited
definitions, conjugate filtration, base-change/Künneth statement, polynomial
Cartier route and completion boundary within that range. It does not certify
the cited Quillen, Illusie, Lurie or Deligne–Illusie inputs, or the later
crystalline and logarithmic sections. The old decomposition's BMS1 reading
entry is inherited provenance and was not re-read in this checkpoint.

The complete author errata for both volumes of Illusie and the two-page
Berthelot–Ogus 2013 erratum were read and hashed. Illusie I corrects the
normalization diagram through degenerate quotients and corrects scalar
extension, including derived scalar extension. Illusie II deletes the false
general differential-extension assertion and the specified crystalline
arguments/formulas. Extending a differential to an arbitrary quotient of Ω¹
requires kernel stability; the universal Kähler construction here does not
license omitting that condition. The second-quadrant totalization warning
also remains binding.

Berthelot–Ogus corrected B2.1 gives an isomorphism in the derived category of
bounded-above towers. Corrected B2.1a gives an actual surjective
quasi-isomorphism from projective terms under the degreewise-surjective
transition-map hypothesis. The replacement proof uses a flasque resolution
for the general tower and adds an acyclic complex in the surjective case.
Neither statement proves unrestricted exchanges of derived inverse limit and
ordinary completion. The original books have not been fully read here; the
author errata are imported requirements, not a fresh certification of the books.

## Declaration inventory

Each declaration below gives its exact target, proof route and prerequisites.
API entries are named mathematical contracts; the accompanying tests include
boundary and non-example calculations. The seven inherited enhanced nodes
remain aggregate targets with explicit finer-decomposition and typed-signature
gaps. Their prior review is provenance and does not approve this new packet.

## DD.0. Cotangent complexes and derived exterior powers

No new declaration-sized source decomposition is claimed for this layer. Its full required continuation is retained below.

Required continuation (not_read):

- Construct the full cotangent complex from the EDS animation prefix and independently via derived derivations/square-zero extensions; prove comparison and coherent naturality. The naive cotangent/H1 and ordinary Kähler APIs in the audit are not the full object.
- Prove transitivity, derived base change, localization and filtered-colimit compatibility, with derived exterior/symmetric/divided powers and their triangle filtrations.
- Work through the lci amplitude criterion, regular quotient two-term/divided-power models, nonregular extra homology and the exact BMS2 quasisyntomic conditions. Read Bhatt–Lurie Appendices A/C and the complete Illusie proofs with the author errata.

## DD.1. Derived completion and complete filtered algebra

No new declaration-sized source decomposition is claimed for this layer. Its full required continuation is retained below.

Required continuation (not_read):

- Build generic derived ideal completion via vanishing from localizations and Koszul reflective localization, with generator independence, adjunction and idempotence.
- Prove the derived Koszul tower comparison; replacing it by ordinary ideal-power quotients requires the appropriate regularity/weak-proregularity theorem. Keep Tor and derived-limit terms.
- Construct the p- and (p,d)-complete module/animated-ring variants, bounded-torsion criteria, complete flat descent, coherent filtered modules, Rees comparison, Hodge completion and completed tensor products.
- Read and apply the full relevant inverse-limit/completion sources. The BO erratum has been read, but it supplies neither the whole completion functor nor unrestricted limit exchange.

## DD.2. Derived de Rham and the Hodge filtration

### Relations for ordinary differential symbols

`DerivedDeRhamCohomology:DD.2/symbol-relations` — definition. Proposed declaration: `TauCeti.DeRham.symbolRelations`.

Let Sₙ be the free A-module on pairs (c,v) with c∈B and v:{1,…,n}→B, written [c;v]. Define Rₙ⊂Sₙ as the A-span of six families: [c+e;v]−[c;v]−[e;v]; [ac;v]−a[c;v] for a∈A; slot additivity [c;v(i↦x+y)]−[c;v(i↦x)]−[c;v(i↦y)]; slot Leibniz [c;v(i↦xy)]−[cx;v(i↦y)]−[cy;v(i↦x)]; [c;v(i↦a)] for a∈A; and [c;v] when v_i=v_j with i≠j. There is no B-linearity requirement in the coefficient before applying d.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use the existing Finsupp free A-module and Submodule.span.
2. The first two families express the coefficient B as an A-module; the next three are the pinned KaehlerDifferential.kerTotal relations in a slot; the last is strict alternation.
3. For n=0 only the coefficient relations remain. Repeated slots vanish in characteristic two without dividing by 2.

Inputs: `mathlib:KaehlerDifferential.kerTotal`, `mathlib:exteriorPower.presentation`.

API:

- `TauCeti.DeRham.symbolRelations_eq_span` (characterisation): Rₙ is exactly the A-span of the six explicitly displayed relation families.
- `TauCeti.DeRham.symbolRelations_coeff_add` (relation): Coefficient additivity belongs to Rₙ.
- `TauCeti.DeRham.symbolRelations_slot_mul` (relation): The slot Leibniz relation belongs to Rₙ for every slot.

Unit tests:

- `TauCeti.DeRham.test_relations_degree_zero` (degenerate): The degree-zero relation [0;()] belongs to R₀.
- `TauCeti.DeRham.test_relations_constant_slot` (computation): A differential slot filled with an element from A is zero in the quotient.
- `TauCeti.DeRham.test_relations_diagonal_char_two` (non-example): Over F₂, the diagonal degree-two symbol is itself a relation, not merely twice that symbol.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Evaluation of differential symbols

`DerivedDeRhamCohomology:DD.2/symbol-map` — construction. Proposed declaration: `TauCeti.DeRham.symbolMap`.

Define qₙ:Sₙ→Ωⁿ as the A-linear map [c;v]↦c·Dv₁∧…∧Dvₙ. In degree zero it sends [c;()] to c under Ω⁰≃B.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Apply Finsupp.linearCombination over A to the displayed family in the existing exterior power.
2. Use exteriorPower.ιMulti and the universal derivation; do not construct a second module of forms.

Inputs: `mathlib:Finsupp.linearCombination`, `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.zeroEquiv`.

API:

- `TauCeti.DeRham.symbolMap_single` (simp): qₙ([c;v])=c Dv₁∧…∧Dvₙ.
- `TauCeti.DeRham.symbolMap_add` (simp): qₙ is additive.
- `TauCeti.DeRham.symbolMap_smul` (simp): For a∈A, qₙ(a s)=a qₙ(s).

Unit tests:

- `TauCeti.DeRham.test_symbolMap_zero_degree` (compatibility): Evaluation in weight zero agrees with the existing zeroEquiv.
- `TauCeti.DeRham.test_symbolMap_one_degree` (compatibility): Evaluation in weight one agrees with c times the universal derivation.
- `TauCeti.DeRham.test_symbolMap_repeated` (computation): The image of [c;x,x] is zero in every characteristic.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Differential symbols generate all forms

`DerivedDeRhamCohomology:DD.2/symbol-map-surjective` — lemma. Proposed declaration: `TauCeti.DeRham.symbolMap_surjective`.

The map qₙ is surjective for every n≥0; equivalently the forms c Dv₁∧…∧Dvₙ span Ωⁿ as an A-module.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. For n=0 use exteriorPower.zeroEquiv.
2. For n>0 use KaehlerDifferential.span_range_derivation and exteriorPower.ιMulti_span_of_span to write every form as a finite B-linear combination of wedges of exact one-forms.
3. Each B coefficient is part of the symbol index c, so this is an A-linear combination of qₙ-images, without asserting that the exact one-forms alone span over A.

Inputs: `DerivedDeRhamCohomology:DD.2/symbol-map`, `mathlib:KaehlerDifferential.span_range_derivation`, `mathlib:exteriorPower.ιMulti_span_of_span`, `mathlib:exteriorPower.zeroEquiv`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The differential-symbol presentation

`DerivedDeRhamCohomology:DD.2/symbol-relations-kernel` — lemma. Proposed declaration: `TauCeti.DeRham.symbolRelations_ker`.

For every n, ker(qₙ)=Rₙ. Thus Sₙ/Rₙ is canonically Ωⁿ as an A-module, including n=0.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Check qₙ kills each relation using Derivation.leibniz, vanishing on A, and strict alternation. This proves Rₙ⊂ker(qₙ).
2. For the reverse containment, use the existing Kähler presentation separately in each slot and the existing exterior-power presentation. Their composite B-linear presentation has generators Dv₁∧…∧Dvₙ and relations slot additivity, slot Leibniz, constants and alternation.
3. Restrict scalars by replacing each B coefficient with an index c and imposing coefficient additivity and A-scalar relations. This is the standard free-module restriction-of-scalars presentation: a map out is an additive A-linear family in c satisfying exactly the four slot relation families.
4. The two successive quotient universal properties identify Sₙ/Rₙ with Ωⁿ. In degree zero the same argument is simply the presentation of B as an A-module. Riou’s direct-presentation proof is a design reference; the missing general presentation combinator is not cited as baseline.

Inputs: `DerivedDeRhamCohomology:DD.2/symbol-relations`, `DerivedDeRhamCohomology:DD.2/symbol-map`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:KaehlerDifferential.quotKerTotalEquiv`, `mathlib:exteriorPower.presentation`, `mathlib:Submodule.liftQ`, `mathlib:Module.Presentation.restrictScalars`.

Acceptance: Check both kernel inclusions, not just that the listed relations map to zero. In characteristic two keep diagonal alternation; antisymmetry alone is insufficient.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Differentiating a free differential symbol

`DerivedDeRhamCohomology:DD.2/free-symbol-differential` — construction. Proposed declaration: `TauCeti.DeRham.freeDifferential`.

Define δₙ:Sₙ→Ωⁿ⁺¹ as the A-linear map [c;v]↦Dc∧Dv₁∧…∧Dvₙ. This uses the coefficient as the first slot, with positive sign.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use Finsupp.linearCombination over A and prepend Dc to the n-tuple of universal differentials.
2. No quotient descent or B-linearity is built into this free map.

Inputs: `mathlib:Finsupp.linearCombination`, `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`.

API:

- `TauCeti.DeRham.freeDifferential_single` (simp): δₙ([c;v])=Dc∧Dv₁∧…∧Dvₙ.
- `TauCeti.DeRham.freeDifferential_add` (simp): The free differential preserves sums.
- `TauCeti.DeRham.freeDifferential_smul` (simp): The free differential is A-linear on free-module coefficients.

Unit tests:

- `TauCeti.DeRham.test_freeDifferential_unit` (degenerate): Symbols with coefficient one have zero differential.
- `TauCeti.DeRham.test_freeDifferential_zero_degree` (compatibility): In weight zero the free differential agrees with D after oneEquiv.
- `TauCeti.DeRham.test_freeDifferential_diagonal` (computation): δ₁([x;x])=Dx∧Dx=0.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The free differential kills every relation

`DerivedDeRhamCohomology:DD.2/free-differential-relations` — lemma. Proposed declaration: `TauCeti.DeRham.freeDifferential_relations`.

For every n, Rₙ⊂ker(δₙ), so δₙ depends only on the represented ordinary form.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. A-span induction reduces to the six relation families. Coefficient additivity and A-linearity follow from the universal derivation; slot additivity and constant slots follow from its corresponding identities.
2. For a slot product xy, expand D(xy), D(cx) and D(cy). Terms involving Dc cancel directly. The remaining c·Dx∧Dy terms cancel after exchanging the leading and specified slot; retain the sign and use antisymmetry deduced from strict alternation.
3. For a repeated slot the output still has two identical differential slots, so it is zero. No division by 2 is used.
4. This is the direct-symbol version of the relation computation in Stacks and the final descent proof in Riou’s proposed d.

Inputs: `DerivedDeRhamCohomology:DD.2/symbol-relations`, `DerivedDeRhamCohomology:DD.2/free-symbol-differential`, `mathlib:Derivation.leibniz`, `mathlib:Derivation.map_algebraMap`, `mathlib:AlternatingMap.map_eq_zero_of_eq`, `mathlib:AlternatingMap.map_swap`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The ordinary de Rham differential

`DerivedDeRhamCohomology:DD.2/ordinary-differential` — construction. Proposed declaration: `TauCeti.DeRham.d`.

For every n≥0 define dₙ:Ωⁿ→Ωⁿ⁺¹, A-linear, as the descent of δₙ along qₙ. It is characterised by dₙ(c Dv₁∧…∧Dvₙ)=Dc∧Dv₁∧…∧Dvₙ. The scalar ring is A; in general it is not B-linear.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use the kernel equality and annihilation of relations to descend δₙ to Sₙ/Rₙ by Submodule.liftQ.
2. Use the surjective presentation qₙ to transport the descended map to Ωⁿ.
3. The displayed generator formula and uniqueness follow from the same quotient universal property; the next lemma promotes the formula for subsequent proofs.

Inputs: `DerivedDeRhamCohomology:DD.2/symbol-relations-kernel`, `DerivedDeRhamCohomology:DD.2/free-differential-relations`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:Submodule.liftQ`, `mathlib:exteriorPower.oneEquiv`, `mathlib:KaehlerDifferential.polynomialEquiv_D`, `mathlib:Polynomial.derivative_X`, `mathlib:KaehlerDifferential.mvPolynomialBasis`.

API:

- `TauCeti.DeRham.d_add` (simp): dₙ(α+β)=dₙα+dₙβ.
- `TauCeti.DeRham.d_base_smul` (simp): For a∈A, dₙ(aα)=a dₙα.
- `TauCeti.DeRham.d_zero_degree` (compatibility): Transport d₀ along Ω⁰≃B and Ω¹≃Ω to recover the pinned universal derivation.

Unit tests:

- `TauCeti.DeRham.test_d_base_constant` (degenerate): The differential of the image of a base-ring constant is zero.
- `TauCeti.DeRham.test_d_polynomial_X` (non-example): The differential of X in Z[X] over Z is nonzero, so the zero operator fails.
- `TauCeti.DeRham.test_d_polynomial_X_char_two` (non-example): The differential of X in F₂[X] over F₂ is still nonzero.
- `TauCeti.DeRham.test_d_two_variables` (computation): In Z[X,Y], d(X dY)=dX∧dY and this two-form is nonzero. This detects a zero positive-degree differential and fixes the leading-slot sign.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Differential of an elementary form

`DerivedDeRhamCohomology:DD.2/differential-generator-formula` — lemma. Proposed declaration: `TauCeti.DeRham.d_elementary`.

dₙ(c Dv₁∧…∧Dvₙ)=Dc∧Dv₁∧…∧Dvₙ, for every n including zero.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Evaluate the quotient lift defining d on a single free symbol.
2. Use qₙ([c;v])=c Dv₁∧…∧Dvₙ and the definition of δₙ.

Inputs: `DerivedDeRhamCohomology:DD.2/ordinary-differential`, `DerivedDeRhamCohomology:DD.2/symbol-map`, `DerivedDeRhamCohomology:DD.2/free-symbol-differential`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Uniqueness from elementary forms

`DerivedDeRhamCohomology:DD.2/differential-uniqueness` — lemma. Proposed declaration: `TauCeti.DeRham.d_unique`.

An A-linear map Ωⁿ→Ωⁿ⁺¹ satisfying the displayed elementary-form rule equals dₙ.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Precompose both maps with the surjection qₙ.
2. Free-module extensionality and the elementary-form formula make the composites equal; cancel the surjection.

Inputs: `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/differential-generator-formula`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The de Rham differential squares to zero

`DerivedDeRhamCohomology:DD.2/differential-square-zero` — lemma. Proposed declaration: `TauCeti.DeRham.d_squared`.

For every n, dₙ₊₁∘dₙ=0 as an A-linear map Ωⁿ→Ωⁿ⁺².

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Reduce to elementary forms using qₙ-surjectivity.
2. After one application, the result is an elementary (n+1)-form with coefficient one.
3. A second application inserts D1=0 and therefore vanishes by multilinearity.

Inputs: `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:Derivation.map_one_eq_zero`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The graded Leibniz identity

`DerivedDeRhamCohomology:DD.2/differential-graded-leibniz` — lemma. Proposed declaration: `TauCeti.DeRham.d_leibniz`.

For α∈Ωᵐ and β∈Ωⁿ, d(α∧β)=dα∧β+(−1)ᵐα∧dβ. The product is the existing graded multiplication of the exterior algebra.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use bilinearity and the symbol surjection to reduce both factors to elementary forms c Dx₁∧…∧Dxₘ and e Dy₁∧…∧Dyₙ.
2. Their product has coefficient ce. Expand D(ce)=c De+e Dc.
3. The e Dc term is dα∧β; move De through m one-forms to obtain the sign (−1)ᵐ in the other term. Strict alternation makes this valid also in characteristic two.

Inputs: `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:Derivation.leibniz`, `mathlib:ExteriorAlgebra.gradedAlgebra`, `mathlib:AlternatingMap.map_swap`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The ordinary algebraic de Rham complex

`DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex` — construction. Proposed declaration: `TauCeti.DeRham.complex`.

Define Ω•_(B/A) as the nonnegative cochain complex of A-modules with degree n object Ωⁿ and differential dₙ. Its multiplication is the existing wedge product and satisfies the graded Leibniz identity. This is the ordinary complex, not a claim of a derived smooth comparison in characteristic zero.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Package the modules and differential with CochainComplex.of using d²=0.
2. Record the adjacent differential and the zero maps between nonadjacent degrees.
3. The previously proved graded Leibniz identity equips the concrete complex with its multiplicative compatibility. An enhanced commutative algebra model is a separate inherited prerequisite.

Inputs: `DerivedDeRhamCohomology:DD.2/ordinary-differential`, `DerivedDeRhamCohomology:DD.2/differential-square-zero`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`, `mathlib:CochainComplex.of`.

API:

- `TauCeti.DeRham.complex_d_apply` (data): The adjacent differential of Ω• is dₙ.
- `TauCeti.DeRham.complex_d_nonadjacent` (simp): Every nonadjacent differential is zero.
- `TauCeti.DeRham.complex_X` (data): The object in degree n is the existing module Ωⁿ, restricted to A.

Unit tests:

- `TauCeti.DeRham.test_complex_degree_zero` (compatibility): The first arrow agrees with the universal derivation after the existing degree-one equivalence.
- `TauCeti.DeRham.test_complex_two_steps` (computation): The first two arrows compose to zero on each b.
- `TauCeti.DeRham.test_complex_base_ring` (degenerate): Over A→A the first differential is zero.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Pullback of ordinary differential forms

`DerivedDeRhamCohomology:DD.2/forms-pullback` — construction. Proposed declaration: `TauCeti.DeRham.pullback`.

For an A-algebra homomorphism f:B→C, extend the pinned KaehlerDifferential.mapSemilinear to f-semilinear maps f*ₙ:Ωⁿ_(B/A)→Ωⁿ_(C/A). On elementary forms, c Dv₁∧…∧Dvₙ maps to f(c)D(fv₁)∧…∧D(fvₙ). These are A-linear as well, but in general are not B-linear for an unrelated B-action on C.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use Tau Ceti’s semilinear map on one-forms. Locally equip C and its forms with the B-action through f.
2. The exterior universal property gives the map on forms; discard the local algebra instance and package the scalar law as f-semilinearity.
3. Prove elementary evaluation using the existing one-form generator formula. Degree zero is f and degree one is the pinned semilinear map.

Inputs: `tauceti:KaehlerDifferential.mapSemilinear`, `tauceti:KaehlerDifferential.mapSemilinear_D`, `mathlib:exteriorPower.alternatingMapLinearEquiv`.

API:

- `TauCeti.DeRham.pullback_smul` (compatibility): Pullback is f-semilinear in B-scalars.
- `TauCeti.DeRham.pullback_base_smul` (compatibility): Pullback is linear in A-scalars.
- `TauCeti.DeRham.pullback_add` (simp): Pullback preserves sums of forms.

Unit tests:

- `TauCeti.DeRham.test_pullback_zero_degree` (compatibility): Degree-zero pullback agrees with f under the existing zero equivalence.
- `TauCeti.DeRham.test_pullback_one_degree` (compatibility): Degree-one pullback agrees with the pinned Kaehler mapSemilinear.
- `TauCeti.DeRham.test_pullback_identity_two` (computation): The identity fixes an arbitrary degree-two form.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Pullback commutes with the differential

`DerivedDeRhamCohomology:DD.2/pullback-differential` — lemma. Proposed declaration: `TauCeti.DeRham.pullback_d`.

For every A-algebra map f:B→C and n, f*ₙ₊₁(dₙω)=dₙ(f*ₙω).

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use A-linearity and qₙ-surjectivity to reduce to elementary forms.
2. Both sides are D(f(c))∧D(f(v₁))∧…∧D(f(vₙ)) by elementary pullback and the differential formula.

Inputs: `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/differential-generator-formula`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Pullback preserves wedge products

`DerivedDeRhamCohomology:DD.2/pullback-wedge` — lemma. Proposed declaration: `TauCeti.DeRham.pullback_wedge`.

For every A-algebra homomorphism f, f*(α∧β)=f*α∧f*β, with the existing exterior products.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use the exterior universal property, or reduce both factors to elementary forms and apply multiplicativity of f to their coefficient product.

Inputs: `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `mathlib:ExteriorAlgebra.gradedAlgebra`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Identity pullback

`DerivedDeRhamCohomology:DD.2/pullback-identity` — lemma. Proposed declaration: `TauCeti.DeRham.pullback_id`.

For every n, pullback along id_B is the identity on Ωⁿ.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Reduce to elementary forms by the symbol surjection, and use the identity/composition law of the algebra homomorphisms.

Inputs: `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Composition of pullbacks

`DerivedDeRhamCohomology:DD.2/pullback-composition` — lemma. Proposed declaration: `TauCeti.DeRham.pullback_comp`.

For f:B→C and g:C→E of A-algebras, pullback along g∘f equals g*∘f* in every degree.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Reduce to elementary forms by the symbol surjection, and use the identity/composition law of the algebra homomorphisms.

Inputs: `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/symbol-map-surjective`, `DerivedDeRhamCohomology:DD.2/pullback-elementary`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### The functorial map of ordinary de Rham complexes

`DerivedDeRhamCohomology:DD.2/ordinary-complex-map` — construction. Proposed declaration: `TauCeti.DeRham.complexMap`.

An A-algebra homomorphism f:B→C induces a morphism Ω•_(B/A)→Ω•_(C/A) in CochainComplex(ModuleCat A), whose degree-n map is f*ₙ. These maps preserve identities, composition and wedge multiplication.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use the A-linearity of pullback to form ModuleCat A morphisms degree by degree.
2. The chain-map square is pullback-differential. Identity and composition follow from their promoted degreewise lemmas. Wedge compatibility uses pullback-wedge.

Inputs: `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/pullback-differential`, `DerivedDeRhamCohomology:DD.2/pullback-wedge`, `DerivedDeRhamCohomology:DD.2/pullback-identity`, `DerivedDeRhamCohomology:DD.2/pullback-composition`.

API:

- `TauCeti.DeRham.complexMap_apply` (data): The degree-n component is pullback f n.
- `TauCeti.DeRham.complexMap_id` (functoriality): The complex map of id is the identity.
- `TauCeti.DeRham.complexMap_comp` (functoriality): The complex map of g∘f is the categorical composite of the two complex maps.

Unit tests:

- `TauCeti.DeRham.test_complexMap_constant` (computation): In degree zero, the complex map takes b to f(b).
- `TauCeti.DeRham.test_complexMap_identity` (degenerate): The identity map of B induces the identity in degree one.
- `TauCeti.DeRham.test_complexMap_d` (compatibility): The degree-one image of db is d(fb).

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### Pullback on elementary differential forms

`DerivedDeRhamCohomology:DD.2/pullback-elementary` — lemma. Proposed declaration: `TauCeti.DeRham.pullback_elementary`.

Pullback sends c Dv₁∧…∧Dvₙ to f(c) D(fv₁)∧…∧D(fvₙ).

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure.

Proof route:

1. Use the one-form generator formula of KaehlerDifferential.mapSemilinear_D in each slot of the exterior lift, and its f-semilinearity on the coefficient.

Inputs: `DerivedDeRhamCohomology:DD.2/forms-pullback`, `tauceti:KaehlerDifferential.mapSemilinear_D`.

Acceptance: Check the displayed statement with its stated scalar ring, including n=0 and characteristic two when applicable.

Source: [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), Section 10.132, construction before Lemma 10.132.1. The symbol rule and relation checks construct the ordinary differential. This packet combines that argument with the pinned Kähler and exterior presentations; it does not claim the proposed Lean presentation is printed in Stacks.

### De Rham cohomology from polynomial resolutions

`DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham` — construction. Proposed declaration: `TauCeti.DerivedDeRham.ofPolynomialResolution`.

For a ring map A→B (or a map of simplicial commutative rings) define dR_(B/A)=|Ω*_(P•/A)|∈D(Mod_A), the direct-sum totalization along antidiagonals of the simplicial cochain complex n↦Ω*_(P_n/A), where P•→B is the canonical free A-algebra resolution. It carries an E∞-algebra structure and a decreasing, separated, exhaustive, multiplicative Hodge filtration Fil_H. The source asserts ('One can show', p.5, line 248, citing [Ill72, §VIII.2.1.1]) that any free resolution may be used, hence dR_(−/A) commutes with filtered colimits; that assertion is not proved in the inspected range. This node does not identify dR_(B/A) with the ordinary de Rham complex of every smooth algebra: see the characteristic-zero-completion-boundary node.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: A→B is a ring map, or a map of simplicial commutative rings in the source formulation. Use a simplicial polynomial resolution and direct sums along antidiagonals.

Proof route:

1. Apply the planned ordinary-de-rham-complex and ordinary-complex-map nodes to each polynomial algebra P_n; the ordinary de Rham differential is not a pinned library declaration.
2. Totalize the simplicial cochain complex with the cohomological signs and direct sums.
3. Transport the Hodge filtration and multiplication from the polynomial complexes.
4. Compare free resolutions using the homotopy invariance supplied by the animation/resolution framework; its full construction is a recorded prerequisite.

Inputs: `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-complex-map`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `DerivedDeRhamCohomology:DD.1`.

API:

- `TauCeti.DerivedDeRham.map` (functoriality): A morphism of A-algebras induces a map of the coherent Hodge-filtered derived de Rham objects, with identity and composition coherences.
- `TauCeti.DerivedDeRham.resolutionEquiv` (equivalence): Two free simplicial resolutions of B give equivalent Hodge-filtered multiplicative objects; the comparison respects the augmentation and is coherent in maps of resolutions.
- `TauCeti.DerivedDeRham.hodgeFiltration` (data): The value Fil_H^i is the realization of the subcomplex of polynomial forms of degrees at least i, with decreasing transition maps and multiplication Fil_H^i⊗Fil_H^j→Fil_H^(i+j).

Unit tests:

- `TauCeti.DerivedDeRham.test_identity_algebra` (degenerate): For A→A, dR_(A/A) is A concentrated in degree zero.
- `TauCeti.DerivedDeRham.test_hodge_zero_quotient` (compatibility): For an ordinary A-algebra B, the degree-zero Hodge quotient gr_H^0 dR_(B/A) is B in degree zero.
- `TauCeti.DerivedDeRham.test_rational_laurent_boundary` (non-example): For Q→Q[t,t⁻¹], uncompleted dR is Q, whereas ordinary degree-one de Rham cohomology is Q·dt/t. The unrestricted uncompleted smooth comparison fails.

Acceptance: Identify the complex for a polynomial algebra in its permitted computation model. Make the direct-sum versus Hodge-completed construction explicit in the API and examples.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Definition 2.1, its explanatory paragraph and Remark 2.2, p.5; extracted lines 239–256. The source specifies the totalization and explains its coherent resolution interpretation.

### Derived base change and Künneth

`DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth` — comparison. Proposed declaration: `TauCeti.DerivedDeRham.baseChangeKunneth`.

There are natural equivalences dR_(B⊗^L_A C/A)≃dR_(B/A)⊗^L_A dR_(C/A) and dR_(B/A)⊗^L_A C≃dR_(B⊗^L_A C/C). All tensor products, including the algebra pushout, are derived.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: Ring maps A→B and A→C. Interpret B⊗^L_A C as a simplicial commutative algebra unless Tor independence has been established.

Proof route:

1. Check the polynomial-algebra identities by the decomposition of differential forms and the signed tensor differential.
2. Resolve B and C by free simplicial A-algebras.
3. Realize the polynomial identities and use the coherent colimit description of dR.

Inputs: `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Acceptance: Test a Tor-independent polynomial square and a nonflat derived pushout. Do not replace B⊗^L_A C by B⊗_A C without a Tor calculation.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 2.7 and proof, p.6; extracted lines 313–323. The statement and proof expressly use derived tensor and reduction to polynomial resolutions.

### Why Hodge completion matters

`DerivedDeRhamCohomology:DD.2/characteristic-zero-completion-boundary` — lemma. Proposed declaration: `TauCeti.DerivedDeRham.rationalCollapse`.

For a map of Q-algebras A→B the direct-sum (uncompleted) derived de Rham complex satisfies dR_(B/A)≃A (Corollary 2.5). Hence the uncompleted theory cannot be identified with ordinary de Rham cohomology of smooth Q-algebras: for B=Q[t,t^{−1}] over Q the ordinary de Rham complex has the nonzero class dt/t in degree one while dR_(B/Q)≃Q (the source states exactly this example in Remark 3.12, p.8). Remark 2.6 identifies the Hodge-completed complex (product totalisation) as the variant whose Hodge-to-de Rham spectral sequence converges and which 'specialises to classical de Rham cohomology for smooth maps'; that completed comparison is asserted there, not proved in the inspected range. Hodge completion and p-adic completion are distinct operations. In characteristic p the uncompleted smooth comparison dR_(B/A)≃Ω*_(B/A) for smooth maps of Z/p^n-algebras is a separate theorem (Corollary 3.10, p.8; statement and proof read in review R2, imported inputs unread), not a consequence of this node.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: A and B are Q-algebras for the source equivalence. The explicit ordinary counterexample uses the Laurent polynomial algebra over Q.

Proof route:

1. In every polynomial resolution degree, ordinary polynomial de Rham cohomology is A in degree zero and zero above.
2. The conjugate graded pieces therefore vanish above zero; use exhaustiveness/convergence to identify the uncompleted total complex with A.
3. In Q[t,t^{−1}], d(t^n)=n t^{n−1}dt for n≠0 and d kills constants, so t^{−1}dt is not exact and the ordinary degree-one class is nonzero; Remark 3.12 (p.8, lines 442–446) records this example ('a one-dimensional (usual) de Rham cohomology group of degree 1 (with generator dx/x), but no derived de Rham cohomology').
4. The one-variable integration calculation over Q is elementary; the arbitrary-polynomial tensor and filtered-colimit comparison still needs the ordinary Künneth input recorded in the gap.

Inputs: `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`.

Acceptance: Use the Laurent-polynomial example to prevent an unrestricted uncompleted-to-ordinary equivalence. Keep Hodge completion and p-completion as distinct operations.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Corollary 2.5, proof and Remark 2.6, pp.5–6; extracted lines 290–310. The source proves collapse in characteristic zero and identifies Hodge completion as the relevant different variant, asserting (not proving) that the completed theory specialises to classical de Rham cohomology for smooth maps.

Required continuation (partial):

- Complete the direct symbol-presentation proof, including the two quotient universal properties and the explicit restriction-of-scalars lifting data; the statement-only prototype contains no proofs.
- Extend fixed-base algebra-map naturality to general commutative base-ring squares; prove ordinary underived base change and the polynomial Künneth decomposition before invoking Bhatt Proposition 2.7.
- Finish the inherited enhanced polynomial-resolution construction, coherent multiplicativity, resolution independence, Hodge graded formula and derived transitivity filtration. These need the actual DD.0/DD.1 and EDS suppliers.
- Construct the Hodge-completed object and its comparison, smooth ordinary comparison in the valid characteristic/completion ranges, flat descent and sheafification on schemes/formal schemes. Read Bhatt–Lurie Appendix E and the full cited Illusie proof.
- Decompose the regular/singular hypersurface, divided-power, square-zero non-lci and nonflat-base-change examples, retaining separate Hodge and p-completion.

## DD.3. Derived Cartier theory and conjugate filtration

### Frobenius-linear ordinary differential

`DerivedDeRhamCohomology:DD.3/frobenius-linear-differential` — lemma. Proposed declaration: `TauCeti.DeRham.d_frobenius_smul`.

Let p be prime and A→B a map of characteristic-p commutative rings. For every b∈B and ω∈Ωⁿ_(B/A), dₙ(bᵖω)=bᵖdₙω. Thus the ordinary differential is linear for the B-action through Frobenius, the algebraic input to the B^(1)-action.

Hypotheses: A and B are commutative unital rings and A→B is a fixed algebra structure; n,m≥0 unless specified. Ωⁿ denotes the existing exteriorPower B n (KaehlerDifferential A B), with its restricted A-module structure. p is prime and both A and B have characteristic p, with the given algebra map.

Proof route:

1. The pinned power rule gives D(bᵖ)=p·b^(p−1)Db=0 in characteristic p.
2. Apply the degree-zero case of graded Leibniz to bᵖ times ω.

Inputs: `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`, `mathlib:Derivation.leibniz_pow`.

Acceptance: For F₂[X]/F₂, d(X²)=0 although dX≠0. For arbitrary n, Frobenius scalar linearity is not ordinary B-linearity.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Notation 3.1, final paragraph, printed p.6. The source identifies the twisted module structure. The displayed scalar identity is its elementary polynomial-level proof, obtained from the pinned derivation power rule and graded Leibniz.

### The conjugate filtration

`DerivedDeRhamCohomology:DD.3/conjugate-filtration` — construction. Proposed declaration: `TauCeti.DerivedDeRham.conjugateFiltration`.

Construct a functorial increasing filtration Fil^conj_i dR_(B/A), bounded below at i=0, separated and exhaustive, with gr^conj_i represented by the realization of n↦H^i(Ω*_(P_n/A))[-i]. The associated conjugate spectral sequence converges in the source sense. Its exhaustive realization property concerns the uncompleted direct-sum object; no completed or global strong-convergence claim is implicit.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: A→B and its free simplicial algebra resolution as above. For spectral-sequence use the increasing bounded-below, separated, exhaustive filtration; further completed/global applications need their own convergence checks.

Proof route:

1. Filter each polynomial de Rham column by its canonical cohomological truncations.
2. Realize these filtered columns using direct-sum totalization.
3. Compare another free resolution through a homotopy equivalence; it induces homotopy equivalences on the simplicial cohomology columns.
4. Invoke the source general spectral-sequence construction for increasing exhaustive filtrations.

Inputs: `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `DerivedDeRhamCohomology:DD.1`.

API:

- `TauCeti.DerivedDeRham.conjugateAt` (data): The ith stage is |τ≤i Ω•_(P•/A)|, with the canonical maps from truncation.
- `TauCeti.DerivedDeRham.conjugateInclusion` (functoriality): The map from stage i to stage j for i≤j is induced by cohomological truncation; the maps compose and are natural in A→B.
- `TauCeti.DerivedDeRham.conjugateColimit` (characterisation): The filtered homotopy colimit over i≥0 of these stages is dR_(B/A). This is an uncompleted exhaustiveness assertion.

Unit tests:

- `TauCeti.DerivedDeRham.test_conjugate_identity` (degenerate): For A→A, stage zero is A and every successive positive graded piece is zero.
- `TauCeti.DerivedDeRham.test_conjugate_weight_zero` (compatibility): The zeroth graded piece is |H⁰(Ω•_(P•/A))|, with no cohomological shift.
- `TauCeti.DerivedDeRham.test_conjugate_rational` (computation): For Q→Q[t], every positive conjugate graded piece vanishes and stage zero is Q.

Acceptance: Retain a filtered object, e.g. in D(Fun(N,Mod_A)), rather than a filtration only on the final cohomology. Check that a map inducing equivalences on all conjugate graded pieces induces an equivalence of the uncompleted total objects.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 2.3, proof and Remark 2.4, p.5; extracted lines 258–290. The proof constructs the filtration column by column and checks independence of the resolution.

### The derived Frobenius twist

`DerivedDeRhamCohomology:DD.3/derived-frobenius-twist` — definition. Proposed declaration: `TauCeti.DerivedDeRham.frobeniusTwist`.

For A→B of F_p-algebras define B^(1)=B⊗^L_(A,Frob_A) A, together with the relative Frobenius B^(1)→B. The derived de Rham complex and its conjugate filtration are naturally B^(1)-linear.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: A and B are F_p-algebras. The source identifies B^(1) with the usual (underived) Frobenius twist when Tor_i^A(Frob_*A,B)=0 for i>0 (p.6, lines 334–337), 'the primary case of interest'; without that vanishing only the derived twist (a simplicial commutative ring computed by P•⊗_(A,Frob)A) is defined. p is a fixed prime; the Frobenius twist is of B relative to A, correcting the wording of Notation 3.1.

Proof route:

1. Compute the twist by P•⊗_(A,Frob_A)A.
2. Construct relative Frobenius from polynomial Frobenius maps and pass through the resolution.
3. Use frobenius-linear-differential to construct the polynomial P_n^(1)-action; realize it coherently to obtain the B^(1)-module and filtered-module structures.

Inputs: `DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham`, `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.3/frobenius-linear-differential`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

API:

- `TauCeti.DerivedDeRham.relativeFrobenius` (data): The canonical map B⊗^L_(A,Frob_A)A→B is induced at polynomial level by b⊗a↦bᵖf(a).
- `TauCeti.DerivedDeRham.twistMap` (functoriality): A map B→C of A-algebras induces B^(1)→C^(1) and a commuting square with the two relative Frobenius maps.
- `TauCeti.DerivedDeRham.twistUnderived` (compatibility): If Tor_i^A(B,Frob_*A)=0 for all i>0, the derived twist agrees with the ordinary tensor-product twist, compatibly with relative Frobenius.

Unit tests:

- `TauCeti.DerivedDeRham.test_twist_base` (degenerate): For B=A, B^(1)=A⊗^L_(A,Frob_A)A is canonically A and the relative Frobenius is the identity under this identification.
- `TauCeti.DerivedDeRham.test_twist_polynomial` (computation): For B=F_p[t] over F_p, the derived twist is the ordinary polynomial algebra and relative Frobenius sends its coordinate t to tᵖ.
- `TauCeti.DerivedDeRham.test_twist_no_underived_shortcut` (non-example): Let A=F_p[ε]/ε² and B=F_p. For p≥2, Tor₁^A(B,Frob_*A) is nonzero (indeed isomorphic to Frob_*A as an A-module with ε acting by zero); therefore B^(1) has positive homotopy and cannot be replaced by its ordinary tensor product.

Acceptance: Keep the source and target structure maps in the Frobenius square. Test a case with nonzero higher Tor so that the twist cannot be replaced by its degree-zero ring.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Notation 3.1 and following paragraph, p.6; extracted lines 331–353. The source defines precisely this derived pushout and states when it is underived.

### The polynomial Cartier map

`DerivedDeRhamCohomology:DD.3/polynomial-cartier-map` — theorem. Proposed declaration: `TauCeti.DerivedDeRham.polynomialCartier`.

For a free (polynomial) algebra F over an F_p-algebra A, construct the canonical isomorphism of F^(1)-modules C^{-1}:∧^k L_(F^(1)/A)≃H^k(Ω*_(F/A)) for every k, extending to a graded F^(1)-algebra isomorphism ⊕_k ∧^k L_(F^(1)/A)[−k]→⊕_k H^k(Ω*_(F/A))[−k] (for polynomial F^(1), ∧^k L_(F^(1)/A)=Ω^k_(F^(1)/A)). In one variable, applying the source recipe with the lift t↦t^p gives dt↦[t^{p−1}dt] in degree one; that formula is a consequence of the recipe and is not displayed in the source.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: A is an F_p-algebra and F is a free polynomial A-algebra. The canonical assertion is on cohomology; a chain-level splitting obtained from a lift may depend on choices.

Proof route:

1. Reduce the polynomial calculation to A=F_p by base change.
2. Choose a polynomial lift to W_2 and a compatible Frobenius lift.
3. Divide its action on one-forms by p and reduce modulo p; extend by exterior products.
4. Compute the one-coordinate de Rham complex, then tensor the coordinate calculations.
5. Use the source independence statement on cohomology; retain choice dependence of any chain-level decomposition.
6. The one-coordinate kernel/cokernel calculation, tensor-product decomposition and independence-of-lift comparison must be split into declaration-sized nodes before this inherited aggregate is complete; they are recorded in the Cartier gap.

Inputs: `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`.

Acceptance: Check the one-variable formula and the signed exterior-product formula. Distinguish a canonical Cartier isomorphism from a chosen formality equivalence.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Theorem 3.2, proof and Remark 3.3, p.7; extracted lines 355–385. The proof gives the divided Frobenius construction and the distinction between choices at chain and cohomology levels.

### Derived Cartier graded pieces

`DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces` — theorem. Proposed declaration: `TauCeti.DerivedDeRham.conjugateGradedCartier`.

For every map A→B of F_p-algebras, gr^conj_i dR_(B/A)≃L∧^i L_(B^(1)/A)[−i], naturally as B^(1)-modules. The exterior power and Frobenius twist are derived.

Inherited reviewed mathematical target; detailed enhanced implementation and typed prototype remain incomplete.

Hypotheses: A→B is a map of F_p-algebras. Use the common cotangent complex and derived exterior-power construction from DD.0.

Proof route:

1. Use the conjugate-filtration description as the realization of H^i of polynomial de Rham complexes.
2. Apply the natural polynomial Cartier isomorphism in every simplicial degree.
3. Identify realization of the polynomial i-forms on the Frobenius-twisted resolution with L∧^i L_(B^(1)/A).
4. Record the natural equivalence of graded B^(1)-modules. Spectral-sequence convergence is a separate filtered-realization obligation, not a consequence of equality of graded pieces alone.

Inputs: `DerivedDeRhamCohomology:DD.3/conjugate-filtration`, `DerivedDeRhamCohomology:DD.3/derived-frobenius-twist`, `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `DerivedDeRhamCohomology:DD.0`.

Acceptance: Keep the shift [−i] and B^(1)-module structure. Do not substitute the untwisted cotangent complex or infer Hodge-to-de Rham degeneration.

Source: [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Proposition 3.5 and proof, p.7; extracted lines 392–408. The entire proof is the stated polynomial Cartier-to-cotangent realization chain.

Required continuation (partial):

- Split the inherited polynomial Cartier aggregate into W₂/Frobenius lifts, p-division on one-forms, the one-coordinate kernel/cokernel computation, finite tensor calculation, filtered-colimit extension and independence of the cohomology map.
- Construct the actual derived Frobenius pushout and filtered B^(1)-action, and identify the realized cotangent exterior powers, using DD.0.
- Decompose the filtered-conjugate spectral sequence and give the needed convergence for each uncompleted, completed and hypercohomological use.
- Prove the smooth Cartier extension, including the arbitrary-field characteristic-p scope needed by MotivicEtaleKTheory:M.5d. Polynomial Cartier over F_p alone does not supply that request.
- Read Bhatt §3.3 and the regular-quotient/divided-power computations. Any Deligne–Illusie application retains its liftability and dimension bounds; general degeneration is not asserted.

## DD.4. The crystalline and p-adic comparison construction

No new declaration-sized source decomposition is claimed for this layer. Its full required continuation is retained below.

Required continuation (not_read):

- Read and decompose Bhatt Theorem 3.27 and §§3.3,8–9 completely, with the lci and flat Z/p^n hypotheses.
- Import PD envelopes, crystals and the PD Poincaré lemma from CR.0–CR.2; construct the actual comparison map by polynomial resolutions, then prove its range of equivalence.
- Construct p-completed derived de Rham, prove the valid inverse-limit exchanges, and identify A_cris with the actual maps to CR.0/AI.0 period rings. Separate the Hodge-completed rational construction.
- Retain the smooth lift, regular immersion and failure example outside the lci/flat range; ordinary pi_0 crystalline cohomology is not silently a derived extension.

## DD.5. Quasisyntomic descent and reusable cohomological control

No new declaration-sized source decomposition is claimed for this layer. Its full required continuation is retained below.

Required continuation (not_read):

- Read BMS2 §§2–4 and construct the quasisyntomic site using DD.0’s exact morphism condition.
- Prove the elementary compatible-root semiperfectoid covers/refinements and descent for cotangent powers and the specified filtered/completed de Rham object.
- Separate bounded filtered quotient descent from convergence of the entire tower; prove relative Tor-amplitude, proper-smooth perfectness, completed base change and cup-product compatibility.
- Do not use the stronger PerfectoidQuotients Q3 extension theorem to build the covers that Q3 itself consumes. Quasisyntomic affineness alone does not imply finite projective global cohomology.

## DD.6. Logarithmic extension and acceptance boundary

No new declaration-sized source decomposition is claimed for this layer. Its full required continuation is retained below.

Required continuation (not_read):

- Read the full Gabber log-cotangent source, Koshikawa–Yao §§2–3 and Bhatt log §7. Import the early CR.5 algebraic/log prefix, without making later log-crystalline comparison an input to its own construction.
- Build free-prelog-resolution cotangent complexes, associated-log invariance in its proved scope, transitivity and the correct flat/log-flat base-change results; compare conventions explicitly.
- Construct log derived de Rham and both filtrations, then the exactification/strict-PD-envelope comparison with the G-lci/Cartier-type conditions of Bhatt Definition 7.20 and Theorem 7.22.
- Work the failure Example 7.23, log point and semistable monoid chart O_K[x₁,…,x_d]/(x₁…x_r−π). Separate the later log-prismatic hypotheses and export bases, coefficients, completions and twists.

## Tests, exports and completion criteria

The ordinary tests deliberately distinguish the intended construction from
plausible incorrect ones. In degree zero, existing exterior equivalences recover
the universal derivation. The differential of X is nonzero over both Z and F₂.
In Z[X,Y], the positive-degree calculation d(X dY)=dX∧dY is nonzero and fixes
the order of the leading slot. The diagonal relation is imposed over F₂[X]
itself, so merely imposing antisymmetry would fail. Constant forms vanish,
successive complex arrows compose to zero, and the complex of A over itself
has zero first differential. Pullback agrees with the pinned semilinear map in
degree one and with the algebra homomorphism in degree zero.

The proposed nonflat-twist test uses A=F_p[ε]/ε² and B=F_p. The periodic free
resolution of B over A has differential multiplication by ε. On tensoring with
Frob_*A every differential becomes zero, since εᵖ=0. Thus Tor₁ is the nonzero
module Frob_*A and the derived Frobenius twist has positive homotopy. This is
an explicit obstruction to replacing every derived twist by an ordinary tensor
product. It is a mathematical test contract, not an elaborated derived example.

The ordinary export provides d, d²=0, graded Leibniz and fixed-base
semilinear pullback on the existing exterior forms. Taking its image or kernel
uses ordinary A-module linear algebra; for absolute characteristic-p forms this
gives an F_p-linear exact-form subgroup, not in general an F-linear subspace.
The field-Cartier comparison itself remains in DD.3. General base squares,
the absolute Z-to-F_p comparison requested by M.5d, scheme sheafification and completed filtered functoriality still need the
continuation stated above.

The suggested file uses a common universe for its ring and module types and
imports individual pinned modules. It represents all twenty new nodes, their
twenty-one API entries and twenty-two tests as typed declarations/examples.
Seven inherited nodes, nine API entries and nine tests appear only as explicit
mathematical continuation comments: their enhanced carriers have not yet been
constructed. No proposition-valued stand-in makes those comments executable.
Compilation checks the ordinary signatures and type dependencies; it supplies
no proofs and does not certify the untyped derived targets.

For completion, every target of all seven owner stages must be decomposed, all
source proof interiors read, every gap and supplier request discharged, and the
inherited typed omissions replaced by signatures using the actual enhanced
objects. Acyclicity of this packet is necessary; it is not a proof that every
stage in the atlas is globally acyclic or that all suppliers are closed.

## Sources and findings

The packet records exact URLs, file digests, access date and read sections.
The source ledger is:

- [p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560v1), Bhargav Bhatt; arXiv:1204.6560v1, 30 April 2012, 50-page PDF. Read: Printed/PDF pp.3–8 in full: introduction conclusion, §1.5 conventions, §2, §3.1–3.2 through Corollary 3.13; proofs in those pages. PDF pp.5–7 additionally inspected visually for the three recorded mathematical misprints. Remaining pp.1–2 and 9–50 not read in this job. The earlier decomposition extraction digest is not the PDF digest.

- [The de Rham complex, Section 10.132](https://stacks.math.columbia.edu/tag/0FKF), The Stacks Project Authors; Online version accessed 2026-09-26. Read: Entire section, including differential construction, naturality, Lemmas 10.132.1–2 and comments. The current checkpoint develops the construction and fixed-base algebra-map naturality; general base squares and base change remain explicit gaps.

- [Kernel of the tensor-to-exterior map, Lemma 10.13.4](https://stacks.math.columbia.edu/tag/0H1C), The Stacks Project Authors; Online version accessed 2026-09-26. Read: Entire lemma; its proof is omitted in the source. This is a proof-route cross-check, not a claim that the tensor-kernel presentation has been proved at the baseline.

- [feat(AlgebraicGeometry): the algebraic De Rham complex](https://github.com/leanprover-community/mathlib4/pull/18551), Joël Riou; Unmerged Mathlib PR 18551, head 5888c0081ba867ede5c60d3060f2d674d932b53c. Read: The complete 432-line proposed DeRham.lean reconstructed from the fetched patch, including tautological algebra presentation, scalar restriction, d, d_d and deRhamComplex. This hash is of the reconstructed added source file. The PR is a design reference, not a pinned declaration, not a module imported by the suggested file, and not a mergeability certification.

- [Errata: Complexe cotangent et déformations I](https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf), Luc Illusie; Author erratum. Read: All pages and the replacement argument read. The original book chapters have not been fully read in this job.

- [Errata: Complexe cotangent et déformations II](https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf), Luc Illusie; Author erratum. Read: All pages and the replacement argument read. The original book chapters have not been fully read in this job.

- [Erratum to Notes on crystalline cohomology](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), Pierre Berthelot and Arthur Ogus; Author erratum dated 21 August 2013. Read: All pages and the replacement argument read. The original book chapters have not been fully read in this job.

`DerivedDeRhamCohomology/E1` — Proposition 2.3, printed/PDF p.5 in arXiv:1204.6560v1; checked on the rendered page. Printed: P• → A. Correction: Replace the augmentation target by B: P•→B is a free A-algebra resolution of B. The construction is dR_(B/A); the immediately following proof uses P•→B. A resolution of A would instead construct the base algebra case. No correction identified in the checks below; novelty is not established. Finding is scoped to arXiv v1, not to an unidentified published text.

`DerivedDeRhamCohomology/E2` — Notation 3.1, printed/PDF p.6 in arXiv:1204.6560v1; checked on the rendered page. Printed: Frobenius twist of A. Correction: Read Frobenius twist of B relative to A. The displayed derived tensor formula remains unchanged. The object displayed is B⊗^L_(A,Frob_A)A, and its relative Frobenius has target B. No correction identified in the checks below; novelty is not established. Finding is scoped to arXiv v1, not to an unidentified published text.

`DerivedDeRhamCohomology/E3` — Proof of Proposition 3.5, printed/PDF p.7 in arXiv:1204.6560v1; checked on the rendered page. Printed: H^i(Ω•_(Pn/A))[−i] ≃ Ω^i_(Pn^(1)/A). Correction: Either shift both sides by [−i] or remove the shift from the left side in this intermediate Cartier display. The following realized graded-piece formula correctly includes [−i]. The Cartier isomorphism identifies two modules in degree zero; placing only one side in cohomological degree i is incompatible for nonzero polynomial i-forms. No correction identified in the checks below; novelty is not established. Finding is scoped to arXiv v1, not to an unidentified published text.

The refreshed atlas register also records confirmed findings PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/E17 and E18 on Bhatt pp.32–33. The completion example must use coordinates p^floor(n/2), and the perfect-residue Witt expression must be W(A₀). These existing corrections are imported for the DD.1/DD.4 continuation; those source pages were not independently re-read in this checkpoint.

The arXiv history and author page were checked for another version or correction. No journal version was identified in those checks. The findings concern only the recorded preprint; novelty is not established. They await independent review.
