# Complex multiplication and explicit reciprocity

Complex multiplication turns ideal arithmetic into geometry and then into explicit class fields. This roadmap builds the dictionary: CM types and their reflex data, curves and polarized abelian varieties from ideal lattices, arithmetic reciprocity on torsion and modular values, Hecke characters with their actual Galois realizations, and certificates for class polynomials and ordinary endomorphism rings. The dictionary must keep the chosen order, CM action, polarization, model field and level visible. Forgetting any one of them can change the stabilizer or the field being generated.

The elliptic case gives ring and ray class fields of imaginary quadratic fields. Higher-dimensional CM supplies reflex-field reciprocity and polarized moduli orbits. The roadmap does not assert a solution of Hilbert's twelfth problem for arbitrary number fields, an unrestricted class-field theorem for higher-dimensional nonmaximal orders, or an equality between a relative polarized orbit and an absolute unmarked field of moduli. Height and Colmez comparisons belong to ComplexMultiplicationAndExplicitReciprocityPartII. Heegner-point, Euler-system and p-converse arguments consume the interfaces here and remain in their own roadmaps.

The definitive mathematical specification is this README. [Suggested.lean](Suggested.lean) proposes names, signatures and examples with admitted proofs. Its comments identify supplier conditions that its binders cannot yet express; a well-typed prototype does not establish these conditions or prove its conclusions. In particular, arbitrary ring maps, scheme objects, value functions and representation matrices become CM objects only after the identifications specified here.

## 1. Scope, ownership and library inputs

### 1.1 Dependency direction

CM.0 constructs embedding-partition types and compares their trace reflex field with ShimuraData D3. ShimuraVarieties V4 constructs the special-torus reflex norm, and V5 proves the main CM theorem and the general Shimura–Taniyama formula using CM.0. CM.2 specializes those theorems to explicit ideal, torsion, polarization and level formulas. Thus the order is CM.0 → V4/V5 → CM.2; V5 has no dependency on CM.2.

| Material used here | Owning roadmap and interface |
| --- | --- |
| Orders, conductors, proper invertible ideals, their finite class groups, extension and contraction | GlobalNumberFields, Layer 11; use Mathlib's existing ClassGroup and Pic |
| Fractional ray congruences, ideal/idele comparison, norms, Hecke characters and infinity types | GlobalNumberFields, Layers 7–10 |
| Arithmetic Artin map, class-field correspondence, quadratic ring and ray class fields | ClassFieldTheory, Layers 11–13 |
| CM-action vocabulary, equation/scheme comparison, endomorphisms, twists, torsion, Weil pairing, local reduction | EllipticCurves, Layers 1–5 |
| Elliptic complex uniformization, analytic/algebraic Hom comparison, regular level-function evaluation | ModularCurvesPartII, R12.1 and R12.6 |
| Relative Lie theory, Serre tensor, Hodge/period realization, polarized uniformization, Rosati and degree | AbelianSchemesAndArithmeticModuli, A0–A6 |
| Cocharacter reflex field, idelic reflex norm, main CM theorem, Siegel level-function action | ShimuraData D3; ShimuraVarieties V4, V5, V8 |
| Covariant Tate realizations, local characters, inertia, induction, Artin/Swan conductors and Frobenius recognition | ArithmeticGaloisRepresentations R01.2, R01.3, R01.5, R01.6 |
| H¹ étale local Euler polynomials and Néron–Ogg–Shafarevich | NeronModelsAndSemistableAbelianVarieties, R11.5 |
| CM theta-series compatible systems | AutomorphicGaloisRepresentations, R19.3 |
| Exact algorithms, primality, finite-field trace/isogeny/order search, validated analytic arithmetic | ComputationalNumberTheory, CN.0–CN.4 |
| Complete positive-form census and quaternion integral orders | GeometryOfNumbersAndQuadraticArithmetic, GN.3 and GN.2 |
| Rational quaternion algebras, reduced norm and split/division comparison | QuadraticFormInvariants, Layer 2 |
| Existence of primes with specified class-field Artin class | Chebotarev, Layer 9 |

ModularForms Layer 0 supplies an independent LevelOne.JInputs interface: normalized j, its q-expansion and special values, orbit separation, integral modular polynomials Φ_l, and the monic prime diagonal −Φ_l(X,X). Its proofs precede singular-modulus integrality and do not use CM. The exact contracts consumed from these owners are collected in §4. General constructions remain with their owners; this roadmap supplies CM specializations and comparisons.

### 1.2 Native objects

Use Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 as the reference interfaces. A CM field already exists as NumberField.IsCMField: a totally complex quadratic extension of its maximal real subfield. Its complexConj is a maximal-real-subfield algebra automorphism, with φ(c(x)) = conjugate(φ(x)), c(c(x)) = x and fixed elements exactly in the maximal real subfield. Integral-over-Q hypotheses on this conjugation API hold for the number fields used here.

FractionalIdeal is the native submodule carrier with a common denominator; invertibility is extra data, expressed by its units. ClassGroup R, for every commutative domain R, is the quotient of invertible fractional ideals by principal ones. ClassGroup.mk is the class map on a chosen fraction field, and ClassGroup.equivPic identifies this group with CommRing.Pic R. CommRing.Pic.mapAlgebra is invertible-module base change. These definitions already apply to nonmaximal orders. GlobalNumberFields Layer 11 supplies the additional arithmetic: properness, order-specific finiteness, conductor behavior and norms. A nonzero ideal of a nonmaximal order need not be invertible.

IntermediateField.adjoin and adjoin_le_iff supply the trace-generated reflex field and its universal property. NumberField.RingOfIntegers is the integral closure of Z in the field. WeierstrassCurve.j is Δ⁻¹c₄³ with invertible discriminant. TauCeti.AlgebraicGeometry.AbelianVariety is a proper geometrically integral group scheme over the given field; its End is the additive wrapper of its endomorphism morphisms, with composition as multiplication. TauCeti.Isogeny is the native Weierstrass affine isogeny, and Isogeny.degree is the dimension of the source function field over the pulled-back target field. Transport these objects through the supplied uniformization and equation/scheme comparisons rather than introducing private substitutes.

### 1.3 Layers and reusable outputs

| Layer | Output |
| --- | --- |
| CM.0 | Types, primitive field pairs, trace/reflex data and order examples |
| CM.1 | Elliptic ideal actions, Picard classification, Serre tensor and CM Hodge/period comparisons |
| CM.2 | Polarized lattices and explicit reciprocity dictionaries after V5 |
| CM.3 | Class polynomials and precisely generated ring/ray value fields |
| CM.4 | CM Hecke characters, full local factorizations and coefficient components |
| CM.5 | Reduction, isogeny graphs, class-polynomial algorithms and ordinary order certificates |

The non-Galois quartic example is in CM.0, the dimension-two torsion/polarization example in CM.2, and the complete Gaussian class-field example in CM.3. Applications import the actual declarations from these layers. Examples and exports introduce no additional mathematical layer.

## 2. Mathematical conventions

**Fields and types.** A CM algebra E is a finite product of CM number fields. A type selects one complex embedding from each conjugate pair; all factor images lie in a common closure. Trace reflex fields and embedding partitions use this generality. A unique primitive core and a single inverse-coset reflex type are statements for a CM field. Distinguish the original field E, its reflex field E*, a model field k over which all specified endomorphisms are defined, and fields of moduli or definition. A totally complex field containing a CM field is additional data in the Kings–Sprang applications; its lifted type is not silently a primitive type on that larger field.

**Artin and ideals.** Artin sends a prime uniformizer to arithmetic Frobenius x ↦ x^q. Milne's geometric-art convention is translated by s = t⁻¹. The left ideal action is [a] ⋆ [C/I] = [C/a⁻¹I]. For a nonmaximal order only proper invertible ideals enter this action. Extension/contraction and the reflex ideal map have the stated prime-to-conductor restrictions.

**Polarization.** Write E_ξ(x,y) = Tr_{E/Q}(ξxȳ), with ξ̄ = −ξ and Im φ(ξ) > 0 for φ ∈ Φ; positivity is E_ξ(x,Jx) > 0. Translating Streng's E(Jx,y) > 0 changes the signs of the alternating form and its ξ. Lattice homothety by u sends (I,ξ) to (uI, ξ/(uū)). For f = N_Φ(t)⁻¹ = N_Φ(t⁻¹), the E-linear comparison α satisfies α(fx) = σ(x) and has polarization multiplier χ_cyc(σ)/(f f̄). The natural Galois torsion map has multiplier χ_cyc(σ). Uniformization therefore sends I to fI and ξ to ξχ_cyc(σ)/(f f̄). These are different maps with different multipliers.

**Realizations and local factors.** H₁ and Tate modules are covariant; arithmetic Frobenius has polynomial X² − a_vX + q in the elliptic case. A positive ideal infinity type (1,0) corresponds to idelic exponents (−1,0). The R11.5 Euler convention instead uses H¹_et = V_l(A)∨ and geometric Frobenius. At potentially good CM places, finite-inertia averaging identifies its determinant with the arithmetic-Frobenius determinant on covariant Tate invariants. Keep the duality in the local comparison, including ramified primes.

**Discriminants and order tests.** The reflex-order discriminant is a relative ideal over O_{E*}. For E = Q(i) and O = Z + 3Zi the selected reflex image is O_E, with relative discriminant 1; the input order has absolute Z-discriminant −36. Geometric endomorphisms mean endomorphisms over an algebraic closure. The endomorphism ring over a finite model field can be smaller, especially in the supersingular case. All characteristic-p classification and reduction statements include p = 2 and p = 3.

## 3. Build plan

The declaration names below are in TauCeti.CM unless explicitly qualified otherwise. API entries give reusable lemmas and unit tests give their expected statements; examples distinguish invalid inputs as well as positive cases. Each mathematical target has its direct prerequisites and source locators beside it. An internal reference points to the construction providing that interface, even when the dependency is one of its API lemmas.

### CM.0. Types, primitive pairs and reflex data

<a id="cm-0-1"></a>

#### Embedding partitions and primitive induction

Start with actual embeddings, so conjugation, induction and cardinality can be used by both torus and geometric realizations. The primitive-core construction uses the right stabilizer; the trace reflex field uses the left stabilizer.

**CM types of finite étale CM algebras** — `CMType`. For a finite product E of CM number fields, a CM type Φ is a subset of Hom_Q-alg(E,C) containing exactly one of φ and cφ for every embedding. Use the existing CM-field/conjugation structure on each factor; |Φ|=[E:Q]/2. Conjugate type cΦ is the complement. A CM field is not defined again.

Sources: [MilneCM](#source-milnecm), Definition 1.8, p.11; [AGHMP](#source-aghmp), §3.4 p.420. Prerequisites: [NumberField.IsCMField][mathlib-numberfield.iscmfield]; [NumberField.IsCMField.complexConj][mathlib-numberfield.iscmfield.complexconj]; [NumberField.IsCMField.complexEmbedding_complexConj][mathlib-numberfield.iscmfield.complexembedding_complexconj]; [NumberField.IsCMField.complexConj_apply_apply][mathlib-numberfield.iscmfield.complexconj_apply_apply].

**Induced and primitive CM types** — `CMType.IsPrimitive`. For a CM subalgebra E₀⊂E, Φ is induced from Φ₀ iff Φ consists of all embeddings whose restriction belongs to Φ₀. For a CM FIELD E, the pair is primitive iff no proper CM subfield induces its type. Its unique primitive core is the fixed field of the right stabilizer of the extended type in a common Galois CM closure; the reflex field uses the left stabilizer. The field hypothesis is part of Milne Definition 1.8 and Proposition 1.9: no single primitive core is asserted for a product CM algebra.

Sources: [MilneCM](#source-milnecm), Proposition 1.9, pp.11–12; [Tsimerman](#source-tsimerman), §4 pp.384–385. Prerequisites: [CMType](#cm-0-1).

**Basic API.**

- `TauCeti.CM.CMType.ext`: Types with the same embedding subset are equal.
- `TauCeti.CM.CMType.mem_conjugate_iff`: φ∈cΦ iff φ∉Φ.
- `TauCeti.CM.CMType.card`: 2|Φ|=[E:Q].
- `TauCeti.CM.CMType.conjugate_conjugate`: c(cΦ)=Φ.
- `TauCeti.CM.CMType.induced_mem`: φ lies in the induced type iff φ|E₀ lies in Φ₀.
- `TauCeti.CM.CMType.induced_trans`: Induction along E₀⊂E₁⊂E₂ equals direct induction.
- `TauCeti.CM.CMType.primitive_core_unique`: For E a CM field, any primitive CM subpair inducing Φ is uniquely the embedded primitive core.

**Unit tests.**

- `TauCeti.CM.CMType.test_gaussian`: For E=Q(i), the type selecting i↦i has cardinal one.
- `TauCeti.CM.CMType.test_not_full`: The entire embedding set of Q(i) is not a CM type.
- `TauCeti.CM.CMType.test_product`: Types on E₁×E₂ correspond to pairs of types, with additive cardinalities.
- `TauCeti.CM.CMType.test_quadratic_primitive`: Every CM type on an imaginary quadratic field is primitive.
- `TauCeti.CM.CMType.test_zeta8_induced`: The stated two embeddings of Q(ζ₈) restrict to the same embedding of Q(√−2), so this type is not primitive.
- `TauCeti.CM.CMType.test_induced_card`: For E/E₀ finite, an induced type has cardinal [E:E₀]|Φ₀|.

**Required calculations and boundary cases.** For Q(i), {i↦i} has cardinal one; both embeddings together and the empty set fail. For Q(i)×Q(√−3), a type has one embedding of each factor, cardinal two. On Q(ζ₈), the type with ζ₈↦ζ₈ and ζ₈↦ζ₈³ is induced from Q(√−2); primitive must fail.

<a id="cm-0-2"></a>

#### Trace reflex field and inverse-coset type

The trace description supplies an intrinsic field inside C and a comparison with D3. Constructing the reflex type in a common Galois closure must prove independence of coset choices and preserve the field scope of double reflex.

**Trace description of the CM reflex field** — `CMType.reflexField`. For a finite étale CM algebra E and CM type Φ, choose a common finite Galois CM field L⊂C containing the images of every embedding of every field factor. The reflex field is E*=Q(Σ_{φ∈Φ}φ(a):a∈E)⊂L. Equivalently E*=L^{Stab(Φ)}, where Galois acts on Hom_Q-alg(E,L); if E is a field this is the left stabilizer of the extended type S⊂Gal(L/Q). A product algebra E is not embedded as a subalgebra of L. Identify this actual trace subfield with ShimuraData D3’s cocharacter reflex field, without a second generic carrier.

Sources: [MilneCM](#source-milnecm), Proposition 1.16, Definition 1.17 and Proposition 1.18, pp.13–14; [YZ](#source-yz), §2.2 p.546. Prerequisites: [CMType](#cm-0-1); [IntermediateField.adjoin][mathlib-intermediatefield.adjoin]; [IntermediateField.adjoin_le_iff][mathlib-intermediatefield.adjoin_le_iff]; `ShimuraData:D3`.

**Inverse-coset construction of the reflex type** — `CMType.reflexType`. Let E be a CM FIELD and Φ a CM type. Let L/Q be a finite Galois CM closure containing E, G=Gal(L/Q), H=Gal(L/E) and S={g:g|E∈Φ}. Put H*=Stab_left(S); the inverse set S⁻¹ is right H*-stable and defines Φ* on E*=L^{H*}. This is independent of L. The reflex pair is primitive; its double reflex is the primitive core of (E,Φ), and recovers the original pair only when Φ is primitive. This single inverse-coset reflex-type construction is field-scoped; the trace reflex field of a CM algebra remains available separately.

Sources: [MilneCM](#source-milnecm), Examples 1.19 and 1.28, pp.14,18. Prerequisites: [CMType](#cm-0-1); [CMType.IsPrimitive](#cm-0-1); [CMType.reflexField](#cm-0-2); [CMType.reflexField_stabilizer](#cm-0-2).

**Type-product, conjugation and change-of-type identities** — `CMType.typeNorm_identities`. For a CM FIELD E with type Φ and reflex type Φ* on E*, and a∈(E*)×, NΦ(a)=∏ψ∈Φ*ψ(a) lies in E×, satisfies NΦ(a)·overline{NΦ(a)}=N_{E*/Q}(a), and is multiplicative. For γ∈Gal(Qbar/Q), transport the embedded pairs: N_{γΦ}(γa)=γNΦ(a). Induction from the primitive core leaves the reflex field unchanged and the map to E is the inclusion of the primitive-core type product. These are algebraic formulas, not another construction of V4’s idelic torus norm. For product CM algebras use V4’s cocharacter norm rather than asserting one primitive reflex pair.

Sources: [MilneCM](#source-milnecm), Proposition 1.23, Remark 1.24 and Proposition 1.26, pp.15–17; Example 1.28, p.19. Prerequisites: [CMType.reflexType](#cm-0-2); [NumberField.IsCMField.complexEmbedding_complexConj][mathlib-numberfield.iscmfield.complexembedding_complexconj].

**Basic API.**

- `TauCeti.CM.CMType.typeTrace`: typeTraceΦ(a)=Σφ∈Φ φ(a).
- `TauCeti.CM.CMType.reflexField_le_iff`: E*⊂F iff every typeTraceΦ(a) belongs to F.
- `TauCeti.CM.CMType.reflexField_stabilizer`: Gal(L/E*) is the stabilizer of Φ in Hom_Q-alg(E,L); for E a field it is the left stabilizer of its extended type S.
- `TauCeti.CM.CMType.reflexField_generic`: The trace subfield is the D3 cocharacter reflex field under its specified embedding.
- `TauCeti.CM.CMType.reflexType_mem`: g|E*∈Φ* iff g⁻¹∈S.
- `TauCeti.CM.CMType.reflexType_primitive`: The reflex type is primitive.
- `TauCeti.CM.CMType.doubleReflex_primitiveCore`: The double reflex is canonically the primitive core, with the original embedded pair recovered in the primitive case.

**Unit tests.**

- `TauCeti.CM.CMType.test_reflex_quadratic`: The reflex field of Q(i) with i↦i is Q(i) inside C.
- `TauCeti.CM.CMType.test_reflex_induced`: An induced type and its primitive core have the same reflex field.
- `TauCeti.CM.CMType.test_reflex_not_Q`: For the selected Gaussian type, typeTrace(i)=i, so the reflex field is not Q.
- `TauCeti.CM.CMType.test_reflex_type_quadratic`: The Gaussian type is its own reflex type after identifying its embedded reflex field.
- `TauCeti.CM.CMType.test_double_reflex_induced`: For the Q(ζ₈) type induced from Q(√−2), the double reflex has degree two.
- `TauCeti.CM.CMType.test_closure_independence`: Two extensions of the same reflex embedding give the same inverse-coset membership; enlarging the normal closure therefore preserves the embedded reflex pair.

**Required calculations and boundary cases.** For an imaginary quadratic field, E*=the selected embedded copy of E. Inducing a type does not change its reflex field; this is not the primitive-core fixed field in general. A nonprimitive Q(ζ₈) type has quadratic double reflex, not the original quartic field. For quadratic E=E*, NΦ is the identity under the selected embedding; NΦ(2+i)·its conjugate=5. Replacing Φ by its conjugate conjugates the norm, rather than leaving it equal.

The following API comparisons are used independently of the construction:

- `CMType.reflexField_stabilizer`: Gal(L/E*) is the stabilizer of Φ in Hom_Q-alg(E,L); for E a field it is the left stabilizer of its extended type S. Sources: [MilneCM](#source-milnecm), Proposition 1.16, Definition 1.17 and Proposition 1.18, pp.13–14; [YZ](#source-yz), §2.2 p.546. Prerequisites: [CMType.reflexField](#cm-0-2).

<a id="cm-0-3"></a>

#### Integral reflex data and concrete fields

The integral selected-factor image carries the relative reflex discriminant. The examples make original/reflex and input/image distinctions computationally visible before these data enter reciprocity.

**The CM reflex order** — `CMType.reflexOrder`. For a CM field E with order O and type Φ, use E* and YZ §2.2’s trace-selected splitting E*⊗_Q E=~E_Φ⊕~E_Φ^c. Define R_Φ as the image of O_{E*}⊗_Z O in ~E_Φ. It is an O_{E*}-order in that finite étale E*-algebra. Define d_Φ as its RELATIVE trace-discriminant ideal in O_{E*}, distinct from the absolute discriminant of O or E. It need not generally be the full integral closure. In the quadratic case E*=E and ~E_Φ=E, the first tensor factor already maps onto O_E, so R_Φ=O_E for every O⊂O_E and d_Φ=(1).

Sources: [YZ](#source-yz), §2.2 p.546. Prerequisites: [CMType.reflexField](#cm-0-2); [CMType](#cm-0-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**A non-Galois quartic CM type and its reflex** — `nonGaloisQuarticExample`. Let a=i√(3+√2), b=i√(3−√2), E=Q(a), and Φ send a to a and b. Then a⁴+6a²+7=0, E has real subfield Q(√2), E/Q is non-Galois, Φ is primitive, and E*=Q(a+b), with (a+b)⁴+12(a+b)²+8=0 and real subfield Q(√7). In the D₄ Galois closure, the inverse-coset construction gives Φ*; recover E by the double reflex. The two quartic fields must not be identified by degree alone.

Sources: [MilneCM](#source-milnecm), §1 pp.11–19, stabilizer construction. Prerequisites: [CMType.reflexField](#cm-0-2); [CMType.reflexType](#cm-0-2); [CMType.typeNorm_identities](#cm-0-2).

**Conductor-sensitive nonmaximal quadratic order example** — `nonmaximalGaussianExample`. For E=Q(i), O=Z+3Zi has conductor 3OE, discriminant −36, units {±1}, and |Pic(O)|=2 whereas |Cl(OE)|=1. The invertible O-ideal a=(2,1+3i) has norm 2 and represents the nontrivial class of order two. Ideals meeting the conductor cannot be transported by the prime-to-conductor extension/contraction equivalence without an additional argument.

Sources: [MIT16](#source-mit16), §16.4, Definition 16.9 and Theorem 16.12, pp.6–7; [MilneCM](#source-milnecm), §9 p.78, footnote 25. Prerequisites: [GlobalNumberFields Layer 11][globalnumberfields-11]; [CMType](#cm-0-1); [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Basic API.**

- `TauCeti.CM.CMType.reflexOrder_image`: Elements of RΦ are images of elements of OE*⊗O.
- `TauCeti.CM.CMType.reflexOrder_fractionAlgebra`: RΦ⊗Q is the selected factor ~EΦ.
- `TauCeti.CM.CMType.reflexOrder_discriminant`: dΦ is the relative O_{E*}-ideal discriminant of the trace pairing on RΦ, using GN11’s order/discriminant carrier; it is not disc_Z(O).

**Unit tests.**

- `TauCeti.CM.CMType.test_reflex_order_quadratic`: For a maximal imaginary quadratic order, RΦ identifies with OE.
- `TauCeti.CM.CMType.test_reflex_order_image`: Every product of images of OE* and O lies in RΦ, and their Z-span is all of RΦ.
- `TauCeti.CM.CMType.test_order_discriminant`: For E=Q(i) and O=Z+3Zi, the reflex image RΦ is O_E and its relative discriminant dΦ is the unit ideal, although disc_Z(O)=−36. Using the absolute discriminant of O as dΦ gives the wrong answer.

**Required calculations and boundary cases.** For any imaginary quadratic O⊂OE, the selected factor is E, the image is OE and the relative discriminant is the unit ideal. In higher degree, do not simplify the image to its integral closure without a proof. Extending YZ’s maximal-order input to O requires the image/full-rank argument. Check both quartic polynomials, different real subfields and the complete embedding partition. Degree four alone is not the criterion for primitivity. Reject a maximal-order class-group replacement: it gives cardinal one and extra units. Reject a rule declaring every nonzero ideal of O invertible.

### CM.1. Ideal lattices and CM realizations

<a id="cm-1-1"></a>

#### Lattice curves, action and classification

Specialize complex uniformization to proper invertible quadratic-order ideals. The comparison transports origins, scalar endomorphisms and algebraic automorphisms, so the ideal action and Picard classification are statements about elliptic curves as well as analytic quotients.

**The elliptic curve of an ideal lattice** — `idealLatticeCurve`. Fix an imaginary quadratic field E⊂C, an order O⊂E and a proper invertible fractional O-ideal I. Its image Λ=I⊂C is a rank-two Z-lattice. Apply A5/R12.1 uniformization to construct the actual elliptic scheme E_I and a Weierstrass equation whose analytic group is C/Λ; the multiplier ring {x∈E:xI⊂I} acts on E_I and identifies with End_C(E_I)=O. The chosen equation is compared through EC1/R12.1, not treated as a new curve carrier.

Sources: [MIT16](#source-mit16), Introduction p.1; Theorem 16.4 pp.4–5; §16.3 pp.6–7; [MilneCM](#source-milnecm), Proposition 3.17, p.31. Prerequisites: [CMType](#cm-0-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; `AbelianSchemesAndArithmeticModuli:A5`; `ModularCurvesPartII:R12.1`; [EllipticCurves Layer 1][ellipticcurves-1]; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`; [WeierstrassCurve.j][mathlib-weierstrasscurve.j]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**The left ideal action on CM elliptic curves** — `idealAction`. For a proper invertible fractional O-ideal a, define [a]⋆E_I=E_{a⁻¹I}. For an integral invertible a, inclusion I⊂a⁻¹I gives an O-linear isogeny φ_a:E_I→E_{a⁻¹I} with kernel a⁻¹I/I. Transport it to the existing Weierstrass isogeny. Ideal multiplication is compatible with composition, with the target of the second map tracked; principal ideals act trivially on isomorphism classes, but their chosen maps need not be identity maps.

Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas; [GZ](#source-gz), Chapter III §4 p.257, equation (4.2). Prerequisites: [idealLatticeCurve](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [EllipticCurves Layer 1][ellipticcurves-1]; `tauceti:TauCeti.Isogeny`; `tauceti:TauCeti.Isogeny.degree`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Elliptic CM Picard classification** — `idealAction.picardEquiv`. The map [I]↦[E_I,O-action] is a bijection Pic(O)→the complex O-linear isomorphism classes of elliptic curves with the fixed embedded CM type and full endomorphism ring O. The ideal action is simply transitive. Forgetting the specified action/type requires the conjugation adapter; the statement does not replace Pic(O) by Cl(O_E).

Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas. Prerequisites: [idealLatticeCurve](#cm-1-1); [idealAction](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Exceptional CM automorphism factors** — `idealLatticeCurve.automorphism_factors`. For E_I/C with full quadratic order O, Aut(E_I,0)=O×. Its order is 6 for O=Z[ζ₃] (j=0), 4 for O=Z[i] (j=1728), and 2 for every other quadratic order. This concerns origin-preserving automorphisms, not translations. In counting isogeny kernels or level orbits, retain these factors; level N≥3 rigidifies a polarized elliptic object when the characteristic is prime to N.

Sources: [MIT22](#source-mit22), Remark 22.2, pp.1–2. Prerequisites: [idealLatticeCurve](#cm-1-1); [EllipticCurves Layer 1][ellipticcurves-1]; `AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties`; [idealLatticeCurve.endomorphismRing](#cm-1-1).

**Basic API.**

- `TauCeti.CM.idealLatticeCurve.uniformization`: E_I(C)≅C/I as complex Lie groups, carrying its origin and O-action.
- `TauCeti.CM.idealLatticeCurve.homothety`: For u∈E×, multiplication by u induces an O-linear isomorphism E_I≅E_{uI}.
- `TauCeti.CM.idealLatticeCurve.endomorphismRing`: End(E_I) is the actual multiplier ring of I, equal to O for proper I.
- `TauCeti.CM.idealLatticeCurve.j`: The pinned Weierstrass j equals normalized modular j(τ) for any oriented basis I=Zω₁+Zω₂, τ=ω₂/ω₁ in H.
- `TauCeti.CM.idealAction.one`: [O]⋆E_I=E_I up to the specified O-linear identification.
- `TauCeti.CM.idealAction.mul`: [ab]⋆E_I=[a]⋆([b]⋆E_I), with the canonical multiplication identification of lattices.
- `TauCeti.CM.idealAction.kernel`: For integral invertible a, ker φ_a=a⁻¹I/I as an O-module.
- `TauCeti.CM.idealAction.principal`: For a=(u), multiplication by u identifies a⁻¹I with I and trivializes the class action.

**Unit tests.**

- `TauCeti.CM.idealLatticeCurve.test_gaussian`: The square lattice gives j=1728 and four origin-preserving automorphisms.
- `TauCeti.CM.idealLatticeCurve.test_nonmaximal`: For O=Z+3Zi and I=O, multiplication by i fails to preserve I and is not an endomorphism.
- `TauCeti.CM.idealLatticeCurve.test_scale`: Replacing I by 2I gives an isomorphic CM elliptic scheme and the same j.
- `TauCeti.CM.idealAction.test_gaussian_prime`: a=(2+i) on Z[i] gives a kernel of cardinal 5.
- `TauCeti.CM.idealAction.test_inverse`: Acting by a and a⁻¹ successively returns the same CM isomorphism class.
- `TauCeti.CM.idealAction.test_conductor`: The conductor ideal 3Z[i] as an ideal of Z+3Zi is not an admissible invertible ideal for this action.

**Required calculations and boundary cases.** For I=Z[i], j(E_I)=1728 and End is Z[i]. For I=Z+3Zi, End is precisely that order; its missing i cannot be inserted. For O=Z[i] and a=(2+i), the map has degree 5 and target is isomorphic to the original curve. For O=Z+3Zi, the norm-two nonprincipal ideal changes the CM isomorphism class. O=Z+3Zi yields exactly two classes, while O_E=Z[i] yields one. The nonmaximal Gaussian order of conductor 3 has only ±1, despite its CM field containing i.

The following API comparisons are used independently of the construction:

- `idealLatticeCurve.endomorphismRing`: End(E_I) is the actual multiplier ring of I, equal to O for proper I. Sources: [MIT16](#source-mit16), Introduction p.1; Theorem 16.4 pp.4–5; §16.3 pp.6–7; [MilneCM](#source-milnecm), Proposition 3.17, p.31. Prerequisites: [idealLatticeCurve](#cm-1-1).
- `idealAction.kernel`: For integral invertible a, ker φ_a=a⁻¹I/I as an O-module. Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas; [GZ](#source-gz), Chapter III §4 p.257, equation (4.2). Prerequisites: [idealAction](#cm-1-1).

<a id="cm-1-2"></a>

#### Forms, isogeny degree and rational twisting

Positive forms give a finite arithmetic description of the same CM points. Lattice index computes the degree of the algebraized ideal isogeny. Quadratic twisting records how the extra rational-CM endomorphism transforms under Galois descent.

**Positive forms, CM points and ideal classes** — `quadraticFormsDictionary`. For a negative discriminant D≡0 or 1 mod 4, primitive positive definite integral binary quadratic forms [a,b,c] with b²−4ac=D modulo SL₂(Z) correspond to proper invertible ideals of O_D up to homothety and to oriented CM points modulo SL₂(Z). Send [a,b,c] to the ideal Za+Z(−b+√D)/2 and τ=(−b+√D)/(2a)∈H. Restrict to primitive forms; reduced representatives enumerate Pic(O_D), with the usual boundary identifications and automorphism stabilizers.

Sources: [MIT16](#source-mit16), §16.4, Definition 16.9 and Theorem 16.12, pp.6–7; [CRT](#source-crt), §5.2, pp.17–18, polycyclic/reduced-form enumeration. Prerequisites: [idealAction.picardEquiv](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; `ModularCurvesPartII:R12.1`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Degree of an ideal isogeny** — `idealAction.degree_eq_norm`. For an integral proper invertible quadratic-order ideal a prime to its conductor, deg(φ_a)=|a⁻¹I/I|=N_O(a)=[O:a]. This is total scheme degree; in characteristic zero all these maps are separable. Multiplication by u∈O has degree |N_{E/Q}(u)|. Compatibility must identify this index with TauCeti.Isogeny.degree, not with a chosen equation’s polynomial degree.

Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas; [GZ](#source-gz), Chapter III §4 p.257. Prerequisites: [idealAction](#cm-1-1); `tauceti:TauCeti.Isogeny.degree`; `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [idealAction.kernel](#cm-1-1).

**The rational CM quadratic self-twist isogeny** — `rationalCMSelfTwist`. Let E/Q be an elliptic curve with End_Qbar(E) an order in an imaginary quadratic K. For its quadratic character χ_K, E and the Weierstrass quadratic twist E^{χ_K} are Q-isogenous. Choose a nonzero anti-invariant α∈O (ᾱ=−α); under the standard K-isomorphism from the twist to E, multiplication by α descends to the required Q-isogeny. Transport between the equation and elliptic-scheme carriers through EC1/R12.1. Its kernel/degree is the existing ideal/multiplication map, not an asserted isomorphism.

Sources: [BT](#source-bt), §3.1, proof of Theorem 1.1, preprint p.6. Prerequisites: [idealLatticeCurve](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [EllipticCurves Layer 5][ellipticcurves-5]; [EllipticCurves Layer 1][ellipticcurves-1].

**Required calculations and boundary cases.** For D=−36 the reduced classes [1,0,9] and [2,2,5] give the two proper classes. An imprimitive form describes a different order and must not enter H_D. For (2+i) the degree is 5; for integer [n] the degree is n², not n. For y²=x³−x and K=Q(i), α=i gives degree-one self-twist; for a nonmaximal order, use its actual anti-invariant element, not i if i is absent.

<a id="cm-1-3"></a>

#### Serre tensor, Lie and period comparisons

Use the relative Serre tensor from A0/A1 and specialize it to invertible CM ideals. Lie base change, finite-flat kernels, eigenspace ranks and both period pairings must refer to the same action and the same underlying abelian scheme.

**Serre tensoring by a CM ideal** — `cmSerreTensor`. Let L be a totally complex number field containing a CM field K, Σ the lifts to L of a fixed CM type on K, and A/S an abelian scheme of relative dimension [L:Q]/2 with O_L-action and Lie(A/S) projective over O_L⊗O_S. For a finite projective right O_L-module M, specialize A0/A1’s Serre tensor M⊗_{O_L}A; for a fractional invertible ideal a this has the same lifted CM type. The inclusion a⊂b gives an isogeny a⊗A→b⊗A. Do not re-own generic tensoring or relative Lie/cohomology carriers.

Sources: [KS](#source-ks), §1.2, Definition 1.8 and equation (1.2.3), p.9. Prerequisites: [CMType](#cm-0-1); `AbelianSchemesAndArithmeticModuli:A0`; `AbelianSchemesAndArithmeticModuli:A1`; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`; [CommRing.Pic.mapAlgebra][mathlib-commring.pic.mapalgebra].

**CM tensor ideal inclusions and their kernels** — `cmSerreTensor.ideal_kernel_degree`. Under the CM Serre-tensor hypotheses, a⊂b induces a finite flat isogeny of degree [b:a]. For a nonzero integral ideal c⊂O_L, A→c⁻¹⊗A is the c-multiplication map, its kernel is A[c]=⋂_{x∈c}ker[x], and its degree is N_L/Q(c). For c=(n), the degree is n^{[L:Q]}=n^{2d}; these are finite flat degrees, including inseparable contributions in residue characteristic.

Sources: [KS](#source-ks), §1.2 pp.8–9. Prerequisites: [cmSerreTensor](#cm-1-3); `AbelianSchemesAndArithmeticModuli:A1`; `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`.

**CM Lie and Hodge eigenspace comparison** — `cmHodgeEigenspaces`. For the KS CM scheme over R⊂C containing O_{L^Gal}[1/d_L], with lifted type Σ, Lie(A/R) is of type Σ. The covariant Hodge exact sequence 0→ω_{A∨/R}→H_A→Lie(A/R)→0 splits as O_L-eigenspaces H_A(Σ̄)⊕H_A(Σ); the first is ω_{A∨}, the second Lie(A). For the source’s inverse torus action on invariant differentials, ω_A=⊕σ∈Σ ω_A(−σ) and γ∈O_L× acts by σ(γ)⁻¹. This inverse action is distinguished from pullback by the multiplication map.

Sources: [KS](#source-ks), Proposition 1.11 and Corollary 1.12, pp.10–11. Prerequisites: [cmSerreTensor](#cm-1-3); `AbelianSchemesAndArithmeticModuli:A4`; `AbelianSchemesAndArithmeticModuli:A0`; [CommRing.Pic.mapAlgebra][mathlib-commring.pic.mapalgebra]; [cmSerreTensor.lie](#cm-1-3).

**CM period and de Rham pairings** — `cmPeriodPairings`. Under the same complex CM scheme hypotheses, the degree-one integration pairing restricts to ω_{A/C}×H₁(A(C),Z)→C^Σ. The O_L-linear de Rham duality and Hodge decomposition induce a nondegenerate pairing overline{ω_{A/C}}×ω_{A∨/C}→C^{Σ̄}. Its first argument is the complex-conjugate vector space; it is not the bilinear pairing ω_A×ω_{A∨} without conjugation. All degree-one carriers and their comparison maps are imported from A4.

Sources: [KS](#source-ks), Corollary 1.13, p.11. Prerequisites: [cmHodgeEigenspaces](#cm-1-3); `AbelianSchemesAndArithmeticModuli:A4`.

**Basic API.**

- `TauCeti.CM.cmSerreTensor.unit`: O_L⊗A≅A as O_L-abelian schemes.
- `TauCeti.CM.cmSerreTensor.assoc`: M⊗(N⊗A)≅(M⊗N)⊗A with the tensor actions and associativity specified.
- `TauCeti.CM.cmSerreTensor.lie`: Lie(M⊗A)=M⊗_{O_L}Lie(A), compatible with the lifted Σ type.
- `TauCeti.CM.cmSerreTensor.baseChange`: Serre tensor commutes with every allowed base change S′→S.

**Unit tests.**

- `TauCeti.CM.cmSerreTensor.test_unit`: Tensoring by O_L is the original CM abelian scheme.
- `TauCeti.CM.cmSerreTensor.test_directSum`: Tensoring by O_L⊕O_L is A×A, with doubled relative dimension.
- `TauCeti.CM.cmSerreTensor.test_torsion_excluded`: O_L/c is not a projective lattice and its tensor is not covered by the abelian-scheme construction.

**Required calculations and boundary cases.** M=O_L returns A; M=a⊕b gives the product of the two ideal tensors. Nonprojective torsion M is outside the abelian-scheme preservation contract. For d=2, [n] has degree n⁴; n² would incorrectly reuse the elliptic result. For a Gaussian type, Lie selects i while the dual-abelian invariant form in the Hodge sequence selects the conjugate embedding. A diagonal action σ(γ) instead of σ(γ)⁻¹ fails the source invariant-differential convention. For dimension two, the codomain has two selected complex coordinates, not a single arbitrary period.

The following API comparisons are used independently of the construction:

- `cmSerreTensor.lie`: Lie(M⊗A)=M⊗_{O_L}Lie(A), compatible with the lifted Σ type. Sources: [KS](#source-ks), §1.2, Definition 1.8 and equation (1.2.3), p.9. Prerequisites: [cmSerreTensor](#cm-1-3).

### CM.2. Polarized lattices and explicit reciprocity

<a id="cm-2-1"></a>

#### Polarized classification in every dimension

Separate an integral Riemann form from its positivity and from the principal-polarization condition. The classification is for the chosen order, action and type. Product types remain admissible even when the full geometric endomorphism algebra is larger than the specified commutative CM algebra.

**Polarized CM lattice data** — `PolarizedCMLattice`. For a CM algebra E of dimension 2g over Q and type Φ, polarized lattice data are a full Z-lattice I⊂E and ξ∈E× with ξ̄=−ξ, Im φ(ξ)>0 for φ∈Φ, and Tr_{E/Q}(ξĪI)⊂Z. Put Eξ(x,y)=Tr(ξxȳ). Require I stable under the specified order O, whose action on E is faithful; proper/invertible is an additional condition, automatic for fractional ideals of the maximal order but not imposed on all higher-dimensional nonmaximal lattices. Principal means I=I^# where I^#={x:Tr(ξx̄I)⊂Z}. Equivalence is (I,ξ)∼(uI,ξ/(uū)) for u∈E×.

Sources: [MilneCM](#source-milnecm), §2.9 pp.25–26; Proposition 3.17 p.31. Prerequisites: [CMType](#cm-0-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; `AbelianSchemesAndArithmeticModuli:A5`; `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`; [NumberField.IsCMField.complexConj][mathlib-numberfield.iscmfield.complexconj]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [NumberField.RingOfIntegers][mathlib-numberfield.ringofintegers].

**CM lattices and ideal isogenies in arbitrary dimension** — `arbitraryCMClassification`. The A5-algebraized polarized CM-action triples of type (E,Φ) correspond to polarized lattice data modulo the displayed E× equivalence. For a CM field with maximal order O_E, unpolarized O_E-equivariant isomorphism classes form a Pic(O_E)-torsor under a⁻¹I and have cardinal h_E. Integral ideals give O_E-linear isogenies of degree N_E/Q(a). If Φ is primitive, the resulting complex abelian variety is simple and End⁰(A)=E; with full O_E action its full End(A)=O_E. A fixed polarization changes the torsor and its stabilizer.

Sources: [MilneCM](#source-milnecm), Propositions 3.12–3.13 and 3.17, pp.29–31; [Tsimerman](#source-tsimerman), §4 pp.384–385. Prerequisites: [PolarizedCMLattice](#cm-2-1); [CMType.IsPrimitive](#cm-0-1); `AbelianSchemesAndArithmeticModuli:A5`; `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Basic API.**

- `TauCeti.CM.PolarizedCMLattice.form`: The alternating Z-form is (x,y)↦Tr(ξxȳ), with Eξ(x,Jx)>0.
- `TauCeti.CM.PolarizedCMLattice.scale`: Multiplication by u carries (I,ξ) to (uI,ξ/(uū)) without changing the polarized object.
- `TauCeti.CM.PolarizedCMLattice.principal_iff`: The polarization is principal iff I=I^#.
- `TauCeti.CM.PolarizedCMLattice.rosati`: The imported Rosati involution on E is CM conjugation.

**Unit tests.**

- `TauCeti.CM.PolarizedCMLattice.test_square`: For (Z[i],i/2), Eξ(1,i)=1 and the polarization is principal.
- `TauCeti.CM.PolarizedCMLattice.test_negative`: For type i↦i, ξ=−i/2 violates the positive-imaginary condition.
- `TauCeti.CM.PolarizedCMLattice.test_scale`: (2Z[i],i/8) is equivalent to (Z[i],i/2); leaving ξ=i/2 multiplies the form by 4.

**Required calculations and boundary cases.** For E=Q(i), I=Z[i], ξ=i/2 gives the principal square-lattice form with Eξ(1,i)=1. The negative ξ fails positivity for the same selected type. In dimension two, [n] has degree n⁴; an induced product type may have End⁰ larger than E. Do not generalize the maximal-order Picard classification to all higher-dimensional nonmaximal lattices.

<a id="cm-2-2"></a>

#### Reflex ideals, torsion and polarization

Apply V4/V5 with arithmetic Artin throughout. The ideal dictionary must commute with maximal-order extension away from the conductor. The E-linear comparison and the natural Galois map agree only after the indicated f is inserted, which fixes their polarization multipliers.

**The conductor-restricted reflex ideal map** — `reflexIdealMap`. Import V4’s norm NΦ:A_{E*,f}×→A_{E,f}× and compare its algebraic formula to CM.0. For an order O⊂E, let F be the smallest positive integer with F O_E⊂O. For an E*-ideal a prime to NF, apply the maximal-order reflex ideal norm and contract to O, obtaining NΦ,O(a). It is a proper invertible O-ideal. This map is multiplicative, and for principal (u) with u a unit at primes over F its image is (NΦ(u)); after extension back to O_E it is the maximal reflex norm. The map on Picard/ray-class quotients is derived only for the specified modulus and hypotheses.

Sources: [Streng](#source-streng), §2.6 pp.6–7 and §4.2 p.13. Prerequisites: [CMType.typeNorm_identities](#cm-0-2); [CMType.reflexType](#cm-0-2); `ShimuraVarieties:V4`; [GlobalNumberFields Layer 11][globalnumberfields-11]; [GlobalNumberFields Layer 7][globalnumberfields-7]; [GlobalNumberFields Layer 8][globalnumberfields-8]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [NumberField.RingOfIntegers][mathlib-numberfield.ringofintegers].

**Normalized idele and torsion dictionary** — `ideleTorsionDictionary`. Let A/C have CM type (E,Φ), σ∈Aut(C/E*) and t∈A_{E*,f}× with arithmetic Art(t)=σ on E*ab. Put f=NΦ(t)⁻¹. Under the imported V5 theorem, there is an E-linear isomorphism α:V_f(A)→V_f(σA) satisfying α(fx)=σ(x) on rational torsion, with its analytic/algebraic comparison fixed. Equivalently, for a model k containing E* on which all specified E-endomorphisms are defined, use NΦ(N_{k/E*}t_k)⁻¹. No claim is made that a model exists over E or over E* solely from its type. Integral freeness over O⊗Z_l is asserted only at l prime to [O_E:O].

Sources: [MilneCM](#source-milnecm), Theorem 9.10 and footnote 25, pp.78–80; [MilneFT](#source-milneft), §3 pp.20–21. Prerequisites: [reflexIdealMap](#cm-2-2); `ShimuraVarieties:V5`; `ShimuraVarieties:V4`; `AbelianSchemesAndArithmeticModuli:A4`; `ArithmeticGaloisRepresentations:R01.6`.

**The polarization and lattice reciprocity formula** — `polarizationReciprocityDictionary`. With normalized σ,t,f=NΦ(t)⁻¹ as above, an E-linear comparison quasi-isogeny α has finite-adelic realization satisfying α(fx)=σx. Its pairing multiplier is (σEξ)(αx,αy)=[χ_cyc(σ)/(f f̄)]Eξ(x,y), with the compatible rational representative provided by V5. The natural Galois map x↦σx=α(fx) instead has multiplier χ_cyc(σ). The conjugate CM lattice/polarization has type (E,Φ; fI, ξ·χ_cyc(σ)/(f f̄)), interpreted on integral Zhat-lattices inside the finite-adelic Tate modules and their rational comparison. Ideals change the lattice by NΦ(a)⁻¹ with the corresponding positive rational norm factor. Keep ordinary isomorphisms, polarized similitudes and finite-level equivalences distinct.

Sources: [MilneCM](#source-milnecm), Remark 9.11(c), p.78, and Theorem 9.17, pp.80–81. Prerequisites: [ideleTorsionDictionary](#cm-2-2); [PolarizedCMLattice](#cm-2-1); `ShimuraVarieties:V5`; `AbelianSchemesAndArithmeticModuli:A5`; `AbelianSchemesAndArithmeticModuli:A4`.

**Basic API.**

- `TauCeti.CM.reflexIdealMap.mul`: NΦ,O(ab)=NΦ,O(a)NΦ,O(b) for ideals prime to NF.
- `TauCeti.CM.reflexIdealMap.principal`: NΦ,O((u))=(NΦ(u)) under the local prime-to-F condition.
- `TauCeti.CM.reflexIdealMap.extend`: Extending NΦ,O(a) to O_E gives the maximal-order reflex ideal norm.
- `TauCeti.CM.reflexIdealMap.conjugate`: NΦ,O(a)·overline{NΦ,O(a)}=N_{E*/Q}(a)O, with the positive rational ideal norm.

**Unit tests.**

- `TauCeti.CM.reflexIdealMap.test_quadratic`: For a quadratic CM pair with maximal order, the map sends (2+i) to (2+i).
- `TauCeti.CM.reflexIdealMap.test_one`: The unit ideal maps to the unit ideal.
- `TauCeti.CM.reflexIdealMap.test_conductor_prime`: The prime-to-F contract cannot be applied to an ideal over 3 for O=Z+3Zi.

**Required calculations and boundary cases.** In the elliptic case this is the identity ideal map under E*=E. At a prime dividing F, invertibility and the contraction equality are not asserted. For an elliptic quadratic type, the lattice is a⁻¹I under arithmetic Art(a). An ℓ dividing the order index is not allowed to inherit a free rank-one integral O_l module. A formula changing I but keeping ξ without the norm/cyclotomic factor fails already for multiplication by an integer on a polarized surface.

The following API comparisons are used independently of the construction:

- `reflexIdealMap.principal`: NΦ,O((u))=(NΦ(u)) under the local prime-to-F condition. Sources: [Streng](#source-streng), §2.6 pp.6–7 and §4.2 p.13. Prerequisites: [reflexIdealMap](#cm-2-2).

<a id="cm-2-3"></a>

#### Level functions, stabilizers and relative fields

A symplectic level marking determines the matrix acting on regular modular functions. Stabilizers retain the scalar, polarization and level congruence simultaneously. Their Artin quotient describes a relative marked orbit and its modular-value field.

**Explicit reciprocity on CM level functions** — `explicitLevelReciprocity`. Let (E,Φ) be primitive, (I,ξ) principally polarized in Streng’s Riemann-form convention, B a symplectic basis, τ its Siegel period matrix, N≥1 and F O_E⊂O with F least. Let f∈F_N have q-expansion in Q(ζ_N) and be finite at τ. For an E*-ideal a prime to NF, choose a symplectic basis C of NΦ,O(a)⁻¹I for the rescaled form N(a)ξ. If C=M B (row convention), then τ′=Mτ, ν(M)=N(a)⁻¹, U=(M mod N)⁻¹ and f(τ)^{Art(a)}=f^U(τ′). Both the coefficient-field action and the inverse matrix are part of the formula.

Sources: [Streng](#source-streng), Theorem 2.4 pp.7–8; proof §4.4 pp.15–16. Prerequisites: [reflexIdealMap](#cm-2-2); [ideleTorsionDictionary](#cm-2-2); [polarizationReciprocityDictionary](#cm-2-2); `ShimuraVarieties:V8`; `AbelianSchemesAndArithmeticModuli:A5`; [GlobalNumberFields Layer 7][globalnumberfields-7].

**The polarized CM level stabilizer** — `polarizedLevelStabilizer`. Under the preceding primitive principal-polarization hypotheses, H_{Φ,O}(N) is the subgroup of I_{E*}(NF) consisting of ideals a for which NΦ,O(a)=µO for some µ∈E×, µµ̄=N_{E*/Q}(a) as positive rational elements and µ≡1 mod× NO. The last congruence means µ=u/v with u,v∈O both units modulo NF O and u≡v mod NO, as in Streng. At N=1 it is the polarized stabilizer. Distinguish it from ker(Cl(E*)→Cl(E)), which forgets the norm-compatible polarization trivialization.

Sources: [Streng](#source-streng), Theorem 2.5 and Definition 2.7, pp.7–8. Prerequisites: [reflexIdealMap](#cm-2-2); [PolarizedCMLattice](#cm-2-1); [GlobalNumberFields Layer 7][globalnumberfields-7]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Reflex class map and the polarized unit obstruction** — `reflexClassMap_unitObstruction`. For a CM field E, maximal order, primitive type and principal polarized lattice, the reflex ideal map induces r:Cl(E*)→Cl(E). Let H be the N=1 polarized stabilizer modulo principal reflex ideals. Then H⊂ker r and ker r/H injects into O_{E⁺}^{×,+}/N_{E/E⁺}(O_E×). This quotient has exponent two and size at most 2^g, since squares of totally real units are norms and the totally positive subgroup has rank g−1. In the polarized norm equation, N(a) is the absolute norm of the E*-ideal a, not a norm with domain E.

Sources: [Tsimerman](#source-tsimerman), §5 pp.385–386. Prerequisites: [reflexIdealMap](#cm-2-2); [polarizedLevelStabilizer](#cm-2-3); [arbitraryCMClassification](#cm-2-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [NumberField.IsCMField.complexConj_eq_self_iff][mathlib-numberfield.iscmfield.complexconj_eq_self_iff]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [reflexIdealMap.principal](#cm-2-2).

**Relative polarized moduli orbit and field distinction** — `relativeCMModuliOrbit`. For the fixed principally polarized primitive CM-action triple with maximal order, its orbit over the reflex field under arithmetic reciprocity is I_{E*}(F)/H_{Φ,O}(1), and the field generated over E* by all admissible level-one modular values has this Artin quotient. For higher N replace H(1) by H(N). This is a relative class-field statement. The absolute field of moduli over Q, the moduli field after forgetting the specified CM action, a field of definition and the reflex field are separate objects. No equality [Q(A):Q]=|Cl(E*)/H| is asserted; a passage to the unmarked absolute moduli field requires separate descent and forgetting-action theorems.

Sources: [Streng](#source-streng), Theorem 2.5, pp.7–8; [Tsimerman](#source-tsimerman), §5 p.386. Prerequisites: [polarizedLevelStabilizer](#cm-2-3); [explicitLevelReciprocity](#cm-2-3); [ClassFieldTheory Layer 12][classfieldtheory-12]; `ShimuraVarieties:V8`; `ModularCurvesPartII:R12.6`.

**Basic API.**

- `TauCeti.CM.polarizedLevelStabilizer.mem_iff`: Membership is exactly existence of µ with the three specified equations/congruence.
- `TauCeti.CM.polarizedLevelStabilizer.one`: The unit ideal lies in H, with witness µ=1.
- `TauCeti.CM.polarizedLevelStabilizer.mul`: Witnesses µ,ν multiply to the witness µν for ab, and inverse witnesses give a subgroup.
- `TauCeti.CM.polarizedLevelStabilizer.forget_level`: For N|M and common prime-to-MF ideals, H(M)⊂H(N).

**Unit tests.**

- `TauCeti.CM.polarizedLevelStabilizer.test_unit`: The unit ideal is in H(N) for every N.
- `TauCeti.CM.polarizedLevelStabilizer.test_quadratic_level_one`: For a maximal quadratic order and N=1, H(1) is the subgroup of principal ideals, since every generator has µµ̄=N(a).
- `TauCeti.CM.polarizedLevelStabilizer.test_bad_generator`: If every generator of the relevant principal reflex ideal has relative norm different from the prescribed positive rational norm, the ideal is outside the polarized stabilizer. Failure of only one generator does not exclude another witness.

**Required calculations and boundary cases.** N=1 removes the finite level matrix action, but does not remove the lattice class action. For g=1, ν=det; reversing U to M changes arithmetic Frobenius to its inverse. At N=1 the congruence is vacuous; at N>1 it can shrink the field stabilizer. A principal image ideal with arbitrary generator is insufficient without µµ̄=N(a). In g=1 every generator has its required norm, so H=ker r and the obstruction is trivial. The class map has domain the reflex class group, not Cl(E). For the Gaussian elliptic curve j=1728, Q(j)=Q but E*=Q(i); equalities of these two moduli fields are false.

<a id="cm-2-4"></a>

#### A surface calculation

Carry the normalization through an explicit product surface. This example uses a nonprimitive product type; the displayed CM algebra is not its full End⁰.

**A dimension-two torsion and polarization example** — `dimensionTwoCMExample`. Let E₀:y²=x³−x over Q(i), with i acting by (x,y)↦(−x,iy), and A=E₀×E₀ with product principal polarization and CM algebra Q(i)×Q(i), type selecting the standard embedding on each factor. At P=(5,i−3), E₀ has arithmetic Frobenius π=−1+2i, so on prime-to-5 Tate modules A has diagonal CM action (π,π); on 3-torsion, (Z/3)^4, the same action is multiplication by π mod 3, represented in the (1,i) basis on each factor by [[2,1],[2,2]]. The Weil pairing multiplier is 5 mod 3=2, and the Frobenius characteristic polynomial is (X²+2X+5)². The ideal isogeny on the product has degree 25. Separately, the non-Galois quartic example in CM.0 has reflex real subfield Q(√7), demonstrating that higher-dimensional reflex fields need not equal the original CM field.

Sources: [MilneCM](#source-milnecm), Theorem 9.10, Remark 9.11 and Theorem 9.17, pp.78–81. Prerequisites: [ideleTorsionDictionary](#cm-2-2); [polarizationReciprocityDictionary](#cm-2-2); [arbitraryCMClassification](#cm-2-1); [nonGaloisQuarticExample](#cm-0-3); [EllipticCurves Layer 3][ellipticcurves-3]; [EllipticCurves Layer 2][ellipticcurves-2]; `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

**Required calculations and boundary cases.** Check the two rank-one CM components in each elliptic factor, four-dimensional rational Tate module, degree 25 and multiplier 2 on 3-torsion. The product type is not primitive; its full End⁰ is M₂(Q(i)), so the primitive End theorem cannot be applied.

### CM.3. Class polynomials and generated class fields

<a id="cm-3-1"></a>

#### Class polynomial, integrality and ring class generation

Form the polynomial from the complete proper-ideal-class census and the normalized analytic/algebraic j comparison. First prove integrality using independent modular-polynomial inputs, then identify the arithmetic Artin action and the ring class field over the quadratic base.

**The order class polynomial** — `classPolynomial`. For an imaginary quadratic order O_D of discriminant D<0, define H_D(X)=∏_{[I]∈Pic(O_D)}(X−j(E_I)) in C[X] using the normalized j and each CM class exactly once. Its indexing is independent of ideal representatives and embedding-oriented bases. The integral coefficient theorem below identifies it with a unique monic polynomial in Z[X]; the initial product definition does not assume rounded numerical values are its coefficients.

Sources: [MIT20](#source-mit20), Introduction p.1 and §20.3 p.5, defining product for H_D. Prerequisites: [idealAction.picardEquiv](#cm-1-1); [quadraticFormsDictionary](#cm-1-2); [idealLatticeCurve](#cm-1-1); [WeierstrassCurve.j][mathlib-weierstrasscurve.j]; [ModularForms Layer 0][modularforms-0]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Integrality of singular moduli and class polynomials** — `classPolynomial.integral`. For every imaginary quadratic order O_D, all j(E_I) are algebraic integers and H_D belongs to Z[X]. The polynomial is separable and has degree h(O_D). Use the independent normalized-j/modular-polynomial supplier: choose a principal prime ideal of rational prime norm l avoiding the conductor, so j is a root of the monic polynomial −Φ_l(X,X). Galois permutes the CM j-values with the same full order. No integrality argument uses a class polynomial computation or reduction theorem from CM.5.

Sources: [MIT20](#source-mit20), Lemma 20.9 and Theorem 20.12, pp.5–7. Prerequisites: [classPolynomial](#cm-3-1); [idealAction](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [ideleTorsionDictionary](#cm-2-2); [ModularForms Layer 0][modularforms-0]; [ClassFieldTheory Layer 13][classfieldtheory-13]; `ModularCurvesPartII:R12.6`; [Chebotarev Layer 9][chebotarev-9].

**Galois equivariance of class-polynomial roots** — `classPolynomial.galois`. For an ideal a of K prime to the quadratic order conductor f, arithmetic Art_K(a) sends j(E_I) to j(E_{a⁻¹I}) in the ring class field. Complex conjugation sends the selected type/lattice to its conjugate and acts by inversion on the proper ideal class torsor after fixing the base class. Thus Gal over Q has generalized dihedral action on the root set. Stabilizers of individual j-values over K are trivial in the ring-class Artin/Picard quotient; over Q the unmarked moduli field can be smaller than the full splitting field.

Sources: [MIT21](#source-mit21), §21.1 pp.1–3. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.integral](#cm-3-1); [ideleTorsionDictionary](#cm-2-2); [idealAction.picardEquiv](#cm-1-1); [ClassFieldTheory Layer 11][classfieldtheory-11]; [ClassFieldTheory Layer 13][classfieldtheory-13]; [classPolynomial.roots](#cm-3-1).

**Singular moduli generate the ring class field** — `classPolynomial.ringClassField`. Let K be imaginary quadratic, O_f=Z+fO_K, and L_f/K the ring class field already supplied by CFT13. For any proper ideal I, K(j(E_I))=L_f, and L_f is the splitting field of H_D over K. Its degree is |Pic(O_f)| and the Artin/Picard action is the preceding arithmetic action. Hence H_D is irreducible over K. This identifies the generator with the supplied class field; it does not construct a second class field or assert Q(j)=L_f.

Sources: [MIT21](#source-mit21), Theorem 21.1 and opening discussion, pp.1–3. Prerequisites: [classPolynomial.galois](#cm-3-1); [idealAction.picardEquiv](#cm-1-1); [ClassFieldTheory Layer 13][classfieldtheory-13]; [classPolynomial.integral](#cm-3-1).

**Basic API.**

- `TauCeti.CM.classPolynomial.monic`: The finite product is monic.
- `TauCeti.CM.classPolynomial.degree`: deg H_D=|Pic(O_D)|.
- `TauCeti.CM.classPolynomial.roots`: The complex roots, each once, are exactly the normalized j-values of elliptic curves with full endomorphism order O_D.
- `TauCeti.CM.classPolynomial.representatives`: Replacing any ideal by a principal multiple or a basis by SL₂(Z) leaves H_D unchanged.

**Unit tests.**

- `TauCeti.CM.classPolynomial.test_minus4`: H_{−4}=X−1728.
- `TauCeti.CM.classPolynomial.test_minus3`: H_{−3}=X.
- `TauCeti.CM.classPolynomial.test_nonmaximal_degree`: H_{−36} has degree two; substituting Cl(Z[i]) incorrectly gives degree one.

**Required calculations and boundary cases.** H_{−4}=X−1728 and H_{−3}=X. For D=−36 its degree is two, not the maximal Gaussian class number one. The leading term is from −Φ_l(X,X); its sign and prime-degree hypothesis are essential. A composite-square N may give a zero diagonal polynomial and cannot replace the chosen prime l. An order-two class swaps its two j-roots; a principal ideal fixes each j but may act nontrivially on level/torsion values. For K=Q(i), j=1728 gives L_1=K while Q(j)=Q.

The following API comparisons are used independently of the construction:

- `classPolynomial.roots`: The complex roots, each once, are exactly the normalized j-values of elliptic curves with full endomorphism order O_D. Sources: [MIT20](#source-mit20), Introduction p.1 and §20.3 p.5, defining product for H_D. Prerequisites: [classPolynomial](#cm-3-1).

<a id="cm-3-2"></a>

#### Regular level values and exact generation

Evaluation is defined on the local ring of functions regular at the CM point. The full value field has an exact stabilizer; a finite list generates it only after a separation theorem. A pole or an arbitrary level function is not a generator.

**The field of admissible CM level values** — `cmValueField`. For a principally polarized CM point τ of primitive type (E,Φ), order O and N≥1, define M_N=E*(f(τ): f∈F_N, f finite at τ), using the actual intermediate-field adjunction carrier. F_N consists of quotients of equal-weight level-N Siegel forms whose Fourier coefficients lie in Q(ζ_N); denominator nonvanishing at τ is mandatory for the evaluation. The definition includes all regular values, not an arbitrary one of them. Elliptic specialization uses the R12.6 modular-function carrier; higher-dimensional specialization uses V8.

Sources: [Streng](#source-streng), Theorem 2.5 pp.7–8. Prerequisites: [explicitLevelReciprocity](#cm-2-3); [IntermediateField.adjoin][mathlib-intermediatefield.adjoin]; [IntermediateField.adjoin_le_iff][mathlib-intermediatefield.adjoin_le_iff]; `ShimuraVarieties:V8`; `ModularCurvesPartII:R12.6`.

**Exact ray-level field and generation criterion** — `cmValueField.rayClassField`. With N,F,τ as in the value-field construction, M_N lies in the ray class field of E* of modulus NF and Gal(M_N/E*)=I_{E*}(NF)/H_{Φ,O}(N). For an elliptic maximal order O_K, the type norm is identity and the polarized norm equation is automatic for a principal ideal, so H(N) is precisely the ray principal subgroup and M_N is the ray class field of modulus NO_K. For a nonmaximal order or higher dimension use the displayed stabilizer, not an unsupported equality with a full ray field or an exact conductor NF. A finite family of functions generates M_N exactly when its joint value stabilizer equals H(N); unit automorphisms and level congruences are included.

Sources: [Streng](#source-streng), Theorem 2.5, pp.7–8, and its proof §4.5, pp.16–17. Prerequisites: [cmValueField](#cm-3-2); [polarizedLevelStabilizer](#cm-2-3); [relativeCMModuliOrbit](#cm-2-3); [ClassFieldTheory Layer 12][classfieldtheory-12]; [ClassFieldTheory Layer 13][classfieldtheory-13]; [GlobalNumberFields Layer 7][globalnumberfields-7].

**Basic API.**

- `TauCeti.CM.cmValueField.contains`: Every finite-at-τ level-N value belongs to M_N.
- `TauCeti.CM.cmValueField.le_iff`: M_N⊂F iff F contains E* and every admissible level-N value.
- `TauCeti.CM.cmValueField.level_inclusion`: For N|M the natural function-field embedding gives M_N⊂M_M.
- `TauCeti.CM.cmValueField.no_poles`: The generating value set uses functions regular at τ; meromorphic poles are not generators.

**Unit tests.**

- `TauCeti.CM.cmValueField.test_level_one`: For elliptic maximal-order CM, M_1=K(j).
- `TauCeti.CM.cmValueField.test_pole`: If f has a pole at τ, f(τ) is not an admitted generator.
- `TauCeti.CM.cmValueField.test_gaussian_ray3`: For K=Q(i), j=1728 lies in K, whereas the ray class field of modulus 3 has degree two; j alone does not generate it.

**Required calculations and boundary cases.** A function with a pole at τ is excluded rather than assigned a spurious field element. At level one in the elliptic case the value field is K(j); at higher levels j alone need not generate it. For the Gaussian modulus 3, ray degree |(Z[i]/3)×|/|Z[i]×|=8/4=2; j alone fails the stabilizer criterion. At N=1 the class field is the ring class field, including nonmaximal conductor restrictions.

<a id="cm-3-3"></a>

#### The Gaussian ring and ray examples

Compute the field degrees and exceptional unit factors explicitly. The example distinguishes Q(j), K(j), the nonmaximal ring class field and the full ray-value field.

**The complete Gaussian ring-class example** — `gaussianRingClassExample`. For K=Q(i), O=Z[i], the unique ideal class has j=1728, H_{−4}=X−1728∈Z[X], splitting field over K equal to K, and Artin action trivial on the single root. The prime ideal (2+i) of norm 5 gives an ideal isogeny of degree 5 with trivial class action. The four units are the exceptional automorphism group; they do not create four roots. The exact polynomial equality follows from j(i)=1728 and Pic(O)=1, so no numerical rounding certificate is needed. The modulus-3 ray example has degree two and demonstrates why the ring-class generator does not already export a full ray field.

Sources: [MIT20](#source-mit20), Introduction p.1 and §20.3 p.5, defining product for H_D. Prerequisites: [classPolynomial.ringClassField](#cm-3-1); [cmValueField.rayClassField](#cm-3-2); [idealLatticeCurve.automorphism_factors](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [classPolynomial](#cm-3-1); [ModularForms Layer 0][modularforms-0]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Required calculations and boundary cases.** Exact integer coefficient −1728, splitting field K, degree-five prime action and the ray unit quotient are all checked symbolically.

### CM.4. CM Hecke characters and their realizations

<a id="cm-4-1"></a>

#### Attached character, coefficient components and Frobenius

Construct the character of the actual model with its full CM action defined over k. Identify its principal-element law and least finite conductor, then compare each coefficient embedding with its rank-one Tate summand. A full rational Tate representation has rank 2g, not rank one.

**The algebraic Hecke character of a CM abelian variety** — `cmHeckeCharacter`. Let A/k be a g-dimensional abelian variety over a number field, with a CM field E⊂End⁰_k(A) of degree 2g and all specified endomorphisms defined over k; its type has reflex field E*⊂k. Construct on GN9’s Hecke-character carrier ψ_A:I_k(m)→E× for a finite modulus m containing bad reduction and the integral-order exceptions. At a good prime v prime to m, ψ_A(v) is the E-linear Frobenius element on A_v. For a∈k× with a≡1 mod× m, ψ_A((a))=NΦ(N_{k/E*}a). Its complex components have the algebraic infinity type determined by Φ (positive ideal exponent; negative idelic exponent). The finite conductor f(ψ_A) is the least such modulus, not an arbitrary containing modulus. Values are in E×, not generally in O_E×.

Sources: [MilneCM](#source-milnecm), §9, Frobenius and idele dictionary pp.74–84; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6; [Kato](#source-kato), §15.10 p.260. Prerequisites: [ideleTorsionDictionary](#cm-2-2); [reflexIdealMap](#cm-2-2); [arbitraryCMClassification](#cm-2-1); [GlobalNumberFields Layer 9][globalnumberfields-9]; [GlobalNumberFields Layer 10][globalnumberfields-10]; [GlobalNumberFields Layer 8][globalnumberfields-8]; `ShimuraVarieties:V5`; `ArithmeticGaloisRepresentations:R01.6`; `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

**One-dimensional CM components of the Tate module** — `cmTateComponents`. Under the CM-character hypotheses, V_l(A) is free of rank one over E⊗Q_l. For each embedding ι:E→Q_lbar, its coefficient summand is one-dimensional and carries GN9’s l-adic avatar ψ_{A,ι}, with arithmetic Frobenius eigenvalue ιψ_A(v) at every good v∤l. Thus V_l(A)⊗Q_lbar=⊕_ι ψ_{A,ι} as actual G_k modules. The underlying Q_l dimension is 2g. Integral rank-one freeness over O⊗Z_l requires l prime to the endomorphism-order index; it is not inferred from the rational comparison.

Sources: [MilneCM](#source-milnecm), §9.10 pp.78–80, footnote 25; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6. Prerequisites: [cmHeckeCharacter](#cm-4-1); [ideleTorsionDictionary](#cm-2-2); `ArithmeticGaloisRepresentations:R01.6`; [GlobalNumberFields Layer 9][globalnumberfields-9]; [GlobalNumberFields Layer 10][globalnumberfields-10]; `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

**Frobenius and infinity-type identities** — `cmFrobeniusIdentities`. At a good prime v with residue size q and CM character ψ_A, its Frobenius element π_v=ψ_A(v) satisfies π_v̄π_v=q, all complex absolute values |τπ_v|=√q, and the Tate polynomial equals ∏_{τ:E→Qbar}(X−τπ_v). The component infinity types are those of Φ transported by τ. For elliptic A/K, the polynomial is X²−Tr_{K/Q}(π_v)X+q; at an inert rational good prime p for A/Q, the rational trace is zero while the prime of K has norm p² and Frobenius π_v=−p.

Sources: [MilneCM](#source-milnecm), §8.1–8.3 pp.66–68; [Kato](#source-kato), §15.10 p.260 and §15.11 p.261. Prerequisites: [cmHeckeCharacter](#cm-4-1); [cmTateComponents](#cm-4-1); [GlobalNumberFields Layer 10][globalnumberfields-10]; `AutomorphicGaloisRepresentations:R19.3`; `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`; `NeronModelsAndSemistableAbelianVarieties:R11.5/elliptic-local-polynomial`; [cmHeckeCharacter.frobenius](#cm-4-1).

**Basic API.**

- `TauCeti.CM.cmHeckeCharacter.principal`: For a≡1 mod×m, ψ_A((a))=NΦ(N_{k/E*}a).
- `TauCeti.CM.cmHeckeCharacter.frobenius`: At every good v away from m, ψ_A(v) is the actual E-linear arithmetic Frobenius.
- `TauCeti.CM.cmHeckeCharacter.conductor_minimal`: f(ψ_A) divides every admissible finite modulus and is admissible itself.
- `TauCeti.CM.cmHeckeCharacter.baseChange`: For a finite model-field extension k′/k, ψ_{A/k′}=ψ_{A/k}∘N_{k′/k}, with its least conductor recalculated.

**Unit tests.**

- `TauCeti.CM.cmHeckeCharacter.test_ideal_type`: In elliptic dimension, positive ideal type (1,0) matches negative idelic type (−1,0).
- `TauCeti.CM.cmHeckeCharacter.test_nonunit`: For E:y²=x³−x at P=(5,i−3), ψ(P)=−1+2i has norm 5 and is not a Gaussian unit.
- `TauCeti.CM.cmHeckeCharacter.test_inert_baseChange`: For the same curve at the inert rational prime 7, the K-prime has norm 49 and ψ((7))=−7, not an element of norm 7.

**Required calculations and boundary cases.** For an elliptic curve over its endomorphism field the ideal infinity type is (1,0); the matching idelic type is (−1,0). A good Frobenius value has nontrivial norm q, so need not be a unit. A CM elliptic V_l has rank two over Q_l and rank one over K⊗Q_l; it is not one-dimensional over Q_l for inert coefficient primes. For y²=x³−x, rational good primes 5 and 7 give X²+2X+5 and X²+7; over K at 7 the factor is (X+7)².

The following API comparisons are used independently of the construction:

- `cmHeckeCharacter.frobenius`: At every good v away from m, ψ_A(v) is the actual E-linear arithmetic Frobenius. Sources: [MilneCM](#source-milnecm), §9, Frobenius and idele dictionary pp.74–84; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6; [Kato](#source-kato), §15.10 p.260. Prerequisites: [cmHeckeCharacter](#cm-4-1).

<a id="cm-4-2"></a>

#### All-prime factors and induction

Good-prime formulas are inputs to Frobenius recognition, while ramified local factors and Artin/Swan conductors come from the actual local representation. The residual normalizer theorem records containment and the quadratic quotient, without claiming an unrestricted full image.

**Full elliptic CM L-factorization, including bad primes** — `ellipticCMLFactorization`. Let A/K be an elliptic curve with CM by an order in K and every endomorphism defined over K. For every finite prime v and coefficient l≠char κ(v), define P_v(A,T)=det(1−Frob_geom,v T | H¹_et(A_Kbar,Q_l)^{I_v}), using R11.5’s cohomological carrier H¹_et=V_l(A)∨. It equals P_v(ψ,T)P_v(̄ψ,T), where an unramified rank-one factor is 1−ψ(v)T and a ramified factor is 1. CM j is integral, so A has potentially good reduction and finite inertia image: duality and averaging identify this determinant with that of arithmetic Frobenius on V_l(A)^{I_v}. Hence L(A/K,s)=L(ψ,s)L(̄ψ,s), retaining every finite bad factor. The Artin exponent is a_v(A)=a_v(ψ)+a_v(̄ψ); conjugation preserves these exponents, giving conductor ideal f(ψ)².

Sources: [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6; [BKO](#source-bko), §3.0.1 pp.950–951. Prerequisites: [cmTateComponents](#cm-4-1); [cmHeckeCharacter](#cm-4-1); [classPolynomial.integral](#cm-3-1); `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.3`; `NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial`; `NeronModelsAndSemistableAbelianVarieties:R11.5/elliptic-local-polynomial`; [GlobalNumberFields Layer 9][globalnumberfields-9].

**CM induction and compatible-system comparison** — `cmInductionComparison`. For a rational CM elliptic curve A/Q with CM field K, its rational two-dimensional Tate representation after extension of coefficients is Ind_{G_K}^{G_Q} ψ_l. Restriction to G_K is ψ_l⊕̄ψ_l, and the representation is invariant under twisting by χ_K, consistent with CM.1’s actual self-twist isogeny. The weight-two theta-series/newform realization has the same good Frobenius polynomials and is compared by AGR01.5/R19.3. This imports generic induction and modular compatible systems; it is not another definition of automorphic induction.

Sources: [Kato](#source-kato), §15.10 pp.260–261; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6. Prerequisites: [cmTateComponents](#cm-4-1); [rationalCMSelfTwist](#cm-1-2); `ArithmeticGaloisRepresentations:R01.5`; `AutomorphicGaloisRepresentations:R19.3`; [cmFrobeniusIdentities](#cm-4-1).

**Unramified CM residual Cartan normalizer** — `cmResidualCartanNormalizer`. For A/Q with CM by a quadratic order O and an odd rational prime l prime to disc(O), the residual representation A[l] carries a rank-one O/lO action. The G_K image lies in the unit Cartan C_l=(O/lO)×, split if l splits in K and nonsplit if it is inert. The full G_Q image lies in its normalizer, with the quotient action given by χ_K and conjugation on O/lO. Every element outside the Cartan has trace zero and its projective order divides two. Neither equality with the full normalizer nor a Cartan claim at ramified/conductor primes is asserted.

Sources: [BS](#source-bs), §6 pp.372–373. Prerequisites: [cmTateComponents](#cm-4-1); [cmInductionComparison](#cm-4-2); [GlobalNumberFields Layer 11][globalnumberfields-11]; `ArithmeticGaloisRepresentations:R01.6`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Required calculations and boundary cases.** For the Gaussian curve, the bad prime above 2 has ramified characters and local factor 1; omitting it from the product is not an all-prime proof. At good inert rational p=7 over K, the local factor is (1+7T)² at norm 49. At a split rational good prime the two eigenvalues are conjugate CM values; at an inert good prime the rational trace is zero. For Gaussian CM and l=3 the Cartan is nonsplit of order 8; l=5 gives split order 16. At l=2 the Gaussian order is ramified and this assertion is outside its hypotheses.

<a id="cm-4-3"></a>

#### Canonical Gross conditions and inert reduction

Keep a canonical-character predicate separate from its existence and from its attachment to a canonical curve. Conductor support alone does not determine all local exponents. The good-reduction specialization carries the precise odd-discriminant and inert-prime hypotheses.

**Canonical Gross characters and their conductor support** — `IsCanonicalGrossCharacter`. On GN9’s algebraic Hecke-character carrier for imaginary quadratic K, call ψ canonical in the Gross–Rohrlich sense when ψ(̄a)=overline{ψ(a)} for ideals away from its conductor, ψ((α))=±α for principal ideals away from it, and every conductor prime ramifies in K/Q. Keep the finite sign character and its least conductor, rather than setting every principal value equal to α. In the BKO application use odd fundamental discriminant and p≥5 inert with p∤h_K. Canonical characters over K give ψ_H=ψ∘N_{H/K} attached to a canonical CM elliptic curve over the Hilbert class field H, up to H-isogeny. The definition alone is not an existence proof.

Sources: [Yang](#source-yang), Introduction conditions (0.1)–(0.3), pp.1–2; [BKO](#source-bko), §3.0.1 pp.950–951 and equation (3.8) p.953. Prerequisites: [cmHeckeCharacter](#cm-4-1); [GlobalNumberFields Layer 9][globalnumberfields-9]; [GlobalNumberFields Layer 10][globalnumberfields-10]; [ClassFieldTheory Layer 13][classfieldtheory-13]; [GlobalNumberFields Layer 8][globalnumberfields-8]; [NumberField.RingOfIntegers][mathlib-numberfield.ringofintegers].

**Canonical Gross curve good reduction at the inert prime** — `canonicalGrossGoodReduction`. In the BKO odd-discriminant canonical-character situation, let H/K be the Hilbert class field and E/H the corresponding canonical CM elliptic curve with character ψ_H=ψ∘N_{H/K}. If p≥5 is inert in K and p∤h_K, the character is unramified at all primes above p because its conductor has only K/Q-ramified support and H/K is unramified. The Tate comparison and Néron–Ogg–Shafarevich then give good reduction above p. The conjugation identity is retained before any inert-prime local arithmetic is applied. No exact conductor exponents are inferred from support alone.

Sources: [BKO](#source-bko), §3.0.1 pp.950–951; (3.8) p.953. Prerequisites: [IsCanonicalGrossCharacter](#cm-4-3); [cmTateComponents](#cm-4-1); `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`; [GlobalNumberFields Layer 8][globalnumberfields-8]; [ClassFieldTheory Layer 13][classfieldtheory-13].

**Basic API.**

- `TauCeti.CM.IsCanonicalGrossCharacter.conjugation`: ψ(̄a)=overline{ψ(a)} away from the finite conductor.
- `TauCeti.CM.IsCanonicalGrossCharacter.principal_sign`: ψ((α))/α is a sign for α prime to the conductor.
- `TauCeti.CM.IsCanonicalGrossCharacter.conductor_support`: Every prime divisor of f(ψ) is ramified in K/Q.
- `TauCeti.CM.IsCanonicalGrossCharacter.class_twist`: Twisting by a class character preserves the canonical family conditions and leaves its H-norm pullback unchanged.

**Unit tests.**

- `TauCeti.CM.IsCanonicalGrossCharacter.test_sign`: Dropping the finite sign character and assigning ψ((−1))=−1 contradicts ψ(O_K)=1.
- `TauCeti.CM.IsCanonicalGrossCharacter.test_inert_unramified`: For the BKO inert p unramified in K, p does not divide the canonical conductor.
- `TauCeti.CM.IsCanonicalGrossCharacter.test_even_excluded`: For the Gaussian field, an excluded D≡4 mod 8 case, the unit i generates the unit ideal but is neither 1 nor −1. The canonical principal-sign condition therefore cannot hold; a simplest character must not be relabeled canonical.

**Required calculations and boundary cases.** For odd discriminant the canonical family is considered up to unramified class-character twist. For discriminant valuation exactly two at 2 (D≡4 mod 8), canonical characters of these three conditions do not exist; Yang’s simplest higher-dimensional characters are a different construction. An arbitrary CM quadratic twist can introduce extra conductor primes and is not covered by the canonical conductor-support statement.

### CM.5. Reduction, isogeny graphs and certificates

<a id="cm-5-1"></a>

#### Deuring classification, specialization and lifting

Distinguish model-field endomorphisms from geometric ones before applying the finite-field classification. The specialization theorem gives ordinary split reduction and supersingular nonsplit reduction. Deuring lifting preserves one endomorphism, not the full quaternion ring.

**Deuring’s characteristic-p endomorphism classification** — `deuringClassification`. For every elliptic curve A/k in characteristic p>0, let End_geom(A)=End_{kbar}(A_kbar). It is either Z, an order in an imaginary quadratic field where p splits and whose conductor is prime to p, or a maximal order in the definite rational quaternion algebra B_{p,∞} ramified exactly at p and ∞. The quaternion case is precisely supersingular. Over kbar=F_pbar the Z case does not occur; every ordinary curve has the quadratic-order case and every supersingular curve the maximal quaternion-order case. Every maximal-order conjugacy type occurs for a supersingular curve. This is a theorem about all characteristic-p elliptic curves, including p=2,3, not just CM reductions; End_k can be smaller than End_geom.

Sources: [Deuring](#source-deuring), Introduction §§2–3 pp.198–199; §8 conclusion p.258; [GZ](#source-gz), Chapter III §7 p.261. Prerequisites: [EllipticCurves Layer 3][ellipticcurves-3]; `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`; [QuadraticFormInvariants Layer 2][quadraticforminvariants-2]; `GeometryOfNumbersAndQuadraticArithmetic:GN.2`; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`.

**Potential good reduction and the split/non-split dichotomy** — `cmReductionDictionary`. Let A be an elliptic curve with full CM order O_f in imaginary quadratic K over a number field. It has potentially good reduction at every finite place because j is an algebraic integer. After a finite extension giving good reduction at residue characteristic p, the geometric reduction is ordinary iff p splits in K, and supersingular iff p is inert or ramified in K. The reduction map embeds O_f in End_geom of the reduction. In the ordinary case its order conductor is f/p^{v_p(f)}; in the supersingular case End_geom is a maximal quaternion order containing the reduced CM order, with optimality tracked separately. No extension of the residue coefficient field turns supersingular reduction into an ordinary one.

Sources: [Deuring](#source-deuring), Introduction §§2–3 pp.198–200; [GZ](#source-gz), Chapter III §7 p.261. Prerequisites: [deuringClassification](#cm-5-1); [classPolynomial.integral](#cm-3-1); `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`; [EllipticCurves Layer 4][ellipticcurves-4]; [EllipticCurves Layer 3][ellipticcurves-3]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**The explicit CM Frobenius ideal and slope formula** — `shimuraTaniyamaDictionary`. Import V5’s general Shimura–Taniyama theorem. In the explicit clean local case, A/k has CM by O_E, k/Q_p contains all conjugates of E, p is unramified in E and A has good reduction at P with residue size q. Frobenius π∈O_E satisfies (π)=∏_{φ∈Φ}φ⁻¹(N_{k/φE}P). For each v|p, put H_v={τ:E→k:τ⁻¹P=v}; then ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|. Compare the ideal formula with NΦ(N_{k/E*}P). Ramified primes and nonmaximal orders require the fuller V5 theorem, not extrapolation of these clean hypotheses.

Sources: [MilneCM](#source-milnecm), Theorem 8.1 and Corollaries 8.2–8.3, pp.66–68. Prerequisites: `ShimuraVarieties:V5`; [reflexIdealMap](#cm-2-2); [cmHeckeCharacter](#cm-4-1); [cmReductionDictionary](#cm-5-1); [GlobalNumberFields Layer 8][globalnumberfields-8]; `AbelianSchemesAndArithmeticModuli:A4`.

**Deuring lifting with an endomorphism** — `deuringLifting`. For an elliptic curve A over a finite field F_q and nonzero α∈End_{F_q}(A), there are a number field L, a prime P with residue field identified with F_q, an elliptic curve A*/L with good reduction at P and α*∈End_L(A*) reducing to the pair (A,α). A non-scalar α yields an imaginary-quadratic CM lift. The statement does not claim a lift of the entire supersingular quaternion endomorphism ring as characteristic-zero endomorphisms.

Sources: [Deuring](#source-deuring), §9.1 pp.258–262; [MIT21](#source-mit21), Theorem 21.15 p.10. Prerequisites: [deuringClassification](#cm-5-1); [EllipticCurves Layer 3][ellipticcurves-3]; [EllipticCurves Layer 1][ellipticcurves-1]; `ModularCurvesPartII:R12.6`.

**Required calculations and boundary cases.** Over F₅, y²=x³−x is ordinary; over F₇ it is supersingular and its geometric End⁰ is quaternion, although End_{F₇}⁰ is quadratic. A transcendental ordinary j in characteristic p can have End_geom=Z; the finite-field assumption cannot be silently dropped. For the Gaussian curve, p=5 is split/ordinary and p=7 is inert/supersingular. Ramified p belongs to the supersingular side; dropping ramified primes gives an incomplete dichotomy. For elliptic split p the slopes are 0 and 1; for inert unramified p they are both 1/2. In dimension two the multiplicity is the selected embedding count, not a repeated elliptic formula without type data. For a supersingular curve, two noncommuting quaternion endomorphisms cannot both be identified with a characteristic-zero CM endomorphism ring.

<a id="cm-5-2"></a>

#### Ordinary order levels and supersingular level pairs

Horizontal ideal actions belong to the ordinary exact-order level. Vertical steps change the conductor. A supersingular curve has a maximal quaternion order, whereas the endomorphisms preserving a prime-to-p cyclic level subgroup form an Eichler order.

**CM order levels and horizontal isogeny graphs** — `cmIsogenyGraphDictionary`. For ordinary A/F_q with geometric order O_f and l≠p, an l-isogeny changes the endomorphism order only horizontally (same order), by index l upward or by index l downward. At l prime to f, the horizontal O_f-linear isogenies correspond to invertible ideals of norm l, with count 1+(D_K/l); ramified gives one, split two, inert zero. At l dividing f retain the conductor-level rules and the exceptional j=0,1728 kernel multiplicities. A graph vertex is a j-invariant up to geometric isomorphism; a finite-field twist is not fixed by a j-root. Supersingular components use quaternionic ideals and cannot use the ordinary order volcano as a certificate.

Sources: [MIT22](#source-mit22), Theorem 22.3 and §22.1, pp.2–3. Prerequisites: [cmReductionDictionary](#cm-5-1); [idealAction](#cm-1-1); [idealLatticeCurve.automorphism_factors](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [GlobalNumberFields Layer 11][globalnumberfields-11]; [EllipticCurves Layer 3][ellipticcurves-3]; `ComputationalNumberTheory:CN.3`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Quaternion orders of a curve and of a level pair** — `supersingularLevelOrderComparison`. For a supersingular curve A/F_pbar, End_geom(A) is maximal in B_{p,∞} and has reduced discriminant p. For the prime-to-p cyclic level-N pair (A,C), its endomorphism ring consists of endomorphisms preserving C and is generally an Eichler order of reduced discriminant Np, maximal at p but not necessarily away from p. In the Gross–Zagier situation p is non-split in the CM field, p∤N and N satisfies the Heegner splitting conditions; the reduced CM embedding and its optimality must be tracked in the pair’s order. End of the pair must never be called the full maximal End of the curve.

Sources: [GZ](#source-gz), Chapter III §7 p.261. Prerequisites: [deuringClassification](#cm-5-1); [cmReductionDictionary](#cm-5-1); [QuadraticFormInvariants Layer 2][quadraticforminvariants-2]; `GeometryOfNumbersAndQuadraticArithmetic:GN.2`; [EllipticCurves Layer 1][ellipticcurves-1].

**Required calculations and boundary cases.** An inert l gives no horizontal edges, not two after coefficient extension. Exceptional j graph multiplicities count kernels, not merely distinct target j-values. At N=1 recover the maximal order; at a nontrivial squarefree N the reduced discriminant is Np.

<a id="cm-5-3"></a>

#### Height, complex enclosures and precision

Combine the complete positive-form census with proved q-series tails, outward complex arithmetic and exact integer isolation. Generic validated numerics belong to CN.4; CM supplies the root and coefficient bounds and the precision needed for this particular polynomial.

**An explicit coefficient bound for the class polynomial** — `classPolynomialHeightBound`. Enumerate the h reduced primitive forms (a_k,b_k,c_k) of discriminant D<0 and put M_k=exp(π√|D|/a_k)+2114.567. The singular value at τ_k=(−b_k+i√|D|)/(2a_k) satisfies |j(τ_k)|≤M_k. Consequently every coefficient of H_D has absolute value at most B_D=⌈∏_{k=1}^h(1+M_k)⌉. This deliberately safe elementary-symmetric bound is unconditional; CN4 supplies a rational outward bound B≥B_D, including certified exp evaluation. Optimized asymptotic/time bounds under GRH are separate statements and are not needed for output correctness.

Sources: [CRT](#source-crt), Appendix 1, Lemma 8 and proof, pp.31–32. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.integral](#cm-3-1); [quadraticFormsDictionary](#cm-1-2); [ModularForms Layer 0][modularforms-0]; `ComputationalNumberTheory:CN.4`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**A complex class-polynomial certificate** — `ComplexClassPolynomialCertificate`. A certificate for D consists of the complete reduced-form/ideal-class census, one CN4 rational complex box per exact singular value j(τ_k), a checked finite q-series/tail enclosure for each box, coefficient boxes obtained by CN4’s outward polynomial-product propagation, and a monic P∈Z[X]. For every coefficient box, its imaginary interval contains 0 and its real interval contains exactly one integer, equal to the corresponding coefficient of P; integralness comes from CM.3. Class enumeration completeness and root enclosures are separate proof components; numerical proximity and a list of h unverified approximations do not constitute a certificate.

Sources: [CRT](#source-crt), Appendix 1 pp.31–32 and introduction. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.integral](#cm-3-1); [quadraticFormsDictionary](#cm-1-2); [classPolynomialHeightBound](#cm-5-3); `ComputationalNumberTheory:CN.4/complex-box-denotation`; `ComputationalNumberTheory:CN.4/integer-recovery-sound`; `ComputationalNumberTheory:CN.4`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Certified complex computation: soundness and termination** — `complexClassPolynomial_sound_terminates`. The complex algorithm enumerates the verified class census, requests outward j-boxes from CN4 at increasing precision, propagates their product and returns the unique integer coefficients when the certificate checks. It returns exactly H_D. If all root centers/errors obey |j_k|≤M and |z_k−j_k|≤δ≤1, the total coefficient error is bounded by hδ(1+M+δ)^{h−1}; choose δ<1/(4h(2+M)^{h−1}) and corresponding outward widths below 1/2 to obtain unique integer recovery. CN4’s convergence/tail guarantees give finite termination; an approximate complex value without a validated tail is not an input oracle for this theorem.

Sources: [CRT](#source-crt), Appendix 1 pp.31–32. Prerequisites: [ComplexClassPolynomialCertificate](#cm-5-3); [classPolynomialHeightBound](#cm-5-3); [classPolynomial.integral](#cm-3-1); `ComputationalNumberTheory:CN.4/integer-recovery-sound`; `ComputationalNumberTheory:CN.4`; [ComplexClassPolynomialCertificate.coefficient_enclosure](#cm-5-3).

**Certified complex class-polynomial computation** — `complexClassPolynomial`. For an admissible negative quadratic discriminant D, construct the deterministic complex algorithm returning P∈Z[X] together with a ComplexClassPolynomialCertificate(D,P). Enumerate all reduced proper classes; use CN4’s proved-tail j evaluator and rational outward product propagation at precisions 1,2,4,… until each coefficient box passes unique-integer recovery. The soundness/termination theorem justifies a total function with P=H_D. Its implementation is on the supplier algorithm/numeric carriers, not a new ball-arithmetic layer.

Sources: [CRT](#source-crt), Introduction and Appendix 1, pp.1–2,31–32. Prerequisites: [complexClassPolynomial_sound_terminates](#cm-5-3); [ComplexClassPolynomialCertificate](#cm-5-3); `ComputationalNumberTheory:CN.0`; `ComputationalNumberTheory:CN.4`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Basic API.**

- `TauCeti.CM.ComplexClassPolynomialCertificate.roots_complete`: The checked root list is exactly the reduced-form/ideal-class census for D.
- `TauCeti.CM.ComplexClassPolynomialCertificate.coefficient_enclosure`: CN4 product propagation encloses each exact H_D coefficient in the stored box.
- `TauCeti.CM.ComplexClassPolynomialCertificate.unique_integer`: Each real coefficient box has ceil(lower)=floor(upper)=P.coeff(k), with imaginary 0 admitted.
- `TauCeti.CM.ComplexClassPolynomialCertificate.transport`: Permuting the verified root census preserves the product certificate and output P.
- `TauCeti.CM.complexClassPolynomial.certificate`: The returned certificate verifies the exact root census, coefficient enclosures and integer coefficients.
- `TauCeti.CM.complexClassPolynomial.correct`: The returned polynomial equals H_D in Z[X].
- `TauCeti.CM.complexClassPolynomial.precision_independent`: Different valid refinement schedules or root orderings return the same polynomial.

**Unit tests.**

- `TauCeti.CM.ComplexClassPolynomialCertificate.test_unique`: An accepted Gaussian certificate whose constant-coefficient box has real interval [−17281/10,−17279/10] returns coefficient −1728.
- `TauCeti.CM.ComplexClassPolynomialCertificate.test_boundary`: A coefficient box with real interval [−1728,−1727] cannot occur in an accepted certificate because it contains two integers.
- `TauCeti.CM.ComplexClassPolynomialCertificate.test_missing_class`: No singleton root list can certify an order ring-isomorphic to Z+3Zi: the certificate’s own Picard census has two classes, irrespective of approximation accuracy.
- `TauCeti.CM.complexClassPolynomial.test_minus4`: For D=−4 the return is X−1728.
- `TauCeti.CM.complexClassPolynomial.test_minus3`: For D=−3 the return is X.
- `TauCeti.CM.complexClassPolynomial.test_unvalidated_oracle`: A floating-point-only j evaluator without certified tails is not an admissible numeric supplier for this algorithm.

**Required calculations and boundary cases.** Include the leading and constant coefficients; use the rational constant 2114567/1000 exactly. The height bound has no GRH hypothesis. A box [1727.9,1728.1]+i[−0.1,0.1] containing j(i)=1728 singles out integer 1728. A real interval [1727,1728] contains two integers and is rejected despite small width. For h=1 the propagation error is δ; the general formula reduces correctly. The proof certifies P without assuming P=H_D in the certificate definition. For D=−4 the return is X−1728 with a one-root exact certificate.

The following API comparisons are used independently of the construction:

- `ComplexClassPolynomialCertificate.coefficient_enclosure`: CN4 product propagation encloses each exact H_D coefficient in the stored box. Sources: [CRT](#source-crt), Appendix 1 pp.31–32 and introduction. Prerequisites: [ComplexClassPolynomialCertificate](#cm-5-3).

<a id="cm-5-4"></a>

#### Ordinary endomorphism-order certificates

Verify every conductor prime power, with independent certified climbing at 2 and 3. Relation counts must be recomputed from the actual class groups and the actual curve, including sign multiplicities. This certificate is independent of any class-polynomial root test.

**An ordinary endomorphism-ring certificate** — `OrdinaryEndomorphismCertificate`. For an ordinary elliptic curve A/F_q with certified trace t and p∤t, write t²−4q=v²D_K, with D_K a fundamental negative discriminant and actual conductor u_A|v. A certificate for claimed 0<u|v stores certified factorizations and exact 2- and 3-adic conductor valuations from verified isogeny climbing. For EVERY prime power r^k|v with r>3 and k≥1, put j=ν_r(v)−k+1, D1=(v/r^j)²D_K and D2=r^{2k}D_K. Store an explicit signed ideal relation R_{r,k}, all its primes split in K and prime to v and p, together with independently checked counts c1=#R/D1>c2=#R/D2. Compute cA=#R/A by certified isogeny walks. Verification requires (cA<c1) iff r^k|u, plus agreement of the climbing valuations at 2 and 3 with those of u. Counts and climbing outputs are bound to actual curve/class-group calculations, not Boolean flags. Prime-only tests cannot certify arbitrary prime-power conductors.

Sources: [Endo](#source-endo), arXiv:0902.4670v2 §2.4, Lemma 3, Corollary 4 and Proposition 5, pp.5–6; §3.1–3.3 pp.6–8. Prerequisites: [cmIsogenyGraphDictionary](#cm-5-2); [GlobalNumberFields Layer 11][globalnumberfields-11]; `ComputationalNumberTheory:CN.1`; `ComputationalNumberTheory:CN.3`; [EllipticCurves Layer 3][ellipticcurves-3]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Sound and complete ordinary order verification** — `ordinaryEndomorphism_verify_iff`. After checking trace/discriminant/factorizations, exact climbing valuations at 2 and 3, and all prime-power relation conditions in OrdinaryEndomorphismCertificate, Verify returns true iff the geometric endomorphism order has exactly the claimed conductor u. For r>3 Corollary 4 proves cA<c1 iff r^k|u_A, and equality of these decisions for every r^k|v proves ν_r(u_A)=ν_r(u). No squarefree restriction on v is imposed. This is unconditional for valid certificates; smooth FindRelation runtime heuristics are not verifier assumptions. The order certificate remains an independent CRT input.

Sources: [Endo](#source-endo), arXiv:0902.4670v2 §2.4, Lemma 3, Corollary 4 and Proposition 5, pp.5–6; §3.1–3.3 pp.6–8. Prerequisites: [OrdinaryEndomorphismCertificate](#cm-5-4); [cmIsogenyGraphDictionary](#cm-5-2); [GlobalNumberFields Layer 11][globalnumberfields-11]; `ComputationalNumberTheory:CN.3`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [OrdinaryEndomorphismCertificate.valid_relations](#cm-5-4).

**Basic API.**

- `TauCeti.CM.OrdinaryEndomorphismCertificate.trace`: The stored t is the certified finite-field trace and t²−4q=v²D_K.
- `TauCeti.CM.OrdinaryEndomorphismCertificate.conductor_divides`: The claimed conductor u divides the verified v.
- `TauCeti.CM.OrdinaryEndomorphismCertificate.valid_relations`: Every r^k|v with r>3 is covered by a relation with c1>c2 for D1=(v/r^(ν_r(v)−k+1))²D_K and D2=r^{2k}D_K; the 2- and 3-adic conductor valuations are certified by isogeny climbing.
- `TauCeti.CM.OrdinaryEndomorphismCertificate.verify`: Check trace/factorizations, the climbing outputs at 2 and 3, each relation’s actual class-group counts and every prime-power curve-count decision; return the order certificate on success.

**Unit tests.**

- `TauCeti.CM.OrdinaryEndomorphismCertificate.test_maximal`: For v=1 the only allowed conductor is u=1; factorization/trace checks still apply.
- `TauCeti.CM.OrdinaryEndomorphismCertificate.test_supersingular`: A supersingular curve with p|t is excluded from this ordinary certificate contract.
- `TauCeti.CM.OrdinaryEndomorphismCertificate.test_forged_relation`: A relation failing its promised class-group inequality is rejected before its curve count can certify u.
- `TauCeti.CM.OrdinaryEndomorphismCertificate.test_prime_powers`: For v=25 and claimed u=5, both (5,1) and (5,2) are tested: the curve decisions must be true for 5|u and false for 25|u. A certificate indexing only the prime 5 misses this distinction.

**Required calculations and boundary cases.** If v=u=1 there are no relation inequalities, but the trace, fundamental discriminant and primality checks remain mandatory. A forged relation table with arbitrary successful Boolean flags is rejected. Knowing j is a root of H_D mod p does not bypass any of the relation or ordinary checks. v=25,u=5 is allowed; recording the prime support alone is insufficient to distinguish conductor 5 from 25.

The following API comparisons are used independently of the construction:

- `OrdinaryEndomorphismCertificate.valid_relations`: Every r^k|v with r>3 is covered by a relation with c1>c2 for D1=(v/r^(ν_r(v)−k+1))²D_K and D2=r^{2k}D_K; the 2- and 3-adic conductor valuations are certified by isogeny climbing. Sources: [Endo](#source-endo), arXiv:0902.4670v2 §2.4, Lemma 3, Corollary 4 and Proposition 5, pp.5–6; §3.1–3.3 pp.6–8. Prerequisites: [OrdinaryEndomorphismCertificate](#cm-5-4).

<a id="cm-5-5"></a>

#### CRT reconstruction with independently verified roots

Each admissible rational prime supplies an ordinary exact-order seed and a complete verified Picard orbit. Distinct residues and a strict modulus bound determine the integer polynomial. Split-prime existence and finite exhaustive seed search give termination without a GRH assumption.

**A CRT class-polynomial certificate** — `CRTClassPolynomialCertificate`. A CRT certificate consists of distinct certified rational primes p_i away from D and chosen to split completely in the ring class field, a verified ordinary curve/order seed at each p_i, a complete ideal-class action orbit with each endomorphism order separately certified, and the polynomial residues H_i=∏(X−j)∈F_{p_i}[X]. It includes an unconditional coefficient bound B and product M=∏p_i>2B, plus P∈Z[X] with |coeff(P)|≤B and coefficientwise P mod p_i=H_i. Root-count equality alone does not verify endomorphism rings, ordinary status, prime splitting or orbit completeness. The output is exact standard integer CRT; floating explicit-CRT variants require their own error certificate.

Sources: [CRT](#source-crt), §§5.2–6 pp.17–20. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.integral](#cm-3-1); [classPolynomial.ringClassField](#cm-3-1); [cmReductionDictionary](#cm-5-1); [idealAction](#cm-1-1); [classPolynomialHeightBound](#cm-5-3); `ComputationalNumberTheory:CN.1`; `ComputationalNumberTheory:CN.3`; [ClassFieldTheory Layer 13][classfieldtheory-13]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [ordinaryEndomorphism_verify_iff](#cm-5-4); [OrdinaryEndomorphismCertificate](#cm-5-4).

**Certified CRT computation: soundness and termination** — `crtClassPolynomial_sound_terminates`. The standard CRT algorithm searches for distinct primes splitting completely in L_f/Q and avoiding the finite bad set, produces validated ordinary O_D curves and full Picard orbits, and continues until M>2B. Under the certified finite-field curve/trace/isogeny/order-search procedures of ComputationalNumberTheory CN.3, it terminates and returns exactly H_D∈Z[X]. Existence of infinitely many such primes follows from abelian Chebotarev over K and degree-one prime selection; exhaustive finite curve search plus Deuring lifting supplies suitable seeds. Soundness is unconditional. Randomized expected complexity or optimized prime bounds under GRH do not enter this theorem.

Sources: [CRT](#source-crt), §6 and §7, correctness/termination discussion pp.18–21. Prerequisites: [CRTClassPolynomialCertificate](#cm-5-5); [classPolynomial.ringClassField](#cm-3-1); [cmReductionDictionary](#cm-5-1); [deuringLifting](#cm-5-1); [idealAction](#cm-1-1); [idealAction.picardEquiv](#cm-1-1); [Chebotarev Layer 9][chebotarev-9]; `ComputationalNumberTheory:CN.1`; `ComputationalNumberTheory:CN.3`; [CRTClassPolynomialCertificate.unique](#cm-5-5); [ordinaryEndomorphism_verify_iff](#cm-5-4).

**Certified CRT class-polynomial computation** — `crtClassPolynomial`. For an admissible negative quadratic discriminant D, construct the standard integer CRT algorithm returning P∈Z[X] and a CRTClassPolynomialCertificate(D,P). Use the certified coefficient bound, admissible distinct ordinary primes, independent endomorphism checks and complete ideal-class root products until M>2B; reconstruct the unique signed coefficients. CN1/CN3 supply verified finite algorithms, while the CM termination proof makes this a total class-polynomial construction. No unproved GRH/heuristic complexity assumption is attached to correctness.

Sources: [CRT](#source-crt), §6 pp.18–20, standard CRT variant. Prerequisites: [crtClassPolynomial_sound_terminates](#cm-5-5); [CRTClassPolynomialCertificate](#cm-5-5); [ordinaryEndomorphism_verify_iff](#cm-5-4); `ComputationalNumberTheory:CN.0`; `ComputationalNumberTheory:CN.1`; `ComputationalNumberTheory:CN.3`.

**Basic API.**

- `TauCeti.CM.CRTClassPolynomialCertificate.residues`: P mod p_i equals the verified complete CM-root product at every prime.
- `TauCeti.CM.CRTClassPolynomialCertificate.modulus`: The usable modulus is the product of distinct coprime verified primes and is strictly greater than 2B.
- `TauCeti.CM.CRTClassPolynomialCertificate.unique`: Two integer polynomials bounded coefficientwise by B with these residues are equal.
- `TauCeti.CM.CRTClassPolynomialCertificate.endomorphism_check`: The order certificate is checked independently for every seed/orbit curve; a root of H_D mod p is not itself an order certificate.
- `TauCeti.CM.crtClassPolynomial.certificate`: The return includes valid distinct-prime, endomorphism-order, class-orbit, residue and modulus checks.
- `TauCeti.CM.crtClassPolynomial.correct`: The returned polynomial equals H_D in Z[X].
- `TauCeti.CM.crtClassPolynomial.prime_choice_independent`: Every admissible complete prime-selection schedule returns the same polynomial.

**Unit tests.**

- `TauCeti.CM.CRTClassPolynomialCertificate.test_strict_bound`: For an actual accepted certificate with B=10, every polynomial with coefficients in [−10,10] and the checked residues equals its output; the certificate carries the strict product modulus.
- `TauCeti.CM.CRTClassPolynomialCertificate.test_equality_bound`: No accepted CRT certificate can have M=2B, even if boundary coefficients share residues; distinctness and the strict modulus are acceptance conditions.
- `TauCeti.CM.CRTClassPolynomialCertificate.test_duplicate_prime`: No two-index accepted certificate can assign p=5 to both indices. Repeating a congruence does not supply modulus 25.
- `TauCeti.CM.crtClassPolynomial.test_minus4`: For D=−4 the return is X−1728.
- `TauCeti.CM.crtClassPolynomial.test_supersingular_rejected`: For the Gaussian supersingular seed at inert p=7, and any finite-field extension, the certified trace remains divisible by 7. The ordinary verifier on that actual curve returns failure, so it cannot supply a CRT seed.
- `TauCeti.CM.crtClassPolynomial.test_order_separate`: Even if the actual curve’s j is a root of the proposed residue, a relation whose independently computed class counts do not separate D1 and D2 makes the order verifier fail. Polynomial-root membership cannot substitute for that check.

**Required calculations and boundary cases.** For B=10, modulus 21 permits unique signed recovery; modulus 20 does not meet the strict sufficient bound. Repeated CRT primes do not increase the usable coprime modulus. Reject a supersingular seed even when all its j-values are present in an extension field. The implementation must produce the independent certificates before reporting success. Changing the admissible prime order changes the certificate but not H_D.

The following API comparisons are used independently of the construction:

- `CRTClassPolynomialCertificate.unique`: Two integer polynomials bounded coefficientwise by B with these residues are equal. Sources: [CRT](#source-crt), §§5.2–6 pp.17–20. Prerequisites: [CRTClassPolynomialCertificate](#cm-5-5).

## 4. Contracts from neighbouring roadmaps

The preceding targets use the following exact inputs. They are requirements on the supplying layers, with mathematical outputs fixed here so CM comparisons can be composed without changing carriers or conventions. In particular, an evaluator must prove its enclosure and convergence theorems, and an order-search routine must be complete on the admissible inputs; an output with the right type alone does not discharge either requirement.

- `AbelianSchemesAndArithmeticModuli:A0`: Relative Lie algebra, invariant differentials and base change for group schemes; generic projective-module Serre tensor construction as the fppf sheaf associated to M⊗_R A(T).
- `AbelianSchemesAndArithmeticModuli:A1`: Serre tensor preserves abelian schemes for finite projective modules, functoriality and ideal-inclusion isogenies, with finite flat kernels and degrees.
- `AbelianSchemesAndArithmeticModuli:A4`: Degree-one de Rham/Betti realizations and Hodge exact sequence, integration pairing and duality, compatible with CM actions and base change.
- `AbelianSchemesAndArithmeticModuli:A5`: Polarized complex uniformization and algebraization of C^Φ/Φ(I), integral Riemann forms, analytic/algebraic Hom comparison, symplectic periods and principal polarization criterion.
- `ArithmeticGaloisRepresentations:R01.2`: Rank-one local inertia and Weil–Deligne character, duality between covariant Tate and cohomological H¹, inertia-invariant Euler factors with geometric Frobenius on H¹, and induction/restriction at all primes.
- `ArithmeticGaloisRepresentations:R01.3`: Artin/Swan conductors and local rank-one conductor additivity under direct sums, including ramified places.
- `ArithmeticGaloisRepresentations:R01.5`: Semisimple representation recognition by good Frobenius polynomials and Chebotarev.
- `ArithmeticGaloisRepresentations:R01.6`: Canonical covariant Tate module for abelian varieties, E⊗Q_l action, extension of coefficients and direct-summand realizations.
- `AutomorphicGaloisRepresentations:R19.3`: Compatible-system/purity comparison for CM Hecke components and weight-two theta-series/newform realizations, via Frobenius recognition; no new generic induction construction in CM.
- `ComputationalNumberTheory:CN.0`: Generic finite algorithm/representation carrier, proof-bearing computation outputs, exact polynomial arrays and search/refinement control; CM instantiates it with its own termination and certificate theorems.
- `ComputationalNumberTheory:CN.1`: Certified integer factorization and primality for discriminants, q, CRT primes and conductor factors.
- `ComputationalNumberTheory:CN.3`: Certified finite-field elliptic trace and l-isogeny walks with sign multiplicities, exhaustive curve/seed search, and exact 2- and 3-adic conductor valuations by isogeny climbing. Bind outputs to intrinsic curves and ideal-class counts; CM proves prime-power conductor verification separately from j-polynomial roots.
- `ComputationalNumberTheory:CN.4`: Validated rational complex boxes/balls, outward exp and modular q-series evaluations with proved tails, polynomial coefficient propagation, convergence and unique-integer recovery. CM supplies only its own height and precision formulas.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2`: Generic quaternionic integral lattice/order carrier, localization, maximality and reduced discriminant compatible with the existing rational quaternion algebra; the full integral-order contract is supplied within GN.2’s quaternionic integral-lattice direction.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3`: Primitive positive binary quadratic-form reduction/enumeration, exact complete finite class census, boundary identifications and finite stabilizer weights.
- `ModularCurvesPartII:R12.1`: Elliptic lattice↔Weierstrass curve comparison, analytic functions and normalized j, full faithfulness for origin-preserving maps.
- `ModularCurvesPartII:R12.6`: Level-function descent and evaluation at elliptic CM points, functions regular at the point and enough functions to separate its finite moduli orbit; compatibility with algebraic coarse/fine moduli.
- `ShimuraData:D3`: Generic cocharacter reflex-field carrier and stabilizer, with comparison to the trace-generated field of a CM type.
- `ShimuraVarieties:V4`: Special-torus reflex norm on finite ideles, rational elements and ideals, conjugation norm identity and exact Artin/level convention, independent of CM.2.
- `ShimuraVarieties:V5`: Main CM theorem and general Shimura–Taniyama theorem: actual CM abelian varieties, polarization similitude, torsion/finite-adelic H1 and Galois conjugation; input CM.0, never CM.2.
- `ShimuraVarieties:V8`: Siegel modular function field F_N over Q(ζ_N), GSp_{2g}(Z/N) right action and rational similitude action, descent and evaluation regular at a principally polarized CM point.
- [Chebotarev Layer 9][chebotarev-9]: Abelian Chebotarev: each class-field Artin class contains infinitely many degree-one primes avoiding any finite set; in particular infinitely many rational primes splitting completely in the quadratic ring class field.
- [ClassFieldTheory Layer 11][classfieldtheory-11]: Arithmetic global Artin reciprocity, Art(uniformizer)=arithmetic Frobenius, compatible with norms and finite extensions.
- [ClassFieldTheory Layer 12][classfieldtheory-12]: Global class-field correspondence for arbitrary number fields: ray/idele open-subgroup fields, exact arithmetic Artin quotient, least conductor and conductor divisibility, uniqueness and field inclusion reversal.
- [ClassFieldTheory Layer 13][classfieldtheory-13]: Imaginary quadratic ring/ray class fields with Artin/Picard and Artin/ray-class isomorphisms; conductor divisibility.
- [EllipticCurves Layer 1][ellipticcurves-1]: Weierstrass elliptic curve↔elliptic scheme comparison, transporting twists, endomorphisms, j and Tate modules through the pinned carriers. Elliptic CMAction/order-embedding, algebraic End and automorphism/isogeny carriers compatible with the pinned Weierstrass isogeny and degree; elliptic Lie scalar identification.
- [EllipticCurves Layer 2][ellipticcurves-2]: Covariant elliptic Tate module and Weil pairing, integral torsion kernels and degrees, compatibility with Weierstrass maps.
- [EllipticCurves Layer 3][ellipticcurves-3]: Ordinary/supersingular predicates, geometric endomorphisms, Frobenius, trace and finite-field point counting in all characteristics, including 2 and 3.
- [EllipticCurves Layer 4][ellipticcurves-4]: Generic elliptic local reduction theorem: integral j iff potentially good reduction, good-model specialization of endomorphisms and conductor/local Euler compatibility, with no exclusion of residue characteristics 2 or 3.
- [EllipticCurves Layer 5][ellipticcurves-5]: Quadratic-twist equation/isomorphism and descent with Galois cocycle; twisting a rational CM curve by its CM quadratic character.
- [GlobalNumberFields Layer 10][globalnumberfields-10]: Archimedean exponent conventions, algebraic infinity types, conjugation, cyclotomic character and coefficient embeddings; positive ideal type versus negative idelic type.
- [GlobalNumberFields Layer 11][globalnumberfields-11]: Generic finite Z-orders R in number fields, conductor ideal, proper invertible fractional ideals, order-specific finiteness/API on the existing ClassGroup/Pic carriers, extension/contraction away from the conductor, ideal norms and the quadratic-order class number formula.
- [GlobalNumberFields Layer 7][globalnumberfields-7]: Ideal/idele ray-class comparison, mod× congruences for fractional elements, arithmetic normalization and ideals prime to a modulus.
- [GlobalNumberFields Layer 8][globalnumberfields-8]: Norms and base change for ideals/ideles of finite extensions, compatible with arithmetic Artin maps.
- [GlobalNumberFields Layer 9][globalnumberfields-9]: Algebraic Hecke-character carrier on ideles/ideals, conductor as the least finite modulus, local components and Euler factors, coefficient fields and passage to l-adic characters.
- [ModularForms Layer 0][modularforms-0]: Independent LevelOne.JInputs: normalized modular j with q-expansion q⁻¹+744+196884q+…, j(i)=1728 and j(exp(2πi/3))=0, orbit separation, holomorphic evaluations, integral modular polynomial Φ_l and the prime diagonal −Φ_l(X,X) monic of degree 2l. This package has no dependency on CM.
- [QuadraticFormInvariants Layer 2][quadraticforminvariants-2]: Existing quaternion algebra/reduced norm and split-or-division API; reuse actual QuaternionAlgebra and its naturality, not a new CM-specific division algebra carrier.

The A2/rosati-involution and A6 degree, polarized-automorphism and characteristic-polynomial interfaces are used on the same abelian-variety action as the A4/A5 comparisons. R11.5/local-euler-polynomial and /elliptic-local-polynomial use cohomological geometric Frobenius, while /neron-ogg-shafarevich relates unramified Tate realization to good reduction. These comparisons must transport the equation, scheme, endomorphism and realization data together.

## 5. Source conventions and limits

The statements above are scoped to the versions in §6. Three boundaries need particular care in applications. The polarized level stabilizer gives a field over E*; a theorem about an absolute unmarked field needs descent and bounds on forgetting-action fibers. The canonical Gross predicate specifies character conditions and conductor support; constructing a canonical character/curve and proving its attachment use the primary existence theorem, while exact conductor exponents require local calculation. The quaternion classification includes all characteristics and needs the integral maximal-order API in GN.2, in addition to the rational quaternion algebra.

For Tsimerman §5, p.386, take the absolute norm of an ideal I of E* over E*/Q. It is a positive rational number, distinct from its principal ideal in E; it is this number which appears in the polarized unit obstruction. For the full-level rigidity argument of Lemma 4.1, p.384, use polarization-preserving automorphisms. An unpolarized CM surface can have infinite-order integral units congruent to 1 modulo 3, giving nontrivial origin-preserving automorphisms trivial on 3-torsion. Full level alone therefore does not justify passing to an absolute unmarked moduli degree.

For MIT21 Theorem 21.14, p.10, root distinctness requires ordinary split residue characteristic prime to the order discriminant. The norm of a prime over the quadratic base is insufficient. For D = −23, H_D = X³ + 3491750X² − 5151296875X + 12771880859375 becomes X³ modulo 5. Here 5 is inert, the principal K-ideal (5) splits in the Hilbert class field over K, and the resulting norm 25 does not make the reduction ordinary or the roots distinct.

For Endo v2 §3.2, p.7, use the prime-power separation of §2.4 Corollary 4, pp.5–6, together with independent valuations at 2 and 3. The prime-only displayed Certify construction cannot handle arbitrary residual conductor powers: v = 25 and proposed u = 5 make its two discriminants equal. The ordinary data q = 641, t = 8, D_K = −4 satisfy t² − 4q = 25²D_K. The repaired prime-power certificate in CM.5 verifies these inputs. This scope caution concerns the specified preprint; it does not assert a discrepancy in an uncollated journal version or alter heuristic complexity statements.

## 6. Sources

Page numbers in the build plan are the source's printed pages, including author-copy pagination where stated. The cited preprints of BT, KS, Streng, CRT and Endo fix their theorem numbering; publication metadata does not assert that another version has identical statements. The primary sources support individual constructions and comparisons rather than determining this roadmap's layer order.

<a id="source-milnecm"></a>

**MilneCM** — James S. Milne, [Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf). v0.10, 14 July 2020. Relevant locators: §1 pp.11–19; Example 2.9 pp.25–26; §3.11–3.17 pp.29–31; §8.1–8.7 pp.66–70; §9 pp.74–84, especially Theorem 9.10, Remark 9.11(c) and Theorem 9.17.

<a id="source-milneft"></a>

**MilneFT** — James S. Milne, [The fundamental theorem of complex multiplication](https://arxiv.org/pdf/0705.3446v1). arXiv:0705.3446v1, 2007. Relevant locators: Introduction pp.1–3; §3 pp.20–21 (Artin normalization).

<a id="source-streng"></a>

**Streng** — Marco Streng, [An explicit version of Shimura’s reciprocity law for Siegel modular functions](https://arxiv.org/pdf/1201.0020v4). arXiv:1201.0020v4, 22 April 2024. Relevant locators: §2.5–2.8 pp.5–8, Theorems 2.4–2.5; §4.2 pp.13–14; §4.4–4.5 pp.15–17.

<a id="source-bt"></a>

**BT** — Ashay A. Burungale and Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2). arXiv:2506.03465v2, October 2025; published Annals 203 (2026), not collated. Relevant locators: Complete 7-page preprint; CM types §2.2.5 p.5 and the proof of Theorem 1.1 in §3.1 p.6.

<a id="source-ks"></a>

**KS** — Guido Kings and Johannes Sprang, [Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation](https://arxiv.org/pdf/1912.03657v4). arXiv:1912.03657v4, 14 September 2024; published Annals 202 (2025), not collated. Relevant locators: §1.1–1.2 pp.6–11; Definition 1.8 and Serre equation (1.2.3) p.9; Proposition 1.11 pp.10–11 and Corollaries 1.12–1.13 p.11.

<a id="source-bko"></a>

**BKO** — Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1). Published Annals 194 (2021), 943–966, Caltech deposited copy. Relevant locators: §3.0.1 pp.950–951; Theorem 3.4 proof p.953 and equation (3.8).

<a id="source-bs"></a>

**BS** — Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Published Annals 191 (2020), 355–392. Relevant locators: §6 pp.372–373 (CM Cartan normalizer exclusion).

<a id="source-tsimerman"></a>

**Tsimerman** — Jacob Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Published Annals 187 (2018), 379–390. Relevant locators: §4 pp.384–385 and §5 pp.385–386; earlier pages are not a source of additional targets here.

<a id="source-aghmp"></a>

**AGHMP** — Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Published Annals 187 (2018), 391–531. Relevant locators: §3.4 p.420 (CM types and total-reflex character restriction); §9.1 pp.508–509.

<a id="source-yz"></a>

**YZ** — Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Published Annals 187 (2018), 533–638; §2.2 reflex data; 2022 author erratum introduction read separately, 2023 journal erratum not collated. Relevant locators: §2.2 p.546 (trace reflex field, reflex order); height comparisons outside scope.

<a id="source-gz"></a>

**GZ** — Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Published Inventiones 84 (1986), 225–320; GDZ scan. Relevant locators: Chapter III, §4 p.257 and §7 p.261.

<a id="source-deuring"></a>

**Deuring** — Max Deuring, [Die Typen der Multiplikatorenringe elliptischer Funktionenkörper](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf). Published Abhandlungen Hamburg 14 (1941), 197–272; Mainz scan. Relevant locators: Introduction pp.197–200; §9.1 pp.258–262 (lifting proof, partial); §8 conclusion p.258.

<a id="source-crt"></a>

**CRT** — Andrew V. Sutherland, [Computing Hilbert class polynomials with the Chinese Remainder Theorem](https://arxiv.org/pdf/0903.2785v4). arXiv:0903.2785v4, 22 November 2013; published Math. Comp. 80 (2011). Relevant locators: Introduction pp.1–2; §4.2–5.2 pp.13–17, Proposition 5 and unconditional class enumeration; §6–7 pp.18–22; Appendix 1 Lemma 8 pp.31–32.

<a id="source-endo"></a>

**Endo** — Gaetan Bisson and Andrew V. Sutherland, [Computing the endomorphism ring of an ordinary elliptic curve over a finite field](https://arxiv.org/pdf/0902.4670v2). arXiv:0902.4670v2, 17 March 2009. Relevant locators: arXiv v2 §2.1 p.3; §2.4 Lemma 3, Corollary 4 and Proposition 5 pp.5–6; §3.1–3.3 pp.6–8.

<a id="source-kato"></a>

**Kato** — Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0/). Published Astérisque 295 (2004), 117–290. Relevant locators: §§15.10–15.11 pp.260–262 (CM induction and type conventions).

<a id="source-yang"></a>

**Yang** — Tonghai Yang, [On CM abelian varieties over imaginary quadratic fields](https://people.math.wisc.edu/~tonghaiyang/HKCM.pdf). Author copy of Math. Ann. 329 (2004), 87–117. Relevant locators: Introduction pp.1–3, canonical characters and existence distinctions.

<a id="source-mit16"></a>

**MIT16** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf). Fall 2023 lecture notes. Relevant locators: Introduction p.1; Theorem 16.4 pp.4–5; §16.4, Definition 16.9 and Theorem 16.12 pp.6–7.

<a id="source-mit20"></a>

**MIT20** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf). Fall 2023 lecture notes. Relevant locators: Complete 8-page lecture; lattice/isogeny comparison pp.1–3; §20.3 pp.5–7, product, ideal action, Lemma 20.9, Theorems 20.11–20.12.

<a id="source-mit21"></a>

**MIT21** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf). Fall 2023 lecture notes. Relevant locators: §21.1 pp.1–3; §21.6 p.10; §21.7 diagram p.11.

<a id="source-mit22"></a>

**MIT22** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 22](https://math.mit.edu/classes/18.783/2023/LectureNotes22.pdf). Fall 2023 lecture notes. Relevant locators: §22.1 pp.1–3 (CM horizontal/ascending/descending isogenies).

[chebotarev-9]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-9-abelian-chebotarev
[classfieldtheory-11]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity
[classfieldtheory-12]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence
[classfieldtheory-13]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields
[ellipticcurves-1]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv
[ellipticcurves-2]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68
[ellipticcurves-3]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1
[ellipticcurves-4]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
[ellipticcurves-5]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-5-twists-aec-x2-x5
[globalnumberfields-10]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
[globalnumberfields-11]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups
[globalnumberfields-7]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-7-congruence-subgroups-and-the-ray-class-dictionary
[globalnumberfields-8]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-8-finite-extensions-of-adeles-and-ideles
[globalnumberfields-9]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-9-hecke-and-ray-class-characters
[mathlib-classgroup]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ClassGroup
[mathlib-classgroup.equivpic]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ClassGroup.equivPic
[mathlib-classgroup.mk]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ClassGroup.mk
[mathlib-commring.pic]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=CommRing.Pic
[mathlib-commring.pic.mapalgebra]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=CommRing.Pic.mapAlgebra
[mathlib-intermediatefield.adjoin]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=IntermediateField.adjoin
[mathlib-intermediatefield.adjoin_le_iff]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=IntermediateField.adjoin_le_iff
[mathlib-numberfield.iscmfield]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField
[mathlib-numberfield.iscmfield.complexconj]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexConj
[mathlib-numberfield.iscmfield.complexconj_apply_apply]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexConj_apply_apply
[mathlib-numberfield.iscmfield.complexconj_eq_self_iff]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexConj_eq_self_iff
[mathlib-numberfield.iscmfield.complexembedding_complexconj]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexEmbedding_complexConj
[mathlib-numberfield.ringofintegers]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.RingOfIntegers
[mathlib-weierstrasscurve.j]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=WeierstrassCurve.j
[modularforms-0]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus
[quadraticforminvariants-2]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion
