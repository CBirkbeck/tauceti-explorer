# Néron models and semistable abelian varieties

This roadmap develops finite-type Néron models of abelian varieties over
arithmetic Dedekind bases, their non-affine special fibres, and the integral
geometry behind semistability, monodromy, conductors and local Euler factors.
The objects are schemes and group schemes, not packages of asserted results.
The marked generic fibre and the test category in the mapping property are
part of the data. The document is definitive; the suggested Lean file is a
signature aid and asserts no implementation.

## Conventions and ownership

Write S for a connected Dedekind scheme, η for its generic point and K for its
fraction field. Local statements use a DVR R, residue field k and fraction
field K. Henselian, complete, excellent, perfect-residue and finite-residue
hypotheses are stated separately: none is implicit in the word DVR. An
abelian variety has dimension g. In a semistable special fibre let t denote
toric rank and a the dimension of the abelian quotient, so g=t+a.

The Néron mapping property tests every smooth S-scheme. Testing only étale
schemes or strict-henselian points is the weak-model condition and does not
establish the smooth-test property. The finite-type convention agrees with
BLR Chapter 1: smoothness plus quasi-compactness, not an unbounded lft model.
The prototype's abstract morphism j:η→S does not assert arithmetic existence
for an arbitrary j. Arithmetic existence is the separate DVR/Dedekind target.

The identity component is an open group of the special fibre. It need not be
affine: at good reduction it is an abelian variety. The component quotient Φ
is a finite étale group scheme; Φ(k) is not its geometric group with Galois
action forgotten. Character lattices are contravariant. For a nodal curve
their graph realization is H₁ of the dual graph, not H¹ under an unrecorded
self-duality. Loops and parallel edges are retained.

Homological Tate modules and their cohomological dual H¹ are distinguished.
The local factor uses geometric Frobenius on H¹ inertia invariants and retains
the full monodromy operator. Prime-to-residue fixed-point statements do not
extend to the residue prime. Multiplicative-valued valuation v(Δ)=1 in the
native Weierstrass predicate means additive order ord(Δ)=0, not order one.

Abelian-scheme and relative Picard carriers are imported from
AbelianSchemesAndArithmeticModuli and upstream JacobianChallenge. Generic
group/character/biextension and 1-motive machinery belongs to the early
semi-abelian prefix of ShimuraCompactifications. Formal and rigid geometry
comes from AdicSpaces Part II. Upstream EllipticCurves owns minimal equations
and its algorithm; StableReduction owns curve-model existence and numerical
intersection constructions. ArithmeticGaloisRepresentations and PadicHodgeTheory
own representation, conductor, compatible-system and comparison machinery.
This roadmap supplies geometric inputs, rather than constructing these again.

The pointed elliptic Kodaira dictionary is in R11.2: multiplicities, actual
components and intersections, identity groups and geometric component groups.
Numerical symbols alone do not provide it. General genus-one torsors, multiple
fibres, quasi-elliptic models and rational-surface classifications belong to
Néron models Part II. Its existing finite pinching node supplies the BGW
one-node curve; no second Ferrand construction is made here. Modularity,
level-lowering, isogeny-height and finiteness theorems remain downstream users.

## The six layers

Each named declaration below states its mathematical output, exact hypotheses,
proof inputs and discriminating acceptance tests. An API item used as a
prerequisite has its own lemma node. Unresolved source proofs and absent
carriers have explicit names in the closure register, rather than being
assumed through a conclusion-valued field.

| Layer | Objects and results | Declarations |
|---|---|---|
| R11.1 | Mapping property, arithmetic existence and differentials | 15 |
| R11.2 | Special fibres and the geometric elliptic dictionary | 10 |
| R11.3 | Semistability, inertia and Raynaud uniformisation | 12 |
| R11.4 | Singular Picard geometry and integral monodromy | 16 |
| R11.5 | Reduction criteria, conductors and local factors | 8 |
| R11.6 | Functorial exports and equation-to-scheme comparisons | 17 |

## R11.1. Mapping property, arithmetic existence and differentials

### Néron mapping property

Declaration: TauCeti.NeronBlueprint.NeronMappingProperty. Node: mapping-property. Kind: definition.

For X over S define NMP(j,X) to mean: for every Y over S with Smooth(Y→S), the restriction map Hom_S(Y,X)→Hom_eta(Y_eta,X_eta), formed by Over.pullback j, is bijective. Testing only sections or only étale test schemes is a weaker condition.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j.

Construction or proof route:

1. Use mathlib:CategoryTheory.Over.pullback to define generic restriction on actual Hom types.
2. Quantify over every smooth test object and express injectivity and surjectivity of that same map.

Prerequisites: mathlib:AlgebraicGeometry.Smooth; mathlib:CategoryTheory.Over.pullback.

Uses: BLR §1.2 Propositions 2 and 6: Unique extension is used for uniqueness, morphisms and group laws.

API outline:

- NeronMappingProperty.bijective (characterisation): NMP(j,X) gives bijectivity of restriction for any smooth Y over S.
- NeronMappingProperty.injective (extensionality): For smooth Y, equal restrictions of f,g:Y→X imply f=g.
- NeronMappingProperty.surjective (universal-property): Every morphism Y_eta→X_eta from a smooth test Y has an extension Y→X.
- NeronMappingProperty.existsUnique (universal-property): For every such generic f there is exactly one g with restriction g=f.
- NeronMappingProperty.hom_ext (extensionality): A specified equality of generic restrictions implies equality of the two S-morphisms.
- NeronMappingProperty.iff_existsUnique (equivalence): NMP is equivalent to unique extension of each generic morphism for every smooth test Y.
- NeronMappingProperty.of_iso (compatibility): An S-isomorphism X≅Xprime transports NMP(j,X) to NMP(j,Xprime).
- NeronMappingProperty.identityRestriction (simp): If X is smooth and f:X→X restricts to the identity, f is the identity.
- NeronMappingProperty.not_of_restriction_not_injective (characterisation): A single smooth test Y whose restriction map is not injective refutes NMP.
- NeronMappingProperty.not_of_restriction_not_surjective (characterisation): A single smooth test Y whose restriction map is not surjective refutes NMP.

Unit tests:

- NeronMappingProperty.nonextendible_test (non-example): One specified nonextendible map from a smooth generic test refutes NMP.
- NeronMappingProperty.identity_test (characterisation): For smooth X, a generically identity endomorphism is identity.
- NeronMappingProperty.identity_base_test (degenerate): For j=id_S, every X over S has NMP; therefore existence for this degenerate j says nothing about arithmetic reduction.

Acceptance:

- One specified nonextendible map from a smooth generic test refutes NMP.
- For smooth X, a generically identity endomorphism is identity.
- For j=id_S, every X over S has NMP; therefore existence for this degenerate j says nothing about arithmetic reduction.

Sources: BLR-CH1, §1.2 Definition 1, printed p.12.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### Marked finite-type Néron model

Declaration: TauCeti.NeronBlueprint.NeronModel. Node: marked-model. Kind: definition.

A marked Néron model of A over eta is X over S, an isomorphism alpha:X_eta≅A, Smooth(X→S), IsSeparated(X→S), QuasiCompact(X→S), and NMP(j,X). Smoothness supplies locally finite presentation; quasi-compactness enforces the finite-type convention. Arithmetic existence restricts j to the generic inclusion of a connected Dedekind scheme and A to an abelian variety. A merely locally finite-type model is not this object.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j.

Construction or proof route:

1. Bundle actual Over objects and the marked generic isomorphism.
2. Use the three native morphism classes and NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property; do not replace the scheme by a collection of conclusions.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property; mathlib:AlgebraicGeometry.Smooth; mathlib:AlgebraicGeometry.IsSeparated; mathlib:AlgebraicGeometry.QuasiCompact.

Uses: BLR §1.2 Proposition 2: Markings determine the unique isomorphism of two Néron models. YZ §1.1: The smooth model gives an integral invariant-differential module.

API outline:

- NeronModel.smooth_model (projection): The model morphism is smooth.
- NeronModel.separated_model (projection): The model morphism is separated.
- NeronModel.quasiCompact_model (projection): The model morphism is quasi-compact.
- NeronModel.mappingProperty (projection): The model has NMP for the specified j.
- NeronModel.generic_hom_inv (simp): alpha.hom followed by alpha.inv is identity on the generic model.
- NeronModel.generic_inv_hom (simp): alpha.inv followed by alpha.hom is identity on A.
- NeronModel.hom_ext (extensionality): For smooth Y, equality after restriction and alpha implies equality of maps Y→X. Promoted as NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model-hom-ext.
- NeronModel.extension_existsUnique (universal-property): Every f:Y_eta→A for smooth Y has exactly one g:Y→X with g_eta followed by alpha equal to f.
- NeronModel.genericIso_isIso (instance): The marked generic morphism alpha.hom is an isomorphism.
- NeronModel.identity_unique (simp): A model endomorphism whose marked restriction equals alpha is identity.

Unit tests:

- NeronModel.structure_test (characterisation): The underlying model is simultaneously smooth, separated and quasi-compact.
- NeronModel.hom_ext_test (characterisation): For model endomorphisms, equality of unmarked generic restrictions implies equality.
- NeronModel.marking_test (compatibility): The marked generic isomorphism composes with its inverse to identity.

Acceptance:

- The underlying model is simultaneously smooth, separated and quasi-compact.
- For model endomorphisms, equality of unmarked generic restrictions implies equality.
- The marked generic isomorphism composes with its inverse to identity.

Sources: BLR-CH1, §1.2 Definition 1 and Proposition 2, printed pp.12–13.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### Extension of generic morphisms

Declaration: TauCeti.NeronBlueprint.NeronModel.extend. Node: extend. Kind: construction.

Given M:NeronModel(j,A), a smooth Y over S and f:Y_eta→A, construct extend_M(Y,f):Y→M by unique extension, with restriction followed by M.alpha equal to f.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j. Y→S is smooth.

Construction or proof route:

1. Compose f with the inverse marking to target M_eta.
2. Apply NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property existence and uniqueness; prove all functorial identities by generic restriction and hom_ext.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model; NeronModelsAndSemistableAbelianVarieties:R11.1/mapping-property.

Uses: BLR §1.2 Propositions 2 and 6: Homomorphisms and the unique group laws are constructed by extension.

API outline:

- NeronModel.extend_restrict (universal-property): The marked restriction of extend_M(Y,f) is f.
- NeronModel.extend_unique (universal-property): Any map with marked restriction f equals extend_M(Y,f).
- NeronModel.extend_map (simp): Extending the marked restriction of a given S-map returns that map.
- NeronModel.extend_identity (simp): Extending the model marking from the model itself returns identity.
- NeronModel.extend_precomp (functoriality): For smooth Z,Y and g:Z→Y, extending f after g_eta is g followed by extending f.
- NeronModel.extend_proof_irrel (compatibility): The extension does not depend on the chosen proof that Y is smooth.
- NeronModel.extend_to_model (compatibility): The extension from another marked model N of A has generic restriction compatible with both markings.
- NeronModel.extend_comp_model (functoriality): The extensions P→N→M equal the extension P→M for three marked models of A.
- NeronModel.extend_inverse_model (simp): The canonical extensions between two models are inverse morphisms. Promoted as NeronModelsAndSemistableAbelianVarieties:R11.1/extend-extend-inverse-model.
- NeronModel.extend_isIso (instance): The canonical extension between two marked models of A is an isomorphism.

Unit tests:

- NeronModel.extend_identity_test (characterisation): Extending the marking returns the identity.
- NeronModel.extend_inverse_test (compatibility): The two canonical extensions between two models compose to identity.
- NeronModel.extend_restrict_test (characterisation): Extension of an arbitrary generic test map has precisely that marked restriction.

Acceptance:

- Extending the marking returns the identity.
- The two canonical extensions between two models compose to identity.
- Extension of an arbitrary generic test map has precisely that marked restriction.

Sources: BLR-CH1, §1.2 Proposition 2, printed p.13.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### NeronModel.hom_ext

Declaration: TauCeti.NeronBlueprint.NeronModel.hom_ext. Node: marked-model-hom-ext. Kind: lemma.

For smooth Y, equality after restriction and alpha implies equality of maps Y→X.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j.

Construction or proof route:

1. Unpack the parent construction and compare actual generic restrictions.
2. Use bijectivity for existence/cancellation; use the marking inverse and functor identity/composition for the stated equation.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model.

Acceptance:

- Specialize the precise types and markings in the parent definition; no extra arithmetic hypothesis is silently added.

Sources: BLR-CH1, §1.2 Definition 1 and Proposition 2, printed pp.12–13.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### NeronModel.extend_inverse_model

Declaration: TauCeti.NeronBlueprint.NeronModel.extend_inverse_model. Node: extend-extend-inverse-model. Kind: lemma.

The canonical extensions between two models are inverse morphisms.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j. Y→S is smooth.

Construction or proof route:

1. Unpack the parent construction and compare actual generic restrictions.
2. Use bijectivity for existence/cancellation; use the marking inverse and functor identity/composition for the stated equation.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/extend.

Acceptance:

- Specialize the precise types and markings in the parent definition; no extra arithmetic hypothesis is silently added.

Sources: BLR-CH1, §1.2 Proposition 2, printed p.13.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### Uniqueness of marked Néron models

Declaration: TauCeti.NeronBlueprint.NeronModel.unique_iso. Node: unique-iso. Kind: theorem.

For M,N marked models of the same A and j, there exists exactly one S-isomorphism e:M≅N with e_eta followed by N.alpha equal to M.alpha.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j.

Construction or proof route:

1. Extend each marking to the other model using NeronModelsAndSemistableAbelianVarieties:R11.1/extend.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.1/extend-extend-inverse-model for inverse identities, and NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model-hom-ext for unique compatibility.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/extend; NeronModelsAndSemistableAbelianVarieties:R11.1/extend-extend-inverse-model; NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model-hom-ext.

Acceptance:

- Changing either marking changes the compatibility equation; an unmarked uniqueness statement is not sufficient.

Sources: BLR-CH1, §1.2 Proposition 2(a), printed p.13.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### Unique group structure on the Néron model

Declaration: TauCeti.NeronBlueprint.GroupLaw. Node: group-law. Kind: theorem.

The model of A has a unique commutative group-scheme law extending that of A; a K-homomorphism A→B extends uniquely to an S-homomorphism of models. Generic isogenies extend as homomorphisms, not automatically as finite flat maps.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Products of smooth test models are smooth. Extend multiplication, inverse and identity by NeronModelsAndSemistableAbelianVarieties:R11.1/extend.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model-hom-ext to prove associativity, commutativity and the unit/inverse laws and compatibility of homomorphisms.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/extend; NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model-hom-ext; AbelianSchemesAndArithmeticModuli:A1.

Acceptance:

- The extension of the zero homomorphism is zero; translations of scheme maps are not mistaken for group homomorphisms.

Sources: BLR-CH1, §1.2 Proposition 6, printed p.14.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Weak Néron model interface

Declaration: TauCeti.NeronBlueprint.WeakNeronModel. Node: weak-model. Kind: definition.

A marked weak Néron model of A over eta consists of a smooth separated quasi-compact X over S, a marking X_eta≅A, and bijectivity of Hom_S(Y,X)→Hom_eta(Y_eta,X_eta) for every étale Y over S. The arithmetic application takes j to be the generic inclusion of a DVR. This is not the all-smooth-test property and weak models alone need not be unique.

Hypotheses: S and eta are Mathlib schemes in one universe; j:eta→S is a fixed scheme morphism; all objects and morphisms are in Over S or Over eta. This abstract prefix does not assert existence for arbitrary j.

Construction or proof route:

1. Read BLR §1.2 Definition 1 and contrast its two test categories.
2. Record G-existence for the unresolved strict-henselian/étale equivalence and construction inputs.

Prerequisites: mathlib:AlgebraicGeometry.Smooth; mathlib:AlgebraicGeometry.IsSeparated; mathlib:AlgebraicGeometry.QuasiCompact; mathlib:CategoryTheory.Over.pullback; mathlib:AlgebraicGeometry.Etale.

Uses: BLR §1.3 Theorem1: The existence argument constructs weak models before the group/full mapping-property upgrade.

API outline:

- WeakNeronModel.smooth_model (projection): The weak model morphism is smooth.
- WeakNeronModel.separated_model (projection): The weak model morphism is separated.
- WeakNeronModel.quasiCompact_model (projection): The weak model morphism is quasi-compact.
- WeakNeronModel.generic_hom_inv (simp): The marking followed by its inverse is identity on the generic weak model.
- WeakNeronModel.generic_inv_hom (simp): The inverse marking followed by the marking is identity on A.
- WeakNeronModel.bijective (characterisation): For étale Y over S, the restriction map into the generic weak model is bijective.
- WeakNeronModel.injective (extensionality): For étale Y, equal restrictions of maps Y→X imply equality.
- WeakNeronModel.surjective (universal-property): For étale Y, every generic map into X_eta extends to X.
- WeakNeronModel.existsUnique (universal-property): For étale Y and f:Y_eta→A, exactly one g:Y→X has marked restriction f.
- WeakNeronModel.hom_ext (extensionality): For étale Y, equality of marked generic restrictions implies equality of maps Y→X.

Unit tests:

- WeakNeronModel.structure_test (characterisation): The weak model is smooth, separated and quasi-compact.
- WeakNeronModel.etale_extension_test (compatibility): A specified map from an étale generic test has exactly one marked extension.
- WeakNeronModel.identity_base_test (degenerate): For j=id_S, every smooth separated quasi-compact X over S admits a marked weak model of X; this degenerate case does not prove arithmetic existence.

Acceptance:

- The weak model is smooth, separated and quasi-compact.
- A specified map from an étale generic test has exactly one marked extension.
- For j=id_S, every smooth separated quasi-compact X over S admits a marked weak model of X; this degenerate case does not prove arithmetic existence.

Sources: BLR-CH1, §1.2 Definition 1, printed p.12.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-existence.

Suggested signature: present in the native Scheme/Over prefix; proofs remain admitted.
### Local weak-model smoothening target

Declaration: TauCeti.NeronBlueprint.Smoothening. Node: smoothening. Kind: theorem.

For an abelian variety A/K over an excellent DVR R, construct a smooth separated finite-type weak model through the boundedness and smoothening procedure, then upgrade a group weak model to the full mapping property by BLR §1.2 Criterion 9. This is a construction target with the unresolved G-existence proof, not a supplied theorem.

Hypotheses: R is an excellent DVR; K=Frac(R); A/K is an abelian variety.

Construction or proof route:

1. Use properness to obtain bounded A(K_sh).
2. Invoke the G-existence sequence: weak-model blowups, defect decrease, extension of multiplication, group-model saturation and Criterion 9. Do not infer full NMP from bijection on R-points.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/weak-model; NeronModelsAndSemistableAbelianVarieties:R11.1/group-law.

Acceptance:

- Must cover non-proper smooth test Y and positive residue characteristic, not only generic proper points.

Sources: BLR-CH1, §1.2 Criterion 9; §1.3 Theorem 1 and Corollary 2, printed pp.15–17.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-existence.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Local existence of Néron models

Declaration: TauCeti.NeronBlueprint.LocalExistence. Node: local-existence. Kind: theorem.

Every abelian variety over the fraction field of an excellent DVR has a finite-type Néron model over that DVR. No arbitrary smooth group or genus-one torsor existence is claimed.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. BLR §1.3 Corollary 2 applies boundedness of proper varieties to Theorem 1.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.1/smoothening with G-existence still open to deliver the full NMP.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/smoothening; NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Acceptance:

- An affine split torus needs the lft theory; it is not an example of this finite-type existence assertion.

Sources: BLR-CH1, §1.3 Theorem 1 and Corollary 2, printed pp.16–17.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-existence.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Spread an abelian variety to a dense open

Declaration: TauCeti.NeronBlueprint.SpreadAbelian. Node: spread-abelian. Kind: theorem.

For A/K and connected Dedekind S, there is a nonempty open U⊂S and an abelian scheme A_U with generic fibre A. Its group law and smooth proper fibres spread along with the scheme.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use finite presentation of equations and group morphisms, and shrink to enforce the group identities and smooth proper connected fibres.
2. BLR §1.4 Proposition 2 and Theorem 3 outline this; G-spreading retains the full proof input.

Prerequisites: AbelianSchemesAndArithmeticModuli:A1.

Acceptance:

- Only finitely many closed points lie outside U; a stalk-level morphism-spreading lemma alone cannot spread an abelian scheme.

Sources: BLR-CH1, §1.4 Proposition 2 and Theorem 3, printed pp.18–20.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-spreading.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### An abelian scheme is the Néron model

Declaration: TauCeti.NeronBlueprint.AbelianSchemeModel. Node: abelian-scheme-model. Kind: theorem.

An abelian scheme over S satisfies the full NMP, hence is the marked Néron model of its generic fibre. Good reduction at a closed point means an abelian scheme over the local DVR; this is not the equation predicate without a comparison.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Import pointed rigidity and the abelian scheme carrier.
2. Use the Weil-extension theorem cited by BLR §1.2 Proposition 8; keep G-Weil-extension explicit, then use NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Prerequisites: AbelianSchemesAndArithmeticModuli:A1; NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Acceptance:

- Over a complete DVR a good model is proper and its component group is zero.

Sources: BLR-CH1, §1.2 Proposition 8, printed p.15.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Dedekind local-to-global construction

Declaration: TauCeti.NeronBlueprint.DedekindGluing. Node: dedekind-gluing. Kind: theorem.

Suppose A extends to an abelian scheme over a dense open U⊂S and has finite-type local Néron models at the finitely many remaining closed points. These glue to a finite-type S-model with the full NMP. Apply to rings of integers and S-integers of number fields.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Spread each local model and its generic marking to a neighbourhood, using BLR Lemma 1.2/5.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso for overlap transition maps and their cocycle; glue via G-spreading and verify NMP locally.
3. Use the finite open cover, not infinitely many local pieces, to prove finite type.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/spread-abelian; NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence; NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model; NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Acceptance:

- The bad-place set is finite; localizations of the glued model recover the prescribed local models.

Sources: BLR-CH1, §1.2 Lemma 5; §1.4 Proposition 1 and Theorem 3, printed pp.14,18–20.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-spreading.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Étale and unramified base change

Declaration: TauCeti.NeronBlueprint.EtaleBasechange. Node: etale-basechange. Kind: theorem.

For an étale morphism Sprime→S of Dedekind schemes, base change of a Néron model is the Néron model of the base-changed generic variety. In the finite local case apply to an unramified extension of DVRs. Arbitrary ramified base change of the whole model is not asserted.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. A smooth Sprime-test scheme is smooth over S for an étale base change.
2. Use NMP to extend its generic morphism, then the structure morphism forces the extension over Sprime.
3. Separatedness and finite type survive base change.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/marked-model; NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Acceptance:

- Keep unramified versus ramified extensions distinct; the Tate I_n ramified example refutes a full-model assertion.

Sources: BLR-CH1, §1.2 Proposition 2(c), printed p.13.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Invariant-differential lattice

Declaration: TauCeti.NeronBlueprint.DifferentialLattice. Node: differential-lattice. Kind: construction.

For the global smooth group model M/S with identity e, define omega_M=e*Omega^1_(M/S). It is locally free of rank g, and its generic fibre identifies with invariant differentials of A/K. On S=Spec R this is a finite projective R-lattice inside the K-vector space, not necessarily a free module.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Pull back the relative cotangent sheaf along the identity, using G-relative-differentials.
2. Use group translation to compare this pullback with invariant differentials; restriction to opens yields the localization maps.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/group-law; NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing.

Uses: YZ §1.1: Defines the integral lattice for Faltings heights. ArakelovGeometryAndAbelianHeights:R35.2: Consumes the integral Hodge line and its localizations, but owns its archimedean metric.

API outline:

- NeronDifferentials.rank (structure): omega_M has rank dim A on connected S.
- NeronDifferentials.generic_iso (compatibility): omega_M tensor K is the invariant differential space of A.
- NeronDifferentials.localize (compatibility): omega_M localized at a finite place equals the invariant differential module of its local Néron model.
- NeronDifferentials.pullback (functoriality): An extended homomorphism f:M→N induces f*:omega_N→omega_M.
- NeronDifferentials.map_id (simp): Pullback along identity is identity.
- NeronDifferentials.map_comp (functoriality): Pullback along f followed by g equals pullback along g then f.
- NeronDifferentials.det (constructor): det omega_M is an invertible sheaf, the integral Hodge line.
- NeronDifferentials.det_localize (compatibility): The Hodge line localizes to the determinant of the local module.
- NeronDifferentials.etale_basechange (compatibility): Under allowed étale base change, the invariant differential module pulls back compatibly.
- NeronDifferentials.affine_colie (compatibility): On an affine group chart at e, omega identifies with ker epsilon/(ker epsilon)^2; this local comparison is not a global affine-model assertion.

Unit tests:

- NeronDifferentials.zero_dimension (degenerate): The zero abelian variety has zero differential module and trivial determinant.
- NeronDifferentials.localization_test (compatibility): Over a DVR with good elliptic reduction the minimal differential is a basis of omega_M.
- NeronDifferentials.projective_test (non-example): Over a Dedekind ring permit a nonprincipal invertible determinant; do not assert a global basis.

Acceptance:

- The zero abelian variety has zero differential module and trivial determinant.
- Over a DVR with good elliptic reduction the minimal differential is a basis of omega_M.
- Over a Dedekind ring permit a nonprincipal invertible determinant; do not assert a global basis.

Sources: YZ, §1.1, printed pp.534–535.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-relative-differentials.

Suggested signature: omitted, with exact names and inputs in the omission register below.

## R11.2. Special fibres and the geometric elliptic dictionary

### Identity component of the special fibre

Declaration: TauCeti.NeronBlueprint.IdentityComponent. Node: identity-component. Kind: construction.

Let M_k be the smooth finite-type special-fibre group. Construct its geometrically connected identity subgroup M_k^0 as an open and closed normal subgroup over k, and the open subgroup M^0⊂M with generic fibre A and special fibre M_k^0. Neither group is assumed affine.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used.

Construction or proof route:

1. Use the geometric connected component of the identity and descend it.
2. Build the open subgroup of the smooth model with precisely this special fibre. G-components records the missing non-affine group representability/descent proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/group-law.

Uses: SGA7 IX §1.1: Defines the identity group and the geometric component group used in monodromy.

API outline:

- NeronIdentity.open (structure): M_k^0 is open and closed in M_k.
- NeronIdentity.normal (structure): M_k^0 is normal, and commutative for abelian generic A.
- NeronIdentity.contains_zero (constructor): The identity section factors through M^0.
- NeronIdentity.geometrically_connected (characterisation): The geometric special fibre of M^0 is connected.
- NeronIdentity.generic_iso (compatibility): The generic fibre of M^0 is all of A.
- NeronIdentity.basechange_field (compatibility): Identity components commute with residue-field extension.
- NeronIdentity.map (functoriality): A homomorphism of models sends identity components into identity components.
- NeronIdentity.map_id (simp): Identity induces identity on M_k^0.
- NeronIdentity.map_comp (functoriality): Induced identity-component maps respect composition.
- NeronIdentity.good (compatibility): For an abelian-scheme model M^0=M.

Unit tests:

- NeronIdentity.good_test (degenerate): A good elliptic model has the entire special fibre as its identity component.
- NeronIdentity.split_tate_test (computation): For split multiplicative elliptic reduction M_k^0 is G_m although the proper regular fibre has several components when n>1.
- NeronIdentity.nonaffine_test (non-example): For a positive-dimensional good abelian variety the proper special fibre must not be treated as affine.

Acceptance:

- A good elliptic model has the entire special fibre as its identity component.
- For split multiplicative elliptic reduction M_k^0 is G_m although the proper regular fibre has several components when n>1.
- For a positive-dimensional good abelian variety the proper special fibre must not be treated as affine.

Sources: SGA7, Exposé IX §1.1, printed pp.321–322.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-components.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Finite étale component group

Declaration: TauCeti.NeronBlueprint.ComponentGroup. Node: component-group. Kind: construction.

Construct Phi_A=M_k/M_k^0 as a finite étale commutative k-group representing the fppf component quotient. Phi_A(k) is the Galois-fixed subgroup of Phi_A(k_sep), not the full geometric group in general.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used.

Construction or proof route:

1. Form the fppf quotient by the open identity subgroup; verify representability and finite étaleness using G-components.
2. Use descent for finite étale k-groups to identify rational points with Galois fixed points.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component.

Uses: CG Lemma A.7: The dual component group controls whether residual inertia invariants preserve dimension. Tate §6: Computes elliptic Tamagawa numbers from rational rather than merely geometric components.

API outline:

- NeronComponents.projection (constructor): There is a group morphism M_k→Phi_A.
- NeronComponents.kernel (characterisation): The projection kernel is M_k^0 as a group scheme.
- NeronComponents.quotient (universal-property): Maps of M_k constant on identity-component cosets factor uniquely through Phi_A.
- NeronComponents.finite_etale (structure): Phi_A is finite étale over k.
- NeronComponents.geometric (compatibility): Phi_A(k_sep) is the finite group of geometric connected components.
- NeronComponents.rational (characterisation): Phi_A(k)=Phi_A(k_sep)^Gal(k_sep/k).
- NeronComponents.map (functoriality): An extended homomorphism A→B induces Phi_A→Phi_B.
- NeronComponents.map_id (simp): The induced component map of identity is identity.
- NeronComponents.map_comp (functoriality): Component maps respect composition.
- NeronComponents.good (simp): An abelian-scheme model has zero component group.

Unit tests:

- NeronComponents.good_test (degenerate): Good reduction gives Phi_A=0, not one nonzero component class.
- NeronComponents.tate_test (computation): For split Tate parameter q with ord(q)=n>0, Phi_E(k_sep)=Z/nZ.
- NeronComponents.nonsplit_test (compatibility): For nonsplit multiplicative reduction, Frobenius acts by minus one on Z/nZ; its fixed subgroup can be smaller than n.

Acceptance:

- Good reduction gives Phi_A=0, not one nonzero component class.
- For split Tate parameter q with ord(q)=n>0, Phi_E(k_sep)=Z/nZ.
- For nonsplit multiplicative reduction, Frobenius acts by minus one on Z/nZ; its fixed subgroup can be smaller than n.

Sources: SGA7, Exposé IX §§1.1–1.2, printed pp.322–323.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-components.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Chevalley decomposition with field hypotheses

Declaration: TauCeti.NeronBlueprint.Chevalley. Node: chevalley. Kind: theorem.

Over a perfect residue field k, M_k^0 has a unique maximal smooth connected affine subgroup L with abelian quotient B. For commutative L, over k_sep decompose its toric and unipotent parts; record toric, abelian and unipotent dimensions. Over an imperfect field do not assert this exact smooth Chevalley form without extra hypotheses.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. k is perfect for the stated Chevalley decomposition.

Construction or proof route:

1. Apply the connected algebraic-group structure theorem to M_k^0, not the whole disconnected fibre.
2. Separate the generic Chevalley proof G-Chevalley from the special-fibre application and its dimension bookkeeping.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component.

Acceptance:

- Good reduction has toric/unipotent ranks zero; split multiplicative elliptic reduction has toric rank one and abelian rank zero.

Sources: CONRAD-SR, §2 Theorem 2.3 and discussion; §3.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Chevalley.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Toric character lattice interface

Declaration: TauCeti.NeronBlueprint.ToricCharacter. Node: toric-character. Kind: comparison.

For the maximal torus T of a semistable geometric identity fibre, use the supplier character group X*(T)=Hom(T,G_m) as a free integral lattice with residue Galois action. A model homomorphism f:A→B induces f_T:T_A→T_B and contravariant f_T*:X*(T_B)→X*(T_A).

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Restrict f to identity fibres and their maximal tori.
2. Apply the existing torus character anti-equivalence, retaining the Galois action; G-semiabelian-prefix retains the absent abstract supplier carrier.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component; NeronModelsAndSemistableAbelianVarieties:R11.2/chevalley.

Acceptance:

- For split G_m, X*=Z; an isogeny [m] pulls characters back by multiplication by m.

Sources: SGA7, Exposé IX §1.1; §§10.4–11.6.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Isogeny functoriality without false exactness

Declaration: TauCeti.NeronBlueprint.IsogenyComponents. Node: isogeny-components. Kind: theorem.

Every generic isogeny extends functorially to model, identity-fibre and component maps. If A is semistable, the induced map of connected special fibres to that of an isogenous B is an isogeny, and B is semistable. Do not infer that the whole model map is finite flat or that taking Néron models preserves an arbitrary short exact sequence.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.1/group-law and the universal property of NeronModelsAndSemistableAbelianVarieties:R11.2/component-group.
2. For the identity-fibre assertion use the dimension/finite-kernel argument of Conrad Theorem 4.1, with Chevalley and multiplication-by-n.
3. Respect the published counterexample cited by YZ-ERR; G-isogeny-sequences records any consumer-specific exactness input.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/group-law; NeronModelsAndSemistableAbelianVarieties:R11.2/component-group; NeronModelsAndSemistableAbelianVarieties:R11.2/chevalley.

Acceptance:

- A component-map kernel or cokernel must be computed, not inferred from the generic isogeny degree.

Sources: CONRAD-SR, Theorem 4.1; YZ erratum introduction.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-isogeny-sequences.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Elliptic reduction filtration comparison

Declaration: TauCeti.NeronBlueprint.EllipticFiltration. Node: elliptic-filtration. Kind: comparison.

For an elliptic curve over a complete DVR with perfect residue field, identify the equation subgroup E0(K) with M^0(R), and E1(K) with the kernel of reduction M^0(R)→M_k^0(k), equivalently the formal group on the maximal ideal. For finite k, E(K)/E0(K)≅Phi_E(k); over arbitrary k a rational lifting obstruction must be retained.

Hypotheses: R is a complete DVR, k perfect; for the full rational component quotient additionally k is finite. E/K is elliptic with its specified origin.

Construction or proof route:

1. Import the equation-level E0,E1 and formal group from EC4.
2. Use smooth lifting and the model mapping property to compare sections.
3. For finite k use Lang vanishing for the smooth connected identity group; G-Lang-lifting records the source/proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component; NeronModelsAndSemistableAbelianVarieties:R11.2/component-group; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- Complete finite-residue good reduction gives c=1; nonsplit multiplicative Phi(k) need not have geometric order.

Sources: TATE, §4 Theorems 4.1–4.2 and §6, printed pp.41–46.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Smooth locus of the elliptic minimal regular model

Declaration: TauCeti.NeronBlueprint.MinimalRegularSmoothLocus. Node: minimal-regular-smooth-locus. Kind: theorem.

For an elliptic curve E/K and its minimal proper regular model X/R, over a strictly henselian DVR with algebraically closed residue field, the relative smooth locus X_sm is the Néron model. The existence/minimality of X is supplied by StableReduction; identification with NMP is owned here.

Hypotheses: R is strictly henselian with algebraically closed residue field; E/K is elliptic; X is its minimal proper regular model.

Construction or proof route:

1. Import the pointed minimal regular model, not arbitrary torsor minimality.
2. Use BLR §1.5 Proposition 1; G-minimal-regular-NMP retains the cited desingularization proof and all wild cases.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence; tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models.

Acceptance:

- A component of multiplicity greater than one is not wholly in the relative smooth locus.

Sources: BLR-CH1, §1.5 Proposition 1, printed p.21.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Geometric Kodaira configurations

Declaration: TauCeti.NeronBlueprint.KodairaGeometricConfigurations. Node: kodaira-geometric-configurations. Kind: theorem.

Under the elliptic hypotheses of minimal-regular-smooth-locus, attach to each imported TateReductionSymbol the actual reduced component curves, singularities, intersections and multiplicities in X_k. I0 is a smooth genus-one curve; I1 is a nodal rational curve; II is a cuspidal rational curve. I_n (n≥2) is a cycle of n rational components, with a double intersection for n=2. III has two tangent rational components; IV has three rational components meeting at one point. The starred configurations have the affine D/E diagrams and multiplicities shown by Tate, not merely their vertex counts. For I0* use the affine D4 configuration with central multiplicity2 and four ends of multiplicity1. I_n* has four ends of multiplicity1 and n+1 inner components of multiplicity2. IV*, III*, II* have respective multiplicity multisets {1,1,1,2,2,2,3}, {1,1,2,2,2,3,3,4}, {1,2,2,3,3,4,4,5,6}, attached to the affine E6,E7,E8 diagrams. All components in these reducible configurations are smooth rational curves. The number m of geometric irreducible components of X_k is 1 for I0, I1 and II, n for I_n, 2 for III, 3 for IV, 5 for I0*, n+5 for I_n*, and 7, 8 and 9 for IV*, III* and II*. This row of Tate’s table lies above its characteristic restriction, so it holds in every residue characteristic. It identifies the count m that EllipticCurves Layer 4 reads off the ReductionSymbol, for its algorithmic exponent v(Δ) − m + 1, with the number of components of the minimal regular model (RT-AREA-algebraicgeometry/21).

Hypotheses: R is strictly henselian with algebraically closed residue field; E/K is elliptic; X is its minimal proper regular model.

Construction or proof route:

1. Resolve the minimal equation and compare with the unique minimal regular model.
2. Read the geometric part of Tate §6 table and retain G-Kodaira-resolution for all residue characteristics.
3. Use the confirmed RT-1/21 correction: neither an intersection numerical type nor a component count distinguishes I0,I1,II.
4. Use the SR4 resolution/intersection output and SR6 actual-model numerical-type comparison to verify the intersections and arithmetic genera of each configuration. Numerical type is a consequence, never the classifier.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/minimal-regular-smooth-locus; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces; tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.

Acceptance:

- I0/I1/II each have one component but different normalizations/singularities; I2 needs two edges, not a simple graph.
- Component counts (Tate §6, p.46): I_n has n components and I_n* has n+5; IV*, III* and II* have 7, 8 and 9; I0, I1 and II have one each, so the count alone does not determine the type.

Sources: TATE, §6 geometric table, printed p.46 (above its characteristic restriction).

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Geometric component groups by Kodaira type

Declaration: TauCeti.NeronBlueprint.KodairaComponentGroups. Node: kodaira-component-groups. Kind: theorem.

For algebraically closed residue k, identify Phi_E with 0 for I0, Z/n for I_n, 0 for II and II*, Z/2 for III and III*, Z/3 for IV and IV*, (Z/2)^2 for I_n* with n even, and Z/4 for I_n* with n odd. These are geometric groups; rational Tamagawa factors require residue descent.

Hypotheses: R is strictly henselian with algebraically closed residue field; E/K is elliptic; X is its minimal proper regular model.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations to select the multiplicity-one components meeting the smooth locus.
2. Compute their group law via the reduction map; G-Kodaira-resolution includes the proof of the table.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations; NeronModelsAndSemistableAbelianVarieties:R11.2/component-group; NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration.

Acceptance:

- I0* has group (Z/2)^2 despite five regular-fibre components; I1 has trivial geometric component group.

Sources: TATE, §6 geometric component-group row, printed p.46.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Wild primes retained in elliptic comparison

Declaration: TauCeti.NeronBlueprint.WildKodairaComparison. Node: wild-kodaira-comparison. Kind: comparison.

The geometric configuration and component-group comparison includes residue characteristic 2 and 3 via the imported full Tate algorithm. The tame discriminant valuations (II:2, III:3, IV:4, I0*:6, I_n*:n+6, IV*:8, III*:9, II*:10) and the tame additive conductor value 2 are not copied into those characteristics.

Hypotheses: R is strictly henselian with algebraically closed residue field; E/K is elliptic; X is its minimal proper regular model.

Construction or proof route:

1. Separate the geometric rows from the characteristic-restricted rows in Tate §6.
2. Use EC4 wild output for ord Delta and conductor rather than a tame short equation; retain G-Kodaira-resolution for the geometric comparison.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations; NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-component-groups; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- For any wild additive input, the comparison must permit a positive Swan correction.

Sources: TATE, §6 characteristic restriction and §7 algorithm, printed p.46; §7 not decomposed here.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution.

Suggested signature: omitted, with exact names and inputs in the omission register below.

## R11.3. Semistability, inertia and Raynaud uniformisation

### Semistable reduction predicate

Declaration: TauCeti.NeronBlueprint.SemistableReduction. Node: semistable-reduction. Kind: definition.

A/K has semistable reduction over R precisely when the connected special fibre M_k^0 of its Néron model is a semi-abelian variety: an extension of an abelian variety by a torus. Over perfect k this is equivalent to zero unipotent part. Good reduction requires an abelian model, not merely this condition.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used.

Construction or proof route:

1. Use the semi-abelian predicate/extension carrier owned by C4; G-semiabelian-prefix records its absent early carrier.
2. Apply it to the actual identity fibre, not to the whole disconnected fibre.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component; NeronModelsAndSemistableAbelianVarieties:R11.2/chevalley.

Uses: Conrad Theorem 4.2: The semistable reduction theorem targets this geometric predicate. BCGP25 Definition 9.1.7: Ordinarity refers to the abelian quotient of this fibre.

API outline:

- SemistableReduction.iff_identity (characterisation): Semistability is equivalent to the identity special fibre being semi-abelian.
- SemistableReduction.good (compatibility): Good reduction implies semistable reduction.
- SemistableReduction.no_unipotent (characterisation): Over perfect k, semistability is equivalent to a zero unipotent radical.
- SemistableReduction.dimension (structure): For semistable A of dimension g, toric rank t and abelian rank a satisfy g=t+a.
- SemistableReduction.isogeny (compatibility): Semistability is preserved under isogeny.
- SemistableReduction.dual (compatibility): A is semistable iff its dual is semistable.
- SemistableReduction.finite_basechange (compatibility): Semistability survives finite DVR extensions with the stated valuation hypotheses.
- SemistableReduction.identity_basechange (compatibility): For semistable A the base-change map on identity models is an isomorphism.
- SemistableReduction.toric_zero (characterisation): For a semistable A, toric rank zero is equivalent to good reduction.
- SemistableReduction.product (compatibility): A product has semistable reduction iff its factors do; use the product model and connected special fibres.

Unit tests:

- SemistableReduction.good_test (degenerate): A good elliptic curve has t=0,a=1.
- SemistableReduction.tate_test (computation): A split Tate curve is semistable with t=1,a=0 and is not good.
- SemistableReduction.additive_test (non-example): An additive elliptic identity fibre G_a over an algebraically closed residue field is not semi-abelian.

Acceptance:

- A good elliptic curve has t=0,a=1.
- A split Tate curve is semistable with t=1,a=0 and is not good.
- An additive elliptic identity fibre G_a over an algebraically closed residue field is not semi-abelian.

Sources: CONRAD-SR, §3 Definition 3.1; §4.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistability under isogeny

Declaration: TauCeti.NeronBlueprint.SemistabilityIsogeny. Node: semistability-isogeny. Kind: theorem.

For isogenous abelian varieties over K, semistability over R is equivalent; their toric and abelian ranks coincide and their connected special fibres are isogenous. No equality of integral component groups is claimed.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Apply NeronModelsAndSemistableAbelianVarieties:R11.2/isogeny-components and compare the smooth connected special-fibre dimensions.
2. Use generic quasi-inverses up to multiplication to bound kernels and apply the semi-abelian quotient criterion.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction; NeronModelsAndSemistableAbelianVarieties:R11.2/isogeny-components.

Acceptance:

- A generic isogeny of Tate curves can change the component group order.

Sources: CONRAD-SR, Theorem 4.1.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistable identity-model base change

Declaration: TauCeti.NeronBlueprint.SemistableIdentityBasechange. Node: semistable-identity-basechange. Kind: theorem.

For a semistable A/K and a finite extension of DVRs R→Rprime with fraction-field extension Kprime/K, the canonical map M^0 base changed to Rprime→N^0 is an isomorphism. This does not identify M base changed with the whole Néron model N.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use Conrad Proposition 4.4: a semi-abelian Rprime-model with abelian generic fibre is the identity model.
2. Apply uniqueness to the base-changed identity model and N^0; keep G-semiabelian-open-immersion for the Zariski-main proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction; NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Acceptance:

- For split I_n and ramification e, identity fibres remain G_m while components become Z/(en).

Sources: CONRAD-SR, Proposition 4.4, Corollary 4.5 and Example 4.6.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Ramified Tate component calculation

Declaration: TauCeti.NeronBlueprint.RamifiedTateCounterexample. Node: ramified-tate-counterexample. Kind: theorem.

For a split Tate curve over a complete DVR, ord_R(q)=n>0 implies geometric Phi=Z/n. Under ramification index e, Phi_new=Z/(en), and the canonical component map sends r mod n to er mod en. Thus full Néron-model base change fails in general.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Import the point uniformisation K*/q^Z from EC4.
2. Compute valuation modulo ord(q) and its scaling by e; compare through NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-identity-basechange; NeronModelsAndSemistableAbelianVarieties:R11.2/component-group; NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- For n=1,e=2 the old component group is zero and the new is Z/2, despite unchanged identity torus.

Sources: CONRAD-SR, Example 4.6.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Toric and finite Tate submodules

Declaration: TauCeti.NeronBlueprint.ToricFiniteFiltration. Node: toric-finite-filtration. Kind: theorem.

For semistable A over a henselian DVR and ell invertible in K, construct saturated G_K-stable submodules T_t⊂T_f⊂T_ell(A) of ranks t and t+2a. Here g=t+a and the corank of T_f is t. If additionally ell differs from char(k), T_f equals inertia invariants; that last equality is not asserted at the residue prime.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R henselian; A semistable; ell prime and ell≠char(K). Inertia-fixed equality requires ell≠char(k).

Construction or proof route:

1. Use the finite and toric parts of Néron-model ell-power torsion and smooth henselian decomposition.
2. Pass to inverse limits and use the height/rank calculation in Conrad Lemma 5.4.
3. Correct the printed corank slip recorded in sourceIssues/E1; retain G-finite-torsion for its finite-part geometry.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction; ArithmeticGaloisRepresentations:R01.6; AbelianSchemesAndArithmeticModuli:A3.

Acceptance:

- For pure toric g=t=1,a=0, finite rank is one and corank is one, not zero.

Sources: CONRAD-SR, §5 Lemma 5.4, printed p.18.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-finite-torsion.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Weil orthogonality of the filtration

Declaration: TauCeti.NeronBlueprint.Orthogonality. Node: orthogonality. Kind: theorem.

For semistable A, the perfect pairing T_ell(A)×T_ell(Adual)→Z_ell(1) identifies the finite part for A with the exact annihilator of the toric part for its dual; the quotient by the finite part is dual to that dual toric part. At ell=residue characteristic in mixed characteristic this uses p-divisible groups, not unramified inertia.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R henselian; A semistable; ell prime and ell≠char(K). Inertia-fixed equality requires ell≠char(k).

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration and the integral Weil pairing from R01.6/A3.
2. Follow Conrad Theorem 5.5 orthogonality proof; G-pdiv-orthogonality retains the Tate full-faithfulness leaf.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration; ArithmeticGaloisRepresentations:R01.6; AbelianSchemesAndArithmeticModuli:A3.

Acceptance:

- Ranks sum to 2g; preserve the Tate twist and saturation before reducing modulo ell.

Sources: CONRAD-SR, §5 Theorem 5.5 and proof.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistable inertia is unipotent of height two

Declaration: TauCeti.NeronBlueprint.InertiaSquareZero. Node: inertia-square-zero. Kind: theorem.

If A/R is semistable and ell≠char(k), every inertia sigma acts on T_ell(A) with (sigma−1)^2=0. The toric/finite filtration supplies a canonical factorization of sigma−1 through the toric part.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R henselian; A semistable; ell≠char(k).

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration to make the finite part inertia fixed.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality to make the quotient inertia fixed, so sigma−1 maps the quotient into the fixed finite part and has square zero.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration; NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality.

Acceptance:

- A Tate curve has nonzero monodromy but square-zero inertia increments; semisimplifying loses this datum.

Sources: CONRAD-SR, Remark 5.6.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Grothendieck semistability criterion

Declaration: TauCeti.NeronBlueprint.MonodromyCriterion. Node: monodromy-criterion. Kind: theorem.

For an abelian variety over a henselian DVR and ell≠char(k), A is semistable iff inertia acts unipotently on T_ell(A); the forward implication has exponent at most two. The converse is a geometric theorem, not a tautological definition.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R henselian; ell≠char(k).

Construction or proof route:

1. Forward: NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero.
2. Converse: Conrad Theorem 5.8/SGA7 IX criterion; G-monodromy-converse records the unresolved proof leaf separately.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero; ArithmeticGaloisRepresentations:R01.6.

Acceptance:

- No such unipotent-inertia criterion at ell=char(k); finite-level triviality is not full unramifiedness.

Sources: CONRAD-SR, Theorem 5.8; SGA7 IX introduction and §3.5.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistable reduction after finite extension

Declaration: TauCeti.NeronBlueprint.FiniteSeparableSemistableExtension. Node: finite-separable-semistable-extension. Kind: theorem.

For A over the fraction field of an excellent DVR, there exists a finite separable extension Kprime/K such that A_Kprime is semistable at the DVRs in the integral closure lying over R.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Apply quasi-unipotence from R01.2 to restrict inertia to an open unipotent subgroup.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.3/monodromy-criterion at each valuation. Alternatively Conrad reduces through Jacobians; that curve proof is not duplicated here.
3. Keep the normalisation/finite-DVR-extension proof G-valuations explicit.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/monodromy-criterion; ArithmeticGaloisRepresentations:R01.2.

Acceptance:

- The extension is separable; in an unhenselian base its integral closure may be semilocal, so check every prime above R.

Sources: CONRAD-SR, Theorems 4.2 and 5.8.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-valuations.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Prime-to-residue full level forces semistability

Declaration: TauCeti.NeronBlueprint.FiniteTorsionSemistability. Node: finite-torsion-semistability. Kind: theorem.

For N≥3 invertible in k, trivial inertia on A[N](K_sep) implies semistability over R. In particular, after adjoining full N-torsion one gets semistable reduction at all residue primes not dividing N. This does not claim good reduction.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use the square-zero/unipotent criterion and the torsion-freeness of the level-N kernel as in Conrad Theorem 6.5.
2. Keep G-level-kernel for the integral matrix argument; finite-level unramifiedness need not kill monodromy.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/monodromy-criterion; ArithmeticGaloisRepresentations:R01.6.

Acceptance:

- N=2 is excluded; a Tate curve with ord(q) divisible by N can have unramified N-torsion while remaining multiplicative.

Sources: CONRAD-SR, Theorem 6.5; Raynaud94 Proposition 4.7.1.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-level-kernel.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Raynaud formal extension comparison

Declaration: TauCeti.NeronBlueprint.RaynaudExtensionComparison. Node: raynaud-extension-comparison. Kind: theorem.

For a semistable abelian variety over a complete DVR of positive residue characteristic, lift the maximal special-fibre torus to the formal identity model and its formal abelian quotient, and compare the formal completion with the algebraic semi-abelian extension supplied by the early C4 degeneration theory. Generic Néron-model and abstract 1-motive carriers are not conflated.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R is complete and char(k)>0; A has semistable reduction.

Construction or proof route:

1. Use Raynaud94 §4.2 to construct the formal torus/quotient.
2. Consume formal completion/algebraization from AdicSpacesPartII F0 and G-semiabelian-prefix, not an assumed rigid generic fibre.
3. G-Raynaud-algebraization retains the formal lifting and algebraization inputs.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction; AdicSpacesPartII:F0.

Acceptance:

- Good reduction gives zero toric lattice; the formal identity-model comparison does not identify disconnected components.

Sources: RAYNAUD94, §4.2, Theorem 4.2.2 and Remark 4.2.3.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Polarized lattice uniformisation comparison

Declaration: TauCeti.NeronBlueprint.RigidUniformisation. Node: rigid-uniformisation. Kind: theorem.

In the complete positive-residue-characteristic setting, A^an is the rigid/fppf quotient of the generic semi-abelian Raynaud extension G by an étale locally constant lattice Y of rank equal to the toric degeneration rank. For a polarization, the dual toric character/lattice data and Poincaré trivialization satisfy the integral symmetric positive nondegenerate valuation pairing. Nonsplit data require Galois descent, not a chosen split constant lattice.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R is complete and char(k)>0; A has semistable reduction.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison and the strict 1-motive supplied by C4.
2. Apply Raynaud94 Theorem 4.2.2 for the analytic covering/kernel and §§4.3,4.7 for the valuation/polarization conditions.
3. Use G-Raynaud-algebraization for the unread BL construction leaves and G-polarized-effectivity for the positivity/effectivity proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison; NeronModelsAndSemistableAbelianVarieties:R11.2/toric-character.

Acceptance:

- The pure toric Tate case has a rank-one lattice; a good abelian variety has Y=0.

Sources: RAYNAUD94, §§4.2–4.3 and 4.7; SGA7 IX Theorem 10.4.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization; NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity.

Suggested signature: omitted, with exact names and inputs in the omission register below.

## R11.4. Singular Picard geometry and integral monodromy

### Degree-zero Picard of a semistable curve

Declaration: TauCeti.NeronBlueprint.PicardZero. Node: picard-zero. Kind: construction.

Starting with the supplied relative fppf Picard functor of X/R, construct its fibrewise identity component Pic^0_(X/R), whose special fibre parametrizes multidegree-zero line-bundle classes on every geometric irreducible component. Under the regular semistable hypotheses it is a smooth separated semi-abelian R-group with generic fibre Jac(X_K). Do not identify the entire nonseparated relative Picard functor with a Néron model.

Hypotheses: R is a strictly henselian DVR with algebraically closed residue field; X/R is a proper flat regular curve with geometrically connected smooth generic fibre and geometrically reduced nodal special fibre. Extra projectivity, section or complete-base hypotheses are stated when used.

Construction or proof route:

1. Import the Picard sheafification/rigidification carrier from JacobianChallenge D; this packet supplies the singular-fibre identity-component theorem.
2. Use Conrad Theorems 7.12–7.14 and G-Picard-Raynaud for representability/separatedness and base change.

Prerequisites: tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme.

Uses: Conrad Theorem 7.14: The torus and normalized-component Jacobians describe the fibre. BGW §3: The one-node generalized Jacobian has an extra torus.

API outline:

- SemistablePicard.generic (compatibility): The generic fibre of Pic^0 is the smooth-curve Jacobian.
- SemistablePicard.special (compatibility): The special fibre is the degree-zero Picard of X_k.
- SemistablePicard.multidegree (characterisation): Geometric line-bundle classes in the identity component have degree zero on every normalization component.
- SemistablePicard.smooth (structure): Pic^0 is smooth over R.
- SemistablePicard.separated (structure): Regularity and reduced semistable fibres give the separated identity component.
- SemistablePicard.semiabelian (structure): Every fibre of Pic^0 is an extension of an abelian variety by a torus.
- SemistablePicard.pullback (functoriality): A curve morphism induces pullback on Picard classes with the required multidegree condition verified.
- SemistablePicard.pullback_id (simp): Pullback by identity is identity.
- SemistablePicard.pullback_comp (functoriality): Pullback is contravariant for composites.
- SemistablePicard.smooth_case (compatibility): For a smooth proper family this is the existing relative Jacobian, not a second definition.

Unit tests:

- SemistablePicard.smooth_test (compatibility): A smooth fibre has no toric part and recovers its Jacobian.
- SemistablePicard.irreducible_node_test (computation): An irreducible rational one-node curve has Pic^0=G_m, not zero.
- SemistablePicard.tree_test (degenerate): A nodal tree of rational curves has trivial Pic^0 even though its componentwise Picard group is nontrivial.

Acceptance:

- A smooth fibre has no toric part and recovers its Jacobian.
- An irreducible rational one-node curve has Pic^0=G_m, not zero.
- A nodal tree of rational curves has trivial Pic^0 even though its componentwise Picard group is nontrivial.

Sources: CONRAD-SR, Theorems 7.12–7.14.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Normalization sequence for the generalized Jacobian

Declaration: TauCeti.NeronBlueprint.NormalizationExactSequence. Node: normalization-exact-sequence. Kind: theorem.

For a connected proper nodal curve C over algebraically closed k, its normalization components C_v have an exact fppf sequence 0→T_Gamma→Pic^0(C)→product_v Jac(C_v)→0. T_Gamma has character lattice H_1(Gamma,Z), for the dual multigraph retaining loops and multiple edges.

Hypotheses: C is a proper connected nodal curve over algebraically closed k; normalized components are smooth proper curves.

Construction or proof route:

1. Use the units sheaf normalization/node exact sequence and take cohomology, separating constants from gluing scalars.
2. Identify the quotient of node gluing scalars by vertex rescaling with the torus; its character kernel is the oriented incidence kernel.
3. Use G-normalization-cohomology for the source cohomological leaves.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/picard-zero; tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.

Acceptance:

- For one rational self-node, H_1=Z and Pic^0=G_m; for a rational tree H_1=0.

Sources: SGA7, Exposé IX §12.3, formulas 12.3.6–12.3.14, printed pp.471–473.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Characters are integral graph cycles

Declaration: TauCeti.NeronBlueprint.CharactersGraphHomology. Node: characters-graph-homology. Kind: theorem.

There is a canonical isomorphism X*(T_Gamma)≅ker(partial:Z^Edges→Z^Vertices)=H_1(Gamma,Z). It is independent of orientation after the corresponding sign changes, and equivariant for automorphisms/Galois descent. The dual quotient is H^1, not the character group itself.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Dualize the vertex/node scalar quotient of NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence.
2. For each oriented edge set partial(e)=target−source; orientation reversal changes the corresponding generator sign.
3. Use the exact source distinction M=H_1 and Mdual=H^1 in SGA7 IX 12.3.7.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence; NeronModelsAndSemistableAbelianVarieties:R11.2/toric-character.

Acceptance:

- A loop has zero boundary but contributes a rank-one cycle; two vertices with two edges have one cycle, unlike a simple graph.

Sources: SGA7, Exposé IX formulas 12.3.7 and 12.3.11–12.3.14, printed pp.472–473.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Picard identity and Néron identity comparison

Declaration: TauCeti.NeronBlueprint.PicardNeronIdentity. Node: picard-neron-identity. Kind: theorem.

For the regular semistable curve X/R of ch, Pic^0_(X/R) is canonically the identity open subgroup of the Néron model of Jac(X_K). The full model includes its component group and is obtained from the degree-zero part of the quotient of the relative Picard functor by the closure of the generic identity.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. SGA7 IX Theorem 12.1 quotients the relative Picard by the vertical divisor/identity closure subgroup.
2. For reduced regular semistable fibres, gcd multiplicity is one and Pic^0 is separated; apply its identity-component isomorphism.
3. Use NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso for canonical markings; retain G-Picard-Raynaud for representability/NMP.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/picard-zero; NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence; NeronModelsAndSemistableAbelianVarieties:R11.1/unique-iso.

Acceptance:

- A split I_n model has Pic^0 special fibre G_m while the full Jacobian model has n geometric components.

Sources: SGA7, Exposé IX Theorem 12.1(b–d), formulas 12.1.5–12.1.10, printed pp.466–467.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Integral monodromy pairing

Declaration: TauCeti.NeronBlueprint.IntegralMonodromyPairing. Node: integral-monodromy-pairing. Kind: construction.

For semistable A over a henselian DVR, let X_A=X*(T_A) and X_dual=X*(T_Adual). Construct the integral bilinear valuation pairing u:X_dual×X_A→Z from the Poincaré degeneration. It induces u#:X_dual→Hom(X_A,Z). For a polarization lambda:A→Adual, pull characters back by lambda*:X_dual→X_A; (x,y)↦u(x,lambda*(y)) is symmetric positive definite over Q on the free lattices. No integral unimodularity is asserted.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. A is semistable; R henselian.

Construction or proof route:

1. Use the dual/Poincaré extension data of G-semiabelian-prefix and its valuation trivialization.
2. Apply SGA7 IX Theorem 10.4 to compare the integral pairing to all prime-adic monodromy pairings; G-integral-pairing retains its proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/toric-character; NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation.

Uses: SGA7 IX Theorems 11.5 and 12.5: Its cokernel gives components and its curve form is the edge-length pairing.

API outline:

- NeronMonodromy.bilinear (structure): u is integral bilinear in the two character lattices.
- NeronMonodromy.adjoint (constructor): u# maps X_dual into the integral dual of X_A.
- NeronMonodromy.non_degenerate (characterisation): u# is injective and has finite cokernel.
- NeronMonodromy.dual_symmetry (relation): Under biduality, the pairing for Adual is the transpose of that for A.
- NeronMonodromy.polarized_symmetric (relation): The polarization-induced form is symmetric.
- NeronMonodromy.polarized_positive (structure): That form is positive definite after tensoring with R.
- NeronMonodromy.prime_adic (compatibility): Tensoring u with Z_ell is the canonical prime-adic monodromy pairing, including the source-qualified residue-prime construction.
- NeronMonodromy.basechange (compatibility): A ramification-index-e base change scales the pairing by e under the identity-torus comparison.
- NeronMonodromy.functorial (functoriality): For f:A→B, y∈X_Adual and x∈X_B, u_A(y,f* x)=u_B(fdual* y,x), where fdual:Bdual→Adual and its character pullback goes X_Adual→X_Bdual.
- NeronMonodromy.zero_torus (simp): If both character lattices are zero, the pairing and its cokernel are zero.

Unit tests:

- NeronMonodromy.tate_test (computation): For a split Tate curve ord(q)=n, the self-dual rank-one pairing is multiplication by n.
- NeronMonodromy.ramification_test (computation): Ramification e changes the Tate pairing from n to en.
- NeronMonodromy.good_test (degenerate): Good reduction gives zero lattices, not an arbitrary positive rank pairing.

Acceptance:

- For a split Tate curve ord(q)=n, the self-dual rank-one pairing is multiplication by n.
- Ramification e changes the Tate pairing from n to en.
- Good reduction gives zero lattices, not an arbitrary positive rank pairing.

Sources: SGA7, Exposé IX Theorem 10.4, printed p.444.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-integral-pairing.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Graph formula for Jacobian monodromy

Declaration: TauCeti.NeronBlueprint.GraphMonodromy. Node: graph-monodromy. Kind: theorem.

For regular projective semistable X/R with algebraically closed residue field, under the Jacobian autoduality and character-cycle isomorphism, u(c,d)=sum_e c_e d_e on H_1(Gamma,Z). Reversing an edge reverses both coefficients and preserves the form. For a nonregular stable node xy=pi^m, a weighted edge of length m represents its regular resolution chain; that extension requires G-thickness-resolution.

Hypotheses: R is a strictly henselian DVR with algebraically closed residue field; X/R is a proper flat regular curve with geometrically connected smooth generic fibre and geometrically reduced nodal special fibre. Extra projectivity, section or complete-base hypotheses are stated when used. X/R is projective; the weighted nonregular variant also requires the resolved-node comparison.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology to write cycles as integral edge coefficients.
2. Apply SGA7 IX Theorem 12.5, whose regular quadratic-node hypothesis gives edge length one.
3. Derive the thick-node formula only through the regular subdivision comparison recorded as G-thickness-resolution.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing; NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology; NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity.

Acceptance:

- A single loop of length n has pairing [n]; a tree has zero cycle lattice.

Sources: SGA7, Exposé IX §§12.4–12.5, printed pp.473–475.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-thickness-resolution.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Component group from monodromy cokernel

Declaration: TauCeti.NeronBlueprint.ComponentCokernel. Node: component-cokernel. Kind: theorem.

For a semistable abelian variety over a henselian DVR, the finite cokernel of u#:X_dual→Hom(X_A,Z), viewed with its residue Galois descent, is canonically the finite étale component group Phi_A. Its ell-primary part is the cokernel after tensoring with Z_ell for every prime ell, with the source-qualified p-divisible interpretation at the residue prime.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use SGA7 IX Theorem 11.5 and integral Theorem 10.4, not only a rational monodromy operator.
2. Identify prime-primary component groups and glue the finite integral cokernel; G-component-cokernel retains the compatible-duality/proof leaves.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing; NeronModelsAndSemistableAbelianVarieties:R11.2/component-group.

Acceptance:

- For the Tate pairing [n], the cokernel is Z/n; a rational isomorphism of lattices does not imply a trivial integral component group.

Sources: SGA7, Exposé IX Theorem 11.5 and §11.6, printed pp.455–456.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-component-cokernel.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Grothendieck component pairing

Declaration: TauCeti.NeronBlueprint.ComponentPairing. Node: component-pairing. Kind: construction.

Construct the canonical Poincaré obstruction pairing Phi_A×Phi_Adual→Q/Z over the residue field. In the semistable case it is perfect and equals the discriminant pairing induced by u on its two finite lattice cokernels. Do not claim the historical general perfectness conjecture solely from SGA7 IX §1.3.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. A is semistable for perfectness and the discriminant formula.

Construction or proof route:

1. Use the biextension obstruction pairing in SGA7 IX §1.2.
2. Apply NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel and the transpose integral pairing to obtain perfect finite duality; G-component-cokernel retains the proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel; NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing.

Uses: CG Lemma A.7: Perfect duality equates the prime divisors of the orders of the two geometric component groups. Level-lowering consumers: Discriminant pairing and degeneracy adjoints control integral component maps.

API outline:

- NeronComponentPairing.bilinear (structure): The component pairing is bilinear with target Q/Z.
- NeronComponentPairing.galois (compatibility): It is residue-Galois equivariant.
- NeronComponentPairing.dual (relation): The dual variety pairing is the transpose under biduality.
- NeronComponentPairing.perfect_semistable (characterisation): For semistable A it identifies each finite geometric component group with the Q/Z dual of the other.
- NeronComponentPairing.discriminant (compatibility): Its value is the fractional inverse-monodromy value modulo Z on cokernel classes.
- NeronComponentPairing.independent_lifts (extensionality): Changing a representative by an image of the integral monodromy map changes the rational value by an integer.
- NeronComponentPairing.zero_left (simp): Pairing a zero component class gives zero.
- NeronComponentPairing.zero_right (simp): Pairing against a zero dual class gives zero.
- NeronComponentPairing.functorial (functoriality): For f:A→B, pair_B(f_*a,b)=pair_A(a,fdual_*b).
- NeronComponentPairing.good (simp): Good reduction has the unique zero pairing on zero component groups.

Unit tests:

- NeronComponentPairing.tate_test (computation): On Z/n paired with Z/n the value of residue classes r,s is rs/n modulo Z, up to the fixed source sign convention.
- NeronComponentPairing.lift_test (computation): Replacing r by r+n changes rs/n by the integer s.
- NeronComponentPairing.n1_test (degenerate): For n=1 both groups and the pairing are zero.

Acceptance:

- On Z/n paired with Z/n the value of residue classes r,s is rs/n modulo Z, up to the fixed source sign convention.
- Replacing r by r+n changes rs/n by the integer s.
- For n=1 both groups and the pairing are zero.

Sources: SGA7, Exposé IX §§1.2–1.3 and Theorem 11.5, printed pp.323–324,455.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-component-cokernel.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Intersection matrix component description

Declaration: TauCeti.NeronBlueprint.IntersectionComponentQuotient. Node: intersection-component-quotient. Kind: theorem.

For a regular proper flat curve X/R with geometrically connected smooth generic fibre, algebraically closed residue field, and gcd of special-fibre multiplicities m_v equal to one, let I be its full intersection matrix. Then Phi_J(k) is the finite group ker(d:Z^V→Z)/im(I), with d(a)=sum_v m_v a_v. Import the numerical Picard/intersection complex from StableReduction and prove its comparison with the actual Jacobian. For reduced nodal fibres this agrees with the graph discriminant group.

Hypotheses: R strictly henselian with algebraically closed residue field; X is regular proper flat, smooth geometrically connected generic curve; f_*O_X=O_R and gcd component multiplicity=1.

Construction or proof route:

1. Use the vertical-divisor quotient in SGA7 IX Theorem 12.1 under the stated index/cohomological hypotheses.
2. Apply the existing numerical intersection construction from SR6, then identify its degree-zero quotient with the component group using G-intersection-comparison.
3. The relation I m=0 ensures image(I)⊂ker d; finiteness depends on the rank-one kernel and connectedness, not just formal quotient syntax.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity; NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel; tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.

Acceptance:

- For a tree of reduced components the quotient is zero; for a cycle of n it is Z/n; gcd multiplicity greater than one is excluded here.

Sources: SGA7, Exposé IX Theorem 12.1 and §12.4.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-intersection-comparison.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BGW one-node curve adapter

Declaration: TauCeti.NeronBlueprint.BgwNodalPinch. Node: bgw-nodal-pinch. Kind: comparison.

For char(K)≠2, g≥1 and a separable binary form f of degree 2g+2 with leading coefficient f0≠0, the smooth curve C:z²=f has two infinity branches over the quadratic étale algebra D=K[s]/(s²−f0). Pinching that degree-two divisor to a K-point gives C_m:z²=f y², arithmetic genus g+1 and one ordinary node, with normalization C. Generic Ferrand pinching is imported from Part II G.0.

Hypotheses: char(K)≠2; g≥1; f binary degree 2g+2, discriminant nonzero and f0≠0.

Construction or proof route:

1. Apply NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence to the degree-two infinity divisor and its finite map to Spec K. Its finite fibre has an affine neighborhood on C. Verify the node normalization locally; the supplier gives the cartesian square and complement isomorphism, not the genus computation.
2. Verify the completed node equation and normalization and compute the arithmetic-genus increment.

Prerequisites: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence.

Acceptance:

- If f0 is a square, D=K×K; do not treat the split case as a field extension.

Sources: BGW, §3, printed pp.9–10.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BGW generalized Jacobian torus

Declaration: TauCeti.NeronBlueprint.BgwGeneralizedJacobian. Node: bgw-generalized-jacobian. Kind: theorem.

For the preceding C_m, there is an exact fppf sequence 0→(Res_D/K G_m)/G_m→J_m→J→0; the torus is canonically isomorphic to the norm-one torus for the quadratic étale algebra D. Here J=Pic^0(C), J_m=Pic^0(C_m); Picard rational classes need not be line bundles defined over K.

Hypotheses: char(K)≠2; g≥1; f binary degree 2g+2, discriminant nonzero and f0≠0.

Construction or proof route:

1. Apply the normalization sequence to the two branches and descend its G_m quotient.
2. Use a/b under the quadratic involution to identify the quotient with the norm-one torus as a group scheme, not merely surjectivity on K-points.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-nodal-pinch; NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence.

Acceptance:

- Split D gives G_m; nonsplit D gives its quadratic twist. Hilbert-90/fppf surjectivity must not be replaced by a naive quotient of K-point groups.

Sources: BGW, §3, printed pp.10–11.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BGW finite two-torsion comparison

Declaration: TauCeti.NeronBlueprint.BgwTwoTorsion. Node: bgw-two-torsion. Kind: theorem.

For L=K[t]/(f(t,1)/f0), J_m[2]≅ker(N:Res_L/K mu_2→mu_2), and J[2] is that kernel modulo diagonal mu_2. Their geometric ranks are 2^(2g+1) and 2^(2g). Geometric classes correspond to even partitions of the 2g+2 roots modulo complement for J[2]; rational fixed classes can come from conjugate unordered partitions, not only K-rational factors.

Hypotheses: char(K)≠2; g≥1; f binary degree 2g+2, discriminant nonzero and f0≠0.

Construction or proof route:

1. Use BGW Proposition 22 and the double-cover divisor relation.
2. Pass to the finite étale group schemes and retain Galois descent; taking fixed points does not commute with quotienting in general.
3. Use G-BGW-divisors for the detailed divisor-class proof leaves.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-generalized-jacobian; ArithmeticGaloisRepresentations:R01.6; AbelianSchemesAndArithmeticModuli:A3.

Acceptance:

- At g=1 the geometric orders are 8 and 4; diagonal mu_2 is nontrivial and must be divided out only for J[2].

Sources: BGW, §3 Proposition 22, printed p.11.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BGW rational classes versus rational divisors

Declaration: TauCeti.NeronBlueprint.BgwBrauerDescent. Node: bgw-brauer-descent. Kind: theorem.

For C/K above, the quotient Pic_(C/K)(K)/Pic(C) injects into Br(K) and its image is killed by base change to the quadratic splitting algebra D. Thus a K-point of the Picard functor need not be a K-line bundle, and rational torsor tests must retain the Brauer obstruction.

Hypotheses: char(K)≠2; g≥1; f binary degree 2g+2, discriminant nonzero and f0≠0.

Construction or proof route:

1. Use the Picard/Leray low-degree exact sequence and the degree-two infinity divisor.
2. The splitting extension has a point on C, so its obstruction vanishes; retain G-Brauer-Picard for the cohomological supplier.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-generalized-jacobian.

Acceptance:

- If C has a K-point the obstruction is zero; a quadratic-conjugate factor partition is not silently represented by a K-divisor.

Sources: BGW, §3 rational Picard classes, printed p.10.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Stable-family Picard and Hodge comparison

Declaration: TauCeti.NeronBlueprint.StableFamilyPicard. Node: stable-family-picard. Kind: theorem.

For an integral Noetherian S and stable relative curve X/S of genus g>1, the fibrewise Picard identity is a smooth separated semi-abelian S-group. Its Hodge line det(e*Omega^1) is canonically isomorphic to det(pi_*omega_(X/S)). This stable-family assertion does not require a regular total space, unlike the Néron identity comparison over a DVR; archimedean metrics are exported to R35 rather than constructed here.

Hypotheses: S integral Noetherian; X/S stable of genus g>1.

Construction or proof route:

1. Use the source-qualified stable Picard representability theorem cited by Yuan §3.1.3 and keep G-stable-Picard explicit.
2. Apply relative duality/tangent Picard identification for the determinant isomorphism, with the same normalization as the smooth relative Jacobian.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/picard-zero; NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice.

Acceptance:

- A stable nodal family xy=pi^m with m>1 may have a singular total space; do not use it directly as the regular Néron-comparison model.

Sources: YUAN-ARXIV, §3.1.3 and Lemma 3.4, arXiv v4 printed pp.43–44.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-stable-Picard.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BGW odd-factor torsors

Declaration: TauCeti.NeronBlueprint.BgwOddFactorTorsors. Node: bgw-odd-factor-torsors. Kind: theorem.

Let d be the degree-two hyperelliptic line-bundle class and write Pic(C)/Z d=J disjoint union J^1, and similarly for C_m. The kernel of multiplication by two on the degree-one component is W[2], a J[2]-torsor; for C_m it is W_m[2], a J_m[2]-torsor. W_m[2](K) corresponds to odd factors of f over K, whereas W[2](K) corresponds to odd unordered factorizations, including factors conjugate over a quadratic extension.

Hypotheses: char(K)≠2; g≥1; f binary degree 2g+2, discriminant nonzero and f0≠0.

Construction or proof route:

1. Use the degree-two quotient and the odd Weierstrass-subset divisor classes of BGW Proposition 22.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion for the torsor action and complement relation; a torsor with no K-point is not a group with zero element.
3. Keep G-BGW-divisors and G-Brauer-Picard for descent/cup-product proof leaves.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion; NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-brauer-descent.

Acceptance:

- The geometric cardinalities agree with the respective torsion groups, but rational odd-factor torsors can be empty.

Sources: BGW, §3 Proposition 22(3–4), printed p.11.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BGW two-torsion connecting class

Declaration: TauCeti.NeronBlueprint.BgwBoundaryCupProduct. Node: bgw-boundary-cup-product. Kind: theorem.

The exact sequence 0→mu_2→J_m[2]→J[2]→0 has connecting map H^1(K,J[2])→H^2(K,mu_2) equal, under the Weil self-duality, to cup product with the class of W[2]. The kernel is the image of H^1(K,J_m[2]); do not equate the connecting class with a rational divisor representative without the Brauer obstruction.

Hypotheses: char(K)≠2; g≥1; f binary degree 2g+2, discriminant nonzero and f0≠0.

Construction or proof route:

1. Use the norm-kernel/diagonal quotient sequence in NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion.
2. Use the Weil-pairing identification and BGW cited Proposition 10.3; G-BGW-cup-product retains the unread original proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion; NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-odd-factor-torsors.

Acceptance:

- If W[2] is trivial as a torsor, this cup-product obstruction is zero.

Sources: BGW, End of §3, printed p.11.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-BGW-cup-product.

Suggested signature: omitted, with exact names and inputs in the omission register below.

## R11.5. Reduction criteria, conductors and local factors

### Néron–Ogg–Shafarevich

Declaration: TauCeti.NeronBlueprint.NeronOggShafarevich. Node: neron-ogg-shafarevich. Kind: theorem.

For A over the fraction field of a henselian DVR and ell≠char(k), A has good reduction iff T_ell(A) is unramified. This is an assertion about the full integral ell-adic action, not a single torsion level.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. R henselian; ell≠char(k).

Construction or proof route:

1. Good reduction implies étale prime-to-residue torsion and unramified Tate action.
2. Conversely use NeronModelsAndSemistableAbelianVarieties:R11.3/monodromy-criterion to obtain semistability; an unramified action has zero monodromy, so the nondegenerate pairing NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing forces zero toric rank and an abelian model.
3. G-NOS-monodromy-bridge records the missing integral inertia/pairing comparison.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model; NeronModelsAndSemistableAbelianVarieties:R11.3/monodromy-criterion; NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing; ArithmeticGaloisRepresentations:R01.6.

Acceptance:

- Full good reduction and isogeny compatibility are not deduced from A[N] unramified for one N.

Sources: CONRAD-SR, §4 discussion preceding Lemma 4.3; §5 Theorem 5.8; SGA7 IX Theorem 10.4.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Good reduction is isogeny invariant

Declaration: TauCeti.NeronBlueprint.GoodIsogeny. Node: good-isogeny. Kind: theorem.

Isogenous abelian varieties over K have good reduction at the same DVRs. The rational Tate-module representations are isomorphic even when the isogeny degree is divisible by ell; integral Tate lattices need not be equal.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use the rational isogeny compatibility from R01.6.
2. Apply NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich to unramifiedness of the rational representation; compare full inertia on the torsion-free lattice with its rationalization.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich; ArithmeticGaloisRepresentations:R01.6.

Acceptance:

- A p-power isogeny over a local field is not a prime-to-p étale isomorphism of integral models.

Sources: CONRAD-SR, Theorem 4.1 and good-reduction discussion; §5.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### p-adic reduction comparisons are imported

Declaration: TauCeti.NeronBlueprint.PadicComparisonImport. Node: padic-comparison-import. Kind: comparison.

For A/K over a p-adic local field, good reduction gives a crystalline V_p(A) and semistable reduction gives a semistable V_p(A), with the R06 convention for twists and the monodromy operator. These are requests to R06.6; this packet does not construct period rings or derive them from prime-to-residue étale torsion.

Hypotheses: K is a finite extension of Q_p; A/K abelian.

Construction or proof route:

1. Supply the genuine geometric reduction predicates NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model and NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction.
2. Consume the R06.6 comparison with the cohomological/homological dual clearly specified.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction; NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model; PadicHodgeTheory:R06.6.

Acceptance:

- A de Rham representation is not automatically crystalline; at the residue prime finite-part Tate invariants are not the prime-to-p ones.

Sources: BCGP21-PUBLISHED, Proposition2.8.1 proof, published pp.194–195.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Artin and Swan conductor interface

Declaration: TauCeti.NeronBlueprint.ConductorImport. Node: conductor-import. Kind: comparison.

Define the conductor of A through the supplied actual H^1/Tate representation with its local monodromy, using R01.3 Artin and Swan conductors; keep tame codimension and wild Swan terms. This is a geometric comparison/export, not a second conductor definition.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use the R01.6 representation and dual convention.
2. Import the R01.3 full local conductor formula, including monodromy and residual-versus-characteristic-zero distinctions.

Prerequisites: ArithmeticGaloisRepresentations:R01.6; ArithmeticGaloisRepresentations:R01.3.

Acceptance:

- Wild additive elliptic reduction must permit a positive Swan term.

Sources: CG, Appendix Lemma A.7 and its conductor argument.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistable conductor equals toric rank

Declaration: TauCeti.NeronBlueprint.SemistableConductorRank. Node: semistable-conductor-rank. Kind: theorem.

For semistable A over a local field and ell≠char(k), Swan=0 and the conductor exponent is t, its toric rank: 2g−dim(V_ell(A)^I)=2g−(t+2a)=t.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. K local with finite residue field; A semistable; ell≠char(k).

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration and g=t+a.
2. Use square-zero tame monodromy and the prime-to-residue inertia factorization to kill wild inertia; apply NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration; NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero; NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import.

Acceptance:

- Good reduction t=0 gives conductor zero; a split or nonsplit multiplicative elliptic curve has exponent one.

Sources: CG, Appendix Lemma A.7 proof; Conrad Lemma 5.4.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Full-monodromy local Euler polynomial

Declaration: TauCeti.NeronBlueprint.LocalEulerPolynomial. Node: local-euler-polynomial. Kind: theorem.

For finite residue field of size q, use H^1_et(A_Ksep,Q_ell) with geometric Frobenius F, and P_v(T)=det(1−T F | H^1^I). Under the actual Weil–Deligne comparison use ker N inside the appropriate Weil-invariant space. Inertia semisimplification alone loses N and does not determine this polynomial.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. k finite of cardinal q; ell≠char(k); H^1 is the dual of the homological rational Tate module.

Construction or proof route:

1. Use R01.2/R01.6 to identify the cohomological dual and Frobenius convention.
2. For semistable A compare H^1 invariants with the Raynaud extension; the toric character contribution has geometric Frobenius eigenvalues of weight zero, and the abelian contribution has weight one.
3. G-Euler-comparison retains the geometry-to-cohomology identification.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation; NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration; ArithmeticGaloisRepresentations:R01.6.

Acceptance:

- A split Tate curve has P=1−T; taking arithmetic Frobenius on homological inertia invariants would instead give 1−qT and is not this convention.

Sources: RAYNAUD94, §4.6 Proposition 4.6.1 and §4.7 Proposition 4.7.4.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Elliptic polynomial preserves the native definition

Declaration: TauCeti.NeronBlueprint.EllipticLocalPolynomial. Node: elliptic-local-polynomial. Kind: comparison.

For a minimal Weierstrass model over a DVR with finite residue k, the native localPolynomial equals the Galois polynomial of local-euler-polynomial: good 1−aT+qT² with a=q+1−#E(k), split multiplicative 1−T, nonsplit multiplicative 1+T, additive 1. Preserve the existing localPolynomial declaration and the full characteristic-zero Galois realization.

Hypotheses: R DVR with finite residue k; W is a minimal integral Weierstrass equation for an elliptic E/K; ell≠char(k).

Construction or proof route:

1. Good case: import the native finite-field point-count/Frobenius comparison from EC3/R01.6.
2. Bad cases: use the identity torus and its splitness or the additive identity group, keeping the whole inertia action.
3. Use G-Euler-comparison for the realized polynomial equality.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial; NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; mathlib:WeierstrassCurve.localPolynomial.

Acceptance:

- Do not infer q from Nat.card of an infinite field; finite residue is essential to this statement.

Sources: TATE, §5 local factors, printed p.44.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Residual conductor and dual components

Declaration: TauCeti.NeronBlueprint.ResidualConductorComponents. Node: residual-conductor-components. Kind: theorem.

For semistable A over a local field of residue characteristic r and prime ell≠r with ell not dividing #Phi_Adual(k_sep), the residual A[ell] inertia invariants have dimension equal to the characteristic-zero invariants, hence residual and characteristic-zero conductor exponents agree. Perfect semistable component duality lets one use #Phi_A instead, but this is a theorem, not an assumed equality.

Hypotheses: R is a DVR with fraction field K and residue field k; A/K is an abelian variety with its finite-type Néron group M/R. State perfectness or geometric base change where used. K local; A semistable; ell≠char(k); ell does not divide the geometric order of Phi_Adual.

Construction or proof route:

1. Identify the saturated fixed/finite submodule and its residual image.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel to measure the defect of reduction of the monodromy map by its ell-primary cokernel.
3. Use NeronModelsAndSemistableAbelianVarieties:R11.4/component-pairing and R01.3 residual conductor; G-residual-invariants retains the explicit exact-sequence proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel; NeronModelsAndSemistableAbelianVarieties:R11.4/component-pairing; NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration; NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import.

Acceptance:

- For a Tate curve with ell dividing ord(q), residual inertia can drop to trivial and conductor falls although the characteristic-zero exponent stays one.

Sources: CG, Appendix Lemma A.7 proof, author-copy p.89 / journal p.889.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-residual-invariants.

Suggested signature: omitted, with exact names and inputs in the omission register below.

## R11.6. Functorial exports and equation-to-scheme comparisons

### Degeneracy maps and monodromy adjoints

Declaration: TauCeti.NeronBlueprint.DegeneracyFunctoriality. Node: degeneracy-functoriality. Kind: comparison.

Given actual homomorphisms between semistable modular Jacobians supplied by the modular-curve owner, extend them to Néron models and export the contravariant character maps, covariant component maps, dual adjoints and their monodromy/component-pairing commutative diagrams. No level-lowering theorem or generic Néron exactness is assumed.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.1/group-law for extensions and NeronModelsAndSemistableAbelianVarieties:R11.2/toric-character for variance.
2. Use the functorial formulas in NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing and NeronModelsAndSemistableAbelianVarieties:R11.4/component-pairing.
3. G-modular-character-exactness keeps the particular optimal-kernel/quotient hypotheses and integral saturation proofs.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/group-law; NeronModelsAndSemistableAbelianVarieties:R11.2/toric-character; NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing; NeronModelsAndSemistableAbelianVarieties:R11.4/component-pairing.

Acceptance:

- The source/target of a pullback character map is reversed; pair_B(f_*a,b)=pair_A(a,fdual_*b).

Sources: SGA7, Exposé IX §10.2 functoriality and §1.2 pairing.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Character exact sequences require verified kernels

Declaration: TauCeti.NeronBlueprint.CharacterExactSequences. Node: character-exact-sequences. Kind: comparison.

For a supplied exact sequence of special-fibre tori 0→T1→T→T2→0, export 0→X*(T2)→X*(T)→X*(T1)→0 and its monodromy-induced component sequence with all lattice cokernels. To apply to modular degeneracy maps, first prove this torus sequence and its saturation; a generic exact abelian-variety sequence does not supply it.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Dualize the actual torus sequence using the supplier character anti-equivalence.
2. Compare integral monodromy maps and apply the lattice snake lemma, keeping the kernel/cokernel terms.
3. Use G-modular-character-exactness for the consumer-specific geometric sequence.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality; NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel.

Acceptance:

- Do not erase finite cokernels or assume exactness on rational components; check all maps at the integral lattice level.

Sources: SGA7, Exposé IX §§10–11; YZ-ERR introduction.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistable differential base change

Declaration: TauCeti.NeronBlueprint.SemistableDifferentialBasechange. Node: semistable-differential-basechange. Kind: comparison.

For a semistable abelian variety over a Dedekind number-field base and a finite number-field extension, the pullback of its integral invariant-differential lattice identifies with the lattice of the new identity Néron model at all finite places, including ramified ones. This identity-model theorem, not full-model base change, underlies the stable Faltings-height export.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-identity-basechange place by place and NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice localization.
2. Glue the module isomorphisms over the Dedekind base; the archimedean metric is owned by R35.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-identity-basechange; NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice.

Acceptance:

- Ramified Tate components grow while du/u remains the identity differential; no equality with dq/q is asserted.

Sources: YZ, §1.1, printed pp.534–535.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Isogeny-height integral lattice export

Declaration: TauCeti.NeronBlueprint.IsogenyDifferentialExport. Node: isogeny-differential-export. Kind: comparison.

An isogeny A→B over a number field extends to a model homomorphism and induces an inclusion omega_B→omega_A of same-rank finite projective lattices, with a torsion cokernel at finite places in characteristic zero. Export its local length/determinant data to the height owner; do not assert a degree-only exact Néron sequence or replace a p-primary local correction by zero.

Hypotheses: Number-field K; A,B abelian of the same dimension; f:A→B an isogeny; global Dedekind Néron models as in R11.1.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.1/group-law and NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice pullback.
2. The generic differential map is invertible in characteristic zero; deduce torsion kernel/cokernel behaviour over the Dedekind base and determinant localization.
3. G-isogeny-differentials retains the full local length formula and the corrected YZ error context.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/group-law; NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice; NeronModelsAndSemistableAbelianVarieties:R11.5/good-isogeny.

Acceptance:

- At a residue prime dividing the isogeny degree, an integral differential map can fail to be an isomorphism even with good reduction.

Sources: YZ-ERR, Introduction and Theorem 1 (selected opening).

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-isogeny-differentials.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Equation versus abelian-scheme good reduction

Declaration: TauCeti.NeronBlueprint.EquationGoodComparison. Node: equation-good-comparison. Kind: comparison.

For an elliptic curve over a DVR with a minimal integral Weierstrass model W, the native HasGoodReduction predicate (multiplicative valuation of Delta equals 1) is equivalent to smooth elliptic special fibre and an abelian-scheme model; scheme good reduction is independent of the chosen minimal W. Valuation value 1 means ordinal discriminant valuation zero.

Hypotheses: R DVR; W integral minimal for pointed elliptic E/K.

Construction or proof route:

1. Read the native hasGoodReduction_iff_isElliptic_reduction statement.
2. Use the proper smooth pointed Weierstrass presentation and NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model; G-Weierstrass-scheme connects equation and scheme carriers.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model; NeronModelsAndSemistableAbelianVarieties:R11.2/minimal-regular-smooth-locus; mathlib:WeierstrassCurve.HasGoodReduction; mathlib:WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- Multiplicative valuation Delta=1 is good; it must not be misread as ord(Delta)=1.

Sources: BLR-CH1, §1.5, printed pp.20–23; native Weierstrass Reduction comparison.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Equation versus toric elliptic reduction

Declaration: TauCeti.NeronBlueprint.EquationMultiplicativeComparison. Node: equation-multiplicative-comparison. Kind: comparison.

For minimal W, the native HasMultiplicativeReduction conditions (v(Delta)<1 and v(c4)=1) identify a nodal reduced cubic and a toric identity fibre. Splitness of the residual quadratic identifies split G_m versus its quadratic form, and the equation-level SplitMultiplicativeReduction is equivalent to that torus splitness.

Hypotheses: R DVR; W integral minimal for pointed elliptic E/K.

Construction or proof route:

1. Use the native c4/Delta predicates and residual nodal tangent computation.
2. Apply NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations and NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration; preserve nonsplit residue descent.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations; NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration; mathlib:WeierstrassCurve.HasMultiplicativeReduction; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- The good/multiplicative cases cannot overlap; splitness is a residue-field statement, not merely a geometric torus identification.

Sources: TATE, §4 reduction geometry, printed p.41.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Minimal discriminant and regular-fibre geometry

Declaration: TauCeti.NeronBlueprint.EquationDiscriminantComparison. Node: equation-discriminant-comparison. Kind: comparison.

Preserve the imported minimal discriminant ordinal valuation and prove its relation to the resolved pointed regular model and geometric reduction type. For multiplicative I_n it is n. For the tame additive types use the table only when char(k)≠2,3; the wild valuations come from the imported full algorithm.

Hypotheses: R DVR; W integral minimal for pointed elliptic E/K.

Construction or proof route:

1. Import invariance under changes between minimal equations.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations and NeronModelsAndSemistableAbelianVarieties:R11.2/wild-kodaira-comparison to compare the resolved fibre; retain G-Kodaira-resolution for proof leaves.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations; NeronModelsAndSemistableAbelianVarieties:R11.2/wild-kodaira-comparison; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- I0,I1,II have the same component count but discriminant valuations 0,1,2 in the tame case.

Sources: TATE, §6 discriminant row and explicit restriction, printed p.46.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Ogg exponent and full conductor comparison

Declaration: TauCeti.NeronBlueprint.EquationConductorComparison. Node: equation-conductor-comparison. Kind: comparison.

For an elliptic minimal regular model with m geometric irreducible components, identify the imported Ogg exponent ord(Delta_min)+1−m with the Artin/Swan conductor of H^1. This equality includes the wild contributions via the actual minimal discriminant, not the tame additive value 2.

Hypotheses: R DVR; W integral minimal for pointed elliptic E/K.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.6/equation-discriminant-comparison and the geometric component count, not the group order.
2. Consume R01.3/EC4 Ogg comparison with its wild correction; G-Ogg-geometry records the general source proof and its scheme adapter.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-discriminant-comparison; NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- For I0*, m=5 but #Phi=4; substituting component-group order for m gives the wrong Ogg exponent.

Sources: TATE, §6 table, printed p.46 (tame display); full wild Ogg proof is an import.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Ogg-geometry.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Tamagawa number uses rational components

Declaration: TauCeti.NeronBlueprint.EquationComponentComparison. Node: equation-component-comparison. Kind: comparison.

For complete R with finite residue k, the imported Tate-algorithm c_p equals #Phi_E(k), via E(K)/E0(K). The geometric component count m and #Phi_E(k_sep) are different invariants; descent determines the rational c_p.

Hypotheses: R complete DVR; k finite; pointed elliptic E/K with minimal integral W.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration and the native algorithm output.
2. Apply NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-component-groups with its Galois action; do not replace fixed points by all geometric components.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration; NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-component-groups; NeronModelsAndSemistableAbelianVarieties:R11.2/component-group; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- Nonsplit I_n has rational c_p=1 for n odd and 2 for n even over finite k, while geometric order is n.

Sources: TATE, §§4–6, printed pp.41–46.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Minimal differential equals Néron lattice basis

Declaration: TauCeti.NeronBlueprint.EquationMinimalDifferential. Node: equation-minimal-differential. Kind: comparison.

For an elliptic minimal integral Weierstrass equation over a DVR, the differential dx/(2y+a1 x+a3) with its alternate smooth chart expressions generates the local Néron invariant-differential lattice. Under a minimal coordinate change it transforms by the native unit factor; it is not a base logarithmic differential dq/q.

Hypotheses: R DVR; W integral minimal for pointed elliptic E/K.

Construction or proof route:

1. Use the actual integral formal differential calculation in Tate Theorem 4.2.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.2/minimal-regular-smooth-locus and NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice to compare the smooth-locus identity pullback; G-Weierstrass-scheme retains the chart/gluing proof.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.2/minimal-regular-smooth-locus; NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance:

- At residue 2 or 3 use the complementary chart expression rather than dividing by a vanishing denominator; changing a minimal equation scales by a unit.

Sources: TATE, Theorem 4.2, printed pp.42–43.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Abelian cohomology compatible-system export

Declaration: TauCeti.NeronBlueprint.StrictCompatibleSystemExport. Node: strict-compatible-system-export. Kind: theorem.

For an abelian variety A/F over a number field and 0≤i≤2 dim A, its H^i_et(A_Fbar,Q_ell) form a Q-rational strictly compatible system pure of weight i with the source Weil–Deligne conventions. At i=1 H^1 is dual to the homological Tate module; for surfaces its GSp4 multiplier is epsilon_ell^(-1), not epsilon_ell.

Hypotheses: F number field; A/F abelian; cohomological Frobenius/purity convention as in BCGP21.

Construction or proof route:

1. Use H^i=exterior^i H^1 from the cohomology supplier.
2. Supply NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension and NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation to the Raynaud strict 1-motive purity argument.
3. Consume the Noot away/at-coefficient-prime and Saito descent proofs as G-strict-compatibility; do not claim they follow from the Néron definition.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension; NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation; NeronModelsAndSemistableAbelianVarieties:R11.5/padic-comparison-import; NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial.

Acceptance:

- Correct the printed variable X to A; at i=0 the system has rank one and weight zero, and H^i vanishes for i>2 dim A.

Sources: BCGP21-PUBLISHED, Proposition2.8.1 and Definition2.8.2/Remark2.8.3, published pp.194–195.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-strict-compatibility.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Semistable ordinary reduction adapter

Declaration: TauCeti.NeronBlueprint.SemistableOrdinaryAdapter. Node: semistable-ordinary-adapter. Kind: comparison.

For A/Q_p, semistable ordinary reduction means semistability plus ordinarity of the abelian quotient of M_k^0. The toric rank is unrestricted; a purely toric fibre has zero abelian quotient and satisfies this ordinary condition. The p-primary finite/toric filtration uses p-divisible groups, not the prime-to-residue fixed-point identification.

Hypotheses: A/Q_p abelian; ordinary structure refers to the abelian residue quotient.

Construction or proof route:

1. Apply NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction and NeronModelsAndSemistableAbelianVarieties:R11.2/chevalley to isolate the abelian quotient.
2. Import its ordinary p-divisible connected/étale decomposition as G-ordinary-prefix; combine with NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration and NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction; NeronModelsAndSemistableAbelianVarieties:R11.2/chevalley; NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration; NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality.

Acceptance:

- Good ordinary is included; a purely toric Tate example is included; ordinary abelian quotient alone without semistability is insufficient.

Sources: BCGP25, Definition 9.1.7 and Lemma 9.1.8, arXiv v1 pp.190–191.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Ordinary surface isotropic filtration export

Declaration: TauCeti.NeronBlueprint.OrdinaryIsotropicFiltration. Node: ordinary-isotropic-filtration. Kind: theorem.

For a semistable ordinary principally polarized abelian surface B/Q2, construct a saturated rank-two G_Q2-stable isotropic submodule of T_2(B); its reduction is a stable Lagrangian in B[2]. For toric rank t=2 use T_t, not the rank-four whole T_2(B). For t=1 lift the rank-one ordinary connected part in T_f/T_t. For t=0 use the ordinary good-reduction connected part.

Hypotheses: B/Q2 principally polarized abelian surface with semistable ordinary reduction.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration and NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality with ell=2≠char(Q2).
2. Use G-ordinary-prefix for the abelian quotient, without claiming inertia-fixed equality at residue prime 2.
3. Correct the missing toric subscript in the source proof as sourceIssues/E2.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.6/semistable-ordinary-adapter; NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality.

Acceptance:

- In the purely toric case rank(T_t)=2 whereas rank(T_2(B))=4; saturation is required before mod-2 reduction.

Sources: BCGP25, Proof of Lemma 9.1.8, arXiv v1 p.191.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### BCGP ordinary residual point export

Declaration: TauCeti.NeronBlueprint.OrdinaryResidualPointExport. Node: ordinary-residual-point-export. Kind: theorem.

Under the same hypotheses and the source fixed S6≅GSp4(F2) convention, if the residual image lies in S5(b), it is a 2-group and B[2](Q2) contains a nonzero point. The S5(b) versus the other S5 embedding and the order-48 parabolic intersection are finite-group supplier inputs, not recreated here.

Hypotheses: B/Q2 principally polarized abelian surface with semistable ordinary reduction. The source fixed identification and S5(b) residual-image condition hold.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.6/ordinary-isotropic-filtration to place the image in the Siegel parabolic.
2. Import the precise S6 conjugacy/intersection computation as G-residual-image; a finite 2-group action in characteristic 2 has a nonzero fixed vector.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.6/ordinary-isotropic-filtration.

Acceptance:

- A rational Weierstrass point alone without the ordinary hypothesis is not enough for this local conclusion.

Sources: BCGP25, Lemma 9.1.8 and proof, arXiv v1 p.191.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-residual-image.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Unramified three-torsion at two gives semistability

Declaration: TauCeti.NeronBlueprint.UnramifiedThreeTorsionAtTwo. Node: unramified-three-torsion-at-two. Kind: theorem.

If A/Q2 has unramified residual A[3] (equivalently the source dual rho_A,3), then A has semistable reduction, but it need not have good reduction.

Hypotheses: A/Q2 abelian; its full mod-3 residual inertia action is trivial.

Construction or proof route:

1. Apply NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability with N=3, residue characteristic 2.
2. The dual residual convention does not change inertia triviality.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability.

Acceptance:

- A split Tate curve with q=2^3 has unramified mod-3 inertia over Q2 but bad multiplicative reduction.

Sources: BCGP25, Lemma 9.2.2, arXiv v1 p.192.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Full level extension for curve semistability

Declaration: TauCeti.NeronBlueprint.YuanFullLevelExtension. Node: yuan-full-level-extension. Kind: theorem.

For the function-field setting of Yuan Lemma 4.9, choose N≥3 prime to char(K), J=Jac(C), and Kprime=K(J[N]). The full torsion extension gives semistable J at the relevant valuations; the source-qualified curve/Jacobian criterion gives semistable C. The Galois group injects into GSp_2g(Z/N), giving the rough degree bound [Kprime:K]<N^(4g²). No non-isotrivial height lower bound is proved here.

Hypotheses: K is a one-variable function field over k; C/K smooth projective geometrically integral of genus g>1; N≥3 prime to char(K); relevant valuations trivial on k.

Construction or proof route:

1. Use NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability at prime-to-N valuations.
2. Import the Deligne–Mumford curve/Jacobian criterion from SR7 with its residue/base hypotheses checked; G-Yuan-valuation-scope retains any imperfect-constant-field extension.
3. Use the generic full torsion/pairing supplied by R01.6/A3 for the GSp injection and size bound.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability; ArithmeticGaloisRepresentations:R01.6; tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction; AbelianSchemesAndArithmeticModuli:A3.

Acceptance:

- N=3 when char(K)≠3, otherwise N=4; J is the Jacobian of C, not the source stray variable X.

Sources: YUAN-ARXIV, Lemma 4.9 proof, arXiv v4 p.76.

Unresolved inputs: NeronModelsAndSemistableAbelianVarieties/G-Yuan-valuation-scope.

Suggested signature: omitted, with exact names and inputs in the omission register below.
### Good, split, nonsplit and nodal acceptance suite

Declaration: TauCeti.NeronBlueprint.AcceptanceExamples. Node: acceptance-examples. Kind: application.

Compute the good elliptic model as an abelian scheme with zero Phi; split multiplicative I_n as nonproper Néron identity G_m with geometric Phi=Z/n; nonsplit multiplicative as a nonsplit torus with Frobenius −1 on components; and a nodal curve with more than one component via its normalization sequence and cycle lattice. Check a rational tree versus a two-edge cycle and ramified n→en.

Hypotheses: S is a connected Dedekind scheme with generic point eta and fraction field K; A/K is an abelian variety. Local statements specify the DVR and any excellence/henselian hypothesis separately.

Construction or proof route:

1. Combine NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model, NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-component-groups, NeronModelsAndSemistableAbelianVarieties:R11.6/equation-component-comparison and NeronModelsAndSemistableAbelianVarieties:R11.3/ramified-tate-counterexample.
2. Use NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence and NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy; keep nonproper smooth model distinct from its proper regular compactification.

Prerequisites: NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model; NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-component-groups; NeronModelsAndSemistableAbelianVarieties:R11.6/equation-component-comparison; NeronModelsAndSemistableAbelianVarieties:R11.3/ramified-tate-counterexample; NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence; NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy.

Acceptance:

- For two rational components meeting twice: toric rank one, cycle pairing [2], Phi=Z/2. For a rational tree: cycle lattice and identity Picard vanish.

Sources: TATE, §§4–6; SGA7 IX §12.

Suggested signature: omitted, with exact names and inputs in the omission register below.

## Target coverage and routed source inputs

The target ledger checks every audited stage target; an imported proof is not a new implementation.

- R11.1: Néron model of an abelian variety: smooth separated finite-type group scheme over a DVR or Dedekind base with the Néron mapping property → marked-model, mapping-property, group-law.

- R11.1: Local existence over excellent DVRs via weak Néron models and smoothening → weak-model, smoothening, local-existence.

- R11.1: Dedekind local-to-global construction over rings of integers and S-integers: extend over a dense open, glue the remaining local models, global mapping property and finite type → spread-abelian, dedekind-gluing.

- R11.1: Uniqueness of Néron models and functorial extension of homomorphisms → unique-iso, extend, group-law.

- R11.1: Global invariant-differential lattice of the Néron model and its localisations → differential-lattice.

- R11.1: Comparison of good reduction with the existence of an abelian-scheme model → abelian-scheme-model, equation-good-comparison.

- R11.1: Étale/unramified base-change compatibility of Néron models → etale-basechange.

- R11.2: Identity component and component group Φ of the special fibre of a Néron model → identity-component, component-group.

- R11.2: Toric and abelian parts (Chevalley decomposition) and the character group of the toric part → chevalley, toric-character.

- R11.2: Functoriality under isogeny and the exact sequences used in modular-curve arguments → isogeny-components, character-exact-sequences.

- R11.2: Rational component group Φ(k) distinguished from its geometric points → component-group, equation-component-comparison.

- R11.2: For elliptic curves, comparison with the reduction filtration E₁ ⊂ E₀ ⊂ E and Tate's algorithm, including wild primes → elliptic-filtration, kodaira-geometric-configurations, wild-kodaira-comparison.

- R11.3: Semistable reduction theorem for abelian varieties after a finite extension → finite-separable-semistable-extension.

- R11.3: Grothendieck's monodromy criterion relating semistability to unipotent inertia action on T_ℓ → monodromy-criterion, inertia-square-zero.

- R11.3: Raynaud extension of the formal completion by a torus → raynaud-extension-comparison.

- R11.3: Uniformisation of degenerating abelian varieties/Jacobians with polarisation and lattice conditions → rigid-uniformisation, integral-monodromy-pairing.

- R11.4: Degree-zero Picard scheme / generalised Jacobian of a semistable curve → picard-zero, normalization-exact-sequence, bgw-generalized-jacobian.

- R11.4: Toric character group identified with H₁ of the dual graph → characters-graph-homology.

- R11.4: Grothendieck's monodromy pairing on character groups → integral-monodromy-pairing, graph-monodromy.

- R11.4: Component group described by the (weighted) intersection matrix under the exact regularity hypotheses → intersection-component-quotient, component-cokernel.

- R11.4: Relation of the Picard scheme of the special fibre to the Néron model of the Jacobian → picard-neron-identity.

- R11.5: ℓ-adic Tate modules of abelian varieties with Galois action → toric-finite-filtration.

- R11.5: Néron–Ogg–Shafarevich criterion (good reduction ⇔ unramified T_ℓ) → neron-ogg-shafarevich.

- R11.5: Good and semistable p-adic comparisons (crystalline/semistable Tate modules) via R06 → padic-comparison-import.

- R11.5: Conductors of abelian varieties via Artin/Swan conductors (R01) → conductor-import, semistable-conductor-rank.

- R11.5: Preservation of good reduction under isogeny → good-isogeny.

- R11.5: Local Euler polynomial from monodromy and component data, not just the semisimplified inertia action → local-euler-polynomial, elliptic-local-polynomial.

- R11.6: Character-group exact sequences and monodromy maps with degeneracy-map functoriality, supplied to level lowering → degeneracy-functoriality, character-exact-sequences.

- R11.6: Semistable and good-reduction facts supplied to R25 and to the isogeny-height analysis of R28 → semistable-differential-basechange, isogeny-differential-export, semistable-ordinary-adapter.

- R11.6: Equation-level versus scheme-level comparison for every elliptic invariant used in R29 (minimal discriminant, reduction type, conductor exponent, component group, minimal differential) → equation-good-comparison, equation-multiplicative-comparison, equation-discriminant-comparison, equation-conductor-comparison, equation-component-comparison, equation-minimal-differential.

The nine routed items have the following consuming declarations:

- PAPER-YUAN-26/76 → stable-family-picard.
- PAPER-YUAN-26/141 → yuan-full-level-extension.
- PAPER-YUAN-ZHANG-18/neron-model → marked-model, differential-lattice, isogeny-differential-export.
- PAPER-CALEGARI-GERAGHTY-20/conductor-of-A-p-equals-conductor-of-A → residual-conductor-components.
- PAPER-BHARGAVA-GROSS-WANG-17/22 → bgw-nodal-pinch, bgw-generalized-jacobian, bgw-brauer-descent.
- PAPER-BHARGAVA-GROSS-WANG-17/24 → bgw-two-torsion, bgw-odd-factor-torsors, bgw-boundary-cup-product.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-21/30 → strict-compatible-system-export.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-25/9.1.7 → semistable-ordinary-adapter, ordinary-isotropic-filtration, ordinary-residual-point-export.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-25/9.2.2 → unramified-three-torsion-at-two.

## Cross-roadmap import register

### AbelianSchemesAndArithmeticModuli:A1

Group objects in Over S, products, smoothness and pointed rigidity for abelian schemes; the abelian variety/scheme carrier and its base change, without any Néron existence theorem.

Consumers: group-law.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

The existing equation-level minimal Weierstrass models, TateReductionSymbol, Tate algorithm at all residue characteristics, E1 formal filtration, E0 reduction subgroup, c_p, Ogg exponent and Tate-curve point uniformisation; retain splitness and wild corrections. This packet owns only comparisons with schemes.

Consumers: elliptic-filtration, kodaira-geometric-configurations, wild-kodaira-comparison, ramified-tate-counterexample, elliptic-local-polynomial, equation-good-comparison, equation-multiplicative-comparison, equation-discriminant-comparison, equation-conductor-comparison, equation-component-comparison, equation-minimal-differential.

### tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

Regular/minimal proper models of positive-genus curves over the relevant DVRs; for the present target retain a generic elliptic origin. No geometric Kodaira classification is requested from this stage.

Consumers: minimal-regular-smooth-locus.

### ArithmeticGaloisRepresentations:R01.6

Actual inverse-limit Tate modules of abelian varieties, their finite free rank, continuous Galois action, integral Weil pairing with dual and Tate twist, isogeny compatibility and identification with residual torsion. Do not supply good/semistable geometric reduction by definition.

Consumers: toric-finite-filtration, orthogonality, monodromy-criterion, finite-torsion-semistability, bgw-two-torsion, neron-ogg-shafarevich, good-isogeny, conductor-import, local-euler-polynomial, yuan-full-level-extension.

### ArithmeticGaloisRepresentations:R01.2

Quasi-unipotence for continuous ell-adic representations with ell different from residue characteristic, tame characters, the actual Weil–Deligne pair and its Frobenius conventions.

Consumers: finite-separable-semistable-extension.

### AdicSpacesPartII:F0

Formal completion, smooth/étale lifting, formal coherent sheaves, proper formal GAGA with its ample hypotheses, and comparisons with analytification; no rigid quotient by a lattice is assumed.

Consumers: raynaud-extension-comparison.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Relative Picard fppf sheafification, rigidification and the smooth proper Jacobian carrier with generic base change. The singular semistable identity component and Néron comparison are not assumed.

Consumers: picard-zero.

### tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

Normalization of nodal curves, branches and the actual dual multigraph including loops/multiple edges, with integral incidence, homology and Betti number. A simple numerical intersection graph is not sufficient.

Consumers: normalization-exact-sequence.

### tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

The numerical Pic(T), weighted intersection matrix, degree map and degree-zero torsion, with the comparison to line bundles on actual regular models. No generic graph/numerical Picard group is rebuilt.

Consumers: intersection-component-quotient, kodaira-geometric-configurations.

### PadicHodgeTheory:R06.6

Good-reduction crystalline and semistable-reduction semistable comparisons for Tate modules over p-adic fields, with integral/rational distinctions, dual conventions and functorial comparison of monodromy.

Consumers: padic-comparison-import.

### ArithmeticGaloisRepresentations:R01.3

Artin/Swan conductor with the actual inertia and monodromy terms, reduction inequalities and the elliptic conductor/Ogg comparison including wild residue primes 2 and 3.

Consumers: conductor-import.

### tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction

Curve semistable reduction and the source-qualified semistable curve/Jacobian criterion, with all field/valuation hypotheses of Deligne–Mumford 2.4. This is the existing curve theorem, not a new abelian semistability construction.

Consumers: yuan-full-level-extension.

### AbelianSchemesAndArithmeticModuli:A3

Finite flat abelian torsion and isogenies, dual isogeny and Weil pairing with Cartier duality and Tate twist, with invertibility hypotheses; no Néron-model exactness is assumed.

Consumers: toric-finite-filtration, orthogonality, bgw-two-torsion, yuan-full-level-extension.

### tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces

Blowup charts, strict transforms, exceptional curves, normalized resolution and intersection multiplicities on actual arithmetic surfaces; these construct the minimal-model geometric configuration without redoing the generic blowup theory.

Consumers: kodaira-geometric-configurations.

The fine Part II import is NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence: closed immersion plus finite branch map, affine-neighborhood existence, cartesian square and complement isomorphism. The consumer proves its own ordinary-node normalization and genus calculation. The existing R01.6 source-decomposition node concerning Faltings over number fields does not supply the general local Tate-module carrier; R01.2/R01.3 decompositions likewise do not supply every requested comparison. Their precise stage requests therefore remain open.

## Closure register

### NeronModelsAndSemistableAbelianVarieties/G-existence

Dilatations along special-fibre centres, weak Néron models, termination of smoothening, and the boundedness/extension argument in BLR Chapters 3–6 are not read/decomposed here. Supply their actual hypotheses and proof leaves before source decomposition; excellence is not yet a pinned library class.

Needed by: weak-model, smoothening, local-existence.

### NeronModelsAndSemistableAbelianVarieties/G-spreading

BLR Lemma 1.2/5 and §1.4 scheme/group-law spreading and finite open gluing need full finite-presentation proofs; the existing stalk morphism API is insufficient.

Needed by: spread-abelian, dedekind-gluing.

### NeronModelsAndSemistableAbelianVarieties/G-Weil-extension

BLR Proposition 1.2/8 uses extension of rational maps from smooth test schemes to abelian schemes. Its cited extension proof is not decomposed; request an early abelian-scheme rigidity prefix, not the arithmetic moduli outputs.

Needed by: abelian-scheme-model.

### NeronModelsAndSemistableAbelianVarieties/G-relative-differentials

Global relative cotangent sheaves, identity pullback and the translation-invariance comparison are absent from the compile-ready carrier prefix. The existing affine Hopf co-Lie module is not a substitute for a generally non-affine Néron group.

Needed by: differential-lattice.

### NeronModelsAndSemistableAbelianVarieties/G-components

Representability and base-change/descent of identity components and component quotients for smooth non-affine finite-type groups are absent at the pins. The affine algebraically-closed Hopf implementation does not cover a Néron special fibre.

Needed by: identity-component, component-group.

### NeronModelsAndSemistableAbelianVarieties/G-Chevalley

The general non-affine Chevalley theorem and imperfect-field refinements cited in Conrad §2 require their original proof inputs. Only the Néron-fibre application is planned here; general connected-group theory is a supplier, not rebuilt.

Needed by: chevalley.

### NeronModelsAndSemistableAbelianVarieties/G-isogeny-sequences

For modular Jacobian degeneracy maps, exactness on character/component lattices needs the precise optimal quotient and kernel hypotheses. No generic exact Néron functor is supplied; YZ author erratum cites BLR p.190 Example 8 as a counterexample.

Needed by: isogeny-components.

### NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting

The finite-residue assertion uses H^1(k,M_k^0)=0 and smooth henselian lifting. Their full group-cohomological proofs are not decomposed; no rational surjectivity over an arbitrary residue field is asserted.

Needed by: elliptic-filtration.

### NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution

Only Tate §§4–6 and BLR §1.5 pp.20–23 were root-read; the source resolution/algorithm proof in Tate §7 and BLR chapters is not decomposed. Import the algorithm from EC4 and prove its geometric dictionary for the elliptic minimal model, including wild primes. Genus-one torsors, multiple fibres and rational/quasi-elliptic surface classifications stay in Part II.

Needed by: minimal-regular-smooth-locus, kodaira-geometric-configurations, kodaira-component-groups, wild-kodaira-comparison.

### NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix

C4 owns generic semi-abelian schemes, character lattices, biextensions and polarized 1-motive algebraization. Its full stage also includes modular-cusp dependencies; no whole-C4 backward edge is inserted. Request an independently named early carrier/extension/duality prefix before filling the omitted Lean signatures.

Needed by: toric-character, semistable-reduction.

### NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion

Conrad Proposition 4.4 uses its Zariski Main Theorem 4.7, smooth/étale lifting and the density of integral sections. The detailed source proof is read but its general scheme-theoretic prerequisites are not decomposed in this pass.

Needed by: semistable-identity-basechange.

### NeronModelsAndSemistableAbelianVarieties/G-finite-torsion

Finite/toric parts of model torsion use henselian quasi-finite decomposition (Conrad Theorem 4.10), finite flat torsion and p-divisible-group exactness. Their carriers/proof leaves are absent; R01.6 supplies only the generic Tate-module theory.

Needed by: toric-finite-filtration.

### NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality

The residue-prime orthogonality proof uses full faithfulness for p-divisible groups and Cartier duality, with characteristic restrictions. Do not substitute generic points for connected p-torsion or identify the finite part with inertia invariants at p.

Needed by: orthogonality.

### NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse

The original SGA7 IX converse requires the geometric structure/finite-flat torsion argument; only its statement and Conrad discussion are decomposed here. This is a theorem proof gap, not the semi-abelian predicate itself.

Needed by: monodromy-criterion.

### NeronModelsAndSemistableAbelianVarieties/G-valuations

Finite separable normalization and the excellent-DVR valuation extensions, including reduction to henselizations and descent, need the existing StableReduction/local-field supplier proofs with their exact hypotheses.

Needed by: finite-separable-semistable-extension.

### NeronModelsAndSemistableAbelianVarieties/G-level-kernel

The level-N integral linear algebra and monodromy criterion converse need their proof leaves before closure. N≥3 prime to residue characteristic is essential; no blanket finite-level NOS is valid.

Needed by: finite-torsion-semistability.

### NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization

Raynaud94 §4.2 references Bosch–Lütkebohmert uniformisation and formal algebraization proofs not independently read. No assertion of source decomposition or an implemented rigid quotient is made; formal/analytic carrier inputs are requests.

Needed by: raynaud-extension-comparison, rigid-uniformisation.

### NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity

Import the early C4 polarized extension/dual 1-motive/biextension effectiveness proof with its positive integral valuation data. Avoid a dependency on cusp/modular-curve outputs; those consume this reduction theory.

Needed by: rigid-uniformisation.

### NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud

Conrad §§7.12–7.14 and SGA7 IX Theorem 12.1 cite Raynaud/Artin representability and Picard quotient proofs not read in their original sources; singular-fibre sheaf, smoothness and separatedness proofs remain open. General sheafification is an import, not duplicate work.

Needed by: picard-zero.

### NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology

The units exact sequence, its fppf/étale cohomology and torus representability must be connected to the Picard carrier; the combinatorial homology supplier alone does not prove this group-scheme sequence.

Needed by: normalization-exact-sequence, characters-graph-homology.

### NeronModelsAndSemistableAbelianVarieties/G-integral-pairing

SGA7 IX Theorem 10.4 is root-read, but its transcendental/Jacobian reduction and §§9–10 biextension comparisons are not source-decomposed. Raynaud94 supplies valuation data, not a ready-made Lean bilinear construction.

Needed by: integral-monodromy-pairing.

### NeronModelsAndSemistableAbelianVarieties/G-thickness-resolution

The regular-resolution chain for a node xy=pi^m, its graph subdivision and compatibility of Picard/Néron models need the StableReduction blowup/intersection proof. The source-root-read SGA7 formula itself assumes a regular model with ordinary double points.

Needed by: graph-monodromy.

### NeronModelsAndSemistableAbelianVarieties/G-component-cokernel

SGA7 IX §§11.6 onward build the canonical component-cokernel isomorphism and its compatibility with the obstruction pairing; only the theorem and start of proof were read. The original proof is not replaced by a bare order equality.

Needed by: component-cokernel, component-pairing.

### NeronModelsAndSemistableAbelianVarieties/G-intersection-comparison

The actual vertical-divisor/multidegree comparison and Raynaud component quotient need the cited Picard theorem and local intersection proof. The existing numerical Pic(T) by itself does not provide a Néron component group. Multiple-fibre/index defects stay in Part II.

Needed by: intersection-component-quotient.

### NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors

The source Proposition 22 divisor relations and Weil-pairing argument need finite étale torsion and divisor-class API proofs. No generalized-Jacobian torsion carrier is yet compile-ready.

Needed by: bgw-two-torsion.

### NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard

The low-degree Picard/Brauer descent sequence and its quotient interpretation must be supplied from the general cohomological foundations; do not duplicate the Brauer carrier or collapse rational classes to rational line bundles.

Needed by: bgw-brauer-descent.

### NeronModelsAndSemistableAbelianVarieties/G-stable-Picard

Yuan arXiv v4 cites BLR §9.4 Theorem 1; that chapter and the full relative duality proof have not been independently read. The selected author URL refused access, so no author-copy or version-of-record collation is claimed.

Needed by: stable-family-picard.

### NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge

The bridge from the canonical nondegenerate integral character pairing to the actual inertia operator needs SGA7 IX §§9–10 and the good-model finite étale torsion comparison. NOS is planned, not formalized or source-closed.

Needed by: neron-ogg-shafarevich.

### NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison

The full cohomological/Weil–Deligne comparison and descent from potentially semistable reduction are supplier proofs. Raynaud94 describes the strict 1-motive monodromy and eigenvalues, not a compiled étale cohomology realization.

Needed by: local-euler-polynomial.

### NeronModelsAndSemistableAbelianVarieties/G-residual-invariants

SGA7 IX 11.5/CG Lemma A.7 must be connected by the exact integral monodromy and residual-invariants sequence. The condition concerns the dual geometric component group, not only rational Phi(k).

Needed by: residual-conductor-components.

### NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness

The precise degeneracy maps and optimal-quotient connected-kernel/saturation hypotheses are supplied by ModularCurvesPartII:R14.2 and its level-lowering consumers. They are consumers of R11, so no backward whole-stage dependency is added; only the conditional naturality/torus exact-sequence export is present.

Needed by: degeneracy-functoriality, character-exact-sequences.

### NeronModelsAndSemistableAbelianVarieties/G-isogeny-differentials

The isogeny-height owner must supply its precise local length/degree inequality or equality, including p-primary corrections. YZ author erratum repairs a specialized argument; it does not restore a general exact Néron-model functor.

Needed by: isogeny-differential-export.

### NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme

The existing pointed scheme/Weierstrass presentation and differential charts need their scheme-level comparison, not just a point group or a formal series. Preserve public native minimal/reduction/differential names; no equation-side replacement is introduced.

Needed by: equation-good-comparison, equation-multiplicative-comparison, equation-minimal-differential.

### NeronModelsAndSemistableAbelianVarieties/G-Ogg-geometry

EC4 and R01.3 own the conductor/Ogg theorem, including wild primes. The scheme adapter must prove that the algorithm geometric component count is the actual regular-fibre count. Tate p.46 alone proves only the tame displayed table.

Needed by: equation-conductor-comparison.

### NeronModelsAndSemistableAbelianVarieties/G-strict-compatibility

Noot 2013 Corollary 2.7, Noot 2017 Corollary 2.2, the Saito/BLGGT base-change trace trick and the étale exterior-power realization are not independently read. The potential-modularity owner supplies the actual compatible-system carrier/operations; this node exports reduction inputs only.

Needed by: strict-compatible-system-export.

### NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix

Ordinary abelian p-divisible connected/étale decomposition, its saturated Tate submodule and isotropy proof are inputs from the abelian/integral p-adic supplier. This pass does not formalize ordinary p-divisible groups or deduce them from residue-prime inertia invariants.

Needed by: semistable-ordinary-adapter, ordinary-isotropic-filtration.

### NeronModelsAndSemistableAbelianVarieties/G-residual-image

The specific S6/GSp4(F2) outer-automorphism convention and S5(b)∩Siegel-parabolic calculation are owned by the abelian-surface modularity/finite-group suppliers. They are not a reverse dependency on the final modularity theorem.

Needed by: ordinary-residual-point-export.

### NeronModelsAndSemistableAbelianVarieties/G-Yuan-valuation-scope

The source full-level argument invokes Deligne–Mumford 2.4. Its original hypotheses, especially any perfect residue/constant-field restriction, must be read before expanding the adapter to arbitrary k. Height positivity, Torelli and the lower bound are other owners, not claims here.

Needed by: yuan-full-level-extension.

### NeronModelsAndSemistableAbelianVarieties/G-BGW-cup-product

BGW cites an earlier Proposition 10.3 for the boundary/cup-product identification; the original proof has not been independently read. Import cup products, finite-torsor cohomology and Brauer realization rather than inventing them here.

Needed by: bgw-boundary-cup-product.

## Suggested-file omission register

These are omissions, not empty signatures. No unexpressible hypothesis is replaced by a raw proposition or an admitted proposition-valued definition. Each entry records exactly the declaration, API and example names absent as executable signatures. The packet keeps their mathematical specifications and transitive inputs.

- TauCeti.NeronBlueprint.GroupLaw: The native Over/Scheme prefix cannot yet state the exact Unique group structure on the Néron model interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.Smoothening: The native Over/Scheme prefix cannot yet state the exact Local weak-model smoothening target interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.LocalExistence: The native Over/Scheme prefix cannot yet state the exact Local existence of Néron models interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.SpreadAbelian: The native Over/Scheme prefix cannot yet state the exact Spread an abelian variety to a dense open interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-spreading, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.AbelianSchemeModel: The native Over/Scheme prefix cannot yet state the exact An abelian scheme is the Néron model interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.DedekindGluing: The native Over/Scheme prefix cannot yet state the exact Dedekind local-to-global construction interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.EtaleBasechange: The native Over/Scheme prefix cannot yet state the exact Étale and unramified base change interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: the native prefix plus the object geometry stated above.
- TauCeti.NeronBlueprint.DifferentialLattice: The native Over/Scheme prefix cannot yet state the exact Invariant-differential lattice interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: NeronDifferentials.rank, NeronDifferentials.generic_iso, NeronDifferentials.localize, NeronDifferentials.pullback, NeronDifferentials.map_id, NeronDifferentials.map_comp, NeronDifferentials.det, NeronDifferentials.det_localize, NeronDifferentials.etale_basechange, NeronDifferentials.affine_colie. Test names: NeronDifferentials.zero_dimension, NeronDifferentials.localization_test, NeronDifferentials.projective_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.IdentityComponent: The native Over/Scheme prefix cannot yet state the exact Identity component of the special fibre interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: NeronIdentity.open, NeronIdentity.normal, NeronIdentity.contains_zero, NeronIdentity.geometrically_connected, NeronIdentity.generic_iso, NeronIdentity.basechange_field, NeronIdentity.map, NeronIdentity.map_id, NeronIdentity.map_comp, NeronIdentity.good. Test names: NeronIdentity.good_test, NeronIdentity.split_tate_test, NeronIdentity.nonaffine_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.ComponentGroup: The native Over/Scheme prefix cannot yet state the exact Finite étale component group interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: NeronComponents.projection, NeronComponents.kernel, NeronComponents.quotient, NeronComponents.finite_etale, NeronComponents.geometric, NeronComponents.rational, NeronComponents.map, NeronComponents.map_id, NeronComponents.map_comp, NeronComponents.good. Test names: NeronComponents.good_test, NeronComponents.tate_test, NeronComponents.nonsplit_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.Chevalley: The native Over/Scheme prefix cannot yet state the exact Chevalley decomposition with field hypotheses interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.ToricCharacter: The native Over/Scheme prefix cannot yet state the exact Toric character lattice interface interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.IsogenyComponents: The native Over/Scheme prefix cannot yet state the exact Isogeny functoriality without false exactness interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-isogeny-sequences, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.EllipticFiltration: The native Over/Scheme prefix cannot yet state the exact Elliptic reduction filtration comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.
- TauCeti.NeronBlueprint.MinimalRegularSmoothLocus: The native Over/Scheme prefix cannot yet state the exact Smooth locus of the elliptic minimal regular model interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models.
- TauCeti.NeronBlueprint.KodairaGeometricConfigurations: The native Over/Scheme prefix cannot yet state the exact Geometric Kodaira configurations interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.KodairaComponentGroups: The native Over/Scheme prefix cannot yet state the exact Geometric component groups by Kodaira type interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.WildKodairaComparison: The native Over/Scheme prefix cannot yet state the exact Wild primes retained in elliptic comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.SemistableReduction: The native Over/Scheme prefix cannot yet state the exact Semistable reduction predicate interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: SemistableReduction.iff_identity, SemistableReduction.good, SemistableReduction.no_unipotent, SemistableReduction.dimension, SemistableReduction.isogeny, SemistableReduction.dual, SemistableReduction.finite_basechange, SemistableReduction.identity_basechange, SemistableReduction.toric_zero, SemistableReduction.product. Test names: SemistableReduction.good_test, SemistableReduction.tate_test, SemistableReduction.additive_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.SemistabilityIsogeny: The native Over/Scheme prefix cannot yet state the exact Semistability under isogeny interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-isogeny-sequences, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.SemistableIdentityBasechange: The native Over/Scheme prefix cannot yet state the exact Semistable identity-model base change interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.RamifiedTateCounterexample: The native Over/Scheme prefix cannot yet state the exact Ramified Tate component calculation interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.
- TauCeti.NeronBlueprint.ToricFiniteFiltration: The native Over/Scheme prefix cannot yet state the exact Toric and finite Tate submodules interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.Orthogonality: The native Over/Scheme prefix cannot yet state the exact Weil orthogonality of the filtration interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.InertiaSquareZero: The native Over/Scheme prefix cannot yet state the exact Semistable inertia is unipotent of height two interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.MonodromyCriterion: The native Over/Scheme prefix cannot yet state the exact Grothendieck semistability criterion interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.FiniteSeparableSemistableExtension: The native Over/Scheme prefix cannot yet state the exact Semistable reduction after finite extension interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-valuations, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.FiniteTorsionSemistability: The native Over/Scheme prefix cannot yet state the exact Prime-to-residue full level forces semistability interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-level-kernel, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.RaynaudExtensionComparison: The native Over/Scheme prefix cannot yet state the exact Raynaud formal extension comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.RigidUniformisation: The native Over/Scheme prefix cannot yet state the exact Polarized lattice uniformisation comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.PicardZero: The native Over/Scheme prefix cannot yet state the exact Degree-zero Picard of a semistable curve interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: SemistablePicard.generic, SemistablePicard.special, SemistablePicard.multidegree, SemistablePicard.smooth, SemistablePicard.separated, SemistablePicard.semiabelian, SemistablePicard.pullback, SemistablePicard.pullback_id, SemistablePicard.pullback_comp, SemistablePicard.smooth_case. Test names: SemistablePicard.smooth_test, SemistablePicard.irreducible_node_test, SemistablePicard.tree_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme.
- TauCeti.NeronBlueprint.NormalizationExactSequence: The native Over/Scheme prefix cannot yet state the exact Normalization sequence for the generalized Jacobian interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.CharactersGraphHomology: The native Over/Scheme prefix cannot yet state the exact Characters are integral graph cycles interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.PicardNeronIdentity: The native Over/Scheme prefix cannot yet state the exact Picard identity and Néron identity comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme.
- TauCeti.NeronBlueprint.IntegralMonodromyPairing: The native Over/Scheme prefix cannot yet state the exact Integral monodromy pairing interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: NeronMonodromy.bilinear, NeronMonodromy.adjoint, NeronMonodromy.non_degenerate, NeronMonodromy.dual_symmetry, NeronMonodromy.polarized_symmetric, NeronMonodromy.polarized_positive, NeronMonodromy.prime_adic, NeronMonodromy.basechange, NeronMonodromy.functorial, NeronMonodromy.zero_torus. Test names: NeronMonodromy.tate_test, NeronMonodromy.ramification_test, NeronMonodromy.good_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.GraphMonodromy: The native Over/Scheme prefix cannot yet state the exact Graph formula for Jacobian monodromy interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-thickness-resolution, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.ComponentCokernel: The native Over/Scheme prefix cannot yet state the exact Component group from monodromy cokernel interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.ComponentPairing: The native Over/Scheme prefix cannot yet state the exact Grothendieck component pairing interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: NeronComponentPairing.bilinear, NeronComponentPairing.galois, NeronComponentPairing.dual, NeronComponentPairing.perfect_semistable, NeronComponentPairing.discriminant, NeronComponentPairing.independent_lifts, NeronComponentPairing.zero_left, NeronComponentPairing.zero_right, NeronComponentPairing.functorial, NeronComponentPairing.good. Test names: NeronComponentPairing.tate_test, NeronComponentPairing.lift_test, NeronComponentPairing.n1_test. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.IntersectionComponentQuotient: The native Over/Scheme prefix cannot yet state the exact Intersection matrix component description interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-intersection-comparison, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.BgwNodalPinch: The native Over/Scheme prefix cannot yet state the exact BGW one-node curve adapter interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence.
- TauCeti.NeronBlueprint.BgwGeneralizedJacobian: The native Over/Scheme prefix cannot yet state the exact BGW generalized Jacobian torus interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.BgwTwoTorsion: The native Over/Scheme prefix cannot yet state the exact BGW finite two-torsion comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.BgwBrauerDescent: The native Over/Scheme prefix cannot yet state the exact BGW rational classes versus rational divisors interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.StableFamilyPicard: The native Over/Scheme prefix cannot yet state the exact Stable-family Picard and Hodge comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-stable-Picard, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme.
- TauCeti.NeronBlueprint.NeronOggShafarevich: The native Over/Scheme prefix cannot yet state the exact Néron–Ogg–Shafarevich interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.GoodIsogeny: The native Over/Scheme prefix cannot yet state the exact Good reduction is isogeny invariant interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.PadicComparisonImport: The native Over/Scheme prefix cannot yet state the exact p-adic reduction comparisons are imported interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, AbelianSchemesAndArithmeticModuli:A1, PadicHodgeTheory:R06.6.
- TauCeti.NeronBlueprint.ConductorImport: The native Over/Scheme prefix cannot yet state the exact Artin and Swan conductor interface interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.SemistableConductorRank: The native Over/Scheme prefix cannot yet state the exact Semistable conductor equals toric rank interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.LocalEulerPolynomial: The native Over/Scheme prefix cannot yet state the exact Full-monodromy local Euler polynomial interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.EllipticLocalPolynomial: The native Over/Scheme prefix cannot yet state the exact Elliptic polynomial preserves the native definition interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.
- TauCeti.NeronBlueprint.ResidualConductorComponents: The native Over/Scheme prefix cannot yet state the exact Residual conductor and dual components interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-residual-invariants, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.DegeneracyFunctoriality: The native Over/Scheme prefix cannot yet state the exact Degeneracy maps and monodromy adjoints interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.CharacterExactSequences: The native Over/Scheme prefix cannot yet state the exact Character exact sequences require verified kernels interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0.
- TauCeti.NeronBlueprint.SemistableDifferentialBasechange: The native Over/Scheme prefix cannot yet state the exact Semistable differential base change interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion, AbelianSchemesAndArithmeticModuli:A1.
- TauCeti.NeronBlueprint.IsogenyDifferentialExport: The native Over/Scheme prefix cannot yet state the exact Isogeny-height integral lattice export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge, NeronModelsAndSemistableAbelianVarieties/G-isogeny-differentials, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.EquationGoodComparison: The native Over/Scheme prefix cannot yet state the exact Equation versus abelian-scheme good reduction interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models.
- TauCeti.NeronBlueprint.EquationMultiplicativeComparison: The native Over/Scheme prefix cannot yet state the exact Equation versus toric elliptic reduction interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.EquationDiscriminantComparison: The native Over/Scheme prefix cannot yet state the exact Minimal discriminant and regular-fibre geometry interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.EquationConductorComparison: The native Over/Scheme prefix cannot yet state the exact Ogg exponent and full conductor comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Ogg-geometry, AbelianSchemesAndArithmeticModuli:A1, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.EquationComponentComparison: The native Over/Scheme prefix cannot yet state the exact Tamagawa number uses rational components interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.EquationMinimalDifferential: The native Over/Scheme prefix cannot yet state the exact Minimal differential equals Néron lattice basis interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme, AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models.
- TauCeti.NeronBlueprint.StrictCompatibleSystemExport: The native Over/Scheme prefix cannot yet state the exact Abelian cohomology compatible-system export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-valuations, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison, NeronModelsAndSemistableAbelianVarieties/G-strict-compatibility, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6, PadicHodgeTheory:R06.6.
- TauCeti.NeronBlueprint.SemistableOrdinaryAdapter: The native Over/Scheme prefix cannot yet state the exact Semistable ordinary reduction adapter interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.OrdinaryIsotropicFiltration: The native Over/Scheme prefix cannot yet state the exact Ordinary surface isotropic filtration export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.OrdinaryResidualPointExport: The native Over/Scheme prefix cannot yet state the exact BCGP ordinary residual point export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix, NeronModelsAndSemistableAbelianVarieties/G-residual-image, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.UnramifiedThreeTorsionAtTwo: The native Over/Scheme prefix cannot yet state the exact Unramified three-torsion at two gives semistability interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-level-kernel, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6.
- TauCeti.NeronBlueprint.YuanFullLevelExtension: The native Over/Scheme prefix cannot yet state the exact Full level extension for curve semistability interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-level-kernel, NeronModelsAndSemistableAbelianVarieties/G-Yuan-valuation-scope, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction.
- TauCeti.NeronBlueprint.AcceptanceExamples: The native Over/Scheme prefix cannot yet state the exact Good, split, nonsplit and nodal acceptance suite interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-thickness-resolution, AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion.
- TauCeti.NeronBlueprint.BgwOddFactorTorsors: The native Over/Scheme prefix cannot yet state the exact BGW odd-factor torsors interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors, NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.
- TauCeti.NeronBlueprint.BgwBoundaryCupProduct: The native Over/Scheme prefix cannot yet state the exact BGW two-torsion connecting class interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them. API names: none. Test names: none. Inputs: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors, NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard, NeronModelsAndSemistableAbelianVarieties/G-BGW-cup-product, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.

## Source edition and reading boundaries

Only the following primary passages were read by this worker. An extracted catalogue item is a lookup lead, not a substitute for reading. Scanned BLR, SGA7 and Tate passages were viewed as page images; French passages were read in the original. No public file contains a source PDF, image or extracted book text.

### CONRAD-SR: Semistable reduction for abelian varieties

Brian Conrad. Author lecture notes, Darmon CM seminar, 2011.

[CONRAD-SR primary text](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf). Accessed 2026-10-04. SHA-256: bfbad9fc883b2a6ac6e5f842abc664c2ebc84c348b9d80fa4ca6313b37e28173.

Read: Entire 35-page notes, including references; p.18 formula checked on page image.

### BLR-CH1: Néron Models, Chapter 1

Siegfried Bosch, Werner Lütkebohmert, Michel Raynaud. Springer Ergebnisse 21, 1990; scanned Chapter 1.

[BLR-CH1 primary text](https://math.arizona.edu/~cais/scans/BLR-Neron_Models/neron1.pdf). Accessed 2026-10-04. SHA-256: 32baed54631829b55af3c9e883db41cbde8820fcd1e75cfaccd75584be7149b6.

Read: Cover, introduction printed pp.2–6; §§1.1–1.4 printed pp.7–20; §1.5 printed pp.20–23. Selected images only; existence/Picard chapters not read.

### SGA7: Groupes de monodromie en géométrie algébrique I, Exposé IX

Alexander Grothendieck. SGA7 I, LNM 288, 1972; original scanned French edition.

[SGA7 primary text](https://library.slmath.org/nonmsri/sga/sga/pdf/sga7-1.pdf). Accessed 2026-10-04. SHA-256: 17286b0f0bec451068e0a5fa2c39e93de28e7c1ecee6739487cfac11c03c8dab.

Read: Introduction and §§1.0–1.4, printed pp.314–324 (PDF319–329); §10.3 base-change formula and Theorem10.4, printed pp.443–444 (PDF448–449); Theorem11.5 and start §11.6, printed pp.455–456 (PDF460–461); Theorem12.1, printed pp.465–467 (PDF470–472); §§12.3.5–12.5, printed pp.471–475 (PDF476–480); Locator probes at PDF440,450,490 are not claims of reading their surrounding sections.

### RAYNAUD94: 1-motifs et monodromie géométrique

Michel Raynaud. Astérisque 223, 1994, pp.295–319.

[RAYNAUD94 primary text](https://www.numdam.org/item/AST_1994__223__295_0.pdf). Accessed 2026-10-04. SHA-256: b0cf9b1a112beb11937a5efb36e40c19a6b819d53fcd28325fb465352d460a45.

Read: Entire 25-page article, definitions, §§4.1–4.7 and references; cited Bosch–Lütkebohmert papers not independently read.

### YUAN-ARXIV: Bigness of the tautological line bundle and the uniform Bogomolov conjecture

Xinyi Yuan. arXiv:2108.05625v4, 30 April 2024.

[YUAN-ARXIV primary text](https://arxiv.org/pdf/2108.05625v4). Accessed 2026-10-04. SHA-256: a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e.

Read: §3.1.3 and Lemma3.4 pp.43–44; Lemma4.9 proof p.76. Not the August2024 author manuscript or the final journal version.

### YZ: On the averaged Colmez conjecture

Xinyi Yuan, Shou-Wu Zhang. Annals of Mathematics187(2018), published PDF.

[YZ primary text](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Accessed 2026-10-04. SHA-256: 29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507.

Read: §1.1 pp.534–535; §2.3 Theorem2.7 proof pp.549–550, compared to author erratum introduction.

### YZ-ERR: Erratum to On the Averaged Colmez Conjecture

Xinyi Yuan, Shou-Wu Zhang. Author revision dated18 December2022.

[YZ-ERR primary text](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf). Accessed 2026-10-04. SHA-256: 18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91.

Read: Introduction and Theorem1 opening pp.1–2. Not collated against Annals198(2023)867–878.

### CG: Coherent cohomology and Galois representations, Appendix

Frank Calegari, David Geraghty. Author-hosted typeset copy, 2020.

[CG primary text](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Accessed 2026-10-04. SHA-256: fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5.

Read: Lemma A.7 and its conductor proof, author-copy p.89 / typeset p.889. Not byte-collated with publisher PDF.

### BGW: A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension

Manjul Bhargava, Benedict H. Gross, Xiaoheng Wang. arXiv:1310.7692v2.

[BGW primary text](https://arxiv.org/pdf/1310.7692v2). Accessed 2026-10-04. SHA-256: 8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2.

Read: Introduction; §3 pp.9–11, generalized Jacobian, Proposition22 and boundary/cup-product paragraph. Not journal collation.

### BCGP21: Abelian surfaces over totally real fields are potentially modular

George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. arXiv:1812.09269v3.

[BCGP21 primary text](https://arxiv.org/pdf/1812.09269v3). Accessed 2026-10-04. SHA-256: 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed.

Read: Proposition2.8.1 and Definition2.8.2, p.36; compared with published pp.194–195.

### BCGP21-PUBLISHED: Abelian surfaces over totally real fields are potentially modular

George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. Publications mathématiques de l IHÉS134(2021), published PDF.

[BCGP21-PUBLISHED primary text](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Accessed 2026-10-04. SHA-256: b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af.

Read: Proposition2.8.1, its proof and Definition2.8.2/Remark2.8.3, pp.194–195; p.194 checked on page image.

### BCGP25: Modularity theorems for abelian surfaces

George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. arXiv:2502.20645v1, 28 February2025.

[BCGP25 primary text](https://arxiv.org/pdf/2502.20645v1). Accessed 2026-10-04. SHA-256: 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c.

Read: Definition9.1.7, Lemma9.1.8 with full proof and Definition9.2.1/Lemma9.2.2, pp.190–192; p.191 checked on page image.

### TATE: Algorithm for determining the type of a singular fiber in an elliptic pencil

John Tate. LNM476(1975), pp.33–52; scanned edited letter.

[TATE primary text](https://wstein.org/Tables/antwerp/tate/tate.pdf). Accessed 2026-10-04. SHA-256: 8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc.

Read: §§4–6, printed pp.41–46 (PDF9–14). The §7 algorithm proof pp.47–52 is not read/decomposed here.

## Source corrections and cautions

### NeronModelsAndSemistableAbelianVarieties/E1

Misprint, CONRAD-SR, Author2011 notes p.18, paragraph following Lemma5.4; inspected page image.

Correction: 2g − (t + 2a) = t

Reason: Lemma5.4 gives finite-part rank t+2a and semistability gives g=t+a. For g=t=1,a=0 the printed expression is0, but the actual corank is1. The surrounding theorem is unchanged.

Reach: nothing. Known correction: new.

Search boundary: The actual author-hosted2011 PDF, hash in sourceVersions; Targeted author-domain searches for SemistableReduction corank/errata on2026-10-04; Search returned the author mordellsem/Notes/L13.pdf with the same expression; no correction located. This is a bounded negative search, not proof of priority..

### NeronModelsAndSemistableAbelianVarieties/E2

Misprint, BCGP25, Lemma9.1.8 proof, arXiv2502.20645v1 p.191, page image.

Correction: Use the toric submodule T₂(B)_t, of rank2, rather than the whole Tate module, of rank4.

Reason: The proof seeks a rank-two saturated isotropic submodule. A surface has full Tate rank4 and the preceding filtration gives toric rank t=2 in this case. The intended argument and theorem are unchanged.

Reach: nothing. Known correction: new.

Search boundary: arXiv2502.20645 submission history checked2026-10-04: only v1 listed; Author-hosted Modular.pdf selected p.191 search result contains the same paragraph; no byte collation claimed; Targeted primary-source author/arXiv title+erratum and9.1.8 correction searches; no correction found. No version-of-record claim for this preprint..

### NeronModelsAndSemistableAbelianVarieties/E3

Misprint, YUAN-ARXIV, Lemma4.9 proof, arXiv2108.05625v4 p.76.

Correction: J is the Jacobian of C over K.

Reason: The lemma introduces C and subsequently applies the curve criterion to C; no X is introduced here.

Reach: nothing. Known correction: new.

Search boundary: Own selected arXivv4 p.76 compared with the already confirmed extraction PAPER-YUAN-26/E18; Selected author URL refused the connection on2026-10-04; no author or journal collation claimed by this worker.

### NeronModelsAndSemistableAbelianVarieties/E4

Misprint, BCGP21-PUBLISHED, Proposition2.8.1, published p.194 and arXivv3 p.36; both selected passages read.

Correction: 0 ≤ i ≤ 2 dim A

Reason: The statement introduces an abelian variety A, not X; its cohomological dimension is2 dim A. The same slip is present in the collated published page image.

Reach: nothing. Known correction: new.

Search boundary: Own selected arXivv3 and published pp.194–195 collation; Already confirmed extraction E19 checked against these selected passages; this is not an independent novelty claim.

### NeronModelsAndSemistableAbelianVarieties/E5

Error, YZ, Published2018 §2.3, Theorem2.7 proof p.549, compared with author erratum introduction.

Correction: Generic exact sequences need not remain exact on Néron models; use the specialized weakened statement in the erratum and retain explicit exactness hypotheses for every component/character sequence.

Reason: The authors explicitly withdraw this general exactness step and cite BLR p.190 Example8. This packet does not derive general lattice or conductor sequences from it.

Reach: the proof. Known correction: Yuan–Zhang erratum, author revision18 December2022; published Annals198(2023)867–878, DOI10.4007/annals.2023.198.2.8.

Search boundary: Own published p.549 and author Erratum5.pdf selected opening; The already reviewed extraction identifies the published erratum; the final2023 PDF is not collated here.

## Planning status and upstream notes

A target-first planning pass for finite-type Néron models over arithmetic Dedekind bases and excellent DVRs, non-affine special fibres, semistable identity models and Raynaud uniformisation, singular Picard geometry and integral monodromy, and the conductor/local-factor exports actually used by the routed sources. All six stages are planned, not source-decomposed or closed. The compile-ready prefix uses native Scheme/Over morphisms; advanced signatures and untranscribed proof leaves are recorded exactly rather than simulated. Existing curve, equation, character, formal and Galois theories are imported, and modularity/finiteness conclusions remain consumers.

The pass stops because all six stages are planned, below the 300-node budget. None is source-decomposed or closed; there are 39 explicit gaps and 14 requested supplier stages. This status concerns planning coverage only. Every node remains implementationStatus unchecked.

tauceti:TauCetiRoadmap/EllipticCurves EC4 → StableReduction SR5 link: The confirmed RT-1/21 requires an actual geometric Kodaira dictionary beyond numerical type/minimal-model existence. This packet owns the pointed elliptic dictionary in R11.2; Part II owns the general genus-one/multiple-fibre/surface extensions. The upstream link is only noted, never edited.

tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction (curve–Jacobian criterion): RT-AREA-algebraicgeometry/23 (confirmed): StableReduction Layer 7 owns the equivalence between semistable reduction of a curve and of its Jacobian (RS-25) but has no incoming edge. The criterion consumes R11.1 (Néron models, here over excellent DVRs), R11.3 (semistable reduction of abelian varieties through the identity component) and R11.4 (Picard schemes of semistable models compared with the Néron model of the Jacobian), together with JacobianChallenge Layer D. For the maintainer: add the edges R11.1, R11.3, R11.4 and JacobianChallenge Layer D → StableReduction Layer 7, and state the criterion with R11.1’s excellent-DVR hypothesis as well as the residue-field hypothesis, since StableReduction works over arbitrary DVRs. No R11.1, R11.3 or R11.4 node depends on Layer 7, and in the atlas stage edges together with the roadmap definitions the four edges are acyclic (checked 2026-10-09). R11.6/yuan-full-level-extension imports Layer 7, and the stage-level graph of all research packets has a long path from R11.6 back to R11.3, so the dependency should be recorded at node level, on the criterion alone. The upstream roadmap is only noted, never edited.

ShimuraCompactifications:C4: An early abstract semi-abelian/character/biextension/1-motive prefix is needed before the boundary outputs. No whole-C4 backward edge is added; G-semiabelian-prefix records the request for future finer naming.

LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves: Use only its weight-independent normalization/node specialization prefix when refining the graph/monodromy comparison. Do not import the weight-theoretic invariant-cycle suffix or assume a higher-dimensional weight-monodromy theorem.
