# Explicit K₂: the classical residue map

The tame symbol converts a pair of nonzero field elements into a nonzero residue class at a discrete valuation. Its formula is elementary, but the sign, order convention and domain of the residue map matter: the unsigned formula does not respect the Steinberg relation, and reversing its quotient inverts the resulting homomorphism. This layer gives a reusable interface for the classical pairing, its descent to degree-two Milnor K-theory and its transport to classical K₂.

This is the target-level supplement for `K2SymbolsBrauer:T.3:symbols`. The [packet](../packets/K2SymbolsBrauer--T.3-symbols.json) imports the four existing targets in [T.3](../packets/K2SymbolsBrauer--T.3.json), preserving their identifiers. It adds the unit-part function needed to calculate with the formula and the theorem characterizing the pairing by its normalization. The [suggested file](../suggested/K2SymbolsBrauer--T.3-symbols.lean) gives signatures over carriers present at the pins. The definitions of Milnor K-theory and classical K₂ remain with T.1/T.2, and their absence at the pins is respected in that file.

The mathematical source is Charles Weibel, *The K-book*, author-hosted [Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), especially Lemma III.6.3 and its proof, printed p.51. Definition III.6.2, printed p.49, specifies a Steinberg symbol; the discussion after Theorem III.6.1, printed p.48, gives the sign calculus. Definition III.7.1, printed pp.61–62, supplies the Milnor presentation already owned by T.2. All page numbers here use the separate chapter's printed pagination, rather than the full book PDF's page index. The source's tame symbol is the inverse of the roadmap's, as made explicit below. Statements and calculations here are in our own words.

## Conventions and ownership

Let F be a commutative field and let v be a surjective valuation with values in `ℤᵐ⁰`. Write ord(f) for Tau Ceti's additive order, R for the valuation subring, 𝔪 for its maximal ideal and k=R/𝔪 for its residue field. Thus v(f)=exp(−ord(f)) for f≠0, a uniformizer has order one, and the nonzero elements of R have nonnegative order. The order function at zero is a junk value in the library. Every order identity below either concerns a field unit or explicitly treats zero separately.

Write U_R for the existing subgroup `v.valuationSubring.unitGroup` of Fˣ. Mathlib's `ValuationSubring.unitGroupMulEquiv` identifies U_R with Rˣ. Write res:U_R→kˣ for `ValuationSubring.unitGroupToResidueFieldUnits`. This is an existing group homomorphism, and it is surjective. It is not a reduction map defined on all of Fˣ. We use a bar only on an R-unit, including an ambient field expression after it has been proved to lie in U_R.

Integer powers are group powers, including negative exponents. The expression (−1)^n denotes a power in kˣ; it remains meaningful when the residue characteristic is two. Source symbols in K₂ᴹ(F) are written additively. A homomorphism from them to kˣ is expressed in Lean as an additive homomorphism to `Additive kˣ`; its zero value therefore corresponds to the multiplicative unit 1, and its negative corresponds to inversion. Classical K₂ and the Matsumoto comparison use the carrier and conventions of their existing owner.

The canonical target ownership is:

| Target ID | Output |
| --- | --- |
| `K2SymbolsBrauer:T.3/tame-symbol` | The signed pairing, its mixed normalizations, and its DVR/place compatibility. |
| `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence` | The order-zero product and independence of the parameter used to compute unit parts. |
| `K2SymbolsBrauer:T.3/tame-symbol-steinberg` | Both multiplicative laws and the complementary-entry relation. |
| `K2SymbolsBrauer:T.3/tame-symbol-hom` | Milnor descent, classical transport and surjectivity. |

The two new IDs are `K2SymbolsBrauer:T.3:symbols/unit-part` and `K2SymbolsBrauer:T.3:symbols/residue-uniqueness`. Small order and parity calculations belong in their proof sketches, rather than becoming additional nodes. Suggested implementation home: `TauCeti/Algebra/KTheory/TameSymbol`, namespace `TauCeti.TameSymbol`.

Localization boundary comparison, higher Milnor residues, ramified restriction/transfer formulas, finite support, reciprocity and tame kernels retain their existing targets. In particular this layer does not choose a localization connecting-map sign and then use that choice to prove its own normalization. It exports the classical convention for that later comparison.

## Baseline and imported inputs

The reviewed audit `data/library-coverage.json`, entry `K2SymbolsBrauer:T.3:symbols` in AUDIT-29, records the classical targets as not built. The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The relevant statements were read in their source files.

In `TauCeti/RingTheory/Valuation/Discrete/Order.lean`, `Valuation.ord`, `ord_mul`, `ord_zpow` and `valuation_eq_exp_neg_ord` supply the integer arithmetic on nonzero elements. `mem_valuationSubring_iff_ord_nonneg` covers zero as well as nonzero elements; its proof handles zero separately before using logarithms. `mem_maximalIdeal_iff_ord_pos` assumes a nonzero subring element. `ord_add_eq_min_of_ord_ne` assumes both summands nonzero and their orders distinct. These hypotheses are sufficient for the four Steinberg cases below.

Surjectivity supplies exactly the nontrivial value-group instance through `Valuation.nontrivial_valueGroup_of_surjective`. Then `exists_isUniformizer_of_surjective` supplies a uniformizer, `isUniformizer_iff_ord_eq_one_of_surjective` identifies its order, and `exists_eq_zpow_mul_unit_of_surjective` supplies the existing decomposition. The new function packages its canonical explicit unit, rather than requesting another existence theorem.

In `Mathlib/RingTheory/Valuation/ValuationSubring.lean`, `Valuation.mem_unitGroup_iff` identifies membership in U_R with v(f)=1 for f∈Fˣ. `unitGroupMulEquiv`, `unitGroupToResidueFieldUnits`, its coercion theorem and `surjective_unitGroupToResidueFieldUnits` supply all unit/residue carriers and maps. `TauCeti.Place.residueUnit` in `TauCeti/FieldTheory/FunctionField/Place/Residue.lean` already reduces an order-zero field unit at a function-field place. It is imported, not reconstructed as a second residue function.

The degree-two presentation is imported from `K2SymbolsBrauer:T.2:symbols/field-proof/tensor-realization`; its identification with degree two of the homogeneous quotient uses `.../homogeneous-components` and the existing `K2SymbolsBrauer:T.2/milnor-k-theory`. The classical comparison is `K2SymbolsBrauer:T.2/matsumoto`. The sign identities for an arbitrary pairing are supplied by `.../field-calculus`; their proof uses the field Steinberg relation directly and does not require Matsumoto injectivity.

The current read-only TauCetiRoadmap tree and current Tau Ceti library were also searched, including the newer roadmaps missing from the atlas snapshot. No implementation of the tame symbol or integral Milnor K-theory was found. The generic valuation unit-part function extends the local-field component described next. The current place residue is already accounted for above. GrothendieckEulerForms and GlobalNumberFields were read as upstream models for quotient APIs, exact hypotheses, comparisons and discriminating checks. Their categorical K₀ and arithmetic residue constructions do not own this field-symbol pairing. A public open Mathlib pull-request search for tame symbols and Milnor K-theory found no relevant implementation to consume. The public Zulip archive’s [Ideals over algebras discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Ideals.20over.20algebras.html) motivates the tensor-algebra quotient but supplies no implementation of these objects.

Current LocalFieldsRamification, Layer 1, already owns the topological uniformizer splitting of a nonarchimedean local field. Current Tau Ceti implements it as `TauCeti.unitsEquivIntProd`, with `coe_unitsEquivIntProd_apply_snd`, `existsUnique_eq_zpow_mul` and `coe_unitsEquivIntProd_apply_snd_eq_mul` in `TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean`. These declarations are absent at the recorded pin and are consumed through that upstream owner. The packet records its precise Layer 1 supplier-stage prerequisite and request for the compatibility API only; the generic construction needs no local-field splitting. This layer extends only the algebraic unit component to arbitrary discretely valued fields, including incomplete ℚ at 5; it gives no new local-field splitting, topology, or local compactness theorem.

## Unit parts and their API

Fix t∈Fˣ with ord(t)=1. For f∈Fˣ define

\[
 u_t(f)=f\,t^{-\operatorname{ord}(f)}\in U_R.
\]

Indeed its order is zero by the product and integer-power identities, so its valuation is one. This is the actual field unit, not its class modulo 𝔪. It is uniquely characterized by f=t^ord(f)u_t(f). This definition needs only the displayed order-one parameter; a separate surjectivity argument is unnecessary once t is supplied. Lemma III.6.3, printed p.51, uses precisely this decomposition; the canonical function and the following API make it reusable.

All names in this paragraph have prefix `TauCeti.TameSymbol`:

| Declaration | Required statement |
| --- | --- |
| `unitPart` | The U_R-valued function u_t just defined, with the order-one witness as a proof parameter. |
| `coe_unitPart` | Its underlying field unit is f·t^(−ord(f)). |
| `unitPart_decomposition` | f=t^ord(f)·u_t(f) in Fˣ. |
| `unitPart_eq_iff` | For w∈U_R, u_t(f)=w iff f=t^ord(f)w. |
| `unitPart_one` | u_t(1)=1. |
| `unitPart_uniformizer` | u_t(t)=1. |
| `unitPart_of_unit` | u_t(w)=w for w∈U_R, including units transported from Rˣ by the existing equivalence. |
| `unitPart_mul` | u_t(fg)=u_t(f)u_t(g). |
| `unitPart_inv` | u_t(f⁻¹)=u_t(f)⁻¹. |
| `unitPart_zpow` | u_t(f^n)=u_t(f)^n for every n∈ℤ. |
| `unitPart_change` | If t′=tε for ε∈U_R then u_t′(f)=u_t(f)ε^(−ord(f)). |
| `unitPart_localField` | Under the explicit order comparison below, the underlying field unit equals the second coordinate of the existing local-field splitting. |

Cancellation proves uniqueness, and commutativity together with order additivity proves the group identities. The parameter-change formula follows by expanding (tε)^(−ord(f)). It is needed both for parameter independence of the pairing and for comparing calculations made with different choices of uniformizer. The subgroup equivalence serves the DVR-facing API; the decomposition serves the uniqueness theorem. No theorem claims that the unit part itself is independent of t.

**Checks.** The identity test u_t(1)=1 detects an extraneous constant factor. Agreement on arbitrary existing R-units detects an accidental residue or quotient carrier. The negative-power test u_t(t⁻²)=1 detects replacing the integer order by its absolute value: that replacement produces t⁻⁴, which has negative order. For ℚ at 5 with t=5, the unit parts of 2, 10 and 2/5 are all the rational unit 2; a constant-one function fails these computations. With t′=10, the unit part of 5 is 1/2, whereas it is 1 with t=5. This last test detects the sign of the parameter-change exponent.

For `unitPart_localField`, take a nonarchimedean local field K with its existing valuation relation and topology. Let v:K→ℤᵐ⁰ satisfy ord_v(x)=(TauCeti.normalizedValuation K x).toAdd for every x∈Kˣ, and take t with normalized valuation ofAdd(1). This equality supplies ord_v(t)=1. The target identifies, in Kˣ, u_t(x) with the second coordinate of `TauCeti.unitsEquivIntProd K t ht x`. Substitute the order equality into the existing `coe_unitsEquivIntProd_apply_snd` formula (current source lines 145–147). No equality of subtype carriers is assumed. **Check:** for x=t⁻²u and u in the existing depth-zero unit subgroup, both underlying unit components are u. This comparison and `unitPart_localField_compatibility` remain reader targets because the local-field splitting is newer than the pins.

The five other checks have the names `unitPart_identity`, `unitPart_unit_compatibility`, `unitPart_negative_power`, `unitPart_five_values` and `unitPart_change_five`. They are named theorem targets in the suggested file; its two proved unit-part examples test the identity and negative-power cases directly from the definition.

## The pairing and its API

For a normalized discrete valuation define, with a=ord(f) and b=ord(g),

\[
 \partial_v\{f,g\}=(-1)^{ab}\,
       \operatorname{res}(u_t(f))^b
       \operatorname{res}(u_t(g))^{-a}\quad\in k^\times.
\]

This is the canonical `T.3/tame-symbol` target. Its zero-free domain is Fˣ×Fˣ. Every reduction in the formula is applied to an existing R-unit. Once parameter independence is proved, an implementation can use the equivalent parameter-free product as the defining body; both definitions must expose the same public theorem.

The API includes `tameSymbol_eq_residue` for the parameter-free expression, `tameSymbol_unitParts` for the displayed expression, and the following normalizations and relations:

- `tameSymbol_unit_uniformizer`: ∂{u,t}=res(u) for u∈U_R.
- `tameSymbol_uniformizer_unit`: ∂{t,u}=res(u)⁻¹.
- `tameSymbol_of_ord_eq_zero`: ∂{u,w}=1 for u,w∈U_R.
- `tameSymbol_swap`: ∂{g,f}=∂{f,g}⁻¹.
- `tameSymbol_self`: ∂{f,f}=(−1)^ord(f).
- `tameSymbol_neg_self`: ∂{f,−f}=1.
- `tameSymbol_kbook`: the value in Weibel III.6.3 is ∂{g,f}=∂{f,g}⁻¹.

There is no alternatingness assertion ∂{f,f}=1 in general. The diagonal value retains its sign. Mixed normalizations are derived by setting one order equal to zero and the other equal to one; they pin down which convention is meant. Weibel's quotient has the opposite orientation, namely g^a/f^b. His value on (t,u) is res(u), whereas this roadmap's is its inverse.

**Checks.** For ℚ with its 5-adic valuation, identify the residue field canonically with 𝔽₅. Then

| Inputs (f,g) | Orders (a,b) | Value |
| --- | --- | --- |
| (2,5) | (0,1) | 2 |
| (5,2) | (1,0) | 3 |
| (5,5) | (1,1) | 4 |
| (10,5) | (1,1) | 3 |
| (2,3) | (0,0) | 1 |
| (1/5,4/5) | (−1,−1) | 1 |

The first two reject the inverse convention. The next two reject omission of the sign. The unit-unit and identity-input checks reject a spurious nontrivial factor. The final pair is complementary: without the sign its value is 4≠1, so the unsigned formula cannot descend. In residue characteristic two the sign is one; at the 2-adic valuation ∂{2,2}=1. These computations are named theorem targets in the suggested file in the actual quotient residue field. They are not admitted examples. Its two proved pairing examples check the identity and the signed uniformizer diagonal directly from the definition.

For a rational function field k(X) at X−b, ∂{a,X−b}=a for a∈kˣ, and the swapped value is a⁻¹. This is the compatibility check with constants and places, not a claim of a reciprocity product.

The corresponding suggested theorem names are `tameSymbol_rat_five`, `tameSymbol_rat_five_sign`, `tameSymbol_units`, `tameSymbol_needs_sign`, `tameSymbol_not_kbook` and `tameSymbol_char_two`. These targets retain the displayed values, the unsigned negative-order counterexample and the distinction of conventions.

## Parameter independence

For f,g∈Fˣ, the product h=f^b g^(−a) has order ba−ab=0 and hence is an element of U_R. Writing f=t^a u and g=t^b w gives h=u^b w^(−a). Applying the existing residue homomorphism proves

\[
 \partial_v\{f,g\}=(-1)^{ab}\operatorname{res}(f^b g^{-a}).
\]

Here h is first packaged as a unit of R. The formula does not reduce a pole in F directly. Its right side contains no t, proving `T.3/tame-symbol-uniformizer-independence`.

There is also an explicit change calculation: for t′=tε the two unit parts acquire factors ε^(−a) and ε^(−b). Their contributions to the residue product have exponents −ab and ba, which cancel. The sign depends only on orders. At 5, using t=5 gives unit parts 2 and 1 for (10,5); using t′=10 gives 1 and 1/2. Both computations give −2=3. This tests actual parameter change, rather than merely asserting proof-witness independence.

## Bilinearity and the Steinberg relation

The target `T.3/tame-symbol-steinberg` asserts both multiplicative laws, named `tameSymbol_mul_left` and `tameSymbol_mul_right`, for arbitrary field units. Unit parts multiply, orders add, and (−1)^((a+a′)b) splits into the two sign factors. The same argument works in the second variable. Integer-power and inverse laws follow, including exponent zero.

For `tameSymbol_steinberg`, take r≠0,1, put s=1−r, and write a=ord(r), b=ord(s). Lemma III.6.3, printed p.51, proves the complementary-entry identity through the following complete case split, here with the roadmap's inverse convention.

1. If a>0, r lies in 𝔪, so s is a unit and res(s)=1. Thus b=0 and the value is res(s)^(−a)=1.
2. If b>0, the symmetric argument gives a=0 and res(r)=1, so the value is res(r)^b=1.
3. If a=b=0, both exponents and the sign exponent are zero, and the value is one.
4. If a<0, the distinct-order sum theorem applied to 1 and −r gives b=a. The unit r/s=(r⁻¹−1)⁻¹ has residue −1 because r⁻¹ has positive order. The parameter-free expression is (−1)^(a²)res((r/s)^a), hence (−1)^(a²+a)=1. The integer a²+a is even, also when a is negative.

To see exhaustiveness, a≥0 means r∈R, hence s∈R and b≥0. Thus when the first and fourth cases fail, b is positive or both orders are zero. The two positive cases use quotient-ring reduction and the local-ring unit criterion. No completeness or finite-residue-field theorem enters. Characteristic two collapses the sign but leaves the proof valid.

For an independent numerical Check, the rational pairs r=5, r=−4, r=2 and r=1/5 at 5 cover respectively the first, second, third and fourth cases. Their values are all one. A proposed proof using only nonnegative orders misses the last case and the precise place where the sign is essential.

## Descent and its API

The existing `T.3/tame-symbol-hom` target supplies two related maps, on the existing K-theory carriers. Start with the degree-two tensor realization of T.2: the ℤ-module tensor square of `Additive Fˣ`, modulo the span of complementary-unit tensors. The bilinear pairing, written with target `Additive kˣ`, induces a linear map on the tensor square. The Steinberg theorem annihilates the relation span, so the quotient universal property gives a unique homomorphism on its quotient. The inherited homogeneous-components theorem identifies this quotient with K₂ᴹ(F). It is this identification, rather than an unproved grading assertion about a ring quotient, that gives the Milnor map.

Compose with the inverse of the existing Matsumoto isomorphism K₂ᴹ(F)≅K₂(F) to obtain the classical map. Its value on every classical Steinberg symbol is the same ∂{f,g}. The construction adds no second K₂ object, classical kernel or tensor presentation.

The API, with namespace prefix as above, is:

| Declaration | Required statement |
| --- | --- |
| `tameSymbolHom` | The homomorphism K₂ᴹ(F)→Additive kˣ. |
| `tameSymbolHom_symbol` | Evaluation on {f,g} is the additive tag of tameSymbol(v,f,g). |
| `tameSymbolHom_ext` | Homomorphisms out of K₂ᴹ(F) agreeing on all two-entry symbols are equal, by the imported symbol-generation/universal property. |
| `tameSymbolHom_surjective` | Every element of kˣ lies in the image. |
| `tameSymbolHom_symbol_units` | The image of {u,w} is zero for u,w∈Rˣ. |
| `tameSymbolHomK2` | The classical map obtained by composing with the inverse Matsumoto equivalence. |
| `tameSymbolHomK2_symbol` | Its evaluation on a classical symbol is the same pairing. |
| `tameSymbolHomK2_matsumoto` | Composing the classical map with Matsumoto equals the Milnor map, with the explicit additive/multiplicative tags. |
| `tameSymbolHom_kbook` | Weibel's map is the negative of this map after writing the target additively. |

For surjectivity choose any a∈kˣ and lift it to u∈U_R using the pinned residue-map surjectivity theorem. Then ∂{u,t}=a. This proof supplies a preimage; it does not assert a canonical multiplicative section kˣ→K₂ᴹ(F). It also proves the classical version after the comparison.

**Checks for the Milnor construction.** At 5, {2,5} maps to 2, a generator of 𝔽₅ˣ, so the zero map fails. The symbols {2,3} and {f,1} map to the trivial unit, testing unit-unit and identity behavior. The symbol {1/5,4/5} is zero by the defining complementary relation and maps to one; the unsigned expression gives 4, rejecting a non-descending formula. Finally {5,5}={5,−1} and both images are 4, testing the integral diagonal identity rather than imposing alternatingness.

**Checks for classical transport.** The classical symbols {2,5} and {5,2} map respectively to 2 and 3. A classical symbol of two R-units maps to one. Transporting the Milnor symbol {5,5} across Matsumoto and then reducing gives 4, agreeing with first reducing the Milnor symbol. These tests jointly reject a zero transport, an inverse transport and a map unrelated to the symbol-compatible comparison. Surjectivity is inherited from the explicit preimages, not from finite-field K₂ vanishing.

## Characterization of the normalized tame symbol

The new `T.3:symbols/residue-uniqueness` theorem states the following. Fix v and t as above. Let c:Fˣ×Fˣ→kˣ be bilinear and satisfy the Steinberg relation. Assume c(u,w)=1 on pairs of R-units and c(u,t)=res(u) for every R-unit u. Then c(f,g)=∂{f,g} for every pair of field units. This is `tameSymbol_unique`.

Use the existing field-only sign calculus to get c(a,−a)=1, skew-symmetry and c(a,a)=c(a,−1). Mixed normalization gives c(−1,t)=−1, hence c(t,−1)=−1 and c(t,t)=−1. It also gives c(t,w)=res(w)⁻¹. For f=t^a u and g=t^b w, bilinearity for integer powers gives

\[
 c(f,g)=c(t,t)^{ab}c(t,w)^a c(u,t)^b c(u,w)
       =(-1)^{ab}\operatorname{res}(u)^b\operatorname{res}(w)^{-a}.
\]

This is the required formula, for every integer a,b. The statement is a derived characterization using III.6.1's sign calculus and III.6.3's decomposition; it is not attributed to an additional numbered source theorem.

`tameSymbolHom_unique` is its Milnor corollary: any homomorphism killing unit-unit symbols and sending {u,t} to res(u) equals tameSymbolHom. Pull back to the bilinear pairing and use homomorphism extensionality. `tameSymbolHomK2_unique` follows using the existing comparison. Neither assertion says that unit-uniformizer symbols generate K₂ itself; unit-unit symbols are killed by the map, not declared zero in its source.

The constant-one pairing fails the mixed normalization at (2,5). The inverse convention also fails it, taking value 3 instead of 2. The unsigned expression has the desired mixed values, but fails the Steinberg hypothesis at (1/5,4/5). These are distinct checks on the hypotheses: normalization alone does not excuse omitting the complementary-entry condition. The theorem holds with arbitrary residue characteristic; when −1=1 its same expansion simply has a trivial sign.

## DVR, place and restriction compatibility

`tameSymbol_dvr` is the inherited DVR interface. For a DVR R with fraction field F and a chosen irreducible parameter ϖ, use its associated normalized valuation. If f=ϖ^a u and g=ϖ^b w with u,w∈Rˣ, its value is (−1)^(ab)ū^b w̄^(−a). Comparison with the valuation-subring model uses the canonical fraction-field embedding and transports both units and residues. No completeness hypothesis is added. Replacing ϖ by a unit multiple gives the same map by parameter independence.

`tameSymbol_place` identifies the inherited place interface with Tau Ceti's existing `Place.residueUnit`: for a place P, a local order-one parameter t, and f∈Fˣ with P.ord(f)=0, ∂_P{f,t}=P.residueUnit(f). The identification of P.integers with the valuation subring is by their membership criteria, handling zero separately. Residue fields and units are transported along that equality; they are not assumed definitionally identical. The swapped input gives the inverse. On k(X) at X−b this recovers the constant a and its inverse as above, and taking f=1 gives one.

The original tame-symbol API also contains two restriction-map interfaces. They remain owned there and consume the library's residue-field map; no new restriction theorem or general valuation-ring roadmap is introduced. For a field embedding φ:F→E, valuations v,w and e∈ℕ satisfying ord_w(φ(f))=e·ord_v(f) for every f≠0, `valuationSubringMap` is the restriction of φ from R_v to R_w. Nonnegative order is preserved, including e=0; zero is handled directly. Its coercion to E is φ, it respects identity and composition, and it agrees on transported R_v-units with the ambient embedding.

Its three Checks are identity at e=1, preservation of the rational unit 2 under an embedding with compatible 5-adic orders, and the e=0 embedding ℚ→ℚ(X) from the 5-adic to the X-adic valuation. In the last case every nonzero rational has X-order zero, so 5 maps to an R_w-unit despite being an R_v-nonunit. The ring map exists but is not local.

`residueFieldMap` additionally requires e>0. Then nonzero positive order is reflected, so the subring map is local, and `IsLocalRing.ResidueField.map` supplies k_v→k_w. Its API is evaluation on a reduced subring element, identity and composition (with multiplied ramification indices). Its three Checks are the identity residue map, agreement with reduction on any R_v-unit, and composition on reduced subring elements. The e=0 example above is the necessary non-example: there is no asserted field map 𝔽₅→ℚ. Finite-dimensionality is unnecessary for either construction. The ramified tame-symbol restriction formula remains with the existing residue-restriction target, beyond this stage.

## Coverage, planets and acceptance

The elementary pairing and its four Steinberg cases are fully source-decomposed from the pinned valuation and residue APIs. Milnor descent uses exact imported tensor/homogeneous-component nodes. The two atlas planets retain their original owners and names: **Tame symbol** and **The tame symbol is a Steinberg symbol**. The unit-part bookkeeping and derived uniqueness theorem do not require extra planets.

Coverage is **planned**, and this planning pass is complete. The classical-K₂ transport retains the accepted T.2-symbols packet's stable-colimit witness gap, ultimately T.1's G-colimit, and its exact ordinary root-presentation/Bruhat-coordinate request to ReductiveGroups Layer 7. Those foundations belong to their existing owners. Their statements are imported here without claiming their proof plans are closed. The pairing, Milnor descent and elementary uniqueness do not use classical injectivity. The finite-field Matsumoto gap is irrelevant: t^n has order n, so an order-one parameter already gives infinitely many distinct field elements. The arithmetic Bass–Tate gap is likewise outside this stage.

Acceptance requires the complete API and all Checks above, both mixed normalizations, integer negative-order behavior, a proof-witness-independent unit-part function, an explicitly packaged order-zero product, all four Steinberg cases, unique Milnor descent and an explicit surjectivity preimage. Classical transport must use its existing comparison, preserving the source convention rather than silently importing Weibel's inverse. The suggested file elaborates at the recorded pins with proof-placeholder warnings only; its real-bodied light definitions use existing carriers. Homomorphisms whose K-theory carriers are absent at those pins are specified in this document and are not simulated by axioms, placeholder structures or data-valued proof holes.
