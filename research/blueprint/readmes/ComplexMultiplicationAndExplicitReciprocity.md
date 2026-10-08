# Complex multiplication and explicit reciprocity

The goal is an explicit CM library on the atlas’s existing geometry, class-field and representation carriers. It supplies order-sensitive ideal actions, trace/reflex data, normalized reciprocity on torsion and polarization, generators for proved ring/ray class fields, actual CM Hecke realizations, and certified class-polynomial computation. General explicit class fields beyond the proved CM cases remain research frontiers. Height and Colmez comparisons belong to CM Part II; p-converse and Euler-system arguments belong to their applications.

Every declaration below is unchecked. This is a complete target-level plan: every mathematical target has a declaration whose dependency chain reaches the pinned libraries, a supplied node, a precise supplier request or a recorded gap. CM.0–CM.5 are planned with explicit refinements; none is source-closed. CM.6 is a process layer in the reviewed library audit and has no mathematical nodes.

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. CM.0 precedes the main CM theorem: ShimuraData D3 supplies generic reflex-field/cocharacter theory. ShimuraVarieties V4 owns the idelic reflex norm and V5 owns the main CM theorem and general Shimura–Taniyama formula. CM.2 imports their conclusions and supplies explicit dictionaries. CM.2 is not a prerequisite of V5.

## Conventions and imported theory

**Artin.** Arithmetic Frobenius x↦x^q; Milne uses geometric art, so substitute s=t⁻¹ throughout the idele formulas.

**idealAction.** Left action [a]⋆[C/Λ]=[C/a⁻¹Λ]; arithmetic Art(a) acts by this action. Ideals of nonmaximal orders are proper invertible fractional ideals; extension/contraction is restricted away from the conductor.

**CMGeometry.** CM endomorphisms are defined over the stated model field, not assumed defined over the CM field. Unpolarized CM-action triples, polarized triples, and level structures have different stabilizers.

**polarization.** Eξ(x,y)=Tr(E/Q)(ξxȳ), ξ̄=−ξ and Im φ(ξ)>0; Eξ(x,Jx)>0. When translating Streng’s E(Jx,y)>0 convention, negate the Riemann form and use its corresponding ξ convention.

**Tate.** Covariant H₁ and Tate module; arithmetic Frobenius has characteristic polynomial X²−a_vX+q. Idelic infinity type (−1,0) corresponds to positive ideal type (1,0).

**orders.** Generic orders, conductor ideals, proper/invertible ideals and Picard groups belong to GlobalNumberFields Layer 11; no higher-dimensional nonmaximal-order class-field theorem is inferred from elliptic CM.

**localEuler.** Local Euler polynomials use R11.5’s H¹_et=V_l(A)∨ and geometric Frobenius. For CM potential good reduction, finite-inertia averaging identifies their determinant with arithmetic Frobenius on covariant Tate invariants. Keep this duality explicit.

**reflexScope.** Embedding-partition types and trace reflex fields work for finite products of CM fields. The unique primitive core and single inverse-coset reflex type are field statements. A common closure contains all factor images, rather than an embedding of a product algebra.

**polarizationComparison.** For f=NΦ(t⁻¹), the E-linear comparison satisfies α(fx)=σ(x) and scales the form by χ_cyc(σ)/(f f̄); the natural Galois torsion map scales by χ_cyc(σ). Uniformization sends I to fI and ξ to ξ χ_cyc(σ)/(f f̄).

**reflexDiscriminant.** The reflex-order discriminant is a relative ideal over O_{E*}. For E=Q(i), O=Z+3Zi, the selected reflex image is O_E and its relative discriminant is 1, while the input order’s absolute Z-discriminant is −36.

A CM field, a totally complex field containing a CM field, a model field on which endomorphisms are defined, a reflex field and a field of moduli are distinct data. Kings–Sprang uses a totally complex field L containing a CM field K; its chosen embeddings lift a type on K. The generic Serre construction and Lie/Hodge realization belong to AbelianSchemesAndArithmeticModuli A0–A4. This roadmap specializes their actual scheme, differential, Tate and comparison carriers.

GlobalNumberFields Layer 11 supplies orders, conductors, proper/invertible ideals, class-group finiteness and extension/contraction. Mathlib’s ClassGroup already uses invertible fractional ideals modulo principals for arbitrary commutative domains and is equivalent to Pic; nonmaximal orders reuse it. A nonzero ideal of a nonmaximal order need not be invertible. EllipticCurves Layer 1, ModularCurvesPartII R12.1 and AbelianSchemesAndArithmeticModuli A5 supply equation/scheme comparison and complex algebraization, transporting origins, endomorphisms, twists, normalized j and isogeny degree.

ModularForms Layer 0 supplies an independent LevelOne.JInputs contract: normalized j, q-expansion and special values, orbit separation, integral modular polynomials and the monic prime diagonal. These inputs precede singular-modulus integrality. ClassFieldTheory Layers 12–13 supply the class-field correspondence and quadratic examples; Chebotarev supplies split-prime existence. GlobalNumberFields Layers 9–10 and the local arithmetic-representation/Néron-model owners supply character conductors, infinity types and all-prime realizations.

ComputationalNumberTheory CN.4 supplies generic validated complex arithmetic, outward products, analytic tails, convergence and integer recovery. CM.5 specializes these to CM root bounds, coefficient height, precision, class census and ordinary order checks. CN.0–CN.3 supply exact finite algorithms and standard CRT arithmetic. A residue root and an endomorphism-order certificate are separate inputs.

## Layer overview

| Stage | Output | Coverage |
| --- | --- | --- |
| CM.0 | Types, primitive field pairs and reflex data | Planned |
| CM.1 | Elliptic ideal actions, CM tensor and Hodge comparisons | Planned |
| CM.2 | Explicit dictionaries after the main theorem | Planned |
| CM.3 | Class polynomials and ring/ray value fields | Planned |
| CM.4 | CM Hecke characters and actual realizations | Planned |
| CM.5 | Reduction, isogeny graphs and certified computation | Planned |
| CM.6 | Examples, exports and limits | Process; no mathematical nodes |

Definitions and constructions have use-derived APIs and at least three tests. Ten consumed API declarations also have lemma nodes in the dependency graph. Acceptance tests distinguish original/reflex fields, maximal/nonmaximal orders, inverse/direct ideal actions, polarized/unpolarized stabilizers, coefficient-algebra/rational Tate ranks, ordinary/supersingular reduction and approximate/certified computation.


## CM.0. Types, primitive pairs and reflex data

For finite CM algebras use their embedding partition and trace-adjoin reflex field. Primitive cores and the single inverse-coset reflex pair require a CM field. The selected tensor factor and its relative integral order keep the reflex base explicit.

**Imported inputs:** mathlib:NumberField.IsCMField; mathlib:NumberField.IsCMField.complexConj; mathlib:NumberField.IsCMField.complexEmbedding_complexConj; mathlib:NumberField.IsCMField.complexConj_apply_apply; mathlib:IntermediateField.adjoin; mathlib:IntermediateField.adjoin_le_iff; ShimuraData:D3; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

<a id="cm-type"></a>
### CM types of finite étale CM algebras

**Declaration:** TauCeti.CM.CMType. **Kind:** definition.

For a finite product E of CM number fields, a CM type Φ is a subset of Hom_Q-alg(E,C) containing exactly one of φ and cφ for every embedding. Use the existing CM-field/conjugation structure on each factor; |Φ|=[E:Q]/2. Conjugate type cΦ is the complement. A CM field is not defined again.

**Construction or proof.**

1. Use the finite set of embeddings of each separable field factor; complex conjugation is fixed-point-free by the baseline CM property.
2. Define the subset by the conjugate-partition law and prove its cardinal by pairing embeddings.

**Direct dependencies:** mathlib:NumberField.IsCMField; mathlib:NumberField.IsCMField.complexConj; mathlib:NumberField.IsCMField.complexEmbedding_complexConj; mathlib:NumberField.IsCMField.complexConj_apply_apply.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Definition 1.8, p.11. The one-per-conjugate-pair definition on a CM algebra.; [AGHMP](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.4 p.420. Finite étale algebra generality is used by total-reflex constructions.

**Planning API.**

- **TauCeti.CM.CMType.ext** (extensionality): Types with the same embedding subset are equal.
- **TauCeti.CM.CMType.mem_conjugate_iff** (characterisation): φ∈cΦ iff φ∉Φ.
- **TauCeti.CM.CMType.card** (data): 2|Φ|=[E:Q].
- **TauCeti.CM.CMType.conjugate_conjugate** (simp): c(cΦ)=Φ.

**Uses driving the API.** MilneCM §1.16: Defines the reflex stabilizer. AGHMP §3.4 and YZ §2.2: Determines CM torus characters and reflex orders. KS Definition 1.8: Controls Lie eigenspaces.

**Unit tests.**

- **TauCeti.CM.CMType.test_gaussian** (computation): For E=Q(i), the type selecting i↦i has cardinal one.
- **TauCeti.CM.CMType.test_not_full** (non-example): The entire embedding set of Q(i) is not a CM type.
- **TauCeti.CM.CMType.test_product** (compatibility): Types on E₁×E₂ correspond to pairs of types, with additive cardinalities.

**Acceptance.** For Q(i), {i↦i} has cardinal one; both embeddings together and the empty set fail. For Q(i)×Q(√−3), a type has one embedding of each factor, cardinal two.

**Atlas planet:** CM type.

<a id="induced-and-primitive-type"></a>
### Induced and primitive CM types

**Declaration:** TauCeti.CM.CMType.IsPrimitive. **Kind:** definition.

For a CM subalgebra E₀⊂E, Φ is induced from Φ₀ iff Φ consists of all embeddings whose restriction belongs to Φ₀. For a CM FIELD E, the pair is primitive iff no proper CM subfield induces its type. Its unique primitive core is the fixed field of the right stabilizer of the extended type in a common Galois CM closure; the reflex field uses the left stabilizer. The field hypothesis is part of Milne Definition 1.8 and Proposition 1.9: no single primitive core is asserted for a product CM algebra.

**Construction or proof.**

1. For E a field, extend the embeddings to a Galois CM closure; right invariance detects restriction to a smaller field.
2. Identify the fixed field and descend the selected embeddings; conjugation shows that the core is CM. General algebra induction is restriction of embeddings, without this primitive-core conclusion.

**Direct dependencies:** [CM types of finite étale CM algebras](#cm-type).

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Proposition 1.9, pp.11–12. The unique primitive subpair is obtained by a right stabilizer.; [Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §4 pp.384–385. Primitivity is required in the class-action/endomorphism statements.

**Planning API.**

- **TauCeti.CM.CMType.induced_mem** (characterisation): φ lies in the induced type iff φ|E₀ lies in Φ₀.
- **TauCeti.CM.CMType.induced_trans** (functoriality): Induction along E₀⊂E₁⊂E₂ equals direct induction.
- **TauCeti.CM.CMType.primitive_core_unique** (universal-property): For E a CM field, any primitive CM subpair inducing Φ is uniquely the embedded primitive core.

**Uses driving the API.** MilneCM §3.13: Determines simplicity and exact rational endomorphism algebra. Tsimerman §4: Separates primitive class actions from induced products.

**Unit tests.**

- **TauCeti.CM.CMType.test_quadratic_primitive** (degenerate): Every CM type on an imaginary quadratic field is primitive.
- **TauCeti.CM.CMType.test_zeta8_induced** (non-example): The stated two embeddings of Q(ζ₈) restrict to the same embedding of Q(√−2), so this type is not primitive.
- **TauCeti.CM.CMType.test_induced_card** (compatibility): For E/E₀ finite, an induced type has cardinal [E:E₀]|Φ₀|.

**Acceptance.** On Q(ζ₈), the type with ζ₈↦ζ₈ and ζ₈↦ζ₈³ is induced from Q(√−2); primitive must fail.

**Atlas planet:** Primitive CM type.

<a id="trace-reflex-field"></a>
### Trace description of the CM reflex field

**Declaration:** TauCeti.CM.CMType.reflexField. **Kind:** construction.

For a finite étale CM algebra E and CM type Φ, choose a common finite Galois CM field L⊂C containing the images of every embedding of every field factor. The reflex field is E*=Q(Σ_{φ∈Φ}φ(a):a∈E)⊂L. Equivalently E*=L^{Stab(Φ)}, where Galois acts on Hom_Q-alg(E,L); if E is a field this is the left stabilizer of the extended type S⊂Gal(L/Q). A product algebra E is not embedded as a subalgebra of L. Identify this actual trace subfield with ShimuraData D3’s cocharacter reflex field, without a second generic carrier.

**Construction or proof.**

1. Represent the trace as the character of the Φ representation.
2. Galois fixes every trace iff it preserves the embedding subset, by linear independence of embeddings.
3. Use D3’s universal fixed-field characterization to construct the comparison.

**Direct dependencies:** [CM types of finite étale CM algebras](#cm-type); mathlib:IntermediateField.adjoin; mathlib:IntermediateField.adjoin_le_iff; ShimuraData:D3.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Proposition 1.16, Definition 1.17 and Proposition 1.18, pp.13–14. Trace generators and left stabilizer define the same reflex field.; [YZ](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §2.2 p.546. The paper uses the trace-defined subfield.

**Planning API.**

- **TauCeti.CM.CMType.typeTrace** (data): typeTraceΦ(a)=Σφ∈Φ φ(a).
- **TauCeti.CM.CMType.reflexField_le_iff** (universal-property): E*⊂F iff every typeTraceΦ(a) belongs to F.
- **TauCeti.CM.CMType.reflexField_stabilizer** (characterisation): Gal(L/E*) is the stabilizer of Φ in Hom_Q-alg(E,L); for E a field it is the left stabilizer of its extended type S.
- **TauCeti.CM.CMType.reflexField_generic** (compatibility): The trace subfield is the D3 cocharacter reflex field under its specified embedding.

**Uses driving the API.** MilneCM §1.21: Field of definition of the type representation. YZ §2.2: Defines the reflex order. CM.2: States reciprocity over the reflex field rather than the CM/model field.

**Unit tests.**

- **TauCeti.CM.CMType.test_reflex_quadratic** (computation): The reflex field of Q(i) with i↦i is Q(i) inside C.
- **TauCeti.CM.CMType.test_reflex_induced** (compatibility): An induced type and its primitive core have the same reflex field.
- **TauCeti.CM.CMType.test_reflex_not_Q** (non-example): For the selected Gaussian type, typeTrace(i)=i, so the reflex field is not Q.

**Acceptance.** For an imaginary quadratic field, E*=the selected embedded copy of E. Inducing a type does not change its reflex field; this is not the primitive-core fixed field in general.

**Atlas planet:** Reflex field.

<a id="reflex-type"></a>
### Inverse-coset construction of the reflex type

**Declaration:** TauCeti.CM.CMType.reflexType. **Kind:** construction.

Let E be a CM FIELD and Φ a CM type. Let L/Q be a finite Galois CM closure containing E, G=Gal(L/Q), H=Gal(L/E) and S={g:g|E∈Φ}. Put H*=Stab_left(S); the inverse set S⁻¹ is right H*-stable and defines Φ* on E*=L^{H*}. This is independent of L. The reflex pair is primitive; its double reflex is the primitive core of (E,Φ), and recovers the original pair only when Φ is primitive. This single inverse-coset reflex-type construction is field-scoped; the trace reflex field of a CM algebra remains available separately.

**Construction or proof.**

1. Invert the extended embedding set and descend through its right H* invariance.
2. Compare in a larger Galois closure by restriction; apply the two stabilizer descriptions.

**Direct dependencies:** [CM types of finite étale CM algebras](#cm-type); [Induced and primitive CM types](#induced-and-primitive-type); [Trace description of the CM reflex field](#trace-reflex-field); [CMType.reflexField_stabilizer](#trace-reflex-field-api-reflexField-stabilizer).

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Examples 1.19 and 1.28, pp.14,19. Reflex embeddings arise by inverting the extended type, with double reflex giving the primitive core.

**Planning API.**

- **TauCeti.CM.CMType.reflexType_mem** (characterisation): g|E*∈Φ* iff g⁻¹∈S.
- **TauCeti.CM.CMType.reflexType_primitive** (structure): The reflex type is primitive.
- **TauCeti.CM.CMType.doubleReflex_primitiveCore** (compatibility): The double reflex is canonically the primitive core, with the original embedded pair recovered in the primitive case.

**Uses driving the API.** MilneCM §1.24 and Streng §2.6: Defines the algebraic product used by the imported torus norm. Tsimerman §5: Specifies the direction Cl(E*)→Cl(E).

**Unit tests.**

- **TauCeti.CM.CMType.test_reflex_type_quadratic** (computation): The Gaussian type is its own reflex type after identifying its embedded reflex field.
- **TauCeti.CM.CMType.test_double_reflex_induced** (non-example): For the Q(ζ₈) type induced from Q(√−2), the double reflex has degree two.
- **TauCeti.CM.CMType.test_closure_independence** (compatibility): Two extensions of the same reflex embedding give the same inverse-coset membership; enlarging the normal closure therefore preserves the embedded reflex pair.

**Acceptance.** A nonprimitive Q(ζ₈) type has quadratic double reflex, not the original quartic field.

**Atlas planet:** Reflex type.

<a id="type-product-identities"></a>
### Type-product, conjugation and change-of-type identities

**Declaration:** TauCeti.CM.CMType.typeNorm_identities. **Kind:** theorem.

For a CM FIELD E with type Φ and reflex type Φ* on E*, and a∈(E*)×, NΦ(a)=∏ψ∈Φ*ψ(a) lies in E×, satisfies NΦ(a)·overline{NΦ(a)}=N_{E*/Q}(a), and is multiplicative. For γ∈Gal(Qbar/Q), transport the embedded pairs: N_{γΦ}(γa)=γNΦ(a). Induction from the primitive core leaves the reflex field unchanged and the map to E is the inclusion of the primitive-core type product. These are algebraic formulas, not another construction of V4’s idelic torus norm. For product CM algebras use V4’s cocharacter norm rather than asserting one primitive reflex pair.

**Construction or proof.**

1. Use the inverse-coset description to show Galois invariance under H.
2. Multiply over Φ* and cΦ* to obtain the full field norm.
3. Transport every factor under γ and use induction/restriction of embeddings.

**Direct dependencies:** [Inverse-coset construction of the reflex type](#reflex-type); mathlib:NumberField.IsCMField.complexEmbedding_complexConj.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Proposition 1.23, Remark 1.24 and Proposition 1.26, pp.15–17; Example 1.28, p.19. The product formula, conjugate product and induced-type norm identity.

**Acceptance.** For quadratic E=E*, NΦ is the identity under the selected embedding; NΦ(2+i)·its conjugate=5. Replacing Φ by its conjugate conjugates the norm, rather than leaving it equal.

<a id="reflex-order"></a>
### The CM reflex order

**Declaration:** TauCeti.CM.CMType.reflexOrder. **Kind:** construction.

For a CM field E with order O and type Φ, use E* and YZ §2.2’s trace-selected splitting E*⊗_Q E=~E_Φ⊕~E_Φ^c. Define R_Φ as the image of O_{E*}⊗_Z O in ~E_Φ. It is an O_{E*}-order in that finite étale E*-algebra. Define d_Φ as its RELATIVE trace-discriminant ideal in O_{E*}, distinct from the absolute discriminant of O or E. It need not generally be the full integral closure. In the quadratic case E*=E and ~E_Φ=E, the first tensor factor already maps onto O_E, so R_Φ=O_E for every O⊂O_E and d_Φ=(1).

**Construction or proof.**

1. Use the type-trace primitive idempotent to specify the quotient factor.
2. Take the actual image subring and its finite full-rank module, using GN11’s order carrier.
3. Define its discriminant through the supplier trace pairing.

**Direct dependencies:** [Trace description of the CM reflex field](#trace-reflex-field); [CM types of finite étale CM algebras](#cm-type); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [YZ](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §2.2 p.546. The image order is defined before its discriminant.

**Planning API.**

- **TauCeti.CM.CMType.reflexOrder_image** (characterisation): Elements of RΦ are images of elements of OE*⊗O.
- **TauCeti.CM.CMType.reflexOrder_fractionAlgebra** (structure): RΦ⊗Q is the selected factor ~EΦ.
- **TauCeti.CM.CMType.reflexOrder_discriminant** (data): dΦ is the relative O_{E*}-ideal discriminant of the trace pairing on RΦ, using GN11’s order/discriminant carrier; it is not disc_Z(O).

**Uses driving the API.** YZ §2.2: Supplies dΦ for the height consumer, which is owned by its Part II. CM.2 and CM.5: Keeps integral order and ramification restrictions visible.

**Unit tests.**

- **TauCeti.CM.CMType.test_reflex_order_quadratic** (computation): For a maximal imaginary quadratic order, RΦ identifies with OE.
- **TauCeti.CM.CMType.test_reflex_order_image** (characterisation): Every product of images of OE* and O lies in RΦ, and their Z-span is all of RΦ.
- **TauCeti.CM.CMType.test_order_discriminant** (non-example): For E=Q(i) and O=Z+3Zi, the reflex image RΦ is O_E and its relative discriminant dΦ is the unit ideal, although disc_Z(O)=−36. Using the absolute discriminant of O as dΦ gives the wrong answer.

**Acceptance.** For any imaginary quadratic O⊂OE, the selected factor is E, the image is OE and the relative discriminant is the unit ideal. In higher degree, do not simplify the image to its integral closure without a proof. Extending YZ’s maximal-order input to O requires the image/full-rank argument.

**Atlas planet:** Reflex order.

<a id="non-galois-quartic-example"></a>
### A non-Galois quartic CM type and its reflex

**Declaration:** TauCeti.CM.nonGaloisQuarticExample. **Kind:** application.

Let a=i√(3+√2), b=i√(3−√2), E=Q(a), and Φ send a to a and b. Then a⁴+6a²+7=0, E has real subfield Q(√2), E/Q is non-Galois, Φ is primitive, and E*=Q(a+b), with (a+b)⁴+12(a+b)²+8=0 and real subfield Q(√7). In the D₄ Galois closure, the inverse-coset construction gives Φ*; recover E by the double reflex. The two quartic fields must not be identified by degree alone.

**Construction or proof.**

1. Prove 3±√2 are totally positive and 7 is not a square in Q(√2), giving a nonnormal quartic CM field and its D₄ closure.
2. Compute a·b=−√7 and (a+b)²=−6−2√7; calculate type traces of the basis 1,a,a²,a³.
3. Their generated field is Q(a+b); the D₄ left and right stabilizers give primitive type and double reflex.

**Direct dependencies:** [Trace description of the CM reflex field](#trace-reflex-field); [Inverse-coset construction of the reflex type](#reflex-type); [Type-product, conjugation and change-of-type identities](#type-product-identities).

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §1 pp.11–19, stabilizer construction. Apply the explicit stabilizer/trace construction to a verified quartic example, rather than quoting an example from the source.

**Acceptance.** Check both quartic polynomials, different real subfields and the complete embedding partition. Degree four alone is not the criterion for primitivity.

<a id="nonmaximal-quadratic-example"></a>
### Conductor-sensitive nonmaximal quadratic order example

**Declaration:** TauCeti.CM.nonmaximalGaussianExample. **Kind:** application.

For E=Q(i), O=Z+3Zi has conductor 3OE, discriminant −36, units {±1}, and |Pic(O)|=2 whereas |Cl(OE)|=1. The invertible O-ideal a=(2,1+3i) has norm 2 and represents the nontrivial class of order two. Ideals meeting the conductor cannot be transported by the prime-to-conductor extension/contraction equivalence without an additional argument.

**Construction or proof.**

1. Apply the GN11 quadratic-order conductor/index and class number formulas to f=3; the unit index is two and (−4/3)=−1, giving class number 3(1+1/3)/2=2.
2. The norm-two ideal is prime to the conductor and has multiplier O. Norm 2 has no generator x+3yi since x²+9y²=2 has no integer solution; hence it is nonprincipal.
3. Use order-two Picard cardinality to identify its square as principal.

**Direct dependencies:** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; [CM types of finite étale CM algebras](#cm-type); mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf), §16.3, Definition 16.9 and Theorem 16.12, pp.6–7. Use proper invertible ideals of the specified order, not all ideals of its maximal order.; [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §9 p.78, footnote 25. Integral Tate lattices over orders require the index-prime restriction.

**Acceptance.** Reject a maximal-order class-group replacement: it gives cardinal one and extra units. Reject a rule declaring every nonzero ideal of O invertible.

<a id="trace-reflex-field-api-reflexField-stabilizer"></a>
### CMType.reflexField_stabilizer

**Declaration:** TauCeti.CM.CMType.reflexField_stabilizer. **Kind:** lemma.

Gal(L/E*) is the stabilizer of Φ in Hom_Q-alg(E,L); for E a field it is the left stabilizer of its extended type S.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [Trace description of the CM reflex field](#trace-reflex-field).

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Proposition 1.16, Definition 1.17 and Proposition 1.18, pp.13–14. Trace generators and left stabilizer define the same reflex field.; [YZ](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §2.2 p.546. The paper uses the trace-defined subfield.

**Acceptance.** For an imaginary quadratic field, E*=the selected embedded copy of E. Inducing a type does not change its reflex field; this is not the primitive-core fixed field in general.

**Layer refinements.** Match D3’s CM-algebra cocharacter/trace reflex-field comparison and GN11’s selected-factor fraction algebra and relative reflex-order discriminant. Keep primitive cores and inverse-coset reflex pairs field-scoped.

## CM.1. Elliptic ideal actions and CM tensor geometry

Use proper invertible ideals of the specified imaginary quadratic order, with inverse-ideal action. Tensor/Hodge targets use the generic abelian-scheme theory over the stated base, including the differential inverse action and the two different period pairings.

**Imported inputs:** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; AbelianSchemesAndArithmeticModuli:A5; ModularCurvesPartII:R12.1; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End; mathlib:WeierstrassCurve.j; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; tauceti:TauCeti.Isogeny; tauceti:TauCeti.Isogeny.degree; AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties; GeometryOfNumbersAndQuadraticArithmetic:GN.3; AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism; tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5; AbelianSchemesAndArithmeticModuli:A0; AbelianSchemesAndArithmeticModuli:A1; mathlib:CommRing.Pic.mapAlgebra; AbelianSchemesAndArithmeticModuli:A4.

<a id="ideal-lattice-curve"></a>
### The elliptic curve of an ideal lattice

**Declaration:** TauCeti.CM.idealLatticeCurve. **Kind:** construction.

Fix an imaginary quadratic field E⊂C, an order O⊂E and a proper invertible fractional O-ideal I. Its image Λ=I⊂C is a rank-two Z-lattice. Apply A5/R12.1 uniformization to construct the actual elliptic scheme E_I and a Weierstrass equation whose analytic group is C/Λ; the multiplier ring {x∈E:xI⊂I} acts on E_I and identifies with End_C(E_I)=O. The chosen equation is compared through EC1/R12.1, not treated as a new curve carrier.

**Construction or proof.**

1. Embed I as a lattice using its finite full-rank order module.
2. Invoke the supplied analytic quotient/algebraization and transport Weierstrass/scheme data through EC1/R12.1.
3. Full faithfulness identifies analytic scalar endomorphisms with algebraic End and the multiplier ring.

**Direct dependencies:** [CM types of finite étale CM algebras](#cm-type); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; AbelianSchemesAndArithmeticModuli:A5; ModularCurvesPartII:R12.1; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End; mathlib:WeierstrassCurve.j; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf), Introduction p.1; Theorem 16.4 pp.4–5; §16.3 pp.6–7. The ideal-lattice construction is an instance of complex uniformization.; [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Proposition 3.17, p.31. Lattice homotheties classify the CM objects.

**Planning API.**

- **TauCeti.CM.idealLatticeCurve.uniformization** (compatibility): E_I(C)≅C/I as complex Lie groups, carrying its origin and O-action.
- **TauCeti.CM.idealLatticeCurve.homothety** (equivalence): For u∈E×, multiplication by u induces an O-linear isomorphism E_I≅E_{uI}.
- **TauCeti.CM.idealLatticeCurve.endomorphismRing** (characterisation): End(E_I) is the actual multiplier ring of I, equal to O for proper I.
- **TauCeti.CM.idealLatticeCurve.j** (data): The pinned Weierstrass j equals normalized modular j(τ) for any oriented basis I=Zω₁+Zω₂, τ=ω₂/ω₁ in H.

**Uses driving the API.** CM.3 class polynomial: Supplies the normalized j-values indexed by Pic(O). GZ Chapter III §4: Provides the complex Hom/order dictionary. BT §3.1: Provides the CM elliptic scheme used in the self-twist comparison.

**Unit tests.**

- **TauCeti.CM.idealLatticeCurve.test_gaussian** (computation): The square lattice gives j=1728 and four origin-preserving automorphisms.
- **TauCeti.CM.idealLatticeCurve.test_nonmaximal** (non-example): For O=Z+3Zi and I=O, multiplication by i fails to preserve I and is not an endomorphism.
- **TauCeti.CM.idealLatticeCurve.test_scale** (compatibility): Replacing I by 2I gives an isomorphic CM elliptic scheme and the same j.

**Acceptance.** For I=Z[i], j(E_I)=1728 and End is Z[i]. For I=Z+3Zi, End is precisely that order; its missing i cannot be inserted.

**Atlas planet:** Elliptic CM lattice.

<a id="ideal-action"></a>
### The left ideal action on CM elliptic curves

**Declaration:** TauCeti.CM.idealAction. **Kind:** construction.

For a proper invertible fractional O-ideal a, define [a]⋆E_I=E_{a⁻¹I}. For an integral invertible a, inclusion I⊂a⁻¹I gives an O-linear isogeny φ_a:E_I→E_{a⁻¹I} with kernel a⁻¹I/I. Transport it to the existing Weierstrass isogeny. Ideal multiplication is compatible with composition, with the target of the second map tracked; principal ideals act trivially on isomorphism classes, but their chosen maps need not be identity maps.

**Construction or proof.**

1. Take inverse and product in GN11’s invertible fractional-ideal carrier.
2. Apply the lattice construction to a⁻¹I; inclusion gives the analytic quotient map.
3. Algebraize by A5’s full faithfulness and compare to the pinned degree through EC1/R12.1.

**Direct dependencies:** [The elliptic curve of an ideal lattice](#ideal-lattice-curve); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv; tauceti:TauCeti.Isogeny; tauceti:TauCeti.Isogeny.degree; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas. The inverse-ideal left action fixes the sign used by arithmetic reciprocity.; [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter III §4 p.257, equation (4.2). The CM Hom module has its ideal norm degree formula.

**Planning API.**

- **TauCeti.CM.idealAction.one** (simp): [O]⋆E_I=E_I up to the specified O-linear identification.
- **TauCeti.CM.idealAction.mul** (functoriality): [ab]⋆E_I=[a]⋆([b]⋆E_I), with the canonical multiplication identification of lattices.
- **TauCeti.CM.idealAction.kernel** (data): For integral invertible a, ker φ_a=a⁻¹I/I as an O-module.
- **TauCeti.CM.idealAction.principal** (compatibility): For a=(u), multiplication by u identifies a⁻¹I with I and trivializes the class action.

**Uses driving the API.** MIT21 §21.1: Matches arithmetic Frobenius. CM.3: Permutes class-polynomial roots. CM.5: Identifies horizontal isogenies with proper ideal classes.

**Unit tests.**

- **TauCeti.CM.idealAction.test_gaussian_prime** (computation): a=(2+i) on Z[i] gives a kernel of cardinal 5.
- **TauCeti.CM.idealAction.test_inverse** (characterisation): Acting by a and a⁻¹ successively returns the same CM isomorphism class.
- **TauCeti.CM.idealAction.test_conductor** (non-example): The conductor ideal 3Z[i] as an ideal of Z+3Zi is not an admissible invertible ideal for this action.

**Acceptance.** For O=Z[i] and a=(2+i), the map has degree 5 and target is isomorphic to the original curve. For O=Z+3Zi, the norm-two nonprincipal ideal changes the CM isomorphism class.

**Atlas planet:** Ideal action.

<a id="picard-classification"></a>
### Elliptic CM Picard classification

**Declaration:** TauCeti.CM.idealAction.picardEquiv. **Kind:** theorem.

The map [I]↦[E_I,O-action] is a bijection Pic(O)→the complex O-linear isomorphism classes of elliptic curves with the fixed embedded CM type and full endomorphism ring O. The ideal action is simply transitive. Forgetting the specified action/type requires the conjugation adapter; the statement does not replace Pic(O) by Cl(O_E).

**Construction or proof.**

1. Every complex elliptic curve is uniformized by a rank-two lattice.
2. A fixed quadratic CM action turns that lattice into a proper invertible O-ideal up to scalar; invoke the quadratic-order lattice dictionary from GN11.
3. Full faithfulness gives precisely O-linear homotheties; multiplication of ideal classes gives the torsor.

**Direct dependencies:** [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [The left ideal action on CM elliptic curves](#ideal-action); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas. Ideal homothety classes classify elliptic curves with the specified CM order.

**Acceptance.** O=Z+3Zi yields exactly two classes, while O_E=Z[i] yields one.

**Atlas planet:** Elliptic CM classification.

<a id="automorphism-factors"></a>
### Exceptional CM automorphism factors

**Declaration:** TauCeti.CM.idealLatticeCurve.automorphism_factors. **Kind:** theorem.

For E_I/C with full quadratic order O, Aut(E_I,0)=O×. Its order is 6 for O=Z[ζ₃] (j=0), 4 for O=Z[i] (j=1728), and 2 for every other quadratic order. This concerns origin-preserving automorphisms, not translations. In counting isogeny kernels or level orbits, retain these factors; level N≥3 rigidifies a polarized elliptic object when the characteristic is prime to N.

**Construction or proof.**

1. Invertible analytic scalar endomorphisms are exactly O×.
2. Use the quadratic-order roots-of-unity classification supplied by GN11 through LC.
3. Apply the supplied polarized level-rigidity theorem, without extending it to unpolarized higher-dimensional CM objects.

**Direct dependencies:** [The elliptic curve of an ideal lattice](#ideal-lattice-curve); tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv; AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties; [idealLatticeCurve.endomorphismRing](#ideal-lattice-curve-api-endomorphismRing).

**Sources:** [MIT22](https://math.mit.edu/classes/18.783/2023/LectureNotes22.pdf), Remark 22.2, pp.1–2. Exceptional automorphisms act on cyclic subgroups and change graph multiplicities.

**Acceptance.** The nonmaximal Gaussian order of conductor 3 has only ±1, despite its CM field containing i.

<a id="quadratic-forms-dictionary"></a>
### Positive forms, CM points and ideal classes

**Declaration:** TauCeti.CM.quadraticFormsDictionary. **Kind:** comparison.

For a negative discriminant D≡0 or 1 mod 4, primitive positive definite integral binary quadratic forms [a,b,c] with b²−4ac=D modulo SL₂(Z) correspond to proper invertible ideals of O_D up to homothety and to oriented CM points modulo SL₂(Z). Send [a,b,c] to the ideal Za+Z(−b+√D)/2 and τ=(−b+√D)/(2a)∈H. Restrict to primitive forms; reduced representatives enumerate Pic(O_D), with the usual boundary identifications and automorphism stabilizers.

**Construction or proof.**

1. Identify the multiplier of the displayed ideal with O_D using primitivity.
2. Translate an oriented ideal basis to τ and verify the SL₂ change-of-basis formulas.
3. Use GN11 reduction and the exceptional automorphism factors already identified.

**Direct dependencies:** [Elliptic CM Picard classification](#picard-classification); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; ModularCurvesPartII:R12.1; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; GeometryOfNumbersAndQuadraticArithmetic:GN.3.

**Sources:** [MIT16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf), §16.3, Definition 16.9 and Theorem 16.12, pp.6–7. The ideal/lattice dictionary yields the quadratic-form version used by Heegner-point consumers.; [CRT](https://arxiv.org/pdf/0903.2785v4), §5.2, polycyclic/reduced-form enumeration. Finite class enumeration uses reduced forms of the order discriminant.

**Acceptance.** For D=−36 the reduced classes [1,0,9] and [2,2,5] give the two proper classes. An imprimitive form describes a different order and must not enter H_D.

<a id="ideal-isogeny-degree"></a>
### Degree of an ideal isogeny

**Declaration:** TauCeti.CM.idealAction.degree_eq_norm. **Kind:** theorem.

For an integral proper invertible quadratic-order ideal a prime to its conductor, deg(φ_a)=|a⁻¹I/I|=N_O(a)=[O:a]. This is total scheme degree; in characteristic zero all these maps are separable. Multiplication by u∈O has degree |N_{E/Q}(u)|. Compatibility must identify this index with TauCeti.Isogeny.degree, not with a chosen equation’s polynomial degree.

**Construction or proof.**

1. Compute the finite lattice quotient using local freeness of invertible ideals.
2. Invoke analytic/algebraic comparison and the supplier finite-kernel degree theorem.
3. Compare the native Weierstrass pullback degree with the scheme degree through EC1/R12.1.

**Direct dependencies:** [The left ideal action on CM elliptic curves](#ideal-action); tauceti:TauCeti.Isogeny.degree; AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; [idealAction.kernel](#ideal-action-api-kernel).

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas. The ideal norm is the isogeny degree.; [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter III §4 p.257. The Hom-ideal norm formula agrees with the lattice index.

**Acceptance.** For (2+i) the degree is 5; for integer [n] the degree is n², not n.

<a id="rational-cm-self-twist"></a>
### The rational CM quadratic self-twist isogeny

**Declaration:** TauCeti.CM.rationalCMSelfTwist. **Kind:** theorem.

Let E/Q be an elliptic curve with End_Qbar(E) an order in an imaginary quadratic K. For its quadratic character χ_K, E and the Weierstrass quadratic twist E^{χ_K} are Q-isogenous. Choose a nonzero anti-invariant α∈O (ᾱ=−α); under the standard K-isomorphism from the twist to E, multiplication by α descends to the required Q-isogeny. Transport between the equation and elliptic-scheme carriers through EC1/R12.1. Its kernel/degree is the existing ideal/multiplication map, not an asserted isomorphism.

**Construction or proof.**

1. The nontrivial automorphism of K conjugates CM scalar α to −α.
2. The twist descent cocycle is [−1], so composition with its K-isomorphism makes the two signs cancel.
3. Apply equation/scheme descent and compute degree by the preceding norm theorem.

**Direct dependencies:** [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [Degree of an ideal isogeny](#ideal-isogeny-degree); tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv.

**Sources:** [BT](https://arxiv.org/pdf/2506.03465v2), §3.1, proof of Theorem 1.1, preprint p.6. This CM comparison supplies the self-twist input of the converse consumer; the Selmer comparison remains with that consumer.

**Acceptance.** For y²=x³−x and K=Q(i), α=i gives degree-one self-twist; for a nonmaximal order, use its actual anti-invariant element, not i if i is absent.

<a id="cm-serre-tensor"></a>
### Serre tensoring by a CM ideal

**Declaration:** TauCeti.CM.cmSerreTensor. **Kind:** construction.

Let L be a totally complex number field containing a CM field K, Σ the lifts to L of a fixed CM type on K, and A/S an abelian scheme of relative dimension [L:Q]/2 with O_L-action and Lie(A/S) projective over O_L⊗O_S. For a finite projective right O_L-module M, specialize A0/A1’s Serre tensor M⊗_{O_L}A; for a fractional invertible ideal a this has the same lifted CM type. The inclusion a⊂b gives an isogeny a⊗A→b⊗A. Do not re-own generic tensoring or relative Lie/cohomology carriers.

**Construction or proof.**

1. Import the fppf-sheaf Serre tensor construction and its independence of a projective presentation.
2. On a local direct-summand presentation, identify the inherited O_L action and Lie as M⊗Lie A.
3. Use the CM-type restriction to keep the eigensummands; glue via A1 base change.

**Direct dependencies:** [CM types of finite étale CM algebras](#cm-type); AbelianSchemesAndArithmeticModuli:A0; AbelianSchemesAndArithmeticModuli:A1; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety; mathlib:CommRing.Pic.mapAlgebra.

**Sources:** [KS](https://arxiv.org/pdf/1912.03657v4), §1.2, Definition 1.8 and equation (1.2.3), p.9. Generic Serre tensor is specialized to the CM action and projective Lie hypothesis.

**Planning API.**

- **TauCeti.CM.cmSerreTensor.unit** (simp): O_L⊗A≅A as O_L-abelian schemes.
- **TauCeti.CM.cmSerreTensor.assoc** (functoriality): M⊗(N⊗A)≅(M⊗N)⊗A with the tensor actions and associativity specified.
- **TauCeti.CM.cmSerreTensor.lie** (compatibility): Lie(M⊗A)=M⊗_{O_L}Lie(A), compatible with the lifted Σ type.
- **TauCeti.CM.cmSerreTensor.baseChange** (functoriality): Serre tensor commutes with every allowed base change S′→S.

**Uses driving the API.** KS §1.2: Ideal inclusions and c-torsion isogenies. KS Proposition 1.11: Transports the CM Lie/Hodge eigenspaces. CM.2: Connects ideal and adelic realizations in dimensions above one.

**Unit tests.**

- **TauCeti.CM.cmSerreTensor.test_unit** (degenerate): Tensoring by O_L is the original CM abelian scheme.
- **TauCeti.CM.cmSerreTensor.test_directSum** (compatibility): Tensoring by O_L⊕O_L is A×A, with doubled relative dimension.
- **TauCeti.CM.cmSerreTensor.test_torsion_excluded** (non-example): O_L/c is not a projective lattice and its tensor is not covered by the abelian-scheme construction.

**Acceptance.** M=O_L returns A; M=a⊕b gives the product of the two ideal tensors. Nonprojective torsion M is outside the abelian-scheme preservation contract.

**Atlas planet:** CM Serre tensor.

<a id="cm-tensor-kernel-degree"></a>
### CM tensor ideal inclusions and their kernels

**Declaration:** TauCeti.CM.cmSerreTensor.ideal_kernel_degree. **Kind:** theorem.

Under the CM Serre-tensor hypotheses, a⊂b induces a finite flat isogeny of degree [b:a]. For a nonzero integral ideal c⊂O_L, A→c⁻¹⊗A is the c-multiplication map, its kernel is A[c]=⋂_{x∈c}ker[x], and its degree is N_L/Q(c). For c=(n), the degree is n^{[L:Q]}=n^{2d}; these are finite flat degrees, including inseparable contributions in residue characteristic.

**Construction or proof.**

1. Use projectivity to reduce locally to rank-one ideal changes.
2. Apply A1 finite-flat kernel and degree compatibility, preserving the exact sequence of ideal modules.
3. For principal c compare with multiplication by n on a d-dimensional abelian scheme.

**Direct dependencies:** [Serre tensoring by a CM ideal](#cm-serre-tensor); AbelianSchemesAndArithmeticModuli:A1; AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism.

**Sources:** [KS](https://arxiv.org/pdf/1912.03657v4), §1.2 pp.8–9. The ideal-tensor degree and c-torsion formulas are independent of elliptic-only ideal classification.

**Acceptance.** For d=2, [n] has degree n⁴; n² would incorrectly reuse the elliptic result.

<a id="cm-hodge-eigenspaces"></a>
### CM Lie and Hodge eigenspace comparison

**Declaration:** TauCeti.CM.cmHodgeEigenspaces. **Kind:** comparison.

For the KS CM scheme over R⊂C containing O_{L^Gal}[1/d_L], with lifted type Σ, Lie(A/R) is of type Σ. The covariant Hodge exact sequence 0→ω_{A∨/R}→H_A→Lie(A/R)→0 splits as O_L-eigenspaces H_A(Σ̄)⊕H_A(Σ); the first is ω_{A∨}, the second Lie(A). For the source’s inverse torus action on invariant differentials, ω_A=⊕σ∈Σ ω_A(−σ) and γ∈O_L× acts by σ(γ)⁻¹. This inverse action is distinguished from pullback by the multiplication map.

**Construction or proof.**

1. After inverting d_L, split O_L⊗R using its orthogonal embedding idempotents.
2. Apply the supplied covariant Hodge exact sequence and projectivity of the Lie eigensummands.
3. Dualize the Lie module with the source torus action; distinguish contragredient action from differential pullback.

**Direct dependencies:** [Serre tensoring by a CM ideal](#cm-serre-tensor); AbelianSchemesAndArithmeticModuli:A4; AbelianSchemesAndArithmeticModuli:A0; mathlib:CommRing.Pic.mapAlgebra; [cmSerreTensor.lie](#cm-serre-tensor-api-lie).

**Sources:** [KS](https://arxiv.org/pdf/1912.03657v4), Proposition 1.11 and Corollary 1.12, pp.10–11; images checked. The bars and inverse character in the printed eigenspace/filtration formulas are retained.

**Acceptance.** For a Gaussian type, Lie selects i while the dual-abelian invariant form in the Hodge sequence selects the conjugate embedding. A diagonal action σ(γ) instead of σ(γ)⁻¹ fails the source invariant-differential convention.

<a id="cm-period-pairings"></a>
### CM period and de Rham pairings

**Declaration:** TauCeti.CM.cmPeriodPairings. **Kind:** comparison.

Under the same complex CM scheme hypotheses, the degree-one integration pairing restricts to ω_{A/C}×H₁(A(C),Z)→C^Σ. The O_L-linear de Rham duality and Hodge decomposition induce a nondegenerate pairing overline{ω_{A/C}}×ω_{A∨/C}→C^{Σ̄}. Its first argument is the complex-conjugate vector space; it is not the bilinear pairing ω_A×ω_{A∨} without conjugation. All degree-one carriers and their comparison maps are imported from A4.

**Construction or proof.**

1. Restrict A4 integration to type-selected invariant forms.
2. Use the eigenspace comparison to restrict de Rham duality after complex conjugation.
3. Nondegeneracy follows eigensummand by eigensummand from the supplied perfect duality.

**Direct dependencies:** [CM Lie and Hodge eigenspace comparison](#cm-hodge-eigenspaces); AbelianSchemesAndArithmeticModuli:A4.

**Sources:** [KS](https://arxiv.org/pdf/1912.03657v4), Corollary 1.13, p.11; formula image checked. The two pairings have different conjugations and codomains.

**Acceptance.** For dimension two, the codomain has two selected complex coordinates, not a single arbitrary period.

<a id="ideal-lattice-curve-api-endomorphismRing"></a>
### idealLatticeCurve.endomorphismRing

**Declaration:** TauCeti.CM.idealLatticeCurve.endomorphismRing. **Kind:** lemma.

End(E_I) is the actual multiplier ring of I, equal to O for proper I.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [The elliptic curve of an ideal lattice](#ideal-lattice-curve).

**Sources:** [MIT16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf), Introduction p.1; Theorem 16.4 pp.4–5; §16.3 pp.6–7. The ideal-lattice construction is an instance of complex uniformization.; [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Proposition 3.17, p.31. Lattice homotheties classify the CM objects.

**Acceptance.** For I=Z[i], j(E_I)=1728 and End is Z[i]. For I=Z+3Zi, End is precisely that order; its missing i cannot be inserted.

<a id="ideal-action-api-kernel"></a>
### idealAction.kernel

**Declaration:** TauCeti.CM.idealAction.kernel. **Kind:** lemma.

For integral invertible a, ker φ_a=a⁻¹I/I as an O-module.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [The left ideal action on CM elliptic curves](#ideal-action).

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas. The inverse-ideal left action fixes the sign used by arithmetic reciprocity.; [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter III §4 p.257, equation (4.2). The CM Hom module has its ideal norm degree formula.

**Acceptance.** For O=Z[i] and a=(2+i), the map has degree 5 and target is isomorphic to the original curve. For O=Z+3Zi, the norm-two nonprincipal ideal changes the CM isomorphism class.

<a id="cm-serre-tensor-api-lie"></a>
### cmSerreTensor.lie

**Declaration:** TauCeti.CM.cmSerreTensor.lie. **Kind:** lemma.

Lie(M⊗A)=M⊗_{O_L}Lie(A), compatible with the lifted Σ type.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [Serre tensoring by a CM ideal](#cm-serre-tensor).

**Sources:** [KS](https://arxiv.org/pdf/1912.03657v4), §1.2, Definition 1.8 and equation (1.2.3), p.9. Generic Serre tensor is specialized to the CM action and projective Lie hypothesis.

**Acceptance.** M=O_L returns A; M=a⊕b gives the product of the two ideal tensors. Nonprojective torsion M is outside the abelian-scheme preservation contract.

**Layer refinements.** Match A0/A1/A4/A5 and EC1/R12.1 geometry, generic Serre tensor and both KS pairings; collate KS/BT preprints with published versions.

## CM.2. Explicit reciprocity dictionaries

Import V4/V5 before applying arithmetic-Artin normalization. Polarized E-action triples modulo homothety, unpolarized field-type classes and level structures have different stabilizers. General-dimensional lattice classification is retained; the elliptic ideal dictionary alone does not supply it.

**Imported inputs:** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; AbelianSchemesAndArithmeticModuli:A5; AbelianSchemesAndArithmeticModuli:A2/rosati-involution; mathlib:NumberField.IsCMField.complexConj; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; mathlib:NumberField.RingOfIntegers; AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism; ShimuraVarieties:V4; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; ShimuraVarieties:V5; AbelianSchemesAndArithmeticModuli:A4; ArithmeticGaloisRepresentations:R01.6; ShimuraVarieties:V8; mathlib:NumberField.IsCMField.complexConj_eq_self_iff; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; ModularCurvesPartII:R12.6; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module.

<a id="polarized-cm-lattice-data"></a>
### Polarized CM lattice data

**Declaration:** TauCeti.CM.PolarizedCMLattice. **Kind:** definition.

For a CM algebra E of dimension 2g over Q and type Φ, polarized lattice data are a full Z-lattice I⊂E and ξ∈E× with ξ̄=−ξ, Im φ(ξ)>0 for φ∈Φ, and Tr_{E/Q}(ξĪI)⊂Z. Put Eξ(x,y)=Tr(ξxȳ). Require I stable under the specified order O, whose action on E is faithful; proper/invertible is an additional condition, automatic for fractional ideals of the maximal order but not imposed on all higher-dimensional nonmaximal lattices. Principal means I=I^# where I^#={x:Tr(ξx̄I)⊂Z}. Equivalence is (I,ξ)∼(uI,ξ/(uū)) for u∈E×.

**Construction or proof.**

1. Use the CM conjugation and trace to define an alternating integral form.
2. Positivity follows coordinatewise from the chosen embedding signs.
3. Define the dual lattice using the supplier integral pairing; the equivalence relation is checked by scalar transport.

**Direct dependencies:** [CM types of finite étale CM algebras](#cm-type); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; AbelianSchemesAndArithmeticModuli:A5; AbelianSchemesAndArithmeticModuli:A2/rosati-involution; mathlib:NumberField.IsCMField.complexConj; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; mathlib:NumberField.RingOfIntegers.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §2.9 pp.25–26; Proposition 3.17 p.31. The trace form, positivity and lattice rescaling determine the polarization.

**Planning API.**

- **TauCeti.CM.PolarizedCMLattice.form** (data): The alternating Z-form is (x,y)↦Tr(ξxȳ), with Eξ(x,Jx)>0.
- **TauCeti.CM.PolarizedCMLattice.scale** (functoriality): Multiplication by u carries (I,ξ) to (uI,ξ/(uū)) without changing the polarized object.
- **TauCeti.CM.PolarizedCMLattice.principal_iff** (characterisation): The polarization is principal iff I=I^#.
- **TauCeti.CM.PolarizedCMLattice.rosati** (compatibility): The imported Rosati involution on E is CM conjugation.

**Uses driving the API.** MilneCM Theorem 9.17: Tracks both lattice and polarization under reciprocity. Tsimerman §5: Computes the polarized stabilizer. Streng Theorem 2.4: Provides symplectic period matrices for explicit level actions.

**Unit tests.**

- **TauCeti.CM.PolarizedCMLattice.test_square** (computation): For (Z[i],i/2), Eξ(1,i)=1 and the polarization is principal.
- **TauCeti.CM.PolarizedCMLattice.test_negative** (non-example): For type i↦i, ξ=−i/2 violates the positive-imaginary condition.
- **TauCeti.CM.PolarizedCMLattice.test_scale** (compatibility): (2Z[i],i/8) is equivalent to (Z[i],i/2); leaving ξ=i/2 multiplies the form by 4.

**Acceptance.** For E=Q(i), I=Z[i], ξ=i/2 gives the principal square-lattice form with Eξ(1,i)=1. The negative ξ fails positivity for the same selected type.

**Atlas planet:** Polarized CM lattice.

<a id="arbitrary-dimensional-classification"></a>
### CM lattices and ideal isogenies in arbitrary dimension

**Declaration:** TauCeti.CM.arbitraryCMClassification. **Kind:** theorem.

The A5-algebraized polarized CM-action triples of type (E,Φ) correspond to polarized lattice data modulo the displayed E× equivalence. For a CM field with maximal order O_E, unpolarized O_E-equivariant isomorphism classes form a Pic(O_E)-torsor under a⁻¹I and have cardinal h_E. Integral ideals give O_E-linear isogenies of degree N_E/Q(a). If Φ is primitive, the resulting complex abelian variety is simple and End⁰(A)=E; with full O_E action its full End(A)=O_E. A fixed polarization changes the torsor and its stabilizer.

**Construction or proof.**

1. Use rank-one E-module H₁(A,Q) and the type decomposition from A5.
2. Identify O_E-stable full lattices with fractional ideals and E-linear isomorphisms with scalars.
3. For the primitive case use the primitive-core simplicity theorem; trace-and-degree on E gives the norm of the ideal-isogeny kernel.

**Direct dependencies:** [Polarized CM lattice data](#polarized-cm-lattice-data); [Induced and primitive CM types](#induced-and-primitive-type); AbelianSchemesAndArithmeticModuli:A5; AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Propositions 3.12–3.13 and 3.17, pp.29–31. CM-lattice classification and the primitive-type criterion are not elliptic-only.; [Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §4 pp.384–385. The maximal-order CM classes are indexed by the ideal class group.

**Acceptance.** In dimension two, [n] has degree n⁴; an induced product type may have End⁰ larger than E. Do not generalize the maximal-order Picard classification to all higher-dimensional nonmaximal lattices.

**Atlas planet:** CM lattice classification.

<a id="reflex-ideal-map"></a>
### The conductor-restricted reflex ideal map

**Declaration:** TauCeti.CM.reflexIdealMap. **Kind:** construction.

Import V4’s norm NΦ:A_{E*,f}×→A_{E,f}× and compare its algebraic formula to CM.0. For an order O⊂E, let F be the smallest positive integer with F O_E⊂O. For an E*-ideal a prime to NF, apply the maximal-order reflex ideal norm and contract to O, obtaining NΦ,O(a). It is a proper invertible O-ideal. This map is multiplicative, and for principal (u) with u a unit at primes over F its image is (NΦ(u)); after extension back to O_E it is the maximal reflex norm. The map on Picard/ray-class quotients is derived only for the specified modulus and hypotheses.

**Construction or proof.**

1. Invoke V4’s idele norm on uniformizer representatives to define the maximal-order ideal map.
2. Use GN11’s inverse extension/contraction equivalence away from F to descend.
3. Compare with the algebraic product on principal ideals; check independence from idele representatives using local units.

**Direct dependencies:** [Type-product, conjugation and change-of-type identities](#type-product-identities); [Inverse-coset construction of the reflex type](#reflex-type); ShimuraVarieties:V4; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; mathlib:NumberField.RingOfIntegers.

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), §2.6 pp.6–7 and §4.2 p.13. The order-level ideal norm is extension followed by contraction away from F.

**Planning API.**

- **TauCeti.CM.reflexIdealMap.mul** (functoriality): NΦ,O(ab)=NΦ,O(a)NΦ,O(b) for ideals prime to NF.
- **TauCeti.CM.reflexIdealMap.principal** (simp): NΦ,O((u))=(NΦ(u)) under the local prime-to-F condition.
- **TauCeti.CM.reflexIdealMap.extend** (compatibility): Extending NΦ,O(a) to O_E gives the maximal-order reflex ideal norm.
- **TauCeti.CM.reflexIdealMap.conjugate** (relation): NΦ,O(a)·overline{NΦ,O(a)}=N_{E*/Q}(a)O, with the positive rational ideal norm.

**Uses driving the API.** Streng Theorems 2.4–2.5: Computes the new lattice and polarized/level stabilizer. Tsimerman §5: Defines the class map Cl(E*)→Cl(E). CM.3: Specializes the map to the elliptic class action.

**Unit tests.**

- **TauCeti.CM.reflexIdealMap.test_quadratic** (computation): For a quadratic CM pair with maximal order, the map sends (2+i) to (2+i).
- **TauCeti.CM.reflexIdealMap.test_one** (degenerate): The unit ideal maps to the unit ideal.
- **TauCeti.CM.reflexIdealMap.test_conductor_prime** (non-example): The prime-to-F contract cannot be applied to an ideal over 3 for O=Z+3Zi.

**Acceptance.** In the elliptic case this is the identity ideal map under E*=E. At a prime dividing F, invertibility and the contraction equality are not asserted.

**Atlas planet:** Reflex ideal norm.

<a id="normalized-idele-torsion-dictionary"></a>
### Normalized idele and torsion dictionary

**Declaration:** TauCeti.CM.ideleTorsionDictionary. **Kind:** comparison.

Let A/C have CM type (E,Φ), σ∈Aut(C/E*) and t∈A_{E*,f}× with arithmetic Art(t)=σ on E*ab. Put f=NΦ(t)⁻¹. Under the imported V5 theorem, there is an E-linear isomorphism α:V_f(A)→V_f(σA) satisfying α(fx)=σ(x) on rational torsion, with its analytic/algebraic comparison fixed. Equivalently, for a model k containing E* on which all specified E-endomorphisms are defined, use NΦ(N_{k/E*}t_k)⁻¹. No claim is made that a model exists over E or over E* solely from its type. Integral freeness over O⊗Z_l is asserted only at l prime to [O_E:O].

**Construction or proof.**

1. Apply V5 with the geometric representative s=t⁻¹, then replace its f by NΦ(t)⁻¹.
2. Transport the finite-adelic H₁ statement to the actual torsion module using A4/AGR01.6.
3. Use idele norms for the model-field extension and retain the order-index exception at integral primes.

**Direct dependencies:** [The conductor-restricted reflex ideal map](#reflex-ideal-map); ShimuraVarieties:V5; ShimuraVarieties:V4; AbelianSchemesAndArithmeticModuli:A4; ArithmeticGaloisRepresentations:R01.6.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Theorem 9.10 and footnote 25, pp.78–80. Use the imported torsion statement with t⁻¹ to translate geometric art to arithmetic Art.; [MilneFT](https://arxiv.org/pdf/0705.3446v1), §3 pp.20–21. The source explicitly distinguishes art from rec by inversion.

**Acceptance.** For an elliptic quadratic type, the lattice is a⁻¹I under arithmetic Art(a). An ℓ dividing the order index is not allowed to inherit a free rank-one integral O_l module.

<a id="polarization-reciprocity-dictionary"></a>
### The polarization and lattice reciprocity formula

**Declaration:** TauCeti.CM.polarizationReciprocityDictionary. **Kind:** comparison.

With normalized σ,t,f=NΦ(t)⁻¹ as above, an E-linear comparison quasi-isogeny α has finite-adelic realization satisfying α(fx)=σx. Its pairing multiplier is (σEξ)(αx,αy)=[χ_cyc(σ)/(f f̄)]Eξ(x,y), with the compatible rational representative provided by V5. The natural Galois map x↦σx=α(fx) instead has multiplier χ_cyc(σ). The conjugate CM lattice/polarization has type (E,Φ; fI, ξ·χ_cyc(σ)/(f f̄)), interpreted on finite-adelic lattices and their rational comparison. Ideals change the lattice by NΦ(a)⁻¹ with the corresponding positive rational norm factor. Keep ordinary isomorphisms, polarized similitudes and finite-level equivalences distinct.

**Construction or proof.**

1. Translate Theorems 9.10–9.11(c) and 9.17 by s=t⁻¹, using the same comparison map α as the torsion dictionary.
2. The natural Galois map scales the Weil/Tate pairing by χ_cyc; replacing its input by f⁻¹x divides that multiplier by f f̄.
3. Evaluate the trace Riemann form on the changed lattice and compare ξ′=ξ χ_cyc/(f f̄) through A4 and V5.

**Direct dependencies:** [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [Polarized CM lattice data](#polarized-cm-lattice-data); ShimuraVarieties:V5; AbelianSchemesAndArithmeticModuli:A5; AbelianSchemesAndArithmeticModuli:A4.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Remark 9.11(c) and Theorem 9.17, pp.79–81. The uniformization theorem changes both the lattice and its polarization parameter.

**Acceptance.** A formula changing I but keeping ξ without the norm/cyclotomic factor fails already for multiplication by an integer on a polarized surface.

<a id="explicit-level-reciprocity"></a>
### Explicit reciprocity on CM level functions

**Declaration:** TauCeti.CM.explicitLevelReciprocity. **Kind:** theorem.

Let (E,Φ) be primitive, (I,ξ) principally polarized in Streng’s Riemann-form convention, B a symplectic basis, τ its Siegel period matrix, N≥1 and F O_E⊂O with F least. Let f∈F_N have q-expansion in Q(ζ_N) and be finite at τ. For an E*-ideal a prime to NF, choose a symplectic basis C of NΦ,O(a)⁻¹I for the rescaled form N(a)ξ. If C=M B (row convention), then τ′=Mτ, ν(M)=N(a)⁻¹, U=(M mod N)⁻¹ and f(τ)^{Art(a)}=f^U(τ′). Both the coefficient-field action and the inverse matrix are part of the formula.

**Construction or proof.**

1. Choose an idele for a with local component one at NF.
2. Use the normalized type norm and V5 to change the integral lattice and symplectic pairing.
3. Apply V8’s right GSp action, derive the inverse finite matrix and its coefficient Galois action.

**Direct dependencies:** [The conductor-restricted reflex ideal map](#reflex-ideal-map); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The polarization and lattice reciprocity formula](#polarization-reciprocity-dictionary); ShimuraVarieties:V8; AbelianSchemesAndArithmeticModuli:A5; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary.

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), Theorem 2.4 pp.7–8; proof §4.4 pp.15–16. The explicit matrix formula is a consequence of V5, not an additional main CM theorem.

**Acceptance.** N=1 removes the finite level matrix action, but does not remove the lattice class action. For g=1, ν=det; reversing U to M changes arithmetic Frobenius to its inverse.

**Atlas planet:** Shimura reciprocity formula.

<a id="polarized-level-stabilizer"></a>
### The polarized CM level stabilizer

**Declaration:** TauCeti.CM.polarizedLevelStabilizer. **Kind:** definition.

Under the preceding primitive principal-polarization hypotheses, H_{Φ,O}(N) is the subgroup of I_{E*}(NF) consisting of ideals a for which NΦ,O(a)=µO for some µ∈E×, µµ̄=N_{E*/Q}(a) as positive rational elements and µ≡1 mod× NO. The last congruence means µ=u/v with u,v∈O both units modulo NF O and u≡v mod NO, as in Streng. At N=1 it is the polarized stabilizer. Distinguish it from ker(Cl(E*)→Cl(E)), which forgets the norm-compatible polarization trivialization.

**Construction or proof.**

1. Express principality of the image ideal and the norm equation in the generic ideal carrier.
2. Use the native ray congruence on fractional units, not the equation µ−1∈NO without denominator hypotheses.
3. Multiplicativity and inverse laws follow by multiplying the witnesses.

**Direct dependencies:** [The conductor-restricted reflex ideal map](#reflex-ideal-map); [Polarized CM lattice data](#polarized-cm-lattice-data); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), Theorem 2.5 and Definition 2.7, pp.7–8. The exact ideal subgroup includes both the polarized norm equation and the local multiplicative level congruence.

**Planning API.**

- **TauCeti.CM.polarizedLevelStabilizer.mem_iff** (characterisation): Membership is exactly existence of µ with the three specified equations/congruence.
- **TauCeti.CM.polarizedLevelStabilizer.one** (simp): The unit ideal lies in H, with witness µ=1.
- **TauCeti.CM.polarizedLevelStabilizer.mul** (structure): Witnesses µ,ν multiply to the witness µν for ab, and inverse witnesses give a subgroup.
- **TauCeti.CM.polarizedLevelStabilizer.forget_level** (functoriality): For N|M and common prime-to-MF ideals, H(M)⊂H(N).

**Uses driving the API.** Streng Theorem 2.5: Identifies the exact class field generated by admissible level values. Tsimerman §5: Distinguishes polarized and unpolarized orbit degrees. CM.3: Gives the ray-level field generation criterion.

**Unit tests.**

- **TauCeti.CM.polarizedLevelStabilizer.test_unit** (degenerate): The unit ideal is in H(N) for every N.
- **TauCeti.CM.polarizedLevelStabilizer.test_quadratic_level_one** (compatibility): For a maximal quadratic order and N=1, H(1) is the subgroup of principal ideals, since every generator has µµ̄=N(a).
- **TauCeti.CM.polarizedLevelStabilizer.test_bad_generator** (non-example): If every generator of the relevant principal reflex ideal has relative norm different from the prescribed positive rational norm, the ideal is outside the polarized stabilizer. Failure of only one generator does not exclude another witness.

**Acceptance.** At N=1 the congruence is vacuous; at N>1 it can shrink the field stabilizer. A principal image ideal with arbitrary generator is insufficient without µµ̄=N(a).

**Atlas planet:** Polarized CM stabilizer.

<a id="class-map-and-unit-obstruction"></a>
### Reflex class map and the polarized unit obstruction

**Declaration:** TauCeti.CM.reflexClassMap_unitObstruction. **Kind:** theorem.

For a CM field E, maximal order, primitive type and principal polarized lattice, the reflex ideal map induces r:Cl(E*)→Cl(E). Let H be the N=1 polarized stabilizer modulo principal reflex ideals. Then H⊂ker r and ker r/H injects into O_{E⁺}^{×,+}/N_{E/E⁺}(O_E×). This quotient has exponent two and size at most 2^g, since squares of totally real units are norms and the totally positive subgroup has rank g−1. In the polarized norm equation, N(a) is the absolute norm of the E*-ideal a, not a norm with domain E.

**Construction or proof.**

1. For r(a) principal, choose a generator µ and compare µµ̄ with the positive absolute norm N_{E*/Q}(a).
2. The ratio is a totally positive real unit; changing µ multiplies it by a CM-unit norm.
3. It vanishes precisely for H; use the unit theorem and real-unit squares to obtain the finite two-torsion bound.

**Direct dependencies:** [The conductor-restricted reflex ideal map](#reflex-ideal-map); [The polarized CM level stabilizer](#polarized-level-stabilizer); [CM lattices and ideal isogenies in arbitrary dimension](#arbitrary-dimensional-classification); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:NumberField.IsCMField.complexConj_eq_self_iff; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; [reflexIdealMap.principal](#reflex-ideal-map-api-principal).

**Sources:** [Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §5 pp.385–386. The kernel quotient measures the extra polarized condition, with the norm-domain misprint corrected.

**Acceptance.** In g=1 every generator has its required norm, so H=ker r and the obstruction is trivial. The class map has domain the reflex class group, not Cl(E).

<a id="relative-moduli-orbit"></a>
### Relative polarized moduli orbit and field distinction

**Declaration:** TauCeti.CM.relativeCMModuliOrbit. **Kind:** theorem.

For the fixed principally polarized primitive CM-action triple with maximal order, its orbit over the reflex field under arithmetic reciprocity is I_{E*}(F)/H_{Φ,O}(1), and the field generated over E* by all admissible level-one modular values has this Artin quotient. For higher N replace H(1) by H(N). This is a relative class-field statement. The absolute field of moduli over Q, the moduli field after forgetting the specified CM action, a field of definition and the reflex field are separate objects. No equality [Q(A):Q]=|Cl(E*)/H| is asserted; the adapter to the unmarked absolute moduli field is a recorded source-verification gap.

**Construction or proof.**

1. Use explicit level reciprocity and moduli separation to identify the exact stabilizer of all regular values.
2. Apply CFT12’s global subgroup/class-field correspondence over the reflex field.
3. Keep the absolute/unmarked adapter out of the theorem until its descent and orbit comparison are verified.

**Direct dependencies:** [The polarized CM level stabilizer](#polarized-level-stabilizer); [Explicit reciprocity on CM level functions](#explicit-level-reciprocity); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; ShimuraVarieties:V8; ModularCurvesPartII:R12.6.

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), Theorem 2.5, pp.7–8. Class field of all finite-at-τ values is over the reflex field with the exact stabilizer.; [Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §5 p.386. The paper’s absolute degree phrasing is not silently substituted for a relative reciprocity statement.

**Acceptance.** For the Gaussian elliptic curve j=1728, Q(j)=Q but E*=Q(i); equalities of these two moduli fields are false.

**Atlas planet:** CM reciprocity orbit.

<a id="dimension-two-example"></a>
### A dimension-two torsion and polarization example

**Declaration:** TauCeti.CM.dimensionTwoCMExample. **Kind:** application.

Let E₀:y²=x³−x over Q(i), with i acting by (x,y)↦(−x,iy), and A=E₀×E₀ with product principal polarization and CM algebra Q(i)×Q(i), type selecting the standard embedding on each factor. At P=(5,i−3), E₀ has arithmetic Frobenius π=−1+2i, so on prime-to-5 Tate modules A has diagonal CM action (π,π); on 3-torsion the same action is multiplication by π mod 3. The Weil pairing multiplier is 5 mod 3=2, and the Frobenius characteristic polynomial is (X²+2X+5)². The ideal isogeny on the product has degree 25. Separately, the non-Galois quartic example in CM.0 has reflex real subfield Q(√7), demonstrating that higher-dimensional reflex fields need not equal the original CM field.

**Construction or proof.**

1. Count E₀(F₅): eight points, hence trace −2 and norm 5.
2. Choose the CM factor π reducing to zero at i=3, matching arithmetic Frobenius and its differential; identify its conjugate factor separately.
3. Use product Tate modules and product pairing; norm and kernel degrees multiply.

**Direct dependencies:** [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The polarization and lattice reciprocity formula](#polarization-reciprocity-dictionary); [CM lattices and ideal isogenies in arbitrary dimension](#arbitrary-dimensional-classification); [A non-Galois quartic CM type and its reflex](#non-galois-quartic-example); tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Theorem 9.10, Remark 9.11 and Theorem 9.17, pp.78–81. Instantiate the dictionary with two explicit elliptic factors and keep the covariance multiplier.

**Acceptance.** Check the two rank-one CM components in each elliptic factor, four-dimensional rational Tate module, degree 25 and multiplier 2 on 3-torsion. The product type is not primitive; its full End⁰ is M₂(Q(i)), so the primitive End theorem cannot be applied.

<a id="reflex-ideal-map-api-principal"></a>
### reflexIdealMap.principal

**Declaration:** TauCeti.CM.reflexIdealMap.principal. **Kind:** lemma.

NΦ,O((u))=(NΦ(u)) under the local prime-to-F condition.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [The conductor-restricted reflex ideal map](#reflex-ideal-map).

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), §2.6 pp.6–7 and §4.2 p.13. The order-level ideal norm is extension followed by contraction away from F.

**Acceptance.** In the elliptic case this is the identity ideal map under E*=E. At a prime dividing F, invertibility and the contraction equality are not asserted.

**Layer refinements.** Verify the absolute/unmarked moduli-degree adapter; match V4/V5/V8 normalized actual-carrier signatures, including nonmaximal integral primes and polarization conventions.

## CM.3. Class polynomials and proved class-field generators

Form the product over every proper class of the actual order. The independent modular-polynomial input proves integrality. The full field generated by all regular level values, rather than j alone or a value at a pole, gives the relevant ray/stabilizer field.

**Imported inputs:** mathlib:WeierstrassCurve.j; tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; ModularCurvesPartII:R12.6; tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity; mathlib:IntermediateField.adjoin; mathlib:IntermediateField.adjoin_le_iff; ShimuraVarieties:V8; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary.

<a id="class-polynomial"></a>
### The order class polynomial

**Declaration:** TauCeti.CM.classPolynomial. **Kind:** construction.

For an imaginary quadratic order O_D of discriminant D<0, define H_D(X)=∏_{[I]∈Pic(O_D)}(X−j(E_I)) in C[X] using the normalized j and each CM class exactly once. Its indexing is independent of ideal representatives and embedding-oriented bases. The integral coefficient theorem below identifies it with a unique monic polynomial in Z[X]; the initial product definition does not assume rounded numerical values are its coefficients.

**Construction or proof.**

1. Use Picard classification to obtain the finite distinct set of normalized j-values.
2. Form the native polynomial product; homothety and modular j invariance make it representative independent.
3. The coefficient descent is established by the separate integrality theorem.

**Direct dependencies:** [Elliptic CM Picard classification](#picard-classification); [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary); [The elliptic curve of an ideal lattice](#ideal-lattice-curve); mathlib:WeierstrassCurve.j; tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), Introduction p.1 and §20.3 p.5, defining product for H_D. The finite product is over all CM curves with the specified quadratic order.

**Planning API.**

- **TauCeti.CM.classPolynomial.monic** (structure): The finite product is monic.
- **TauCeti.CM.classPolynomial.degree** (data): deg H_D=|Pic(O_D)|.
- **TauCeti.CM.classPolynomial.roots** (characterisation): The complex roots, each once, are exactly the normalized j-values of elliptic curves with full endomorphism order O_D.
- **TauCeti.CM.classPolynomial.representatives** (compatibility): Replacing any ideal by a principal multiple or a basis by SL₂(Z) leaves H_D unchanged.

**Uses driving the API.** MIT21: Identifies the ring class field and the CM method. BS §6: Uses algebraic integrality of rational CM j. CM.5: Specifies the unique target of certified complex and CRT algorithms.

**Unit tests.**

- **TauCeti.CM.classPolynomial.test_minus4** (computation): H_{−4}=X−1728.
- **TauCeti.CM.classPolynomial.test_minus3** (computation): H_{−3}=X.
- **TauCeti.CM.classPolynomial.test_nonmaximal_degree** (non-example): H_{−36} has degree two; substituting Cl(Z[i]) incorrectly gives degree one.

**Acceptance.** H_{−4}=X−1728 and H_{−3}=X. For D=−36 its degree is two, not the maximal Gaussian class number one.

**Atlas planet:** Class polynomial.

<a id="integrality"></a>
### Integrality of singular moduli and class polynomials

**Declaration:** TauCeti.CM.classPolynomial.integral. **Kind:** theorem.

For every imaginary quadratic order O_D, all j(E_I) are algebraic integers and H_D belongs to Z[X]. The polynomial is separable and has degree h(O_D). Use the independent normalized-j/modular-polynomial supplier: choose a principal prime ideal of rational prime norm l avoiding the conductor, so j is a root of the monic polynomial −Φ_l(X,X). Galois permutes the CM j-values with the same full order. No integrality argument uses a class polynomial computation or reduction theorem from CM.5.

**Construction or proof.**

1. CFT13/Chebotarev supplies a principal split prime ideal of prime norm away from the conductor.
2. The ideal isogeny gives a cyclic self-isogeny; the independent modular-polynomial diagonal is monic and annihilates j.
3. Use CM.2 and descent to show Galois preserves the order set; rational algebraic-integer symmetric coefficients are integers.

**Direct dependencies:** [The order class polynomial](#class-polynomial); [The left ideal action on CM elliptic curves](#ideal-action); [Degree of an ideal isogeny](#ideal-isogeny-degree); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; ModularCurvesPartII:R12.6; tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev.

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), Lemma 20.9 and Theorem 20.12, pp.5–7. The prime diagonal polynomial proves singular-modulus integrality and rational coefficient descent.

**Acceptance.** The leading term is from −Φ_l(X,X); its sign and prime-degree hypothesis are essential. A composite-square N may give a zero diagonal polynomial and cannot replace the chosen prime l.

**Atlas planet:** Singular moduli integrality.

<a id="class-polynomial-galois-action"></a>
### Galois equivariance of class-polynomial roots

**Declaration:** TauCeti.CM.classPolynomial.galois. **Kind:** theorem.

For an ideal a of K prime to the quadratic order conductor f, arithmetic Art_K(a) sends j(E_I) to j(E_{a⁻¹I}) in the ring class field. Complex conjugation sends the selected type/lattice to its conjugate and acts by inversion on the proper ideal class torsor after fixing the base class. Thus Gal over Q has generalized dihedral action on the root set. Stabilizers of individual j-values over K are trivial in the ring-class Artin/Picard quotient; over Q the unmarked moduli field can be smaller than the full splitting field.

**Construction or proof.**

1. Specialize the V5-to-CM.2 ideal dictionary to an imaginary quadratic type.
2. Use normalized j’s algebraic descent to identify the conjugate j-value.
3. Conjugating the ideal and type gives inversion in Pic(O) since āa has principal norm.

**Direct dependencies:** [The order class polynomial](#class-polynomial); [Integrality of singular moduli and class polynomials](#integrality); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [Elliptic CM Picard classification](#picard-classification); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; [classPolynomial.roots](#class-polynomial-api-roots).

**Sources:** [MIT21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf), §21.1 pp.1–3. The arithmetic Artin action is compared with the inverse-ideal left action.

**Acceptance.** An order-two class swaps its two j-roots; a principal ideal fixes each j but may act nontrivially on level/torsion values.

**Atlas planet:** CM Galois action.

<a id="ring-class-generator"></a>
### Singular moduli generate the ring class field

**Declaration:** TauCeti.CM.classPolynomial.ringClassField. **Kind:** theorem.

Let K be imaginary quadratic, O_f=Z+fO_K, and L_f/K the ring class field already supplied by CFT13. For any proper ideal I, K(j(E_I))=L_f, and L_f is the splitting field of H_D over K. Its degree is |Pic(O_f)| and the Artin/Picard action is the preceding arithmetic action. Hence H_D is irreducible over K. This identifies the generator with the supplied class field; it does not construct a second class field or assert Q(j)=L_f.

**Construction or proof.**

1. The Artin/Picard isomorphism acts transitively and faithfully on j-values through the simply transitive class action.
2. Orbit-stabilizer gives [K(j):K]=h(O_f); compare with the supplied L_f degree.
3. Every other root is an Artin conjugate, so the generator field is also the splitting field.

**Direct dependencies:** [Galois equivariance of class-polynomial roots](#class-polynomial-galois-action); [Elliptic CM Picard classification](#picard-classification); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; [Integrality of singular moduli and class polynomials](#integrality).

**Sources:** [MIT21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf), Theorem 21.1 and opening discussion, pp.1–3. A singular j generates the order ring class field over the CM field.

**Acceptance.** For K=Q(i), j=1728 gives L_1=K while Q(j)=Q.

**Atlas planet:** Ring class field generator.

<a id="admissible-cm-value-field"></a>
### The field of admissible CM level values

**Declaration:** TauCeti.CM.cmValueField. **Kind:** construction.

For a principally polarized CM point τ of primitive type (E,Φ), order O and N≥1, define M_N=E*(f(τ): f∈F_N, f finite at τ), using the actual intermediate-field adjunction carrier. F_N consists of quotients of equal-weight level-N Siegel forms whose Fourier coefficients lie in Q(ζ_N); denominator nonvanishing at τ is mandatory for the evaluation. The definition includes all regular values, not an arbitrary one of them. Elliptic specialization uses the R12.6 modular-function carrier; higher-dimensional specialization uses V8.

**Construction or proof.**

1. Use the supplied modular-function evaluation on the local regular-function ring at τ.
2. Adjoin its value set to the embedded reflex field using the native field construction.
3. Base/embedding independence is through the supplier moduli comparison and explicit level reciprocity.

**Direct dependencies:** [Explicit reciprocity on CM level functions](#explicit-level-reciprocity); mathlib:IntermediateField.adjoin; mathlib:IntermediateField.adjoin_le_iff; ShimuraVarieties:V8; ModularCurvesPartII:R12.6.

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), Theorem 2.5 pp.7–8. The class field is generated by all admissible level-N special values.

**Planning API.**

- **TauCeti.CM.cmValueField.contains** (constructor): Every finite-at-τ level-N value belongs to M_N.
- **TauCeti.CM.cmValueField.le_iff** (universal-property): M_N⊂F iff F contains E* and every admissible level-N value.
- **TauCeti.CM.cmValueField.level_inclusion** (functoriality): For N|M the natural function-field embedding gives M_N⊂M_M.
- **TauCeti.CM.cmValueField.no_poles** (characterisation): The generating value set uses functions regular at τ; meromorphic poles are not generators.

**Uses driving the API.** Streng Theorem 2.5: Gives the exact Artin stabilizer of the generated field. CM.6 export interface: States which level values generate each proved field. Heegner/modular-function consumers: Avoids assuming every chosen Weber/class invariant generates the full ray field.

**Unit tests.**

- **TauCeti.CM.cmValueField.test_level_one** (compatibility): For elliptic maximal-order CM, M_1=K(j).
- **TauCeti.CM.cmValueField.test_pole** (non-example): If f has a pole at τ, f(τ) is not an admitted generator.
- **TauCeti.CM.cmValueField.test_gaussian_ray3** (non-example): For K=Q(i), j=1728 lies in K, whereas the ray class field of modulus 3 has degree two; j alone does not generate it.

**Acceptance.** A function with a pole at τ is excluded rather than assigned a spurious field element. At level one in the elliptic case the value field is K(j); at higher levels j alone need not generate it.

**Atlas planet:** CM level value field.

<a id="ray-class-values"></a>
### Exact ray-level field and generation criterion

**Declaration:** TauCeti.CM.cmValueField.rayClassField. **Kind:** theorem.

With N,F,τ as in the value-field construction, M_N lies in the ray class field of E* of modulus NF and Gal(M_N/E*)=I_{E*}(NF)/H_{Φ,O}(N). For an elliptic maximal order O_K, the type norm is identity and the polarized norm equation is automatic for a principal ideal, so H(N) is precisely the ray principal subgroup and M_N is the ray class field of modulus NO_K. For a nonmaximal order or higher dimension use the displayed stabilizer, not an unsupported equality with a full ray field or an exact conductor NF. A finite family of functions generates M_N exactly when its joint value stabilizer equals H(N); unit automorphisms and level congruences are included.

**Construction or proof.**

1. Identify the stabilizer of every finite-at-τ modular value using the explicit reciprocity theorem and moduli separation.
2. Apply CFT12 to the subgroup and conductor containment; CFT13 supplies the elliptic ring/ray specialization.
3. For g=1 maximal order simplify each norm/principality condition to the native ray-class definition.

**Direct dependencies:** [The field of admissible CM level values](#admissible-cm-value-field); [The polarized CM level stabilizer](#polarized-level-stabilizer); [Relative polarized moduli orbit and field distinction](#relative-moduli-orbit); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary.

**Sources:** [Streng](https://arxiv.org/pdf/1201.0020v4), Theorem 2.5 and its proof §4.5. The field has conductor dividing NF and the exact ideal subgroup is known.

**Acceptance.** For the Gaussian modulus 3, ray degree |(Z[i]/3)×|/|Z[i]×|=8/4=2; j alone fails the stabilizer criterion. At N=1 the class field is the ring class field, including nonmaximal conductor restrictions.

**Atlas planet:** CM ray class fields.

<a id="complete-elliptic-example"></a>
### The complete Gaussian ring-class example

**Declaration:** TauCeti.CM.gaussianRingClassExample. **Kind:** application.

For K=Q(i), O=Z[i], the unique ideal class has j=1728, H_{−4}=X−1728∈Z[X], splitting field over K equal to K, and Artin action trivial on the single root. The prime ideal (2+i) of norm 5 gives an ideal isogeny of degree 5 with trivial class action. The four units are the exceptional automorphism group; they do not create four roots. The exact polynomial equality follows from j(i)=1728 and Pic(O)=1, so no numerical rounding certificate is needed. The modulus-3 ray example has degree two and demonstrates why the ring-class generator does not already export a full ray field.

**Construction or proof.**

1. Compute the Gaussian class group using GN11 and normalized j(i) using MF0.
2. Apply the one-factor polynomial product and the ring-class identification.
3. Compute the degree-five kernel index and the unit quotient in the modulus-3 ray group.

**Direct dependencies:** [Singular moduli generate the ring class field](#ring-class-generator); [Exact ray-level field and generation criterion](#ray-class-values); [Exceptional CM automorphism factors](#automorphism-factors); [Degree of an ideal isogeny](#ideal-isogeny-degree); [The order class polynomial](#class-polynomial); tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), Introduction p.1 and §20.3 p.5, defining product for H_D. The finite product is instantiated with the class-number-one square lattice.

**Acceptance.** Exact integer coefficient −1728, splitting field K, degree-five prime action and the ray unit quotient are all checked symbolically.

<a id="class-polynomial-api-roots"></a>
### classPolynomial.roots

**Declaration:** TauCeti.CM.classPolynomial.roots. **Kind:** lemma.

The complex roots, each once, are exactly the normalized j-values of elliptic curves with full endomorphism order O_D.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [The order class polynomial](#class-polynomial).

**Sources:** [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf), Introduction p.1 and §20.3 p.5, defining product for H_D. The finite product is over all CM curves with the specified quadratic order.

**Acceptance.** H_{−4}=X−1728 and H_{−3}=X. For D=−36 its degree is two, not the maximal Gaussian class number one.

**Layer refinements.** Match independent LevelOne.JInputs integrality/prime-diagonal API and regular modular-function descent/separation; obtain concrete function generators when exporting a finite ray-value list.

## CM.4. CM Hecke characters and realizations

CM values are endomorphisms of the stated model and their actual Tate realizations. Split the product coefficient algebra E⊗Q_l before exporting lambda-components. Keep both Frobenius conventions and the finite-inertia comparison at bad places; the full elliptic factorization includes conductors.

**Imported inputs:** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; ShimuraVarieties:V5; ArithmeticGaloisRepresentations:R01.6; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module; AutomorphicGaloisRepresentations:R19.3; NeronModelsAndSemistableAbelianVarieties:R11.5/elliptic-local-polynomial; ArithmeticGaloisRepresentations:R01.2; ArithmeticGaloisRepresentations:R01.3; NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial; ArithmeticGaloisRepresentations:R01.5; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; mathlib:NumberField.RingOfIntegers; NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich.

<a id="cm-hecke-character"></a>
### The algebraic Hecke character of a CM abelian variety

**Declaration:** TauCeti.CM.cmHeckeCharacter. **Kind:** construction.

Let A/k be a g-dimensional abelian variety over a number field, with a CM field E⊂End⁰_k(A) of degree 2g and all specified endomorphisms defined over k; its type has reflex field E*⊂k. Construct on GN9’s Hecke-character carrier ψ_A:I_k(m)→E× for a finite modulus m containing bad reduction and the integral-order exceptions. At a good prime v prime to m, ψ_A(v) is the E-linear Frobenius element on A_v. For a∈k× with a≡1 mod× m, ψ_A((a))=NΦ(N_{k/E*}a). Its complex components have the algebraic infinity type determined by Φ (positive ideal exponent; negative idelic exponent). The finite conductor f(ψ_A) is the least such modulus, not an arbitrary containing modulus. Values are in E×, not generally in O_E×.

**Construction or proof.**

1. Use the model-field norm and main CM theorem to define the compatible E-valued Artin action.
2. At good primes extract Frobenius from the E-linear Tate action and prove the principal-ideal formula by normalized reciprocity.
3. Apply GN9’s algebraic-character extension and least-conductor construction, tracking the type convention with GN10.

**Direct dependencies:** [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The conductor-restricted reflex ideal map](#reflex-ideal-map); [CM lattices and ideal isogenies in arbitrary dimension](#arbitrary-dimensional-classification); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; ShimuraVarieties:V5; ArithmeticGaloisRepresentations:R01.6; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §9, Frobenius and idele dictionary pp.74–84. The CM reciprocity/Frobenius dictionary constructs the character on the generic carrier.; [BT](https://arxiv.org/pdf/2506.03465v2), §3.1, proof of Theorem 1.1, p.6. The elliptic character has values in the CM field’s multiplicative group, not just its units.; [Kato](https://www.numdam.org/item/AST_2004__295__117_0/), §15.10 p.260. The idelic exponent is (1−k,0), hence (−1,0) in weight two.

**Planning API.**

- **TauCeti.CM.cmHeckeCharacter.principal** (characterisation): For a≡1 mod×m, ψ_A((a))=NΦ(N_{k/E*}a).
- **TauCeti.CM.cmHeckeCharacter.frobenius** (data): At every good v away from m, ψ_A(v) is the actual E-linear arithmetic Frobenius.
- **TauCeti.CM.cmHeckeCharacter.conductor_minimal** (characterisation): f(ψ_A) divides every admissible finite modulus and is admissible itself.
- **TauCeti.CM.cmHeckeCharacter.baseChange** (functoriality): For a finite model-field extension k′/k, ψ_{A/k′}=ψ_{A/k}∘N_{k′/k}, with its least conductor recalculated.

**Uses driving the API.** BT §3.1: Provides the two elliptic Hecke factors and Tate characters. BKO §3.0.1: Compares the canonical Gross character with its H-model norm pullback. CM.5: Supplies the CM Frobenius input to reduction formulas.

**Unit tests.**

- **TauCeti.CM.cmHeckeCharacter.test_ideal_type** (compatibility): In elliptic dimension, positive ideal type (1,0) matches negative idelic type (−1,0).
- **TauCeti.CM.cmHeckeCharacter.test_nonunit** (non-example): For E:y²=x³−x at P=(5,i−3), ψ(P)=−1+2i has norm 5 and is not a Gaussian unit.
- **TauCeti.CM.cmHeckeCharacter.test_inert_baseChange** (computation): For the same curve at the inert rational prime 7, the K-prime has norm 49 and ψ((7))=−7, not an element of norm 7.

**Acceptance.** For an elliptic curve over its endomorphism field the ideal infinity type is (1,0); the matching idelic type is (−1,0). A good Frobenius value has nontrivial norm q, so need not be a unit.

**Atlas planet:** CM Hecke character.

<a id="tate-coefficient-components"></a>
### One-dimensional CM components of the Tate module

**Declaration:** TauCeti.CM.cmTateComponents. **Kind:** comparison.

Under the CM-character hypotheses, V_l(A) is free of rank one over E⊗Q_l. For each embedding ι:E→Q_lbar, its coefficient summand is one-dimensional and carries GN9’s l-adic avatar ψ_{A,ι}, with arithmetic Frobenius eigenvalue ιψ_A(v) at every good v∤l. Thus V_l(A)⊗Q_lbar=⊕_ι ψ_{A,ι} as actual G_k modules. The underlying Q_l dimension is 2g. Integral rank-one freeness over O⊗Z_l requires l prime to the endomorphism-order index; it is not inferred from the rational comparison.

**Construction or proof.**

1. Split E⊗Q_lbar by its embedding idempotents.
2. Use the normalized CM torsion dictionary on each summand and GN9’s avatar construction.
3. Compare unramified Frobenius and apply the supplied recognition theorem where required.

**Direct dependencies:** [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); ArithmeticGaloisRepresentations:R01.6; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §9.10 pp.78–80, footnote 25. The rational CM rank-one statement and integral-order exception are separate.; [BT](https://arxiv.org/pdf/2506.03465v2), §3.1, proof of Theorem 1.1, p.6. The elliptic character components give the two-dimensional Tate representation after coefficient extension.

**Acceptance.** A CM elliptic V_l has rank two over Q_l and rank one over K⊗Q_l; it is not one-dimensional over Q_l for inert coefficient primes.

<a id="frobenius-and-infinity-type"></a>
### Frobenius and infinity-type identities

**Declaration:** TauCeti.CM.cmFrobeniusIdentities. **Kind:** theorem.

At a good prime v with residue size q and CM character ψ_A, its Frobenius element π_v=ψ_A(v) satisfies π_v̄π_v=q, all complex absolute values |τπ_v|=√q, and the Tate polynomial equals ∏_{τ:E→Qbar}(X−τπ_v). The component infinity types are those of Φ transported by τ. For elliptic A/K, the polynomial is X²−Tr_{K/Q}(π_v)X+q; at an inert rational good prime p for A/Q, the rational trace is zero while the prime of K has norm p² and Frobenius π_v=−p.

**Construction or proof.**

1. Use CM conjugation as Rosati and the polarization Frobenius adjoint identity to obtain π̄π=q.
2. Apply the type decomposition and characteristic-polynomial supplier.
3. For an inert rational prime use the induced rational representation and square its Frobenius to obtain the K-prime eigenvalue.

**Direct dependencies:** [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [One-dimensional CM components of the Tate module](#tate-coefficient-components); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; AutomorphicGaloisRepresentations:R19.3; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module; NeronModelsAndSemistableAbelianVarieties:R11.5/elliptic-local-polynomial; [cmHeckeCharacter.frobenius](#cm-hecke-character-api-frobenius).

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §8.1–8.3 pp.66–68. The CM norm/purity identity yields the component characteristic polynomial.; [Kato](https://www.numdam.org/item/AST_2004__295__117_0/), §15.10 p.260 and §15.11 p.261. The infinity type fixes the one-dimensional components.

**Acceptance.** For y²=x³−x, rational good primes 5 and 7 give X²+2X+5 and X²+7; over K at 7 the factor is (X+7)².

<a id="full-elliptic-l-factorization"></a>
### Full elliptic CM L-factorization, including bad primes

**Declaration:** TauCeti.CM.ellipticCMLFactorization. **Kind:** theorem.

Let A/K be an elliptic curve with CM by an order in K and every endomorphism defined over K. For every finite prime v and coefficient l≠char κ(v), define P_v(A,T)=det(1−Frob_geom,v T | H¹_et(A_Kbar,Q_l)^{I_v}), using R11.5’s cohomological carrier H¹_et=V_l(A)∨. It equals P_v(ψ,T)P_v(̄ψ,T), where an unramified rank-one factor is 1−ψ(v)T and a ramified factor is 1. CM j is integral, so A has potentially good reduction and finite inertia image: duality and averaging identify this determinant with that of arithmetic Frobenius on V_l(A)^{I_v}. Hence L(A/K,s)=L(ψ,s)L(̄ψ,s), retaining every finite bad factor. The Artin exponent is a_v(A)=a_v(ψ)+a_v(̄ψ); conjugation preserves these exponents, giving conductor ideal f(ψ)².

**Construction or proof.**

1. Use integrality of CM j to obtain potential good reduction, hence finite inertia action on V_l(A).
2. Dualize the actual covariant Tate decomposition to R11.5’s H¹_et. Finite-inertia averaging identifies invariant duals; geometric Frobenius on the dual has the same characteristic polynomial as arithmetic Frobenius on the covariant invariant space.
3. Apply rank-one local Euler and Artin/Swan conductor constructions, direct-sum determinant laws and equality of the two conjugate conductor exponents.

**Direct dependencies:** [One-dimensional CM components of the Tate module](#tate-coefficient-components); [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [Integrality of singular moduli and class polynomials](#integrality); ArithmeticGaloisRepresentations:R01.2; ArithmeticGaloisRepresentations:R01.3; NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial; NeronModelsAndSemistableAbelianVarieties:R11.5/elliptic-local-polynomial; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.

**Sources:** [BT](https://arxiv.org/pdf/2506.03465v2), §3.1, proof of Theorem 1.1, p.6. The equality of Hecke and elliptic L-functions must be justified at all finite primes.; [BKO](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §3.0.1 pp.950–951. Canonical character finite conductors are part of the elliptic comparison.

**Acceptance.** For the Gaussian curve, the bad prime above 2 has ramified characters and local factor 1; omitting it from the product is not an all-prime proof. At good inert rational p=7 over K, the local factor is (1+7T)² at norm 49.

**Atlas planet:** Elliptic CM L-factorization.

<a id="cm-induction-comparison"></a>
### CM induction and compatible-system comparison

**Declaration:** TauCeti.CM.cmInductionComparison. **Kind:** comparison.

For a rational CM elliptic curve A/Q with CM field K, its rational two-dimensional Tate representation after extension of coefficients is Ind_{G_K}^{G_Q} ψ_l. Restriction to G_K is ψ_l⊕̄ψ_l, and the representation is invariant under twisting by χ_K, consistent with CM.1’s actual self-twist isogeny. The weight-two theta-series/newform realization has the same good Frobenius polynomials and is compared by AGR01.5/R19.3. This imports generic induction and modular compatible systems; it is not another definition of automorphic induction.

**Construction or proof.**

1. The CM endomorphism character determines the two conjugate G_K eigenspaces.
2. The nontrivial coset of G_K swaps them, giving the actual induced representation.
3. Compare good-prime traces/determinants with the supplied theta-series realization and use Frobenius recognition.

**Direct dependencies:** [One-dimensional CM components of the Tate module](#tate-coefficient-components); [The rational CM quadratic self-twist isogeny](#rational-cm-self-twist); ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3; [Frobenius and infinity-type identities](#frobenius-and-infinity-type).

**Sources:** [Kato](https://www.numdam.org/item/AST_2004__295__117_0/), §15.10 pp.260–261. The CM newform representation is induced from the Hecke character.; [BT](https://arxiv.org/pdf/2506.03465v2), §3.1, proof of Theorem 1.1, p.6. The rational CM splitting is used by the converse consumer.

**Acceptance.** At a split rational good prime the two eigenvalues are conjugate CM values; at an inert good prime the rational trace is zero.

<a id="residual-cartan-normalizer"></a>
### Unramified CM residual Cartan normalizer

**Declaration:** TauCeti.CM.cmResidualCartanNormalizer. **Kind:** theorem.

For A/Q with CM by a quadratic order O and an odd rational prime l prime to disc(O), the residual representation A[l] carries a rank-one O/lO action. The G_K image lies in the unit Cartan C_l=(O/lO)×, split if l splits in K and nonsplit if it is inert. The full G_Q image lies in its normalizer, with the quotient action given by χ_K and conjugation on O/lO. Every element outside the Cartan has trace zero and its projective order divides two. Neither equality with the full normalizer nor a Cartan claim at ramified/conductor primes is asserted.

**Construction or proof.**

1. Reduce the integral CM action at l outside the discriminant/conductor and identify the étale quadratic algebra O/lO.
2. Centralizers give the G_K Cartan inclusion; conjugation gives the G_Q normalizer inclusion.
3. Write a normalizer element outside the Cartan as semilinear conjugation times a unit; its trace is zero and square is scalar.

**Direct dependencies:** [One-dimensional CM components of the Tate module](#tate-coefficient-components); [CM induction and compatible-system comparison](#cm-induction-comparison); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; ArithmeticGaloisRepresentations:R01.6; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [BS](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6 pp.372–373. The residual normalizer corollary is the CM input to the progression-specific application.

**Acceptance.** For Gaussian CM and l=3 the Cartan is nonsplit of order 8; l=5 gives split order 16. At l=2 the Gaussian order is ramified and this assertion is outside its hypotheses.

**Atlas planet:** CM Cartan normalizer.

<a id="canonical-gross-character"></a>
### Canonical Gross characters and their conductor support

**Declaration:** TauCeti.CM.IsCanonicalGrossCharacter. **Kind:** definition.

On GN9’s algebraic Hecke-character carrier for imaginary quadratic K, call ψ canonical in the Gross–Rohrlich sense when ψ(̄a)=overline{ψ(a)} for ideals away from its conductor, ψ((α))=±α for principal ideals away from it, and every conductor prime ramifies in K/Q. Keep the finite sign character and its least conductor, rather than setting every principal value equal to α. In the BKO application use odd fundamental discriminant and p≥5 inert with p∤h_K. Canonical characters over K give ψ_H=ψ∘N_{H/K} attached to a canonical CM elliptic curve over the Hilbert class field H, up to H-isogeny. The definition alone is not an existence proof.

**Construction or proof.**

1. Reuse the generic algebraic character and its conductor, and impose the explicit conjugation/principal-value/support conditions.
2. Norm-pullback to H uses GN8 and the CM character comparison, keeping the sign character.
3. Canonical existence and the conductor support proof require the Rohrlich construction; record that proof-access gap.

**Direct dependencies:** [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; mathlib:NumberField.RingOfIntegers.

**Sources:** [Yang](https://people.math.wisc.edu/~tonghaiyang/HKCM.pdf), Introduction conditions (0.1)–(0.3), pp.1–2. The three conditions distinguish canonical characters from arbitrary CM characters.; [BKO](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §3.0.1 pp.950–951 and equation (3.8) p.953. The character/curve and ramified-prime conductor support are the added consumer contract.

**Planning API.**

- **TauCeti.CM.IsCanonicalGrossCharacter.conjugation** (relation): ψ(̄a)=overline{ψ(a)} away from the finite conductor.
- **TauCeti.CM.IsCanonicalGrossCharacter.principal_sign** (characterisation): ψ((α))/α is a sign for α prime to the conductor.
- **TauCeti.CM.IsCanonicalGrossCharacter.conductor_support** (data): Every prime divisor of f(ψ) is ramified in K/Q.
- **TauCeti.CM.IsCanonicalGrossCharacter.class_twist** (functoriality): Twisting by a class character preserves the canonical family conditions and leaves its H-norm pullback unchanged.

**Uses driving the API.** BKO §3.0.1 and Theorem 3.4: Supplies conjugation and good reduction above the inert p. CM.4 full L-factorization: Transfers the H-model character and finite conductor into the elliptic local factors.

**Unit tests.**

- **TauCeti.CM.IsCanonicalGrossCharacter.test_sign** (non-example): Dropping the finite sign character and assigning ψ((−1))=−1 contradicts ψ(O_K)=1.
- **TauCeti.CM.IsCanonicalGrossCharacter.test_inert_unramified** (compatibility): For the BKO inert p unramified in K, p does not divide the canonical conductor.
- **TauCeti.CM.IsCanonicalGrossCharacter.test_even_excluded** (non-example): For the Gaussian field, an excluded D≡4 mod 8 case, the unit i generates the unit ideal but is neither 1 nor −1. The canonical principal-sign condition therefore cannot hold; a simplest character must not be relabeled canonical.

**Acceptance.** For odd discriminant the canonical family is considered up to unramified class-character twist. For discriminant valuation exactly two at 2 (D≡4 mod 8), canonical characters of these three conditions do not exist; Yang’s simplest higher-dimensional characters are a different construction.

**Atlas planet:** Canonical CM character.

<a id="gross-curve-good-reduction"></a>
### Canonical Gross curve good reduction at the inert prime

**Declaration:** TauCeti.CM.canonicalGrossGoodReduction. **Kind:** theorem.

In the BKO odd-discriminant canonical-character situation, let H/K be the Hilbert class field and E/H the corresponding canonical CM elliptic curve with character ψ_H=ψ∘N_{H/K}. If p≥5 is inert in K and p∤h_K, the character is unramified at all primes above p because its conductor has only K/Q-ramified support and H/K is unramified. The Tate comparison and Néron–Ogg–Shafarevich then give good reduction above p. The conjugation identity is retained before any inert-prime local arithmetic is applied. No exact conductor exponents are inferred from support alone.

**Construction or proof.**

1. Import the canonical existence/character attachment from the unresolved Rohrlich source obligation.
2. Pull back the unramified local character through the H/K norm.
3. Use the actual Tate comparison and Néron–Ogg–Shafarevich; keep support and exponent claims separate.

**Direct dependencies:** [Canonical Gross characters and their conductor support](#canonical-gross-character); [One-dimensional CM components of the Tate module](#tate-coefficient-components); NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.

**Sources:** [BKO](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §3.0.1 pp.950–951; (3.8) p.953. The canonical curve and conductor support give the good inert-prime input.

**Acceptance.** An arbitrary CM quadratic twist can introduce extra conductor primes and is not covered by the canonical conductor-support statement.

<a id="cm-hecke-character-api-frobenius"></a>
### cmHeckeCharacter.frobenius

**Declaration:** TauCeti.CM.cmHeckeCharacter.frobenius. **Kind:** lemma.

At every good v away from m, ψ_A(v) is the actual E-linear arithmetic Frobenius.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character).

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), §9, Frobenius and idele dictionary pp.74–84. The CM reciprocity/Frobenius dictionary constructs the character on the generic carrier.; [BT](https://arxiv.org/pdf/2506.03465v2), §3.1, proof of Theorem 1.1, p.6. The elliptic character has values in the CM field’s multiplicative group, not just its units.; [Kato](https://www.numdam.org/item/AST_2004__295__117_0/), §15.10 p.260. The idelic exponent is (1−k,0), hence (−1,0) in weight two.

**Acceptance.** For an elliptic curve over its endomorphism field the ideal infinity type is (1,0); the matching idelic type is (−1,0). A good Frobenius value has nontrivial norm q, so need not be a unit.

**Layer refinements.** Read the primary canonical Gross construction and verify finite conductor exponents when needed; match all-prime local representation/conductor suppliers and published BT text.

## CM.5. Reduction, graphs and certified computation

Geometric endomorphisms are used throughout. All positive characteristics, including 2 and 3, remain in Deuring’s classification. Ordinary certificates require every conductor prime power and certified small-prime climbing. Numeric and CRT certificates retain their own order, census and computational provenance.

**Imported inputs:** tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism; tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion; GeometryOfNumbersAndQuadraticArithmetic:GN.2; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End; NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; ShimuraVarieties:V5; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; AbelianSchemesAndArithmeticModuli:A4; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv; ModularCurvesPartII:R12.6; ComputationalNumberTheory:CN.3; tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus; ComputationalNumberTheory:CN.4; GeometryOfNumbersAndQuadraticArithmetic:GN.3; ComputationalNumberTheory:CN.4/complex-box-denotation; ComputationalNumberTheory:CN.4/integer-recovery-sound; ComputationalNumberTheory:CN.1; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev; ComputationalNumberTheory:CN.0.

<a id="deuring-classification"></a>
### Deuring’s characteristic-p endomorphism classification

**Declaration:** TauCeti.CM.deuringClassification. **Kind:** theorem.

For every elliptic curve A/k in characteristic p>0, let End_geom(A)=End_{kbar}(A_kbar). It is either Z, an order in an imaginary quadratic field where p splits and whose conductor is prime to p, or a maximal order in the definite rational quaternion algebra B_{p,∞} ramified exactly at p and ∞. The quaternion case is precisely supersingular. Over kbar=F_pbar the Z case does not occur; every ordinary curve has the quadratic-order case and every supersingular curve the maximal quaternion-order case. Every maximal-order conjugacy type occurs for a supersingular curve. This is a theorem about all characteristic-p elliptic curves, including p=2,3, not just CM reductions; End_k can be smaller than End_geom.

**Construction or proof.**

1. Use the elliptic degree quadratic form and Tate realization to bound End⁰ dimension and identify commutative versus quaternion cases.
2. Deuring’s local p-divisible/degree analysis gives the split quadratic condition and p-maximality; the prime-to-p Tate comparison gives maximality at other primes in the supersingular case.
3. Identify B_{p,∞} by its local invariants, and use Deuring lifting/ideal modules for the realization assertion; the full primary proof remains a recorded decomposition gap.

**Direct dependencies:** tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism; tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion; GeometryOfNumbersAndQuadraticArithmetic:GN.2; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End.

**Sources:** [Deuring](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf), Introduction §§2–3 pp.198–199; §8 conclusion p.258. The primary classification includes maximal quaternion orders and their realization.; [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter III §7 p.261. The non-split CM reduction is used through Deuring, with the curve/pair order distinction preserved.

**Acceptance.** Over F₅, y²=x³−x is ordinary; over F₇ it is supersingular and its geometric End⁰ is quaternion, although End_{F₇}⁰ is quadratic. A transcendental ordinary j in characteristic p can have End_geom=Z; the finite-field assumption cannot be silently dropped.

**Atlas planet:** Deuring endomorphism classification.

<a id="cm-reduction-dictionary"></a>
### Potential good reduction and the split/non-split dichotomy

**Declaration:** TauCeti.CM.cmReductionDictionary. **Kind:** theorem.

Let A be an elliptic curve with full CM order O_f in imaginary quadratic K over a number field. It has potentially good reduction at every finite place because j is an algebraic integer. After a finite extension giving good reduction at residue characteristic p, the geometric reduction is ordinary iff p splits in K, and supersingular iff p is inert or ramified in K. The reduction map embeds O_f in End_geom of the reduction. In the ordinary case its order conductor is f/p^{v_p(f)}; in the supersingular case End_geom is a maximal quaternion order containing the reduced CM order, with optimality tracked separately. No extension of the residue coefficient field turns supersingular reduction into an ordinary one.

**Construction or proof.**

1. Apply the generic local elliptic integral-j/potential-good-reduction theorem.
2. Specialize the CM action using good reduction and injectivity of Hom specialization.
3. Use Deuring’s classification and local p action; prime-to-p Tate lattices retain the order and the ordinary p part becomes maximal.

**Direct dependencies:** [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Integrality of singular moduli and class polynomials](#integrality); NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [Deuring](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf), Introduction §§2–3 pp.198–200. Deuring’s reduction classification determines the ordinary/non-split cases.; [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter III §7 p.261. The quaternionic case is required at non-split primes.

**Acceptance.** For the Gaussian curve, p=5 is split/ordinary and p=7 is inert/supersingular. Ramified p belongs to the supersingular side; dropping ramified primes gives an incomplete dichotomy.

<a id="shimura-taniyama-specialization"></a>
### The explicit CM Frobenius ideal and slope formula

**Declaration:** TauCeti.CM.shimuraTaniyamaDictionary. **Kind:** comparison.

Import V5’s general Shimura–Taniyama theorem. In the explicit clean local case, A/k has CM by O_E, k/Q_p contains all conjugates of E, p is unramified in E and A has good reduction at P with residue size q. Frobenius π∈O_E satisfies (π)=∏_{φ∈Φ}φ⁻¹(N_{k/φE}P). For each v|p, put H_v={τ:E→k:τ⁻¹P=v}; then ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|. Compare the ideal formula with NΦ(N_{k/E*}P). Ramified primes and nonmaximal orders require the fuller V5 theorem, not extrapolation of these clean hypotheses.

**Construction or proof.**

1. Apply the imported theorem to the actual good-reduction Frobenius.
2. Expand its reflex norm using the CM.0 inverse-embedding formula and the model-field norm.
3. Take local valuations and divide by ord_v(q), retaining residue degrees.

**Direct dependencies:** ShimuraVarieties:V5; [The conductor-restricted reflex ideal map](#reflex-ideal-map); [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles; AbelianSchemesAndArithmeticModuli:A4.

**Sources:** [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf), Theorem 8.1 and Corollaries 8.2–8.3, pp.66–68. The ideal factorization and normalized slope count have explicit maximal-order/unramified hypotheses.

**Acceptance.** For elliptic split p the slopes are 0 and 1; for inert unramified p they are both 1/2. In dimension two the multiplicity is the selected embedding count, not a repeated elliptic formula without type data.

<a id="deuring-lifting"></a>
### Deuring lifting with an endomorphism

**Declaration:** TauCeti.CM.deuringLifting. **Kind:** theorem.

For an elliptic curve A over a finite field F_q and nonzero α∈End_{F_q}(A), there are a number field L, a prime P with residue field identified with F_q, an elliptic curve A*/L with good reduction at P and α*∈End_L(A*) reducing to the pair (A,α). A non-scalar α yields an imaginary-quadratic CM lift. The statement does not claim a lift of the entire supersingular quaternion endomorphism ring as characteristic-zero endomorphisms.

**Construction or proof.**

1. Separate scalar multipliers from the non-scalar case.
2. Use Deuring’s modular-equation deformation/lifting argument to preserve the chosen finite isogeny/multiplier and specialize the pair.
3. Enlarge the number field and prime to identify the required residue data; do not identify the full supersingular End with the lift’s commutative ring.

**Direct dependencies:** [Deuring’s characteristic-p endomorphism classification](#deuring-classification); tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv; ModularCurvesPartII:R12.6.

**Sources:** [Deuring](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf), §9.1 pp.258–262. The primary lifting argument preserves the specified multiplier.; [MIT21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf), Theorem 21.15 p.10. The pair consists of the curve and one endomorphism, not its full quaternion ring.

**Acceptance.** For a supersingular curve, two noncommuting quaternion endomorphisms cannot both be identified with a characteristic-zero CM endomorphism ring.

<a id="cm-isogeny-graphs"></a>
### CM order levels and horizontal isogeny graphs

**Declaration:** TauCeti.CM.cmIsogenyGraphDictionary. **Kind:** comparison.

For ordinary A/F_q with geometric order O_f and l≠p, an l-isogeny changes the endomorphism order only horizontally (same order), by index l upward or by index l downward. At l prime to f, the horizontal O_f-linear isogenies correspond to invertible ideals of norm l, with count 1+(D_K/l); ramified gives one, split two, inert zero. At l dividing f retain the conductor-level rules and the exceptional j=0,1728 kernel multiplicities. A graph vertex is a j-invariant up to geometric isomorphism; a finite-field twist is not fixed by a j-root. Supersingular components use quaternionic ideals and cannot use the ordinary order volcano as a certificate.

**Construction or proof.**

1. Use the dual l-isogeny to embed lO⊂O′ and lO′⊂O and obtain the index trichotomy.
2. Identify the horizontal kernels with prime ideals of norm l and use quadratic splitting.
3. Separate geometric j-orbits, twists and automorphism-induced edge multiplicities; retain the supersingular branch.

**Direct dependencies:** [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [The left ideal action on CM elliptic curves](#ideal-action); [Exceptional CM automorphism factors](#automorphism-factors); [Degree of an ideal isogeny](#ideal-isogeny-degree); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; ComputationalNumberTheory:CN.3; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [MIT22](https://math.mit.edu/classes/18.783/2023/LectureNotes22.pdf), Theorem 22.3 and §22.1, pp.2–3. The order-index trichotomy and ideal description govern the ordinary graph.

**Acceptance.** An inert l gives no horizontal edges, not two after coefficient extension. Exceptional j graph multiplicities count kernels, not merely distinct target j-values.

<a id="supersingular-curve-versus-level-pair"></a>
### Quaternion orders of a curve and of a level pair

**Declaration:** TauCeti.CM.supersingularLevelOrderComparison. **Kind:** comparison.

For a supersingular curve A/F_pbar, End_geom(A) is maximal in B_{p,∞} and has reduced discriminant p. For the prime-to-p cyclic level-N pair (A,C), its endomorphism ring consists of endomorphisms preserving C and is generally an Eichler order of reduced discriminant Np, maximal at p but not necessarily away from p. In the Gross–Zagier situation p is non-split in the CM field, p∤N and N satisfies the Heegner splitting conditions; the reduced CM embedding and its optimality must be tracked in the pair’s order. End of the pair must never be called the full maximal End of the curve.

**Construction or proof.**

1. Start with the full supersingular End from Deuring.
2. Impose preservation of the cyclic prime-to-p subgroup and describe the resulting local order at each prime dividing N.
3. Compare the reduced CM action and the local intersection order without deleting the level condition.

**Direct dependencies:** [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion; GeometryOfNumbersAndQuadraticArithmetic:GN.2; tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv.

**Sources:** [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter III §7 p.261, page image. The level pair has an Eichler order of discriminant Np, unlike the curve’s maximal order.

**Acceptance.** At N=1 recover the maximal order; at a nontrivial squarefree N the reduced discriminant is Np.

<a id="class-polynomial-height-bound"></a>
### An explicit coefficient bound for the class polynomial

**Declaration:** TauCeti.CM.classPolynomialHeightBound. **Kind:** theorem.

Enumerate the h reduced primitive forms (a_k,b_k,c_k) of discriminant D<0 and put M_k=exp(π√|D|/a_k)+2114.567. The singular value at τ_k=(−b_k+i√|D|)/(2a_k) satisfies |j(τ_k)|≤M_k. Consequently every coefficient of H_D has absolute value at most B_D=⌈∏_{k=1}^h(1+M_k)⌉. This deliberately safe elementary-symmetric bound is unconditional; CN4 supplies a rational outward bound B≥B_D, including certified exp evaluation. Optimized asymptotic/time bounds under GRH are separate statements and are not needed for output correctness.

**Construction or proof.**

1. Apply the source’s q-series tail estimate on the reduced fundamental domain.
2. Bound every elementary symmetric coefficient by its corresponding sum of products of M_k.
3. The product ∏(1+M_k) bounds each such sum; round the certified outward rational bound upward using CN4.

**Direct dependencies:** [The order class polynomial](#class-polynomial); [Integrality of singular moduli and class polynomials](#integrality); [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary); tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus; ComputationalNumberTheory:CN.4; GeometryOfNumbersAndQuadraticArithmetic:GN.3.

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), Appendix 1, Lemma 8 and proof, pp.31–32. The j-bound is used with a safe product bound derived here, not a miscopied optimized coefficient formula.

**Acceptance.** Include the leading and constant coefficients; use the rational constant 2114567/1000 exactly. The height bound has no GRH hypothesis.

**Atlas planet:** Class polynomial height bound.

<a id="complex-class-polynomial-certificate"></a>
### A complex class-polynomial certificate

**Declaration:** TauCeti.CM.ComplexClassPolynomialCertificate. **Kind:** definition.

A certificate for D consists of the complete reduced-form/ideal-class census, one CN4 rational complex box per exact singular value j(τ_k), a checked finite q-series/tail enclosure for each box, coefficient boxes obtained by CN4’s outward polynomial-product propagation, and a monic P∈Z[X]. For every coefficient box, its imaginary interval contains 0 and its real interval contains exactly one integer, equal to the corresponding coefficient of P; integralness comes from CM.3. Class enumeration completeness and root enclosures are separate proof components; numerical proximity and a list of h unverified approximations do not constitute a certificate.

**Construction or proof.**

1. Use the finite reduced-form census to index all roots exactly once.
2. Import CN4 certified complex enclosures and coefficient propagation, and store their exact rational endpoints.
3. Apply the unique-integer check to each coefficient using the independently proved integrality theorem.

**Direct dependencies:** [The order class polynomial](#class-polynomial); [Integrality of singular moduli and class polynomials](#integrality); [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary); [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound); ComputationalNumberTheory:CN.4/complex-box-denotation; ComputationalNumberTheory:CN.4/integer-recovery-sound; ComputationalNumberTheory:CN.4; GeometryOfNumbersAndQuadraticArithmetic:GN.3.

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), Appendix 1 pp.31–32 and introduction. The class-polynomial height and product supply a CM-specific certificate atop generic validated numerics.

**Planning API.**

- **TauCeti.CM.ComplexClassPolynomialCertificate.roots_complete** (data): The checked root list is exactly the reduced-form/ideal-class census for D.
- **TauCeti.CM.ComplexClassPolynomialCertificate.coefficient_enclosure** (compatibility): CN4 product propagation encloses each exact H_D coefficient in the stored box.
- **TauCeti.CM.ComplexClassPolynomialCertificate.unique_integer** (characterisation): Each real coefficient box has ceil(lower)=floor(upper)=P.coeff(k), with imaginary 0 admitted.
- **TauCeti.CM.ComplexClassPolynomialCertificate.transport** (functoriality): Permuting the verified root census preserves the product certificate and output P.

**Uses driving the API.** CM.5 complex algorithm: Provides checkable exact output rather than an unvalidated rounding. ComputationalNumberTheory CN5 consumer: Carries the class-specific census, precision and exact coefficient provenance.

**Unit tests.**

- **TauCeti.CM.ComplexClassPolynomialCertificate.test_unique** (computation): An accepted Gaussian certificate whose constant-coefficient box has real interval [−17281/10,−17279/10] returns coefficient −1728.
- **TauCeti.CM.ComplexClassPolynomialCertificate.test_boundary** (non-example): A coefficient box with real interval [−1728,−1727] cannot occur in an accepted certificate because it contains two integers.
- **TauCeti.CM.ComplexClassPolynomialCertificate.test_missing_class** (non-example): No singleton root list can certify an order ring-isomorphic to Z+3Zi: the certificate’s own Picard census has two classes, irrespective of approximation accuracy.

**Acceptance.** A box [1727.9,1728.1]+i[−0.1,0.1] containing j(i)=1728 singles out integer 1728. A real interval [1727,1728] contains two integers and is rejected despite small width.

**Atlas planet:** Complex class polynomial certificate.

<a id="complex-algorithm-soundness-termination"></a>
### Certified complex computation: soundness and termination

**Declaration:** TauCeti.CM.complexClassPolynomial_sound_terminates. **Kind:** theorem.

The complex algorithm enumerates the verified class census, requests outward j-boxes from CN4 at increasing precision, propagates their product and returns the unique integer coefficients when the certificate checks. It returns exactly H_D. If all root centers/errors obey |j_k|≤M and |z_k−j_k|≤δ≤1, the total coefficient error is bounded by hδ(1+M+δ)^{h−1}; choose δ<1/(4h(2+M)^{h−1}) and corresponding outward widths below 1/2 to obtain unique integer recovery. CN4’s convergence/tail guarantees give finite termination; an approximate complex value without a validated tail is not an input oracle for this theorem.

**Construction or proof.**

1. Telescope products ∏(X−z_k)−∏(X−j_k) in the coefficient l¹ norm, using factor norm 1+M+δ.
2. Use the explicit δ bound to give a width smaller than one while containing each integral exact coefficient.
3. CN4 evaluates to arbitrarily small certified width and exact integer recovery yields soundness and termination.

**Direct dependencies:** [A complex class-polynomial certificate](#complex-class-polynomial-certificate); [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound); [Integrality of singular moduli and class polynomials](#integrality); ComputationalNumberTheory:CN.4/integer-recovery-sound; ComputationalNumberTheory:CN.4; [ComplexClassPolynomialCertificate.coefficient_enclosure](#complex-class-polynomial-certificate-api-coefficient-enclosure).

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), Appendix 1 pp.31–32. The source supplies the root bound; the telescoping product error inequality is the CM-specific precision derivation.

**Acceptance.** For h=1 the propagation error is δ; the general formula reduces correctly. The proof certifies P without assuming P=H_D in the certificate definition.

<a id="crt-class-polynomial-certificate"></a>
### A CRT class-polynomial certificate

**Declaration:** TauCeti.CM.CRTClassPolynomialCertificate. **Kind:** definition.

A CRT certificate consists of distinct certified rational primes p_i away from D and chosen to split completely in the ring class field, a verified ordinary curve/order seed at each p_i, a complete ideal-class action orbit with each endomorphism order separately certified, and the polynomial residues H_i=∏(X−j)∈F_{p_i}[X]. It includes an unconditional coefficient bound B and product M=∏p_i>2B, plus P∈Z[X] with |coeff(P)|≤B and coefficientwise P mod p_i=H_i. Root-count equality alone does not verify endomorphism rings, ordinary status, prime splitting or orbit completeness. The output is exact standard integer CRT; floating explicit-CRT variants require their own error certificate.

**Construction or proof.**

1. Validate distinct primes and the ring-class splitting certificate.
2. Verify the ordinary full-order seed independently, then enumerate its complete Picard orbit and modular product.
3. Store exact CRT residues and the strict product bound; signed reconstruction is coefficientwise.

**Direct dependencies:** [The order class polynomial](#class-polynomial); [Integrality of singular moduli and class polynomials](#integrality); [Singular moduli generate the ring class field](#ring-class-generator); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [The left ideal action on CM elliptic curves](#ideal-action); [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound); ComputationalNumberTheory:CN.1; ComputationalNumberTheory:CN.3; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate).

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), §§5.2–6 pp.17–20. The modular polynomial residues and size bound uniquely reconstruct the integer class polynomial.

**Planning API.**

- **TauCeti.CM.CRTClassPolynomialCertificate.residues** (data): P mod p_i equals the verified complete CM-root product at every prime.
- **TauCeti.CM.CRTClassPolynomialCertificate.modulus** (data): The usable modulus is the product of distinct coprime verified primes and is strictly greater than 2B.
- **TauCeti.CM.CRTClassPolynomialCertificate.unique** (characterisation): Two integer polynomials bounded coefficientwise by B with these residues are equal.
- **TauCeti.CM.CRTClassPolynomialCertificate.endomorphism_check** (compatibility): The order certificate is checked independently for every seed/orbit curve; a root of H_D mod p is not itself an order certificate.

**Uses driving the API.** CRT §6: Certifies exact integer reconstruction. CM.5 output acceptance: Requires full ideal orbit and independent order verification in addition to coefficients.

**Unit tests.**

- **TauCeti.CM.CRTClassPolynomialCertificate.test_strict_bound** (computation): For an actual accepted certificate with B=10, every polynomial with coefficients in [−10,10] and the checked residues equals its output; the certificate carries the strict product modulus.
- **TauCeti.CM.CRTClassPolynomialCertificate.test_equality_bound** (non-example): No accepted CRT certificate can have M=2B, even if boundary coefficients share residues; distinctness and the strict modulus are acceptance conditions.
- **TauCeti.CM.CRTClassPolynomialCertificate.test_duplicate_prime** (non-example): No two-index accepted certificate can assign p=5 to both indices. Repeating a congruence does not supply modulus 25.

**Acceptance.** For B=10, modulus 21 permits unique signed recovery; modulus 20 does not meet the strict sufficient bound. Repeated CRT primes do not increase the usable coprime modulus.

**Atlas planet:** CRT class polynomial certificate.

<a id="crt-algorithm-soundness-termination"></a>
### Certified CRT computation: soundness and termination

**Declaration:** TauCeti.CM.crtClassPolynomial_sound_terminates. **Kind:** theorem.

The standard CRT algorithm searches for distinct primes splitting completely in L_f/Q and avoiding the finite bad set, produces validated ordinary O_D curves and full Picard orbits, and continues until M>2B. Under the certified finite-field curve/trace/isogeny/order-search procedures requested from CN3, it terminates and returns exactly H_D∈Z[X]. Existence of infinitely many such primes follows from abelian Chebotarev over K and degree-one prime selection; exhaustive finite curve search plus Deuring lifting supplies suitable seeds. Soundness is unconditional. Randomized expected complexity or optimized prime bounds under GRH do not enter this theorem.

**Construction or proof.**

1. Use the supplied splitting theorem to find arbitrarily many admissible ordinary primes.
2. At each prime use exhaustive finite curve search and the independent prime-power order verifier. For r>3 exhaustive relation search terminates by Endo Proposition 5; at 2 and 3 use the certified climbing procedure. Suitable seeds exist by the CM reduction/lifting dictionary.
3. The complete class orbit gives exactly the reduced H_D roots. Strict CRT uniqueness and the integral coefficient bound identify the reconstruction with H_D.

**Direct dependencies:** [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [Singular moduli generate the ring class field](#ring-class-generator); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [Deuring lifting with an endomorphism](#deuring-lifting); [The left ideal action on CM elliptic curves](#ideal-action); [Elliptic CM Picard classification](#picard-classification); tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev; ComputationalNumberTheory:CN.1; ComputationalNumberTheory:CN.3; [CRTClassPolynomialCertificate.unique](#crt-class-polynomial-certificate-api-unique); [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete).

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), §6 and §7, correctness/termination discussion pp.18–21. Separate unconditional certified output from heuristic/GRH running-time claims.

**Acceptance.** Reject a supersingular seed even when all its j-values are present in an extension field. The implementation must produce the independent certificates before reporting success.

<a id="endomorphism-ring-certificate"></a>
### An ordinary endomorphism-ring certificate

**Declaration:** TauCeti.CM.OrdinaryEndomorphismCertificate. **Kind:** definition.

For an ordinary elliptic curve A/F_q with certified trace t and p∤t, write t²−4q=v²D_K, with D_K a fundamental negative discriminant and actual conductor u_A|v. A certificate for claimed 0<u|v stores certified factorizations and exact 2- and 3-adic conductor valuations from verified isogeny climbing. For EVERY prime power r^k|v with r>3 and k≥1, put j=ν_r(v)−k+1, D1=(v/r^j)²D_K and D2=r^{2k}D_K. Store an explicit signed ideal relation R_{r,k}, all its primes split in K and prime to v and p, together with independently checked counts c1=#R/D1>c2=#R/D2. Compute cA=#R/A by certified isogeny walks. Verification requires (cA<c1) iff r^k|u, plus agreement of the climbing valuations at 2 and 3 with those of u. Counts and climbing outputs are bound to actual curve/class-group calculations, not Boolean flags. Prime-only tests cannot certify arbitrary prime-power conductors.

**Construction or proof.**

1. Validate ordinary trace, fundamental discriminant, prime factorizations and u|v; compare certified climbing valuations at 2 and 3.
2. Enumerate every r^k|v for r>3, form the Corollary 4 comparison orders, and verify the explicit relation data and strict class-group-count inequality.
3. Compute the curve counts by certified isogeny walks, retaining multiplicities of sign choices; compare the prime-power divisibility decisions with those of the claimed conductor.

**Direct dependencies:** [CM order levels and horizontal isogeny graphs](#cm-isogeny-graphs); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; ComputationalNumberTheory:CN.1; ComputationalNumberTheory:CN.3; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic.

**Sources:** [Endo](https://arxiv.org/pdf/0902.4670v2), arXiv:0902.4670v2 §2.4, Lemma 3, Corollary 4 and Proposition 5, pp.5–6; §3.1–3.3 pp.6–8. Corollary 4 supplies prime-power divisibility decisions; Proposition 5 supplies exhaustive separating relations for r>3; small-prime climbing is treated separately. The prime-only §3.2 display requires adaptation outside the squarefree simplification.

**Planning API.**

- **TauCeti.CM.OrdinaryEndomorphismCertificate.trace** (data): The stored t is the certified finite-field trace and t²−4q=v²D_K.
- **TauCeti.CM.OrdinaryEndomorphismCertificate.conductor_divides** (data): The claimed conductor u divides the verified v.
- **TauCeti.CM.OrdinaryEndomorphismCertificate.valid_relations** (characterisation): Every r^k|v with r>3 is covered by a relation with c1>c2 for D1=(v/r^(ν_r(v)−k+1))²D_K and D2=r^{2k}D_K; the 2- and 3-adic conductor valuations are certified by isogeny climbing.
- **TauCeti.CM.OrdinaryEndomorphismCertificate.verify** (constructor): Check trace/factorizations, the climbing outputs at 2 and 3, each relation’s actual class-group counts and every prime-power curve-count decision; return the order certificate on success.

**Uses driving the API.** CRT certificate: Separately verifies End(A)=O_D instead of inferring it from a polynomial root. Endo §3.2: Certifies provisional conductors without repeating heuristic relation generation.

**Unit tests.**

- **TauCeti.CM.OrdinaryEndomorphismCertificate.test_maximal** (degenerate): For v=1 the only allowed conductor is u=1; factorization/trace checks still apply.
- **TauCeti.CM.OrdinaryEndomorphismCertificate.test_supersingular** (non-example): A supersingular curve with p|t is excluded from this ordinary certificate contract.
- **TauCeti.CM.OrdinaryEndomorphismCertificate.test_forged_relation** (non-example): A relation failing its promised class-group inequality is rejected before its curve count can certify u.
- **TauCeti.CM.OrdinaryEndomorphismCertificate.test_prime_powers** (computation): For v=25 and claimed u=5, both (5,1) and (5,2) are tested: the curve decisions must be true for 5|u and false for 25|u. A certificate indexing only the prime 5 misses this distinction.

**Acceptance.** If v=u=1 there are no relation inequalities, but the trace, fundamental discriminant and primality checks remain mandatory. A forged relation table with arbitrary successful Boolean flags is rejected.

<a id="endomorphism-verification-sound-complete"></a>
### Sound and complete ordinary order verification

**Declaration:** TauCeti.CM.ordinaryEndomorphism_verify_iff. **Kind:** theorem.

After checking trace/discriminant/factorizations, exact climbing valuations at 2 and 3, and all prime-power relation conditions in OrdinaryEndomorphismCertificate, Verify returns true iff the geometric endomorphism order has exactly the claimed conductor u. For r>3 Corollary 4 proves cA<c1 iff r^k|u_A, and equality of these decisions for every r^k|v proves ν_r(u_A)=ν_r(u). No squarefree restriction on v is imposed. This is unconditional for valid certificates; smooth FindRelation runtime heuristics are not verifier assumptions. The order certificate remains an independent CRT input.

**Construction or proof.**

1. The actual conductor u_A and the claimed u both divide v by the verified Frobenius-order data.
2. Apply Endo Corollary 4 separately to EVERY tested r^k: cA<c1 iff r^k|u_A. Agreement with claimed divisibility for all k determines each valuation for r>3.
3. Use certified isogeny climbing for r=2,3. Equality at every prime implies u_A=u, then transport the resulting order to geometric End.

**Direct dependencies:** [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate); [CM order levels and horizontal isogeny graphs](#cm-isogeny-graphs); tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups; ComputationalNumberTheory:CN.3; mathlib:ClassGroup; mathlib:ClassGroup.mk; mathlib:CommRing.Pic; mathlib:ClassGroup.equivPic; [OrdinaryEndomorphismCertificate.valid_relations](#endomorphism-ring-certificate-api-valid-relations).

**Sources:** [Endo](https://arxiv.org/pdf/0902.4670v2), arXiv:0902.4670v2 §2.4, Lemma 3, Corollary 4 and Proposition 5, pp.5–6; §3.1–3.3 pp.6–8. Corollary 4 supplies prime-power divisibility decisions; Proposition 5 supplies exhaustive separating relations for r>3; small-prime climbing is treated separately. The prime-only §3.2 display requires adaptation outside the squarefree simplification.

**Acceptance.** Knowing j is a root of H_D mod p does not bypass any of the relation or ordinary checks. v=25,u=5 is allowed; recording the prime support alone is insufficient to distinguish conductor 5 from 25.

<a id="complex-class-polynomial-certificate-api-coefficient-enclosure"></a>
### ComplexClassPolynomialCertificate.coefficient_enclosure

**Declaration:** TauCeti.CM.ComplexClassPolynomialCertificate.coefficient_enclosure. **Kind:** lemma.

CN4 product propagation encloses each exact H_D coefficient in the stored box.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [A complex class-polynomial certificate](#complex-class-polynomial-certificate).

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), Appendix 1 pp.31–32 and introduction. The class-polynomial height and product supply a CM-specific certificate atop generic validated numerics.

**Acceptance.** A box [1727.9,1728.1]+i[−0.1,0.1] containing j(i)=1728 singles out integer 1728. A real interval [1727,1728] contains two integers and is rejected despite small width.

<a id="crt-class-polynomial-certificate-api-unique"></a>
### CRTClassPolynomialCertificate.unique

**Declaration:** TauCeti.CM.CRTClassPolynomialCertificate.unique. **Kind:** lemma.

Two integer polynomials bounded coefficientwise by B with these residues are equal.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [A CRT class-polynomial certificate](#crt-class-polynomial-certificate).

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), §§5.2–6 pp.17–20. The modular polynomial residues and size bound uniquely reconstruct the integer class polynomial.

**Acceptance.** For B=10, modulus 21 permits unique signed recovery; modulus 20 does not meet the strict sufficient bound. Repeated CRT primes do not increase the usable coprime modulus.

<a id="endomorphism-ring-certificate-api-valid-relations"></a>
### OrdinaryEndomorphismCertificate.valid_relations

**Declaration:** TauCeti.CM.OrdinaryEndomorphismCertificate.valid_relations. **Kind:** lemma.

Every r^k|v with r>3 is covered by a relation with c1>c2 for D1=(v/r^(ν_r(v)−k+1))²D_K and D2=r^{2k}D_K; the 2- and 3-adic conductor valuations are certified by isogeny climbing.

**Construction or proof.**

1. Establish the stated API property using the construction and its specified supplier comparisons; this is a promoted API fact, not further target-level proof splitting.

**Direct dependencies:** [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate).

**Sources:** [Endo](https://arxiv.org/pdf/0902.4670v2), arXiv:0902.4670v2 §2.4, Lemma 3, Corollary 4 and Proposition 5, pp.5–6; §3.1–3.3 pp.6–8. Corollary 4 supplies prime-power divisibility decisions; Proposition 5 supplies exhaustive separating relations for r>3; small-prime climbing is treated separately. The prime-only §3.2 display requires adaptation outside the squarefree simplification.

**Acceptance.** If v=u=1 there are no relation inequalities, but the trace, fundamental discriminant and primality checks remain mandatory. A forged relation table with arbitrary successful Boolean flags is rejected.

<a id="complex-class-polynomial-algorithm"></a>
### Certified complex class-polynomial computation

**Declaration:** TauCeti.CM.complexClassPolynomial. **Kind:** construction.

For an admissible negative quadratic discriminant D, construct the deterministic complex algorithm returning P∈Z[X] together with a ComplexClassPolynomialCertificate(D,P). Enumerate all reduced proper classes; use CN4’s proved-tail j evaluator and rational outward product propagation at precisions 1,2,4,… until each coefficient box passes unique-integer recovery. The soundness/termination theorem justifies a total function with P=H_D. Its implementation is on the supplier algorithm/numeric carriers, not a new ball-arithmetic layer.

**Construction or proof.**

1. Instantiate the supplier algorithm carrier with the complete reduced-form census.
2. Run the CN4 enclosure/refinement/product operations and exact integer checks.
3. Use the explicit CM precision and termination theorem to return the polynomial and its certificate.

**Direct dependencies:** [Certified complex computation: soundness and termination](#complex-algorithm-soundness-termination); [A complex class-polynomial certificate](#complex-class-polynomial-certificate); ComputationalNumberTheory:CN.0; ComputationalNumberTheory:CN.4; GeometryOfNumbersAndQuadraticArithmetic:GN.3.

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), Introduction and Appendix 1, pp.1–2,31–32. The analytic alternative uses the class-specific coefficient bound and validated precision contract.

**Planning API.**

- **TauCeti.CM.complexClassPolynomial.certificate** (data): The returned certificate verifies the exact root census, coefficient enclosures and integer coefficients.
- **TauCeti.CM.complexClassPolynomial.correct** (characterisation): The returned polynomial equals H_D in Z[X].
- **TauCeti.CM.complexClassPolynomial.precision_independent** (compatibility): Different valid refinement schedules or root orderings return the same polynomial.

**Uses driving the API.** CM.5 acceptance: Returns a certified mathematical object, rather than an approximate coefficient list. ComputationalNumberTheory CN5: Exports the complete certificate and algorithm parameters.

**Unit tests.**

- **TauCeti.CM.complexClassPolynomial.test_minus4** (computation): For D=−4 the return is X−1728.
- **TauCeti.CM.complexClassPolynomial.test_minus3** (computation): For D=−3 the return is X.
- **TauCeti.CM.complexClassPolynomial.test_unvalidated_oracle** (non-example): A floating-point-only j evaluator without certified tails is not an admissible numeric supplier for this algorithm.

**Acceptance.** For D=−4 the return is X−1728 with a one-root exact certificate.

<a id="crt-class-polynomial-algorithm"></a>
### Certified CRT class-polynomial computation

**Declaration:** TauCeti.CM.crtClassPolynomial. **Kind:** construction.

For an admissible negative quadratic discriminant D, construct the standard integer CRT algorithm returning P∈Z[X] and a CRTClassPolynomialCertificate(D,P). Use the certified coefficient bound, admissible distinct ordinary primes, independent endomorphism checks and complete ideal-class root products until M>2B; reconstruct the unique signed coefficients. CN1/CN3 supply verified finite algorithms, while the CM termination proof makes this a total class-polynomial construction. No unproved GRH/heuristic complexity assumption is attached to correctness.

**Construction or proof.**

1. Use CN1 and the class-field splitting test to enumerate verified admissible primes.
2. Use CN3 plus the separate order verifier and complete class action to compute each modular root product.
3. Apply standard signed CRT and strict uniqueness, returning all provenance data.

**Direct dependencies:** [Certified CRT computation: soundness and termination](#crt-algorithm-soundness-termination); [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete); ComputationalNumberTheory:CN.0; ComputationalNumberTheory:CN.1; ComputationalNumberTheory:CN.3.

**Sources:** [CRT](https://arxiv.org/pdf/0903.2785v4), §6 pp.18–20, standard CRT variant. Return the exact polynomial and the residue/order/orbit certificates.

**Planning API.**

- **TauCeti.CM.crtClassPolynomial.certificate** (data): The return includes valid distinct-prime, endomorphism-order, class-orbit, residue and modulus checks.
- **TauCeti.CM.crtClassPolynomial.correct** (characterisation): The returned polynomial equals H_D in Z[X].
- **TauCeti.CM.crtClassPolynomial.prime_choice_independent** (compatibility): Every admissible complete prime-selection schedule returns the same polynomial.

**Uses driving the API.** CM.5 acceptance: Provides exact coefficients plus verified ideal-class action. CRT §6: Separates reconstruction from its modular data and endomorphism-order proof.

**Unit tests.**

- **TauCeti.CM.crtClassPolynomial.test_minus4** (computation): For D=−4 the return is X−1728.
- **TauCeti.CM.crtClassPolynomial.test_supersingular_rejected** (non-example): For the Gaussian supersingular seed at inert p=7, and any finite-field extension, the certified trace remains divisible by 7. The ordinary verifier on that actual curve returns failure, so it cannot supply a CRT seed.
- **TauCeti.CM.crtClassPolynomial.test_order_separate** (compatibility): Even if the actual curve’s j is a root of the proposed residue, a relation whose independently computed class counts do not separate D1 and D2 makes the order verifier fail. Polynomial-root membership cannot substitute for that check.

**Acceptance.** Changing the admissible prime order changes the certificate but not H_D.

**Layer refinements.** Complete the Deuring proof decomposition and generic quaternion-order contract; match CN4’s certified j-tail/precision interfaces and CN3’s finite complete seed/order/orbit search to the native typed prototypes. Match every conductor prime-power relation and certified 2/3-adic climbing to actual CN3/GN11 computations. Collate Endo v2 §3.2 with the journal version before extending the certificate-scope source finding beyond that preprint.

## CM.6. Examples, exports and limits

CM.6 is a process layer, so it introduces no declaration or planet. The complete Gaussian ring/ray example is in CM.3, the non-Galois quartic reflex example is in CM.0 and the dimension-two torsion/polarization realization is in CM.2. Exports reference those declarations and their actual prerequisites. General Hilbert-12 claims beyond the proved CM class fields are research frontiers.

## Supplier interfaces and open refinements

The following requests state the exact imports needed to complete the dependency chains. Each is owned by its supplier and consumed here; these requests do not develop generic supplier theory again.


**AbelianSchemesAndArithmeticModuli:A0** — Relative Lie algebra, invariant differentials and base change for group schemes; generic projective-module Serre tensor construction as the fppf sheaf associated to M⊗_R A(T).

Used by: [Serre tensoring by a CM ideal](#cm-serre-tensor); [CM Lie and Hodge eigenspace comparison](#cm-hodge-eigenspaces). Status: open.

**AbelianSchemesAndArithmeticModuli:A1** — Serre tensor preserves abelian schemes for finite projective modules, functoriality and ideal-inclusion isogenies, with finite flat kernels and degrees.

Used by: [Serre tensoring by a CM ideal](#cm-serre-tensor); [CM tensor ideal inclusions and their kernels](#cm-tensor-kernel-degree). Status: open.

**AbelianSchemesAndArithmeticModuli:A4** — Degree-one de Rham/Betti realizations and Hodge exact sequence, integration pairing and duality, compatible with CM actions and base change.

Used by: [CM Lie and Hodge eigenspace comparison](#cm-hodge-eigenspaces); [CM period and de Rham pairings](#cm-period-pairings); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The polarization and lattice reciprocity formula](#polarization-reciprocity-dictionary); [The explicit CM Frobenius ideal and slope formula](#shimura-taniyama-specialization). Status: open.

**AbelianSchemesAndArithmeticModuli:A5** — Polarized complex uniformization and algebraization of C^Φ/Φ(I), integral Riemann forms, analytic/algebraic Hom comparison, symplectic periods and principal polarization criterion.

Used by: [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [Polarized CM lattice data](#polarized-cm-lattice-data); [CM lattices and ideal isogenies in arbitrary dimension](#arbitrary-dimensional-classification); [The polarization and lattice reciprocity formula](#polarization-reciprocity-dictionary); [Explicit reciprocity on CM level functions](#explicit-level-reciprocity). Status: open.

**ArithmeticGaloisRepresentations:R01.2** — Rank-one local inertia and Weil–Deligne character, duality between covariant Tate and cohomological H¹, inertia-invariant Euler factors with geometric Frobenius on H¹, and induction/restriction at all primes.

Used by: [Full elliptic CM L-factorization, including bad primes](#full-elliptic-l-factorization). Status: open.

**ArithmeticGaloisRepresentations:R01.3** — Artin/Swan conductors and local rank-one conductor additivity under direct sums, including ramified places.

Used by: [Full elliptic CM L-factorization, including bad primes](#full-elliptic-l-factorization). Status: open.

**ArithmeticGaloisRepresentations:R01.5** — Semisimple representation recognition by good Frobenius polynomials and Chebotarev.

Used by: [CM induction and compatible-system comparison](#cm-induction-comparison). Status: open.

**ArithmeticGaloisRepresentations:R01.6** — Canonical covariant Tate module for abelian varieties, E⊗Q_l action, extension of coefficients and direct-summand realizations.

Used by: [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [One-dimensional CM components of the Tate module](#tate-coefficient-components); [Unramified CM residual Cartan normalizer](#residual-cartan-normalizer). Status: open.

**AutomorphicGaloisRepresentations:R19.3** — Compatible-system/purity comparison for CM Hecke components and weight-two theta-series/newform realizations, via Frobenius recognition; no new generic induction construction in CM.

Used by: [Frobenius and infinity-type identities](#frobenius-and-infinity-type); [CM induction and compatible-system comparison](#cm-induction-comparison). Status: open.

**ComputationalNumberTheory:CN.0** — Generic finite algorithm/representation carrier, proof-bearing computation outputs, exact polynomial arrays and search/refinement control; CM instantiates it with its own termination and certificate theorems.

Used by: [Certified complex class-polynomial computation](#complex-class-polynomial-algorithm); [Certified CRT class-polynomial computation](#crt-class-polynomial-algorithm). Status: open.

**ComputationalNumberTheory:CN.1** — Certified integer factorization and primality for discriminants, q, CRT primes and conductor factors.

Used by: [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [Certified CRT computation: soundness and termination](#crt-algorithm-soundness-termination); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate); [Certified CRT class-polynomial computation](#crt-class-polynomial-algorithm). Status: open.

**ComputationalNumberTheory:CN.3** — Certified finite-field elliptic trace and l-isogeny walks with sign multiplicities, exhaustive curve/seed search, and exact 2- and 3-adic conductor valuations by isogeny climbing. Bind outputs to intrinsic curves and ideal-class counts; CM proves prime-power conductor verification separately from j-polynomial roots.

Used by: [CM order levels and horizontal isogeny graphs](#cm-isogeny-graphs); [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [Certified CRT computation: soundness and termination](#crt-algorithm-soundness-termination); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate); [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete); [Certified CRT class-polynomial computation](#crt-class-polynomial-algorithm). Status: open.

**ComputationalNumberTheory:CN.4** — Validated rational complex boxes/balls, outward exp and modular q-series evaluations with proved tails, polynomial coefficient propagation, convergence and unique-integer recovery. CM supplies only its own height and precision formulas.

Used by: [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound); [A complex class-polynomial certificate](#complex-class-polynomial-certificate); [Certified complex computation: soundness and termination](#complex-algorithm-soundness-termination); [Certified complex class-polynomial computation](#complex-class-polynomial-algorithm). Status: open.

**GeometryOfNumbersAndQuadraticArithmetic:GN.2** — Generic quaternionic integral lattice/order carrier, localization, maximality and reduced discriminant compatible with the existing rational quaternion algebra; the full integral-order contract requires a verified source/ownership refinement within GN.2’s quaternionic integral-lattice direction.

Used by: [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Quaternion orders of a curve and of a level pair](#supersingular-curve-versus-level-pair). Status: open.

**GeometryOfNumbersAndQuadraticArithmetic:GN.3** — Primitive positive binary quadratic-form reduction/enumeration, exact complete finite class census, boundary identifications and finite stabilizer weights.

Used by: [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary); [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound); [A complex class-polynomial certificate](#complex-class-polynomial-certificate); [Certified complex class-polynomial computation](#complex-class-polynomial-algorithm). Status: open.

**ModularCurvesPartII:R12.1** — Elliptic lattice↔Weierstrass curve comparison, analytic functions and normalized j, full faithfulness for origin-preserving maps.

Used by: [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary). Status: open.

**ModularCurvesPartII:R12.6** — Level-function descent and evaluation at elliptic CM points, functions regular at the point and enough functions to separate its finite moduli orbit; compatibility with algebraic coarse/fine moduli.

Used by: [Relative polarized moduli orbit and field distinction](#relative-moduli-orbit); [Integrality of singular moduli and class polynomials](#integrality); [The field of admissible CM level values](#admissible-cm-value-field); [Deuring lifting with an endomorphism](#deuring-lifting). Status: open.

**ShimuraData:D3** — Generic cocharacter reflex-field carrier and stabilizer, with comparison to the trace-generated field of a CM type under RS-04.

Used by: [Trace description of the CM reflex field](#trace-reflex-field). Status: open.

**ShimuraVarieties:V4** — Special-torus reflex norm on finite ideles, rational elements and ideals, conjugation norm identity and exact Artin/level convention, independent of CM.2.

Used by: [The conductor-restricted reflex ideal map](#reflex-ideal-map); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary). Status: open.

**ShimuraVarieties:V5** — Main CM theorem and general Shimura–Taniyama theorem: actual CM abelian varieties, polarization similitude, torsion/finite-adelic H1 and Galois conjugation; input CM.0, never CM.2.

Used by: [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The polarization and lattice reciprocity formula](#polarization-reciprocity-dictionary); [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [The explicit CM Frobenius ideal and slope formula](#shimura-taniyama-specialization). Status: open.

**ShimuraVarieties:V8** — Siegel modular function field F_N over Q(ζ_N), GSp_{2g}(Z/N) right action and rational similitude action, descent and evaluation regular at a principally polarized CM point.

Used by: [Explicit reciprocity on CM level functions](#explicit-level-reciprocity); [Relative polarized moduli orbit and field distinction](#relative-moduli-orbit); [The field of admissible CM level values](#admissible-cm-value-field). Status: open.

**tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev** — Abelian Chebotarev: each class-field Artin class contains infinitely many degree-one primes avoiding any finite set; in particular infinitely many rational primes splitting completely in the quadratic ring class field.

Used by: [Integrality of singular moduli and class polynomials](#integrality); [Certified CRT computation: soundness and termination](#crt-algorithm-soundness-termination). Status: open.

**tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity** — Arithmetic global Artin reciprocity, Art(uniformizer)=arithmetic Frobenius, compatible with norms and finite extensions.

Used by: [Galois equivariance of class-polynomial roots](#class-polynomial-galois-action). Status: open.

**tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence** — Global class-field correspondence for arbitrary number fields: ray/idele open-subgroup fields, exact arithmetic Artin quotient, least conductor and conductor divisibility, uniqueness and field inclusion reversal.

Used by: [Relative polarized moduli orbit and field distinction](#relative-moduli-orbit); [Exact ray-level field and generation criterion](#ray-class-values). Status: open.

**tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields** — Imaginary quadratic ring/ray class fields with Artin/Picard and Artin/ray-class isomorphisms; conductor divisibility..

Used by: [Integrality of singular moduli and class polynomials](#integrality); [Galois equivariance of class-polynomial roots](#class-polynomial-galois-action); [Singular moduli generate the ring class field](#ring-class-generator); [Exact ray-level field and generation criterion](#ray-class-values); [Canonical Gross characters and their conductor support](#canonical-gross-character); [Canonical Gross curve good reduction at the inert prime](#gross-curve-good-reduction); [A CRT class-polynomial certificate](#crt-class-polynomial-certificate). Status: open.

**tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv** — Weierstrass elliptic curve↔elliptic scheme comparison, transporting twists, endomorphisms, j and Tate modules through the pinned carriers. Elliptic CMAction/order-embedding, algebraic End and automorphism/isogeny carriers compatible with the pinned Weierstrass isogeny and degree; elliptic Lie scalar identification.

Used by: [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [The left ideal action on CM elliptic curves](#ideal-action); [Exceptional CM automorphism factors](#automorphism-factors); [The rational CM quadratic self-twist isogeny](#rational-cm-self-twist); [Deuring lifting with an endomorphism](#deuring-lifting); [Quaternion orders of a curve and of a level pair](#supersingular-curve-versus-level-pair). Status: open.

**tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68** — Covariant elliptic Tate module and Weil pairing, integral torsion kernels and degrees, compatibility with Weierstrass maps.

Used by: [A dimension-two torsion and polarization example](#dimension-two-example). Status: open.

**tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1** — Ordinary/supersingular predicates, geometric endomorphisms, Frobenius, trace and finite-field point counting in all characteristics, including 2 and 3.

Used by: [A dimension-two torsion and polarization example](#dimension-two-example); [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [Deuring lifting with an endomorphism](#deuring-lifting); [CM order levels and horizontal isogeny graphs](#cm-isogeny-graphs); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate). Status: open.

**tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv** — Generic elliptic local reduction theorem: integral j iff potentially good reduction, good-model specialization of endomorphisms and conductor/local Euler compatibility, with no exclusion of residue characteristics 2 or 3.

Used by: [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary). Status: open.

**tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5** — Quadratic-twist equation/isomorphism and descent with Galois cocycle; twisting a rational CM curve by its CM quadratic character.

Used by: [The rational CM quadratic self-twist isogeny](#rational-cm-self-twist). Status: open.

**tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic** — Archimedean exponent conventions, algebraic infinity types, conjugation, cyclotomic character and coefficient embeddings; positive ideal type versus negative idelic type.

Used by: [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [One-dimensional CM components of the Tate module](#tate-coefficient-components); [Frobenius and infinity-type identities](#frobenius-and-infinity-type); [Canonical Gross characters and their conductor support](#canonical-gross-character). Status: open.

**tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups** — Generic finite Z-orders R in number fields, conductor ideal, proper invertible fractional ideals, order-specific finiteness/API on the existing ClassGroup/Pic carriers, extension/contraction away from the conductor, ideal norms and the quadratic-order class number formula.

Used by: [The CM reflex order](#reflex-order); [Conductor-sensitive nonmaximal quadratic order example](#nonmaximal-quadratic-example); [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [The left ideal action on CM elliptic curves](#ideal-action); [Elliptic CM Picard classification](#picard-classification); [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary); [Degree of an ideal isogeny](#ideal-isogeny-degree); [Polarized CM lattice data](#polarized-cm-lattice-data); [CM lattices and ideal isogenies in arbitrary dimension](#arbitrary-dimensional-classification); [The conductor-restricted reflex ideal map](#reflex-ideal-map); [The polarized CM level stabilizer](#polarized-level-stabilizer); [Reflex class map and the polarized unit obstruction](#class-map-and-unit-obstruction); [The order class polynomial](#class-polynomial); [The complete Gaussian ring-class example](#complete-elliptic-example); [Unramified CM residual Cartan normalizer](#residual-cartan-normalizer); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [CM order levels and horizontal isogeny graphs](#cm-isogeny-graphs); [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate); [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete). Status: open.

**tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary** — Ideal/idele ray-class comparison, mod× congruences for fractional elements, arithmetic normalization and ideals prime to a modulus.

Used by: [The conductor-restricted reflex ideal map](#reflex-ideal-map); [Explicit reciprocity on CM level functions](#explicit-level-reciprocity); [The polarized CM level stabilizer](#polarized-level-stabilizer); [Exact ray-level field and generation criterion](#ray-class-values). Status: open.

**tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles** — Norms and base change for ideals/ideles of finite extensions, compatible with arithmetic Artin maps.

Used by: [The conductor-restricted reflex ideal map](#reflex-ideal-map); [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [Canonical Gross characters and their conductor support](#canonical-gross-character); [Canonical Gross curve good reduction at the inert prime](#gross-curve-good-reduction); [The explicit CM Frobenius ideal and slope formula](#shimura-taniyama-specialization). Status: open.

**tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters** — Algebraic Hecke-character carrier on ideles/ideals, conductor as the least finite modulus, local components and Euler factors, coefficient fields and passage to l-adic characters.

Used by: [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [One-dimensional CM components of the Tate module](#tate-coefficient-components); [Full elliptic CM L-factorization, including bad primes](#full-elliptic-l-factorization); [Canonical Gross characters and their conductor support](#canonical-gross-character). Status: open.

**tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus** — Independent LevelOne.JInputs: normalized modular j with q-expansion q⁻¹+744+196884q+…, j(i)=1728 and j(exp(2πi/3))=0, orbit separation, holomorphic evaluations, integral modular polynomial Φ_l and the prime diagonal −Φ_l(X,X) monic of degree 2l. This package has no dependency on CM.

Used by: [The order class polynomial](#class-polynomial); [Integrality of singular moduli and class polynomials](#integrality); [The complete Gaussian ring-class example](#complete-elliptic-example); [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound). Status: open.

**tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion** — Existing quaternion algebra/reduced norm and split-or-division API; reuse actual QuaternionAlgebra and its naturality, not a new CM-specific division algebra carrier.

Used by: [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Quaternion orders of a curve and of a level pair](#supersingular-curve-versus-level-pair). Status: open.

### Recorded gaps

These name unresolved source proofs and unavailable adapter identifications. They do not remove targets from the plan.

**Absolute versus reflex moduli-degree adapter.** Verify the exact object denoted Q(A) and the passage from the relative polarized CM-action orbit to the absolute unmarked moduli field in Tsimerman §5 p.386. The relative stabilizer theorem is specified; descent obstructions, forgetting-action fibers and absolute degree bounds require a source-based adapter, not the printed equality by itself.

Needed by: [Relative polarized moduli orbit and field distinction](#relative-moduli-orbit).

**Canonical Gross construction primary-proof access.** Read and decompose Rohrlich’s canonical-character/curve construction cited by BKO §3.0.1 and Yang Introduction. The precise canonical conditions, conjugation and ramified-prime conductor-support contract are stated, but the construction and its existence proof are not claimed source-closed. The BKO odd-discriminant specialization is kept; exact conductor exponents need a separate verified local calculation.

Needed by: [Canonical Gross characters and their conductor support](#canonical-gross-character); [Canonical Gross curve good reduction at the inert prime](#gross-curve-good-reduction).

**Full Deuring primary proof and generic quaternion-order carrier.** The introduction, realization conclusion and lifting passage of Deuring 1941 were read, but its complete classification proof has not been decomposed line by line. Complete the prime-to-p/p-local maximality argument and confirm the generic quaternion integral-order/maximality carrier with GeometryOfNumbers GN.2; QFI Layer2 supplies the algebra but not that carrier. Preserve all-characteristic scope and geometric/base-field End distinction.

Needed by: [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [Deuring lifting with an endomorphism](#deuring-lifting); [Quaternion orders of a curve and of a level pair](#supersingular-curve-versus-level-pair).

**Certified CM j-evaluator and finite-field order-search supplier signatures.** CN4 has exact enclosure/rounding nodes, but an audited arbitrary-precision j(q) evaluator with proved tails on reduced CM arguments is still requested. CN3 must provide finite-field trace/isogeny/relation counts and complete seed search at admissible primes. The CM-specific height, error, CRT and verifier statements are planned; algorithm termination depends on these precisely stated supplier contracts.

Needed by: [A complex class-polynomial certificate](#complex-class-polynomial-certificate); [Certified complex computation: soundness and termination](#complex-algorithm-soundness-termination); [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [Certified CRT computation: soundness and termination](#crt-algorithm-soundness-termination); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate); [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete).

**Suggested native-carrier and omitted-condition refinements.** The native signatures retain the full named conclusions and use scheme objects, morphisms, actual End-ring selectors, typed representation intertwiners, indexed Hodge/period modules, order Picard censuses and intrinsically bound certificate computations. They still omit exact unavailable supplier identifications: finite étale CM algebras and selected reflex factors, analytic algebraization and CM actions, proper smooth/generic-fiber and good-model specialization functors, canonical least conductors, actual Frobenius/Hecke/theta realizations, modular-function local rings, and certified CN3/CN4 algorithm identities/completeness. Each omitted condition is stated beside its signature; the displayed binders alone need not imply the statement. Resolve these adapter contracts against the cited owning roadmaps, without weakening the conclusion or introducing new generic carriers. Type checking in the Mathlib-pinned build does not check these identifications or build the unavailable Tau Ceti modules.

Needed by: [CM types of finite étale CM algebras](#cm-type); [Induced and primitive CM types](#induced-and-primitive-type); [Trace description of the CM reflex field](#trace-reflex-field); [Inverse-coset construction of the reflex type](#reflex-type); [Type-product, conjugation and change-of-type identities](#type-product-identities); [The CM reflex order](#reflex-order); [A non-Galois quartic CM type and its reflex](#non-galois-quartic-example); [Conductor-sensitive nonmaximal quadratic order example](#nonmaximal-quadratic-example); [The elliptic curve of an ideal lattice](#ideal-lattice-curve); [The left ideal action on CM elliptic curves](#ideal-action); [Elliptic CM Picard classification](#picard-classification); [Exceptional CM automorphism factors](#automorphism-factors); [Positive forms, CM points and ideal classes](#quadratic-forms-dictionary); [Degree of an ideal isogeny](#ideal-isogeny-degree); [The rational CM quadratic self-twist isogeny](#rational-cm-self-twist); [Serre tensoring by a CM ideal](#cm-serre-tensor); [CM tensor ideal inclusions and their kernels](#cm-tensor-kernel-degree); [CM Lie and Hodge eigenspace comparison](#cm-hodge-eigenspaces); [CM period and de Rham pairings](#cm-period-pairings); [Polarized CM lattice data](#polarized-cm-lattice-data); [CM lattices and ideal isogenies in arbitrary dimension](#arbitrary-dimensional-classification); [The conductor-restricted reflex ideal map](#reflex-ideal-map); [Normalized idele and torsion dictionary](#normalized-idele-torsion-dictionary); [The polarization and lattice reciprocity formula](#polarization-reciprocity-dictionary); [Explicit reciprocity on CM level functions](#explicit-level-reciprocity); [The polarized CM level stabilizer](#polarized-level-stabilizer); [Reflex class map and the polarized unit obstruction](#class-map-and-unit-obstruction); [Relative polarized moduli orbit and field distinction](#relative-moduli-orbit); [A dimension-two torsion and polarization example](#dimension-two-example); [The order class polynomial](#class-polynomial); [Integrality of singular moduli and class polynomials](#integrality); [Galois equivariance of class-polynomial roots](#class-polynomial-galois-action); [Singular moduli generate the ring class field](#ring-class-generator); [The field of admissible CM level values](#admissible-cm-value-field); [Exact ray-level field and generation criterion](#ray-class-values); [The complete Gaussian ring-class example](#complete-elliptic-example); [The algebraic Hecke character of a CM abelian variety](#cm-hecke-character); [One-dimensional CM components of the Tate module](#tate-coefficient-components); [Frobenius and infinity-type identities](#frobenius-and-infinity-type); [Full elliptic CM L-factorization, including bad primes](#full-elliptic-l-factorization); [CM induction and compatible-system comparison](#cm-induction-comparison); [Unramified CM residual Cartan normalizer](#residual-cartan-normalizer); [Canonical Gross characters and their conductor support](#canonical-gross-character); [Canonical Gross curve good reduction at the inert prime](#gross-curve-good-reduction); [Deuring’s characteristic-p endomorphism classification](#deuring-classification); [Potential good reduction and the split/non-split dichotomy](#cm-reduction-dictionary); [The explicit CM Frobenius ideal and slope formula](#shimura-taniyama-specialization); [Deuring lifting with an endomorphism](#deuring-lifting); [CM order levels and horizontal isogeny graphs](#cm-isogeny-graphs); [Quaternion orders of a curve and of a level pair](#supersingular-curve-versus-level-pair); [An explicit coefficient bound for the class polynomial](#class-polynomial-height-bound); [A complex class-polynomial certificate](#complex-class-polynomial-certificate); [Certified complex computation: soundness and termination](#complex-algorithm-soundness-termination); [A CRT class-polynomial certificate](#crt-class-polynomial-certificate); [Certified CRT computation: soundness and termination](#crt-algorithm-soundness-termination); [An ordinary endomorphism-ring certificate](#endomorphism-ring-certificate); [Sound and complete ordinary order verification](#endomorphism-verification-sound-complete); [Certified complex class-polynomial computation](#complex-class-polynomial-algorithm); [Certified CRT class-polynomial computation](#crt-class-polynomial-algorithm).

### Structure and ownership

CM.6 is a process layer in the reviewed audit, not a mathematical construction; its example obligations have actual owners in CM.2 and CM.3. Remove CM.6 as a mathematical star, retaining its export/limits prose in the introduction and the cited examples in CM.2/CM.3. Keep CM.0 before V5 and CM.2 after V5 under accepted RS-04.

Confirmed RT-AREA-computational/14 requires a direct CN.4 input to CM.5, including enclosure arithmetic and generic precision propagation. Add CN.4→CM.5 through the exact imported enclosure/rounding nodes and requested j-evaluator; CM.5 owns only coefficient height/precision specialization, standard CRT and independent order certificates.

Owners tauceti:TauCetiRoadmap/ModularForms, tauceti:TauCetiRoadmap/ModularCurves: The CM integrality proof requests the independent LevelOne.JInputs package: normalized j and prime diagonal modular-polynomial integrality before CM. The CM blueprint does not modify or re-plan either upstream roadmap, nor impose a CM→j cycle.


## Source corrections and version limits

The corrected statements above use these source findings. The descriptions are paraphrases; source passages are not reproduced.

**E1 — Tsimerman, Published §5 p.386, norm in definition of H.** The source labels the absolute ideal norm as coming from K while its input is an ideal of K*. I is an ideal of K*, so use its positive rational absolute ideal norm N_{K*/Q}(I). Distinguish this rational number from the ideal N(I)O_K in the reflex-norm identity.

Reason: The input I belongs to Cl(K*), not the ideal group of K. The corrected norm gives NΦ(I) overline(NΦ(I))=N_{K*/Q}(I) O_K, and the unit obstruction is a a-bar divided by this positive rational norm.

Correction status: new; an independent blueprint review must confirm this published misprint. Finding scope: nothing.

**E2 — Tsimerman, Published Lemma 4.1 proof, p.384.** The source claims rigidity for A when a basis of A[3] is specified. Use a polarization-preserving full-level moduli problem. An unpolarized abelian variety with full level 3 need not have trivial automorphisms. For forgetting polarization, supply a separate bounded field-of-definition argument; CM.2 does not infer the absolute unmarked degree equality.

Reason: Take a CM abelian surface whose CM field has an infinite unit group. Infinite-order integral units congruent to 1 modulo 3 act as origin-preserving automorphisms and act trivially on A[3]. Polarization-preserving automorphisms are finite and level at least 3 kills their torsion. This distinction is exactly why the polarized stabilizer cannot be exported as an unmarked absolute field-degree identity.

Correction status: Previously recorded as PAPER-TSIMERMAN-18/E10 in the existing extraction; no published correction located. Finding scope: the proof.

**E3 — MIT21, Fall 2023 Lecture 21, Theorem 21.14, p.10.** The source claims a factorization into linear factors with no repetitions. Require an ordinary split residue characteristic, prime to the order discriminant. Do not infer ordinary reduction or distinct CM roots from the norm q of a prime of the ring class field alone.

Reason: For D=-23 the exact polynomial is X^3+3491750X^2-5151296875X+12771880859375. The prime 5 is inert in K=Q(sqrt(-23)); the K-ideal (5) is principal and splits completely in the Hilbert class field over K. Its primes therefore have norm q=25, coprime to D. Nevertheless H_{-23} mod 5 is X^3, with repeated roots. Coefficients were cross-checked against the Sage primary reference example https://doc.sagemath.org/html/en/reference/arithmetic_curves/sage/schemes/elliptic_curves/cm.html (hilbert_class_polynomial(-23)); the residue computation is exact.

Correction status: new; the Fall 2025 OCW lecture repeats the missing hypothesis, rather than correcting it. Finding scope: a stated result.

**E4 — Endo, arXiv:0902.4670v2, 17 March 2009, §3.2 p.7, Certify steps 1–4; compare §3.1 p.6 and §2.4 Corollary 4 pp.5–6.** The source ranges over every prime p dividing v/u. Either explicitly restrict the displayed prime-only Certify routine to the squarefree residual conductor used in the simplified Algorithm 1, or replace it by the prime-power separation of Corollary 4 and independently certify conductor valuations at 2 and 3. The packet uses the latter; this finding concerns the unqualified certificate-construction scope of the read preprint, not the published JNT version.

Reason: For v=25 and claimed u=5, Certify step 2 sets D1=u²D_K=25D_K and D2=5²D_K=25D_K. It therefore asks FindRelation to separate the same class group by a strict count inequality, which is impossible. These conductor data are not excluded by ordinary trace arithmetic: p=q=641, t=8 and D_K=-4 give t²-4q=25²D_K, with p not dividing t. Section 3.1 explicitly assumes no large squared prime remains for Algorithm 1, but §3.2 allows a proposed conductor from other constructions and does not impose that restriction. Removal of small primes is not an unconditional restriction on this display. Corollary 4 supplies the general prime-power repair. This does not dispute conditional soundness of a correctly constructed valid certificate or the heuristically stated running-time results.

Correction status: new within this bounded audit; a squarefree simplification is explicit for Algorithm 1, but no applicable correction to the general §3.2 display was established. Finding scope: a stated result.

## Pinned library inputs

These declarations were read at the pins above. Baseline objects are reused, rather than nodes of this plan.

- **mathlib:NumberField.IsCMField**, Mathlib/NumberTheory/NumberField/CMField.lean: A totally complex field quadratic over its maximal real subfield; reuse rather than defining CM fields.

- **mathlib:NumberField.IsCMField.complexConj**, Mathlib/NumberTheory/NumberField/CMField.lean: For K integral over Q, the nontrivial K⁺-algebra automorphism K→K.

- **mathlib:NumberField.IsCMField.complexEmbedding_complexConj**, Mathlib/NumberTheory/NumberField/CMField.lean: For every complex ring embedding φ, φ(c(x))=conj(φ(x)).

- **mathlib:NumberField.IsCMField.complexConj_apply_apply**, Mathlib/NumberTheory/NumberField/CMField.lean: For all x, c(c(x))=x.

- **mathlib:NumberField.IsCMField.complexConj_eq_self_iff**, Mathlib/NumberTheory/NumberField/CMField.lean: c(x)=x iff x belongs to the maximal real subfield.

- **mathlib:FractionalIdeal**, Mathlib/RingTheory/FractionalIdeal/Basic.lean: Native R-submodules of a localization with one denominator in S clearing all elements. Invertibility is additional, represented by units of this multiplicative carrier.

- **mathlib:IntermediateField.adjoin**, Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean: Smallest intermediate field over F containing a specified subset of E.

- **mathlib:IntermediateField.adjoin_le_iff**, Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean: adjoin F S≤T iff S⊆T.

- **tauceti:TauCeti.AlgebraicGeometry.AbelianVariety**, TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean: Group object in schemes over Spec K, proper and geometrically integral.

- **tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End**, TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean: Additive wrapper of A⟶A, with endomorphism composition as multiplication.

- **tauceti:TauCeti.Isogeny**, TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean: Weierstrass affine isogeny as coordinate pullback into the source function field, satisfying the infinity condition.

- **tauceti:TauCeti.Isogeny.degree**, TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean: Degree is the finrank of the source function field over the pulled-back target field.

- **mathlib:WeierstrassCurve.j**, Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean: For an elliptic equation with invertible discriminant, j=Δ⁻¹c₄³.

- **mathlib:ClassGroup**, Mathlib/RingTheory/ClassGroup/Basic.lean: For any commutative domain R, invertible fractional ideals in FractionRing R modulo principal ideals; no Dedekind hypothesis, hence already covers nonmaximal quadratic orders.

- **mathlib:ClassGroup.mk**, Mathlib/RingTheory/ClassGroup/Basic.lean: Class map from units of FractionalIdeal R⁰ K for a fraction field K of a domain R.

- **mathlib:CommRing.Pic**, Mathlib/RingTheory/PicardGroup.lean: Native Picard group of a commutative semiring, invertible modules up to isomorphism.

- **mathlib:ClassGroup.equivPic**, Mathlib/RingTheory/PicardGroup.lean: For every commutative domain R, a multiplicative equivalence ClassGroup R ≃ Pic R; no maximal-order assumption.

- **mathlib:CommRing.Pic.mapAlgebra**, Mathlib/RingTheory/PicardGroup.lean: Base change Pic R→Pic A from tensoring invertible modules along any R-algebra A.

- **mathlib:NumberField.RingOfIntegers**, Mathlib/NumberTheory/NumberField/Basic.lean: The integral closure of Z in K, implemented as integralClosure Z K; coerces injectively to K and has its canonical Z-algebra structure. Reuse for the maximal-order lattice, not a new CM order carrier.

## Public sources and reading scope

The cited public versions are identified by their hashes in the packet. Reading scope is limited to the passages supplying the targets; no unavailable published version is silently substituted for a read preprint.

**MilneCM.** James S. Milne, [Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf). v0.10, 14 July 2020. Read 2026-10-08.

Passages read: §1 pp.11–19; Example 2.9 pp.25–26; §3.11–3.17 pp.29–31; §8.1–8.7 pp.66–70; §9 pp.74–84, especially Theorem 9.10, Remark 9.11(c) and Theorem 9.17.

**MilneFT.** James S. Milne, [The fundamental theorem of complex multiplication](https://arxiv.org/pdf/0705.3446v1). arXiv:0705.3446v1, 2007. Read 2026-10-08.

Passages read: Introduction pp.1–3; §3 pp.20–21 (Artin normalization).

**Streng.** Marco Streng, [An explicit version of Shimura’s reciprocity law for Siegel modular functions](https://arxiv.org/pdf/1201.0020v4). arXiv:1201.0020v4, 22 April 2024. Read 2026-10-08.

Passages read: §2.5–2.8 pp.5–8, Theorems 2.4–2.5; §4.2 pp.13–14; §4.4–4.5 pp.15–17.

**BT.** Ashay A. Burungale and Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2). arXiv:2506.03465v2, October 2025; published Annals 203 (2026), not collated. Read 2026-10-08.

Passages read: Complete 7-page preprint; CM types §2.2.5 p.5 and the proof of Theorem 1.1 in §3.1 p.6.

**KS.** Guido Kings and Johannes Sprang, [Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation](https://arxiv.org/pdf/1912.03657v4). arXiv:1912.03657v4, 14 September 2024; published Annals 202 (2025), not collated. Read 2026-10-08.

Passages read: §1.1–1.2 pp.6–11; Definition 1.8 and Serre equation (1.2.3) p.9; Proposition 1.11 pp.10–11 and Corollaries 1.12–1.13 p.11.

**BKO.** Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1). Published Annals 194 (2021), 943–966, Caltech deposited copy. Read 2026-10-08.

Passages read: §3.0.1 pp.950–951; Theorem 3.4 proof p.953 and equation (3.8).

**BS.** Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Published Annals 191 (2020), 355–392. Read 2026-10-08.

Passages read: §6 pp.372–373 (CM Cartan normalizer exclusion).

**Tsimerman.** Jacob Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Published Annals 187 (2018), 379–390. Read 2026-10-08.

Passages read: §4 pp.384–385 and §5 pp.385–386; earlier pages are not a source of additional targets here.

**AGHMP.** Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Published Annals 187 (2018), 391–531. Read 2026-10-08.

Passages read: §3.4 p.420 (CM types and total-reflex character restriction); §9.1 pp.508–509.

**YZ.** Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Published Annals 187 (2018), 533–638; §2.2 reflex data; 2022 author erratum introduction read separately, 2023 journal erratum not collated. Read 2026-10-08.

Passages read: §2.2 p.546 (trace reflex field, reflex order); height comparisons outside scope.

**GZ.** Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Published Inventiones 84 (1986), 225–320; GDZ scan. Read 2026-10-08.

Passages read: Chapter III pp.256–257 and 260–261, visual page inspection; §4 p.257 and §7 p.261.

**Deuring.** Max Deuring, [Die Typen der Multiplikatorenringe elliptischer Funktionenkörper](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf). Published Abhandlungen Hamburg 14 (1941), 197–272; Mainz scan. Read 2026-10-08.

Passages read: Introduction pp.197–200; §9.1 pp.258–262 (lifting proof, partial); §8 conclusion p.258.

**CRT.** Andrew V. Sutherland, [Computing Hilbert class polynomials with the Chinese Remainder Theorem](https://arxiv.org/pdf/0903.2785v4). arXiv:0903.2785v4, 22 November 2013; published Math. Comp. 80 (2011). Read 2026-10-08.

Passages read: Introduction pp.1–2; §4.2–5.2 pp.13–17, Proposition 5 and unconditional class enumeration; §6–7 pp.18–22; Appendix 1 Lemma 8 pp.31–32.

**Endo.** Gaetan Bisson and Andrew V. Sutherland, [Computing the endomorphism ring of an ordinary elliptic curve over a finite field](https://arxiv.org/pdf/0902.4670v2). arXiv:0902.4670v2, 17 March 2009. Read 2026-10-08.

Passages read: arXiv v2 §2.1 p.3; §2.4 Lemma 3, Corollary 4 and Proposition 5 pp.5–6; §3.1–3.3 pp.6–8.

**Kato.** Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0/). Published Astérisque 295 (2004), 117–290. Read 2026-10-08.

Passages read: §§15.10–15.11 pp.260–262 (CM induction and type conventions).

**Yang.** Tonghai Yang, [On CM abelian varieties over imaginary quadratic fields](https://people.math.wisc.edu/~tonghaiyang/HKCM.pdf). Author copy of Math. Ann. 329 (2004), 87–117. Read 2026-10-08.

Passages read: Introduction pp.1–3, canonical characters and existence distinctions.

**MIT16.** Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf). Fall 2023 lecture notes. Read 2026-10-08.

Passages read: Introduction p.1; Theorem 16.4 pp.4–5; §16.3, Definition 16.9 and Theorem 16.12 pp.6–7.

**MIT20.** Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf). Fall 2023 lecture notes. Read 2026-10-08.

Passages read: Complete 8-page lecture; lattice/isogeny comparison pp.1–3; §20.3 pp.5–7, product, ideal action, Lemma 20.9, Theorems 20.11–20.12.

**MIT21.** Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf). Fall 2023 lecture notes. Read 2026-10-08.

Passages read: §21.1 pp.1–3; §21.6 p.10; §21.7 diagram p.11.

**MIT22.** Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 22](https://math.mit.edu/classes/18.783/2023/LectureNotes22.pdf). Fall 2023 lecture notes. Read 2026-10-08.

Passages read: §22.1 pp.1–3 (CM horizontal/ascending/descending isogenies).

## Suggested signatures

The companion suggested file uses the pinned native field, order, scheme, morphism, module, representation, polynomial and interval carriers. Missing supplier identifications are stated next to each signature, including the actual End selectors, local modular-function rings, normalized realization and complete CN3/CN4 algorithms. The named conclusions retain the full target; some displayed native binders alone do not imply them until those identifications are supplied. Elaboration verifies syntax and types. It does not establish these conditions or implement any target.
