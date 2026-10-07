# Excursion operators and the spectral action: parameters and their functorial properties

This part plans the proved semisimple parameter assignment and its functorial properties. Its output is a conjugacy class of continuous semisimple Weil parameters, characterized by every finite-leg excursion coefficient. It supplies neither a monodromy operator nor a categorical local Langlands equivalence. The integral categorical action's dual-fundamental-group prime restriction is a separate theorem and does not restrict the field-valued assignment here.

The four layers are ES5, ES6, ES6:functoriality and ES6:duality. Each is **planned** at target level. Every target has a declaration, and each prerequisite chain terminates at a pinned declaration, an existing supplier node, a requested supplier stage or a stated gap. No layer is closed: the eight gaps and thirteen requests at the end are substantive mathematical interfaces, not claims of implementation. All declarations have implementation status **unchecked**.

## Conventions and the construction route

Let E be a nonarchimedean local field of **residue characteristic** p and residue cardinality q. Thus E may have characteristic zero or p. Fix a prime ℓ different from p, a connected reductive E-group G, and the normalized Satake square root of q. Lambda denotes an eligible coefficient algebra; L denotes an algebraically closed Z_ℓ[sqrt(q)]-field, with its relatively discrete condensed coefficient structure. Characteristic ℓ is included. The word continuous for a parameter refers to the imported condensed topology, not to a homomorphism between groups stripped of topology.

Write W_E for the local Weil group and Q for the fixed finite quotient through which its action on the pinned dual group factors. An L-parameter lifts W_E → Q in Ghat(L) ⋊ Q. Changing a representative by Ghat(L)-conjugation changes none of the output. Semisimple means the closed-orbit/G-complete-reducibility convention supplied by LP2; it does not mean that the image of each individual element is a semisimple matrix. A statement concerning a product retains one common Weil projection rather than introducing two unrelated copies of W_E.

The construction proceeds through actual scalar units. The ES0 operators take values in the condensed degree-zero endomorphism algebra of a sheaf. Schur irreducibility says that its specified unit from L is invertible in condensed algebras. Its inverse produces a condensed family of excursion characters, with both finite-leg relations. LP2 reconstructs the unique semisimple parameter class, including its prescribed projection and continuity. For a smooth representation, the enriched stratum dictionary and fully faithful adjunction first establish the condensed Schur condition. An abstract endomorphism-ring calculation alone does not discharge that step.

For ordinary smooth representations the indispensable foundational input is admissibility over the chosen coefficient field. In characteristic ℓ the required theorem is Vignéras' admissibility theorem, not the complex Bernstein theorem. The proposed SR.3b is independent of this roadmap and of the late SR.6. The verified correction to the red-team finding is retained: Fbar_ℓ is countable, whereas Qbar_ℓ is uncountable. In particular every characteristic-zero Z_ℓ-field contains Q_ℓ, so an uncountability argument is available in that case. ES5 owns the condensed refinement, and requests the foundational representation theorem from its owner.

The spectral-to-geometric centre map is the ES1:spectral-center input of IX.5.2. Its coefficient hypothesis is invertibility of |π₀ Z(G)|, imposed for every group appearing in a centre diagram. If it fails, the same comparison is formulated for integral excursion operators. Evaluation on Schur objects still gives the field-valued parameter assertion. No step imports ES3's categorical good-prime restriction as a substitute for this coefficient policy.

For torus normalization, Art_arith sends a uniformizer to arithmetic Frobenius and rec_geom = Art_arith composed with inversion sends it to geometric Frobenius. The underlying class-field-theory normalization is already fixed upstream and is consumed without modification. Fargues' associated-sheaf convention introduces a second, character inversion. The endpoint calculation that connects it to the Hecke convention is recorded explicitly as a gap; it is not erased by changing the name of reciprocity.

## Ownership and supplier boundaries

The following are mathematical imports, not declarations to recreate in this part. Exact node references are given again at each use.

| Owner | Interface consumed here |
| --- | --- |
| ES0 | Excursion algebra action and condensed continuity of its evaluations. |
| ES1:spectral-center | Conditional spectral-to-geometric centre map, change of data, and excursion-only variant. |
| LP0 and LP2 | Condensed cocycles, projection to Q, closed-orbit classification, integral excursion presentation, and general-coefficient reconstruction. |
| GS4:integral-dual-group | Normalized Satake, the Chevalley involution, and adjoint-isomorphism, product and restriction-of-scalars naturality. |
| HS1 and HS4 | Condensed Hecke action, relative-homology kernels, and the geometric comparison diagrams before scalar evaluation. |
| VS4 and VS5 | Stratum equivalence and enriched adjunction; exterior compact generators and their Hom comparison; Bernstein–Zelevinsky duality. |
| SR.0, SR.1 and SR.2 | Smooth representation carriers, arbitrary-coefficient abelian Bernstein centre, central characters and the induction/contragredient dictionary. The modular admissibility extension is requested as SR.3b. |
| BG0 and BG1 | Torsor/bundle identifications and the torus specialization B(T)=π₁(T)_Γ. |
| RG2.5 and proposed RG2.6 | Existing reductive dual/root data, with a requested extension for induced-torus resolutions, surjective z-extensions and their dual maps. |
| RelativeFarguesFontaine RF3 and its requested Part II | Existing line-bundle signs, extended by the Lubin–Tate universal-cover torsor and endpoint actions. |
| Upstream ClassFieldTheory and its requested Part II | Arithmetic local reciprocity in its documented field range; full equal-characteristic wild reciprocity exceeds that endpoint. |
| ES7:parabolic | The parabolic parameter theorem used by the general smooth-dual proof return. ES7 imports ES6:functoriality, and this return must not create the reverse dependence through ES6:duality. |

Mathlib's condensed sheaves, algebra homomorphisms, category centres, representation intertwiners, group algebras and free-group results remain baseline declarations. Its abelian Shapiro theorem does not replace nonabelian Shapiro for the cocycle quotient stack. The nonabelian comparison is proved in the restriction-of-scalars proof below. No Schreier rank formula is required: freeness and finite generation suffice.

## ES5. The proved semisimple parameter assignment

The following eight declarations cover the Schur condition, scalar extraction, reconstruction, the representation assignment, eligible stratum embeddings, and isomorphism/coefficient comparisons. Coefficient transport is conditional on the required base-change comparison and on retaining the Schur condition after extension. It does not assert that an arbitrary extension preserves irreducibility or Schur irreducibility.

### Schur irreducibility in condensed algebras

**Declaration:** `IsSchurIrreducible` · definition. Node `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`.

Fix a nonarchimedean local field E of residue cardinality q and residue characteristic p, a prime ell different from p, a connected reductive E-group G, and an algebraically closed Z_ell[sqrt(q)]-field L. Give L its relatively discrete condensed Z_ell-algebra structure. For A in D_lis(Bun_G,L), write End(A) for the degree-zero algebra in its condensed mapping object. A is Schur-irreducible precisely when the scalar unit L to End(A) is an isomorphism of condensed L-algebras. An abstract scalar endomorphism ring alone is insufficient to establish this definition.

**Hypotheses and conventions.** End means degree zero, not the whole derived mapping complex. The condensed enhancement and its scalar unit are those of HS1/IX.1. Compact-source Hom is relatively discrete by IX.1.2; arbitrary A is handled by the induced enhancement.

**Construction or proof.**

1. Import the enhanced category and unit; take invertibility of that specific unit, using the existing category of condensed algebras.
2. Invert the unit to recover unique scalar sections over every profinite test object, compatibly with restriction.
3. Use the unit-preserving endomorphism isomorphism under a sheaf isomorphism or shift; no t-structure or compactness hypothesis enters this invariance.

**Uses that determine the API.**

- IX.4.1: Turn an excursion endomorphism into a scalar while retaining its condensed dependence on Weil elements.
- ES5 representation assignment: Prove the definition for the transported representation, rather than replace it by abstract Schur’s lemma.

**API.**

- `IsSchurIrreducible.scalarIso` (constructor): Invert the scalar unit to obtain its canonical condensed algebra isomorphism.
- `IsSchurIrreducible.scalar_unique` (characterisation): For every test object S and endomorphism section e there is exactly one scalar section a whose unit image is e.
- `IsSchurIrreducible.sections_bijective` (structure): The scalar unit is bijective on sections over every S.
- `IsSchurIrreducible.iso_invariant` (functoriality): A scalar-unit-preserving isomorphism of endomorphism algebras preserves and reflects Schur irreducibility.
- `IsSchurIrreducible.shift` (functoriality): The canonical endomorphism isomorphism for a shift, which preserves the unit, carries Schur irreducibility to the shifted object.

**Unit tests.** These are typed mathematical obligations; their corresponding examples in the suggested file exercise the documented prototype fragments.

- `schur_scalar_identity` (computation): The identity unit on the relatively discrete scalar algebra is Schur.
- `schur_rejects_zero` (degenerate): If a scalar section ring is nonzero and the target section ring has zero equal to one, its scalar unit is not Schur.
- `schur_requires_all_sections` (non-example): Failure of bijectivity on any condensed test object excludes Schur irreducibility, even if a global-section comparison is known.

**Acceptance.**

- The zero object fails: its identity is zero whereas L is nonzero.
- Check all condensed sections, not only global sections.
- A shift of a Schur object remains Schur.

**Direct prerequisites.** `mathlib:Condensed`; `mathlib:AlgCat`; `mathlib:CategoryTheory.IsIso`; `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1, p. 327: The printed Schur condition; the scalar-unit formulation fixes its canonical algebra structure.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.1.2, pp. 320–321: Specifies the compact-source enhancement; it does not say every irreducible representation is compact.

**Planet:** Condensed Schur irreducibility.

### The condensed Schur refinement for smooth representations

**Declaration:** `condensedSchurOfAdmissible` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`.

Let pi be an irreducible admissible smooth L-representation of G_b(E). The scalar map L to End_{G_b(E)}(pi) is an isomorphism of abstract L-algebras and, using the relatively discrete representation/sheaf dictionary with its enriched mapping objects, an isomorphism of condensed algebras. Its image under the fully faithful enriched stratum embedding is therefore Schur-irreducible. For all irreducible smooth pi the admissibility input is supplied by the proposed foundational SR.3b; this node owns only the condensed refinement, not Vignéras’ theorem.

**Hypotheses and conventions.** L is algebraically closed of characteristic different from p. Use the actual smooth representation category and its scalar unit. Do not assume pi is compact in its derived category.

**Construction or proof.**

1. Choose a nonzero K-fixed vector for an open pro-p K; admissibility makes pi^K finite dimensional and irreducibility makes its G-orbit generate pi.
2. An equivariant endomorphism acts on pi^K and has an eigenvalue over L. Its difference from this scalar has a nonzero invariant kernel, hence vanishes on pi.
3. For a condensed family, evaluate on that vector in the finite-dimensional relatively discrete pi^K and extract a scalar by a linear coordinate. The supplier’s enriched evaluation comparison shows this is a morphism of condensed algebras inverse to the unit.
4. Transport through the enriched fully faithful adjunction, whose unit preserves scalars. The missing enriched fixed-vector comparison and modular admissibility are recorded as supplier gaps.

**Acceptance.**

- This argument works for the countable field Fbar_ell, where an uncountability shortcut is unavailable.
- A characteristic-zero Z_ell-field contains Q_ell and is uncountable; Qbar_ell is not countable.
- Test the trivial one-dimensional representation without asserting that arbitrary irreducibles are compact.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`; `mathlib:Representation.IntertwiningMap`; `tauceti:TauCeti.IsSmoothDiscrete`; `tauceti:TauCeti.SmoothDiscreteTopRep`; `SmoothRepresentationsOfLocalGroups:SR.0`; `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1 and IX.7.1, pp. 327, 334: Motivates application to representations; the fixed-vector proof is a refinement outlined here, with the foundational admissibility theorem requested separately.

### The scalar excursion character

**Declaration:** `excursionCharacter` · construction. Node `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`.

For Schur A, evaluate the ES0 excursion action and apply the inverse scalar unit, giving chi_A: Exc(W,Ghat) tensor L to L and the associated family Theta_n: Inv_n to Map(W_E^n,L), n at least one. Here Inv_n is O((Ghat semidirect Q)^n // Ghat), with O(Q^n)-linearity determined by W_E to Q. For g:[m] to [n], the reindexing square commutes. The second square uses ordered fibre multiplication mu_g:H^m to H^n and m_g:W_E^m to W_E^n, and reads Theta_m(mu_g^* f)(gamma)=Theta_n(f)(m_g gamma). Empty fibres contribute the identity. The family is condensed.

**Hypotheses and conventions.** The pinned Weil action factors through Q. Use the universal integral excursion algebra; its flat torsion-free universal property is not applicable to a characteristic-ell field. For abstract characters restrict to a suitable discretization; the condensed family itself is expressed on W_E.

**Construction or proof.**

1. Import ES0’s operators and LP2’s presentation, including the coefficient attached to a matrix coefficient.
2. Compose evaluation with the inverse condensed scalar unit, which preserves algebra operations and O(Q^n)-linearity.
3. Apply the two operator relations before scalar extraction; their naturality is unchanged by this composition.
4. Check condensed continuity using the actual inverse unit and the condensed Hecke action, rather than assert continuity from a character of a discrete group.
5. Use the integral relations for characteristic ell. Inversion follows by inserting an inverse pair and multiplying it to the identity; the torsion-free quotient is only used with flat targets.

**Uses that determine the API.**

- VIII.3.8: Provides exactly its third datum, with both relations and condensed continuity.
- IX.6: Prove operator squares before evaluating chi_A, so constituent statements follow from scalar naturality.

**API.**

- `excursionCharacter.apply` (simp): On an excursion coefficient x, chi_A(x) is the inverse scalar-unit image of its operator.
- `excursionCharacter.scalar_linear` (structure): The map fixes L-scalars; the invariant-ring family is linear over O(Q^n) with its prescribed evaluation.
- `excursionCharacter.family` (data): Postcompose universal invariant-ring evaluation with chi_A to obtain Theta_n.
- `excursionCharacter.pullback` (relation): Theta_n(g^* f)(gamma) equals Theta_m(f)(gamma composed with g).
- `excursionCharacter.multiplication` (relation): Theta_m(mu_g^* f)(gamma) equals Theta_n(f)(ordered fibre products of gamma).
- `excursionCharacter.condensed` (structure): An operator family in a condensed endomorphism algebra has exactly one scalar family whose composition with the scalar unit is that family.
- `excursionCharacter.ext` (extensionality): Agreement on all excursion coefficients generating the algebra implies equality of characters.

**Unit tests.** These are typed mathematical obligations; their corresponding examples in the suggested file exercise the documented prototype fragments.

- `character_unit` (computation): The unit excursion coefficient has scalar value one.
- `character_inverse_pair` (compatibility): The inverse-pair coefficient identified with the identity coefficient by the universal relations has the same scalar value.
- `character_detects_order` (non-example): If the evaluated operators for two ordered-word coefficients differ, their scalar values differ; a scalar extraction that discards order fails this test.

**Acceptance.**

- Theta sends one to one and evaluates base O(Q^n) functions by the prescribed projection.
- Repeated variables, empty multiplication fibres and an inverse pair satisfy the specified relations.
- Ordering is preserved; not every coefficient distinguishes a reversed word, but those which do retain the distinction.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`; `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`; `ExcursionOperatorsAndSpectralAction:ES0/continuity-of-excursion-evaluations`; `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`; `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`; `mathlib:AlgHom`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.3.7, pp. 288–289: The ordered multiplication relation.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.3.8 proof, p. 290: The continuity required by the reconstruction theorem, supplied here by the Schur inverse.

**Planet:** Scalar excursion character.

### The abstract scalar-parameter consequence

**Declaration:** `abstractSemisimpleParameter` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`.

Let W be discrete and let an L-linear category C carry the finite-set functorial Rep(Q^I)-linear monoidal Weil-equivariant functors of VIII.4. For X with scalar unit L to End(X) an isomorphism of abstract algebras, there is a unique Ghat(L)-conjugacy class of semisimple sections W to Ghat(L) semidirect W. For every excursion datum its scalar is beta composed with V(phi_X(gamma_i)) composed with alpha. This is the objectwise consequence of the imported excursion action and character classification, not a new construction of those theories.

**Hypotheses and conventions.** The group W in this statement is discrete. Uniqueness is of a conjugacy class, not a preferred representative.

**Construction or proof.**

1. Evaluate the imported excursion algebra action at X.
2. Apply LP2’s closed-orbit character theorem to the resulting scalar character.
3. Evaluate its matrix-coefficient character to obtain the displayed identity; uniqueness follows because those coefficients determine the closed orbit.

**Acceptance.**

- No claim of continuity on W_E follows from this discrete statement alone.
- The identity applies to every finite set and matrix coefficient, not merely traces of individual elements.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`; `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`; `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.4.3, pp. 292–293: The scalar matrix-coefficient characterization in the discrete categorical setting.

**Planet:** Abstract semisimple parameter.

### The continuous parameter of a Schur sheaf

**Declaration:** `parameterOfSchurSheaf` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`.

For Schur A in D_lis(Bun_G,L), there is exactly one Ghat(L)-conjugacy class of continuous semisimple L-parameters phi_A:W_E to Ghat(L) semidirect Q lifting the fixed W_E to Q. For every datum (I,V,alpha,beta,gamma), the creation–Weil–annihilation endomorphism equals the scalar beta V(phi_A(gamma_i)) alpha. Continuity means a map of condensed sets into the relatively discrete coefficient object; semisimplicity is the LP2 closed-orbit/G-complete-reducibility convention, not elementwise semisimplicity.

**Hypotheses and conventions.** L is an arbitrary algebraically closed Z_ell[sqrt(q)]-field. No good-prime or centre-component invertibility assumption. A is Schur in the condensed sense, without an additional compactness restriction.

**Construction or proof.**

1. Use the scalar excursion family with its exact two relations and prescribed projection.
2. Invoke all three clauses of LP2’s VIII.3.8: semisimple conjugacy classes, coarse-space points, and condensed character families are in bijection.
3. Continuity is the finite-anchor conclusion in VIII.3.8’s proof; LP2 owns its general-coefficient proof. Lafforgue 11.7/11.10 explains the anchor argument in characteristic zero.
4. Read each excursion coefficient via the resulting coarse point, then use the injectivity of classification to obtain uniqueness.

**Acceptance.**

- Reconstruction uses simultaneous tuple invariants; individual traces do not replace the theorem.
- Positive-characteristic continuity must not be justified using characteristic-zero Reynolds exactness.
- The output supplies no nilpotent monodromy operator or full local Langlands packet.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`; `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`; `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`; `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1, p. 327: Its complete one-line proof, expanded through the existing supplier.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VIII.3.8 proof, p. 290: The finite-anchor continuity input; the full proposition was recovered and read.
- [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), Proposition 11.7 and Lemma 11.10, pp. 143–147: Characteristic-zero source for the finite-anchor continuity argument, not a blanket proof in characteristic ell.

**Planet:** Continuous semisimple parameter.

### The parameter of an irreducible smooth representation

**Declaration:** `parameterOfRepresentation` · construction. Node `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`.

For b in B(G) and irreducible smooth pi of G_b(E), use the VS4 equivalence D(G_b(E),L) with D_lis(Bun_G^b,L) and the fully faithful left adjoint L_b=pi_b-sharp q_b^* to i_b^*. Its unit i_b^* L_b is the identity. The enriched condensed Schur theorem makes L_b(pi) Schur, and define phi_(G,b,pi)=phi_{L_b(pi)} as a conjugacy class. At b=1, L_b is j_! and write phi_pi. The common restricted excursion-centre action makes this independent of eligible embeddings.

**Hypotheses and conventions.** The sharp symbol denotes relative homology, not ordinary pushforward or a general i_b! functor. Admissibility for all irreducible smooth pi needs SR.3b; SR.3/SR.3a are complex-only and SR.6 is downstream of excursions. An eligible embedding is an enriched full-faithful stratum extension with the scalar-preserving retraction/comparison described in the next theorem; no claim is made for arbitrary embeddings.

**Construction or proof.**

1. Import VII.7.1–7.2 with their enrichment and invertible adjunction unit from VS4.
2. Apply the condensed Schur refinement on the actual representation category and transport its unit.
3. Apply the Schur-sheaf theorem and characterize the parameter by the restricted excursion character.
4. Use centre independence to compare extensions; the b=1 notation is the j_! special case.

**Uses that determine the API.**

- IX.7.1–IX.7.3: Provides phi_(G,b,pi) for comparing strata and parabolic induction.
- ES6 duality and characters: Apply the geometric parameter comparisons to the actual smooth representation.

**API.**

- `parameterOfRepresentation.eval` (characterisation): The parameter’s invariant character equals the scalar excursion character of pi.
- `parameterOfRepresentation.defining_identity` (simp): The operator of a coefficient x on pi is scalar multiplication by its excursion character.
- `parameterOfRepresentation.embedding_independent` (compatibility): Equal restricted excursion actions for eligible embeddings yield the same parameter class.
- `parameterOfRepresentation.iso_invariant` (functoriality): A scalar-preserving equivariant representation isomorphism conjugates operators and hence preserves their scalar character and parameter class.
- `parameterOfRepresentation.at_basepoint` (data): At b=1 this is classification of the excursion character evaluated through j_!.

**Unit tests.** These are typed mathematical obligations; their corresponding examples in the suggested file exercise the documented prototype fragments.

- `representation_basepoint` (compatibility): At the neutral stratum the parameter is reconstruction of the j_!-restricted excursion character.
- `representation_same_centre` (characterisation): Two eligible extensions with the same restricted excursion action give the same parameter class.
- `representation_trivial_group` (degenerate): For the trivial group with Q=1 and its one-dimensional irreducible L, the reconstructed parameter has value one at every Weil element, the unique section to the trivial dual group.

**Acceptance.**

- For a trivial one-dimensional representation the construction still uses its equivariant endomorphism algebra.
- Compare two eligible extensions by equality of their restricted central action.
- All coefficient characteristics different from p are allowed, subject to the recorded supplier inputs.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`; `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`; `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`; `VStackSheavesAndLisseCategories:VS4`; `mathlib:Representation.IntertwiningMap`; `SmoothRepresentationsOfLocalGroups:SR.0`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VII.7.2, pp. 272–273: The source’s relative-homology left adjoint and unit; not an ordinary shriek pushforward.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.7.1, p. 334: The representation parameter is obtained by this stratum extension.

**Planet:** Parameter of a smooth representation.

### Centre independence of eligible stratum extensions

**Declaration:** `stratumCentreEmbeddingIndependence` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`.

Let R=i_b^* and let L and J be enriched fully faithful left and right stratum extensions with L adjoint to R adjoint to J and unit/counit retractions RL=RJ=id. The canonical comparison tau:L to J restricts to the identity. For any natural endomorphism z of the identity on D_lis(Bun_G,L), naturality along tau gives R(z_L)=R(z_J). The same argument compares extensions carrying such a retraction comparison. Thus all these eligible choices give the same degree-zero centre map, and hence the same excursion character and parameter.

**Hypotheses and conventions.** The common restriction of tau must be the specified invertible retraction; full faithfulness alone of unrelated functors is insufficient. Use the enriched comparison to retain condensed scalar information. The existence and lisse preservation of the eligible right extension are VS4 obligations, recorded explicitly.

**Construction or proof.**

1. Construct tau via the left/right adjunctions: L to JR L, identified with J using RL=id.
2. Apply naturality of z to tau and then R.
3. Identify R tau with the identity using the triangle identities; cancel it to identify restricted actions.
4. Apply scalar extraction and LP2 uniqueness to the excursion subalgebra.

**Acceptance.**

- For an open neutral stratum compare j_! and its eligible right extension.
- Do not claim general pullback to a nonbasic stratum intertwines all Hecke functors.

**Direct prerequisites.** `mathlib:CategoryTheory.CatCenter`; `mathlib:CategoryTheory.Adjunction`; `VStackSheavesAndLisseCategories:VS4`; `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.7.1, p. 334: The assertion is expanded as a formal adjunction/naturality argument; supplier existence is kept separate.

### Isomorphism invariance and conditional coefficient transport

**Declaration:** `invarianceAndCoefficientTransport` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`.

Isomorphic Schur sheaves, or isomorphic irreducible smooth representations, have the same semisimple parameter class. If L to Lprime is an extension of eligible algebraically closed coefficient fields, the Hecke/operator base-change comparison holds, and A_Lprime remains Schur-irreducible, then phi_(A_Lprime) is the scalar extension of phi_A. For representations impose the same Schur/irreducibility hypotheses after extension. This proves a comparison conditional on those hypotheses; it does not assert their preservation.

**Hypotheses and conventions.** Coefficient structures and Q-actions are transported along the specified coefficient map. The relatively discrete scalar comparison must commute with the canonical units.

**Construction or proof.**

1. Use naturality to conjugate excursion endomorphisms under an isomorphism and recover equal scalar characters.
2. For coefficient extension use ES1’s operator comparison and HS coefficient-compatible kernels.
3. Use the retained Schur condition and LP0 coefficient functoriality to compare character evaluations, then LP2 uniqueness.

**Acceptance.**

- The identity extension gives the original parameter.
- Two successive eligible extensions give the same comparison as their composite.
- No proof uses commutation of arbitrary base change with all invariant rings.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`; `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`; `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`; `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/center-change-of-data`; `LanglandsParameterStacks:LP0/functoriality-of-cocycles`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.4.1, p. 327: The characterization forces these transport consequences when operators and scalar units are compatible.


## ES6. Coefficients in the functorial diagrams

This parent layer fixes the common coefficient contract. The two children use it at the actual operator/centre comparison, before their parameter consequences.

### The coefficient policy for centre and excursion diagrams

**Declaration:** `coefficientPolicyForFunctorialDiagrams` · comparison. Node `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`.

Every centre diagram below uses the existing map Z_spec(G,Lambda) to Z_geom(G,Lambda) under invertibility of |pi_0 Z(G)|, and imposes the analogous condition for every other group in the diagram. Without it, replace the spectral-centre input by the integral excursion algebra and compare excursion operators. Evaluating these diagrams on Schur objects over L gives all field-valued parameter assertions for every ell different from p. There is no appeal to ES3’s categorical spectral-action good-prime condition.

**Hypotheses and conventions.** Lambda is an eligible Z_ell[sqrt(q)]-algebra. An excursion variant is stated at the operator level; it is not an unconditional isomorphism of centres.

**Construction or proof.**

1. Import the IX.5.2 map from its exact ES1 node.
2. At each comparison perform the kernel and operator calculation, before converting it to a centre statement.
3. Use the exact ES1 excursion-only node when the invertibility assumption fails; the scalar-parameter theorem still applies.

**Acceptance.**

- Check a characteristic dividing a centre-component order using operators, without asserting the unavailable centre map.
- No inverse of that component order appears in scalar extraction.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`; `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`; `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 introduction, p. 330: The centre hypothesis is distinct from the unrestricted excursion/field conclusion.


## ES6:functoriality. Kernels, tori and characters

The comparison first concerns Hecke kernels over the leg divisor space, then natural centre actions, then their scalar evaluation. The kernel for the relative-homology Hecke operator is the dualized kernel S′_V, not an unqualified replacement by the original perverse Satake sheaf. The isogeny argument uses the relative-homology pushforward π♮, not compactly supported pushforward π!. A constituent inherits a parameter only under the stated inheritance of its scalar excursion action.

For tori, T(E)/K is discrete and may be infinite. For example E×/O_E× is the infinite valuation group Z. The diagonal theorem is an equality in completed centre algebras on every component; checking a collection of scalar characters alone would lose nilpotent information at modular coefficients. The two-leg calculation and its endpoint convention must support the stronger centre statement.

An injective z-embedding is distinguished throughout from a surjective z-extension. The z-embedding and rational-point factorization are ES6 obligations, as clarified in the verified finding. Pure foundational surjective z-extensions and induced-torus resolutions are routed to RG2.6. Kaletha's p-adic result is stated in that field range. Neither finiteness of centre cohomology nor character-extension arguments are transferred to all local fields by changing notation.

### Compatibility with maps inducing adjoint isomorphisms

**Declaration:** `isogenies` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`.

For f:Gprime to G inducing an adjoint-group isomorphism, write dual f:Ghat to Gprimehat and pi:Bun_Gprime to Bun_G. For every A the centre action of Z_spec(Gprime) on pi^*A equals pullback of the Z_spec(G) action along the function map induced by dual f. Before scalar evaluation compare Hecke kernels via pi_H-sharp Sprime_Vprime = h_1^* pi-sharp Lambda tensor Sprime_V, where V is the dual pullback of Vprime. This gives pi-sharp T_Vprime(pi^*A)=T_V(A tensor pi-sharp Lambda). Any Schur constituent on which the induced excursion action is inherited has parameter dual f composed with phi_A.

**Hypotheses and conventions.** For centres use the coefficient policy for both groups; for scalar parameters use its excursion variant. Do not require pi^*A itself to be irreducible or Schur. A constituent means a subquotient in an eligible heart, or a direct summand with inherited scalar central action; no t-structure is invented on all D_lis.

**Construction or proof.**

1. Import HS4’s Bun/Hecke diagrams and GS4’s exact adjoint-isomorphism Satake naturality.
2. Factor pi_H through Hck_G times Bun_Gprime. Its first relative-homology pushforward sends the Satake kernel to the pulled-back kernel; apply the projection formula to the second map.
3. Compute the displayed functor identity using relative-homology base change. It is over the leg divisor space and natural in Vprime and I.
4. Compare creation, Weil action and annihilation under this identity, giving the algebra square.
5. Restrict the scalar action to the specified constituent and use the parameter characterization.

**Acceptance.**

- The identity map gives the identity parameter comparison.
- Central multiplication Z times G to G has an adjoint isomorphism; Z to G alone generally does not.
- Retain the constituent hypothesis and the sharp functors.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`; `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`; `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`; `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`; `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`; `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.1 proof, pp. 330–331: The relative-homology kernel calculation precedes the equality of excursion operators.

**Planet:** Adjoint-isomorphism compatibility.

### Product compatibility of centres and parameters

**Declaration:** `products` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`.

For G=G_1 times G_2, Bun_G is the product. The tensor product Z_spec(G_1) tensor Z_spec(G_2) identifies with Z_spec(G), and the corrected square with Z_geom(G_1) tensor Z_geom(G_2) commutes. Over the same divisor-leg base, product Hecke kernels for external product representations are external products of the factor kernels. For Schur A_i and a Schur constituent of A_1 external-tensor A_2 with inherited scalar excursion action, its parameter is (phi_A1,phi_A2), with the common Weil projection.

**Hypotheses and conventions.** The tensor product of centres need not equal the entire geometric centre. Use the coefficient policy for each group. Compact exterior generators and their derived Hom comparison are imported from VS5/VII.7.10.

**Construction or proof.**

1. Import the HS4 product diagram and GS4 product naturality over the common leg space.
2. Check external-product kernels and operators on external Satake generators; pass to all representations using their generating operations.
3. Use VII.7.10 for the exterior generators/Hom comparison and LP2 invariant algebra product comparison to identify the spectral source.
4. Apply scalar-character uniqueness on the inherited constituent.

**Acceptance.**

- For G_m times G_m the two factor characters are recovered separately.
- The second top-right centre factor is G_2, not G_1; source finding E1 records the preprint typo.
- The kernel base is the common divisor-leg base, not independently varying leg bases.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`; `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`; `mathlib:TensorProduct`; `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`; `GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality`; `VStackSheavesAndLisseCategories:VS5`; `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.2 proof, p. 331: Expanded through the owned kernel and exterior-Hom interfaces; the display correction is recorded separately.

**Planet:** Product parameters.

### Weil restriction and nonabelian Shapiro comparison

**Declaration:** `weilRestriction` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`.

Let Eprime/E be finite separable, fix an embedding Eprime into a separable closure of E and the resulting W_Eprime inside W_E, and let G=Res_(Eprime/E)Gprime. There are compatible identifications of Bun, nonabelian cocycle quotient stacks and excursion algebras, and their centre-action square commutes. Choose a common W_E-normal open wild subgroup P inside W_Eprime so both quotients are defined; let Wprime be the inverse image of W intersected with W_Eprime/P. The parameter of Gprime is projection to the chosen dual factor after restriction of the parameter of G to W_Eprime; equivalently its Shapiro class is the parameter of G.

**Hypotheses and conventions.** Separable, not arbitrary finite, extension. Projection depends on the chosen Weil embedding, and another choice gives the corresponding conjugate comparison. The nonabelian comparison is not the pinned abelian Shapiro theorem.

**Construction or proof.**

1. Identify the bundles by extension of coefficient field and restriction of scalars, using the owned torsor geometry.
2. Prove the nonabelian Shapiro comparison on cocycles, not by the abelian baseline theorem. For Wprime inside W and Hprime with Wprime-action, use the coinduced group of f with f(hx)=h(f(x)), with W acting by right translation. Evaluation at 1 restricts a W-cocycle to Wprime. Choose left-coset representatives and write x=h_x r_x. From c on Wprime define a(w)(x)=h_x(c(h_x inverse h_(xw))). The cocycle law telescopes; changing representatives gives the usual coboundary. The two constructions are inverse up to conjugacy and commute with coefficient base change. For finite index this is a finite product of algebraic groups. Apply the natural constructions fppf-locally where torsors are trivial and glue by conjugacy, obtaining the quotient-stack comparison.
3. For each finite free group F_n to W, apply this comparison to F_n times_W Wprime. This subgroup has finite index, is free by Nielsen–Schreier and is finitely generated by Subgroup.fg_of_index_ne_zero.
4. Use these finite free sources and their common refinements to obtain the cofinal excursion colimit comparison; no Schreier rank formula is needed.
5. Inflate a representation of the chosen Gprimehat semidirect W_Eprime through the dual-factor projection, then induce to Ghat semidirect W_E.
6. Import the closed Hecke immersion over Divprime to Div from HS4; its pushforward realizes the inflate/induce kernel. Compare the operators and reconstruct parameters.

**Acceptance.**

- The degree-one extension gives identity.
- Different coset representatives give canonically equivalent Shapiro data.
- Specify P normal in the ambient Weil group, not merely open in its subgroup.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`; `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`; `mathlib:IsFreeGroup`; `mathlib:Subgroup.fg_of_index_ne_zero`; `mathlib:Subgroup`; `mathlib:groupCohomology.coindIso`; `LanglandsParameterStacks:LP0/functoriality-of-cocycles`; `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`; `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality`; `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.3 proof, p. 332: Exactly the baseline input; its rank is irrelevant.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.3 proof, p. 332: The nonabelian finite-free-source excursion-colimit argument.

**Planet:** Weil restriction of parameters.

### The spectral centre of a torus

**Declaration:** `toriSpectralCenter` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`.

For an E-torus T, local reciprocity gives a natural isomorphism Z_spec(T,Lambda) with R_T=lim_K Lambda[T(E)/K], over open subgroups K. These quotient groups are discrete and need not be finite: for T=G_m and K=O_E-times they contain the infinite valuation quotient Z. The geometric category decomposes as the product over b in B(T)=pi_1(T)_Gamma of D(T(E),Lambda), and Z_geom(T,Lambda) is the corresponding product of R_T. The classical abelian-category centre description is imported from SR.1, not the complex Bernstein-block theorem.

**Hypotheses and conventions.** Use full local reciprocity, including wild p-primary equal-characteristic characters. The inverse limit is the compatible group-algebra completion, not a finite group-algebra approximation to all T(E). Induced-torus resolutions and their exactness belong to the proposed RG2.6 extension.

**Construction or proof.**

1. Use the BG torus classification and VS stratum equivalence for the geometric product.
2. Import SR.1’s centre as the inverse limit of idempotent Hecke corners; for the abelian group T(E) these identify with group algebras of quotients.
3. Resolve T by induced tori using the requested reductive-group input, keeping the exact sequence and dual maps.
4. Use product and Weil restriction to reduce to G_m and apply local reciprocity to the continuous cocycle/character functor.
5. Pass to coordinate algebras and the compatible K-completions. The missing full equal-characteristic reciprocity is a recorded gap, not supplied by a prime-to-p statement.

**Acceptance.**

- For G_m the unramified quotient contributes Lambda[t,t^-1].
- Check norm compatibility for an induced torus and restriction to open K.
- No definition of the general Bernstein centre is duplicated here.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`; `mathlib:MonoidAlgebra`; `tauceti:TauCeti.ClassFieldTheory.Formation`; `SmoothRepresentationsOfLocalGroups:SR.1`; `BunGAndNewtonStrata:BG1/abelianization-identification`; `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.4 proof, p. 333: The reduction uses separate reductive-group and reciprocity suppliers.

### The normalized two-leg torus excursion

**Declaration:** `torusTwoLegCalculation` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`.

Fix geometric Artin reciprocity rec_geom:E-times to W_E^top-ab, sending a uniformizer to geometric Frobenius; it is the inverse of the upstream arithmetic-normalized Artin map. For a smooth character chi:E-times to L-times, the G_m two-leg datum Std external-tensor Std-dual with its tautological creation and annihilation has scalar chi(rec_geom^-1(gamma_1 gamma_2^-1)). At (gamma,1) it is the usual parameter chi composed with rec_geom^-1. On any degree-b line-bundle stratum the same scalar occurs.

**Hypotheses and conventions.** Topological abelianization means quotient by the closure of the commutator, not the raw algebraic quotient. Track the source/target conventions of the Hecke correspondence and of the associated character sheaf. The formula is a planned geometric calculation; the Lean prototype checks only the group-homomorphism identity, with the geometric identification left out.

**Construction or proof.**

1. Use the requested Lubin–Tate comparison BC(O(1)) minus zero modulo E-times = Div1 and its explicit torsor.
2. Fargues Proposition 2.16 describes Frobenius descent as pi times the canonical descent. Proposition 3.3 computes the associated E_chi character as chi^-1 composed with arithmetic Artin^-1.
3. Identify the Hecke endpoint actions and the associated sheaf convention so this monodromy is expressed using rec_geom, without silently removing either inversion. This endpoint adapter is recorded as a remaining verification gap.
4. Compose the Std and Std-dual modifications: their two Weil actions produce gamma_1 gamma_2^-1; evaluation cancels the line-bundle degree dependence.
5. Use the matrix coefficient to recover the G_m parameter; a single-leg scalar is the specialization gamma_2=1.

**Acceptance.**

- For an unramified chi with chi(pi)=a, geometric Frobenius at the first leg and identity at the second gives a.
- On the diagonal gamma_1=gamma_2 the scalar is one.
- Switching the legs inverts the scalar.
- The endpoint/character inversion must be checked against the torsor, not inferred from a name for Frobenius.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`; `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`; `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.5 proof, p. 333: The missing displayed calculation is planned explicitly, rather than treated as a baseline fact.
- [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), Proposition 3.3 proof, p. 13: Arithmetic normalization and the associated-sheaf inversion are read from the proof.

### The diagonal torus centre map

**Declaration:** `toriDiagonalEmbedding` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.

Under the spectral isomorphism with R_T and the geometric identification Z_geom(T,Lambda)=product_(b in B(T)) R_T, the map Z_spec(T,Lambda) to Z_geom(T,Lambda) sends r to the constant tuple (r)_b. Consequently phi_chi on every torus stratum is the usual torus parameter with the specified reciprocity normalization. This is an equality of the actual centre actions and their coordinates, not merely agreement on one chosen character.

**Hypotheses and conventions.** For a torus its centre is connected, so the centre-component hypothesis is automatic. The entire B(T) product, not only the neutral stratum, occurs.

**Construction or proof.**

1. Resolve by induced tori and descend the action along the resolution using the adjoint-isomorphism comparison.
2. Apply the product and Weil-restriction comparisons to reduce to G_m.
3. Use the two-leg calculation on every line-bundle component to identify the completed group-algebra action.
4. Use the compatible K-generators of the torus centre to establish equality in R_T, then in each B(T) factor.

**Acceptance.**

- For G_m, B(T)=Z, and every degree factor receives the same r.
- Check the full centre action rather than only its evaluation on irreducible characters; characters need not detect all integral nilpotents.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`; `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6.5, p. 333: The centre statement is stronger than a scalar pointwise test.

**Planet:** Diagonal torus centre map.

### Central characters for a connected centre

**Declaration:** `centralCharacters` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`.

If Z=Z(G) is connected, it is a torus. For irreducible smooth pi with central character omega_pi, the composite of phi_pi with the dual map Ghat to Zhat is the usual parameter of omega_pi. The correct adjoint-isomorphism map is multiplication Z times G to G. Pulling pi back along it identifies its scalar central action with omega_pi external-tensor pi; combine this with the product parameter and torus comparison.

**Hypotheses and conventions.** Z to G by itself does not induce an adjoint-group isomorphism. Use the excursion version if ell divides a relevant centre-component order. Smooth central characters and the irreducible scalar action are imported from the representation-theoretic supplier.

**Construction or proof.**

1. Use Schur’s lemma to identify the central action with a smooth character.
2. Construct multiplication and its Weil-equivariant dual map through the reductive-group/Satake supplier.
3. Apply adjoint-isomorphism compatibility to multiplication and product compatibility to the external representation.
4. Identify the Z-coordinate using the diagonal torus theorem and cancel the unchanged G-coordinate.

**Acceptance.**

- For G=T the statement is the torus result.
- For a connected-centre group the central dual projection, not restriction of the primal parameter, is used.
- This proof does not depend on the ES7 parabolic theorem.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`; `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`; `ReductiveGroupsPartII:RG2.5`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 closing paragraph, p. 333: Pins the two actual maps, correcting the checkpoint’s Z to G error.

**Planet:** Central-character compatibility.

### Twisting by characters of the abelianization

**Declaration:** `twisting` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`.

Let a:G to D=G/G_der and chi be a smooth L-times character of D(E). For irreducible smooth pi, phi_(pi tensor chi composed with a) is phi_pi multiplied by the central cocycle dual a composed with phi_chi. In L-group notation multiply only the Ghat-valued cocycle part, retaining the same Weil projection. Equivalently this is composition of the product parameter with the dual of the graph map G to G times D.

**Hypotheses and conventions.** The dual torus Dhat maps centrally into Ghat. The two cocycles share the prescribed Weil projection and use its action; do not multiply their Weil components.

**Construction or proof.**

1. Apply the product theorem to pi external-tensor chi.
2. Apply the adjoint-isomorphism theorem to g mapped to (g,a(g)).
3. Use the torus normalization to identify the twisting cocycle, and centrality to check its cocycle identity.

**Acceptance.**

- The trivial character leaves the parameter unchanged.
- Successive twists compose by multiplying central cocycles.
- No use of ES7 parabolic induction is needed.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`; `LanglandsParameterStacks:LP0/functoriality-of-cocycles`; `ReductiveGroupsPartII:RG2.5`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 closing paragraph, p. 333: The graph map and the central dual twisting cocycle.

### Pseudo-z-embeddings and z-embeddings

**Declaration:** `ZEmbedding` · definition. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`.

Over a p-adic field F, a pseudo-z-embedding is an injective morphism G to Gz of connected reductive F-groups such that C=Gz/G is a torus, H1(F,C)=1 and H1(F,Z(G)) to H1(F,Z(Gz)) is bijective. It is a z-embedding if Z(Gz) is connected and C is an induced torus. Kaletha constructs it by embedding the diagonalizable centre in a torus T with induced quotient and the same H1, then taking Gz=G times_Z T. The injective z-embedding is distinct from a surjective z-extension with induced-torus kernel and simply connected derived group.

**Hypotheses and conventions.** Kaletha’s source is p-adic; a uniform claim for arbitrary equal-characteristic E is not justified by this citation. The cohomological bijection is essential: SL_n to GL_n is not a z-embedding in the cited p-adic setting. These definitions and their application-level construction belong here; foundational z-extensions and induced-torus resolutions belong to proposed RG2.6.

**Construction or proof.**

1. Use the existing reductive/multiplicative-type carriers and the requested finite local cohomology input.
2. Embed Z(G) in T0, split the quotient over F1, and choose a finite extension whose norm kills its finite H1 image using local reciprocity.
3. Take the fibre-product torus T and verify the centre H1 bijection; push out G along Z(G) to T.
4. From injectivity on centre H1 prove Z(Gz)(F) to C(F) surjective, hence Gz(F)=Z(Gz)(F)G(F).
5. Given an extension of a smooth central character, define the representation on a product z g by that character times pi(g); prove descent and smoothness using the requested representation dictionary.

**Uses that determine the API.**

- Kaletha Corollary 5.3 and Fact 5.5: Reduce central-character questions over p-adic fields to connected centre while retaining rational-point control.
- ES6 disconnected-centre comparison and ES7 parabolic: Compare the representation extensions and their parameters; no new general local Langlands theory is assumed.

**API.**

- `ZEmbedding.ofMaps` (constructor): Bundle the injection and torus quotient with the full scheme and cohomological conditions; the prototype bundles only its rational exactness and central lifting.
- `ZEmbedding.quotient_inclusion` (simp): The quotient is one on the included G.
- `ZEmbedding.central_lift` (data): Each c in C(F) has a lift in Z(Gz)(F).
- `ZEmbedding.rational_factorization` (characterisation): Every x in Gz(F) can be written z times i(g) with central z and g in G(F).
- `ZEmbedding.extend_representation` (compatibility): A chosen smooth central-character extension agreeing on the intersection gives a smooth representation of Gz(F) restricting to pi; its formula on z i(g) is the central scalar times pi(g).

**Unit tests.** These are typed mathematical obligations; their corresponding examples in the suggested file exercise the documented prototype fragments.

- `zembedding_identity` (degenerate): For a connected-centre reductive group, its identity with quotient one is a z-embedding; its rational-point inclusion is the identity.
- `zembedding_product` (computation): For connected-centre G and induced torus C, the inclusion G to G times C and projection to C give a z-embedding and central lifts (1,c).
- `zembedding_requires_central_lifting` (non-example): A proposed rational quotient not surjective on the centre cannot be the rational-point data of a pseudo-z-embedding.

**Acceptance.**

- Check both quotient/cohomology conditions, not merely connected centre and torus quotient.
- Only pseudo-z-embeddings are asserted to be transitive (Fact 5.4).
- An extension of a central character is a choice whose effect must be compared, not declared canonical.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`; `SmoothRepresentationsOfLocalGroups:SR.2`; `mathlib:MonoidHom`; `mathlib:Subgroup`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Source match.**

- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Definition 5.1 and Proposition 5.2, p. 17: The full definition includes all preceding pseudo-z conditions.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Fact 5.5, p. 19: The exact cohomological reason for central rational-point surjectivity.

**Planet:** Z-embeddings.

### The disconnected-centre reduction and choice comparison

**Declaration:** `zEmbeddingCentralCharacterComparison` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.

For a p-adic E and a z-embedding G to Gz, extend pi by a chosen smooth extension of its central character. Its connected-centre parameter projects back to the G parameter by the adjoint-isomorphism theorem, and its restriction to the included centre recovers omega_pi. Two such extensions differ by a character of C(E); twisting comparison shows they induce the same descended central data. Common pseudo-z refinements compare choices of embeddings. For general nonarchimedean E the source’s surjective z-extension route is a separate required input: a connected-centre cover with induced-torus kernel and rational-point surjectivity must carry the analogous central and parameter comparison. That all-field route is explicitly a gap, not attributed to Kaletha’s p-adic construction.

**Hypotheses and conventions.** Extension of the central character over L, including modular coefficients, must be smooth and is a requested input. Disconnected Z(G) is not treated as an E-torus with an ordinary torus L-parameter. Central data means its actual scalar character, compared after the connected-centre cover. Do not deduce a global compatibility from a single chosen extension without the twisting/common-refinement argument.

**Construction or proof.**

1. Use the rational central-factorization lemma to extend pi; irreducibility is preserved because the extra factors act centrally.
2. Apply the connected-centre theorem to Gz and the adjoint-isomorphism theorem to G to Gz.
3. Two central-character extensions differ by a quotient-torus character; apply twisting and restrict back to G to cancel it.
4. Use Kaletha Fact 5.6: the pushout G1 times_Z(G) Z(G2) is a common pseudo-z refinement. Each quotient is the other original quotient torus; Fact 5.5 gives its central rational surjectivity and the required H1 vanishing. Fact 5.4 makes the composite pseudo-z. Apply the two adjoint-isomorphism comparisons and twisting cancellation to identify descended data.
5. For equal characteristic request the foundational z-extension cover, its rational-point and dual-centre interfaces, then run the corresponding pullback/descent calculation; record this unproved extension separately.

**Acceptance.**

- For connected centre the identity embedding gives the earlier result.
- A quotient character changes the extended parameter but does not change the descended data.
- No general centre-character parameter for a disconnected finite-type group is silently defined.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`; `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`; `ReductiveGroupsPartII:RG2.5`; `SmoothRepresentationsOfLocalGroups:SR.2`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.6 closing paragraph, p. 333: The source calls these z-extensions; Kaletha’s section develops z-embeddings. Their distinction and field range are made explicit.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Fact 5.5 and following paragraph, p. 19: The paragraph compares representation extensions by quotient characters; the full passage, not this short fragment, was read.


## ES6:duality. Chevalley and the smooth-dual return

Bernstein–Zelevinsky duality acts on the enhanced geometric centre. Its compatibility with Chevalley gives parameters of eligible dual Schur objects or inherited Schur constituents. It does not turn an arbitrary dual complex into a degree-zero irreducible representation. The supercuspidal smooth-dual consequence uses the classical comparison with the appropriate shift. The assertion for every irreducible smooth dual returns through ES7:parabolic and the coefficient-qualified induction dictionary.

### Chevalley compatibility for Bernstein–Zelevinsky duals

**Declaration:** `bernsteinZelevinskyDuals` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`.

The existing spectral-to-geometric centre map intertwines the spectral involution induced by the pinned Chevalley automorphism with the involution induced by Bernstein–Zelevinsky duality. If both A and D_BZ(A) are Schur and the duality is defined in the required category, phi_(D_BZ A)=theta composed with phi_A up to Ghat-conjugacy. More generally a Schur cohomological constituent with inherited scalar central action has that parameter. On irreducible smooth representations use the classical BZ comparison with its shifts, rather than assume the dual complex is a representation in degree zero.

**Hypotheses and conventions.** The actual Satake switch is Chevalley up to Ad(rhohat(-1)); the inner automorphism disappears only after conjugacy quotient. Use the coefficient policy for the centre square and its excursion variant for unrestricted L. Import the compact/reflexive domain and extension of BZ duality from VS5.

**Construction or proof.**

1. Import ES4’s duality/centre square, HS1’s dual Hecke identity and GS4’s exact Chevalley comparison.
2. Reverse creation and annihilation under duality and compare the Weil action through the switch; this pulls back the invariant coefficient by theta.
3. Keep the rhohat(-1) inner correction until passing to conjugacy classes.
4. Use scalar-character uniqueness for the dual object or inherited Schur constituent.

**Acceptance.**

- For a torus Chevalley is inversion and dual characters invert.
- The compact BZ dual may carry a cohomological shift; it must not be identified with a degree-zero smooth dual without further input.
- The spectral-centre supplier is an explicit prerequisite.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`; `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`; `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`; `ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution`; `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`; `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`; `VStackSheavesAndLisseCategories:VS5/bernstein-zelevinsky-duality`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.5.3 proof, p. 330: The centre involutions and parameter consequence.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.12.1 proof, p. 241: The rank-one sign calculation explains the inner rho(-1) correction.

**Planet:** Chevalley duality of parameters.

### Chevalley compatibility for smooth contragredients

**Declaration:** `smoothDuals` · theorem. Node `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

For every irreducible smooth L-representation pi of G(E), its smooth contragredient pi-vee is irreducible and phi_(pi-vee)=theta composed with phi_pi up to Ghat-conjugacy. For supercuspidals this follows from the BZ comparison (with its shift accounted for). In general it is a late return using ES7’s parabolic-induction parameter theorem and SR.2’s contragredient/induction dictionary. The twist of the Levi inclusion and all modulus conventions are retained.

**Hypotheses and conventions.** Admissibility is the all-coefficient supplier input, including characteristic ell. Use ES7’s unnormalized induction statement with its explicitly twisted Levi inclusion; do not silently replace it by normalized induction. This stage is downstream of ES7:parabolic; the early functoriality nodes here never depend on this return.

**Construction or proof.**

1. Apply BZ compatibility in the supercuspidal case, using the supplier’s agreement with the smooth dual up to shift.
2. Use supercuspidal support and realize pi as an irreducible subquotient of an eligible induction.
3. Take smooth duals using the existing induction/duality comparison, tracking the opposite parabolic and modulus factor.
4. Apply ES7’s parameter theorem to both induced sides; use the Chevalley compatibility of the twisted Levi inclusions to identify the two conjugacy classes.

**Acceptance.**

- For a character of G_m, phi_(chi^-1)=phi_chi^-1.
- The duality graph remains acyclic by keeping this result downstream of ES7.
- The proof covers irreducible subquotients, not only a socle or cosocle.

**Direct prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`; `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`; `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`; `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`; `SmoothRepresentationsOfLocalGroups:SR.2`; `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`.

**Source match.**

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.5.3 proof, p. 330: The source explicitly requires the ES7 induction theorem.

**Planet:** Smooth contragredient parameters.

## Pinned baseline and prototype boundaries

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Each named declaration's statement was checked in the pinned source. A searchable declaration index was used to locate candidates; index membership alone was not treated as mathematical coverage. The roadmap's library audit and the upstream AdicSpaces and InductionRestriction documents were read before assigning ownership.

The suggested file elaborates against the pinned Mathlib build and claims no implementation. The table is an omission ledger: a compiled algebraic fragment is not evidence that a geometric or topological hypothesis has been formalized.

| Suggested interface | Precisely what the prototype retains | Conditions left out because their carriers/interfaces are unavailable |
| --- | --- | --- |
| IsSchurIrreducible and its API | Invertibility of a specified morphism of actual condensed L-algebras, sectionwise scalar uniqueness, and invariance under a unit-compatible isomorphism. | The choice of relatively discrete L and the identification of the other condensed algebra with the enhanced degree-zero endomorphisms of a sheaf. The shift API takes its endomorphism isomorphism as input. |
| condensedSchurOfAdmissible | Composition of explicit condensed scalar and endomorphism comparison isomorphisms, with equality to the scalar unit. | The smooth/admissible/irreducible representation, fixed-vector argument, derived stratum category and enriched adjunction producing those isomorphisms. |
| excursionCharacter and its API | Actual algebra homomorphisms, inverse scalar transport, finite-family evaluations and their stated reindexing/multiplication equalities; condensed factorization through the scalar unit; equality on algebra generators. | The integral excursion presentation, Q-linearity and the identification of the algebraic families with geometric excursion operators. The inverse-pair example takes the imported relation as an equality. |
| abstractSemisimpleParameter and parameterOfSchurSheaf | An explicit imported reconstruction/evaluation pair, with existence and conjugacy uniqueness under an explicit separation condition. | Semisimplicity, the specified Weil projection, continuity, invariant quotient-stack carriers and the actual LP2 reconstruction theorem. The prototype does not define any of these by an unnamed predicate. |
| parameterOfRepresentation and its API | A Mathlib Representation, its equivariant endomorphism algebra, excursion action, scalar algebra equivalence and explicit reconstruction map. | Smoothness, admissibility, irreducibility and the geometric stratum equivalence/adjunction. The explicit classifier chooses a representative; the full output is its conjugacy class. The basepoint and trivial-group tests retain only their global algebraic consequences. |
| stratumCentreEmbeddingIndependence | Naturality of an actual category-centre element along a comparison of ordinary functors, with explicit restriction retractions. | The enhanced D_lis categories, construction of these functors by the geometric adjunctions, and identification with the excursion action. |
| invarianceAndCoefficientTransport | Character pullback and an explicit naturality equation for the imported reconstruction maps. | Field extension and geometric coefficient base change, and preservation of the Schur condition. The algebraic prototype uses one ground field. |
| coefficientPolicyForFunctorialDiagrams and isogenies | Evaluation of an explicit commuting square of algebra homomorphisms. | The coefficient component-order condition, Bun/Hecke geometry and the relative-homology kernel theorem which establishes that square. |
| products and weilRestriction | Product of actual group homomorphisms, and restriction followed by a chosen dual-factor projection. | Common Weil projection and semisimplicity, quotient-stack Shapiro, cofinal excursion colimits, product kernel geometry and inflate/induce Satake comparison. |
| toriSpectralCenter and toriDiagonalEmbedding | Conversion of an explicit bijective algebra homomorphism to an algebra equivalence, and coordinates of an explicit diagonal action. | The inverse limit of completed group algebras, geometric components and the reciprocity/kernel calculation proving the maps have those properties. |
| torusTwoLegCalculation | The group-law identity for a specified geometric-reciprocity inverse and a character. | Lubin–Tate geometry and the endpoint/associated-sheaf inversions. In particular compilation does not resolve the endpoint gap. |
| centralCharacters and twisting | Composition with a central dual map, and multiplication of a group homomorphism by a cocycle with genuinely central image in the untwisted group fragment. | Reductive dual/root data, the Weil semidirect product and its action, the graph/multiplication kernel comparisons, and identification with the representation parameter. |
| ZEmbedding and its API | An exact rational-point sequence with injective inclusion, surjective quotient and surjective restriction of the quotient to the actual group centre. Representation extension uses an actual character and its scalar compatibility on the intersection. | Reductive schemes, connected centre, induced quotient torus, H¹ conditions, topology and smoothness. The identity/product tests are rational-point fragments; connectedness of the algebraic centre is not asserted for an arbitrary abstract group. |
| zEmbeddingCentralCharacterComparison | Cancellation on the included centre of the difference of two extensions by a quotient character. | The connected-centre parameter comparison, common pseudo-z refinement, geometry of centre inclusions, and the general-field z-extension route. |
| bernsteinZelevinskyDuals and smoothDuals | An imported Chevalley pullback equation on characters and its reconstruction naturality. | The actual duality functor, enriched dual kernel, shifts, smooth contragredient, supercuspidal support and ES7's parabolic proof. |

The four definition/construction nodes have 22 API items and 12 unit tests. Every named declaration, API item and test appears in the suggested file. Its examples use actual condensed algebras, algebra homomorphisms, representations or exact group maps where those exist at the pins. None replaces missing geometry by an empty structure or an uninterpreted proposition.

## Source versions and source correction

All Fargues–Scholze page numbers refer to the hash-identified **356-page author manuscript**. The relevant excursion and functoriality passages were also collated against arXiv:2102.13459v4 (27 November 2024). The 2026 Astérisque 466 volume has different pagination; its public ten-page sample does not include the passages used here. No claim is made about the full published display.

Source issue **ExcursionOperatorsAndSpectralAction/E2** records the repeated G₁ in the geometric-centre tensor product in the IX.6.2 display. The second factor must be G₂. The author PDF was visually inspected and the arXiv v4 display independently collated, so the repetition is not a text-extraction artifact. Source issue E3 records that the same proposition must place A_i on Bun_(G_i), rather than placing both inputs on Bun_G. Source issue E4 records the reversed group-morphism direction in the IX.6.1 proof prose: Gprime to G gives Gr_Gprime to Gr_G, while the dual map runs in the opposite direction. Both additional slips were visually checked in the author copy and collated with arXiv v4. The mathematics uses the corrected domains and directions. The earlier part already owns E1, concerning the VIII.4 reindexing square; the present finite-set API uses only commutativity and does not duplicate that source issue.

Kaletha's source is **Rigid inner forms vs isocrystals**, arXiv:1502.00650v2, published JEMS 20 (2018), 61–101. It is not the separate regular-supercuspidal paper. Section 5.1's definition, torus-envelope construction, existence, rational-point factorization and common-refinement arguments are consumed with their p-adic hypotheses. Fargues' author copy of the Abel–Jacobi paper numbers the torsor-descent statement **Proposition 2.16**; the IX.6 proof's published reference to Proposition 2.12 is not silently assigned the author-copy numbering. Proposition 3.3 in that copy gives the inverse-character/inverse-arithmetic-Artin convention.

Lafforgue Proposition 11.7 and Lemma 11.10 supply a read account of finite anchors, group relations, uniqueness and continuity in characteristic zero. The general-coefficient local character theorem remains owned by LP2. The characteristic-zero Reynolds argument is not used as a proof in characteristic ℓ. Vignéras' book theorem is a precise requested input; its proof was not read and this plan does not represent it as source-verified closure.

### Sources and passages actually read

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Laurent Fargues, Peter Scholze. Author-hosted 356-page preprint; locators below use its printed pages, which equal PDF pages. Separately collated with arXiv:2102.13459v4 (27 November 2024); not the 2026 published pagination.
  - II.2.1, pp. 58–61: the height-one Lubin–Tate universal cover, O(1) sections and the E-times torsor on Div1.
  - VI.12.1 and its complete proof, pp. 239–241: switching, Chevalley and the rho(-1) sign.
  - VII.7.1–VII.7.2 and proofs, pp. 271–273; VII.7.9–VII.7.10, pp. 275–276: stratum equivalence, relative-homology left adjoint and exterior Hom comparison.
  - VIII.3.7–VIII.3.8 with all three clauses and both relations, pp. 288–290; VIII.4 and VIII.4.3, pp. 290–293.
  - IX.1–IX.2, pp. 320–323: condensed enhancement and relative-homology Hecke operators.
  - IX.4–IX.6, pp. 327–333, including complete proofs of IX.6.1–IX.6.5. IX.6.2 display visually checked and compared with arXiv v4.
  - IX.7.1, p. 334: centre restriction to strata and assertion of embedding independence; IX.7.3, pp. 337–338: the parabolic input to smooth duality.
- [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), Vincent Lafforgue. arXiv:1209.5352v10, 10 January 2018; J. Amer. Math. Soc. 31 (2018), 719–891. Locators are preprint pages.
  - Proposition 11.7 and proof, pp. 143–147, including Lemma 11.10: finite anchors, uniqueness, multiplicativity and the characteristic-zero continuity argument. The local general-coefficient character theorem is imported from LP2, not re-planned from the global application.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Tasho Kaletha. arXiv:1502.00650v2; published J. Eur. Math. Soc. 20 (2018), 61–101. Locators are preprint pages.
  - Section 5.1, pp. 16–19: Definition 5.1, Proposition 5.2, Corollary 5.3 and Facts 5.4–5.6, with proofs and representation-extension paragraph. The field here is p-adic.
- [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), Laurent Fargues. Author-hosted preprint cdc.pdf; published Ann. Sci. Éc. Norm. Supér. (4) 53 (2020), 89–124. Proposition numbers and pages below are those of this author copy.
  - Section 2.3 and Proposition 2.16, pp. 8–10: Lubin–Tate torsor and Frobenius descent.
  - Propositions 3.1 and 3.3 with proof, pp. 12–13: the Weil dictionary and inverse-character/inverse-Artin normalization.
  - Section 5.2, pp. 18–19: geometric reciprocity and equal-characteristic range, used to identify the requested scope.

## Remaining gaps and requests

These records are required to reach closure. They do not prevent this target-level pass from being complete under the protocol. No requested new stage is represented as an existing supplier.

### Gap 1: All-coefficient admissibility supplier

The current SR.0 defines admissibility and SR.3/SR.3a prove complex results; they do not supply the modular theorem. SR.6 is downstream. Create the proposed independent SR.3b and read Vignéras II.2.8 before treating this input as closed. Qbar_ell is uncountable; the countable-field issue is Fbar_ell.

Consumers: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

### Gap 2: Enriched noncompact Schur and stratum adjunction interfaces

The existing VS4 and HS1 nodes do not explicitly provide the condensed fixed-vector endomorphism comparison, VII.7.2’s enriched relative-homology left adjoint or eligible right-extension comparison. The mathematical proof outline is given, but these exact reusable supplier declarations remain required.

Consumers: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`.

### Gap 3: Pre-evaluation kernel and exterior-generator precision

HS4’s comparison node states the centre diagrams but records only an opening read of IX.6.1; the complete relative-homology kernel formula is requested. VS5 must provide the VII.7.10 exterior Hom formula at the required coefficients. These are supplier refinements, not new local definitions of their geometry.

Consumers: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`.

### Gap 4: Foundational induced-torus and z-extension scope extension

No existing RG2.5 node plans induced-torus resolutions or z-extension existence. Confirmed finding 10 calls for a new foundational RG2.6, with BG/ET consumers outside this issue’s allowed paths. The proposal here routes that need and does not make a nonexistent stage into a prerequisite.

Consumers: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.

### Gap 5: Full equal-characteristic reciprocity

The upstream ClassFieldTheory document fixes normalization, but its equal-characteristic endpoint excludes wild p-primary norm/existence theory. The torus theorem for all E needs that full reciprocity interface. Request a Part II for the missing range; retain upstream layer 9 only for the interface it actually states.

Consumers: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.

### Gap 6: Lubin–Tate torsor and Hecke endpoint inversion adapter

RF3 supplies O(1) and its sign, not II.2.1’s Lubin–Tate torsor. Fargues’ author copy 2.16/3.3 identifies the torsor descent and the inverse-character/inverse-Artin monodromy. The complete endpoint action calculation connecting that convention with this Hecke kernel, including modular/equal-characteristic coefficients, still needs a supplier extension and explicit verification.

Consumers: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.

### Gap 7: Z-embedding field range and modular extension of characters

Kaletha §5 is p-adic and the following representation paragraph uses complex characters. The extension to arbitrary algebraically closed L, and the alternative z-extension descent route for general E, require a proof. Specify the appropriate cohomology of possibly nonsmooth centres in equal characteristic; do not transfer p-adic finiteness of centre H1 without checking it.

Consumers: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.

### Gap 8: Prototype geometric conditions unavailable at the pins

The suggested file elaborates actual condensed algebra and representation/algebraic interfaces. Animated categories, the geometric kernel identities, semisimplicity, the full prescribed Weil projection, relatively discrete continuity, reductive z-embedding/cohomology conditions and smoothness of extensions are omitted. Its classifier and kernel comparisons are explicit imported maps/equations, not implementations of the full theorems. Replace those fragments with exact owner interfaces when available.

Consumers: `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`, `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`, `ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`, `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.

### Exact supplier requests

1. **`SmoothRepresentationsOfLocalGroups:SR.0`**. The actual arbitrary-coefficient smooth representation category, its irreducible objects, scalar unit and central characters, compatible with the pinned SmoothDiscreteTopRep carrier.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`.
2. **`SmoothRepresentationsOfLocalGroups:SR.2`** — scope extension required. Add foundational SR.3b after SR.2: admissibility of every irreducible smooth representation over algebraically closed characteristic ell different from p (Vignéras 1996, II.2.8), then scalar endomorphisms. For characteristic-zero Z_ell-fields the uncountability/Dixmier argument is available. SR.3/SR.3a are complex-only and SR.6 cannot supply an ancestor of ES5. Also give the smooth central-character extension and duality/induction dictionary for these coefficients.
   Proposed owner: `SmoothRepresentationsOfLocalGroups:SR.3b`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`, `ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals`.
3. **`VStackSheavesAndLisseCategories:VS4`**. VII.7.1–7.2 with condensed enrichment: relative-homology L_b=pi_b-sharp q_b^* left adjoint to i_b^*, invertible scalar-preserving unit, mapping-object comparison for noncompact representations, and eligible right extensions/retraction comparisons. The existing compact-generation node supplies the stratum equivalence, but not this whole adjunction API.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`.
4. **`HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`**. IX.1.2 and the fixed-vector evaluation comparison needed to identify the condensed equivariant endomorphisms of an admissible smooth pi with relatively discrete L, without assuming pi is compact.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/condensed-schur-from-admissibility`, `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`.
5. **`LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`**. Specify the exact two VIII.3.8 relations, prescribed Q-projection and maps of condensed sets for arbitrary algebraically closed Z_ell-fields. Audit the characteristic-ell finite-anchor continuity argument separately from Lafforgue’s characteristic-zero Reynolds step; the local theorem is the unique supplier.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`.
6. **`HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`**. Supply the actual pre-evaluation geometric diagrams: pi_H-sharp kernel formula of IX.6.1, product kernels over a common divisor-leg base, and the closed Weil-restriction Hecke immersion implementing inflate-then-induce. Correct the repeated G1 product factor and use a common ambient-normal wild subgroup.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`.
7. **`VStackSheavesAndLisseCategories:VS5`**. VII.7.10: compact exterior generators and the derived Hom tensor comparison with compact A_i and arbitrary B_i; retain its coefficient/enrichment conventions.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`.
8. **`SmoothRepresentationsOfLocalGroups:SR.1`** — scope extension required. Arbitrary-coefficient abelian-category Bernstein centre and its inverse limit of pro-p idempotent Hecke corners, as in confirmed finding 9; for an abelian locally pro-p group identify these with Lambda[T(E)/K]. SR.3’s complex Bernstein blocks are not the supplier.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`.
9. **`ReductiveGroupsPartII:RG2.5`** — scope extension required. Proposed foundational RG2.6 after RG2.5: z-extensions with induced-torus kernel and simply connected derived group, induced-torus resolutions, functorial pi_1 and the compatible dual maps. RG2.5 currently supplies only dual/root data. Keep the z-embedding definition in ES6; do not claim RG2.5 already proves any z-extension existence theorem.
   Proposed owner: `ReductiveGroupsPartII:RG2.6`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.
10. **`BunGAndNewtonStrata:BG1/abelianization-identification`**. The torus specialization B(T)=pi_1(T)_Gamma and all degree components, compatible with the already supplied torsor and stratum equivalences; give the maps used by torus resolutions.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`.
11. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`** — scope extension required. Consume the fixed arithmetic Artin and topological Weil abelianization interfaces in their stated field range; supply the consumer conversion rec_geom=Art_arith composed with inversion. Full equal-characteristic wild p-primary reciprocity lies beyond the upstream prime-to-p endpoint and needs a ClassFieldTheory Part II, not a re-plan of upstream layers.
   Proposed owner: `ClassFieldTheoryPartII:full-equal-characteristic-reciprocity`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`.
12. **`RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`** — scope extension required. Extend the relative period-geometry direction with II.2.1–II.2.4: height-one Lubin–Tate universal cover as H0(O(1)), the punctured E-times torsor on Div1, and its Frobenius/endpoint action. The existing RF3 node gives line-bundle signs only; it does not give this torsor.
   Proposed owner: `RelativeFarguesFontainePartII:Lubin-Tate-torsor`.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation`.
13. **`ReductiveGroupsPartII:RG2.5`** — scope extension required. For the ES6-owned p-adic z-embedding construction supply the diagonalizable centre, pushout along Z(G) to a torus, finite centre H1 and norm-kernel interfaces used by Kaletha 5.2. For arbitrary E distinguish a genuine eligible z-embedding from the separate z-extension cover and verify the rational/dual-centre descent comparison.
   Needed by: `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison`.

## Structure, verified findings and acceptance

- **Foundational admissibility before excursion parameters** (new-layer): Implement confirmed RT-AREA-geomlanglands/8 with its verified correction: SR.3b after SR.2 owns Vignéras admissibility for characteristic ell and scalar endomorphisms; ES5 owns the condensed refinement. SR.6 must not be a supplier and Qbar_ell must not be described as countable.
- **Foundational z-extensions and induced-torus resolutions** (new-layer): Implement the verified RT-AREA-geomlanglands/10 division: proposed RG2.6 owns surjective z-extensions, induced-torus resolutions and functorial pi_1; ES6 keeps injective z-embeddings with the correct Kaletha citation. BG1/BG2/ET0 and the routed arithmetic Part II are consumers to update in their own jobs.
- **Exact spectral-centre inputs for both ES6 children** (missing-links): Confirmed RT-AREA-geomlanglands/7 is realized here by explicit prerequisite references to ES1:spectral-center/spectral-to-geometric-center-map for functoriality and duality. The same finding’s ES2/ES4/ES7 stage-edge changes are outside the allowed files.
- **Full equal-characteristic local reciprocity** (part-ii): Upstream ClassFieldTheory layers 8–9 remain unchanged. Their arithmetic normalization is consumed with an inversion adapter. Full equal-characteristic wild reciprocity exceeds the documented upstream endpoint and should be a ClassFieldTheory Part II; it is not a new normalization theory.

The confirmed finding **RT-AREA-geomlanglands/7** is handled in both ES6 children by exact prerequisites on the spectral-centre map. Its ES2/ES4/ES7 changes belong to their own parts. Finding **/8** is handled by the SR.3b request, the corrected field-countability statement, and a separate condensed Schur proof. Finding **/10** is handled with the verified ownership division: foundational surjective z-extensions move to RG2.6, while injective z-embeddings and their rational-point applications remain here. Confirmed finding **/9**, encountered while following the torus dependency, puts the arbitrary-coefficient abelian Bernstein centre in SR.1.

Acceptance includes characteristic-ℓ coefficients even when a categorical spectral-action prime is forbidden; a genuinely nonsplit torus and its twisted cocycle; the infinite valuation quotient for G_m; equality of the torus centre action on every degree component; the inverse-pair and ordered-fibre excursion relations; a noncompact representation without an unjustified compactness assumption; the identity and product rational z-embedding fragments; and the full smooth-dual proof return through parabolic induction. A Steinberg parameter remains semisimple data and does not manufacture N. The node acceptance lists give the local obligations in full.

There are 13 selected planets, with at most six in any layer. The packet's four coverage records are planned and specify their remaining supplier refinements. Passing the JSON checker and elaborating the suggested file validate the planning artifact and its available prototype interfaces; they do not close the mathematical gaps listed above.
