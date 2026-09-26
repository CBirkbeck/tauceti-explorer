# Motivic and étale methods for arithmetic K-theory: M.5d–M.8

## Purpose and exact extent

This first checkpoint develops the differential-symbol entrance to the residue-characteristic part of M.5d. It contains eighteen declarations: six constructions, one definition, ten lemmas and one theorem. Its twenty-four API items and twenty-one unit tests specify how to use the new objects. The five planets are the logarithmic differential, Milnor differential symbol, Artin–Schreier differential, logarithmic differential forms, and logarithmic symbol.

All six original stages remain in scope: M.5d, M.6, M.6a, M.6b, M.7 and M.8. Every stage remains partial. In particular this document does not yet provide the hard injectivity or surjectivity proof of Bloch–Gabber–Kato for an arbitrary imperfect field. It identifies that proof's missing intermediate inputs and its exact continuation point. The constructions below have enough mathematical content to be checked independently of that theorem. Degree zero, injectivity in degree one, and perfect-field calculations give useful boundary checks without assuming the desired general isomorphism.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit contains twenty-six targets across the six stages; none of those whole stages is built. It records partial ingredients for M.8, such as weight-one and cyclotomic data, but those do not supply the higher comparison maps or Selmer complexes. All declarations listed in the packet's baseline were read at the pinned commits. A full-tree search for differential-symbol, logarithmic-differential and p-basis names found no matching construction; that search is supporting evidence, not a claim that the existing Kaehler and exterior-power libraries are absent.

## Conventions and ownership

Let F be a field and write Ω_F¹=Ω_(F/Z). In degree n use the existing exterior power Ω_Fⁿ=∧_Fⁿ Ω_F¹. Thus Ω_F⁰=F and the empty wedge is 1. Absolute forms in characteristic p agree with forms over F_p; the supplier request includes this base comparison. None of these carriers is a new opaque type.

The unit group F× is written additively only when making tensor powers over Z. The source K_n^M(F) is supplied by `K2SymbolsBrauer:T.2/milnor-k-theory`: its generators are symbols of units, multilinear with respect to multiplication, modulo consecutive Steinberg relations. The file uses an explicitly labelled tensor-quotient stand-in for that owner's presentation. This does not reassign ownership. Milnor signs alone do not make the integral symbol {a,a} vanish. Differential forms, however, are strictly alternating in every characteristic, so the image of that symbol vanishes.

For p prime with char(F)=p, set k_n(F)=K_n^M(F)/pK_n^M(F), an ordinary additive quotient. This notation is not Quillen K-theory with finite coefficients: a homotopy cofibre has additional coefficient-sequence structure, and its homotopy groups cannot be identified with this quotient by notation.

`DerivedDeRhamCohomology:DD.2` owns the ordinary de Rham differential, wedge product, pullback and their compatibility inside its more general theory. `DerivedDeRhamCohomology:DD.3` owns the inverse Cartier calculation. Its classical smooth results need the specified extension to arbitrary fields before they supply this packet. These are precise open requests, not extra constructions assigned here. Degree-one pullback already exists as Tau Ceti's KaehlerDifferential.mapSemilinear; higher pullback must extend that map and move scalars through the field homomorphism.

The open [Mathlib de Rham-complex PR #18551](https://github.com/leanprover-community/mathlib4/pull/18551), by Joël Riou, uses exterior powers of Kaehler differentials and a differential linear over the base ring. The supplier should follow that design, preserving its comparison with these carriers. The inspected head is `5888c0081ba867ede5c60d3060f2d674d932b53c`; it is a design lead and is not a pinned baseline declaration.

Put B_F⁰=0 and B_Fⁿ=dΩ_Fⁿ⁻¹ for n>0. These are additive subgroups. They need not be F-linear subspaces: multiplying an exact one-form by an arbitrary function can destroy exactness. Hence Ω_Fⁿ/B_Fⁿ is taken as an additive quotient. Inverse Cartier gives an additive Frobenius-semilinear map to that quotient. We use wp=C⁻¹−projection; Bloch–Kato use its negative. The kernels agree, while the displayed coefficient formula here has x^p−x.

The accepted RS-08 decisions keep all scoped stages. M.8 keeps the arithmetic K-theory instantiations and imports the generic Selmer construction from `SelmerIwasawaCohomology:L2/L4`. The specified determinant supplier is `PadicMeasuresIwasawaAlgebras:L5`; the current L2/L3 measure and pseudomeasure packet is a different interface. No new KU aggregation nodes, generic de Rham owner, generic Selmer theory or competing Milnor K-theory are introduced.

## Sources and proof obligations

[Weibel's author K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013, supplies the differential symbol immediately before Lemma III.7.7, the definition of ν in III.7.7.1 and the BGK statement in III.7.7.2. Printed pages 250–251 are PDF pages 258–259. The next page was read as a lead for the Izhboldin discussion; its proof has not been fully extracted here.

[Bloch–Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2, printed pages 113–118 (PDF pages 8–13), was read throughout and the formulas visually checked. This section states the logarithmic-symbol isomorphism and proves injectivity through a relative argument; it directs the reader to Kato 1982 §1 for surjectivity and for the elimination input used in equation (2.6). The references page was also read. The rest of that paper has not been screened for this packet.

The published [Kurihara–Fesenko appendix](https://msp.org/gtm/2000/03/gtm-2000-03-003p.pdf), A2 on pages 36–41, was read as a supplementary account. Three problems were located and recorded below. It is not used to claim that the missing elimination proof has been closed. The source URLs, access date 26 September 2026, version descriptions and SHA-256 digests are stored in the packet. Kato's 1982 chapter was identified at its publisher, but its §1 was not acquired and read. Kato's 1980 norm/trace passage and Illusie's logarithmic de Rham–Witt exact-sequence passage also remain unread.

The general theorem has two distinct proof jobs. For injectivity, first control how differential residues detect the tame residues of symbols after adjoining a transcendental element. The degree decreases by one under residue, and the lower-degree induction hypothesis belongs in that calculation. One must check the relevant exact sequence after reducing modulo p; tensoring an exact sequence cannot simply be assumed left exact. Filtered unions then require an actual finite-presentation/finite-witness argument, including the differential quotient and kernel.

Next define the semilocal groups that the relative argument uses. For a semilocal Dedekind domain R with fraction field K, k_q(R) is the kernel of the residue maps from k_q(K) to the groups k_(q−1)(R/m). It is not introduced as the naive Milnor group of an arbitrary ring. The unit-symbol generation theorem and specialization maps provide the relative kernel k_q(R,I). Ordinary forms and Cartier give ν_R and the kernel of reduction ν_(R,I). The diagram comparing these relative groups with the residue-field groups must be proved to commute, with the exactness actually needed for its diagram chase.

Relative surjectivity uses trace and norm, together with the formula trace followed by restriction equals multiplication by the field-extension degree. Prime-to-p degree makes that integer invertible on the mod-p groups. The trace statement is more than the existence of a Milnor norm: it includes compatibility with logarithmic forms, integral relative subgroups and normalization of the semilocal ring. After this descent, an adapted p-basis and a lexicographic filtration of its wedges support elimination. Equation (2.6) uses Kato's input. Its use must be split from the subsequent relative Cartier diagram and the product argument that puts the corrected symbol in the relative group. The current nodes assert none of those unproved engines.

For prime powers, the logarithmic de Rham–Witt short exact sequence is a separate source input. In the coefficient comparison the Milnor top row starts right exact; its left injection is not an automatic property of reduction modulo p^r. The logarithmic bottom row and the comparison isomorphisms provide the missing control. The subsequent Tor argument concerning p-primary torsion must be extracted separately. The prime-to-characteristic Bockstein branch imported from M.5c is another argument again.

## M.5d: declaration-level plan

In the following entries, names without a longer prefix lie in the proposed namespace `TauCeti.DifferentialSymbol`. The packet identifiers are stable continuation anchors. Definitions of imported objects appear only as documented interfaces in the suggested file. All listed implementation statuses remain unchecked.

### Logarithmic one-form

`MotivicEtaleKTheory:M.5d/logarithmic-one-form` — construction.

Define logOne:F× (written additively)→Ω_(F/Z) by a↦a⁻¹ da. Its map structure encodes dlog(ab)=dlog(a)+dlog(b); zero is excluded by the unit domain.

Proof or construction:

1. Use the existing universal derivation D, not a new differential-module carrier.
2. Apply Derivation.leibniz and commute field scalars: (ab)⁻¹(a db+b da)=b⁻¹ db+a⁻¹ da.
3. Derive the identity, inverse and natural-power formulas from this additive homomorphism.

Prerequisites: `mathlib:KaehlerDifferential.D`, `mathlib:Derivation.leibniz`, `mathlib:Derivation.map_one_eq_zero`.

API:

- `logOne_apply`: For a∈F×, logOne(a)=a⁻¹ da.
- `logOne_mul`: For units a,b, logOne(ab)=logOne(a)+logOne(b).
- `logOne_inv`: For a unit a, logOne(a⁻¹)=−logOne(a).
- `logOne_pow`: For a unit a and m≥0, logOne(a^m)=m logOne(a).

Unit tests:

- `logOne_test_one` (degenerate): logOne(1)=0.
- `logOne_test_nonzero` (non-example): If da≠0 for a unit a, then logOne(a)≠0; the zero homomorphism fails this test.
- `logOne_test_inverse` (compatibility): logOne(a⁻¹)+logOne(a)=0 for every unit a.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Naturality of the logarithmic differential

`MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural` — lemma.

For a Z-algebra homomorphism f:F→E between fields and a∈F×, the existing semilinear Kaehler map sends logOne(a) to logOne(fa).

Proof or construction:

1. Expand the evaluation formula for logOne.
2. Apply mapSemilinear_smul and mapSemilinear_D, and f(a⁻¹)=f(a)⁻¹.

Prerequisites: `MotivicEtaleKTheory:M.5d/logarithmic-one-form`, `tauceti:KaehlerDifferential.mapSemilinear`, `tauceti:KaehlerDifferential.mapSemilinear_D`, `tauceti:KaehlerDifferential.mapSemilinear_smul`.

Acceptance:

- Taking f to be the identity recovers logOne(a).
- The scalar moves through f; no F-linearity is asserted for an arbitrary field homomorphism.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Tensor differential symbol

`MotivicEtaleKTheory:M.5d/tensor-differential-symbol` — construction.

For n≥0, tensorSymbol is the Z-linear map (F×)^(⊗n)→Ω_F^n sending the pure tensor (a₁,…,a_n) to dlog(a₁)∧…∧dlog(a_n). Empty wedge means 1∈F under the existing degree-zero exterior equivalence.

Proof or construction:

1. Compose each input with logOne, and then apply the existing alternating map into the exterior power.
2. Restrict its multilinearity to Z, using logOne as a homomorphism of additive groups.
3. Apply PiTensorProduct.lift. Its uniqueness supplies the extensionality rule.

Prerequisites: `MotivicEtaleKTheory:M.5d/logarithmic-one-form`, `mathlib:PiTensorProduct.lift`, `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.zeroEquiv`, `mathlib:exteriorPower.oneEquiv`.

API:

- `tensorSymbol_pure`: Evaluate a pure tensor as the wedge of its logarithmic differentials.
- `tensorSymbol_unique`: Any Z-linear map with the same values on every pure tensor equals tensorSymbol.
- `tensorSymbol_update_mul`: Replacing the ith unit by bc gives the sum of the values with b and c in that position.

Unit tests:

- `tensorSymbol_test_zero` (degenerate): In degree zero the empty tensor maps to 1, not 0.
- `tensorSymbol_test_one` (compatibility): Under exteriorPower.oneEquiv the degree-one value is logOne(a).
- `tensorSymbol_test_repeated` (computation): In degree two the tensor (a,a) maps to zero, in every characteristic.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Vanishing on Steinberg tensors

`MotivicEtaleKTheory:M.5d/steinberg-vanishing` — lemma.

If i≠j and a_i+a_j=1 in F for a tuple of units, tensorSymbol(a₁⊗…⊗a_n)=0. This includes characteristic two.

Proof or construction:

1. From D(1)=0 and additivity derive da_j=−da_i.
2. Write the two logarithmic entries as the field scalars a_i⁻¹ and −a_j⁻¹ multiplying the same differential da_i.
3. Pull both scalars out of the alternating map; apply AlternatingMap.map_eq_zero_of_eq. No division by 2 is used.

Prerequisites: `MotivicEtaleKTheory:M.5d/tensor-differential-symbol`, `MotivicEtaleKTheory:M.5d/logarithmic-one-form`, `mathlib:Derivation.map_one_eq_zero`, `mathlib:AlternatingMap.map_eq_zero_of_eq`.

Acceptance:

- For n=2 the pair (a,1−a), a≠0,1, has zero image.
- Consecutive positions suffice for the imported presentation; arbitrary distinct positions also vanish in forms.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Differential symbol on Milnor K-theory

`MotivicEtaleKTheory:M.5d/milnor-differential-symbol` — construction.

There is a unique additive differentialSymbol:K_n^M(F)→Ω_F^n taking {a₁,…,a_n} to the wedge of dlog(a_i). The source is the existing T.2 tensor/Steinberg presentation, not an exterior algebra on F×.

Proof or construction:

1. Use tensorSymbol and steinberg-vanishing on the consecutive Steinberg generators of the T.2 relation module.
2. Linearity kills their Z-span; use Submodule.liftQ to descend.
3. Uniqueness on generators follows from the tensor universal property and surjectivity of the quotient map.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.5d/tensor-differential-symbol`, `MotivicEtaleKTheory:M.5d/steinberg-vanishing`, `mathlib:Submodule.liftQ`.

API:

- `differentialSymbol_symbol`: The value of {a₁,…,a_n} is dlog(a₁)∧…∧dlog(a_n).
- `differentialSymbol_quotient`: Composing with the tensor quotient projection is tensorSymbol.
- `differentialSymbol_unique`: An additive map from K_n^M(F) with these values on all symbols equals differentialSymbol.

Unit tests:

- `differentialSymbol_test_zero` (degenerate): The empty Milnor symbol maps to 1∈Ω_F^0=F.
- `differentialSymbol_test_one` (compatibility): Under Ω_F^1≃Ω_(F/Z), {a} maps to a⁻¹ da.
- `differentialSymbol_test_repeated` (non-example): The image of {a,a} is zero. This imposes no assertion that the integral Milnor symbol itself is zero.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Naturality of the Milnor differential symbol

`MotivicEtaleKTheory:M.5d/milnor-symbol-natural` — lemma.

For every field homomorphism f:F→E, dlog_E∘K_n^M(f)=Ω^n(f)∘dlog_F as additive homomorphisms; Ω^n(f) is semilinear over f.

Proof or construction:

1. Check the formula on every symbol using logarithmic-one-form-natural and the imported DD.2 pullback on pure wedges.
2. Use the symbol generators in the imported T.2 presentation to extend equality to the entire additive group.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.5d/milnor-differential-symbol`, `MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural`, `DerivedDeRhamCohomology:DD.2`.

Acceptance:

- Identity and composite field maps agree with the imported functor laws.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Products of differential symbols

`MotivicEtaleKTheory:M.5d/milnor-symbol-product` — lemma.

For x∈K_i^M(F) and y∈K_j^M(F), dlog(xy)=dlog(x)∧dlog(y) in Ω_F^(i+j), with x placed before y.

Proof or construction:

1. On symbols the T.2 product concatenates the ordered lists.
2. The DD.2 exterior product concatenates the corresponding pure wedges.
3. Extend by additivity in each variable; the empty list agrees with the multiplicative identity.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.5d/milnor-differential-symbol`, `DerivedDeRhamCohomology:DD.2`.

Acceptance:

- Degree-zero multiplication is integer scalar multiplication on forms.
- In degree (1,1) the value is da/a∧db/b with that order.

Source: Kbook2013, III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259).

### Characteristic annihilates absolute forms

`MotivicEtaleKTheory:M.5d/characteristic-annihilation` — lemma.

For every n≥0 and every ω∈Ω_F^n in characteristic p, pω=0.

Proof or construction:

1. The exterior power is an F-module.
2. Identify p-fold addition with multiplication by (p:F)=0. This is a scalar calculation and does not use BGK.

Prerequisites: `mathlib:exteriorPower.ιMulti`.

Acceptance:

- In degree zero this is p·a=0 in F.

Source: BK1986, §2 opening definition of k_q(F) and differential symbol, printed p.113 (PDF p.8).

### Differential symbol modulo p

`MotivicEtaleKTheory:M.5d/mod-p-differential-symbol` — construction.

Write k_n(F)=K_n^M(F)/pK_n^M(F), the additive quotient by the range of multiplication by p. Define modPSymbol:k_n(F)→Ω_F^n as the unique map whose composite with reduction is differentialSymbol.

Proof or construction:

1. For x∈K_n^M(F), additivity gives dlog(px)=p dlog(x)=0 by characteristic-annihilation.
2. Apply the existing additive quotient lift.
3. Surjectivity of reduction gives uniqueness; the pure-symbol formula is inherited.

Prerequisites: `MotivicEtaleKTheory:M.5d/milnor-differential-symbol`, `MotivicEtaleKTheory:M.5d/characteristic-annihilation`, `mathlib:QuotientGroup.lift`, `mathlib:QuotientGroup.mk'`.

API:

- `modPSymbol_reduce`: modPSymbol([x])=differentialSymbol(x).
- `modPSymbol_unique`: An additive map k_n(F)→Ω_F^n whose composite with reduction is dlog equals modPSymbol.
- `modPSymbol_symbol`: The class of {a₁,…,a_n} maps to the wedge of the logarithmic differentials.

Unit tests:

- `modPSymbol_test_zero` (degenerate): The class of the empty symbol maps to 1, even in characteristic p.
- `modPSymbol_test_p_multiple` (computation): For any x the class of px maps to zero.
- `modPSymbol_test_one` (compatibility): The class of {a} maps to a⁻¹ da under the degree-one exterior equivalence.

Source: BK1986, §2 opening display, printed p.113 (PDF p.8).

### Artin–Schreier differential operator

`MotivicEtaleKTheory:M.5d/artin-schreier-differential` — construction.

Let B_F^0=0 and B_F^n=dΩ_F^(n−1) for n>0 as ADDITIVE subgroups. Import the ordinary de Rham differential and inverse Cartier C⁻¹:Ω_F^n→Ω_F^n/B_F^n. Define the additive homomorphism wp=C⁻¹−projection. Its logarithmic coefficient formula is the next lemma. In general wp is not F-linear.

Proof or construction:

1. Use the actual exterior-power carriers and DD.2 differential and additive quotient.
2. Use the DD.3 Frobenius-semilinear inverse Cartier, with its value on logarithmic wedges.
3. Subtract the additive quotient projection. The sign is opposite to BK’s 1−C⁻¹ and has exactly the same kernel.

Prerequisites: `DerivedDeRhamCohomology:DD.2`, `DerivedDeRhamCohomology:DD.3`, `MotivicEtaleKTheory:M.5d/logarithmic-one-form`, `mathlib:QuotientGroup.lift`, `mathlib:QuotientGroup.mk'`.

API:

- `artinSchreier_apply`: wp(ω)=C⁻¹(ω)−[ω].
- `artinSchreier_logarithmic`: For x∈F and units a_i, wp(x∧_i dlog(a_i))=[(x^p−x)∧_i dlog(a_i)].
- `artinSchreier_add`: wp(ω+η)=wp(ω)+wp(η).

Unit tests:

- `artinSchreier_test_zero` (degenerate): In degree zero wp(0)=0.
- `artinSchreier_test_unit` (computation): In degree zero wp(1)=0.
- `artinSchreier_test_not_zero_map` (non-example): If x^p≠x in F then wp(x)≠0 in degree zero, since B_F^0=0.

Source: Kbook2013, Definition III.7.7.1, printed p.251 (PDF p.259).

### Artin–Schreier operator on logarithmic wedges

`MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula` — lemma.

For p prime, F of characteristic p, n≥0, x∈F and units a₁,…,a_n, wp(x dlog(a₁)∧…∧dlog(a_n)) is the class of (x^p−x)dlog(a₁)∧…∧dlog(a_n) in Ω_F^n/B_F^n. For n=0 the wedge is 1 and B_F^0=0.

Proof or construction:

1. Apply the requested DD.3 inverse Cartier formula on logarithmic wedges, including its Frobenius action on the scalar.
2. Subtract the ordinary quotient projection and use additivity. This does not require exact forms to be an F-subspace: each form is scaled before taking its additive quotient class.

Prerequisites: `MotivicEtaleKTheory:M.5d/artin-schreier-differential`, `DerivedDeRhamCohomology:DD.3`, `MotivicEtaleKTheory:M.5d/logarithmic-one-form`.

Acceptance:

- For coefficient 1 the result is zero.
- Degree zero recovers x^p−x, so a non-Frobenius-fixed x detects the sign and nonzero operator.

Source: Kbook2013, Definition III.7.7.1, printed p.251 (PDF p.259).

### Logarithmic differential forms

`MotivicEtaleKTheory:M.5d/logarithmic-differential-group` — definition.

Define ν_n(F)=ker(wp:Ω_F^n→Ω_F^n/B_F^n) as an additive subgroup of Ω_F^n. Its elements satisfy C⁻¹ω=[ω]. The field-map action is the restriction of DD.2 pullback; it preserves the kernel by naturality of inverse Cartier. No F-module structure on ν_n is asserted.

Proof or construction:

1. Take the existing AddMonoidHom kernel of artinSchreier.
2. Use DD.2 pullback on forms and DD.3 Cartier naturality to restrict pullback to this subgroup.
3. Prove equality in the subgroup by equality of underlying forms; pullback identity and composition follow from DD.2.

Prerequisites: `MotivicEtaleKTheory:M.5d/artin-schreier-differential`, `DerivedDeRhamCohomology:DD.2`, `DerivedDeRhamCohomology:DD.3`, `mathlib:MonoidHom.ker`.

API:

- `logarithmicForms_mem`: ω lies in ν_n(F) exactly when C⁻¹ω=[ω].
- `logarithmicFormsMap`: For a field map f:F→E of characteristic p, restrict Ω^n(f) to an additive map ν_n(F)→ν_n(E).
- `logarithmicFormsMap_coe`: The underlying form of the image is Ω^n(f)(ω).
- `logarithmicFormsMap_id`: The identity field map induces the identity on ν_n.
- `logarithmicFormsMap_comp`: The map on ν_n for g∘f is the composite of those for f and g.

Unit tests:

- `logarithmicForms_test_zero` (degenerate): The zero form belongs to ν_n(F) in every degree.
- `logarithmicForms_test_degree_zero` (characterisation): Under Ω_F^0=F, x∈ν_0(F) if and only if x^p=x.
- `logarithmicForms_test_not_F_submodule` (non-example): If x^p≠x, the scalar multiple x·1 does not belong to ν_0(F), though 1 does.

Source: BK1986, §2 definition of ν, printed p.113 (PDF p.8).

### Differential symbols are Cartier fixed

`MotivicEtaleKTheory:M.5d/differential-symbol-fixed` — lemma.

For every x∈K_n^M(F), differentialSymbol(x) belongs to ν_n(F).

Proof or construction:

1. For a symbol, apply the wp coefficient formula with coefficient 1: 1^p−1=0.
2. Extend over the additive symbol presentation; wp and dlog are additive.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.5d/milnor-differential-symbol`, `MotivicEtaleKTheory:M.5d/artin-schreier-differential`, `MotivicEtaleKTheory:M.5d/logarithmic-differential-group`, `MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula`.

Acceptance:

- The empty symbol is Cartier fixed.
- This proves membership, not injectivity or surjectivity.

Source: BK1986, §2 symbol ψ with codomain ν, printed p.113 (PDF p.8).

### Logarithmic symbol modulo p

`MotivicEtaleKTheory:M.5d/logarithmic-symbol` — construction.

Define logarithmicSymbol:k_n(F)→ν_n(F) by corestricting modPSymbol to the Cartier kernel. Its underlying form is the wedge of logarithmic differentials on each symbol. This construction makes no assertion yet that it is an isomorphism.

Proof or construction:

1. Choose a lift of a class along reduction only for proving membership, not for defining a different output.
2. Use modPSymbol_reduce and differential-symbol-fixed to show that the already-defined modPSymbol lands in the subgroup.
3. Corestrict the additive map; injectivity of subgroup inclusion gives uniqueness.

Prerequisites: `MotivicEtaleKTheory:M.5d/mod-p-differential-symbol`, `MotivicEtaleKTheory:M.5d/differential-symbol-fixed`, `MotivicEtaleKTheory:M.5d/logarithmic-differential-group`.

API:

- `logarithmicSymbol_coe`: The underlying differential form of logarithmicSymbol(x) is modPSymbol(x).
- `logarithmicSymbol_unique`: Any additive map k_n(F)→ν_n(F) with this underlying form equals logarithmicSymbol.
- `logarithmicSymbol_symbol`: The underlying form of the class of {a₁,…,a_n} is ∧_i dlog(a_i).

Unit tests:

- `logarithmicSymbol_test_zero` (degenerate): The class of the empty symbol maps to the element with underlying form 1∈F.
- `logarithmicSymbol_test_one` (compatibility): The class of {a} has underlying one-form a⁻¹ da.
- `logarithmicSymbol_test_repeated` (computation): The class of {a,a} has zero image in ν_2(F).

Source: BK1986, §2 definition of ψ preceding Theorem 2.1, printed p.113 (PDF p.8).

### Degree-zero differential comparison

`MotivicEtaleKTheory:M.5d/weight-zero-comparison` — theorem.

For every field F of characteristic p, logarithmicSymbol:k_0(F)→ν_0(F) is bijective; under k_0(F)=Z/p and ν_0(F)=F_p it is the identity on the prime field.

Proof or construction:

1. Use T.2 degree zero K_0^M(F)=Z and Int.range_nsmulAddMonoidHom to identify the reduction quotient with Z/p via Int.quotientZMultiplesNatEquivZMod.
2. Use exteriorPower.zeroEquiv and B_F^0=0 to identify the Cartier kernel with {x∈F:x^p=x}.
3. Use Subfield.mem_bot_iff_pow_eq_self to identify this set with the prime subfield; the empty-symbol formula sends 1 to 1. Its additive multiples exhaust that subfield.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.5d/logarithmic-symbol`, `MotivicEtaleKTheory:M.5d/artin-schreier-differential`, `mathlib:exteriorPower.zeroEquiv`, `mathlib:Int.range_nsmulAddMonoidHom`, `mathlib:Int.quotientZMultiplesNatEquivZMod`, `mathlib:Subfield.mem_bot_iff_pow_eq_self`, `MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula`, `mathlib:mem_bot_iff_intCast`.

Acceptance:

- For F=F_p the map is the identity Z/p→F_p.
- For F=F_p(t), the target is F_p, not all of F.

Source: Kbook2013, Theorem III.7.7.2, n=0 specialization, printed p.251 (PDF p.259).

### Positive-degree forms over a perfect field

`MotivicEtaleKTheory:M.5d/perfect-field-differentials` — lemma.

Assume the pth-power map on F is surjective. For every n>0, Ω_F^n=0.

Proof or construction:

1. For each a∈F choose b with a=b^p. Derivation.leibniz_pow and characteristic p give da=0.
2. KaehlerDifferential.span_range_derivation shows Ω_(F/Z)=0.
3. Pure wedges span Ω_F^n; when n>0 every pure wedge has a zero slot, so all vanish.

Prerequisites: `mathlib:Derivation.leibniz_pow`, `mathlib:KaehlerDifferential.span_range_derivation`, `mathlib:exteriorPower.ιMulti_span`, `MotivicEtaleKTheory:M.5d/characteristic-annihilation`, `mathlib:AlternatingMap.map_coord_zero`.

Acceptance:

- Applies to finite fields and algebraic closures of F_p.
- The hypothesis n>0 is necessary: Ω_F^0=F.

Source: BK1986, Corollary 2.2.1 base field, printed p.114 (PDF p.9).

### Milnor groups modulo p over a perfect field

`MotivicEtaleKTheory:M.5d/perfect-field-milnor-mod-p` — lemma.

If the pth-power map on F is surjective, then k_n(F)=0 for every n>0, independently of BGK.

Proof or construction:

1. Every Milnor group is generated additively by symbols from T.2.
2. For a symbol in positive degree, choose a pth root b of its first unit entry; b is nonzero.
3. Multilinearity gives {b^p,a₂,…,a_n}=p{b,a₂,…,a_n}; reduction kills it.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `mathlib:QuotientGroup.mk'`.

Acceptance:

- For F=F_p and n=1 this says F_p×/(F_p×)^p=0.
- The conclusion excludes n=0, where k_0(F)=Z/p.

Source: BK1986, Corollary 2.2.1 base field, printed p.114 (PDF p.9).

### Injectivity of the degree-one differential symbol

`MotivicEtaleKTheory:M.5d/weight-one-injectivity` — lemma.

For every field F of characteristic p, logarithmicSymbol:k_1(F)→ν_1(F) is injective.

Proof or construction:

1. Use the T.2 degree-one identification with F× to represent each class by a unit a.
2. If its image is zero, the logOne formula and invertibility of a give da=0.
3. Use the requested DD.3 degree-zero Cartier calculation ker(D:F→Ω_(F/Z))=F^p. Write a=b^p with b nonzero.
4. The unit class of b^p is p times that of b and is zero in k_1(F). This proves a trivial kernel, hence injectivity.

Prerequisites: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.5d/logarithmic-symbol`, `MotivicEtaleKTheory:M.5d/logarithmic-one-form`, `DerivedDeRhamCohomology:DD.3`, `mathlib:exteriorPower.oneEquiv`.

Acceptance:

- The exact kernel of a↦da/a is (F×)^p.
- For a perfect field both the source and positive-degree target vanish.

Source: Kbook2013, Theorem III.7.7.2, degree-one injectivity specialization, printed p.251 (PDF p.259).

## Remaining scoped work

The inventory below retains the original stage targets. A partial record means the stage and audit were read but the source proof was not completed, not that its targets were dropped. A continuation must turn these items into declaration-sized nodes and exact supplier imports, while retaining the present eighteen node identifiers.

### MotivicEtaleKTheory:M.5d

- BGK injectivity: decompose BK Lemma 2.2 differential residue injection and the tame-symbol exact sequence modulo p without assuming unjustified left exactness; prove filtered-colimit compatibility; construct the finitely generated field as the residue of the specified DVR with purely transcendental fraction field.
- BGK relative argument: define k_q(R) as the kernel of residues to k_(q−1), its unit-symbol presentation and specialization (Lemma 2.3.2); define ν_R and its relative kernel; prove the commutative diagram (2.3.1). These are not the naive Milnor K-groups of an arbitrary ring.
- BGK Proposition 2.4: prove norm/trace compatibility and prime-to-p descent, construct the adapted p-basis, decompose Lemma 2.5 and equation (2.6) using Kato 1982 §1, then supply the relative Cartier diagram and finite lexicographic elimination. None is replaced by an opaque injectivity hypothesis.
- BGK surjectivity: acquire and read Kato 1982 §1; split its elimination argument into declaration-sized nodes. The Fesenko supplement is read but its three recorded defects and the omitted underlying inputs prevent a closure claim.
- Prime powers in residue characteristic: read Illusie I(5.7.5), build the de Rham–Witt logarithmic exact sequence with its owner, and decompose BK Corollary 2.8 including the Tor argument. The top coefficient row is initially only right exact.
- Prime-to-characteristic branch: source and decompose the compatible ℓ^r Bockstein induction from M.5c, filtered colimits, and the permitted inseparable/characteristic reductions. Do not identify this branch with BGK or with all-degree integral Quillen K-theory.

### MotivicEtaleKTheory:M.6

- Read and decompose the motivic filtered K-theory spectrum and its layer equivalences, convergent motivic spectral sequence, Adams rational weight splitting and the Chern-character comparison with S.7; coordinate M.6a/M.6b and import generic S.6 operations. No filtered spectrum is built here.

### MotivicEtaleKTheory:M.6a

- Read the support/coniveau tower construction on its precise class of schemes, moving and localization arguments for the layer identification, and comparison of global models. Import S.4 coniveau machinery with exact nodes; no such source proof is decomposed in this checkpoint.

### MotivicEtaleKTheory:M.6b

- Read the exact-couple construction and boundedness/completeness hypotheses giving convergence, multiplicative structure and Adams operations, then rational weight splitting. Import generic exact couples from H.6 and operations from S.6 after checking source conventions.

### MotivicEtaleKTheory:M.7

- Read and decompose étale K-theory and descent, the rigidity comparison supplied by L.2, the exact Quillen–Lichtenbaum comparison range with cohomological-dimension hypotheses, number-field arithmetic degree consequences, and real-place/2-primary corrections. The BGK branch alone gives none of these comparison spectra.

### MotivicEtaleKTheory:M.8

- Read and decompose arithmetic K-theory étale and Deligne Chern maps and their products, residues and norms; separate integral motivic groups, torsion-free lattices and rational integral parts; specify Tate/elliptic Galois realizations and Frobenius polynomials; state Euler-factor norm relations and prove regulator compatibility.
- Apply, rather than rebuild, generic Selmer complexes/local conditions from SelmerIwasawaCohomology:L2/L4 and determinant/base-change infrastructure from PadicMeasuresIwasawaAlgebras:L5. Retain the D.2/D.5 p-adic comparison inputs and the accepted RS-08 arithmetic K-theory boundary. The current L2/L3 measure and pseudomeasure packet supplies neither L5 nor these regulators.

## Supplier requests and acceptance boundaries

The DD.2 request supplies the generic differential, products, field maps and the absolute-base comparison on the exact existing carriers. The DD.3 request supplies inverse Cartier, its coordinate formula, naturality and ker(D)=F^p for arbitrary characteristic-p fields. A finite-type smooth statement without the passage to arbitrary fields is insufficient. The typed prototype distinguishes these operator stand-ins from the new logarithmic-symbol constructions; compiling them does not establish the supplier results.

The L5 request names the exact M.8 consumer although there is no M.8 node in this checkpoint. It asks for determinant lines of perfect complexes, their triangle and base-change laws, rational trivializations with divisors, and specialization with Tor. The request does not move this general algebra into M.8. No current M.5d node depends on L5, so no artificial dependency is inserted into the differential construction.

A successful implementation of the present tranche must compute the degree-zero map as the prime-field inclusion, recover a⁻¹ da in degree one, and kill Steinberg pairs in degree two even when p=2. It must allow a nonzero logarithmic differential when da≠0. It must distinguish ν_0(F) from F for an imperfect field such as F_p(t), and distinguish the positive-degree vanishing over a perfect field from the nonzero degree-zero group. Those tests reject the zero-symbol map, an incorrect degree-zero convention, an F-linear Cartier operator, and the replacement of its kernel by exact forms.

None of these tests proves BGK in all degrees. None constructs the higher étale comparison spectra in M.7. In particular the Geisser–Levine theorem about Quillen K-theory in characteristic p is not interchangeable with the Milnor differential theorem; a consumer needing that theorem still needs its distinct source and owner route.

## Recorded source issues

The findings concern the publisher's 2000 appendix, with the hash recorded in the packet. They are proposed findings awaiting independent review. The corresponding passages in the original Bloch–Kato paper give the intended conventions. The publisher's table of contents and targeted correction searches were checked; no published correction was located, and novelty is not asserted.

- `MotivicEtaleKTheory/E1`, A2.2, printed p.40 (PDF p.10), definition of k_n(O): The defining map is the tame residue k_n(E)→k_(n−1)(k). The subsequent specialization from its kernel to k_n(k) is a separate map. The residue decreases degree. Bloch–Kato (2.3), printed p.114, displays the degree-(q−1) target explicitly; confusing it with specialization destroys the diagram.

- `MotivicEtaleKTheory/E2`, A2.2, printed p.40 (PDF p.10), definition of ν_n(O): Label the arrow 1−C⁻¹ (or its negative), rather than leaving a quotient projection as the only evident map. BK (2.3), printed p.114, specifies 1−C⁻¹. The kernel of projection in degree zero is zero, whereas the logarithmic kernel contains 1. The intended arithmetic target would be lost.

- `MotivicEtaleKTheory/E3`, A2.1 Definitions–Properties (1), printed p.36, followed by the ordering of S in the proof on p.37 (PDF pp.6–7): Use the lexicographic order of BK Proposition 2.4, printed p.115, and recheck every lower-term assertion against that order. This identifies the failed enumeration, not a certification of the whole supplementary proof. The printed componentwise strict partial order does not totally order increasing tuples: (1,4) and (2,3) are incomparable. Consequently all increasing 2-tuples from four indices cannot be enumerated as the asserted strict chain.

## Suggested Lean and verification

The suggested file uses the actual Mathlib tensor products, quotient modules, Kaehler modules and exterior powers. It gives typed forms of all eighteen nodes, all twenty-four API entries and all twenty-one examples, including the coefficient formula promoted to its own lemma because the Cartier-fixedness argument consumes it. Only the imported Milnor operations and generic differential/Cartier operators are stand-ins, clearly labelled with their supplier. No proposition-valued placeholder stands in for a K-theory spectrum, tower or regulator.

The file elaborates with Lean 4.34.0-rc2 with zero errors and 66 placeholder-proof warnings. Its one Tau Ceti import was freshly built from the pinned source; all 1,978 reached Mathlib source files matched the pinned tree byte for byte. This checks types and instances; it proves no roadmap theorem. The unmodified blueprint checker with the pinned declaration index reports zero errors and zero warnings. The handoff records publication guards and the exact outstanding proof work.
